@implementation FBSDisplayIdentity(DisplayWindowingModeSupport)

- (uint64_t)sb_displayWindowingMode
{
  return objc_msgSend((id)SBApp, "windowingModeForDisplay:", a1);
}

@end
