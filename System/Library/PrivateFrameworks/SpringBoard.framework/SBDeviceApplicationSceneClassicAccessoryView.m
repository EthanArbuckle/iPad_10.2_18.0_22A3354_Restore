@implementation SBDeviceApplicationSceneClassicAccessoryView

- (SBDeviceApplicationSceneClassicAccessoryView)initWithFrame:(CGRect)a3 sceneHandle:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  SBDeviceApplicationSceneClassicAccessoryView *v10;
  SBDeviceApplicationSceneClassicAccessoryView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIButton *zoomButton;
  uint64_t v16;
  UIButton *clockWiseRotationButton;
  uint64_t v18;
  UIButton *counterClockWiseRotationButton;
  id v20;
  uint64_t v21;
  BSUIOrientationTransformWrapperView *transformWrapperView;
  id v23;
  uint64_t v24;
  UIView *buttonWrapperView;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *zoomButtonHorizontalConstraint;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *zoomButtonVerticalConstraint;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *zoomButtonWidthConstraint;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *zoomButtonHeightConstraint;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *rotationButtonTopConstraint;
  void *v48;
  void *v49;
  uint64_t v50;
  NSLayoutConstraint *rotationButtonBottomConstraint;
  void *v52;
  void *v53;
  uint64_t v54;
  NSLayoutConstraint *rotationButtonLeadingConstraint;
  void *v56;
  void *v57;
  uint64_t v58;
  NSLayoutConstraint *rotationButtonTrailingConstraint;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  SBSceneHandleBlockObserver *v69;
  SBSceneHandleBlockObserver *sceneHandleObserver;
  SBSceneHandleBlockObserver *v71;
  uint64_t v72;
  id v73;
  SBSceneHandleBlockObserver *v74;
  id v75;
  SBSceneHandleBlockObserver *v76;
  id v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  id location;
  objc_super v92;
  _QWORD v93[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v93[4] = *MEMORY[0x1E0C80C00];
  v84 = a4;
  v92.receiver = self;
  v92.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryView;
  v10 = -[SBDeviceApplicationSceneClassicAccessoryView initWithFrame:](&v92, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sceneHandle, a4);
    -[SBDeviceApplicationSceneHandle sceneIfExists](v11->_sceneHandle, "sceneIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uiClientSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_buttonOrientation = objc_msgSend(v13, "interfaceOrientation");

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    zoomButton = v11->_zoomButton;
    v11->_zoomButton = (UIButton *)v14;

    -[SBDeviceApplicationSceneClassicAccessoryView _updateZoomButton](v11, "_updateZoomButton");
    -[UIButton sizeToFit](v11->_zoomButton, "sizeToFit");
    -[UIButton addTarget:action:forControlEvents:](v11->_zoomButton, "addTarget:action:forControlEvents:", v11, sel__changeZoom_, 64);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    clockWiseRotationButton = v11->_clockWiseRotationButton;
    v11->_clockWiseRotationButton = (UIButton *)v16;

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    counterClockWiseRotationButton = v11->_counterClockWiseRotationButton;
    v11->_counterClockWiseRotationButton = (UIButton *)v18;

    -[SBDeviceApplicationSceneClassicAccessoryView _updateRotationButton](v11, "_updateRotationButton");
    -[UIButton sizeToFit](v11->_clockWiseRotationButton, "sizeToFit");
    -[UIButton sizeToFit](v11->_counterClockWiseRotationButton, "sizeToFit");
    -[UIButton addTarget:action:forControlEvents:](v11->_clockWiseRotationButton, "addTarget:action:forControlEvents:", v11, sel__rotateApplicationScene_, 64);
    -[UIButton addTarget:action:forControlEvents:](v11->_counterClockWiseRotationButton, "addTarget:action:forControlEvents:", v11, sel__rotateApplicationScene_, 64);
    v20 = objc_alloc(MEMORY[0x1E0D01940]);
    -[SBDeviceApplicationSceneClassicAccessoryView bounds](v11, "bounds");
    v21 = objc_msgSend(v20, "initWithFrame:");
    transformWrapperView = v11->_transformWrapperView;
    v11->_transformWrapperView = (BSUIOrientationTransformWrapperView *)v21;

    -[BSUIOrientationTransformWrapperView setContentOrientation:](v11->_transformWrapperView, "setContentOrientation:", v11->_buttonOrientation);
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](v11->_transformWrapperView, "setContainerOrientation:", v11->_buttonOrientation);
    v23 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBDeviceApplicationSceneClassicAccessoryView bounds](v11, "bounds");
    v24 = objc_msgSend(v23, "initWithFrame:");
    buttonWrapperView = v11->_buttonWrapperView;
    v11->_buttonWrapperView = (UIView *)v24;

    -[UIView addSubview:](v11->_buttonWrapperView, "addSubview:", v11->_zoomButton);
    -[UIView addSubview:](v11->_buttonWrapperView, "addSubview:", v11->_clockWiseRotationButton);
    -[UIView addSubview:](v11->_buttonWrapperView, "addSubview:", v11->_counterClockWiseRotationButton);
    -[BSUIOrientationTransformWrapperView addContentView:](v11->_transformWrapperView, "addContentView:", v11->_buttonWrapperView);
    -[SBDeviceApplicationSceneClassicAccessoryView addSubview:](v11, "addSubview:", v11->_transformWrapperView);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_zoomButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton trailingAnchor](v11->_zoomButton, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_buttonWrapperView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    zoomButtonHorizontalConstraint = v11->_zoomButtonHorizontalConstraint;
    v11->_zoomButtonHorizontalConstraint = (NSLayoutConstraint *)v28;

    -[UIButton bottomAnchor](v11->_zoomButton, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v11->_buttonWrapperView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    zoomButtonVerticalConstraint = v11->_zoomButtonVerticalConstraint;
    v11->_zoomButtonVerticalConstraint = (NSLayoutConstraint *)v32;

    -[UIButton widthAnchor](v11->_zoomButton, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 48.0);
    v35 = objc_claimAutoreleasedReturnValue();
    zoomButtonWidthConstraint = v11->_zoomButtonWidthConstraint;
    v11->_zoomButtonWidthConstraint = (NSLayoutConstraint *)v35;

    -[UIButton heightAnchor](v11->_zoomButton, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 48.0);
    v38 = objc_claimAutoreleasedReturnValue();
    zoomButtonHeightConstraint = v11->_zoomButtonHeightConstraint;
    v11->_zoomButtonHeightConstraint = (NSLayoutConstraint *)v38;

    -[NSLayoutConstraint setActive:](v11->_zoomButtonHorizontalConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](v11->_zoomButtonVerticalConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](v11->_zoomButtonWidthConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](v11->_zoomButtonHeightConstraint, "setActive:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_clockWiseRotationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_counterClockWiseRotationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton widthAnchor](v11->_clockWiseRotationButton, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 48.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[UIButton heightAnchor](v11->_clockWiseRotationButton, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 48.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    -[UIButton topAnchor](v11->_clockWiseRotationButton, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v11->_zoomButton, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = objc_claimAutoreleasedReturnValue();
    rotationButtonTopConstraint = v11->_rotationButtonTopConstraint;
    v11->_rotationButtonTopConstraint = (NSLayoutConstraint *)v46;

    -[UIButton bottomAnchor](v11->_clockWiseRotationButton, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v11->_zoomButton, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -16.0);
    v50 = objc_claimAutoreleasedReturnValue();
    rotationButtonBottomConstraint = v11->_rotationButtonBottomConstraint;
    v11->_rotationButtonBottomConstraint = (NSLayoutConstraint *)v50;

    -[UIButton leadingAnchor](v11->_clockWiseRotationButton, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v11->_zoomButton, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = objc_claimAutoreleasedReturnValue();
    rotationButtonLeadingConstraint = v11->_rotationButtonLeadingConstraint;
    v11->_rotationButtonLeadingConstraint = (NSLayoutConstraint *)v54;

    -[UIButton trailingAnchor](v11->_clockWiseRotationButton, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v11->_zoomButton, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -16.0);
    v58 = objc_claimAutoreleasedReturnValue();
    rotationButtonTrailingConstraint = v11->_rotationButtonTrailingConstraint;
    v11->_rotationButtonTrailingConstraint = (NSLayoutConstraint *)v58;

    v79 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton centerYAnchor](v11->_counterClockWiseRotationButton, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v11->_clockWiseRotationButton, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v83);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v81;
    -[UIButton centerXAnchor](v11->_counterClockWiseRotationButton, "centerXAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerXAnchor](v11->_clockWiseRotationButton, "centerXAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v61;
    -[UIButton heightAnchor](v11->_counterClockWiseRotationButton, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton heightAnchor](v11->_clockWiseRotationButton, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v93[2] = v64;
    -[UIButton widthAnchor](v11->_counterClockWiseRotationButton, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton heightAnchor](v11->_clockWiseRotationButton, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v93[3] = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "activateConstraints:", v68);

    -[SBDeviceApplicationSceneClassicAccessoryView _setupPositioningAndRotationForInterfaceOrientation:offscreen:](v11, "_setupPositioningAndRotationForInterfaceOrientation:offscreen:", v11->_buttonOrientation, 0);
    -[SBDeviceApplicationSceneClassicAccessoryView _updateButtonVisibilityAnimated:](v11, "_updateButtonVisibilityAnimated:", 0);
    objc_initWeak(&location, v11);
    v69 = (SBSceneHandleBlockObserver *)objc_alloc_init(MEMORY[0x1E0DAC250]);
    sceneHandleObserver = v11->_sceneHandleObserver;
    v11->_sceneHandleObserver = v69;

    objc_msgSend(v84, "addObserver:", v11->_sceneHandleObserver);
    v71 = v11->_sceneHandleObserver;
    v72 = MEMORY[0x1E0C809B0];
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke;
    v89[3] = &unk_1E8EAAAC0;
    objc_copyWeak(&v90, &location);
    v73 = (id)-[SBSceneHandleBlockObserver observeCreate:](v71, "observeCreate:", v89);
    v74 = v11->_sceneHandleObserver;
    v87[0] = v72;
    v87[1] = 3221225472;
    v87[2] = __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_2;
    v87[3] = &unk_1E8EAAAE8;
    objc_copyWeak(&v88, &location);
    v75 = (id)-[SBSceneHandleBlockObserver observeDidUpdateClientSettings:](v74, "observeDidUpdateClientSettings:", v87);
    v76 = v11->_sceneHandleObserver;
    v85[0] = v72;
    v85[1] = 3221225472;
    v85[2] = __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_3;
    v85[3] = &unk_1E8EAAB10;
    objc_copyWeak(&v86, &location);
    v77 = (id)-[SBSceneHandleBlockObserver observeDidUpdateSettings:](v76, "observeDidUpdateSettings:", v85);
    objc_destroyWeak(&v86);
    objc_destroyWeak(&v88);
    objc_destroyWeak(&v90);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v7, "uiClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sb_effectiveInterfaceOrientation");

    objc_msgSend(WeakRetained, "_setupPositioningAndRotationForInterfaceOrientation:offscreen:", v6, 0);
    WeakRetained[58] = v6;
    objc_msgSend(WeakRetained, "_updateButtonVisibilityAnimated:", 1);
    objc_msgSend(WeakRetained, "setNeedsLayout");
  }

}

void __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_sceneHandleDidUpdateClientSettingsWithDiff:transitionContext:", v7, v6);

}

void __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_sceneHandleDidUpdateSettingsWithDiff:previousSettings:", v7, v6);

}

- (void)dealloc
{
  objc_super v3;

  -[SBSceneHandleBlockObserver invalidate](self->_sceneHandleObserver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryView;
  -[SBDeviceApplicationSceneClassicAccessoryView dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  SBSceneHandleBlockObserver *sceneHandleObserver;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;

  -[SBSceneHandleBlockObserver invalidate](self->_sceneHandleObserver, "invalidate");
  sceneHandleObserver = self->_sceneHandleObserver;
  self->_sceneHandleObserver = 0;

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_clientSettingsInspector, "removeAllObservers");
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

}

- (void)layoutSubviews
{
  BSUIOrientationTransformWrapperView *transformWrapperView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryView;
  -[SBDeviceApplicationSceneClassicAccessoryView layoutSubviews](&v4, sel_layoutSubviews);
  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_transformWrapperView, "setContentOrientation:", self->_buttonOrientation);
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_transformWrapperView, "setContainerOrientation:", self->_buttonOrientation);
  transformWrapperView = self->_transformWrapperView;
  -[SBDeviceApplicationSceneClassicAccessoryView bounds](self, "bounds");
  -[BSUIOrientationTransformWrapperView setFrame:](transformWrapperView, "setFrame:");
  -[SBDeviceApplicationSceneClassicAccessoryView _setupPositioningAndRotationForInterfaceOrientation:offscreen:](self, "_setupPositioningAndRotationForInterfaceOrientation:offscreen:", self->_buttonOrientation, 0);
}

- (void)_updateButtonVisibilityAnimated:(BOOL)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke;
  v5[3] = &__block_descriptor_33_e21_v20__0__UIButton_8B16l;
  v6 = a3;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v5, a2);
  ((void (**)(_QWORD, UIButton *, BOOL))v4)[2](v4, self->_zoomButton, -[SBDeviceApplicationSceneClassicAccessoryView _zoomButtonShouldBeVisible](self, "_zoomButtonShouldBeVisible"));
  ((void (**)(_QWORD, UIButton *, BOOL))v4)[2](v4, self->_clockWiseRotationButton, -[SBDeviceApplicationSceneClassicAccessoryView _rotationButtonShouldBeVisible](self, "_rotationButtonShouldBeVisible"));
  ((void (**)(_QWORD, UIButton *, BOOL))v4)[2](v4, self->_counterClockWiseRotationButton, -[SBDeviceApplicationSceneClassicAccessoryView _rotationButtonShouldBeVisible](self, "_rotationButtonShouldBeVisible"));

}

void __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v5 = a2;
  objc_msgSend(v5, "alpha");
  if ((((v6 != 1.0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 1.0;
    else
      v7 = 0.0;
    if (*(_BYTE *)(a1 + 32))
    {
      if (a3)
        v8 = 0.3;
      else
        v8 = 0.1;
      v9 = (void *)MEMORY[0x1E0CEABB0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke_2;
      v10[3] = &unk_1E8E9DE88;
      v11 = v5;
      v12 = v7;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, v8, 0.0);

    }
    else
    {
      objc_msgSend(v5, "setAlpha:", v7);
    }
  }

}

uint64_t __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (BOOL)_isZoomed
{
  void *v2;
  char v3;

  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "classicAppZoomedIn");

  return v3;
}

- (void)_updateZoomButton
{
  _BOOL4 v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v3 = -[SBDeviceApplicationSceneClassicAccessoryView _isZoomed](self, "_isZoomed");
  if (v3)
    v4 = CFSTR("scaleDown");
  else
    v4 = CFSTR("scaleUp");
  if (v3)
    v5 = CFSTR("scaleDownHighlight");
  else
    v5 = CFSTR("scaleUpHighlight");
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](self->_zoomButton, "setImage:forState:", v7, 0);
  -[UIButton setImage:forState:](self->_zoomButton, "setImage:forState:", v6, 1);

}

- (void)_changeZoom:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = -[SBDeviceApplicationSceneClassicAccessoryView _isZoomed](self, "_isZoomed", a3);
  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setClassicAppZoomedIn:", !v4);

  -[SBDeviceApplicationSceneClassicAccessoryView _updateZoomButton](self, "_updateZoomButton");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v4)
      v7 = 1;
    else
      v7 = 2;
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__SBDeviceApplicationSceneClassicAccessoryView__changeZoom___block_invoke;
    v9[3] = &unk_1E8E9DE88;
    v10 = WeakRetained;
    v11 = v7;
    objc_msgSend(v8, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v9, 0, 0.7, 0.0, 1.0, 158.0, 115.0, 0.0);

  }
}

uint64_t __60__SBDeviceApplicationSceneClassicAccessoryView__changeZoom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applicationSceneCompatibilityModeAnimatingChangeTo:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_zoomButtonShouldBeVisible
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  char v13;
  char v14;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isForeground");
  v6 = objc_msgSend(v4, "deactivationReasons") & 0x28;
  v7 = objc_msgSend(v4, "isOccluded");
  -[SBDeviceApplicationSceneHandle _windowScene](self->_sceneHandle, "_windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isChamoisWindowingUIEnabled"))
  {
    -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "classicAppPhoneAppRunningOnPad");

    if (v6)
      v12 = 0;
    else
      v12 = v5;
    if (v12 == 1)
      v13 = (v7 | v11) ^ 1;
    else
      v13 = 0;
  }
  else
  {
    v14 = v7 ^ 1;
    if (v6)
      v14 = 0;
    if (v5)
      v13 = v14;
    else
      v13 = 0;
  }

  return v13;
}

- (void)_updateRotationButton
{
  void *v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  -[SBDeviceApplicationSceneClassicAccessoryView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentInterfaceOrientation");

  if (v4 == 1)
    v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__clockWiseRotationButton;
  else
    v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__counterClockWiseRotationButton;
  v6 = 2 * (v4 == 1);
  if (v4 == 1)
    v7 = 0;
  else
    v7 = 3;
  v20 = *(id *)((char *)&self->super.super.super.isa + *v5);
  v8 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("rotateLeft"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (void *)objc_msgSend(v8, "initWithCGImage:imageOrientation:", objc_msgSend(v9, "CGImage"), v6);

  v11 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("rotateLeftHighlight"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (void *)objc_msgSend(v11, "initWithCGImage:imageOrientation:", objc_msgSend(v12, "CGImage"), v6);

  v14 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("rotateRight"));
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (void *)objc_msgSend(v14, "initWithCGImage:imageOrientation:", objc_msgSend(v15, "CGImage"), v7);

  v17 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("rotateRightHighlight"));
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (void *)objc_msgSend(v17, "initWithCGImage:imageOrientation:", objc_msgSend(v18, "CGImage"), v7);

  -[UIButton setImage:forState:](self->_clockWiseRotationButton, "setImage:forState:", v16, 0);
  -[UIButton setImage:forState:](self->_clockWiseRotationButton, "setImage:forState:", v19, 1);
  -[UIButton setImage:forState:](self->_counterClockWiseRotationButton, "setImage:forState:", v10, 0);
  -[UIButton setImage:forState:](self->_counterClockWiseRotationButton, "setImage:forState:", v13, 1);
  -[UIView bringSubviewToFront:](self->_buttonWrapperView, "bringSubviewToFront:", v20);

}

- (void)_updateRotationButtonConstraints
{
  uint64_t v3;
  int *v4;
  int *v5;
  int *v6;
  int *v7;

  v3 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if ((unint64_t)(v3 - 3) > 1)
      return;
    v4 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTrailingConstraint;
    v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTopConstraint;
    v6 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonLeadingConstraint;
    v7 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonBottomConstraint;
  }
  else
  {
    v4 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonLeadingConstraint;
    v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonBottomConstraint;
    v6 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTrailingConstraint;
    v7 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTopConstraint;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setActive:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "setActive:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setActive:", 1);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "setActive:", 1);
}

- (BOOL)_rotationButtonShouldBeVisible
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v7 = v3
    && (objc_msgSend(v3, "uiClientSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = ~objc_msgSend(v5, "supportedInterfaceOrientations"),
        v5,
        (v6 & 0x1A) == 0)
    && -[SBDeviceApplicationSceneClassicAccessoryView _zoomButtonShouldBeVisible](self, "_zoomButtonShouldBeVisible");

  return v7;
}

- (void)_rotateApplicationScene:(id)a3
{
  SBDeviceApplicationSceneHandle *sceneHandle;
  id v5;
  id v6;

  sceneHandle = self->_sceneHandle;
  v5 = a3;
  -[SBDeviceApplicationSceneHandle _setClassicAppPhoneOnPadPrefersLandscape:](self->_sceneHandle, "_setClassicAppPhoneOnPadPrefersLandscape:", -[SBDeviceApplicationSceneHandle _classicAppPhoneOnPadPrefersLandscape](sceneHandle, "_classicAppPhoneOnPadPrefersLandscape") ^ 1);

  self->_rotatingFromButtonTap = v5 != 0;
  -[SBDeviceApplicationSceneClassicAccessoryView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteApplicationClassicPhoneSceneOrientationPreferenceChangingForUserAction:", self->_rotatingFromButtonTap);

}

- (void)_sceneHandleDidUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  UIApplicationSceneClientSettingsDiffInspector *v9;
  UIApplicationSceneClientSettingsDiffInspector *v10;
  UIApplicationSceneClientSettingsDiffInspector *v11;
  uint64_t v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDeviceApplicationSceneClassicAccessoryView _sceneHandleDidUpdateClientSettingsWithDiff:transitionContext:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBDeviceApplicationSceneClassicAccessoryView.m"), 327, CFSTR("this call must be made on the main thread"));

  }
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    v9 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v10 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v9;

    objc_initWeak(&location, self);
    v11 = self->_clientSettingsInspector;
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18[3] = &unk_1E8EA2658;
    objc_copyWeak(&v19, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeInterfaceOrientationWithBlock:](v11, "observeInterfaceOrientationWithBlock:", v18);
    v13 = self->_clientSettingsInspector;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v16[3] = &unk_1E8EA2658;
    objc_copyWeak(&v17, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeSupportedInterfaceOrientationsWithBlock:](v13, "observeSupportedInterfaceOrientationsWithBlock:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](clientSettingsInspector, "inspectDiff:withContext:", v6, v7);

}

void __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[480])
  {
    v14 = WeakRetained;
    objc_msgSend(WeakRetained, "sceneHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "uiClientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "interfaceOrientation");
    if (v7)
    {
      v8 = v7;
      v9 = v14[58];
      if (v9 != v7)
      {
        v10 = a2;
        objc_msgSend(v10, "animationSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_updateOrientationFrom:toOrientation:animationSettings:", v9, v8, v11);
        objc_msgSend(v14, "setNeedsLayout");
        v12 = (void *)MEMORY[0x1E0CEA918];
        objc_msgSend(v10, "animationFence");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "_synchronizeDrawingWithFence:", v13);
      }
    }

    WeakRetained = v14;
  }

}

void __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateButtonVisibilityAnimated:", 1);
  if ((objc_msgSend(WeakRetained, "_rotationButtonShouldBeVisible") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "sceneHandle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_setClassicAppPhoneOnPadPrefersLandscape:", 0);

  }
}

- (void)_sceneHandleDidUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  id v6;
  id v7;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInspector;
  UIApplicationSceneSettingsDiffInspector *v9;
  UIApplicationSceneSettingsDiffInspector *v10;
  UIApplicationSceneSettingsDiffInspector *v11;
  uint64_t v12;
  UIApplicationSceneSettingsDiffInspector *v13;
  UIApplicationSceneSettingsDiffInspector *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDeviceApplicationSceneClassicAccessoryView _sceneHandleDidUpdateSettingsWithDiff:previousSettings:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBDeviceApplicationSceneClassicAccessoryView.m"), 364, CFSTR("this call must be made on the main thread"));

  }
  sceneSettingsInspector = self->_sceneSettingsInspector;
  if (!sceneSettingsInspector)
  {
    v9 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    v10 = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v9;

    objc_initWeak(&location, self);
    v11 = self->_sceneSettingsInspector;
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke;
    v24[3] = &unk_1E8EA2658;
    objc_copyWeak(&v25, &location);
    -[UIApplicationSceneSettingsDiffInspector observeDeactivationReasonsWithBlock:](v11, "observeDeactivationReasonsWithBlock:", v24);
    v13 = self->_sceneSettingsInspector;
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v22[3] = &unk_1E8EA2658;
    objc_copyWeak(&v23, &location);
    -[UIApplicationSceneSettingsDiffInspector observeIsForegroundWithBlock:](v13, "observeIsForegroundWithBlock:", v22);
    v14 = self->_sceneSettingsInspector;
    v17 = v12;
    v18 = 3221225472;
    v19 = __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_3;
    v20 = &unk_1E8EA2658;
    objc_copyWeak(&v21, &location);
    -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](v14, "observeInterfaceOrientationWithBlock:", &v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    sceneSettingsInspector = self->_sceneSettingsInspector;
  }
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](sceneSettingsInspector, "inspectDiff:withContext:", v6, 0, v17, v18, v19, v20);

}

void __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateButtonVisibilityAnimated:", 1);

}

void __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateButtonVisibilityAnimated:", 1);

}

void __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_3(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained && WeakRetained[480])
  {
    WeakRetained[480] = 0;
    objc_msgSend(WeakRetained, "sceneHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uiSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[58] = objc_msgSend(v6, "interfaceOrientation");

    objc_msgSend(v8, "setNeedsLayout");
    objc_msgSend(v8, "layoutIfNeeded");
    objc_msgSend(a2, "animationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateRotationButtonWithAnimationSettings:", v7);

  }
  else
  {
    objc_msgSend(WeakRetained, "_updateRotationButton");
  }

}

- (void)_updateRotationButtonWithAnimationSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  CGFloat v8;
  int *v9;
  int *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SBDeviceApplicationSceneClassicAccessoryView *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CGAffineTransform v28;
  _QWORD v29[4];
  id v30;
  SBDeviceApplicationSceneClassicAccessoryView *v31;
  CGAffineTransform v32;

  v4 = a3;
  if (!v4)
  {
    +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", 1, 3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[SBDeviceApplicationSceneClassicAccessoryView sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentInterfaceOrientation");

  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v32.c = v7;
  *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v8 = dbl_1D0E89400[v6 == 1];
  if (v6 == 1)
    v9 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__clockWiseRotationButton;
  else
    v9 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__counterClockWiseRotationButton;
  if (v6 == 1)
    v10 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__counterClockWiseRotationButton;
  else
    v10 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__clockWiseRotationButton;
  CGAffineTransformMakeRotation(&v32, v8);
  v11 = *(id *)((char *)&self->super.super.super.isa + *v9);
  v12 = *(id *)((char *)&self->super.super.super.isa + *v10);
  v13 = (void *)MEMORY[0x1E0CEABB0];
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke;
  v29[3] = &unk_1E8E9E820;
  v15 = v11;
  v30 = v15;
  v31 = self;
  objc_msgSend(v13, "performWithoutAnimation:", v29);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:timingFunction:", v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsAdditiveAnimations:", 1);
  v18 = (void *)MEMORY[0x1E0D01908];
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_2;
  v25[3] = &unk_1E8EA4AE0;
  v26 = v15;
  v28 = v32;
  v27 = v12;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_3;
  v21[3] = &unk_1E8E9EEF0;
  v22 = v26;
  v23 = v27;
  v24 = self;
  v19 = v27;
  v20 = v26;
  objc_msgSend(v18, "animateWithFactory:actions:completion:", v17, v25, v21);

}

uint64_t __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "bringSubviewToFront:", *(_QWORD *)(a1 + 32));
}

uint64_t __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "setTransform:", &v7);
  v4 = *(void **)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 80);
  return objc_msgSend(v4, "setTransform:", &v7);
}

uint64_t __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8 = *MEMORY[0x1E0C9BAA8];
  v6 = v8;
  v9 = v7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = v10;
  objc_msgSend(v2, "setTransform:", &v8);
  v3 = *(void **)(a1 + 40);
  v8 = v6;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v3, "setTransform:", &v8);
  return objc_msgSend(*(id *)(a1 + 48), "_updateRotationButton");
}

- (void)_updateOrientationFrom:(int64_t)a3 toOrientation:(int64_t)a4 animationSettings:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BSUIOrientationTransformWrapperView *transformWrapperView;
  _QWORD v14[7];
  _QWORD v15[6];

  v8 = a5;
  objc_msgSend(v8, "duration");
  v10 = v9 * 0.5;
  objc_msgSend(v8, "delay");
  v12 = v11;

  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_transformWrapperView, "setContentOrientation:", a3);
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_transformWrapperView, "setContainerOrientation:", a4);
  transformWrapperView = self->_transformWrapperView;
  -[SBDeviceApplicationSceneClassicAccessoryView bounds](self, "bounds");
  -[BSUIOrientationTransformWrapperView setFrame:](transformWrapperView, "setFrame:");
  -[SBDeviceApplicationSceneClassicAccessoryView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  if (v10 <= 0.0)
  {
    -[SBDeviceApplicationSceneClassicAccessoryView _setupPositioningAndRotationForInterfaceOrientation:offscreen:](self, "_setupPositioningAndRotationForInterfaceOrientation:offscreen:", a4, 0);
    self->_buttonOrientation = a4;
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke;
    v15[3] = &unk_1E8E9DE88;
    v15[4] = self;
    v15[5] = a3;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_2;
    v14[3] = &unk_1E8EAAB80;
    v14[4] = self;
    v14[5] = a4;
    *(double *)&v14[6] = v10;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x10000, v15, v14, v10, v12);
  }
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupPositioningAndRotationForInterfaceOrientation:offscreen:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setContentOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setContainerOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
  v2 = *(double *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_3;
  v6[3] = &unk_1E8E9DE88;
  v3 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_4;
  v5[3] = &unk_1E8EAAB58;
  v5[4] = v7;
  v5[5] = v3;
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x20000, v6, v5, v2, 0.0);
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupPositioningAndRotationForInterfaceOrientation:offscreen:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_4(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)_setupPositioningAndRotationForInterfaceOrientation:(int64_t)a3 offscreen:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;

  v5 = 16.0;
  v6 = -16.0;
  if ((unint64_t)(a3 - 3) >= 2)
    v7 = 16.0;
  else
    v7 = -16.0;
  if ((unint64_t)(a3 - 3) < 2)
    v6 = 16.0;
  if (a4)
    v8 = v7;
  else
    v8 = 16.0;
  if (a4)
    v5 = v6;
  -[NSLayoutConstraint setConstant:](self->_zoomButtonVerticalConstraint, "setConstant:", -v5);
  -[NSLayoutConstraint setConstant:](self->_zoomButtonHorizontalConstraint, "setConstant:", -v8);
  -[SBDeviceApplicationSceneClassicAccessoryView _updateRotationButtonConstraints](self, "_updateRotationButtonConstraints");
}

- (SBDeviceApplicationSceneClassicAccessoryViewDelegate)delegate
{
  return (SBDeviceApplicationSceneClassicAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (int64_t)buttonOrientation
{
  return self->_buttonOrientation;
}

- (void)setButtonOrientation:(int64_t)a3
{
  self->_buttonOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_rotationButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_rotationButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_rotationButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_sceneHandleObserver, 0);
  objc_storeStrong((id *)&self->_transformWrapperView, 0);
  objc_storeStrong((id *)&self->_counterClockWiseRotationButton, 0);
  objc_storeStrong((id *)&self->_clockWiseRotationButton, 0);
  objc_storeStrong((id *)&self->_zoomButton, 0);
  objc_storeStrong((id *)&self->_buttonWrapperView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end
