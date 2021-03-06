﻿B<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBug.aspx.cs" Inherits="Database_Project.New" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head" runat="server">
  <title>New Bug</title>
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

    <br />
      <asp:Label ID="lblProduct" runat="server" Text="Product: " Font-Size="16px"></asp:Label>
      &nbsp&nbsp
      <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="LinqDataSource1" 
            DataTextField="ProductName" DataValueField="ProductName">
      </asp:DropDownList>
          <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="Database_Project.DataClasses1DataContext" 
            OrderBy="ProductName" Select="new (ProductName)" TableName="Products">
          </asp:LinqDataSource>
      <br /> <br />
      
      <asp:Label ID="lblDescription" runat="server" Text="Bug Description: " Font-Size="16px"></asp:Label>
      <br />
      <asp:TextBox ID="txtDescription" runat="server" Height="55px" Width="50%" 
            TextMode="MultiLine" MaxLength="100"></asp:TextBox>
      <br /> <br />
      
      <asp:Button ID="btnAddBug" runat="server" Text="Submit" onclick="btnAddBug_Click" />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    </div>
    </div><!-- end of inside -->


    <div id="footer"> 
      <h5 id="%">Public Domain / No Copyright  "%">Public Domain / No Copyright  "%">Public Domain / No Copyright  <h5>Public Domain / No Copyright<br />
    Designed by <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">Chapter 13 Bankruptcy</a></h5>
        
    </form>
</body>
</html>
