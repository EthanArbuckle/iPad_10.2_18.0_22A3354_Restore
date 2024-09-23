@implementation _UITabBarControllerVisualStyle_iOS

- (BOOL)supportsShowingMoreItem
{
  return 1;
}

- (int64_t)tabBarPosition
{
  return 1;
}

- (unint64_t)defaultMaxItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "horizontalSizeClass");
  v5 = objc_msgSend(v3, "userInterfaceIdiom");
  v6 = 5;
  if (v5 == 1)
    v7 = 8;
  else
    v7 = 5;
  if (v4 != 1)
    v6 = 8;
  if (v4)
    v8 = v6;
  else
    v8 = v7;

  return v8;
}

- (void)loadViews
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UITabBar *v12;
  void *v13;
  void *v14;
  id *v15;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v15 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v15, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = -[UITabBar initWithFrame:]([UITabBar alloc], "initWithFrame:", v5, v7, v9, v11);
    objc_msgSend(v15, "setTabBar:", v12);

  }
  if (dyld_program_sdk_at_least())
  {
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

  }
}

- (void)updateViewControllers:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rebuildTabBarItemsAnimated:", v3);

}

- (void)tabContentDidChange:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v7, "isLocked");
  objc_msgSend(v7, "setLocked:", 0);
  objc_msgSend(v4, "_updateView");

  objc_msgSend(v7, "setLocked:", v6);
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  _UITabCrossFadeTransition *v5;
  void *v6;
  void *v7;
  void *v8;

  if (+[UIView _uip_transitionEnabled]() && !_AXSReduceMotionEnabled())
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[_UITabCrossFadeTransition initWithBackgroundColor:]([_UITabCrossFadeTransition alloc], "initWithBackgroundColor:", v8);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
