@implementation LowFuelAction

- (LowFuelAction)initWithEngineType:(int)a3
{
  LowFuelAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LowFuelAction;
  result = -[LowFuelAction init](&v5, "init");
  if (result)
    result->_engineType = a3;
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 10;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

@end
