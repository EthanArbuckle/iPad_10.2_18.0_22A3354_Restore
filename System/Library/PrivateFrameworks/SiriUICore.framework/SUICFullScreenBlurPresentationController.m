@implementation SUICFullScreenBlurPresentationController

- (SUICFullScreenBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  return -[SUICFullScreenBlurPresentationController initWithPresentedViewController:presentingViewController:blurStyle:](self, "initWithPresentedViewController:presentingViewController:blurStyle:", a3, a4, 0);
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[_UIBackdropView setAlpha:](self->_fullScreenBlurView, "setAlpha:", 0.0);
  -[SUICFullScreenBlurPresentationController _stageViewsForFadeIn](self, "_stageViewsForFadeIn");
  -[SUICFullScreenBlurPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke;
  v8[3] = &unk_1E4A54F70;
  objc_copyWeak(&v9, &location);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke_2;
  v6[3] = &unk_1E4A54F70;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v8, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[44], "setAlpha:", 1.0);
    WeakRetained = v2;
  }

}

void __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentedViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "becomeFirstResponder");

    WeakRetained = v3;
  }

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
    -[_UIBackdropView removeFromSuperview](self->_fullScreenBlurView, "removeFromSuperview");
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[SUICFullScreenBlurPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke;
  v8[3] = &unk_1E4A54F70;
  objc_copyWeak(&v9, &location);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke_2;
  v6[3] = &unk_1E4A54F70;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v8, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[44], "setAlpha:", 0.0);
    WeakRetained = v2;
  }

}

void __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "presentedViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(v5[44], "removeFromSuperview");
    objc_msgSend(v5, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponder");

    WeakRetained = v5;
  }

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (!a3)
    -[SUICFullScreenBlurPresentationController _stageViewsForFadeIn](self, "_stageViewsForFadeIn");
}

- (SUICFullScreenBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 blurStyle:(unint64_t)a5
{
  SUICFullScreenBlurPresentationController *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _UIBackdropView *fullScreenBlurView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUICFullScreenBlurPresentationController;
  v6 = -[SUICFullScreenBlurPresentationController initWithPresentedViewController:presentingViewController:](&v12, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC4028]);
    if (a5 == 2)
      v8 = 2020;
    else
      v8 = 2030;
    v9 = objc_msgSend(v7, "initWithPrivateStyle:", v8);
    fullScreenBlurView = v6->_fullScreenBlurView;
    v6->_fullScreenBlurView = (_UIBackdropView *)v9;

  }
  return v6;
}

- (void)setBlurStyle:(unint64_t)a3
{
  _UIBackdropView *fullScreenBlurView;
  uint64_t v4;

  fullScreenBlurView = self->_fullScreenBlurView;
  if (a3 == 2)
    v4 = 2020;
  else
    v4 = 2030;
  -[_UIBackdropView transitionToPrivateStyle:](fullScreenBlurView, "transitionToPrivateStyle:", v4);
}

- (unint64_t)blurStyle
{
  if (-[_UIBackdropView style](self->_fullScreenBlurView, "style") == 2020)
    return 2;
  else
    return 1;
}

- (void)_stageViewsForFadeIn
{
  _UIBackdropView *fullScreenBlurView;
  void *v4;
  void *v5;
  id v6;

  -[SUICFullScreenBlurPresentationController containerView](self, "containerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  fullScreenBlurView = self->_fullScreenBlurView;
  objc_msgSend(v6, "bounds");
  -[_UIBackdropView setFrame:](fullScreenBlurView, "setFrame:");
  objc_msgSend(v6, "addSubview:", self->_fullScreenBlurView);
  -[SUICFullScreenBlurPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView bounds](self->_fullScreenBlurView, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[_UIBackdropView addSubview:](self->_fullScreenBlurView, "addSubview:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenBlurView, 0);
}

@end
