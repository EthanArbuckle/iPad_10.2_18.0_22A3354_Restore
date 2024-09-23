@implementation MainViewControllerContainer

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MainViewControllerContainer;
  -[MainViewControllerContainer viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_autoreleasePoolPush();
  -[MainViewControllerContainer _updateForCurrentTraits](self, "_updateForCurrentTraits");
  -[MainViewControllerContainer setupForViewAppearance](self, "setupForViewAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

  objc_autoreleasePoolPop(v3);
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "shouldPushNextLevelViewControllerWhenTodayIsVisible");

  if ((v4 & 1) != 0
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController")),
        v6 = objc_msgSend(v5, "shouldPushNextLevelViewControllerWhenTodayIsVisible"),
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v8 = objc_msgSend(v7, "disableTodayPushes") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)allowsOverriddenToolbarItems
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "allowsOverriddenToolbarItems");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "allowsOverriddenToolbarItems");

  return v6;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v7 = objc_opt_respondsToSelector(v6, "selectDate:animated:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v8, "selectDate:animated:", v9, v4);

  }
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v13;

  v13 = objc_opt_class(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "horizontalSizeClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "verticalSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p  WidthClass: %ld  HeightClass: %ld  FutureWidthClass: %ld  FutureHeightClass: %ld  Showing %@ %p>"), v13, self, v4, v6, v8, objc_msgSend(v9, "verticalSizeClass"), objc_opt_class(self->_currentChildViewController), self->_currentChildViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return (NSString *)v11;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "allowsOverriddenRightNavigationBarItems");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "allowsOverriddenRightNavigationBarItems");

  return v6;
}

- (MainViewControllerContainer)initWithModel:(id)a3 window:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MainViewControllerContainer;
  return -[MainViewController initWithWindow:model:](&v5, "initWithWindow:model:", a4, a3);
}

- (BOOL)hidesBackButton
{
  return 0;
}

- (void)updatePalette:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v5 = objc_opt_respondsToSelector(v4, "updatePalette:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v6, "updatePalette:", v7);

  }
}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_respondsToSelector(v5, "setShouldRespondToApplicationDidBecomeActiveStateChange:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v7, "setShouldRespondToApplicationDidBecomeActiveStateChange:", v3);

  }
}

- (int)supportedToggleMode
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "supportedToggleMode");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "supportedToggleMode");

  return v6;
}

- (void)updateBackButtonToDate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v5 = objc_opt_respondsToSelector(v4, "updateBackButtonToDate:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v6, "updateBackButtonToDate:", v7);

  }
}

- (BOOL)shouldUpdateOwnBackButtonWhenTopViewController
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "shouldUpdateOwnBackButtonWhenTopViewController");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "shouldUpdateOwnBackButtonWhenTopViewController");

  return v6;
}

- (id)currentChildViewController
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;

  if (!-[MainViewControllerContainer currentChildViewControllerIsLoaded](self, "currentChildViewControllerIsLoaded"))
    -[MainViewControllerContainer _updateForCurrentTraits](self, "_updateForCurrentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllers](self, "childViewControllers"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 >= 2)
  {
    v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllers](self, "childViewControllers"));
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Extra calendar view children detected: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllers](self, "childViewControllers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v9;
}

- (BOOL)currentChildViewControllerIsLoaded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllers](self, "childViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllers](self, "childViewControllers"));
  if (objc_msgSend(v5, "count") && objc_msgSend(v4, "isViewLoaded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v11;

  if ("copy:" == a3 || "paste:" == a3 || "cut:" == a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)MainViewControllerContainer;
    return -[MainViewControllerContainer respondsToSelector:](&v11, "respondsToSelector:", a3);
  }
  else
  {
    v8 = objc_opt_respondsToSelector(UIViewController, a3);
    if ((v8 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
      v10 = -[objc_class instancesRespondToSelector:](-[MainViewControllerContainer childViewControllerClassForTraits:](self, "childViewControllerClassForTraits:", v9), "instancesRespondToSelector:", a3);

      return v10;
    }
  }
}

- (void)_updateForCurrentTraits
{
  void *v3;
  id v4;
  void *v5;
  MainViewController *v6;
  MainViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  MainViewControllerContainer *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));

  if (v3)
  {
    v4 = -[MainViewControllerContainer navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
    v6 = (MainViewController *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer _childViewControllerForTraitCollection:](self, "_childViewControllerForTraitCollection:", v5));

    if (v6)
    {
      v7 = (MainViewController *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer emptyChildViewController](self, "emptyChildViewController"));

      if (v6 != v7)
        goto LABEL_15;
    }
    if (-[MainViewControllerContainer shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported](self, "shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer navigationController](self, "navigationController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));

      v26 = self;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByExcludingObjectsInArray:", v10));

      -[MainViewControllerContainer beginAppearanceTransition:animated:](self, "beginAppearanceTransition:animated:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer navigationController](self, "navigationController"));
      objc_msgSend(v12, "setViewControllers:", v11);

      -[MainViewControllerContainer endAppearanceTransition](self, "endAppearanceTransition");
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reverseObjectEnumerator", 0));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            v18 = objc_opt_class(MainViewControllerContainer);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            {
              v14 = v17;
              goto LABEL_18;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_18:

      objc_msgSend(v14, "setupForViewAppearance");
      v6 = 0;
      goto LABEL_19;
    }
    v19 = objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllerForUnknownTraits](self, "childViewControllerForUnknownTraits"));

    v6 = (MainViewController *)v19;
    if (v19)
    {
LABEL_15:
      if (v6 != self->_currentChildViewController)
      {
        -[MainViewControllerContainer _removeChildViewControllerForCurrentTraits](self, "_removeChildViewControllerForCurrentTraits");
        -[MainViewControllerContainer _addChildViewControllerForCurrentTraits](self, "_addChildViewControllerForCurrentTraits");
        -[MainViewControllerContainer childViewControllerChangedForCurrentTraits](self, "childViewControllerChangedForCurrentTraits");
      }
    }
LABEL_19:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
    -[MainViewController setEkui_futureTraitCollection:](v6, "setEkui_futureTraitCollection:", v20);

  }
}

- (id)_childViewControllerForTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "horizontalSizeClass") == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllerForRegularWidthRegularHeight](self, "childViewControllerForRegularWidthRegularHeight"));
  }
  else if (objc_msgSend(v4, "horizontalSizeClass") == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllerForRegularWidthCompactHeight](self, "childViewControllerForRegularWidthCompactHeight"));
  }
  else if (objc_msgSend(v4, "horizontalSizeClass") == (id)1 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllerForCompactWidthRegularHeight](self, "childViewControllerForCompactWidthRegularHeight"));
  }
  else if (objc_msgSend(v4, "horizontalSizeClass") == (id)1 && objc_msgSend(v4, "verticalSizeClass") == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer childViewControllerForCompactWidthCompactHeight](self, "childViewControllerForCompactWidthCompactHeight"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer emptyChildViewController](self, "emptyChildViewController"));
  }
  v6 = (void *)v5;

  return v6;
}

- (id)emptyChildViewController
{
  MainViewController *emptyChildViewController;
  EmptyMainViewController *v4;
  void *v5;
  void *v6;
  MainViewController *v7;
  MainViewController *v8;

  emptyChildViewController = self->_emptyChildViewController;
  if (!emptyChildViewController)
  {
    v4 = [EmptyMainViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v7 = -[MainViewController initWithWindow:model:](v4, "initWithWindow:model:", v5, v6);
    v8 = self->_emptyChildViewController;
    self->_emptyChildViewController = v7;

    emptyChildViewController = self->_emptyChildViewController;
  }
  return emptyChildViewController;
}

- (void)_removeChildViewControllerForCurrentTraits
{
  MainViewController *currentChildViewController;
  void *v4;

  currentChildViewController = self->_currentChildViewController;
  if (currentChildViewController)
  {
    -[MainViewController willMoveToParentViewController:](currentChildViewController, "willMoveToParentViewController:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self->_currentChildViewController, "view"));
    objc_msgSend(v4, "removeFromSuperview");

    -[MainViewController removeFromParentViewController](self->_currentChildViewController, "removeFromParentViewController");
  }
}

- (void)_addChildViewControllerForCurrentTraits
{
  void *v3;
  MainViewController *v4;
  MainViewController *currentChildViewController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v4 = (MainViewController *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer _childViewControllerForTraitCollection:](self, "_childViewControllerForTraitCollection:", v3));

  if (v4)
  {
    -[MainViewControllerContainer addChildViewController:](self, "addChildViewController:", v4);
    -[MainViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
  }
  currentChildViewController = self->_currentChildViewController;
  self->_currentChildViewController = v4;

}

- (void)setupForViewAppearance
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  MainViewController *currentChildViewController;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer navigationController](self, "navigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    if (v30)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer navigationController](self, "navigationController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
      EKUIPushFallbackSizingContextWithViewHierarchy(v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
    objc_msgSend(v14, "frame");
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self->_currentChildViewController, "view"));
    objc_msgSend(v17, "setFrame:", 0.0, 0.0, v13, v16);

    currentChildViewController = self->_currentChildViewController;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectedDate"));
    -[MainViewController selectDate:animated:](currentChildViewController, "selectDate:animated:", v20, 0);

    -[MainViewControllerContainer setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", -[MainViewController edgesForExtendedLayout](self->_currentChildViewController, "edgesForExtendedLayout"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self->_currentChildViewController, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self->_currentChildViewController, "view"));
      objc_msgSend(v23, "removeFromSuperview");

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self->_currentChildViewController, "view"));
    objc_msgSend(v24, "setAlpha:", 1.0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self->_currentChildViewController, "view"));
    objc_msgSend(v25, "addSubview:", v26);

    if (v30)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer navigationController](self, "navigationController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "window"));
      EKUIPopFallbackSizingContextWithViewHierarchy(v29);

    }
  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  -[MainViewControllerContainer _updateForCurrentTraits](self, "_updateForCurrentTraits");
  v3.receiver = self;
  v3.super_class = (Class)MainViewControllerContainer;
  -[MainViewControllerContainer viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MainViewControllerContainer;
  -[MainViewControllerContainer viewWillDisappear:](&v6, "viewWillDisappear:");
  if (-[MainViewControllerContainer currentChildViewControllerIsLoaded](self, "currentChildViewControllerIsLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "beginAppearanceTransition:animated:", 0, v3);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MainViewControllerContainer;
  -[MainViewControllerContainer viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MainViewControllerContainer setupForViewAppearance](self, "setupForViewAppearance");
}

- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector(self->_currentChildViewController, "performModalDialogsIfNeededWithContinue:") & 1) != 0)
    v5 = -[MainViewController performModalDialogsIfNeededWithContinue:](self->_currentChildViewController, "performModalDialogsIfNeededWithContinue:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MainViewControllerContainer;
  -[MainViewControllerContainer viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (-[MainViewControllerContainer currentChildViewControllerIsLoaded](self, "currentChildViewControllerIsLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v4, "endAppearanceTransition");

  }
}

- (void)setupUIForTraitCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MainViewControllerContainer _updateForCurrentTraits](self, "_updateForCurrentTraits");
  -[MainViewController setupUIForTraitCollection:](self->_currentChildViewController, "setupUIForTraitCollection:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  objc_msgSend(v13, "showViewController:sender:animated:completion:", v12, v11, v6, v10);

}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = objc_msgSend(v2, "presentationStyleOverrideForChildViewControllers");

  return (int64_t)v3;
}

- (id)viewControllerToShowFrom
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllerToShowFrom"));

  return v3;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported
{
  return 0;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  return 0;
}

- (id)childViewControllerForUnknownTraits
{
  return 0;
}

- (id)childViewControllerForCompactWidthCompactHeight
{
  return 0;
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  return 0;
}

- (id)childViewControllerForRegularWidthCompactHeight
{
  return 0;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  return 0;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  return 0;
}

- (id)managedNavigationController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedNavigationController"));

  return v3;
}

- (void)invalidateManagedNavigationController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  objc_msgSend(v2, "invalidateManagedNavigationController");

}

- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = objc_msgSend(v2, "shouldInvalidateManagedNavigationControllerOnPresentationDismissal");

  return v3;
}

- (BOOL)shouldModallyPresentFirstShownViewController
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = objc_msgSend(v2, "shouldModallyPresentFirstShownViewController");

  return v3;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v8 = a4;
  v14 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v12 = objc_opt_respondsToSelector(v11, "showEvent:animated:showMode:context:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v13, "showEvent:animated:showMode:context:", v14, v8, a5, v10);

  }
}

- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController")),
        v9 = objc_opt_respondsToSelector(v8, "selectDate:andTime:animated:"),
        v8,
        (v9 & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v10, "selectDate:andTime:animated:", v11, 1, v5);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v10, "selectDate:animated:", v11, v5);
  }

}

- (BOOL)isDateVisible:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "isDateVisible:", v4);

  return v6;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  objc_msgSend(v6, "currentlyVisibleDateRangeFromStartDate:toEndDate:", a3, a4);

}

- (void)showTodayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  int IsCompactInViewHierarchy;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer _todaysDate](self, "_todaysDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer view](self, "view"));
  IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v5, v6);

  if (IsCompactInViewHierarchy
    && -[MainViewControllerContainer shouldPushNextLevelViewControllerWhenTodayIsVisible](self, "shouldPushNextLevelViewControllerWhenTodayIsVisible")&& -[MainViewControllerContainer isTodayVisible](self, "isTodayVisible"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v8, "setSelectedDate:", v10);

    v9 = -[MainViewControllerContainer pushedNextLevelMainViewControllerContainerAnimated:](self, "pushedNextLevelMainViewControllerContainerAnimated:", v3);
  }
  else
  {
    -[MainViewControllerContainer selectDate:animated:](self, "selectDate:animated:", v10, v3);
  }

}

- (int64_t)intendedSizeClass
{
  return 0;
}

- (id)sceneTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sceneTitle"));

  return v3;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredPreSizeClassTransitionSelectedDate"));

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "mainViewControllerCanChangeSelectedEvent");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "mainViewControllerCanChangeSelectedEvent");

  return v6;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "mainViewControllerCanChangeSelectedDate");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "mainViewControllerCanChangeSelectedDate");

  return v6;
}

- (BOOL)allEventsIndividuallyRepresented:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_respondsToSelector(v5, "allEventsIndividuallyRepresented:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    v8 = objc_msgSend(v7, "allEventsIndividuallyRepresented:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)navigateToNextSelectableItem
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "navigateToNextSelectableItem");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "navigateToNextSelectableItem");

  }
}

- (void)navigateToPreviousSelectableItem
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "navigateToPreviousSelectableItem");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "navigateToPreviousSelectableItem");

  }
}

- (void)showNextOccurrenceOfSelectableItem
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "showNextOccurrenceOfSelectableItem");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "showNextOccurrenceOfSelectableItem");

  }
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "showPreviousOccurrenceOfSelectableItem");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "showPreviousOccurrenceOfSelectableItem");

  }
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_respondsToSelector(v5, "navigateToNextDateComponentUnitAnimated:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v7, "navigateToNextDateComponentUnitAnimated:", v3);

  }
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_respondsToSelector(v5, "navigateToPreviousDateComponentUnitAnimated:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v7, "navigateToPreviousDateComponentUnitAnimated:", v3);

  }
}

- (BOOL)shouldRespondToApplicationDidBecomeActiveStateChange
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "shouldRespondToApplicationDidBecomeActiveStateChange");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "shouldRespondToApplicationDidBecomeActiveStateChange");

  return v6;
}

- (BOOL)isTodayVisible
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "isTodayVisible");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "isTodayVisible");

  return v6;
}

- (id)_todaysDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v7));
  return v8;
}

- (void)showNowAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_respondsToSelector(v5, "showNowAnimated:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v7, "showNowAnimated:", v3);

  }
}

- (void)enableGestureRecognizers
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "enableGestureRecognizers");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "enableGestureRecognizers");

  }
}

- (void)disableGestureRecognizers
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "disableGestureRecognizers");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "disableGestureRecognizers");

  }
}

- (double)leftBarButtonBlankFixedSpaceWidth
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "leftBarButtonBlankFixedSpaceWidth");

  if ((v4 & 1) == 0)
    return 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  objc_msgSend(v5, "leftBarButtonBlankFixedSpaceWidth");
  v7 = v6;

  return v7;
}

- (id)bestDateForNewEvent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "bestDateForNewEvent");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bestDateForNewEvent"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)showEventDetailsWhenNewEventAdded
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "showEventDetailsWhenNewEventAdded");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "showEventDetailsWhenNewEventAdded");

  return v6;
}

- (BOOL)shouldJournalMainViewControllerParent
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "shouldJournalMainViewControllerParent");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "shouldJournalMainViewControllerParent");

  return v6;
}

- (BOOL)shouldAdaptEventViewControllers
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "shouldAdaptEventViewControllers");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "shouldAdaptEventViewControllers");

  return v6;
}

- (id)navigationBarTintColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "navigationBarTintColor");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBarTintColor"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)toolBarTintColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "toolBarTintColor");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toolBarTintColor"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)navigationBarDisplayedDateString
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "navigationBarDisplayedDateString");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBarDisplayedDateString"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)updateNavigationBarDisplayedDateString
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "updateNavigationBarDisplayedDateString");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "updateNavigationBarDisplayedDateString");

  }
}

- (void)invalidateBackButtonDate
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "invalidateBackButtonDate");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v5, "invalidateBackButtonDate");

  }
}

- (id)updateBackButtonWhileTopViewControllerToDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_respondsToSelector(v5, "updateBackButtonWhileTopViewControllerToDate:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updateBackButtonWhileTopViewControllerToDate:", v4));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v4 = objc_opt_respondsToSelector(v3, "isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer currentChildViewController](self, "currentChildViewController"));
  v6 = objc_msgSend(v5, "isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView");

  return v6;
}

- (BOOL)representsDayInViewHierarchy
{
  return 0;
}

- (BOOL)animatingViewTransition
{
  return self->_animatingViewTransition;
}

- (void)setAnimatingViewTransition:(BOOL)a3
{
  self->_animatingViewTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyChildViewController, 0);
  objc_storeStrong((id *)&self->_currentChildViewController, 0);
}

@end
