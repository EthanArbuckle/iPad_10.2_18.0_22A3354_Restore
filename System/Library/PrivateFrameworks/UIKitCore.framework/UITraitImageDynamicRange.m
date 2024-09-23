@implementation UITraitImageDynamicRange

+ (NSString)name
{
  return (NSString *)CFSTR("ImageDynamicRange");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitImageDynamicRange");
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
  return 0;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end
