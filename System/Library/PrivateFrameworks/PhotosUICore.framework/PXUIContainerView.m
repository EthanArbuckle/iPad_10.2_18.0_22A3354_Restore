@implementation PXUIContainerView

uint64_t __37___PXUIContainerView_didMoveToWindow__block_invoke(uint64_t a1)
{
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "deferredAppearingAnimation");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  return objc_msgSend(*(id *)(a1 + 32), "setDeferredAppearingAnimation:", 0);
}

@end
