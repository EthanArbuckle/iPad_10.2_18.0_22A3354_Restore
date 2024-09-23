@implementation BKAppLaunchAssertionCoordinator

- (BOOL)leave
{
  unint64_t holdCount;
  unint64_t v3;

  holdCount = self->_holdCount;
  if (!holdCount)
    return 0;
  v3 = holdCount - 1;
  self->_holdCount = v3;
  return v3 == 0;
}

- (BKAppLaunchAssertionCoordinator)initWithCondition:(unint64_t)a3
{
  BKAppLaunchAssertionCoordinator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAppLaunchAssertionCoordinator;
  result = -[BKAppLaunchAssertionCoordinator init](&v5, "init");
  if (result)
    result->_condition = a3;
  return result;
}

- (unint64_t)holdCount
{
  return self->_holdCount;
}

- (void)enter
{
  ++self->_holdCount;
}

- (unint64_t)condition
{
  return self->_condition;
}

- (BOOL)hasEnteredGroup
{
  return self->_hasEnteredGroup;
}

@end
