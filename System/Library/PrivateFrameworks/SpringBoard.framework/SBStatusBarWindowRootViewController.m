@implementation SBStatusBarWindowRootViewController

uint64_t __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_statusBarWillAnimateRotation");
  objc_msgSend(*(id *)(a1 + 40), "_setStatusBarWindowOrientation:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setOrientation:", *(_QWORD *)(a1 + 48));
}

uint64_t __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_statusBarDidAnimateRotation");
}

@end
