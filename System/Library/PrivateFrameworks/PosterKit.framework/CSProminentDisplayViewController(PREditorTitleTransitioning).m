@implementation CSProminentDisplayViewController(PREditorTitleTransitioning)

- (PREditorTitleViewControllerCSTransitionWrapper)pr_beginInteractiveTransitionToBaseFont:()PREditorTitleTransitioning vibrancyConfiguration:cachingVibrancyTransitionProvider:
{
  void *v1;
  PREditorTitleViewControllerCSTransitionWrapper *v2;

  objc_msgSend(a1, "beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[PREditorTitleViewControllerCSTransitionWrapper initWithCSTransitioning:]([PREditorTitleViewControllerCSTransitionWrapper alloc], "initWithCSTransitioning:", v1);

  return v2;
}

@end
