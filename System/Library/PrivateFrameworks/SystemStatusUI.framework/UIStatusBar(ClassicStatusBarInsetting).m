@implementation UIStatusBar(ClassicStatusBarInsetting)

+ (uint64_t)_roundedPadEdgeInsets
{
  return +[STUIStatusBarVisualProvider_RoundedPad edgeInsets](STUIStatusBarVisualProvider_RoundedPad, "edgeInsets");
}

+ (uint64_t)_regularPadEdgeInsets
{
  return +[STUIStatusBarVisualProvider_Pad edgeInsets](STUIStatusBarVisualProvider_Pad, "edgeInsets");
}

+ (uint64_t)_roundedPadBaselineOffset
{
  return +[STUIStatusBarVisualProvider_RoundedPad baselineOffset](STUIStatusBarVisualProvider_RoundedPad, "baselineOffset");
}

+ (uint64_t)_regularPadBaselineOffset
{
  return +[STUIStatusBarVisualProvider_Pad baselineOffset](STUIStatusBarVisualProvider_Pad, "baselineOffset");
}

@end
