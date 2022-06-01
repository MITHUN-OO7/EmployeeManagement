using Dapper;
using DataAccess.Data;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Model.DTO;
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

        private readonly IConfiguration _config;

        public EmployeeOperations(EmployeeContext context, IConfiguration config)
        {
            _config = config; ;
        }
        public async Task<bool> EmployeeAsync(EmployeeDTO employeeDTO)
        {
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
                queryParameters.Add("@Flag", employeeDTO.Flag);
                using (var connection = new SqlConnection(_config.GetConnectionString("DefaultConnetion")))
                {
                    await connection.OpenAsync();
                    var results = await connection.ExecuteAsync(sql: "Proc_Employee", param: queryParameters, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return true;
        }
    }
}

