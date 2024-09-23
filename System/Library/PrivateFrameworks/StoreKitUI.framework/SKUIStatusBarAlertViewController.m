@implementation SKUIStatusBarAlertViewController

uint64_t __88___SKUIStatusBarAlertViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateLabelFrame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setHidden:", 0);
}

@end
