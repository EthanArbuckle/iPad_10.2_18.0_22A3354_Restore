@implementation SBUIStartupFromBlackAnimationController

- (SBUIStartupFromBlackAnimationController)initWithTransitionContextProvider:(id)a3
{
  SBUIStartupFromBlackAnimationController *v3;
  SBUIStartupFromBlackAnimationController *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UIView *internalContainerView;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBUIStartupFromBlackAnimationController;
  v3 = -[SBUIMainScreenAnimationController initWithTransitionContextProvider:](&v12, sel_initWithTransitionContextProvider_, a3);
  v4 = v3;
  if (v3)
  {
    -[SBUIStartupFromBlackAnimationController _getTransitionWindow](v3, "_getTransitionWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v5, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    internalContainerView = v4->_internalContainerView;
    v4->_internalContainerView = (UIView *)v7;

    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStartupFadeAnimation")) & 1) != 0)
    {
      objc_msgSend(v5, "rootViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v5;
    }
    objc_msgSend(v10, "addSubview:", v4->_internalContainerView);
    -[SBUIStartupFromBlackAnimationController _showBlackView](v4, "_showBlackView");

  }
  return v4;
}

- (id)_getTransitionWindow
{
  if (_getTransitionWindow___once_0 != -1)
    dispatch_once(&_getTransitionWindow___once_0, &__block_literal_global_301);
  return (id)_getTransitionWindow___instance_0;
}

uint64_t __63__SBUIStartupFromBlackAnimationController__getTransitionWindow__block_invoke()
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
  v3 = -[SBWindow initWithWindowScene:role:debugName:](v0, "initWithWindowScene:role:debugName:", v2, CFSTR("SBTraitsParticipantRoleStartupFadeAnimation"), CFSTR("FadeWindow"));
  v4 = (void *)_getTransitionWindow___instance_0;
  _getTransitionWindow___instance_0 = v3;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStartupFadeAnimation")))
  {
    v5 = (void *)_getTransitionWindow___instance_0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v5, "setRootViewController:", v6);

  }
  objc_msgSend((id)_getTransitionWindow___instance_0, "setWindowLevel:", *MEMORY[0x1E0CEB660] + 1.0);
  objc_msgSend((id)_getTransitionWindow___instance_0, "setHidden:", 0);
  return objc_msgSend((id)_getTransitionWindow___instance_0, "setAlpha:", 1.0);
}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SBUIStartupFromBlackAnimationController _getTransitionWindow](self, "_getTransitionWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  v6.receiver = self;
  v6.super_class = (Class)SBUIStartupFromBlackAnimationController;
  -[SBUIAnimationController _setHidden:](&v6, sel__setHidden_, v3);
}

- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary
{
  return self->_waitsForAppActivation;
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (void)_prepareAnimation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  SBDeviceApplicationSceneView *v16;
  void *v17;
  double v18;
  double v19;
  SBDeviceApplicationSceneView *v20;
  SBDeviceApplicationSceneView *sceneView;
  id v22;
  BSUIOrientationTransformWrapperView *v23;
  BSUIOrientationTransformWrapperView *orientationWrapperView;
  id v25;

  -[SBUIAnimationController toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SBUIMainScreenAnimationController transitionRequest](self, "transitionRequest");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applicationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "elementWithRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workspaceEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "deviceApplicationSceneEntity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v9, "sceneHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SBUIStartupFromBlackAnimationController _getTransitionWindow](self, "_getTransitionWindow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_windowInterfaceOrientation");

      v15 = objc_msgSend(v12, "currentInterfaceOrientation");
      v16 = [SBDeviceApplicationSceneView alloc];
      objc_msgSend(v25, "displayConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v20 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](v16, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v12, v14, v15, self, v18, v19);
      sceneView = self->_sceneView;
      self->_sceneView = v20;

      v22 = objc_alloc(MEMORY[0x1E0D01940]);
      -[UIView bounds](self->_internalContainerView, "bounds");
      v23 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v22, "initWithFrame:");
      orientationWrapperView = self->_orientationWrapperView;
      self->_orientationWrapperView = v23;

      -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_orientationWrapperView, "setContainerOrientation:", v14);
      -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_orientationWrapperView, "setContentOrientation:", v15);
      -[BSUIOrientationTransformWrapperView addContentView:](self->_orientationWrapperView, "addContentView:", self->_sceneView);
      -[SBSceneView setDisplayMode:animationFactory:completion:](self->_sceneView, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
      -[UIView addSubview:](self->_internalContainerView, "addSubview:", self->_orientationWrapperView);
      -[UIView sendSubviewToBack:](self->_internalContainerView, "sendSubviewToBack:", self->_orientationWrapperView);
    }

  }
}

- (void)_startAnimation
{
  BSAnimationSettings *animationSettings;
  _QWORD v3[5];
  _QWORD v4[5];

  animationSettings = self->_animationSettings;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke_2;
  v3[3] = &unk_1E8E9E980;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:completion:", animationSettings, v4, v3);
}

uint64_t __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setAlpha:", 0.0);
}

uint64_t __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFinish");
}

- (void)_cleanupAnimation
{
  BSUIOrientationTransformWrapperView *orientationWrapperView;
  SBDeviceApplicationSceneView *sceneView;
  UIView *internalContainerView;
  void *v6;
  objc_super v7;

  -[BSUIOrientationTransformWrapperView removeFromSuperview](self->_orientationWrapperView, "removeFromSuperview");
  orientationWrapperView = self->_orientationWrapperView;
  self->_orientationWrapperView = 0;

  -[SBDeviceApplicationSceneView removeFromSuperview](self->_sceneView, "removeFromSuperview");
  -[SBDeviceApplicationSceneView invalidate](self->_sceneView, "invalidate");
  sceneView = self->_sceneView;
  self->_sceneView = 0;

  -[UIView removeFromSuperview](self->_internalContainerView, "removeFromSuperview");
  internalContainerView = self->_internalContainerView;
  self->_internalContainerView = 0;

  -[SBUIStartupFromBlackAnimationController _getTransitionWindow](self, "_getTransitionWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  v7.receiver = self;
  v7.super_class = (Class)SBUIStartupFromBlackAnimationController;
  -[SBUIMainScreenAnimationController _cleanupAnimation](&v7, sel__cleanupAnimation);
}

- (void)_showBlackView
{
  id v3;
  UIView *v4;
  UIView *blackView;
  UIView *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[UIView bounds](self->_internalContainerView, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  blackView = self->_blackView;
  self->_blackView = v4;

  v6 = self->_blackView;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView setAlpha:](self->_blackView, "setAlpha:", 1.0);
  -[UIView addSubview:](self->_internalContainerView, "addSubview:", self->_blackView);
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return CFSTR("SBUIStartupFromBlackAnimationController");
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return 1000;
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (BOOL)waitsForAppActivation
{
  return self->_waitsForAppActivation;
}

- (void)setWaitsForAppActivation:(BOOL)a3
{
  self->_waitsForAppActivation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_orientationWrapperView, 0);
  objc_storeStrong((id *)&self->_blackView, 0);
  objc_storeStrong((id *)&self->_internalContainerView, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
