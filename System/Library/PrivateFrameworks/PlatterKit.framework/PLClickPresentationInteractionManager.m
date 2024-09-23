@implementation PLClickPresentationInteractionManager

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    PLRegisterPlatterKitLogging();
}

- (PLClickPresentationInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PLClickPresentationInteractionManager *v8;
  PLClickPresentationInteractionManager *v9;
  uint64_t v10;
  _UIClickPresentationInteraction *clickPresentationInteraction;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLClickPresentationInteractionManager;
  v8 = -[PLClickPresentationInteractionManager init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    -[PLClickPresentationInteractionManager setDelegate:](v9, "setDelegate:", v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEACA8]), "initWithDelegate:", v9);
    clickPresentationInteraction = v9->_clickPresentationInteraction;
    v9->_clickPresentationInteraction = (_UIClickPresentationInteraction *)v10;

    objc_msgSend(v6, "viewForPreview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addInteraction:", v9->_clickPresentationInteraction);

  }
  return v9;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFEFF | v12;
  }

}

- (BOOL)hasCommittedToPresentation
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  v4 = WeakRetained;
  if (self->_willPresent)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = objc_msgSend(v4, "isBeingDismissed") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  return v5;
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationship
{
  return (UIGestureRecognizer *)-[_UIClickPresentationInteraction gestureRecognizerForExclusionRelationship](self->_clickPresentationInteraction, "gestureRecognizerForExclusionRelationship");
}

- (BOOL)presentIfPossible:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id presentationCompletion;

  v4 = a3;
  v5 = -[PLClickPresentationInteractionManager hasCommittedToPresentation](self, "hasCommittedToPresentation");
  if (!v5)
  {
    self->_didInteractionInitiateWithHint = 0;
    v6 = (void *)objc_msgSend(v4, "copy");
    presentationCompletion = self->_presentationCompletion;
    self->_presentationCompletion = v6;

    -[_UIClickPresentationInteraction present](self->_clickPresentationInteraction, "present");
  }

  return !v5;
}

- (BOOL)dismissIfPossible:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  id dismissalCompletion;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = !self->_didPresent || v6 == 0;
  if (v7 || (objc_msgSend(v6, "isBeingDismissed") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    self->_didPresent = 0;
    v9 = (void *)objc_msgSend(v4, "copy");
    dismissalCompletion = self->_dismissalCompletion;
    self->_dismissalCompletion = v9;

    -[_UIClickPresentationInteraction cancelInteraction](self->_clickPresentationInteraction, "cancelInteraction");
    objc_storeWeak((id *)&self->_presentedViewController, 0);
    v8 = 1;
  }

  return v8;
}

- (void)_clickPresentationTransitionDidPresent:(BOOL)a3
{
  _BOOL4 v3;
  id presentationCompletion;
  void *v6;
  id v7;

  v3 = a3;
  self->_willPresent = 0;
  *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags &= ~0x200u;
  -[PLClickPresentationInteractionManager _setPresentingViewControllerHighlighted:animated:](self, "_setPresentingViewControllerHighlighted:animated:", 0, 0);
  if (v3)
  {
    self->_didPresent = 1;
    v7 = (id)MEMORY[0x1D17E5ED8](self->_presentationCompletion);
    presentationCompletion = self->_presentationCompletion;
    self->_presentationCompletion = 0;

    v6 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      v6 = v7;
    }

  }
}

- (void)_clickInteractionDidEnd
{
  id dismissalCompletion;
  void *v4;
  id v5;

  self->_didPresent = 0;
  *(_WORD *)&self->_didInteractionInitiateWithHint = 0;
  if ((*(_BYTE *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x20) != 0)
    -[PLClickPresentationInteractionManager _delegateDidEndUserInteraction](self, "_delegateDidEndUserInteraction");
  v5 = (id)MEMORY[0x1D17E5ED8](self->_dismissalCompletion, a2);
  dismissalCompletion = self->_dismissalCompletion;
  self->_dismissalCompletion = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)_clickPresentationTransitionDidDismiss:(BOOL)a3
{
  if (a3)
    -[PLClickPresentationInteractionManager _clickInteractionDidEnd](self, "_clickInteractionDidEnd");
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _UIClickPresentationInteraction *clickPresentationInteraction;
  void *v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if ((objc_msgSend(WeakRetained, "isBeingDismissed") & 1) != 0)
    goto LABEL_2;
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (!v7)
    goto LABEL_15;
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 4) == 0)
  {

LABEL_7:
    -[PLClickPresentationInteractionManager _presentedViewController](self, "_presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x10) != 0)
        -[PLClickPresentationInteractionManager _delegateWillBeginUserInteraction](self, "_delegateWillBeginUserInteraction");
      objc_msgSend(WeakRetained, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        LOBYTE(v5) = 1;
        goto LABEL_15;
      }
      v11 = v10;
      LOBYTE(v5) = objc_msgSend(v10, "isBeingDismissed");
    }
    else
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  clickPresentationInteraction = self->_clickPresentationInteraction;
  objc_msgSend(WeakRetained, "viewForPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationInteraction locationInView:](clickPresentationInteraction, "locationInView:", v9);
  LODWORD(clickPresentationInteraction) = -[PLClickPresentationInteractionManager _delegateShouldBeginInteractionWithTouchAtLocation:](self, "_delegateShouldBeginInteractionWithTouchAtLocation:");

  if ((_DWORD)clickPresentationInteraction)
    goto LABEL_7;
LABEL_2:
  LOBYTE(v5) = 0;
LABEL_16:
  self->_didInteractionInitiateWithHint = 1;

  return (char)v5;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD block[4];
  id v11;
  PLClickPresentationInteractionManager *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLClickPresentationInteractionManager _presentedViewController](self, "_presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v8 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = WeakRetained;
      _os_log_impl(&dword_1D1285000, v8, OS_LOG_TYPE_DEFAULT, "No view controller to present from presenting view controller %{public}@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x208) == 8)
  {
LABEL_7:
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke;
    block[3] = &unk_1E91D36A8;
    objc_copyWeak(&v13, (id *)buf);
    v11 = v4;
    v12 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    v6 = 0;
    goto LABEL_8;
  }
  v6 = 1;
LABEL_8:

  return v6;
}

void __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 32), "_reachedForceThreshold");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2;
  v6[3] = &unk_1E91D3680;
  v6[4] = WeakRetained;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(WeakRetained, "_delegateShouldFinishInteractionThatReachedForceThreshold:withCompletionBlock:", v3, v6);

}

uint64_t __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2(id *a1, int a2)
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1[4], "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = a2 == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(a1[5], "cancelInteraction");
    objc_msgSend(a1[6], "_setPresentingViewControllerHighlighted:animated:", 0, 1);
    return objc_msgSend(a1[6], "_clickInteractionDidEnd");
  }
  else
  {
    *((_WORD *)a1[4] + 28) |= 0x200u;
    return objc_msgSend(a1[5], "present");
  }
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  PLExpandedPlatterTransitioningDelegate *v10;
  PLExpandedPlatterTransitioningDelegate *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PLClickPresentationPresentationTransition *v16;
  uint64_t v17;
  PLClickPresentationPresentationTransition *v18;
  PLClickPresentationDismissalTransition *v19;
  PLClickPresentationDismissalTransition *v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  self->_willPresent = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  if (!WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v9 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_1D1285000, v9, OS_LOG_TYPE_DEFAULT, "No view controller to present from presenting view controller %{public}@", buf, 0xCu);
    }

  }
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 2) != 0)
  {
    -[PLClickPresentationInteractionManager _delegateTransitioningDelegate](self, "_delegateTransitioningDelegate");
    v10 = (PLExpandedPlatterTransitioningDelegate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(PLExpandedPlatterTransitioningDelegate);
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0CEACA0]);
  -[PLExpandedPlatterTransitioningDelegate presentationControllerForPresentedViewController:presentingViewController:sourceViewController:](v11, "presentationControllerForPresentedViewController:presentingViewController:sourceViewController:", WeakRetained, v6, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithPresentedViewController:presentationController:", WeakRetained, v13);

  objc_storeWeak((id *)&self->_clickPresentation, v14);
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 1) != 0)
  {
    -[PLClickPresentationInteractionManager _delegateContainerView](self, "_delegateContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v14, "setCustomContainerView:", v15);

  }
  objc_initWeak((id *)buf, self);
  v16 = [PLClickPresentationPresentationTransition alloc];
  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke;
  v26[3] = &unk_1E91D32F0;
  objc_copyWeak(&v27, (id *)buf);
  v18 = -[PLClickPresentationPresentationTransition initWithTransitionDelegate:presentingViewController:presentedViewController:completion:](v16, "initWithTransitionDelegate:presentingViewController:presentedViewController:completion:", v11, v6, WeakRetained, v26);
  -[PLClickPresentationTransition setPropagatesPresentingViewTransform:](v18, "setPropagatesPresentingViewTransform:", -[PLClickPresentationInteractionManager didInteractionInitiateWithHint](self, "didInteractionInitiateWithHint"));
  objc_msgSend(v14, "setAppearanceTransition:", v18);
  v19 = [PLClickPresentationDismissalTransition alloc];
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke_2;
  v24[3] = &unk_1E91D32F0;
  objc_copyWeak(&v25, (id *)buf);
  v20 = -[PLClickPresentationDismissalTransition initWithTransitionDelegate:presentingViewController:presentedViewController:completion:](v19, "initWithTransitionDelegate:presentingViewController:presentedViewController:completion:", v11, v6, WeakRetained, v24);
  -[PLClickPresentationDismissalTransition setPresentationTransition:](v20, "setPresentationTransition:", v18);
  objc_msgSend(v14, "setDisappearanceTransition:", v20);
  objc_msgSend(WeakRetained, "loadViewIfNeeded");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "viewForTouchContinuation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomViewForTouchContinuation:", v21);

  }
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

  return v14;
}

void __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clickPresentationTransitionDidPresent:", a2);

}

void __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clickPresentationTransitionDidDismiss:", a2);

}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id WeakRetained;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "viewForPreview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClickPresentationInteractionManager _setPresentingViewControllerHighlighted:animated:](self, "_setPresentingViewControllerHighlighted:animated:", 1, 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAF20]), "initWithView:", v6);

  return v7;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  -[PLClickPresentationInteractionManager _setPresentingViewControllerHighlighted:animated:](self, "_setPresentingViewControllerHighlighted:animated:", 0, 1);
  -[PLClickPresentationInteractionManager _clickInteractionDidEnd](self, "_clickInteractionDidEnd");
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x100) != 0)
    return -[PLClickPresentationInteractionManager _delegateShouldAllowLongPressGesture](self, "_delegateShouldAllowLongPressGesture", a3) ^ 1;
  else
    return 0;
}

- (id)_presentedViewController
{
  PLClickPresentationInteractionPresentable **p_presentedViewController;
  void *WeakRetained;

  p_presentedViewController = &self->_presentedViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  if (!WeakRetained)
  {
    -[PLClickPresentationInteractionManager _delegatePresentedViewController](self, "_delegatePresentedViewController");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_presentedViewController, WeakRetained);
  }
  return WeakRetained;
}

- (void)_setPresentingViewControllerHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  BOOL v13;

  v4 = a4;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v4)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0D47498], "newDefaultHighlightAnimator");
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __90__PLClickPresentationInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke;
      v11 = &unk_1E91D3188;
      v12 = WeakRetained;
      v13 = v5;
      objc_msgSend(v7, "addAnimations:", &v8);
      objc_msgSend(v7, "startAnimation", v8, v9, v10, v11);

    }
    else
    {
      objc_msgSend(WeakRetained, "setHighlighted:", v5);
    }
  }

}

uint64_t __90__PLClickPresentationInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_delegateShouldAllowLongPressGesture
{
  PLClickPresentationInteractionManager *v3;
  id WeakRetained;

  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x100) == 0)
    return 0;
  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "clickPresentationInteractionManagerShouldAllowLongPressGesture:", v3);

  return (char)v3;
}

- (PLClickPresentationInteractionManagerDelegate)delegate
{
  return (PLClickPresentationInteractionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PLClickPresentationInteractionPresentable)presentedViewController
{
  return (PLClickPresentationInteractionPresentable *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (BOOL)didInteractionInitiateWithHint
{
  return self->_didInteractionInitiateWithHint;
}

- (void)_setDidInteractionInitiateWithHint:(BOOL)a3
{
  self->_didInteractionInitiateWithHint = a3;
}

- (BOOL)_willPresent
{
  return self->_willPresent;
}

- (void)_setWillPresent:(BOOL)a3
{
  self->_willPresent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_destroyWeak((id *)&self->_clickPresentation);
  objc_storeStrong((id *)&self->_clickPresentationInteraction, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (id)_delegatePresentedViewController
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentedViewControllerForClickPresentationInteractionManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_delegateTransitioningDelegate
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transitioningDelegateForClickPresentationInteractionManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_delegateContainerView
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerViewForClickPresentationInteractionManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_delegateShouldBeginInteractionWithTouchAtLocation:(CGPoint)a3
{
  double y;
  double x;
  PLClickPresentationInteractionManager *v5;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  v5 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v5) = objc_msgSend(WeakRetained, "clickPresentationInteractionManager:shouldBeginInteractionWithTouchAtLocation:", v5, x, y);

  return (char)v5;
}

- (void)_delegateWillBeginUserInteraction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clickPresentationInteractionManagerWillBeginUserInteraction:", self);

}

- (void)_delegateDidEndUserInteraction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clickPresentationInteractionManagerDidEndUserInteraction:", self);

}

- (void)_delegateShouldFinishInteractionThatReachedForceThreshold:(BOOL)a3 withCompletionBlock:(id)a4
{
  _BOOL8 v4;
  PLClickPresentationInteractionManagerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  v4 = a3;
  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "clickPresentationInteractionManager:shouldFinishInteractionThatReachedForceThreshold:withCompletionBlock:", self, v4, v7);

}

- (void)_delegateWillDismissPresentedContentWithTrigger:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clickPresentationInteractionManager:willDismissPresentedContentWithTrigger:", self, a3);

}

- (void)_delegateDeclinedDismissingPresentedContentWithTrigger:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clickPresentationInteractionManager:declinedDismissingPresentedContentWithTrigger:", self, a3);

}

- (BOOL)_dismissIfPossibleWithTrigger:(int64_t)a3
{
  void *v5;
  __CFString *v6;
  NSObject *v7;
  _BOOL4 v8;
  __int16 clickPresentationInteractionManagerDelegateFlags;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)PLLogTransition;
  if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4)
      v6 = 0;
    else
      v6 = off_1E91D36C8[a3];
    *(_DWORD *)v11 = 138543362;
    *(_QWORD *)&v11[4] = v6;
    v7 = v5;
    _os_log_impl(&dword_1D1285000, v7, OS_LOG_TYPE_DEFAULT, "Asked to dismiss presented content with trigger '%{public}@'", v11, 0xCu);

  }
  v8 = -[PLClickPresentationInteractionManager dismissIfPossible:](self, "dismissIfPossible:", 0, *(_OWORD *)v11);
  clickPresentationInteractionManagerDelegateFlags = (__int16)self->_clickPresentationInteractionManagerDelegateFlags;
  if (v8)
  {
    if ((clickPresentationInteractionManagerDelegateFlags & 0x40) != 0)
      -[PLClickPresentationInteractionManager _delegateWillDismissPresentedContentWithTrigger:](self, "_delegateWillDismissPresentedContentWithTrigger:", a3);
  }
  else if ((clickPresentationInteractionManagerDelegateFlags & 0x80) != 0)
  {
    -[PLClickPresentationInteractionManager _delegateDeclinedDismissingPresentedContentWithTrigger:](self, "_delegateDeclinedDismissingPresentedContentWithTrigger:", a3);
  }
  return v8;
}

- (PLClickPresentationInteractionManager)initWithPresentingViewController:(id)a3
{
  return -[PLClickPresentationInteractionManager initWithPresentingViewController:delegate:](self, "initWithPresentingViewController:delegate:", a3, 0);
}

- (void)resetForInitialInteraction
{
  id WeakRetained;
  _UIClickPresentationInteraction *v4;
  _UIClickPresentationInteraction *clickPresentationInteraction;
  void *v6;
  id v7;

  self->_didPresent = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    -[_UIClickPresentationInteraction cancelInteraction](self->_clickPresentationInteraction, "cancelInteraction");
    WeakRetained = v7;
    if (!self->_clickPresentationInteraction)
    {
      v4 = (_UIClickPresentationInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACA8]), "initWithDelegate:", self);
      clickPresentationInteraction = self->_clickPresentationInteraction;
      self->_clickPresentationInteraction = v4;

      objc_msgSend(v7, "viewForPreview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addInteraction:", self->_clickPresentationInteraction);

      WeakRetained = v7;
    }
  }

}

@end
