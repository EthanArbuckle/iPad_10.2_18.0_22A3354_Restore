@implementation UITraitPreferredContentSizeCategory

+ (NSObject)defaultValue
{
  return CFSTR("_UICTContentSizeCategoryUnspecified");
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("PreferredContentSizeCategory");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitPreferredContentSizeCategory");
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
