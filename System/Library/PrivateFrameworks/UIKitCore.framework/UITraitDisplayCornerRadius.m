@implementation UITraitDisplayCornerRadius

+ (double)defaultValue
{
  return -1.0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("DisplayCornerRadius");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitDisplayCornerRadius");
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
