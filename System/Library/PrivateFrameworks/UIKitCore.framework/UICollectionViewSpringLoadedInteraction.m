@implementation UICollectionViewSpringLoadedInteraction

void __81___UICollectionViewSpringLoadedInteraction_collectionViewSpringLoadedInteraction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a2, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideTargetItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_unhighlightSpringLoadedItem");
  objc_msgSend(v6, "_springLoadedInteractionSelectItemAtIndexPath:", v5);

}

@end
