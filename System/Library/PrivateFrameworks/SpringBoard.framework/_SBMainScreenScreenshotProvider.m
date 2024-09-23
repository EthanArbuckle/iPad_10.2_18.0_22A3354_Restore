@implementation _SBMainScreenScreenshotProvider

- (id)flasher
{
  return +[SBScreenFlash mainScreenFlasher](SBScreenFlash, "mainScreenFlasher");
}

- (id)captureScreenshot
{
  return (id)_UICreateScreenUIImageWithRotation();
}

@end
