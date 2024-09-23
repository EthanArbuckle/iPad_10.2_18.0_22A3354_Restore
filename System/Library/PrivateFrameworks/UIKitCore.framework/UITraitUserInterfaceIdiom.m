@implementation UITraitUserInterfaceIdiom

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("UserInterfaceIdiom");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitUserInterfaceIdiom");
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
