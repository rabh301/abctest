<%-- 
    Document   : saveComPassword
    Created on : Nov 19, 2008, 12:52:52 PM
    Author     : Srishti
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
    <body>
        <p>
            <% try {
            String c2 = request.getParameter("user");
            // session.getAttribute("c1", c1);
            String c1 = request.getParameter("pass");
            String newpass = request.getParameter("newpass");

            Class.forName("com.ibm.db2.jcc.DB2Driver");
            Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");

            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            String sql1 = "Update Login set Password='" + newpass + "'where Username='" + c2 + "'and Password='" + c1 + "'";
            //String sql2 = "Update Com set CPassword='" + newpass + "'where CUsername='" + c2 + "'and CPassword='" + c1 + "'";
            //out.println(sql1);
            st.executeUpdate(sql1);
            //st.executeUpdate(sql2);
            %>
            <font color="red" size="5">
                <%out.println("You have Successfully Changed!!!");%>
            </font>
            <%   } catch (Exception e) {
            out.println(e);
        }
            %>
        </p>
        <p>&nbsp;</p>
        <p><a href="CompanyHomePage.jsp"><strong>Goto Home</strong></a> </p>
    </body>
</html>
