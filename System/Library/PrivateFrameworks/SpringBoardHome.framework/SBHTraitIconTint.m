@implementation SBHTraitIconTint

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.SpringBoardHome.icon-tint");
}

+ (NSString)name
{
  return (NSString *)CFSTR("IconTintColor");
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
