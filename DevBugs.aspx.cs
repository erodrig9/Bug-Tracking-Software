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
  public partial class DevBugs : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      int bugOwner = 0;

      btnRespond.Visible = true;

      int key = (int)GridView1.SelectedDataKey.Value;

      lblRow.Text = "";

      using (DataClasses1DataContext db = new DataClasses1DataContext())
      {
        int count = 0;
        var selectedBug = from n in db.Bugs
                          where n.BugID == key
                          select n;

        var selectedHistories = from n in db.BugHistories
                                orderby n.DateStamp
                                where n.BugID == key
                                select n;

        foreach (var n in selectedBug)
        {
          int id = n.ReporterID;
          var reporter = from a in db.Peoples
                         where a.PersonID == id
                         select a.FullName;

          lblRow.Text += "Product: " + n.ProductName + "<br/>Description: " + n.Description +
                          "<br/>Reporter: " + reporter.ToList()[0] + "<br/>";
        }

        foreach (var n in selectedHistories)
        {
          string name = "";

          if (n.OwnerID == -1)
            name = "QA";
          else
          {
            var owner = from a in db.Peoples
                        where a.PersonID == n.OwnerID
                        select a.FullName;

            name = owner.ToList()[0];
          }

          if (count == 0)
          {
            lblRow.Text += "Date: " + n.DateStamp + "<br/>Status: " + n.Status + "<br/><br/>";
          }
          else
          {
            lblRow.Text += "Date: " + n.DateStamp + "<br/>Status: " + n.Status + "<br/>Response: " + n.Response +
                           "<br/>Owner: " + name + "<br/><br/>";
          }
          count++;
          bugOwner = n.OwnerID;
        }
      }

      Session["Modify"] = key;
    }

    protected void btnRespond_Click(object sender, EventArgs e)
    {
      Response.Redirect("DevModify.aspx");
    }
  }
}
