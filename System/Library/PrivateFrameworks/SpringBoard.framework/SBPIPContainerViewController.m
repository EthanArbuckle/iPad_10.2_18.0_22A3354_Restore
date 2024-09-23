@implementation SBPIPContainerViewController

- (SBPIPContainerViewController)initWithPIPController:(id)a3 interactionSettings:(id)a4 adapter:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SBPIPContainerViewController *v12;
  SBPIPContainerViewController *v13;
  uint64_t v14;
  NSHashTable *observerHashTable;
  NSMutableArray *v16;
  NSMutableArray *waitInteractionAnimationsCompletionBlocks;
  uint64_t v18;
  SBFFluidBehaviorSettings *interactiveAnimationSettings;
  uint64_t v20;
  SBFFluidBehaviorSettings *stashTabAnimationSettings;
  uint64_t v22;
  SBFFluidBehaviorSettings *regionUpdateAnimationSettings;
  id v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  SBSDisplayLayoutElement *displayLayoutElement;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogPIP();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SBPIPContainerViewController initWithPIPController:interactionSettings:adapter:].cold.1();

  v30.receiver = self;
  v30.super_class = (Class)SBPIPContainerViewController;
  v12 = -[SBPIPContainerViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_pipController, v8);
    objc_storeStrong((id *)&v13->_interactionSettings, a4);
    v13->_requiredInterfaceOrientation = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    observerHashTable = v13->_observerHashTable;
    v13->_observerHashTable = (NSHashTable *)v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    waitInteractionAnimationsCompletionBlocks = v13->_waitInteractionAnimationsCompletionBlocks;
    v13->_waitInteractionAnimationsCompletionBlocks = v16;

    -[SBPIPInteractionSettings interactiveFluidBehavior](v13->_interactionSettings, "interactiveFluidBehavior");
    v18 = objc_claimAutoreleasedReturnValue();
    interactiveAnimationSettings = v13->_interactiveAnimationSettings;
    v13->_interactiveAnimationSettings = (SBFFluidBehaviorSettings *)v18;

    -[SBPIPInteractionSettings stashTabFluidBehavior](v13->_interactionSettings, "stashTabFluidBehavior");
    v20 = objc_claimAutoreleasedReturnValue();
    stashTabAnimationSettings = v13->_stashTabAnimationSettings;
    v13->_stashTabAnimationSettings = (SBFFluidBehaviorSettings *)v20;

    -[SBPIPInteractionSettings regionUpdateFluidBehavior](v13->_interactionSettings, "regionUpdateFluidBehavior");
    v22 = objc_claimAutoreleasedReturnValue();
    regionUpdateAnimationSettings = v13->_regionUpdateAnimationSettings;
    v13->_regionUpdateAnimationSettings = (SBFFluidBehaviorSettings *)v22;

    -[SBPIPContainerViewController _setAdapter:](v13, "_setAdapter:", v10);
    v24 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "initWithIdentifier:", v26);
    displayLayoutElement = v13->_displayLayoutElement;
    v13->_displayLayoutElement = (SBSDisplayLayoutElement *)v27;

    -[SBSDisplayLayoutElement setLayoutRole:](v13->_displayLayoutElement, "setLayoutRole:", 5);
    -[SBSDisplayLayoutElement setUIApplicationElement:](v13->_displayLayoutElement, "setUIApplicationElement:", 1);
  }

  return v13;
}

- (SBPIPContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SBFLoggingMethodProem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 203, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithPictureInPictureViewController:]."), v7, v9);

  return 0;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  objc_super v6;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 208, CFSTR("Attempting to dealloc without invalidating."));

  }
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SBPIPContainerViewController initWithPIPController:interactionSettings:adapter:].cold.1();

  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  -[UIViewFloatAnimatableProperty invalidate](self->_metricsAnimatableProperty, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)SBPIPContainerViewController;
  -[SBPIPContainerViewController dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  BSInvalidatable *displayLayoutElementAssertion;
  void *v5;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 217, CFSTR("Attempting to -invalidate twice; this is unsupported."));

  }
  self->_invalidated = 1;
  -[BSAbsoluteMachTimer invalidate](self->_stashedStateReduceResourcesUsageTimer, "invalidate");
  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  -[SBPIPContainerViewControllerAdapter invalidate](self->_adapter, "invalidate");
}

- (SBPIPContainerViewController)initWithCoder:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 228, CFSTR("%@ does not support unarchiving from a nib."), v7);

  return 0;
}

- (void)loadView
{
  SBPIPContainerViewControllerRootView *v3;
  UIView *v4;
  UIView *contentView;
  SBPIPContainerViewControllerRootView *v6;

  v3 = [SBPIPContainerViewControllerRootView alloc];
  v6 = -[SBPIPContainerViewControllerRootView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBPIPContainerViewControllerRootView setClipsToBounds:](v6, "setClipsToBounds:", 1);
  -[SBPIPContainerViewControllerRootView setOpaque:](v6, "setOpaque:", 0);
  -[SBPIPContainerViewController setView:](self, "setView:", v6);
  -[UIViewController view](self->_contentViewController, "view");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v4;

  -[UIView setHidden:](self->_contentView, "setHidden:", 1);
  -[SBPIPContainerViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[SBPIPContainerViewControllerRootView addSubview:](v6, "addSubview:", self->_contentView);
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);

}

- (void)noteWindowSceneDidChange
{
  -[SBPIPContainerViewController setInteractionsEnabled:](self, "setInteractionsEnabled:", 0);
  -[SBPIPContainerViewController setInteractionsEnabled:](self, "setInteractionsEnabled:", 1);
  -[SBPIPContainerViewController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", self->_wantsDisplayLayoutElement);
}

- (void)startShowingContentWithAnimationSettings:(id)a3 parameters:(id)a4 completion:(id)a5
{
  double var2;
  double var1;
  double var0;
  id v10;
  void (**v11)(_QWORD);
  id WeakRetained;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIView *contentView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  void (**v25)(_QWORD);
  _QWORD v26[5];
  CGAffineTransform v27;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a3;
  v11 = (void (**)(_QWORD))a5;
  -[UIView setHidden:](self->_contentView, "setHidden:", 0);
  -[SBMicroPIPTetheringMirrorView setHidden:](self->_microPIPTetheringViewMirror, "setHidden:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  v13 = -[SBPIPContainerViewController processIdentifier](self, "processIdentifier");
  -[SBPIPContainerViewController scenePersistenceIdentifier](self, "scenePersistenceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || v15)
  {
    if (v11)
      v11[2](v11);
  }
  else
  {
    -[SBPIPContainerViewController _addBlurFilterToView:](self, "_addBlurFilterToView:", self->_contentView);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPContainerViewController _blurSpringAnimationWithParameters:fromValue:toValue:](self, "_blurSpringAnimationWithParameters:fromValue:toValue:", v10, v16, &unk_1E91CF7A8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layer](self->_contentView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v17, CFSTR("filters.gaussianBlur.inputRadius"));

    -[UIView setAlpha:](self->_contentView, "setAlpha:", var1);
    contentView = self->_contentView;
    CGAffineTransformMakeScale(&v27, var0, var0);
    -[UIView setTransform:](contentView, "setTransform:", &v27);
    v20 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(v10, "BSAnimationSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "factoryWithSettings:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0D01908];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke;
    v26[3] = &unk_1E8E9DED8;
    v26[4] = self;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke_2;
    v24[3] = &unk_1E8E9F230;
    v24[4] = self;
    v25 = v11;
    objc_msgSend(v23, "animateWithFactory:actions:completion:", v22, v26, v24);

  }
}

uint64_t __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setAlpha:", 1.0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeBlurFilterFromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stopShowingContentWithAnimationSettings:(id)a3 parameters:(id)a4 completion:(id)a5
{
  double var2;
  double var1;
  double var0;
  id v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  _QWORD v22[8];

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a3;
  v11 = (void (**)(_QWORD))a5;
  v12 = v11;
  if (v10)
  {
    -[SBPIPContainerViewController _addBlurFilterToView:](self, "_addBlurFilterToView:", self->_contentView);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPContainerViewController _blurSpringAnimationWithParameters:fromValue:toValue:](self, "_blurSpringAnimationWithParameters:fromValue:toValue:", v10, &unk_1E91CF7A8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layer](self->_contentView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v14, CFSTR("filters.gaussianBlur.inputRadius"));

    v16 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(v10, "BSAnimationSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "factoryWithSettings:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0D01908];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke;
    v22[3] = &unk_1E8EAD3C0;
    v22[4] = self;
    *(double *)&v22[5] = var0;
    *(double *)&v22[6] = var1;
    *(double *)&v22[7] = var2;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke_2;
    v20[3] = &unk_1E8E9F230;
    v20[4] = self;
    v21 = v12;
    objc_msgSend(v19, "animateWithFactory:actions:completion:", v18, v22, v20);

  }
  else if (v11)
  {
    -[UIView setHidden:](self->_contentView, "setHidden:", 1);
    v12[2](v12);
  }

}

uint64_t __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setAlpha:", *(double *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_removeBlurFilterFromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animateOutLeftStashTabWithCompletion:(id)a3
{
  -[SBPIPContainerViewController _setStashTabHidden:left:completion:](self, "_setStashTabHidden:left:completion:", 1, 1, a3);
}

- (id)_blurSpringAnimationWithParameters:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v11, "setFromValue:", v9);

  objc_msgSend(v11, "setToValue:", v8);
  objc_msgSend(v10, "mass");
  objc_msgSend(v11, "setMass:");
  objc_msgSend(v10, "stiffness");
  objc_msgSend(v11, "setStiffness:");
  objc_msgSend(v10, "damping");
  objc_msgSend(v11, "setDamping:");
  objc_msgSend(v10, "duration");
  v13 = v12;

  objc_msgSend(v11, "setDuration:", v13);
  return v11;
}

- (void)_addBlurFilterToView:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2780];
  v4 = *MEMORY[0x1E0CD2C88];
  v5 = a3;
  objc_msgSend(v3, "filterWithType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("gaussianBlur"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("default"), CFSTR("inputQuality"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("default"), CFSTR("inputIntermediateBitDepth"));
  objc_msgSend(v6, "setValue:forKey:", &unk_1E91CF7A8, CFSTR("inputRadius"));
  v7 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputNormalizeEdges"));
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputHardEdges"));
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", v9);

}

- (void)_removeBlurFilterFromView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

}

- (void)setInteractionControllerEnabled:(BOOL)a3 stashed:(BOOL)a4 dataSource:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  id v8;
  SBPIPInteractionController *v9;
  UIView *contentView;
  SBPIPInteractionController *v11;
  SBPIPInteractionController *interactionController;

  v5 = a3;
  if (!self->_interactionController)
  {
    v7 = a4;
    v8 = a5;
    -[SBPIPContainerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v9 = [SBPIPInteractionController alloc];
    contentView = self->_contentView;
    -[UIViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
    v11 = -[SBPIPInteractionController initWithInteractionTargetView:preferredContentSize:interactionSettings:dataSource:delegate:](v9, "initWithInteractionTargetView:preferredContentSize:interactionSettings:dataSource:delegate:", contentView, self->_interactionSettings, v8, self);

    interactionController = self->_interactionController;
    self->_interactionController = v11;

    -[SBPIPContainerViewController _updateContentPadding](self, "_updateContentPadding");
    -[SBPIPInteractionController setStashed:](self->_interactionController, "setStashed:", v7);
    -[SBPIPInteractionController initialFrame](self->_interactionController, "initialFrame");
    -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", CFSTR("Setup Interaction Controller"), 1);
  }
  -[SBPIPContainerViewController setInteractionsEnabled:](self, "setInteractionsEnabled:", v5, a4, a5);
}

- (void)setInteractionsEnabled:(BOOL)a3
{
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", a3);
}

- (void)startAnimationWillBeginWithInitialInterfaceOrientation:(int64_t)a3 initialFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UIView setHidden:](self->_contentView, "setHidden:", 0);
  -[SBPIPContainerViewController _frameInFixedCoordinateSpace:transformedToInterfaceOrientation:](self, "_frameInFixedCoordinateSpace:transformedToInterfaceOrientation:", a3, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[SBPIPContainerViewController _requireInterfaceOrientation:](self, "_requireInterfaceOrientation:", a3);
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 0);
  -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", CFSTR("Prepare Start Animation"), 0, v11, v13, v15, v17);
}

- (void)startAnimationDidBeginWithInitialInterfaceOrientation:(int64_t)a3
{
  -[SBPIPContainerViewController _requireInterfaceOrientation:](self, "_requireInterfaceOrientation:", 0);
  -[SBPIPInteractionController initialFrame](self->_interactionController, "initialFrame");
  -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", CFSTR("Perform Start Animation"), 1);
}

- (void)startAnimationDidCompleteWithInitialInterfaceOrientation:(int64_t)a3
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_observerHashTable;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "containerViewController:didFinishStartAnimationWithInitialInterfaceOrientation:", self, a3, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (-[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation") != a3)
    -[SBPIPContainerViewController _updateContentPadding](self, "_updateContentPadding");
}

- (id)_blackCurtainViewForStopAnimation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SBPIPContainerViewController view](self, "view", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)stopAnimationWillBeginWithFinalInterfaceOrientation:(int64_t)a3 finalFrame:(CGRect)a4
{
  BOOL v6;
  void *v7;
  id v8;

  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[SBPIPContainerViewController setStashed:](self, "setStashed:", 0);
  -[SBPIPContainerViewController _removeMicroPIPMirrorView](self, "_removeMicroPIPMirrorView");
  -[SBPIPContainerViewController _blackCurtainViewForStopAnimation](self, "_blackCurtainViewForStopAnimation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v6 = -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation") == a3,
        v7 = v8,
        !v6))
  {
    objc_msgSend(v8, "setAlpha:", 0.0);
    v7 = v8;
  }

}

- (void)stopAnimationDidBeginWithFinalInterfaceOrientation:(int64_t)a3 finalFrame:(CGRect)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  BOOL v15;
  id v16;

  -[SBPIPContainerViewController _frameInFixedCoordinateSpace:transformedToInterfaceOrientation:](self, "_frameInFixedCoordinateSpace:transformedToInterfaceOrientation:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBPIPContainerViewController _requireInterfaceOrientation:](self, "_requireInterfaceOrientation:", a3);
  -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", CFSTR("Perform Stop Animation"), 0, v7, v9, v11, v13);
  -[SBPIPContainerViewController _blackCurtainViewForStopAnimation](self, "_blackCurtainViewForStopAnimation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v16 = v14;
    v15 = -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation") == a3;
    v14 = v16;
    if (v15)
    {
      objc_msgSend(v16, "setAlpha:", 0.0);
      v14 = v16;
    }
  }

}

- (void)stopAnimationDidCompleteWithFinalInterfaceOrientation:(int64_t)a3
{
  SBPIPInteractionController *interactionController;

  interactionController = self->_interactionController;
  self->_interactionController = 0;

  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
}

- (void)performAfterInFlightAnimationsComplete:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSMutableArray *waitInteractionAnimationsCompletionBlocks;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_inFlightAnimationCounter)
  {
    waitInteractionAnimationsCompletionBlocks = self->_waitInteractionAnimationsCompletionBlocks;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__SBPIPContainerViewController_performAfterInFlightAnimationsComplete___block_invoke;
    v8[3] = &unk_1E8E9E8D0;
    v9 = v4;
    v7 = (void *)MEMORY[0x1D17E5550](v8);
    -[NSMutableArray addObject:](waitInteractionAnimationsCompletionBlocks, "addObject:", v7);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __71__SBPIPContainerViewController_performAfterInFlightAnimationsComplete___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)toggleUserPreferredScale
{
  SBPIPInteractionController *interactionController;

  interactionController = self->_interactionController;
  if (interactionController)
    -[SBPIPInteractionController toggleUserPreferredScale](self->_interactionController, "toggleUserPreferredScale");
  return interactionController != 0;
}

- (unint64_t)currentCanonicalPosition
{
  return -[SBPIPInteractionController canonicalPosition](self->_interactionController, "canonicalPosition");
}

- (void)updatePreferredContentSize:(CGSize)a3
{
  -[SBPIPInteractionController setPreferredContentSize:](self->_interactionController, "setPreferredContentSize:", a3.width, a3.height);
  if (self->_activelyTethered)
    -[SBPIPContainerViewController _layoutWithNonOperationFrame](self, "_layoutWithNonOperationFrame");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPContainerViewController;
  -[SBPIPContainerViewController viewDidLoad](&v3, sel_viewDidLoad);
  if ((*((_BYTE *)self + 1200) & 1) != 0)
    -[SBPIPContainerViewControllerAdapter loadSubviewsForContainerViewController:](self->_adapter, "loadSubviewsForContainerViewController:", self);
}

- (void)viewDidLayoutSubviews
{
  id WeakRetained;
  char v4;
  int64_t v5;
  SBPIPInteractionController *interactionController;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  if (self->_interactionController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    v4 = objc_msgSend(WeakRetained, "isHandlingContextWindowSceneUpdate");

    if ((v4 & 1) == 0)
    {
      v5 = -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation");
      interactionController = self->_interactionController;
      -[SBPIPContainerViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v9 = v8;
      v11 = v10;
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPInteractionController setContainerSize:withOrientation:scene:](interactionController, "setContainerSize:withOrientation:scene:", v5, v12, v9, v11);

      -[SBPIPContainerViewController _updateContentPadding](self, "_updateContentPadding");
      if ((*((_BYTE *)self + 1200) & 2) != 0)
        -[SBPIPContainerViewControllerAdapter layoutSubviewsForContainerViewController:](self->_adapter, "layoutSubviewsForContainerViewController:", self);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPIPContainerViewController;
  -[SBPIPContainerViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SBPIPContainerViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_1E8EAD748;
  v4[4] = self;
  -[SBPIPContainerViewController updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v4);
  -[SBPIPContainerViewController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 1);
}

void __46__SBPIPContainerViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_contentViewFrameInDisplayReferenceSpace");
  objc_msgSend(v5, "setReferenceFrame:");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBPIPContainerViewController;
  -[SBPIPContainerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBPIPContainerViewController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 0);
}

- (BOOL)handleStashingForTransitionContext:(id)a3
{
  if ((*((_BYTE *)self + 1203) & 1) != 0)
    return -[SBPIPContainerViewControllerAdapter containerViewController:shouldHandleStashingForTransitionContext:](self->_adapter, "containerViewController:shouldHandleStashingForTransitionContext:", self, a3);
  else
    return 0;
}

- (void)_updateContentPadding
{
  id v3;

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBPIPContainerViewController effectiveEdgeInsetsForWindowScene:](self, "effectiveEdgeInsetsForWindowScene:", v3);
  -[SBPIPContainerViewController setEffectiveEdgeInsets:](self, "setEffectiveEdgeInsets:");

}

- (UIEdgeInsets)_safeAreaInsetsForScene:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  v4 = a3;
  -[SBPIPContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sbWindowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[SBPIPContainerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaInsets");
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }
  else
  {
    objc_msgSend(v4, "windows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_182);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  v21 = v10;
  v22 = v12;
  v23 = v14;
  v24 = v16;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

uint64_t __56__SBPIPContainerViewController__safeAreaInsetsForScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (UIEdgeInsets)_resolvedSafeAreaInsetsForWindowScene:(id)a3
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
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_peripheryInsets");
  v7 = v6;
  v9 = v8;

  -[SBPIPContainerViewController _safeAreaInsetsForScene:](self, "_safeAreaInsetsForScene:", v4);
  v11 = v10;
  v13 = v12;
  -[SBPIPContainerViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_sbWindowScene");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v4)
    v16 = -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation");
  else
    v16 = objc_msgSend(v4, "interfaceOrientation");
  v17 = v16;

  v18 = __sb__runningInSpringBoard();
  v19 = v18;
  if (v18)
  {
    v20 = 0.0;
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "userInterfaceIdiom") == 1)
      goto LABEL_16;
  }
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    {
      v21 = SBFEffectiveHomeButtonType() == 2;
      if ((v19 & 1) != 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "userInterfaceIdiom"))
    {
      v21 = SBFEffectiveHomeButtonType() == 2;

      if ((v19 & 1) != 0)
        goto LABEL_18;
      goto LABEL_17;
    }

  }
  v20 = 0.0;
  if ((v19 & 1) != 0)
  {
LABEL_23:
    v23 = 0.0;
    goto LABEL_24;
  }
LABEL_16:
  v21 = 0;
LABEL_17:

LABEL_18:
  v20 = 0.0;
  if (!v21 || !v17)
    goto LABEL_23;
  if (v17 == 3)
  {
    +[SBPIPContentViewLayoutMetrics minimumLandscapePadding](SBPIPContentViewLayoutMetrics, "minimumLandscapePadding");
    v11 = v31;
    +[SBPIPContentViewLayoutMetrics unstashedPeripheryPadding](SBPIPContentViewLayoutMetrics, "unstashedPeripheryPadding");
    v23 = v7 + v32;
    +[SBPIPContentViewLayoutMetrics minimumLandscapePadding](SBPIPContentViewLayoutMetrics, "minimumLandscapePadding");
    v20 = v33;
  }
  else
  {
    v23 = 0.0;
    if (v17 == 4)
    {
      +[SBPIPContentViewLayoutMetrics minimumLandscapePadding](SBPIPContentViewLayoutMetrics, "minimumLandscapePadding");
      v11 = v24;
      +[SBPIPContentViewLayoutMetrics minimumLandscapePadding](SBPIPContentViewLayoutMetrics, "minimumLandscapePadding");
      v23 = v25;
      +[SBPIPContentViewLayoutMetrics unstashedPeripheryPadding](SBPIPContentViewLayoutMetrics, "unstashedPeripheryPadding");
      v20 = v9 + v26;
    }
  }
LABEL_24:

  v27 = v11;
  v28 = v23;
  v29 = v13;
  v30 = v20;
  result.right = v30;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

- (void)setEffectiveEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_effectiveEdgeInsets.left != a3.left
    || self->_effectiveEdgeInsets.top != a3.top
    || self->_effectiveEdgeInsets.right != a3.right
    || self->_effectiveEdgeInsets.bottom != a3.bottom)
  {
    self->_effectiveEdgeInsets = a3;
    -[SBPIPInteractionController reloadInsets](self->_interactionController, "reloadInsets");
  }
}

- (UIEdgeInsets)effectiveEdgeInsetsForWindowScene:(id)a3
{
  void *v3;
  id v5;
  id WeakRetained;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint8_t buf[4];
  SBPIPContainerViewController *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  UIEdgeInsets v51;
  UIEdgeInsets v52;
  UIEdgeInsets v53;
  UIEdgeInsets result;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  objc_msgSend(WeakRetained, "pictureInPictureWindowMarginsOnWindowScene:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[SBPIPContainerViewController _resolvedSafeAreaInsetsForWindowScene:](self, "_resolvedSafeAreaInsetsForWindowScene:", v5);
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v5)
    v16 = -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation");
  else
    v16 = objc_msgSend(v5, "interfaceOrientation");
  v17 = v16;

  -[SBPIPInteractionController layoutSettings](self->_interactionController, "layoutSettings");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v18, "contentViewPadding");

  v19 = __sb__runningInSpringBoard();
  if (!(_DWORD)v19)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
    goto LABEL_14;
  }
  v18 = v19;
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
  }
  else
  {
    if (SBFEffectiveHomeButtonType() != 2)
      objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
    if ((v18 & 1) == 0)
LABEL_14:

  }
  v20 = __sb__runningInSpringBoard();
  v21 = v20;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() == 2)
      goto LABEL_31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v18, "userInterfaceIdiom") == 1)
      goto LABEL_30;
  }
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    {
      SBFEffectiveHomeButtonType();
      if ((v21 & 1) != 0)
        goto LABEL_31;
LABEL_30:

      goto LABEL_31;
    }
LABEL_26:
    if ((v21 & 1) != 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "userInterfaceIdiom"))
  {

    goto LABEL_26;
  }
  SBFEffectiveHomeButtonType();

  if ((v21 & 1) == 0)
    goto LABEL_30;
LABEL_31:
  UIEdgeInsetsAdd();
  UIEdgeInsetsMax();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  SBLogPIP();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v51.top = v24;
    v51.left = v26;
    v51.bottom = v28;
    v51.right = v30;
    NSStringFromUIEdgeInsets(v51);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPContainerViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaInsets");
    NSStringFromUIEdgeInsets(v52);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53.top = v8;
    v53.left = v10;
    v53.bottom = v12;
    v53.right = v14;
    NSStringFromUIEdgeInsets(v53);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v41 = self;
    v42 = 2114;
    v43 = v32;
    v44 = 2114;
    v45 = v34;
    v46 = 2114;
    v47 = v35;
    v48 = 2048;
    v49 = v17;
    _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "[%p] [PIP Container] Applying new edge insets: %{public}@. Derived from picking maximum between safeAreaInsets: %{public}@, and our extra content padding: %{public}@, adjusted for interface orientation: %ld", buf, 0x34u);

  }
  v36 = v24;
  v37 = v26;
  v38 = v28;
  v39 = v30;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPContainerViewController;
  -[SBPIPContainerViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[SBPIPContainerViewController _updateContentPadding](self, "_updateContentPadding");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBPIPContainerViewController;
  v7 = a4;
  -[SBPIPContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__SBPIPContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E9EA28;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __83__SBPIPContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayLayoutElementReferenceFrame");
}

- (void)setNeedsLayoutForInteractionController:(id)a3 traits:(unint64_t)a4 withReason:(unint64_t)a5 behavior:(int)a6 completion:(id)a7
{
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  NSObject *v14;
  int v15;
  void (**v16)(_QWORD);
  void *v17;
  int v18;
  id WeakRetained;
  void *v20;
  int v21;
  char v22;
  int *v23;
  _BOOL4 v24;
  SBFFluidBehaviorSettings *metricsAnimationSettings;
  UIViewFloatAnimatableProperty *metricsAnimatableProperty;
  UIViewFloatAnimatableProperty *v27;
  UIViewFloatAnimatableProperty *v28;
  SBFFluidBehaviorSettings *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t metricsUpdateGenCount;
  void *v43;
  uint64_t v44;
  _QWORD v45[5];
  void (**v46)(id, uint64_t, _QWORD);
  unint64_t v47;
  BOOL v48;
  _QWORD v49[5];
  void (**v50)(_QWORD);
  BOOL v51;
  _QWORD v52[4];
  id v53;
  SBPIPContainerViewController *v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  uint8_t buf[4];
  SBPIPContainerViewController *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(id, uint64_t, _QWORD))a7;
  SBLogPIP();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v59 = self;
    v60 = 2048;
    v61 = v12;
    v62 = 2048;
    v63 = a4;
    v64 = 2048;
    v65 = a5;
    v66 = 1024;
    v67 = a6;
    _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "[%p][Layout] setNeedsLayoutForInteractionController[%p] for traits:%lu reason:%lu behavior:%u.", buf, 0x30u);
  }

  v15 = objc_msgSend(v12, "isEnabled");
  if ((a5 & 0x8000) != 0 || v15)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke;
    v52[3] = &unk_1E8EB0B98;
    v55 = a4;
    v56 = a5;
    v53 = v12;
    v54 = self;
    v57 = a6;
    v16 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v52);
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "screenIsOn");

    WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(WeakRetained, "isPictureInPictureWindowVisibleOnWindowScene:", v20);

    v22 = 0;
    if (v18 && v21)
      v22 = !-[UIView isHidden](self->_contentView, "isHidden");
    if (!a6 || !((a5 >> 15) & 1 | v22 & 1))
    {
      v16[2](v16);
      if (v13)
        v13[2](v13, 1, 0);
      goto LABEL_28;
    }
    v23 = &OBJC_IVAR___SBPIPContainerViewController__stashTabAnimationSettings;
    if ((a5 & 0x800) == 0)
      v23 = &OBJC_IVAR___SBPIPContainerViewController__interactiveAnimationSettings;
    v24 = a6 == 2 && (a5 & 0x5000) != 0;
    if (((a6 == 2) & (a5 >> 13)) != 0)
      v23 = &OBJC_IVAR___SBPIPContainerViewController__regionUpdateAnimationSettings;
    metricsAnimationSettings = (SBFFluidBehaviorSettings *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                                             + *v23));
    metricsAnimatableProperty = self->_metricsAnimatableProperty;
    if (v24)
    {
      -[UIViewFloatAnimatableProperty invalidate](metricsAnimatableProperty, "invalidate");
      v27 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
      v28 = self->_metricsAnimatableProperty;
      self->_metricsAnimatableProperty = v27;

      -[UIViewFloatAnimatableProperty setValue:](self->_metricsAnimatableProperty, "setValue:", 0.0);
      v29 = metricsAnimationSettings;
      metricsAnimationSettings = self->_metricsAnimationSettings;
      self->_metricsAnimationSettings = v29;
    }
    else
    {
      if (!metricsAnimatableProperty
        || (-[UIViewFloatAnimatableProperty isInvalidated](metricsAnimatableProperty, "isInvalidated") & 1) != 0)
      {
        goto LABEL_27;
      }
      -[UIViewFloatAnimatableProperty presentationValue](self->_metricsAnimatableProperty, "presentationValue");
      v31 = v30;
      v29 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0DA9E08]);
      -[SBFFluidBehaviorSettings trackingResponse](metricsAnimationSettings, "trackingResponse");
      v33 = v32;
      -[SBFFluidBehaviorSettings response](self->_metricsAnimationSettings, "response");
      v35 = v31 * (v33 - v34);
      -[SBFFluidBehaviorSettings response](self->_metricsAnimationSettings, "response");
      -[SBFFluidBehaviorSettings setTrackingResponse:](v29, "setTrackingResponse:", v35 + v36);
      -[SBFFluidBehaviorSettings response](metricsAnimationSettings, "response");
      v38 = v37;
      -[SBFFluidBehaviorSettings response](self->_metricsAnimationSettings, "response");
      v40 = v31 * (v38 - v39);
      -[SBFFluidBehaviorSettings response](self->_metricsAnimationSettings, "response");
      -[SBFFluidBehaviorSettings setResponse:](v29, "setResponse:", v40 + v41);
      -[SBFFluidBehaviorSettings trackingDampingRatio](metricsAnimationSettings, "trackingDampingRatio");
      -[SBFFluidBehaviorSettings setTrackingDampingRatio:](v29, "setTrackingDampingRatio:");
      -[SBFFluidBehaviorSettings dampingRatio](metricsAnimationSettings, "dampingRatio");
      -[SBFFluidBehaviorSettings setDampingRatio:](v29, "setDampingRatio:");
    }

    metricsAnimationSettings = v29;
LABEL_27:
    ++self->_inFlightAnimationCounter;
    metricsUpdateGenCount = self->_metricsUpdateGenCount;
    self->_metricsUpdateGenCount = metricsUpdateGenCount + 1;
    v43 = (void *)MEMORY[0x1E0CEABB0];
    v44 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_2;
    v49[3] = &unk_1E8EA8380;
    v51 = v24;
    v49[4] = self;
    v50 = v16;
    v45[0] = v44;
    v45[1] = 3221225472;
    v45[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_4;
    v45[3] = &unk_1E8EB0BC0;
    v48 = v24;
    v45[4] = self;
    v47 = metricsUpdateGenCount;
    v46 = v13;
    objc_msgSend(v43, "_animateUsingSpringBehavior:tracking:animations:completion:", metricsAnimationSettings, a6 == 1, v49, v45);

LABEL_28:
    goto LABEL_29;
  }
  if (v13)
    v13[2](v13, 0, 0);
LABEL_29:

}

void __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "layoutInteractedTraits:withReason:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1240));
  objc_msgSend(WeakRetained, "layoutForTetheringInteractionController:behavior:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64));

}

void __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  char v12;
  CAFrameRateRange v13;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_3;
  v10[3] = &unk_1E8EA8380;
  v12 = *(_BYTE *)(a1 + 48);
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114124, v10, v7, v8, v9);

}

uint64_t __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "setValue:", 1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080);
  if (*(_BYTE *)(a1 + 56))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 1112) == *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(v6 + 1104), "invalidate");
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 1104);
      *(_QWORD *)(v7 + 1104) = 0;

      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 1096);
      *(_QWORD *)(v9 + 1096) = 0;

    }
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);
  v12 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v12 + 1080) && objc_msgSend(*(id *)(v12 + 1088), "count"))
  {
    v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "removeAllObjects");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18));
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (void)interactionControllerDidBeginSizeChange:(id)a3 behavior:(int)a4
{
  uint64_t v4;
  id WeakRetained;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  if ((*((_BYTE *)self + 1202) & 2) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerWillBeginSizeChange:behavior:](self->_adapter, "containerViewControllerWillBeginSizeChange:behavior:", self, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(WeakRetained, "interactionControllerDidBeginSizeChange:behavior:", v7, v4);

}

- (void)interactionControllerDidEndSizeChange:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if ((*((_BYTE *)self + 1202) & 4) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerDidEndSizeChange:](self->_adapter, "containerViewControllerDidEndSizeChange:", self);
  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(WeakRetained, "interactionControllerDidEndSizeChange:", v5);

}

- (void)interactionController:(id)a3 didUpdateStashProgress:(double)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  if ((*((_BYTE *)self + 1202) & 8) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewController:didUpdateStashProgress:](self->_adapter, "containerViewController:didUpdateStashProgress:", self, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(WeakRetained, "interactionController:didUpdateStashProgress:", v7, a4);

}

- (void)interactionController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5
{
  -[SBPIPContainerViewController _setStashTabHidden:left:completion:](self, "_setStashTabHidden:left:completion:", a4, a5, 0);
}

- (void)interactionController:(id)a3 didSettleOnStashState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  -[SBPIPContainerViewController _notifyStashStateChanged:](self, "_notifyStashStateChanged:", v4);
  if ((*((_BYTE *)self + 1201) & 0x10) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewController:didSettleOnStashState:](self->_adapter, "containerViewController:didSettleOnStashState:", self, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(WeakRetained, "interactionController:didSettleOnStashState:", v6, v4);

}

- (void)interactionControllerDidBeginInteraction:(id)a3 forGestureRecognizer:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((*((_BYTE *)self + 1201) & 0x20) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewController:willBeginInteractionWithGestureRecognizer:](self->_adapter, "containerViewController:willBeginInteractionWithGestureRecognizer:", self, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionObserver);
  objc_msgSend(WeakRetained, "containerViewControllerDidBeginInteraction:", self);

  v8 = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(v8, "interactionControllerDidBeginInteraction:forGestureRecognizer:", v9, v6);

}

- (void)interactionControllerDidEndAllInteractions:(id)a3 targetWindowScene:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
  if ((*((_BYTE *)self + 1201) & 0x40) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerDidEndInteraction:targetWindowScene:](self->_adapter, "containerViewControllerDidEndInteraction:targetWindowScene:", self, v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionObserver);
  objc_msgSend(WeakRetained, "containerViewControllerDidEndInteraction:targetWindowScene:", self, v9);

  v8 = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(v8, "interactionControllerDidEndAllInteractions:targetWindowScene:", v6, v9);

  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
  -[SBPIPContainerViewController _updateContentPadding](self, "_updateContentPadding");

}

- (void)interactionControllerPanGestureDidEnd:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (*((char *)self + 1201) < 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerPanGestureDidEnd:](self->_adapter, "containerViewControllerPanGestureDidEnd:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(WeakRetained, "interactionControllerPanGestureDidEnd:", v5);

}

- (void)interactionControllerDidUpdateEdgeInsets:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  objc_msgSend(WeakRetained, "interactionControllerDidUpdateEdgeInsets:", v4);

}

- (void)interactionControllerDidBeginEdgeResizing:(id)a3
{
  if ((*((_BYTE *)self + 1203) & 4) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerDidBeginEdgeResize:](self->_adapter, "containerViewControllerDidBeginEdgeResize:", self);
}

- (void)interactionControllerDidEndEdgeResizing:(id)a3
{
  if ((*((_BYTE *)self + 1203) & 8) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerDidEndEdgeResize:](self->_adapter, "containerViewControllerDidEndEdgeResize:", self);
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void (**v5)(id, SBSDisplayLayoutElement *);
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  void (*v13)(void);
  void *v14;
  void *v15;
  id v16;

  if (self->_displayLayoutElementAssertion)
  {
    v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 785, CFSTR("No window scene to get a publisher: %@"), self);

    }
    objc_msgSend(v6, "displayLayoutPublisher");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 785, CFSTR("No publisher for window scene: %@; self: %@"),
        v6,
        self);

    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitionAssertionWithReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    objc_msgSend(v16, "addElement:", self->_displayLayoutElement);
    v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    objc_msgSend(v9, "invalidate");
  }
  else
  {
    v13 = (void (*)(void))*((_QWORD *)a3 + 2);
    v16 = a3;
    v13();
  }

}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutElementAssertion;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  void *v14;
  void *v15;
  void *v16;

  self->_wantsDisplayLayoutElement = a3;
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (!displayLayoutElementAssertion)
    {
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[UIViewController _sbWindowScene](self, "_sbWindowScene");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[UIViewController _sbWindowScene](self, "_sbWindowScene");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 803, CFSTR("No window scene to get a publisher: %@"), self);

          }
          objc_msgSend(v10, "displayLayoutPublisher");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 803, CFSTR("No publisher for window scene: %@; self: %@"),
              v10,
              self);

          }
          objc_msgSend(v16, "addElement:", self->_displayLayoutElement);
          v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
          v12 = self->_displayLayoutElementAssertion;
          self->_displayLayoutElementAssertion = v11;

        }
      }
    }
  }
  else if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    v13 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (void)setIsActivelyTethered:(BOOL)a3 mode:(int64_t)a4
{
  _BOOL4 v5;
  SBPIPContentViewLayoutSettings *preTetheringLayoutSettings;
  SBPIPContentViewLayoutSettings *v8;
  SBPIPContentViewLayoutSettings *v9;
  SBPIPContentViewLayoutSettings *v10;
  double v11;
  void *v12;
  SBPIPContentViewLayoutSettings *v13;
  SBPIPContentViewLayoutSettings *microPIPLayoutSettings;
  uint64_t v15;
  SBPIPContentViewLayoutSettings *v16;
  SBMicroPIPTetheringMirrorView *v17;
  SBMicroPIPTetheringMirrorView *v18;
  SBMicroPIPTetheringMirrorView *microPIPTetheringViewMirror;
  void *v20;
  id WeakRetained;
  SBPIPInteractionController *interactionController;
  void *v23;
  SBPIPInteractionController *v24;
  void *v25;
  SBPIPContentViewLayoutSettings *v26;

  if (self->_activelyTethered != a3)
  {
    v5 = a3;
    self->_activelyTethered = a3;
    preTetheringLayoutSettings = self->_preTetheringLayoutSettings;
    if (a3)
    {
      if (preTetheringLayoutSettings)
      {
        v26 = 0;
      }
      else
      {
        -[SBPIPInteractionController layoutSettings](self->_interactionController, "layoutSettings");
        v9 = (SBPIPContentViewLayoutSettings *)objc_claimAutoreleasedReturnValue();
        v10 = self->_preTetheringLayoutSettings;
        self->_preTetheringLayoutSettings = v9;

        -[SBPIPInteractionController preferredNormalizedScale](self->_interactionController, "preferredNormalizedScale");
        self->_preTetheringNormalizedContentScale = v11;
        v26 = self->_preTetheringLayoutSettings;
      }
    }
    else
    {
      v26 = preTetheringLayoutSettings;
      v8 = self->_preTetheringLayoutSettings;
      self->_preTetheringLayoutSettings = 0;

    }
    if (self->_activelyTethered)
    {
      if (a4 == 1)
      {
        if (!self->_microPIPLayoutSettings)
        {
          +[SBPIPContentViewLayoutMetrics pegasusDefaultMicroPIPMetrics](SBPIPContentViewLayoutMetrics, "pegasusDefaultMicroPIPMetrics");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:]([SBPIPContentViewLayoutSettings alloc], "initWithPlatformMetrics:contentSize:", v12, 1.0, 1.0);
          microPIPLayoutSettings = self->_microPIPLayoutSettings;
          self->_microPIPLayoutSettings = v13;

        }
        if (-[UIView isHidden](self->_contentView, "isHidden"))
          v15 = 0;
        else
          v15 = 2;
        self->_tetheredInMicroPIPMode = 1;
        v16 = self->_microPIPLayoutSettings;

        if (!self->_microPIPTetheringViewMirror)
        {
          v17 = [SBMicroPIPTetheringMirrorView alloc];
          v18 = -[SBMicroPIPTetheringMirrorView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          microPIPTetheringViewMirror = self->_microPIPTetheringViewMirror;
          self->_microPIPTetheringViewMirror = v18;

          -[SBMicroPIPTetheringMirrorView setHidden:](self->_microPIPTetheringViewMirror, "setHidden:", -[UIView isHidden](self->_contentView, "isHidden"));
          -[SBPIPContainerViewController view](self, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addSubview:", self->_microPIPTetheringViewMirror);

        }
        v26 = v16;
LABEL_20:
        if (!v5)
        {
LABEL_27:

          return;
        }
LABEL_21:
        -[SBPIPInteractionController setStashed:](self->_interactionController, "setStashed:", 0);
        if (!v5)
          -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 1);
        WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringContainerViewController);
        interactionController = self->_interactionController;
        objc_msgSend(WeakRetained, "interactionController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "currentNormalizedScale");
        -[SBPIPInteractionController setPreferredNormalizedScale:additionalReasons:animationBehavior:](interactionController, "setPreferredNormalizedScale:additionalReasons:animationBehavior:", 0, 2);

        -[SBPIPInteractionController setContentLayoutSettings:animationBehavior:](self->_interactionController, "setContentLayoutSettings:animationBehavior:", v26, v15);
        v24 = self->_interactionController;
        if (v5)
        {
          -[SBPIPInteractionController setEnabled:](v24, "setEnabled:", 0);
          objc_msgSend(WeakRetained, "interactionController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setTargetOverlayView:", self->_microPIPTetheringViewMirror);

        }
        else
        {
          -[SBPIPInteractionController setPreferredNormalizedScale:](v24, "setPreferredNormalizedScale:", self->_preTetheringNormalizedContentScale);
        }

        goto LABEL_27;
      }
    }
    else if (self->_tetheredInMicroPIPMode)
    {
      self->_tetheredInMicroPIPMode = 0;
      -[SBPIPContainerViewController _removeMicroPIPMirrorView](self, "_removeMicroPIPMirrorView");
    }
    v15 = 2;
    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
}

- (void)layoutForTetheringInteractionController:(id)a3 behavior:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  SBPIPInteractionController *interactionController;
  void *v9;
  void *v10;
  UIView *contentView;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  SBPIPContainerViewController *v34;
  id v35;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (self->_activelyTethered)
  {
    if (self->_tetheredInMicroPIPMode)
    {
      -[SBMicroPIPTetheringMirrorView contentPlaceholderView](self->_microPIPTetheringViewMirror, "contentPlaceholderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      interactionController = self->_interactionController;
      objc_msgSend(v6, "currentNormalizedScale");
      -[SBPIPInteractionController setPreferredNormalizedScale:additionalReasons:animationBehavior:](interactionController, "setPreferredNormalizedScale:additionalReasons:animationBehavior:", 0, v4);
      -[SBPIPInteractionController nonoperationalFrame](self->_interactionController, "nonoperationalFrame");
      objc_msgSend(v7, "setBounds:", 0.0, 0.0);
      objc_msgSend(v7, "layoutIfNeeded");
      -[SBMicroPIPTetheringMirrorView layoutIfNeeded](self->_microPIPTetheringViewMirror, "layoutIfNeeded");
      -[UIView superview](self->_contentView, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPContainerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
      {
        objc_msgSend(v7, "superview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "frame");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        -[SBPIPContainerViewController view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;

        -[UIView setFrame:](self->_contentView, "setFrame:", v23, v25, v27, v29);
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke;
        v33 = &unk_1E8E9E820;
        v34 = self;
        v35 = v7;
        -[SBPIPContainerViewController performAfterInFlightAnimationsComplete:](self, "performAfterInFlightAnimationsComplete:", &v30);

      }
      else
      {
        contentView = self->_contentView;
        objc_msgSend(v7, "bounds");
        -[UIView setFrame:](contentView, "setFrame:");
      }

    }
    -[UIView layoutIfNeeded](self->_contentView, "layoutIfNeeded", v30, v31, v32, v33, v34);
  }

}

void __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1E0CEABB0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke_2;
    v7[3] = &unk_1E8E9E820;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    objc_msgSend(v4, "_performWithoutRetargetingAnimations:", v7);

  }
}

uint64_t __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976));
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 976);
  objc_msgSend(v2, "bounds");
  return objc_msgSend(v3, "setFrame:");
}

- (void)_removeMicroPIPMirrorView
{
  SBMicroPIPTetheringMirrorView *microPIPTetheringViewMirror;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  SBMicroPIPTetheringMirrorView *v15;

  microPIPTetheringViewMirror = self->_microPIPTetheringViewMirror;
  if (microPIPTetheringViewMirror)
  {
    -[SBMicroPIPTetheringMirrorView contentPlaceholderView](microPIPTetheringViewMirror, "contentPlaceholderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView center](self->_contentView, "center");
    v6 = v5;
    v8 = v7;
    -[SBPIPContainerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertPoint:toView:", v9, v6, v8);
    v11 = v10;
    v13 = v12;

    -[SBPIPContainerViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_contentView);

    -[UIView setCenter:](self->_contentView, "setCenter:", v11, v13);
    -[UIView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
    -[SBMicroPIPTetheringMirrorView removeFromSuperview](self->_microPIPTetheringViewMirror, "removeFromSuperview");
    v15 = self->_microPIPTetheringViewMirror;
    self->_microPIPTetheringViewMirror = 0;

  }
}

- (void)setTetheredContainerViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tetheredContainerViewController, obj);
    -[SBPIPInteractionController setStashed:](self->_interactionController, "setStashed:", 0);
    v5 = obj;
  }

}

- (void)rotationAnimationWillBeginToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat MidX;
  double v18;
  double MidY;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = -[SBPIPContainerViewController currentCanonicalPosition](self, "currentCanonicalPosition");
  -[UIView bounds](self->_contentView, "bounds");
  v13 = v11;
  v14 = v12;
  v15 = 0.5;
  v16 = 0.5;
  if (!self->_activelyTethered)
  {
    if (a3 == 1)
    {
      switch(v10)
      {
        case 0uLL:
LABEL_9:
          v20 = v12 * 0.5;
          goto LABEL_11;
        case 1uLL:
LABEL_13:
          v21 = v12 + v11 * -0.5;
          goto LABEL_14;
        case 2uLL:
LABEL_10:
          v20 = v11 + v12 * -0.5;
LABEL_11:
          v15 = v20 / v11;
          break;
        case 3uLL:
LABEL_12:
          v21 = v11 * 0.5;
LABEL_14:
          v16 = v21 / v12;
          break;
        default:
          break;
      }
    }
    else if (!a3)
    {
      switch(v10)
      {
        case 0uLL:
          goto LABEL_12;
        case 1uLL:
          goto LABEL_9;
        case 2uLL:
          goto LABEL_13;
        case 3uLL:
          goto LABEL_10;
        default:
          break;
      }
    }
  }
  self->_wasInteractionEnabledPreRotationAnimation = -[SBPIPInteractionController isEnabled](self->_interactionController, "isEnabled");
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 0);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MidX = CGRectGetMidX(v22);
  v23.size.height = height;
  v18 = MidX;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  MidY = CGRectGetMidY(v23);
  -[UIView setAnchorPoint:](self->_contentView, "setAnchorPoint:", v15, v16);
  -[UIView setCenter:](self->_contentView, "setCenter:", v18 + (v15 + -0.5) * v13, MidY + (v16 + -0.5) * v14);
  if (self->_activelyTethered)
    -[SBPIPContainerViewController startDisplayLink](self, "startDisplayLink");
}

- (void)rotationAnimationDidBeginToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  CGFloat v5;
  UIView *contentView;
  __int128 v7;
  CGAffineTransform *v8;
  UIView *v9;
  CGAffineTransform v10;
  _OWORD v11[3];

  if ((unint64_t)(a3 - 1) > 2)
    v5 = -1.57079633;
  else
    v5 = dbl_1D0E89D10[a3 - 1];
  if (self->_activelyTethered && BSFloatEqualToFloat())
  {
    contentView = self->_contentView;
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v11[0] = *MEMORY[0x1E0C9BAA8];
    v11[1] = v7;
    v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v8 = (CGAffineTransform *)v11;
  }
  else
  {
    v9 = self->_contentView;
    CGAffineTransformMakeRotation(&v10, v5);
    v8 = &v10;
    contentView = v9;
  }
  -[UIView setTransform:](contentView, "setTransform:", v8);
}

- (void)rotationAnimationWillCompleteToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *contentView;
  __int128 v11;
  double MidX;
  double v13;
  double v14;
  _OWORD v15[3];
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  contentView = self->_contentView;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v15[0] = *MEMORY[0x1E0C9BAA8];
  v15[1] = v11;
  v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](contentView, "setTransform:", v15);
  -[UIView setAnchorPoint:](self->_contentView, "setAnchorPoint:", 0.5, 0.5);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  -[UIView setCenter:](self->_contentView, "setCenter:", MidX, CGRectGetMidY(v17));
  if ((unint64_t)a3 <= 1)
  {
    -[SBPIPInteractionController preferredContentSize](self->_interactionController, "preferredContentSize");
    -[SBPIPInteractionController setPreferredContentSize:](self->_interactionController, "setPreferredContentSize:", v14, v13);
  }
}

- (void)rotationAnimationDidCompleteToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  if (self->_activelyTethered)
    -[SBPIPContainerViewController _layoutWithNonOperationFrame](self, "_layoutWithNonOperationFrame", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[SBPIPContainerViewController stopDisplayLink](self, "stopDisplayLink", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", self->_wasInteractionEnabledPreRotationAnimation);
  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
}

- (void)_layoutWithNonOperationFrame
{
  void *v3;
  id WeakRetained;

  -[SBPIPInteractionController nonoperationalFrame](self->_interactionController, "nonoperationalFrame");
  -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", CFSTR("Rotation end"), 0, 0.0, 0.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringContainerViewController);
  objc_msgSend(WeakRetained, "interactionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPContainerViewController layoutForTetheringInteractionController:behavior:](self, "layoutForTetheringInteractionController:behavior:", v3, 0);

}

- (void)startDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *microPiPRotationDisplayLink;
  CADisplayLink *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleMicroPiPRotationDisplayLink_);
  v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  microPiPRotationDisplayLink = self->_microPiPRotationDisplayLink;
  self->_microPiPRotationDisplayLink = v3;

  v5 = self->_microPiPRotationDisplayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

}

- (void)_handleMicroPiPRotationDisplayLink:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIView layer](self->_contentView, "layer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");

  -[UIView superview](self->_contentView, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIView superview](self->_contentView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");

  UIRectGetCenter();
  -[UIView setCenter:](self->_contentView, "setCenter:");
}

- (void)stopDisplayLink
{
  CADisplayLink *microPiPRotationDisplayLink;

  -[CADisplayLink invalidate](self->_microPiPRotationDisplayLink, "invalidate");
  microPiPRotationDisplayLink = self->_microPiPRotationDisplayLink;
  self->_microPiPRotationDisplayLink = 0;

}

- (void)_setStashTabHidden:(BOOL)a3 left:(BOOL)a4 completion:(id)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void (**v8)(_QWORD);
  int v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a4;
  v6 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a5;
  if (-[SBPIPInteractionController isEnabled](self->_interactionController, "isEnabled"))
  {
    v9 = (*((_BYTE *)self + 1202) & 0x10) != 0
       ? -[SBPIPContainerViewControllerAdapter isStashTabHiddenForContainerViewController:](self->_adapter, "isStashTabHiddenForContainerViewController:", self): 1;
    if (v9 != v6)
    {
      v16 = v5;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = self->_observerHashTable;
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v15, "containerViewControllerUserMayUpdateStashState:", self);
            ++v14;
          }
          while (v12 != v14);
          v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

      v5 = v16;
    }
  }
  if ((*((_BYTE *)self + 1202) & 1) != 0)
  {
    -[SBPIPContainerViewControllerAdapter containerViewController:wantsStashTabHidden:left:springSettings:completion:](self->_adapter, "containerViewController:wantsStashTabHidden:left:springSettings:completion:", self, v6, v5, self->_stashTabAnimationSettings, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)_setAdapter:(id)a3
{
  SBPIPContainerViewControllerAdapter *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  UIViewController *v30;
  UIViewController *contentViewController;
  SBPIPContainerViewControllerAdapter *v32;

  v5 = (SBPIPContainerViewControllerAdapter *)a3;
  if (self->_adapter != v5)
  {
    v32 = v5;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xDF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 64;
    else
      v11 = 0;
    *((_BYTE *)self + 1200) = *((_BYTE *)self + 1200) & 0xBF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 0x80;
    else
      v12 = 0;
    *((_BYTE *)self + 1200) = v12 & 0x80 | *((_BYTE *)self + 1200) & 0x7F;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 2;
    else
      v13 = 0;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xFD | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 4;
    else
      v14 = 0;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xFB | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 8;
    else
      v15 = 0;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xF7 | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 16;
    else
      v16 = 0;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xEF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 32;
    else
      v17 = 0;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xDF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 64;
    else
      v18 = 0;
    *((_BYTE *)self + 1201) = *((_BYTE *)self + 1201) & 0xBF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x80;
    else
      v19 = 0;
    *((_BYTE *)self + 1201) = v19 & 0x80 | *((_BYTE *)self + 1201) & 0x7F;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 4;
    else
      v20 = 0;
    *((_BYTE *)self + 1203) = *((_BYTE *)self + 1203) & 0xFB | v20;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 8;
    else
      v21 = 0;
    *((_BYTE *)self + 1203) = *((_BYTE *)self + 1203) & 0xF7 | v21;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 2;
    else
      v22 = 0;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xFD | v22;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 4;
    else
      v23 = 0;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xFB | v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = 8;
    else
      v24 = 0;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xF7 | v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 16;
    else
      v25 = 0;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xEF | v25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = 32;
    else
      v26 = 0;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xDF | v26;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = 64;
    else
      v27 = 0;
    *((_BYTE *)self + 1202) = *((_BYTE *)self + 1202) & 0xBF | v27;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = 0x80;
    else
      v28 = 0;
    *((_BYTE *)self + 1202) = v28 & 0x80 | *((_BYTE *)self + 1202) & 0x7F;
    *((_BYTE *)self + 1203) = *((_BYTE *)self + 1203) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = 2;
    else
      v29 = 0;
    *((_BYTE *)self + 1203) = *((_BYTE *)self + 1203) & 0xFD | v29;
    -[SBPIPContainerViewControllerAdapter contentViewControllerForContainerViewController:](v32, "contentViewControllerForContainerViewController:", self);
    v30 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    contentViewController = self->_contentViewController;
    self->_contentViewController = v30;

    objc_storeStrong((id *)&self->_adapter, a3);
    -[SBPIPContainerViewControllerAdapter setContainerViewController:](self->_adapter, "setContainerViewController:", self);
    v5 = v32;
  }

}

- (int)processIdentifier
{
  SBPIPContainerViewControllerAdapter *adapter;

  adapter = self->_adapter;
  if (adapter)
    return -[SBPIPContainerViewControllerAdapter processIdentifierForContainerViewController:](adapter, "processIdentifierForContainerViewController:", self);
  else
    return -1;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[SBPIPContainerViewControllerAdapter bundleIdentifierForContainerViewController:](self->_adapter, "bundleIdentifierForContainerViewController:", self);
}

- (NSString)scenePersistenceIdentifier
{
  return (NSString *)-[SBPIPContainerViewControllerAdapter scenePersistenceIdentifierForContainerViewController:](self->_adapter, "scenePersistenceIdentifierForContainerViewController:", self);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observerHashTable, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observerHashTable, "removeObject:", a3);
}

- (id)maximumAvailableVerticalPadding
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  char v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v20;

  -[SBPIPContainerViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SBPIPContainerViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  if (v5 > 0.0)
  {
    -[SBPIPInteractionController layoutSettings](self->_interactionController, "layoutSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentViewPadding");
    v12 = v11;

    v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      v14 = v13;
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
        v15 = v20;
        goto LABEL_15;
      }
      if (SBFEffectiveHomeButtonType() == 2)
      {
        v15 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
        v15 = v18;
      }
      if ((v14 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      {
        objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
        v15 = v17;
      }
      else
      {
        v15 = v12;
      }
    }

LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v5 - (v12 + v9 + v15), 0.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    return v16;
  }
  v16 = 0;
  return v16;
}

- (void)setContentViewPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentViewPadding.left
    || a3.top != self->_contentViewPadding.top
    || a3.right != self->_contentViewPadding.right
    || a3.bottom != self->_contentViewPadding.bottom)
  {
    self->_contentViewPadding = a3;
    -[SBPIPContainerViewController _updateContentPadding](self, "_updateContentPadding");
  }
}

- (void)setStashedPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_stashedPadding.left
    || a3.top != self->_stashedPadding.top
    || a3.right != self->_stashedPadding.right
    || a3.bottom != self->_stashedPadding.bottom)
  {
    self->_stashedPadding = a3;
    -[SBPIPInteractionController reloadInsets](self->_interactionController, "reloadInsets");
  }
}

- (void)setStashed:(BOOL)a3
{
  SBPIPInteractionController *interactionController;
  _BOOL8 v5;

  interactionController = self->_interactionController;
  if (interactionController)
  {
    v5 = a3;
    if ((*((_BYTE *)self + 1201) & 4) != 0)
    {
      -[SBPIPContainerViewControllerAdapter containerViewController:willUpdateStashState:](self->_adapter, "containerViewController:willUpdateStashState:", self, a3);
      interactionController = self->_interactionController;
    }
    -[SBPIPInteractionController setStashed:](interactionController, "setStashed:", v5);
    -[SBPIPContainerViewController _notifyStashStateChanged:](self, "_notifyStashStateChanged:", v5);
  }
}

- (BOOL)isStashed
{
  return -[SBPIPInteractionController isStashed](self->_interactionController, "isStashed");
}

- (void)setConnectedWindowScenes:(id)a3
{
  NSArray *v4;
  NSArray *connectedWindowScenes;
  id v6;

  v6 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    connectedWindowScenes = self->_connectedWindowScenes;
    self->_connectedWindowScenes = v4;

  }
}

- (void)_notifyStashStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 1201) & 8) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewController:didUpdateStashState:springSettings:](self->_adapter, "containerViewController:didUpdateStashState:springSettings:", self, a3, self->_stashTabAnimationSettings);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_observerHashTable;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "containerViewController:userDidUpdateStashState:", self, v3, (_QWORD)v11);
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[SBPIPContainerViewController _updateDisplayLayoutElementReferenceFrame](self, "_updateDisplayLayoutElementReferenceFrame");
}

- (void)acquireInterfaceOrientationLock
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  SBPIPContainerViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_interfaceOrientationLockAcquired)
  {
    self->_interfaceOrientationLockAcquired = 1;
    SBLogPIP();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v6 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] acquireInterfaceOrientationLock", buf, 0xCu);
    }

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__SBPIPContainerViewController_acquireInterfaceOrientationLock__block_invoke;
    v4[3] = &unk_1E8E9DED8;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
  }
}

uint64_t __63__SBPIPContainerViewController_acquireInterfaceOrientationLock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)relinquishInterfaceOrientationLock
{
  NSObject *v3;
  int v4;
  SBPIPContainerViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_interfaceOrientationLockAcquired)
  {
    self->_interfaceOrientationLockAcquired = 0;
    SBLogTraitsArbiter();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] relinquishInterfaceOrientationLock", (uint8_t *)&v4, 0xCu);
    }

    -[UIViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  }
}

- (void)_requireInterfaceOrientation:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  SBPIPContainerViewController *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_requiredInterfaceOrientation != a3)
  {
    self->_requiredInterfaceOrientation = a3;
    SBLogTraitsArbiter();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      SBFStringForBSInterfaceOrientation();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134218242;
      v7 = self;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] requireInterfaceOrientation:%{public}@", (uint8_t *)&v6, 0x16u);

    }
    -[UIViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  _BOOL4 interfaceOrientationLockAcquired;
  int64_t requiredInterfaceOrientation;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  SBPIPContainerViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  interfaceOrientationLockAcquired = self->_interfaceOrientationLockAcquired;
  requiredInterfaceOrientation = self->_requiredInterfaceOrientation;
  if (interfaceOrientationLockAcquired)
  {
    if (!requiredInterfaceOrientation)
      LOBYTE(requiredInterfaceOrientation) = -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation");
    goto LABEL_5;
  }
  if (requiredInterfaceOrientation)
  {
LABEL_5:
    v5 = 1 << requiredInterfaceOrientation;
    goto LABEL_6;
  }
  v5 = 30;
LABEL_6:
  SBLogTraitsArbiter();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1D17E3AE0](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] current supported orientations: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  return v5;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (void)startResourcesUsageReductionAfterTimeout:(double)a3
{
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *stashedStateReduceResourcesUsageTimer;
  BSAbsoluteMachTimer *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[BSAbsoluteMachTimer invalidate](self->_stashedStateReduceResourcesUsageTimer, "invalidate");
  v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBPIPContainerViewController.stashedStateReduceResourcesUsageTimer"));
  stashedStateReduceResourcesUsageTimer = self->_stashedStateReduceResourcesUsageTimer;
  self->_stashedStateReduceResourcesUsageTimer = v5;

  v7 = self->_stashedStateReduceResourcesUsageTimer;
  v8 = MEMORY[0x1E0C80D38];
  v9 = MEMORY[0x1E0C80D38];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBPIPContainerViewController_startResourcesUsageReductionAfterTimeout___block_invoke;
  v10[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v11, &location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", v8, v10, a3, 0.0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __73__SBPIPContainerViewController_startResourcesUsageReductionAfterTimeout___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[134], "invalidate");
    v3 = v2[134];
    v2[134] = 0;

    if ((*((_BYTE *)v2 + 1202) & 0x20) != 0)
      objc_msgSend(v2[148], "containerViewControllerStartReducingResourcesUsage:", v2);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v2[121];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "containerViewControllerStartReducingResourcesUsage:", v2, (_QWORD)v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)stopResourcesUsageReduction
{
  BSAbsoluteMachTimer *stashedStateReduceResourcesUsageTimer;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[BSAbsoluteMachTimer invalidate](self->_stashedStateReduceResourcesUsageTimer, "invalidate");
  stashedStateReduceResourcesUsageTimer = self->_stashedStateReduceResourcesUsageTimer;
  self->_stashedStateReduceResourcesUsageTimer = 0;

  if ((*((_BYTE *)self + 1202) & 0x40) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewControllerStopReducingResourcesUsage:](self->_adapter, "containerViewControllerStopReducingResourcesUsage:", self);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_observerHashTable;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "containerViewControllerStopReducingResourcesUsage:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)forcePictureInPictureToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 0);
  -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", CFSTR("Force PIP To Frame"), 0, x, y, width, height);
}

- (BOOL)prefersIdleTimerDisabled
{
  if ((*((_BYTE *)self + 1200) & 4) != 0)
    return -[SBPIPContainerViewControllerAdapter shouldDisableIdleTimerForContainerViewController:](self->_adapter, "shouldDisableIdleTimerForContainerViewController:", self);
  else
    return 0;
}

- (UIView)morphAnimatorTargetView
{
  if ((*((char *)self + 1200) & 0x80000000) == 0)
    return (UIView *)0;
  -[SBPIPContainerViewControllerAdapter morphAnimatorTargetViewForContainerViewController:](self->_adapter, "morphAnimatorTargetViewForContainerViewController:", self);
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIView)morphAnimatorTargetContainerView
{
  if ((*((_BYTE *)self + 1201) & 1) == 0)
    return (UIView *)0;
  -[SBPIPContainerViewControllerAdapter morphAnimatorTargetContainerViewForContainerViewController:](self->_adapter, "morphAnimatorTargetContainerViewForContainerViewController:", self);
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)transitionAnimationWillBegin
{
  if ((*((_BYTE *)self + 1200) & 8) != 0)
    -[SBPIPContainerViewControllerAdapter transitionAnimationWillBeginForContainerViewController:](self->_adapter, "transitionAnimationWillBeginForContainerViewController:", self);
}

- (void)transitionAnimationDidEnd
{
  if ((*((_BYTE *)self + 1200) & 0x10) != 0)
    -[SBPIPContainerViewControllerAdapter transitionAnimationDidEndForContainerViewController:](self->_adapter, "transitionAnimationDidEndForContainerViewController:", self);
}

- (void)handleDestructionRequestForSceneHandle:(id)a3
{
  if ((*((_BYTE *)self + 1200) & 0x20) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewController:handleDestructionRequestForSceneHandle:](self->_adapter, "containerViewController:handleDestructionRequestForSceneHandle:", self, a3);
}

- (void)_updateContentViewFrame:(CGRect)a3 reason:(id)a4 usingDisplayArrangementSpace:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  -[SBPIPInteractionController layoutWithFrame:reason:source:usingDisplayArrangementSpace:](self->_interactionController, "layoutWithFrame:reason:source:usingDisplayArrangementSpace:", x, y, width, height);
  if ((*((_BYTE *)self + 1201) & 2) != 0)
    -[SBPIPContainerViewControllerAdapter containerViewController:didUpdateContentViewFrame:reason:](self->_adapter, "containerViewController:didUpdateContentViewFrame:reason:", self, v10, x, y, width, height);

}

- (void)_updateDisplayLayoutElementReferenceFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int v19;
  _QWORD v20[9];
  CGRect v21;
  CGRect v22;

  -[SBSDisplayLayoutElement referenceFrame](self->_displayLayoutElement, "referenceFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBPIPContainerViewController _contentViewFrameInDisplayReferenceSpace](self, "_contentViewFrameInDisplayReferenceSpace");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[SBPIPContainerViewController isStashed](self, "isStashed");
  if (v19 != -[SBSDisplayLayoutElement sb_isStashedPIP](self->_displayLayoutElement, "sb_isStashedPIP"))
    goto LABEL_3;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v22.origin.x = v12;
  v22.origin.y = v14;
  v22.size.width = v16;
  v22.size.height = v18;
  if (!CGRectEqualToRect(v21, v22))
  {
LABEL_3:
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__SBPIPContainerViewController__updateDisplayLayoutElementReferenceFrame__block_invoke;
    v20[3] = &unk_1E8EAFA40;
    *(CGFloat *)&v20[5] = v12;
    *(CGFloat *)&v20[6] = v14;
    *(CGFloat *)&v20[7] = v16;
    *(CGFloat *)&v20[8] = v18;
    v20[4] = self;
    -[SBPIPContainerViewController updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v20);
  }
}

void __73__SBPIPContainerViewController__updateDisplayLayoutElementReferenceFrame__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = a2;
  objc_msgSend(v7, "setReferenceFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "sb_setStashedPIP:", objc_msgSend(*(id *)(a1 + 32), "isStashed"));

}

- (id)hostedAppSceneHandle
{
  if ((*((_BYTE *)self + 1200) & 0x40) == 0)
    return 0;
  -[SBPIPContainerViewControllerAdapter hostedAppSceneHandleForContainerViewController:](self->_adapter, "hostedAppSceneHandleForContainerViewController:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)windowInterfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBPIPContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (CGRect)_contentViewFrameInDisplayReferenceSpace
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  UIView *contentView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (-[SBPIPContainerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBPIPContainerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      contentView = self->_contentView;
      -[UIView bounds](contentView, "bounds");
      -[UIView convertRect:toView:](contentView, "convertRect:toView:", 0);
      objc_msgSend(v8, "_convertRectToSceneReferenceSpace:");
      v3 = v10;
      v4 = v11;
      v5 = v12;
      v6 = v13;
    }

  }
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_frameInFixedCoordinateSpace:(CGRect)a3 transformedToInterfaceOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  double v21;
  CGRect result;

  -[SBPIPContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fixedCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");

  if (!a4)
    -[SBPIPContainerViewController windowInterfaceOrientation](self, "windowInterfaceOrientation");
  _UIWindowConvertRectFromOrientationToOrientation();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setContentScale:(double)a3
{
  void *v7;
  void *v8;

  if (a3 < 0.0 || a3 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContainerViewController.m"), 1383, CFSTR("%@ expects scale in range [0..1]. Content scale given in input: %.2f"), v8, *(_QWORD *)&a3);

  }
  -[SBPIPInteractionController setPreferredNormalizedScale:](self->_interactionController, "setPreferredNormalizedScale:", a3);
}

- (double)contentScale
{
  double result;

  -[SBPIPInteractionController currentNormalizedScale](self->_interactionController, "currentNormalizedScale");
  return result;
}

- (BOOL)requiresMedusaKeyboard
{
  if (*((char *)self + 1202) < 0)
    return -[SBPIPContainerViewControllerAdapter containerViewControllerShouldRequireMedusaKeyboard:](self->_adapter, "containerViewControllerShouldRequireMedusaKeyboard:", self);
  else
    return 0;
}

- (void)setPrefersHiddenFromClonedDisplay:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_prefersHiddenFromClonedDisplay != a3)
  {
    self->_prefersHiddenFromClonedDisplay = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observerHashTable, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "containerViewControllerDidUpdatePrefersHiddenFromClonedDisplays:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (NSNumber)overrideResourcesUsageReductionTimeout
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBPIPContainerViewControllerAdapter overrideResourcesUsageReductionTimeout](self->_adapter, "overrideResourcesUsageReductionTimeout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)shouldSuppressAssociatedElementsInSystemAperture
{
  if ((*((_BYTE *)self + 1203) & 2) != 0)
    return -[SBPIPContainerViewControllerAdapter shouldSuppressAssociatedElementsInSystemAperture](self->_adapter, "shouldSuppressAssociatedElementsInSystemAperture");
  else
    return 0;
}

- (int64_t)requiredInterfaceOrientation
{
  return self->_requiredInterfaceOrientation;
}

- (SBPIPInteractionController)interactionController
{
  return self->_interactionController;
}

- (SBPIPContainerViewControllerInteractionObserver)interactionObserver
{
  return (SBPIPContainerViewControllerInteractionObserver *)objc_loadWeakRetained((id *)&self->_interactionObserver);
}

- (void)setInteractionObserver:(id)a3
{
  objc_storeWeak((id *)&self->_interactionObserver, a3);
}

- (NSArray)connectedWindowScenes
{
  return self->_connectedWindowScenes;
}

- (BOOL)isActivelyTethered
{
  return self->_activelyTethered;
}

- (SBPIPContainerViewController)tetheredContainerViewController
{
  return (SBPIPContainerViewController *)objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
}

- (SBPIPContainerViewController)tetheringContainerViewController
{
  return (SBPIPContainerViewController *)objc_loadWeakRetained((id *)&self->_tetheringContainerViewController);
}

- (void)setTetheringContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tetheringContainerViewController, a3);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (int64_t)contentZOrderPriority
{
  return self->_contentZOrderPriority;
}

- (void)setContentZOrderPriority:(int64_t)a3
{
  self->_contentZOrderPriority = a3;
}

- (BOOL)prefersHiddenFromClonedDisplay
{
  return self->_prefersHiddenFromClonedDisplay;
}

- (UIEdgeInsets)effectiveEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_effectiveEdgeInsets.top;
  left = self->_effectiveEdgeInsets.left;
  bottom = self->_effectiveEdgeInsets.bottom;
  right = self->_effectiveEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)stashedPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_stashedPadding.top;
  left = self->_stashedPadding.left;
  bottom = self->_stashedPadding.bottom;
  right = self->_stashedPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tetheringContainerViewController);
  objc_destroyWeak((id *)&self->_tetheredContainerViewController);
  objc_storeStrong((id *)&self->_connectedWindowScenes, 0);
  objc_destroyWeak((id *)&self->_interactionObserver);
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_destroyWeak((id *)&self->_pipController);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_microPIPLayoutSettings, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_microPiPRotationDisplayLink, 0);
  objc_storeStrong((id *)&self->_metricsAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_metricsAnimationSettings, 0);
  objc_storeStrong((id *)&self->_waitInteractionAnimationsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_stashedStateReduceResourcesUsageTimer, 0);
  objc_storeStrong((id *)&self->_regionUpdateAnimationSettings, 0);
  objc_storeStrong((id *)&self->_stashTabAnimationSettings, 0);
  objc_storeStrong((id *)&self->_interactiveAnimationSettings, 0);
  objc_storeStrong((id *)&self->_preTetheringLayoutSettings, 0);
  objc_storeStrong((id *)&self->_microPIPTetheringViewMirror, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observerHashTable, 0);
}

- (void)SB_accessibilityToggleStashed
{
  -[SBPIPContainerViewController setStashed:](self, "setStashed:", -[SBPIPContainerViewController isStashed](self, "isStashed") ^ 1);
}

- (void)initWithPIPController:interactionSettings:adapter:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
