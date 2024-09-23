@implementation SKUIReviewInAppRatingAnimatedTransitioning

- (id)_presentedViewControllerForContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *MEMORY[0x1E0DC55B8];
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SKUIReviewInAppRatingAnimatedTransitioning isPresentation](self, "isPresentation"))
    v8 = v7;
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

- (double)transitionDuration:(id)a3
{
  return 0.404;
}

- (void)animateTransition:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SKUIReviewInAppRatingAnimatedTransitioning_animateTransition___block_invoke;
  v6[3] = &unk_1E73A0108;
  v7 = v4;
  v5 = v4;
  -[SKUIReviewInAppRatingAnimatedTransitioning _animateTransition:completionBlock:](self, "_animateTransition:completionBlock:", v5, v6);

}

uint64_t __64__SKUIReviewInAppRatingAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (void)_animateTransition:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CGAffineTransform v28;
  double v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKUIReviewInAppRatingAnimatedTransitioning isPresentation](self, "isPresentation");
  -[SKUIReviewInAppRatingAnimatedTransitioning _presentedViewControllerForContext:](self, "_presentedViewControllerForContext:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");
  -[SKUIReviewInAppRatingAnimatedTransitioning transitionDuration:](self, "transitionDuration:", v7);
  v13 = v12;

  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v32.c = v14;
  *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v31.a = *(_OWORD *)&v32.a;
  *(_OWORD *)&v31.c = v14;
  *(_OWORD *)&v31.tx = *(_OWORD *)&v32.tx;
  if (v9)
  {
    CGAffineTransformMakeScale(&v32, 1.2, 1.2);
    v15 = 0.0;
  }
  else
  {
    v15 = 1.0;
    CGAffineTransformMakeScale(&v31, 1.0, 1.0);
  }
  v30 = v32;
  objc_msgSend(v11, "setTransform:", &v30);
  objc_msgSend(v11, "setAlpha:", v15);
  objc_msgSend(v10, "presentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "dimmingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (v9)
    v18 = 1.0;
  else
    v18 = 0.0;
  objc_msgSend(v17, "setAlpha:", v15);
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__SKUIReviewInAppRatingAnimatedTransitioning__animateTransition_completionBlock___block_invoke;
  v25[3] = &unk_1E73A2C78;
  v28 = v31;
  v29 = v18;
  v26 = v11;
  v27 = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__SKUIReviewInAppRatingAnimatedTransitioning__animateTransition_completionBlock___block_invoke_2;
  v23[3] = &unk_1E73A0220;
  v24 = v6;
  v20 = v6;
  v21 = v17;
  v22 = v11;
  objc_msgSend(v19, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v25, v23, v13, 0.0, 600.0, 0.0);

}

uint64_t __81__SKUIReviewInAppRatingAnimatedTransitioning__animateTransition_completionBlock___block_invoke(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 96));
}

uint64_t __81__SKUIReviewInAppRatingAnimatedTransitioning__animateTransition_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isPresentation
{
  return self->_presentation;
}

- (void)setPresentation:(BOOL)a3
{
  self->_presentation = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
