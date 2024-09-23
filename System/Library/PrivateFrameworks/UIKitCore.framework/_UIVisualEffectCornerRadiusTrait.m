@implementation _UIVisualEffectCornerRadiusTrait

+ (double)defaultValue
{
  return 1.79769313e308;
}

+ (NSString)name
{
  return (NSString *)CFSTR("_visualEffectCornerRadius");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.uikit.visualEffectCornerRadius");
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end
