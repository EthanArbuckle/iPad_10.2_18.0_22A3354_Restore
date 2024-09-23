@implementation UICollectionViewListSeparatorView

uint64_t __65___UICollectionViewListSeparatorView__setUpEffectViewWithEffect___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[62];
  objc_msgSend(v1, "bounds");
  return objc_msgSend(v2, "setFrame:");
}

@end
