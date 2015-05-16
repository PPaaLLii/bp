<%@ page import="net.sf.uadetector.service.UADetectorServiceFactory" %>
<%@ page import="net.sf.uadetector.UserAgent" %>
<%@ page import="net.sf.uadetector.UserAgentStringParser" %>
<%@ page import="net.sf.uadetector.ReadableUserAgent" %>
<%@ page import="net.sf.uadetector.*" %>


<HTML>
<head>
  <script src="jquery-2.1.3.min.js"></script>
</head>
<BODY>
  <center>
<script LANGUAGE="JavaScript" type="text/javascript">
function checkOS() {
  if(navigator.userAgent.indexOf('IRIX') != -1)
    { var OpSys = "Irix"; }
  else if((navigator.userAgent.indexOf('Win') != -1) &&
  (navigator.userAgent.indexOf('98') != -1))
    { var OpSys = "Windows 98"; }
  else if((navigator.userAgent.indexOf('Win') != -1) &&
  (navigator.userAgent.indexOf('95') != -1))
    { var OpSys = "Windows 95"; }
  else if(navigator.appVersion.indexOf("16") !=-1)
    { var OpSys = "Windows 3.1"; }
  else if (navigator.appVersion.indexOf("NT") !=-1)
    { var OpSys= "Windows NT"; }  
else if(navigator.appVersion.indexOf("SunOS") !=-1)
    { var OpSys = "SunOS"; }
  else if(navigator.appVersion.indexOf("Linux") !=-1)
    { var OpSys = "Linux"; }  
  else if(navigator.userAgent.indexOf('Mac') != -1)
    { var OpSys = "Macintosh"; }
  else if(navigator.appName=="WebTV Internet Terminal")
    { var OpSys="WebTV"; }
  else if(navigator.appVersion.indexOf("HP") !=-1)
    { var OpSys="HP-UX"; } 
  else if(navigator.appVersion.indexOf("Android") !=-1)
    { var OpSys="Android"; } 
  else if(navigator.appVersion.indexOf("iPhone") !=-1)
    { var OpSys="iPhone"; } 
  else if(navigator.appVersion.indexOf("iPad") !=-1)
    { var OpSys="iPad"; } 
  else if(navigator.appVersion.indexOf("iPod") !=-1)
    { var OpSys="iPod"; } 
else { var OpSys = "other"; }
  return OpSys;
}
//--></script>

<%
    // This scriptlet declares and initializes "date"
    //System.out.println( "Evaluating date now" );
    java.util.Date date = new java.util.Date();
%>
Hello! <br> <br> 
<%
    // This scriptlet generates HTML output
    out.println( String.valueOf( date ) + "<br><br>");
    //out.println("Your browser is " + request.getHeader("User-Agent") + "<br>");
    out.println("Your IP address is " + request.getRemoteAddr() + "<br>");

    UserAgentStringParser parser = UADetectorServiceFactory.getResourceModuleParser();
    ReadableUserAgent agent = parser.parse(request.getHeader("User-Agent"));
 
    out.println("You're a <em>");
    out.println(agent.getName());
    out.println("</em> on <em>");
    out.println(agent.getOperatingSystem().getName());
    out.println("</em>!");
%>

<script>
  var os = checkOS();
  var resolutionWidth = window.screen.width;
  var resolutionHeight = window.screen.height;
  document.write("<br>Your OS: " + os + " <br><br>");
  document.write("Your Resolution: " + resolutionWidth + " / " + resolutionHeight);
  
  $(document).ready(function(){
    $("button").click(function(){
        $.get( "statsd-graphite-sender.jsp", { width: resolutionWidth, height: resolutionHeight } )
        ;
    });
});

</script>

<br><br>

<button>Special Feature</button>
</center>
</BODY>
</HTML>