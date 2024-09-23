@implementation UIViewController(UIViewController_TraitsArbiterTemp)

- (void)setNeedsUpdateOfSupportedInterfaceOrientations
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_opt_class();
  objc_msgSend(v7, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    v5 = objc_msgSend(v7, "_supportedInterfaceOrientationsForRootViewController");
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_windowScene:window:didUpdateSupportedInterfaceOrientations:preferredOrientation:", v4, v7, v5, 0);

  }
}

@end
