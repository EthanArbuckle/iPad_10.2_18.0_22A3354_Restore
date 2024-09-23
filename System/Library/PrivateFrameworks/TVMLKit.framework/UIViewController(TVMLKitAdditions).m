@implementation UIViewController(TVMLKitAdditions)

- (id)tvIdentifier
{
  return objc_getAssociatedObject(a1, CFSTR("TVUIViewControllerKeyIdentifier"));
}

- (void)tv_setIdentifier:()TVMLKitAdditions
{
  objc_setAssociatedObject(a1, CFSTR("TVUIViewControllerKeyIdentifier"), a3, (void *)3);
}

- (void)tv_updateViewLayout
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "tv_associatedIKViewElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "transferLayoutStylesFromElement:", v4);

    objc_msgSend(a1, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

@end
