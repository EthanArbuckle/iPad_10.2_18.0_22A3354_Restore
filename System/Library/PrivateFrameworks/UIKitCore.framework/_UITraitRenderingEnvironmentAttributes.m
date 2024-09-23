@implementation _UITraitRenderingEnvironmentAttributes

+ (NSObject)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("RenderingEnvironmentAttributes");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("_UITraitRenderingEnvironmentAttributes");
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
