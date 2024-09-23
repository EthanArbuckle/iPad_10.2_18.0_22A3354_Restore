@implementation UITraitArtworkSubtype

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("ArtworkSubtype");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitArtworkSubtype");
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
