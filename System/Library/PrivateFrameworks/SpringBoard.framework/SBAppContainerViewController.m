@implementation SBAppContainerViewController

- (SBAppContainerViewController)initWithDisplayIdentity:(id)a3
{
  SBAppContainerViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppContainerViewController;
  result = -[SBLayoutElementViewController initWithDisplayIdentity:](&v4, sel_initWithDisplayIdentity_, a3);
  if (result)
    result->_requestedDisplayMode = 4;
  return result;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppContainerViewController;
  -[SBLayoutElementViewController invalidate](&v3, sel_invalidate);
  -[SBAppContainerViewController _clearState](self, "_clearState");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppContainerViewController;
  -[SBLayoutElementViewController prepareForReuse](&v3, sel_prepareForReuse);
  -[SBAppContainerViewController _clearState](self, "_clearState");
}

- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id *p_applicationSceneHandle;
  SBApplicationSceneHandle *applicationSceneHandle;
  id v21;
  _SBAppContainerStatusBarStateProxy *v22;
  void *v23;
  _SBAppContainerStatusBarStateProxy *v24;
  _SBAppContainerStatusBarStateProxy *statusBarObserverProxy;
  _SBAppContainerStatusBarStateProxy *v26;
  id WeakRetained;
  SBApplicationSceneViewControlling *v28;
  SBApplicationSceneViewControlling *v29;
  SBApplicationSceneViewControlling *applicationSceneViewController;
  SBApplicationSceneViewControlling *v31;
  SBApplicationSceneViewControlling *v32;
  void *v33;
  SBApplicationSceneViewControlling *v34;
  void *v35;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  objc_super v54;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if ((objc_msgSend(v14, "isApplicationSceneEntity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppContainerViewController.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[workspaceEntity isApplicationSceneEntity]"));

  }
  objc_msgSend(v14, "applicationSceneEntity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sceneHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  p_applicationSceneHandle = (id *)&self->_applicationSceneHandle;
  applicationSceneHandle = self->_applicationSceneHandle;
  if (applicationSceneHandle)
  {
    -[SBApplicationSceneHandle removeObserver:](applicationSceneHandle, "removeObserver:", self);
    v21 = *p_applicationSceneHandle;
    *p_applicationSceneHandle = 0;

  }
  v54.receiver = self;
  v54.super_class = (Class)SBAppContainerViewController;
  v53 = v17;
  -[SBLayoutElementViewController configureWithWorkspaceEntity:forLayoutElement:layoutState:referenceFrame:](&v54, sel_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame_, v17, v15, v16, x, y, width, height);
  objc_storeStrong((id *)&self->_applicationSceneHandle, v18);
  objc_msgSend(*p_applicationSceneHandle, "addObserver:", self);
  -[SBDeviceApplicationSceneStatusBarStateProxy invalidate](self->_statusBarObserverProxy, "invalidate");
  v22 = [_SBAppContainerStatusBarStateProxy alloc];
  -[SBAppContainerViewController _deviceApplicationSceneHandle](self, "_deviceApplicationSceneHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBDeviceApplicationSceneStatusBarStateProxy initWithDeviceApplicationSceneHandle:](v22, "initWithDeviceApplicationSceneHandle:", v23);
  statusBarObserverProxy = self->_statusBarObserverProxy;
  self->_statusBarObserverProxy = v24;

  -[SBDeviceApplicationSceneStatusBarStateProvider_Base addStatusBarObserver:](self->_statusBarObserverProxy, "addStatusBarObserver:", self);
  -[_SBAppContainerStatusBarStateProxy setAppVCBackReference:](self->_statusBarObserverProxy, "setAppVCBackReference:", self);
  v26 = self->_statusBarObserverProxy;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  -[SBDeviceApplicationSceneStatusBarStateProvider_Base addStatusBarObserver:](v26, "addStatusBarObserver:", WeakRetained);

  -[SBAppContainerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v28 = self->_applicationSceneViewController;
  -[SBAppContainerViewController _applicationSceneViewControllerForSceneHandle:](self, "_applicationSceneViewControllerForSceneHandle:", *p_applicationSceneHandle);
  v29 = (SBApplicationSceneViewControlling *)objc_claimAutoreleasedReturnValue();
  applicationSceneViewController = self->_applicationSceneViewController;
  self->_applicationSceneViewController = v29;

  v31 = self->_applicationSceneViewController;
  v32 = v28;
  if (v28 != v31)
  {
    -[SBAppContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v28);
    v32 = self->_applicationSceneViewController;
  }
  v33 = (void *)objc_msgSend(*p_applicationSceneHandle, "newScenePlaceholderContentContextWithActivationSettings:", v14);
  -[SBApplicationSceneViewControlling setPlaceholderContentContext:](v32, "setPlaceholderContentContext:", v33);

  -[SBApplicationSceneViewControlling setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_applicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", objc_msgSend(v16, "interfaceOrientationForLayoutElement:", v15), objc_msgSend(v16, "interfaceOrientation"), width, height);
  -[SBApplicationSceneViewControlling setApplicationSceneStatusBarDelegate:](self->_applicationSceneViewController, "setApplicationSceneStatusBarDelegate:", self);
  -[SBAppContainerViewController _configureViewController:](self, "_configureViewController:", self->_applicationSceneViewController);
  if (v28 != v31)
  {
    v34 = self->_applicationSceneViewController;
    -[SBLayoutElementViewController _contentContainerView](self, "_contentContainerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppContainerViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v34, v35);

    -[SBApplicationSceneViewControlling view](self->_applicationSceneViewController, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLayoutElementViewController _contentContainerView](self, "_contentContainerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v36, "leftAnchor");
    v52 = v15;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leftAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    objc_msgSend(v36, "rightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    objc_msgSend(v36, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    objc_msgSend(v36, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    v15 = v52;
    -[SBAppContainerViewController setDisplayMode:animationFactory:completion:](self, "setDisplayMode:animationFactory:completion:", -[SBAppContainerViewController displayMode](self, "displayMode"), 0, 0);

  }
  objc_msgSend(v18, "sceneIfExists");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    -[SBAppContainerViewController _updateDisplayLayoutElementForSceneExistence:](self, "_updateDisplayLayoutElementForSceneExistence:", v50);

}

- (void)didEndTransitionToVisible:(BOOL)a3
{
  SBApplicationSceneViewControlling *applicationSceneViewController;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAppContainerViewController;
  -[SBLayoutElementViewController didEndTransitionToVisible:](&v7, sel_didEndTransitionToVisible_);
  applicationSceneViewController = self->_applicationSceneViewController;
  if (applicationSceneViewController)
  {
    if (!a3)
    {
      v6 = -[SBApplicationSceneHandle newScenePlaceholderContentContextWithActivationSettings:](self->_applicationSceneHandle, "newScenePlaceholderContentContextWithActivationSettings:", 0);
      -[SBApplicationSceneViewControlling setPlaceholderContentContext:](applicationSceneViewController, "setPlaceholderContentContext:", v6);

    }
  }
}

- (id)_newDisplayLayoutElementForEntity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "applicationSceneEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE30]), "initWithIdentifier:", v5);
  objc_msgSend(v3, "applicationSceneEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifier:", v9);

  objc_msgSend(v6, "setUIApplicationElement:", 1);
  return v6;
}

- (id)_applicationSceneViewControllerForSceneHandle:(id)a3
{
  return (id)objc_msgSend(a3, "newSceneViewController");
}

- (SBApplicationSceneHandle)sceneHandle
{
  return self->_applicationSceneHandle;
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return (SBScenePlaceholderContentContext *)-[SBApplicationSceneViewControlling placeholderContentContext](self->_applicationSceneViewController, "placeholderContentContext");
}

- (void)setPlaceholderContentContext:(id)a3
{
  -[SBApplicationSceneViewControlling setPlaceholderContentContext:](self->_applicationSceneViewController, "setPlaceholderContentContext:", a3);
}

- (UIView)customContentView
{
  return (UIView *)-[SBApplicationSceneViewControlling customContentView](self->_applicationSceneViewController, "customContentView");
}

- (void)setCustomContentView:(id)a3
{
  -[SBApplicationSceneViewControlling setCustomContentView:](self->_applicationSceneViewController, "setCustomContentView:", a3);
}

- (id)newSnapshot
{
  return (id)-[SBApplicationSceneViewControlling newSnapshot](self->_applicationSceneViewController, "newSnapshot");
}

- (id)newSnapshotView
{
  return (id)-[SBApplicationSceneViewControlling newSnapshotView](self->_applicationSceneViewController, "newSnapshotView");
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  -[SBApplicationSceneViewControlling newSnapshotViewOnQueue:withCompletion:](self->_applicationSceneViewController, "newSnapshotViewOnQueue:withCompletion:", a3, a4);
}

- (CGSize)contentReferenceSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBApplicationSceneViewControlling contentReferenceSize](self->_applicationSceneViewController, "contentReferenceSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentOrientation
{
  return -[SBApplicationSceneViewControlling contentOrientation](self->_applicationSceneViewController, "contentOrientation");
}

- (int64_t)containerOrientation
{
  return -[SBApplicationSceneViewControlling containerOrientation](self->_applicationSceneViewController, "containerOrientation");
}

- (void)setContentWrapperInterfaceOrientation:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppContainerViewController;
  -[SBLayoutElementViewController setContentWrapperInterfaceOrientation:](&v5, sel_setContentWrapperInterfaceOrientation_);
  -[SBAppContainerViewController containerContentWrapperInterfaceOrientationChangedTo:](self, "containerContentWrapperInterfaceOrientationChangedTo:", a3);
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  -[SBApplicationSceneViewControlling setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_applicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a5, a3.width, a3.height);
}

- (int64_t)displayMode
{
  return self->_requestedDisplayMode;
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  SBApplicationSceneViewControlling *applicationSceneViewController;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = v8;
  self->_requestedDisplayMode = a3;
  applicationSceneViewController = self->_applicationSceneViewController;
  if (applicationSceneViewController)
  {
    -[SBApplicationSceneViewControlling setDisplayMode:animationFactory:completion:](applicationSceneViewController, "setDisplayMode:animationFactory:completion:", -[SBAppContainerViewController displayMode](self, "displayMode"), v11, v8);
  }
  else if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
  }

}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
  -[SBApplicationSceneViewControlling containerContentWrapperInterfaceOrientationChangedTo:](self->_applicationSceneViewController, "containerContentWrapperInterfaceOrientationChangedTo:", a3);
}

- (int64_t)overrideStatusBarStyle
{
  return -[_SBAppContainerStatusBarStateProxy overrideStatusBarStyle](self->_statusBarObserverProxy, "overrideStatusBarStyle");
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
  -[SBApplicationSceneViewControlling setApplicationSceneStatusBarDelegate:](self->_applicationSceneViewController, "setApplicationSceneStatusBarDelegate:", a3);
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  return (SBApplicationSceneViewControllingStatusBarDelegate *)-[SBApplicationSceneViewControlling applicationSceneStatusBarDelegate](self->_applicationSceneViewController, "applicationSceneStatusBarDelegate");
}

- (double)statusBarAlpha
{
  double result;

  -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarAlpha](self->_statusBarObserverProxy, "statusBarAlpha");
  return result;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  -[SBAppContainerViewController _updateDisplayLayoutElementForSceneExistence:](self, "_updateDisplayLayoutElementForSceneExistence:", a4);
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v12;
  UIApplicationSceneSettingsDiffInspector *v13;
  UIApplicationSceneSettingsDiffInspector *v14;
  uint64_t v15;
  UIApplicationSceneSettingsDiffInspector *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  if (!sceneSettingsDiffInspector)
  {
    v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    v13 = self->_sceneSettingsDiffInspector;
    self->_sceneSettingsDiffInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_sceneSettingsDiffInspector;
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v19[3] = &unk_1E8EA2658;
    objc_copyWeak(&v20, &location);
    -[UIApplicationSceneSettingsDiffInspector observeIsForegroundWithBlock:](v14, "observeIsForegroundWithBlock:", v19);
    v16 = self->_sceneSettingsDiffInspector;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v17[3] = &unk_1E8EA2658;
    objc_copyWeak(&v18, &location);
    -[UIApplicationSceneSettingsDiffInspector observeUnderLockWithBlock:](v16, "observeUnderLockWithBlock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  }
  objc_msgSend(v9, "evaluateWithInspector:context:", sceneSettingsDiffInspector, 0);

}

void __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateDisplayLayoutElementVisibility");
    WeakRetained = v2;
  }

}

void __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateDisplayLayoutElementVisibility");
    WeakRetained = v2;
  }

}

- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__SBAppContainerViewController_sceneHandle_didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke;
  v7[3] = &unk_1E8EAD748;
  v8 = v5;
  v6 = v5;
  -[SBLayoutElementViewController _updateDisplayLayoutElementWithBuilder:](self, "_updateDisplayLayoutElementWithBuilder:", v7);

}

void __94__SBAppContainerViewController_sceneHandle_didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D42708];
  v4 = a2;
  objc_msgSend(v4, "setHasKeyboardFocus:", objc_msgSend(v2, "isPairedWithExternalSceneWithIdentifier:", v3));

}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__SBAppContainerViewController_sceneHandle_didUpdateContentState___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __66__SBAppContainerViewController_sceneHandle_didUpdateContentState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40) == 2)
  {
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(v1 + 1096);
    v3 = (id)objc_msgSend(*(id *)(v1 + 1080), "newScenePlaceholderContentContextWithActivationSettings:", 0);
    objc_msgSend(v2, "setPlaceholderContentContext:", v3);

  }
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescriberProviding
{
  return 1;
}

- (void)setStatusBarDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_statusBarDelegate, obj);
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base removeStatusBarObserver:](self->_statusBarObserverProxy, "removeStatusBarObserver:", WeakRetained);
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base addStatusBarObserver:](self->_statusBarObserverProxy, "addStatusBarObserver:", obj);
  }

}

- (id)_deviceApplicationSceneHandle
{
  uint64_t v3;

  v3 = objc_opt_class();
  return SBSafeCast(v3, self->_applicationSceneHandle);
}

- (int64_t)_overrideStatusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  return 0;
}

- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4
{
  _SBAppContainerStatusBarStateProxy *v5;
  _SBAppContainerStatusBarStateProxy *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v5 = self->_statusBarObserverProxy;
  v6 = v5;
  if (v5)
  {
    v7 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarOrientation](v5, "statusBarOrientation");
    if (v7)
    {
      v8 = v7;
      -[SBAppContainerViewController _deviceApplicationSceneHandle](self, "_deviceApplicationSceneHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "wantsDeviceOrientationEventsEnabled");

      if (v10)
        -[SBAppContainerViewController setContentWrapperInterfaceOrientation:](self, "setContentWrapperInterfaceOrientation:", v8);
    }
  }

}

- (void)applicationSceneViewController:(id)a3 didUpdateStatusBarSettings:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  SBLogAppStatusBars();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBAppContainerViewController applicationSceneViewController:didUpdateStatusBarSettings:].cold.1((uint64_t)self, (uint64_t)v5, v6);

  -[SBDeviceApplicationSceneStatusBarStateProxy invalidateStatusBarSettings](self->_statusBarObserverProxy, "invalidateStatusBarSettings");
}

- (void)_clearState
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  SBApplicationSceneViewControlling *applicationSceneViewController;
  SBApplicationSceneHandle *applicationSceneHandle;
  SBApplicationSceneHandle *v7;
  _SBAppContainerStatusBarStateProxy *statusBarObserverProxy;
  _SBAppContainerStatusBarStateProxy *v9;

  self->_requestedDisplayMode = 4;
  sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  if (sceneSettingsDiffInspector)
  {
    -[UIApplicationSceneSettingsDiffInspector removeAllObservers](sceneSettingsDiffInspector, "removeAllObservers");
    v4 = self->_sceneSettingsDiffInspector;
    self->_sceneSettingsDiffInspector = 0;

  }
  if (self->_applicationSceneViewController)
  {
    -[SBAppContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    applicationSceneViewController = self->_applicationSceneViewController;
    self->_applicationSceneViewController = 0;

  }
  applicationSceneHandle = self->_applicationSceneHandle;
  if (applicationSceneHandle)
  {
    -[SBApplicationSceneHandle removeObserver:](applicationSceneHandle, "removeObserver:", self);
    v7 = self->_applicationSceneHandle;
    self->_applicationSceneHandle = 0;

  }
  statusBarObserverProxy = self->_statusBarObserverProxy;
  if (statusBarObserverProxy)
  {
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base removeStatusBarObserver:](statusBarObserverProxy, "removeStatusBarObserver:", self);
    -[SBDeviceApplicationSceneStatusBarStateProxy invalidate](self->_statusBarObserverProxy, "invalidate");
    v9 = self->_statusBarObserverProxy;
    self->_statusBarObserverProxy = 0;

  }
}

- (void)_updateDisplayLayoutElementForSceneExistence:(id)a3
{
  _QWORD v4[5];

  if (objc_msgSend(a3, "isValid"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__SBAppContainerViewController__updateDisplayLayoutElementForSceneExistence___block_invoke;
    v4[3] = &unk_1E8EAD748;
    v4[4] = self;
    -[SBLayoutElementViewController _updateDisplayLayoutElementWithBuilder:](self, "_updateDisplayLayoutElementWithBuilder:", v4);
  }
}

void __77__SBAppContainerViewController__updateDisplayLayoutElementForSceneExistence___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sceneHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasKeyboardFocus:", objc_msgSend(v4, "isPairedWithExternalSceneWithIdentifier:", *MEMORY[0x1E0D42708]));

}

- (SBApplicationSceneViewControlling)_applicationSceneViewController
{
  return self->_applicationSceneViewController;
}

- (SBApplicationSceneStatusBarDescribing)statusBarDescriber
{
  return (SBApplicationSceneStatusBarDescribing *)self->_statusBarObserverProxy;
}

- (SBDeviceApplicationSceneStatusBarStateObserver)statusBarDelegate
{
  return (SBDeviceApplicationSceneStatusBarStateObserver *)objc_loadWeakRetained((id *)&self->_statusBarDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_storeStrong((id *)&self->_statusBarObserverProxy, 0);
  objc_storeStrong((id *)&self->_applicationSceneViewController, 0);
  objc_storeStrong((id *)&self->_sceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_applicationSceneHandle, 0);
}

- (void)applicationSceneViewController:(NSObject *)a3 didUpdateStatusBarSettings:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 1080), "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = (id)objc_opt_class();
  v11 = 2112;
  v12 = a2;
  v6 = v10;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "(%@) %@ applying settings: %@", (uint8_t *)&v7, 0x20u);

}

@end
