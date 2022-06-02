using Microsoft.AspNetCore.Mvc;
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
            
            return View();
        }
        public IActionResult AddEmployee()
        {
            return View();
        }


        
    }
}
