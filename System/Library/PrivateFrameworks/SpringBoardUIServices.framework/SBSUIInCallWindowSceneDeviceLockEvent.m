@implementation SBSUIInCallWindowSceneDeviceLockEvent

- (SBSUIInCallWindowSceneDeviceLockEvent)initWithSourceType:(int64_t)a3
{
  SBSUIInCallWindowSceneDeviceLockEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSUIInCallWindowSceneDeviceLockEvent;
  result = -[SBSUIInCallWindowSceneDeviceLockEvent init](&v5, sel_init);
  if (result)
    result->_sourceType = a3;
  return result;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

@end
