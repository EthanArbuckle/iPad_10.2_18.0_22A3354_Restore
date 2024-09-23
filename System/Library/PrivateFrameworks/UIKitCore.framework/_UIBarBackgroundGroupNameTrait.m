@implementation _UIBarBackgroundGroupNameTrait

+ (NSObject)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("BarBackgroundGroupName");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("_UIBarBackgroundGroupName");
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
