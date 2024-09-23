@implementation SBHCredenzaDomain

+ (id)domainGroupName
{
  return CFSTR("SpringBoard");
}

+ (id)domainName
{
  return CFSTR("Credenza");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
