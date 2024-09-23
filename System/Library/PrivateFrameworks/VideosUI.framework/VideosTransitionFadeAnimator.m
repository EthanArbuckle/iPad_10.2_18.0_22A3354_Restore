@implementation VideosTransitionFadeAnimator

- (VideosTransitionFadeAnimator)initWithTransitionType:(int64_t)a3 andDuration:(double)a4
{
  VideosTransitionFadeAnimator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosTransitionFadeAnimator;
  result = -[VideosTransitionFadeAnimator init](&v7, sel_init);
  if (result)
  {
    result->_transitionType = a3;
    result->_animationDuration = a4;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  BOOL v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  BOOL v39;
  CGAffineTransform v40;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v5, "addSubview:", v8);
  objc_msgSend(v8, "setFrame:", v10, v12, v14, v16);
  objc_msgSend(v8, "setAlpha:", 0.0);
  objc_msgSend(v6, "setAlpha:", 1.0);
  v17 = -[VideosTransitionFadeAnimator transitionType](self, "transitionType");
  if (v17)
    v18 = v6;
  else
    v18 = v8;
  v19 = v18;
  if (v17)
  {
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v40.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v40.c = v20;
    *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v40, 1.4, 1.4);
  }
  v21 = v17 == 0;
  objc_msgSend(v19, "setTransform:", &v40);
  -[VideosTransitionFadeAnimator transitionDuration:](self, "transitionDuration:", v4);
  v23 = v22;
  v24 = (void *)MEMORY[0x1E0DC3F10];
  v25 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__VideosTransitionFadeAnimator_animateTransition___block_invoke;
  v35[3] = &unk_1E9F9A1B8;
  v36 = v19;
  v39 = v21;
  v37 = v8;
  v38 = v6;
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __50__VideosTransitionFadeAnimator_animateTransition___block_invoke_2;
  v30[3] = &unk_1E9F9F688;
  v34 = v21;
  v31 = v4;
  v32 = v37;
  v33 = v38;
  v26 = v38;
  v27 = v37;
  v28 = v4;
  v29 = v19;
  objc_msgSend(v24, "animateWithDuration:animations:completion:", v35, v30, v23);

}

uint64_t __50__VideosTransitionFadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  CGAffineTransform v5;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v5.c = v3;
    *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v5, 1.4, 1.4);
  }
  objc_msgSend(v2, "setTransform:", &v5);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __50__VideosTransitionFadeAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  char v4;
  void *v5;
  __int128 v6;
  _OWORD v8[3];

  v2 = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled");
  v3 = v2 ^ 1u;
  if (*(_BYTE *)(a1 + 56))
    v4 = v2 ^ 1;
  else
    v4 = v2;
  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  v5 = *(void **)(a1 + 48);
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "setTransform:", v8);
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v3);
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

@end
