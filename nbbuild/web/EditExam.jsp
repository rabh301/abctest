<%-- 
    Document   : ExamView
    Created on : Nov 18, 2008, 2:27:28 PM
    Author     : Srishti
--%>
<%@page import="java.io.*,java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%

        String jid = request.getParameter("jid");
        String eid = request.getParameter("eid");
        String msg = "";
        if (request.getParameter("update") != null) {
            String examid = request.getParameter("examid");
            String jobid = request.getParameter("jobid");
            String postname = request.getParameter("postname");
            String examname = request.getParameter("exname");
            String cutoff = request.getParameter("cutoff");
            String sql = "Update Exam Set Post='" + postname + "', ExamName='" + examname + "', Cutoff='" +
                    cutoff + "' where JobID='" + jobid + "' and ExamID='" + examid + "'";
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
            Statement st = con.createStatement();
            int x = st.executeUpdate(sql);

            if (x > 0) {
                msg = "success";
                response.sendRedirect("ExamView.jsp?jobid=" + jobid);

            } else {
                msg = "Updation failed";
            }
        }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="margin:0px" bgcolor="#FFFFFF">
        <table width="100%" border="1" bgcolor="#FFFFFF" >
            <tr>
                <td height="23" colspan="2"><jsp:include page="CompanyHeader.jsp"/></td>
            </tr>
            <tr>
                <td width="1" height="537"><jsp:include page="Companymenu.html"/></td>
                <td width="961" bgcolor="#EDE0E2" valign="top">
                    <%


        Class.forName("com.ibm.db2.jcc.DB2Driver");
        Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
        Statement st = con.createStatement();
        Statement st3 = con.createStatement();
        ResultSet rs = st.executeQuery("select * from Exam where JobID='" + jid + "' and ExamID='" + eid + "'");
        String post = "", exname = "", cutoff = "";
        if (rs.next()) {
            post = rs.getString("Post");
            exname = rs.getString("ExamName");
            cutoff = rs.getString("Cutoff");
        }
                    %>
                    <form name="frm" action="EditExam.jsp" method="post">
                        <table width="449" border="1" align="center">
                            <tr>
                                <td colspan="2"><div align="center"><strong>Edit Exam Details</strong></div></td>
                            </tr>
                            <tr>
                                <td>Post</td>
                                <td><input type="text" name="postname" id="postname" value="<%=post%>"></td>
                            </tr>
                            <tr>
                                <td>Exam Name</td>
                                <td><input type="text" name="exname" id="exname" value="<%=exname%>"></td>
                            </tr>
                            <tr>
                                <td>Cutoff</td>
                                <td><input type="text" name="cutoff" id="cutoff" value="<%=cutoff%>"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input name="jobid" type="hidden" id="jobid" value="<%=jid%>">
                                    <input name="examid" type="hidden" id="examid" value="<%=eid%>">
                                <input type="submit" name="update" id="update" value="Update"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><%=msg%></td>
                            </tr>
                        </table>
                    </form>
                <p>&nbsp;</p></td>
            </tr>
        </table>
    </body>
</html> 