@implementation SBSubstituteSystemApertureViewController

- (SBSubstituteSystemApertureViewController)initWithSensorRegionFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SBSubstituteSystemApertureViewController *v7;
  SBSubstituteSystemApertureViewController *v8;
  SBSystemApertureKeyLineColorValidator *v9;
  SBSystemApertureKeyLineColorValidator *keyLineColorValidator;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)SBSubstituteSystemApertureViewController;
  v7 = -[SBSubstituteSystemApertureViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_sensorRegionFrame.origin.x = x;
    v7->_sensorRegionFrame.origin.y = y;
    v7->_sensorRegionFrame.size.width = width;
    v7->_sensorRegionFrame.size.height = height;
    v9 = objc_alloc_init(SBSystemApertureKeyLineColorValidator);
    keyLineColorValidator = v8->_keyLineColorValidator;
    v8->_keyLineColorValidator = v9;

  }
  return v8;
}

- (void)setSensorRegionFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_sensorRegionFrame;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_sensorRegionFrame = &self->_sensorRegionFrame;
  if (!CGRectEqualToRect(self->_sensorRegionFrame, a3))
  {
    p_sensorRegionFrame->origin.x = x;
    p_sensorRegionFrame->origin.y = y;
    p_sensorRegionFrame->size.width = width;
    p_sensorRegionFrame->size.height = height;
    -[SBSubstituteSystemApertureViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
}

- (void)setActiveWindowScene:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "associatedWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ambientPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    objc_storeWeak((id *)&self->_activeWindowScene, obj);
    objc_msgSend(obj, "associatedWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ambientPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", self);

    -[SBSubstituteSystemApertureViewController _ensureStatusBarAvoidanceFrame](self, "_ensureStatusBarAvoidanceFrame");
    -[SBSubstituteSystemApertureViewController _updateLockViewHidden](self, "_updateLockViewHidden");
    -[SBSubstituteSystemApertureViewController _postLayoutDidChangeNotificationIfNecessary](self, "_postLayoutDidChangeNotificationIfNecessary");
  }

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
  UIView *containerSubBackgroundParent;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *containerBackgroundParent;
  void *v18;
  UIView *v19;
  UIView *containerParent;
  void *v21;
  id v22;
  SBUIProudLockIconView *v23;
  SBUIProudLockIconView *lockView;
  SBUIProudLockIconView *v25;
  double v26;
  double v27;
  double v28;
  SBSystemApertureContainerView *v29;
  id v30;
  SBSystemApertureContainerView *v31;
  SBSystemApertureContainerView *substituteLockElementContainer;
  SBSystemApertureContainerView *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SBSubstituteSystemApertureViewController;
  -[SBSubstituteSystemApertureViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[SBSubstituteSystemApertureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
  containerSubBackgroundParent = self->_containerSubBackgroundParent;
  self->_containerSubBackgroundParent = v12;

  -[UIView setUserInteractionEnabled:](self->_containerSubBackgroundParent, "setUserInteractionEnabled:", 0);
  -[UIView layer](self->_containerSubBackgroundParent, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisableUpdateMask:", 32);

  -[SBSubstituteSystemApertureViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_containerSubBackgroundParent);

  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
  containerBackgroundParent = self->_containerBackgroundParent;
  self->_containerBackgroundParent = v16;

  -[UIView setUserInteractionEnabled:](self->_containerBackgroundParent, "setUserInteractionEnabled:", 0);
  -[SBSubstituteSystemApertureViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_containerBackgroundParent);

  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v5, v7, v9, v11);
  containerParent = self->_containerParent;
  self->_containerParent = v19;

  -[SBSubstituteSystemApertureViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_containerParent);

  v22 = objc_alloc(MEMORY[0x1E0DAC650]);
  v23 = (SBUIProudLockIconView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  lockView = self->_lockView;
  self->_lockView = v23;

  -[SBUIProudLockIconView setState:animated:](self->_lockView, "setState:animated:", 1, 0);
  -[SBUIProudLockIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_lockView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = self->_lockView;
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
  v27 = v26 / 1.13;
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
  -[SBUIProudLockIconView setOverrideSize:offset:extent:](v25, "setOverrideSize:offset:extent:", v27, v28 / 1.13, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 12.0);
  v29 = [SBSystemApertureContainerView alloc];
  v30 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v31 = -[SBSystemApertureContainerView initWithInterfaceElementIdentifier:](v29, "initWithInterfaceElementIdentifier:", v30);
  substituteLockElementContainer = self->_substituteLockElementContainer;
  self->_substituteLockElementContainer = v31;

  -[SBSystemApertureContainerView setDelegate:](self->_substituteLockElementContainer, "setDelegate:", self);
  v33 = self->_substituteLockElementContainer;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureContainerView setKeyLineTintColor:](v33, "setKeyLineTintColor:", v34);

  -[SBSystemApertureContainerView setKeyLineMode:](self->_substituteLockElementContainer, "setKeyLineMode:", 1);
  -[UIView addSubview:](self->_containerParent, "addSubview:", self->_substituteLockElementContainer);
  -[SBSystemApertureContainerView addContentSubview:](self->_substituteLockElementContainer, "addContentSubview:", self->_lockView);
  -[SBSubstituteSystemApertureViewController _updateLockViewHidden](self, "_updateLockViewHidden");
}

- (void)viewDidLayoutSubviews
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  SBUIProudLockIconView *lockView;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)SBSubstituteSystemApertureViewController;
  -[SBSubstituteSystemApertureViewController viewDidLayoutSubviews](&v21, sel_viewDidLayoutSubviews);
  -[SBSubstituteSystemApertureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_containerBackgroundParent, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_containerParent, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_containerSubBackgroundParent, "setFrame:", v5, v7, v9, v11);
  -[SBSubstituteSystemApertureViewController _substituteLockElementContainerFrame](self, "_substituteLockElementContainerFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SBSystemApertureContainerView setFrame:](self->_substituteLockElementContainer, "setFrame:");
  lockView = self->_lockView;
  -[SBSubstituteSystemApertureViewController _lockFrame](self, "_lockFrame");
  -[SBUIProudLockIconView setFrame:](lockView, "setFrame:");
  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  -[SBSystemApertureContainerView setIDCornerRadius:](self->_substituteLockElementContainer, "setIDCornerRadius:", CGRectGetHeight(v22) * 0.5);
  -[SBSubstituteSystemApertureViewController _postLayoutDidChangeNotificationIfNecessary](self, "_postLayoutDidChangeNotificationIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSubstituteSystemApertureViewController;
  -[SBSubstituteSystemApertureViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBSubstituteSystemApertureViewController _ensureStatusBarAvoidanceFrame](self, "_ensureStatusBarAvoidanceFrame");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)parentViewForSubBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerSubBackgroundParent;
}

- (id)parentViewForBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerBackgroundParent;
}

- (void)systemApertureContainerView:(id)a3 sampledLuminanceLevelChangedTo:(int64_t)a4
{
  self->_lastSampledLumaLevel = a4;
  -[SBSubstituteSystemApertureViewController _updateKeylineMode](self, "_updateKeylineMode", a3);
}

- (CGRect)systemApertureContainerView:(id)a3 hitRectForBounds:(CGRect)a4 debugColor:(id *)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a3, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)keyLineColorValidatorForSystemApertureContainerView:(id)a3
{
  return self->_keyLineColorValidator;
}

- (double)_lockPadding
{
  double Height;
  double v3;

  Height = CGRectGetHeight(self->_sensorRegionFrame);
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
  return (Height + v3 / -1.13) * 0.5 + 1.33333333;
}

- (CGRect)_substituteLockElementContainerFrame
{
  double x;
  CGFloat y;
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect *p_sensorRegionFrame;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden"))
  {
    x = self->_sensorRegionFrame.origin.x;
    y = self->_sensorRegionFrame.origin.y;
    width = self->_sensorRegionFrame.size.width;
    height = self->_sensorRegionFrame.size.height;
  }
  else
  {
    -[SBSubstituteSystemApertureViewController _lockPadding](self, "_lockPadding");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
    v10 = v8 + v9 / 1.13;
    v11 = v8 + 6.0;
    p_sensorRegionFrame = &self->_sensorRegionFrame;
    x = CGRectGetMinX(*p_sensorRegionFrame) - v10;
    y = CGRectGetMinY(*p_sensorRegionFrame);
    width = v11 + v10 + CGRectGetWidth(*p_sensorRegionFrame);
    height = CGRectGetHeight(*p_sensorRegionFrame);
  }
  v13 = x;
  v14 = y;
  v15 = width;
  result.size.height = height;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_lockFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double Height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  if (-[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[SBSubstituteSystemApertureViewController _lockPadding](self, "_lockPadding");
    v3 = v7;
    Height = CGRectGetHeight(self->_sensorRegionFrame);
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
    v4 = (Height - v9 / 1.13) * 0.5;
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
    v6 = v10 / 1.13;
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
    v5 = v11 / 1.13;
  }
  v12 = v3;
  v13 = v4;
  v14 = v6;
  result.size.height = v5;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_isLockHidden
{
  return -[SBSubstituteSystemApertureViewController _isOnContinuityDisplay](self, "_isOnContinuityDisplay")
      || -[SBSubstituteSystemApertureViewController _isStandbyPresented](self, "_isStandbyPresented");
}

- (BOOL)_isStandbyPresented
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresented");

  return v5;
}

- (void)_updateLockViewHidden
{
  int v3;
  id v4;

  v3 = -[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden");
  if (v3 != -[SBUIProudLockIconView isHidden](self->_lockView, "isHidden"))
  {
    -[SBUIProudLockIconView setHidden:](self->_lockView, "setHidden:", -[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden"));
    -[SBSubstituteSystemApertureViewController _updateKeylineMode](self, "_updateKeylineMode");
    -[SBSubstituteSystemApertureViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)_updateKeylineMode
{
  uint64_t v3;
  unint64_t lastSampledLumaLevel;

  if (-[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden"))
  {
    v3 = 0;
  }
  else
  {
    lastSampledLumaLevel = self->_lastSampledLumaLevel;
    if (lastSampledLumaLevel > 2)
      return;
    v3 = qword_1D0E89258[lastSampledLumaLevel];
  }
  -[SBSystemApertureContainerView setKeyLineMode:](self->_substituteLockElementContainer, "setKeyLineMode:", v3);
}

- (BOOL)_isOnContinuityDisplay
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuityDisplayWindowScene");

  return v4;
}

- (id)_statusBarManager
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)_ensureStatusBarAvoidanceFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  -[SBSubstituteSystemApertureViewController _statusBarManager](self, "_statusBarManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSubstituteSystemApertureViewController _substituteLockElementContainerFrame](self, "_substituteLockElementContainerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v11, "BSAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAvoidanceFrame:reason:statusBar:animationSettings:options:", CFSTR("SBSubstituteSystemApertureViewController"), 0, v12, 2, v4, v6, v8, v10);

}

- (UIEdgeInsets)_currentEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat rect;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  UIEdgeInsets result;

  if (-[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden"))
  {
    v3 = *MEMORY[0x1E0CEB4B0];
    v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    x = self->_sensorRegionFrame.origin.x;
    y = self->_sensorRegionFrame.origin.y;
    width = self->_sensorRegionFrame.size.width;
    height = self->_sensorRegionFrame.size.height;
    -[SBSubstituteSystemApertureViewController _substituteLockElementContainerFrame](self, "_substituteLockElementContainerFrame");
    v12 = v11;
    v14 = v13;
    v26 = v15;
    rect = v13;
    v17 = v16;
    v23 = v16;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MinY = CGRectGetMinY(v28);
    v29.origin.x = v12;
    v29.origin.y = v14;
    v29.size.width = v26;
    v29.size.height = v17;
    v25 = MinY - CGRectGetMinY(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MinX = CGRectGetMinX(v30);
    v31.origin.x = v12;
    v31.origin.y = rect;
    v31.size.width = v26;
    v31.size.height = v23;
    v24 = MinX - CGRectGetMinX(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MaxY = CGRectGetMaxY(v32);
    v33.origin.x = v12;
    v33.origin.y = rect;
    v33.size.width = v26;
    v33.size.height = v23;
    v6 = MaxY - CGRectGetMaxY(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v12;
    v35.origin.y = rect;
    v35.size.width = v26;
    v35.size.height = v23;
    v5 = MaxX - CGRectGetMaxX(v35);
    v4 = v24;
    v3 = v25;
  }
  v22 = v6;
  result.right = v5;
  result.bottom = v22;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_postLayoutDidChangeNotificationIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  NSDictionary *v26;
  NSDictionary *cachedLayoutDidChangeUserInfo;
  void *v28;
  _QWORD v29[4];
  void *v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  -[SBSubstituteSystemApertureViewController _substituteLockElementContainerFrame](self, "_substituteLockElementContainerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SBSubstituteSystemApertureViewController _isLockHidden](self, "_isLockHidden");
  v12 = &unk_1E91CE638;
  if (v11)
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0C99E08];
  v31[0] = CFSTR("SBSystemApertureEdgeInsets");
  v15 = (void *)MEMORY[0x1E0CB3B18];
  -[SBSubstituteSystemApertureViewController _currentEdgeInsets](self, "_currentEdgeInsets");
  objc_msgSend(v15, "valueWithUIEdgeInsets:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v31[1] = CFSTR("SBSystemApertureFrames");
  v29[0] = v4;
  v29[1] = v6;
  v29[2] = v8;
  v29[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v29, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v18;
  v32[2] = v13;
  v31[2] = CFSTR("SBSystemApertureVisibleElementIdentifiers");
  v31[3] = CFSTR("SBSystemApertureCanRegisterRecordingIndicator");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_sbDisplayConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("SBSystemApertureOriginatingDisplayIdentity"));
  if ((BSEqualObjects() & 1) == 0)
  {
    v26 = (NSDictionary *)objc_msgSend(v21, "copy");
    cachedLayoutDidChangeUserInfo = self->_cachedLayoutDidChangeUserInfo;
    self->_cachedLayoutDidChangeUserInfo = v26;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureLayoutDidChangeNotification"), self, self->_cachedLayoutDidChangeUserInfo);

  }
}

- (CGRect)sensorRegionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sensorRegionFrame.origin.x;
  y = self->_sensorRegionFrame.origin.y;
  width = self->_sensorRegionFrame.size.width;
  height = self->_sensorRegionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SBSystemApertureWindowScene)activeWindowScene
{
  return (SBSystemApertureWindowScene *)objc_loadWeakRetained((id *)&self->_activeWindowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeWindowScene);
  objc_storeStrong((id *)&self->_cachedLayoutDidChangeUserInfo, 0);
  objc_storeStrong((id *)&self->_keyLineColorValidator, 0);
  objc_storeStrong((id *)&self->_substituteLockElementContainer, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_containerSubBackgroundParent, 0);
  objc_storeStrong((id *)&self->_containerParent, 0);
  objc_storeStrong((id *)&self->_containerBackgroundParent, 0);
}

@end
