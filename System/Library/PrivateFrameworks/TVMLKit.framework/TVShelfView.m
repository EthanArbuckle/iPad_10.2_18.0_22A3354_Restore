@implementation TVShelfView

uint64_t __69___TVShelfView__updateLayoutForFocusedView_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "frame");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3);
}

@end
