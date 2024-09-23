@implementation UITraitDisplayScale

+ (double)defaultValue
{
  return 0.0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("DisplayScale");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitDisplayScale");
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end
