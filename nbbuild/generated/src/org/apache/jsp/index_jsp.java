package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<title>Online Exam</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".body {\r\n");
      out.write("        margin:0%;\r\n");
      out.write("}\r\n");
      out.write("a:link {\r\n");
      out.write("\tcolor: #000066;\r\n");
      out.write("\ttext-decoration: underline;\r\n");
      out.write("}\r\n");
      out.write("a:visited {\r\n");
      out.write("\ttext-decoration: underline;\r\n");
      out.write("\tcolor: #C0DCC0;\r\n");
      out.write("}\r\n");
      out.write("a:hover {\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tcolor: #996666;\r\n");
      out.write("}\r\n");
      out.write("a:active {\r\n");
      out.write("\ttext-decoration: underline;\r\n");
      out.write("\tcolor: #FF9999;\r\n");
      out.write("}\r\n");
      out.write(".style4 {\r\n");
      out.write("\tcolor: #DDCCDD;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("}\r\n");
      out.write(".style7 {color: #EFDAEB}\r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("<body style=\"margin:0px\" bgcolor=\"#4E2B21\">\r\n");
      out.write("<table width=\"100%\" height=\"707\" border=\"1\" valign=\"top\" >\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"78\" colspan=\"3\" bgcolor=\"#04B4AE\">");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false);
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"1\" height=\"621\" bgcolor=\"#00BFFF\">");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.html", out, false);
      out.write("</td>\r\n");
      out.write("    <td width=\"593\" valign=\"top\" bgcolor=\"#FFFFFF\"><img src=\"fgi_recruitment_home[1].jpg\" width=100% height=100%>    </td>\r\n");
      out.write("    <td width=\"130\" height=\"621\" bgcolor=\"#624631\">\r\n");
      out.write("    <div class=\"style4\"><marquee behavior=\"scroll\" direction=\"up\" scrolldelay=\"30sec\">\r\n");
      out.write("    <span class=\"style7\">Deck your hearts with lights of Success...Sure!! that you will reach your destiny</span>\r\n");
      out.write("    </marquee>\r\n");
      out.write("    </div>    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
