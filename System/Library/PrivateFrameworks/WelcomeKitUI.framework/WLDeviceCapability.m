@implementation WLDeviceCapability

+ (BOOL)hasActionButton
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasHomeButton
{
  return MGGetSInt32Answer() < 2;
}

+ (BOOL)hasDynamicIsland
{
  return MGGetBoolAnswer();
}

@end
