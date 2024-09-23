@implementation UIView(SBUISystemApertureElementContextProviding)

- (id)systemApertureElementContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemApertureElementContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)UIView_0;
    objc_msgSendSuper2(&v9, sel_systemApertureElementContext);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end
