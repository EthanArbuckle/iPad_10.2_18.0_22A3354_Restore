@implementation UIViewController(PXProgrammaticNavigation_Private)

- (uint64_t)px_allowsTabSwitching
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "px_barAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (objc_msgSend(a1, "px_splitViewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isCollapsed"),
        v4,
        !v5))
  {
    v6 = 1;
  }
  else if (objc_msgSend(v2, "isEnabled"))
  {
    v6 = objc_msgSend(v2, "prefersTabBarVisible");
  }
  else
  {
    objc_msgSend(a1, "tabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "px_isTabBarHidden") ^ 1;

  }
  return v6;
}

@end
