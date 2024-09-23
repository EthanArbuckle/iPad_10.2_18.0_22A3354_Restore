@implementation UITraitVerticalSizeClass

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("VerticalSizeClass");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitVerticalSizeClass");
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
