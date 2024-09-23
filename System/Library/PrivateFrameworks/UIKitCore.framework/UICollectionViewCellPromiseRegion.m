@implementation UICollectionViewCellPromiseRegion

_UIFocusRegionContainerProxy *__57___UICollectionViewCellPromiseRegion_createPromiseRegion__block_invoke(uint64_t a1)
{
  void *v1;
  _UIFocusRegionContainerProxy *v2;

  objc_msgSend(*(id *)(a1 + 32), "_fulfillPromisedFocusRegion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[_UIFocusRegionContainerProxy initWithOwningEnvironment:itemContainer:]([_UIFocusRegionContainerProxy alloc], "initWithOwningEnvironment:itemContainer:", v1, v1);

  return v2;
}

@end
