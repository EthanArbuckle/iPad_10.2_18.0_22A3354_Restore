@implementation PresentParkedCarAction

- (PresentParkedCarAction)initWithParkedCarAction:(int64_t)a3
{
  PresentParkedCarAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PresentParkedCarAction;
  result = -[PresentParkedCarAction init](&v5, "init");
  if (result)
    result->_parkedCarAction = a3;
  return result;
}

- (int)analyticsLaunchActionType
{
  return 19;
}

- (int64_t)parkedCarAction
{
  return self->_parkedCarAction;
}

- (void)setParkedCarAction:(int64_t)a3
{
  self->_parkedCarAction = a3;
}

@end
