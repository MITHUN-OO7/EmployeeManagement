using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DTO
{
    public class EmployeeDTO
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DOB { get; set; }
        public string Email { get; set; }
        public DateTime EmploymentDate { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string SkillsIds { get; set; }
        public decimal Basic { get; set; }
        public decimal TA { get; set; }
        public decimal DA { get; set; }
        public decimal Bonus { get; set; }



        public int Flag { get; set; }

    }
}
