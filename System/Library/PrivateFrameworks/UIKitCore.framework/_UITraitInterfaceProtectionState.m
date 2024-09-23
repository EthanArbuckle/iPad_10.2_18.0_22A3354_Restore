@implementation _UITraitInterfaceProtectionState

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("_UIInterfaceProtectionState");
}

+ (NSString)name
{
  return (NSString *)CFSTR("InterfaceProtectionState");
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end
