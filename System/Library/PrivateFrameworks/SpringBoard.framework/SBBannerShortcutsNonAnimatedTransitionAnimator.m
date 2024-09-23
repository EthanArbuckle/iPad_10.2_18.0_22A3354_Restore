@implementation SBBannerShortcutsNonAnimatedTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)prepareForTransition:(id)a3
{
  id v3;

  objc_msgSend(a3, "transitionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);

}

@end
