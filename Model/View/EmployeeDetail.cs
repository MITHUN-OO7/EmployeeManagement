using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.View
{
    public class EmployeeDetail
    {
        public Employee Employee { get; set; }
        public Payroll Payroll { get; set; }
        public ICollection<Model.Entity.Skill> Skills { get; set; }

    }
}
