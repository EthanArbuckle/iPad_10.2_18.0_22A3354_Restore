@implementation SBAppClipPlaceholderLayoutElementViewController

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  -[SBLayoutElementViewController invalidate](&v3, sel_invalidate);
  -[SBAppClipPlaceholderLayoutElementViewController _cleanup](self, "_cleanup");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  -[SBLayoutElementViewController prepareForReuse](&v3, sel_prepareForReuse);
  -[SBAppClipPlaceholderLayoutElementViewController _cleanup](self, "_cleanup");
}

- (void)_cleanup
{
  SBAppClipOverlayViewController *placeholderViewController;
  SBAppClipOverlayViewController *v4;
  NSString *bundleIdentifier;
  NSString *sceneIdentifier;
  NSMutableArray *statusBarAssertions;
  NSMutableSet *maskDisplayCornersReasons;
  void *v9;
  void *v10;
  id v11;

  placeholderViewController = self->_placeholderViewController;
  if (placeholderViewController)
  {
    -[SBAppClipOverlayViewController invalidate](placeholderViewController, "invalidate");
    -[SBAppClipPlaceholderLayoutElementViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_placeholderViewController);
    v4 = self->_placeholderViewController;
    self->_placeholderViewController = 0;

  }
  -[SBAppClipPlaceholderLayoutElementViewController _stopObservingApplicationInstalls](self, "_stopObservingApplicationInstalls");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = 0;

  sceneIdentifier = self->_sceneIdentifier;
  self->_sceneIdentifier = 0;

  -[NSMutableArray removeAllObjects](self->_statusBarAssertions, "removeAllObjects");
  statusBarAssertions = self->_statusBarAssertions;
  self->_statusBarAssertions = 0;

  maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
  self->_maskDisplayCornersReasons = 0;

  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaskedCorners:", 0);

  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClipsToBounds:", 0);

}

- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  SBAppClipOverlayViewController *placeholderViewController;
  NSString *v17;
  NSString *bundleIdentifier;
  NSString *v19;
  NSString *sceneIdentifier;
  SBAppClipOverlayViewController *v21;
  void *v22;
  SBAppClipOverlayViewController *v23;
  SBAppClipOverlayViewController *v24;
  SBAppClipOverlayViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  v14 = a3;
  -[SBLayoutElementViewController configureWithWorkspaceEntity:forLayoutElement:layoutState:referenceFrame:](&v30, sel_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame_, v14, a4, a5, x, y, width, height);
  objc_msgSend(v14, "appClipPlaceholderEntity", v30.receiver, v30.super_class);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderLayoutElementViewController.m"), 92, CFSTR("Can only configure app clip placeholder entities."));

  }
  -[SBAppClipPlaceholderLayoutElementViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  placeholderViewController = self->_placeholderViewController;
  if ((placeholderViewController == 0) == (self->_bundleIdentifier == 0))
  {
    if (placeholderViewController)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderLayoutElementViewController.m"), 96, CFSTR("Unexpected state. Are we trying to reuse this VC without going through -prepareForReuse?"));

    if (self->_placeholderViewController)
      goto LABEL_8;
  }
  objc_msgSend(v15, "bundleIdentifier");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v17;

  objc_msgSend(v15, "futureSceneIdentifier");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  sceneIdentifier = self->_sceneIdentifier;
  self->_sceneIdentifier = v19;

  self->_isPendingUpdate = objc_msgSend(v15, "needsUpdate");
  v21 = [SBAppClipOverlayViewController alloc];
  objc_msgSend((id)SBApp, "appClipOverlayCoordinator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBAppClipOverlayViewController initWithCoordinator:bundleIdentifier:sceneIdentifier:](v21, "initWithCoordinator:bundleIdentifier:sceneIdentifier:", v22, self->_bundleIdentifier, self->_sceneIdentifier);
  v24 = self->_placeholderViewController;
  self->_placeholderViewController = v23;

  v25 = self->_placeholderViewController;
  -[SBLayoutElementViewController _contentContainerView](self, "_contentContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppClipPlaceholderLayoutElementViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v25, v26);

  -[SBAppClipOverlayViewController setDisplayedOverPlaceholder:animated:](self->_placeholderViewController, "setDisplayedOverPlaceholder:animated:", 1, 0);
  -[SBAppClipOverlayViewController setSceneActivationState:animated:](self->_placeholderViewController, "setSceneActivationState:animated:", -1, 0);
  if (self->_isPendingUpdate)
    -[SBAppClipOverlayViewController setNeedsUpdate](self->_placeholderViewController, "setNeedsUpdate");
  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

LABEL_8:
}

- (unint64_t)supportedContentInterfaceOrientations
{
  return 30;
}

- (id)_newDisplayLayoutElementForEntity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "appClipPlaceholderEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DAAE30]);
  objc_msgSend(v3, "futureSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:", v5);

  objc_msgSend(v3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifier:", v7);

  objc_msgSend(v6, "setUIApplicationElement:", 1);
  return v6;
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  _BYTE v12[8];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "topLeft");
  v5 = v4;
  objc_msgSend(v11, "bottomLeft");
  v13 = v6;
  objc_msgSend(v11, "bottomRight");
  v14 = v7;
  objc_msgSend(v11, "topRight");
  v15 = v8;
  for (i = 8; i != 32; i += 8)
  {
    if (v5 < *(double *)&v12[i])
      v5 = *(double *)&v12[i];
  }
  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setContinuousCornerRadius:", v5);

}

- (void)setMaskDisplayCorners:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *maskDisplayCornersReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v6 = a4;
  maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
  v16 = v6;
  if (v4)
  {
    if (!maskDisplayCornersReasons)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v9 = self->_maskDisplayCornersReasons;
      self->_maskDisplayCornersReasons = v8;

      v6 = v16;
      maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
    }
    -[NSMutableSet addObject:](maskDisplayCornersReasons, "addObject:", v6);
  }
  else
  {
    -[NSMutableSet removeObject:](maskDisplayCornersReasons, "removeObject:", v6);
  }
  -[SBLayoutElementViewController layoutElement](self, "layoutElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLayoutElementViewController layoutState](self, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = SBCornerMaskForElementInLayoutState(v10, v11, -[NSMutableSet count](self->_maskDisplayCornersReasons, "count") != 0);

  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaskedCorners:", v12);

  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClipsToBounds:", v12 != 0);

}

- (BOOL)SB_conformsToMainDisplaySceneLayoutElementViewControlling
{
  return 1;
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  -[SBAppClipPlaceholderLayoutElementViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[SBLayoutElementViewController _contentContainerView](self, "_contentContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBAppClipOverlayViewController view](self->_placeholderViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  -[SBAppClipPlaceholderLayoutElementViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBAppClipPlaceholderLayoutElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSString *bundleIdentifier;
  NSString *sceneIdentifier;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  -[SBAppClipPlaceholderLayoutElementViewController viewWillAppear:](&v20, sel_viewWillAppear_, a3);
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderForDisplayID:", self->_bundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 || self->_isPendingUpdate)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      sceneIdentifier = self->_sceneIdentifier;
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      v23 = 2114;
      v24 = bundleIdentifier;
      v25 = 2114;
      v26 = sceneIdentifier;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Placeholder present or update available, will observe installation for app clip: %{public}@:%{public}@", buf, 0x20u);

    }
    -[SBAppClipPlaceholderLayoutElementViewController _beginObservingApplicationInstalls](self, "_beginObservingApplicationInstalls");
    if (self->_isPendingUpdate)
      -[SBAppClipPlaceholderLayoutElementViewController _beginPollingUpdateStillAvailable](self, "_beginPollingUpdateStillAvailable");
  }
  else
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationWithBundleIdentifier:", self->_bundleIdentifier);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderLayoutElementViewController.m"), 190, CFSTR("If we don't have a placeholder, we expect to have an installed application for %@"), self->_bundleIdentifier);

    }
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self->_bundleIdentifier;
      v18 = self->_sceneIdentifier;
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Application already present, will launch app clip: %{public}@:%{public}@", buf, 0x20u);

    }
    -[SBAppClipPlaceholderLayoutElementViewController _launchApplication:](self, "_launchApplication:", v13);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppClipPlaceholderLayoutElementViewController;
  -[SBAppClipPlaceholderLayoutElementViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBAppClipPlaceholderLayoutElementViewController _stopObservingApplicationInstalls](self, "_stopObservingApplicationInstalls");
}

- (void)statusBarAssertionDidInvalidate:(id)a3
{
  -[NSMutableArray removeObject:](self->_statusBarAssertions, "removeObject:", a3);
  -[SBAppClipPlaceholderLayoutElementViewController _statusBarAssertionDidUpdate](self, "_statusBarAssertionDidUpdate");
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 1;
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  return -[SBAppClipPlaceholderLayoutElementViewController statusBarAssertionWithStatusBarHidden:atLevel:](self, "statusBarAssertionWithStatusBarHidden:atLevel:", a3, a5);
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  _BOOL4 v5;
  SBMutableStatusBarSettings *v7;
  double v8;
  void *v9;
  SBSceneViewStatusBarAssertion *v10;
  NSMutableArray *statusBarAssertions;
  NSMutableArray *v12;
  NSMutableArray *v13;

  v5 = a3;
  v7 = objc_alloc_init(SBMutableStatusBarSettings);
  v8 = 1.0;
  if (v5)
    v8 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setAlpha:](v7, "setAlpha:", v9);

  v10 = -[SBSceneViewStatusBarAssertion initWithStatusBarSettings:nubViewHidden:atLevel:]([SBSceneViewStatusBarAssertion alloc], "initWithStatusBarSettings:nubViewHidden:atLevel:", v7, 0x7FFFFFFFFFFFFFFFLL, a4);
  -[SBSceneViewStatusBarAssertion addObserver:](v10, "addObserver:", self);
  statusBarAssertions = self->_statusBarAssertions;
  if (!statusBarAssertions)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_statusBarAssertions;
    self->_statusBarAssertions = v12;

    statusBarAssertions = self->_statusBarAssertions;
  }
  -[NSMutableArray addObject:](statusBarAssertions, "addObject:", v10);
  -[SBAppClipPlaceholderLayoutElementViewController _statusBarAssertionDidUpdate](self, "_statusBarAssertionDidUpdate");

  return v10;
}

- (void)_statusBarAssertionDidUpdate
{
  NSString *sceneIdentifier;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  sceneIdentifier = self->_sceneIdentifier;
  -[SBAppClipPlaceholderLayoutElementViewController statusBarAlpha](self, "statusBarAlpha");
  objc_msgSend(WeakRetained, "sceneWithIdentifier:didChangeStatusBarAlphaTo:", sceneIdentifier);

}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescriberProviding
{
  return 1;
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescribing
{
  return 1;
}

- (int64_t)statusBarStyle
{
  return 1;
}

- (int64_t)defaultStatusBarStyle
{
  return 1;
}

- (BOOL)statusBarHidden
{
  return 0;
}

- (double)statusBarAlpha
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  if (!-[NSMutableArray count](self->_statusBarAssertions, "count"))
    return 1.0;
  -[SBAppClipPlaceholderLayoutElementViewController _aggregateStatusBarOverrideSettings](self, "_aggregateStatusBarOverrideSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGRect)statusBarAvoidanceFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  return 0;
}

- (NSString)statusBarSceneIdentifier
{
  return self->_sceneIdentifier;
}

- (_UIStatusBarData)overlayStatusBarData
{
  return 0;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider
{
  return 0;
}

- (SBDeviceApplicationSceneHandle)classicApplicationSceneHandleIfExists
{
  return 0;
}

- (FBScene)sceneToHandleStatusBarTapIfExists
{
  return 0;
}

- (id)_aggregateStatusBarOverrideSettings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray sortedArrayUsingComparator:](self->_statusBarAssertions, "sortedArrayUsingComparator:", &__block_literal_global_185);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "settings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "settings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v5)
            objc_msgSend(v5, "applySettings:", v10);
          else
            v5 = (void *)objc_msgSend(v10, "mutableCopy");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __86__SBAppClipPlaceholderLayoutElementViewController__aggregateStatusBarOverrideSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "level");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (void)_beginObservingApplicationInstalls
{
  void *v3;
  id v4;

  if (!self->_isObservingApplicationInstalls)
  {
    self->_isObservingApplicationInstalls = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__installedApplicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), v3);

  }
}

- (void)_stopObservingApplicationInstalls
{
  void *v3;
  id v4;

  if (self->_isObservingApplicationInstalls)
  {
    self->_isObservingApplicationInstalls = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), v3);

  }
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
      v3[2] = __84__SBAppClipPlaceholderLayoutElementViewController__beginPollingUpdateStillAvailable__block_invoke;
      v3[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v4, &location);
      dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __84__SBAppClipPlaceholderLayoutElementViewController__beginPollingUpdateStillAvailable__block_invoke(uint64_t a1)
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
    v3 = (void *)*((_QWORD *)WeakRetained + 135);
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
          v2[1104] = 0;
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
  SBAppClipPlaceholderLayoutElementViewController *v21;
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
    v19 = __83__SBAppClipPlaceholderLayoutElementViewController__installedApplicationsDidChange___block_invoke;
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

uint64_t __83__SBAppClipPlaceholderLayoutElementViewController__installedApplicationsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchApplication:", *(_QWORD *)(a1 + 40));
}

- (void)_launchApplication:(id)a3
{
  id v5;
  SBDeviceApplicationSceneEntity *v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  SBDeviceApplicationSceneEntity *v19;
  void *v20;
  _QWORD v21[4];
  SBDeviceApplicationSceneEntity *v22;
  id v23;
  SBAppClipPlaceholderLayoutElementViewController *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  SBDeviceApplicationSceneEntity *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderLayoutElementViewController.m"), 396, CFSTR("We expect to have an application at this point for %@:%@"), self->_bundleIdentifier, self->_sceneIdentifier);

  }
  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:uniqueIdentifier:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:uniqueIdentifier:", v5, self->_sceneIdentifier);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Will launch app clip from placeholder with workspace entity: %{public}@", buf, 0x16u);
  }

  v10 = (void *)MEMORY[0x1E0D23068];
  objc_msgSend(v5, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "storeForApplication:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneEntity sceneHandle](v6, "sceneHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sceneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sceneStoreForIdentifier:creatingIfNecessary:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKey:", CFSTR("appClipIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "webClipService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke;
  v21[3] = &unk_1E8EB0FF0;
  v22 = v6;
  v23 = v8;
  v24 = self;
  v18 = v8;
  v19 = v6;
  objc_msgSend(v17, "buildLaunchActionsForAppClipWithWebClipIdentifier:completion:", v16, v21);

}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "addActions:", a2);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_2;
  v6[3] = &unk_1E8EA0260;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_59;
  v5[3] = &unk_1E8EA6C08;
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "requestTransitionWithOptions:builder:validator:", 0, v6, v5);

}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "setTransactionProvider:", &__block_literal_global_54_0);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_4;
  v9[3] = &unk_1E8E9EE50;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v9);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_5;
  v6[3] = &unk_1E8E9DEB0;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v6);

}

SBActivateAppClipFromPlaceholderWorkspaceTransaction *__70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SBActivateAppClipFromPlaceholderWorkspaceTransaction *v3;

  v2 = a2;
  v3 = -[SBAppToAppWorkspaceTransaction initWithTransitionRequest:]([SBActivateAppClipFromPlaceholderWorkspaceTransaction alloc], "initWithTransitionRequest:", v2);

  return v3;
}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setActivatingEntity:", v2);
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 0);

}

void __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_5(uint64_t a1, int a2)
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

BOOL __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7)
      NSLog(CFSTR("expected a switcherController!"));
  }
  if (objc_msgSend(v5, "unlockedEnvironmentMode") == 2)
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_63_0);
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 1080))
    v9 = *(_QWORD *)(v8 + 1088) != 0;
  else
    v9 = 0;

  return v9;
}

uint64_t __70__SBAppClipPlaceholderLayoutElementViewController__launchApplication___block_invoke_2_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedUnlockedEnvironmentMode:", 2);
}

- (SBDeviceApplicationSceneStatusBarStateObserver)statusBarDelegate
{
  return (SBDeviceApplicationSceneStatusBarStateObserver *)objc_loadWeakRetained((id *)&self->_statusBarDelegate);
}

- (void)setStatusBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_storeStrong((id *)&self->_maskDisplayCornersReasons, 0);
  objc_storeStrong((id *)&self->_statusBarAssertions, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
