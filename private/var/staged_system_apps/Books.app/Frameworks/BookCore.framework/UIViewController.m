@implementation UIViewController

- (unint64_t)bc_currentLifeCycleState
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(self, off_308310);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (void)bc_setCurrentLifeCycleState:(unint64_t)a3
{
  NSString *v5;
  const void *v6;
  void *v7;
  id v8;

  v5 = NSStringFromSelector("bc_currentLifeCycleState");
  v8 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[UIViewController willChangeValueForKey:](self, "willChangeValueForKey:", v8);
  v6 = off_308310;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(self, v6, v7, (char *)&dword_0 + 1);

  -[UIViewController didChangeValueForKey:](self, "didChangeValueForKey:", v8);
}

- (BOOL)bc_analyticsVisibility
{
  id AssociatedObject;
  void *v4;
  unsigned __int8 v5;

  AssociatedObject = objc_getAssociatedObject(self, off_308318);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = &__kCFBooleanFalse;
    objc_setAssociatedObject(self, off_308318, &__kCFBooleanFalse, (char *)&dword_0 + 1);
  }
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)bc_analyticsVisibilityUpdateSubtree
{
  -[UIViewController _bc_analyticsUpdateVisibilityOfSelf](self, "_bc_analyticsUpdateVisibilityOfSelf");
  -[UIViewController _bc_analyticsUpdateVisibilityOfDescendants](self, "_bc_analyticsUpdateVisibilityOfDescendants");
}

- (void)bc_analyticsVisibilitySubtreeWillDisappear
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
  objc_msgSend(v3, "bc_analyticsVisibilitySubtreeWillDisappear");
  if (-[UIViewController bc_analyticsVisibility](self, "bc_analyticsVisibility")
    && !-[UIViewController _bc_analyticsNotifiedWillDisappear](self, "_bc_analyticsNotifiedWillDisappear"))
  {
    -[UIViewController _setNotifiedAnalyticsVisibilityWillDisappear:](self, "_setNotifiedAnalyticsVisibilityWillDisappear:", 1);
    -[UIViewController bc_analyticsVisibilityWillDisappear](self, "bc_analyticsVisibilityWillDisappear");
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "bc_analyticsVisibilitySubtreeWillDisappear");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)bc_analyticsVisibilitySubtreeDidDisappear
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  -[UIViewController _bc_analyticsSetVisibility:](self, "_bc_analyticsSetVisibility:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
  objc_msgSend(v3, "bc_analyticsVisibilitySubtreeDidDisappear");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "bc_analyticsVisibilitySubtreeDidDisappear");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)bc_analyticsSubtreeForceEndSession
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  -[UIViewController bc_analyticsForceEndSession](self, "bc_analyticsForceEndSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
  objc_msgSend(v3, "bc_analyticsSubtreeForceEndSession");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "bc_analyticsSubtreeForceEndSession");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenSubtreePresented
{
  id v3;
  void *v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[UIViewController bc_analyticsVisibilityIsObscuredWhenPresented](self, "bc_analyticsVisibilityIsObscuredWhenPresented"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "bc_analyticsVisibilityIsObscuredWhenSubtreePresented") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return (char)v3;
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  return 1;
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  return 1;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 0;
}

- (void)bc_analyticsVisibilityDidAppear
{
  -[UIViewController bc_setCurrentLifeCycleState:](self, "bc_setCurrentLifeCycleState:", 1);
}

- (void)bc_analyticsVisibilityWillDisappear
{
  -[UIViewController bc_setCurrentLifeCycleState:](self, "bc_setCurrentLifeCycleState:", 2);
}

- (void)bc_analyticsVisibilityDidDisappear
{
  -[UIViewController bc_setCurrentLifeCycleState:](self, "bc_setCurrentLifeCycleState:", 3);
}

- (void)_bc_analyticsSetVisibility:(BOOL)a3
{
  _BOOL8 v3;
  const void *v5;
  void *v6;

  v3 = a3;
  if (-[UIViewController bc_analyticsVisibility](self, "bc_analyticsVisibility") != a3)
  {
    v5 = off_308318;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_setAssociatedObject(self, v5, v6, (char *)&dword_0 + 1);

    if (v3)
    {
      -[UIViewController _setNotifiedAnalyticsVisibilityWillDisappear:](self, "_setNotifiedAnalyticsVisibilityWillDisappear:", 0);
      -[UIViewController bc_analyticsVisibilityDidAppear](self, "bc_analyticsVisibilityDidAppear");
    }
    else
    {
      -[UIViewController bc_analyticsVisibilityDidDisappear](self, "bc_analyticsVisibilityDidDisappear");
    }
  }
}

- (BOOL)_bc_analyticsNotifiedWillDisappear
{
  id AssociatedObject;
  void *v4;
  unsigned __int8 v5;

  AssociatedObject = objc_getAssociatedObject(self, off_308320);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = &__kCFBooleanFalse;
    objc_setAssociatedObject(self, off_308320, &__kCFBooleanFalse, (char *)&dword_0 + 1);
  }
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)_setNotifiedAnalyticsVisibilityWillDisappear:(BOOL)a3
{
  const void *v4;
  id v5;

  v4 = off_308320;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, v4, v5, (char *)&dword_0 + 1);

}

- (BOOL)_bc_analyticsComputeVisibility
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v9;
  UIViewController *v10;
  void *v11;
  UIViewController *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (!v4
    || (objc_msgSend(v3, "isHidden") & 1) != 0
    || !-[UIViewController bc_analyticsVisibilityOfSelf](self, "bc_analyticsVisibilityOfSelf"))
  {
    goto LABEL_9;
  }
  v5 = -[UIViewController _bc_analyticsIsObscuredByPresentedViewController](self, "_bc_analyticsIsObscuredByPresentedViewController");

  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
    v4 = v7;
    if (!v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
      v10 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));

      if (v10 == self)
      {
        v6 = 1;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
        v12 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootViewController"));

        v6 = v12 == self;
      }
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "bc_analyticsVisibilityOfChild:", self))
    {
      v6 = objc_msgSend(v4, "_bc_analyticsComputeVisibility");
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (BOOL)_bc_analyticsIsObscuredByPresentedViewController
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController _bc_analyticsAncestorPresentedViewController](self, "_bc_analyticsAncestorPresentedViewController"));
  v4 = objc_msgSend(v3, "bc_analyticsVisibilityIsObscuredWhenPresented");

  return v4;
}

- (id)_bc_analyticsAncestorPresentedViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_bc_analyticsAncestorPresentedViewController"));

  }
  return v4;
}

- (void)_bc_analyticsUpdateVisibilityOfSelf
{
  -[UIViewController _bc_analyticsSetVisibility:](self, "_bc_analyticsSetVisibility:", -[UIViewController _bc_analyticsComputeVisibility](self, "_bc_analyticsComputeVisibility"));
}

- (void)_bc_analyticsUpdateVisibilityOfSelfWithParent:(id)a3 parentVisibility:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (a4 && objc_msgSend(a3, "bc_analyticsVisibilityOfChild:", self))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self, "viewIfLoaded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    if (v6
      && (objc_msgSend(v5, "isHidden") & 1) == 0
      && -[UIViewController bc_analyticsVisibilityOfSelf](self, "bc_analyticsVisibilityOfSelf"))
    {
      v7 = -[UIViewController _bc_analyticsIsObscuredByPresentedViewController](self, "_bc_analyticsIsObscuredByPresentedViewController") ^ 1;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  -[UIViewController _bc_analyticsSetVisibility:](self, "_bc_analyticsSetVisibility:", v7);
}

- (void)_bc_analyticsUpdateVisibilityOfDescendants
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
  objc_msgSend(v3, "bc_analyticsVisibilityUpdateSubtree");
  v4 = -[UIViewController bc_analyticsVisibility](self, "bc_analyticsVisibility");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "_bc_analyticsUpdateVisibilityOfSelfWithParent:parentVisibility:", self, v4);
        objc_msgSend(v10, "_bc_analyticsUpdateVisibilityOfDescendants");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)prepareForTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "prepareForTransition:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)cleanupAfterTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "cleanupAfterTransition:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)IMDeviceOrientation
{
  UIInterfaceOrientation v2;
  void *v3;
  char *v4;

  v2 = -[UIViewController interfaceOrientation](self, "interfaceOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (char *)objc_msgSend(v3, "orientation");

  if ((unint64_t)(v4 - 1) >= 4)
    return v2;
  else
    return (int64_t)v4;
}

- (BOOL)bc_isPresentedInCardViewController
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v3 = objc_msgSend(v2, "bc_isPresentedInCardViewController");

  return v3;
}

- (BOOL)isSupportedInterfaceOrientation:(int64_t)a3
{
  char v3;
  UIInterfaceOrientationMask v4;

  v3 = a3;
  v4 = -[UIViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations");
  return (v4 & (1 << v3)) != 0 || v4 == 0;
}

- (BOOL)_overridesShouldAutorotate
{
  uint64_t v3;
  objc_class *v4;
  Method InstanceMethod;
  uint64_t v6;
  objc_class *v7;

  if ((objc_opt_respondsToSelector(self, "shouldAutorotate") & 1) == 0)
    return 0;
  v4 = (objc_class *)objc_opt_class(self, v3);
  InstanceMethod = class_getInstanceMethod(v4, "shouldAutorotate");
  v7 = (objc_class *)objc_opt_class(UIViewController, v6);
  return InstanceMethod != class_getInstanceMethod(v7, "shouldAutorotate");
}

- (BOOL)_overridesSupportedInterfaceOrientations
{
  uint64_t v3;
  objc_class *v4;
  Method InstanceMethod;
  uint64_t v6;
  objc_class *v7;

  if ((objc_opt_respondsToSelector(self, "supportedInterfaceOrientations") & 1) == 0)
    return 0;
  v4 = (objc_class *)objc_opt_class(self, v3);
  InstanceMethod = class_getInstanceMethod(v4, "supportedInterfaceOrientations");
  v7 = (objc_class *)objc_opt_class(UIViewController, v6);
  return InstanceMethod != class_getInstanceMethod(v7, "supportedInterfaceOrientations");
}

- (BOOL)usesBrightonAutorotationAPI
{
  if (-[UIViewController _overridesShouldAutorotate](self, "_overridesShouldAutorotate"))
    return 1;
  else
    return -[UIViewController _overridesSupportedInterfaceOrientations](self, "_overridesSupportedInterfaceOrientations");
}

- (int64_t)preferredInterfaceOrientationGivenOrientation:(int64_t)a3
{
  if (!-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:"))
  {
    a3 = -[UIViewController IMDeviceOrientation](self, "IMDeviceOrientation");
    if (!-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:", a3))
    {
      a3 = 1;
      if (!-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:", 1))
      {
        a3 = 3;
        if (!-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:", 3))
        {
          a3 = 4;
          if (!-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:", 4))
          {
            if (-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:", 2))
              return 2;
            else
              return 1;
          }
        }
      }
    }
  }
  return a3;
}

- (void)refreshStatusBarAppearance
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  objc_msgSend(v3, "setNeedsStatusBarAppearanceUpdate");

}

- (id)im_recursiveDescriptionVisibleTree:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5D1BC;
  v4[3] = &unk_28DD28;
  v5 = a3;
  return (id)objc_claimAutoreleasedReturnValue(-[UIViewController im_recursiveDescriptionChildrenBlock:](self, "im_recursiveDescriptionChildrenBlock:", v4));
}

- (id)recursiveDescription
{
  return -[UIViewController im_recursiveDescriptionVisibleTree:](self, "im_recursiveDescriptionVisibleTree:", 0);
}

- (id)rasterizedImage
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGContextRef CurrentContext;
  void *v7;
  void *v8;
  UIImage *ImageFromCurrentImageContext;
  void *v10;
  CGSize v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v12.width = v4;
  v12.height = v5;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);

  CurrentContext = UIGraphicsGetCurrentContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "renderInContext:", CurrentContext);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v10;
}

- (BOOL)im_hasValidWidthAndHeightTraitCollection
{
  void *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](self, "traitCollection"));
  v3 = (char *)objc_msgSend(v2, "horizontalSizeClass");
  v4 = (char *)objc_msgSend(v2, "horizontalSizeClass");
  v5 = (char *)objc_msgSend(v2, "verticalSizeClass");
  v6 = (char *)objc_msgSend(v2, "verticalSizeClass");
  v7 = (v3 == (_BYTE *)&dword_0 + 1 || v4 == (_BYTE *)&dword_0 + 2)
    && (v5 == (_BYTE *)&dword_0 + 1 || v6 == (_BYTE *)&dword_0 + 2);

  return v7;
}

- (BOOL)im_isCompactWidth
{
  void *v3;
  char *v4;
  char *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](self, "traitCollection"));
  v4 = (char *)objc_msgSend(v3, "horizontalSizeClass");
  v5 = (char *)objc_msgSend(v3, "horizontalSizeClass");
  if (v4 != (_BYTE *)&dword_0 + 1 && v5 != (_BYTE *)&dword_0 + 2)
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 175, (uint64_t)"-[UIViewController(IMAdditions) im_isCompactWidth]", (uint64_t)"NO", CFSTR("<%@: %p> has no trait information."), v9, v10, v11, (uint64_t)v8);

  }
  return v4 == (_BYTE *)&dword_0 + 1;
}

- (BOOL)im_isCompactHeight
{
  void *v3;
  char *v4;
  char *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](self, "traitCollection"));
  v4 = (char *)objc_msgSend(v3, "verticalSizeClass");
  v5 = (char *)objc_msgSend(v3, "verticalSizeClass");
  if (v4 != (_BYTE *)&dword_0 + 1 && v5 != (_BYTE *)&dword_0 + 2)
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 195, (uint64_t)"-[UIViewController(IMAdditions) im_isCompactHeight]", (uint64_t)"NO", CFSTR("<%@: %p> has no trait information."), v9, v10, v11, (uint64_t)v8);

  }
  return v4 == (_BYTE *)&dword_0 + 1;
}

- (void)im_dismissAnimated:(BOOL)a3 immediate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  UIViewController *v8;
  id v9;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController", a3, a4));

  if (v6)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
    objc_msgSend(v9, "im_dismissChildViewController:animated:", self, v4);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));

    if (v8 == self)
      -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, 0);
  }
}

- (void)im_dismissAnimated:(BOOL)a3
{
  -[UIViewController im_dismissAnimated:immediate:](self, "im_dismissAnimated:immediate:", a3, 0);
}

- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  -[UIViewController im_dismissAnimated:](self, "im_dismissAnimated:", a4);
}

- (id)bc_contextualPresentingViewController
{
  void *v3;
  UIViewController *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  if (v3
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"))) != 0)
  {
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bc_contextualPresentingViewController"));

  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (id)bc_contextualPresentedViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_contextualPresentingViewController](self, "bc_contextualPresentingViewController"));
  v5 = v4;
  if (v3)
  {
    if (objc_msgSend(v4, "im_isAncestorOfChildViewController:", v3))
      v6 = v3;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)bc_descendentPresentedViewController
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  v4 = v3;
  if (v3)
  {
    if (-[UIViewController im_isAncestorOfChildViewController:](self, "im_isAncestorOfChildViewController:", v3))
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (id)bc_childPresentedViewController
{
  void *v3;
  UIViewController *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));
  if (v4 == self)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)im_isAncestorOfChildViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  BOOL v6;
  void *v7;
  void *v8;
  UIViewController *v9;
  UIViewController *v10;

  v4 = (UIViewController *)a3;
  v5 = v4;
  v6 = 0;
  if (v4 != self && v4)
  {
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v5, "parentViewController"));
      v8 = v7;
      v9 = v7
         ? (UIViewController *)v7
         : (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v5, "presentingViewController"));
      v10 = v9;

      if (v10 == self)
        break;

      v5 = v10;
      if (!v10)
      {
        v6 = 0;
        goto LABEL_10;
      }
    }

    v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)im_childValueForKey:(id)a3 conformingToProtocol:(id)a4 fromViewControllersConformingToProtocol:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v10))
  {
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController valueForKey:](self, "valueForKey:", v8));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        if ((objc_msgSend(v16, "conformsToProtocol:", v9) & 1) != 0)
          break;
        if (v13 == (id)++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v17 = v16;

      if (v17)
        goto LABEL_22;
    }
    else
    {
LABEL_10:

    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childViewControllersForProtocolConformance](self, "bc_childViewControllersForProtocolConformance", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
LABEL_14:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v21)
        objc_enumerationMutation(v18);
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "im_childValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", v8, v9, v10));
      if (v23)
        break;
      if (v20 == (id)++v22)
      {
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v20)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", v8, v9, v10));
  }
  v17 = (id)v23;

LABEL_22:
  return v17;
}

- (id)im_ancestorValueForKey:(id)a3 conformingToProtocol:(id)a4 fromViewControllersConformingToProtocol:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v10))
  {
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController valueForKey:](self, "valueForKey:", v8));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        if ((objc_msgSend(v16, "conformsToProtocol:", v9, (_QWORD)v21) & 1) != 0)
          break;
        if (v13 == (id)++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v17 = v16;

      if (v17)
        goto LABEL_14;
    }
    else
    {
LABEL_10:

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController", (_QWORD)v21));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", v8, v9, v10));

  if (!v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", v8, v9, v10));

  }
LABEL_14:

  return v17;
}

- (id)im_ancestorViewControllerConformingToProtocol:(id)a3
{
  return -[UIViewController im_ancestorViewControllerConformingToProtocol:includePresenting:](self, "im_ancestorViewControllerConformingToProtocol:includePresenting:", a3, 1);
}

- (id)im_ancestorViewControllerConformingToProtocol:(id)a3 includePresenting:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  UIViewController *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = a4;
  v6 = a3;
  if (-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v6))
  {
    v7 = self;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
    if (v8)
    {
      v9 = v8;
      v10 = v6;
      v11 = v4;
    }
    else
    {
      if (!v4
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"))) == 0)
      {
        v7 = 0;
        goto LABEL_10;
      }
      v9 = v8;
      v10 = v6;
      v11 = 1;
    }
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "im_ancestorViewControllerConformingToProtocol:includePresenting:", v10, v11));

  }
LABEL_10:

  return v7;
}

- (id)im_ancestorConformingToProtocol:(id)a3
{
  id v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIViewController *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  UIViewController *v23;
  id v24;

  v4 = a3;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v5, "parentViewController"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v5, "presentingViewController"));
  v9 = v8;

  v10 = 0;
  if (v5)
  {
    do
    {
      if (-[UIViewController conformsToProtocol:](v5, "conformsToProtocol:", v4))
      {
        v23 = v5;
        v20 = v23;
        goto LABEL_21;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](v5, "viewIfLoaded"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](v5, "viewIfLoaded"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));

        v10 = (void *)v14;
      }
      v15 = v9;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v15, "parentViewController"));
      v17 = v16;
      if (v16)
        v18 = v16;
      else
        v18 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v15, "presentingViewController"));
      v9 = v18;

      v5 = v15;
    }
    while (v15);
    if (v10)
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "im_ancestorConformingToProtocol:", v4));
      if (v19)
      {
        v20 = (id)v19;
        goto LABEL_20;
      }
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));

  if (objc_msgSend(v22, "conformsToProtocol:", v4))
    v20 = v22;
  else
    v20 = 0;

LABEL_20:
  v23 = 0;
LABEL_21:
  v24 = v20;

  return v24;
}

- (id)im_ancestorFlowControllerConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:](self, "im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", CFSTR("flowControllers"), v4, &OBJC_PROTOCOL___IMFlowControllerHosting));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self, "viewIfLoaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v10 = objc_opt_class(NSObject);
    v11 = BUDynamicCast(v10, v9);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (objc_msgSend(v46, "conformsToProtocol:", &OBJC_PROTOCOL___IMFlowControllerHosting))
    {
      v42 = v8;
      v44 = v9;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("flowControllers")));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v56;
LABEL_5:
        v16 = v7;
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v56 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v17);
          if ((objc_msgSend(v18, "conformsToProtocol:", v4) & 1) != 0)
            break;
          if (v14 == (id)++v17)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
            v7 = v16;
            if (v14)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v5 = v18;

        v7 = v16;
        v8 = v42;
        v9 = v44;
        if (v5)
          goto LABEL_28;
      }
      else
      {
LABEL_11:

        v8 = v42;
        v9 = v44;
      }
    }
    v19 = objc_opt_class(_BCWindowScene);
    v20 = BUDynamicCast(v19, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "controller"));
    v23 = objc_opt_class(NSObject);
    v24 = BUDynamicCast(v23, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (objc_msgSend(v25, "conformsToProtocol:", &OBJC_PROTOCOL___IMFlowControllerHosting))
    {
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", CFSTR("flowControllers")));
      v5 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v5)
      {
        v43 = v7;
        v45 = v9;
        v27 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v27)
              objc_enumerationMutation(v26);
            v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v29, "conformsToProtocol:", v4))
            {
              v5 = v29;
              goto LABEL_25;
            }
          }
          v5 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v5)
            continue;
          break;
        }
LABEL_25:
        v7 = v43;
        v9 = v45;
      }

    }
    else
    {
      v5 = 0;
    }

LABEL_28:
    if (!v5)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "delegate"));

      v32 = objc_opt_class(NSObject);
      v33 = BUDynamicCast(v32, v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      if (objc_msgSend(v34, "conformsToProtocol:", &OBJC_PROTOCOL___IMFlowControllerHosting))
      {
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKey:", CFSTR("flowControllers")));
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v48;
          while (2)
          {
            for (j = 0; j != v37; j = (char *)j + 1)
            {
              if (*(_QWORD *)v48 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v40, "conformsToProtocol:", v4))
              {
                v5 = v40;
                goto LABEL_41;
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            if (v37)
              continue;
            break;
          }
        }
        v5 = 0;
LABEL_41:

      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

- (BOOL)im_firstVisibleChildValidateWithItem:(id)a3
{
  return 1;
}

- (id)im_childFlowControllerConformingToProtocol:(id)a3
{
  return -[UIViewController im_childValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:](self, "im_childValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", CFSTR("flowControllers"), a3, &OBJC_PROTOCOL___IMFlowControllerHosting);
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3 includePresented:(BOOL)a4
{
  return -[UIViewController im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:](self, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:", a3, 0, a4, 0);
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3 stopIfDescendentConformsToProtocol:(id)a4 includePresented:(BOOL)a5
{
  return -[UIViewController im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:](self, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:", a3, 0, a5, 0);
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3 stopIfDescendentConformsToProtocol:(id)a4 includePresented:(BOOL)a5 validateItem:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  UIViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11 && (-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v11) & 1) != 0)
  {
    v13 = 0;
  }
  else if (!v7
         || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController")), v14, !v14)|| (v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController")), v13 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:", v10, v11, 1, v12)), v15,
             !v13))
  {
    if (!-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v10)
      || v12
      && !-[UIViewController im_firstVisibleChildValidateWithItem:](self, "im_firstVisibleChildValidateWithItem:", v12)
      || (v13 = self) == 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController im_visibleChildViewControllers](self, "im_visibleChildViewControllers", 0));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20), "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:", v10, v11, v7, v12));
            if (v21)
            {
              v13 = (UIViewController *)v21;
              goto LABEL_21;
            }
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v18)
            continue;
          break;
        }
      }
      v13 = 0;
LABEL_21:

    }
  }

  return v13;
}

- (id)bc_firstVisibleChildViewControllerOfClass:(Class)a3 includePresented:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  UIViewController *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a4;
  if (!a4
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController")),
        v7,
        !v7)
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController")),
        v9 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bc_firstVisibleChildViewControllerOfClass:includePresented:", a3, 1)), v8, !v9))
  {
    if ((objc_opt_isKindOfClass(self, a3) & 1) == 0 || (v9 = self) == 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController im_visibleChildViewControllers](self, "im_visibleChildViewControllers", 0));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "bc_firstVisibleChildViewControllerOfClass:includePresented:", a3, v4));
            if (v15)
            {
              v9 = (UIViewController *)v15;
              goto LABEL_16;
            }
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            continue;
          break;
        }
      }
      v9 = 0;
LABEL_16:

    }
  }
  return v9;
}

- (id)bc_deepestVisibleChildViewControllerIncludePresented:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bc_deepestVisibleChildViewControllerIncludePresented:", 1));

      if (v7)
        return v7;
    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController im_visibleChildViewControllers](self, "im_visibleChildViewControllers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "bc_deepestVisibleChildViewControllerIncludePresented:", v3));
        if (v13)
        {
          v7 = (void *)v13;

          return v7;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  return self;
}

+ (id)bc_presentingViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v10, "activationState"))
        {
          v11 = objc_opt_class(UIWindowScene);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windows"));
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v23;
              while (2)
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v23 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
                  if ((objc_msgSend(v18, "isKeyWindow") & 1) != 0)
                  {
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootViewController"));
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bc_deepestPresentedViewController"));

                    goto LABEL_22;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v15)
                  continue;
                break;
              }
            }

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v19 = 0;
    }
    while (v7);
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

- (id)bc_deepestPresentedViewController
{
  void *v3;
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  v4 = self;
  v5 = v4;
  if (v3)
  {
    do
    {
      v6 = v3;

      v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](v6, "presentedViewController"));
      v5 = v6;
    }
    while (v3);
  }
  else
  {
    v6 = v4;
  }
  return v6;
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3
{
  return -[UIViewController im_firstVisibleChildConformingToProtocol:includePresented:](self, "im_firstVisibleChildConformingToProtocol:includePresented:", a3, 1);
}

- (id)im_visibleViewControllersConfirmingToProtocol:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  char v9;

  v4 = a3;
  v9 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5EA64;
  v7[3] = &unk_28DD50;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v8 = v5;
  -[UIViewController __im_enumerateVisibleChildrenConformingToProtocol:stop:block:](self, "__im_enumerateVisibleChildrenConformingToProtocol:stop:block:", v4, &v9, v7);

  return v5;
}

- (void)im_enumerateVisibleChildrenConformingToProtocol:(id)a3 block:(id)a4
{
  char v4;

  if (a4)
  {
    v4 = 0;
    -[UIViewController __im_enumerateVisibleChildrenConformingToProtocol:stop:block:](self, "__im_enumerateVisibleChildrenConformingToProtocol:stop:block:", a3, &v4, a4);
  }
}

- (void)im_enumerateChildrenConformingToProtocol:(id)a3 block:(id)a4
{
  char v4;

  if (a4)
  {
    v4 = 0;
    -[UIViewController __im_enumerateChildrenConformingToProtocol:stop:block:](self, "__im_enumerateChildrenConformingToProtocol:stop:block:", a3, &v4, a4);
  }
}

- (void)__im_enumerateVisibleChildrenConformingToProtocol:(id)a3 stop:(BOOL *)a4 block:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, UIViewController *, BOOL *);
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v8 = a3;
  v12 = (void (**)(id, UIViewController *, BOOL *))a5;
  if (a4)
  {
    if (!v8)
    {
LABEL_4:
      v12[2](v12, self, a4);
      goto LABEL_5;
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 652, (uint64_t)"-[UIViewController(IMAdditions) __im_enumerateVisibleChildrenConformingToProtocol:stop:block:]", (uint64_t)"stop", 0, v9, v10, v11, v19);
    if (!v8)
      goto LABEL_4;
  }
  if (-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v8))
    goto LABEL_4;
LABEL_5:
  if (!*a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
    objc_msgSend(v13, "__im_enumerateVisibleChildrenConformingToProtocol:stop:block:", v8, a4, v12);

    if (!*a4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController im_visibleChildViewControllers](self, "im_visibleChildViewControllers", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
LABEL_9:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18), "__im_enumerateVisibleChildrenConformingToProtocol:stop:block:", v8, a4, v12);
          if (*a4)
            break;
          if (v16 == (id)++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v16)
              goto LABEL_9;
            break;
          }
        }
      }

    }
  }

}

- (id)bc_ancestorFullScreenPresentingViewController
{
  void *v2;
  char *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
  v3 = (char *)objc_msgSend(v2, "modalPresentationStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentingViewController"));

  if (v4 && (unint64_t)(v3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bc_ancestorFullScreenPresentingViewController"));
  else
    v5 = v2;
  v6 = v5;

  return v6;
}

- (void)__im_enumerateChildrenConformingToProtocol:(id)a3 stop:(BOOL *)a4 block:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, UIViewController *, BOOL *);
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v8 = a3;
  v12 = (void (**)(id, UIViewController *, BOOL *))a5;
  if (a4)
  {
    if (!v8)
    {
LABEL_4:
      v12[2](v12, self, a4);
      goto LABEL_5;
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 695, (uint64_t)"-[UIViewController(IMAdditions) __im_enumerateChildrenConformingToProtocol:stop:block:]", (uint64_t)"stop", 0, v9, v10, v11, v19);
    if (!v8)
      goto LABEL_4;
  }
  if (-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", v8))
    goto LABEL_4;
LABEL_5:
  if (!*a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childPresentedViewController](self, "bc_childPresentedViewController"));
    objc_msgSend(v13, "__im_enumerateChildrenConformingToProtocol:stop:block:", v8, a4, v12);

    if (!*a4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childViewControllersForProtocolConformance](self, "bc_childViewControllersForProtocolConformance", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
LABEL_9:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18), "__im_enumerateChildrenConformingToProtocol:stop:block:", v8, a4, v12);
          if (*a4)
            break;
          if (v16 == (id)++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v16)
              goto LABEL_9;
            break;
          }
        }
      }

    }
  }

}

- (void)im_finishOngoingModalTransitionAnimations:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
    if (objc_msgSend(v5, "isBeingDismissed"))
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
      v7 = objc_msgSend(v6, "isBeingPresented");

      if (!v7)
      {
        v4[2](v4);
        goto LABEL_7;
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitionCoordinator"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5EFC4;
    v10[3] = &unk_28DD98;
    v11 = v4;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", &stru_28DD70, v10);

  }
LABEL_7:

}

- (BOOL)bc_isModelTransitioning
{
  unsigned __int8 v3;
  void *v4;

  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed")
    || -[UIViewController isBeingPresented](self, "isBeingPresented"))
  {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentationController](self, "presentationController"));
  if ((objc_opt_respondsToSelector(v4, "_transitioningTo") & 1) != 0
    && (objc_msgSend(v4, "_transitioningTo") & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_opt_respondsToSelector(v4, "_transitioningFrom") & 1) != 0)
  {
    v3 = objc_msgSend(v4, "_transitioningFrom");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)bc_windowForViewController
{
  void *v3;
  void *v4;
  UIViewController *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  UIViewController *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  UIViewController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __int16 v22[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (!v4)
  {
    v5 = self;
    v6 = objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v5, "parentViewController"));
    v7 = objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v5, "presentingViewController"));
    v8 = v6 != 0;
    if (v6 | v7)
    {
      v9 = (void *)v7;
      do
      {
        if (v8)
          v10 = (void *)v6;
        else
          v10 = v9;
        v11 = v10;

        v12 = objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v11, "parentViewController"));
        v13 = objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v11, "presentingViewController"));

        v8 = v12 != 0;
        v9 = (void *)v13;
        v6 = v12;
        v5 = v11;
      }
      while (v12 | v13);
    }
    else
    {
      v11 = v5;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](v11, "viewIfLoaded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));

    if (v4)
    {
      v15 = v11;
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](v11, "presentedViewController"));
      if (v16)
      {
        v17 = (void *)v16;
        do
        {
          v15 = v17;

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](v15, "presentedViewController"));
          v11 = v15;
        }
        while (v17);
      }
      else
      {
        v15 = v11;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](v15, "viewIfLoaded"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));

      if (!v4)
      {
        v19 = BCSceneLog();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22[0] = 0;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "No window in view hierarchy, falling back to use UIApplication keyWindow", (uint8_t *)v22, 2u);
        }

        v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
      }
    }

  }
  return v4;
}

- (void)bc_presentViewController:(id)a3 animated:(BOOL)a4 tintColor:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_windowForViewController](self, "bc_windowForViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tintColor"));
  objc_msgSend(v13, "setTintColor:", v11);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5F35C;
  v18[3] = &unk_28B750;
  v19 = v13;
  v20 = v14;
  v21 = v10;
  v15 = v10;
  v16 = v14;
  v17 = v13;
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, v7, v18);

}

- (id)im_theme
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if ((objc_opt_respondsToSelector(self, "theme") & 1) == 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController theme](self, "theme"))) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
    v5 = v4;
    if (v4)
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_theme"));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierDefaultPageTheme[0]));
    v3 = (void *)v6;

  }
  return v3;
}

- (id)im_bookshelfTheme
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if ((objc_opt_respondsToSelector(self, "theme") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController theme](self, "theme"));
    v4 = objc_opt_class(IMThemeBookshelf);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      if (v3)
        return v3;
    }
    else
    {

    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v6 = v5;
  if (v5)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_bookshelfTheme"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierBookshelfTheme[0]));
  v3 = (void *)v7;

  return v3;
}

- (void)im_notifyThemeDidChange
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[UIViewController im_themeDidChange](self, "im_themeDidChange");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "im_notifyThemeDidChange");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)im_traitCollectionAdjustedForMedusaLevels:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  BOOL v20;
  uint64_t v21;
  CGRect v23;
  CGRect v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "traitCollectionByModifyingTraits:", &stru_28ECB8));
  if (isPad())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_windowForViewController](self, "bc_windowForViewController"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v15, "bounds");
      v24.origin.x = v16;
      v24.origin.y = v17;
      v24.size.width = v18;
      v24.size.height = v19;
      v23.origin.x = v8;
      v23.origin.y = v10;
      v23.size.width = v12;
      v23.size.height = v14;
      v20 = CGRectEqualToRect(v23, v24);

      if (!v20)
      {
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollectionByModifyingTraits:", &stru_28ECD8));

        v4 = (void *)v21;
      }
    }

  }
  return v4;
}

- (void)bc_notifyLightLevelDidChange:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = BUProtocolCast(&OBJC_PROTOCOL___BCLightLevelAware, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "lightLevelDidChange:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v9, "bc_notifyLightLevelDidChange:", a3);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "bc_notifyLightLevelDidChange:", a3);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)setBc_engagementProviderSource:(id)a3
{
  objc_setAssociatedObject(self, off_309838, a3, 0);
}

- (BCEngagementProviderSource)bc_engagementProviderSource
{
  return (BCEngagementProviderSource *)objc_getAssociatedObject(self, off_309838);
}

- (void)setBc_engagementProvider:(id)a3
{
  objc_setAssociatedObject(self, off_309840, a3, (char *)&dword_0 + 1);
}

- (BCEngagementProvider)bc_engagementProvider
{
  id AssociatedObject;
  void *v4;
  void *v5;

  AssociatedObject = objc_getAssociatedObject(self, off_309840);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_engagementProviderSource](self, "bc_engagementProviderSource"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_engagementProviderSource](self, "bc_engagementProviderSource"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bc_engagementProvider"));

    }
  }
  return (BCEngagementProvider *)v4;
}

- (BCEngagementProvider)bc_effectiveEngagementProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ba_effectiveViewControllerForEngagementProvider](self, "ba_effectiveViewControllerForEngagementProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bc_engagementProvider"));

  return (BCEngagementProvider *)v3;
}

- (id)ba_effectiveViewControllerForEngagementProvider
{
  void *v3;
  UIViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  UIViewController *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_engagementProvider](self, "bc_engagementProvider"));

  if (!v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
      v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_ba_effectiveViewControllerForEngagementProviderIgnoringViewController:", self));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));

      if (!v7)
      {
        v4 = 0;
        return v4;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bc_deepestVisibleChildViewControllerIncludePresented:", 0));
      v10 = v9;
      if (v9)
        v11 = v9;
      else
        v11 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
      v6 = v11;

      v12 = objc_opt_class(BCCardStackViewController);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
      v14 = BUDynamicCast(v12, v13);
      v15 = (UIViewController *)objc_claimAutoreleasedReturnValue(v14);

      if (v15 == self
        || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController topCardSetViewController](v15, "topCardSetViewController")),
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentCardViewController")),
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topContentViewController")),
            v17,
            v16,
            v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_ba_effectiveViewControllerForEngagementProviderIgnoringViewController:", self)), v18, !v4))
      {
        v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_ba_effectiveViewControllerForEngagementProviderIgnoringViewController:", self));
      }

    }
    return v4;
  }
  v4 = self;
  return v4;
}

- (id)_ba_effectiveViewControllerForEngagementProviderIgnoringViewController:(id)a3
{
  id v4;
  uint64_t v5;
  UIViewController *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  void *v13;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  char *v28;
  char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
  {
    v6 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController viewControllers](self, "viewControllers"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController reverseObjectEnumerator](v6, "reverseObjectEnumerator", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bc_engagementProvider"));

          if (v12 != v4 && v13 != 0)
          {
            v27 = v12;
            goto LABEL_30;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }
    goto LABEL_22;
  }
  v15 = objc_opt_class(BCCardSetViewController);
  if ((objc_opt_isKindOfClass(self, v15) & 1) == 0)
  {
LABEL_32:
    v27 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController ba_effectiveViewControllerForEngagementProvider](self, "ba_effectiveViewControllerForEngagementProvider"));
    goto LABEL_33;
  }
  v6 = self;
  v16 = (char *)-[UIViewController lastNavigationType](v6, "lastNavigationType");
  if (!v16)
  {
    v27 = 0;
    goto LABEL_31;
  }
  v17 = v16;
  if (v16 != (_BYTE *)&dword_0 + 1)
  {
    v28 = (char *)-[UIViewController focusedIndex](v6, "focusedIndex");
    if (v17 == (_BYTE *)&dword_0 + 2)
      v29 = v28 + 1;
    else
      v29 = v28 - 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController cardViewControllerAtIndex:](v6, "cardViewControllerAtIndex:", v29));
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topContentViewController"));
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bc_engagementProvider"));

    if (v27)
    {
      v24 = v24;
      v27 = v24;
    }
    goto LABEL_29;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController cardStackViewController](v6, "cardStackViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
  v19 = (char *)objc_msgSend(v18, "indexOfObject:", v6);

  if (v19)
  {
    v20 = objc_opt_class(BCCardSetViewController);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v19 - 1));
    v23 = BUDynamicCast(v20, v22);
    v24 = (id)objc_claimAutoreleasedReturnValue(v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentCardViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topContentViewController"));

    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bc_engagementProvider"));
    if (v27)
      v27 = v26;

LABEL_29:
    goto LABEL_30;
  }
LABEL_22:
  v27 = 0;
LABEL_30:

LABEL_31:
  if (!v27)
    goto LABEL_32;
LABEL_33:

  return v27;
}

- (CGRect)im_frameEnvironmentBounds
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v4 = v3;
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)im_frameEnvironmentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
    objc_msgSend(v3, "frame");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "bounds");
  }
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)im_frameEnvironmentSafeAreaInsets
{
  void *v3;
  double v4;
  CGFloat top;
  double v6;
  CGFloat left;
  double v8;
  CGFloat bottom;
  double v10;
  CGFloat right;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
    objc_msgSend(v3, "safeAreaInsets");
    top = v4;
    left = v6;
    bottom = v8;
    right = v10;

  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  v12 = top;
  v13 = left;
  v14 = bottom;
  v15 = right;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)ba_setOverrideParentAnalyticsTracker:(id)a3
{
  objc_setAssociatedObject(self, off_309F40, a3, (char *)&dword_0 + 1);
}

- (_TtC13BookAnalytics9BATracker)ba_overrideParentAnalyticsTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_getAssociatedObject(self, off_309F40);
}

- (void)ba_setAnalyticsTracker:(id)a3
{
  objc_setAssociatedObject(self, off_309F48, a3, (char *)&dword_0 + 1);
}

- (_TtC13BookAnalytics9BATracker)ba_analyticsTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_getAssociatedObject(self, off_309F48);
}

- (_TtC13BookAnalytics9BATracker)ba_effectiveAnalyticsTracker
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ba_effectiveViewControllerForAnalyticsTracking](self, "ba_effectiveViewControllerForAnalyticsTracking"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ba_analyticsTracker"));

  return (_TtC13BookAnalytics9BATracker *)v3;
}

- (id)ba_effectiveViewControllerForAnalyticsTracking
{
  NSObject *v2;
  _QWORD *v3;
  dispatch_time_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  _QWORD *v17;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_112EB8;
  v25 = sub_112EC8;
  v26 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_112ED0;
  v18[3] = &unk_28B7E0;
  v20 = &v21;
  v18[4] = self;
  v2 = dispatch_semaphore_create(0);
  v19 = v2;
  v3 = objc_retainBlock(v18);
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v3[2])(v3);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1130BC;
      v16[3] = &unk_28BF90;
      v17 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

    }
  }

  v4 = dispatch_time(0, 300000000);
  if (dispatch_semaphore_wait(v2, v4))
  {
    v5 = BALog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1B76C0(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)_ba_effectiveViewControllerForAnalyticsTrackingIgnoringViewController:(id)a3
{
  id v4;
  uint64_t v5;
  UIViewController *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  void *v13;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  char *v28;
  char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
  {
    v6 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController viewControllers](self, "viewControllers"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController reverseObjectEnumerator](v6, "reverseObjectEnumerator", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ba_analyticsTracker"));

          if (v12 != v4 && v13 != 0)
          {
            v27 = v12;
            goto LABEL_30;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }
    goto LABEL_22;
  }
  v15 = objc_opt_class(BCCardSetViewController);
  if ((objc_opt_isKindOfClass(self, v15) & 1) == 0)
  {
LABEL_32:
    v27 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController ba_effectiveViewControllerForAnalyticsTracking](self, "ba_effectiveViewControllerForAnalyticsTracking"));
    goto LABEL_33;
  }
  v6 = self;
  v16 = (char *)-[UIViewController lastNavigationType](v6, "lastNavigationType");
  if (!v16)
  {
    v27 = 0;
    goto LABEL_31;
  }
  v17 = v16;
  if (v16 != (_BYTE *)&dword_0 + 1)
  {
    v28 = (char *)-[UIViewController focusedIndex](v6, "focusedIndex");
    if (v17 == (_BYTE *)&dword_0 + 2)
      v29 = v28 + 1;
    else
      v29 = v28 - 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController cardViewControllerAtIndex:](v6, "cardViewControllerAtIndex:", v29));
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topContentViewController"));
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ba_analyticsTracker"));

    if (v27)
    {
      v24 = v24;
      v27 = v24;
    }
    goto LABEL_29;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController cardStackViewController](v6, "cardStackViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
  v19 = (char *)objc_msgSend(v18, "indexOfObject:", v6);

  if (v19)
  {
    v20 = objc_opt_class(BCCardSetViewController);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v19 - 1));
    v23 = BUDynamicCast(v20, v22);
    v24 = (id)objc_claimAutoreleasedReturnValue(v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentCardViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topContentViewController"));

    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ba_analyticsTracker"));
    if (v27)
      v27 = v26;

LABEL_29:
    goto LABEL_30;
  }
LABEL_22:
  v27 = 0;
LABEL_30:

LABEL_31:
  if (!v27)
    goto LABEL_32;
LABEL_33:

  return v27;
}

- (id)ba_setupNewAnalyticsTrackerWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ba_analyticsTracker](self, "ba_analyticsTracker"));
  if (v5)
  {
    v6 = BALog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "\"ba_setupAnalyticsTrackerWithName: replacing existing tracker: %@ with: %@\", (uint8_t *)&v21, 0x16u);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ba_overrideParentAnalyticsTracker](self, "ba_overrideParentAnalyticsTracker"));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    if (!v9)
    {
      v10 = BALog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1B76F4(v11, v12, v13, v14, v15, v16, v17, v18);

      v9 = 0;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chainWithName:", v4));

  -[UIViewController ba_setAnalyticsTracker:](self, "ba_setAnalyticsTracker:", v19);
  return v19;
}

- (id)bc_childViewControllerForNavBarVisibility
{
  return 0;
}

- (id)bc_overrideAncestorViewControllerForNavBarVisibility
{
  return 0;
}

- (id)bc_effectiveViewControllerForNavBarVisibility
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  UIViewController *v7;
  UIViewController *v8;
  UIViewController *v9;
  UIViewController *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  UIViewController *v15;

  v3 = objc_opt_class(UINavigationController);
  v4 = BUDynamicCast(v3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
  v8 = v7;

  v9 = self;
  v10 = v9;
  v11 = (uint64_t)v9;
  if (!v9 || (v11 = (uint64_t)v9, v8 == v9))
  {
LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_childViewControllerForNavBarVisibility](v10, "bc_childViewControllerForNavBarVisibility"));
    v15 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bc_effectiveViewControllerForNavBarVisibility"));

    if (!v15)
      v15 = v10;
    v12 = (void *)v11;
  }
  else
  {
    v12 = v9;
    while (1)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bc_overrideAncestorViewControllerForNavBarVisibility"));
      if (v13)
        break;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parentViewController"));

      if (v11)
      {
        v12 = (void *)v11;
        if ((UIViewController *)v11 != v8)
          continue;
      }
      goto LABEL_10;
    }
    v15 = (UIViewController *)v13;
  }

  return v15;
}

- (BOOL)bc_navBarVisible
{
  id AssociatedObject;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  AssociatedObject = objc_getAssociatedObject(self, &off_2916D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (void)bc_setNavBarVisible:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &off_2916D0, v4, (char *)&dword_0 + 1);

}

- (id)im_ancestorConfigurationConformingToProtocol:(id)a3
{
  return -[UIViewController im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:](self, "im_ancestorValueForKey:conformingToProtocol:fromViewControllersConformingToProtocol:", CFSTR("configurations"), a3, &OBJC_PROTOCOL___IMConfigurationHosting);
}

- (BCCardStackViewController)cardStackViewController
{
  return (BCCardStackViewController *)-[UIViewController bc_ancestorViewControllerOfClass:allowPresentingParent:](self, "bc_ancestorViewControllerOfClass:allowPresentingParent:", objc_opt_class(BCCardStackViewController), 1);
}

- (id)bc_ancestorViewControllerOfClass:(Class)a3 allowPresentingParent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v4 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v8 = (void *)v7;
  if (!v4 || v7)
  {
    if (!v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));

      if (v8 == v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));

        v8 = (void *)v10;
      }
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
  }
  if ((objc_opt_isKindOfClass(v8, a3) & 1) != 0)
    v11 = v8;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bc_ancestorViewControllerOfClass:allowPresentingParent:", a3, v4));
  v12 = v11;

  return v12;
}

- (id)im_childViewControllerForTabBarVisibility
{
  return 0;
}

- (id)im_overrideAncestorViewControllerForTabBarVisibility
{
  return 0;
}

- (id)im_effectiveViewControllerForTabBarVisibility
{
  UIViewController *v2;
  UIViewController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIViewController *v8;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (1)
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_overrideAncestorViewControllerForTabBarVisibility"));
      if (v5)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewController"));

      v4 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v8 = (UIViewController *)v5;

  }
  else
  {
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController im_childViewControllerForTabBarVisibility](v3, "im_childViewControllerForTabBarVisibility"));
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "im_effectiveViewControllerForTabBarVisibility"));

    if (!v8)
      v8 = v3;
  }
  return v8;
}

- (BOOL)im_tabBarVisible
{
  id AssociatedObject;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  AssociatedObject = objc_getAssociatedObject(self, &off_2921C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (void)im_setTabBarVisible:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &off_2921C0, v4, (char *)&dword_0 + 1);

}

- (id)bc_effectiveCardPresentingViewController
{
  UIViewController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_effectiveAncestorOverrideCardPresentingViewController](self, "bc_effectiveAncestorOverrideCardPresentingViewController"));
  if (!v3)
    v3 = self;
  v4 = objc_claimAutoreleasedReturnValue(-[UIViewController bc_childCardPresentingViewController](v3, "bc_childCardPresentingViewController"));
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

- (id)bc_childCardPresentingViewController
{
  return 0;
}

- (id)bc_effectiveAncestorOverrideCardPresentingViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));

    if (!v5)
    {
LABEL_6:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bc_ancestorOverrideCardPresentingViewController](self, "bc_ancestorOverrideCardPresentingViewController"));
      return v7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
  }
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bc_effectiveAncestorOverrideCardPresentingViewController"));

  if (!v7)
    goto LABEL_6;
  return v7;
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  return 0;
}

- (BOOL)bc_alwaysUseCoverTransitionForCardPresenting
{
  return 0;
}

- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void ***v10;
  void *v11;
  UIViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  UIViewController *v20;
  id v21;
  id v22;
  BOOL v23;

  v6 = a4;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_159624;
  v19 = &unk_2902F0;
  v20 = self;
  v21 = a3;
  v23 = v6;
  v22 = a5;
  v8 = v22;
  v9 = v21;
  v10 = objc_retainBlock(&v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController", v16, v17, v18, v19, v20));
  v12 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentingViewController"));

  if (v12 == self)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v6, v10);

  }
  else
  {
    ((void (*)(void ***))v10[2])(v10);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v15, "setAccessibilityElementsHidden:", 1);

}

- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[UIViewController setValue:forKey:](self, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("bc_isPresentingCardStack"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self, "presentingViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  objc_msgSend(v11, "setAccessibilityElementsHidden:", 0);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_15974C;
  v13[3] = &unk_28BF90;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v5, v13);

}

- (BOOL)bc_canCloseAsset
{
  return 0;
}

- (void)bc_closeToAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (void)bc_closeAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (BOOL)bc_isPresentingCardStack
{
  uint64_t v3;
  id AssociatedObject;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  AssociatedObject = objc_getAssociatedObject(self, off_30A938);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)setBc_isPresentingCardStack:(BOOL)a3
{
  const void *v4;
  id v5;

  v4 = off_30A938;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, v4, v5, (char *)&dword_0 + 1);

}

- (void)bc_dismissIfSafeAnimated:(BOOL)a3
{
  UIViewController *v4;

  v4 = self;
  UIViewController.dismissIfSafe(animated:)(a3);

}

@end
