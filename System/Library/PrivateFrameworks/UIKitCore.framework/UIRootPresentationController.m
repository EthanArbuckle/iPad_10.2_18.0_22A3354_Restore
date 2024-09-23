@implementation UIRootPresentationController

void __91___UIRootPresentationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsStatusBarAppearanceUpdate");

}

@end
