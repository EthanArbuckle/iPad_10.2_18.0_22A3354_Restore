@implementation SBElasticValueViewController

- (SBElasticValueViewController)initWithDataSource:(id)a3
{
  id v5;
  SBElasticValueViewController *v6;
  SBElasticValueViewController *v7;
  uint64_t v8;
  SBElasticHUDSettings *settings;
  uint64_t v10;
  UILongPressGestureRecognizer *shortLongPressGestureRecognizer;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticValueViewController.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBElasticValueViewController;
  v6 = -[SBElasticValueViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_previousState = -1;
    v6->_state = -1;
    v6->_axis = 0;
    objc_storeWeak((id *)&v6->_dataSource, v5);
    +[SBElasticHUDDomain rootSettings](SBElasticHUDDomain, "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v7->_settings;
    v7->_settings = (SBElasticHUDSettings *)v8;

    -[PTSettings addKeyObserver:](v7->_settings, "addKeyObserver:", v7);
    v7->_isDebugging = -[SBElasticHUDSettings showDebugUI](v7->_settings, "showDebugUI");
    v7->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v7, sel__handleShortLongPressGestureRecognizer_);
    shortLongPressGestureRecognizer = v7->_shortLongPressGestureRecognizer;
    v7->_shortLongPressGestureRecognizer = (UILongPressGestureRecognizer *)v10;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v7->_shortLongPressGestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setDelegate:](v7->_shortLongPressGestureRecognizer, "setDelegate:", v7);
  }

  return v7;
}

- (SBElasticValueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticValueViewController.m"), 167, CFSTR("Use -initWithDataSource: instead."));

  return -[SBElasticValueViewController initWithDataSource:](self, "initWithDataSource:", 0);
}

- (SBElasticValueViewController)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticValueViewController.m"), 172, CFSTR("Use -initWithDataSource: instead."));

  return -[SBElasticValueViewController initWithDataSource:](self, "initWithDataSource:", 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setOpaque:", 0);
  -[SBElasticValueViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
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
  UIView *v12;
  UIView *dimmingView;
  void *v14;
  UIView *v15;
  UIView *debugContainerView;
  SBFTouchPassThroughView *v17;
  SBFTouchPassThroughView *sliderContainerView;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  _UILegibilityLabel *v25;
  _UILegibilityLabel *leadingLabel;
  id v27;
  void *v28;
  void *v29;
  _UILegibilityLabel *v30;
  _UILegibilityLabel *trailingLabel;
  _UILegibilityLabel *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  SBElasticSliderView *v39;
  SBElasticSliderView *sliderView;
  SBElasticSliderView *v41;
  void *v42;
  SBElasticSliderView *v43;
  void *v44;
  SBElasticSliderView *v45;
  SBElasticSliderView *v46;
  void *v47;
  SBElasticSliderView *v48;
  id v49;
  UIView *v50;
  UIView *touchTrackingView;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _QWORD v60[2];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewDidLoad](&v59, sel_viewDidLoad);
  -[SBElasticValueViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v4, v6, v8, v10);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v12;

  -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
  -[UIView layer](self->_dimmingView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsHitTesting:", 0);

  objc_msgSend(v3, "addSubview:", self->_dimmingView);
  if (self->_isDebugging)
  {
    v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v5, v7, v9, v11);
    debugContainerView = self->_debugContainerView;
    self->_debugContainerView = v15;

    objc_msgSend(v3, "addSubview:", self->_debugContainerView);
  }
  v17 = (SBFTouchPassThroughView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v5, v7, v9, v11);
  sliderContainerView = self->_sliderContainerView;
  self->_sliderContainerView = v17;

  v54 = v3;
  objc_msgSend(v3, "addSubview:", self->_sliderContainerView);
  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticValueViewController _computeCachedRouteDisplayInformation](self, "_computeCachedRouteDisplayInformation");
  -[SBElasticHUDSettings legibilityStrength](self->_settings, "legibilityStrength");
  v21 = v20;
  v22 = objc_alloc(MEMORY[0x1E0CEADE0]);
  v23 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
  objc_msgSend(v23, "boldSystemFontOfSize:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (_UILegibilityLabel *)objc_msgSend(v22, "initWithSettings:strength:string:font:", v19, CFSTR("  "), v24, v21);
  leadingLabel = self->_leadingLabel;
  self->_leadingLabel = v25;

  v27 = objc_alloc(MEMORY[0x1E0CEADE0]);
  v28 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
  objc_msgSend(v28, "boldSystemFontOfSize:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (_UILegibilityLabel *)objc_msgSend(v27, "initWithSettings:strength:string:font:", v19, CFSTR("  "), v29, v21);
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v30;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v32 = self->_trailingLabel;
  v60[0] = self->_leadingLabel;
  v60[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v56 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v38, "setAlpha:", 0.0);
        objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v35);
  }

  -[SBElasticValueViewController createSliderView](self, "createSliderView");
  v39 = (SBElasticSliderView *)objc_claimAutoreleasedReturnValue();
  sliderView = self->_sliderView;
  self->_sliderView = v39;

  -[SBFTouchPassThroughView addSubview:](self->_sliderContainerView, "addSubview:", self->_sliderView);
  v41 = self->_sliderView;
  -[SBElasticRouteDisplaying glyphImage](self->_routeDisplayInfo, "glyphImage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIBaseSliderView setGlyphImage:](v41, "setGlyphImage:", v42);

  v43 = self->_sliderView;
  -[SBElasticRouteDisplaying glyphPackage](self->_routeDisplayInfo, "glyphPackage");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIBaseSliderView setGlyphPackageDescription:](v43, "setGlyphPackageDescription:", v44);

  v45 = self->_sliderView;
  -[SBElasticValueViewController currentValue](self, "currentValue");
  -[CCUIBaseSliderView setValue:animated:](v45, "setValue:animated:", 0);
  v46 = self->_sliderView;
  -[SBElasticValueViewController sliderAccessibilityIdentifier](self, "sliderAccessibilityIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticSliderView setAccessibilityIdentifier:](v46, "setAccessibilityIdentifier:", v47);

  -[SBElasticSliderView setLeadingAccessoryView:](self->_sliderView, "setLeadingAccessoryView:", self->_leadingLabel);
  -[SBElasticSliderView setTrailingAccessoryView:](self->_sliderView, "setTrailingAccessoryView:", self->_trailingLabel);
  v48 = self->_sliderView;
  -[SBElasticHUDSettings labelPadding](self->_settings, "labelPadding");
  -[SBElasticSliderView setAccessoryViewPadding:](v48, "setAccessoryViewPadding:");
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderEditingDidBegin_, 0x10000);
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderValueDidChange_, 4096);
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderEditingDidEnd_, 0x40000);
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderIndirectInputDidBegin_, *MEMORY[0x1E0D145D8]);
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderIndirectInputDidEnd_, *MEMORY[0x1E0D145E0]);
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderTrackingDidBegin_, 1);
  -[SBElasticSliderView addTarget:action:forControlEvents:](self->_sliderView, "addTarget:action:forControlEvents:", self, sel__sliderTrackingDidEnd_, 448);
  v49 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v50 = (UIView *)objc_msgSend(v49, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  touchTrackingView = self->_touchTrackingView;
  self->_touchTrackingView = v50;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_touchTrackingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](self->_touchTrackingView, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setHitTestsAsOpaque:", 1);

  -[SBFTouchPassThroughView insertSubview:atIndex:](self->_sliderContainerView, "insertSubview:atIndex:", self->_touchTrackingView, 0);
  -[SBElasticSliderView addGestureRecognizer:](self->_sliderView, "addGestureRecognizer:", self->_shortLongPressGestureRecognizer);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObserver:selector:name:object:", self, sel__reduceMotionStatusDidChange, *MEMORY[0x1E0CEB090], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB090], 0);

  -[SBElasticValueViewController _stopMonitoringForSliderVisiblyOffscreen](self, "_stopMonitoringForSliderVisiblyOffscreen");
  -[SBElasticValueViewController _refreshDebugUI:](self, "_refreshDebugUI:", 1);
  v4.receiver = self;
  v4.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillLayoutSubviews
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[SBElasticValueViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5 + self->_positionOffset.x;
  v13 = v7 + self->_positionOffset.y;
  -[SBFTouchPassThroughView setFrame:](self->_sliderContainerView, "setFrame:", v12, v13, v9, v11);
  -[UIView setFrame:](self->_debugContainerView, "setFrame:", v12, v13, v9, v11);
}

- (void)setPositionOffset:(CGPoint)a3
{
  id v4;

  if (a3.x != self->_positionOffset.x || a3.y != self->_positionOffset.y)
  {
    self->_positionOffset = a3;
    -[SBElasticValueViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewWillAppear:](&v12, sel_viewWillAppear_);
  -[SBElasticValueViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticValueViewController log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 1024;
    v16 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%@ animated: %{BOOL}u", buf, 0x12u);

  }
  -[SBElasticValueViewController _updateLiveRenderingAssertion](self, "_updateLiveRenderingAssertion");
  -[SBElasticValueViewController _updateGlyphStateIfNecessaryForValue:](self, "_updateGlyphStateIfNecessaryForValue:", 0);
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__SBElasticValueViewController_viewWillAppear___block_invoke;
  v10[3] = &unk_1E8E9DED8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "performWithoutAnimation:", v10);

}

uint64_t __47__SBElasticValueViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v11, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    self->_axis = 0;
    v6 = -[SBElasticValueViewController axis](self, "axis");
    -[SBElasticValueViewController log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      _SBFLoggingMethodProem();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v6 > 2)
        v10 = CFSTR("both");
      else
        v10 = off_1E8EAA4D0[v6];
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "%@ axis: %@", buf, 0x16u);

    }
    -[SBElasticValueViewController _updateForAxisChange:](self, "_updateForAxisChange:", v6);
    if (self->_state == -1)
      -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 0, 0, 0);
  }
  else
  {
    -[SBElasticValueViewController _stopMonitoringForSliderVisiblyOffscreen](self, "_stopMonitoringForSliderVisiblyOffscreen");
  }
  -[SBElasticValueViewController _updateLiveRenderingAssertion](self, "_updateLiveRenderingAssertion");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  -[SBElasticValueViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v6;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%@ animated: %{BOOL}u", buf, 0x12u);

  }
  -[SBElasticValueViewController _refreshDebugUI:](self, "_refreshDebugUI:", 0);
  -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 1, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  -[SBElasticValueViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v6;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%@ animated: %{BOOL}u", buf, 0x12u);

  }
  -[SBElasticValueViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  -[SBElasticValueViewController _updateLiveRenderingAssertion](self, "_updateLiveRenderingAssertion");
  -[SBElasticValueViewController _actuallyDismiss](self, "_actuallyDismiss");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *state;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  SBFTouchPassThroughView *v22;
  SBElasticSliderView *v23;
  uint64_t v24;
  SBElasticSliderView *v25;
  void *v26;
  SBFTouchPassThroughView *v27;
  id v28;
  id v29;
  SBFTouchPassThroughView *v30;
  _QWORD v31[4];
  SBFTouchPassThroughView *v32;
  id v33;
  id v34[3];
  BOOL v35;
  _QWORD v36[5];
  SBFTouchPassThroughView *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  _QWORD v45[4];
  SBElasticSliderView *v46;
  id v47[7];
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;
  NSSize v56;

  height = a3.height;
  width = a3.width;
  v55 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBElasticValueViewController;
  -[SBElasticValueViewController viewWillTransitionToSize:withTransitionCoordinator:](&v48, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBElasticValueViewController log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v56.width = width;
    v56.height = height;
    NSStringFromSize(v56);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = v9;
    v51 = 2112;
    v52 = v10;
    v53 = 2112;
    v54 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%@ size:%@ coordinator:%@", buf, 0x20u);

  }
  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("viewWillTransitionToSize:withTranisitionCoordinator:"));
  self->_isRotating = 1;
  state = (void *)self->_state;
  BSRectWithSize();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[SBElasticValueViewController layoutAxisForInterfaceOrientation:](self, "layoutAxisForInterfaceOrientation:", -[SBElasticValueViewController _rotatingToInterfaceOrientation](self, "_rotatingToInterfaceOrientation"));
  v21 = v20 != (void *)-[SBElasticValueViewController axis](self, "axis");
  v22 = self->_sliderContainerView;
  v23 = self->_sliderView;
  objc_initWeak((id *)buf, self);
  v24 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v45[3] = &unk_1E8EAA170;
  objc_copyWeak(v47, (id *)buf);
  v25 = v23;
  v46 = v25;
  v47[1] = v20;
  v47[2] = state;
  v47[3] = v13;
  v47[4] = v15;
  v47[5] = v17;
  v47[6] = v19;
  v26 = (void *)MEMORY[0x1D17E5550](v45);
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v36[3] = &unk_1E8EAA198;
  v36[4] = self;
  v39 = v13;
  v40 = v15;
  v41 = v17;
  v42 = v19;
  v44 = v21;
  v27 = v22;
  v37 = v27;
  v28 = v26;
  v38 = v28;
  v43 = state;
  v31[0] = v24;
  v31[1] = 3221225472;
  v31[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v31[3] = &unk_1E8EAA1C0;
  objc_copyWeak(v34, (id *)buf);
  v35 = v21;
  v29 = v28;
  v33 = v29;
  v34[1] = v20;
  v30 = v27;
  v32 = v30;
  v34[2] = state;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v36, v31);

  objc_destroyWeak(v34);
  objc_destroyWeak(v47);
  objc_destroyWeak((id *)buf);

}

void __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_removeAllRetargetableAnimations:", 1);
  objc_msgSend(WeakRetained, "_updateForAxisChange:", *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateSliderViewMetricsForState:bounds:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

}

uint64_t __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "attachmentDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateAttachmentStateForHUDViewController:", *(_QWORD *)(a1 + 32));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateDimmingVisible:", *(_QWORD *)(a1 + 88) == 3);
}

void __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1083) = 0;
    if (*((_QWORD *)WeakRetained + 123))
    {
      if (*(_BYTE *)(a1 + 72))
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v3, "_updateLabelsForAxis:", *(_QWORD *)(a1 + 56));
      if (*(_BYTE *)(a1 + 72))
      {
        v4 = (void *)MEMORY[0x1E0CEABB0];
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
        v6[3] = &unk_1E8E9DED8;
        v7 = *(id *)(a1 + 32);
        objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.2);
        objc_msgSend(v3, "attachmentDelegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "updateAttachmentStateForHUDViewController:", v3);

      }
      objc_msgSend(v3, "_updateTouchTrackingArea");
      if (*(_QWORD *)(a1 + 64) != 3 || (objc_msgSend(v3, "isSliderTracking") & 1) == 0)
        objc_msgSend(v3, "_scheduleDismissal:", CFSTR("Rotation"));
    }
    else
    {
      objc_msgSend(WeakRetained, "_actuallyDismiss");
    }
  }

}

uint64_t __83__SBElasticValueViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_reduceMotionStatusDidChange
{
  self->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
}

- (void)updateValue:(float)a3
{
  double v5;
  uint64_t v6;

  if (!-[SBElasticValueViewController isSliderTracking](self, "isSliderTracking"))
  {
    if (-[SBElasticValueViewController isViewLoaded](self, "isViewLoaded"))
      v6 = -[SBElasticValueViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    else
      v6 = 0;
    *(float *)&v5 = a3;
    -[SBElasticValueViewController _updateSliderValue:animated:](self, "_updateSliderValue:animated:", v6, v5);
  }
}

- (void)reloadData
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[6];
  _QWORD v25[5];
  uint8_t buf[4];
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[SBElasticValueViewController _computeCachedRouteDisplayInformation](self, "_computeCachedRouteDisplayInformation"))
  {
    v3 = -[SBElasticValueViewController axis](self, "axis");
    v4 = self->_initialTransitionCompleted
      && -[SBElasticValueViewController _appearState](self, "_appearState") == 2
      && (self->_state & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v5 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42__SBElasticValueViewController_reloadData__block_invoke;
    v25[3] = &unk_1E8E9DED8;
    v25[4] = self;
    v6 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v25);
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __42__SBElasticValueViewController_reloadData__block_invoke_2;
    v24[3] = &unk_1E8E9DE88;
    v24[4] = self;
    v24[5] = v3;
    v7 = (void *)MEMORY[0x1D17E5550](v24);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __42__SBElasticValueViewController_reloadData__block_invoke_3;
    v23[3] = &unk_1E8E9DED8;
    v23[4] = self;
    v8 = (void *)MEMORY[0x1D17E5550](v23);
    if (v4)
    {
      v9 = (void *)MEMORY[0x1E0CEABB0];
      v22[0] = v5;
      v22[1] = 3221225472;
      v22[2] = __42__SBElasticValueViewController_reloadData__block_invoke_4;
      v22[3] = &unk_1E8E9DED8;
      v22[4] = self;
      v16[0] = v5;
      v16[1] = 3221225472;
      v16[2] = __42__SBElasticValueViewController_reloadData__block_invoke_5;
      v16[3] = &unk_1E8EAA1E8;
      v16[4] = self;
      v17 = v6;
      v20 = 0x3FE6666666666666;
      v21 = 6;
      v18 = v8;
      v19 = v7;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 65542, v22, v16, 0.1, 0.0);

      v10 = v17;
    }
    else
    {
      v6[2](v6);
      v11 = (void *)MEMORY[0x1E0CEABB0];
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __42__SBElasticValueViewController_reloadData__block_invoke_8;
      v13[3] = &unk_1E8EA06E0;
      v14 = v8;
      v15 = v7;
      objc_msgSend(v11, "performWithoutAnimation:", v13);

      v10 = v14;
    }

    -[SBElasticValueViewController log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v27 = v4;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Refreshing route UI animated: %{BOOL}u...", buf, 8u);
    }

  }
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1264);
  objc_msgSend(*(id *)(v2 + 1192), "glyphImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlyphImage:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1264);
  objc_msgSend(*(id *)(v5 + 1192), "glyphPackage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGlyphPackageDescription:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "_updateGlyphStateIfNecessaryForValue:", 0);
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLabelsForAxis:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "layoutIfNeeded");
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[158];
  objc_msgSend(v2, "glyphScaleForState:", v2[123]);
  objc_msgSend(v3, "setAdditiveGlyphScaleFactor:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "layoutIfNeeded");
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_4(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "additiveGlyphScaleFactor");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setAdditiveGlyphScaleFactor:", v2 * 0.875);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "layoutIfNeeded");
}

void __42__SBElasticValueViewController_reloadData__block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "layoutIfNeeded");
  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(double *)(a1 + 64);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(_QWORD *)(a1 + 72);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SBElasticValueViewController_reloadData__block_invoke_6;
  v11[3] = &unk_1E8E9E8D0;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v2, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v5, v11, 0, v3, 0.0, 0.5, 0.0);
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v7 = *(double *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __42__SBElasticValueViewController_reloadData__block_invoke_7;
  v9[3] = &unk_1E8E9E8D0;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v6, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v8, v9, 0, v7, 0.0, 1.0, 0.0);

}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SBElasticValueViewController_reloadData__block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setupFailureRelationshipForGestureRecognizer:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "requireGestureRecognizerToFail:", self->_shortLongPressGestureRecognizer);
  -[SBElasticValueViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    -[SBElasticValueViewController log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBElasticValueViewController setupFailureRelationshipForGestureRecognizer:].cold.1((uint64_t)v4, v7);

  }
}

- (CGPoint)centerForElasticHUDWhenInInteractingState
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
  double v16;
  double v17;
  CGPoint result;

  -[SBElasticValueViewController sliderView](self, "sliderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[SBFTouchPassThroughView bounds](self->_sliderContainerView, "bounds");
  -[SBElasticValueViewController centerForState:sliderSize:bounds:](self, "centerForState:sliderSize:bounds:", 3, v5, v7, v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)updateActiveRouteDisplay:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticValueViewController.m"), 496, CFSTR("Subclasses must implement this method and should not call super."));

  return 0;
}

- (id)overrideDisplayNameForRoute:(id)a3
{
  return 0;
}

- (double)interactiveValueUpdateDiscontinuityInterval
{
  return 0.0;
}

- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
    return 1;
  else
    return 2;
}

- (id)createSliderView
{
  SBElasticSliderView *v2;
  SBElasticSliderView *v3;

  v2 = [SBElasticSliderView alloc];
  v3 = -[SBElasticSliderView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CCUIBaseSliderView setShouldScaleWithButtonInput:](v3, "setShouldScaleWithButtonInput:", 1);
  return v3;
}

- (id)sliderAccessibilityIdentifier
{
  return CFSTR("sb-unspecified-elastic-hud");
}

- (NSArray)physicalButtonSceneTargets
{
  return 0;
}

- (BOOL)definesAnimatedDismissal
{
  return 1;
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBElasticValueViewController_dismissAnimatedWithCompletion___block_invoke;
  v6[3] = &unk_1E8EAA210;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 0, 1, v6);

}

uint64_t __62__SBElasticValueViewController_dismissAnimatedWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v6;
  uint64_t result;

  if (a4)
    v6 = 0;
  else
    v6 = a5;
  if ((_DWORD)v6 == 1)
    objc_msgSend(*(id *)(a1 + 32), "_actuallyDismiss");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v6);
  return result;
}

- (int64_t)triggerButton
{
  return 0;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 0;
}

- (BOOL)isHUDAttached
{
  return self->_isHUDAttached;
}

- (void)setHUDAttached:(BOOL)a3
{
  id v4;

  self->_isHUDAttached = a3;
  -[SBElasticValueViewController attachmentDelegate](self, "attachmentDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAttachmentStateForHUDViewController:", self);

}

- (float)currentValue
{
  void *v3;
  float v4;
  float v5;

  -[SBElasticValueViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elasticValueViewControllerCurrentValue:", self);
  v5 = v4;

  return v5;
}

- (void)changeValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a4;
  if (-[SBElasticValueViewController _changeValue:](self, "_changeValue:"))
  {
    *(float *)&v7 = a3;
    -[SBElasticValueViewController _updateSliderValue:animated:](self, "_updateSliderValue:animated:", v4, v7);
  }
  else
  {
    -[SBElasticValueViewController log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Data source rejected updateCurrentValue; skipping...",
        v9,
        2u);
    }

  }
}

- (BOOL)_changeValue:(float)a3
{
  SBElasticValueViewController *v4;
  void *v5;
  double v6;

  v4 = self;
  -[SBElasticValueViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  LOBYTE(v4) = objc_msgSend(v5, "elasticValueViewController:updateCurrentValue:", v4, v6);

  return (char)v4;
}

- (unint64_t)axis
{
  unint64_t result;

  result = self->_axis;
  if (!result)
  {
    result = -[SBElasticValueViewController layoutAxisForInterfaceOrientation:](self, "layoutAxisForInterfaceOrientation:", -[SBElasticValueViewController hudPresentationOrientation](self, "hudPresentationOrientation"));
    self->_axis = result;
  }
  return result;
}

- (int64_t)hudPresentationOrientation
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;

  -[SBElasticValueViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "interfaceOrientation");
  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
      NSLog(CFSTR("This isn't the worst thing in the world, but why do we need to know our orientation if we're not in a window?"));
    v4 = 1;
  }

  return v4;
}

- (void)transitionStateContextuallyForValueChangeEvent
{
  uint64_t v3;

  if (-[SBElasticValueViewController _appearState](self, "_appearState") == 2)
  {
    if (self->_state || self->_initialTransitionCompleted)
      v3 = 2;
    else
      v3 = 1;
    -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", v3, 1, 0);
  }
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  int64_t state;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  SBElasticValueViewController *v13;
  SBElasticValueViewController *v14;
  BOOL v15;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  UISegmentedControl *v21;
  id *v22;
  _UILegibilityLabel *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void (**v41)(_QWORD);
  void (**v42)(_QWORD);
  id v43;
  id *v44;
  _UILegibilityLabel *v45;
  id v46;
  id v47;
  id v48;
  UISegmentedControl *v49;
  UISegmentedControl *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  _BOOL4 v55;
  _UILegibilityLabel *v56;
  id v57;
  id *v58;
  void (**v59)(void);
  void *v60;
  void *v61;
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id *location;
  _QWORD v64[4];
  void (**v65)(_QWORD);
  void (**v66)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v67[3];
  _QWORD v68[4];
  UISegmentedControl *v69;
  id v70;
  id v71[3];
  _QWORD v72[4];
  id v73[2];
  _QWORD v74[4];
  id v75;
  id v76;
  id v77[3];
  _QWORD v78[4];
  id v79;
  SBElasticValueViewController *v80;
  _UILegibilityLabel *v81;
  id *v82;
  id v83;
  id v84;
  id v85;
  id v86[4];
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93[4];
  char v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  uint64_t v101;
  _QWORD v102[5];
  uint64_t v103;
  _QWORD v104[5];
  uint8_t buf[4];
  const __CFString *v106;
  __int16 v107;
  const __CFString *v108;
  uint64_t v109;

  v5 = a4;
  v109 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  state = self->_state;
  if (-[SBElasticValueViewController _isStateChangeAllowedFrom:toState:](self, "_isStateChangeAllowedFrom:toState:", state, a3))
  {
    if (self->_lockState)
    {
      if (a3)
        goto LABEL_38;
      v55 = v5;
      v62 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8;
      a3 = 1;
    }
    else
    {
      v55 = v5;
      v62 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8;
    }
    -[SBElasticValueViewController log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(state + 1) > 5)
        v11 = CFSTR("Invalid state");
      else
        v11 = off_1E8EAA518[state + 1];
      if ((unint64_t)(a3 + 1) > 5)
        v12 = CFSTR("Invalid state");
      else
        v12 = off_1E8EAA518[a3 + 1];
      *(_DWORD *)buf = 138543618;
      v106 = v11;
      v107 = 2114;
      v108 = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to transition from %{public}@ -> %{public}@", buf, 0x16u);
    }

    self->_previousState = state;
    self->_state = a3;
    objc_initWeak((id *)buf, self);
    v13 = self;
    v14 = v13;
    if (state)
      v15 = 0;
    else
      v15 = a3 == 1;
    if (v15)
    {
      v17 = MEMORY[0x1E0C809B0];
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke;
      v104[3] = &unk_1E8E9DED8;
      v104[4] = v13;
      v18 = (void *)MEMORY[0x1D17E5550](v104);
      v103 = v17;
      v19 = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_77;
      v20 = &v103;
    }
    else
    {
      if (state == -1 || a3 != 0)
      {
        v17 = MEMORY[0x1E0C809B0];
        v53 = 0;
        v18 = 0;
        goto LABEL_28;
      }
      v17 = MEMORY[0x1E0C809B0];
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_78;
      v102[3] = &unk_1E8E9DED8;
      v102[4] = v13;
      v18 = (void *)MEMORY[0x1D17E5550](v102);
      v101 = v17;
      v19 = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_79;
      v20 = &v101;
    }
    v20[1] = 3221225472;
    v20[2] = (uint64_t)v19;
    v20[3] = (uint64_t)&unk_1E8E9DED8;
    v20[4] = (uint64_t)v14;
    v53 = (void *)MEMORY[0x1D17E5550]();
LABEL_28:
    v21 = v14->_debugStateSegmentedControl;
    v22 = v14->_leadingLabel;
    v23 = v14->_trailingLabel;
    -[SBElasticValueViewController sliderView](v14, "sliderView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    location = -[SBElasticValueViewController axis](v14, "axis");
    v56 = v23;
    v58 = v22;
    v49 = v21;
    -[SBFTouchPassThroughView bounds](v14->_sliderContainerView, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    LOBYTE(v21) = v14->_reduceMotionEnabled;
    v99[0] = v17;
    v99[1] = 3221225472;
    v99[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_80;
    v99[3] = &unk_1E8EAA238;
    objc_copyWeak(&v100, (id *)buf);
    v32 = (void *)MEMORY[0x1D17E5550](v99);
    v97[0] = v17;
    v97[1] = 3221225472;
    v97[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2;
    v97[3] = &unk_1E8EAA260;
    objc_copyWeak(&v98, (id *)buf);
    v51 = (void *)MEMORY[0x1D17E5550](v97);
    v96 = 0;
    v95 = 0;
    -[SBElasticValueViewController _sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:](v14, "_sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:", a3, &v96, &v95, v25, v27, v29, v31);
    v33 = (void *)MEMORY[0x1D17E5550](v96);
    v34 = (void *)MEMORY[0x1D17E5550](v95);
    v87[0] = v17;
    v87[1] = 3221225472;
    v87[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3;
    v87[3] = &unk_1E8EAA288;
    objc_copyWeak(v93, (id *)buf);
    v43 = v18;
    v89 = v43;
    v93[1] = (id)state;
    v93[2] = (id)a3;
    v35 = v32;
    v90 = v35;
    v93[3] = location;
    v94 = (char)v21;
    v36 = v33;
    v91 = v36;
    v37 = v60;
    v88 = v37;
    v38 = v34;
    v92 = v38;
    v59 = (void (**)(void))MEMORY[0x1D17E5550](v87);
    v78[0] = v17;
    v78[1] = 3221225472;
    v78[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_85;
    v78[3] = &unk_1E8EAA2B0;
    objc_copyWeak(v86, (id *)buf);
    v86[1] = (id)state;
    v86[2] = (id)a3;
    v46 = v37;
    v79 = v46;
    v80 = v14;
    v48 = v36;
    v83 = v48;
    v47 = v35;
    v84 = v47;
    v86[3] = location;
    v39 = v51;
    v85 = v39;
    v45 = v56;
    v81 = v45;
    v44 = v58;
    v82 = v44;
    v61 = (void *)MEMORY[0x1D17E5550](v78);
    v74[0] = v17;
    v74[1] = 3221225472;
    v74[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_87;
    v74[3] = &unk_1E8EAA2F8;
    objc_copyWeak(v77, (id *)buf);
    v57 = v38;
    v75 = v57;
    v52 = v39;
    v76 = v52;
    v77[1] = (id)a3;
    v77[2] = location;
    v40 = (void *)MEMORY[0x1D17E5550](v74);
    v72[0] = v17;
    v72[1] = 3221225472;
    v72[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3_88;
    v72[3] = &unk_1E8EAA320;
    objc_copyWeak(v73, (id *)buf);
    v73[1] = (id)state;
    v41 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v72);
    v68[0] = v17;
    v68[1] = 3221225472;
    v68[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_4;
    v68[3] = &unk_1E8EAA348;
    objc_copyWeak(v71, (id *)buf);
    v71[1] = (id)state;
    v71[2] = (id)a3;
    v50 = v49;
    v69 = v50;
    v54 = v53;
    v70 = v54;
    v42 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v68);
    if (state == -1
      || a3
      || !-[SBElasticValueViewController bs_isAppearingOrAppeared](v14, "bs_isAppearingOrAppeared"))
    {
      -[SBElasticValueViewController _stopMonitoringForSliderVisiblyOffscreen](v14, "_stopMonitoringForSliderVisiblyOffscreen");
    }
    else
    {
      -[SBElasticValueViewController _startMonitoringForSliderVisiblyOffscreen](v14, "_startMonitoringForSliderVisiblyOffscreen");
    }
    v59[2]();
    if (v55)
    {
      v64[0] = v17;
      v64[1] = 3221225472;
      v64[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_93;
      v64[3] = &unk_1E8EAA370;
      v65 = v42;
      objc_copyWeak(v67, (id *)buf);
      v66 = v62;
      v67[1] = (id)state;
      v67[2] = (id)a3;
      -[SBElasticValueViewController _animateFromState:toState:primaryAnimations:primaryCompletion:positionAnimations:positionCompletion:finalCompletion:](v14, "_animateFromState:toState:primaryAnimations:primaryCompletion:positionAnimations:positionCompletion:finalCompletion:", state, a3, v61, &__block_literal_global_107, v40, v41, v64, v43);

      objc_destroyWeak(v67);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v61);
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v40);
      v41[2](v41);
      v42[2](v42);
      if (v62)
        v62[2](v62, state, a3, self->_state, 1);
    }

    objc_destroyWeak(v71);
    objc_destroyWeak(v73);

    objc_destroyWeak(v77);
    objc_destroyWeak(v86);

    objc_destroyWeak(v93);
    objc_destroyWeak(&v98);

    objc_destroyWeak(&v100);
    objc_destroyWeak((id *)buf);
    v8 = v62;
    goto LABEL_38;
  }
  if (v8)
    (*((void (**)(id, int64_t, int64_t, int64_t, _QWORD))v8 + 2))(v8, state, a3, self->_state, 0);
LABEL_38:

}

uint64_t __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  SBLogTelemetrySignposts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_PRESENT_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBElasticValueViewControllerWillPresentNotificationName"), *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setHUDAttached:", 0);
}

uint64_t __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_77(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  SBLogTelemetrySignposts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_PRESENT_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBElasticValueViewControllerDidPresentNotificationName"), *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setHUDAttached:", 1);
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  SBLogTelemetrySignposts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_DISMISS_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBElasticValueViewControllerWillDismissNotificationName"), *(_QWORD *)(a1 + 32));

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_79(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  SBLogTelemetrySignposts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HUD_DISMISS_VOLUME", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBElasticValueViewControllerDidDismissNotificationName"), *(_QWORD *)(a1 + 32));

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_80(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLabelsForAxis:", a2);

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTouchTrackingArea");

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    objc_msgSend(WeakRetained, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 80) + 1;
      if (v5 > 5)
        v6 = CFSTR("Invalid state");
      else
        v6 = off_1E8EAA518[v5];
      v7 = *(_QWORD *)(a1 + 88) + 1;
      if (v7 > 5)
        v8 = CFSTR("Invalid state");
      else
        v8 = off_1E8EAA518[v7];
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "(State transition from %{public}@ -> %{public}@) preAnimations", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(WeakRetained, "_invalidateDismissalTimerForReason:", CFSTR("transitionToState pre-animations"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (*(_BYTE *)(a1 + 104) && !*(_QWORD *)(a1 + 80))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    }
  }

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_85(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 96) + 1;
      if (v5 > 5)
        v6 = CFSTR("Invalid state");
      else
        v6 = off_1E8EAA518[v5];
      v7 = *(_QWORD *)(a1 + 104) + 1;
      if (v7 > 5)
        v8 = CFSTR("Invalid state");
      else
        v8 = off_1E8EAA518[v7];
      v22 = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "(State transition from %{public}@ -> %{public}@) animations", (uint8_t *)&v22, 0x16u);
    }

    objc_msgSend(v3, "_updateDimmingVisible:", *(_QWORD *)(a1 + 104) == 3);
    v9 = *(_QWORD *)(a1 + 104);
    if (v9 == 2)
    {
      v10 = 0;
    }
    else
    {
      if (v9)
        v11 = 0;
      else
        v11 = *(_QWORD *)(a1 + 96) == 2;
      v10 = !v11;
    }
    objc_msgSend(*(id *)(a1 + 32), "setGlyphVisible:", v10);
    v12 = *(void **)(a1 + 32);
    v13 = *(void **)(*(_QWORD *)(a1 + 40) + 1256);
    if (*(_QWORD *)(a1 + 104) == 3)
      objc_msgSend(v13, "interactingStretchAmount");
    else
      objc_msgSend(v13, "compactStretchAmount");
    objc_msgSend(v12, "setElasticContentStretchAmount:");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v14 = *(void **)(a1 + 48);
    if (*(_QWORD *)(a1 + 112))
    {
      if (*(_QWORD *)(a1 + 104) == 3)
        v15 = 1.0;
      else
        v15 = 0.0;
      objc_msgSend(v14, "setAlpha:", v15);
      v16 = *(void **)(a1 + 56);
      if (*(_QWORD *)(a1 + 104) == 3)
        v17 = 1.0;
      else
        v17 = 0.0;
    }
    else
    {
      objc_msgSend(v14, "setAlpha:", 0.0);
      v16 = *(void **)(a1 + 56);
      v17 = 0.0;
    }
    objc_msgSend(v16, "setAlpha:", v17);
    v18 = *(_QWORD *)(a1 + 104);
    if (v18)
      objc_msgSend(*(id *)(a1 + 32), "setShadowMode:", v18 == 2);
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    if (v3[1084])
    {
      v19 = *(_QWORD *)(a1 + 104);
      if (!v19 || !*(_QWORD *)(a1 + 96))
      {
        if (v19)
          v20 = 1.0;
        else
          v20 = 0.0;
        objc_msgSend(v3, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAlpha:", v20);

      }
    }
  }

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_87(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_3_88(uint64_t a1)
{
  _BYTE *WeakRetained;
  int v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained[1080];
    if (*(_QWORD *)(a1 + 40))
    {
      if (WeakRetained[1080])
        goto LABEL_8;
    }
    else
    {
      WeakRetained[1080] = 1;
      if (v3)
        goto LABEL_8;
    }
    if (*((_QWORD *)WeakRetained + 123) == 1)
    {
      WeakRetained[1080] = 1;
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_beginDeflationDismissalAnimation");
      WeakRetained = v4;
    }
  }
LABEL_8:

}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 56) + 1;
      if (v5 > 5)
        v6 = CFSTR("Invalid state");
      else
        v6 = off_1E8EAA518[v5];
      v7 = *(_QWORD *)(a1 + 64) + 1;
      if (v7 > 5)
        v8 = CFSTR("Invalid state");
      else
        v8 = off_1E8EAA518[v7];
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "(State transition from %{public}@ -> %{public}@) postAnimations", buf, 0x16u);
    }

    v9 = *(_QWORD *)(a1 + 64);
    if (v9 && v9 != 3 && (objc_msgSend(v3[131], "isValid") & 1) == 0 && v3[123] == *(id *)(a1 + 64))
    {
      objc_msgSend(v3[157], "postTransitionDismissalInterval");
      v11 = v10;
      v12 = *(_QWORD *)(a1 + 56) + 1;
      if (v12 > 5)
        v13 = CFSTR("Invalid state");
      else
        v13 = off_1E8EAA518[v12];
      v14 = *(_QWORD *)(a1 + 64) + 1;
      if (v14 > 5)
        v15 = CFSTR("Invalid state");
      else
        v15 = off_1E8EAA518[v14];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transition from %@ -> %@"), v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_scheduleDismissal:afterInterval:", v16, v11);

    }
    objc_msgSend(v3, "_updateDebugUIPositions");
    v17 = *(void **)(a1 + 32);
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CEABB0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_92;
      v22[3] = &unk_1E8E9DE88;
      v19 = v17;
      v20 = *(_QWORD *)(a1 + 64);
      v23 = v19;
      v24 = v20;
      objc_msgSend(v18, "performWithoutAnimation:", v22);

    }
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      (*(void (**)(void))(v21 + 16))();
  }

}

uint64_t __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_92(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedSegmentIndex:", *(_QWORD *)(a1 + 40));
}

void __70__SBElasticValueViewController_transitionToState_animated_completion___block_invoke_2_93(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
    v6 = *((_QWORD *)WeakRetained + 123);
  else
    v6 = 0;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v5;
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v7 + 16))(v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6, a2);
    v5 = v8;
  }

}

- (void)_animateFromState:(int64_t)a3 toState:(int64_t)a4 primaryAnimations:(id)a5 primaryCompletion:(id)a6 positionAnimations:(id)a7 positionCompletion:(id)a8 finalCompletion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39[2];
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  id location[2];
  CAFrameRateRange v49;
  CAFrameRateRange v50;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  -[SBElasticValueViewController settings](self, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v35 = v19;
  v36 = (void *)a4;
  if (!a3 && a4 == 1)
  {
    objc_msgSend(v20, "baseToInitialTransitionSettings", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "baseToInitialPositionSettings");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (a3 == 1 && a4 == 4)
  {
    objc_msgSend(v20, "deflationTransitionSettings", v19);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a3 != 4 || a4)
  {
    if (a4)
    {
      v25 = 0;
      goto LABEL_17;
    }
    if (a3 == 2 && !self->_reduceMotionEnabled)
    {
      objc_msgSend(v20, "compactToBaseTransitionSettings", v19);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "generalToBaseTransitionSettings", v19);
      v24 = objc_claimAutoreleasedReturnValue();
    }
LABEL_7:
    v22 = (void *)v24;
    v25 = 0;
    if (v24)
      goto LABEL_13;
LABEL_17:
    objc_msgSend(v21, "defaultTransitionSettings", v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      goto LABEL_14;
LABEL_18:
    v25 = v22;
    goto LABEL_14;
  }
  objc_msgSend(v20, "deflatingToBaseTransitionSettings", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deflatingToBasePositionSettings");
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v25 = (id)v23;
  if (!v22)
    goto LABEL_17;
LABEL_13:
  if (!v25)
    goto LABEL_18;
LABEL_14:
  v49 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v22, "setFrameRateRange:highFrameRateReason:", 1114141, *(double *)&v49.minimum, *(double *)&v49.maximum, *(double *)&v49.preferred);
  v50 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v25, "setFrameRateRange:highFrameRateReason:", 1114141, *(double *)&v50.minimum, *(double *)&v50.maximum, *(double *)&v50.preferred);
  objc_initWeak(location, self);
  v26 = (void *)MEMORY[0x1E0DA9D48];
  v27 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke;
  v40[3] = &unk_1E8EAA3C0;
  v28 = v22;
  v41 = v28;
  v47 = 3;
  v29 = v15;
  v43 = v29;
  v30 = v16;
  v44 = v30;
  v31 = v25;
  v42 = v31;
  v32 = v17;
  v45 = v32;
  v33 = v18;
  v46 = v33;
  v37[0] = v27;
  v37[1] = 3221225472;
  v37[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_4;
  v37[3] = &unk_1E8EAA3E8;
  objc_copyWeak(v39, location);
  v34 = v35;
  v38 = v34;
  v39[1] = v36;
  objc_msgSend(v26, "perform:finalCompletion:", v40, v37);

  objc_destroyWeak(v39);
  objc_destroyWeak(location);

}

void __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke(uint64_t a1, _QWORD *a2)
{
  void (*v4)(void);
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = (void (*)(void))a2[2];
  v5 = a2;
  v4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_2;
  v22[3] = &unk_1E8EAA398;
  v11 = *(_QWORD *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = v6;
  v12 = v6;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v8, v9, v11, v22);
  ((void (*)(id, const __CFString *))a2[2])(v5, CFSTR("positionAnimations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CEABB0];
  v15 = *(_QWORD *)(a1 + 40);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_3;
  v19[3] = &unk_1E8EAA398;
  v16 = *(_QWORD *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 80);
  v20 = *(id *)(a1 + 72);
  v21 = v13;
  v18 = v13;
  objc_msgSend(v14, "sb_animateWithSettings:mode:animations:completion:", v15, v17, v16, v19);

}

uint64_t __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __148__SBElasticValueViewController__animateFromState_toState_primaryAnimations_primaryCompletion_positionAnimations_positionCompletion_finalCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    v3 = *((_QWORD *)WeakRetained + 123);
  else
    v3 = 0;
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == *(_QWORD *)(a1 + 48));

}

- (BOOL)_isStateChangeAllowedFrom:(int64_t)a3 toState:(int64_t)a4
{
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *v12;
  BOOL v13;
  void *v14;
  char v15;
  NSObject *v16;
  const __CFString *v17;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_isRotating)
  {
    -[SBElasticValueViewController log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 + 1) > 5)
        v8 = CFSTR("Invalid state");
      else
        v8 = off_1E8EAA518[a3 + 1];
      if ((unint64_t)(a4 + 1) > 5)
        v11 = CFSTR("Invalid state");
      else
        v11 = off_1E8EAA518[a4 + 1];
      *(_DWORD *)buf = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v11;
      v12 = "Denying state change from %{public}@ -> %{public}@; no state changes while rotating.";
LABEL_34:
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (a3 == a4)
  {
    -[SBElasticValueViewController log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("Null");
      switch(a3)
      {
        case -1:
          break;
        case 0:
          v9 = CFSTR("Base");
          break;
        case 1:
          v9 = CFSTR("Initial");
          break;
        case 2:
          v9 = CFSTR("Compact");
          break;
        case 3:
          v9 = CFSTR("Interacting");
          break;
        case 4:
          v9 = CFSTR("Deflated");
          break;
        default:
          v9 = CFSTR("Invalid state");
          break;
      }
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      v22 = 2114;
      v23 = v9;
      v12 = "Denying state change from %{public}@ -> %{public}@; this is the same state.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (a3 == -1 && a4)
  {
    -[SBElasticValueViewController log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a4 + 1) > 5)
        v10 = CFSTR("Invalid state");
      else
        v10 = off_1E8EAA4E8[a4 + 1];
      *(_DWORD *)buf = 138543618;
      v21 = CFSTR("Null");
      v22 = 2114;
      v23 = v10;
      v12 = "Denying state change from %{public}@ -> %{public}@; NULL can only transition to base.";
      goto LABEL_34;
    }
LABEL_35:
    v13 = 0;
    goto LABEL_36;
  }
  if (!a3)
  {
    -[SBElasticValueViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v15 = objc_msgSend(v14, "elasticValueViewControllerCanBePresented:withReason:", self, &v19);
    v7 = v19;

    if ((v15 & 1) != 0)
    {
      v13 = 1;
LABEL_36:

      return v13;
    }
    -[SBElasticValueViewController log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a4 + 1) > 5)
        v17 = CFSTR("Invalid state");
      else
        v17 = off_1E8EAA518[a4 + 1];
      *(_DWORD *)buf = 138543874;
      v21 = CFSTR("Base");
      v22 = 2114;
      v23 = v17;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Denying state change from %{public}@ -> %{public}@; presentation disallowed by delegate with reason: %{public}@",
        buf,
        0x20u);
    }

    goto LABEL_35;
  }
  return 1;
}

- (void)_beginDeflationDismissalAnimation
{
  if (!self->_reduceMotionEnabled)
  {
    -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 4, 1, 0);
    -[SBElasticHUDSettings deflationDismissalInterval](self->_settings, "deflationDismissalInterval");
    -[SBElasticValueViewController _scheduleDismissal:afterInterval:](self, "_scheduleDismissal:afterInterval:", CFSTR("Deflation"));
  }
}

- (void)_startMonitoringForSliderVisiblyOffscreen
{
  NSObject *v3;
  CADisplayLink *v4;
  CADisplayLink *displayLinkForVisiblyOffscreenMonitoring;
  CADisplayLink *v6;
  void *v7;
  uint8_t v8[16];

  if (!self->_displayLinkForVisiblyOffscreenMonitoring)
  {
    -[SBElasticValueViewController log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Started monitoring for being visibly offscreen", v8, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
    v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLinkForVisiblyOffscreenMonitoring = self->_displayLinkForVisiblyOffscreenMonitoring;
    self->_displayLinkForVisiblyOffscreenMonitoring = v4;

    v6 = self->_displayLinkForVisiblyOffscreenMonitoring;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

  }
}

- (void)_stopMonitoringForSliderVisiblyOffscreen
{
  NSObject *v3;
  CADisplayLink *displayLinkForVisiblyOffscreenMonitoring;
  uint8_t v5[16];

  if (self->_displayLinkForVisiblyOffscreenMonitoring)
  {
    -[SBElasticValueViewController log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Stopped monitoring for being visibly offscreen", v5, 2u);
    }

    -[CADisplayLink invalidate](self->_displayLinkForVisiblyOffscreenMonitoring, "invalidate");
    displayLinkForVisiblyOffscreenMonitoring = self->_displayLinkForVisiblyOffscreenMonitoring;
    self->_displayLinkForVisiblyOffscreenMonitoring = 0;

  }
}

- (void)_displayLinkFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  NSObject *v43;
  SBElasticValueViewController *v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;

  v52 = *MEMORY[0x1E0C80C00];
  if (self->_state)
    return;
  -[SBElasticValueViewController sliderView](self, "sliderView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  objc_msgSend(v5, "bounds");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v5, "presentationModifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v7)
  {

    goto LABEL_20;
  }
  v8 = v7;
  v44 = self;
  v45 = v4;
  v9 = 0;
  v10 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v12, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", CFSTR("position"));

      if (v14)
      {
        objc_msgSend(v12, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CGPointValue");
        v9 = 1;
      }
      else
      {
        objc_msgSend(v12, "keyPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", CFSTR("bounds"));

        if (!v17)
          continue;
        objc_msgSend(v12, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CGRectValue");
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v8);

  v4 = v45;
  if ((v9 & 1) != 0)
  {
    SBUnintegralizedRectCenteredAboutPoint();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v45, "shadowOutsets");
    v27 = v19 + v26;
    v29 = v21 + v28;
    v31 = v23 - (v26 + v30);
    v33 = v25 - (v28 + v32);
    -[SBElasticValueViewController view](v44, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    v53.origin.x = v27;
    v53.origin.y = v29;
    v53.size.width = v31;
    v53.size.height = v33;
    v54.origin.x = v36;
    v54.origin.y = v38;
    v54.size.width = v40;
    v54.size.height = v42;
    if (!CGRectIntersectsRect(v53, v54))
    {
      -[SBElasticValueViewController log](v44, "log");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "Dismissing immediately due to being visibly offscreen in the base state", buf, 2u);
      }

      -[SBElasticValueViewController _actuallyDismiss](v44, "_actuallyDismiss");
    }
  }
LABEL_20:

}

- (void)_scheduleDismissal:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  -[SBElasticValueViewController settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissalInterval");
  v6 = v5;

  -[SBElasticValueViewController _scheduleDismissal:afterInterval:](self, "_scheduleDismissal:afterInterval:", v7, v6);
}

- (void)_scheduleDismissal:(id)a3 afterInterval:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *dismissalTimer;
  void *v12;
  NSObject *v13;
  NSTimer *v14;
  const __CFString *v15;
  id v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBElasticValueViewController log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = a4;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "_scheduleDismissal after %fs: %{public}@", buf, 0x16u);
  }

  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("SCHEDULING NEW DISMISSAL TIMER"));
  v8 = (void *)MEMORY[0x1E0C99E88];
  v15 = CFSTR("DismissalReason");
  v16 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__dismissalTimerFired_, v9, 0, a4);
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = v10;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTimer:forMode:", self->_dismissalTimer, *MEMORY[0x1E0C99860]);

  -[SBElasticValueViewController log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_dismissalTimer;
    *(_DWORD *)buf = 138543362;
    v18 = *(double *)&v14;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "_scheduleDismissal's new timer: %{public}@", buf, 0xCu);
  }

}

- (void)_invalidateDismissalTimerForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSTimer *dismissalTimer;
  NSTimer *v9;
  int v10;
  void *v11;
  __int16 v12;
  NSTimer *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBElasticValueViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSTimer userInfo](self->_dismissalTimer, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("DismissalReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dismissalTimer = self->_dismissalTimer;
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = dismissalTimer;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "_invalidateDismissalTimer; (original dismissal timer reason: '%{public}@') -- invalidating %{public}@ for reason '%{public}@'",
      (uint8_t *)&v10,
      0x20u);

  }
  -[NSTimer invalidate](self->_dismissalTimer, "invalidate");
  v9 = self->_dismissalTimer;
  self->_dismissalTimer = 0;

}

- (void)_dismissalTimerFired:(id)a3
{
  NSTimer *v5;
  NSObject *v6;
  NSTimer *dismissalTimer;
  void *v8;
  void *v9;
  NSObject *v10;
  NSTimer *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  NSTimer *v17;
  id v18;
  id location;
  uint8_t buf[4];
  NSTimer *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (NSTimer *)a3;
  -[SBElasticValueViewController log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dismissalTimer = self->_dismissalTimer;
    -[NSTimer userInfo](dismissalTimer, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("DismissalReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = dismissalTimer;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; (original dismissal timer reason: '%{public}@')",
      buf,
      0x16u);

  }
  if (self->_dismissalTimer != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticValueViewController.m"), 1078, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timer == _dismissalTimer"));

  }
  if (-[SBElasticValueViewController isSliderTracking](self, "isSliderTracking")
    || self->_sliderIsEditing
    || self->_lockState)
  {
    -[SBElasticValueViewController _scheduleDismissal:](self, "_scheduleDismissal:", CFSTR("We're tracking / expanded; deferring dismissal timer fire."));
    -[SBElasticValueViewController log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_dismissalTimer;
      v12 = -[SBElasticValueViewController isSliderTracking](self, "isSliderTracking");
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 1024;
      LODWORD(v23) = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; aborting dismissal; tracking state has us locked down. (isSliderTracking:%{BOOL"
        "}u, _lockState:{BOOL}u",
        buf,
        0x12u);
    }
  }
  else
  {
    -[NSTimer userInfo](v5, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("DismissalReason"));
    v10 = objc_claimAutoreleasedReturnValue();

    -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("DISMISSAL TIMER FIRED; CLEANUP ANY RESIDUAL STATE"));
    objc_initWeak(&location, self);
    -[SBElasticValueViewController log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; transitioning to base state for dismissal",
        buf,
        0xCu);
    }

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__SBElasticValueViewController__dismissalTimerFired___block_invoke;
    v16[3] = &unk_1E8EAA410;
    objc_copyWeak(&v18, &location);
    v17 = v5;
    -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 0, 1, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __53__SBElasticValueViewController__dismissalTimerFired___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  _BYTE *WeakRetained;
  _BYTE *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained && a5)
  {
    objc_msgSend(WeakRetained, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "_dismissalTimerFired:%{public}@; transitioned to base state for dismissal.",
        (uint8_t *)&v18,
        0xCu);
    }

    if (a4)
    {
      objc_msgSend(v9, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v13;
      v14 = "_dismissalTimerFired:%{public}@; dismissal was cancelled.  Bailing.";
    }
    else
    {
      objc_msgSend(v9, "settings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "autoDismiss");

      if (v16)
        objc_msgSend(v9, "_actuallyDismiss");
      v9[1080] = 0;
      objc_msgSend(v9, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v17;
      v14 = "_dismissalTimerFired:%{public}@; dismissal complete.  Mission Accomplished.";
    }
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)_actuallyDismiss
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SBElasticValueViewController _stopMonitoringForSliderVisiblyOffscreen](self, "_stopMonitoringForSliderVisiblyOffscreen");
  -[SBElasticValueViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elasticValueViewControllerNeedsDismissal:", self);

  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("actually dismissing"));
  -[SBElasticValueViewController log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "_actuallyDismiss -- actually dismissing.", v5, 2u);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_state != 0;
}

- (void)_handleShortLongPressGestureRecognizer:(id)a3
{
  uint64_t v4;

  if (self->_shortLongPressGestureRecognizer == a3)
  {
    v4 = objc_msgSend(a3, "state");
    if (v4 != 2)
    {
      if (v4 == 1)
      {
        -[SBElasticValueViewController _noteSliderViewDidBeginTracking](self, "_noteSliderViewDidBeginTracking");
        -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", 3, 1, 0);
      }
      else
      {
        -[SBElasticValueViewController _noteSliderViewDidEndTracking](self, "_noteSliderViewDidEndTracking");
      }
    }
  }
}

- (void)_sliderEditingDidBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  NSTimer *v8;
  NSTimer *sliderApplyValueTimer;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  self->_sliderIsEditing = 1;
  -[SBElasticValueViewController noteContinuousValueInteractionWillBegin](self, "noteContinuousValueInteractionWillBegin");
  if (!self->_sliderApplyValueTimer)
  {
    -[SBElasticValueViewController interactiveValueUpdateDiscontinuityInterval](self, "interactiveValueUpdateDiscontinuityInterval");
    v6 = v5;
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__SBElasticValueViewController__sliderEditingDidBegin___block_invoke;
    v10[3] = &unk_1E8E9FA90;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, v10, v6);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    sliderApplyValueTimer = self->_sliderApplyValueTimer;
    self->_sliderApplyValueTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __55__SBElasticValueViewController__sliderEditingDidBegin___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;

  if (objc_msgSend(a2, "isValid"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v4 = (void *)WeakRetained[133];
      if (v4)
      {
        v7 = WeakRetained;
        v5 = v4;
        objc_msgSend(v5, "floatValue");
        objc_msgSend(v7, "_changeValue:");
        v6 = (void *)v7[133];
        v7[133] = 0;

        WeakRetained = v7;
      }
    }

  }
}

- (void)_sliderValueDidChange:(id)a3
{
  int v4;
  int v5;
  double v6;
  NSNumber *v7;
  NSNumber *pendingValueToApply;

  objc_msgSend(a3, "value");
  v5 = v4;
  -[SBElasticValueViewController _updateSliderValue:animated:](self, "_updateSliderValue:animated:", 1);
  LODWORD(v6) = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pendingValueToApply = self->_pendingValueToApply;
  self->_pendingValueToApply = v7;

}

- (void)_sliderIndirectInputDidBegin:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("Button Input Began"));
  if (self->_isRotating)
  {
    -[SBElasticValueViewController log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "_sliderDidReceiveButtonInput: -- skipping; we're rotating.",
        buf,
        2u);
    }

  }
  else if (!-[SBElasticValueViewController isSliderTracking](self, "isSliderTracking"))
  {
    -[SBElasticValueViewController log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "(_sliderIndirectInputDidBegin) Slider not tracking; forcing contextual transition to state 1 or 2",
        v6,
        2u);
    }

    -[SBElasticValueViewController transitionStateContextuallyForValueChangeEvent](self, "transitionStateContextuallyForValueChangeEvent");
  }
}

- (void)_sliderIndirectInputDidEnd:(id)a3
{
  if (self->_initialTransitionCompleted)
    -[SBElasticValueViewController _scheduleDismissal:](self, "_scheduleDismissal:", CFSTR("Button Input Ended"));
}

- (void)_sliderEditingDidEnd:(id)a3
{
  NSTimer *sliderApplyValueTimer;
  NSNumber *pendingValueToApply;
  NSNumber *v6;
  NSNumber *v7;

  -[NSTimer invalidate](self->_sliderApplyValueTimer, "invalidate", a3);
  sliderApplyValueTimer = self->_sliderApplyValueTimer;
  self->_sliderApplyValueTimer = 0;

  pendingValueToApply = self->_pendingValueToApply;
  if (pendingValueToApply)
  {
    v6 = pendingValueToApply;
    -[NSNumber floatValue](v6, "floatValue");
    -[SBElasticValueViewController changeValue:animated:](self, "changeValue:animated:", 1);
    v7 = self->_pendingValueToApply;
    self->_pendingValueToApply = 0;

  }
  self->_sliderIsEditing = 0;
  -[SBElasticValueViewController noteContinuousValueInteractionDidEnd](self, "noteContinuousValueInteractionDidEnd");
  -[SBElasticValueViewController currentValue](self, "currentValue");
  -[SBElasticValueViewController _updateSliderValue:animated:transitioningStateContextuallyIfNecessary:](self, "_updateSliderValue:animated:transitioningStateContextuallyIfNecessary:", 1, 0);
}

- (BOOL)isSliderTracking
{
  return self->_sliderTrackingCount != 0;
}

- (void)_noteSliderViewDidBeginTracking
{
  _BOOL4 v3;
  NSObject *v4;
  unint64_t sliderTrackingCount;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[SBElasticValueViewController isSliderTracking](self, "isSliderTracking");
  ++self->_sliderTrackingCount;
  -[SBElasticValueViewController log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sliderTrackingCount = self->_sliderTrackingCount;
    v6 = 134217984;
    v7 = sliderTrackingCount;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "_noteSliderViewDidBeginTracking: %lu", (uint8_t *)&v6, 0xCu);
  }

  if (v3 != -[SBElasticValueViewController isSliderTracking](self, "isSliderTracking"))
    -[SBElasticValueViewController _updateSliderTracking](self, "_updateSliderTracking");
}

- (void)_noteSliderViewDidEndTracking
{
  _BOOL4 v3;
  unint64_t sliderTrackingCount;
  NSObject *v5;
  unint64_t v6;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_sliderTrackingCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBElasticValueViewController.m"), 1253, CFSTR("_sliderTrackingCount overflow"));

  }
  v3 = -[SBElasticValueViewController isSliderTracking](self, "isSliderTracking");
  sliderTrackingCount = self->_sliderTrackingCount;
  if (sliderTrackingCount)
    self->_sliderTrackingCount = sliderTrackingCount - 1;
  -[SBElasticValueViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_sliderTrackingCount;
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "_noteSliderViewDidEndTracking: %lu", (uint8_t *)&v9, 0xCu);
  }

  if (v3 != -[SBElasticValueViewController isSliderTracking](self, "isSliderTracking"))
    -[SBElasticValueViewController _updateSliderTracking](self, "_updateSliderTracking");
}

- (void)_updateSliderTracking
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  -[SBElasticValueViewController log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_updateSliderTracking", v5, 2u);
  }

  if (!-[SBElasticValueViewController isSliderTracking](self, "isSliderTracking")
    && (unint64_t)(self->_state + 1) >= 2)
  {
    if (self->_previousState == 2)
      v4 = 2;
    else
      v4 = 1;
    -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", v4, 1, 0);
  }
}

- (void)_reloadData
{
  int64_t state;
  double v4;
  double v5;

  self->_isDebugging = -[SBElasticHUDSettings showDebugUI](self->_settings, "showDebugUI");
  state = self->_state;
  -[SBFTouchPassThroughView bounds](self->_sliderContainerView, "bounds");
  -[SBElasticValueViewController _updateSliderViewMetricsForState:bounds:](self, "_updateSliderViewMetricsForState:bounds:", state);
  -[SBElasticHUDSettings legibilityStrength](self->_settings, "legibilityStrength");
  v5 = v4;
  -[_UILegibilityLabel setStrength:](self->_trailingLabel, "setStrength:");
  -[_UILegibilityLabel setStrength:](self->_leadingLabel, "setStrength:", v5);
  -[SBElasticValueViewController _updateDimmingVisible:](self, "_updateDimmingVisible:", self->_state == 3);
}

- (void)_refreshDebugUI:(BOOL)a3
{
  void *v5;
  int IsZero;
  void *v7;
  void *v8;
  UIView *debugContainerView;
  UILabel *v10;
  UIButton *v11;
  UIButton *v12;
  UIButton *v13;
  UISegmentedControl *v14;
  UILabel *v15;
  UISwitch *v16;
  UILabel *v17;
  UISwitch *v18;
  UISlider *v19;
  UISlider *v20;
  UISlider *v21;
  NSArray *v22;
  NSArray *v23;
  UILabel *debugLabel;
  UILabel *v25;
  UILabel *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UIButton *debugDumpButton;
  UIButton *v32;
  UIButton *v33;
  UIButton *v34;
  void *v35;
  UIButton *v36;
  void *v37;
  UIButton *v38;
  UIButton *debugNextAudioRouteButton;
  UIButton *v40;
  UIButton *debugResetAudioRouteButton;
  UIButton *v42;
  void *v43;
  UIButton *v44;
  void *v45;
  UIButton *v46;
  void *v47;
  UIButton *v48;
  void *v49;
  UISegmentedControl *debugStateSegmentedControl;
  id v51;
  void *v52;
  UISegmentedControl *v53;
  UISegmentedControl *v54;
  UISegmentedControl *v55;
  void *v56;
  UISwitch *debugAutoDismissalSwitch;
  UISwitch *v58;
  UISwitch *v59;
  UISwitch *v60;
  void *v61;
  UILabel *debugAutoDismissLabel;
  UILabel *v63;
  UILabel *v64;
  UILabel *v65;
  void *v66;
  UILabel *v67;
  void *v68;
  UISwitch *debugLockStateSwitch;
  UISwitch *v70;
  UISwitch *v71;
  UISwitch *v72;
  void *v73;
  UILabel *debugLockStateLabel;
  UILabel *v75;
  UILabel *v76;
  UILabel *v77;
  void *v78;
  UILabel *v79;
  void *v80;
  UISlider *v81;
  UISlider *debugWidthSlider;
  UISlider *debugHeightSlider;
  UISlider *v84;
  UISlider *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  UISlider *v89;
  UISlider *debugPortraitYOriginSlider;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  void *v97;
  double v98;
  double v99;
  UISlider *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  NSArray *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  UISlider *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  NSArray *debugAutoLayoutConstraints;
  void *v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  _BYTE v261[128];
  _QWORD v262[4];

  v262[2] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    -[SBElasticValueViewController settings](self, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showDebugUI");
    IsZero = BSFloatIsZero();
    -[SBElasticValueViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    debugContainerView = self->_debugContainerView;
    if (IsZero)
    {
      objc_msgSend(v7, "sendSubviewToBack:", debugContainerView);

    }
    else
    {
      objc_msgSend(v7, "bringSubviewToFront:", debugContainerView);

      if (!a3)
      {
        debugLabel = self->_debugLabel;
        if (!debugLabel)
        {
          v25 = (UILabel *)objc_opt_new();
          v26 = self->_debugLabel;
          self->_debugLabel = v25;

          debugLabel = self->_debugLabel;
        }
        -[UILabel setText:](debugLabel, "setText:", CFSTR("LAYING IN WAIT FOR ACTION"));
        v27 = self->_debugLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v27, "setTextColor:", v28);

        v29 = self->_debugLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v29, "setBackgroundColor:", v30);

        -[UILabel sizeToFit](self->_debugLabel, "sizeToFit");
        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugLabel);
        debugDumpButton = self->_debugDumpButton;
        if (!debugDumpButton)
        {
          objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
          v32 = (UIButton *)objc_claimAutoreleasedReturnValue();
          v33 = self->_debugDumpButton;
          self->_debugDumpButton = v32;

          debugDumpButton = self->_debugDumpButton;
        }
        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](debugDumpButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIButton setTitle:forState:](self->_debugDumpButton, "setTitle:forState:", CFSTR("  DUMP TO CONSOLE  "), 0);
        -[UIButton addTarget:action:forControlEvents:](self->_debugDumpButton, "addTarget:action:forControlEvents:", self, sel__debugDump_, 64);
        v34 = self->_debugDumpButton;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitleColor:forState:](v34, "setTitleColor:forState:", v35, 0);

        v36 = self->_debugDumpButton;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setBackgroundColor:](v36, "setBackgroundColor:", v37);

        -[UIButton _setContinuousCornerRadius:](self->_debugDumpButton, "_setContinuousCornerRadius:", 8.0);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugDumpButton);
        if (!self->_debugNextAudioRouteButton)
        {
          objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
          v38 = (UIButton *)objc_claimAutoreleasedReturnValue();
          debugNextAudioRouteButton = self->_debugNextAudioRouteButton;
          self->_debugNextAudioRouteButton = v38;

        }
        if (!self->_debugResetAudioRouteButton)
        {
          objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
          v40 = (UIButton *)objc_claimAutoreleasedReturnValue();
          debugResetAudioRouteButton = self->_debugResetAudioRouteButton;
          self->_debugResetAudioRouteButton = v40;

        }
        -[UIButton _setContinuousCornerRadius:](self->_debugNextAudioRouteButton, "_setContinuousCornerRadius:", 8.0);
        v42 = self->_debugNextAudioRouteButton;
        objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setBackgroundColor:](v42, "setBackgroundColor:", v43);

        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_debugNextAudioRouteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIButton setTitle:forState:](self->_debugNextAudioRouteButton, "setTitle:forState:", CFSTR("  NEXT ROUTE →  "), 0);
        v44 = self->_debugNextAudioRouteButton;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitleColor:forState:](v44, "setTitleColor:forState:", v45, 0);

        -[UIButton addTarget:action:forControlEvents:](self->_debugNextAudioRouteButton, "addTarget:action:forControlEvents:", self, sel__debugDidTapNextRoute_, 64);
        -[UIButton _setContinuousCornerRadius:](self->_debugResetAudioRouteButton, "_setContinuousCornerRadius:", 8.0);
        v46 = self->_debugResetAudioRouteButton;
        objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setBackgroundColor:](v46, "setBackgroundColor:", v47);

        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_debugResetAudioRouteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIButton setTitle:forState:](self->_debugResetAudioRouteButton, "setTitle:forState:", CFSTR("  ↺ RESET ROUTE  "), 0);
        v48 = self->_debugResetAudioRouteButton;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitleColor:forState:](v48, "setTitleColor:forState:", v49, 0);

        -[UIButton addTarget:action:forControlEvents:](self->_debugResetAudioRouteButton, "addTarget:action:forControlEvents:", self, sel__debugDidTapResetRoute_, 64);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugNextAudioRouteButton);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugResetAudioRouteButton);
        debugStateSegmentedControl = self->_debugStateSegmentedControl;
        if (!debugStateSegmentedControl)
        {
          v51 = objc_alloc(MEMORY[0x1E0CEA990]);
          __48__SBElasticValueViewController__refreshDebugUI___block_invoke();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (UISegmentedControl *)objc_msgSend(v51, "initWithItems:", v52);
          v54 = self->_debugStateSegmentedControl;
          self->_debugStateSegmentedControl = v53;

          debugStateSegmentedControl = self->_debugStateSegmentedControl;
        }
        -[UISegmentedControl sizeToFit](debugStateSegmentedControl, "sizeToFit");
        -[UISegmentedControl addTarget:action:forControlEvents:](self->_debugStateSegmentedControl, "addTarget:action:forControlEvents:", self, sel__debugChangingStateFromSegmentedControl_, 4096);
        v55 = self->_debugStateSegmentedControl;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegmentedControl setBackgroundColor:](v55, "setBackgroundColor:", v56);

        -[UISegmentedControl setSelectedSegmentIndex:](self->_debugStateSegmentedControl, "setSelectedSegmentIndex:", self->_state);
        -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_debugStateSegmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugStateSegmentedControl);
        debugAutoDismissalSwitch = self->_debugAutoDismissalSwitch;
        if (!debugAutoDismissalSwitch)
        {
          v58 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0CEAA38]);
          v59 = self->_debugAutoDismissalSwitch;
          self->_debugAutoDismissalSwitch = v58;

          debugAutoDismissalSwitch = self->_debugAutoDismissalSwitch;
        }
        -[UISwitch sizeToFit](debugAutoDismissalSwitch, "sizeToFit");
        v256 = v5;
        -[UISwitch setOn:](self->_debugAutoDismissalSwitch, "setOn:", objc_msgSend(v5, "autoDismiss"));
        v60 = self->_debugAutoDismissalSwitch;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch setBackgroundColor:](v60, "setBackgroundColor:", v61);

        -[UISwitch addTarget:action:forControlEvents:](self->_debugAutoDismissalSwitch, "addTarget:action:forControlEvents:", self, sel__debugAutoDismissalSwitchValueChanged_, 4096);
        -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_debugAutoDismissalSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        debugAutoDismissLabel = self->_debugAutoDismissLabel;
        if (!debugAutoDismissLabel)
        {
          v63 = (UILabel *)objc_opt_new();
          v64 = self->_debugAutoDismissLabel;
          self->_debugAutoDismissLabel = v63;

          debugAutoDismissLabel = self->_debugAutoDismissLabel;
        }
        -[UILabel setText:](debugAutoDismissLabel, "setText:", CFSTR("AutoDismiss"));
        v65 = self->_debugAutoDismissLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v65, "setBackgroundColor:", v66);

        v67 = self->_debugAutoDismissLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v67, "setTextColor:", v68);

        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugAutoDismissLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UILabel sizeToFit](self->_debugAutoDismissLabel, "sizeToFit");
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugAutoDismissalSwitch);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugAutoDismissLabel);
        debugLockStateSwitch = self->_debugLockStateSwitch;
        if (!debugLockStateSwitch)
        {
          v70 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0CEAA38]);
          v71 = self->_debugLockStateSwitch;
          self->_debugLockStateSwitch = v70;

          debugLockStateSwitch = self->_debugLockStateSwitch;
        }
        -[UISwitch sizeToFit](debugLockStateSwitch, "sizeToFit");
        v72 = self->_debugLockStateSwitch;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch setBackgroundColor:](v72, "setBackgroundColor:", v73);

        -[UISwitch addTarget:action:forControlEvents:](self->_debugLockStateSwitch, "addTarget:action:forControlEvents:", self, sel__debugLockStateSwitchValueChanged_, 4096);
        -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_debugLockStateSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        debugLockStateLabel = self->_debugLockStateLabel;
        if (!debugLockStateLabel)
        {
          v75 = (UILabel *)objc_opt_new();
          v76 = self->_debugLockStateLabel;
          self->_debugLockStateLabel = v75;

          debugLockStateLabel = self->_debugLockStateLabel;
        }
        -[UILabel setText:](debugLockStateLabel, "setText:", CFSTR("Lock State?"));
        v77 = self->_debugLockStateLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v77, "setBackgroundColor:", v78);

        v79 = self->_debugLockStateLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v79, "setTextColor:", v80);

        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugLockStateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UILabel sizeToFit](self->_debugLockStateLabel, "sizeToFit");
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugLockStateSwitch);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugLockStateLabel);
        if (!self->_debugWidthSlider)
        {
          v81 = (UISlider *)objc_opt_new();
          debugWidthSlider = self->_debugWidthSlider;
          self->_debugWidthSlider = v81;

        }
        debugHeightSlider = self->_debugHeightSlider;
        if (!debugHeightSlider)
        {
          v84 = (UISlider *)objc_opt_new();
          v85 = self->_debugHeightSlider;
          self->_debugHeightSlider = v84;

          debugHeightSlider = self->_debugHeightSlider;
        }
        v262[0] = self->_debugWidthSlider;
        v262[1] = debugHeightSlider;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v262, 2);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "userInterfaceIdiom");

        if ((v88 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          v89 = (UISlider *)objc_opt_new();
          debugPortraitYOriginSlider = self->_debugPortraitYOriginSlider;
          self->_debugPortraitYOriginSlider = v89;

          objc_msgSend(v86, "arrayByAddingObject:", self->_debugPortraitYOriginSlider);
          v91 = objc_claimAutoreleasedReturnValue();

          v86 = (void *)v91;
        }
        v259 = 0u;
        v260 = 0u;
        v257 = 0u;
        v258 = 0u;
        v92 = v86;
        v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v257, v261, 16);
        if (v93)
        {
          v94 = v93;
          v95 = *(_QWORD *)v258;
          do
          {
            for (i = 0; i != v94; ++i)
            {
              if (*(_QWORD *)v258 != v95)
                objc_enumerationMutation(v92);
              v97 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * i);
              objc_msgSend(v97, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              LODWORD(v98) = 5.0;
              objc_msgSend(v97, "setMinimumValue:", v98);
              LODWORD(v99) = 1140457472;
              objc_msgSend(v97, "setMaximumValue:", v99);
              objc_msgSend(v97, "addTarget:action:forControlEvents:", self, sel__debugDimensionSliderValueDidChange_, 4096);
            }
            v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v257, v261, 16);
          }
          while (v94);
        }

        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugWidthSlider);
        -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugHeightSlider);
        v100 = self->_debugPortraitYOriginSlider;
        if (v100)
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "bounds");
          *(float *)&v103 = v102;
          -[UISlider setMaximumValue:](v100, "setMaximumValue:", v103);

          -[UIView addSubview:](self->_debugContainerView, "addSubview:", self->_debugPortraitYOriginSlider);
        }

        v22 = self->_debugAutoLayoutConstraints;
        -[UIView layer](self->_touchTrackingView, "layer");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setBorderWidth:", 1.0);

        -[UIView layer](self->_touchTrackingView, "layer");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v106 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v105, "setBorderColor:", objc_msgSend(v106, "CGColor"));

        -[SBFTouchPassThroughView layer](self->_sliderContainerView, "layer");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setBorderWidth:", 5.0);

        -[SBFTouchPassThroughView layer](self->_sliderContainerView, "layer");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
        v109 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v108, "setBorderColor:", objc_msgSend(v109, "CGColor"));

        -[SBFTouchPassThroughView layer](self->_sliderContainerView, "layer");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBElasticValueViewController traitCollection](self, "traitCollection");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "displayCornerRadius");
        objc_msgSend(v110, "setCornerRadius:");

        -[SBFTouchPassThroughView layer](self->_sliderContainerView, "layer");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = *MEMORY[0x1E0CD2A68];
        objc_msgSend(v112, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

        -[SBElasticSliderView layer](self->_sliderView, "layer");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setBorderWidth:", 1.0);

        -[SBElasticSliderView layer](self->_sliderView, "layer");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
        v116 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v115, "setBorderColor:", objc_msgSend(v116, "CGColor"));

        -[UIView layer](self->_debugContainerView, "layer");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setBorderWidth:", 1.0);

        -[UIView layer](self->_debugContainerView, "layer");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
        v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v118, "setBorderColor:", objc_msgSend(v119, "CGColor"));

        -[UIView layer](self->_debugContainerView, "layer");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBElasticValueViewController traitCollection](self, "traitCollection");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "displayCornerRadius");
        objc_msgSend(v120, "setCornerRadius:");

        -[UIView layer](self->_debugContainerView, "layer");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setCornerCurve:", v113);

        -[_UILegibilityLabel layer](self->_leadingLabel, "layer");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setBorderWidth:", 1.0);

        -[_UILegibilityLabel layer](self->_trailingLabel, "layer");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "setBorderWidth:", 1.0);

        v125 = (NSArray *)objc_opt_new();
        -[UISegmentedControl centerXAnchor](self->_debugStateSegmentedControl, "centerXAnchor");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "constraintEqualToAnchor:", v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v128);

        -[UISegmentedControl centerYAnchor](self->_debugStateSegmentedControl, "centerYAnchor");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_debugContainerView, "centerYAnchor");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "constraintEqualToAnchor:", v130);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v131);

        -[UILabel centerXAnchor](self->_debugLabel, "centerXAnchor");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "constraintEqualToAnchor:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v134);

        -[UILabel leadingAnchor](self->_debugLabel, "leadingAnchor");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "constraintGreaterThanOrEqualToAnchor:", v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v137);

        -[UILabel trailingAnchor](self->_debugLabel, "trailingAnchor");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self->_debugContainerView, "trailingAnchor");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "constraintLessThanOrEqualToAnchor:", v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v140);

        -[UILabel topAnchor](self->_debugLabel, "topAnchor");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegmentedControl bottomAnchor](self->_debugStateSegmentedControl, "bottomAnchor");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "constraintEqualToAnchor:constant:", v142, 10.0);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v143);

        -[UISwitch topAnchor](self->_debugAutoDismissalSwitch, "topAnchor");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel bottomAnchor](self->_debugLabel, "bottomAnchor");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "constraintEqualToAnchor:constant:", v145, 10.0);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v146);

        -[UISwitch centerXAnchor](self->_debugAutoDismissalSwitch, "centerXAnchor");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "constraintEqualToAnchor:", v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v149);

        -[UISwitch leadingAnchor](self->_debugAutoDismissalSwitch, "leadingAnchor");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "constraintGreaterThanOrEqualToAnchor:", v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v152);

        -[UISwitch widthAnchor](self->_debugAutoDismissalSwitch, "widthAnchor");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "constraintEqualToConstant:", 100.0);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v154);

        -[UISwitch trailingAnchor](self->_debugAutoDismissalSwitch, "trailingAnchor");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self->_debugContainerView, "trailingAnchor");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "constraintLessThanOrEqualToAnchor:", v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v157);

        -[UILabel widthAnchor](self->_debugAutoDismissLabel, "widthAnchor");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "constraintEqualToConstant:", 200.0);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v159);

        -[UILabel centerYAnchor](self->_debugAutoDismissLabel, "centerYAnchor");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch centerYAnchor](self->_debugAutoDismissalSwitch, "centerYAnchor");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "constraintEqualToAnchor:", v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v162);

        -[UILabel leadingAnchor](self->_debugAutoDismissLabel, "leadingAnchor");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "constraintGreaterThanOrEqualToAnchor:", v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v165);

        -[UILabel trailingAnchor](self->_debugAutoDismissLabel, "trailingAnchor");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch leadingAnchor](self->_debugAutoDismissalSwitch, "leadingAnchor");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "constraintLessThanOrEqualToAnchor:constant:", v167, -50.0);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v168);

        -[UISwitch topAnchor](self->_debugLockStateSwitch, "topAnchor");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch bottomAnchor](self->_debugAutoDismissalSwitch, "bottomAnchor");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "constraintEqualToAnchor:constant:", v170, 10.0);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v171);

        -[UISwitch centerXAnchor](self->_debugLockStateSwitch, "centerXAnchor");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "constraintEqualToAnchor:", v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v174);

        -[UISwitch widthAnchor](self->_debugLockStateSwitch, "widthAnchor");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "constraintEqualToConstant:", 100.0);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v176);

        -[UISwitch leadingAnchor](self->_debugLockStateSwitch, "leadingAnchor");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "constraintGreaterThanOrEqualToAnchor:", v178);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v179);

        -[UISwitch trailingAnchor](self->_debugLockStateSwitch, "trailingAnchor");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self->_debugContainerView, "trailingAnchor");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "constraintLessThanOrEqualToAnchor:", v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v182);

        -[UILabel widthAnchor](self->_debugLockStateLabel, "widthAnchor");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "constraintEqualToConstant:", 200.0);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v184);

        -[UILabel centerYAnchor](self->_debugLockStateLabel, "centerYAnchor");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch centerYAnchor](self->_debugLockStateSwitch, "centerYAnchor");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "constraintEqualToAnchor:", v186);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v187);

        -[UILabel leadingAnchor](self->_debugLockStateLabel, "leadingAnchor");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "constraintGreaterThanOrEqualToAnchor:", v189);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v190);

        -[UILabel trailingAnchor](self->_debugLockStateLabel, "trailingAnchor");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISwitch leadingAnchor](self->_debugLockStateSwitch, "leadingAnchor");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "constraintLessThanOrEqualToAnchor:constant:", v192, -50.0);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v193);

        -[UISlider topAnchor](self->_debugWidthSlider, "topAnchor");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel bottomAnchor](self->_debugLockStateLabel, "bottomAnchor");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "constraintEqualToAnchor:constant:", v195, 30.0);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v196);

        -[UISlider centerXAnchor](self->_debugWidthSlider, "centerXAnchor");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "constraintEqualToAnchor:", v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v199);

        -[UISlider widthAnchor](self->_debugWidthSlider, "widthAnchor");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v200, "constraintEqualToConstant:", 300.0);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v201);

        -[UISlider leadingAnchor](self->_debugWidthSlider, "leadingAnchor");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "constraintGreaterThanOrEqualToAnchor:", v203);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v204);

        -[UISlider trailingAnchor](self->_debugWidthSlider, "trailingAnchor");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self->_debugContainerView, "trailingAnchor");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "constraintLessThanOrEqualToAnchor:", v206);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v207);

        -[UISlider topAnchor](self->_debugHeightSlider, "topAnchor");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISlider bottomAnchor](self->_debugWidthSlider, "bottomAnchor");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "constraintEqualToAnchor:constant:", v209, 30.0);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v210);

        -[UISlider centerXAnchor](self->_debugHeightSlider, "centerXAnchor");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v211, "constraintEqualToAnchor:", v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v213);

        -[UISlider widthAnchor](self->_debugHeightSlider, "widthAnchor");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v214, "constraintEqualToConstant:", 300.0);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v215);

        -[UISlider leadingAnchor](self->_debugHeightSlider, "leadingAnchor");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "constraintGreaterThanOrEqualToAnchor:", v217);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v218);

        -[UISlider trailingAnchor](self->_debugHeightSlider, "trailingAnchor");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self->_debugContainerView, "trailingAnchor");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "constraintLessThanOrEqualToAnchor:", v220);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v221);

        v222 = self->_debugPortraitYOriginSlider;
        v5 = v256;
        if (v222)
        {
          -[UISlider topAnchor](v222, "topAnchor");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          -[UISlider bottomAnchor](self->_debugHeightSlider, "bottomAnchor");
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "constraintEqualToAnchor:constant:", v224, 30.0);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v125, "addObject:", v225);

          -[UISlider centerXAnchor](self->_debugPortraitYOriginSlider, "centerXAnchor");
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView centerXAnchor](self->_debugContainerView, "centerXAnchor");
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "constraintEqualToAnchor:", v227);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v125, "addObject:", v228);

          -[UISlider widthAnchor](self->_debugPortraitYOriginSlider, "widthAnchor");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "constraintEqualToConstant:", 300.0);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v125, "addObject:", v230);

          -[UISlider leadingAnchor](self->_debugPortraitYOriginSlider, "leadingAnchor");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView leadingAnchor](self->_debugContainerView, "leadingAnchor");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "constraintGreaterThanOrEqualToAnchor:", v232);
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v125, "addObject:", v233);

          -[UISlider trailingAnchor](self->_debugPortraitYOriginSlider, "trailingAnchor");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView trailingAnchor](self->_debugContainerView, "trailingAnchor");
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v234, "constraintLessThanOrEqualToAnchor:", v235);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v125, "addObject:", v236);

        }
        -[UIButton centerXAnchor](self->_debugDumpButton, "centerXAnchor");
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegmentedControl centerXAnchor](self->_debugStateSegmentedControl, "centerXAnchor");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "constraintEqualToAnchor:", v238);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v239);

        -[UIButton centerYAnchor](self->_debugDumpButton, "centerYAnchor");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegmentedControl centerYAnchor](self->_debugStateSegmentedControl, "centerYAnchor");
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v240, "constraintEqualToAnchor:constant:", v241, -50.0);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v242);

        -[UIButton centerXAnchor](self->_debugResetAudioRouteButton, "centerXAnchor");
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegmentedControl centerXAnchor](self->_debugStateSegmentedControl, "centerXAnchor");
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v243, "constraintEqualToAnchor:", v244);
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v245);

        -[UIButton centerYAnchor](self->_debugResetAudioRouteButton, "centerYAnchor");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton centerYAnchor](self->_debugDumpButton, "centerYAnchor");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v246, "constraintEqualToAnchor:constant:", v247, -40.0);
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v248);

        -[UIButton centerXAnchor](self->_debugNextAudioRouteButton, "centerXAnchor");
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegmentedControl centerXAnchor](self->_debugStateSegmentedControl, "centerXAnchor");
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v249, "constraintEqualToAnchor:", v250);
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v251);

        -[UIButton centerYAnchor](self->_debugNextAudioRouteButton, "centerYAnchor");
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton centerYAnchor](self->_debugResetAudioRouteButton, "centerYAnchor");
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v252, "constraintEqualToAnchor:constant:", v253, -40.0);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v125, "addObject:", v254);

        debugAutoLayoutConstraints = self->_debugAutoLayoutConstraints;
        self->_debugAutoLayoutConstraints = v125;
        v23 = v125;

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_debugAutoLayoutConstraints);
        goto LABEL_42;
      }
    }
    -[UILabel removeFromSuperview](self->_debugLabel, "removeFromSuperview");
    v10 = self->_debugLabel;
    self->_debugLabel = 0;

    -[UIButton removeFromSuperview](self->_debugDumpButton, "removeFromSuperview");
    v11 = self->_debugDumpButton;
    self->_debugDumpButton = 0;

    -[UIButton removeFromSuperview](self->_debugNextAudioRouteButton, "removeFromSuperview");
    -[UIButton removeFromSuperview](self->_debugResetAudioRouteButton, "removeFromSuperview");
    v12 = self->_debugNextAudioRouteButton;
    self->_debugNextAudioRouteButton = 0;

    v13 = self->_debugResetAudioRouteButton;
    self->_debugResetAudioRouteButton = 0;

    -[UISegmentedControl removeFromSuperview](self->_debugStateSegmentedControl, "removeFromSuperview");
    v14 = self->_debugStateSegmentedControl;
    self->_debugStateSegmentedControl = 0;

    -[UILabel removeFromSuperview](self->_debugAutoDismissLabel, "removeFromSuperview");
    v15 = self->_debugAutoDismissLabel;
    self->_debugAutoDismissLabel = 0;

    -[UISwitch removeFromSuperview](self->_debugAutoDismissalSwitch, "removeFromSuperview");
    v16 = self->_debugAutoDismissalSwitch;
    self->_debugAutoDismissalSwitch = 0;

    -[UILabel removeFromSuperview](self->_debugLockStateLabel, "removeFromSuperview");
    v17 = self->_debugLockStateLabel;
    self->_debugLockStateLabel = 0;

    -[UISwitch removeFromSuperview](self->_debugLockStateSwitch, "removeFromSuperview");
    v18 = self->_debugLockStateSwitch;
    self->_debugLockStateSwitch = 0;

    -[UISlider removeFromSuperview](self->_debugHeightSlider, "removeFromSuperview");
    v19 = self->_debugHeightSlider;
    self->_debugHeightSlider = 0;

    -[UISlider removeFromSuperview](self->_debugWidthSlider, "removeFromSuperview");
    v20 = self->_debugWidthSlider;
    self->_debugWidthSlider = 0;

    -[UISlider removeFromSuperview](self->_debugPortraitYOriginSlider, "removeFromSuperview");
    v21 = self->_debugPortraitYOriginSlider;
    self->_debugPortraitYOriginSlider = 0;

    v22 = self->_debugAutoLayoutConstraints;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v22);
    v23 = self->_debugAutoLayoutConstraints;
    self->_debugAutoLayoutConstraints = 0;
LABEL_42:

  }
}

id __48__SBElasticValueViewController__refreshDebugUI___block_invoke()
{
  void *v0;
  unint64_t i;
  const __CFString *v2;

  v0 = (void *)objc_opt_new();
  for (i = 0; i != 5; ++i)
  {
    v2 = CFSTR("Invalid state");
    if (i <= 4)
      v2 = off_1E8EAA548[i];
    objc_msgSend(v0, "addObject:", v2);
  }
  return v0;
}

- (void)_updateDebugString:(id)a3
{
  -[UILabel setText:](self->_debugLabel, "setText:", a3);
  -[UILabel sizeToFit](self->_debugLabel, "sizeToFit");
}

- (void)_debugDump:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SBElasticHUDSettings performSelector:](self->_settings, "performSelector:", sel__ivarDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticValueViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "ELASTIC HUD DUMP: %@", (uint8_t *)&v11, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("ElasticHUD.dump"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItemAtURL:error:", v9, 0);

  objc_msgSend(v4, "writeToURL:atomically:encoding:error:", v9, 1, 4, 0);
}

- (void)_debugDidTapNextRoute:(id)a3
{
  -[SBElasticValueViewController _debugHandleNextRoute](self, "_debugHandleNextRoute", a3);
  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("DEBUG NEXT ROUTE"));
  -[SBElasticValueViewController reloadData](self, "reloadData");
}

- (void)_debugDidTapResetRoute:(id)a3
{
  -[SBElasticValueViewController _debugHandleResetRoute](self, "_debugHandleResetRoute", a3);
  -[SBElasticValueViewController reloadData](self, "reloadData");
}

- (void)_debugChangingStateFromSegmentedControl:(id)a3
{
  -[SBElasticValueViewController transitionToState:animated:completion:](self, "transitionToState:animated:completion:", objc_msgSend(a3, "selectedSegmentIndex"), 1, 0);
}

- (void)_debugAutoDismissalSwitchValueChanged:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", v6);

  -[SBElasticValueViewController settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoDismiss:", objc_msgSend(v5, "isOn"));

  LODWORD(v7) = objc_msgSend(v5, "isOn");
  if ((_DWORD)v7)
  {
    if (!self->_state)
      -[SBElasticValueViewController _actuallyDismiss](self, "_actuallyDismiss");
  }
}

- (void)_debugLockStateSwitchValueChanged:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", v6);

  LODWORD(v6) = objc_msgSend(v5, "isOn");
  self->_lockState = (char)v6;
  -[UISegmentedControl setEnabled:](self->_debugStateSegmentedControl, "setEnabled:", v6 ^ 1);
  -[SBElasticValueViewController _scheduleDismissal:](self, "_scheduleDismissal:", CFSTR("RESUME AFTER DEBUGGING LOCK"));
}

- (void)_debugDimensionSliderValueDidChange:(id)a3
{
  void *v4;
  int64_t state;
  unint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  UISlider *v20;

  v20 = (UISlider *)a3;
  -[SBElasticValueViewController settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  v6 = -[SBElasticValueViewController axis](self, "axis");
  if (v6)
  {
    if (self->_debugHeightSlider == v20)
    {
      switch(state)
      {
        case 0:
        case 1:
        case 4:
          if (v6 == 1)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setLandscapeState1Height:", v12);
          }
          else if (v6 == 2)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setPortraitState1Height:", v8);
          }
          break;
        case 2:
          if (v6 == 1)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setLandscapeState2Height:", v16);
          }
          else if (v6 == 2)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setPortraitState2Height:", v10);
          }
          break;
        case 3:
          if (v6 == 1)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setLandscapeState3Height:", v17);
          }
          else if (v6 == 2)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setPortraitState3Height:", v11);
          }
          break;
        default:
          break;
      }
    }
    else if (self->_debugWidthSlider == v20)
    {
      switch(state)
      {
        case 0:
        case 1:
        case 4:
          if (v6 == 1)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setLandscapeState1Width:", v15);
          }
          else if (v6 == 2)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setPortraitState1Width:", v9);
          }
          break;
        case 2:
          if (v6 == 1)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setLandscapeState2Width:", v19);
          }
          else if (v6 == 2)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setPortraitState2Width:", v14);
          }
          break;
        case 3:
          if (v6 == 1)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setLandscapeState3Width:", v18);
          }
          else if (v6 == 2)
          {
            -[UISlider value](v20, "value");
            objc_msgSend(v4, "setPortraitState3Width:", v13);
          }
          break;
        default:
          break;
      }
    }
    else if (self->_debugPortraitYOriginSlider)
    {
      -[UISlider value](v20, "value");
      objc_msgSend(v4, "setVolumeButtonsCenterY:", v7);
    }
  }

}

- (void)_updateLiveRenderingAssertion
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  BLSAssertion *liveRenderingAssertion;
  int v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BLSAssertion *v18;
  BLSAssertion *v19;
  char v20;
  NSObject *v21;
  int v22;
  SBElasticValueViewController *v23;
  __int16 v24;
  int v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  -[SBElasticValueViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[SBElasticValueViewController _appearState](self, "_appearState") != 0;
  else
    v6 = 0;
  liveRenderingAssertion = self->_liveRenderingAssertion;
  v8 = -[BLSAssertion isAcquired](liveRenderingAssertion, "isAcquired");
  v9 = v8;
  if (v6 && (v8 & 1) == 0)
  {
    -[SBElasticValueViewController log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = self;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "%@ is requesting live rendering", (uint8_t *)&v22, 0xCu);
    }

    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSAssertion invalidate](self->_liveRenderingAssertion, "invalidate");
    v13 = (void *)MEMORY[0x1E0D00F48];
    objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v15;
    objc_msgSend(MEMORY[0x1E0D00FC8], "ignoreWhenBacklightInactivates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "acquireWithExplanation:observer:attributes:", v12, 0, v17);
    v18 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    v19 = self->_liveRenderingAssertion;
    self->_liveRenderingAssertion = v18;

LABEL_16:
    goto LABEL_17;
  }
  if (liveRenderingAssertion)
    v20 = v6;
  else
    v20 = 1;
  if ((v20 & 1) == 0)
  {
    -[SBElasticValueViewController log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = 138412546;
      v23 = self;
      v24 = 1024;
      v25 = v9;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "%@ is relinquishing live rendering (was acquired: %{BOOL}u)", (uint8_t *)&v22, 0x12u);
    }

    -[BLSAssertion invalidate](self->_liveRenderingAssertion, "invalidate");
    v12 = self->_liveRenderingAssertion;
    self->_liveRenderingAssertion = 0;
    goto LABEL_16;
  }
LABEL_17:

}

- (CGSize)maximumSizeForSlider
{
  double v2;
  double v3;
  CGSize result;

  -[SBElasticValueViewController sizeForState:](self, "sizeForState:", 3);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeForState:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v5 = -[SBElasticValueViewController axis](self, "axis");
  -[SBElasticValueViewController settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 2)
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 4:
        objc_msgSend(v6, "portraitState1Width");
        objc_msgSend(v7, "portraitState1Height");
        break;
      case 2:
        objc_msgSend(v6, "portraitState2Width");
        objc_msgSend(v7, "portraitState2Height");
        break;
      case 3:
        objc_msgSend(v6, "portraitState3Width");
        objc_msgSend(v7, "portraitState3Height");
        break;
      default:
        break;
    }
  }
  else if (v5 == 1)
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 4:
        objc_msgSend(v6, "landscapeState1Width");
        objc_msgSend(v7, "landscapeState1Height");
        break;
      case 2:
        objc_msgSend(v6, "landscapeState2Width");
        objc_msgSend(v7, "landscapeState2Height");
        break;
      case 3:
        objc_msgSend(v6, "landscapeState3Width");
        objc_msgSend(v7, "landscapeState3Height");
        break;
      default:
        break;
    }
  }
  if (!self->_reduceMotionEnabled)
  {
    if (a3 == 4)
    {
      -[SBElasticHUDSettings deflatedScaleFactor](self->_settings, "deflatedScaleFactor", 1.0);
    }
    else if (!a3)
    {
      -[SBElasticHUDSettings baseScaleFactor](self->_settings, "baseScaleFactor", 1.0);
    }
  }
  -[SBElasticValueViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");

  BSSizeRoundForScale();
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGPoint)centerForState:(int64_t)a3 sliderSize:(CGSize)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CGFloat v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;
  CGRect v28;
  CGRect v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = -[SBElasticValueViewController axis](self, "axis");
  -[SBElasticValueViewController settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3 == 3)
  {
    v16 = height;
  }
  else
  {
    if (a3 != 2)
    {
      if (!a3 && !self->_reduceMotionEnabled)
      {
        objc_msgSend(v12, "offscreenTopMargin");
        objc_msgSend(v13, "offscreenLeadingMargin");
        objc_msgSend(v13, "volumeButtonsCenterY");
        if (v11 == 1)
        {
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          CGRectGetMidX(v28);
        }
        goto LABEL_18;
      }
LABEL_9:
      v16 = height;
      goto LABEL_12;
    }
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceIdiom");

      if ((v15 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v16 = height;
LABEL_14:
        objc_msgSend(v13, "onscreenTopMargin");
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = v16;
        CGRectGetMidX(v29);
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "userInterfaceIdiom");

        if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1
          && (unint64_t)(-[SBElasticValueViewController hudPresentationOrientation](self, "hudPresentationOrientation")- 1) <= 1)
        {
          -[SBElasticValueViewController view](self, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "safeAreaInsets");

        }
        goto LABEL_18;
      }
      goto LABEL_9;
    }
    v16 = height;
  }
LABEL_12:
  if (v11 == 2)
  {
    objc_msgSend(v13, "onscreenLeadingMargin");
    objc_msgSend(v13, "volumeButtonsCenterY");
    goto LABEL_18;
  }
  if (v11 == 1)
    goto LABEL_14;
LABEL_18:
  -[SBElasticValueViewController traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayScale");

  BSRectWithSize();
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (double)glyphScaleForState:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[SBElasticValueViewController settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 1.17549435e-38;
  switch(a3)
  {
    case 0:
      objc_msgSend(v5, "baseScaleFactor");
      goto LABEL_7;
    case 1:
      v7 = 1.0;
      break;
    case 3:
      if (-[SBElasticValueViewController axis](self, "axis") == 2)
      {
        objc_msgSend(v6, "portraitState3Width");
        v10 = v9;
        objc_msgSend(v6, "portraitState1Width");
      }
      else
      {
        objc_msgSend(v6, "landscapeState3Height");
        v10 = v12;
        objc_msgSend(v6, "landscapeState1Height");
      }
      v7 = v10 / v11;
      break;
    case 4:
      -[SBElasticHUDSettings deflatedScaleFactor](self->_settings, "deflatedScaleFactor");
LABEL_7:
      v7 = v8;
      break;
    default:
      break;
  }

  return v7;
}

- (BOOL)_computeCachedRouteDisplayInformation
{
  _BOOL4 v3;
  id v4;
  id v5;
  id v7;

  v7 = 0;
  v3 = -[SBElasticValueViewController updateActiveRouteDisplay:](self, "updateActiveRouteDisplay:", &v7);
  v4 = v7;
  v5 = v7;
  if (v3)
    objc_storeStrong((id *)&self->_routeDisplayInfo, v4);

  return v3;
}

- (void)_updateGlyphStateIfNecessaryForValue:(float *)a3
{
  void (**v5)(_QWORD, __n128);
  __n128 v6;
  uint64_t v7;
  id v8;

  -[SBElasticRouteDisplaying glyphStateValueTransformer](self->_routeDisplayInfo, "glyphStateValueTransformer");
  v5 = (void (**)(_QWORD, __n128))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a3)
      v6.n128_f32[0] = *a3;
    else
      -[SBElasticValueViewController currentValue](self, "currentValue");
    v5[2](v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (id)v7;
  -[CCUIBaseSliderView setGlyphState:](self->_sliderView, "setGlyphState:", v7);

}

- (void)_updateLabelsForAxis:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  SBElasticSliderView *sliderView;
  void *v10;
  SBElasticSliderView *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  _UILegibilityLabel *trailingLabel;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  _UILegibilityLabel *leadingLabel;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (__sb__runningInSpringBoard())
  {
    v5 = (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && (unint64_t)(-[SBElasticValueViewController hudPresentationOrientation](self, "hudPresentationOrientation")- 1) < 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom"))
      v5 = 0;
    else
      v5 = (unint64_t)(-[SBElasticValueViewController hudPresentationOrientation](self, "hudPresentationOrientation")- 1) < 2;

  }
  if (!self->_routeDisplayInfo)
    goto LABEL_14;
  -[CCUIBaseSliderView glyphPackageDescription](self->_sliderView, "glyphPackageDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    goto LABEL_15;
  }
  -[CCUIBaseSliderView glyphImage](self->_sliderView, "glyphImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_14:
    -[SBElasticValueViewController _computeCachedRouteDisplayInformation](self, "_computeCachedRouteDisplayInformation");
    sliderView = self->_sliderView;
    -[SBElasticRouteDisplaying glyphImage](self->_routeDisplayInfo, "glyphImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIBaseSliderView setGlyphImage:](sliderView, "setGlyphImage:", v10);

    v11 = self->_sliderView;
    -[SBElasticRouteDisplaying glyphPackage](self->_routeDisplayInfo, "glyphPackage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIBaseSliderView setGlyphPackageDescription:](v11, "setGlyphPackageDescription:", v12);

    -[SBElasticValueViewController _updateGlyphStateIfNecessaryForValue:](self, "_updateGlyphStateIfNecessaryForValue:", 0);
  }
LABEL_15:
  -[SBElasticValueViewController overrideDisplayNameForRoute:](self, "overrideDisplayNameForRoute:", self->_routeDisplayInfo);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    -[SBElasticRouteDisplaying localizedDisplayName](self->_routeDisplayInfo, "localizedDisplayName");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v17 = 2;
  if (v5)
    v17 = 4;
  if (a3 == 1)
    v18 = v17;
  else
    v18 = 1;
  -[SBElasticSliderView setAccessoryLayoutEdge:](self->_sliderView, "setAccessoryLayoutEdge:", v18);
  -[SBElasticValueViewController traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");

  -[_UILegibilityLabel string](self->_trailingLabel, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = BSEqualStrings();

  v22 = (uint64_t *)MEMORY[0x1E0CEA098];
  if ((v21 & 1) == 0)
  {
    v33 = *MEMORY[0x1E0CEA098];
    -[_UILegibilityLabel font](self->_trailingLabel, "font");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "sizeWithAttributes:", v24);

    BSSizeCeilForScale();
    trailingLabel = self->_trailingLabel;
    BSRectWithSize();
    -[_UILegibilityLabel setBounds:](trailingLabel, "setBounds:");
    -[_UILegibilityLabel setString:](self->_trailingLabel, "setString:", 0);
    -[SBElasticSliderView setNeedsLayout](self->_sliderView, "setNeedsLayout");
  }
  -[_UILegibilityLabel string](self->_leadingLabel, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = BSEqualStrings();

  if ((v27 & 1) == 0)
  {
    v31 = *v22;
    -[_UILegibilityLabel font](self->_leadingLabel, "font");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeWithAttributes:", v29);

    BSSizeCeilForScale();
    leadingLabel = self->_leadingLabel;
    BSRectWithSize();
    -[_UILegibilityLabel setBounds:](leadingLabel, "setBounds:");
    -[_UILegibilityLabel setString:](self->_leadingLabel, "setString:", v16);
    -[SBElasticSliderView setNeedsLayout](self->_sliderView, "setNeedsLayout");
  }

}

- (void)_updateDimmingVisible:(BOOL)a3
{
  _BOOL4 v3;
  SBElasticHUDSettings *settings;
  UIView *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  settings = self->_settings;
  v5 = self->_dimmingView;
  -[SBElasticHUDSettings dimmingAlpha](settings, "dimmingAlpha");
  v7 = v6;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;
  objc_msgSend(v8, "colorWithAlphaComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v9);

}

- (void)_updateSliderViewMetricsForState:(int64_t)a3 bounds:(CGRect)a4
{
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  -[SBElasticValueViewController _sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:](self, "_sliderViewMetricsUpdatersForState:bounds:primaryMetricsUpdater:positionUpdater:", a3, &v8, &v7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v8);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v7);
  ((void (**)(_QWORD, SBElasticSliderView *))v5)[2](v5, self->_sliderView);
  ((void (**)(_QWORD, SBElasticSliderView *))v6)[2](v6, self->_sliderView);

}

- (void)_sliderViewMetricsUpdatersForState:(int64_t)a3 bounds:(CGRect)a4 primaryMetricsUpdater:(id *)a5 positionUpdater:(id *)a6
{
  int64_t previousState;
  id v11;
  _BOOL4 v12;
  _BOOL4 v13;
  BOOL v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  _QWORD v28[7];
  BOOL v29;

  previousState = self->_previousState;
  if (a3 || !self->_reduceMotionEnabled)
  {
    v12 = previousState == 2;
  }
  else
  {
    if (previousState != -1)
    {
      if (a5)
        *a5 = &__block_literal_global_186;
      if (a6)
      {
        v11 = &__block_literal_global_187;
LABEL_17:
        *a6 = v11;
        return;
      }
      return;
    }
    v12 = 0;
  }
  v13 = a3 == 0;
  v14 = v13 && v12;
  if (v13 && v12)
    v15 = 2;
  else
    v15 = a3;
  -[SBElasticValueViewController glyphScaleForState:](self, "glyphScaleForState:", a3);
  v17 = v16;
  -[SBElasticValueViewController sizeForState:](self, "sizeForState:", v15);
  v19 = v18;
  v21 = v20;
  -[SBElasticValueViewController centerForState:sliderSize:bounds:](self, "centerForState:sliderSize:bounds:", a3);
  v23 = v22;
  v25 = v24;
  v26 = MEMORY[0x1E0C809B0];
  if (a5)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_3;
    v28[3] = &__block_descriptor_57_e29_v16__0__SBElasticSliderView_8l;
    v29 = v14;
    v28[4] = v17;
    v28[5] = v19;
    v28[6] = v21;
    *a5 = (id)MEMORY[0x1D17E5550](v28);
  }
  if (a6)
  {
    v27[0] = v26;
    v27[1] = 3221225472;
    v27[2] = __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_4;
    v27[3] = &__block_descriptor_48_e29_v16__0__SBElasticSliderView_8l;
    v27[4] = v23;
    v27[5] = v25;
    v11 = (id)MEMORY[0x1D17E5550](v27);
    goto LABEL_17;
  }
}

void __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(v3, "setAdditiveGlyphScaleFactor:", *(double *)(a1 + 32));
  BSRectWithSize();
  objc_msgSend(v3, "setBounds:");

}

uint64_t __112__SBElasticValueViewController__sliderViewMetricsUpdatersForState_bounds_primaryMetricsUpdater_positionUpdater___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCenter:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)_updateTouchTrackingArea
{
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
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxX;
  double v20;
  double MaxY;
  double v22;
  double MinX;
  double v24;
  double MinY;
  double v26;
  double v27;
  double v28;
  _QWORD v29[9];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[SBElasticSliderView center](self->_sliderView, "center");
  -[SBElasticValueViewController maximumSizeForSlider](self, "maximumSizeForSlider");
  -[SBElasticValueViewController axis](self, "axis");
  -[SBElasticSliderView frame](self->_sliderView, "frame");
  v4 = v3;
  v27 = v5;
  v28 = v6;
  v8 = v7;
  BSRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  if (self->_state)
  {
    if (v9 < 0.0)
      v13 = 0.0;
    if (v10 < 0.0)
      v14 = 0.0;
  }
  v17 = v13;
  v18 = v14;
  MinY = CGRectGetMinY(*(CGRect *)(&v11 - 2));
  v30.origin.x = v4;
  v30.origin.y = v27;
  v30.size.width = v8;
  v30.size.height = v28;
  v26 = MinY - CGRectGetMinY(v30);
  v31.origin.x = v13;
  v31.origin.y = v14;
  v31.size.width = v15;
  v31.size.height = v16;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = v4;
  v32.origin.y = v27;
  v32.size.width = v8;
  v32.size.height = v28;
  v24 = MinX - CGRectGetMinX(v32);
  v33.origin.x = v4;
  v33.origin.y = v27;
  v33.size.width = v8;
  v33.size.height = v28;
  MaxY = CGRectGetMaxY(v33);
  v34.origin.x = v13;
  v34.origin.y = v14;
  v34.size.width = v15;
  v34.size.height = v16;
  v22 = MaxY - CGRectGetMaxY(v34);
  v35.origin.x = v4;
  v35.origin.y = v27;
  v35.size.width = v8;
  v35.size.height = v28;
  MaxX = CGRectGetMaxX(v35);
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  v20 = MaxX - CGRectGetMaxX(v36);
  -[SBElasticSliderView _setTouchInsets:](self->_sliderView, "_setTouchInsets:", v26, v24, v22, v20);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __56__SBElasticValueViewController__updateTouchTrackingArea__block_invoke;
  v29[3] = &unk_1E8EA25E0;
  v29[4] = self;
  *(double *)&v29[5] = v4 + v24;
  *(double *)&v29[6] = v27 + v26;
  *(double *)&v29[7] = v8 - (v24 + v20);
  *(double *)&v29[8] = v28 - (v26 + v22);
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v29);
}

uint64_t __56__SBElasticValueViewController__updateTouchTrackingArea__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateDebugUIPositions
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[SBElasticValueViewController sliderView](self, "sliderView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[UISlider isTracking](self->_debugWidthSlider, "isTracking") & 1) == 0)
  {
    objc_msgSend(v9, "bounds");
    *(float *)&v4 = v3;
    -[UISlider setValue:](self->_debugWidthSlider, "setValue:", v4);
  }
  if ((-[UISlider isTracking](self->_debugHeightSlider, "isTracking") & 1) == 0)
  {
    objc_msgSend(v9, "bounds");
    *(float *)&v6 = v5;
    -[UISlider setValue:](self->_debugHeightSlider, "setValue:", v6);
  }
  if ((-[UISlider isTracking](self->_debugPortraitYOriginSlider, "isTracking") & 1) == 0)
  {
    objc_msgSend(v9, "center");
    *(float *)&v8 = v7;
    -[UISlider setValue:](self->_debugPortraitYOriginSlider, "setValue:", v8);
  }

}

- (void)_updateForAxisChange:(unint64_t)a3
{
  self->_axis = a3;
  -[SBElasticValueViewController _updateSliderWithAxis:](self, "_updateSliderWithAxis:");
}

- (void)_updateSliderWithAxis:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[SBElasticValueViewController sliderView](self, "sliderView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAxis:", a3);
  -[SBElasticValueViewController settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "landscapeCornerRadiusFraction");
    v8 = v7;
    objc_msgSend(v6, "landscapeState1Height");
    v10 = v9;
    objc_msgSend(v6, "landscapeState2Height");
  }
  else
  {
    objc_msgSend(v5, "portraitCornerRadiusFraction");
    v8 = v12;
    objc_msgSend(v6, "portraitState1Width");
    v10 = v13;
    objc_msgSend(v6, "portraitState2Width");
  }
  v14 = v11;
  objc_msgSend(v15, "setCornerRadiusMinorAxisFraction:", v8);
  objc_msgSend(v15, "setRegularMinorAxisDimension:", v10);
  objc_msgSend(v15, "setCompactMinorAxisDimension:", v14);

}

- (unint64_t)_updateSliderValue:(float)a3 animated:(BOOL)a4
{
  return -[SBElasticValueViewController _updateSliderValue:animated:transitioningStateContextuallyIfNecessary:](self, "_updateSliderValue:animated:transitioningStateContextuallyIfNecessary:", a4, 1);
}

- (unint64_t)_updateSliderValue:(float)a3 animated:(BOOL)a4 transitioningStateContextuallyIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v9;
  _BOOL4 sliderIsEditing;
  int v11;
  SBElasticSliderView *sliderView;
  int v13;
  double v14;
  NSTimer *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v20;
  NSTimer *dismissalTimer;
  float v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  NSTimer *v29;
  uint64_t v30;

  v5 = a5;
  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[SBElasticValueViewController log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    dismissalTimer = self->_dismissalTimer;
    *(_DWORD *)buf = 134218498;
    v25 = a3;
    v26 = 1024;
    v27 = v6;
    v28 = 2112;
    v29 = dismissalTimer;
    _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "updateSliderValue:%f animated:%{BOOL}u -- Dismissal Timer: %@", buf, 0x1Cu);
  }

  sliderIsEditing = self->_sliderIsEditing;
  if (self->_sliderIsEditing)
  {
    v11 = 1;
  }
  else
  {
    -[CCUIBaseSliderView value](self->_sliderView, "value");
    v11 = BSFloatApproximatelyEqualToFloat();
    sliderView = self->_sliderView;
    v13 = -[SBElasticValueViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    *(float *)&v14 = a3;
    -[CCUIBaseSliderView setValue:animated:](sliderView, "setValue:animated:", v13 & v6, v14);
  }
  -[SBElasticValueViewController _updateGlyphStateIfNecessaryForValue:](self, "_updateGlyphStateIfNecessaryForValue:", &v23);
  v15 = self->_dismissalTimer;
  v16 = 1;
  if (v15 && (v11 & 1) == 0)
  {
    -[NSTimer userInfo](v15, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("DismissalReason"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBElasticValueViewController _invalidateDismissalTimerForReason:](self, "_invalidateDismissalTimerForReason:", CFSTR("updateSliderValue:animated: called"));
    -[SBElasticValueViewController _scheduleDismissal:](self, "_scheduleDismissal:", v18);

    v16 = 0;
  }
  v19 = -[SBElasticValueViewController isSliderTracking](self, "isSliderTracking");
  v20 = !v5;
  if (self->_state == 2)
    v20 = 1;
  if (!sliderIsEditing && ((v20 | v11) & 1) == 0 && !v19)
    -[SBElasticValueViewController transitionStateContextuallyForValueChangeEvent](self, "transitionStateContextuallyForValueChangeEvent");
  return v16;
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  return (SBHUDAttachmentDelegate *)objc_loadWeakRetained((id *)&self->_attachmentDelegate);
}

- (void)setAttachmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentDelegate, a3);
}

- (SBElasticValueDataSource)dataSource
{
  return (SBElasticValueDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SBElasticValueViewControllerDelegate)delegate
{
  return (SBElasticValueViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGPoint)positionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_positionOffset.x;
  y = self->_positionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (SBElasticHUDSettings)settings
{
  return self->_settings;
}

- (SBElasticSliderView)sliderView
{
  return self->_sliderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
  objc_storeStrong((id *)&self->_debugAutoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_routeDisplayInfo, 0);
  objc_storeStrong((id *)&self->_debugResetAudioRouteButton, 0);
  objc_storeStrong((id *)&self->_debugNextAudioRouteButton, 0);
  objc_storeStrong((id *)&self->_debugDumpButton, 0);
  objc_storeStrong((id *)&self->_debugPortraitYOriginSlider, 0);
  objc_storeStrong((id *)&self->_debugHeightSlider, 0);
  objc_storeStrong((id *)&self->_debugWidthSlider, 0);
  objc_storeStrong((id *)&self->_debugLockStateSwitch, 0);
  objc_storeStrong((id *)&self->_debugLockStateLabel, 0);
  objc_storeStrong((id *)&self->_debugAutoDismissalSwitch, 0);
  objc_storeStrong((id *)&self->_debugAutoDismissLabel, 0);
  objc_storeStrong((id *)&self->_debugStateSegmentedControl, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_debugContainerView, 0);
  objc_storeStrong((id *)&self->_displayLinkForVisiblyOffscreenMonitoring, 0);
  objc_storeStrong((id *)&self->_pendingValueToApply, 0);
  objc_storeStrong((id *)&self->_sliderApplyValueTimer, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_shortLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_touchTrackingView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
  objc_storeStrong((id *)&self->_sliderContainerView, 0);
}

- (void)setupFailureRelationshipForGestureRecognizer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Setting up gesture recognizer failure relationship for %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
