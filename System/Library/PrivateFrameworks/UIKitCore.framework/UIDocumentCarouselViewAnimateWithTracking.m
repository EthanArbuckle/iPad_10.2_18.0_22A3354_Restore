@implementation UIDocumentCarouselViewAnimateWithTracking

void ___UIDocumentCarouselViewAnimateWithTracking_block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    +[UIView _trackVelocity:](UIView, "_trackVelocity:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.55);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setInertialTargetSmoothing:", 0.0);
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

@end
