@implementation ShowKeyboardAction

- (ShowKeyboardAction)initWithInteractionModel:(unint64_t)a3
{
  ShowKeyboardAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ShowKeyboardAction;
  result = -[ShowKeyboardAction init](&v5, "init");
  if (result)
    result->_interactionModel = a3;
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 31;
}

- (unint64_t)interactionModel
{
  return self->_interactionModel;
}

- (void)setInteractionModel:(unint64_t)a3
{
  self->_interactionModel = a3;
}

@end
