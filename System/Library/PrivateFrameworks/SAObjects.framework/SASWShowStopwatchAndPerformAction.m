@implementation SASWShowStopwatchAndPerformAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stopwatch");
}

- (id)encodedClassName
{
  return CFSTR("ShowStopwatchAndPerformAction");
}

+ (id)showStopwatchAndPerformAction
{
  return objc_alloc_init((Class)a1);
}

- (NSString)stopwatchAction
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("stopwatchAction"));
}

- (void)setStopwatchAction:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("stopwatchAction"), a3);
}

@end
