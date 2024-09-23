@implementation SBFocusActivityPickerTransientOverlayViewController

- (void)viewDidLoad
{
  void *v3;
  MTMaterialView *v4;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapGesture;
  FCUIActivityPickerViewController *v9;
  FCUIActivityPickerViewController *activityPickerViewController;
  FCUIActivityPickerViewController *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[SBFocusActivityPickerTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 20, 2, 0.0);
  v4 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v4;

  v6 = self->_backgroundMaterialView;
  objc_msgSend(v3, "bounds");
  -[MTMaterialView setFrame:](v6, "setFrame:");
  -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
  -[SBTransientOverlayViewController addPresentationBackgroundView:](self, "addPresentationBackgroundView:", self->_backgroundMaterialView);
  v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTap_);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v7;

  objc_msgSend(v3, "addGestureRecognizer:", self->_tapGesture);
  v9 = (FCUIActivityPickerViewController *)objc_alloc_init(MEMORY[0x1E0D22388]);
  activityPickerViewController = self->_activityPickerViewController;
  self->_activityPickerViewController = v9;

  v11 = self->_activityPickerViewController;
  -[SBFocusActivityPickerTransientOverlayViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityPickerViewController setFooterPinnedToBottom:](v11, "setFooterPinnedToBottom:", objc_msgSend(v12, "userInterfaceIdiom") == 0);

  -[FCUIActivityPickerViewController view](self->_activityPickerViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v3, "addSubview:", v13);
  objc_msgSend(v13, "setAlpha:", 0.0);
  -[SBFocusActivityPickerTransientOverlayViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_activityPickerViewController, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
  -[SBFocusActivityPickerTransientOverlayViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[SBFocusActivityPickerTransientOverlayViewController _dismiss:](self, "_dismiss:", v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)handleGestureDismissal
{
  -[SBFocusActivityPickerTransientOverlayViewController _dismiss:](self, "_dismiss:", 1);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 5;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 5;
}

- (CGRect)_contractedFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  CGRect result;

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFocusActivityPickerTransientOverlayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultIslandFrameInCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (!-[SBFocusActivityPickerTransientOverlayViewController _shouldUseCondensedFrame:](self, "_shouldUseCondensedFrame:", v6, v8, v10, v12))
  {
    -[SBFocusActivityPickerTransientOverlayViewController _contractedFrameNotTargetingSystemAperture](self, "_contractedFrameNotTargetingSystemAperture");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_shouldUseCondensedFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  double MidY;
  BOOL v9;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFocusActivityPickerTransientOverlayViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  MidY = CGRectGetMidY(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = MidY > CGRectGetMaxY(v12);

  return v9;
}

- (CGRect)_contractedFrameNotTargetingSystemAperture
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[SBFocusActivityPickerTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SBFocusActivityPickerTransientOverlayViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", self->_activityPickerViewController, v5, v7);
  v17 = v8;
  BSRectWithSize();
  -[SBFocusActivityPickerTransientOverlayViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[SBFocusActivityPickerTransientOverlayViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  UIRectCenteredXInRectScale();
  v12 = v11;

  v13 = -74.0;
  v14 = 74.0;
  v15 = v12;
  v16 = v17;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (void)_performTransitionForPresentation:(BOOL)a3 contextProvider:(id)a4 actions:(id)a5 usingAnimationWorkaround:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "isAnimated"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke;
    v14[3] = &unk_1E8EAB2E0;
    v17 = a3;
    v14[4] = self;
    v16 = v11;
    v15 = v10;
    v12 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v14);
    v13 = v12;
    if (v6)
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    else
      v12[2](v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    objc_msgSend(v10, "completeTransition:", 1);
  }

}

void __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _SBFocusAnimator *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CAFrameRateRange v19;

  v2 = (void *)MEMORY[0x1E0D016B0];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.23;
  }
  objc_msgSend(v2, "settingsWithDuration:timingFunction:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  objc_msgSend(v6, "setHighFrameRateReason:", 1703937);
  v7 = objc_alloc_init(MEMORY[0x1E0CEAF60]);
  objc_msgSend(v6, "duration");
  objc_msgSend(v7, "_setDuration:");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContainerView:", v8);
  v9 = objc_alloc_init(_SBFocusAnimator);
  objc_msgSend(v7, "_setAnimator:", v9);
  v10 = MEMORY[0x1E0C809B0];
  v11 = (void *)MEMORY[0x1E0CEABB0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_2;
  v16[3] = &unk_1E8E9F1E8;
  v12 = *(id *)(a1 + 48);
  v17 = v7;
  v18 = v12;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_3;
  v14[3] = &unk_1E8E9E980;
  v15 = *(id *)(a1 + 40);
  v13 = v7;
  objc_msgSend(v11, "_animateWithAnimationSettings:animations:completion:", v6, v16, v14);

}

void __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_transitionCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
  v9 = &unk_1E8EBAB40;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](&v6);
  objc_msgSend(*(id *)(a1 + 32), "_performTransitionForPresentation:contextProvider:actions:usingAnimationWorkaround:", 1, v4, v5, 1, v6, v7, v8, v9, v10);

}

void __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  double v47;
  _QWORD v48[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "sizeForChildContentContainer:withParentContainerSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384), v7, v9);
  BSRectWithSize();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v46 = v11;
  UIRectCenteredIntegralRectScale();
  v47 = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(*(id *)(a1 + 32), "view", v46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaInsets");
  v21 = v20;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contractedFrame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "superview");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertRect:toView:", v32, v24, v26, v28, v30);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
  v48[3] = &unk_1E8E9DED8;
  v48[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v48);
  objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activeActivity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    v44 = v42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "defaultActivity");
    v44 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", v44, 1, v4, v47, v14, v16, v18 - v21, v34, v36, v38, v40);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setWeighting:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");

}

void __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setWeighting:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v9 = &unk_1E8EBAB40;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](&v6);
  objc_msgSend(*(id *)(a1 + 32), "_performTransitionForPresentation:contextProvider:actions:usingAnimationWorkaround:", 0, v4, v5, 0, v6, v7, v8, v9, v10);

}

void __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contractedFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activeActivity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v29 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "defaultActivity");
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", v29, 1, v4, v17, v19, v21, v23);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setWeighting:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  if (self->_activityPickerViewController == a3)
  {
    CCUIDefaultExpandedContentModuleWidth();
    UISizeRoundToScale();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
    -[SBFocusActivityPickerTransientOverlayViewController sizeForChildContentContainer:withParentContainerSize:](&v6, sel_sizeForChildContentContainer_withParentContainerSize_, a4.width, a4.height);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  CGAffineTransform v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v9, 0, sizeof(v9));
  if (!CGAffineTransformIsIdentity(&v9))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __106__SBFocusActivityPickerTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E8EAC0A0;
    v8[4] = self;
    *(double *)&v8[5] = width;
    *(double *)&v8[6] = height;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
  }

}

void __106__SBFocusActivityPickerTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "sizeForChildContentContainer:withParentContainerSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384), *(double *)(a1 + 40), *(double *)(a1 + 48));
  BSRectWithSize();
  BSRectWithSize();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v12 = v3;
  UIRectCenteredXInRectScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "view", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v13, "setNeedsLayout");
  objc_msgSend(v13, "layoutIfNeeded");

}

- (void)_dismiss:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBFocusActivityPickerTransientOverlayViewController__dismiss___block_invoke;
  v6[3] = &unk_1E8E9F508;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(v5, "dismissTransientOverlayViewController:animated:completion:", self, v3, v6);

}

void __64__SBFocusActivityPickerTransientOverlayViewController__dismiss___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1408));
  objc_msgSend(WeakRetained, "focusActivityPickerTransientOverlayViewController:didDismiss:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)_handleTap:(id)a3
{
  if (self->_tapGesture == a3)
    -[SBFocusActivityPickerTransientOverlayViewController _dismiss:](self, "_dismiss:", 1);
}

- (SBFocusActivityPickerTransientOverlayViewControllerDelegate)delegate
{
  return (SBFocusActivityPickerTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_activityPickerViewController, 0);
}

@end
