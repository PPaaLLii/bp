<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.timgroup.statsd.NonBlockingStatsDClient" %>
<%@ page import="com.timgroup.statsd.StatsDClient" %>

<html>
<head></head>
<body>
<%
    String width = request.getParameter("width");
    String height = request.getParameter("height");
    StatsDClient statsd 
    	= new NonBlockingStatsDClient("jsp.statsd", "192.168.0.10", 8125);
    statsd.incrementCounter("Special_Feature");
    statsd.incrementCounter(width + "/" + height);
    statsd.recordGaugeValue("width", Long.parseLong(width));
    statsd.recordGaugeValue("height",  Long.parseLong(height));
%>
</body>
</html>