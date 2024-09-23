@implementation VUIPPMExtensions

+ (BOOL)isPPMEnabled
{
  return 0;
}

- (VUIPPMExtensions)init
{
  return (VUIPPMExtensions *)PPMExtensions.init()();
}

@end
