@implementation SBFullScreenAlwaysLiveLiveContentOverlay

- (SBFullScreenAlwaysLiveLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 containerOrientation:(int64_t)a5
{
  double height;
  double width;
  id v10;
  SBFullScreenAlwaysLiveLiveContentOverlay *v11;
  SBFullScreenAlwaysLiveLiveContentOverlay *v12;
  uint64_t containerOrientation;
  SBDeviceApplicationSceneView *v14;
  SBDeviceApplicationSceneView *sceneView;
  void *v16;
  int HaveTransparentBackground;
  void *v18;
  id v19;
  uint64_t v20;
  BSUIOrientationTransformWrapperView *transformWrapperView;
  objc_super v23;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBFullScreenAlwaysLiveLiveContentOverlay;
  v11 = -[SBFullScreenAlwaysLiveLiveContentOverlay init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_containerOrientation = a5;
    objc_storeStrong((id *)&v11->_sceneHandle, a3);
    if (-[SBDeviceApplicationSceneHandle _supportsMixedOrientation](v12->_sceneHandle, "_supportsMixedOrientation"))
      containerOrientation = v12->_containerOrientation;
    else
      containerOrientation = -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](v12->_sceneHandle, "currentInterfaceOrientation");
    v14 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:]([SBDeviceApplicationSceneView alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v10, containerOrientation, a5, v12, width, height);
    sceneView = v12->_sceneView;
    v12->_sceneView = v14;

    -[SBSceneView sceneHandle](v12->_sceneView, "sceneHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HaveTransparentBackground = SBApplicationMightHaveTransparentBackground(v16);

    if (HaveTransparentBackground)
    {
      -[SBSceneView backgroundView](v12->_sceneView, "backgroundView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "setFullscreen:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "setTransformOptions:", objc_msgSend(v18, "transformOptions") | 2);

    }
    -[SBSceneView setDisplayMode:animationFactory:completion:](v12->_sceneView, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
    v19 = objc_alloc(MEMORY[0x1E0D01940]);
    BSRectWithSize();
    v20 = objc_msgSend(v19, "initWithFrame:");
    transformWrapperView = v12->_transformWrapperView;
    v12->_transformWrapperView = (BSUIOrientationTransformWrapperView *)v20;

    -[BSUIOrientationTransformWrapperView setContentOrientation:](v12->_transformWrapperView, "setContentOrientation:", containerOrientation);
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](v12->_transformWrapperView, "setContainerOrientation:", a5);
    -[BSUIOrientationTransformWrapperView addContentView:](v12->_transformWrapperView, "addContentView:", v12->_sceneView);
    -[SBDeviceApplicationSceneHandle addObserver:](v12->_sceneHandle, "addObserver:", v12);
  }

  return v12;
}

- (int64_t)overlayType
{
  return 3;
}

- (void)invalidate
{
  -[SBDeviceApplicationSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  -[SBDeviceApplicationSceneView invalidate](self->_sceneView, "invalidate");
  -[UIApplicationSceneSettingsDiffInspector removeAllObservers](self->_sceneSettingsInspector, "removeAllObservers");
}

- (id)contentViewController
{
  return 0;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return self->_sceneHandle;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInspector;
  UIApplicationSceneSettingsDiffInspector *v12;
  UIApplicationSceneSettingsDiffInspector *v13;
  UIApplicationSceneSettingsDiffInspector *v14;
  _QWORD v15[5];
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sceneSettingsInspector = self->_sceneSettingsInspector;
  if (!sceneSettingsInspector)
  {
    v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    v13 = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_sceneSettingsInspector;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__SBFullScreenAlwaysLiveLiveContentOverlay_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v15[3] = &unk_1E8EA7460;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](v14, "observeInterfaceOrientationWithBlock:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    sceneSettingsInspector = self->_sceneSettingsInspector;
  }
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](sceneSettingsInspector, "inspectDiff:withContext:", v9, 0);

}

void __99__SBFullScreenAlwaysLiveLiveContentOverlay_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setContentOrientation:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentInterfaceOrientation"));
    WeakRetained = v3;
  }

}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return CFSTR("SBFullScreenAlwaysLiveLiveContentOverlay");
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return -5;
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_transformWrapperView;
}

- (void)setContainerOrientation:(int64_t)a3
{
  self->_containerOrientation = a3;
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_transformWrapperView, "setContainerOrientation:");
}

- (int64_t)leadingStatusBarStyle
{
  return 0;
}

- (int64_t)trailingStatusBarStyle
{
  return 0;
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (double)currentStatusBarHeight
{
  return *MEMORY[0x1E0CEBBE0];
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (void)setOccluded:(BOOL)a3
{
  -[SBDeviceApplicationSceneHandle setOccluded:](self->_sceneHandle, "setOccluded:", a3);
}

- (void)setUsesBrightSceneViewBackgroundMaterial:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSceneView backgroundView](self->_sceneView, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setShouldUseBrightMaterial:", v3);

}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  if (self->_wantsEnhancedWindowingEnabled != a3)
  {
    self->_wantsEnhancedWindowingEnabled = a3;
    -[SBDeviceApplicationSceneHandle setWantsEnhancedWindowingEnabled:](self->_sceneHandle, "setWantsEnhancedWindowingEnabled:");
  }
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[SBDeviceApplicationSceneHandle supportedInterfaceOrientations](self->_sceneHandle, "supportedInterfaceOrientations");
}

- (int64_t)preferredInterfaceOrientation
{
  return -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self->_sceneHandle, "currentInterfaceOrientation");
}

- (int64_t)touchBehavior
{
  return 2;
}

- (id)liveSceneIdentityToken
{
  void *v2;
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isActive"))
  {
    objc_msgSend(v2, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isForeground"))
    {
      objc_msgSend(v2, "identityToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDisplayLayoutElementActive
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

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_transformWrapperView, 0);
}

@end
