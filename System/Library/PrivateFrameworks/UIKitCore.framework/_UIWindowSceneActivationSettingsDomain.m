@implementation _UIWindowSceneActivationSettingsDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____UIWindowSceneActivationSettingsDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("SpringBoard");
}

+ (id)domainName
{
  return CFSTR("Center Window");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
