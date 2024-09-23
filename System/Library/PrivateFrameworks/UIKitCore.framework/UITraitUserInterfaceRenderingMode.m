@implementation UITraitUserInterfaceRenderingMode

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
  return (NSString *)CFSTR("UserInterfaceRenderingMode");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitUserInterfaceRenderingMode");
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
