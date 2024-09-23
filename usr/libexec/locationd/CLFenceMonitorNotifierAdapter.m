@implementation CLFenceMonitorNotifierAdapter

- (CLFenceMonitorNotifierAdapter)initWithFenceMonitor:(void *)a3
{
  CLFenceMonitorNotifierAdapter *result;
  objc_super v5;

  if (!a3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)CLFenceMonitorNotifierAdapter;
  result = -[CLFenceMonitorNotifierAdapter init](&v5, "init");
  if (result)
  {
    result->_fenceNotifier = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)onVisit:(id)a3
{
  if (-[CLFenceMonitorNotifierAdapter valid](self, "valid"))
    sub_100D12604((uint64_t)-[CLFenceMonitorNotifierAdapter fenceNotifier](self, "fenceNotifier"), a3);
}

- (void)onScenarioTrigger:(id)a3
{
  if (-[CLFenceMonitorNotifierAdapter valid](self, "valid"))
    sub_100D128B8((uint64_t)-[CLFenceMonitorNotifierAdapter fenceNotifier](self, "fenceNotifier"), a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)fenceNotifier
{
  return self->_fenceNotifier;
}

- (void)setFenceNotifier:(void *)a3
{
  self->_fenceNotifier = a3;
}

@end
