@implementation _UIVisualEffectIsContentStaticTrait

+ (int64_t)defaultValue
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (NSString)name
{
  return (NSString *)CFSTR("_visualEffectIsContentStatic");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.uikit.visualEffectIsContentStatic");
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
