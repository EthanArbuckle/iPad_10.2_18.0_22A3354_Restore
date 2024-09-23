@implementation SKUIContextActionsPresentationController

- (SKUIContextActionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  SKUIContextActionsPresentationController *v8;
  UIVisualEffectView *v9;
  void *v10;
  UIVisualEffectView *backgroundView;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsPresentationController initWithPresentedViewController:presentingViewController:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIContextActionsPresentationController;
  v8 = -[SKUIContextActionsPresentationController initWithPresentedViewController:presentingViewController:](&v13, sel_initWithPresentedViewController_presentingViewController_, v6, v7);
  if (v8)
  {
    v9 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
    -[UIVisualEffectView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.400000006);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    backgroundView = v8->_backgroundView;
    v8->_backgroundView = v9;

  }
  return v8;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  SKUIContextActionsPresentationController *v24;
  _QWORD v25[5];
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SKUIContextActionsPresentationController;
  -[SKUIContextActionsPresentationController presentationTransitionWillBegin](&v26, sel_presentationTransitionWillBegin);
  -[SKUIContextActionsPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIContextActionsPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v3, "isOrbPresentation");
  -[SKUIContextActionsPresentationController backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v7);

  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SKUIContextActionsPresentationController backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[SKUIContextActionsPresentationController backgroundView](self, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 0.0);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "_synchronizeDrawing");
    -[SKUIContextActionsPresentationController backgroundView](self, "backgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSubview:belowSubview:", v6, v18);

  }
  -[SKUIContextActionsPresentationController presentedViewController](self, "presentedViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transitionCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke;
  v25[3] = &unk_1E739FF90;
  v25[4] = self;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke_2;
  v22[3] = &unk_1E73A35C8;
  v23 = v6;
  v21 = v6;
  objc_msgSend(v20, "animateAlongsideTransition:completion:", v25, v22);

}

void __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

  }
}

void __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "_synchronizeDrawing");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusBarWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUIContextActionsPresentationController;
  -[SKUIContextActionsPresentationController dismissalTransitionWillBegin](&v13, sel_dismissalTransitionWillBegin);
  -[SKUIContextActionsPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v3, "isOrbPresentation");
  -[SKUIContextActionsPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke;
  v12[3] = &unk_1E739FF90;
  v12[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke_2;
  v9[3] = &unk_1E73A37F0;
  v11 = (char)v4;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, v9);

}

void __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(void);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "dismissalAnimations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissalAnimations");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

void __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0DC3F98], "_synchronizeDrawing");
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "statusBarWindow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addSubview:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (id)dismissalAnimations
{
  return self->_dismissalAnimations;
}

- (void)setDismissalAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalAnimations, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)initWithPresentedViewController:presentingViewController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIContextActionsPresentationController initWithPresentedViewController:presentingViewController:]";
}

@end
