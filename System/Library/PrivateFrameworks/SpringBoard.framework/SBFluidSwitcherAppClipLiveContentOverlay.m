@implementation SBFluidSwitcherAppClipLiveContentOverlay

- (SBFluidSwitcherAppClipLiveContentOverlay)initWithPlaceholderEntity:(id)a3 windowScene:(id)a4
{
  id v7;
  id v8;
  SBFluidSwitcherAppClipLiveContentOverlay *v9;
  SBFluidSwitcherAppClipLiveContentOverlay *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSString *sceneIdentifier;
  id v15;
  uint64_t v16;
  SBUISizeObservingView *containerView;
  SBAppClipOverlayViewController *v18;
  void *v19;
  uint64_t v20;
  SBAppClipOverlayViewController *placeholderViewController;
  SBUISizeObservingView *v22;
  void *v23;
  uint64_t v24;
  SBSDisplayLayoutElement *displayLayoutElement;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  NSString *v33;
  NSString *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  NSString *v40;
  NSString *v41;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  NSString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)SBFluidSwitcherAppClipLiveContentOverlay;
  v9 = -[SBFluidSwitcherAppClipLiveContentOverlay init](&v44, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_sbWindowScene, v8);
    objc_msgSend(v7, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(v7, "futureSceneIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v10->_sceneIdentifier;
    v10->_sceneIdentifier = (NSString *)v13;

    v10->_isPendingUpdate = objc_msgSend(v7, "needsUpdate");
    v15 = objc_alloc(MEMORY[0x1E0DAC670]);
    v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    containerView = v10->_containerView;
    v10->_containerView = (SBUISizeObservingView *)v16;

    -[SBUISizeObservingView setDelegate:](v10->_containerView, "setDelegate:", v10);
    v18 = [SBAppClipOverlayViewController alloc];
    objc_msgSend((id)SBApp, "appClipOverlayCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SBAppClipOverlayViewController initWithCoordinator:bundleIdentifier:sceneIdentifier:](v18, "initWithCoordinator:bundleIdentifier:sceneIdentifier:", v19, v10->_bundleIdentifier, v10->_sceneIdentifier);
    placeholderViewController = v10->_placeholderViewController;
    v10->_placeholderViewController = (SBAppClipOverlayViewController *)v20;

    v22 = v10->_containerView;
    -[SBAppClipOverlayViewController view](v10->_placeholderViewController, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISizeObservingView addSubview:](v22, "addSubview:", v23);

    -[SBAppClipOverlayViewController setDisplayedOverPlaceholder:animated:](v10->_placeholderViewController, "setDisplayedOverPlaceholder:animated:", 1, 0);
    -[SBAppClipOverlayViewController setSceneActivationState:animated:](v10->_placeholderViewController, "setSceneActivationState:animated:", -1, 0);
    if (v10->_isPendingUpdate)
      -[SBAppClipOverlayViewController setNeedsUpdate](v10->_placeholderViewController, "setNeedsUpdate");
    -[SBFluidSwitcherAppClipLiveContentOverlay _createAndConfigureStatusBar](v10, "_createAndConfigureStatusBar");
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE30]), "initWithIdentifier:", v10->_sceneIdentifier);
    displayLayoutElement = v10->_displayLayoutElement;
    v10->_displayLayoutElement = (SBSDisplayLayoutElement *)v24;

    -[SBSDisplayLayoutElement setBundleIdentifier:](v10->_displayLayoutElement, "setBundleIdentifier:", v10->_bundleIdentifier);
    -[SBSDisplayLayoutElement setLayoutRole:](v10->_displayLayoutElement, "setLayoutRole:", 1);
    -[SBSDisplayLayoutElement setLevel:](v10->_displayLayoutElement, "setLevel:", 1);
    -[SBSDisplayLayoutElement setUIApplicationElement:](v10->_displayLayoutElement, "setUIApplicationElement:", 1);
    -[SBSDisplayLayoutElement setHasKeyboardFocus:](v10->_displayLayoutElement, "setHasKeyboardFocus:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v10, sel__installedApplicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), v27);

    +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "placeholderForDisplayID:", v10->_bundleIdentifier);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 || v10->_isPendingUpdate)
    {
      SBLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v10->_bundleIdentifier;
        v34 = v10->_sceneIdentifier;
        *(_DWORD *)buf = 138543874;
        v46 = v32;
        v47 = 2114;
        v48 = v33;
        v49 = 2114;
        v50 = v34;
        _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Placeholder present or update available, will observe installation for app clip: %{public}@:%{public}@", buf, 0x20u);

      }
      if (v10->_isPendingUpdate)
        -[SBFluidSwitcherAppClipLiveContentOverlay _beginPollingUpdateStillAvailable](v10, "_beginPollingUpdateStillAvailable");
    }
    else
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "applicationWithBundleIdentifier:", v10->_bundleIdentifier);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBFluidSwitcherAppClipLiveContentOverlay.m"), 115, CFSTR("If we don't have a placeholder, we expect to have an installed application for %@"), v10->_bundleIdentifier);

      }
      SBLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v10->_bundleIdentifier;
        v41 = v10->_sceneIdentifier;
        *(_DWORD *)buf = 138543874;
        v46 = v39;
        v47 = 2114;
        v48 = v40;
        v49 = 2114;
        v50 = v41;
        _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Application already present, will launch app clip: %{public}@:%{public}@", buf, 0x20u);

      }
      -[SBFluidSwitcherAppClipLiveContentOverlay _launchApplication:](v10, "_launchApplication:", v36);

    }
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), v4);

  -[SBFluidSwitcherAppClipLiveContentOverlay _statusBarReusePool](self, "_statusBarReusePool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleStatusBar:", self->_statusBar);

  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherAppClipLiveContentOverlay;
  -[SBFluidSwitcherAppClipLiveContentOverlay dealloc](&v6, sel_dealloc);
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  if (self->_containerView == a3)
  {
    objc_msgSend(a3, "bounds", a4.width, a4.height);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SBAppClipOverlayViewController view](self->_placeholderViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[UIStatusBar setFrame:](self->_statusBar, "setFrame:", v6, v8, v10, v12);
  }
}

- (UIViewController)contentViewController
{
  return (UIViewController *)self->_placeholderViewController;
}

- (void)setContentReferenceSize:(CGSize)a3 interfaceOrientation:(int64_t)a4
{
  _QWORD v4[4];
  CGSize v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__SBFluidSwitcherAppClipLiveContentOverlay_setContentReferenceSize_interfaceOrientation___block_invoke;
  v4[3] = &__block_descriptor_48_e33_v16__0__SBSDisplayLayoutElement_8l;
  v5 = a3;
  -[SBFluidSwitcherAppClipLiveContentOverlay updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v4);
}

void __89__SBFluidSwitcherAppClipLiveContentOverlay_setContentReferenceSize_interfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  SBRectWithSize();
  objc_msgSend(v2, "setReferenceFrame:");

}

- (UIView)contentOverlayView
{
  return (UIView *)self->_containerView;
}

- (void)setStatusBarHidden:(BOOL)a3 nubViewHidden:(BOOL)a4 animator:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__SBFluidSwitcherAppClipLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke;
  v10[3] = &unk_1E8E9F508;
  v10[4] = self;
  v11 = a3;
  v8 = MEMORY[0x1D17E5550](v10);
  v9 = (void *)v8;
  if (v7)
    v7[2](v7, v8, 0);
  else
    (*(void (**)(uint64_t))(v8 + 16))(v8);

}

uint64_t __86__SBFluidSwitcherAppClipLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", v1);
}

- (int64_t)leadingStatusBarStyle
{
  return _SBStatusBarStyleForPartWithIdentifier(self->_statusBar, (void *)*MEMORY[0x1E0CEC200]);
}

- (int64_t)trailingStatusBarStyle
{
  return _SBStatusBarStyleForPartWithIdentifier(self->_statusBar, (void *)*MEMORY[0x1E0CEC210]);
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (double)currentStatusBarHeight
{
  double result;

  -[UIStatusBar currentHeight](self->_statusBar, "currentHeight");
  return result;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (int64_t)preferredInterfaceOrientation
{
  return 0;
}

- (int64_t)touchBehavior
{
  return 2;
}

- (id)liveSceneIdentityToken
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__35;
  v11 = __Block_byref_object_dispose__35;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SBFluidSwitcherAppClipLiveContentOverlay_liveSceneIdentityToken__block_invoke;
  v6[3] = &unk_1E8EA7310;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateScenesWithBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __66__SBFluidSwitcherAppClipLiveContentOverlay_liveSceneIdentityToken__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = objc_msgSend(v13, "isActive");
  v6 = v13;
  if (v5)
  {
    objc_msgSend(v13, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isForeground") & 1) != 0)
    {
      objc_msgSend(v13, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

      v6 = v13;
      if (v9)
      {
        objc_msgSend(v13, "identityToken");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v6 = v13;
        *a3 = 1;
      }
    }
    else
    {

      v6 = v13;
    }
  }

}

- (void)_createAndConfigureStatusBar
{
  void *v3;
  UIStatusBar *v4;
  UIStatusBar *statusBar;
  UIStatusBar *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  UIStatusBar *v11;
  void *v12;
  id v13;

  -[SBFluidSwitcherAppClipLiveContentOverlay _statusBarReusePool](self, "_statusBarReusePool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getReusableStatusBarWithReason:", CFSTR("app clip live content overlay"));
  v4 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
  statusBar = self->_statusBar;
  self->_statusBar = v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "statusBarDebugBackgroundColorsEnabled"))
  {
    v6 = self->_statusBar;
    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar setBackgroundColor:](v6, "setBackgroundColor:", v8);

  }
  v9 = objc_msgSend(MEMORY[0x1E0CEA9E8], "defaultStyleForRequestedStyle:styleOverrides:", 1, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F20]), "initWithResolvedStyle:foregroundColor:", _SBStatusBarStyleFromLegacyStyle(v9), 0);
  -[UIStatusBar setStyleRequest:](self->_statusBar, "setStyleRequest:", v10);
  -[UIStatusBar setHidden:](self->_statusBar, "setHidden:", 0);
  -[SBUISizeObservingView addSubview:](self->_containerView, "addSubview:", self->_statusBar);
  v11 = self->_statusBar;
  -[SBAppClipOverlayViewController view](self->_placeholderViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[UIStatusBar setFrame:](v11, "setFrame:");

  -[UIStatusBar setAutoresizingMask:](self->_statusBar, "setAutoresizingMask:", 18);
}

- (void)_beginPollingUpdateStillAvailable
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (self->_isPendingUpdate)
  {
    if (self->_bundleIdentifier)
    {
      objc_initWeak(&location, self);
      v2 = dispatch_time(0, 8000000000);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __77__SBFluidSwitcherAppClipLiveContentOverlay__beginPollingUpdateStillAvailable__block_invoke;
      v3[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v4, &location);
      dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __77__SBFluidSwitcherAppClipLiveContentOverlay__beginPollingUpdateStillAvailable__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  void *v3;
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 1);
    if (v3)
    {
      v4 = v3;
      v5 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:](SBAppClipPlaceholderWorkspaceEntity, "isAppClipUpdateAvailableForBundleIdentifier:", v4);
      SBLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v9;
          v16 = 2114;
          v17 = v4;
          _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ The update for %{public}@ is still available. Polling.", (uint8_t *)&v14, 0x16u);

        }
        objc_msgSend(v2, "_beginPollingUpdateStillAvailable");
      }
      else
      {
        if (v7)
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v11;
          v16 = 2114;
          v17 = v4;
          _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ The update for %{public}@ is no longer available. Launching previous version.", (uint8_t *)&v14, 0x16u);

        }
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applicationWithBundleIdentifier:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v2[48] = 0;
          objc_msgSend(v2, "_launchApplication:", v13);
        }

      }
    }
  }

}

- (void)_installedApplicationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  NSString *bundleIdentifier;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  SBFluidSwitcherAppClipLiveContentOverlay *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", self->_bundleIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2114;
      v26 = bundleIdentifier;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Application did finish installing: %{public}@", buf, 0x16u);

    }
    v11 = (void *)MEMORY[0x1E0D229B0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __76__SBFluidSwitcherAppClipLiveContentOverlay__installedApplicationsDidChange___block_invoke;
    v20 = &unk_1E8E9E820;
    v21 = self;
    v22 = v5;
    objc_msgSend(v11, "eventWithName:handler:", CFSTR("LaunchAppClipApplication"), &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance", v17, v18, v19, v20, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "executeOrAppendEvent:", v12);

  }
  else
  {
    if (v7)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Installed applications did change, but we still don't have an application for: %{public}@", buf, 0x16u);

    }
  }

}

uint64_t __76__SBFluidSwitcherAppClipLiveContentOverlay__installedApplicationsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchApplication:", *(_QWORD *)(a1 + 40));
}

- (void)_launchApplication:(id)a3
{
  id v5;
  id WeakRetained;
  SBDeviceApplicationSceneEntity *v7;
  NSString *sceneIdentifier;
  void *v9;
  void *v10;
  SBDeviceApplicationSceneEntity *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  SBDeviceApplicationSceneEntity *v25;
  void *v26;
  _QWORD v27[4];
  SBDeviceApplicationSceneEntity *v28;
  id v29;
  id v30;
  SBFluidSwitcherAppClipLiveContentOverlay *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  SBDeviceApplicationSceneEntity *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherAppClipLiveContentOverlay.m"), 329, CFSTR("We expect to have an application at this point for %@:%@"), self->_bundleIdentifier, self->_sceneIdentifier);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  v7 = [SBDeviceApplicationSceneEntity alloc];
  sceneIdentifier = self->_sceneIdentifier;
  objc_msgSend(WeakRetained, "sceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v7, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v5, sceneIdentifier, v9, v10);

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Will launch app clip from placeholder with workspace entity: %{public}@", buf, 0x16u);
  }

  v15 = (void *)MEMORY[0x1E0D23068];
  objc_msgSend(v5, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storeForApplication:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneEntity sceneHandle](v11, "sceneHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sceneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sceneStoreForIdentifier:creatingIfNecessary:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKey:", CFSTR("appClipIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "webClipService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke;
  v27[3] = &unk_1E8EAAC78;
  v28 = v11;
  v29 = WeakRetained;
  v30 = v13;
  v31 = self;
  v23 = v13;
  v24 = WeakRetained;
  v25 = v11;
  objc_msgSend(v22, "buildLaunchActionsForAppClipWithWebClipIdentifier:completion:", v21, v27);

}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "addActions:", a2);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fbsDisplayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_2;
  v11[3] = &unk_1E8EA0260;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_40;
  v8[3] = &unk_1E8EAAC50;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v3, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v4, v11, v8);

}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "setEventLabel:", CFSTR("ActivateAppClipFromPlaceholder"));
  objc_msgSend(v3, "setSource:", 44);
  objc_msgSend(v3, "setTransactionProvider:", &__block_literal_global_113);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_4;
  v9[3] = &unk_1E8E9EE50;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v9);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5;
  v6[3] = &unk_1E8E9DEB0;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v6);

}

SBActivateAppClipFromPlaceholderWorkspaceTransaction *__63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SBActivateAppClipFromPlaceholderWorkspaceTransaction *v3;

  v2 = a2;
  v3 = -[SBAppToAppWorkspaceTransaction initWithTransitionRequest:]([SBActivateAppClipFromPlaceholderWorkspaceTransaction alloc], "initWithTransitionRequest:", v2);

  return v3;
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setActivatingEntity:", v2);
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 0);

}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Did launch app clip from placeholder with workspace entity: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5_cold_1(a1, v5);
  }

}

BOOL __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode");

  if (v5 == 2)
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_42);
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v6 + 8))
    v7 = *(_QWORD *)(v6 + 16) != 0;
  else
    v7 = 0;

  return v7;
}

uint64_t __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_2_41(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedUnlockedEnvironmentMode:", 2);
}

- (id)_statusBarReusePool
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reusePool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void (**v5)(id, SBSDisplayLayoutElement *);
  id WeakRetained;
  objc_class *v7;
  void *v8;
  void *v9;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  void (*v13)(void);
  void *v14;
  void *v15;
  id v16;

  if (self->_displayLayoutElementAssertion)
  {
    v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherAppClipLiveContentOverlay.m"), 385, CFSTR("No window scene to get a publisher: %@"), self);

    }
    objc_msgSend(WeakRetained, "displayLayoutPublisher");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherAppClipLiveContentOverlay.m"), 385, CFSTR("No publisher for window scene: %@; self: %@"),
        WeakRetained,
        self);

    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitionAssertionWithReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    objc_msgSend(v16, "addElement:", self->_displayLayoutElement);
    v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    objc_msgSend(v9, "invalidate");
  }
  else
  {
    v13 = (void (*)(void))*((_QWORD *)a3 + 2);
    v16 = a3;
    v13();
  }

}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutElementAssertion;
  id WeakRetained;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  void *v10;
  void *v11;
  void *v12;

  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (!displayLayoutElementAssertion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
      if (!WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherAppClipLiveContentOverlay.m"), 403, CFSTR("No window scene to get a publisher: %@"), self);

      }
      objc_msgSend(WeakRetained, "displayLayoutPublisher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherAppClipLiveContentOverlay.m"), 403, CFSTR("No publisher for window scene: %@; self: %@"),
          WeakRetained,
          self);

      }
      objc_msgSend(v12, "addElement:", self->_displayLayoutElement);
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v7;

    }
  }
  else if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    v9 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (int64_t)overlayType
{
  return 2;
}

- (void)invalidate
{
  BSInvalidatable *displayLayoutElementAssertion;

  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->_asyncRenderingEnabled;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->_resizesHostedContext = a3;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->_wantsEnhancedWindowingEnabled = a3;
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMaximized
{
  return self->_maximized;
}

- (void)setMaximized:(BOOL)a3
{
  self->_maximized = a3;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->_cornerRadii.topLeft;
  bottomLeft = self->_cornerRadii.bottomLeft;
  bottomRight = self->_cornerRadii.bottomRight;
  topRight = self->_cornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (SBWindowScene)_sbWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to launch app clip from placeholder with workspace entity: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
