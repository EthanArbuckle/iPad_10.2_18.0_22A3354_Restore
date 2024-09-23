@implementation SBDashBoardCaptureExtensionHostingFluidSwitcherViewController

- (SBDashBoardCaptureExtensionHostingFluidSwitcherViewController)initWithCaptureExtensionEntity:(id)a3
{
  id v5;
  void *v6;
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v7;
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v8;
  SBMainDisplayLayoutStateManager *v9;
  SBLayoutStateManager *layoutStateManager;
  uint64_t v11;
  SBLayoutState *layoutState;
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v13;
  objc_super v15;

  v5 = a3;
  objc_msgSend(v5, "displayItemRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
    v7 = -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController init](&v15, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_entity, a3);
      objc_storeStrong((id *)&v8->_displayItem, v6);
      v9 = objc_alloc_init(SBMainDisplayLayoutStateManager);
      layoutStateManager = v8->_layoutStateManager;
      v8->_layoutStateManager = &v9->super;

      +[SBMainDisplayLayoutStateManager _initialLayoutStateWithDisplayOrdinal:isDisplayExternal:](SBMainDisplayLayoutStateManager, "_initialLayoutStateWithDisplayOrdinal:isDisplayExternal:", 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      layoutState = v8->_layoutState;
      v8->_layoutState = (SBLayoutState *)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFluidSwitcherViewController invalidate](self->_switcherViewController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (BOOL)activateDisplayItemFromRequest:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v22;
  id v23;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "applicationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preludeAnimationTokenWrapper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consumeToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createRequestWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v9, "source");
  objc_msgSend(v14, "setSource:", v15);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __116__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_activateDisplayItemFromRequest_animated_completion___block_invoke;
  v21 = &unk_1E8E9ECA8;
  v22 = self;
  v23 = v12;
  v16 = v12;
  objc_msgSend(v14, "modifyApplicationContext:", &v18);
  LOBYTE(v5) = -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _runTransitionRequest:animated:completion:](self, "_runTransitionRequest:animated:completion:", v14, v5, v8, v18, v19, v20, v21, v22);

  return v5;
}

void __116__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_activateDisplayItemFromRequest_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBCaptureExtensionWorkspaceEntity *v4;
  void *v5;
  void *v6;
  SBCaptureExtensionWorkspaceEntity *v7;

  v3 = a2;
  v4 = [SBCaptureExtensionWorkspaceEntity alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBCaptureExtensionWorkspaceEntity initWithBundleIdentifier:hostableEntity:](v4, "initWithBundleIdentifier:hostableEntity:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104));

  +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:](SBConsumableTokenWrapper, "consumableTokenWrapperWithToken:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreludeAnimationTokenWrapper:", v6);

  objc_msgSend(v3, "setActivatingEntity:", v7);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_runTransitionRequest:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  SBLayoutState *v10;
  SBLayoutState *layoutState;
  SBWorkspaceTransaction *v12;
  SBLayoutStateTransitionContext *v13;
  void *v14;
  id v15;
  SBLayoutStateTransitionContext *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_QWORD *);
  void *v21;
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v22;
  id v23;
  SBLayoutStateTransitionContext *v24;
  id v25;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "finalize");
  objc_msgSend(v8, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutState");
  v10 = (SBLayoutState *)objc_claimAutoreleasedReturnValue();
  layoutState = self->_layoutState;
  self->_layoutState = v10;

  v12 = -[SBWorkspaceTransaction initWithTransitionRequest:]([SBWorkspaceTransaction alloc], "initWithTransitionRequest:", v8);
  v13 = -[SBLayoutStateTransitionContext initWithWorkspaceTransaction:]([SBLayoutStateTransitionContext alloc], "initWithWorkspaceTransaction:", v12);
  -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:](self->_switcherViewController, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", 0, v13);
  -[SBFluidSwitcherViewController animationControllerForTransitionRequest:](self->_switcherViewController, "animationControllerForTransitionRequest:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __107__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__runTransitionRequest_animated_completion___block_invoke;
  v21 = &unk_1E8E9E220;
  v22 = self;
  v23 = 0;
  v24 = v13;
  v25 = v7;
  v15 = v7;
  v16 = v13;
  objc_msgSend(v14, "setAnimationCompletion:", &v18);
  objc_msgSend(v14, "begin", v18, v19, v20, v21, v22);

  return 1;
}

uint64_t __107__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__runTransitionRequest_animated_completion___block_invoke(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 1048), "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", a1[5], a1[6]);
  objc_msgSend(*(id *)(a1[4] + 1048), "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", a1[5], a1[6]);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)setDismissGestureEnabled:(BOOL)a3
{
  if (self->_dismissGestureEnabled != a3)
  {
    self->_dismissGestureEnabled = a3;
    -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _updateHomeGesturePreference](self, "_updateHomeGesturePreference");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _updateHomeGesturePreference](self, "_updateHomeGesturePreference");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _updateHomeGesturePreference](self, "_updateHomeGesturePreference");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _updateHomeGesturePreference](self, "_updateHomeGesturePreference");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _updateHomeGesturePreference](self, "_updateHomeGesturePreference");
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  SBDashBoardRootSwitcherModifier *v5;
  SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *v6;
  SBDashBoardSecureFluidSwitcherViewController *v7;
  objc_class *v8;
  void *v9;
  SBDashBoardSecureFluidSwitcherViewController *v10;
  SBDashBoardSecureFluidSwitcherViewController *switcherViewController;
  void *v12;
  void *v13;
  SBDashBoardSecureFluidSwitcherViewController *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController viewIsAppearing:](&v20, sel_viewIsAppearing_, a3);
  if (!self->_switcherViewController)
  {
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _updateHomeGesturePreference](self, "_updateHomeGesturePreference");
    v5 = objc_alloc_init(SBDashBoardRootSwitcherModifier);
    v6 = -[SBDashBoardFluidSwitcherLiveContentOverlayCoordinator initWithWindowScene:]([SBDashBoardFluidSwitcherLiveContentOverlayCoordinator alloc], "initWithWindowScene:", v4);
    -[SBDashBoardFluidSwitcherLiveContentOverlayCoordinator setDataSource:](v6, "setDataSource:", self);
    v7 = [SBDashBoardSecureFluidSwitcherViewController alloc];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBFluidSwitcherViewController initWithRootModifier:liveContentOverlayCoordinator:dataSource:delegate:debugName:](v7, "initWithRootModifier:liveContentOverlayCoordinator:dataSource:delegate:debugName:", v5, v6, self, self, v9);
    switcherViewController = self->_switcherViewController;
    self->_switcherViewController = v10;

    -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSecureFluidSwitcherViewController view](self->_switcherViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_switcherViewController;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_viewIsAppearing___block_invoke;
    v17[3] = &unk_1E8E9EA00;
    v18 = v13;
    v19 = v12;
    v15 = v12;
    v16 = v13;
    -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v14, 0, v17);

  }
}

uint64_t __81__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_viewIsAppearing___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", 18);
}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "setIdleWarnMode:", 2, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setIdleTimerMode:", 1);
  objc_msgSend(v3, "setIdleTimerDuration:", 13);
  objc_msgSend(v3, "addRestrictedCapabilities:", 4104);

}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v9, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "priority:", 40, v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hidden:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fakeStatusBar:", BSSettingFlagForBool());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fakeStatusBarLevel:", &unk_1E91D07E8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addComponent:", v8);
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 27;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v8, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v6 = objc_msgSend(v4, "type");
    if (v6 == 25 || v6 == 27)
      -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController dismiss](self, "dismiss");
    v5 = 0;
  }

  return v5;
}

- (int64_t)presentationPriority
{
  return 555;
}

- (void)dismiss
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createRequestWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_dismiss__block_invoke;
  v6[3] = &unk_1E8E9EE50;
  v6[4] = self;
  objc_msgSend(v4, "modifyApplicationContext:", v6);
  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _runTransitionRequest:animated:completion:](self, "_runTransitionRequest:animated:completion:", v4, 1, 0);
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase dismiss](&v5, sel_dismiss);

}

void __72__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_dismiss__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivatingEntity:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (id)liveContentOverlayCoordinator:(id)a3 hostableEntityForDisplayItem:(id)a4
{
  CSHostableEntity *v5;

  if (objc_msgSend(a4, "isEqual:", self->_displayItem))
    v5 = self->_entity;
  else
    v5 = 0;
  return v5;
}

- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SBLayoutState *v13;
  SBLayoutState *layoutState;
  SBWorkspaceTransaction *v15;
  SBLayoutStateTransitionContext *v16;
  void *v17;
  SBLayoutStateTransitionContext *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, int);
  void *v22;
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v23;
  id v24;
  SBLayoutStateTransitionContext *v25;
  BOOL v26;
  _QWORD v27[5];
  BOOL v28;

  v6 = a4;
  if (objc_msgSend(v6, "unlockedEnvironmentMode") == 1 || objc_msgSend(v6, "unlockedEnvironmentMode") == 2)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "appLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "type") == 1;

  }
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createRequestWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __137__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke;
  v27[3] = &unk_1E8E9F398;
  v27[4] = self;
  v28 = v7;
  objc_msgSend(v10, "modifyApplicationContext:", v27);
  objc_msgSend(v10, "finalize");
  objc_msgSend(v10, "applicationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutState");
  v13 = (SBLayoutState *)objc_claimAutoreleasedReturnValue();
  layoutState = self->_layoutState;
  self->_layoutState = v13;

  v15 = -[SBWorkspaceTransaction initWithTransitionRequest:]([SBWorkspaceTransaction alloc], "initWithTransitionRequest:", v10);
  v16 = -[SBLayoutStateTransitionContext initWithWorkspaceTransaction:]([SBLayoutStateTransitionContext alloc], "initWithWorkspaceTransaction:", v15);
  -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:](self->_switcherViewController, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", 0, v16);
  -[SBFluidSwitcherViewController animationControllerForTransitionRequest:](self->_switcherViewController, "animationControllerForTransitionRequest:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __137__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke_2;
  v22 = &unk_1E8EA7218;
  v23 = self;
  v24 = 0;
  v25 = v16;
  v26 = v7;
  v18 = v16;
  objc_msgSend(v17, "setAnimationCompletion:", &v19);
  objc_msgSend(v17, "begin", v19, v20, v21, v22, v23);

}

void __137__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBCaptureExtensionWorkspaceEntity *v4;
  void *v5;
  void *v6;
  void *v7;
  SBCaptureExtensionWorkspaceEntity *v8;

  v3 = a2;
  v4 = [SBCaptureExtensionWorkspaceEntity alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBCaptureExtensionWorkspaceEntity initWithBundleIdentifier:hostableEntity:](v4, "initWithBundleIdentifier:hostableEntity:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104));

  if (*(_BYTE *)(a1 + 40))
  {
    +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActivatingEntity:", v6);

    objc_msgSend(v3, "setDeactivatingEntity:", v8);
    SBLayoutRoleIdentifierForRole(1uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreviousEntity:forKey:", v8, v7);

  }
  else
  {
    objc_msgSend(v3, "setActivatingEntity:", v8);
  }
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

uint64_t __137__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (a2)
  {
    if (*(_BYTE *)(a1 + 56))
      return objc_msgSend(*(id *)(a1 + 32), "dismiss");
  }
  return result;
}

- (BOOL)switcherContentControllerControlsHomeScreenContents:(id)a3
{
  return 0;
}

- (id)appLayoutsForSwitcherContentController:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  SBDisplayItem *displayItem;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  SBAppLayout *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = [SBAppLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  displayItem = self->_displayItem;
  v12 = v5;
  v13[0] = displayItem;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v4, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v7, 1, 1, 0);

  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3
{
  return 0;
}

- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3
{
  return -[SBFluidSwitcherViewController contentOrientation](self->_switcherViewController, "contentOrientation", a3);
}

- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SBTransitionSwitcherModifierEvent *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;

  v7 = a7;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class();
  objc_msgSend(v10, "previousLayoutState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "unlockedEnvironmentMode");
  v16 = objc_opt_class();
  objc_msgSend(v10, "layoutState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "unlockedEnvironmentMode");
  objc_msgSend(v14, "appLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SBTransitionSwitcherModifierEvent initWithTransitionID:phase:animated:]([SBTransitionSwitcherModifierEvent alloc], "initWithTransitionID:phase:animated:", v11, a6, v7);

  -[SBTransitionSwitcherModifierEvent setFromAppLayout:](v22, "setFromAppLayout:", v20);
  -[SBTransitionSwitcherModifierEvent setFromEnvironmentMode:](v22, "setFromEnvironmentMode:", v15);
  -[SBTransitionSwitcherModifierEvent setFromInterfaceOrientation:](v22, "setFromInterfaceOrientation:", objc_msgSend(v14, "interfaceOrientation"));
  objc_msgSend(v14, "elementWithRole:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setFromAppLayoutWantsExclusiveForeground:](v22, "setFromAppLayoutWantsExclusiveForeground:", objc_msgSend(v23, "hasLayoutAttributes:", 2));

  -[SBTransitionSwitcherModifierEvent setToAppLayout:](v22, "setToAppLayout:", v21);
  -[SBTransitionSwitcherModifierEvent setToEnvironmentMode:](v22, "setToEnvironmentMode:", v19);
  -[SBTransitionSwitcherModifierEvent setToInterfaceOrientation:](v22, "setToInterfaceOrientation:", objc_msgSend(v18, "interfaceOrientation"));
  objc_msgSend(v18, "elementWithRole:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setToAppLayoutWantsExclusiveForeground:](v22, "setToAppLayoutWantsExclusiveForeground:", objc_msgSend(v24, "hasLayoutAttributes:", 2));

  -[SBTransitionSwitcherModifierEvent setActivatingAppLayout:](v22, "setActivatingAppLayout:", v21);
  objc_msgSend(v10, "preludeAnimationTokenWrapper");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isTokenAvailable");

  if (a6 == 1 && v26)
  {
    objc_msgSend(v10, "preludeAnimationTokenWrapper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "consumeToken");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:](SBConsumableTokenWrapper, "consumableTokenWrapperWithToken:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent setZoomFromHardwareButtonPreludeTokenWrapper:](v22, "setZoomFromHardwareButtonPreludeTokenWrapper:", v29);

  }
  return v22;
}

- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
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

  -[SBDashBoardSecureFluidSwitcherViewController view](self->_switcherViewController, "view", a3, a4, a5, a6);
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

- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3
{
  return 0;
}

- (SBSwitcherContentViewControlling)contentViewController
{
  return (SBSwitcherContentViewControlling *)self->_switcherViewController;
}

- (BOOL)isSwitcherForegroundActive
{
  return -[CSCoverSheetViewControllerBase participantState](self, "participantState") == 2;
}

- (id)acquireSystemApertureSuppressionAssertionForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  return 0;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  return -[SBLayoutStateManager layoutStateForApplicationTransitionContext:](self->_layoutStateManager, "layoutStateForApplicationTransitionContext:", a3);
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

  -[UIViewController _sbWindowScene](self, "_sbWindowScene", a3, a4);
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

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  return self->_layoutState;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 2);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;
  BOOL result;

  -[UIViewController _sbWindowScene](self, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zStackResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  result = -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture");
  if (!v5)
    return 0;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_bottomEdgeRecognizer == a3
      && -[CSCoverSheetViewControllerBase participantState](self, "participantState") == 2;
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (BOOL)isHostingAnApp
{
  void *v2;
  BOOL v3;

  -[SBLayoutState elements](self->_layoutState, "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)hostedAppSceneHandle
{
  void *v2;
  void *v3;

  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController hostedAppSceneHandles](self, "hostedAppSceneHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hostedAppSceneHandles
{
  void *v2;
  void *v3;
  void *v4;

  -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _contentViewControllers](self, "_contentViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __86__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "hostedAppSceneHandles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)_zStackParticipantIdentifier
{
  return 9;
}

- (void)_updateHomeGesturePreference
{
  void *v3;
  SBFZStackParticipant *v4;
  SBFZStackParticipant *zStackParticipant;
  SBFZStackParticipant *v6;
  SBFZStackParticipant *v7;
  void *v8;

  if (-[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared")&& SBHomeGestureEnabled()&& self->_dismissGestureEnabled)
  {
    if (!self->_zStackParticipant)
    {
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "zStackResolver");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "acquireParticipantWithIdentifier:delegate:", -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _zStackParticipantIdentifier](self, "_zStackParticipantIdentifier"), self);
      v4 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
      zStackParticipant = self->_zStackParticipant;
      self->_zStackParticipant = v4;

    }
  }
  else
  {
    v6 = self->_zStackParticipant;
    if (v6)
    {
      -[SBFZStackParticipant invalidate](v6, "invalidate");
      v7 = self->_zStackParticipant;
      self->_zStackParticipant = 0;

    }
  }
}

- (void)_updateHomeGesture
{
  void *v3;
  void *v4;
  int v5;
  SBHomeGesturePanGestureRecognizer *bottomEdgeRecognizer;
  SBHomeGesturePanGestureRecognizer *v7;
  SBHomeGesturePanGestureRecognizer *v8;
  SBHomeGesturePanGestureRecognizer *v9;
  id v10;

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemGestureManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (v10)
  {
    v5 = -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture");
    bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
    if (v5)
    {
      if (!bottomEdgeRecognizer)
      {
        +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", self, sel__handleBottomEdgeGesture_);
        v7 = (SBHomeGesturePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
        v8 = self->_bottomEdgeRecognizer;
        self->_bottomEdgeRecognizer = v7;

        -[UIScreenEdgePanGestureRecognizer setEdges:](self->_bottomEdgeRecognizer, "setEdges:", 4);
        -[SBHomeGesturePanGestureRecognizer setDelegate:](self->_bottomEdgeRecognizer, "setDelegate:", self);
        -[SBHomeGesturePanGestureRecognizer setAllowedTouchTypes:](self->_bottomEdgeRecognizer, "setAllowedTouchTypes:", &unk_1E91CE5C0);
        objc_msgSend(v10, "addGestureRecognizer:withType:", self->_bottomEdgeRecognizer, 93);
LABEL_7:
        v4 = v10;
        goto LABEL_8;
      }
LABEL_6:
      objc_msgSend(v10, "removeGestureRecognizer:");
      v9 = self->_bottomEdgeRecognizer;
      self->_bottomEdgeRecognizer = 0;

      goto LABEL_7;
    }
    v4 = v10;
    if (bottomEdgeRecognizer)
      goto LABEL_6;
  }
LABEL_8:

}

- (void)_handleBottomEdgeGesture:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _handleBottomEdgeGestureChanged:](self, "_handleBottomEdgeGestureChanged:", v7);
    }
    else
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _handleBottomEdgeGestureBegan:](self, "_handleBottomEdgeGestureBegan:", v7);
    }
  }
  else
  {
    -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _handleBottomEdgeGestureEnded:](self, "_handleBottomEdgeGestureEnded:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_handleBottomEdgeGestureBegan:(id)a3
{
  id v4;
  void *v5;
  SBFluidSwitcherGesture *v6;
  id v7;
  id v8;
  SBFluidSwitcherGesture *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SBGestureSwitcherModifierEvent *(*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = [SBFluidSwitcherGesture alloc];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __95__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__handleBottomEdgeGestureBegan___block_invoke;
  v14 = &unk_1E8EA7280;
  objc_copyWeak(&v17, &location);
  v7 = v5;
  v15 = v7;
  v8 = v4;
  v16 = v8;
  v9 = -[SBFluidSwitcherGesture initWithType:eventProvider:](v6, "initWithType:eventProvider:", 1, &v11);
  -[SBLayoutState appLayout](self->_layoutState, "appLayout", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGesture _setSelectedAppLayout:](v9, "_setSelectedAppLayout:", v10);

  objc_storeStrong((id *)&self->_gesture, v9);
  -[SBFluidSwitcherViewController handleFluidSwitcherGestureManager:didBeginGesture:](self->_switcherViewController, "handleFluidSwitcherGestureManager:didBeginGesture:", self, self->_gesture);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

SBGestureSwitcherModifierEvent *__95__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__handleBottomEdgeGestureBegan___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  uint64_t v6;
  SBGestureSwitcherModifierEvent *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SBGestureSwitcherModifierEvent *v11;
  void *v12;
  id v13;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  v6 = SBGestureModifierPhaseForGestureState(objc_msgSend(v4, "state"));
  v7 = [SBGestureSwitcherModifierEvent alloc];
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "selectedAppLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "type");

  v11 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:](v7, "initWithGestureID:selectedAppLayout:gestureType:phase:", v8, v9, v10, v6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WeakRetained[133];
    objc_msgSend(v13, "velocityInView:", v12);
    -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v11, "setVelocityInContainerView:");
    objc_msgSend(v13, "translationInView:", v12);
    -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v11, "setTranslationInContainerView:");
    objc_msgSend(v13, "_hysteresis");
    -[SBGestureSwitcherModifierEvent setHysteresis:](v11, "setHysteresis:");
    objc_msgSend(v13, "locationInView:", v12);
    -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v11, "setLocationInContainerView:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBGestureSwitcherModifierEvent setTouchHistoryProvider:](v11, "setTouchHistoryProvider:", *(_QWORD *)(a1 + 40));

  }
  return v11;
}

- (void)_handleBottomEdgeGestureChanged:(id)a3
{
  -[SBFluidSwitcherGesture _setState:](self->_gesture, "_setState:", 2);
  -[SBFluidSwitcherViewController handleFluidSwitcherGestureManager:didUpdateGesture:](self->_switcherViewController, "handleFluidSwitcherGestureManager:didUpdateGesture:", self, self->_gesture);
}

- (void)_handleBottomEdgeGestureEnded:(id)a3
{
  SBFluidSwitcherGesture *gesture;

  -[SBFluidSwitcherGesture _setState:](self->_gesture, "_setState:", 3);
  -[SBFluidSwitcherViewController handleFluidSwitcherGestureManager:didEndGesture:](self->_switcherViewController, "handleFluidSwitcherGestureManager:didEndGesture:", self, self->_gesture);
  gesture = self->_gesture;
  self->_gesture = 0;

}

- (id)_contentViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SBLayoutState appLayout](self->_layoutState, "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  -[SBFluidSwitcherViewController liveContentOverlayForAppLayout:](self->_switcherViewController, "liveContentOverlayForAppLayout:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:
    v6 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_7;
  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (CSHostableEntity)entity
{
  return self->_entity;
}

- (BOOL)isDismissGestureEnabled
{
  return self->_dismissGestureEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_layoutStateManager, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
  objc_storeStrong((id *)&self->_bottomEdgeRecognizer, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
