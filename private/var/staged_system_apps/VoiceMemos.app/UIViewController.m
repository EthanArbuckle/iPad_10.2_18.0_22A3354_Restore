@implementation UIViewController

- (void)rc_addChildViewWithViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  -[UIViewController rc_addChildViewWithViewController:toView:](self, "rc_addChildViewWithViewController:toView:", v4, v5);

}

- (void)rc_addChildViewWithViewController:(id)a3 toView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v6, "addSubview:", v7);

  -[UIViewController addChildViewController:](self, "addChildViewController:", v8);
  objc_msgSend(v8, "didMoveToParentViewController:", self);

}

- (BOOL)rc_canAnimate
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  v3 = objc_msgSend(v2, "rc_canAnimate");

  return v3;
}

- (BOOL)rc_isPrimaryLayoutAxis:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  return v6 > v8 && a3 == 0;
}

- (void)rc_loadViewIfNecessary
{

}

- (id)rc_navigationItemForPresentingNavigationItem:(id)a3 forViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG"))
  {
    v8 = objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", &stru_1001B2BC0);
LABEL_6:
    v11 = v8;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));

  if (!v9)
  {
    v8 = v6;
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rc_navigationItemForPresentingNavigationItem:forViewController:", v6, v7));

LABEL_7:
  return v11;
}

- (BOOL)rc_isDescendantOfViewController:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v6 = objc_msgSend(v5, "rc_isDescendantOfViewController:", v4);

  return v6;
}

- (void)rc_ensureIsInterfaceOrientationMask:(unint64_t)a3 preferredOrientation:(int64_t)a4 doneEnsuringBlock:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[4];
  void (**v17)(_QWORD);

  v8 = (void (**)(_QWORD))a5;
  if (((1 << (char)-[UIViewController interfaceOrientation](self, "interfaceOrientation")) & a3) != 0)
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v14, "setOrientation:animated:", a4, 1);

    -[UIViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
    v15 = dispatch_time(0, 330000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004BAF0;
    block[3] = &unk_1001AC298;
    v17 = v8;
    dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)rc_automaticallyUpdateScreenUpdatesDisabled
{
  id AssociatedObject;
  RCUIViewControllerNoticationObserver *v4;
  RCUIViewControllerNoticationObserver *value;

  AssociatedObject = objc_getAssociatedObject(self, "_RCUIViewControllerNoticationObserver");
  v4 = (RCUIViewControllerNoticationObserver *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    value = objc_alloc_init(RCUIViewControllerNoticationObserver);
    -[RCUIViewControllerNoticationObserver setViewController:](value, "setViewController:", self);
    objc_setAssociatedObject(self, "_RCUIViewControllerNoticationObserver", value, (void *)0x301);
    v4 = value;
  }

}

- (void)rc_setScreenUpdatesDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[UIViewController rc_screenUpdatesDisabled](self, "rc_screenUpdatesDisabled") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_setAssociatedObject(self, "_RCUIViewControllerScreenUpdateDisabled", v5, (void *)0x301);

    -[UIViewController rc_screenUpdatesDisabledDidChange](self, "rc_screenUpdatesDisabledDidChange");
  }
}

- (BOOL)rc_screenUpdatesDisabled
{
  id AssociatedObject;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  AssociatedObject = objc_getAssociatedObject(self, "_RCUIViewControllerScreenUpdateDisabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v8 = v7;
  if (v7)
    v6 = objc_msgSend(v7, "rc_screenUpdatesDisabled");
  else
    v6 = 0;

  return v6;
}

- (BOOL)rc_shouldAutoDisableUpdatesWhenInBackground
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));

  if (!v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v5 = objc_msgSend(v4, "rc_shouldAutoDisableUpdatesWhenInBackground");

  return v5;
}

- (void)rc_applicationDidEnterBackground
{
  if (-[UIViewController rc_shouldAutoDisableUpdatesWhenInBackground](self, "rc_shouldAutoDisableUpdatesWhenInBackground"))
  {
    -[UIViewController rc_setScreenUpdatesDisabled:](self, "rc_setScreenUpdatesDisabled:", 1);
  }
}

- (void)rc_applicationWillEnterForeground
{
  if (-[UIViewController rc_shouldAutoDisableUpdatesWhenInBackground](self, "rc_shouldAutoDisableUpdatesWhenInBackground"))
  {
    -[UIViewController rc_setScreenUpdatesDisabled:](self, "rc_setScreenUpdatesDisabled:", 0);
  }
}

- (void)rc_configurePopoverControllerWithSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;

  v4 = a3;
  if (v4)
  {
    v24 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v4 = v24;
    if (v6 == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController popoverPresentationController](self, "popoverPresentationController"));
      objc_msgSend(v7, "_setIgnoreBarButtonItemSiblings:", 1);

      v9 = objc_opt_class(UIBarButtonItem, v8);
      if ((objc_opt_isKindOfClass(v24, v9) & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController popoverPresentationController](self, "popoverPresentationController"));
        objc_msgSend(v11, "setBarButtonItem:", v24);
LABEL_7:

        v4 = v24;
        goto LABEL_8;
      }
      v12 = objc_opt_class(UIView, v10);
      isKindOfClass = objc_opt_isKindOfClass(v24, v12);
      v4 = v24;
      if ((isKindOfClass & 1) != 0)
      {
        v14 = v24;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController popoverPresentationController](self, "popoverPresentationController"));
        objc_msgSend(v15, "setSourceView:", v14);

        objc_msgSend(v14, "bounds");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController popoverPresentationController](self, "popoverPresentationController"));
        objc_msgSend(v11, "setSourceRect:", v17, v19, v21, v23);
        goto LABEL_7;
      }
    }
  }
LABEL_8:

}

+ (id)recursiveDescription
{
  return +[UIViewController _allDescriptions](UIViewController, "_allDescriptions");
}

- (id)_recursiveDescriptionWithInset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@    "), v4));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "_recursiveDescriptionWithInset:", v6));
        objc_msgSend(v5, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController description](self, "description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ view:%@"), v4, v13, v15));

  if (objc_msgSend(v5, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n")));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v16, v17));

  }
  else
  {
    v18 = v16;
  }

  return v18;
}

- (id)recursiveDescription
{
  return -[UIViewController _recursiveDescriptionWithInset:](self, "_recursiveDescriptionWithInset:", &stru_1001B2BC0);
}

@end
