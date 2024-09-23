@implementation UITabBarController

- (id)im_visibleChildViewControllers
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(-[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar"));
  v3 = (void *)v2;
  if (v2)
  {
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (UITabBarAppearance)bc_preferredTabBarScrollEdgeAppearance
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController tabBar](self, "tabBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scrollEdgeAppearance"));

  return (UITabBarAppearance *)v3;
}

- (void)bc_setPreferredTabBarScrollEdgeAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UITabBarController tabBar](self, "tabBar"));
  objc_msgSend(v5, "setScrollEdgeAppearance:", v4);

}

- (void)bc_setSelectedIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a3 < 0)
  {
    v7 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController viewControllers](self, "viewControllers"));
    if ((unint64_t)objc_msgSend(v5, "count") <= a3)
    {
      v7 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController viewControllers](self, "viewControllers"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_C1DF4;
  v9[3] = &unk_28DD50;
  v10 = v7;
  v8 = v7;
  -[UITabBarController im_enumerateVisibleChildrenConformingToProtocol:block:](self, "im_enumerateVisibleChildrenConformingToProtocol:block:", 0, v9);
  -[UITabBarController setSelectedIndex:](self, "setSelectedIndex:", a3);

}

- (void)im_updateTabBarVisibleWithTransitionCoordinator:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13BE38;
  v7[3] = &unk_28B8F0;
  v7[4] = self;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v4)
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v5);
  else
    ((void (*)(_QWORD *, _QWORD))v5[2])(v5, 0);

}

@end
