@implementation UIDismissSceneAction

- (UIDismissSceneAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDismissSceneAction;
  return -[UIDismissSceneAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v3, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, 0, 0, 0, 0.0);
}

- (int64_t)UIActionType
{
  return 44;
}

@end
