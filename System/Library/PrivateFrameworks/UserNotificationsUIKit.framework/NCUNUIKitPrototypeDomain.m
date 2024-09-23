@implementation NCUNUIKitPrototypeDomain

+ (NCUNUIKitPrototypeSettings)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NCUNUIKitPrototypeDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (NCUNUIKitPrototypeSettings *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("UserNotificationsUI");
}

+ (id)domainName
{
  return CFSTR("userNotificationsUIKit");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
