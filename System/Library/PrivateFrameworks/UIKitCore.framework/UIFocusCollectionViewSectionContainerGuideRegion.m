@implementation UIFocusCollectionViewSectionContainerGuideRegion

void __114___UIFocusCollectionViewSectionContainerGuideRegion__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8.receiver = *(id *)(a1 + 56);
  v8.super_class = (Class)_UIFocusCollectionViewSectionContainerGuideRegion;
  objc_msgSendSuper2(&v8, sel__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot_, v2, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
