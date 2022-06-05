using Dapper;
using DataAccess.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Model.DTO;
using Model.Entity;
using Model.View;
using Service.IRepositroy;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Implimantation
{
    public class EmployeeOperations : IEmployeeOperations
    {
        private readonly EmployeeContext _context;
        private readonly IConfiguration _config;

        public EmployeeOperations(EmployeeContext context, IConfiguration config)
        {
            _context = context;
            _config = config;

        }
        public async Task<bool> EmployeeAsync(EmployeeDTO employeeDTO)
        {
            int results = 0;
            try
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@Id ", employeeDTO.Id);
                queryParameters.Add("@FirstName", employeeDTO.FirstName);
                queryParameters.Add("@LastName", employeeDTO.LastName);
                queryParameters.Add("@DOB", employeeDTO.DOB);
                queryParameters.Add("@Email", employeeDTO.Email);
                queryParameters.Add("@EmploymentDate", employeeDTO.EmploymentDate);
                queryParameters.Add("@Address", employeeDTO.Address);
                queryParameters.Add("@City ", employeeDTO.City);
                queryParameters.Add("@State ", employeeDTO.State);
                queryParameters.Add("@Country", employeeDTO.Country);
                queryParameters.Add("@Skills", employeeDTO.SkillsIds);
                queryParameters.Add("@Basic", employeeDTO.Basic);
                queryParameters.Add("@TA", employeeDTO.TA);
                queryParameters.Add("@DA", employeeDTO.DA);
                queryParameters.Add("@Bonus", employeeDTO.Bonus);
                queryParameters.Add("@Flag", employeeDTO.Flag);
                using (var connection = new SqlConnection(_config.GetConnectionString("DefaultConnetion")))
                {
                    await connection.OpenAsync();
                    results = await connection.ExecuteAsync(sql: "Proc_Employee", param: queryParameters, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return results > 0 ? true : false;
        }

        public async Task<IReadOnlyList<dynamic>> GetEmployeeAsync()
        {
            var employees = await _context.Employees
                .ToListAsync();
            return employees;


        }
        public async Task<EmployeeDetail> GetEmployeeDetailsAsync(int id)
        {
            EmployeeDetail employeeDetail = new()
            {
                Employee = await _context.Employees.Where(x => x.Id == id).FirstOrDefaultAsync(),
                Skills = (ICollection<Model.Entity.Skill>)await _context.EmployeeSkills
                .Include(a => a.Skill)
                .Where(x => x.EmployeeId == id).Select(p => new Skill()
                {
                    Id = p.Skill.Id,
                    Name = p.Skill.Name,
                }).ToListAsync(),
                Payroll = await _context.Payrolls.Where(x => x.EmployeeId == id).FirstOrDefaultAsync()
            };

            return employeeDetail;
        }

        public async Task<IReadOnlyList<Skill>> GetSkillsAsync()
        {
            return await _context.Skills.ToListAsync();
        }

    }
}

