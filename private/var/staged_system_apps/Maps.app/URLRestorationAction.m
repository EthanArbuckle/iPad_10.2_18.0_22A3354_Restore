@implementation URLRestorationAction

- (URLRestorationAction)initWithResetUI:(BOOL)a3 compatibleWithNavigation:(BOOL)a4
{
  URLRestorationAction *v6;
  URLRestorationAction *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)URLRestorationAction;
  v6 = -[RestorationAction init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_resetUI = a3;
    v6->_compatibleWithNavigation = a4;
    -[RestorationAction setSource:](v6, "setSource:", 2);
  }
  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  return self->_compatibleWithNavigation;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return self->_resetUI;
}

- (int)analyticsLaunchActionType
{
  return 39;
}

- (BOOL)resetUI
{
  return self->_resetUI;
}

- (void)setResetUI:(BOOL)a3
{
  self->_resetUI = a3;
}

- (BOOL)compatibleWithNavigation
{
  return self->_compatibleWithNavigation;
}

- (void)setCompatibleWithNavigation:(BOOL)a3
{
  self->_compatibleWithNavigation = a3;
}

@end
