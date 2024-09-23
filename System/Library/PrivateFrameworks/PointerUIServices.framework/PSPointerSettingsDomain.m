@implementation PSPointerSettingsDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PSPointerSettingsDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("Pointer");
}

+ (id)domainName
{
  return CFSTR("PointerUIServices Framework");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
