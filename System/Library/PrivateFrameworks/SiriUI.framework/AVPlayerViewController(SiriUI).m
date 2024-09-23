@implementation AVPlayerViewController(SiriUI)

- (uint64_t)siriui_shouldRotateToLandscape
{
  return 1;
}

- (uint64_t)siriui_shouldHideStatusBar
{
  return 1;
}

@end
