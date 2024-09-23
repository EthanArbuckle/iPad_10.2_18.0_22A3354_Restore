@implementation TSAppMonitor

- (void)activityObservingApplicationWindowDidBecomeBackground
{
  -[TSAppMonitor triggerWithEvent:](self, "triggerWithEvent:", 0);
}

- (void)activityObservingApplicationWindowWillBecomeForeground
{
  -[TSAppMonitor triggerWithEvent:](self, "triggerWithEvent:", 1);
}

@end
