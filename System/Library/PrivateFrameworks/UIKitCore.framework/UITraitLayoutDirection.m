@implementation UITraitLayoutDirection

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
  return (NSString *)CFSTR("LayoutDirection");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitLayoutDirection");
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
