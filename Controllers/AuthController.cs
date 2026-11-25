using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc.ActionConstraints;
using ProjectDbStarter.Models;
using ProjectDbStarter.ViewModels;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication;

namespace ProjectDbStarter.Controllers;

public class AuthController : Controller
{
    private readonly BowlingDbContext _db;

    public AuthController(BowlingDbContext db)
    {
        _db = db;
    }

    // Display login page
    [HttpGet]
    public IActionResult Login()
    {
        // Return empty login viewmodel
        return View(new LoginVm());
    }

    // submit user data: query db and grab data, then check hashed passwords
    [HttpPost]
    public async Task<IActionResult> Login(LoginVm vm)
    {
        // If there any errors, display them
        if (!ModelState.IsValid) return View(vm);

        // Attempt to grab user info from the db
        var userToGet = await (
            from user in _db.Users
            where user.UserName == vm.UserName
            select user
        ).FirstOrDefaultAsync();

        // Did we grab any user info?
        if (userToGet is null)
        {
            // Add error and return
            ModelState.AddModelError("WrongUsername", "User not found: Invalid Username.");

            vm.UserName = string.Empty;
            return View(vm);
        }

        // Create a new password hasher
        PasswordHasher<BowlingUser> passwordHasher = new();

        // compare password to hashed password
        var result = passwordHasher.VerifyHashedPassword(userToGet,
                                                         userToGet.PasswordHash,
                                                         vm.Password);

        // If the hash does not match the password:
        if (result == PasswordVerificationResult.Failed)
        {
            // add error, return view
            ModelState.AddModelError("WrongPassword", "User not found: Invalid Password.");

            vm.Password = string.Empty;
            return View(vm);
        }

        // Username and password are correct: create a new login claim for username
        List<Claim> claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, userToGet.UserName)
        };

        // Get admin claim value; is user an admin?
        string isAdmin = userToGet.IsAdmin ? "true" : "false";

        // create new admin claim; we will use this when determining whether or not
        // a user can access certain features
        claims.Add(
            new Claim("IsAdmin", isAdmin)
        );

        // create user identity
        ClaimsIdentity userIdentity = new(claims, "app-cookie");

        // create claims pricipal
        ClaimsPrincipal principal = new(userIdentity);

        // log user in!!! (uses async)
        await HttpContext.SignInAsync("app-cookie", principal);

        // after signing user in, return to main page
        return RedirectToAction("Index", "Home");
    }

    // User must be logged in in order to log out!
    [Authorize]
    public async Task<IActionResult> Logout()
    {
        // log user out!
        await HttpContext.SignOutAsync("app-cookie");
        return RedirectToAction("Index", "Home");
    }
}
