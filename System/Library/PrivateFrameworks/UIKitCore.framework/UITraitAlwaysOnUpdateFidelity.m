@implementation UITraitAlwaysOnUpdateFidelity

+ (NSString)name
{
  return (NSString *)CFSTR("AlwaysOnUpdateFidelity");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitAlwaysOnUpdateFidelity");
}

+ (int64_t)defaultValue
{
  return -1;
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
