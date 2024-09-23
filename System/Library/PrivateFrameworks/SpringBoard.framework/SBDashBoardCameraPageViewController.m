@implementation SBDashBoardCameraPageViewController

- (BOOL)isHostingAnApp
{
  void *appViewController;

  appViewController = self->_appViewController;
  if (!appViewController)
    appViewController = self->_hostedEntityViewController;
  return objc_msgSend(appViewController, "isHostingAnApp");
}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController aggregateBehavior:](&v8, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "addRestrictedCapabilities:", 4104);
  objc_msgSend(v4, "addRestrictedCapabilities:", 64);
  objc_msgSend(v4, "setScrollingStrategy:", 3);
  objc_msgSend(v4, "setIdleTimerDuration:", 10);
  objc_msgSend(v4, "setIdleWarnMode:", 2);
  objc_msgSend(v4, "setIdleTimerMode:", 1);
  objc_msgSend(v4, "unionBehavior:", self->_appViewController);
  objc_msgSend(v4, "unionBehavior:", self->_hostedEntityViewController);
  if (objc_msgSend(v4, "idleTimerDuration") == 12)
  {
    objc_msgSend(v4, "setIdleTimerDuration:", 13);
    objc_msgSend(v4, "setIdleWarnMode:", 2);
  }
  objc_msgSend((id)SBApp, "accidentalActivationMitigationSessionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if (v7 == 1)
    objc_msgSend(v4, "setNotificationBehavior:", 1);

}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  SBDashBoardHostedAppViewController *appViewController;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  appViewController = self->_appViewController;
  v7 = a3;
  -[SBDashBoardHostedAppViewController applicationSceneHandle](appViewController, "applicationSceneHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 && v8 == v7)
  {
    if (-[SBDashBoardCameraPageViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
      -[SBDashBoardCameraPageViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
    -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    objc_msgSend(v9, "setContentViewBoundsInReferenceSpace:");

    -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
  }

}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  SBDashBoardHostedAppViewController *appViewController;
  id v8;
  id v9;

  appViewController = self->_appViewController;
  v8 = a3;
  -[SBDashBoardHostedAppViewController applicationSceneHandle](appViewController, "applicationSceneHandle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (v9 == v8)
      -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
  }
}

- (void)_updateZStackPolicyAssistants
{
  CSHostedEntityViewController *hostedEntityViewController;
  uint64_t v4;
  id v5;
  void *v6;
  SBDashBoardHostedAppViewController *appViewController;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  hostedEntityViewController = self->_hostedEntityViewController;
  if (hostedEntityViewController)
  {
    -[CSHostedEntityViewController sceneHandleForTraitsParticipant](hostedEntityViewController, "sceneHandleForTraitsParticipant");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v4 = objc_opt_class();
      v5 = v20;
      if (v4)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v5;
        else
          v6 = 0;
      }
      else
      {
        v6 = 0;
      }
      v16 = v6;

      if (v16)
      {
        -[CSHostedEntityViewController homeGrabberViewForTraitsParticipant](self->_hostedEntityViewController, "homeGrabberViewForTraitsParticipant");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v16, v17);

      }
      objc_msgSend(v5, "sceneIfExists");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CSHostedEntityViewController sceneForTraitsParticipant](self->_hostedEntityViewController, "sceneForTraitsParticipant");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_audioCategoryZStackPolicyAssistant->super.isa, v15);
    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_physicalButtonZStackPolicyAssistant, v15);
  }
  else
  {
    -[SBDashBoardHostedAppViewController appView](self->_appViewController, "appView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      appViewController = self->_appViewController;
      v8 = v20;
      -[SBDashBoardHostedAppViewController applicationSceneHandle](appViewController, "applicationSceneHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      v11 = v9;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v15 = v12;

      objc_msgSend(v8, "homeGrabberView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v15, v14);
    objc_msgSend(v15, "sceneIfExists");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_audioCategoryZStackPolicyAssistant->super.isa, v19);
    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_physicalButtonZStackPolicyAssistant, v19);

  }
}

- (NSSet)actionsToDeliver
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBDashBoardHostedAppViewController actionsToDeliver](self->_appViewController, "actionsToDeliver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CSHostedEntityViewController actionsToDeliverToHostableEntity](self->_hostedEntityViewController, "actionsToDeliverToHostableEntity");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)setActionsToDeliver:(id)a3
{
  SBDashBoardHostedAppViewController *appViewController;
  id v5;

  appViewController = self->_appViewController;
  v5 = a3;
  -[SBDashBoardHostedAppViewController setActionsToDeliver:](appViewController, "setActionsToDeliver:", v5);
  -[CSHostedEntityViewController setActionsToDeliverToHostableEntity:](self->_hostedEntityViewController, "setActionsToDeliverToHostableEntity:", v5);

}

- (void)setHostedEntity:(id)a3
{
  CSHostableEntity *v5;
  CSHostableEntity *v6;

  v5 = (CSHostableEntity *)a3;
  if (self->_hostedEntity != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hostedEntity, a3);
    -[CSHostedEntityViewController setHostedEntity:](self->_hostedEntityViewController, "setHostedEntity:", self->_hostedEntity);
    v5 = v6;
  }

}

- (void)setCameraPageDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraPageDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_cameraPageDelegate, obj);
    -[SBDashBoardCameraPageViewController _resetHostedEntityToDefault](self, "_resetHostedEntityToDefault");
    v5 = obj;
  }

}

- (void)noteDefaultHostableEntityMayHaveChanged
{
  if (-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared"))
    -[SBDashBoardCameraPageViewController _resetHostedEntityToDefault](self, "_resetHostedEntityToDefault");
}

- (id)acquireLiveContentAssertionForReason:(id)a3
{
  return (id)-[CSHostedEntityViewController acquireLiveContentAssertionForReason:](self->_hostedEntityViewController, "acquireLiveContentAssertionForReason:", a3);
}

- (void)loadView
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *maskView;
  UIView *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  SBDeviceApplicationSceneEntity *v13;
  void *v14;
  void *v15;
  SBDeviceApplicationSceneEntity *v16;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v17;
  CSHostedEntityViewController *v18;
  CSHostedEntityViewController *hostedEntityViewController;
  CSHostedEntityViewController *v20;
  void *v21;
  void *v22;
  SBHomeGrabberView *v23;
  SBDashBoardApplicationHostableEntity *v24;
  CSHostableEntity *hostedEntity;
  SBDashBoardHostedAppViewController *v26;
  SBDashBoardHostedAppViewController *appViewController;
  void *v28;
  void *v29;
  SBTraitsOrientedContentViewController *v30;
  int v31;
  SBTraitsOrientedContentViewController *v32;
  SBTraitsOrientedContentViewController *v33;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  SBTraitsOrientedContentViewController *v45;
  SBTraitsOrientedContentViewController *v46;
  void *v47;
  SBDeviceApplicationSceneEntity *v48;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v49;
  unint64_t v50;
  SBTraitsOrientedContentViewController *v51;
  id v52;
  SBTraitsOrientedContentViewController *v53;
  void *v54;
  UIViewController *appViewControllerContainerVC;
  id v56;
  UIView *v57;
  UIView *tintView;
  UIView *v59;
  void *v60;
  CSLockScreenSettings *v61;
  CSLockScreenSettings *prototypeSettings;
  SBLockScreenDefaults *v63;
  SBLockScreenDefaults *lockScreenDefaults;
  SBTraitsOrientedContentViewController *v65;
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  SBTraitsOrientedContentViewController *v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSCoverSheetViewControllerBase loadView](&v70, sel_loadView);
  -[CSPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardCameraPageViewController _createProperties](self, "_createProperties");
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  maskView = self->_maskView;
  self->_maskView = v5;

  -[UIView setClipsToBounds:](self->_maskView, "setClipsToBounds:", 1);
  v7 = self->_maskView;
  v8 = 0x1E0CEA000uLL;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v9);

  -[UIView setAutoresizingMask:](self->_maskView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_maskView);
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "policyAggregator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowsCapability:", 10);

  if (v12)
  {
    v13 = [SBDeviceApplicationSceneEntity alloc];
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cameraApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v13, "initWithApplicationForMainDisplay:", v15);

    v17 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:]([SBMutableDeviceApplicationScenePlaceholderContentContext alloc], "initWithActivationSettings:", v16);
    -[SBDeviceApplicationScenePlaceholderContentContext setPrefersLiveXIB:](v17, "setPrefersLiveXIB:", 1);
    if (LCSFeatureEnabled())
    {
      v18 = (CSHostedEntityViewController *)objc_alloc_init(MEMORY[0x1E0D1BBD0]);
      hostedEntityViewController = self->_hostedEntityViewController;
      self->_hostedEntityViewController = v18;

      -[CSHostedEntityViewController setEntityPresenterDelegate:](self->_hostedEntityViewController, "setEntityPresenterDelegate:", self);
      v20 = self->_hostedEntityViewController;
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "coverSheetViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSHostedEntityViewController setCoverSheetViewController:](v20, "setCoverSheetViewController:", v22);

      if (SBFEffectiveHomeButtonType() == 2)
      {
        v23 = objc_alloc_init(SBHomeGrabberView);
        -[SBHomeGrabberView setAutoHides:](v23, "setAutoHides:", 1);
        -[CSHostedEntityViewController setHomeGrabberView:](self->_hostedEntityViewController, "setHomeGrabberView:", v23);

      }
      v24 = -[SBDashBoardApplicationHostableEntity initWithApplicationSceneEntity:]([SBDashBoardApplicationHostableEntity alloc], "initWithApplicationSceneEntity:", v16);
      hostedEntity = self->_hostedEntity;
      self->_hostedEntity = (CSHostableEntity *)v24;

      -[CSHostedEntityViewController setHostedEntity:](self->_hostedEntityViewController, "setHostedEntity:", self->_hostedEntity);
      -[CSHostedEntityViewController setPresenter:](self->_hostedEntityViewController, "setPresenter:", self);
      v8 = 0x1E0CEA000;
    }
    else
    {
      v26 = -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:]([SBDashBoardHostedAppViewController alloc], "initWithApplicationSceneEntity:", v16);
      appViewController = self->_appViewController;
      self->_appViewController = v26;

      -[SBDashBoardHostedAppViewController setPlaceholderContentContext:](self->_appViewController, "setPlaceholderContentContext:", v17);
      -[SBDashBoardHostedAppViewController setDelegate:](self->_appViewController, "setDelegate:", self);
      -[CSCoverSheetViewControllerBase setPresenter:](self->_appViewController, "setPresenter:", self);
      -[SBDashBoardHostedAppViewController applicationSceneHandle](self->_appViewController, "applicationSceneHandle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:", self);

    }
    v29 = self->_appViewController;
    if (!v29)
      v29 = self->_hostedEntityViewController;
    v30 = v29;
    v31 = SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheetCamera"));
    v32 = v30;
    if (v31)
    {
      v33 = -[SBTraitsOrientedContentViewController initWithNibName:bundle:]([SBTraitsOrientedContentViewController alloc], "initWithNibName:bundle:", 0, 0);
      orientedContentViewController = self->_orientedContentViewController;
      self->_orientedContentViewController = v33;

      -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPageViewController view](self, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bounds");
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;

      objc_msgSend(v35, "setFrame:", v38, v40, v42, v44);
      objc_msgSend(v35, "setContentViewBoundsInReferenceSpace:", v38, v40, v42, v44);
      objc_msgSend(v35, "setAutoresizingMask:", 18);
      v65 = self->_orientedContentViewController;
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __47__SBDashBoardCameraPageViewController_loadView__block_invoke;
      v67[3] = &unk_1E8E9EA00;
      v68 = v35;
      v45 = v30;
      v46 = v30;
      v47 = v3;
      v48 = v16;
      v49 = v17;
      v50 = v8;
      v51 = v45;
      v69 = v45;
      v52 = v35;
      v53 = v51;
      v8 = v50;
      v17 = v49;
      v16 = v48;
      v3 = v47;
      v30 = v46;
      -[SBTraitsOrientedContentViewController bs_addChildViewController:animated:transitionBlock:](v65, "bs_addChildViewController:animated:transitionBlock:", v53, 0, v67);

      v32 = self->_orientedContentViewController;
    }
    objc_storeStrong((id *)&self->_appViewControllerContainerVC, v32);
    -[UIViewController view](self->_appViewControllerContainerVC, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "_setContinuousCornerRadius:", SBScreenDisplayCornerRadius());

    appViewControllerContainerVC = self->_appViewControllerContainerVC;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __47__SBDashBoardCameraPageViewController_loadView__block_invoke_2;
    v66[3] = &unk_1E8EA0048;
    v66[4] = self;
    -[SBDashBoardCameraPageViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", appViewControllerContainerVC, 0, v66);

  }
  v56 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "bounds");
  v57 = (UIView *)objc_msgSend(v56, "initWithFrame:");
  tintView = self->_tintView;
  self->_tintView = v57;

  v59 = self->_tintView;
  objc_msgSend(*(id *)(v8 + 1144), "blackColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v59, "setBackgroundColor:", v60);

  -[UIView setAutoresizingMask:](self->_tintView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_maskView, "addSubview:", self->_tintView);
  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v61 = (CSLockScreenSettings *)objc_claimAutoreleasedReturnValue();
  prototypeSettings = self->_prototypeSettings;
  self->_prototypeSettings = v61;

  v63 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FA8]);
  lockScreenDefaults = self->_lockScreenDefaults;
  self->_lockScreenDefaults = v63;

}

void __47__SBDashBoardCameraPageViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setContentView:", v2);

}

void __47__SBDashBoardCameraPageViewController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1104);
  objc_msgSend(*(id *)(v1 + 1168), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("SBDashBoardCameraPageReason"));

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheetCamera")))
    -[SBDashBoardCameraPageViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
  if (-[SBDashBoardHostedAppViewController mode](self->_appViewController, "mode") != 2)
    -[SBDashBoardHostedAppViewController setMode:](self->_appViewController, "setMode:", 1);
  -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 2);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  objc_msgSend((id)SBApp, "accidentalActivationMitigationSessionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[SBDashBoardCameraPageViewController _ensureZStackParticipant](self, "_ensureZStackParticipant");
  -[SBDashBoardCameraPageViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
  -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBDashBoardCameraPageViewController setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 0);
  -[SBDashBoardCameraPageViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
  -[SBDashBoardCameraPageViewController _invalidateZStackParticipantIfNeeded](self, "_invalidateZStackParticipantIfNeeded");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 1);
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  objc_msgSend((id)SBApp, "accidentalActivationMitigationSessionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[SBDashBoardCameraPageViewController _resetHostedEntityToDefault](self, "_resetHostedEntityToDefault");
  -[SBDashBoardCameraPageViewController _invalidateCameraTraitsParticipant](self, "_invalidateCameraTraitsParticipant");
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("SBDashBoardCameraPageReason"));

}

- (void)viewWillMoveToWindow:(id)a3
{
  if (!a3)
  {
    -[SBDashBoardHostedAppViewController setMode:](self->_appViewController, "setMode:", 1);
    -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 1);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  uint64_t v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardCameraPageViewController;
  -[SBDashBoardCameraPageViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v12, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SBDashBoardCameraPageViewController _hostedContentModeDescription](self, "_hostedContentModeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "View did move to window: %@, with mode: %@", buf, 0x16u);

    }
  }
  else
  {
    -[SBDashBoardHostedAppViewController setMode:](self->_appViewController, "setMode:", 1);
    -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 1);
    orientedContentViewController = self->_orientedContentViewController;
    v10 = objc_opt_class();
    SBSafeCast(v10, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject traitsParticipant](v7, "traitsParticipant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTraitsOrientedContentViewController setContainerParticipant:](orientedContentViewController, "setContainerParticipant:", v11);

  }
}

- (void)willTransitionToVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController willTransitionToVisible:](&v6, sel_willTransitionToVisible_);
  -[UIViewController view](self->_appViewControllerContainerVC, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  if (v3)
  {
    self->_hasWarmedCameraForThisPresentation = 0;
    self->_cameraPrewarmSucceeded = 0;
    self->_cameraPresentLargestPercent = 0;
  }
}

- (void)updateTransitionToVisible:(BOOL)a3 progress:(double)a4 mode:(int64_t)a5
{
  _BOOL4 v7;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  CSHostedEntityViewController *hostedEntityViewController;
  void *v23;
  void *appViewController;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v7 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController updateTransitionToVisible:progress:mode:](&v26, sel_updateTransitionToVisible_progress_mode_);
  if (!v7)
    a4 = 1.0 - a4;
  -[SBDashBoardCameraPageViewController _transitionAppViewWithProgress:transitionMode:](self, "_transitionAppViewWithProgress:transitionMode:", a5, a4);
  self->_cameraPresentLargestPercent = vcvtmd_s64_f64(a4 * 100.0);
  v10 = -[SBDashBoardCameraPageViewController _shouldPrewarmOnSwipe](self, "_shouldPrewarmOnSwipe");
  -[SBDashBoardCameraPageViewController _prewarmThreshold](self, "_prewarmThreshold");
  if (v7 && v10 && BSFloatGreaterThanOrEqualToFloat())
  {
    -[CSPageViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_msgSend(v12, "isHidden") & 1) == 0 && !self->_hasWarmedCameraForThisPresentation)
    {
      SBLogDashBoard();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Prewarming Camera for swipe.", buf, 2u);
      }

      -[SBDashBoardCameraPageViewController _prewarmCameraInteractively:](self, "_prewarmCameraInteractively:", a5 == 3);
      self->_hasWarmedCameraForThisPresentation = 1;
      self->_cameraPrewarmSucceeded = 0;
    }

  }
  v14 = -[SBDashBoardCameraPageViewController _shouldPrelaunchOnSwipe](self, "_shouldPrelaunchOnSwipe");
  -[SBDashBoardCameraPageViewController _prelaunchThreshold](self, "_prelaunchThreshold");
  if (v7 && v14 && BSFloatGreaterThanOrEqualToFloat())
  {
    -[CSPageViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (objc_msgSend(v16, "isHidden") & 1) == 0)
    {
      hostedEntityViewController = self->_hostedEntityViewController;
      if (!hostedEntityViewController)
      {
        if (-[SBDashBoardHostedAppViewController mode](self->_appViewController, "mode") != 2)
        {
          -[SBDashBoardCameraPageViewController _noteUserLaunchEventTime](self, "_noteUserLaunchEventTime");
          -[SBDashBoardHostedAppViewController setMode:](self->_appViewController, "setMode:", 2);
          SBEmitEvent(44);
        }
        goto LABEL_27;
      }
      if (-[CSHostedEntityViewController hostableEntityContentMode](hostedEntityViewController, "hostableEntityContentMode") == 2)
      {
LABEL_27:

        goto LABEL_28;
      }
      -[SBDashBoardCameraPageViewController _noteUserLaunchEventTime](self, "_noteUserLaunchEventTime");
      -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 2);
      objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject emitEvent:](v19, "emitEvent:", 44);
    }
    else
    {
      +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isInternalInstall");

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        appViewController = self->_appViewController;
        if (!appViewController)
          appViewController = self->_hostedEntityViewController;
        NSStringFromSBAppViewControllerMode(2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardCameraPageViewController.m"), 376, CFSTR("Preconditions for changing the mode of <%@> to <%@> not met. Ignoring."), appViewController, v25);

      }
      SBLogDashBoard();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_appViewController;
        if (!v20)
          v20 = self->_hostedEntityViewController;
        NSStringFromSBAppViewControllerMode(2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v20;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Preconditions for changing the mode of <%@> to <%@> not met. Ignoring.", buf, 0x16u);

      }
    }

    goto LABEL_27;
  }
LABEL_28:
  if (!v7)
  {
    if (BSFloatIsOne())
      -[SBDashBoardCameraPageViewController _makeApplicationStatic](self, "_makeApplicationStatic");
  }
}

- (void)didTransitionToVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  NSTimer *prewarmCancelTimer;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController didTransitionToVisible:](&v8, sel_didTransitionToVisible_);
  -[UIViewController view](self->_appViewControllerContainerVC, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 0);

  -[SBTraitsSceneParticipantDelegate setCanDetermineActiveOrientation:](self->_traitsParticipantDelegate, "setCanDetermineActiveOrientation:", v3);
  -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("did transition to visible"));
  v6 = 0.0;
  if (v3)
    v6 = 1.0;
  -[SBDashBoardCameraPageViewController _transitionAppViewWithProgress:transitionMode:](self, "_transitionAppViewWithProgress:transitionMode:", 3, v6);
  -[SBDashBoardCameraPageViewController _resetAfterInteractiveGestureToCameraVisible:](self, "_resetAfterInteractiveGestureToCameraVisible:", v3);
  if (v3)
  {
    self->_cameraPrewarmSucceeded = 1;
    self->_cameraPresentLargestPercent = 100;
    -[NSTimer invalidate](self->_prewarmCancelTimer, "invalidate");
    prewarmCancelTimer = self->_prewarmCancelTimer;
    self->_prewarmCancelTimer = 0;

  }
  else
  {
    -[SBDashBoardCameraPageViewController _makeApplicationStatic](self, "_makeApplicationStatic");
  }
}

- (int64_t)requestedDismissalType
{
  return SBFEffectiveHomeButtonType() == 2;
}

- (id)requestedDismissalSettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CAFrameRateRange v7;

  v2 = (void *)MEMORY[0x1E0D01870];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingsWithMass:stiffness:damping:epsilon:timingFunction:", v3, 1.0, 236.82201, 30.77804, 0.01);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v7 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
  objc_msgSend(v5, "setHighFrameRateReason:", 1114127);
  return v5;
}

- (void)_transitionAppViewWithProgress:(double)a3 transitionMode:(int64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  -[UIViewController view](self->_appViewControllerContainerVC, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  objc_msgSend(v7, "center");
  objc_msgSend(v7, "convertPoint:toView:", self->_maskView);
  objc_msgSend(v6, "setCenter:");
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setBounds:");
  if (!self->_interactiveDismissalInProgress)
  {
    BSIntervalMap();
    v9 = v8;
    BSIntervalMap();
    -[SBDashBoardCameraPageViewController _updateCameraScale:dimmingAlpha:transitionMode:](self, "_updateCameraScale:dimmingAlpha:transitionMode:", a4, v9, 1.0 - v10, 0, 1, 0x3FF0000000000000, 1, 0x3FD6666666666666, 1, 0x3FF0000000000000, 1);
  }

}

- (void)_makeApplicationStatic
{
  -[SBDashBoardHostedAppViewController setMode:](self->_appViewController, "setMode:", 1);
  -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 1);
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  objc_super v46[6];
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)SBDashBoardCameraPageViewController;
  v4 = a3;
  -[CSPageViewController aggregateAppearance:](&v47, sel_aggregateAppearance_, v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "priority:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suppressHorizontalBounce:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v7);

  objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v10);

  objc_msgSend(MEMORY[0x1E0D1BB88], "wallpaper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "priority:", 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hidden:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v13);

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "priority:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "suppressTeachableMomentsAnimation:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hidden:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v19);

  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "priority:", 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "optOutOfAlphaFadesForPageScroll:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hidden:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v23);

  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "priority:", 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shouldMatchMove:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v26);

  -[SBDashBoardCameraPageViewController _setSceneGrabberHidden:](self, "_setSceneGrabberHidden:", -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") ^ 1);
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "priority:", 10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hidden:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fakeStatusBar:", BSSettingFlagForBool());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "fakeStatusBarLevel:", &unk_1E91D02C0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addComponent:", v31);
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  CSComponentTransitionInputsMake();
  objc_msgSend(MEMORY[0x1E0D1BB88], "slideableContent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "priority:", 10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "transitionModifiers:", 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v46, 0, sizeof(v46));
  objc_msgSend(v34, "transitionInputs:", v46);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v35);

  objc_msgSend(MEMORY[0x1E0D1BB88], "tinting");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "priority:", 10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "setHidden:", 0);
  objc_msgSend(v4, "addComponent:", v37);
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "priority:", 10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "identifier:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "showBackgroundWhileTransitioning:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "setHidden:", 0);
  objc_msgSend(v4, "addComponent:", v42);
  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "priority:", 10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "suppressVisibleChanges:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v45);

  objc_msgSend(v4, "unionAppearance:", self->_appViewController);
  objc_msgSend(v4, "unionAppearance:", self->_hostedEntityViewController);

}

- (int64_t)presentationAltitude
{
  return 1;
}

+ (unint64_t)requiredCapabilities
{
  return 4;
}

+ (BOOL)isAvailableForConfiguration
{
  return objc_msgSend((id)SBApp, "lockScreenCameraSupported");
}

- (id)pageRole
{
  return (id)*MEMORY[0x1E0D1BB28];
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardCameraPageViewController;
  if (-[CSPresentationViewController handleEvent:](&v12, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
LABEL_10:
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v5 = 0;
    switch(__ROR8__(objc_msgSend(v4, "type") - 5, 1))
    {
      case 0:
        -[SBDashBoardCameraPageViewController _bailIfFaceTimeCallComesIn](self, "_bailIfFaceTimeCallComesIn");
        v5 = 0;
        break;
      case 2:
      case 0xALL:
        -[SBDashBoardCameraPageViewController _coolCameraIfNecessary](self, "_coolCameraIfNecessary");
        if ((unint64_t)(self->_cameraPresentLargestPercent - 1) <= 0x62)
        {
          v13 = *MEMORY[0x1E0DABD70];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0DA9D78];
          v9 = v7;
          objc_msgSend(v8, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "emitEvent:withPayload:", 46, v9);

        }
        v5 = 0;
        self->_hasWarmedCameraForThisPresentation = 0;
        self->_cameraPrewarmSucceeded = 0;
        self->_cameraPresentLargestPercent = 0;
        break;
      case 6:
        -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
        goto LABEL_10;
      case 0xBLL:
        -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
        goto LABEL_10;
      default:
        break;
    }
  }

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 27;
}

- (BOOL)dashBoardHostedAppViewController:(id)a3 shouldTransitionToMode:(int64_t)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = a4 != 2
    || -[SBDashBoardCameraPageViewController _appearState](self, "_appearState") != 1
    && (-[SBDashBoardCameraPageViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) == 0;

  return v7;
}

- (BOOL)canHostAnApp
{
  void *appViewController;

  appViewController = self->_appViewController;
  if (!appViewController)
    appViewController = self->_hostedEntityViewController;
  return objc_msgSend(appViewController, "canHostAnApp");
}

- (id)hostedAppSceneHandle
{
  void *appViewController;

  appViewController = self->_appViewController;
  if (!appViewController)
    appViewController = self->_hostedEntityViewController;
  return (id)objc_msgSend(appViewController, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  void *appViewController;

  appViewController = self->_appViewController;
  if (!appViewController)
    appViewController = self->_hostedEntityViewController;
  return (id)objc_msgSend(appViewController, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  void *appViewController;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheetCamera")) & 1) == 0)
  {
    appViewController = self->_appViewController;
    if (!appViewController)
      appViewController = self->_hostedEntityViewController;
    objc_msgSend(appViewController, "hostedAppWillRotateToInterfaceOrientation:", a3);
  }
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return 1;
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v10, "sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardHostedAppViewController applicationSceneHandle](self->_appViewController, "applicationSceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
    {
      -[SBDashBoardCameraPageViewController _invalidateCameraTraitsParticipant](self, "_invalidateCameraTraitsParticipant");
      -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
    }
  }

}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  CSHostedEntityViewController *hostedEntityViewController;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  hostedEntityViewController = self->_hostedEntityViewController;
  v7 = a4;
  -[CSHostedEntityViewController hostedEntity](hostedEntityViewController, "hostedEntity");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && v8 == v7)
  {
    if (-[SBDashBoardCameraPageViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
      -[SBDashBoardCameraPageViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
    objc_msgSend(v13, "sceneHandleForTraitsParticipant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v13, "sceneForTraitsParticipant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    objc_msgSend(v11, "setContentViewBoundsInReferenceSpace:");

    -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
  }

}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (LCSFeatureEnabled()
    && objc_msgSend(v6, "type") == 1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBDashBoardCameraPageViewController;
    -[CSPageViewController handleAction:fromSender:](&v8, sel_handleAction_fromSender_, v6, v7);
  }

}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    -[CSHostedEntityViewController hostedEntity](self->_hostedEntityViewController, "hostedEntity");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
    {
      -[SBDashBoardCameraPageViewController _invalidateCameraTraitsParticipant](self, "_invalidateCameraTraitsParticipant");
      -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
    }
  }

}

- (void)hostableEntityPresenter:(id)a3 didFailToActivate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    -[CSHostedEntityViewController hostedEntity](self->_hostedEntityViewController, "hostedEntity");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
      -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
  }

}

- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didStartMitigationSession:(id)a4
{
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self, a4);
}

- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didCancelMitigationSession:(id)a4
{
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self, a4);
}

- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didMitigateMitigationSession:(id)a4
{
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self, a4);
}

- (void)_acquireTraitsParticipantIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  CSHostedEntityViewController *hostedEntityViewController;
  void *v7;
  SBTraitsSceneParticipantDelegate *v8;
  void *traitsParticipantDelegate;
  SBTraitsSceneParticipantDelegate *v10;
  void *v11;
  SBTraitsSceneParticipantDelegate *v12;
  SBTraitsSceneParticipantDelegate *v13;
  SBTraitsSceneParticipantDelegate *v14;
  SBTraitsSceneParticipantDelegate *v15;
  TRAParticipant *v16;
  TRAParticipant *traitsParticipant;
  SBTraitsSceneParticipantDelegate *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBTraitsSceneParticipantDelegate *v23;
  uint64_t v24;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  if (!self->_traitsParticipant)
  {
    -[CSPageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4
      && SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheetCamera")))
    {
      -[SBDashBoardCameraPageViewController _traitsArbiter](self, "_traitsArbiter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      hostedEntityViewController = self->_hostedEntityViewController;
      if (hostedEntityViewController)
      {
        -[CSHostedEntityViewController sceneHandleForTraitsParticipant](hostedEntityViewController, "sceneHandleForTraitsParticipant");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:]([SBTraitsSceneParticipantDelegate alloc], "initWithSceneHandle:", v7);
          traitsParticipantDelegate = self->_traitsParticipantDelegate;
          self->_traitsParticipantDelegate = v8;
        }
        else
        {
          -[CSHostedEntityViewController sceneForTraitsParticipant](self->_hostedEntityViewController, "sceneForTraitsParticipant");
          traitsParticipantDelegate = (void *)objc_claimAutoreleasedReturnValue();
          if (traitsParticipantDelegate)
          {
            v14 = -[SBTraitsSceneParticipantDelegate initWithScene:]([SBTraitsSceneParticipantDelegate alloc], "initWithScene:", traitsParticipantDelegate);
            v15 = self->_traitsParticipantDelegate;
            self->_traitsParticipantDelegate = v14;

          }
        }

      }
      else
      {
        v10 = [SBTraitsSceneParticipantDelegate alloc];
        -[SBDashBoardHostedAppViewController applicationSceneHandle](self->_appViewController, "applicationSceneHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:](v10, "initWithSceneHandle:", v11);
        v13 = self->_traitsParticipantDelegate;
        self->_traitsParticipantDelegate = v12;

      }
      if (self->_traitsParticipantDelegate)
      {
        objc_msgSend(v5, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleCoverSheetCamera"));
        v16 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
        traitsParticipant = self->_traitsParticipant;
        self->_traitsParticipant = v16;

        -[SBTraitsSceneParticipantDelegate setArbiter:](self->_traitsParticipantDelegate, "setArbiter:", v5);
        -[SBTraitsSceneParticipantDelegate setParticipant:](self->_traitsParticipantDelegate, "setParticipant:", self->_traitsParticipant);
        v18 = self->_traitsParticipantDelegate;
        v19 = (void *)MEMORY[0x1E0CB37E8];
        -[CSPageViewController view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "window");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "windowLevel");
        objc_msgSend(v19, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTraitsSceneParticipantDelegate setPreferredSceneLevel:](v18, "setPreferredSceneLevel:", v22);

        -[SBTraitsOrientedContentViewController setContentParticipant:](self->_orientedContentViewController, "setContentParticipant:", self->_traitsParticipant);
        objc_initWeak(&location, self);
        v23 = self->_traitsParticipantDelegate;
        v24 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke;
        v28[3] = &unk_1E8EA3840;
        objc_copyWeak(&v29, &location);
        -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v23, "setActuateOrientationAlongsideBlock:", v28);
        orientedContentViewController = self->_orientedContentViewController;
        v26[0] = v24;
        v26[1] = 3221225472;
        v26[2] = __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke_2;
        v26[3] = &unk_1E8EA3868;
        objc_copyWeak(&v27, &location);
        -[SBTraitsOrientedContentViewController setActuateAlongsideBlock:](orientedContentViewController, "setActuateAlongsideBlock:", v26);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }

    }
  }
}

void __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[145], "updateOrientationIfNeeded");
    WeakRetained = v2;
  }

}

void __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id *WeakRetained;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[142], "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);
    objc_msgSend(v8[141], "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);
    WeakRetained = v8;
  }

}

- (void)_invalidateCameraTraitsParticipant
{
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  TRAParticipant *traitsParticipant;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  -[SBTraitsSceneParticipantDelegate invalidate](self->_traitsParticipantDelegate, "invalidate");
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

}

- (id)_traitsArbiter
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CSPageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitsArbiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardCameraPageViewController.m"), 796, CFSTR("Unexpected nil window"));
    v7 = 0;
  }

  return v7;
}

- (void)zStackParticipantDidChange:(id)a3
{
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if ((-[SBDashBoardCameraPageViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) == 0)
  {
    objc_msgSend(v11, "setActivationPolicyForParticipantsBelow:", 2);
    objc_msgSend(v11, "setSuppressSystemApertureForSystemChromeSuppression:", -[_SBLoadApplicationResult isSuccess]((_BOOL8)self->_systemApertureZStackPolicyAssistant));
    -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v5);

    -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", v6);

    -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_audioCategoryZStackPolicyAssistant);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAudioCategoriesDisablingVolumeHUD:", v7);

    -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPhysicalButtonSceneTargets:", v8);

    -[SBHomeScreenConfigurationServer queue]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCaptureButtonFullFidelityEventRequestingScenes:", v9);

    -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setForegroundCaptureSceneTargets:", v10);

  }
}

- (void)audioCategoryZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("audioCategoryZStackPolicyAssistantDidChange"));
}

- (void)systemApertureZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("systemApertureZStackPolicyAssistantDidChange"));
}

- (void)physicalButtonZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("physicalButtonZStackPolicyAssistantDidChange"));
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  double result;

  objc_msgSend(a3, "suggestedEdgeSpacing");
  return result;
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture", a3))
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (void)setWantsHomeGestureOwnership:(BOOL)a3
{
  if (self->_wantsHomeGestureOwnership != a3)
  {
    self->_wantsHomeGestureOwnership = a3;
    if (a3)
      -[SBDashBoardCameraPageViewController _requestHomeGestureOwnership](self, "_requestHomeGestureOwnership");
    else
      -[SBDashBoardCameraPageViewController _invalidateZStackParticipantIfNeeded](self, "_invalidateZStackParticipantIfNeeded");
  }
}

- (void)_requestHomeGestureOwnership
{
  -[SBDashBoardCameraPageViewController _ensureZStackParticipant](self, "_ensureZStackParticipant");
  -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
}

- (void)_ensureZStackParticipant
{
  void *v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SBDashBoardCameraPageViewController audioCategoryZStackPolicyAssistant](self, "audioCategoryZStackPolicyAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[SBAudioCategoryZStackPolicyAssistant initWithDelegate:]((id *)[SBAudioCategoryZStackPolicyAssistant alloc], self);
    -[SBDashBoardCameraPageViewController setAudioCategoryZStackPolicyAssistant:](self, "setAudioCategoryZStackPolicyAssistant:", v4);

  }
  -[SBDashBoardCameraPageViewController systemApertureZStackPolicyAssistant](self, "systemApertureZStackPolicyAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[SBSystemApertureZStackPolicyAssistant initWithDelegate:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], self);
    -[SBDashBoardCameraPageViewController setSystemApertureZStackPolicyAssistant:](self, "setSystemApertureZStackPolicyAssistant:", v6);

  }
  -[SBDashBoardCameraPageViewController physicalButtonZStackPolicyAssistant](self, "physicalButtonZStackPolicyAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[SBPhysicalButtonZStackPolicyAssistant initWithDelegate:]((id *)[SBPhysicalButtonZStackPolicyAssistant alloc], self);
    -[SBDashBoardCameraPageViewController setPhysicalButtonZStackPolicyAssistant:](self, "setPhysicalButtonZStackPolicyAssistant:", v8);

  }
  -[SBDashBoardCameraPageViewController zStackParticipant](self, "zStackParticipant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[CSPageViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_sbWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zStackResolver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acquireParticipantWithIdentifier:delegate:", 13, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBDashBoardCameraPageViewController setZStackParticipant:](self, "setZStackParticipant:", v13);
  }
}

- (void)_invalidateZStackParticipantIfNeeded
{
  void *v3;
  void *v4;

  -[SBDashBoardCameraPageViewController zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBDashBoardCameraPageViewController zStackParticipant](self, "zStackParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SBDashBoardCameraPageViewController setZStackParticipant:](self, "setZStackParticipant:", 0);
    -[SBDashBoardCameraPageViewController setSystemApertureZStackPolicyAssistant:](self, "setSystemApertureZStackPolicyAssistant:", 0);
    -[SBDashBoardCameraPageViewController setPhysicalButtonZStackPolicyAssistant:](self, "setPhysicalButtonZStackPolicyAssistant:", 0);
    -[SBDashBoardCameraPageViewController setAudioCategoryZStackPolicyAssistant:](self, "setAudioCategoryZStackPolicyAssistant:", 0);
  }
}

- (void)_bailIfFaceTimeCallComesIn
{
  void *v3;
  int v4;

  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inFaceTime");

  if (v4)
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (void)_setSceneGrabberHidden:(BOOL)a3
{
  _BOOL4 v3;
  CSHostedEntityViewController *hostedEntityViewController;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  hostedEntityViewController = self->_hostedEntityViewController;
  if (!hostedEntityViewController)
  {
    -[SBDashBoardHostedAppViewController appView](self->_appViewController, "appView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "homeGrabberView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);
      objc_msgSend(v7, "setPointerClickDelegate:", self);
      if (v3)
        -[SBDashBoardCameraPageViewController _takeHiddenAssertionForHomeGrabber:](self, "_takeHiddenAssertionForHomeGrabber:", v7);
      else
        -[SBDashBoardCameraPageViewController _relinquishHiddenAssertionForHomeGrabber:](self, "_relinquishHiddenAssertionForHomeGrabber:", v7);
      -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");

    }
    goto LABEL_12;
  }
  -[CSHostedEntityViewController homeGrabberViewForTraitsParticipant](hostedEntityViewController, "homeGrabberViewForTraitsParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v8, "setPointerClickDelegate:", self);
    if (v3)
      -[SBDashBoardCameraPageViewController _takeHiddenAssertionForHomeGrabber:](self, "_takeHiddenAssertionForHomeGrabber:", v8);
    else
      -[SBDashBoardCameraPageViewController _relinquishHiddenAssertionForHomeGrabber:](self, "_relinquishHiddenAssertionForHomeGrabber:", v8);
    -[SBDashBoardCameraPageViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
LABEL_12:
    v6 = v8;
  }

}

- (void)_noteUserLaunchEventTime
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBActivationSettings *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = mach_continuous_time();
  v8 = objc_alloc_init(SBActivationSettings);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivationSettings setObject:forActivationSetting:](v8, "setObject:forActivationSetting:", v6, 18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivationSettings setObject:forActivationSetting:](v8, "setObject:forActivationSetting:", v7, 19);

  -[SBDashBoardHostedAppViewController setSupplementalActivationSettings:](self->_appViewController, "setSupplementalActivationSettings:", v8);
}

- (void)_takeHiddenAssertionForHomeGrabber:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DA9E28];
  v4 = a3;
  objc_msgSend(v3, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hideForHomeGestureOwnershipAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BSAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("DashBoardCameraHomeOwnershipChanged"), v6);
  objc_msgSend(v4, "setHomeAffordanceInteractionEnabled:", 0);

}

- (void)_relinquishHiddenAssertionForHomeGrabber:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DA9E28];
  v4 = a3;
  objc_msgSend(v3, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unhideForHomeGestureOwnershipAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BSAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHidden:forReason:withAnimationSettings:", 0, CFSTR("DashBoardCameraHomeOwnershipChanged"), v6);
  objc_msgSend(v4, "setHomeAffordanceInteractionEnabled:", 1);

}

- (id)_prewarmingCameraBundleIdentifier
{
  __CFString *v2;

  v2 = CFSTR("com.apple.camera");
  if (_os_feature_enabled_impl())
  {

    v2 = CFSTR("com.apple.camera.lockscreen");
  }
  return v2;
}

- (void)_prewarmCameraInteractively:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  char v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSTimer *v25;
  NSTimer *prewarmDebounceTimer;
  void *v27;
  NSTimer *v28;
  NSTimer *prewarmCancelTimer;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!self->_prewarmDebounceTimer)
  {
    v3 = a3;
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "cameraPrewarmer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentActivePrewarmReasons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      v13 = *MEMORY[0x1E0C8A090];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "isEqualToString:", v13);
        }
        v16 = v15;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v11);

      if ((v16 & 1) != 0)
        goto LABEL_15;
    }
    else
    {

    }
    v17 = (id *)MEMORY[0x1E0C8A098];
    if (!v3)
      v17 = (id *)MEMORY[0x1E0C8A080];
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v33 = *v17;
    objc_msgSend(v18, "numberWithLongLong:", mach_absolute_time());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_continuous_time());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0C8A0B8];
    v38[0] = *MEMORY[0x1E0C8A0A0];
    v38[1] = v21;
    v39[0] = v33;
    v39[1] = v19;
    v38[2] = *MEMORY[0x1E0C8A0C8];
    v39[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardCameraPageViewController _prewarmingCameraBundleIdentifier](self, "_prewarmingCameraBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AVCapturePrewarmWithOptions();

    v24 = (void *)MEMORY[0x1E0C99E88];
    -[CSLockScreenSettings cameraPrewarmDebounceTimeInterval](self->_prototypeSettings, "cameraPrewarmDebounceTimeInterval");
    objc_msgSend(v24, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__endPrewarmBackoffPeriod, 0, 0);
    v25 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    prewarmDebounceTimer = self->_prewarmDebounceTimer;
    self->_prewarmDebounceTimer = v25;

    v27 = (void *)MEMORY[0x1E0C99E88];
    -[CSLockScreenSettings cameraPrewarmAutoCancelTimeInterval](self->_prototypeSettings, "cameraPrewarmAutoCancelTimeInterval");
    objc_msgSend(v27, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__coolCameraIfNecessary, 0, 0);
    v28 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    prewarmCancelTimer = self->_prewarmCancelTimer;
    self->_prewarmCancelTimer = v28;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0C99860];
    objc_msgSend(v30, "addTimer:forMode:", self->_prewarmDebounceTimer, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addTimer:forMode:", self->_prewarmCancelTimer, v31);

LABEL_15:
  }
}

- (void)_endPrewarmBackoffPeriod
{
  NSTimer *prewarmDebounceTimer;

  -[NSTimer invalidate](self->_prewarmDebounceTimer, "invalidate");
  prewarmDebounceTimer = self->_prewarmDebounceTimer;
  self->_prewarmDebounceTimer = 0;

}

- (void)_coolCameraIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSTimer *prewarmCancelTimer;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_hasWarmedCameraForThisPresentation)
  {
    if (!self->_cameraPrewarmSucceeded)
    {
      objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "emitEvent:", 45);

    }
    -[SBDashBoardCameraPageViewController _prewarmingCameraBundleIdentifier](self, "_prewarmingCameraBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C8A0A0];
    v8[0] = *MEMORY[0x1E0C8A098];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1D17E1D28](v4, v5);

  }
  -[NSTimer invalidate](self->_prewarmCancelTimer, "invalidate");
  prewarmCancelTimer = self->_prewarmCancelTimer;
  self->_prewarmCancelTimer = 0;

  -[SBDashBoardCameraPageViewController _makeApplicationStatic](self, "_makeApplicationStatic");
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
}

- (BOOL)_shouldPrewarmOnSwipe
{
  if (-[SBLockScreenDefaults useDefaultsValuesForCameraPrewarm](self->_lockScreenDefaults, "useDefaultsValuesForCameraPrewarm"))return -[SBLockScreenDefaults prewarmCameraOnSwipe](self->_lockScreenDefaults, "prewarmCameraOnSwipe");
  else
    return -[CSLockScreenSettings prewarmsCameraHardwareOnSwipe](self->_prototypeSettings, "prewarmsCameraHardwareOnSwipe");
}

- (double)_prewarmThreshold
{
  double result;

  if (-[SBLockScreenDefaults useDefaultsValuesForCameraPrewarm](self->_lockScreenDefaults, "useDefaultsValuesForCameraPrewarm"))-[SBLockScreenDefaults cameraSwipePrewarmThreshold](self->_lockScreenDefaults, "cameraSwipePrewarmThreshold");
  else
    -[CSLockScreenSettings cameraPrewarmThresholdOnSwipe](self->_prototypeSettings, "cameraPrewarmThresholdOnSwipe");
  return result;
}

- (BOOL)_shouldPrelaunchOnSwipe
{
  if (-[SBLockScreenDefaults useDefaultsValuesForCameraPrewarm](self->_lockScreenDefaults, "useDefaultsValuesForCameraPrewarm"))return -[SBLockScreenDefaults prelaunchCameraOnSwipe](self->_lockScreenDefaults, "prelaunchCameraOnSwipe");
  else
    return -[CSLockScreenSettings prelaunchesCameraAppOnSwipe](self->_prototypeSettings, "prelaunchesCameraAppOnSwipe");
}

- (double)_prelaunchThreshold
{
  double result;

  if (-[SBLockScreenDefaults useDefaultsValuesForCameraPrewarm](self->_lockScreenDefaults, "useDefaultsValuesForCameraPrewarm"))-[SBLockScreenDefaults cameraSwipePrelaunchThreshold](self->_lockScreenDefaults, "cameraSwipePrelaunchThreshold");
  else
    -[CSLockScreenSettings cameraPrelaunchThresholdOnSwipe](self->_prototypeSettings, "cameraPrelaunchThresholdOnSwipe");
  return result;
}

- (id)_hostedContentModeDescription
{
  if (self->_hostedEntityViewController)
  {
    -[CSHostedEntityViewController hostableEntityContentMode](self->_hostedEntityViewController, "hostableEntityContentMode");
    NSStringFromCSHostableEntityContentMode();
  }
  else
  {
    NSStringFromSBAppViewControllerMode(-[SBDashBoardHostedAppViewController mode](self->_appViewController, "mode"));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_resetHostedEntityToDefault
{
  void *v3;
  void *v4;
  id v5;

  if (self->_hostedEntityViewController)
  {
    -[SBDashBoardCameraPageViewController cameraPageDelegate](self, "cameraPageDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultHostableEntityForActivationOfCamera:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    if (v5)
    {
      -[CSHostedEntityViewController setHostedEntity:](self->_hostedEntityViewController, "setHostedEntity:", v5);
      v4 = v5;
    }

  }
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  int v3;
  SBHomeGestureInteraction *v4;
  void *v5;
  void *v6;
  SBHomeGestureInteraction *v7;
  SBHomeGestureInteraction *homeGestureInteraction;
  SBHomeGestureInteraction *v9;
  SBHomeGestureInteraction *v10;

  v3 = -[SBDashBoardCameraPageViewController _appearState](self, "_appearState");
  if (v3 && v3 != 3 && SBHomeGestureEnabled())
  {
    if (!self->_homeGestureInteraction)
    {
      v4 = [SBHomeGestureInteraction alloc];
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemGestureManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SBHomeGestureInteraction initWithSystemGestureManager:delegate:](v4, "initWithSystemGestureManager:delegate:", v6, self);
      homeGestureInteraction = self->_homeGestureInteraction;
      self->_homeGestureInteraction = v7;

      -[SBDashBoardCameraPageViewController setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 1);
    }
  }
  else
  {
    v9 = self->_homeGestureInteraction;
    if (v9)
    {
      -[SBHomeGestureInteraction invalidate](v9, "invalidate");
      v10 = self->_homeGestureInteraction;
      self->_homeGestureInteraction = 0;

    }
  }
}

- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return 0;
  else
    return qword_1D0E88A78[a4 - 1];
}

- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3
{
  void *v4;

  +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterfaceDelegate:", self);
  objc_msgSend(v4, "setEdges:", 15);
  objc_msgSend(v4, "setAllowedTouchTypes:", &unk_1E91CE320);
  return v4;
}

- (BOOL)homeGestureInteraction:(id)a3 shouldBeginGestureRecognizerOfType:(int64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  char v9;
  CSHostedEntityViewController *hostedEntityViewController;
  char v11;
  uint64_t v12;
  int8x8_t v13;
  _QWORD *v14;
  uint8x8_t v15;
  int v16;
  unint64_t v17;
  void *v19;
  _QWORD v20[2];
  void (*v21)(_QWORD *);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  char v29;

  v6 = a3;
  if ((-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") & 1) != 0
    || !self->_zStackParticipant)
  {
    v7 = 1;
    if (a4 != 1)
      goto LABEL_21;
    objc_msgSend(v6, "gestureRecognizerForType:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    if ((objc_msgSend(v8, "touchedEdges") & 4) != 0)
    {
      v28 = 1;
LABEL_20:
      _Block_object_dispose(&v25, 8);

      goto LABEL_21;
    }
    if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheetCamera")))
    {
      v9 = -[TRAParticipant sbf_currentOrientation](self->_traitsParticipant, "sbf_currentOrientation");
    }
    else
    {
      hostedEntityViewController = self->_hostedEntityViewController;
      if (!hostedEntityViewController)
      {
        -[SBDashBoardHostedAppViewController appView](self->_appViewController, "appView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v19, "orientation");

        goto LABEL_12;
      }
      v9 = -[CSHostedEntityViewController hostableEntityOrientation](hostedEntityViewController, "hostableEntityOrientation");
    }
    v11 = v9;
LABEL_12:
    objc_msgSend(v8, "_touchInterfaceOrientation");
    v12 = _screenRegionGivenInterfaceOrientedRegion();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v13 = (int8x8_t)(1 << v11);
    v21 = (void (*)(_QWORD *))__97__SBDashBoardCameraPageViewController_homeGestureInteraction_shouldBeginGestureRecognizerOfType___block_invoke;
    v22 = &unk_1E8EA3890;
    v23 = &v25;
    v24 = v12;
    v14 = v20;
    v29 = 0;
    v15 = (uint8x8_t)vcnt_s8(v13);
    v15.i16[0] = vaddlv_u8(v15);
    v16 = v15.i32[0];
    if (v15.i32[0])
    {
      v17 = 0;
      do
      {
        if (((1 << v17) & *(_QWORD *)&v13) != 0)
        {
          v21(v14);
          if (v29)
            break;
          --v16;
        }
        if (v17 > 0x3E)
          break;
        ++v17;
      }
      while (v16 > 0);
    }

    v7 = *((_BYTE *)v26 + 24) != 0;
    goto LABEL_20;
  }
  v7 = 0;
LABEL_21:

  return v7;
}

uint64_t __97__SBDashBoardCameraPageViewController_homeGestureInteraction_shouldBeginGestureRecognizerOfType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = _interfaceOrientedRegionGivenScreenRegion();
  if ((result & 4) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)homeGestureInteraction:(id)a3 shouldReceiveTouch:(id)a4
{
  return -[CSPageViewController participantState](self, "participantState", a3, a4) == 2;
}

- (BOOL)homeGestureInteraction:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)homeGestureInteractionBegan:(id)a3
{
  -[SBDashBoardCameraPageViewController _prepareForInteractiveGestureToCameraVisible:](self, "_prepareForInteractiveGestureToCameraVisible:", 0);
}

- (void)homeGestureInteractionChanged:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[CSPageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[SBDashBoardCameraPageViewController _convertTranslationFromContainerOrientationToContentOrientation:](self, "_convertTranslationFromContainerOrientationToContentOrientation:", v7, v9);
  BSUIConstrainValueToIntervalWithRubberBand();
  v11 = v10;
  BSIntervalMap();
  -[SBDashBoardCameraPageViewController _updateCameraScale:dimmingAlpha:](self, "_updateCameraScale:dimmingAlpha:", v11, 1.0 - v12, 0, 1, 0x3FF0000000000000, 1, 0x3FD6666666666666, 1, 0x3FF0000000000000, 1, 0x3FEB333333333333, 1, 0x3FF0000000000000, 1);
}

- (void)homeGestureInteractionEnded:(id)a3
{
  double v4;
  double v5;

  if (-[SBDashBoardCameraPageViewController _shouldCancelInteractiveDismissGesture](self, "_shouldCancelInteractiveDismissGesture", a3))
  {
    -[SBDashBoardCameraPageViewController _transitionAppViewWithProgress:transitionMode:](self, "_transitionAppViewWithProgress:transitionMode:", 2, 1.0);
    v4 = 1.0;
    v5 = 0.0;
  }
  else
  {
    -[SBDashBoardCameraPageViewController setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 0);
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
    v4 = 0.5;
    v5 = 1.0;
  }
  -[SBDashBoardCameraPageViewController _updateCameraScale:dimmingAlpha:transitionMode:](self, "_updateCameraScale:dimmingAlpha:transitionMode:", 2, v4, v5);
}

- (CGPoint)_convertTranslationFromContainerOrientationToContentOrientation:(CGPoint)a3
{
  uint64_t v4;
  CSHostedEntityViewController *hostedEntityViewController;
  uint64_t v6;
  void *v7;
  double tx;
  double ty;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform v12;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGPoint result;

  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, a3.x, a3.y);
  v4 = -[SBDashBoardCameraPageViewController interfaceOrientation](self, "interfaceOrientation");
  hostedEntityViewController = self->_hostedEntityViewController;
  if (hostedEntityViewController)
  {
    v6 = -[CSHostedEntityViewController hostableEntityOrientation](hostedEntityViewController, "hostableEntityOrientation");
  }
  else
  {
    -[SBDashBoardHostedAppViewController appView](self->_appViewController, "appView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "orientation");

  }
  if (v4 != v6)
  {
    memset(&v14, 0, sizeof(v14));
    SBFTransformFromOrientationToOrientation();
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformInvert(&t2, &t1);
    t1 = v15;
    CGAffineTransformConcat(&v12, &t1, &t2);
    v10 = v14;
    CGAffineTransformConcat(&t1, &v10, &v12);
    v15 = t1;
  }
  tx = v15.tx;
  ty = v15.ty;
  result.y = ty;
  result.x = tx;
  return result;
}

- (void)_prepareForInteractiveGestureToCameraVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  -[UIViewController view](self->_appViewControllerContainerVC, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  v6 = 0.5;
  if (v3)
  {
    v7 = 1.0;
  }
  else
  {
    v6 = 1.0;
    v7 = 0.0;
  }
  -[UIViewFloatAnimatableProperty setValue:](self->_scaleProperty, "setValue:", v6);
  -[UIViewFloatAnimatableProperty setValue:](self->_alphaProperty, "setValue:", v7);
  self->_interactiveDismissalInProgress = 1;
}

- (void)_resetAfterInteractiveGestureToCameraVisible:(BOOL)a3
{
  UIViewFloatAnimatableProperty *scaleProperty;
  double v5;
  double v6;

  scaleProperty = self->_scaleProperty;
  v5 = 0.5;
  if (a3)
  {
    v5 = 1.0;
    v6 = 0.0;
  }
  else
  {
    v6 = 1.0;
  }
  -[UIViewFloatAnimatableProperty setValue:](scaleProperty, "setValue:", v5);
  -[UIViewFloatAnimatableProperty setValue:](self->_alphaProperty, "setValue:", v6);
  self->_interactiveDismissalInProgress = 0;
}

- (BOOL)_shouldCancelInteractiveDismissGesture
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIViewFloatAnimatableProperty presentationValue](self->_scaleProperty, "presentationValue");
  v4 = v3;
  -[UIViewFloatAnimatableProperty velocity](self->_scaleProperty, "velocity");
  v6 = v4 + v5 / 1000.0 * 0.99 / 0.01;
  v7 = 0.0;
  if (v6 <= 1.0)
    v7 = 1.0 - v6;
  return fabs(v7) < vabdd_f64(0.8, v6);
}

- (void)_createProperties
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *scaleProperty;
  SBFFluidBehaviorSettings *v5;
  SBFFluidBehaviorSettings *scaleSettings;
  SBFFluidBehaviorSettings *v7;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *alphaProperty;
  SBFFluidBehaviorSettings *v10;
  SBFFluidBehaviorSettings *alphaSettings;
  SBFFluidBehaviorSettings *v12;
  void *v13;
  UIViewFloatAnimatableProperty *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[3];
  CAFrameRateRange v23;
  CAFrameRateRange v24;

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  scaleProperty = self->_scaleProperty;
  self->_scaleProperty = v3;

  -[UIViewFloatAnimatableProperty setValue:](self->_scaleProperty, "setValue:", 1.0);
  -[UIViewFloatAnimatableProperty setVelocityUsableForVFD:](self->_scaleProperty, "setVelocityUsableForVFD:", 1);
  v5 = (SBFFluidBehaviorSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  scaleSettings = self->_scaleSettings;
  self->_scaleSettings = v5;

  -[SBFFluidBehaviorSettings setBehaviorType:](self->_scaleSettings, "setBehaviorType:", 2);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_scaleSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_scaleSettings, "setResponse:", 0.5);
  v7 = self->_scaleSettings;
  v23 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v7, "setFrameRateRange:highFrameRateReason:", 1114127, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);
  v8 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  alphaProperty = self->_alphaProperty;
  self->_alphaProperty = v8;

  -[UIViewFloatAnimatableProperty setValue:](self->_alphaProperty, "setValue:", 1.0);
  -[UIViewFloatAnimatableProperty setVelocityUsableForVFD:](self->_alphaProperty, "setVelocityUsableForVFD:", 1);
  v10 = (SBFFluidBehaviorSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  alphaSettings = self->_alphaSettings;
  self->_alphaSettings = v10;

  -[SBFFluidBehaviorSettings setBehaviorType:](self->_alphaSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_alphaSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_alphaSettings, "setResponse:", 0.25);
  v12 = self->_alphaSettings;
  v24 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v12, "setFrameRateRange:highFrameRateReason:", 1114127, *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);
  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x1E0CEABB0];
  v14 = self->_alphaProperty;
  v22[0] = self->_scaleProperty;
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__SBDashBoardCameraPageViewController__createProperties__block_invoke;
  v19[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v20, &location);
  v17[0] = v16;
  v17[1] = 3221225472;
  v17[2] = __56__SBDashBoardCameraPageViewController__createProperties__block_invoke_2;
  v17[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v13, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v15, v19, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __56__SBDashBoardCameraPageViewController__createProperties__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForPropertyChangedForPresentation:", 0);

}

void __56__SBDashBoardCameraPageViewController__createProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForPropertyChangedForPresentation:", 1);

}

- (void)_updateForPropertyChangedForPresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIViewFloatAnimatableProperty *scaleProperty;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  void *v12;
  void *v13;
  UIView *tintView;
  void *v15;
  CGFloat v16;
  double v17;
  double v18;
  CATransform3D v19;
  CATransform3D m;
  CATransform3D v21;
  CGAffineTransform v22;

  v3 = a3;
  -[UIViewController view](self->_appViewControllerContainerVC, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, 1.0, 1.0);
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    scaleProperty = self->_scaleProperty;
    if (!v3)
    {
      -[UIViewFloatAnimatableProperty value](scaleProperty, "value");
      memset(&v22, 0, sizeof(v22));
      CGAffineTransformMakeScale(&v22, v16, v16);
LABEL_10:
      -[UIViewFloatAnimatableProperty value](self->_alphaProperty, "value");
      v18 = v17;
      *(_OWORD *)&v21.m11 = *(_OWORD *)&v22.a;
      *(_OWORD *)&v21.m13 = *(_OWORD *)&v22.c;
      *(_OWORD *)&v21.m21 = *(_OWORD *)&v22.tx;
      objc_msgSend(v5, "setTransform:", &v21);
      -[UIView setAlpha:](self->_tintView, "setAlpha:", v18);
      goto LABEL_11;
    }
    -[UIViewFloatAnimatableProperty presentationValue](scaleProperty, "presentationValue");
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, v7, v7);
  }
  -[UIViewFloatAnimatableProperty presentationValue](self->_alphaProperty, "presentationValue");
  v9 = v8;
  v10 = 1.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    -[UIViewFloatAnimatableProperty velocity](self->_scaleProperty, "velocity");
    v10 = v11;
  }
  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&m.m11 = *(_OWORD *)&v22.a;
  *(_OWORD *)&m.m13 = *(_OWORD *)&v22.c;
  *(_OWORD *)&m.m21 = *(_OWORD *)&v22.tx;
  CATransform3DMakeAffineTransform(&v21, (CGAffineTransform *)&m);
  memset(&m, 0, sizeof(m));
  CATransform3DMakeScale(&m, v10, v10, 0.0);
  v19 = v21;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = m;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPresentationValue:velocity:preferredFrameRateRangeMaximum:forKey:", v12, v13, 120, CFSTR("transform"));

  tintView = self->_tintView;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _setPresentationValue:forKey:](tintView, "_setPresentationValue:forKey:", v15, CFSTR("alpha"));

LABEL_11:
}

- (int64_t)_sbAnimationUpdateModeForCoverSheetTransitionMode:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = 3;
  if (a3 == 3)
    return 5;
  else
    return v3;
}

- (void)_updateCameraScale:(double)a3 transitionMode:(int64_t)a4
{
  int64_t v6;
  SBFFluidBehaviorSettings *scaleSettings;
  _QWORD v8[6];

  v6 = -[SBDashBoardCameraPageViewController _sbAnimationUpdateModeForCoverSheetTransitionMode:](self, "_sbAnimationUpdateModeForCoverSheetTransitionMode:", a4);
  scaleSettings = self->_scaleSettings;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SBDashBoardCameraPageViewController__updateCameraScale_transitionMode___block_invoke;
  v8[3] = &unk_1E8E9DE88;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", scaleSettings, v6, v8, 0);
}

uint64_t __73__SBDashBoardCameraPageViewController__updateCameraScale_transitionMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "setValue:", *(double *)(a1 + 40));
}

- (void)_updateDimmingAlpha:(double)a3 transitionMode:(int64_t)a4
{
  int64_t v6;
  SBFFluidBehaviorSettings *alphaSettings;
  _QWORD v8[6];

  v6 = -[SBDashBoardCameraPageViewController _sbAnimationUpdateModeForCoverSheetTransitionMode:](self, "_sbAnimationUpdateModeForCoverSheetTransitionMode:", a4);
  alphaSettings = self->_alphaSettings;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SBDashBoardCameraPageViewController__updateDimmingAlpha_transitionMode___block_invoke;
  v8[3] = &unk_1E8E9DE88;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", alphaSettings, v6, v8, 0);
}

uint64_t __74__SBDashBoardCameraPageViewController__updateDimmingAlpha_transitionMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "setValue:", *(double *)(a1 + 40));
}

- (void)_updateCameraScale:(double)a3 dimmingAlpha:(double)a4
{
  -[SBDashBoardCameraPageViewController _updateCameraScale:dimmingAlpha:transitionMode:](self, "_updateCameraScale:dimmingAlpha:transitionMode:", 3, a3, a4);
}

- (void)_updateCameraScale:(double)a3 dimmingAlpha:(double)a4 transitionMode:(int64_t)a5
{
  -[SBDashBoardCameraPageViewController _updateCameraScale:transitionMode:](self, "_updateCameraScale:transitionMode:", a3);
  -[SBDashBoardCameraPageViewController _updateDimmingAlpha:transitionMode:](self, "_updateDimmingAlpha:transitionMode:", a5, a4);
}

- (CSHostableEntity)hostedEntity
{
  return self->_hostedEntity;
}

- (SBDashBoardCameraPageViewControllerDelegate)cameraPageDelegate
{
  return (SBDashBoardCameraPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_cameraPageDelegate);
}

- (BOOL)wantsHomeGestureOwnership
{
  return self->_wantsHomeGestureOwnership;
}

- (SBHomeGestureInteraction)homeGestureInteraction
{
  return self->_homeGestureInteraction;
}

- (void)setHomeGestureInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureInteraction, a3);
}

- (UIViewFloatAnimatableProperty)scaleProperty
{
  return self->_scaleProperty;
}

- (void)setScaleProperty:(id)a3
{
  objc_storeStrong((id *)&self->_scaleProperty, a3);
}

- (UIViewFloatAnimatableProperty)alphaProperty
{
  return self->_alphaProperty;
}

- (void)setAlphaProperty:(id)a3
{
  objc_storeStrong((id *)&self->_alphaProperty, a3);
}

- (SBFFluidBehaviorSettings)scaleSettings
{
  return self->_scaleSettings;
}

- (void)setScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scaleSettings, a3);
}

- (SBFFluidBehaviorSettings)alphaSettings
{
  return self->_alphaSettings;
}

- (void)setAlphaSettings:(id)a3
{
  objc_storeStrong((id *)&self->_alphaSettings, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (SBAudioCategoryZStackPolicyAssistant)audioCategoryZStackPolicyAssistant
{
  return self->_audioCategoryZStackPolicyAssistant;
}

- (void)setAudioCategoryZStackPolicyAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, a3);
}

- (SBSystemApertureZStackPolicyAssistant)systemApertureZStackPolicyAssistant
{
  return self->_systemApertureZStackPolicyAssistant;
}

- (void)setSystemApertureZStackPolicyAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, a3);
}

- (SBPhysicalButtonZStackPolicyAssistant)physicalButtonZStackPolicyAssistant
{
  return self->_physicalButtonZStackPolicyAssistant;
}

- (void)setPhysicalButtonZStackPolicyAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_alphaSettings, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);
  objc_storeStrong((id *)&self->_alphaProperty, 0);
  objc_storeStrong((id *)&self->_scaleProperty, 0);
  objc_storeStrong((id *)&self->_homeGestureInteraction, 0);
  objc_destroyWeak((id *)&self->_cameraPageDelegate);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_prewarmCancelTimer, 0);
  objc_storeStrong((id *)&self->_prewarmDebounceTimer, 0);
  objc_storeStrong((id *)&self->_appViewControllerContainerVC, 0);
  objc_storeStrong((id *)&self->_orientedContentViewController, 0);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_appViewController, 0);
  objc_storeStrong((id *)&self->_hostedEntityViewController, 0);
  objc_storeStrong((id *)&self->_hostedEntity, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
}

@end
