@implementation SBDeviceApplicationAppClipOverlayViewProvider

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](self->_sceneSettingsDiffInspector, "inspectDiff:withContext:", a4, 0, a5);
}

- (void)_activateIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  SBAppClipOverlayViewController *v9;
  void *v10;
  SBAppClipOverlayViewController *v11;
  SBAppClipOverlayViewController *appClipViewController;
  objc_super v13;

  if (!self->_appClipViewController)
  {
    -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAppClip");

    if (v6)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sceneIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = [SBAppClipOverlayViewController alloc];
      objc_msgSend((id)SBApp, "appClipOverlayCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SBAppClipOverlayViewController initWithCoordinator:bundleIdentifier:sceneIdentifier:](v9, "initWithCoordinator:bundleIdentifier:sceneIdentifier:", v10, v7, v8);
      appClipViewController = self->_appClipViewController;
      self->_appClipViewController = v11;

      -[SBAppClipOverlayViewController setDisplayedOverPlaceholder:animated:](self->_appClipViewController, "setDisplayedOverPlaceholder:animated:", 0, 0);
      -[SBDeviceApplicationAppClipOverlayViewProvider _updateOverlaySceneActivationState](self, "_updateOverlaySceneActivationState");
      v13.receiver = self;
      v13.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
      -[SBDeviceApplicationSceneOverlayViewProvider _activateIfPossible](&v13, sel__activateIfPossible);

    }
  }
}

- (SBDeviceApplicationAppClipOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SBDeviceApplicationAppClipOverlayViewProvider *v8;
  UIApplicationSceneSettingsDiffInspector *v9;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
  v8 = -[SBDeviceApplicationSceneOverlayViewProvider initWithSceneHandle:delegate:](&v16, sel_initWithSceneHandle_delegate_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "addObserver:", v8);
    v9 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    sceneSettingsDiffInspector = v8->_sceneSettingsDiffInspector;
    v8->_sceneSettingsDiffInspector = v9;

    objc_initWeak(&location, v8);
    v11 = v8->_sceneSettingsDiffInspector;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__SBDeviceApplicationAppClipOverlayViewProvider_initWithSceneHandle_delegate___block_invoke;
    v13[3] = &unk_1E8EA2658;
    objc_copyWeak(&v14, &location);
    -[UIApplicationSceneSettingsDiffInspector observeDeactivationReasonsWithBlock:](v11, "observeDeactivationReasonsWithBlock:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __78__SBDeviceApplicationAppClipOverlayViewProvider_initWithSceneHandle_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateOverlaySceneActivationState");

}

- (void)_updateOverlaySceneActivationState
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  id v10;

  if (self->_appClipViewController)
  {
    -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "settings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isForeground");

      objc_msgSend(v4, "settings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isUISubclass"))
        v8 = (objc_msgSend(v7, "deactivationReasons") & 0xFFFFFFFFFFFFFEFFLL) != 0;
      else
        v8 = 0;
      if (v6)
        v9 = v8;
      else
        v9 = 2;
      -[SBAppClipOverlayViewController setSceneActivationState:animated:](self->_appClipViewController, "setSceneActivationState:animated:", v9, 1);

    }
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider dealloc](&v4, sel_dealloc);
}

- (BOOL)wantsResignActiveAssertion
{
  return 0;
}

- (void)_deactivateIfPossible
{
  SBAppClipOverlayViewController *appClipViewController;
  objc_super v4;

  appClipViewController = self->_appClipViewController;
  if (appClipViewController)
  {
    self->_appClipViewController = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider _deactivateIfPossible](&v4, sel__deactivateIfPossible);
}

- (id)_realOverlayViewController
{
  return self->_appClipViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appClipViewController, 0);
}

@end
