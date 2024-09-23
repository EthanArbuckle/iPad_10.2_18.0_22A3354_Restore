@implementation SBWidgetIconResizeTransitionViewController

- (SBWidgetIconResizeTransitionViewController)initWithLeafIcon:(id)a3 allowedGridSizeClasses:(id)a4 gridSizeClassDomain:(id)a5 viewHelper:(id)a6 options:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBWidgetIconResizeTransitionViewController *v17;
  SBWidgetIconResizeTransitionViewController *v18;
  uint64_t v19;
  SBHIconGridSizeClassSet *allowedGridSizeClasses;
  void *effectiveAllowedGridSizeClasses;
  uint64_t v22;
  SBHIconGridSizeClassSet *v23;
  uint64_t v24;
  uint64_t v25;
  SBIconListLayout *listLayout;
  void *v27;
  uint64_t v28;
  SBHIconGridSizeClassSizeMap *iconGridSizeClassSizes;
  void *v30;
  uint64_t v31;
  NSString *startingGridSizeClass;
  uint64_t v33;
  UIViewController *startingViewController;
  double v35;
  objc_super v37;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SBWidgetIconResizeTransitionViewController;
  v17 = -[SBWidgetIconResizeTransitionViewController initWithNibName:bundle:](&v37, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_leafIcon, a3);
    v19 = objc_msgSend(v14, "copy");
    allowedGridSizeClasses = v18->_allowedGridSizeClasses;
    v18->_allowedGridSizeClasses = (SBHIconGridSizeClassSet *)v19;

    objc_storeStrong((id *)&v18->_gridSizeClassDomain, a5);
    objc_storeStrong((id *)&v18->_viewHelper, a6);
    v18->_options = a7;
    if ((a7 & 1) != 0)
    {
      v24 = objc_msgSend(v14, "copy");
      effectiveAllowedGridSizeClasses = v18->_effectiveAllowedGridSizeClasses;
      v18->_effectiveAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v24;
    }
    else
    {
      objc_msgSend(v13, "supportedGridSizeClasses");
      effectiveAllowedGridSizeClasses = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(effectiveAllowedGridSizeClasses, "gridSizeClassSetByIntersectingWithGridSizeClassSet:", v14);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v18->_effectiveAllowedGridSizeClasses;
      v18->_effectiveAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v22;

    }
    objc_msgSend(v16, "listLayout");
    v25 = objc_claimAutoreleasedReturnValue();
    listLayout = v18->_listLayout;
    v18->_listLayout = (SBIconListLayout *)v25;

    SBHIconListLayoutIconGridSizeClassSizes(v18->_listLayout);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    iconGridSizeClassSizes = v18->_iconGridSizeClassSizes;
    v18->_iconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v28;

    objc_msgSend(v13, "gridSizeClass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    startingGridSizeClass = v18->_startingGridSizeClass;
    v18->_startingGridSizeClass = (NSString *)v31;

    -[NSDictionary objectForKey:](v18->_viewControllers, "objectForKey:", v18->_startingGridSizeClass);
    v33 = objc_claimAutoreleasedReturnValue();
    startingViewController = v18->_startingViewController;
    v18->_startingViewController = (UIViewController *)v33;

    SBHIconListLayoutIconImageInfoForGridSizeClass(v18->_listLayout, v18->_startingGridSizeClass);
    v18->_startingCornerRadius = v35;
  }

  return v18;
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setClipsToBounds:", 1);
  -[SBWidgetIconResizeTransitionViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBWidgetIconResizeTransitionViewController;
  -[SBWidgetIconResizeTransitionViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SBWidgetIconResizeTransitionViewController gatherViewControllers](self, "gatherViewControllers");
  -[SBWidgetIconResizeTransitionViewController startingViewController](self, "startingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController endingViewController](self, "endingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[SBWidgetIconResizeTransitionViewController bs_addChildViewController:](self, "bs_addChildViewController:", v4);
  if (v3)
  {
    -[SBWidgetIconResizeTransitionViewController bs_addChildViewController:](self, "bs_addChildViewController:", v3);
  }
  else
  {
    -[SBWidgetIconResizeTransitionViewController startingGridSizeClass](self, "startingGridSizeClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWidgetIconResizeTransitionViewController viewControllerForGridSizeClass:](self, "viewControllerForGridSizeClass:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWidgetIconResizeTransitionViewController setStartingViewController:](self, "setStartingViewController:", v3);

  }
  -[SBWidgetIconResizeTransitionViewController updateCornerRadius](self, "updateCornerRadius");

}

- (void)setStartingGridSizeClass:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSObject *v6;
  NSString *v7;
  NSString *startingGridSizeClass;
  void *v9;
  void *v10;
  double v11;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_startingGridSizeClass != v4 && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    SBLogWidgetResizing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "setting resize starting grid size class to %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v7 = (NSString *)-[NSString copy](v5, "copy");
    startingGridSizeClass = self->_startingGridSizeClass;
    self->_startingGridSizeClass = v7;

    -[SBWidgetIconResizeTransitionViewController viewControllerForGridSizeClass:](self, "viewControllerForGridSizeClass:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWidgetIconResizeTransitionViewController setStartingViewController:](self, "setStartingViewController:", v9);
    -[SBWidgetIconResizeTransitionViewController listLayout](self, "listLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconListLayoutIconImageInfoForGridSizeClass(v10, v5);
    -[SBWidgetIconResizeTransitionViewController setStartingCornerRadius:](self, "setStartingCornerRadius:", v11);

  }
}

- (void)setStartingViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *startingViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  startingViewController = self->_startingViewController;
  if (startingViewController != v5)
  {
    v12 = v5;
    -[UIViewController removeFromParentViewController](startingViewController, "removeFromParentViewController");
    -[UIViewController viewIfLoaded](self->_startingViewController, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[SBWidgetIconResizeTransitionViewController startingBlurView](self, "startingBlurView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[SBWidgetIconResizeTransitionViewController setStartingBlurView:](self, "setStartingBlurView:", 0);
    objc_storeStrong((id *)&self->_startingViewController, a3);
    v5 = v12;
    if (v12)
    {
      -[UIViewController view](v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SBWidgetIconResizeTransitionViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[SBWidgetIconResizeTransitionViewController bs_addChildViewController:](self, "bs_addChildViewController:", v12);
        -[SBWidgetIconResizeTransitionViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bringSubviewToFront:", v9);

      }
      -[SBWidgetIconResizeTransitionViewController blurViewWithInputRadius:](self, "blurViewWithInputRadius:", 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v11);
      -[SBWidgetIconResizeTransitionViewController setStartingBlurView:](self, "setStartingBlurView:", v11);
      -[SBWidgetIconResizeTransitionViewController updateTransitionProgress](self, "updateTransitionProgress");

      v5 = v12;
    }
  }

}

- (void)setStartingCornerRadius:(double)a3
{
  if (self->_startingCornerRadius != a3)
  {
    self->_startingCornerRadius = a3;
    -[SBWidgetIconResizeTransitionViewController updateCornerRadius](self, "updateCornerRadius");
  }
}

- (void)setEndingGridSizeClass:(id)a3
{
  -[SBWidgetIconResizeTransitionViewController setEndingGridSizeClass:animated:](self, "setEndingGridSizeClass:animated:", a3, 0);
}

- (void)setEndingGridSizeClass:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v6;
  NSString *v7;
  NSObject *v8;
  NSString *v9;
  NSString *endingGridSizeClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  NSString *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = v6;
  if (self->_endingGridSizeClass != v6 && !-[NSString isEqualToString:](v6, "isEqualToString:"))
  {
    SBLogWidgetResizing();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "setting resize ending grid size class to %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v9 = (NSString *)-[NSString copy](v7, "copy");
    endingGridSizeClass = self->_endingGridSizeClass;
    self->_endingGridSizeClass = v9;

    if (v7)
    {
      -[SBWidgetIconResizeTransitionViewController viewControllerForGridSizeClass:](self, "viewControllerForGridSizeClass:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWidgetIconResizeTransitionViewController listLayout](self, "listLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SBHIconListLayoutIconImageInfoForGridSizeClass(v12, v7);
      v14 = v13;

    }
    else
    {
      v11 = 0;
      v14 = 0.0;
    }
    -[SBWidgetIconResizeTransitionViewController setEndingViewController:animated:](self, "setEndingViewController:animated:", v11, v4);
    -[SBWidgetIconResizeTransitionViewController setEndingCornerRadius:](self, "setEndingCornerRadius:", v14);

  }
}

- (void)setEndingViewController:(id)a3
{
  -[SBWidgetIconResizeTransitionViewController setEndingViewController:animated:](self, "setEndingViewController:animated:", a3, 0);
}

- (void)setEndingViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIViewController *v7;
  UIViewController *endingViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a4;
  v7 = (UIViewController *)a3;
  endingViewController = self->_endingViewController;
  if (endingViewController != v7)
  {
    -[UIViewController viewIfLoaded](endingViewController, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController removeFromParentViewController](self->_endingViewController, "removeFromParentViewController");
    -[SBWidgetIconResizeTransitionViewController endingBlurView](self, "endingBlurView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[SBWidgetIconResizeTransitionViewController setEndingBlurView:](self, "setEndingBlurView:", 0);
    objc_storeStrong((id *)&self->_endingViewController, a3);
    if (v7)
    {
      -[UIViewController view](v7, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SBWidgetIconResizeTransitionViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[SBWidgetIconResizeTransitionViewController bs_addChildViewController:](self, "bs_addChildViewController:", v7);
        -[SBWidgetIconResizeTransitionViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sendSubviewToBack:", v11);

      }
      if (v4)
      {
        v13 = (void *)MEMORY[0x1E0DC3F10];
        v14 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke;
        v21[3] = &unk_1E8D84C50;
        v22 = v9;
        v16 = v14;
        v17 = 3221225472;
        v18 = __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke_2;
        v19 = &unk_1E8D84F68;
        v20 = v22;
        objc_msgSend(v13, "animateWithDuration:animations:completion:", v21, &v16, 0.2);

      }
      else
      {
        objc_msgSend(v9, "removeFromSuperview");
      }
      -[SBWidgetIconResizeTransitionViewController blurViewWithInputRadius:](self, "blurViewWithInputRadius:", 15.0, v16, v17, v18, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v15);
      -[SBWidgetIconResizeTransitionViewController setEndingBlurView:](self, "setEndingBlurView:", v15);
      -[SBWidgetIconResizeTransitionViewController updateTransitionProgress](self, "updateTransitionProgress");

    }
    else
    {
      objc_msgSend(v9, "removeFromSuperview");
    }

  }
}

uint64_t __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setEndingCornerRadius:(double)a3
{
  if (self->_endingCornerRadius != a3)
  {
    self->_endingCornerRadius = a3;
    -[SBWidgetIconResizeTransitionViewController updateCornerRadius](self, "updateCornerRadius");
  }
}

- (void)setTransitionProgress:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_transitionProgress != a3)
  {
    SBLogWidgetResizing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "setting resize transition progress to %f", (uint8_t *)&v6, 0xCu);
    }

    self->_transitionProgress = a3;
    -[SBWidgetIconResizeTransitionViewController updateCornerRadius](self, "updateCornerRadius");
    -[SBWidgetIconResizeTransitionViewController updateTransitionProgress](self, "updateTransitionProgress");
  }
}

- (id)blurViewWithInputRadius:(double)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SBWidgetIconResizeBackdropView *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CD2780]);
  v5 = (void *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2C88]);
  v6 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v5, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D58]);
  objc_msgSend(v5, "setValue:forKey:", v6, *MEMORY[0x1E0CD2D70]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, *MEMORY[0x1E0CD2D90]);

  objc_msgSend(v5, "setValue:forKey:", CFSTR("medium"), *MEMORY[0x1E0CD2D88]);
  v8 = objc_alloc_init(SBWidgetIconResizeBackdropView);
  -[SBWidgetIconResizeBackdropView layer](v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  objc_msgSend(v9, "setScale:", 100.0);
  objc_msgSend(v9, "setAllowsGroupOpacity:", 1);
  objc_msgSend(v9, "setAllowsEdgeAntialiasing:", 1);

  return v8;
}

- (void)updateTransitionProgress
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  void *v17;
  id v18;

  -[SBWidgetIconResizeTransitionViewController transitionProgress](self, "transitionProgress");
  v4 = v3;
  -[SBWidgetIconResizeTransitionViewController startingViewController](self, "startingViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0 - v4);
  -[SBWidgetIconResizeTransitionViewController endingViewController](self, "endingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);
  -[SBWidgetIconResizeTransitionViewController startingBlurView](self, "startingBlurView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v18, "isContentReady");
  v11 = v4 * 15.0 + (1.0 - v4) * 0.0;
  if (!v10)
    v11 = 15.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKeyPath:", v12, CFSTR("filters.gaussianBlur.inputRadius"));

  -[SBWidgetIconResizeTransitionViewController endingBlurView](self, "endingBlurView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v6, "isContentReady");
  v16 = (1.0 - v4) * 15.0 + (1.0 - (1.0 - v4)) * 0.0;
  if (!v15)
    v16 = 15.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKeyPath:", v17, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (void)updateCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[SBWidgetIconResizeTransitionViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController startingCornerRadius](self, "startingCornerRadius");
  v4 = v3;
  -[SBWidgetIconResizeTransitionViewController endingCornerRadius](self, "endingCornerRadius");
  v6 = v5;
  -[SBWidgetIconResizeTransitionViewController transitionProgress](self, "transitionProgress");
  objc_msgSend(v8, "_setContinuousCornerRadius:", v6 * v7 + (1.0 - v7) * v4);

}

- (void)swapViewControllers
{
  UIViewController *v3;
  UIViewController *v4;
  UIViewController *startingViewController;
  UIViewController *v6;
  UIViewController *endingViewController;
  UIViewController *v8;
  UIView *v9;
  UIView *v10;
  UIView *startingBlurView;
  UIView *v12;
  UIView *endingBlurView;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[SBWidgetIconResizeTransitionViewController startingViewController](self, "startingViewController");
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController endingViewController](self, "endingViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  startingViewController = self->_startingViewController;
  self->_startingViewController = v4;
  v6 = v4;

  endingViewController = self->_endingViewController;
  self->_endingViewController = v3;
  v8 = v3;

  -[SBWidgetIconResizeTransitionViewController startingBlurView](self, "startingBlurView");
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController endingBlurView](self, "endingBlurView");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  startingBlurView = self->_startingBlurView;
  self->_startingBlurView = v10;
  v12 = v10;

  endingBlurView = self->_endingBlurView;
  self->_endingBlurView = v9;

  -[SBWidgetIconResizeTransitionViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](v8, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "bringSubviewToFront:", v14);
  -[SBWidgetIconResizeTransitionViewController startingGridSizeClass](self, "startingGridSizeClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController endingGridSizeClass](self, "endingGridSizeClass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController setStartingGridSizeClass:](self, "setStartingGridSizeClass:", v16);
  -[SBWidgetIconResizeTransitionViewController setEndingGridSizeClass:](self, "setEndingGridSizeClass:", v15);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;

  v46.receiver = self;
  v46.super_class = (Class)SBWidgetIconResizeTransitionViewController;
  -[SBWidgetIconResizeTransitionViewController viewDidLayoutSubviews](&v46, sel_viewDidLayoutSubviews);
  -[SBWidgetIconResizeTransitionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  v8 = CGRectGetWidth(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v9 = CGRectGetHeight(v48);
  UIRectGetCenter();
  v11 = v10;
  v13 = v12;
  -[SBWidgetIconResizeTransitionViewController startingViewController](self, "startingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v15, "setCenter:", v11, v13);
  CGAffineTransformMakeScale(&v45, v8 / v17, v9 / v19);
  objc_msgSend(v15, "setTransform:", &v45);
  -[SBWidgetIconResizeTransitionViewController endingViewController](self, "endingViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  objc_msgSend(v21, "setCenter:", v11, v13);
  CGAffineTransformMakeScale(&v44, v8 / v23, v9 / v25);
  objc_msgSend(v21, "setTransform:", &v44);
  -[SBWidgetIconResizeTransitionViewController startingBlurView](self, "startingBlurView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  UIRectGetCenter();
  objc_msgSend(v26, "setCenter:");
  objc_msgSend(v26, "setBounds:", v28, v30, v32, v34);
  -[SBWidgetIconResizeTransitionViewController endingBlurView](self, "endingBlurView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  UIRectGetCenter();
  objc_msgSend(v35, "setCenter:");
  objc_msgSend(v35, "setBounds:", v37, v39, v41, v43);

}

- (id)effectiveGridSizeClassDomain
{
  void *v2;
  void *v3;

  -[SBWidgetIconResizeTransitionViewController gridSizeClassDomain](self, "gridSizeClassDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBHIconGridSizeClassDomain effectiveGridSizeClassDomainForDomain:](SBHIconGridSizeClassDomain, "effectiveGridSizeClassDomainForDomain:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewControllerForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[SBWidgetIconResizeTransitionViewController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[SBWidgetIconResizeTransitionViewController gatherViewControllers](self, "gatherViewControllers");
    -[SBWidgetIconResizeTransitionViewController viewControllers](self, "viewControllers");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)gatherViewControllers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;

  -[SBWidgetIconResizeTransitionViewController leafIcon](self, "leafIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SBWidgetIconResizeTransitionViewController effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController viewHelper](self, "viewHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeTransitionViewController effectiveAllowedGridSizeClasses](self, "effectiveAllowedGridSizeClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__SBWidgetIconResizeTransitionViewController_gatherViewControllers__block_invoke;
  v13[3] = &unk_1E8D8DE40;
  v13[4] = self;
  v14 = v3;
  v15 = v4;
  v16 = v7;
  v17 = v5;
  v9 = v5;
  v10 = v7;
  v11 = v4;
  v12 = v3;
  objc_msgSend(v8, "enumerateGridSizeClassesInDomain:usingBlock:", v6, v13);
  -[SBWidgetIconResizeTransitionViewController setViewControllers:](self, "setViewControllers:", v9);

}

void __67__SBWidgetIconResizeTransitionViewController_gatherViewControllers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "replacementIconForIcon:gridSizeClass:", v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "replacementIconDataSourceForIconDataSource:gridSizeClass:", *(_QWORD *)(a1 + 48), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "viewControllerForIconDataSource:icon:gridSizeClass:", v6, v8, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v7, v5);

}

- (id)replacementIconForIcon:(id)a3 gridSizeClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  -[SBWidgetIconResizeTransitionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "iconResizeTransitionViewController:willUseIcon:forViewControllerForGridSizeClass:", self, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }

  return v6;
}

- (id)replacementIconDataSourceForIconDataSource:(id)a3 gridSizeClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  -[SBWidgetIconResizeTransitionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "iconResizeTransitionViewController:willUseIconDataSource:forViewControllerForGridSizeClass:", self, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }

  return v6;
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBWidgetIconResizeTransitionViewController iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (CGRect)visibleBounds
{
  void *v2;
  double v3;
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
  CGRect result;

  -[SBWidgetIconResizeTransitionViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)invalidate
{
  id v2;

  -[SBWidgetIconResizeTransitionViewController viewControllers](self, "viewControllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_73);

}

uint64_t __56__SBWidgetIconResizeTransitionViewController_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SBWidgetIconResizeTransitionViewController *v11;

  v4 = a3;
  -[SBWidgetIconResizeTransitionViewController effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SBWidgetIconResizeTransitionViewController_appendDescriptionToStream___block_invoke;
  v8[3] = &unk_1E8D84F18;
  v9 = v4;
  v10 = v5;
  v11 = self;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v7, "appendProem:block:", self, v8);

}

id __72__SBWidgetIconResizeTransitionViewController_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "startingGridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForGridSizeClass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v5, CFSTR("startingGridSizeClass"));

  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "endingGridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionForGridSizeClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v9, CFSTR("endingGridSizeClass"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "transitionProgress");
  return (id)objc_msgSend(v10, "appendFloat:withName:", CFSTR("transitionProgress"));
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;

  self->_iconImageInfo.size.width = v3;
  self->_iconImageInfo.size.height = v4;
  self->_iconImageInfo.scale = v5;
  self->_iconImageInfo.continuousCornerRadius = v6;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (SBLeafIcon)leafIcon
{
  return self->_leafIcon;
}

- (SBHIconGridSizeClassSet)allowedGridSizeClasses
{
  return self->_allowedGridSizeClasses;
}

- (SBHWidgetIconResizeViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (UIViewController)startingViewController
{
  return self->_startingViewController;
}

- (double)startingCornerRadius
{
  return self->_startingCornerRadius;
}

- (NSString)startingGridSizeClass
{
  return self->_startingGridSizeClass;
}

- (UIViewController)endingViewController
{
  return self->_endingViewController;
}

- (double)endingCornerRadius
{
  return self->_endingCornerRadius;
}

- (NSString)endingGridSizeClass
{
  return self->_endingGridSizeClass;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (SBWidgetIconResizeTransitionViewControllerDelegate)delegate
{
  return (SBWidgetIconResizeTransitionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)crossfades
{
  return self->_crossfades;
}

- (void)setCrossfades:(BOOL)a3
{
  self->_crossfades = a3;
}

- (SBHIconGridSizeClassSet)effectiveAllowedGridSizeClasses
{
  return self->_effectiveAllowedGridSizeClasses;
}

- (UIView)startingBlurView
{
  return self->_startingBlurView;
}

- (void)setStartingBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_startingBlurView, a3);
}

- (UIView)endingBlurView
{
  return self->_endingBlurView;
}

- (void)setEndingBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_endingBlurView, a3);
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (NSDictionary)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_endingBlurView, 0);
  objc_storeStrong((id *)&self->_startingBlurView, 0);
  objc_storeStrong((id *)&self->_effectiveAllowedGridSizeClasses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_endingGridSizeClass, 0);
  objc_storeStrong((id *)&self->_endingViewController, 0);
  objc_storeStrong((id *)&self->_startingGridSizeClass, 0);
  objc_storeStrong((id *)&self->_startingViewController, 0);
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_leafIcon, 0);
}

@end
