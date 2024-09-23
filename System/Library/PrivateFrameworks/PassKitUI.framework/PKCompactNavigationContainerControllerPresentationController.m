@implementation PKCompactNavigationContainerControllerPresentationController

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerControllerPresentationController;
  -[PKCompactNavigationContainerControllerPresentationController containerViewWillLayoutSubviews](&v4, sel_containerViewWillLayoutSubviews);
  -[PKCompactNavigationContainerControllerPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompactNavigationContainerControllerPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  objc_msgSend(v3, "setFrame:");

}

@end
