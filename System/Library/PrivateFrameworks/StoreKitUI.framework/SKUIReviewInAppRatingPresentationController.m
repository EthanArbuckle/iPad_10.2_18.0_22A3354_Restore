@implementation SKUIReviewInAppRatingPresentationController

- (SKUIReviewInAppRatingPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  SKUIReviewInAppRatingPresentationController *v4;
  SKUIReviewInAppRatingPresentationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIReviewInAppRatingPresentationController;
  v4 = -[SKUIReviewInAppRatingPresentationController initWithPresentedViewController:presentingViewController:](&v7, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
    -[SKUIReviewInAppRatingPresentationController setDelegate:](v4, "setDelegate:", v4);
  return v5;
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (void)containerViewWillLayoutSubviews
{
  -[SKUIReviewInAppRatingPresentationController _prepareDimmingViewIfNecessary](self, "_prepareDimmingViewIfNecessary");
  -[SKUIReviewInAppRatingPresentationController _prepareConstraintsIfNecessary](self, "_prepareConstraintsIfNecessary");
}

- (void)containerViewDidLayoutSubviews
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SKUIReviewInAppRatingPresentationController;
  -[SKUIReviewInAppRatingPresentationController containerViewDidLayoutSubviews](&v14, sel_containerViewDidLayoutSubviews);
  -[SKUIReviewInAppRatingPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKUIReviewInAppRatingPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SKUIReviewInAppRatingPresentationController dimmingView](self, "dimmingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "bounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_prepareDimmingViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[SKUIReviewInAppRatingPresentationController presentedViewController](self, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (!v3 && v10)
  {
    -[SKUIReviewInAppRatingPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIReviewInAppRatingPresentationController dimmingView](self, "dimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SKUIReviewInAppRatingPresentationController setDimmingView:](self, "setDimmingView:", v8);
    objc_msgSend(v5, "insertSubview:atIndex:", v8, 0);
    objc_msgSend(v5, "sendSubviewToBack:", v8);

    v4 = v10;
  }

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  id v4;

  -[SKUIReviewInAppRatingPresentationController containerView](self, "containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppRatingPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[SKUIReviewInAppRatingPresentationController _prepareDimmingViewIfNecessary](self, "_prepareDimmingViewIfNecessary");
  -[SKUIReviewInAppRatingPresentationController _prepareConstraintsIfNecessary](self, "_prepareConstraintsIfNecessary");

}

- (void)_prepareConstraintsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  if (!-[SKUIReviewInAppRatingPresentationController constraintsPrepared](self, "constraintsPrepared"))
  {
    -[SKUIReviewInAppRatingPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SKUIReviewInAppRatingPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isDescendantOfView:", v4))
    {
      -[SKUIReviewInAppRatingPresentationController setConstraintsPrepared:](self, "setConstraintsPrepared:", 1);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0DC3F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __77__SKUIReviewInAppRatingPresentationController__prepareConstraintsIfNecessary__block_invoke;
      v9[3] = &unk_1E73A02E8;
      v10 = v8;
      v11 = v4;
      v12 = v5;
      v7 = v5;
      objc_msgSend(v6, "performWithoutAnimation:", v9);

    }
  }
}

uint64_t __77__SKUIReviewInAppRatingPresentationController__prepareConstraintsIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 9, 0, *(_QWORD *)(a1 + 40), 9, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 10, 0, *(_QWORD *)(a1 + 40), 10, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 7, 0, *(_QWORD *)(a1 + 40), 7, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 8, 0, *(_QWORD *)(a1 + 40), 8, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateConstraints:", v7);

  v8 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 3, 1, *(_QWORD *)(a1 + 40), 3, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  v10 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 4, -1, *(_QWORD *)(a1 + 40), 4, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  return objc_msgSend(*(id *)(a1 + 40), "addConstraints:", *(_QWORD *)(a1 + 48));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)constraintsPrepared
{
  return self->_constraintsPrepared;
}

- (void)setConstraintsPrepared:(BOOL)a3
{
  self->_constraintsPrepared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
