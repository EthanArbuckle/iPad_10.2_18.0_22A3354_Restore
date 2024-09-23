@implementation TVNavigationCrossfadeAnimator

uint64_t __52___TVNavigationCrossfadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
