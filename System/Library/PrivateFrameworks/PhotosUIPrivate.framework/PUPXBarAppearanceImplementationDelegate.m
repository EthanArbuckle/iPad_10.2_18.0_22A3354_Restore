@implementation PUPXBarAppearanceImplementationDelegate

- (BOOL)barAppearanceIsStatusBarVisible:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStatusBarHidden");

  objc_msgSend(v3, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_currentNavigationTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v5 = objc_msgSend(v7, "wasStatusBarHiddenBeforeTransition");

  return v5 ^ 1;
}

@end
