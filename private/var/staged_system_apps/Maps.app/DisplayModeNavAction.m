@implementation DisplayModeNavAction

- (DisplayModeNavAction)initWithShowDetails:(BOOL)a3
{
  DisplayModeNavAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DisplayModeNavAction;
  result = -[DisplayModeNavAction init](&v5, "init");
  if (result)
    result->_showDetails = a3;
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 7;
}

- (BOOL)showDetails
{
  return self->_showDetails;
}

- (void)setShowDetails:(BOOL)a3
{
  self->_showDetails = a3;
}

@end
