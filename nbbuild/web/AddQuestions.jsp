<%-- 
    Document   : AddQuestions
    Created on : Nov 18, 2008, 3:39:18 PM
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
        <style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	color: #666633;
}
.style4 {color: #421456; font-weight: bold; }
-->
        </style>
</head>
 <body style="margin:0px" bgcolor="#FFFFFF">
        <table width="100%" border="1" bgcolor="#FFFFFF">
          <tr>
            <td height="107" colspan="2"><jsp:include page="CompanyHeader.jsp"/></td>
          </tr>
          <tr>
            <td width="1" height="512"><jsp:include page="Companymenu.html"/></td>
            <td width="961" bgcolor="#F8EFDE">
			<form method="post" action="savequestions.jsp">
              <table width="398" height="383" border="1" align="center" bordercolor="#663333">
      <tr>
        <td colspan="2" bordercolor="#996633" bgcolor="#EBD8D8"><div align="center" class="style1">Add Questions </div></td>
      </tr>
<%
    try
              {
    	Class.forName("com.ibm.db2.jcc.DB2Driver");
        Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
                Statement st = con.createStatement();
                Statement st1 = con.createStatement();
                %>
      <tr>
        <td height="37" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Job ID </span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8"><label>
          <select name="jobid" id="jobid">
		<%      ResultSet rs1 = st1.executeQuery("select * from JobDetails");
                String s=null;
               // String s2=null;
                while (rs1.next())
                    {  
                    s=rs1.getString("jobid");
                //    s2=rs.getString("Post");
              
              %>
            <option value="<%=s%>"><%=s%></option>
            <%} %>  
          </select>
        </label></td>
      </tr>
      <tr>
        <td width="127" height="37" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Exam ID</span></td>
        <td width="255" bordercolor="#996633" bgcolor="#EBD8D8">
          <label>
          <select name="examid">
            <%      ResultSet rs = st.executeQuery("select * from Exam");
                String s1=null;
               // String s2=null;
                while (rs.next())
                    {  
                    s1=rs.getString("examid");
                //    s2=rs.getString("Post");
              
              %>
            <option value="<%=s1%>"><%=s1%></option>
            <%} %>
          </select>
          </label>         </td>
      </tr>
      <tr>
        <td height="40" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Question No:</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8">
            <input name="Qno" type="text" size="10">       </td>
      </tr>
      <tr>
        <td height="47" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Question</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8">
          <label>
            <textarea name="question" cols="28"></textarea>
          </label>               </td>
      </tr>
      <tr>
        <td height="37" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Option1</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8">
          <label></label>
          <input name="option1" type="text" size="30"></td>
      </tr>
      <tr>
        <td height="37" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Option2</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8"><input name="option2" type="text" size="30"></td>
      </tr>
      <tr>
        <td height="38" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Option3</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8"><input name="option3" type="text" size="30"></td>
      </tr>
      <tr>
        <td height="35" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Option4</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8"><input name="option4" type="text" size="30"></td>
      </tr>
      <tr>
        <td height="36" bordercolor="#996633" bgcolor="#EBD8D8"><span class="style4">Answer</span></td>
        <td bordercolor="#996633" bgcolor="#EBD8D8"><input name="answer" type="text" size="30"></td>
      </tr>
      <tr>
        <td colspan="2" bordercolor="#996633" bgcolor="#EBD8D8"><div align="center">
          <input type="submit" name="Submit" value="Add Question">
        </div></td>
      </tr>
    </table>
            </form> 
    <%
         }
              catch(Exception e)
                      {
                  out.println(e);
                      }
   
    %></td>
          </tr>
        </table>
        
    </body>
</html>




