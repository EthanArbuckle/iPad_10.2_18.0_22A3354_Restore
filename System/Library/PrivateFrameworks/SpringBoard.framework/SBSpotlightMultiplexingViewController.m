@implementation SBSpotlightMultiplexingViewController

+ (SPUIRemoteSearchViewController)sharedRemoteSearchViewControllerIfExists
{
  return (SPUIRemoteSearchViewController *)(id)__remoteSearchViewController;
}

+ (SPUIRemoteSearchViewController)sharedRemoteSearchViewController
{
  if (sharedRemoteSearchViewController_onceToken != -1)
    dispatch_once(&sharedRemoteSearchViewController_onceToken, &__block_literal_global_101);
  return (SPUIRemoteSearchViewController *)(id)__remoteSearchViewController;
}

+ (BOOL)isShownWithinWindowScene:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "windows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(a1, "isShownWithinWindow:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)isShownWithinWindow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewControllerIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v3)
      v8 = objc_msgSend(v5, "isBeingPresented");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)parentSceneIdentityToken
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (SBSpotlightHostedContentMetrics)_class_spotlightHostedContentMetrics
{
  CGSize *p_dockedSearchBarSize;
  CGSize *p_searchBarSize;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  void *v27;
  double v28;
  double v29;
  SBSpotlightHostedContentMetrics *result;
  id v32;

  retstr->searchBarCornerRadius = 0.0;
  *(_OWORD *)&retstr->keyboardHeight = 0u;
  retstr->dockedSearchBarSize = 0u;
  p_dockedSearchBarSize = &retstr->dockedSearchBarSize;
  retstr->searchBarSize = 0u;
  p_searchBarSize = &retstr->searchBarSize;
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "keyboardHeight");
  v7 = v6;
  retstr->keyboardHeight = v6;
  objc_msgSend(v32, "keyboardProtectorHeight");
  retstr->keyboardProtectorHeight = v8;
  objc_msgSend(v32, "searchBarSize");
  v10 = v9;
  v12 = v11;
  p_searchBarSize->width = v9;
  retstr->searchBarSize.height = v11;
  objc_msgSend(v32, "dockedSearchBarSize");
  v14 = v13;
  v16 = v15;
  p_dockedSearchBarSize->width = v13;
  retstr->dockedSearchBarSize.height = v15;
  objc_msgSend(v32, "searchBarCornerRadius");
  retstr->searchBarCornerRadius = v17;
  objc_msgSend(v32, "_sbDisplayConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isContinuityDisplay") & 1) != 0)
    v20 = 1;
  else
    v20 = objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode");

  if (BSFloatIsZero() && (v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:", 1);
    v7 = v21;
    retstr->keyboardHeight = v21;
  }
  if (BSFloatIsZero())
  {
    v22 = _os_feature_enabled_impl();
    v23 = 62.0;
    if (v22)
      v23 = v7 + 62.0;
    retstr->keyboardProtectorHeight = v23;
  }
  v24 = *MEMORY[0x1E0C9D820];
  v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v10 == *MEMORY[0x1E0C9D820] && v12 == v25)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28;

    retstr->searchBarSize.width = v29 + -16.0;
    retstr->searchBarSize.height = 48.0;
  }
  if (v14 == v24 && v16 == v25)
  {
    *p_dockedSearchBarSize = *p_searchBarSize;
    p_dockedSearchBarSize->width = p_dockedSearchBarSize->width + -40.0;
  }
  if (BSFloatIsZero())
    retstr->searchBarCornerRadius = 10.0;

  return result;
}

+ (unint64_t)spotlightSupportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v4 = 30;
  else
    v4 = 2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend((id)objc_opt_class(), "spotlightSupportedInterfaceOrientations");
  else
    return v4;
}

+ (double)effectiveSpotlightSearchFieldAvoidanceHeight
{
  void *v3;
  uint64_t v4;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  result = 0.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_msgSend(a1, "_class_spotlightHostedContentMetrics", 0);
    return 0.0;
  }
  return result;
}

void __73__SBSpotlightMultiplexingViewController_sharedRemoteSearchViewController__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_opt_new();
  v1 = (void *)__remoteSearchViewController;
  __remoteSearchViewController = v0;

  v2 = (void *)__remoteSearchViewController;
  +[SBSpotlightDelegateManager sharedInstance](SBSpotlightDelegateManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", v3);

}

+ (id)keyboardFocusTargetIfActiveForeground
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__76;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:workspaceIdentifier:", v3, CFSTR("com.apple.Spotlight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__SBSpotlightMultiplexingViewController_keyboardFocusTargetIfActiveForeground__block_invoke;
  v9[3] = &unk_1E8EA7310;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateScenesWithBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __78__SBSpotlightMultiplexingViewController_keyboardFocusTargetIfActiveForeground__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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
      objc_msgSend(v13, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

      v6 = v13;
      if (v9)
      {
        +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v13);
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

+ (id)spotlightSceneIdentityTokenIfActiveForeground
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__76;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:workspaceIdentifier:", v3, CFSTR("com.apple.Spotlight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SBSpotlightMultiplexingViewController_spotlightSceneIdentityTokenIfActiveForeground__block_invoke;
  v9[3] = &unk_1E8EA7310;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateScenesWithBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __86__SBSpotlightMultiplexingViewController_spotlightSceneIdentityTokenIfActiveForeground__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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
      objc_msgSend(v13, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

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

- (SBSpotlightMultiplexingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBSpotlightMultiplexingViewController *v4;
  SBSpotlightMultiplexingViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSpotlightMultiplexingViewController;
  v4 = -[SBSpotlightMultiplexingViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SBSpotlightMultiplexingViewController _acquireInputUIPresentingAssertionIfNecessary](v4, "_acquireInputUIPresentingAssertionIfNecessary");
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SBSpotlightMultiplexingViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!-[SBSpotlightMultiplexingViewController isInvalidated](self, "isInvalidated"))
  {
    SBLogSpotlight();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ was deallocated without being invalidated. Invalidating now.", buf, 0xCu);
    }

    -[SBSpotlightMultiplexingViewController invalidate](self, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController dealloc](&v4, sel_dealloc);
}

- (SBSpotlightHostedContentMetrics)spotlightHostedContentMetrics
{
  SBSpotlightHostedContentMetrics *result;

  retstr->searchBarCornerRadius = 0.0;
  retstr->searchBarSize = 0u;
  retstr->dockedSearchBarSize = 0u;
  *(_OWORD *)&retstr->keyboardHeight = 0u;
  result = (SBSpotlightHostedContentMetrics *)objc_opt_class();
  if (result)
    return (SBSpotlightHostedContentMetrics *)-[SBSpotlightHostedContentMetrics _class_spotlightHostedContentMetrics](result, "_class_spotlightHostedContentMetrics");
  retstr->searchBarCornerRadius = 0.0;
  retstr->searchBarSize = 0u;
  retstr->dockedSearchBarSize = 0u;
  *(_OWORD *)&retstr->keyboardHeight = 0u;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    if (-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
    {
      objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLegibilitySettings:", v6);

    }
  }

}

- (unint64_t)level
{
  return 0;
}

- (void)invalidate
{
  id v3;

  if (!-[SBSpotlightMultiplexingViewController isInvalidated](self, "isInvalidated"))
  {
    -[SBSpotlightMultiplexingViewController setInvalidated:](self, "setInvalidated:", 1);
    -[SBSpotlightMultiplexingViewController _invalidateInputUIPresentingAssertion](self, "_invalidateInputUIPresentingAssertion");
    +[SBSpotlightDelegateManager sharedInstance](SBSpotlightDelegateManager, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeSpotlightDelegate:forLevel:", self, -[SBSpotlightMultiplexingViewController level](self, "level"));

  }
}

- (void)setWantsExternalKeyboardView:(BOOL)a3
{
  if (self->_wantsExternalKeyboardView != a3)
  {
    self->_wantsExternalKeyboardView = a3;
    -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
  }
}

- (BOOL)externalKeyboardViewContainsKeyboard
{
  void *v3;

  -[SBSpotlightMultiplexingViewController _effectiveKeyboardContentView](self, "_effectiveKeyboardContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3
      && -[SBSpotlightMultiplexingViewController _remoteSearchViewControllerHasKeyboardPresented](self, "_remoteSearchViewControllerHasKeyboardPresented");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    if (-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
    {
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "medusaHostedKeyboardWindowController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:", self);

      -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
      -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id WeakRetained;
  NSObject *v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  SBSpotlightMultiplexingViewController *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAnimated:", 1);

  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSpotlightMultiplexingViewController isInvalidated](self, "isInvalidated"))
  {
    SBLogSpotlight();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is invalidated, so not adding spotlight delegate", buf, 0xCu);
    }
  }
  else
  {
    +[SBSpotlightDelegateManager sharedInstance](SBSpotlightDelegateManager, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject addSpotlightDelegate:forLevel:](v7, "addSpotlightDelegate:forLevel:", self, -[SBSpotlightMultiplexingViewController level](self, "level"));
  }

  -[SBSpotlightMultiplexingViewController _registerStatusBarScrollToTopView](self, "_registerStatusBarScrollToTopView");
  if (-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
    objc_msgSend(v6, "setSource:", -[SBSpotlightMultiplexingViewController remoteSearchViewPresentationSource](self, "remoteSearchViewPresentationSource"));
  v15.receiver = self;
  v15.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewWillAppear:](&v15, sel_viewWillAppear_, v3);
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarStateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addStatusBarObserver:", self);

  -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
  -[SBSpotlightMultiplexingViewController _updateStatusBarStyleAssertion](self, "_updateStatusBarStyleAssertion");
  if (-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
  {
    if (objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow"))
    {
      -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyboardContextMaskStyle:", 2);

    }
    SBLogSpotlight();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ is appearing, and is the active Spotlight delegate", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
    objc_msgSend(v6, "setDisplayConfiguration:", WeakRetained);

    -[SBSpotlightMultiplexingViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v6, 1, v3);
  }
  else
  {
    SBLogSpotlight();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is appearing, but is not the active Spotlight delegate", buf, 0xCu);
    }

  }
  v14 = objc_loadWeakRetained((id *)&self->_inputUIPresentingDelegate);
  objc_msgSend(v14, "scenePresenterVisibilityDidChange:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  SBMedusaHostedKeyboardWindowLevelAssertion *v11;
  SBMedusaHostedKeyboardWindowLevelAssertion *medusaHostedKeyboardWindowLevelAssertion;
  objc_super v13;
  uint8_t buf[4];
  SBSpotlightMultiplexingViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  if (-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
  {
    objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
    v4 = objc_claimAutoreleasedReturnValue();
    SBLogSpotlight();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did appear, and is the active Spotlight delegate", buf, 0xCu);
    }

    -[SBSpotlightMultiplexingViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v4, 1);
  }
  else
  {
    SBLogSpotlight();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ did appear, but is not the active Spotlight delegate", buf, 0xCu);
    }
  }

  if (!self->_medusaHostedKeyboardWindowLevelAssertion
    && objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow"))
  {
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medusaHostedKeyboardWindowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSpotlightMultiplexingViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowLevel");
    v11 = (SBMedusaHostedKeyboardWindowLevelAssertion *)objc_msgSend(v7, "newMedusaHostedKeyboardWindowLevelAssertionWithPriority:windowLevel:", 2, v10 + 1.0);
    medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
    self->_medusaHostedKeyboardWindowLevelAssertion = v11;

  }
  -[SBSpotlightMultiplexingViewController _updateStatusBarStyleAssertion](self, "_updateStatusBarStyleAssertion");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  SBSpotlightMultiplexingViewController *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  if (-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
  {
    objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    SBLogSpotlight();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ is disappearing, and is the active Spotlight delegate", buf, 0xCu);
    }

    -[SBSpotlightMultiplexingViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v5, 0, v3);
  }
  else
  {
    SBLogSpotlight();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is disappearing, but is not the active Spotlight delegate", buf, 0xCu);
    }
  }

  -[SBSpotlightMultiplexingViewController _clearStatusBarStyleAssertionAnimated:](self, "_clearStatusBarStyleAssertionAnimated:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBMedusaHostedKeyboardWindowLevelAssertion *medusaHostedKeyboardWindowLevelAssertion;
  SBMedusaHostedKeyboardWindowLevelAssertion *v14;
  id WeakRetained;
  objc_super v16;
  uint8_t buf[4];
  SBSpotlightMultiplexingViewController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewDidDisappear:](&v16, sel_viewDidDisappear_, a3);
  v4 = -[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate");
  SBLogSpotlight();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did disappear, and is the active Spotlight delegate", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    -[SBSpotlightMultiplexingViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v5, 0);
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did disappear, but is not the active Spotlight delegate", buf, 0xCu);
  }

  +[SBSpotlightDelegateManager sharedInstance](SBSpotlightDelegateManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeSpotlightDelegate:forLevel:", self, -[SBSpotlightMultiplexingViewController level](self, "level"));

  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarStateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeStatusBarObserver:", self);

  -[SBSpotlightMultiplexingViewController _clearStatusBarHiddenAssertion](self, "_clearStatusBarHiddenAssertion");
  -[SBSpotlightMultiplexingViewController _clearStatusBarStyleAssertionAnimated:](self, "_clearStatusBarStyleAssertionAnimated:", 1);
  -[SBSpotlightMultiplexingViewController _unregisterStatusBarScrollToTopView](self, "_unregisterStatusBarScrollToTopView");
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason spotlightMultiplexingViewDidDisappear](SBKeyboardFocusArbitrationReason, "spotlightMultiplexingViewDidDisappear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestArbitrationForSBWindowScene:forReason:", v11, v12);

  medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
  if (medusaHostedKeyboardWindowLevelAssertion)
  {
    -[SBMedusaHostedKeyboardWindowLevelAssertion invalidate](medusaHostedKeyboardWindowLevelAssertion, "invalidate");
    v14 = self->_medusaHostedKeyboardWindowLevelAssertion;
    self->_medusaHostedKeyboardWindowLevelAssertion = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputUIPresentingDelegate);
  objc_msgSend(WeakRetained, "scenePresenterVisibilityDidChange:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightMultiplexingViewController;
  -[SBSpotlightMultiplexingViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[SBSpotlightMultiplexingViewController inputUIView](self, "inputUIView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBSpotlightMultiplexingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      objc_msgSend(v4, "bounds");
      UIRectGetCenter();
      objc_msgSend(v3, "setCenter:");
    }

  }
}

- (void)dismissSearchView
{
  id v2;

  -[SBSpotlightMultiplexingViewController spotlightDelegate](self, "spotlightDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissSearchView");

}

- (void)searchViewKeyboardPresentationStateDidChange
{
  -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView:](self, "_configureExternalKeyboardView:", -[SBSpotlightMultiplexingViewController _remoteSearchViewControllerHasKeyboardPresented](self, "_remoteSearchViewControllerHasKeyboardPresented") ^ 1);
}

- (void)searchViewContentAvailabilityDidChange
{
  id v2;

  -[SBSpotlightMultiplexingViewController spotlightDelegate](self, "spotlightDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "searchViewContentAvailabilityDidChange");

}

- (void)didBecomeActiveDelegate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSpotlightMultiplexingViewController *v11;
  SBSpotlightMultiplexingViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  SBSpotlightMultiplexingViewController *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SBSpotlightMultiplexingViewController setActiveDelegate:](self, "setActiveDelegate:", 1);
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medusaHostedKeyboardWindowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  -[SBSpotlightMultiplexingViewController _configureStatusBarScrollToTopView](self, "_configureStatusBarScrollToTopView");
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController legibilitySettings](self, "legibilitySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLegibilitySettings:", v8);

  objc_msgSend(v7, "setSource:", -[SBSpotlightMultiplexingViewController remoteSearchViewPresentationSource](self, "remoteSearchViewPresentationSource"));
  -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sceneIfExists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _configureSceneObservation:forScene:](self, "_configureSceneObservation:forScene:", 1, v10);

  objc_msgSend(v7, "parentViewController");
  v11 = (SBSpotlightMultiplexingViewController *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 != self)
  {
    if (v11)
    {
      objc_msgSend(v7, "willMoveToParentViewController:", 0);
      objc_msgSend(v7, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");

      objc_msgSend(v7, "removeFromParentViewController");
    }
    -[SBSpotlightMultiplexingViewController addChildViewController:](self, "addChildViewController:", v7);
    objc_msgSend(v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSpotlightMultiplexingViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v14, "setFrame:");

    objc_msgSend(v14, "setAutoresizingMask:", 18);
    -[SBSpotlightMultiplexingViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v14);

    objc_msgSend(v7, "didMoveToParentViewController:", self);
  }
  v17 = -[SBSpotlightMultiplexingViewController _appearState](self, "_appearState");
  v18 = objc_msgSend(v7, "_appearState");
  if (v17 != v18)
  {
    if ((v17 - 1) < 2)
    {
      if ((v18 - 3) <= 0xFFFFFFFD)
      {
        SBLogSpotlight();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138543362;
          v28 = self;
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Appearing state", (uint8_t *)&v27, 0xCu);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
        objc_msgSend(v7, "setDisplayConfiguration:", WeakRetained);

        -[SBSpotlightMultiplexingViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v7, 1, v17 == 1);
      }
      if (v17 == 2)
      {
        SBLogSpotlight();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138543362;
          v28 = self;
          _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Appeared state", (uint8_t *)&v27, 0xCu);
        }
        v21 = 1;
        goto LABEL_26;
      }
    }
    else if (v17 == 3 || !v17)
    {
      if (v18 && v18 != 3)
      {
        SBLogSpotlight();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138543362;
          v28 = self;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Disappearing state", (uint8_t *)&v27, 0xCu);
        }

        -[SBSpotlightMultiplexingViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v7, 0, v17 == 3);
      }
      if (!v17)
      {
        SBLogSpotlight();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138543362;
          v28 = self;
          _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "didBecomeActiveDelegate: %{public}@ is putting search VC in Disappeared state", (uint8_t *)&v27, 0xCu);
        }
        v21 = 0;
LABEL_26:

        -[SBSpotlightMultiplexingViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v7, v21);
      }
    }
  }
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason spotlightMultiplexingDidBecomeActiveDelegate](SBKeyboardFocusArbitrationReason, "spotlightMultiplexingDidBecomeActiveDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "requestArbitrationForSBWindowScene:forReason:", v25, v26);

  -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
  -[SBSpotlightMultiplexingViewController _analyticsLogSpotlightInvocationWhereAndHowWithSource:](self, "_analyticsLogSpotlightInvocationWhereAndHowWithSource:", -[SBSpotlightMultiplexingViewController remoteSearchViewPresentationSource](self, "remoteSearchViewPresentationSource"));

}

- (void)didResignActiveDelegate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  SBSpotlightMultiplexingViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  SBSpotlightMultiplexingViewController *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  SBLogSpotlight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = self;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "didResignActiveDelegate called on %{public}@", (uint8_t *)&v14, 0xCu);
  }

  -[SBSpotlightMultiplexingViewController setActiveDelegate:](self, "setActiveDelegate:", 0);
  -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _configureSceneObservation:forScene:](self, "_configureSceneObservation:forScene:", 0, v7);

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentViewController");
    v9 = (SBSpotlightMultiplexingViewController *)objc_claimAutoreleasedReturnValue();

    if (v9 == self && objc_msgSend(v8, "_appearState"))
      -[SBSpotlightMultiplexingViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v8, 0);

  }
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "medusaHostedKeyboardWindowController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", self);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _spotlightSceneIdentifier](self, "_spotlightSceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusArbitrationReason spotlightMultiplexingDidCreateScene](SBKeyboardFocusArbitrationReason, "spotlightMultiplexingDidCreateScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestArbitrationForSBWindowScene:forReason:", v9, v10);

    -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
    -[SBSpotlightMultiplexingViewController _updateStatusBarStyleAssertion](self, "_updateStatusBarStyleAssertion");
    -[SBSpotlightMultiplexingViewController _configureSceneObservation:forScene:](self, "_configureSceneObservation:forScene:", 1, v13);
    if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
    {
      -[SBSpotlightMultiplexingViewController externalKeyboardView](self, "externalKeyboardView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v13, "settings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        objc_msgSend(v11, "setFrame:");

      }
    }
  }

}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _spotlightSceneIdentifier](self, "_spotlightSceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusArbitrationReason spotlightMultiplexingDidDestroyScene](SBKeyboardFocusArbitrationReason, "spotlightMultiplexingDidDestroyScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestArbitrationForSBWindowScene:forReason:", v9, v10);

    -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
    -[SBSpotlightMultiplexingViewController _updateStatusBarStyleAssertion](self, "_updateStatusBarStyleAssertion");
    -[SBSpotlightMultiplexingViewController _configureSceneObservation:forScene:](self, "_configureSceneObservation:forScene:", 0, v11);
  }

}

- (id)sceneHandle
{
  SBDeviceApplicationSceneHandle *sceneHandle;
  void *v4;
  SBDeviceApplicationSceneHandle *v5;
  SBDeviceApplicationSceneHandle *v6;

  sceneHandle = self->_sceneHandle;
  if (!sceneHandle)
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSpotlightMultiplexingViewController _getSceneHandleFromSceneManager:](self, "_getSceneHandleFromSceneManager:", v4);
    v5 = (SBDeviceApplicationSceneHandle *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sceneHandle;
    self->_sceneHandle = v5;

    sceneHandle = self->_sceneHandle;
  }
  return sceneHandle;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBDeviceApplicationSceneHandle *v20;
  SBDeviceApplicationSceneHandle *sceneHandle;
  int v22;
  SBSpotlightMultiplexingViewController *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "previousSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sb_displayIdentityForSceneManagers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v11 && (objc_msgSend(v11, "isEqual:", v9) & 1) == 0)
  {
    SBLogSpotlight();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543874;
      v23 = self;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ notified that Spotlight scene has changed displays from %{public}@ to %{public}@", (uint8_t *)&v22, 0x20u);
    }

    objc_msgSend((id)SBApp, "windowSceneManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowSceneForDisplayIdentity:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "existingSceneHandleForScene:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v13, "windowSceneForDisplayIdentity:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sceneManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "identity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "transferOwnershipOfSceneWithIdentity:toSceneManager:", v19, v15);

        -[SBSpotlightMultiplexingViewController _getSceneHandleFromSceneManager:](self, "_getSceneHandleFromSceneManager:", v15);
        v20 = (SBDeviceApplicationSceneHandle *)objc_claimAutoreleasedReturnValue();
        sceneHandle = self->_sceneHandle;
        self->_sceneHandle = v20;

      }
    }

  }
}

- (id)_getSceneHandleFromSceneManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0D231F0];
  v5 = a3;
  -[SBSpotlightMultiplexingViewController _spotlightSceneIdentifier](self, "_spotlightSceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityForIdentifier:workspaceIdentifier:", v6, CFSTR("com.apple.Spotlight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _SBApp(CFSTR("com.apple.Spotlight"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fetchOrCreateApplicationSceneHandleForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

- (void)_configureSceneObservation:(BOOL)a3 forScene:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = v6;
  if (v6)
  {
    if (v4 && (v7 = -[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"), v6 = v8, v7))
      objc_msgSend(v8, "addObserver:", self);
    else
      objc_msgSend(v6, "removeObserver:", self);
    v6 = v8;
  }
  -[SBSpotlightMultiplexingViewController _evaluateSearchContentAvailabilityForScene:](self, "_evaluateSearchContentAvailabilityForScene:", v6);

}

- (void)_evaluateSearchContentAvailabilityForScene:(id)a3
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[SBSpotlightMultiplexingViewController isSearchContentAvailable](self, "isSearchContentAvailable");
  if (v7 && -[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
  {
    v5 = objc_msgSend(v7, "contentState") == 2;
    -[SBSpotlightMultiplexingViewController setSearchContentAvailable:](self, "setSearchContentAvailable:", v5);
    if (v4 == v5)
      goto LABEL_9;
  }
  else
  {
    -[SBSpotlightMultiplexingViewController setSearchContentAvailable:](self, "setSearchContentAvailable:", 0);
    v5 = 0;
    if (!v4)
      goto LABEL_9;
  }
  -[SBSpotlightMultiplexingViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "spotlightMultiplexingViewController:searchContentAvailabilityDidChange:", self, v5);

LABEL_9:
}

- (void)keyboardLayersDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _spotlightSceneIdentifier](self, "_spotlightSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
}

- (void)scrollToTopSceneProxyViewDidEnterViewHierarchy:(id)a3 rootedAtWindow:(id)a4
{
  -[SBSpotlightMultiplexingViewController _registerStatusBarScrollToTopViewWithWindow:](self, "_registerStatusBarScrollToTopViewWithWindow:", a4);
}

- (void)scrollToTopSceneProxyViewWillExitViewHierarchy:(id)a3 rootedAtWindow:(id)a4
{
  -[SBSpotlightMultiplexingViewController _unregisterStatusBarScrollToTopViewWithWindow:](self, "_unregisterStatusBarScrollToTopViewWithWindow:", a4);
}

- (id)_spotlightSceneIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureStatusBarScrollToTopView
{
  SBScrollToTopSceneProxyView *v3;
  SBScrollToTopSceneProxyView *v4;
  SBScrollToTopSceneProxyView *scrollToTopView;
  SBScrollToTopSceneProxyView *v6;
  void *v7;
  id v8;

  if (!self->_scrollToTopView)
  {
    -[SBSpotlightMultiplexingViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [SBScrollToTopSceneProxyView alloc];
    objc_msgSend(v8, "bounds");
    v4 = -[SBScrollToTopSceneProxyView initWithFrame:](v3, "initWithFrame:");
    scrollToTopView = self->_scrollToTopView;
    self->_scrollToTopView = v4;

    v6 = self->_scrollToTopView;
    -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScrollToTopSceneProxyView setSceneHandle:](v6, "setSceneHandle:", v7);

    -[SBScrollToTopSceneProxyView setDelegate:](self->_scrollToTopView, "setDelegate:", self);
    objc_msgSend(v8, "addSubview:", self->_scrollToTopView);
    -[SBSpotlightMultiplexingViewController _registerStatusBarScrollToTopView](self, "_registerStatusBarScrollToTopView");

  }
}

- (void)_registerStatusBarScrollToTopView
{
  void *v3;
  id v4;

  -[SBSpotlightMultiplexingViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _registerStatusBarScrollToTopViewWithWindow:](self, "_registerStatusBarScrollToTopViewWithWindow:", v3);

}

- (void)_registerStatusBarScrollToTopViewWithWindow:(id)a3
{
  SBScrollToTopSceneProxyView *scrollToTopView;

  scrollToTopView = self->_scrollToTopView;
  if (scrollToTopView)
    objc_msgSend(a3, "_registerScrollToTopView:", scrollToTopView);
}

- (void)_unregisterStatusBarScrollToTopView
{
  void *v3;
  id v4;

  -[SBSpotlightMultiplexingViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController _unregisterStatusBarScrollToTopViewWithWindow:](self, "_unregisterStatusBarScrollToTopViewWithWindow:", v3);

}

- (void)_unregisterStatusBarScrollToTopViewWithWindow:(id)a3
{
  SBScrollToTopSceneProxyView *scrollToTopView;

  scrollToTopView = self->_scrollToTopView;
  if (scrollToTopView)
    objc_msgSend(a3, "_unregisterScrollToTopView:", scrollToTopView);
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAlphaTo:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a3;
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v5);

  if (v8)
    -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  int v9;

  v6 = a3;
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
    -[SBSpotlightMultiplexingViewController _updateStatusBarHiddenAssertion](self, "_updateStatusBarHiddenAssertion");
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;

  v6 = a3;
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
    -[SBSpotlightMultiplexingViewController _updateStatusBarStyleAssertionToStyle:animated:](self, "_updateStatusBarStyleAssertionToStyle:animated:", a4, 1);
}

- (BOOL)_isStatusBarEffectivelyHidden
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  double v7;

  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate");

    if (v5)
    {
      objc_msgSend(v3, "statusBarStateProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "statusBarHidden") & 1) != 0)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        objc_msgSend(v6, "statusBarAlpha");
        LOBYTE(v4) = v7 == 0.0;
      }

    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)_updateStatusBarHiddenAssertion
{
  unint64_t v3;
  void *v4;
  void *v5;
  SBWindowSceneStatusBarSettingsAssertion *v6;
  SBWindowSceneStatusBarSettingsAssertion *hideStatusBarAssertion;
  id v8;

  if (-[SBSpotlightMultiplexingViewController _isStatusBarEffectivelyHidden](self, "_isStatusBarEffectivelyHidden"))
  {
    v3 = -[SBSpotlightMultiplexingViewController _appStatusBarSettingsLevelForSpotlightMultiplexingLevel:](self, "_appStatusBarSettingsLevelForSpotlightMultiplexingLevel:", -[SBSpotlightMultiplexingViewController level](self, "level"));
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v8, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, v3, CFSTR("hiding for Spotlight"));
    hideStatusBarAssertion = self->_hideStatusBarAssertion;
    self->_hideStatusBarAssertion = v6;

    -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_hideStatusBarAssertion, "acquire");
  }
  else
  {
    -[SBSpotlightMultiplexingViewController _clearStatusBarHiddenAssertion](self, "_clearStatusBarHiddenAssertion");
  }
}

- (void)_clearStatusBarHiddenAssertion
{
  SBWindowSceneStatusBarSettingsAssertion *hideStatusBarAssertion;

  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_hideStatusBarAssertion, "invalidate");
  hideStatusBarAssertion = self->_hideStatusBarAssertion;
  self->_hideStatusBarAssertion = 0;

}

- (void)_updateStatusBarStyleAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "forcedStatusBarStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "integerValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  -[SBSpotlightMultiplexingViewController _updateStatusBarStyleAssertionToStyle:animated:](self, "_updateStatusBarStyleAssertionToStyle:animated:", v7, 1);

}

- (void)_updateStatusBarStyleAssertionToStyle:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  SBWindowSceneStatusBarSettingsAssertion *v11;
  SBWindowSceneStatusBarSettingsAssertion *statusBarStyleAssertion;
  SBWindowSceneStatusBarSettingsAssertion *v13;
  void *v14;
  SBMutableStatusBarSettings *v15;

  v15 = objc_alloc_init(SBMutableStatusBarSettings);
  -[SBMutableStatusBarSettings setStyle:](v15, "setStyle:", _SBStatusBarLegacyStyleFromStyle(a3));
  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", _SBStatusBarLegibilityStyleFromStyle(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setLegibilitySettings:](v15, "setLegibilitySettings:", v6);

  v7 = -[SBSpotlightMultiplexingViewController _appStatusBarSettingsLevelForSpotlightMultiplexingLevel:](self, "_appStatusBarSettingsLevelForSpotlightMultiplexingLevel:", -[SBSpotlightMultiplexingViewController level](self, "level"));
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v10, "newSettingsAssertionWithSettings:atLevel:reason:", v15, v7, CFSTR("style for Spotlight"));
  statusBarStyleAssertion = self->_statusBarStyleAssertion;
  self->_statusBarStyleAssertion = v11;

  v13 = self->_statusBarStyleAssertion;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
  -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](v13, "acquireWithAnimationParameters:", v14);

}

- (void)_clearStatusBarStyleAssertionAnimated:(BOOL)a3
{
  SBWindowSceneStatusBarSettingsAssertion *statusBarStyleAssertion;
  void *v5;
  SBWindowSceneStatusBarSettingsAssertion *v6;

  statusBarStyleAssertion = self->_statusBarStyleAssertion;
  if (a3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion invalidateWithAnimationParameters:](statusBarStyleAssertion, "invalidateWithAnimationParameters:", v5);

  }
  else
  {
    -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_statusBarStyleAssertion, "invalidate");
  }
  v6 = self->_statusBarStyleAssertion;
  self->_statusBarStyleAssertion = 0;

}

- (unint64_t)_appStatusBarSettingsLevelForSpotlightMultiplexingLevel:(unint64_t)a3
{
  if (a3 == 3)
    return 7;
  else
    return 4 * (a3 == 2);
}

- (unint64_t)remoteSearchViewPresentationSource
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightMultiplexingViewController.m"), 872, CFSTR("Subclassers must override to use"));

  return 0;
}

- (BOOL)_remoteSearchViewControllerHasKeyboardPresented
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeyboardPresented");

  return v3;
}

- (void)_configureExternalKeyboardView
{
  -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView:](self, "_configureExternalKeyboardView:", -[SBSpotlightMultiplexingViewController _remoteSearchViewControllerHasKeyboardPresented](self, "_remoteSearchViewControllerHasKeyboardPresented"));
}

- (void)_configureExternalKeyboardView:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  _BOOL8 v23;
  _QWORD v24[5];

  v3 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI");
  -[SBSpotlightMultiplexingViewController _effectiveKeyboardContentView](self, "_effectiveKeyboardContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v3;
  else
    v7 = 0;

  if (!-[SBSpotlightMultiplexingViewController wantsExternalKeyboardView](self, "wantsExternalKeyboardView"))
  {
    -[SBSpotlightMultiplexingViewController _returnKeyboardToSpotlightIfNecessary](self, "_returnKeyboardToSpotlightIfNecessary");
    -[SBSpotlightMultiplexingViewController setExternalKeyboardView:](self, "setExternalKeyboardView:", 0);
    goto LABEL_23;
  }
  -[SBSpotlightMultiplexingViewController sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController externalKeyboardView](self, "externalKeyboardView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v9, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v10 = (void *)objc_msgSend(v11, "initWithFrame:");

    -[SBSpotlightMultiplexingViewController setExternalKeyboardView:](self, "setExternalKeyboardView:", v10);
  }
  if (!-[SBSpotlightMultiplexingViewController isActiveDelegate](self, "isActiveDelegate"))
  {
    -[SBSpotlightMultiplexingViewController _returnKeyboardToSpotlightIfNecessary](self, "_returnKeyboardToSpotlightIfNecessary");
    goto LABEL_22;
  }
  if (!v5)
  {
    -[SBSpotlightMultiplexingViewController keyboardPresenter](self, "keyboardPresenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_15;
    objc_msgSend(v9, "layerManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_firstObjectPassingTest:", &__block_literal_global_146);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "uiPresentationManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createPresenterForLayerTarget:identifier:", v19, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2;
      v24[3] = &unk_1E8E9E758;
      v24[4] = self;
      objc_msgSend(v14, "modifyPresentationContext:", v24);
      -[SBSpotlightMultiplexingViewController setKeyboardPresenter:](self, "setKeyboardPresenter:", v14);
      objc_msgSend(v14, "activate");

      if (v14)
      {
LABEL_15:
        -[SBSpotlightMultiplexingViewController keyboardHostView](self, "keyboardHostView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v14, "presentationView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSpotlightMultiplexingViewController setKeyboardHostView:](self, "setKeyboardHostView:", v16);
          objc_msgSend(v10, "addSubview:", v16);

        }
      }
    }
    else
    {
      v14 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  -[SBSpotlightMultiplexingViewController hostedInputUIView](self, "hostedInputUIView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[SBSpotlightMultiplexingViewController inputUIView](self, "inputUIView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SBSpotlightMultiplexingViewController setHostedInputUIView:](self, "setHostedInputUIView:", v14);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v14, "setFrame:");
      objc_msgSend(v10, "addSubview:", v14);
    }
    goto LABEL_21;
  }
LABEL_22:

LABEL_23:
  v23 = -[SBSpotlightMultiplexingViewController externalKeyboardViewContainsKeyboard](self, "externalKeyboardViewContainsKeyboard");
  if (v7 != v23)
    -[SBSpotlightMultiplexingViewController _notifyExternalKeyboardViewContainsKeyboard:](self, "_notifyExternalKeyboardViewContainsKeyboard:", v23);
}

BOOL __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "type") - 3) < 2;
}

void __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (uint64_t *)(a1 + 32);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "hostTransformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "hostTransformer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CEA7A0]);
    }

    memset(&v14, 0, sizeof(v14));
    objc_msgSend(v7, "interfaceOrientation");
    SBFTransformFromOrientationToOrientation();
    CGAffineTransformInvert(&v14, &v13);
    v12 = v14;
    objc_msgSend(MEMORY[0x1E0CEAB90], "transformWithCGAffineTransform:", &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addTransform:reason:](v10, "addTransform:reason:", v11, CFSTR("Configure External Keyboard View"));

    objc_msgSend(v3, "setHostTransformer:", v10);
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2_cold_1(v4, v10);
  }

}

- (void)_notifyExternalKeyboardViewContainsKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SBSpotlightMultiplexingViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "spotlightMultiplexingViewController:externalKeyboardViewContainsKeyboardDidChange:", self, v3);

}

- (id)_effectiveKeyboardContentView
{
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0)
    -[SBSpotlightMultiplexingViewController hostedInputUIView](self, "hostedInputUIView");
  else
    -[SBSpotlightMultiplexingViewController keyboardHostView](self, "keyboardHostView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_returnKeyboardToSpotlightIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    -[SBSpotlightMultiplexingViewController hostedInputUIView](self, "hostedInputUIView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSpotlightMultiplexingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if (v7)
    {
      -[SBSpotlightMultiplexingViewController hostedInputUIView](self, "hostedInputUIView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    -[SBSpotlightMultiplexingViewController setHostedInputUIView:](self, "setHostedInputUIView:", 0);
    -[SBSpotlightMultiplexingViewController inputUIView](self, "inputUIView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v13 = v9;
      -[SBSpotlightMultiplexingViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v13);
      objc_msgSend(v10, "bounds");
      UIRectGetCenter();
      objc_msgSend(v13, "setCenter:");

      v9 = v13;
    }

  }
  else
  {
    -[SBSpotlightMultiplexingViewController keyboardHostView](self, "keyboardHostView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[SBSpotlightMultiplexingViewController setKeyboardHostView:](self, "setKeyboardHostView:", 0);
    -[SBSpotlightMultiplexingViewController keyboardPresenter](self, "keyboardPresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[SBSpotlightMultiplexingViewController setKeyboardPresenter:](self, "setKeyboardPresenter:", 0);
  }
}

- (void)_acquireInputUIPresentingAssertionIfNecessary
{
  void *v3;
  BSInvalidatable *v4;
  BSInvalidatable *inputUIPresenterAssertion;
  id v6;

  if (!self->_inputUIPresenterAssertion)
  {
    objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputUISceneController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addPresenter:", self);
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    inputUIPresenterAssertion = self->_inputUIPresenterAssertion;
    self->_inputUIPresenterAssertion = v4;

  }
}

- (void)_invalidateInputUIPresentingAssertion
{
  BSInvalidatable *inputUIPresenterAssertion;

  -[BSInvalidatable invalidate](self->_inputUIPresenterAssertion, "invalidate");
  inputUIPresenterAssertion = self->_inputUIPresenterAssertion;
  self->_inputUIPresenterAssertion = 0;

}

- (void)_analyticsLogSpotlightInvocationWhereAndHowWithSource:(unint64_t)a3
{
  AnalyticsSendEventLazy();
}

id __95__SBSpotlightMultiplexingViewController__analyticsLogSpotlightInvocationWhereAndHowWithSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DAA6D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DAA6D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  (*((void (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitsOrientedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightMultiplexingViewController setInputUIView:](self, "setInputUIView:", v7);

  -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
  return 0;
}

- (id)dismissScene:(id)a3
{
  void *v4;

  -[SBSpotlightMultiplexingViewController inputUIView](self, "inputUIView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[SBSpotlightMultiplexingViewController setInputUIView:](self, "setInputUIView:", 0);
  -[SBSpotlightMultiplexingViewController _configureExternalKeyboardView](self, "_configureExternalKeyboardView");
  return 0;
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputUIPresentingDelegate, a3);
}

- (BOOL)isVisibleOnScreen
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBSpotlightMultiplexingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBSpotlightMultiplexingViewControllerDelegate)delegate
{
  return (SBSpotlightMultiplexingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SPUIRemoteSearchViewDelegate)spotlightDelegate
{
  return (SPUIRemoteSearchViewDelegate *)objc_loadWeakRetained((id *)&self->_spotlightDelegate);
}

- (void)setSpotlightDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_spotlightDelegate, a3);
}

- (BOOL)wantsExternalKeyboardView
{
  return self->_wantsExternalKeyboardView;
}

- (UIView)externalKeyboardView
{
  return self->_externalKeyboardView;
}

- (void)setExternalKeyboardView:(id)a3
{
  objc_storeStrong((id *)&self->_externalKeyboardView, a3);
}

- (BOOL)isSearchContentAvailable
{
  return self->_searchContentAvailable;
}

- (void)setSearchContentAvailable:(BOOL)a3
{
  self->_searchContentAvailable = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  return (FBSDisplayConfiguration *)objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_targetDisplayConfiguration, a3);
}

- (BOOL)isActiveDelegate
{
  return self->_activeDelegate;
}

- (void)setActiveDelegate:(BOOL)a3
{
  self->_activeDelegate = a3;
}

- (SBMedusaHostedKeyboardWindowLevelAssertion)medusaHostedKeyboardWindowLevelAssertion
{
  return self->_medusaHostedKeyboardWindowLevelAssertion;
}

- (void)setMedusaHostedKeyboardWindowLevelAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowLevelAssertion, a3);
}

- (UIView)keyboardHostView
{
  return self->_keyboardHostView;
}

- (void)setKeyboardHostView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardHostView, a3);
}

- (UIView)inputUIView
{
  return self->_inputUIView;
}

- (void)setInputUIView:(id)a3
{
  objc_storeStrong((id *)&self->_inputUIView, a3);
}

- (UIView)hostedInputUIView
{
  return self->_hostedInputUIView;
}

- (void)setHostedInputUIView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedInputUIView, a3);
}

- (UIScenePresenter)keyboardPresenter
{
  return self->_keyboardPresenter;
}

- (void)setKeyboardPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPresenter, 0);
  objc_storeStrong((id *)&self->_hostedInputUIView, 0);
  objc_storeStrong((id *)&self->_inputUIView, 0);
  objc_storeStrong((id *)&self->_keyboardHostView, 0);
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowLevelAssertion, 0);
  objc_destroyWeak((id *)&self->_targetDisplayConfiguration);
  objc_storeStrong((id *)&self->_externalKeyboardView, 0);
  objc_destroyWeak((id *)&self->_spotlightDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_inputUIPresenterAssertion, 0);
  objc_destroyWeak((id *)&self->_inputUIPresentingDelegate);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_scrollToTopView, 0);
}

void __72__SBSpotlightMultiplexingViewController__configureExternalKeyboardView___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Couldn't orient external keyboard for Spotlight presentation since not in the view hierarchy yet %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
