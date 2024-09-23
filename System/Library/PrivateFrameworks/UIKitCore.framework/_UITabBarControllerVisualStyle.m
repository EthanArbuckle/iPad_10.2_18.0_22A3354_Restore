@implementation _UITabBarControllerVisualStyle

- (_UITabBarControllerVisualStyle)initWithTabBarController:(id)a3
{
  id v4;
  _UITabBarControllerVisualStyle *v5;
  _UITabBarControllerVisualStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITabBarControllerVisualStyle;
  v5 = -[_UITabBarControllerVisualStyle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_tabBarController, v4);

  return v6;
}

- (void)teardown
{
  void *v3;
  UITapGestureRecognizer *backGestureRecognizer;
  UITapGestureRecognizer *selectGestureRecognizer;
  id v6;

  if (self->_backGestureRecognizer)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_containerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeGestureRecognizer:", self->_backGestureRecognizer);
    backGestureRecognizer = self->_backGestureRecognizer;
    self->_backGestureRecognizer = 0;

    objc_msgSend(v6, "removeGestureRecognizer:", self->_selectGestureRecognizer);
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;

  }
}

- (BOOL)wantsDefaultTabBar
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != 6;

  return v4;
}

- (BOOL)supportsShowingMoreItem
{
  return 0;
}

- (BOOL)canDisplayTabBar
{
  return 1;
}

- (BOOL)suppressesEditingUI
{
  return 0;
}

- (int64_t)tabBarPosition
{
  return 0;
}

- (unint64_t)defaultMaxItems
{
  return 0;
}

- (id)tabBarView
{
  id *v2;
  void *v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateTabForChildViewController:(id)a3
{
  -[_UITabBarControllerVisualStyle updateViewControllers:](self, "updateViewControllers:", 0);
}

- (void)updateViewControllerForReselection:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (id)objc_msgSend(v4, "popToRootViewControllerAnimated:", 1);

}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  return (id)objc_msgSend(a3, "_resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem");
}

- (BOOL)shouldEnforceChildSelectionInGroupTabs
{
  return 0;
}

- (BOOL)canDisplaySidebar
{
  return 0;
}

- (BOOL)canToggleSidebar
{
  return 0;
}

- (BOOL)overrideUISplitViewControllerToCompact
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != 6;

  return v4;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v2;
  void *v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_selectedViewControllerInTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  return 4;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return 4;
}

- (int64_t)preferredCenterStatusBarStyle
{
  return 4;
}

- (BOOL)prefersTabBarFocusedOnViewDidLoad
{
  return 0;
}

- (BOOL)removeTabBarFocusedOnViewDidDisappear
{
  return 1;
}

- (BOOL)supportsFocusGestures
{
  return 0;
}

- (BOOL)updatesTabBarFocusHeadingOnChange
{
  return 0;
}

- (unint64_t)tabBarFocusSpeedBumpEdges
{
  return 0;
}

- (int64_t)backGestureRecognizerPressType
{
  return 7;
}

- (void)updateGestureRecognizers
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  UITapGestureRecognizer *backGestureRecognizer;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  void *v9;
  void *v10;
  UITapGestureRecognizer *v11;
  UITapGestureRecognizer *selectGestureRecognizer;
  UITapGestureRecognizer *v13;
  UITapGestureRecognizer *v14;
  UILongPressGestureRecognizer *accessibilityLongPressGestureRecognizer;
  UILongPressGestureRecognizer *v16;
  UILongPressGestureRecognizer *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_UITabBarControllerVisualStyle supportsFocusGestures](self, "supportsFocusGestures");
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  backGestureRecognizer = self->_backGestureRecognizer;
  if (v3)
  {
    if (!backGestureRecognizer)
    {
      v7 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__performBackGesture_);
      v8 = self->_backGestureRecognizer;
      self->_backGestureRecognizer = v7;

      -[UIGestureRecognizer setDelegate:](self->_backGestureRecognizer, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UITabBarControllerVisualStyle backGestureRecognizerPressType](self, "backGestureRecognizerPressType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapGestureRecognizer setAllowedPressTypes:](self->_backGestureRecognizer, "setAllowedPressTypes:", v10);

      objc_msgSend(v5, "addGestureRecognizer:", self->_backGestureRecognizer);
      v11 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__performSelectGesture_);
      selectGestureRecognizer = self->_selectGestureRecognizer;
      self->_selectGestureRecognizer = v11;

      -[UIGestureRecognizer setDelegate:](self->_selectGestureRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer setAllowedPressTypes:](self->_selectGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94B68);
      objc_msgSend(v5, "addGestureRecognizer:", self->_selectGestureRecognizer);
    }
  }
  else if (backGestureRecognizer)
  {
    objc_msgSend(v5, "removeGestureRecognizer:");
    v13 = self->_backGestureRecognizer;
    self->_backGestureRecognizer = 0;

    objc_msgSend(v5, "removeGestureRecognizer:", self->_selectGestureRecognizer);
    v14 = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;

  }
  accessibilityLongPressGestureRecognizer = self->_accessibilityLongPressGestureRecognizer;
  if (accessibilityLongPressGestureRecognizer)
    goto LABEL_10;
  if (dyld_program_sdk_at_least())
  {
    v16 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__accessibilityLongPressChanged_);
    v17 = self->_accessibilityLongPressGestureRecognizer;
    self->_accessibilityLongPressGestureRecognizer = v16;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_accessibilityLongPressGestureRecognizer, "setMinimumPressDuration:", 0.15);
    -[UIGestureRecognizer setDelegate:](self->_accessibilityLongPressGestureRecognizer, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__updateAccessibilityGestureEnableState, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

  }
  accessibilityLongPressGestureRecognizer = self->_accessibilityLongPressGestureRecognizer;
  if (accessibilityLongPressGestureRecognizer)
  {
LABEL_10:
    -[UIGestureRecognizer view](accessibilityLongPressGestureRecognizer, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v20 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _internalTabBar](v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 != v21)
    {
      -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
      v22 = (id *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _internalTabBar](v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addGestureRecognizer:", self->_accessibilityLongPressGestureRecognizer);

    }
  }
  -[_UITabBarControllerVisualStyle _updateAccessibilityGestureEnableState](self, "_updateAccessibilityGestureEnableState");

}

- (BOOL)shouldSuppressPresses:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (void)sendSelectionEventsForControl:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "sendActionsForControlEvents:", 1);
  objc_msgSend(v3, "sendActionsForControlEvents:", 64);

}

- (void)updateFocusForSelectedViewControllerChange
{
  id v2;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setPreferTabBarFocused:", 0);

}

- (BOOL)shouldForgetRememberedFocusItemForSelectedViewController:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = _UIFocusEnvironmentIsAncestorOfEnvironment(v6, v7);
  return (char)v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  int v6;
  void *v7;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if (self->_backGestureRecognizer == v4)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "_isTabBarFocused") ^ 1;
LABEL_6:

    goto LABEL_7;
  }
  if (self->_selectGestureRecognizer == v4)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "_isTabBarFocused");
    goto LABEL_6;
  }
  LOBYTE(v6) = 1;
LABEL_7:

  return v6;
}

- (void)_performBackGesture:(id)a3
{
  id v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performFocusGesture:", 0);

}

- (void)_performSelectGesture:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isTabBarFocused");

  if (v5)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusedView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_UITabBarControllerVisualStyle sendSelectionEventsForControl:](self, "sendSelectionEventsForControl:", v10);
      -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setPreferTabBarFocused:", 0);

      -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsFocusUpdate");

    }
  }
}

- (void)_updateAccessibilityGestureEnableState
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (self->_accessibilityLongPressGestureRecognizer)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isLargeContentViewerEnabled");

    -[UIGestureRecognizer setEnabled:](self->_accessibilityLongPressGestureRecognizer, "setEnabled:", v5);
  }
}

- (void)_accessibilityLongPressChanged:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationInView:", v11);
  objc_msgSend(v11, "_tabBarItemForButtonAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "state");

  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (v7 == 3 && v6)
    {
      -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_tabBarItemClicked:", v6);

    }
    goto LABEL_7;
  }
  if (!v6)
  {
LABEL_7:
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dismissAccessibilityHUD");
    goto LABEL_8;
  }
  +[UIAccessibilityHUDItem HUDItemForTabBarItem:](UIAccessibilityHUDItem, "HUDItemForTabBarItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_showAccessibilityHUDItem:", v8);

LABEL_8:
}

- (void)setBarHidden:(BOOL)a3
{
  -[_UITabBarControllerVisualStyle setBarHidden:animated:](self, "setBarHidden:animated:", a3, 0);
}

- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (self->_barHidden != a3)
  {
    v4 = a3;
    self->_barHidden = a3;
    if (!self->_suppressTabBarControllerNotification)
    {
      v5 = a4;
      -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      if (v4)
      {
        if (v5)
          v7 = 7;
        else
          v7 = 0;
        objc_msgSend(v6, "_hideBarWithTransition:isExplicit:", v7, 1);
      }
      else
      {
        if (v5)
          v8 = 3;
        else
          v8 = 0;
        objc_msgSend(v6, "_showBarWithTransition:isExplicit:", v8, 1);
      }

    }
  }
}

- (void)performWithoutNotifyingTabBarController:(id)a3
{
  BOOL suppressTabBarControllerNotification;

  suppressTabBarControllerNotification = self->_suppressTabBarControllerNotification;
  self->_suppressTabBarControllerNotification = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_suppressTabBarControllerNotification = suppressTabBarControllerNotification;
}

- (BOOL)isTabBarEffectivelyHidden
{
  id *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  double v8;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isHidden");
  else
    v4 = 1;
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 6)
    v7 = v4;
  else
    v7 = 1;
  if (v6 != 6 && (v4 & 1) == 0)
  {
    objc_msgSend(v3, "alpha");
    v7 = v8 == 0.0;
  }

  return v7;
}

- (void)updateTabBarLayout
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v3);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v23, "_expectedSuperviewFollowingAnimation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_19;
  }
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_effectiveTabBarPosition");

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v23, "sizeThatFits:", *MEMORY[0x1E0C9D820], v14);
  if ((unint64_t)(v6 - 3) >= 2)
    v17 = v16;
  else
    v17 = v15;
  v18 = 0.0;
  switch(v6)
  {
    case 0:
    case 1:
      v19 = v12 - v17;
      v12 = v17;
      goto LABEL_15;
    case 2:
      v12 = v17;
      break;
    case 3:
      goto LABEL_13;
    case 4:
      v18 = v10 - v17;
LABEL_13:
      v10 = v17;
      break;
    default:
      v12 = 0.0;
      v10 = 0.0;
      break;
  }
  v19 = 0.0;
LABEL_15:
  -[_UITabBarControllerVisualStyle adjustedTabBarFrame:](self, "adjustedTabBarFrame:", v18, v19, v10, v12);
  objc_msgSend(v23, "setFrame:");
  objc_msgSend(v23, "sizeThatFits:", v13, v14);
  if ((unint64_t)(v6 - 3) >= 2)
    v21 = v22;
  if (v17 != v21)
    -[_UITabBarControllerVisualStyle updateTabBarLayout](self, "updateTabBarLayout");
LABEL_19:

}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGRect v31;
  UIEdgeInsets result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
  v6 = objc_msgSend(WeakRetained, "_effectiveTabBarPosition");

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 2)
    v9 = 1;
  else
    v9 = 4;
  v10 = objc_msgSend(v4, "edgesForExtendedLayout");
  if ((objc_msgSend(v8, "_isTranslucent") & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v4, "extendedLayoutIncludesOpaqueBars");
  objc_msgSend(v8, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || objc_msgSend(v8, "isHidden"))
  {

    v13 = 0.0;
    v14 = 0.0;
    goto LABEL_14;
  }
  v15 = (v10 & v9) != 0;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 & ~objc_msgSend(v16, "_isBarHidden") & v11;

  v14 = 0.0;
  if (v17 != 1)
  {
LABEL_13:
    v13 = 0.0;
    goto LABEL_14;
  }
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v20 = v19;
  if (v6 == 2)
  {
    objc_msgSend(v8, "frame");
    v14 = v20 + CGRectGetMinY(v31);
    goto LABEL_13;
  }
  v25 = v18;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_contentOverlayInsets");
  v13 = v20 - v27;

  objc_msgSend(v8, "bounds");
  if (v29 != v25 || v28 != v20)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_invalidateBarLayout");

  }
LABEL_14:

  v21 = 0.0;
  v22 = 0.0;
  v23 = v14;
  v24 = v13;
  result.right = v22;
  result.bottom = v24;
  result.left = v21;
  result.top = v23;
  return result;
}

- (UIEdgeInsets)additionalContentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)overlayInsetsAdjustment
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)shouldTrackContentScrollView:(id)a3 viewController:(id)a4 tabBarBackgroundRequired:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  int v8;

  v5 = a5;
  if (_UIBarsApplyChromelessEverywhere())
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_msgSend(v7, "_isBarEffectivelyHidden") | v5) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)viewControllerForObservableScrollViewFromViewController:(id)a3
{
  return (id)objc_msgSend(a3, "_viewControllerForObservableScrollView");
}

- (BOOL)isScrollViewObservationInCompatibilityMode
{
  return 0;
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  return 0;
}

- (BOOL)transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  return 0;
}

- (UITabBarController)tabBarController
{
  return (UITabBarController *)objc_loadWeakRetained((id *)&self->_tabBarController);
}

- (BOOL)isBarHidden
{
  return self->_barHidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarController);
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
}

@end
