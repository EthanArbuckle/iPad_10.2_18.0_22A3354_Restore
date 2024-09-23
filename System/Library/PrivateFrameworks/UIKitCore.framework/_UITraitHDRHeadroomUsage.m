@implementation _UITraitHDRHeadroomUsage

+ (int64_t)defaultValue
{
  return -1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("HDRHeadroomUsage");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("_UITraitHDRHeadroomUsage");
}

+ (BOOL)affectsColorAppearance
{
  return 0;
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
