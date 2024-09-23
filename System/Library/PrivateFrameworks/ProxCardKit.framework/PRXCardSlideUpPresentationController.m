@implementation PRXCardSlideUpPresentationController

- (PRXCardSlideUpPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  return -[PRXCardSlideUpPresentationController initWithDimmingStyle:presentedViewController:presentingViewController:](self, "initWithDimmingStyle:presentedViewController:presentingViewController:", 0, a3, a4);
}

- (PRXCardSlideUpPresentationController)initWithDimmingStyle:(int64_t)a3 presentedViewController:(id)a4 presentingViewController:(id)a5
{
  PRXCardSlideUpPresentationController *v6;
  id v7;
  void *v8;
  uint64_t v9;
  UIView *dimmingView;
  UIView *v11;
  UIView *v12;
  PRXCardSlideUpPresentationController *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PRXCardSlideUpPresentationController;
  v6 = -[PRXCardSlideUpPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, a4, a5);
  if (v6)
  {
    if (a3 == 1)
    {
      v7 = objc_alloc(MEMORY[0x24BDF6FC8]);
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithEffect:", v8);
      dimmingView = v6->_dimmingView;
      v6->_dimmingView = (UIView *)v9;

    }
    else
    {
      v11 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
      v12 = v6->_dimmingView;
      v6->_dimmingView = v11;

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6->_dimmingView, "setBackgroundColor:", v8);
    }

    -[UIView setAutoresizingMask:](v6->_dimmingView, "setAutoresizingMask:", 18);
    v13 = v6;
  }

  return v6;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
  -[PRXCardSlideUpPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");

  -[PRXCardSlideUpPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_dimmingView);

  -[PRXCardSlideUpPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__PRXCardSlideUpPresentationController_presentationTransitionWillBegin__block_invoke;
  v7[3] = &unk_24CC31EC0;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

}

void __71__PRXCardSlideUpPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  UIView *dimmingView;

  if (!a3)
  {
    -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PRXCardSlideUpPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__PRXCardSlideUpPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_24CC31EC0;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

void __68__PRXCardSlideUpPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  UIView *dimmingView;

  if (a3)
  {
    -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;

  }
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
