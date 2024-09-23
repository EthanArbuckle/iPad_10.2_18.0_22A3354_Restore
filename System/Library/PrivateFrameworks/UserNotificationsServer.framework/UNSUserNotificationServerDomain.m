@implementation UNSUserNotificationServerDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___UNSUserNotificationServerDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("UserNotifications");
}

+ (id)domainName
{
  return CFSTR("Server");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
