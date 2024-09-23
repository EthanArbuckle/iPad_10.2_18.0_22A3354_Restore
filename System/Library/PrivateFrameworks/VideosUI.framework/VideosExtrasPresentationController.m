@implementation VideosExtrasPresentationController

- (VideosExtrasPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 extrasMenuBarView:(id)a5 extrasmenuBarFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  VideosExtrasPresentationController *v15;
  VideosExtrasPresentationController *v16;
  objc_super v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VideosExtrasPresentationController;
  v15 = -[VideosExtrasPresentationController initWithPresentedViewController:presentingViewController:](&v18, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_extrasMenuBarView, a5);
    v16->_extrasMenuBarFrame.origin.x = x;
    v16->_extrasMenuBarFrame.origin.y = y;
    v16->_extrasMenuBarFrame.size.width = width;
    v16->_extrasMenuBarFrame.size.height = height;
  }

  return v16;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[VideosExtrasPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasPresentationController extrasMenuBarFrame](self, "extrasMenuBarFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v5, "addSubview:", v7);
    objc_msgSend(v5, "bringSubviewToFront:", v7);
    objc_msgSend(v7, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, v9 + v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB3718];
    v33[0] = v21;
    v33[1] = v23;
    v33[2] = v15;
    v33[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v25);

    objc_msgSend(v6, "transitionCoordinator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v6, "transitionCoordinator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __69__VideosExtrasPresentationController_presentationTransitionWillBegin__block_invoke;
      v29[3] = &unk_1E9F9CFA0;
      objc_copyWeak(&v31, &location);
      v30 = v5;
      objc_msgSend(v27, "animateAlongsideTransition:completion:", v29, &__block_literal_global_143);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAlpha:", 1.0);

    }
  }
}

void __69__VideosExtrasPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "extrasMenuBarView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", v3);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  void *v4;
  id v5;

  -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VideosExtrasPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasPresentationController extrasMenuBarFrame](self, "extrasMenuBarFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v4, "addSubview:", v6);
    objc_msgSend(v4, "bringSubviewToFront:", v6);
    -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 1.0);

    objc_msgSend(v6, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, v8 + v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB3718];
    v33[0] = v21;
    v33[1] = v23;
    v33[2] = v15;
    v33[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v25);

    objc_msgSend(v5, "transitionCoordinator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v5, "transitionCoordinator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __66__VideosExtrasPresentationController_dismissalTransitionWillBegin__block_invoke;
      v29[3] = &unk_1E9F9CFA0;
      objc_copyWeak(&v31, &location);
      v30 = v4;
      objc_msgSend(v27, "animateAlongsideTransition:completion:", v29, 0);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAlpha:", 0.0);

    }
  }
}

void __66__VideosExtrasPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "extrasMenuBarView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", v3);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v4;
  id v5;

  -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VideosExtrasPresentationController extrasMenuBarView](self, "extrasMenuBarView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (UIView)extrasMenuBarView
{
  return self->_extrasMenuBarView;
}

- (void)setExtrasMenuBarView:(id)a3
{
  objc_storeStrong((id *)&self->_extrasMenuBarView, a3);
}

- (CGRect)extrasMenuBarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_extrasMenuBarFrame.origin.x;
  y = self->_extrasMenuBarFrame.origin.y;
  width = self->_extrasMenuBarFrame.size.width;
  height = self->_extrasMenuBarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExtrasMenuBarFrame:(CGRect)a3
{
  self->_extrasMenuBarFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extrasMenuBarView, 0);
}

@end
