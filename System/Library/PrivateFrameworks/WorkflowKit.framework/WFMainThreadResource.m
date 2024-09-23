@implementation WFMainThreadResource

+ (BOOL)isSingleton
{
  return 1;
}

- (BOOL)isAvailable
{
  return 1;
}

@end
