@implementation PhoneViewController

- (PhoneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PhoneViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PhoneViewController;
  v4 = -[PhoneViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    +[PhoneViewController initializeIconAndTitle:](PhoneViewController, "initializeIconAndTitle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "savePreferences", CFSTR("PhoneApplicationDeactivatedNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);
    if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
      -[PhoneViewController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", 0);

  }
  return v4;
}

+ (void)initializeIconAndTitle:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  UITabBarAppearance *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v3 = a3;
  v4 = +[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_opt_class(v3);
    if ((objc_opt_respondsToSelector(v6, "tabBarSystemItem") & 1) != 0)
    {
      v5 = objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTabBarSystemItem:tag:", objc_msgSend((id)objc_opt_class(v3), "tabBarSystemItem"), 0);
      v7 = objc_opt_new(UITabBarAppearance);
      objc_msgSend(v5, "setStandardAppearance:", v7);

      objc_msgSend(v3, "setTabBarItem:", v5);
    }
    else
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tabBarItem"));
      v8 = objc_opt_class(v3);
      if ((objc_opt_respondsToSelector(v8, "tabBarIconImage") & 1) != 0)
      {
        v9 = objc_msgSend((id)objc_opt_class(v3), "tabBarIconImage");
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v5, "setImage:", v10);

      }
    }
  }
  v11 = objc_opt_class(v3);
  v12 = &stru_10008B240;
  if ((objc_opt_respondsToSelector(v11, "tabBarIconName") & 1) != 0)
  {
    v13 = objc_msgSend((id)objc_opt_class(v3), "tabBarIconName");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
  }
  if (v4)
    v14 = &stru_10008B240;
  else
    v14 = v12;
  v15 = v14;
  if (objc_msgSend(v5, "isSystemItem"))
    objc_msgSend(v5, "_setInternalTitle:", v15);
  else
    objc_msgSend(v5, "setTitle:", v15);
  if ((objc_opt_respondsToSelector(v3, "setTitle:") & 1) != 0)
    objc_msgSend(v3, "setTitle:", v15);
  v16 = objc_opt_class(v3);
  if ((objc_opt_respondsToSelector(v16, "badge") & 1) != 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100018388;
    v19[3] = &unk_100089980;
    v20 = v3;
    v21 = v5;
    dispatch_async(v18, v19);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend(UIApp, "contentViewCanRotate"))
    return 30;
  else
    return 2;
}

+ (int)tabViewType
{
  return 0;
}

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  _BOOL8 v2;
  unint64_t v3;
  $1FF454C5B48E436092D281DABF654916 result;

  v2 = 1;
  v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (id)tabBarIconName
{
  return 0;
}

+ (id)defaultPNGName
{
  return CFSTR("Default");
}

- (BOOL)shouldSnapshot
{
  return 1;
}

- (void)_saveOffsetDefaultForKey:(id)a3 withScrollView:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v7 = a4;
  v8 = a3;
  if ((-[PhoneViewController isViewLoaded](self, "isViewLoaded") & 1) != 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("View must be loaded before you call _saveOffsetDefaultForKey:withScrollView:"))), NSLog(CFSTR("** TUAssertion failure: %@"), v9), v9, !_TUAssertShouldCrashApplication())|| (-[PhoneViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    if (v8)
      goto LABEL_7;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneViewController.m"), 156, CFSTR("View must be loaded before you call _saveOffsetDefaultForKey:withScrollView:"));

    if (v8)
      goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Passed nil key to _saveOffsetDefaultForKey:withScrollView:")));
  NSLog(CFSTR("** TUAssertion failure: %@"), v10);

  if (_TUAssertShouldCrashApplication())
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneViewController.m"), 157, CFSTR("Passed nil key to _saveOffsetDefaultForKey:withScrollView:"));

  }
LABEL_7:
  if (!v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Passed nil scrollView to _saveOffsetDefaultForKey:withScrollView:")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v12);

    if (_TUAssertShouldCrashApplication())
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneViewController.m"), 158, CFSTR("Passed nil scrollView to _saveOffsetDefaultForKey:withScrollView:"));

    }
  }
  objc_msgSend(v7, "contentOffset");
  v15 = v14;
  objc_msgSend(v7, "contentInset");
  v17 = v16;

  v18 = v15 + v17;
  *(float *)&v18 = v15 + v17;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  sub_100034680(v8, v20, 0);

}

- (void)_loadOffsetDefaultForKey:(id)a3 withScrollView:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  if ((-[PhoneViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("View must be loaded before you call _loadOffsetDefaultForKey:withScrollView:")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v8);

    if (_TUAssertShouldCrashApplication())
    {
      if ((-[PhoneViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneViewController.m"), 163, CFSTR("View must be loaded before you call _loadOffsetDefaultForKey:withScrollView:"));

      }
    }
  }
  if (!v18)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Passed nil key to _saveOffsetDefaultForKey:withScrollView:")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v9);

    if (_TUAssertShouldCrashApplication())
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneViewController.m"), 164, CFSTR("Passed nil key to _saveOffsetDefaultForKey:withScrollView:"));

    }
  }
  if (!v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Passed nil scrollView to _loadOffsetDefaultForKey:withScrollView:")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v11);

    if (_TUAssertShouldCrashApplication())
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneViewController.m"), 165, CFSTR("Passed nil scrollView to _loadOffsetDefaultForKey:withScrollView:"));

    }
  }
  v13 = sub_10000CF14(v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "floatValue");
    if (v16 < 0.0)
      v16 = 0.0;
    objc_msgSend(v7, "setContentOffset:", 0.0, v16);
  }

}

- (void)contentSizeCategoryDidChange
{
  -[PhoneViewController _updateCachedCellHeight](self, "_updateCachedCellHeight");
}

- (void)_prepareForLoadView
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PhoneViewController;
  if (-[PhoneViewController respondsToSelector:](&v4, "respondsToSelector:", "_primitiveSetNavigationControllerContentInsetAdjustment:"))
  {
    v3.receiver = self;
    v3.super_class = (Class)PhoneViewController;
    if (-[PhoneViewController respondsToSelector:](&v3, "respondsToSelector:", "_primitiveSetNavigationControllerContentOffsetAdjustment:"))
    {
      -[PhoneViewController _primitiveSetNavigationControllerContentInsetAdjustment:](self, "_primitiveSetNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
      -[PhoneViewController _primitiveSetNavigationControllerContentOffsetAdjustment:](self, "_primitiveSetNavigationControllerContentOffsetAdjustment:", 0.0);
    }
  }
}

- (void)setCellClassForCachedCellHeight:(Class)a3
{
  Class *p_cellClassForCachedCellHeight;

  p_cellClassForCachedCellHeight = &self->_cellClassForCachedCellHeight;
  if (*p_cellClassForCachedCellHeight != a3)
  {
    objc_storeStrong((id *)p_cellClassForCachedCellHeight, a3);
    -[PhoneViewController _updateCachedCellHeight](self, "_updateCachedCellHeight");
  }
}

- (void)_updateCachedCellHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  if (-[PhoneViewController cellClassForCachedCellHeight](self, "cellClassForCachedCellHeight"))
  {
    v7 = objc_msgSend(objc_alloc(-[PhoneViewController cellClassForCachedCellHeight](self, "cellClassForCachedCellHeight")), "initWithStyle:reuseIdentifier:", 1, CFSTR("PHSizingCell"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneViewController view](self, "view"));
    objc_msgSend(v3, "frame");
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", v4, 0.0);
    v6 = v5;

    -[PhoneViewController setCachedCellHeight:](self, "setCachedCellHeight:", v6);
  }
}

+ (BOOL)tabBarIconImageFinished:(id *)a3 forTabBarItemName:(id)a4
{
  return *a3 != 0;
}

- (double)cachedCellHeight
{
  return self->_cachedCellHeight;
}

- (void)setCachedCellHeight:(double)a3
{
  self->_cachedCellHeight = a3;
}

- (Class)cellClassForCachedCellHeight
{
  return self->_cellClassForCachedCellHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellClassForCachedCellHeight, 0);
}

@end
