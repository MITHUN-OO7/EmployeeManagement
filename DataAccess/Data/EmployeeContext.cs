using Microsoft.EntityFrameworkCore;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Data
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<EmployeeSkills> EmployeeSkills { get; set; }
        public DbSet<Skill> Skills { get; set; }
        public DbSet<Payroll> Payrolls { get; set; }

    }
}

