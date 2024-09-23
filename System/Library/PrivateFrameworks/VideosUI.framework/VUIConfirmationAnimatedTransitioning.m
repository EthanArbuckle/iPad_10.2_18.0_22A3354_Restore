@implementation VUIConfirmationAnimatedTransitioning

- (VUIConfirmationAnimatedTransitioning)init
{
  return -[VUIConfirmationAnimatedTransitioning initWithPresenting:](self, "initWithPresenting:", 1);
}

- (VUIConfirmationAnimatedTransitioning)initWithPresenting:(BOOL)a3
{
  VUIConfirmationAnimatedTransitioning *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIConfirmationAnimatedTransitioning;
  result = -[VUIConfirmationAnimatedTransitioning init](&v5, sel_init);
  if (result)
    result->_presenting = a3;
  return result;
}

- (double)transitionDuration:(id)a3
{
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  CGAffineTransform v28;
  id location;

  v4 = a3;
  -[VUIConfirmationAnimatedTransitioning transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5;
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  if (-[VUIConfirmationAnimatedTransitioning isPresenting](self, "isPresenting"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v10);

    objc_msgSend(v9, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(v9, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v28, 0.88, 0.88);
    objc_msgSend(v14, "setAffineTransform:", &v28);

    objc_msgSend(v7, "addSubview:", v9);
    objc_msgSend(v9, "setAlpha:", 0.0);
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke;
    v26[3] = &unk_1E9F98DF0;
    v27 = v9;
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_2;
    v24[3] = &unk_1E9F9B3A0;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v15, "animateWithDuration:animations:completion:", v26, v24, v6);
    objc_destroyWeak(&v25);

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v18 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_3;
    v22[3] = &unk_1E9F98DF0;
    v23 = v8;
    v19[0] = v18;
    v19[1] = 3221225472;
    v19[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_4;
    v19[3] = &unk_1E9F9C430;
    v20 = v23;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v17, "animateWithDuration:animations:completion:", v22, v19, v6);
    objc_destroyWeak(&v21);

    v12 = v23;
  }

  objc_destroyWeak(&location);
}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setAffineTransform:", v4);

}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeTransition:", a2);

}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v3, 0.88, 0.88);
  objc_msgSend(v2, "setAffineTransform:", &v3);

}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  id WeakRetained;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setAffineTransform:", v7);

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completeTransition:", a2);

}

- (void)animationEnded:(BOOL)a3
{
  id v4;

  -[VUIConfirmationAnimatedTransitioning delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmationAnimatedTransitioningAnimationDidEnd:", self);

}

- (VUIConfirmationAnimatedTransitioningDelegate)delegate
{
  return (VUIConfirmationAnimatedTransitioningDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
