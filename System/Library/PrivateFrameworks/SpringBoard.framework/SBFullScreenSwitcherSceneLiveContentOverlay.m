@implementation SBFullScreenSwitcherSceneLiveContentOverlay

- (double)currentStatusBarHeight
{
  double result;

  -[SBDeviceApplicationSceneViewControlling currentStatusBarHeight](self->_deviceApplicationSceneViewController, "currentStatusBarHeight");
  return result;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_wantsEnhancedWindowingEnabled != a3)
  {
    v3 = a3;
    self->_wantsEnhancedWindowingEnabled = a3;
    -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWantsEnhancedWindowingEnabled:", v3);

  }
}

- (void)setResizesHostedContext:(BOOL)a3
{
  -[SBDeviceApplicationSceneViewControlling setSceneResizesHostedContext:](self->_deviceApplicationSceneViewController, "setSceneResizesHostedContext:", a3);
}

- (void)setAsyncRenderingEnabled:(BOOL)a3 withMinificationFilterEnabled:(BOOL)a4
{
  if (self->_asyncRenderingEnabled != a3 || self->_wantsMinificationFilter != a4)
  {
    self->_asyncRenderingEnabled = a3;
    self->_wantsMinificationFilter = a4;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateAsyncRendering](self, "_updateAsyncRendering");
  }
}

- (void)setMatchMovedToScene:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_matchMovedToScene != a3)
  {
    v3 = a3;
    self->_matchMovedToScene = a3;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "_beginRequiringSceneViewMatchMoveAnimationForReason:", CFSTR("switcher"));
    else
      objc_msgSend(v4, "_endRequiringSceneViewMatchMoveAnimationForReason:", CFSTR("switcher"));

  }
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v14 = a8;
  v15 = a7;
  -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLiveContentBlurEnabled:duration:blurDelay:iconViewScale:began:completion:", v12, v15, v14, a4, a5, a6);

}

- (void)_updateOrientationWrapper
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t containerOrientation;
  uint64_t v11;
  unint64_t v12;
  void (**v13)(_QWORD);
  _QWORD v14[6];

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4
    || (objc_msgSend(v5, "sb_displayIdentityForSceneManagers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBDeviceApplicationSceneViewControlling _fbsDisplayIdentity](self->_deviceApplicationSceneViewController, "_fbsDisplayIdentity"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v7, "isEqual:", v8), v8, v7, v9))
  {
    if (objc_msgSend(v3, "_supportsMixedOrientation"))
    {
      containerOrientation = self->_containerOrientation;
    }
    else
    {
      v11 = objc_msgSend(v6, "interfaceOrientation");
      v12 = -[SBDeviceApplicationSceneViewControlling contentOrientation](self->_deviceApplicationSceneViewController, "contentOrientation");
      if (v12 <= 1)
        containerOrientation = 1;
      else
        containerOrientation = v12;
      if (v11)
        containerOrientation = v11;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__SBFullScreenSwitcherSceneLiveContentOverlay__updateOrientationWrapper__block_invoke;
    v14[3] = &unk_1E8E9DE88;
    v14[4] = self;
    v14[5] = containerOrientation;
    v13 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v14);
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInRetargetableAnimationBlock"))
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v13);
    }
    else if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
    }
    else
    {
      v13[2](v13);
    }

  }
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  return -[SBDeviceApplicationSceneViewControlling bestHomeAffordanceOrientationForOrientation:](self->_deviceApplicationSceneViewController, "bestHomeAffordanceOrientationForOrientation:", a3);
}

uint64_t __72__SBFullScreenSwitcherSceneLiveContentOverlay__updateOrientationWrapper__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setContentOrientation:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setContainerOrientation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  SBDeviceApplicationSceneViewControlling *deviceApplicationSceneViewController;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  v7 = a3;
  -[SBDeviceApplicationSceneViewControlling sceneHandle](deviceApplicationSceneViewController, "sceneHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateOrientationWrapper](self, "_updateOrientationWrapper");
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateAsyncRendering](self, "_updateAsyncRendering");
    objc_msgSend(v12, "layerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
      -[SBFullScreenSwitcherSceneLiveContentOverlay _updateTouchBehaviorForScene:](self, "_updateTouchBehaviorForScene:", v12);
    else
      objc_msgSend(v9, "addObserver:", self);

  }
}

- (void)_updateAsyncRendering
{
  _BOOL8 v3;
  uint64_t v4;

  v3 = self->_asyncRenderingEnabled
    && !self->_asynchronousRenderingTemporarilyDisabled
    && !self->_asyncRenderingDisabled;
  -[SBDeviceApplicationSceneViewControlling setSceneRendersAsynchronously:](self->_deviceApplicationSceneViewController, "setSceneRendersAsynchronously:", v3);
  if (v3)
    v4 = *MEMORY[0x1E0CD2B98];
  else
    v4 = 0;
  -[SBDeviceApplicationSceneViewControlling setSceneMinificationFilter:](self->_deviceApplicationSceneViewController, "setSceneMinificationFilter:", v4);
}

- (void)setTouchBehavior:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_touchBehavior != a3)
  {
    self->_touchBehavior = a3;
    -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateTouchBehaviorForScene:](self, "_updateTouchBehaviorForScene:", v4);

  }
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  id v4;

  objc_msgSend(a3, "scene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFullScreenSwitcherSceneLiveContentOverlay _updateTouchBehaviorForScene:](self, "_updateTouchBehaviorForScene:", v4);

}

- (void)_updateTouchBehaviorForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "layerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 && objc_msgSend(v6, "count"))
  {
    v22 = v5;
    v8 = objc_alloc(MEMORY[0x1E0D00DC8]);
    v23 = v4;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithIdentifier:touchBehavior:", v9, self->_touchBehavior);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_backboardSceneHostRegistrations, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "updateSettings:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D00E18], "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "registerSceneHostSettings:forCAContextID:", v10, objc_msgSend(v16, "contextID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary setObject:forKey:](self->_backboardSceneHostRegistrations, "setObject:forKey:", v20, v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v5 = v22;
    v4 = v23;
    v7 = v21;
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView
{
  void *v3;

  -[SBFullScreenSwitcherSceneLiveContentOverlay delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveContentOverlayDidUpdateHomeAffordanceEdgeProtectOrAutoHide:", self);

  -[SBFullScreenSwitcherSceneLiveContentOverlay _updateTopAffordanceAutoHide](self, "_updateTopAffordanceAutoHide");
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  SBDeviceApplicationSceneViewControlling *deviceApplicationSceneViewController;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v25;
  SBDeviceApplicationSceneViewControlling *v26;
  id v27;
  void *v28;
  SBSDisplayLayoutElement *v29;
  SBSDisplayLayoutElement *displayLayoutElement;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  int HaveTransparentBackground;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  int64_t v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v53 = a3;
  objc_msgSend(v53, "deviceApplicationSceneEntity");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sceneHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  v23 = v22 & 0xFFFFFFFFFFFFFFFBLL;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (!deviceApplicationSceneViewController)
  {
    objc_msgSend(v20, "addObserver:", self);
    if (v23 == 1)
    {
      v25 = -[SBMedusaDecoratedDeviceApplicationSceneViewController initWithDeviceApplicationSceneHandle:layoutRole:]([SBMedusaDecoratedDeviceApplicationSceneViewController alloc], "initWithDeviceApplicationSceneHandle:layoutRole:", v20, objc_msgSend(v53, "layoutRole"));
      -[SBMedusaDecoratedDeviceApplicationSceneViewController setDelegate:](v25, "setDelegate:", self);
      -[SBMedusaDecoratedDeviceApplicationSceneViewController setNubViewHidden:](v25, "setNubViewHidden:", 0);
    }
    else
    {
      v25 = -[SBDeviceApplicationSceneViewController initWithSceneHandle:]([SBDeviceApplicationSceneViewController alloc], "initWithSceneHandle:", v20);
      -[SBMedusaDecoratedDeviceApplicationSceneViewController setShouldDrawStatusBarInsideSceneView:](v25, "setShouldDrawStatusBarInsideSceneView:", 1);
      -[SBMedusaDecoratedDeviceApplicationSceneViewController setDelegate:](v25, "setDelegate:", self);
    }
    v26 = self->_deviceApplicationSceneViewController;
    self->_deviceApplicationSceneViewController = (SBDeviceApplicationSceneViewControlling *)v25;

    -[SBDeviceApplicationSceneViewControlling setDisplayMode:animationFactory:completion:](self->_deviceApplicationSceneViewController, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
    v27 = objc_alloc(MEMORY[0x1E0DAAE30]);
    objc_msgSend(v20, "sceneIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (SBSDisplayLayoutElement *)objc_msgSend(v27, "initWithIdentifier:", v28);
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = v29;

    deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  }
  -[SBDeviceApplicationSceneViewControlling setHomeGrabberDisplayMode:](deviceApplicationSceneViewController, "setHomeGrabberDisplayMode:", 1, a10, a7, a9);
  v31 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:]([SBMutableDeviceApplicationScenePlaceholderContentContext alloc], "initWithActivationSettings:", v53);
  -[SBDeviceApplicationScenePlaceholderContentContext setLayoutEnvironment:](v31, "setLayoutEnvironment:", 1);
  -[SBDeviceApplicationScenePlaceholderContentContext setHasOrientationMismatchForClassicApp:](v31, "setHasOrientationMismatchForClassicApp:", a11);
  -[SBDeviceApplicationScenePlaceholderContentContext setSizingPolicy:](v31, "setSizingPolicy:", a12);
  -[SBDeviceApplicationSceneViewControlling setPlaceholderContentContext:](self->_deviceApplicationSceneViewController, "setPlaceholderContentContext:", v31);
  if (v23 == 1)
  {
    v32 = objc_opt_class();
    SBSafeCast(v32, self->_deviceApplicationSceneViewController);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLayoutRole:spaceConfiguration:floatingConfiguration:sizingPolicy:", v49, v51, v47, a12);

  }
  -[SBDeviceApplicationSceneViewControlling setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceApplicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a5, a6, width, height);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __250__SBFullScreenSwitcherSceneLiveContentOverlay_configureWithWorkspaceEntity_referenceFrame_contentOrientation_containerOrientation_layoutRole_sbsDisplayLayoutRole_spaceConfiguration_floatingConfiguration_hasClassicAppOrientationMismatch_sizingPolicy___block_invoke;
  v54[3] = &unk_1E8EA73B0;
  v34 = v20;
  v55 = v34;
  v56 = a8;
  v57 = x;
  v58 = y;
  v59 = width;
  v60 = height;
  -[SBFullScreenSwitcherSceneLiveContentOverlay updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v54);
  -[SBFullScreenSwitcherSceneLiveContentOverlay _updateDisplayLayoutElementActive](self, "_updateDisplayLayoutElementActive");
  -[SBDeviceApplicationSceneViewControlling setDisplayMode:animationFactory:completion:](self->_deviceApplicationSceneViewController, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  HaveTransparentBackground = SBApplicationMightHaveTransparentBackground(v35);

  if (HaveTransparentBackground)
  {
    -[SBDeviceApplicationSceneViewControlling backgroundView](self->_deviceApplicationSceneViewController, "backgroundView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v37, "setFullscreen:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v37, "setTransformOptions:", objc_msgSend(v37, "transformOptions") | 2);

  }
  -[SBFullScreenSwitcherSceneLiveContentOverlay _updateTopAffordanceAutoHide](self, "_updateTopAffordanceAutoHide");
  -[SBFullScreenSwitcherSceneLiveContentOverlay _updateOrientationWrapper](self, "_updateOrientationWrapper");
  objc_msgSend((id)SBApp, "windowSceneManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "windowSceneForSceneHandle:", v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "switcherController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "traitsParticipantForSceneHandle:", v34);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDeviceApplicationSceneViewControlling containerDidUpdateTraitsParticipant:](self->_deviceApplicationSceneViewController, "containerDidUpdateTraitsParticipant:", v41);
  objc_msgSend(v34, "sceneIfExists");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layerManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v42)
  {
    objc_msgSend(v43, "layers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    if (!v46)
      objc_msgSend(v44, "addObserver:", self);
  }

}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
  SBDeviceApplicationSceneViewControlling *deviceApplicationSceneViewController;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  char v11;

  if (a3)
  {
    deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
    v5 = a3;
    -[SBDeviceApplicationSceneViewControlling sceneHandle](deviceApplicationSceneViewController, "sceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);

  }
  else
  {
    v8 = 0;
  }
  -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNubViewHighlighted:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__SBFullScreenSwitcherSceneLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke;
  v10[3] = &__block_descriptor_33_e33_v16__0__SBSDisplayLayoutElement_8l;
  v11 = v8;
  -[SBFullScreenSwitcherSceneLiveContentOverlay updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v10);
}

- (void)setBlurViewIconScale:(double)a3
{
  id v4;

  -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlurViewIconScale:", a3);

}

- (id)_medusaDecoratedDeviceApplicationSceneViewController
{
  uint64_t v3;

  v3 = objc_opt_class();
  return SBSafeCast(v3, self->_deviceApplicationSceneViewController);
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void (**v5)(id, SBSDisplayLayoutElement *);
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v19;
  BSInvalidatable *v20;
  void (*v21)(void);

  if (self->_displayLayoutElementAssertion)
  {
    v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayLayoutPublisher");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      SBLogAppSwitcher();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SBFullScreenSwitcherSceneLiveContentOverlay updateDisplayLayoutElementWithBuilder:].cold.1((uint64_t)self);

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sceneIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenSwitcherLiveContentOverlayCoordinator.m"), 1696, CFSTR("No publisher - %@ sceneID: %@ displayIdentity: %@"), v10, v12, v14);

    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionAssertionWithReason:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    objc_msgSend(v7, "addElement:", self->_displayLayoutElement);
    v19 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v20 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v19;

    objc_msgSend(v17, "invalidate");
  }
  else
  {
    v21 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v21();
  }

}

uint64_t __83__SBFullScreenSwitcherSceneLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasKeyboardFocus:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateDisplayLayoutElementActive
{
  void *v1;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_3_4(v3);
  objc_msgSend(v1, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_7(&dword_1D0540000, v9, v10, "Trying to activate a display layout element for %{public}@ but we can't find the publisher - sceneID: %{public}@ displayIdentity: %{public}@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_6();
}

- (id)_sbWindowScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __250__SBFullScreenSwitcherSceneLiveContentOverlay_configureWithWorkspaceEntity_referenceFrame_contentOrientation_containerOrientation_layoutRole_sbsDisplayLayoutRole_spaceConfiguration_floatingConfiguration_hasClassicAppOrientationMismatch_sizingPolicy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifier:", v5);

  objc_msgSend(v6, "setLayoutRole:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setLevel:", 1);
  objc_msgSend(v6, "setUIApplicationElement:", 1);
  objc_msgSend(v6, "setHasKeyboardFocus:", objc_msgSend(*(id *)(a1 + 32), "isPairedWithExternalSceneWithIdentifier:", *MEMORY[0x1E0D42708]));
  objc_msgSend(v6, "setReferenceFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView");

}

void __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView");

}

- (void)_updateTopAffordanceAutoHide
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = objc_opt_class();
  SBSafeCast(v3, self->_deviceApplicationSceneViewController);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAutoHideEnabledForHomeAffordance");

  objc_msgSend(v6, "_setTopAffordanceAutoHides:", v5);
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *v14;
  uint64_t v15;
  UIApplicationSceneClientSettingsDiffInspector *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v13 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_clientSettingsInspector;
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v19[3] = &unk_1E8EA2658;
    objc_copyWeak(&v20, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeScreenEdgesDeferringSystemGesturesWithBlock:](v14, "observeScreenEdgesDeferringSystemGesturesWithBlock:", v19);
    v16 = self->_clientSettingsInspector;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v17[3] = &unk_1E8EA2658;
    objc_copyWeak(&v18, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeHomeIndicatorAutoHiddenWithBlock:](v16, "observeHomeIndicatorAutoHiddenWithBlock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](clientSettingsInspector, "inspectDiff:withContext:", v9, v10);

}

void __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  if (v3)
  {
    objc_msgSend(v3, "setStatusBarHidden:", *(unsigned __int8 *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setNubViewHidden:", BSSettingFlagIfYes());
  }
  else
  {
    v4 = objc_msgSend(*(id *)(v2 + 72), "SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding");
    v5 = *(unsigned __int8 *)(a1 + 40);
    if (v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "statusBarAssertionWithStatusBarHidden:nubViewHidden:atLevel:", v5 != 0, BSSettingFlagIfYes(), 4);
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "statusBarAssertionWithStatusBarHidden:atLevel:", v5 != 0, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 80);
    *(_QWORD *)(v7 + 80) = v6;

  }
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  -[SBDeviceApplicationSceneViewControlling willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:](self->_deviceApplicationSceneViewController, "willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:", a3, a4, a5, a6);
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  -[SBDeviceApplicationSceneViewControlling didRotateFromInterfaceOrientation:toInterfaceOrientation:](self->_deviceApplicationSceneViewController, "didRotateFromInterfaceOrientation:toInterfaceOrientation:", a3, a4);
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  if (self->_displayLayoutElementActive != a3)
  {
    self->_displayLayoutElementActive = a3;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateDisplayLayoutElementActive](self, "_updateDisplayLayoutElementActive");
  }
}

- (SBDeviceApplicationSceneViewControlling)deviceApplicationSceneViewController
{
  return self->_deviceApplicationSceneViewController;
}

- (void)setStatusBarActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarActionDelegate, a3);
}

- (BSUIOrientationTransformWrapperView)orientationWrapperView
{
  return self->_orientationWrapperView;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->_asyncRenderingEnabled;
}

- (SBFullScreenSwitcherSceneLiveContentOverlay)init
{
  SBFullScreenSwitcherSceneLiveContentOverlay *v2;
  BSUIOrientationTransformWrapperView *v3;
  BSUIOrientationTransformWrapperView *orientationWrapperView;
  uint64_t v5;
  NSMutableDictionary *backboardSceneHostRegistrations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenSwitcherSceneLiveContentOverlay;
  v2 = -[SBFullScreenSwitcherSceneLiveContentOverlay init](&v8, sel_init);
  if (v2)
  {
    v3 = (BSUIOrientationTransformWrapperView *)objc_alloc_init(MEMORY[0x1E0D01940]);
    orientationWrapperView = v2->_orientationWrapperView;
    v2->_orientationWrapperView = v3;

    v5 = objc_opt_new();
    backboardSceneHostRegistrations = v2->_backboardSceneHostRegistrations;
    v2->_backboardSceneHostRegistrations = (NSMutableDictionary *)v5;

    v2->_touchBehavior = 2;
  }
  return v2;
}

- (void)setStatusBarHidden:(BOOL)a3 nubViewHidden:(BOOL)a4 animator:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, uint64_t, _QWORD);
  SBSceneViewStatusBarAssertion *statusBarAssertion;
  uint64_t v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  _QWORD v14[6];
  char v15;
  _QWORD v16[6];
  char v17;
  _QWORD v18[5];
  BOOL v19;
  BOOL v20;

  v5 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (a3 || v5)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke;
    v18[3] = &unk_1E8EA1C70;
    v18[4] = self;
    v19 = a3;
    v20 = v5;
    v13 = MEMORY[0x1D17E5550](v18);
    v11 = (void (**)(_QWORD))v13;
    if (v8)
      v8[2](v8, v13, 0);
    else
      (*(void (**)(uint64_t))(v13 + 16))(v13);
LABEL_13:

    goto LABEL_14;
  }
  statusBarAssertion = self->_statusBarAssertion;
  if (statusBarAssertion
    && (-[SBSceneViewStatusBarAssertion isStatusBarHidden](statusBarAssertion, "isStatusBarHidden")
     || -[SBSceneViewStatusBarAssertion nubViewHidden](self->_statusBarAssertion, "nubViewHidden") != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_2;
    v16[3] = &unk_1E8EA5AD8;
    v17 = 0;
    v16[4] = self;
    v16[5] = 0x7FFFFFFFFFFFFFFFLL;
    v11 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v16);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_3;
    v14[3] = &unk_1E8EA7418;
    v15 = 0;
    v14[4] = self;
    v14[5] = 0x7FFFFFFFFFFFFFFFLL;
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v14);
    if (v8)
    {
      v8[2](v8, (uint64_t)v11, v12);
    }
    else
    {
      v11[2](v11);
      v12[2](v12, 1, 0);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (id)contentViewController
{
  return self->_deviceApplicationSceneViewController;
}

void __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  void *v5;

  if ((a3 & 1) == 0
    && *(unsigned __int8 *)(a1 + 48) == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isStatusBarHidden")&& objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "nubViewHidden") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

  }
}

- (int64_t)overlayType
{
  return 1;
}

- (void)setContentReferenceSize:(CGSize)a3 interfaceOrientation:(int64_t)a4
{
  -[SBDeviceApplicationSceneViewControlling setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceApplicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, self->_containerOrientation, a3.width, a3.height);
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateOrientationWrapper](self, "_updateOrientationWrapper");
  }
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_orientationWrapperView;
}

uint64_t __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setStatusBarHidden:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setNubViewHidden:", *(_QWORD *)(a1 + 40));
}

- (void)setAsyncRenderingDisabled:(BOOL)a3
{
  if (self->_asyncRenderingDisabled != a3)
  {
    self->_asyncRenderingDisabled = a3;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateAsyncRendering](self, "_updateAsyncRendering");
  }
}

- (id)liveSceneIdentityToken
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isActive"))
  {
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isForeground"))
    {
      objc_msgSend(v3, "identityToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SBFullScreenSwitcherSceneLiveContentOverlay invalidate](self, "invalidate");
  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[SBDeviceApplicationSceneViewControlling invalidate](self->_deviceApplicationSceneViewController, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenSwitcherSceneLiveContentOverlay;
  -[SBFullScreenSwitcherSceneLiveContentOverlay dealloc](&v7, sel_dealloc);
}

- (int64_t)touchBehavior
{
  return self->_touchBehavior;
}

- (id)overlaySceneHandle
{
  return (id)-[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
}

- (id)prepareOverlayForContentRotation
{
  return (id)-[SBDeviceApplicationSceneViewControlling prepareForContentRotation](self->_deviceApplicationSceneViewController, "prepareForContentRotation");
}

- (void)invalidate
{
  BSInvalidatable *displayLayoutElementAssertion;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  NSMutableDictionary *backboardSceneHostRegistrations;

  -[SBDeviceApplicationSceneViewControlling invalidate](self->_deviceApplicationSceneViewController, "invalidate");
  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_clientSettingsInspector, "removeAllObservers");
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_backboardSceneHostRegistrations, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_228);
  backboardSceneHostRegistrations = self->_backboardSceneHostRegistrations;
  self->_backboardSceneHostRegistrations = 0;

}

uint64_t __57__SBFullScreenSwitcherSceneLiveContentOverlay_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (int64_t)leadingStatusBarStyle
{
  return -[SBDeviceApplicationSceneViewControlling leadingStatusBarStyle](self->_deviceApplicationSceneViewController, "leadingStatusBarStyle");
}

- (int64_t)trailingStatusBarStyle
{
  return -[SBDeviceApplicationSceneViewControlling trailingStatusBarStyle](self->_deviceApplicationSceneViewController, "trailingStatusBarStyle");
}

- (id)backgroundActivitiesToSuppress
{
  return (id)-[SBDeviceApplicationSceneViewControlling backgroundActivitiesToSuppress](self->_deviceApplicationSceneViewController, "backgroundActivitiesToSuppress");
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  objc_msgSend(v4, "setDarkenViewAlpha:", v5);

}

- (BOOL)isContentUpdating
{
  void *v2;
  char v3;

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSceneUpdateInProgress");

  return v3;
}

- (void)setOccluded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOccluded:", v3);

}

- (void)disableAsynchronousRenderingForNextCommit
{
  void *v3;
  _QWORD v4[5];

  if (!self->_asynchronousRenderingTemporarilyDisabled)
  {
    self->_asynchronousRenderingTemporarilyDisabled = 1;
    -[SBFullScreenSwitcherSceneLiveContentOverlay _updateAsyncRendering](self, "_updateAsyncRendering");
    v3 = (void *)*MEMORY[0x1E0CEB258];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __88__SBFullScreenSwitcherSceneLiveContentOverlay_disableAsynchronousRenderingForNextCommit__block_invoke;
    v4[3] = &unk_1E8E9DED8;
    v4[4] = self;
    objc_msgSend(v3, "_performBlockAfterCATransactionCommits:", v4);
  }
}

uint64_t __88__SBFullScreenSwitcherSceneLiveContentOverlay_disableAsynchronousRenderingForNextCommit__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 53) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateAsyncRendering");
}

- (BOOL)resizesHostedContext
{
  return -[SBDeviceApplicationSceneViewControlling sceneResizesHostedContext](self->_deviceApplicationSceneViewController, "sceneResizesHostedContext");
}

- (BOOL)requiresLegacyRotationSupport
{
  void *v2;
  char v3;

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsDeviceOrientationEventsEnabled");

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "_supportsMixedOrientation") & 1) == 0)
    v4 = objc_msgSend(v3, "supportedInterfaceOrientations");
  else
    v4 = 30;

  return v4;
}

- (int64_t)preferredInterfaceOrientation
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEffectivelyForeground"))
    v3 = objc_msgSend(v2, "currentInterfaceOrientation");
  else
    v3 = 0;

  return v3;
}

- (id)newPortaledLiveContentOverlayView
{
  void *v2;
  SBPortalView *v3;

  -[SBFullScreenSwitcherSceneLiveContentOverlay contentOverlayView](self, "contentOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(SBPortalView);
    -[SBPortalView setSourceView:](v3, "setSourceView:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTestToTopAffordance:window:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9 != 0;
}

- (void)updateTopAffordanceContextMenu
{
  id v2;

  -[SBFullScreenSwitcherSceneLiveContentOverlay _medusaDecoratedDeviceApplicationSceneViewController](self, "_medusaDecoratedDeviceApplicationSceneViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTopAffordanceContextMenu");

}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (void)medusaDecoratedDeviceApplicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5
{
  SBFullScreenSwitcherSceneLiveContentOverlayDelegate **p_statusBarActionDelegate;
  id v8;
  id WeakRetained;

  p_statusBarActionDelegate = &self->_statusBarActionDelegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_statusBarActionDelegate);
  objc_msgSend(WeakRetained, "fullScreenSwitcherSceneLiveContentOverlay:tappedStatusBar:tapActionType:", self, v8, a5);

}

- (void)medusaDecoratedDeviceApplicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "liveContentOverlayDidUpdateHomeAffordanceSupportedOrientations:", self);

}

- (BOOL)medusaDecoratedDeviceApplicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  return 1;
}

- (void)applicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5
{
  SBFullScreenSwitcherSceneLiveContentOverlayDelegate **p_statusBarActionDelegate;
  id v8;
  id WeakRetained;

  p_statusBarActionDelegate = &self->_statusBarActionDelegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_statusBarActionDelegate);
  objc_msgSend(WeakRetained, "fullScreenSwitcherSceneLiveContentOverlay:tappedStatusBar:tapActionType:", self, v8, a5);

}

- (void)applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "liveContentOverlayDidUpdateHomeAffordanceSupportedOrientations:", self);

}

- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  return 1;
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
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
  objc_msgSend(a3, "layers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_backboardSceneHostRegistrations, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");
        -[NSMutableDictionary removeObjectForKey:](self->_backboardSceneHostRegistrations, "removeObjectForKey:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  void *v2;
  void *v3;
  char v4;

  -[SBFullScreenSwitcherSceneLiveContentOverlay _sceneHandleForHardwareButtonEvents](self, "_sceneHandleForHardwareButtonEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "preferredHardwareButtonEventTypes") & 2) != 0)
    v4 = objc_msgSend(v3, "handleHardwareButtonEventType:", 1);
  else
    v4 = 0;

  return v4;
}

- (BOOL)handleVolumeDownButtonPress
{
  void *v2;
  void *v3;
  char v4;

  -[SBFullScreenSwitcherSceneLiveContentOverlay _sceneHandleForHardwareButtonEvents](self, "_sceneHandleForHardwareButtonEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "preferredHardwareButtonEventTypes") & 4) != 0)
    v4 = objc_msgSend(v3, "handleHardwareButtonEventType:", 2);
  else
    v4 = 0;

  return v4;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;

  v3 = a3;
  -[SBFullScreenSwitcherSceneLiveContentOverlay _sceneHandleForHardwareButtonEvents](self, "_sceneHandleForHardwareButtonEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "preferredHardwareButtonEventTypes");
    if (v3)
    {
      if ((v6 & 0x10) != 0)
      {
        v7 = 4;
LABEL_8:
        v8 = objc_msgSend(v5, "handleHardwareButtonEventType:", v7);
        goto LABEL_9;
      }
    }
    else if ((v6 & 8) != 0)
    {
      v7 = 3;
      goto LABEL_8;
    }
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (id)_sceneHandleForHardwareButtonEvents
{
  return (id)-[SBDeviceApplicationSceneViewControlling sceneHandle](self->_deviceApplicationSceneViewController, "sceneHandle");
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

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

- (SBSceneViewStatusBarAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (SBSDisplayLayoutElement)displayLayoutElement
{
  return self->_displayLayoutElement;
}

- (BSInvalidatable)displayLayoutElementAssertion
{
  return self->_displayLayoutElementAssertion;
}

- (void)setDisplayLayoutElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, a3);
}

- (BOOL)wantsMinificationFilter
{
  return self->_wantsMinificationFilter;
}

- (BOOL)asyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

- (BOOL)asynchronousRenderingTemporarilyDisabled
{
  return self->_asynchronousRenderingTemporarilyDisabled;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (BOOL)isMatchMovedToScene
{
  return self->_matchMovedToScene;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (SBFullScreenSwitcherSceneLiveContentOverlayDelegate)statusBarActionDelegate
{
  return (SBFullScreenSwitcherSceneLiveContentOverlayDelegate *)objc_loadWeakRetained((id *)&self->_statusBarActionDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarActionDelegate);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_deviceApplicationSceneViewController, 0);
  objc_storeStrong((id *)&self->_orientationWrapperView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_backboardSceneHostRegistrations, 0);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
}

- (void)updateDisplayLayoutElementWithBuilder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_3_4(v3);
  objc_msgSend(v1, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_7(&dword_1D0540000, v9, v10, "Trying to update a display layout element for %{public}@ but we can't find the publisher - sceneID: %{public}@ displayIdentity: %{public}@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_6();
}

@end
