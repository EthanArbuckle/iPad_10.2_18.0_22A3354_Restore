@implementation STUConcreteOpenApplicationToken

- (STUConditionMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
