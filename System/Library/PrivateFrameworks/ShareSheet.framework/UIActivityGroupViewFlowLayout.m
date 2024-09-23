@implementation UIActivityGroupViewFlowLayout

void __68___UIActivityGroupViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  CGRect v5;

  v4 = a2;
  objc_msgSend(v4, "frame");
  if (CGRectIntersectsRect(v5, *(CGRect *)(a1 + 48)))
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "adjustLayoutAttributesForDraggingIfNeeded:", v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

uint64_t __81___UIActivityGroupViewFlowLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:preferredSizeForItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(double *)(v6 + 40) >= v5)
    v5 = *(double *)(v6 + 40);
  *(double *)(v6 + 40) = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(double *)(v7 + 32) >= v4)
    v4 = *(double *)(v7 + 32);
  *(double *)(v7 + 32) = v4;
  return result;
}

uint64_t __55___UIActivityGroupViewFlowLayout_handleEditingGesture___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveItemAtIndexPath:toIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "setIndexPathForDraggedItem:", *(_QWORD *)(a1 + 48));
}

uint64_t __68___UIActivityGroupViewFlowLayout_invalidateGroupViewLayoutAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayout");
}

uint64_t __58___UIActivityGroupViewFlowLayout_beginDraggingForGesture___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.25, 1.25);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.75);
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

void __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v3;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v9);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "indexPathForDraggedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutAttributesForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  objc_msgSend(v8, "convertPoint:toView:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIndexPathForDraggedItem:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidateGroupViewLayoutAnimated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

@end
