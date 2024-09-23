@implementation NCRevealAdditionalContentOnPresentationTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return objc_alloc_init(NCRevealAdditionalContentOnPresentationTransitionAnimator);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return objc_alloc_init(NCRevealAdditionalContentOnPresentationTransitionAnimator);
}

@end
