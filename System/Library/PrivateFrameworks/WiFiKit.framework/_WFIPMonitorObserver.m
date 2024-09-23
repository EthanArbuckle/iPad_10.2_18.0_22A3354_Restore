@implementation _WFIPMonitorObserver

- (void)setIpMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_ipMonitor, a3);
}

- (WFIPMonitor)ipMonitor
{
  return (WFIPMonitor *)objc_loadWeakRetained((id *)&self->_ipMonitor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ipMonitor);
}

@end
