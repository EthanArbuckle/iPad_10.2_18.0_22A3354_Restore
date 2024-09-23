@implementation SBIconViewCustomImageViewController

- (BOOL)sbh_isCustomIconImageViewController
{
  return 1;
}

- (id)sbh_underlyingAvocadoHostViewControllers
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBIconViewCustomImageViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sbh_isWidgetHostViewController");
  v5 = (void *)MEMORY[0x1E0C99E60];
  if ((v4 & 1) != 0)
  {
    -[SBIconViewCustomImageViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (SBIconViewCustomImageViewController)initWithContentViewController:(id)a3
{
  id v5;
  SBIconViewCustomImageViewController *v6;
  SBIconViewCustomImageViewController *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconViewCustomImageViewController;
  v6 = -[SBIconViewCustomImageViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    -[SBIconViewCustomImageViewController _setupStateCapture](v7, "_setupStateCapture");
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[SBIconViewCustomImageViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v9, sel__updateEdgeAntialiasing);

  }
  return v7;
}

- (id)contentView
{
  void *v2;
  void *v3;

  -[SBIconViewCustomImageViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBIconViewCustomImageViewController _teardownStateCapture](self, "_teardownStateCapture");
  v3.receiver = self;
  v3.super_class = (Class)SBIconViewCustomImageViewController;
  -[SBIconViewCustomImageViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBIconViewCustomImageViewController;
  -[SBIconViewCustomImageViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SBIconViewCustomImageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewCustomImageViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewCustomImageViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[SBIconViewCustomImageViewController iconImageInfo](self, "iconImageInfo");
  v7 = v6;
  objc_msgSend(v3, "_setContinuousCornerRadius:", v6);
  objc_msgSend(v5, "_setContinuousCornerRadius:", v7);
  -[SBIconViewCustomImageViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBIconViewCustomImageViewController;
  -[SBIconViewCustomImageViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[SBIconViewCustomImageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  -[SBIconViewCustomImageViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v5, v7);
  -[SBIconViewCustomImageViewController backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v9, "setBounds:");
  objc_msgSend(v9, "setCenter:", v5, v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconViewCustomImageViewController;
  -[SBIconViewCustomImageViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBIconViewCustomImageViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconViewCustomImageViewController;
  -[SBIconViewCustomImageViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBIconViewCustomImageViewController _teardownBackgroundView](self, "_teardownBackgroundView");
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;
  void *v13;
  id v14;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    if (-[SBIconViewCustomImageViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBIconViewCustomImageViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setContinuousCornerRadius:", v7);

      -[SBIconViewCustomImageViewController contentView](self, "contentView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setContinuousCornerRadius:", v7);

    }
  }
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    -[SBIconViewCustomImageViewController _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  }
}

- (void)setBackgroundViewProvider:(id)a3
{
  void *v4;
  id backgroundViewProvider;

  if (self->_backgroundViewProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    backgroundViewProvider = self->_backgroundViewProvider;
    self->_backgroundViewProvider = v4;

    -[SBIconViewCustomImageViewController _teardownBackgroundView](self, "_teardownBackgroundView");
    -[SBIconViewCustomImageViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 1);
  }
}

- (UIView)snapshotView
{
  void *v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;

  -[SBIconViewCustomImageViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = v3;
    objc_msgSend(v6, "snapshotView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "scaleFactor");
    v10 = 1.0 / v9;
  }
  else
  {
    -[SBIconViewCustomImageViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshotViewAfterScreenUpdates:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1.0;
  }

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, v10, v10);
  objc_msgSend(v7, "frame");
  v13 = v14;
  v16 = CGRectApplyAffineTransform(v15, &v13);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  objc_msgSend(v11, "addSubview:", v7);
  objc_msgSend(v11, "bounds");
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  v13 = v14;
  objc_msgSend(v7, "setTransform:", &v13);

  return (UIView *)v11;
}

- (double)snapshotViewScaleFactor
{
  return 1.0;
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBIconViewCustomImageViewController iconImageInfo](self, "iconImageInfo");
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

  -[SBIconViewCustomImageViewController view](self, "view");
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

- (void)_updateEdgeAntialiasing
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[SBIconViewCustomImageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBIconViewCustomImageViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", self->_forcesEdgeAntialiasing);
  objc_msgSend(v7, "setShouldRasterize:", self->_forcesEdgeAntialiasing);
  objc_msgSend(v7, "setRasterizationScale:", v6);

}

- (BOOL)_needsBackgroundView
{
  return 0;
}

- (void)_createBackgroundViewIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *backgroundView;
  id v7;

  v3 = a3;
  if ((-[SBIconViewCustomImageViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) == 0
    && !self->_backgroundView
    && (!v3 || -[SBIconViewCustomImageViewController _needsBackgroundView](self, "_needsBackgroundView")))
  {
    -[SBIconViewCustomImageViewController _createBackgroundView](self, "_createBackgroundView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    if (self->_backgroundView)
    {
      -[SBIconViewCustomImageViewController _configureBackgroundViewIfNecessary:](self, "_configureBackgroundViewIfNecessary:");
      -[SBIconViewCustomImageViewController view](self, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:atIndex:", self->_backgroundView, 0);

    }
  }
}

- (id)_createBackgroundView
{
  void (**backgroundViewProvider)(id, SEL);
  void *v4;
  double v5;

  backgroundViewProvider = (void (**)(id, SEL))self->_backgroundViewProvider;
  if (backgroundViewProvider)
    backgroundViewProvider[2](backgroundViewProvider, a2);
  else
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", !self->_showsSquareCorners);
  -[SBIconViewCustomImageViewController iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v4, "_setContinuousCornerRadius:", v5);
  return v4;
}

- (void)_teardownBackgroundView
{
  if (self->_backgroundView)
    -[SBIconViewCustomImageViewController _teardownBackgroundView:](self, "_teardownBackgroundView:");
}

- (void)_teardownBackgroundView:(id)a3
{
  UIView *v4;
  UIView *v5;

  v4 = (UIView *)a3;
  if (v4)
  {
    v5 = v4;
    -[UIView removeFromSuperview](v4, "removeFromSuperview");
    v4 = v5;
    if (self->_backgroundView == v5)
    {
      self->_backgroundView = 0;

      v4 = v5;
    }
  }

}

- (void)_configureBackgroundViewIfNecessary
{
  -[SBIconViewCustomImageViewController _configureBackgroundViewIfNecessary:](self, "_configureBackgroundViewIfNecessary:", self->_backgroundView);
}

- (void)_configureBackgroundViewIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void (**backgroundViewConfigurator)(id, id, void *);
  BOOL v7;
  id v8;

  v8 = a3;
  -[SBIconViewCustomImageViewController icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    backgroundViewConfigurator = (void (**)(id, id, void *))self->_backgroundViewConfigurator;
    if (backgroundViewConfigurator)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (!v7)
      backgroundViewConfigurator[2](backgroundViewConfigurator, v8, v5);
  }

}

- (void)_setupStateCapture
{
  id v3;
  objc_class *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *stateCaptureInvalidatable;
  id v8;
  id location;

  if (!self->_stateCaptureInvalidatable)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v8, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = v6;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

__CFString *__57__SBIconViewCustomImageViewController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  __CFString *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __57__SBIconViewCustomImageViewController__setupStateCapture__block_invoke_2;
    v9 = &unk_1E8D84EF0;
    v10 = v2;
    v11 = WeakRetained;
    v3 = v2;
    objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v6);
    objc_msgSend(v3, "build", v6, v7, v8, v9);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E8D8E958;
  }

  return v4;
}

void __57__SBIconViewCustomImageViewController__setupStateCapture__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("viewIfLoaded"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("windowIfLoaded"));

  v9 = *(id *)(*(_QWORD *)(a1 + 40) + 1008);
  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    v13[0] = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1008);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "sbh_appendDescriptionsForViewControllers:", v11);

  }
}

- (void)_teardownStateCapture
{
  BSInvalidatable *stateCaptureInvalidatable;
  BSInvalidatable *v4;

  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  if (stateCaptureInvalidatable)
  {
    -[BSInvalidatable invalidate](stateCaptureInvalidatable, "invalidate");
    v4 = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = 0;

  }
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (id)backgroundViewConfigurator
{
  return self->_backgroundViewConfigurator;
}

- (void)setBackgroundViewConfigurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong(&self->_backgroundViewConfigurator, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
}

@end
