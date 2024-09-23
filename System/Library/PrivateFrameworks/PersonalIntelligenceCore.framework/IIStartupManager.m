@implementation IIStartupManager

+ (void)start
{
  id v2;

  v2 = +[IIMetricsDispatcher sharedInstance](IIMetricsDispatcher, "sharedInstance");
  +[IIMetricsDispatcher registerXPCActivity](IIMetricsDispatcher, "registerXPCActivity");
}

@end
