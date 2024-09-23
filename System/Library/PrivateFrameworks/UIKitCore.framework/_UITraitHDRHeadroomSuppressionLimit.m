@implementation _UITraitHDRHeadroomSuppressionLimit

+ (double)defaultValue
{
  return 0.0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("HDRHeadroomSuppressionLimit");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("_UITraitHDRHeadroomSuppressionLimit");
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
