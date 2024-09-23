@implementation _UITextFieldPassthroughMetricsProvider

- (BOOL)shouldExtendCaretHeight
{
  return 1;
}

- (double)naturalHeight
{
  return -1.0;
}

@end
