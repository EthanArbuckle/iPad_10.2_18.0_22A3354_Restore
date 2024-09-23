@implementation UISceneSystemProtectionManager

- (id)_init
{
  objc_super v1;

  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)UISceneSystemProtectionManager;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (BOOL)isUserAuthenticationEnabled
{
  return self->userAuthenticationEnabled;
}

@end
