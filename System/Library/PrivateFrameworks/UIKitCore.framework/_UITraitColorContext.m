@implementation _UITraitColorContext

+ (NSString)name
{
  return (NSString *)CFSTR("ColorContext");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("_UITraitColorContext");
}

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

@end
