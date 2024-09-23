@implementation IMSegmentedViewController

- (IMSegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  IMSegmentedViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMSegmentedViewController;
  result = -[IMViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
  if (result)
    result->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[IMViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)IMSegmentedViewController;
  -[IMViewController dealloc](&v3, "dealloc");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController selectedViewController](self, "selectedViewController"));
  objc_msgSend(v6, "setEditing:animated:", v5, v4);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMSegmentedViewController;
  -[IMSegmentedViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController selectedViewController](self, "selectedViewController"));
  -[IMSegmentedViewController showViewController:sendAppearanceMessages:](self, "showViewController:sendAppearanceMessages:", v3, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewControllers](self, "viewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 &= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "supportedInterfaceOrientations");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 30;
  }

  return v6;
}

- (void)setSelectedIndex:(int64_t)a3
{
  -[IMSegmentedViewController setSelectedIndex:animated:](self, "setSelectedIndex:animated:", a3, 0);
}

- (UIViewController)selectedViewController
{
  return (UIViewController *)-[IMSegmentedViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", -[IMSegmentedViewController selectedIndex](self, "selectedIndex"));
}

- (void)setViewControllers:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_viewControllers != v5)
  {
    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = v5;
    -[IMSegmentedViewController reconcileChildViewControllersWithOldViewControllers:newViewControllers:](self, "reconcileChildViewControllersWithOldViewControllers:newViewControllers:", self->_viewControllers, v5);
    objc_storeStrong((id *)&self->_viewControllers, a3);
    -[IMSegmentedViewController selectDefaultIndex](self, "selectDefaultIndex");
    v5 = v6;
  }

}

- (void)setSelectedIndex:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v6;
  id v7;

  if (a4)
    v6 = objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController defaultTransition](self, "defaultTransition"));
  else
    v6 = 0;
  v7 = (id)v6;
  -[IMSegmentedViewController setSelectedIndex:withTransition:](self, "setSelectedIndex:withTransition:", a3, v6);

}

- (void)setSelectedIndex:(int64_t)a3 withTransition:(id)a4
{
  -[IMSegmentedViewController setSelectedIndex:withTransition:force:](self, "setSelectedIndex:withTransition:force:", a3, a4, 0);
}

- (void)setSelectedIndex:(int64_t)a3 withTransition:(id)a4 force:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  id v12;

  v7 = a4;
  if (self->_selectedIndex != a3)
  {
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController selectedViewController](self, "selectedViewController"));
    v10 = -[IMSegmentedViewController selectedIndex](self, "selectedIndex");
    self->_selectedIndex = a3;
    if (v9)
    {
      v11 = -[IMViewController transitionFromViewController:toViewController:transition:reverse:](self, "transitionFromViewController:toViewController:transition:reverse:", v9, v8, v12, v10 > a3);
    }
    else if (-[IMSegmentedViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[IMSegmentedViewController showViewController:sendAppearanceMessages:](self, "showViewController:sendAppearanceMessages:", v8, 1);
    }

    v7 = v12;
  }

}

- (void)selectDefaultIndex
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewControllers](self, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[IMSegmentedViewController setSelectedIndex:withTransition:force:](self, "setSelectedIndex:withTransition:force:", 0, 0, 1);
}

- (id)viewControllerAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (a3 < 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewControllers](self, "viewControllers")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        (unint64_t)v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewControllers](self, "viewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  }
  return v8;
}

- (void)reconcileChildViewControllersWithOldViewControllers:(id)a3 newViewControllers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v7);
  objc_msgSend(v8, "removeObjectsInArray:", v6);
  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v6);
  objc_msgSend(v9, "removeObjectsInArray:", v7);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[IMSegmentedViewController addChildViewController:](self, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "removeFromParentViewController", (_QWORD)v20);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (void)showViewController:(id)a3 sendAppearanceMessages:(BOOL)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewIfLoaded](self, "viewIfLoaded", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController selectedViewController](self, "selectedViewController"));
  objc_msgSend(v17, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v17, "addSubview:", v16);

}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (IMViewControllerTransition)defaultTransition
{
  return self->_defaultTransition;
}

- (void)setDefaultTransition:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTransition, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end
