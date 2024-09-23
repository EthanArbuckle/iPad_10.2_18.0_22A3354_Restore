@implementation MDModeDecision

- (MDModeDecision)initWithMode:(unint64_t)a3
{
  MDModeDecision *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MDModeDecision;
  result = -[MDModeDecision init](&v5, sel_init);
  if (result)
    result->_currentMode = a3;
  return result;
}

- (unint64_t)currentMode
{
  return self->_currentMode;
}

@end
