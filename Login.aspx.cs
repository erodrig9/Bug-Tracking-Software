using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Database_Project
{
  public partial class Login : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
      string password = Hash(Login1.Password);
      using (DataClasses1DataContext db = new DataClasses1DataContext())
      {
        var department = from a in db.Peoples
                         where (a.UserName == Login1.UserName) && (a.PasswordHash == password)
                         select a;

        foreach( var n in department)
        {
          if (n.DepartmentID == 2)
          {
            Session["User"] = -1;
            Response.Redirect("QABugs.aspx");
          }
          else if (n.DepartmentID == 1)
          {
            Session["User"] = n.PersonID;
            Response.Redirect("DevBugs.aspx");
          }
          else if (n.DepartmentID == 3)
          {
            Session["User"] = n.PersonID;
            Response.Redirect("BugsGalore.aspx");
          }
        }

      }
    }

    // barrowed from http://www.dijksterhuis.org/creating-salted-hash-values-in-c/
    protected string Hash(string password)
    {
      HashAlgorithm hash = new SHA256Managed();
      byte[] passwordHash = hash.ComputeHash(Encoding.UTF8.GetBytes(password));
      return Convert.ToBase64String(passwordHash);
    }

  }
}
