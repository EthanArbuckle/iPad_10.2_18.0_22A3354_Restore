@implementation SBAppViewController

- (BOOL)isHostingAnApp
{
  return self->_currentMode == 2;
}

- (SBApplicationSceneHandle)sceneHandle
{
  return &self->_sceneHandle->super;
}

- (SBApplicationSceneView)appView
{
  return (SBApplicationSceneView *)-[SBSceneViewController _sceneView](self->_deviceAppViewController, "_sceneView");
}

- (SBAppViewController)initWithIdentifier:(id)a3 andApplicationSceneEntity:(id)a4
{
  id v8;
  id v9;
  SBAppViewController *v10;
  SBAppViewController *v11;
  uint64_t v12;
  SBDeviceApplicationSceneHandle *sceneHandle;
  uint64_t v14;
  SBScenePlaceholderContentContext *placeholderContentContext;
  SBActivationSettings *v16;
  SBActivationSettings *activationSettings;
  SBActivationSettings *v18;
  void *v19;
  NSMutableSet *v20;
  NSMutableSet *activeTransitions;
  uint64_t v22;
  NSSet *actionsToDeliver;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  NSClassFromString(CFSTR("SBApplicationSceneEntity"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAppViewController initWithIdentifier:andApplicationSceneEntity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B81F88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:SBApplicationSceneEntityClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAppViewController initWithIdentifier:andApplicationSceneEntity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B81FECLL);
  }

  v29.receiver = self;
  v29.super_class = (Class)SBAppViewController;
  v10 = -[SBAppViewController init](&v29, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_msgSend(v9, "sceneHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    sceneHandle = v11->_sceneHandle;
    v11->_sceneHandle = (SBDeviceApplicationSceneHandle *)v12;

    if (!-[SBDeviceApplicationSceneHandle isDeviceApplicationSceneHandle](v11->_sceneHandle, "isDeviceApplicationSceneHandle"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBAppViewController.m"), 76, CFSTR("SBAppViewController sadly only deals with SBDeviceApplicationSceneHandles right now."));

    }
    v14 = -[SBDeviceApplicationSceneHandle newScenePlaceholderContentContextWithActivationSettings:](v11->_sceneHandle, "newScenePlaceholderContentContextWithActivationSettings:", v9);
    placeholderContentContext = v11->_placeholderContentContext;
    v11->_placeholderContentContext = (SBScenePlaceholderContentContext *)v14;

    v16 = objc_alloc_init(SBActivationSettings);
    activationSettings = v11->_activationSettings;
    v11->_activationSettings = v16;

    v18 = v11->_activationSettings;
    v19 = (void *)objc_msgSend(v9, "copyActivationSettings");
    -[SBActivationSettings applyActivationSettings:](v18, "applyActivationSettings:", v19);

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeTransitions = v11->_activeTransitions;
    v11->_activeTransitions = v20;

    objc_msgSend(v9, "actions");
    v22 = objc_claimAutoreleasedReturnValue();
    actionsToDeliver = v11->_actionsToDeliver;
    v11->_actionsToDeliver = (NSSet *)v22;

    v11->_requestedMode = 0;
    v11->_currentMode = 0;
    v11->_sceneContentIsReady = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v11, sel__installedAppsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v5;
  objc_super v6;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 96, CFSTR("AppViewController must be explicitly invalidated before it can deallocate."));

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)SBAppViewController;
  -[SBAppViewController dealloc](&v6, sel_dealloc);
}

- (void)setActionsToDeliver:(id)a3
{
  NSSet *v5;
  NSSet **p_actionsToDeliver;
  uint64_t v7;
  NSSet *v8;
  NSSet *v9;

  v5 = (NSSet *)a3;
  p_actionsToDeliver = &self->_actionsToDeliver;
  if (self->_actionsToDeliver != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_actionsToDeliver, a3);
    v7 = -[NSSet count](*p_actionsToDeliver, "count");
    v5 = v9;
    if (v7)
    {
      if (self->_currentMode == 2)
      {
        -[SBAppViewController _sendActions:](self, "_sendActions:", *p_actionsToDeliver);
        v8 = *p_actionsToDeliver;
        *p_actionsToDeliver = 0;

        v5 = v9;
      }
    }
  }

}

- (void)setRequestedMode:(int64_t)a3
{
  if (self->_requestedMode != a3)
  {
    self->_requestedMode = a3;
    if (!self->_automatesLifecycle)
      -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:");
  }
}

- (void)setAutomatesLifecycle:(BOOL)a3
{
  if (self->_automatesLifecycle != a3)
  {
    self->_automatesLifecycle = a3;
    if (a3)
    {
      -[SBAppViewController _updateForAppearanceState:](self, "_updateForAppearanceState:", -[SBAppViewController _appearState](self, "_appearState"));
    }
    else if (self->_requestedMode != self->_currentMode)
    {
      -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:");
    }
  }
}

- (void)setPlaceholderContentEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_placeholderContentEnabled != a3)
  {
    v3 = a3;
    self->_placeholderContentEnabled = a3;
    -[SBAppViewController appView](self, "appView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlaceholderContentEnabled:", v3);

  }
}

- (BOOL)placeholderContentEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBAppViewController appView](self, "appView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderContentProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:", 0);
    -[SBAppViewController setDelegate:](self, "setDelegate:", 0);
    -[SBAppViewController setActionsToDeliver:](self, "setActionsToDeliver:", 0);
    self->_invalidated = 1;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (self->_automatesLifecycle)
    -[SBAppViewController _updateForAppearanceState:](self, "_updateForAppearanceState:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_automatesLifecycle)
    -[SBAppViewController _updateForAppearanceState:](self, "_updateForAppearanceState:", 2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (self->_automatesLifecycle)
    -[SBAppViewController _updateForAppearanceState:](self, "_updateForAppearanceState:", 3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (self->_automatesLifecycle)
    -[SBAppViewController _updateForAppearanceState:](self, "_updateForAppearanceState:", 0);
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppViewController;
  -[SBAppViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3 && self->_automatesLifecycle)
    -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  -[SBAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_roleHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  if ((v6 & 1) == 0)
  {
    -[SBDeviceApplicationSceneViewController view](self->_deviceAppViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "setFrame:");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBAppViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_roleHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SBTraitsArbiterOrientationActuationEnabledForRole(v10);

  if ((v11 & 1) == 0)
  {
    -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "uiSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "deviceOrientationEventsEnabled");

      if ((v15 & 1) != 0)
      {
        SBFWindowForViewControllerTransition();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_toWindowOrientation");

        -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v17, v17, width, height);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v18[3] = &unk_1E8E9EA28;
        v18[4] = self;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v18);
      }
      else
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v19[3] = &unk_1E8EB8848;
        v20 = v7;
        objc_msgSend(v13, "updateUISettingsWithTransitionBlock:", v19);

      }
    }

  }
}

id __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  SBFWindowForViewControllerTransition();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(v4, "_toWindowOrientation"));

  v5 = objc_alloc_init(MEMORY[0x1E0CEA350]);
  v6 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(*(id *)(a1 + 32), "transitionDuration");
  objc_msgSend(v6, "settingsWithDuration:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v7);

  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationFence:", v8);

  return v5;
}

uint64_t __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "contentOrientation");
  result = objc_msgSend(*(id *)(a1 + 32), "bs_isAppearingOrAppeared");
  if ((_DWORD)result)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4)
    return objc_msgSend(*(id *)(a1 + 32), "_transformHostedAppViewForRotationToOrientation:", v2);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  SBDeviceApplicationSceneHandle *sceneHandle;

  if (-[SBAppViewController isHostingAnApp](self, "isHostingAnApp"))
    sceneHandle = self->_sceneHandle;
  else
    sceneHandle = 0;
  return sceneHandle;
}

- (id)hostedAppSceneHandles
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[SBAppViewController isHostingAnApp](self, "isHostingAnApp") && self->_sceneHandle)
  {
    v5[0] = self->_sceneHandle;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (void)_transformHostedAppViewForRotationToOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double Height;
  double Width;
  void *v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  -[SBAppViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_roleHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBTraitsArbiterOrientationActuationEnabledForRole(v7);

  if ((v8 & 1) == 0)
  {
    -[SBAppViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[SBAppViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fixedCoordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertRect:toCoordinateSpace:", v20, v11, v13, v15, v17);
    v22 = v21;
    v24 = v23;

    Height = v15;
    Width = v17;
    if ((unint64_t)(a3 - 3) < 2 != (unint64_t)(-[SBAppViewController interfaceOrientation](self, "interfaceOrientation")- 3) < 2)
    {
      v29.origin.x = v11;
      v29.origin.y = v13;
      v29.size.width = v15;
      v29.size.height = v17;
      Height = CGRectGetHeight(v29);
      v30.origin.x = v11;
      v30.origin.y = v13;
      v30.size.width = v15;
      v30.size.height = v17;
      Width = CGRectGetWidth(v30);
    }
    -[SBDeviceApplicationSceneViewController view](self->_deviceAppViewController, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppViewController interfaceOrientation](self, "interfaceOrientation");
    SBFTransformFromOrientationToOrientation();
    objc_msgSend(v27, "setTransform:", &v28);
    UIRectGetCenter();
    objc_msgSend(v27, "setCenter:");
    objc_msgSend(v27, "setBounds:", v11, v13, Height, Width);
    -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a3, a3, v22, v24);

  }
}

- (int64_t)displayMode
{
  return -[SBSceneViewController displayMode](self->_deviceAppViewController, "displayMode");
}

- (void)setPlaceholderContentContext:(id)a3
{
  SBScenePlaceholderContentContext *v5;
  SBScenePlaceholderContentContext **p_placeholderContentContext;
  void *v7;
  SBScenePlaceholderContentContext *v8;

  v5 = (SBScenePlaceholderContentContext *)a3;
  p_placeholderContentContext = &self->_placeholderContentContext;
  if (self->_placeholderContentContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_placeholderContentContext, a3);
    -[SBAppViewController appView](self, "appView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaceholderContentContext:", *p_placeholderContentContext);

    v5 = v8;
  }

}

- (UIView)customContentView
{
  return -[SBSceneViewController customContentView](self->_deviceAppViewController, "customContentView");
}

- (void)setCustomContentView:(id)a3
{
  -[SBSceneViewController setCustomContentView:](self->_deviceAppViewController, "setCustomContentView:", a3);
}

- (id)newSnapshot
{
  return -[SBSceneViewController newSnapshot](self->_deviceAppViewController, "newSnapshot");
}

- (id)newSnapshotView
{
  return -[SBSceneViewController newSnapshotView](self->_deviceAppViewController, "newSnapshotView");
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  SBDeviceApplicationSceneViewController *deviceAppViewController;

  deviceAppViewController = self->_deviceAppViewController;
  if (deviceAppViewController)
    -[SBSceneViewController newSnapshotViewOnQueue:withCompletion:](deviceAppViewController, "newSnapshotViewOnQueue:withCompletion:", a3, a4);
  else
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (CGSize)contentReferenceSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBSceneViewController contentReferenceSize](self->_deviceAppViewController, "contentReferenceSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentOrientation
{
  return -[SBSceneViewController contentOrientation](self->_deviceAppViewController, "contentOrientation");
}

- (int64_t)containerOrientation
{
  return -[SBSceneViewController containerOrientation](self->_deviceAppViewController, "containerOrientation");
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  SBDeviceApplicationSceneViewController *deviceAppViewController;
  uint64_t v8;
  void *v9;
  id v10;

  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a5, a3.width, a3.height);
  deviceAppViewController = self->_deviceAppViewController;
  v8 = -[SBDeviceApplicationSceneViewController interfaceOrientation](deviceAppViewController, "interfaceOrientation");
  -[SBAppViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneViewController willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:](deviceAppViewController, "willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:", v8, a4, v9, 1);

  -[SBAppViewController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SBDeviceApplicationSceneViewController *deviceAppViewController;
  SBDeviceApplicationSceneViewController *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  deviceAppViewController = self->_deviceAppViewController;
  if (deviceAppViewController)
  {
    objc_initWeak(&location, deviceAppViewController);
    v12 = self->_deviceAppViewController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__SBAppViewController_setDisplayMode_animationFactory_completion___block_invoke;
    v13[3] = &unk_1E8EB7358;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    v14 = v10;
    -[SBDeviceApplicationSceneViewController setDisplayMode:animationFactory:completion:](v12, "setDisplayMode:animationFactory:completion:", a3, v8, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

uint64_t __66__SBAppViewController_setDisplayMode_animationFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "displayMode") != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setCustomContentView:", 0);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
  -[SBSceneViewController containerContentWrapperInterfaceOrientationChangedTo:](self->_deviceAppViewController, "containerContentWrapperInterfaceOrientationChangedTo:", a3);
}

- (double)statusBarAlpha
{
  SBDeviceApplicationSceneViewController *deviceAppViewController;
  double result;

  deviceAppViewController = self->_deviceAppViewController;
  if (!deviceAppViewController)
    return 1.0;
  -[SBApplicationSceneViewController statusBarAlpha](deviceAppViewController, "statusBarAlpha");
  return result;
}

- (int64_t)overrideStatusBarStyle
{
  return -[SBApplicationSceneViewController overrideStatusBarStyle](self->_deviceAppViewController, "overrideStatusBarStyle");
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2 && !self->_sceneContentIsReady)
    {
      v8 = v6;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "appViewControllerDidBecomeReady:", self);
      self->_sceneContentIsReady = 1;

      v6 = v8;
    }
  }
  else
  {
    self->_sceneContentIsReady = 0;
  }

}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!self->_invalidated)
  {
    if (self->_currentMode != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 422, CFSTR("We're still observing the scene handle when the scene handle died."));

    }
    self->_sceneContentIsReady = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(WeakRetained, "appViewControllerShouldReactivateApplicationOnDestruction:", self))
    {
      -[SBAppViewController _activateApp](self, "_activateApp");
    }

  }
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v23, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isForeground") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSBAppViewControllerMode(self->_currentMode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recursiveDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 440, CFSTR("Something changed the scene's (%@) foreground status out from underneath us (current mode: %@, diff: %@, window: %@)."), v20, v15, v16, v18);

  }
  if (self->_ignoresOcclusions
    && (objc_msgSend(v12, "ignoreOcclusionReasons"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsObject:", self->_identifier),
        v13,
        (v14 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[sceneSettings ignoreOcclusionReasons] containsObject:_identifier]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBAppViewController sceneHandle:didUpdateSettingsWithDiff:previousSettings:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

  }
}

- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  void *v4;
  char v5;

  -[SBAppViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "appViewControllerIsInNonRotatingWindow:", self);
  else
    v5 = 0;

  return v5;
}

- (void)_updateForAppearanceState:(int)a3
{
  if (a3 <= 3)
    -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:", qword_1D0E8B0B0[a3]);
}

- (void)_setCurrentMode:(int64_t)a3
{
  int64_t currentMode;

  if (!self->_invalidated && self->_currentMode != a3)
  {
    self->_currentMode = a3;
    self->_sceneContentIsReady = 0;
    currentMode = self->_currentMode;
    switch(currentMode)
    {
      case 2:
        -[SBAppViewController _activateApp](self, "_activateApp");
        break;
      case 1:
        -[SBAppViewController _createSceneViewController](self, "_createSceneViewController");
        -[SBAppViewController _deactivateHostedApp](self, "_deactivateHostedApp");
        break;
      case 0:
        -[SBAppViewController _deactivateHostedApp](self, "_deactivateHostedApp");
        -[SBAppViewController _destroySceneViewController](self, "_destroySceneViewController");
        break;
    }
  }
}

- (void)_createSceneViewController
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  SBPriorityDeviceApplicationSceneViewController *v20;
  SBDeviceApplicationSceneViewController *deviceAppViewController;
  SBDeviceApplicationSceneViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id WeakRetained;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 501, CFSTR("Cannot create an app view on an invalidated appViewController: %@"), self);

  }
  -[SBAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBAppViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fixedCoordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
  v16 = v15;
  v18 = v17;

  if (!self->_deviceAppViewController)
  {
    v19 = -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self->_sceneHandle, "currentInterfaceOrientation");
    if (!v19)
      v19 = -[SBAppViewController interfaceOrientation](self, "interfaceOrientation");
    v20 = -[SBDeviceApplicationSceneViewController initWithSceneHandle:]([SBPriorityDeviceApplicationSceneViewController alloc], "initWithSceneHandle:", self->_sceneHandle);
    deviceAppViewController = self->_deviceAppViewController;
    self->_deviceAppViewController = &v20->super;

    -[SBDeviceApplicationSceneViewController setRendersWhileLocked:](self->_deviceAppViewController, "setRendersWhileLocked:", 1);
    -[SBDeviceApplicationSceneViewController loadViewIfNeeded](self->_deviceAppViewController, "loadViewIfNeeded");
    -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v19, v19, v16, v18);
    v22 = self->_deviceAppViewController;
    -[SBAppViewController applicationSceneStatusBarDelegate](self, "applicationSceneStatusBarDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneViewController setApplicationSceneStatusBarDelegate:](v22, "setApplicationSceneStatusBarDelegate:", v23);

    -[SBDeviceApplicationSceneViewController setDelegate:](self->_deviceAppViewController, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBDeviceApplicationSceneViewController setHomeGrabberDisplayMode:](self->_deviceAppViewController, "setHomeGrabberDisplayMode:", objc_msgSend(WeakRetained, "appViewControllerShouldHideHomeGrabberView:", self));
    -[SBDeviceApplicationSceneViewController view](self->_deviceAppViewController, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppViewController appView](self, "appView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounds:", v5, v7, v9, v11);
    UIRectGetCenter();
    objc_msgSend(v24, "setCenter:");
    objc_msgSend(v25, "setPlaceholderContentContext:", self->_placeholderContentContext);
    objc_msgSend(v25, "setPlaceholderContentEnabled:", self->_placeholderContentEnabled);
    objc_msgSend(v25, "setDisplayMode:animationFactory:completion:", 2, 0, 0);
    -[SBAppViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", self->_deviceAppViewController, 0, 0);

  }
}

- (void)_destroySceneViewController
{
  SBDeviceApplicationSceneViewController *deviceAppViewController;
  void *v4;
  SBDeviceApplicationSceneViewController *v5;

  deviceAppViewController = self->_deviceAppViewController;
  if (deviceAppViewController)
  {
    -[SBAppViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", deviceAppViewController, 0, 0);
    -[SBAppViewController appView](self, "appView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    v5 = self->_deviceAppViewController;
    self->_deviceAppViewController = 0;

  }
}

- (void)_sendActions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (self->_currentMode != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 548, CFSTR("Current mode must be live."));

    }
    if (self->_invalidated)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 549, CFSTR("Cannot activate an application on an invalidated appViewController: %@"), self);

    }
    -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__SBAppViewController__sendActions___block_invoke;
    v9[3] = &unk_1E8EB8848;
    v10 = v5;
    objc_msgSend(v6, "updateUISettingsWithTransitionBlock:", v9);

  }
}

id __36__SBAppViewController__sendActions___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA350]);
  objc_msgSend(v2, "setActions:", *(_QWORD *)(a1 + 32));
  return v2;
}

- (void)_activateApp
{
  id WeakRetained;
  SBDeviceApplicationSceneEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id location;

  if (self->_currentMode != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 560, CFSTR("Cannot deactivate when the mode is live."));

  }
  if (!self->_sceneHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 561, CFSTR("scene handle must exist"));

  }
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 562, CFSTR("Cannot activate an application on an invalidated appViewController: %@"), self);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "appViewControllerWillActivateApplication:", self);
  -[SBDeviceApplicationSceneHandle setHostedSecureApp:](self->_sceneHandle, "setHostedSecureApp:", 1);
  v5 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", self->_sceneHandle);
  -[SBAppViewController _createSceneUpdateTransactionForApplicationSceneEntity:deliveringActions:](self, "_createSceneUpdateTransactionForApplicationSceneEntity:deliveringActions:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle addObserver:](self->_sceneHandle, "addObserver:", self);
  -[SBActivationSettings clearActivationSettings](self->_activationSettings, "clearActivationSettings");
  objc_initWeak(&location, v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__SBAppViewController__activateApp__block_invoke;
  v11[3] = &unk_1E8EA1598;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend(v6, "setCompletionBlock:", v11);
  -[NSMutableSet addObject:](self->_activeTransitions, "addObject:", v6);
  objc_msgSend(v6, "begin");
  -[SBAppViewController _createSceneViewController](self, "_createSceneViewController");
  +[SBSceneView defaultDisplayModeAnimationFactory](SBApplicationSceneView, "defaultDisplayModeAnimationFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppViewController setDisplayMode:animationFactory:completion:](self, "setDisplayMode:animationFactory:completion:", 4, v7, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __35__SBAppViewController__activateApp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_roleHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SBTraitsArbiterOrientationActuationEnabledForRole(v4);

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "currentInterfaceOrientation");
    objc_msgSend(*(id *)(a1 + 32), "appView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "_transformHostedAppViewForRotationToOrientation:", v6);
    }
  }

}

- (id)_configureApplicationSceneEntity:(id)a3 deliveringActions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_ignoresOcclusions)
    objc_msgSend(v6, "setObject:forActivationSetting:", self->_identifier, 60);
  objc_msgSend(v7, "applyActivationSettings:", self->_activationSettings);
  objc_msgSend(v7, "applyActivationSettings:", self->_supplementalActivationSettings);
  if (v4 && self->_actionsToDeliver)
  {
    objc_msgSend(v7, "addActions:");
    -[SBAppViewController setActionsToDeliver:](self, "setActionsToDeliver:", 0);
  }
  return v7;
}

- (id)_createSceneUpdateTransactionForApplicationSceneEntity:(id)a3 deliveringActions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  SBApplicationSceneUpdateTransaction *v14;
  SBApplicationSceneUpdateTransaction *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  SBAppViewController *v21;
  id v22;

  v4 = a4;
  v6 = a3;
  v7 = -[SBAppViewController _configureApplicationSceneEntity:deliveringActions:](self, "_configureApplicationSceneEntity:deliveringActions:", v6, v4);
  objc_msgSend(v6, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSecure");

  if (v9)
    v10 = 12;
  else
    v10 = 4;
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createRequestWithOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSource:", 7);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __96__SBAppViewController__createSceneUpdateTransactionForApplicationSceneEntity_deliveringActions___block_invoke;
  v20 = &unk_1E8E9ECA8;
  v21 = self;
  v22 = v6;
  v13 = v6;
  objc_msgSend(v12, "modifyApplicationContext:", &v17);
  v14 = [SBApplicationSceneUpdateTransaction alloc];
  v15 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:delegate:](v14, "initWithApplicationSceneEntity:transitionRequest:delegate:", v13, v12, self, v17, v18, v19, v20, v21);
  -[FBApplicationUpdateScenesTransaction setWaitsForSceneCommits:](v15, "setWaitsForSceneCommits:", 0);
  -[SBApplicationSceneUpdateTransaction setShouldSendActivationResult:](v15, "setShouldSendActivationResult:", 1);

  return v15;
}

void __96__SBAppViewController__createSceneUpdateTransactionForApplicationSceneEntity_deliveringActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "currentInterfaceOrientation"));
  objc_msgSend(v4, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 40), 1);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntity:forLayoutRole:", v3, 2);

  if (objc_msgSend(*(id *)(a1 + 40), "BOOLForActivationSetting:", 3))
    objc_msgSend(v4, "setBackground:", 1);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)_deactivateHostedApp
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id WeakRetained;
  _QWORD v12[5];
  char v13;
  _QWORD v14[5];
  char v15;

  if (self->_currentMode == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppViewController.m"), 653, CFSTR("Cannot deactivate when the mode is live."));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "appViewControllerShouldBackgroundApplicationOnDeactivate:", self);
  else
    v3 = 1;
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_activeTransitions, "enumerateObjectsUsingBlock:", &__block_literal_global_293);
  -[NSMutableSet removeAllObjects](self->_activeTransitions, "removeAllObjects");
  -[SBDeviceApplicationSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  -[SBDeviceApplicationSceneHandle setHostedSecureApp:](self->_sceneHandle, "setHostedSecureApp:", 0);
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__SBAppViewController__deactivateHostedApp__block_invoke_2;
  v14[3] = &unk_1E8EB88B0;
  v15 = v3;
  v14[4] = self;
  objc_msgSend(v4, "updateSettingsWithBlock:", v14);

  if (-[SBApplicationSceneHandle isSecure](self->_sceneHandle, "isSecure"))
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __43__SBAppViewController__deactivateHostedApp__block_invoke_3;
    v12[3] = &unk_1E8EB88B0;
    v13 = v3;
    v12[4] = self;
    objc_msgSend(v8, "updateSettingsWithBlock:", v12);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "appViewControllerDidDeactivateApplication:", self);
  -[SBAppViewController setDisplayMode:animationFactory:completion:](self, "setDisplayMode:animationFactory:completion:", 2, 0, 0);

}

uint64_t __43__SBAppViewController__deactivateHostedApp__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "interrupt");
}

void __43__SBAppViewController__deactivateHostedApp__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "setForeground:", 0);
    v3 = v5;
  }
  objc_msgSend(v3, "ignoreOcclusionReasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

}

void __43__SBAppViewController__deactivateHostedApp__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "setForeground:", 0);
    v3 = v5;
  }
  objc_msgSend(v3, "ignoreOcclusionReasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

}

- (void)_installedAppsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsReplacedBundleIDs"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "containsObject:", v6);

  if (v7)
    -[SBAppViewController _destroySceneViewController](self, "_destroySceneViewController");

}

- (id)_windowSceneFromSceneHandle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle displayIdentity](self->_sceneHandle, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBAppViewController _windowSceneFromSceneHandle](self, "_windowSceneFromSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutStateTransitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutStateForApplicationTransitionContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBAppViewController _windowSceneFromSceneHandle](self, "_windowSceneFromSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutStateTransitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousLayoutStateForApplicationTransitionContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
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
  double v18;
  CGRect result;

  -[SBAppViewController _windowSceneFromSceneHandle](self, "_windowSceneFromSceneHandle", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)sceneUpdateTransaction:(id)a3 finishedApplyingUpdate:(BOOL)a4
{
  id WeakRetained;

  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "appViewControllerDidFailToActivateApplication:", self);

  }
}

- (int64_t)currentMode
{
  return self->_currentMode;
}

- (NSSet)actionsToDeliver
{
  return self->_actionsToDeliver;
}

- (int64_t)requestedMode
{
  return self->_requestedMode;
}

- (BOOL)automatesLifecycle
{
  return self->_automatesLifecycle;
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return self->_placeholderContentContext;
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  return (SBApplicationSceneViewControllingStatusBarDelegate *)objc_loadWeakRetained((id *)&self->applicationSceneStatusBarDelegate);
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->applicationSceneStatusBarDelegate, a3);
}

- (SBAppViewControllerDelegate)delegate
{
  return (SBAppViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)ignoresOcclusions
{
  return self->_ignoresOcclusions;
}

- (void)setIgnoresOcclusions:(BOOL)a3
{
  self->_ignoresOcclusions = a3;
}

- (BOOL)wantsSecureRendering
{
  return self->_wantsSecureRendering;
}

- (void)setWantsSecureRendering:(BOOL)a3
{
  self->_wantsSecureRendering = a3;
}

- (SBActivationSettings)supplementalActivationSettings
{
  return self->_supplementalActivationSettings;
}

- (void)setSupplementalActivationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalActivationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalActivationSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->applicationSceneStatusBarDelegate);
  objc_storeStrong((id *)&self->_actionsToDeliver, 0);
  objc_storeStrong((id *)&self->_activeTransitions, 0);
  objc_storeStrong((id *)&self->_placeholderContentContext, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_deviceAppViewController, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(const char *)a1 andApplicationSceneEntity:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sceneHandle:(const char *)a1 didUpdateSettingsWithDiff:previousSettings:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
