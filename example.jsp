<%@ page import="net.sf.uadetector.service.UADetectorServiceFactory" %>
<%@ page import="net.sf.uadetector.UserAgent" %>
<%@ page import="net.sf.uadetector.UserAgentStringParser" %>
<%@ page import="net.sf.uadetector.ReadableUserAgent" %>
<%@ page import="net.sf.uadetector.*" %>

<HTML><head><script src="jquery-2.1.3.min.js"></script></head>
<BODY><center>Hello! <br> <br> 
<%
    java.util.Date date = new java.util.Date();
    out.println( String.valueOf( date ) + "<br><br>");
    out.println("Your IP address is " + request.getRemoteAddr() + "<br>");
    UserAgentStringParser parser 
      = UADetectorServiceFactory.getResourceModuleParser();
    ReadableUserAgent agent 
      = parser.parse(request.getHeader("User-Agent"));
    out.println("You're a <em>"); 
    out.println(agent.getName());
    out.println("</em> on <em>"); 
    out.println(agent.getOperatingSystem().getName());
    out.println("</em>!<br>");
%>

<script>
  var resolutionWidth = window.screen.width;
  var resolutionHeight = window.screen.height;
  document.write("Your Resolution: " 
    + resolutionWidth + " / " + resolutionHeight);
  $(document).ready(function(){
    $("button").click(function(){
        $.get( "statsd_sender.jsp", 
          { width: resolutionWidth, height: resolutionHeight } );
        $.get( "metrics_sender.jsp", 
          { width: resolutionWidth, height: resolutionHeight } );
    });
  });
</script>
<br><br><button>Special Feature</button></center></BODY></HTML>