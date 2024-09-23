@implementation SMUFocusedSheetPresentationController

- (SMUFocusedSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  SMUFocusedSheetPresentationController *v4;
  uint64_t v5;
  UIBlurEffect *backgroundBlurEffect;
  uint64_t v7;
  UIVisualEffectView *blurredBackgroundView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SMUFocusedSheetPresentationController;
  v4 = -[SMUFocusedSheetPresentationController initWithPresentedViewController:presentingViewController:](&v10, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 5);
    v5 = objc_claimAutoreleasedReturnValue();
    backgroundBlurEffect = v4->_backgroundBlurEffect;
    v4->_backgroundBlurEffect = (UIBlurEffect *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", 0);
    blurredBackgroundView = v4->_blurredBackgroundView;
    v4->_blurredBackgroundView = (UIVisualEffectView *)v7;

    -[UIVisualEffectView setUserInteractionEnabled:](v4->_blurredBackgroundView, "setUserInteractionEnabled:", 0);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_blurredBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v4;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;
  objc_super v35;
  _QWORD v36[6];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)SMUFocusedSheetPresentationController;
  -[SMUFocusedSheetPresentationController presentationTransitionWillBegin](&v35, sel_presentationTransitionWillBegin);
  -[SMUFocusedSheetPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  v18 = (void *)MEMORY[0x24BDD1628];
  -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUFocusedSheetPresentationController containerView](self, "containerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v26;
  -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUFocusedSheetPresentationController containerView](self, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v21;
  -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUFocusedSheetPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v7;
  -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUFocusedSheetPresentationController containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v13);

  -[SMUFocusedSheetPresentationController presentingViewController](self, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMUFocusedSheetPresentationController backgroundBlurEffect](self, "backgroundBlurEffect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __72__SMUFocusedSheetPresentationController_presentationTransitionWillBegin__block_invoke;
  v31[3] = &unk_24F555D40;
  objc_copyWeak(&v33, &location);
  v17 = v16;
  v32 = v17;
  objc_msgSend(v15, "animateAlongsideTransition:completion:", v31, 0);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __72__SMUFocusedSheetPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "blurredBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffect:", *(_QWORD *)(a1 + 32));

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMUFocusedSheetPresentationController;
  -[SMUFocusedSheetPresentationController presentationTransitionDidEnd:](&v6, sel_presentationTransitionDidEnd_);
  if (!a3)
  {
    -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SMUFocusedSheetPresentationController;
  -[SMUFocusedSheetPresentationController dismissalTransitionWillBegin](&v8, sel_dismissalTransitionWillBegin);
  -[SMUFocusedSheetPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__SMUFocusedSheetPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_24F555D68;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __69__SMUFocusedSheetPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "blurredBackgroundView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEffect:", 0);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMUFocusedSheetPresentationController;
  -[SMUFocusedSheetPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  if (!a3)
  {
    -[SMUFocusedSheetPresentationController blurredBackgroundView](self, "blurredBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (UIVisualEffectView)blurredBackgroundView
{
  return self->_blurredBackgroundView;
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void)setBackgroundBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
}

@end
