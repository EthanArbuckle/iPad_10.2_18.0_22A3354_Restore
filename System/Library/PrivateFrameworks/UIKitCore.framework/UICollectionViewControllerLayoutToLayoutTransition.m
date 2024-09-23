@implementation UICollectionViewControllerLayoutToLayoutTransition

uint64_t __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v2);
  return v2;
}

void __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke_2(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "toLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCollectionViewLayout:animated:isInteractive:completion:", v2, objc_msgSend(a1[6], "isAnimated"), objc_msgSend(a1[6], "isInteractive"), 0);

}

@end
