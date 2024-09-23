@implementation SXVideoComponentVisibilityMonitor

- (void)scrollingDidStop
{
  -[SXVisibilityMonitor unlock](self, "unlock");
  -[SXVisibilityMonitor updateVisibility](self, "updateVisibility");
}

@end
