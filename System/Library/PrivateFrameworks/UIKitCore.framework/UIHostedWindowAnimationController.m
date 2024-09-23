@implementation UIHostedWindowAnimationController

uint64_t __56___UIHostedWindowAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "transitionActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "transitionActions");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
  return objc_msgSend(*(id *)(a1 + 48), "__runAlongsideAnimations");
}

uint64_t __56___UIHostedWindowAnimationController_animateTransition___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "setTransitionActions:", 0);
  objc_msgSend(a1[5], "completeTransition:", 1);
  objc_msgSend(a1[5], "_setAnimator:", 0);
  return objc_msgSend(a1[6], "_setAnimationController:", 0);
}

@end
