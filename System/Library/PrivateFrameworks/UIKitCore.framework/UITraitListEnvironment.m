@implementation UITraitListEnvironment

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
  return (NSString *)CFSTR("ListEnvironment");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitListEnvironment");
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end
