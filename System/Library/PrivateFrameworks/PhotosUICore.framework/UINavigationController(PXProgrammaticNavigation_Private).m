@implementation UINavigationController(PXProgrammaticNavigation_Private)

- (id)px_allowsTabSwitching
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  objc_msgSend(a1, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (id)objc_msgSend(v2, "px_allowsTabSwitching");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)UINavigationController_0;
    v4 = objc_msgSendSuper2(&v7, sel_px_allowsTabSwitching);
  }
  v5 = v4;

  return v5;
}

@end
