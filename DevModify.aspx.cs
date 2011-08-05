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
  public partial class DevModify : System.Web.UI.Page
  {
    int Records = 0;
    int Owner = 0;
    String Status = "";
    String Severity = "";

    protected void Page_Load(object sender, EventArgs e)
    {
      int usr = (int)Session["User"];
      int bugID = (int)Session["Modify"];

      lblRow.Text = "";

      using (DataClasses1DataContext db = new DataClasses1DataContext())
      {
        int count = 0;
        var selectedBug = from n in db.Bugs
                          where n.BugID == bugID
                          select n;

        var selectedHistories = from n in db.BugHistories
                                orderby n.DateStamp
                                where n.BugID == bugID
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
          Status = n.Status;
          Severity = n.Severity;
          Owner = n.OwnerID;
          count++;
        }
        Records++;
      }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
      string severity = ddlSeverity.SelectedValue;
      string owner = DropDownList1.SelectedValue;

      if (severity.Equals(""))
        severity = Severity;

      if (severity != null)
        severity = severity.Trim();

      if (txtResponse.Text.Equals(""))
      {
        lblError.Text = "The response field is required";
        return;
      }

      // Insert record into bugHistory
      BugHistory newRecord = new BugHistory();
      newRecord.BugID = (int)Session["Modify"];
      newRecord.Status = Status;
      newRecord.Severity = severity;
      newRecord.Response = txtResponse.Text;
      newRecord.DateStamp = DateTime.Now;

      if (owner == null || owner.Equals("") || owner.Equals("11"))
        newRecord.OwnerID = -1;
      else
        newRecord.OwnerID = int.Parse(owner);

      using (DataClasses1DataContext db = new DataClasses1DataContext())
      {
        db.BugHistories.InsertOnSubmit(newRecord);
        db.SubmitChanges();
      }
      Response.Redirect("DevBugs.aspx");
    }
  }
}
