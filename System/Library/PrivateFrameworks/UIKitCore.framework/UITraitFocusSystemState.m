@implementation UITraitFocusSystemState

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
  return (NSString *)CFSTR("FocusSystemState");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitFocusSystemState");
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
