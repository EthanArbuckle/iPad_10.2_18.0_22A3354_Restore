@implementation UIStatusBar_Base(ResolvedStyle)

- (uint64_t)currentResolvedStyle
{
  objc_msgSend(a1, "currentStyle");
  return _UIStatusBarResolvedStyleFromStyle();
}

- (uint64_t)requestResolvedStyle:()ResolvedStyle
{
  return objc_msgSend(a1, "requestStyle:", _UIStatusBarStyleFromResolvedStyle());
}

@end
