@implementation _UIProgressiveBlurPresentationAnimator

- (id)initForPresenting:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIProgressiveBlurPresentationAnimator;
  result = -[_UIProgressiveBlurPresentationAnimator init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (double)transitionDuration:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[_UIProgressiveBlurPresentationAnimator isPresenting](self, "isPresenting", a3);
  result = 0.7;
  if (!v3)
    return 0.5;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  double v13;
  double v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  double v34;
  CGAffineTransform v35;
  double v36;
  BOOL v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;

  v4 = a3;
  v5 = -[_UIProgressiveBlurPresentationAnimator isPresenting](self, "isPresenting");
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextToView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6;
  else
    v9 = (void *)v7;
  v10 = v9;
  objc_msgSend(v4, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v11, "addSubview:", v10);
  memset(&v40, 0, sizeof(v40));
  if (v5)
  {
    CGAffineTransformMakeScale(&v40, 0.9, 0.9);
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v39.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v39.c = v12;
    *(_OWORD *)&v39.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v13 = 0.0;
    v14 = 1.0;
  }
  else
  {
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v40.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v40.c = v15;
    *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    memset(&v39, 0, sizeof(v39));
    CGAffineTransformMakeScale(&v39, 0.9, 0.9);
    v13 = 1.0;
    v14 = 0.0;
  }
  v38 = v40;
  objc_msgSend(v10, "setTransform:", &v38);
  objc_msgSend(v10, "setAlpha:", v13);
  -[_UIProgressiveBlurPresentationAnimator transitionDuration:](self, "transitionDuration:", v4);
  v17 = v16;
  if (-[_UIProgressiveBlurPresentationAnimator isPresenting](self, "isPresenting"))
    v18 = v17 * 0.4;
  else
    v18 = 0.0;
  objc_msgSend((id)objc_opt_class(), "alphaAnimationFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "transformAnimationFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v39;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke;
  v27[3] = &unk_1E16BF748;
  v37 = v5;
  v32 = v17;
  v33 = 0x403E000000000000;
  v28 = v20;
  v29 = v10;
  v30 = v19;
  v31 = 0x4045000000000000;
  v34 = v18;
  v36 = v14;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_5;
  v25[3] = &unk_1E16B3FD8;
  v26 = v4;
  v21 = v4;
  v22 = v19;
  v23 = v10;
  v24 = v20;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393248, v22, v27, v25, v17, 0.0);

}

+ (id)alphaAnimationFactory
{
  return -[_UIProgressiveBlurPresentationAnimationFactory initWithCurve:]([_UIProgressiveBlurPresentationAnimationFactory alloc], "initWithCurve:", 0);
}

+ (id)transformAnimationFactory
{
  return -[_UIProgressiveBlurPresentationAnimationFactory initWithCurve:]([_UIProgressiveBlurPresentationAnimationFactory alloc], "initWithCurve:", 1);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end
