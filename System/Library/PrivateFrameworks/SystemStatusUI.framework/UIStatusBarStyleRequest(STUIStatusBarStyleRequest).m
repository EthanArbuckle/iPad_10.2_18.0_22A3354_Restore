@implementation UIStatusBarStyleRequest(STUIStatusBarStyleRequest)

- (uint64_t)resolvedStyle
{
  objc_msgSend(a1, "style");
  return _UIStatusBarResolvedStyleFromStyle();
}

@end
