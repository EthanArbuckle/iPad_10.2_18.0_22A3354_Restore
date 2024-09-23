@implementation NSBundle(SSSAdditions)

+ (uint64_t)_screenshotServicesServiceBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", ScreenshotServicesServiceBundleIdentifier);
}

@end
