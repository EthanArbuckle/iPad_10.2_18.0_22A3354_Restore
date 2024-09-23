@implementation UITraitVibrancy

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
  return (NSString *)CFSTR("Vibrancy");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitVibrancy");
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end
