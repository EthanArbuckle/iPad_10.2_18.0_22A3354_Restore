@implementation CLAppMonitorAppObserver

- (CLAppMonitorAppObserver)initWithAppMonitorProxy:(id)a3
{
  CLAppMonitorAppObserver *result;
  objc_super v5;

  if (!a3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)CLAppMonitorAppObserver;
  result = -[CLAppMonitorAppObserver init](&v5, "init");
  if (result)
  {
    result->_appMonitor = (CLAppMonitorProtocol *)a3;
    result->_valid = 1;
  }
  return result;
}

- (void)applicationsDidInstall:(id)a3
{
  if (self->_valid)
    -[CLAppMonitorProtocol onApplicationsInstalled:](self->_appMonitor, "onApplicationsInstalled:", a3);
}

- (void)applicationsDidUninstall:(id)a3
{
  if (self->_valid)
    -[CLAppMonitorProtocol onApplicationsUninstalled:](self->_appMonitor, "onApplicationsUninstalled:", a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLAppMonitorProtocol)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
  self->_appMonitor = (CLAppMonitorProtocol *)a3;
}

@end
