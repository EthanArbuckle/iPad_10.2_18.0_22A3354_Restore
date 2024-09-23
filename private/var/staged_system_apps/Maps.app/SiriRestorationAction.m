@implementation SiriRestorationAction

- (SiriRestorationAction)initWithResetUI:(BOOL)a3 compatibleWithNavigation:(BOOL)a4
{
  SiriRestorationAction *v4;
  SiriRestorationAction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriRestorationAction;
  v4 = -[URLRestorationAction initWithResetUI:compatibleWithNavigation:](&v7, "initWithResetUI:compatibleWithNavigation:", a3, a4);
  v5 = v4;
  if (v4)
    -[RestorationAction setSource:](v4, "setSource:", 5);
  return v5;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 40;
}

@end
