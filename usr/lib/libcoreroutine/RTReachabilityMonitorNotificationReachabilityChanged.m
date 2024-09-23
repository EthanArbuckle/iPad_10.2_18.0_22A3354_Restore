@implementation RTReachabilityMonitorNotificationReachabilityChanged

- (RTReachabilityMonitorNotificationReachabilityChanged)initWithReachability:(unint64_t)a3
{
  RTReachabilityMonitorNotificationReachabilityChanged *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTReachabilityMonitorNotificationReachabilityChanged;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_reachability = a3;
  return result;
}

- (unint64_t)reachability
{
  return self->_reachability;
}

@end
