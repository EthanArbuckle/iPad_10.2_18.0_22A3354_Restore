@implementation _SBTestRecipeDomain

+ (id)domainGroupName
{
  return CFSTR("SpringBoard");
}

+ (id)domainName
{
  return CFSTR("Misc");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
