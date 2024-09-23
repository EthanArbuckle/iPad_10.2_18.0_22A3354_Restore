@implementation SBFolderPresentingViewController

- (SBFolderContainerView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderPresentingViewController;
  -[SBFolderPresentingViewController view](&v3, sel_view);
  return (SBFolderContainerView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)loadView
{
  SBFolderContainerView *v3;

  v3 = -[SBFolderContainerView initWithFolderView:]([SBFolderContainerView alloc], "initWithFolderView:", 0);
  -[SBFolderPresentingViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SBFolderController)presentedFolderController
{
  void *v3;
  id v4;

  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBFolderPresentingViewController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (SBFolderController *)v4;
}

- (void)presentFolderController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  -[SBFolderPresentingViewController presentedFolderController](self, "presentedFolderController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    -[SBNestingViewController pushNestedViewController:animated:withCompletion:](self, "pushNestedViewController:animated:withCompletion:", v10, v6, v8);
  }

}

- (void)dismissPresentedFolderControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];
  id v16;
  BOOL v17;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E8D8DC60;
  aBlock[4] = self;
  v17 = a3;
  v8 = v6;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (a3)
  {
    +[SBHIconViewContextMenuStateController sharedInstance](SBHIconViewContextMenuStateController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissAppIconForceTouchControllers:", v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke_2;
    v13[3] = &unk_1E8D859C0;
    v14 = v9;
    objc_msgSend(v12, "performWithoutAnimation:", v13);
    v11 = v14;
  }

}

void __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "presentedFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 32), "popNestedViewControllerAnimated:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_5:
    v2 = v4;
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = 0;
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    goto LABEL_5;
  }
LABEL_6:

}

void __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  +[SBHIconViewContextMenuStateController sharedInstance](SBHIconViewContextMenuStateController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAppIconForceTouchControllers:", *(_QWORD *)(a1 + 32));

}

- (void)setBackgroundEffect:(unint64_t)a3
{
  void *v5;
  id v6;

  if (-[SBFolderPresentingViewController backgroundEffect](self, "backgroundEffect") != a3)
  {
    self->_backgroundEffect = a3;
    if (-[SBFolderPresentingViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBFolderPresentingViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "backgroundView");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setEffect:", a3);
    }
  }
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v12 = v11;
  if (!v12)
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)SBFolderPresentingViewController;
    -[SBNestingViewController nestingViewController:animationControllerForOperation:onViewController:animated:](&v16, sel_nestingViewController_animationControllerForOperation_onViewController_animated_, v10, a4, v11, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[SBFolderPresentingViewController folderPresentationDelegate](self, "folderPresentationDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v13, "folderPresentationController:animationControllerForTransitionWithFolder:presenting:animated:", self, v12, a4 == 1, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderPresentingViewController setCurrentFolderAnimator:](self, "setCurrentFolderAnimator:", v14);

LABEL_8:
  return v14;
}

- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[SBFolderPresentingViewController currentFolderAnimator](self, "currentFolderAnimator");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
    goto LABEL_5;
  -[SBFolderPresentingViewController folderPresentationDelegate](self, "folderPresentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)SBFolderPresentingViewController;
    -[SBNestingViewController nestingViewController:interactionControllerForAnimationController:](&v12, sel_nestingViewController_interactionControllerForAnimationController_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v9, "folderPresentationController:interactionControllerForAnimationController:", self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  SBFolderPresentingViewController *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SBFolderControllerBackgroundView *v17;
  void *v18;
  SBFolderControllerBackgroundView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];
  id v29;
  BOOL v30;
  _QWORD v31[4];
  id v32;
  BOOL v33;

  v10 = (SBFolderPresentingViewController *)a3;
  v11 = a5;
  v12 = a6;
  if (v10 == self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v11;
      -[SBFolderPresentingViewController folderPresentationDelegate](v10, "folderPresentationDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderPresentingViewController view](v10, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backgroundView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v13;
      if (a4 == 1)
      {
        if (v16)
          objc_msgSend(v16, "removeFromSuperview");
        v17 = [SBFolderControllerBackgroundView alloc];
        -[SBFolderPresentingViewController view](v10, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        v19 = -[SBFolderControllerBackgroundView initWithFrame:](v17, "initWithFrame:");

        -[SBFolderControllerBackgroundView setDelegate:](v19, "setDelegate:", v10);
        -[SBFolderControllerBackgroundView setEffect:](v19, "setEffect:", -[SBFolderPresentingViewController backgroundEffect](v10, "backgroundEffect"));
        -[SBFolderPresentingViewController view](v10, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBackgroundView:", v19);

        -[SBFolderPresentingViewController view](v10, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSubview:", v19);

        -[SBFolderPresentingViewController view](v10, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "folderContainerView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setChildFolderContainerView:", v23);

        v16 = v19;
      }
      v24 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
      v31[3] = &unk_1E8D89BF0;
      v32 = v16;
      v33 = a4 == 1;
      v28[0] = v24;
      v28[1] = 3221225472;
      v28[2] = __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
      v28[3] = &unk_1E8D89C40;
      v30 = a4 == 1;
      v28[4] = v10;
      v25 = v32;
      v29 = v25;
      objc_msgSend(v12, "animateAlongsideTransition:completion:", v31, v28);
      objc_msgSend(v25, "setExpanding:", a4 == 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "folderPresentationController:willPerformTransitionWithFolder:presenting:withTransitionCoordinator:", v10, v26, a4 == 1, v12);

    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SBFolderPresentingViewController;
  -[SBNestingViewController nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:](&v27, sel_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator_, v10, a4, v11, v12, v26);

}

void __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isInteractive") & 1) == 0)
  {
    v3 = objc_msgSend(v7, "isCancelled");
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "setTransitionCancelled:", 1);
      v5 = *(void **)(a1 + 32);
      v6 = *(_BYTE *)(a1 + 40) == 0;
    }
    else
    {
      objc_msgSend(v4, "setTransitionCancelled:", 0);
      v5 = *(void **)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 40);
    }
    objc_msgSend(v5, "setEffectActive:", v6);
  }

}

uint64_t __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (((objc_msgSend(a2, "isCancelled") ^ (*(_BYTE *)(a1 + 48) != 0)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setChildFolderContainerView:", 0);

    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundView:", 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentFolderAnimator:", 0);
}

- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBFolderPresentingViewController folderPresentationDelegate](self, "folderPresentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "folderPresentationController:sourceViewForPresentingViewController:", self, v5);
  else
    -[SBFolderPresentingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)minimumHomeScreenScaleForFolderControllerBackgroundView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderPresentingViewController folderPresentationDelegate](self, "folderPresentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "minimumHomeScreenScaleForFolderPresentationController:", self);
    v5 = v6;
  }

  return v5;
}

- (SBFolderPresentingViewControllerDelegate)folderPresentationDelegate
{
  return (SBFolderPresentingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_folderPresentationDelegate);
}

- (void)setFolderPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_folderPresentationDelegate, a3);
}

- (unint64_t)backgroundEffect
{
  return self->_backgroundEffect;
}

- (UIViewControllerAnimatedTransitioning)currentFolderAnimator
{
  return self->_currentFolderAnimator;
}

- (void)setCurrentFolderAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_currentFolderAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFolderAnimator, 0);
  objc_destroyWeak((id *)&self->_folderPresentationDelegate);
}

@end
