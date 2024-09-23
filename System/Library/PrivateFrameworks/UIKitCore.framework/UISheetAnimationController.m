@implementation UISheetAnimationController

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutTransitionViews");
  objc_msgSend(*(id *)(a1 + 32), "forwardView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (!v2)
}

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  CAFrameRateRange v10;

  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v10.minimum;
  maximum = v10.maximum;
  preferred = v10.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4;
  v8[3] = &unk_1E16B3F40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048611, v8, v5, v6, v7);
  objc_destroyWeak(&v9);
}

void __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutTransitionViews");
  objc_msgSend(WeakRetained, "runNoninteractiveAnimationsIfPossible");
  objc_msgSend(WeakRetained, "forwardView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

@end
