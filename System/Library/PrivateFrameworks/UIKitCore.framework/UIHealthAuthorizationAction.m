@implementation UIHealthAuthorizationAction

- (UIHealthAuthorizationAction)init
{
  id v3;
  UIHealthAuthorizationAction *v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v6.receiver = self;
  v6.super_class = (Class)UIHealthAuthorizationAction;
  v4 = -[UIHealthAuthorizationAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v6, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v3, 0, 0, 0.0);

  return v4;
}

- (int64_t)UIActionType
{
  return 19;
}

@end
