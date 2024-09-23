@implementation _UIVisualEffectCornerCurveTrait

+ (NSObject)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("_visualEffectCornerCurve");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.uikit.visualEffectCornerCurve");
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
