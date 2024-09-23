@implementation UITraitKeyboardAppearance

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 0;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitKeyboardAppearance");
}

+ (NSString)name
{
  return (NSString *)CFSTR("KeyboardAppearance");
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end
