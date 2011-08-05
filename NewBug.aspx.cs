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

namespace Database_Project
{
  public partial class New : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnAddBug_Click(object sender, EventArgs e)
    {
      int User = (int)Session["User"];

      if (txtDescription.Text == "" || ddlProducts.SelectedValue == "")
      {
        Response.Write(@"<script language='javascript'>alert('Both Fields are required');</script>"); 
      }
      else
      {
        // add bug to db
        using (DataClasses1DataContext db = new DataClasses1DataContext())
        {
          Bug newBug = new Bug();
          newBug.Description = txtDescription.Text;
          newBug.ProductName = ddlProducts.SelectedValue;
          newBug.ReporterID = User;

          db.Bugs.InsertOnSubmit(newBug);
          db.SubmitChanges();

          var id = (from a in db.Bugs
                    select a.BugID).Max();

          BugHistory newHistory = new BugHistory();
          newHistory.BugID = id;
          newHistory.OwnerID = -1;
          newHistory.Status = "Open";
          newHistory.DateStamp = DateTime.Now;

          db.BugHistories.InsertOnSubmit(newHistory);
          db.SubmitChanges();
        }
        Response.Redirect("BugsGalore.aspx");
      }
    }
  }
}
