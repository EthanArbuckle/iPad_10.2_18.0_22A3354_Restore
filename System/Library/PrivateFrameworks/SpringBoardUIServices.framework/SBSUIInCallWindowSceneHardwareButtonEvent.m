@implementation SBSUIInCallWindowSceneHardwareButtonEvent

- (SBSUIInCallWindowSceneHardwareButtonEvent)initWithButtonEventType:(int64_t)a3
{
  SBSUIInCallWindowSceneHardwareButtonEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSUIInCallWindowSceneHardwareButtonEvent;
  result = -[SBSUIInCallWindowSceneHardwareButtonEvent init](&v5, sel_init);
  if (result)
    result->_buttonEventType = a3;
  return result;
}

- (int64_t)buttonEventType
{
  return self->_buttonEventType;
}

@end
