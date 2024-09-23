@implementation NotificationRestorationAction

- (NotificationRestorationAction)init
{
  NotificationRestorationAction *v2;
  NotificationRestorationAction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NotificationRestorationAction;
  v2 = -[RestorationAction init](&v5, "init");
  v3 = v2;
  if (v2)
    -[RestorationAction setSource:](v2, "setSource:", 0);
  return v3;
}

- (int)analyticsLaunchActionType
{
  return 12;
}

@end
