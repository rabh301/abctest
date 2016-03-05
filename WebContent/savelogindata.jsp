<%-- 
    Document   : savelogindata
    Created on : Nov 11, 2008, 2:08:03 PM
    Author     : user
--%>
<%@page import="java.io.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% try
       {   String s1=request.getParameter("username");
           String s2=request.getParameter("password");
           

           session.setAttribute("s1", s1);
           session.setAttribute("s2", s2);
           Class.forName("com.ibm.db2.jcc.DB2Driver");
           Connection conn = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
           Statement st=conn.createStatement();  
           Statement st2=conn.createStatement();
           String stat="";
           ResultSet rs;
           rs=st.executeQuery("select * from login where Username='"+s1+"' and Password='"+s2 +"'");
           %>
          <!-- <input type= "hidden" name="id" value ="<%=s1%>">
           <input type= "hidden" name="pass" value ="<%=s2%>">-->
           <%
           while(rs.next())
               {
               stat=rs.getString("Status");
               } //while
           if(stat.equals("s"))
               {
                  response.sendRedirect("CandidateHomePage.jsp");
               }
           else if(stat.equals("c"))
               {    
                  response.sendRedirect("CompanyHomePage.jsp"); 
               }
           else if(stat.equals("a"))
               {
                  response.sendRedirect("AdminHomePage.jsp"); 
               }
           else   
               {
                  response.sendRedirect("Login.jsp");
                  
               }
        }//try
           catch(Exception e)
                   {
                      out.println("exception has occured"+e);
                   }
  %> 
     <!-- <input type="hidden" name = "hid" value="<%request.getParameter("username");%>" -->
    </body>
</html>
