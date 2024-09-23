@implementation SBFramewiseInteractiveTransitionAnimator

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  SBFramewiseInteractiveTransitionAnimatorDelegate **p_delegate;
  id v6;
  id WeakRetained;

  self->_percentComplete = a4;
  p_delegate = &self->_delegate;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "transitionContext:updateTransitionProgress:", v6, a4);

}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "completeTransition:", objc_msgSend(v5, "transitionWasCancelled") ^ 1);

}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "completeTransition:", objc_msgSend(v5, "transitionWasCancelled") ^ 1);

}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isAnimated"))
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    -[SBFramewiseInteractiveTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
    v7 = v6;
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke;
    v11[3] = &unk_1E8D84EF0;
    v11[4] = self;
    v12 = v4;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke_2;
    v9[3] = &unk_1E8D84F68;
    v10 = v12;
    objc_msgSend(v5, "animateWithDuration:animations:completion:", v11, v9, v7);

  }
  else
  {
    objc_msgSend(v4, "completeTransition:", objc_msgSend(v4, "transitionWasCancelled") ^ 1);
  }

}

uint64_t __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTransition:withPercentComplete:", *(_QWORD *)(a1 + 40), 1.0);
}

uint64_t __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isTransitioning");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  return result;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (double)percentVisible
{
  _BOOL4 presenting;
  double result;

  presenting = self->_presenting;
  -[SBFramewiseInteractiveTransitionAnimator percentComplete](self, "percentComplete");
  if (!presenting)
    return 1.0 - result;
  return result;
}

- (SBFramewiseInteractiveTransitionAnimatorDelegate)delegate
{
  return (SBFramewiseInteractiveTransitionAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
