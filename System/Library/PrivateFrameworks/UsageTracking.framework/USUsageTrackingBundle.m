@implementation USUsageTrackingBundle

+ (NSBundle)usageTrackingBundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
}

@end
