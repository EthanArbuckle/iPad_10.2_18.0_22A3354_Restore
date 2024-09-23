@implementation SBUIStartupFromOverlayAnimationController

- (SBUIStartupFromOverlayAnimationController)initWithTransitionContextProvider:(id)a3
{
  return -[SBUIStartupFromOverlayAnimationController initWithTransitionContextProvider:overlay:](self, "initWithTransitionContextProvider:overlay:", a3, 0);
}

- (SBUIStartupFromOverlayAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7;
  id v8;
  SBUIStartupFromOverlayAnimationController *v9;
  SBUIStartupFromOverlayAnimationController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIStartupFromOverlayAnimationController.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SBUIStartupFromOverlayAnimationController;
  v9 = -[SBUIMainScreenAnimationController initWithTransitionContextProvider:](&v13, sel_initWithTransitionContextProvider_, v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_overlay, a4);

  return v10;
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
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  SBDeviceApplicationSceneView *v19;
  void *v20;
  double v21;
  double v22;
  SBSceneView *v23;
  SBSceneView *sceneView;
  id v25;
  BSUIOrientationTransformWrapperView *v26;
  BSUIOrientationTransformWrapperView *orientationWrapperView;
  uint64_t v28;
  id v29;

  -[SBUIAnimationController toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SBUIMainScreenAnimationController transitionRequest](self, "transitionRequest");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "applicationContext");
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

    objc_msgSend(v12, "_windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "switcherController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isChamoisWindowingUIEnabled");

    if (v12)
    {
      if ((v15 & 1) == 0)
      {
        -[SBUIMainScreenAnimationController _getTransitionWindow](self, "_getTransitionWindow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v16, "_windowInterfaceOrientation");

        v17 = objc_msgSend(v12, "currentInterfaceOrientation");
        -[SBUIAnimationController containerView](self, "containerView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = [SBDeviceApplicationSceneView alloc];
        objc_msgSend(v29, "displayConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v23 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](v19, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v12, v17, v28, self, v21, v22);
        sceneView = self->_sceneView;
        self->_sceneView = v23;

        v25 = objc_alloc(MEMORY[0x1E0D01940]);
        objc_msgSend(v18, "bounds");
        v26 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v25, "initWithFrame:");
        orientationWrapperView = self->_orientationWrapperView;
        self->_orientationWrapperView = v26;

        -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_orientationWrapperView, "setContainerOrientation:", v28);
        -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_orientationWrapperView, "setContentOrientation:", v17);
        -[BSUIOrientationTransformWrapperView addContentView:](self->_orientationWrapperView, "addContentView:", self->_sceneView);
        -[SBSceneView setDisplayMode:animationFactory:completion:](self->_sceneView, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
        objc_msgSend(v18, "addSubview:", self->_orientationWrapperView);

      }
    }

  }
}

- (void)_startAnimation
{
  BSAnimationSettings *animationSettings;
  BKSDisplayRenderOverlay *overlay;
  double v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[5];

  animationSettings = self->_animationSettings;
  overlay = self->_overlay;
  if (animationSettings)
  {
    -[BKSDisplayRenderOverlay dismissWithAnimation:](overlay, "dismissWithAnimation:");
    -[BSAnimationSettings duration](self->_animationSettings, "duration");
    v6 = v5;
    -[BSAnimationSettings delay](self->_animationSettings, "delay");
    v8 = dispatch_time(0, (uint64_t)((v6 + v7) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[BKSDisplayRenderOverlay dismiss](overlay, "dismiss");
    -[SBTransaction queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke_2;
    v10[3] = &unk_1E8E9DED8;
    v10[4] = self;
    dispatch_async(v9, v10);

  }
}

uint64_t __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFinish");
}

uint64_t __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke_2(uint64_t a1)
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
  v3.super_class = (Class)SBUIStartupFromOverlayAnimationController;
  -[SBUIMainScreenAnimationController _cleanupAnimation](&v3, sel__cleanupAnimation);
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return CFSTR("SBUIStartupFromOverlayAnimationController");
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
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
}

@end
