using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class Payroll
    {
        public int Id { get; set; }
        public Employee Employee   { get; set; }
        public int EmployeeId { get; set; }
        public decimal Basic { get; set; }
        public decimal TA { get; set; }
        public decimal DA { get; set; }
        public decimal Bonus { get; set; }
    }
}
