@implementation SBFTodayGestureDomain

+ (SBFTodayGestureSettings)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SBFTodayGestureDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (SBFTodayGestureSettings *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("SpringBoard");
}

+ (id)domainName
{
  return CFSTR("Home Scroll");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_self();
}

@end
