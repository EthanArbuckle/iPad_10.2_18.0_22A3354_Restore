@implementation SBSUITraitHomeScreenIconStyle

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.SpringBoardUIServices.home-screen-icon-style");
}

+ (NSString)name
{
  return (NSString *)CFSTR("HomeScreenIconStyle");
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSObject)defaultValue
{
  return 0;
}

@end
