<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.net.InetSocketAddress" %>
<%@ page import="com.codahale.metrics.*" %>
<%@ page import="com.codahale.metrics.graphite.*" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<%!
Counter specialFeature;

public void jspInit() {
    final class MyMetrics{};
    MetricRegistry metricsRegistry = new MetricRegistry();
    Graphite graphite 
        = new Graphite(new InetSocketAddress("192.168.0.10", 2003));
    final GraphiteReporter reporter = GraphiteReporter
                .forRegistry(metricsRegistry)
                .prefixedWith("jsp.metrics")
                .convertRatesTo(TimeUnit.SECONDS)
                .convertDurationsTo(TimeUnit.MILLISECONDS)
                .filter(MetricFilter.ALL)
                .build(graphite);
    reporter.start(10, TimeUnit.SECONDS);
    specialFeature = metricsRegistry.counter("Special_Feature");
    specialFeature.inc();
}
%>
