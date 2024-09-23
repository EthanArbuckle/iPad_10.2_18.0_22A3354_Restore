@implementation PDRGestaltWrapper

+ (BOOL)isUIBuild
{
  return MGGetBoolAnswer();
}

+ (id)deviceClassString
{
  return (id)MGGetStringAnswer();
}

+ (BOOL)amCompanion
{
  return MGGetBoolAnswer();
}

@end
