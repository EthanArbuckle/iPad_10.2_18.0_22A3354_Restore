@implementation SBUIStartupToUserSetupAppZoomInAnimationController

- (SBUIStartupToUserSetupAppZoomInAnimationController)initWithTransitionContextProvider:(id)a3
{
  return -[SBUIStartupToUserSetupAppZoomInAnimationController initWithTransitionContextProvider:overlay:](self, "initWithTransitionContextProvider:overlay:", a3, 0);
}

- (SBUIStartupToUserSetupAppZoomInAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7;
  id v8;
  SBUIStartupToUserSetupAppZoomInAnimationController *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  SEL v26;
  id v27;
  id obj;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIStartupToUserSetupAppZoomInAnimationController.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  v29.receiver = self;
  v29.super_class = (Class)SBUIStartupToUserSetupAppZoomInAnimationController;
  v9 = -[SBUIMainScreenAnimationController initWithTransitionContextProvider:](&v29, sel_initWithTransitionContextProvider_, v7);
  if (v9)
  {
    v27 = v8;
    obj = a4;
    objc_msgSend(v7, "applicationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationSceneEntityForLayoutRole:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "application");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSetup");

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBUIStartupToUserSetupAppZoomInAnimationController.m"), 55, CFSTR("This transition can only run with Buddy/Setup."));

    }
    v26 = a2;
    objc_msgSend(v7, "applicationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "elementWithRole:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "workspaceEntity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applicationSceneEntity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "application");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, v9, CFSTR("SBUIStartupToUserSetupAppZoomInAnimationController.m"), 56, CFSTR("Buddy's role must be primary"));

    }
    objc_storeStrong((id *)&v9->_persistentSnapshotOverlay, obj);
    v8 = v27;
  }

  return v9;
}

- (id)_getTransitionWindow
{
  if (_getTransitionWindow___once != -1)
    dispatch_once(&_getTransitionWindow___once, &__block_literal_global_25);
  return (id)_getTransitionWindow___instance;
}

uint64_t __74__SBUIStartupToUserSetupAppZoomInAnimationController__getTransitionWindow__block_invoke()
{
  SBSecureWindow *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = [SBSecureWindow alloc];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBWindow initWithWindowScene:role:debugName:](v0, "initWithWindowScene:role:debugName:", v2, CFSTR("SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation"), CFSTR("LoginBootToSetupAppZoomIn"));
  v4 = (void *)_getTransitionWindow___instance;
  _getTransitionWindow___instance = v3;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation")))
  {
    v5 = (void *)_getTransitionWindow___instance;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v5, "setRootViewController:", v6);

  }
  return objc_msgSend((id)_getTransitionWindow___instance, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 15.0);
}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SBUIStartupToUserSetupAppZoomInAnimationController _getTransitionWindow](self, "_getTransitionWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  v6.receiver = self;
  v6.super_class = (Class)SBUIStartupToUserSetupAppZoomInAnimationController;
  -[SBUIAnimationController _setHidden:](&v6, sel__setHidden_, v3);
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary
{
  return 1;
}

- (id)animationSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 1.0);
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  SBDeviceApplicationSceneView *v16;
  void *v17;
  double v18;
  double v19;
  SBSceneView *v20;
  SBSceneView *sceneView;
  id v22;
  BSUIOrientationTransformWrapperView *v23;
  BSUIOrientationTransformWrapperView *orientationWrapperView;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  -[SBUIAnimationController containerView](self, "containerView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUIMainScreenAnimationController transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "elementWithRole:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workspaceEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deviceApplicationSceneEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v8, "sceneHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SBUIStartupToUserSetupAppZoomInAnimationController _getTransitionWindow](self, "_getTransitionWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v5;
    v13 = objc_msgSend(v12, "_windowInterfaceOrientation");

    v14 = objc_msgSend(v11, "currentInterfaceOrientation");
    -[SBUIAnimationController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [SBDeviceApplicationSceneView alloc];
    objc_msgSend(v3, "displayConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v20 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](v16, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v11, v14, v13, self, v18, v19);
    sceneView = self->_sceneView;
    self->_sceneView = v20;

    v22 = objc_alloc(MEMORY[0x1E0D01940]);
    objc_msgSend(v15, "bounds");
    v23 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v22, "initWithFrame:");
    orientationWrapperView = self->_orientationWrapperView;
    self->_orientationWrapperView = v23;

    v25 = v13;
    v5 = v27;
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_orientationWrapperView, "setContainerOrientation:", v25);
    -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_orientationWrapperView, "setContentOrientation:", v14);
    -[BSUIOrientationTransformWrapperView addContentView:](self->_orientationWrapperView, "addContentView:", self->_sceneView);
    -[SBSceneView setDisplayMode:animationFactory:completion:](self->_sceneView, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
    objc_msgSend(v15, "addSubview:", self->_orientationWrapperView);

  }
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v26);

}

- (void)_startAnimation
{
  void *v3;
  double v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[SBUIStartupToUserSetupAppZoomInAnimationController animationSettings](self, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSDisplayRenderOverlay dismissWithAnimation:](self->_persistentSnapshotOverlay, "dismissWithAnimation:", v3);
  objc_msgSend(v3, "duration");
  v5 = dispatch_time(0, (uint64_t)((v4 + 0.1) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SBUIStartupToUserSetupAppZoomInAnimationController__startAnimation__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);

}

uint64_t __69__SBUIStartupToUserSetupAppZoomInAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFinish");
}

- (void)_cleanupAnimation
{
  objc_super v3;

  -[BSUIOrientationTransformWrapperView removeFromSuperview](self->_orientationWrapperView, "removeFromSuperview");
  -[SBSceneView removeFromSuperview](self->_sceneView, "removeFromSuperview");
  -[SBSceneView invalidate](self->_sceneView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBUIStartupToUserSetupAppZoomInAnimationController;
  -[SBUIMainScreenAnimationController _cleanupAnimation](&v3, sel__cleanupAnimation);
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return CFSTR("SBUIStartupToUserSetupAppZoomInAnimationController");
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return 1000;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentSnapshotOverlay, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_orientationWrapperView, 0);
}

@end
