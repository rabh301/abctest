<%-- 
    Document   : EditComProfile
    Created on : Nov 15, 2008, 1:16:18 PM
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
        <style type="text/css">
            <!--
            .style1 {
                color: #CC6633;
                font-weight: bold;
                font-size: 18px;
            }
.style2 {color: #FFFFFF}
            -->
        </style>
       
    <body style="margin:0px" bgcolor="#FFFFFF">
    <table width="100%" border="1" bgcolor="#FFFFFF">
            <tr>
                <td height="107" colspan="2"><jsp:include page="CompanyHeader.jsp"/></td>
            </tr>
            <tr>
                <td width="1" height="512"><jsp:include page="Companymenu.html"/></td>
                <td width="961" bgcolor="#E7E8EB" valign="top">
                    <span class="style2">
                    <%
        //out.println(c1);
        try {

            //
            String a = null;
            String b = null;
            String c = null;
            String d = null;
            String e = null;
            String f = null;
            String g = null;
            String c1 = (String) session.getAttribute("s1");
            //String c2 = (String) session.getAttribute("s2");
            Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
            Statement st = con.createStatement();

            out.println(c1);

            ResultSet rs = st.executeQuery("select CName,CAddress,CPost,CCriteria,CEmail,CContact,CCutoff from Com");

            while (rs.next()) {
                a = rs.getString("CName");
                b = rs.getString("CAddress");
                c = rs.getString("CPost");
                d = rs.getString("CCriteria");
                e = rs.getString("CEmail");
                f = rs.getString("CContact");
                g = rs.getString("CCutoff");

                    %>
                    </span>
<div class="Reg" align="center">
                        <form method="POST" action="savecompanyedit.jsp" name="form1">
                            <table width =66% border=0 cellpadding=3 cellspacing=0 bordercolor="#FFFFFF" >
                                <tr bgcolor="" width=100%>
                                    <td colspan="2" bgcolor="#F5E7DC">
                                    <div align="center" class="style5 style1">Edit Company Profile </div>                </td>
                                </tr>
                                <tr bgcolor="" width=100%>
                                    <td width="46%" bgcolor="#FFFFFF">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial >Name</font></div></td>
                                    <td width="54%" bgcolor="#FFFFFF">
                                        <div align="left">
                                            <input TYPE="text" NAME="comname" id="comname" size=30 maxlength=30 value="<%=a%>">
                                    </div>	</td>
                                </tr>
                                <tr bgcolor =#FEF7E9>
                                    <td bgcolor="#D9DEE6">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial>Address</font></div></td>
                                    <td bgcolor="#D9DEE6">
                                        <div align="left">
                                            <input NAME="comaddress" TYPE="text" id="comaddress" size=30 maxlength=50 value="<%=b%>">
                                    </div>	 </td>
                                </tr>
                                <tr bgcolor =#FEF7E9>
                                    <td bgcolor="#F5E7DC">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial>Post</font></div></td>
                                    <td bgcolor="#F5E7DC">
                                        <div align="left">
                                            <input NAME="compost" TYPE="text" id="compost" size=30  maxlength=50 value="<%=c%>">
                                    </div>	 </td>
                                </tr>
                                <tr bgcolor =#FEF7E9>
                                    <td bgcolor="#D9DEE6">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial>Criteria</font></div></td>
                                    <td bgcolor="#D9DEE6">
                                        <div align="left">
                                            <input NAME="comcriteria" TYPE="text" id="comcriteria" size=30  maxlength=50 value="<%=d%>">
                                    </div>	</td>
                                </tr>
                                <tr  bgcolor =#FEF7E9>
                                    <td bgcolor="#F5E7DC">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial>Email_id</font></div></td>
                                    <td bgcolor="#F5E7DC">
                                        <div align="left">
                                            <input TYPE="text" NAME="comemail" id="comemail" size=30 maxlength=30 value="<%=e%>">
                                    </div>	   </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial>Contact No:</font></div></td>
                                    <td bgcolor="#FFFFFF">
                                        <div align="left">
                                            <input TYPE="text" NAME="comcontact" id="comcontact"size=20 maxlength=30 value="<%=f%>">
                                    &nbsp;                 <font SIZE="2" COLOR="#CC0000" face =arial>(STD-No.)</font>		   </div>	   </td>
                                </tr>
                                <tr  bgcolor =#FEF7E9>
                                    <td bgcolor="#D9DEE6">
                                    <div align="center"><font SIZE="2" COLOR="black" face =arial>CutOff %</font></div></td>
                                    <td bgcolor="#D9DEE6">
                                        <div align="left">
                                            <input TYPE="text" NAME="comcutoff" id="comcutoff" size=30 maxlength=30 value="<%=g%>">
                                      </div>	   </td>
                                </tr>
                                <tr>
                                    <td height="49" colspan=2 bgcolor="#F5E7DC" >
                                        <div align="center"><br>
                                            <input type="reset" />
                                            &nbsp;&nbsp;<input TYPE="submit" value="Edit">
                                    </div>	    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <% }//while

        } catch (Exception e) {
            out.println(e.toString());
        }
                    %>
                </td>
          </tr>
        </table>
    </body>
</html>

