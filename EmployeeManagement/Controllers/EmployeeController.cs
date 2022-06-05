using Microsoft.AspNetCore.Mvc;
using Model.DTO;
using Service.IRepositroy;
using System.Threading.Tasks;

namespace EmployeeManagement.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly IEmployeeOperations _repo;

        public EmployeeController(IEmployeeOperations repo)
        {
            _repo = repo;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> GetEmployee()
        {
            var employee = await _repo.GetEmployeeAsync();

            return Json(employee);
        }
        [HttpPost]
        public async Task<IActionResult> GetEmpDetail(int id)
        {
            var employee = await _repo.GetEmployeeDetailsAsync(id);

            return Json(employee);
        }
        public IActionResult AddEmployee()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetSkills()
        {
            var skills = await _repo.GetSkillsAsync();
            return Json(skills);
        }
        [HttpPost]
        public async Task<IActionResult> AddEmployeeDetail(EmployeeDTO employeeDTO)
        {
            var isSaved = await _repo.EmployeeAsync(employeeDTO);
            return Json(isSaved);
        }
    }
}
