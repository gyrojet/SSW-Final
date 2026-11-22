using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProjectDbStarter.Models;
using ProjectDbStarter.ViewModels;

namespace ProjectDbStarter.Controllers;

public class AuthController : Controller
{
    private readonly BowlingDbContext _db;

    public AuthController(BowlingDbContext db)
    {
        _db = db;
    }

    [HttpGet]
    public IActionResult Login(LoginVm vm)
    {
        return View(vm);
    }

    // Do login soon please bro
}
