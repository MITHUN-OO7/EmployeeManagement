using Model.DTO;
using Model.Entity;
using Model.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.IRepositroy
{
    public interface IEmployeeOperations
    {
        Task<bool> EmployeeAsync(EmployeeDTO employeeDTO);
        Task<IReadOnlyList<Employee>> GetEmployeeAsync();

    }
}
