@implementation _UITabBarControllerVisualStyle_TV

- (void)teardown
{
  void *v3;
  UIGestureRecognizer *touchDetectionGestureRecognizer;
  id v5;

  if (self->_touchDetectionGestureRecognizer)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_containerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeGestureRecognizer:", self->_touchDetectionGestureRecognizer);
    touchDetectionGestureRecognizer = self->_touchDetectionGestureRecognizer;
    self->_touchDetectionGestureRecognizer = 0;

  }
}

- (BOOL)supportsShowingMoreItem
{
  return 0;
}

- (int64_t)tabBarPosition
{
  return 2;
}

- (unint64_t)defaultMaxItems
{
  return 7;
}

- (id)tabBarView
{
  UIView *tabBarContainerView;
  objc_super v4;

  tabBarContainerView = self->_tabBarContainerView;
  if (tabBarContainerView)
    return tabBarContainerView;
  v4.receiver = self;
  v4.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  -[_UITabBarControllerVisualStyle tabBarView](&v4, sel_tabBarView);
  return (id)objc_claimAutoreleasedReturnValue();
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
  id *v13;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v13, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = -[UITabBar initWithFrame:]([UITabBar alloc], "initWithFrame:", v5, v7, v9, v11);
    objc_msgSend(v13, "setTabBar:", v12);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id *v5;
  UIFocusContainerGuide *v6;
  UIFocusContainerGuide *contentFocusContainerGuide;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (!self->_contentFocusContainerGuide)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _internalTabBar](v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(UIFocusContainerGuide);
    contentFocusContainerGuide = self->_contentFocusContainerGuide;
    self->_contentFocusContainerGuide = v6;

    objc_msgSend(v4, "addLayoutGuide:", self->_contentFocusContainerGuide);
    -[UILayoutGuide setIdentifier:](self->_contentFocusContainerGuide, "setIdentifier:", CFSTR("UITabBarControllerFocusContentContainerGuide"));
    v17 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide topAnchor](self->_contentFocusContainerGuide, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    -[UILayoutGuide leadingAnchor](self->_contentFocusContainerGuide, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    -[UILayoutGuide trailingAnchor](self->_contentFocusContainerGuide, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    -[UILayoutGuide bottomAnchor](self->_contentFocusContainerGuide, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v16);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    v7 = objc_msgSend(v8, "isNavigationBarHidden");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v8, "setNavigationBarHidden:animated:", 1, v3);
      v6 = v8;
      *(_BYTE *)&self->_flags |= 1u;
    }
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = a3;
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, v3);
    *(_BYTE *)&self->_flags &= ~1u;

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

- (BOOL)prefersTabBarFocusedOnViewDidLoad
{
  void *v3;
  int v4;

  if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_shouldFocusViewControllerAfterTransition") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)removeTabBarFocusedOnViewDidDisappear
{
  return 0;
}

- (BOOL)supportsFocusGestures
{
  return 1;
}

- (unint64_t)tabBarFocusSpeedBumpEdges
{
  return 4;
}

- (int64_t)backGestureRecognizerPressType
{
  return 5;
}

- (void)updateGestureRecognizers
{
  void *v3;
  void *v4;
  _UITabBarTouchDetectionGestureRecognizer *v5;
  UIGestureRecognizer *touchDetectionGestureRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  -[_UITabBarControllerVisualStyle updateGestureRecognizers](&v7, sel_updateGestureRecognizers);
  if (!self->_touchDetectionGestureRecognizer
    && !-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[UIGestureRecognizer initWithTarget:action:]([_UITabBarTouchDetectionGestureRecognizer alloc], "initWithTarget:action:", self, sel__performTouchDetectionGesture_);
    touchDetectionGestureRecognizer = self->_touchDetectionGestureRecognizer;
    self->_touchDetectionGestureRecognizer = &v5->super;

    -[UIGestureRecognizer setDelegate:](self->_touchDetectionGestureRecognizer, "setDelegate:", self);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_touchDetectionGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](self->_touchDetectionGestureRecognizer, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_touchDetectionGestureRecognizer, "setDelaysTouchesEnded:", 0);
    objc_msgSend(v4, "addGestureRecognizer:", self->_touchDetectionGestureRecognizer);

  }
}

- (void)sendSelectionEventsForControl:(id)a3
{
  objc_msgSend(a3, "sendActionsForControlEvents:", 0x2000);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _UITVScrollViewManager *v19;
  _UITVScrollViewManager *scrollViewManager;
  id v21;

  v21 = a3;
  v6 = a4;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)v7, "_isTabBarFocused");

  LOBYTE(v7) = v8 ^ 1;
  -[_UITabBarControllerVisualStyle_TV _updateOffscreenState:withFocusAnimationCoordinator:](self, "_updateOffscreenState:withFocusAnimationCoordinator:", v8 ^ 1u, v6);

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_observingScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "adjustedContentInset");
  v12 = v11;
  objc_msgSend(v10, "adjustedContentInset");
  if ((v7 & 1) == 0)
  {
    if (v10)
    {
      v14 = v13;
      if (!objc_msgSend(v21, "focusHeading"))
      {
        v15 = -v12;
        v16 = -v14;
        objc_msgSend(v10, "contentOffset");
        if (v18 != v15 || v17 != v16)
        {
          v19 = -[_UITVScrollViewManager initWithScrollView:scrollStyle:]([_UITVScrollViewManager alloc], "initWithScrollView:scrollStyle:", v10, 1);
          scrollViewManager = self->_scrollViewManager;
          self->_scrollViewManager = v19;

          -[_UITVScrollViewManager setDelegate:](self->_scrollViewManager, "setDelegate:", self);
          -[_UITVScrollViewManager setContentOffset:animated:](self->_scrollViewManager, "setContentOffset:animated:", 1, v15, v16);
        }
      }
    }
  }

}

- (void)updateFocusForSelectedViewControllerChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setPreferTabBarFocused:", 1);

  }
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusedView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredFocusedItem:", v7);

}

- (BOOL)shouldForgetRememberedFocusItemForSelectedViewController:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 IsAncestorOfEnvironment;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  v7 = a3;
  IsAncestorOfEnvironment = -[_UITabBarControllerVisualStyle shouldForgetRememberedFocusItemForSelectedViewController:context:](&v13, sel_shouldForgetRememberedFocusItemForSelectedViewController_context_, v7, v6);
  objc_msgSend(v7, "presentedViewController", v13.receiver, v13.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((IsAncestorOfEnvironment & 1) == 0 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "modalPresentationStyle") == 4)
    {
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextFocusedItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v10, v11);

    }
    else
    {
      IsAncestorOfEnvironment = 0;
    }
  }

  return IsAncestorOfEnvironment;
}

- (void)_updateOffscreenState:(BOOL)a3 withFocusAnimationCoordinator:(id)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  UIFocusGuide *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UICubicTimingParameters *v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  double v44;
  UIViewPropertyAnimator *v45;
  uint64_t v46;
  id v47;
  double v48;
  double v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  UIFocusGuide *v64;
  char v65;
  _QWORD v66[4];
  UIFocusGuide *v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  char v75;
  _QWORD v76[4];
  id v77;
  _UITabBarControllerVisualStyle_TV *v78;
  char v79;
  _QWORD v80[4];
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint8_t buf[8];
  _QWORD v87[4];
  _QWORD v88[3];

  v5 = a3;
  v88[1] = *MEMORY[0x1E0C80C00];
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    objc_msgSend(v7, "_observingScrollView");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(v8, "_tvTabBarShouldAutohide");

      if (v11)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v51, OS_LOG_TYPE_FAULT, "You cannot return YES for _tvTabBarShouldAutohide if you also set _observingScrollView. Forcing _tvTabBarShouldAutohide to NO.", buf, 2u);
          }

        }
        else
        {
          v12 = _updateOffscreenState_withFocusAnimationCoordinator____s_category;
          if (!_updateOffscreenState_withFocusAnimationCoordinator____s_category)
          {
            v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v12, (unint64_t *)&_updateOffscreenState_withFocusAnimationCoordinator____s_category);
          }
          v13 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "You cannot return YES for _tvTabBarShouldAutohide if you also set _observingScrollView. Forcing _tvTabBarShouldAutohide to NO.", buf, 2u);
          }
        }
        v5 = 0;
      }
    }
  }
  v14 = v5 & objc_msgSend(v8, "_tvTabBarShouldAutohide");
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_isTabBarOffscreen");

  objc_msgSend(v7, "_setTabBarOffscreen:", v14);
  -[UIView setUserInteractionEnabled:](self->_tabBarContainerView, "setUserInteractionEnabled:", v14 ^ 1);
  if ((v14 ^ 1) == v16)
  {
    -[UITabBarController _internalTabBar]((id *)v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isBarLayoutValid"))
    {
      objc_msgSend(v17, "frame");
      -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v27 = -[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar");
      if (a4 && v27)
      {
        v28 = self->_tabBarOffscreenFocusGuide;
        if (!v28)
        {
          v28 = objc_alloc_init(UIFocusGuide);
          v88[0] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIFocusGuide setPreferredFocusEnvironments:](v28, "setPreferredFocusEnvironments:", v33);

          objc_msgSend(v18, "addLayoutGuide:", v28);
          v56 = (void *)MEMORY[0x1E0D156E0];
          -[UILayoutGuide topAnchor](v28, "topAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "topAnchor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "constraintEqualToAnchor:", v60);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v87[0] = v59;
          -[UILayoutGuide leadingAnchor](v28, "leadingAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "leadingAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "constraintEqualToAnchor:", v57);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v87[1] = v55;
          objc_msgSend(v18, "trailingAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v28, "trailingAnchor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "constraintEqualToAnchor:", v53);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v87[2] = v52;
          -[UILayoutGuide heightAnchor](v28, "heightAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "constraintEqualToConstant:", 1.0);
          v35 = v18;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v87[3] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 4);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "activateConstraints:", v37);

          v18 = v35;
          objc_storeStrong((id *)&self->_tabBarOffscreenFocusGuide, v28);
        }
        v62 = v18;
        if ((_DWORD)v14)
        {
          LODWORD(v29) = 1045220557;
          LODWORD(v30) = 0;
          LODWORD(v31) = 0.25;
          LODWORD(v32) = 1.0;
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v29, v30, v31, v32);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[UICubicTimingParameters initWithCustomCurve:]([UICubicTimingParameters alloc], "initWithCustomCurve:", v38);

          v40 = 0.25;
        }
        else
        {
          v39 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 176.0, 26.0, 0.0, 0.0);
          -[UICubicTimingParameters settlingDuration](v39, "settlingDuration");
          v40 = v44;
        }
        v45 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v39, v40);
        -[UIViewPropertyAnimator _setOptions:](v45, "_setOptions:", 608);
        v46 = MEMORY[0x1E0C809B0];
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke;
        v80[3] = &unk_1E16B20D8;
        v47 = v17;
        v81 = v47;
        v82 = v20;
        v83 = v22;
        v84 = v24;
        v85 = v26;
        -[UIViewPropertyAnimator addAnimations:](v45, "addAnimations:", v80);
        v76[0] = v46;
        v76[1] = 3221225472;
        v76[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_2;
        v76[3] = &unk_1E16C2A08;
        v79 = v14;
        v77 = v47;
        v78 = self;
        -[UIViewPropertyAnimator addCompletion:](v45, "addCompletion:", v76);
        -[UIViewPropertyAnimator startAnimation](v45, "startAnimation");

        v18 = v62;
      }
      else
      {
        objc_msgSend(v7, "navigationController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v7, "navigationController");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isNavigationBarHidden") ^ 1;

        }
        else
        {
          v43 = 0;
        }

        if (v16)
          v48 = 0.0;
        else
          v48 = 1.0;
        objc_msgSend(v17, "setHidden:", 0);
        objc_msgSend(v17, "_setShadowAlpha:", v48);
        objc_msgSend(v17, "_setHidesShadow:", 0);
        if (v43)
          objc_msgSend(v17, "setAlpha:", v48);
        if ((_DWORD)v14)
          v49 = 0.2;
        else
          v49 = 0.4;
        v50 = MEMORY[0x1E0C809B0];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_3;
        v66[3] = &unk_1E16D5BF8;
        v67 = v17;
        v70 = v20;
        v71 = v22;
        v72 = v24;
        v73 = v26;
        v74 = v48;
        v75 = v43;
        v68 = v7;
        v69 = v8;
        v63[0] = v50;
        v63[1] = 3221225472;
        v63[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_4;
        v63[3] = &unk_1E16B7F38;
        v64 = v67;
        v65 = v14;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2052, v66, v63, v49, 0.0);

        v28 = v67;
      }

    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIGestureRecognizer *touchDetectionGestureRecognizer;

  touchDetectionGestureRecognizer = self->_touchDetectionGestureRecognizer;
  if (!touchDetectionGestureRecognizer)
    return 0;
  return touchDetectionGestureRecognizer == a3 || touchDetectionGestureRecognizer == a4;
}

- (void)_performTouchDetectionGesture:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "state");
  if (v6 == 1)
  {
    v7 = 1;
    goto LABEL_5;
  }
  if (v6 != 2)
  {
    v7 = 0;
LABEL_5:
    objc_msgSend(v8, "_setFocusedItemHightlightShouldBeVisible:", v7);
  }

}

- (void)updateTabBarLayout
{
  id *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *tabBarContainerView;
  _UITabBarContainerView_TV *v11;
  UIView *v12;
  void *v13;
  void *v14;
  id v15;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v3);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    objc_msgSend(v5, "frame");
    v7 = v6;
    objc_msgSend(v15, "frame");
    v9 = v8;
    tabBarContainerView = self->_tabBarContainerView;
    if (!tabBarContainerView)
    {
      objc_msgSend(v15, "setAutoresizingMask:", 0);
      v11 = -[_UITabBarContainerView_TV initWithTabBar:]([_UITabBarContainerView_TV alloc], "initWithTabBar:", v15);
      v12 = self->_tabBarContainerView;
      self->_tabBarContainerView = &v11->super;

      tabBarContainerView = self->_tabBarContainerView;
    }
    -[UIView setFrame:](tabBarContainerView, "setFrame:", 0.0, 46.0, v7, v9);
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_observingScrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[_UITabBarControllerVisualStyle_TV adjustTabBarForContentScrollView:](self, "adjustTabBarForContentScrollView:", v14);
    objc_msgSend(v15, "frame");
    -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:");
    objc_msgSend(v15, "setFrame:");

  }
  else
  {
    objc_msgSend(v15, "frame");
    objc_msgSend(v15, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

- (CGRect)adjustedTabBarFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  double v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isTabBarOffscreen");

  v10 = -[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar");
  if (y >= 0.0)
    v11 = v9;
  else
    v11 = 0;
  if (y >= 0.0)
    v12 = 1;
  else
    v12 = v9;
  v13 = 0.0;
  if (v12)
    v13 = y;
  if (v11 == 1)
    v13 = -height;
  if (y >= 0.0)
    v14 = v9;
  else
    v14 = 0;
  if (y >= 0.0)
    v15 = 1;
  else
    v15 = v9;
  v16 = -0.0;
  if (!v15)
    v16 = height + 46.0;
  v17 = y + v16;
  v18 = y - (height + 46.0);
  if (v14 != 1)
    v18 = v17;
  if (!v10)
    v18 = v13;
  v19 = x;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (CGRect)adjustedContentViewFrame:(CGRect)a3 viewController:(id)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[_UITabBarControllerVisualStyle_TV tabBarView](self, "tabBarView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:", v12, v14, v16, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  LODWORD(v10) = -[_UITabBarControllerVisualStyle_TV _shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:](self, "_shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:", v9);

  if ((_DWORD)v10)
  {
    v34.origin.x = v20;
    v34.origin.y = v22;
    v34.size.width = v24;
    v34.size.height = v26;
    y = CGRectGetMaxY(v34);
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_containerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v29 = CGRectGetHeight(v35);
    v36.origin.x = v20;
    v36.origin.y = v22;
    v36.size.width = v24;
    v36.size.height = v26;
    height = v29 - CGRectGetMaxY(v36);

  }
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  UIEdgeInsets result;

  v4 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    -[_UITabBarControllerVisualStyle_TV _childViewControllerModernBarTopInset](self, "_childViewControllerModernBarTopInset");
LABEL_5:
    v16 = MaxY;
    goto LABEL_6;
  }
  v16 = 0.0;
  if (-[_UITabBarControllerVisualStyle_TV _shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:](self, "_shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:", v4, v8, v10, v12, v14))
  {
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    MaxY = CGRectGetMaxY(v21);
    goto LABEL_5;
  }
LABEL_6:

  v17 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  v20 = v16;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v20;
  return result;
}

- (UIEdgeInsets)overlayInsetsAdjustment
{
  _DWORD *v3;
  unsigned int v4;
  double v5;
  void *v6;
  double MaxY;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  UIEdgeInsets result;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = ((v3[92] >> 1) & 3) - 1;

    v5 = 0.0;
    if (v4 <= 1)
    {
      if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar")
        && (-[_UITabBarControllerVisualStyle_TV tabBarView](self, "tabBarView"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "frame"),
            MaxY = CGRectGetMaxY(v18),
            v6,
            MaxY < 0.0))
      {
        -[_UITabBarControllerVisualStyle_TV _childViewControllerModernBarTopInset](self, "_childViewControllerModernBarTopInset");
        v5 = -v8;
      }
      else
      {
        -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectedViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "superview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          -[_UITabBarControllerVisualStyle_TV _childViewControllerModernBarTopInset](self, "_childViewControllerModernBarTopInset");
          v5 = v13;
        }
      }
    }
  }
  else
  {
    v5 = 0.0;
  }
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v17 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v17;
  return result;
}

- (BOOL)_shouldAdjustContentViewFrameForOffscreenFocus:(id)a3 adjustedTabBarFrame:(CGRect)a4
{
  double height;
  id v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  char v15;
  double v16;
  int v18;
  void *v19;
  uint64_t v20;

  height = a4.size.height;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v11;
    _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "%@ unexpectedly called not on tvOS", (uint8_t *)&v18, 0xCu);
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v8 = _shouldAdjustContentViewFrameForOffscreenFocus_adjustedTabBarFrame____s_category;
  if (!_shouldAdjustContentViewFrameForOffscreenFocus_adjustedTabBarFrame____s_category)
  {
    v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_shouldAdjustContentViewFrameForOffscreenFocus_adjustedTabBarFrame____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v11;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%@ unexpectedly called not on tvOS", (uint8_t *)&v18, 0xCu);
    goto LABEL_6;
  }
LABEL_8:
  if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar"))
  {
    v12 = 0;
  }
  else
  {
    v12 = 1;
    objc_msgSend(v7, "_contentOrObservableScrollViewForEdge:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_isTabBarOffscreen");

    if ((v15 & 1) == 0)
    {
      v12 = 0;
      if ((objc_msgSend(v7, "_tvTabBarShouldOverlap") & 1) == 0)
      {
        if (!v13 || (objc_msgSend(v13, "_focusTargetOffset"), v16 <= height))
          v12 = 1;
      }
    }

  }
  return v12;
}

- (double)_childViewControllerModernBarTopInset
{
  void *v2;
  double v3;
  double v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentOverlayInsets");
  v4 = 157.0 - v3;

  return v4;
}

- (BOOL)shouldTrackContentScrollView:(id)a3 viewController:(id)a4 tabBarBackgroundRequired:(BOOL)a5
{
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (-[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar")
    && (v9 = objc_msgSend(v8, "_tvTabBarShouldAutohide"), (v9 & 1) == 0))
  {
    v11 = v9;
    objc_msgSend(v7, "_viewControllerForAncestor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v10 = objc_msgSend(v14, "_tvShouldScrollWithObservedScrollViewIfPossible") & (v11 ^ 1);
    else
      LOBYTE(v10) = 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)adjustTabBarForContentScrollView:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar");
  v5 = v6;
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v6, "contentOffset");
      objc_msgSend(v6, "adjustedContentInset");
    }
    -[UIView bounds](self->_tabBarContainerView, "bounds");
    -[UIView setFrame:](self->_tabBarContainerView, "setFrame:");
    v5 = v6;
  }

}

- (id)viewControllerForObservableScrollViewFromViewController:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](&v9, sel_viewControllerForObservableScrollViewFromViewController_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIViewControllerUseContentScrollViewAPI())
  {
    if (objc_msgSend(v3, "_isSearchController"))
    {
      objc_msgSend(v3, "searchResultsController");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:

      v3 = (void *)v4;
      return v3;
    }
    objc_msgSend(v3, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isSearchController");

    if (v6)
    {
      objc_msgSend(v3, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultsController");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = v7;
      goto LABEL_6;
    }
  }
  return v3;
}

- (BOOL)isScrollViewObservationInCompatibilityMode
{
  return (_UIViewControllerUseContentScrollViewAPI() & 1) == 0
      && -[_UITabBarControllerVisualStyle_TV _isModernBar](self, "_isModernBar");
}

- (void)_scrollViewManagerDidFinishScrolling:(id)a3
{
  _UITVScrollViewManager *scrollViewManager;

  scrollViewManager = self->_scrollViewManager;
  self->_scrollViewManager = 0;

}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  id v7;
  _UITabBarTVTransitioner *v8;
  id *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _BOOL8 v19;
  id *v20;
  void *v21;
  unint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_UITabBarTVTransitioner);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _viewControllersForTabs](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "indexOfObject:", v6);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "parentModalViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "parentModalViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v13);

    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v14 = objc_msgSend(v10, "indexOfObject:", v7);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "parentModalViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v7, "parentModalViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "indexOfObject:", v16);

    }
    else
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v19 = v11 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL || v11 <= v14;
  -[_UITabBarTVTransitioner setTransitionFromRight:](v8, "setTransitionFromRight:", v19);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v20 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "_displayStyle");

  if (v22 <= 1)
    -[_UITabBarTVTransitioner setTransitionStyle:](v8, "setTransitionStyle:", v22);

  return v8;
}

- (BOOL)_isModernBar
{
  id *v2;
  void *v3;
  BOOL v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _internalTabBar](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_displayStyle") == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewManager, 0);
  objc_storeStrong((id *)&self->_touchDetectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tabBarOffscreenFocusGuide, 0);
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_tabBarContainerView, 0);
}

@end
