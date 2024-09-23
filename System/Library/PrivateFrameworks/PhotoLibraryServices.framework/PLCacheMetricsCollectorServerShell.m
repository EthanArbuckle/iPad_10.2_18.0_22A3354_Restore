@implementation PLCacheMetricsCollectorServerShell

- (PLCacheMetricsCollectorServer)cacheMetricsCollectorServer
{
  return self->_cacheMetricsCollectorServer;
}

- (void)setCacheMetricsCollectorServer:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMetricsCollectorServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMetricsCollectorServer, 0);
}

@end
