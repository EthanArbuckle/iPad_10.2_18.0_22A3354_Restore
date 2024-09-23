@implementation SBHomeScreenIconTransitionAnimator

- (SBHomeScreenIconTransitionAnimator)initWithIconAnimator:(id)a3 childViewController:(id)a4 operation:(unint64_t)a5
{
  id v9;
  id v10;
  SBHomeScreenIconTransitionAnimator *v11;
  SBHomeScreenIconTransitionAnimator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHomeScreenIconTransitionAnimator;
  v11 = -[SBHomeScreenIconTransitionAnimator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_iconAnimator, a3);
    objc_msgSend(v9, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_childViewController, a4);
    v12->_operation = a5;
  }

  return v12;
}

- (BOOL)isCancelled
{
  return -[SBViewControllerContextTransitioning transitionWasCancelled](self->_transitionContext, "transitionWasCancelled");
}

- (BOOL)wasRestarted
{
  return -[SBViewControllerContextTransitioning transitionWasRestarted](self->_transitionContext, "transitionWasRestarted");
}

- (unint64_t)currentOperation
{
  unint64_t v3;

  v3 = -[SBHomeScreenIconTransitionAnimator operation](self, "operation");
  if (-[SBHomeScreenIconTransitionAnimator isCancelled](self, "isCancelled"))
    return v3 == 0;
  else
    return v3;
}

- (void)cancel
{
  if (!-[SBHomeScreenIconTransitionAnimator isCancelled](self, "isCancelled"))
    -[SBViewControllerContextTransitioning cancelTransition](self->_transitionContext, "cancelTransition");
}

- (void)restart
{
  if (-[SBHomeScreenIconTransitionAnimator isCancelled](self, "isCancelled"))
  {
    self->_needsTransitionTokenIncrementOnNextUpdate = 1;
    -[SBViewControllerContextTransitioning restartTransition](self->_transitionContext, "restartTransition");
  }
}

- (void)reverse
{
  if (-[SBHomeScreenIconTransitionAnimator isCancelled](self, "isCancelled"))
    -[SBHomeScreenIconTransitionAnimator restart](self, "restart");
  else
    -[SBHomeScreenIconTransitionAnimator cancel](self, "cancel");
}

- (void)completeImmediately
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  _QWORD v9[6];

  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "invalidated") & 1) == 0)
  {
    v5 = self->_transitionToken + 1;
    self->_transitionToken = v5;
    objc_msgSend(v4, "setSettings:", 0);
    v6 = -[SBHomeScreenIconTransitionAnimator currentOperation](self, "currentOperation");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SBHomeScreenIconTransitionAnimator_completeImmediately__block_invoke;
    v9[3] = &unk_1E8D8D4E8;
    v9[4] = self;
    v9[5] = v5;
    v7 = _Block_copy(v9);
    v8 = 0.0;
    if (!v6)
      v8 = 1.0;
    objc_msgSend(v4, "animateToFraction:afterDelay:withCompletion:", v7, v8, 0.0);

  }
  else
  {
    -[SBViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", -[SBHomeScreenIconTransitionAnimator isCancelled](self, "isCancelled") ^ 1);
  }

}

uint64_t __57__SBHomeScreenIconTransitionAnimator_completeImmediately__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == *(_QWORD *)(result + 16))
    return objc_msgSend(*(id *)(result + 8), "completeTransition:", objc_msgSend((id)result, "isCancelled") ^ 1);
  return result;
}

- (double)transitionDuration:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_msgSend(v4, "invalidated") & 1) == 0)
  {
    -[SBHomeScreenIconTransitionAnimator currentSettings](self, "currentSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centralAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "duration");
    v5 = v8;

  }
  return v5;
}

- (id)transitionAnimationFactory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v4 = a3;
  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "invalidated"))
  {
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[SBHomeScreenIconTransitionAnimator currentSettings](self, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centralAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "crossfadeSettings");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v8, "BSAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = objc_msgSend(v4, "transitionWasCancelled");
  if (-[SBHomeScreenIconTransitionAnimator operation](self, "operation") == 1)
    v13 = v12;
  else
    v13 = 0;
  v14 = 0.0;
  if ((v13 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
    objc_msgSend(v7, "appHeadStart");
    v16 = v15;
    if (!BSFloatGreaterThanFloat())
      goto LABEL_13;
    objc_msgSend(v11, "delay");
    v14 = v16 + v17;
  }
  objc_msgSend(v11, "setDelay:", v14);
LABEL_13:
  if ((v12 & 1) == 0 && (objc_msgSend(v4, "transitionWasRestarted") & 1) == 0)
  {
    objc_msgSend(v11, "delay");
    v19 = v18;
    -[SBHomeScreenIconTransitionAnimator initialDelay](self, "initialDelay");
    objc_msgSend(v11, "setDelay:", v19 + v20);
  }
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  if ((v13 & 1) == 0)
    objc_msgSend(v21, "setAllowsAdditiveAnimations:", 1);

LABEL_19:
  return v6;
}

- (void)animateTransition:(id)a3
{
  id v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;

  v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "invalidated");
  if (!v6 || (v7 & 1) != 0)
  {
    if (v7)
      -[SBHomeScreenIconTransitionAnimator cancel](self, "cancel");
    else
      objc_msgSend(v5, "completeTransition:", 1);
  }
  else
  {
    v8 = self->_transitionToken + 1;
    self->_transitionToken = v8;
    -[SBHomeScreenIconTransitionAnimator currentSettings](self, "currentSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSettings:", v9);

    v10 = -[SBHomeScreenIconTransitionAnimator operation](self, "operation");
    v11 = 0.0;
    v12 = 0.0;
    if ((objc_msgSend(v5, "transitionWasRestarted") & 1) == 0)
    {
      objc_msgSend(v6, "prepare");
      v13 = 1.0;
      if (!v10)
        v13 = 0.0;
      objc_msgSend(v6, "setFraction:", v13);
      -[SBHomeScreenIconTransitionAnimator initialDelay](self, "initialDelay");
      v12 = v14;
    }
    if (!v10)
      v11 = 1.0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__SBHomeScreenIconTransitionAnimator_animateTransition___block_invoke;
    v15[3] = &unk_1E8D8D510;
    v17 = v8;
    v15[4] = self;
    v16 = v5;
    objc_msgSend(v6, "animateToFraction:afterDelay:withCompletion:", v15, v11, v12);

  }
}

uint64_t __56__SBHomeScreenIconTransitionAnimator_animateTransition___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    return objc_msgSend(*(id *)(result + 40), "completeTransition:", 1);
  return result;
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  double v14;
  _QWORD aBlock[5];
  id v16;
  unint64_t v17;

  v6 = a3;
  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "invalidated") & 1) == 0)
  {
    v9 = self->_transitionToken + 1;
    self->_transitionToken = v9;
    -[SBHomeScreenIconTransitionAnimator currentSettings](self, "currentSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSettings:", v10);
    v11 = -[SBHomeScreenIconTransitionAnimator currentOperation](self, "currentOperation");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__SBHomeScreenIconTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
    aBlock[3] = &unk_1E8D8D510;
    v17 = v9;
    aBlock[4] = self;
    v12 = v6;
    v16 = v12;
    v13 = _Block_copy(aBlock);
    if ((objc_msgSend(v12, "wasPreviousPhaseInteractive") & 1) == 0)
    {
      v14 = 0.0;
      if (!v11)
        v14 = 1.0;
      objc_msgSend(v8, "animateToFraction:afterDelay:withCompletion:", v13, v14, 0.0);
    }

  }
  else
  {
    objc_msgSend(v6, "completeTransition:", 0);
  }

}

uint64_t __91__SBHomeScreenIconTransitionAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    return objc_msgSend(*(id *)(result + 40), "completeTransition:", 0);
  return result;
}

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "invalidated") & 1) != 0)
  {
    -[SBHomeScreenIconTransitionAnimator cancel](self, "cancel");
  }
  else
  {
    if (self->_needsTransitionTokenIncrementOnNextUpdate)
    {
      self->_needsTransitionTokenIncrementOnNextUpdate = 0;
      ++self->_transitionToken;
    }
    v7 = -[SBHomeScreenIconTransitionAnimator currentOperation](self, "currentOperation");
    if (!self->_receivedFirstInteractiveUpdate)
    {
      self->_receivedFirstInteractiveUpdate = 1;
      objc_storeStrong((id *)&self->_transitionContext, a3);
      if ((objc_msgSend(v11, "transitionWasRestarted") & 1) == 0)
      {
        -[SBHomeScreenIconTransitionAnimator currentSettings](self, "currentSettings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setSettings:", v8);

        objc_msgSend(v6, "prepare");
        v9 = 1.0;
        if (!v7)
          v9 = 0.0;
        objc_msgSend(v6, "setFraction:", v9);
      }
    }
    if (v7)
    {
      objc_msgSend(v6, "backgroundDarkeningView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 1.0);

    }
  }

}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = a3;
  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "invalidated") & 1) != 0)
  {
    -[SBHomeScreenIconTransitionAnimator cancel](self, "cancel");
  }
  else
  {
    v8 = self->_transitionToken + 1;
    self->_transitionToken = v8;
    -[SBHomeScreenIconTransitionAnimator currentSettings](self, "currentSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSettings:", v9);

    if (-[SBHomeScreenIconTransitionAnimator operation](self, "operation"))
      v10 = 0.0;
    else
      v10 = 1.0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __102__SBHomeScreenIconTransitionAnimator_finishInteractiveTransition_withCompletionSpeed_completionCurve___block_invoke;
    v11[3] = &unk_1E8D8D510;
    v13 = v8;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v7, "animateToFraction:afterDelay:withCompletion:", v11, v10, 0.0);

  }
}

uint64_t __102__SBHomeScreenIconTransitionAnimator_finishInteractiveTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    return objc_msgSend(*(id *)(result + 40), "completeTransition:", 1);
  return result;
}

- (double)percentComplete
{
  void *v2;
  double v3;
  double v4;

  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fraction");
  v4 = v3;

  return v4;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (void)animationEnded:(BOOL)a3
{
  SBViewControllerContextTransitioning *transitionContext;
  id v5;

  -[SBHomeScreenIconTransitionAnimator iconAnimator](self, "iconAnimator", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);
  objc_msgSend(v5, "cleanup");
  transitionContext = self->_transitionContext;
  self->_transitionContext = 0;

}

- (void)iconAnimatorWasInvalidated:(id)a3
{
  ++self->_transitionToken;
  if (-[SBHomeScreenIconTransitionAnimator isCancelled](self, "isCancelled", a3))
    -[SBViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", 0);
  else
    -[SBHomeScreenIconTransitionAnimator cancel](self, "cancel");
}

- (BOOL)iconAnimator:(id)a3 canAlterViewHierarchyDuringCleanupUsingBlock:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBHomeScreenIconTransitionAnimator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "animator:canAlterViewHierarchyDuringCleanupUsingBlock:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (SBHIconAnimationSettings)currentSettings
{
  unint64_t currentOperation;
  SBHIconAnimationSettings *currentSettings;
  SBHIconAnimationSettings *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  SBHIconAnimationSettings *v9;
  SBHIconAnimationSettings *v10;

  currentOperation = self->_currentOperation;
  if (currentOperation != -[SBHomeScreenIconTransitionAnimator currentOperation](self, "currentOperation"))
  {
    currentSettings = self->_currentSettings;
    self->_currentSettings = 0;

  }
  v5 = self->_currentSettings;
  if (!v5)
  {
    -[SBHomeScreenIconTransitionAnimator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[SBHomeScreenIconTransitionAnimator currentOperation](self, "currentOperation");
      self->_currentOperation = v7;
      -[SBHomeScreenIconTransitionAnimator childViewController](self, "childViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "animator:animationSettingsForOperation:childViewController:", self, v7, v8);
      v9 = (SBHIconAnimationSettings *)objc_claimAutoreleasedReturnValue();
      v10 = self->_currentSettings;
      self->_currentSettings = v9;

    }
    v5 = self->_currentSettings;
  }
  return v5;
}

- (SBIconAnimator)iconAnimator
{
  return self->_iconAnimator;
}

- (SBNestingViewController)childViewController
{
  return self->_childViewController;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (SBHomeScreenIconTransitionAnimatorDelegate)delegate
{
  return (SBHomeScreenIconTransitionAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_currentSettings, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
