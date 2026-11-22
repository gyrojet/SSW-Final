using System.ComponentModel.DataAnnotations;
namespace ProjectDbStarter.ViewModels;

// Viewmodel to hold username and password
public class LoginVm
{
    [Required] public string UserName { get; set; } = "";
    [Required] public string Password { get; set; } = "";
}