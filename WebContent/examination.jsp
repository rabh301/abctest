<%@ page language="java" contentType="text/html" import="java.sql.*;" session="true"%>
<html >
 
<head>
<title>User Name</title>
</head>

<body>

<%

try{

int ca,wa=0,t=0;

 if(request.getParameter("CA")==null)
 {
   ca=0;
 }
 else
  {
  ca=Integer.parseInt(request.getParameter("CA"));
  }

  if(request.getParameter("WA")==null)
    {
      wa=0;
    }
     else
       {
         wa=Integer.parseInt(request.getParameter("WA"));
       }


   if(request.getParameter("T")==null)
        {
          t=0;
        }
     else
         {
            t=Integer.parseInt(request.getParameter("T"));
         }
out.println(ca);
out.println(wa);		 
out.println(t);
     
     ResultSet rs1=null,rs2=null,rs3=null;
     Statement st1=null,st2=null,st3=null;
     Connection con = null;

     Class.forName("com.ibm.db2.jcc.DB2Driver");
     con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");

              st1=con.createStatement();
              st2=con.createStatement();
              st3=con.createStatement();

         String examID=(String)session.getAttribute("EID");
         String jobID=(String)session.getAttribute("JID");
         out.println(examID);

        String ans=request.getParameter("Choice");
          if(ans==null)
           {
              t++;
           }
        else
          {

 out.println("Select * from Question WHERE ExamID='"+examID+"' and QuestionNo='"+t+"' ");

            rs2=st2.executeQuery("Select * from Question WHERE ExamID='"+examID+"' ");
           t++;
                  while(rs2.next())
                     {
             if(rs2.getString("Answer").equals(ans))
                 {
                  ca++;
                 }
             else
                 {
                  wa++;

                 }
				       }
           }
String str="select * from Question where ExamID='"+examID+"' ";
out.print("111111"+str);
rs3 = st3.executeQuery(str);
int max=0;
while(rs3.next())
{
max++;
}
if((max+1)==t)
{

%>

<jsp:forward page="result.jsp">
<jsp:param name="ca" value="<%=ca%>"/>
<jsp:param name="wa" value="<%=wa%>"/>
<jsp:param name="t" value="<%=t%>"/>
</jsp:forward>

<%
}
String str1="Select * from Question   WHERE ExamID='"+examID+"' and QuestionNo='"+t+"' ";
out.print("222222222"+str1);
    rs1 = st1.executeQuery(str1);


%>

					
  <form action="examination.jsp" method="get" name="frm" >
    <tr>
						<th height="247" width="113"><p align="left">
						
                        <font color="#00FF00"></font>&nbsp; </p>
                        <p align="left"><font color="#FF0000"></font>&nbsp; </p>
                        <p></th>
						<th height="247" width="532">
                        <table cellSpacing="0" cellPadding="2" border="0" height="213" width="477">
<%				
					
try{

while(rs1.next())

 {
       String ch1=rs1.getString("Option1");
       String ch2=rs1.getString("Option2");
String ch3=rs1.getString("Option3");
String ch4=rs1.getString("Option4");
%>
						
<input type="hidden" name="T" value=<%=t%>>
<input type="hidden" name="CA" value=<%=ca%>>
<input type="hidden" name="WA" value=<%=wa%>>

					                          <tr>
                            <td vAlign="top" align="right" height="19" width="20"><%=rs1.getString("QuestionNo") %>)<font class="question">&nbsp;</font></td>
                            <td vAlign="top" height="19" width="449">
                            <font size="4"><%=rs1.getString("Question")%></font></td>
                          </tr>
                        
                          <tr>
                            <td vAlign="top" align="right" height="20" width="20">
                          <input type="checkbox" name="Choice" value="<%=ch1%>"></td>
                            <td vAlign="top" height="20" width="449"><%=ch1%></td>
                          </tr>
                          <tr>
                            <td vAlign="top" align="right" height="20" width="20">
                          <input type="checkbox" name="Choice" value="<%=ch2%>"></td>
                            <td vAlign="top" height="20" width="449"><%=ch2%> </td>
                          </tr>
                          <tr>
                            <td vAlign="top" align="right" height="38" width="20">
                          <input type="checkbox" name="Choice" value="<%=ch3%>"></td>
                            <td vAlign="top" height="38" width="449">
                            <span style="font-size: 10.0pt">&nbsp;</span><%=ch3%>  </td>
                          </tr>
                          <tr>
                            <td vAlign="top" align="right" height="38" width="20">
                          <input type="checkbox" name="Choice" value="<%= ch4%>"></td>
                            <td vAlign="top" height="38" width="449"><%= ch4%> </td>
                          </tr>
                          
                        </table>
                        </th>
						<td height="283" width="34" rowspan="2">&nbsp;</td>
                       
					</tr>
					
<%

  }
}
catch(Exception e)
{
out.println("Hai"+e);
}


%>
					<tr>
						<th height="32" width="113">&nbsp;</th>
						<th height="32" width="532" align="left">
					</tr>
				
					<tr>
						<th height="19" width="113">&nbsp;</th>
						<th height="19" width="532" align="left">

                        <p align="center">
                         
<input type="submit" value="Next Question" name="next"  id="btnGo"  style="color: #0000FF; font-size: 12pt; font-weight: bold">
        </th>
						<td height="88" width="34" rowspan="4">
                        <p>&nbsp;
                          </p>
                        <p></td>
					</tr>
                    <tr>
						<th height="19" width="113">&nbsp;</th>
						<th height="19" width="532" align="left">
                        <p align="center"></th>
					</tr>
                    <tr>
						<th height="19" width="113">&nbsp;</th>
						<th height="19" width="532" align="left">&nbsp;
                        </th>
					</tr>
				
					<tr>
						<th height="19" width="113">&nbsp;</th>
						<th height="19" width="532">&nbsp;</th>
                        
	

<%


}
catch(Exception ex)
{
out.println("Exception RN06 B4"+ex);
}
%>				</tr>
</form>
				</table>
</body>
</html>