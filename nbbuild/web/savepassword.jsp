<%-- 
    Document   : savepassword
    Created on : Nov 14, 2008, 12:36:22 PM
    Author     : user
--%>
<%@page import="java.io.*,java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#FFCCCC">
        <p>
          <% try
          {
               String c2 = request.getParameter("user");
               // session.getAttribute("c1", c1);
                String c1 =request.getParameter("pass");
                Class.forName("com.ibm.db2.jcc.DB2Driver");
                Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
            Statement st=con.createStatement();
              st.executeUpdate("Update Login set Password='"+request.getParameter("newpass2")+"' where Username='"+c2+"' and Password='"+c1+"'");
              %>
           <br>
          <br>
          <font color="red" size="4">You have successfully changed your Password</font>
          
             <%   }
        catch(Exception e)
                {
            out.println(e);
                }
        %>
        </p>
        <p>&nbsp;</p>
        <p><a href="AdminHomePage.jsp"><strong>Goto Home</strong></a></p>
    </body>
</html>
