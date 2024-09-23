@implementation _UIVisualEffectCornerMaskTrait

+ (int64_t)defaultValue
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (NSString)name
{
  return (NSString *)CFSTR("_visualEffectCornerMask");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.uikit.visualEffectCornerMask");
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
