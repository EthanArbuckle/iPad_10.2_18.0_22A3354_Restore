@implementation UITraitAccessibilityContrast

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
  return (NSString *)CFSTR("AccessibilityContrast");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitAccessibilityContrast");
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end
