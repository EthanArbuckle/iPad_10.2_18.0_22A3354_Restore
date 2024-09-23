@implementation SBControlCenterModuleTransientOverlayViewController

- (SBControlCenterModuleTransientOverlayViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4
{
  id v7;
  id v8;
  SBControlCenterModuleTransientOverlayViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  CCUIModuleAlertViewController *moduleOverlayViewController;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBControlCenterModuleTransientOverlayViewController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleIdentifier"));

  }
  v19.receiver = self;
  v19.super_class = (Class)SBControlCenterModuleTransientOverlayViewController;
  v9 = -[SBTransientOverlayViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = (objc_class *)MEMORY[0x1E0D14590];
    v14 = v12;
    v15 = objc_msgSend([v13 alloc], "initWithModuleIdentifier:presentationOptions:mainViewController:", v7, v8, v14);

    moduleOverlayViewController = v9->_moduleOverlayViewController;
    v9->_moduleOverlayViewController = (CCUIModuleAlertViewController *)v15;

    -[CCUIModuleAlertViewController setDelegate:](v9->_moduleOverlayViewController, "setDelegate:", v9);
  }

  return v9;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 1;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 1;
}

- (SBControlCenterModuleTransientOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModuleIdentifier_presentationOptions_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBControlCenterModuleTransientOverlayViewController.m"), 68, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBControlCenterModuleTransientOverlayViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (SBControlCenterModuleTransientOverlayViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModuleIdentifier_presentationOptions_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBControlCenterModuleTransientOverlayViewController.m"), 72, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBControlCenterModuleTransientOverlayViewController initWithCoder:]",
    v6);

  return 0;
}

- (SBControlCenterModuleTransientOverlayViewController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModuleIdentifier_presentationOptions_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBControlCenterModuleTransientOverlayViewController.m"), 76, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBControlCenterModuleTransientOverlayViewController init]",
    v5);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBControlCenterModuleTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterModuleTransientOverlayViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_moduleOverlayViewController, v3);
  -[CCUIModuleAlertViewController view](self->_moduleOverlayViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "setHidden:", 1);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setNeedsLayout");
  objc_msgSend(v4, "layoutIfNeeded");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_dismiss
{
  id v3;

  -[SBControlCenterModuleTransientOverlayViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCenterModuleTransientOverlayViewControllerNeedsDismissal:", self);

}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (CCSModulePresentationOptions)presentationOptions
{
  return (CCSModulePresentationOptions *)-[CCUIModuleAlertViewController presentationOptions](self->_moduleOverlayViewController, "presentationOptions");
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (BOOL)shouldDisableOrientationUpdates
{
  return 1;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  BOOL v3;
  void *v4;
  void *v5;
  SBTransientOverlayBlockTransitionCoordinator *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v3 = -[SBControlCenterModuleTransientOverlayViewController _shouldBlurBackground](self, "_shouldBlurBackground");
  -[CCUIModuleAlertViewController view](self->_moduleOverlayViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v10[3] = &unk_1E8EAA8B0;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v13 = v3;
  v7 = v4;
  v8 = v5;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v6, "setStartTransitionHandler:", v10);

  return v6;
}

void __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  char v18;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v4[173];
  v7 = objc_msgSend(v3, "isAnimated");
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
  v14[3] = &unk_1E8E9F2A8;
  v9 = *(id *)(a1 + 48);
  v18 = *(_BYTE *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = v3;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
  v12[3] = &unk_1E8E9E980;
  v13 = v17;
  v11 = v17;
  objc_msgSend(v4, "_animateTransitionFromViewController:toViewController:containerView:isAnimated:otherAnimations:completion:", v4, v6, v5, v7, v14, v12);

}

uint64_t __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "setBackgroundViewWeighting:", 1.0);
  return objc_msgSend(*(id *)(a1 + 48), "performAlongsideTransitions");
}

uint64_t __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  BOOL v3;
  void *v4;
  void *v5;
  SBTransientOverlayBlockTransitionCoordinator *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v3 = -[SBControlCenterModuleTransientOverlayViewController _shouldBlurBackground](self, "_shouldBlurBackground");
  -[CCUIModuleAlertViewController view](self->_moduleOverlayViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v10[3] = &unk_1E8EAA8B0;
  v10[4] = self;
  v11 = v5;
  v13 = v3;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v6, "setStartTransitionHandler:", v10);

  return v6;
}

void __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  char v15;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v4[173];
  v7 = objc_msgSend(v3, "isAnimated");
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v13[3] = &unk_1E8E9EE00;
  v15 = *(_BYTE *)(a1 + 56);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
  v10[3] = &unk_1E8E9DEB0;
  v11 = *(id *)(a1 + 48);
  v12 = v14;
  v9 = v14;
  objc_msgSend(v4, "_animateTransitionFromViewController:toViewController:containerView:isAnimated:otherAnimations:completion:", v6, v4, v5, v7, v13, v10);

}

uint64_t __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setBackgroundViewWeighting:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (BOOL)handleHomeButtonPress
{
  CCUIModuleAlertViewController *moduleOverlayViewController;
  _QWORD v4[5];

  moduleOverlayViewController = self->_moduleOverlayViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SBControlCenterModuleTransientOverlayViewController_handleHomeButtonPress__block_invoke;
  v4[3] = &unk_1E8E9E980;
  v4[4] = self;
  -[CCUIModuleAlertViewController dismissModulePresentedContentAnimated:completion:](moduleOverlayViewController, "dismissModulePresentedContentAnimated:completion:", 1, v4);
  return 1;
}

uint64_t __76__SBControlCenterModuleTransientOverlayViewController_handleHomeButtonPress__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_dismiss");
  return result;
}

- (BOOL)_shouldBlurBackground
{
  void *v2;
  char v3;

  -[SBControlCenterModuleTransientOverlayViewController presentationOptions](self, "presentationOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blurBackground");

  return v3;
}

- (void)_animateTransitionFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 isAnimated:(BOOL)a6 otherAnimations:(id)a7 completion:(id)a8
{
  _BOOL4 v10;
  CCUIModuleAlertViewController *v12;
  void (**v13)(_QWORD);
  id v14;
  CCUIModuleAlertViewController *moduleOverlayViewController;
  void *v16;
  BOOL v17;
  __int128 v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(_QWORD);
  CGAffineTransform v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  CGAffineTransform v33;

  v10 = a6;
  v12 = (CCUIModuleAlertViewController *)a4;
  v13 = (void (**)(_QWORD))a7;
  v14 = a8;
  moduleOverlayViewController = self->_moduleOverlayViewController;
  -[CCUIModuleAlertViewController moduleAlertView](moduleOverlayViewController, "moduleAlertView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v33, 0, sizeof(v33));
  v17 = moduleOverlayViewController == v12;
  if (moduleOverlayViewController == v12)
  {
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v33.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v33.c = v18;
    *(_OWORD *)&v33.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v33, 0.8, 0.8);
  }
  v19 = (void *)MEMORY[0x1E0CEABB0];
  v20 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke;
  v30[3] = &unk_1E8E9F508;
  v21 = v16;
  v31 = v21;
  v32 = v17;
  objc_msgSend(v19, "performWithoutAnimation:", v30);
  if (v10)
  {
    v22 = (void *)MEMORY[0x1E0CEABB0];
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_2;
    v25[3] = &unk_1E8EAA8D8;
    v26 = v21;
    v29 = v17;
    v28 = v33;
    v27 = v13;
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_3;
    v23[3] = &unk_1E8EA4988;
    v24 = v14;
    objc_msgSend(v22, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v25, v23, 500.0, 30.0);

  }
  else
  {
    if (v13)
      v13[2](v13);
    if (v14)
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

}

uint64_t __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  __int128 v5;
  CGAffineTransform v7;

  v2 = *(void **)(a1 + 32);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v7, 0.8, 0.8);
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v5;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  return objc_msgSend(v4, "setTransform:", &v7);
}

uint64_t __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  v2 = *(void **)(a1 + 32);
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 96))
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v4, "setTransform:", v7);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SBControlCenterModuleTransientOverlayViewControllerDelegate)delegate
{
  return (SBControlCenterModuleTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moduleOverlayViewController, 0);
}

@end
