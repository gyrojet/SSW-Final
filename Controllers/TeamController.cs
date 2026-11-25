using ProjectDbStarter.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace ProjectDbStarter.Controllers
{
    public class TeamController : Controller
    {
        private readonly BowlingDbContext _db;



        public TeamController(BowlingDbContext db)
        {
            _db = db;
        }
        [Authorize(Policy = "AdminOnly")]
        public IActionResult Index()
        {
            // Order for predictable display
            var teams = _db.Teams.ToList();

            return View(teams);

        }
    }
}
