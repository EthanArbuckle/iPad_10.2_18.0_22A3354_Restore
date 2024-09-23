@implementation SWTransparencySFAnalytics

+ (id)logger
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SWTransparencySFAnalytics;
  objc_msgSendSuper2(&v3, sel_logger);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)databasePath
{
  return (id)objc_msgSend(a1, "defaultAnalyticsDatabasePath:", CFSTR("SWTransparencyAnalytics"));
}

@end
