@implementation NCRevealAdditionalContentOnPresentationTransitionAnimator

- (void)animateTransition:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "__runAlongsideAnimations");
  objc_msgSend(v3, "completeTransition:", 1);

}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end
