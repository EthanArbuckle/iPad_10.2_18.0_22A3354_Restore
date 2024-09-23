@implementation UICollectionViewSpringLoadedEffect

void __72___UICollectionViewSpringLoadedEffect_interaction_didChangeWithContext___block_invoke(uint64_t a1)
{
  int v2;
  id WeakRetained;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v2)
    objc_msgSend(WeakRetained, "_unhighlightSpringLoadedItem");
  else
    objc_msgSend(WeakRetained, "_highlightSpringLoadedItemAtIndexPath:", *(_QWORD *)(a1 + 40));

}

@end
