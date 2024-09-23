@implementation UITraitPrimaryInteractionModel

+ (unint64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("PrimaryInteractionModel");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitPrimaryInteractionModel");
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end
