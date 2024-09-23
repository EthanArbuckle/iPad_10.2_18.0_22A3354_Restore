@implementation SBPIPMorphAnimatorController

- (SBPIPMorphAnimatorController)initWithTargetProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4 windowScene:(id)a5 direction:(int64_t)a6 gestureInitiated:(BOOL)a7 delegate:(id)a8 uuid:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a7;
  return -[SBPIPMorphAnimatorController initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:](self, "initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:", *(_QWORD *)&a3, a4, 0, 0, a5, a6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v10, a8, a9);
}

- (SBPIPMorphAnimatorController)initWithTargetProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4 appLayout:(id)a5 layoutRole:(int64_t)a6 appLayoutBoundingBox:(CGRect)a7 windowScene:(id)a8 direction:(int64_t)a9 gestureInitiated:(BOOL)a10 delegate:(id)a11 uuid:(id)a12
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v22;
  id v23;
  id v24;
  id v25;
  SBPIPMorphAnimatorController *v26;
  SBPIPMorphAnimatorController *v27;
  SBViewMorphAnimator *v28;
  SBViewMorphAnimator *viewMorphAnimator;
  uint64_t v30;
  SBViewMorphAnimatorDataSource *viewMorphAnimatorDataSource;
  SBViewMorphAnimator *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v39;
  objc_super v40;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v22 = a4;
  v39 = a5;
  v23 = a8;
  v24 = a11;
  v25 = a12;
  v40.receiver = self;
  v40.super_class = (Class)SBPIPMorphAnimatorController;
  v26 = -[SBPIPMorphAnimatorController init](&v40, sel_init);
  v27 = v26;
  if (v26)
  {
    v37 = v22;
    v26->_targetProcessIdentifier = a3;
    objc_storeStrong((id *)&v26->_scenePersistenceIdentifier, a4);
    objc_storeStrong((id *)&v27->_appLayout, a5);
    v27->_layoutRole = a6;
    v27->_appLayoutBoundingBox.origin.x = x;
    v27->_appLayoutBoundingBox.origin.y = y;
    v27->_appLayoutBoundingBox.size.width = width;
    v27->_appLayoutBoundingBox.size.height = height;
    v27->_gestureInitiated = a10;
    objc_storeStrong((id *)&v27->_uuid, a12);
    objc_storeWeak((id *)&v27->_delegate, v24);
    v28 = -[SBViewMorphAnimator initWithUUID:windowScene:direction:]([SBViewMorphAnimator alloc], "initWithUUID:windowScene:direction:", v25, v23, a9);
    viewMorphAnimator = v27->_viewMorphAnimator;
    v27->_viewMorphAnimator = v28;

    objc_msgSend(v24, "dataSourceForMorphAnimatorController:", v27);
    v30 = objc_claimAutoreleasedReturnValue();
    viewMorphAnimatorDataSource = v27->_viewMorphAnimatorDataSource;
    v27->_viewMorphAnimatorDataSource = (SBViewMorphAnimatorDataSource *)v30;

    -[SBViewMorphAnimator setDataSource:](v27->_viewMorphAnimator, "setDataSource:", v27->_viewMorphAnimatorDataSource);
    v32 = v27->_viewMorphAnimator;
    +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "fluidTransitionsSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "targetClippingFluidBehavior");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBViewMorphAnimator setTargetClipAnimationSettings:](v32, "setTargetClipAnimationSettings:", v35);

    v22 = v37;
    -[SBViewMorphAnimator addObserver:](v27->_viewMorphAnimator, "addObserver:", v27);
  }

  return v27;
}

- (void)setPictureInPictureContainerViewController:(id)a3
{
  id v4;
  SBViewMorphAnimator *viewMorphAnimator;
  void *v6;
  SBViewMorphAnimator *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_storeWeak((id *)&self->_pictureInPictureContainerViewController, v9);
  objc_msgSend(v9, "transitionAnimationWillBegin");
  if (-[SBViewMorphAnimator direction](self->_viewMorphAnimator, "direction") == 1)
    -[SBViewMorphAnimator setAutomaticallyStartTargetAnimations:](self->_viewMorphAnimator, "setAutomaticallyStartTargetAnimations:", 0);
  viewMorphAnimator = self->_viewMorphAnimator;
  objc_msgSend(v9, "morphAnimatorTargetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBViewMorphAnimator setTargetView:](viewMorphAnimator, "setTargetView:", v6);

  v7 = self->_viewMorphAnimator;
  objc_msgSend(v9, "morphAnimatorTargetContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBViewMorphAnimator setTargetContentView:](v7, "setTargetContentView:", v8);

}

- (void)cancel
{
  SBViewMorphAnimator *viewMorphAnimator;
  _QWORD v3[5];

  viewMorphAnimator = self->_viewMorphAnimator;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__SBPIPMorphAnimatorController_cancel__block_invoke;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = self;
  -[SBViewMorphAnimator cancel:](viewMorphAnimator, "cancel:", v3);
}

uint64_t __38__SBPIPMorphAnimatorController_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminate");
}

- (void)interrupt
{
  -[SBViewMorphAnimator interrupt:](self->_viewMorphAnimator, "interrupt:", 0);
}

- (void)_terminate
{
  id WeakRetained;
  id v4;

  if (!self->_terminated)
  {
    self->_terminated = 1;
    -[SBPIPMorphAnimatorController _performAnimatorWaitingForExternalAnimationActionBlock](self, "_performAnimatorWaitingForExternalAnimationActionBlock");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "morphAnimatorControllerDidTerminate:", self);

    v4 = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
    objc_msgSend(v4, "transitionAnimationDidEnd");

  }
}

- (void)setAnimatorWaitingForExternalAnimationActionBlock:(id)a3
{
  void *v5;
  id animatorWaitingForExternalAnimationActionBlock;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPMorphAnimatorController.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animatorWaitingForExternalAnimationActionBlock"));

  }
  if (-[SBPIPMorphAnimatorController _isWaitingForExternalAnimationCompletion](self, "_isWaitingForExternalAnimationCompletion"))
  {
    v8[2]();
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17E5550](v8);
    animatorWaitingForExternalAnimationActionBlock = self->_animatorWaitingForExternalAnimationActionBlock;
    self->_animatorWaitingForExternalAnimationActionBlock = v5;

  }
}

- (BOOL)_isWaitingForExternalAnimationCompletion
{
  return (self->_completedTargetAnimations & 7) == 3;
}

- (void)_performAnimatorWaitingForExternalAnimationActionBlock
{
  id animatorWaitingForExternalAnimationActionBlock;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x1D17E5550](self->_animatorWaitingForExternalAnimationActionBlock, a2);
  animatorWaitingForExternalAnimationActionBlock = self->_animatorWaitingForExternalAnimationActionBlock;
  self->_animatorWaitingForExternalAnimationActionBlock = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)willStartSourceAnimations:(unint64_t)a3
{
  void (**setupCompletionBlock)(void);

  setupCompletionBlock = (void (**)(void))self->_setupCompletionBlock;
  if (setupCompletionBlock)
    setupCompletionBlock[2]();
}

- (void)didEndSourceAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  id WeakRetained;

  if ((a3 & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
    objc_msgSend(WeakRetained, "transitionAnimationDidEnd");

  }
}

- (BOOL)hasCompletedTargetAnimations
{
  return -[SBViewMorphAnimator completedTargetAnimations](self->_viewMorphAnimator, "completedTargetAnimations") == 7;
}

- (BOOL)hasCompletedSourceAnimations
{
  return -[SBViewMorphAnimator completedSourceAnimations](self->_viewMorphAnimator, "completedSourceAnimations") == 15;
}

- (void)didEndTargetAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  self->_completedTargetAnimations |= a3;
  if (-[SBPIPMorphAnimatorController _isWaitingForExternalAnimationCompletion](self, "_isWaitingForExternalAnimationCompletion"))
  {
    -[SBPIPMorphAnimatorController _performAnimatorWaitingForExternalAnimationActionBlock](self, "_performAnimatorWaitingForExternalAnimationActionBlock");
  }
  else if (self->_completedTargetAnimations == 7)
  {
    -[SBPIPMorphAnimatorController _terminate](self, "_terminate");
  }
}

- (void)willRemoveTargeMatchMoveAnimationAtFrame:(CGRect)a3 withinSourceFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id WeakRetained;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[SBViewMorphAnimator dataSource](self->_viewMorphAnimator, "dataSource");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sourceSubviewFrame:inScreenSpaceForAnimator:", self->_viewMorphAnimator, v11, v10, v9, v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v40, "sourceSubviewFrame:inScreenSpaceForAnimator:", self->_viewMorphAnimator, x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.InCallService"));

  -[SBViewMorphAnimator windowScene](self->_viewMorphAnimator, "windowScene");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "switcherController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isChamoisWindowingUIEnabled");

  v35 = v31 ^ 1 | v34;
  if (v35)
    v36 = v14;
  else
    v36 = v22;
  if (v35)
    v37 = v16;
  else
    v37 = v24;
  if (v35)
    v38 = v18;
  else
    v38 = v26;
  if (v35)
    v39 = v20;
  else
    v39 = v28;
  objc_msgSend(WeakRetained, "forcePictureInPictureToFrame:", v36, v37, v38, v39);

}

- (int)targetProcessIdentifier
{
  return self->_targetProcessIdentifier;
}

- (NSString)scenePersistenceIdentifier
{
  return self->_scenePersistenceIdentifier;
}

- (SBViewMorphAnimator)viewMorphAnimator
{
  return self->_viewMorphAnimator;
}

- (SBViewMorphAnimatorDataSource)viewMorphAnimatorDataSource
{
  return self->_viewMorphAnimatorDataSource;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_appLayout, a3);
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (CGRect)appLayoutBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_appLayoutBoundingBox.origin.x;
  y = self->_appLayoutBoundingBox.origin.y;
  width = self->_appLayoutBoundingBox.size.width;
  height = self->_appLayoutBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAppLayoutBoundingBox:(CGRect)a3
{
  self->_appLayoutBoundingBox = a3;
}

- (SBPIPContainerViewController)pictureInPictureContainerViewController
{
  return (SBPIPContainerViewController *)objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
}

- (SBPIPMorphAnimatorControllerDelegate)delegate
{
  return (SBPIPMorphAnimatorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)setupCompletionBlock
{
  return self->_setupCompletionBlock;
}

- (void)setSetupCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)animatorWaitingForExternalAnimationActionBlock
{
  return self->_animatorWaitingForExternalAnimationActionBlock;
}

- (BOOL)isTerminated
{
  return self->_terminated;
}

- (int64_t)completedTargetAnimations
{
  return self->_completedTargetAnimations;
}

- (void)setCompletedTargetAnimations:(int64_t)a3
{
  self->_completedTargetAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animatorWaitingForExternalAnimationActionBlock, 0);
  objc_storeStrong(&self->_setupCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_pictureInPictureContainerViewController);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_viewMorphAnimatorDataSource, 0);
  objc_storeStrong((id *)&self->_viewMorphAnimator, 0);
  objc_storeStrong((id *)&self->_scenePersistenceIdentifier, 0);
}

@end
