@implementation UITraitTypesettingLanguage

+ (NSObject)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("TypesettingLanguage");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitTypesettingLanguage");
}

@end
