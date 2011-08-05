<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QAModify.aspx.cs" Inherits="Database_Project.Modify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Modify Bug</title>
    <link href="color.css" rel="stylesheet" type="text/css" />
    <link href="layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="perm-links">
    <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="Login.aspx">Logout</a></li>
    </ul>
    </div>

    <h1 id="top">Bug Tracker Deluxe</h1>

    <div id="inside">
    <div id="main-menu">
    <h3>Site Index</h3>
    <ul>
    <li><a href="#">Our Products</a></li>
    <li><a href="#">Our Services</a></li>
    <li><a href="#">Company Update</a></li>
    <li><a href="#">International</a></li>
    <li><a href="#">Careers</a></li>
    </ul>
    </div>
      

    <div id="content">
    <h5 class="info-title">Setting the standards in design</h5>
        <br />
        <asp:Label ID="lblRow" runat="server" Text="" ></asp:Label>
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red" ></asp:Label>
        <br />
        <asp:Label ID="lblOwner" runat="server" Text="Assign Bug"></asp:Label>
        <asp:Label ID="lblSeverity" runat="server" Text="Bug Severity" 
          style="left: 142px; position: relative;"></asp:Label>
        <asp:Label ID="lblStatus" runat="server" Text="Status" style="left: 204px; position: relative;"></asp:Label>
        <br />       
      <asp:DropDownList ID="ddlOwner" runat="server" DataSourceID="LinqDataSource1" 
            DataTextField="FullName" DataValueField="PersonID">
        <asp:ListItem></asp:ListItem>
      </asp:DropDownList>
          <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="Database_Project.DataClasses1DataContext" OrderBy="FullName" 
            Select="new (FullName, PersonID)" TableName="Peoples" 
            
            Where="DepartmentID == @DepartmentID">
            <WhereParameters>
              <asp:Parameter DefaultValue="1" Name="DepartmentID" Type="Int32" />
            </WhereParameters>
          </asp:LinqDataSource>
      <asp:DropDownList ID="ddlSeverity" runat="server" width="76px" style="left:50px; position:relative;">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>High</asp:ListItem>
        <asp:ListItem>Low</asp:ListItem>
      </asp:DropDownList>
      <asp:DropDownList ID="ddlStatus" runat="server" style="left:110px; position:relative;">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Open</asp:ListItem>
        <asp:ListItem>Closed</asp:ListItem>
      </asp:DropDownList>
      <br /><br />
      <asp:Label ID="lblResponse" runat="server" Text="Response"></asp:Label>
      <br />
      <asp:TextBox ID="txtResponse" runat="server" Width="60%" MaxLength="100"></asp:TextBox>
      <br /><br />
      <asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click" />
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    </div>
    </div><!-- end of inside -->


    <div id="footer"> 
      <h5>Public Domain / No Copyright<br />
    Designed by <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">Chapter 13 Bankruptcy</a></h5>
    </div>
    </form>
</body>
</html>
