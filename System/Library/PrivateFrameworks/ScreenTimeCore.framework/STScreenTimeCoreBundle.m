@implementation STScreenTimeCoreBundle

+ (NSBundle)bundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
}

@end
