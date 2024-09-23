@implementation UITraitHorizontalSizeClass

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
  return (NSString *)CFSTR("HorizontalSizeClass");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitHorizontalSizeClass");
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
