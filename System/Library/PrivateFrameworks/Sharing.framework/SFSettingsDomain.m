@implementation SFSettingsDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SFSettingsDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("Sharing");
}

+ (id)domainName
{
  return CFSTR("Sharing");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
