<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.timgroup.statsd.NonBlockingStatsDClient" %>
<%@ page import="com.timgroup.statsd.StatsDClient" %>

<html>
<head>
<title>HTTP Header Request Example</title>
</head>
<body>
<center>
<h2>HTTP Header Request Example</h2>
</tr>
<%
    String width = request.getParameter("width");
    String height = request.getParameter("height");
    out.print("Resolution: " + width + "/" +height);

    StatsDClient statsd = new NonBlockingStatsDClient("jsp.statsd", "192.168.0.100", 8125);
    statsd.incrementCounter("Special_Feature");
    statsd.incrementCounter(width + "/" + height);

    statsd.recordGaugeValue("width", Long.parseLong(width));
    statsd.recordGaugeValue("height",  Long.parseLong(height));
    
    //statsd.recordExecutionTime("some-time", 25);
    //statsd.recordSetEvent("some-event", "one");
    //out.println("napchal som daco do statsd");


%>
</table>
</center>
</body>
</html>