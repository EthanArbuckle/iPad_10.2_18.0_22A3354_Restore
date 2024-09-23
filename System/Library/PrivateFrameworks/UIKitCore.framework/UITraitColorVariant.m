@implementation UITraitColorVariant

+ (NSString)name
{
  return (NSString *)CFSTR("ColorVariant");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitColorVariant");
}

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
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
