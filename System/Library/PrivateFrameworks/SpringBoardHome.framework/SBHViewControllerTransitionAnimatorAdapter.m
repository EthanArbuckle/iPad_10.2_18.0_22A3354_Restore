@implementation SBHViewControllerTransitionAnimatorAdapter

- (SBHViewControllerTransitionAnimatorAdapter)initWithAnimator:(id)a3
{
  id v5;
  SBHViewControllerTransitionAnimatorAdapter *v6;
  SBHViewControllerTransitionAnimatorAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHViewControllerTransitionAnimatorAdapter;
  v6 = -[SBHViewControllerTransitionAnimatorAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animator, a3);

  return v7;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "animationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "transitionEndpoint");
    -[SBHViewControllerTransitionAnimatorAdapter animator](self, "animator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "transitionWasRestarted") & 1) == 0)
      objc_msgSend(v12, "prepareToAnimateFromEndpoint:withContext:", v11 != 1, v10);
    v13 = -[SBHViewControllerTransitionAnimatorAdapter transitionToken](self, "transitionToken") + 1;
    -[SBHViewControllerTransitionAnimatorAdapter setTransitionToken:](self, "setTransitionToken:", v13);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__SBHViewControllerTransitionAnimatorAdapter_animateTransition___block_invoke;
    v15[3] = &unk_1E8D8B2F8;
    v15[4] = self;
    v16 = v12;
    v19 = v13;
    v20 = v11;
    v17 = v10;
    v18 = v6;
    v14 = v12;
    objc_msgSend(v14, "animateToEndpoint:withContext:completion:", v11, v17, v15);

  }
  else
  {
    objc_msgSend(v6, "cancelTransition");
  }

}

uint64_t __64__SBHViewControllerTransitionAnimatorAdapter_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 64);
  result = objc_msgSend(*(id *)(a1 + 32), "transitionToken");
  if (v2 == result)
  {
    objc_msgSend(*(id *)(a1 + 40), "finalizeAnimationAtEndpoint:withContext:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 56), "completeTransition:", 1);
  }
  return result;
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  unint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  _BOOL8 v21;

  v6 = a3;
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "animationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SBHViewControllerTransitionAnimatorAdapter animator](self, "animator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "transitionEndpoint") != 1;
    v14 = -[SBHViewControllerTransitionAnimatorAdapter transitionToken](self, "transitionToken") + 1;
    -[SBHViewControllerTransitionAnimatorAdapter setTransitionToken:](self, "setTransitionToken:", v14);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__SBHViewControllerTransitionAnimatorAdapter_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
    v16[3] = &unk_1E8D8B2F8;
    v16[4] = self;
    v17 = v12;
    v20 = v14;
    v21 = v13;
    v18 = v11;
    v19 = v8;
    v15 = v12;
    objc_msgSend(v15, "animateToEndpoint:withContext:completion:", v13, v18, v16);

  }
  else
  {
    objc_msgSend(v8, "completeTransition:", 0);
  }

}

uint64_t __99__SBHViewControllerTransitionAnimatorAdapter_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 64);
  result = objc_msgSend(*(id *)(a1 + 32), "transitionToken");
  if (v2 == result)
  {
    objc_msgSend(*(id *)(a1 + 40), "finalizeAnimationAtEndpoint:withContext:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 56), "completeTransition:", 0);
  }
  return result;
}

- (SBHViewControllerTransitionAnimating)animator
{
  return self->_animator;
}

- (unint64_t)transitionToken
{
  return self->_transitionToken;
}

- (void)setTransitionToken:(unint64_t)a3
{
  self->_transitionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
