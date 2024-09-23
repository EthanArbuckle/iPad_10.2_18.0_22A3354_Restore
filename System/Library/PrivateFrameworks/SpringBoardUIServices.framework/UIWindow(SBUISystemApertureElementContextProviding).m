@implementation UIWindow(SBUISystemApertureElementContextProviding)

- (id)systemApertureElementContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  objc_msgSend(a1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureElementContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)UIWindow_0;
    objc_msgSendSuper2(&v8, sel_systemApertureElementContext);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
