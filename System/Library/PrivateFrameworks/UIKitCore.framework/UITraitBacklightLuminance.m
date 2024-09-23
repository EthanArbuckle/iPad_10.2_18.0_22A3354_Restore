@implementation UITraitBacklightLuminance

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("BacklightLuminance");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitBacklightLuminance");
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end
