<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DevBugs.aspx.cs" Inherits="Database_Project.DevBugs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head" runat="server">
  <title>Bugs</title>
  <link href="color.css" rel="stylesheet" type="text/css" />
  <link href="layout.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    <form id="form1" runat="server">
    <div id="perm-links">
    <ul>
    <li><a href="index.htm">Home</a></li>
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

      <asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="BugID,BugHistoryID" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="100%"
        onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="20">
      <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
      <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="BugID" HeaderText="BugID" InsertVisible="False" 
          ReadOnly="True" SortExpression="BugID" Visible = "false"/>
        <asp:BoundField DataField="BugHistoryID" HeaderText="BugHistoryID" 
          InsertVisible="False" ReadOnly="True" SortExpression="BugHistoryID" Visible = "false"/>
        <asp:BoundField DataField="OwnerID" HeaderText="OwnerID" 
          SortExpression="OwnerID" Visible = "false"/>
        <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
          SortExpression="ProductName" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
          SortExpression="Description" />
        <asp:BoundField DataField="Status" HeaderText="Status" 
          SortExpression="Status" />
        <asp:BoundField DataField="Severity" HeaderText="Severity" 
          SortExpression="Severity" />
        <asp:BoundField DataField="Response" HeaderText="Response" 
          SortExpression="Response" />
        <asp:BoundField DataField="DateStamp" HeaderText="DateStamp" 
          SortExpression="DateStamp" />
      </Columns>
      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
      <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
      <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
      <EditRowStyle BackColor="#999999" />
      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
      </asp:GridView>
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Bug_TrackerConnectionString %>" 
        SelectCommand="DevGrid" SelectCommandType="StoredProcedure">
        <SelectParameters>
          <asp:SessionParameter DefaultValue="1" Name="p" SessionField="User" 
            Type="Int32" />
        </SelectParameters>
      </asp:SqlDataSource>
      
      <br />
      <asp:Label ID="lblRow" runat="server" Text=""></asp:Label>
      <br />
      <asp:Button ID="btnRespond" runat="server" Text="Respond" 
            onclick="btnRespond_Click" Visible = "false"/>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br />
    </div>
    </div><!-- end of inside -->


    <div id="footer"> 
      <h5>Public Domain / No Copyright<br />
    Designed by <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">Chapter 13 Bankruptcy</a></h5>
        
    </form>
</body>
</html>