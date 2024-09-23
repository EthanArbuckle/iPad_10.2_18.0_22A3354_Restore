@implementation PUWallpaperPlaygroundViewController

- (PUWallpaperPlaygroundViewController)initWithAssets:(id)a3
{
  id v4;
  PUWallpaperPlaygroundViewController *v5;
  uint64_t v6;
  NSArray *assets;
  uint64_t v8;
  _PUWallpaperDebugRenderingEnvironment *environment;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUWallpaperPlaygroundViewController;
  v5 = -[PUWallpaperPlaygroundViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

    -[PUWallpaperPlaygroundViewController _renderingEnvironmentForAssets:](v5, "_renderingEnvironmentForAssets:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (_PUWallpaperDebugRenderingEnvironment *)v8;

    -[PUWallpaperPlaygroundViewController _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (PUWallpaperPlaygroundViewController)initWithConfiguration:(id)a3 assetDirectory:(id)a4
{
  id v6;
  id v7;
  PUWallpaperPlaygroundViewController *v8;
  _PUWallpaperDebugRenderingEnvironment *v9;
  _PUWallpaperDebugRenderingEnvironment *environment;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUWallpaperPlaygroundViewController;
  v8 = -[PUWallpaperPlaygroundViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = -[_PUWallpaperDebugRenderingEnvironment initWithPosterConfiguration:assetDirectory:]([_PUWallpaperDebugRenderingEnvironment alloc], "initWithPosterConfiguration:assetDirectory:", v6, v7);
    environment = v8->_environment;
    v8->_environment = v9;

    -[PUWallpaperPlaygroundViewController _commonInit](v8, "_commonInit");
  }

  return v8;
}

- (void)_commonInit
{
  _PUWallpaperDebugMutablePreferences *v3;
  _PUWallpaperDebugMutablePreferences *preferences;
  void *v5;
  void *v6;
  id shuffleTriggerObserver;
  _QWORD v8[4];
  id v9;
  id location;

  self->_showsControls = 1;
  v3 = objc_alloc_init(_PUWallpaperDebugMutablePreferences);
  preferences = self->_preferences;
  self->_preferences = v3;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PUWallpaperPlaygroundViewController__commonInit__block_invoke;
  v8[3] = &unk_1E589D558;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("PUWallpaperShuffleNotificationName"), 0, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shuffleTriggerObserver = self->_shuffleTriggerObserver;
  self->_shuffleTriggerObserver = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PUWallpaperPlaygroundViewController posterController](self, "posterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel"), &ViewModelObservationContext);

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperPlaygroundViewController;
  -[PUWallpaperPlaygroundViewController dealloc](&v4, sel_dealloc);
}

- (id)_renderingEnvironmentForAssets:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  _PUWallpaperDebugRenderingEnvironment *v7;

  v3 = (objc_class *)MEMORY[0x1E0D751F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithConfigurationType:", 0);
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMedia:", v6);
  v7 = -[_PUWallpaperDebugRenderingEnvironment initWithPosterConfiguration:assetDirectory:]([_PUWallpaperDebugRenderingEnvironment alloc], "initWithPosterConfiguration:assetDirectory:", v5, 0);

  return v7;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperPlaygroundViewController;
  -[PUWallpaperPlaygroundViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PUWallpaperPlaygroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PUWallpaperPlaygroundViewController _setupRendererViews](self, "_setupRendererViews");
  -[PUWallpaperPlaygroundViewController _setupPosterController](self, "_setupPosterController");
  -[PUWallpaperPlaygroundViewController _setupControls](self, "_setupControls");
  -[PUWallpaperPlaygroundViewController _setupLowLuminanceFilter](self, "_setupLowLuminanceFilter");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  objc_msgSend(v3, "addGestureRecognizer:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTwoFingerTap_);
  objc_msgSend(v6, "setNumberOfTouchesRequired:", 2);
  objc_msgSend(v3, "addGestureRecognizer:", v6);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)PUWallpaperPlaygroundViewController;
  -[PUWallpaperPlaygroundViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[PUWallpaperPlaygroundViewController posterController](self, "posterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPlaygroundViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (v6)
  {
    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    if (!CGRectIsEmpty(v18))
    {
      -[PUWallpaperPlaygroundViewController dateView](self, "dateView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutWithLayout:inContainerFrame:", v6, v9, v11, v13, v15);

    }
  }

}

- (void)_setupRendererViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *hostingView;
  UIView *v13;
  UIView *v14;
  UIView *backgroundView;
  UIView *v16;
  UIView *v17;
  UIView *foregroundView;
  UIView *v19;
  PUWallpaperPosterDateView *v20;
  UIView *v21;
  UIView *floatingView;
  id v23;
  CGRect v24;
  CGRect v25;

  -[PUWallpaperPlaygroundViewController view](self, "view");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v3, v5, v7, v9);
  -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  objc_msgSend(v23, "addSubview:", v11);
  hostingView = self->_hostingView;
  self->_hostingView = v11;
  v13 = v11;

  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  -[UIView setAutoresizingMask:](v14, "setAutoresizingMask:", 18);
  -[UIView addSubview:](v13, "addSubview:", v14);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v14;
  v16 = v14;

  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  -[UIView setAutoresizingMask:](v17, "setAutoresizingMask:", 18);
  -[UIView addSubview:](v13, "addSubview:", v17);
  foregroundView = self->_foregroundView;
  self->_foregroundView = v17;
  v19 = v17;

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectOffset(v24, 0.0, 100.0);
  v20 = -[PUWallpaperPosterDateView initWithFrame:]([PUWallpaperPosterDateView alloc], "initWithFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  -[UIView addSubview:](v13, "addSubview:", v20);
  -[PUWallpaperPlaygroundViewController setDateView:](self, "setDateView:", v20);
  v21 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v6, v8, v10);
  -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
  -[UIView addSubview:](v13, "addSubview:", v21);
  floatingView = self->_floatingView;
  self->_floatingView = v21;

}

- (void)_setupPosterController
{
  PUWallpaperPosterController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUWallpaperPosterController *v8;

  v3 = [PUWallpaperPosterController alloc];
  -[PUWallpaperPlaygroundViewController assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUWallpaperPosterController initWithRenderer:photoLibrary:](v3, "initWithRenderer:photoLibrary:", self, v6);

  -[PUWallpaperPlaygroundViewController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController renderer:didInitializeWithEnvironment:](v8, "renderer:didInitializeWithEnvironment:", self, v7);

  -[PUWallpaperPlaygroundViewController setPosterController:](self, "setPosterController:", v8);
}

- (void)setPosterController:(id)a3
{
  PUWallpaperPosterController **p_posterController;
  PUWallpaperPosterController *v6;
  PUWallpaperPosterController *v7;
  char v8;
  PUWallpaperPosterController *v9;

  v9 = (PUWallpaperPosterController *)a3;
  p_posterController = &self->_posterController;
  v6 = self->_posterController;
  if (v6 == v9)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PUWallpaperPosterController isEqual:](v6, "isEqual:", v9);

    if ((v8 & 1) == 0)
    {
      -[PUWallpaperPosterController removeObserver:forKeyPath:context:](*p_posterController, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel"), &ViewModelObservationContext);
      objc_storeStrong((id *)&self->_posterController, a3);
      -[PUWallpaperPosterController addObserver:forKeyPath:options:context:](*p_posterController, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel"), 0, &ViewModelObservationContext);
    }
  }

}

- (void)_setupControls
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  id location;
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPlaygroundViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setButtonSize:", 1);
  objc_msgSend(v35, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBaseForegroundColor:", v3);

  objc_msgSend(v35, "setTitle:", CFSTR("Done"));
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0DC3518]);
  v5 = (void *)MEMORY[0x1E0DC3428];
  v6 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke;
  v38[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v39, &location);
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", CFSTR("Done"), 0, 0, v38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = (void *)objc_msgSend(v4, "initWithFrame:primaryAction:", v7, *MEMORY[0x1E0C9D648], v9, v10, v11);

  objc_msgSend(v12, "setConfiguration:", v35);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v36, "addSubview:", v12);
  -[PUWallpaperPlaygroundViewController setDoneButton:](self, "setDoneButton:", v12);
  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setButtonSize:", 3);
  objc_msgSend(v13, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBaseForegroundColor:", v14);
  v34 = v13;

  v15 = objc_alloc(MEMORY[0x1E0DC3518]);
  v16 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gearshape.fill"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v6;
  v37[1] = 3221225472;
  v37[2] = __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke_2;
  v37[3] = &unk_1E58A6930;
  v37[4] = self;
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", &stru_1E58AD278, v17, 0, v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithFrame:primaryAction:", v18, v8, v9, v10, v11);

  objc_msgSend(v19, "setConfiguration:", v34);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v36, "addSubview:", v19);
  -[PUWallpaperPlaygroundViewController setSettingsButton:](self, "setSettingsButton:", v19);
  v28 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v12, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -20.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v31;
  objc_msgSend(v12, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 20.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v20;
  objc_msgSend(v19, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v23;
  objc_msgSend(v19, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -50.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v27);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

- (void)_dismiss
{
  void *v2;
  void *v3;
  void *v4;

  -[PUWallpaperPlaygroundViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)wrapperWindow;
  wrapperWindow = 0;

}

- (void)setShowsControls:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_showsControls != a3)
  {
    self->_showsControls = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PUWallpaperPlaygroundViewController_setShowsControls___block_invoke;
    v3[3] = &unk_1E58AAD68;
    v3[4] = self;
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v3, 0);
  }
}

- (void)_handleTap:(id)a3
{
  -[PUWallpaperPlaygroundViewController setShowsControls:](self, "setShowsControls:", -[PUWallpaperPlaygroundViewController showsControls](self, "showsControls", a3) ^ 1);
}

- (void)_handleTwoFingerTap:(id)a3
{
  -[PUWallpaperPlaygroundViewController setUseLowLuminance:](self, "setUseLowLuminance:", -[PUWallpaperPlaygroundViewController useLowLuminance](self, "useLowLuminance", a3) ^ 1);
}

- (void)_handleShuffleTrigger
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperPlaygroundViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPx_significantEventsCounter:", objc_msgSend(v3, "px_significantEventsCounter") + 1);

  -[PUWallpaperPlaygroundViewController posterController](self, "posterController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPlaygroundViewController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderer:didUpdateEnvironment:withTransition:", self, v4, 0);

}

- (void)_setupLowLuminanceFilter
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CD2DE8];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2DE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowAPLFilterAmount");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CD2CB8];
  objc_msgSend(v4, "setValue:forKey:", v7, *MEMORY[0x1E0CD2CB8]);

  v9 = *MEMORY[0x1E0CD2DA8];
  objc_msgSend(v4, "setValue:forKey:", &unk_1E59BC4E0, *MEMORY[0x1E0CD2DA8]);
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPlaygroundViewController hostingView](self, "hostingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFilters:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), v3, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPlaygroundViewController setLowLuminanceFilterInputScaleKeyPath:](self, "setLowLuminanceFilterInputScaleKeyPath:", v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), v3, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPlaygroundViewController setLowLuminanceFilterInputAmountKeyPath:](self, "setLowLuminanceFilterInputAmountKeyPath:", v14);

}

- (void)setUseLowLuminance:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  BOOL v8;

  if (self->_useLowLuminance != a3)
  {
    self->_useLowLuminance = a3;
    -[PUWallpaperPlaygroundViewController _updateLowLuminanceState](self, "_updateLowLuminanceState");
    -[PUWallpaperPlaygroundViewController posterController](self, "posterController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PUWallpaperPlaygroundViewController_setUseLowLuminance___block_invoke;
    v7[3] = &__block_descriptor_33_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v8 = a3;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (void)_updateLowLuminanceState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
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
  _QWORD v20[5];

  if (PFPosterWantsLowLuminanceContent())
  {
    +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowLuminanceAlphaAnimationDuration");
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0DC3F10];
    -[PUWallpaperPlaygroundViewController dateView](self, "dateView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__PUWallpaperPlaygroundViewController__updateLowLuminanceState__block_invoke;
    v20[3] = &unk_1E58ABD10;
    v20[4] = self;
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v20, 0, v5);

    if (objc_msgSend(v3, "applyLowAPLFilter"))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      if (-[PUWallpaperPlaygroundViewController useLowLuminance](self, "useLowLuminance"))
        v8 = &unk_1E59BC4F0;
      else
        v8 = &unk_1E59BC4E0;
      -[PUWallpaperPlaygroundViewController hostingView](self, "hostingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUWallpaperPlaygroundViewController lowLuminanceFilterInputScaleKeyPath](self, "lowLuminanceFilterInputScaleKeyPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentationLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKeyPath:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v14);

      objc_msgSend(v12, "setToValue:", v8);
      objc_msgSend(v12, "setDuration:", v5);
      objc_msgSend(v12, "setRemovedOnCompletion:", 0);
      objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimingFunction:", v15);

      objc_msgSend(v10, "addAnimation:forKey:", v12, CFSTR("lowLuminanceIntensity"));
      objc_msgSend(v10, "setValue:forKeyPath:", v8, v11);
      v16 = (void *)MEMORY[0x1E0CB37E8];
      +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowAPLFilterAmount");
      objc_msgSend(v16, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPlaygroundViewController lowLuminanceFilterInputAmountKeyPath](self, "lowLuminanceFilterInputAmountKeyPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKeyPath:", v18, v19);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }

  }
}

- (double)px_lowLuminanceAlphaAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowLuminanceAlphaAnimationDuration");
  v4 = v3;

  return v4;
}

- (double)px_backlightTransformAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowLuminanceTransformAnimationDuration");
  v4 = v3;

  return v4;
}

- (double)px_shuffleSleepTransformOutAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shuffleSleepTransformOutAnimationDuration");
  v4 = v3;

  return v4;
}

- (double)px_shuffleSleepFadeOutAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shuffleSleepFadeOutAnimationDuration");
  v4 = v3;

  return v4;
}

- (double)px_shuffleSleepFadeInAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shuffleSleepFadeInAnimationDuration");
  v4 = v3;

  return v4;
}

- (void)px_updatePreferences:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PUWallpaperPlaygroundViewController preferences](self, "preferences");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  (*((void (**)(id, id, void *))a3 + 2))(v5, v7, v6);

}

- (id)px_extendRenderSessionForReason:(id)a3
{
  return objc_alloc_init(PUWallpaperPlaygroundInvalidatable);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v6;

  if ((void *)ViewModelObservationContext == a6)
  {
    -[PUWallpaperPlaygroundViewController view](self, "view", a3, a4, a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)presentPlaygroundWithPresentingViewController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v5);
  v7 = (void *)wrapperWindow;
  wrapperWindow = v6;

  objc_msgSend((id)wrapperWindow, "setRootViewController:", self);
  objc_msgSend((id)wrapperWindow, "makeKeyAndVisible");

}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (UIView)hostingView
{
  return self->_hostingView;
}

- (void)setHostingView:(id)a3
{
  objc_storeStrong((id *)&self->_hostingView, a3);
}

- (_PUWallpaperDebugRenderingEnvironment)environment
{
  return self->_environment;
}

- (_PUWallpaperDebugMutablePreferences)preferences
{
  return self->_preferences;
}

- (PUWallpaperPosterController)posterController
{
  return self->_posterController;
}

- (PUWallpaperPosterDateView)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (id)shuffleTriggerObserver
{
  return self->_shuffleTriggerObserver;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setSettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_settingsButton, a3);
}

- (BOOL)useLowLuminance
{
  return self->_useLowLuminance;
}

- (NSString)lowLuminanceFilterInputScaleKeyPath
{
  return self->_lowLuminanceFilterInputScaleKeyPath;
}

- (void)setLowLuminanceFilterInputScaleKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_lowLuminanceFilterInputScaleKeyPath, a3);
}

- (NSString)lowLuminanceFilterInputAmountKeyPath
{
  return self->_lowLuminanceFilterInputAmountKeyPath;
}

- (void)setLowLuminanceFilterInputAmountKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_lowLuminanceFilterInputAmountKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowLuminanceFilterInputAmountKeyPath, 0);
  objc_storeStrong((id *)&self->_lowLuminanceFilterInputScaleKeyPath, 0);
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong(&self->_shuffleTriggerObserver, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_posterController, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_hostingView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

void __63__PUWallpaperPlaygroundViewController__updateLowLuminanceState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "useLowLuminance");
  objc_msgSend(*(id *)(a1 + 32), "dateView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUseThinnerFontWeightForTime:", v2);

}

void __58__PUWallpaperPlaygroundViewController_setUseLowLuminance___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = PFPosterWantsLowLuminanceContent();
  if (*(_BYTE *)(a1 + 32))
    v4 = v3;
  else
    v4 = 2;
  objc_msgSend(v5, "setBacklightLuminance:", v4);

}

uint64_t __56__PUWallpaperPlaygroundViewController_setShowsControls___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "settingsButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

void __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

void __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D83120]);
  +[PUWallpaperPlaygroundSettings sharedInstance](PUWallpaperPlaygroundSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRootSettings:", v3);

  objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetents:", v6);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);
}

id __70__PUWallpaperPlaygroundViewController__renderingEnvironmentForAssets___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D75210];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithAssetUUID:", v5);
  return v6;
}

void __50__PUWallpaperPlaygroundViewController__commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleShuffleTrigger");

}

@end
