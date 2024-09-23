@implementation _UIViewServiceViewControllerDeputy

+ (id)XPCInterface
{
  return 0;
}

+ (id)deputyWithViewController:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIViewServiceViewControllerDeputy;
  objc_msgSendSuper2(&v4, sel_proxyWithTarget_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (id)invalidate
{
  void *v2;
  void *v3;

  +[_UIAsyncInvocation emptyInvocation](_UIAsyncInvocation, "emptyInvocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
