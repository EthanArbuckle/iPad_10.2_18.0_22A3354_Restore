@implementation SBLockElementViewProvider

- (SBLockElementViewProvider)init
{
  id v4;
  SBLockElementViewProvider *v5;
  uint64_t v6;
  SBUIBiometricResource *sharedResource;
  id v8;
  void *v9;
  uint64_t v10;
  SBUISystemApertureCustomContentProvider *lockProvider;
  UIView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIView *trailingView;
  UIView *v27;
  id v28;
  uint64_t v29;
  UIView *trailingContainerView;
  UIView *v31;
  void *v32;
  uint64_t v33;
  SBUISystemApertureCustomContentProvider *trailingPackageProvider;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id *p_contentProvider;
  id v49;
  objc_super v50;
  _QWORD v51[8];

  v51[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  v50.receiver = self;
  v50.super_class = (Class)SBLockElementViewProvider;
  v5 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:](&v50, sel_initWithIdentifier_contentProvider_, self, v4);
  if (v5)
  {
    if ((objc_msgSend((id)objc_opt_class(), "deviceSupportsElement") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("SBLockElementViewProvider.m"), 85, CFSTR("It's probably not beneficial to use this when unsupported."));

    }
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    sharedResource = v5->_sharedResource;
    v5->_sharedResource = (SBUIBiometricResource *)v6;

    -[SBUIBiometricResource addObserver:](v5->_sharedResource, "addObserver:", v5);
    v5->_allowsBioUnlock = -[SBLockElementViewProvider _activelyWantsMatching](v5, "_activelyWantsMatching");
    -[SBLockElementViewProvider _setUnlockMode:](v5, "_setUnlockMode:", 1);
    p_contentProvider = (id *)&v5->_contentProvider;
    objc_storeStrong((id *)&v5->_contentProvider, v4);
    v8 = objc_alloc(MEMORY[0x1E0DAC6B0]);
    -[SBLockElementViewProvider leadingLock](v5, "leadingLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithView:", v9);
    lockProvider = v5->_lockProvider;
    v5->_lockProvider = (SBUISystemApertureCustomContentProvider *)v10;

    v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithSize:", 37.0, 37.0);
    -[SBLockElementViewProvider trailingPackageView](v5, "trailingPackageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v12, "addSubview:", v13);
    -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 0);
    -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 0);
    v40 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v13, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v12, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v44;
    objc_msgSend(v13, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v12, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v41;
    v47 = v13;
    objc_msgSend(v13, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v14;
    -[UIView centerXAnchor](v12, "centerXAnchor");
    v15 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v15;
    v16 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v17 = 6.0;
    if (v16 == 1)
      v17 = -6.0;
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, v17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v37;
    objc_msgSend(v13, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v12, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v20;
    -[UIView widthAnchor](v12, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 37.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v22;
    -[UIView heightAnchor](v12, "heightAnchor");
    v49 = v4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 37.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v25);

    trailingView = v5->_trailingView;
    v5->_trailingView = v12;
    v27 = v12;

    v28 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[UIView size](v5->_trailingView, "size");
    v29 = objc_msgSend(v28, "initWithSize:");
    trailingContainerView = v5->_trailingContainerView;
    v5->_trailingContainerView = (UIView *)v29;

    -[UIView addSubview:](v5->_trailingContainerView, "addSubview:", v5->_trailingView);
    v31 = v5->_trailingContainerView;
    -[SBLockElementViewProvider prominentLock](v5, "prominentLock");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v31, "addSubview:", v32);

    v4 = v49;
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v5->_trailingContainerView);
    trailingPackageProvider = v5->_trailingPackageProvider;
    v5->_trailingPackageProvider = (SBUISystemApertureCustomContentProvider *)v33;

    objc_msgSend(*p_contentProvider, "setLeadingContentViewProvider:", v5->_lockProvider);
    objc_msgSend(*p_contentProvider, "setTrailingContentViewProvider:", v5->_trailingPackageProvider);

    -[SBLockElementViewProvider _updateContentProvidersForViewProviderMode](v5, "_updateContentProvidersForViewProviderMode");
  }

  return v5;
}

+ (BOOL)deviceSupportsElement
{
  if (deviceSupportsElement_onceToken != -1)
    dispatch_once(&deviceSupportsElement_onceToken, &__block_literal_global_23);
  return deviceSupportsElement_isJindo;
}

uint64_t __50__SBLockElementViewProvider_deviceSupportsElement__block_invoke()
{
  char v0;
  uint64_t result;

  v0 = 1;
  result = SBFEffectiveArtworkSubtype();
  if (result > 2795)
  {
    if (result != 2796 && result != 2868)
      goto LABEL_7;
  }
  else if (result != 2556 && result != 2622)
  {
LABEL_7:
    v0 = 0;
  }
  deviceSupportsElement_isJindo = v0;
  return result;
}

- (void)shake
{
  id v3;

  -[SBLockElementViewProvider elementHost](self, "elementHost");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementRequestsNegativeResponse:", self);

}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double v5;
  CGFloat top;
  double bottom;
  double trailing;
  double leading;
  unint64_t v12;
  uint64_t v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  NSDirectionalEdgeInsets result;

  if (self->_isEmpty)
  {
    top = *MEMORY[0x1E0CEA080];
    v5 = *(double *)(MEMORY[0x1E0CEA080] + 8);
    bottom = *(double *)(MEMORY[0x1E0CEA080] + 16);
    trailing = *(double *)(MEMORY[0x1E0CEA080] + 24);
  }
  else
  {
    trailing = a4.trailing;
    bottom = a4.bottom;
    leading = a4.leading;
    top = a4.top;
    v12 = -[SBLockElementViewProvider _unlockMode](self, "_unlockMode", a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
    if (a3 == 3 || (v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v15 = -[SBLockElementViewProvider _treatsAsAmbientSearching](self, "_treatsAsAmbientSearching");
      if (v15)
        bottom = -118.0;
      else
        bottom = -14.0;
      if (v15)
        trailing = -14.0;
      else
        trailing = -40.0;
      top = -1.0;
      v5 = trailing;
    }
    else
    {
      if (self->_isAuthenticated)
      {
        v13 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        v14 = 0.666666;
        if (v13 == 1)
          v14 = 2.0;
      }
      else
      {
        v14 = 0.0;
      }
      v5 = leading - v14;
    }
  }
  v16 = top;
  v17 = bottom;
  v18 = trailing;
  result.trailing = v18;
  result.bottom = v17;
  result.leading = v5;
  result.top = v16;
  return result;
}

- (void)setAuthenticated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;

  if (self->_isAuthenticated == a3)
    return;
  v3 = a3;
  self->_isAuthenticated = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 1;
  -[SBLockElementViewProvider handleBiometricEvent:](self, "handleBiometricEvent:", v5);
  if (!self->_isInBloomMode)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

    if (v3)
      goto LABEL_7;
LABEL_13:
    -[SBLockElementViewProvider _setAcquiring:](self, "_setAcquiring:", 0);
    -[SBLockElementViewProvider _updateTrailingPackageVisibility](self, "_updateTrailingPackageVisibility");
    return;
  }
  if (!v3)
    goto LABEL_13;
LABEL_7:
  if (self->_hasActiveUnlockAttempt)
    v6 = 6;
  else
    v6 = 0;
  -[SBLockElementViewProvider handleBiometricEvent:](self, "handleBiometricEvent:", v6);
  self->_hasActiveUnlockAttempt = 0;
}

- (void)_updateLockLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBUIProudLockIconView *prominentLock;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[SBLockElementViewProvider _elementFrameLeading:forLayoutMode:](self, "_elementFrameLeading:forLayoutMode:", 1, -[SBLockElementViewProvider layoutMode](self, "layoutMode"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SBLockElementViewProvider layoutMode](self, "layoutMode") == 3)
  {
    if (-[SBLockElementViewProvider _treatsAsAmbientSearching](self, "_treatsAsAmbientSearching"))
    {
      prominentLock = self->_prominentLock;
      v12 = *MEMORY[0x1E0C9D538];
      v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v14 = 67.0;
      v15 = 67.0;
      v16 = 67.0;
    }
    else
    {
      -[SBUIProudLockIconView setFrame:](self->_leadingLock, "setFrame:", v4, v6, v8, v10);
      prominentLock = self->_leadingLock;
      v12 = 0.0;
      v13 = 0.0;
      v14 = v8;
      v15 = v10;
      v16 = v10;
    }
  }
  else
  {
    -[SBUIProudLockIconView setFrame:](self->_leadingLock, "setFrame:", v4, v6, v8, v10);
    prominentLock = self->_leadingLock;
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v16 = 12.0;
    v14 = v8;
    v15 = v10;
  }
  -[SBUIProudLockIconView setOverrideSize:offset:extent:](prominentLock, "setOverrideSize:offset:extent:", v14, v15, v12, v13, v16);
}

- (void)_updateAllowsBioUnlock
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[SBLockElementViewProvider _activelyWantsMatching](self, "_activelyWantsMatching");
  if (self->_allowsBioUnlock == v3)
  {
    if (self->_allowsBioUnlock && !self->_isAuthenticated)
      -[SBLockElementViewProvider handleBiometricEvent:](self, "handleBiometricEvent:", 15);
  }
  else
  {
    self->_allowsBioUnlock = v3;
    if (v3)
      v4 = 15;
    else
      v4 = 0;
    -[SBLockElementViewProvider handleBiometricEvent:](self, "handleBiometricEvent:", v4);
    if (!self->_allowsBioUnlock)
      -[SBLockElementViewProvider _updateTrailingPackageVisibility](self, "_updateTrailingPackageVisibility");
  }
}

- (void)setEmpty:(BOOL)a3
{
  id WeakRetained;

  if (self->_isEmpty != a3)
  {
    self->_isEmpty = a3;
    -[SBLockElementViewProvider _updateLeadingPackageVisibility](self, "_updateLeadingPackageVisibility");
    -[SBLockElementViewProvider _updateTrailingPackageVisibility](self, "_updateTrailingPackageVisibility");
    -[SBLockElementViewProvider _updateLargePackageVisibility](self, "_updateLargePackageVisibility");
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)setBloomed:(BOOL)a3
{
  if (self->_isInBloomMode != a3)
  {
    self->_isInBloomMode = a3;
    -[SBLockElementViewProvider _updateUnlockModeForState](self, "_updateUnlockModeForState");
  }
}

- (void)_updateContentProvidersForViewProviderMode
{
  _BOOL8 v3;
  UIView *v4;
  UIView *trailingContainerView;
  double v6;
  double v7;
  void *v8;
  UIView *v9;

  v3 = -[SBLockElementViewProvider _treatAsAmbient](self, "_treatAsAmbient");
  if (v3)
  {
    -[SBLockElementViewProvider prominentLock](self, "prominentLock");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_trailingView;
  }
  trailingContainerView = self->_trailingContainerView;
  v9 = v4;
  -[UIView frame](v4, "frame");
  -[UIView setSize:](trailingContainerView, "setSize:", v6, v7);
  -[SBLockElementViewProvider prominentLock](self, "prominentLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v3 ^ 1);

  -[UIView setHidden:](self->_trailingView, "setHidden:", v3);
}

- (BOOL)_treatsAsAmbientSearching
{
  _BOOL4 v3;

  v3 = -[SBLockElementViewProvider _treatAsAmbient](self, "_treatAsAmbient");
  if (v3)
    LOBYTE(v3) = self->_layoutMode == 3;
  return v3;
}

- (void)_updateProminentLockIfNecessaryWithState:(int64_t)a3
{
  if (-[SBLockElementViewProvider _treatAsAmbient](self, "_treatAsAmbient"))
    -[SBUIProudLockIconView setState:](self->_prominentLock, "setState:", a3);
}

- (int64_t)systemApertureCustomLayout
{
  return -[SBLockElementViewProvider _treatsAsAmbientSearching](self, "_treatsAsAmbientSearching");
}

- (void)handleBiometricEvent:(int64_t)a3
{
  SBLockElementViewProvider *v3;

  v3 = self;
  switch(a3)
  {
    case 0:
    case 6:
      goto LABEL_8;
    case 1:
    case 2:
      -[SBUIProudLockIconView setState:](self->_leadingLock, "setState:");
      return;
    case 5:
      -[SBLockElementViewProvider _setAcquiring:](self, "_setAcquiring:", 1);
      self = v3;
      a3 = 5;
      goto LABEL_8;
    case 7:
      -[SBLockElementViewProvider _setAcquiring:](self, "_setAcquiring:", 0);
      -[SBLockElementViewProvider _updateProminentLockIfNecessaryWithState:](v3, "_updateProminentLockIfNecessaryWithState:", 7);
      if (v3->_isInBloomMode)
        -[SBLockElementViewProvider shake](v3, "shake");
      return;
    case 15:
      -[SBLockElementViewProvider _setAcquiring:](self, "_setAcquiring:", 0);
      self = v3;
      a3 = 15;
LABEL_8:
      -[SBLockElementViewProvider _updateProminentLockIfNecessaryWithState:](self, "_updateProminentLockIfNecessaryWithState:", a3);
      break;
    default:
      return;
  }
}

- (void)_updateLeadingPackageVisibility
{
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;

  v3 = !-[SBLockElementViewProvider _treatAsAmbient](self, "_treatAsAmbient")
    && self->_priorLayoutMode == 3
    && self->_layoutMode == -1;
  v4 = -[SBLockElementViewProvider _treatsAsAmbientSearching](self, "_treatsAsAmbientSearching");
  v5 = self->_isEmpty || v4;
  -[SBUIProudLockIconView setHidden:](self->_leadingLock, "setHidden:", v5 | v3);
}

- (void)_updateTrailingPackageVisibility
{
  BSUICAPackageView *trailingPackageView;
  _BOOL8 v4;

  trailingPackageView = self->_trailingPackageView;
  v4 = -[SBLockElementViewProvider _treatAsAmbient](self, "_treatAsAmbient")
    || !-[SBLockElementViewProvider _allowsBiometricUnlock](self, "_allowsBiometricUnlock")
    || self->_isEmpty;
  -[BSUICAPackageView setHidden:](trailingPackageView, "setHidden:", v4);
}

- (void)_updateLargePackageVisibility
{
  uint64_t v3;

  if (self->_isEmpty || !-[SBLockElementViewProvider _treatsAsAmbientSearching](self, "_treatsAsAmbientSearching"))
  {
    if ((-[SBUIProudLockIconView isHidden](self->_prominentLock, "isHidden") & 1) == 0)
      -[SBUIProudLockIconView setState:](self->_prominentLock, "setState:", 0);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  -[SBUIProudLockIconView setHidden:](self->_prominentLock, "setHidden:", v3);
}

- (void)_setAcquiring:(BOOL)a3
{
  if (self->_isAcquiring != a3)
  {
    self->_isAcquiring = a3;
    -[SBLockElementViewProvider _updateUnlockModeForState](self, "_updateUnlockModeForState");
  }
}

- (void)_updateUnlockModeForState
{
  uint64_t v3;

  if (self->_isInBloomMode && -[SBLockElementViewProvider _activelyWantsMatching](self, "_activelyWantsMatching"))
  {
    if (self->_isAcquiring)
      v3 = 2;
    else
      v3 = 3;
  }
  else
  {
    v3 = 1;
  }
  -[SBLockElementViewProvider _setUnlockMode:](self, "_setUnlockMode:", v3);
}

- (id)elementIdentifier
{
  return (id)*MEMORY[0x1E0DAC968];
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)_elementFrameLeading:(BOOL)a3 forLayoutMode:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if ((unint64_t)(a4 - 1) < 0xFFFFFFFFFFFFFFFELL || a3)
  {
    if (a4 == 3)
    {
      v7 = 23.0;
      v5 = 0.0;
      v6 = 17.3333333;
      v4 = -27.0;
      if (a3)
        v4 = 0.0;
      else
        v6 = 27.0;
      if (!a3)
        v7 = 27.0;
    }
    else
    {
      v7 = 15.0;
      v4 = 0.0;
      v6 = 11.333333;
      v5 = 0.0;
    }
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)leadingLock
{
  SBUIProudLockIconView *leadingLock;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SBUIProudLockIconView *v13;

  leadingLock = self->_leadingLock;
  if (!leadingLock)
  {
    -[SBLockElementViewProvider _elementFrameLeading:forLayoutMode:](self, "_elementFrameLeading:forLayoutMode:", 1, 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC650]), "initWithFrame:", v4, v5, v6, v7);
    v9 = v8;
    if (self->_isAuthenticated)
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v8, "setState:animated:", v10, 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SWIPE_UP_TO_UNLOCK"), &stru_1E8EC7EC0, CFSTR("CoverSheetCommon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v12);

    v13 = self->_leadingLock;
    self->_leadingLock = (SBUIProudLockIconView *)v9;

    leadingLock = self->_leadingLock;
  }
  return leadingLock;
}

- (id)prominentLock
{
  SBUIProudLockIconView *prominentLock;
  void *v4;
  void *v5;
  void *v6;
  SBUIProudLockIconView *v7;

  prominentLock = self->_prominentLock;
  if (!prominentLock)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC650]), "initWithFrame:", 0.0, 0.0, 67.0, 67.0);
    objc_msgSend(v4, "setOverrideGlyphStyle:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.192156863, 0.819607843, 0.345098039, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithContentColor:", v5);
    objc_msgSend(v4, "setLegibilitySettings:", v6);

    v7 = self->_prominentLock;
    self->_prominentLock = (SBUIProudLockIconView *)v4;

    prominentLock = self->_prominentLock;
  }
  return prominentLock;
}

- (id)trailingPackageView
{
  BSUICAPackageView *trailingPackageView;
  id v4;
  void *v5;
  BSUICAPackageView *v6;
  BSUICAPackageView *v7;

  trailingPackageView = self->_trailingPackageView;
  if (!trailingPackageView)
  {
    v4 = objc_alloc(MEMORY[0x1E0D01910]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (BSUICAPackageView *)objc_msgSend(v4, "initWithPackageName:inBundle:", CFSTR("Round-D73"), v5);

    -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = self->_trailingPackageView;
    self->_trailingPackageView = v6;

    trailingPackageView = self->_trailingPackageView;
  }
  return trailingPackageView;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode;

  layoutMode = self->_layoutMode;
  if (layoutMode != a3)
    self->_priorLayoutMode = layoutMode;
  self->_layoutMode = a3;
  -[SBLockElementViewProvider _updateLeadingPackageVisibility](self, "_updateLeadingPackageVisibility");
  -[SBLockElementViewProvider _updateTrailingPackageVisibility](self, "_updateTrailingPackageVisibility");
  -[SBLockElementViewProvider _updateLargePackageVisibility](self, "_updateLargePackageVisibility");
  -[SBLockElementViewProvider _updateContentProvidersForViewProviderMode](self, "_updateContentProvidersForViewProviderMode");
}

- (int64_t)minimumSupportedLayoutMode
{
  unint64_t v3;
  int64_t v4;

  if (self->_isEmpty)
    return 1;
  v3 = -[SBLockElementViewProvider _unlockMode](self, "_unlockMode");
  v4 = 3;
  if (v3 == 1)
    v4 = 1;
  if (v3)
    return v4;
  else
    return -1;
}

- (int64_t)maximumSupportedLayoutMode
{
  unint64_t v3;
  int64_t v4;

  if (self->_isEmpty)
    return 1;
  v3 = -[SBLockElementViewProvider _unlockMode](self, "_unlockMode");
  v4 = 3;
  if (v3 == 1)
    v4 = 1;
  if (v3)
    return v4;
  else
    return -1;
}

- (int64_t)preferredLayoutMode
{
  unint64_t v3;
  int64_t v4;

  if (self->_isEmpty)
    return 1;
  v3 = -[SBLockElementViewProvider _unlockMode](self, "_unlockMode");
  v4 = 3;
  if (v3 == 1)
    v4 = 1;
  if (v3)
    return v4;
  else
    return -1;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  CGFloat height;
  SBUIProudLockIconView *v8;
  SBUIProudLockIconView *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  v8 = (SBUIProudLockIconView *)a4;
  v9 = v8;
  if ((unint64_t)(a5 + 1) >= 2)
  {
    if (a5 == 3)
    {
      if ((SBUIProudLockIconView *)self->_trailingPackageView == v8)
      {
        *(double *)&v10 = 37.0;
        height = 37.0;
      }
      else
      {
        height = 23.0;
        *(double *)&v10 = 17.3333333;
        if (self->_leadingLock != v8 && self->_prominentLock != v8)
        {
          v10 = *(uint64_t *)MEMORY[0x1E0C9D820];
          height = *(double *)(MEMORY[0x1E0C9D820] + 8);
        }
      }
    }
    else
    {
      -[SBLockElementViewProvider _elementFrameLeading:forLayoutMode:](self, "_elementFrameLeading:forLayoutMode:", self->_leadingLock == v8, a5);
      v10 = v11;
      height = v12;
    }
  }
  else
  {
    *(double *)&v10 = 0.0;
  }

  v13 = *(double *)&v10;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3
{
  double v4;
  uint64_t v5;
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
  id *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23 = a3;
  -[SBLockElementViewProvider _updateLockLayout](self, "_updateLockLayout");
  objc_msgSend(v23, "size");
  if (v4 <= 200.0)
  {
    if (-[SBLockElementViewProvider layoutMode](self, "layoutMode") == 3)
      v5 = 3;
    else
      v5 = 1;
  }
  else
  {
    v5 = 3;
  }
  -[SBLockElementViewProvider _elementFrameLeading:forLayoutMode:](self, "_elementFrameLeading:forLayoutMode:", 1, v5);
  v7 = v6;
  v9 = v8;
  if (-[SBLockElementViewProvider layoutMode](self, "layoutMode") == 3)
  {
    objc_msgSend(v23, "center");
    v11 = v10;
    v13 = v12;
    if (-[SBLockElementViewProvider _treatsAsAmbientSearching](self, "_treatsAsAmbientSearching"))
    {
      -[SBUIProudLockIconView setSize:](self->_prominentLock, "setSize:", 67.0, 67.0);
      -[SBUIProudLockIconView setCenter:](self->_prominentLock, "setCenter:", 33.5, 33.5);
      -[SBUIProudLockIconView size](self->_prominentLock, "size");
      v15 = v14;
      v17 = v16;
    }
    else
    {
      -[SBUIProudLockIconView setSize:](self->_leadingLock, "setSize:", v7, v9);
      -[SBUIProudLockIconView center](self->_leadingLock, "center");
      objc_msgSend(v23, "bounds");
      CGRectGetMidY(v24);
      UIRoundToViewScale();
      v18 = (id *)MEMORY[0x1E0CEB258];
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      {
        objc_msgSend(v23, "bounds");
        CGRectGetMaxX(v25);
      }
      UIRoundToViewScale();
      -[SBUIProudLockIconView setCenter:](self->_leadingLock, "setCenter:");
      -[UIView size](self->_trailingView, "size");
      v15 = v19;
      v17 = v20;
      objc_msgSend(v23, "bounds");
      CGRectGetMidY(v26);
      UIRoundToViewScale();
      v13 = v21;
      if (objc_msgSend(*v18, "userInterfaceLayoutDirection") != 1)
      {
        objc_msgSend(v23, "bounds");
        CGRectGetMaxX(v27);
      }
      UIRoundToViewScale();
      v11 = v22;
      -[UIView setCenter:](self->_trailingView, "setCenter:", v15 * 0.5, v17 * 0.5);
    }
    -[UIView setSize:](self->_trailingContainerView, "setSize:", v15, v17);
    -[UIView setCenter:](self->_trailingContainerView, "setCenter:", v11, v13);
  }

}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileOverLiquidDetectionCriticalUI
{
  return 0;
}

- (BOOL)shouldIgnoreSystemChromeSuppression
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOnContinuityDisplay
{
  return 1;
}

- (BOOL)preventsSwipeToHide
{
  return 1;
}

- (void)biometricResource:(id)a3 matchingEnabledDidChange:(BOOL)a4
{
  -[SBLockElementViewProvider _updateAllowsBioUnlock](self, "_updateAllowsBioUnlock", a3, a4);
  -[SBLockElementViewProvider _updateTrailingGlyph](self, "_updateTrailingGlyph");
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  SBUIBiometricResource *v6;
  SBLockElementViewProvider *v7;
  uint64_t v8;
  SBUIBiometricResource *v9;

  v6 = (SBUIBiometricResource *)a3;
  if (self->_sharedResource == v6)
  {
    v9 = v6;
    switch(a4)
    {
      case 4uLL:
        v7 = self;
        v8 = 6;
        goto LABEL_4;
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xBuLL:
        -[SBLockElementViewProvider _updateAllowsBioUnlock](self, "_updateAllowsBioUnlock");
        goto LABEL_6;
      case 9uLL:
      case 0xAuLL:
      case 0xFuLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x17uLL:
      case 0x18uLL:
        self->_hasActiveUnlockAttempt = 0;
        v7 = self;
        v8 = 7;
        goto LABEL_4;
      case 0xCuLL:
        v7 = self;
        v8 = 4;
        goto LABEL_4;
      case 0xDuLL:
        if (self->_hasActiveUnlockAttempt || self->_isAuthenticated)
          break;
        self->_hasActiveUnlockAttempt = 1;
        v7 = self;
        v8 = 5;
LABEL_4:
        -[SBLockElementViewProvider handleBiometricEvent:](v7, "handleBiometricEvent:", v8);
LABEL_6:
        v6 = v9;
        break;
      case 0xEuLL:
      case 0x16uLL:
        v7 = self;
        v8 = 15;
        goto LABEL_4;
      default:
        break;
    }
  }

}

- (BOOL)_activelyWantsMatching
{
  if (-[SBLockElementViewProvider _allowsBiometricUnlock](self, "_allowsBiometricUnlock")
    && -[SBUIBiometricResource isMatchingAllowed](self->_sharedResource, "isMatchingAllowed")
    && ((-[SBUIBiometricResource isMatchingEnabled](self->_sharedResource, "isMatchingEnabled") & 1) != 0
     || self->_isAuthenticated))
  {
    return -[SBUIBiometricResource isPearlDetectEnabled](self->_sharedResource, "isPearlDetectEnabled");
  }
  else
  {
    return 0;
  }
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__SBLockElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v9[3] = &unk_1E8EA1AD8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a5, "animateAlongsideTransition:completion:", v9, 0);

}

uint64_t __103__SBLockElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContentProvidersForViewProviderMode");
  return objc_msgSend(*(id *)(a1 + 32), "layoutHostContainerViewWillLayoutSubviews:", *(_QWORD *)(a1 + 40));
}

- (void)_toggleUnlockMode
{
  unint64_t unlockMode;
  id WeakRetained;

  unlockMode = self->_unlockMode;
  if (unlockMode <= 3)
    -[SBLockElementViewProvider _setUnlockMode:](self, "_setUnlockMode:", qword_1D0E88608[unlockMode]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

}

- (unint64_t)_unlockMode
{
  return self->_unlockMode;
}

- (void)_setUnlockMode:(unint64_t)a3
{
  id WeakRetained;

  if (self->_unlockMode != a3)
  {
    self->_unlockMode = a3;
    -[SBLockElementViewProvider _updateTrailingGlyph](self, "_updateTrailingGlyph");
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)_updateTrailingGlyph
{
  BSUICAPackageView **p_trailingPackageView;
  const __CFString *v4;

  switch(-[SBLockElementViewProvider _unlockMode](self, "_unlockMode"))
  {
    case 0uLL:
    case 2uLL:
      if (!-[SBLockElementViewProvider _activelyWantsMatching](self, "_activelyWantsMatching"))
        goto LABEL_5;
      if (!self->_isAuthenticated)
      {
        p_trailingPackageView = &self->_trailingPackageView;
        v4 = CFSTR("Faceid");
        goto LABEL_8;
      }
      break;
    case 1uLL:
LABEL_5:
      p_trailingPackageView = &self->_trailingPackageView;
      v4 = CFSTR("success");
      goto LABEL_8;
    case 3uLL:
      p_trailingPackageView = &self->_trailingPackageView;
      -[BSUICAPackageView setState:animated:](*p_trailingPackageView, "setState:animated:", CFSTR("Faceid"), 0);
      v4 = CFSTR("failed");
LABEL_8:
      -[BSUICAPackageView setState:animated:](*p_trailingPackageView, "setState:animated:", v4, 1);
      break;
    default:
      return;
  }
}

- (BOOL)_allowsBiometricUnlock
{
  return -[SBUIBiometricResource biometricLockoutState](self->_sharedResource, "biometricLockoutState") == 0;
}

- (BOOL)_isShowingInLandscape
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  CGRect v13;
  CGRect v14;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  Width = CGRectGetWidth(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  return Width > CGRectGetHeight(v14);
}

- (id)elementHost
{
  return objc_loadWeakRetained((id *)&self->_elementHost);
}

- (void)setElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_elementHost, a3);
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (id)layoutHost
{
  return objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (SBUISystemApertureContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contentProvider, a3);
}

- (SBUISystemApertureCustomContentProvider)lockProvider
{
  return self->_lockProvider;
}

- (void)setLockProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockProvider, a3);
}

- (SBUISystemApertureCustomContentProvider)trailingPackageProvider
{
  return self->_trailingPackageProvider;
}

- (void)setTrailingPackageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPackageProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingPackageProvider, 0);
  objc_storeStrong((id *)&self->_lockProvider, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_storeStrong((id *)&self->_trailingPackageView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_prominentLock, 0);
  objc_storeStrong((id *)&self->_trailingContainerView, 0);
  objc_storeStrong((id *)&self->_leadingLock, 0);
  objc_storeStrong((id *)&self->_sharedResource, 0);
}

@end
