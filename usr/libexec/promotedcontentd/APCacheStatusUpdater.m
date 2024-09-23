@implementation APCacheStatusUpdater

- (APCacheStatusUpdater)initWithNotificationRegister:(id)a3
{
  id v4;
  APCacheStatusUpdater *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)APCacheStatusUpdater;
  v5 = -[APCacheStatusUpdater init](&v7, "init");
  if (v5)
    objc_msgSend(v4, "registerHandlerForPurpose:andMetric:closure:", 100, 1405, &stru_1002189A8);

  return v5;
}

@end
