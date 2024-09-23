@implementation SFCollectionViewLayout

- (SFCollectionViewLayout)init
{
  SFCollectionViewLayout *v2;
  SFCollectionViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCollectionViewLayout;
  v2 = -[SFCollectionViewLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SFCollectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v2, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
  return v3;
}

- (CGPoint)firstItemCenterForContainerWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[2];
  CGPoint result;

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollectionViewLayout calculateLayoutValuesForIndexPaths:containerWidth:](self, "calculateLayoutValuesForIndexPaths:containerWidth:", v6, a3);

  -[SFCollectionViewLayout _layoutAttributesForItemAtIndexPath:numberOfItemsInSection:](self, "_layoutAttributesForItemAtIndexPath:numberOfItemsInSection:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)calculateLayoutValuesForIndexPaths:(id)a3 containerWidth:(double)a4
{
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v25 = a3;
  -[SFCollectionViewLayout _evaluatePreferredItemSizeForItemsAtIndexPaths:](self, "_evaluatePreferredItemSizeForItemsAtIndexPaths:");
  v30 = v7;
  v31 = v6;
  v26 = *MEMORY[0x24BEBE158];
  v27 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v28 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v29 = *(double *)(MEMORY[0x24BEBE158] + 24);
  v8 = 15;
  v9 = 3.40282347e38;
  v10 = v7;
  do
  {
    v11 = (double)v8 / 100.0;
    -[SFCollectionViewLayout _evaluateInsetForSectionAtIndex:](self, "_evaluateInsetForSectionAtIndex:", 0);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    *(float *)&v20 = v11;
    -[SFCollectionViewLayout _evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:", v31, v10, v12, v14, v16, v18, a4, v20);
    if (v21 > 0.0)
    {
      v19 = 9.0;
      *(float *)&v22 = (double)v8 / 100.0;
      -[SFCollectionViewLayout _evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:containerWidth:offscreenPeekInFactor:", v31, v10, v13, 9.0, v17, 9.0, a4, v22);
      v15 = 9.0;
    }
    if (v21 <= v9)
    {
      if (v21 >= 8.0)
        v9 = v21;
      else
        v9 = 8.0;
      v28 = v17;
      v29 = v19;
      v26 = v13;
      v27 = v15;
    }
    if (v9 <= 12.0)
      break;
    v23 = v8 >= 0x2E;
    v8 += 5;
  }
  while (!v23);
  v24 = v29 + v27 + (double)(unint64_t)objc_msgSend(v25, "count") * v31;
  v32 = v24 + (double)(unint64_t)(objc_msgSend(v25, "count") - 1) * v9;
  -[SFCollectionViewLayout setEvaluatedHorizontalItemOffset:](self, "setEvaluatedHorizontalItemOffset:", v9);
  -[SFCollectionViewLayout setEvaluatedInset:](self, "setEvaluatedInset:", v26, v27, v28, v29);
  -[SFCollectionViewLayout setEvaluatedItemSize:](self, "setEvaluatedItemSize:", v31, v30);
  -[SFCollectionViewLayout setEvaluatedContentSize:](self, "setEvaluatedContentSize:", v32, v28 + v30 + v26);

}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double Width;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)SFCollectionViewLayout;
  -[SFCollectionViewLayout prepareLayout](&v28, sel_prepareLayout);
  -[SFCollectionViewLayout _indexPathsForItemsInSection:](self, "_indexPathsForItemsInSection:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[SFCollectionViewLayout calculateLayoutValuesForIndexPaths:containerWidth:](self, "calculateLayoutValuesForIndexPaths:containerWidth:", v3, CGRectGetWidth(v31));

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        -[SFCollectionViewLayout _layoutAttributesForItemAtIndexPath:numberOfItemsInSection:](self, "_layoutAttributesForItemAtIndexPath:numberOfItemsInSection:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), objc_msgSend(v6, "count", (_QWORD)v24));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  -[SFCollectionViewLayout setPreparedLayoutAttributes:](self, "setPreparedLayoutAttributes:", v5);
  if (-[SFCollectionViewLayout shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
  {
    -[SFCollectionViewLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    Width = CGRectGetWidth(v32);
    -[SFCollectionViewLayout evaluatedContentSize](self, "evaluatedContentSize");
    v15 = Width - v14;

    if (v15 < 0.0)
      v15 = 0.0;
    -[SFCollectionViewLayout collectionView](self, "collectionView", (_QWORD)v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentInset");
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[SFCollectionViewLayout collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentInset:", v18, v15, v20, v22);

  }
}

- (BOOL)shouldReverseLayoutDirection
{
  void *v3;
  int v4;

  -[SFCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_shouldReverseLayoutDirection"))
    v4 = -[SFCollectionViewLayout _wantsRightToLeftHorizontalMirroringIfNeeded](self, "_wantsRightToLeftHorizontalMirroringIfNeeded") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double Width;
  double v5;

  Width = CGRectGetWidth(a3);
  -[SFCollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
  return Width != v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollectionViewLayout preparedLayoutAttributes](self, "preparedLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SFCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v12[3] = &unk_24CE0F408;
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  return v10;
}

void __60__SFCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGRect v4;

  v3 = a2;
  objc_msgSend(v3, "frame");
  if (CGRectIntersectsRect(v4, *(CGRect *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[SFCollectionViewLayout preparedLayoutAttributes](self, "preparedLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  CGAffineTransform v15;
  CGAffineTransform v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFCollectionViewLayout;
  -[SFCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v21, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SFCollectionViewLayout preparedUpdateItems](self, "preparedUpdateItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v11, "updateAction"))
        {
          objc_msgSend(v11, "indexPathAfterUpdate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if (v13)
          {
            objc_msgSend(v5, "setAlpha:", 0.0);
            CGAffineTransformMakeScale(&v16, 0.1, 0.1);
            v15 = v16;
            objc_msgSend(v5, "setTransform:", &v15);

            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "setAlpha:", 1.0);
LABEL_12:

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  CGAffineTransform v15;
  CGAffineTransform v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFCollectionViewLayout;
  -[SFCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v21, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SFCollectionViewLayout preparedUpdateItems](self, "preparedUpdateItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "updateAction") == 1)
        {
          objc_msgSend(v11, "indexPathBeforeUpdate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if (v13)
          {
            objc_msgSend(v5, "setAlpha:", 0.0);
            CGAffineTransformMakeScale(&v16, 0.1, 0.1);
            v15 = v16;
            objc_msgSend(v5, "setTransform:", &v15);

            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "setAlpha:", 1.0);
LABEL_12:

  return v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCollectionViewLayout;
  v4 = a3;
  -[SFCollectionViewLayout prepareForCollectionViewUpdates:](&v5, sel_prepareForCollectionViewUpdates_, v4);
  -[SFCollectionViewLayout setPreparedUpdateItems:](self, "setPreparedUpdateItems:", v4, v5.receiver, v5.super_class);

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  -[SFCollectionViewLayout setPreparedUpdateItems:](self, "setPreparedUpdateItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SFCollectionViewLayout;
  -[SFCollectionViewLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
}

- (CGSize)_evaluatePreferredItemSizeForItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SFCollectionViewLayout *v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  const char *v21;
  __int128 v22;
  CGSize result;

  v4 = a3;
  -[SFCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SFCollectionViewLayout fallbackDelegate](self, "fallbackDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v21 = "";
  v22 = *MEMORY[0x24BDBF148];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__SFCollectionViewLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke;
  v13[3] = &unk_24CE0F430;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  v16 = self;
  v17 = &v18;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v9 = v19[4];
  v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

uint64_t __73__SFCollectionViewLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
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

- (UIEdgeInsets)_evaluateInsetForSectionAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 2.0;
  v5 = 0.0;
  v6 = 2.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_indexPathsForItemsInSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;

  -[SFCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfSections") <= a3)
  {
    v6 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

      }
    }
  }

  return v6;
}

- (double)_evaluateHorizontalItemOffsetForItemSize:(CGSize)a3 inset:(UIEdgeInsets)a4 containerWidth:(double)a5 offscreenPeekInFactor:(float)a6
{
  double v6;
  unint64_t v7;

  v6 = a5 - a3.width * a6 - a4.left;
  v7 = vcvtmd_u64_f64(v6 / a3.width);
  if (v7)
    return floor((v6 - (double)v7 * a3.width) / (double)v7);
  else
    return 0.0;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = (void *)MEMORY[0x24BEBD4A0];
  v7 = a3;
  objc_msgSend(v6, "layoutAttributesForCellWithIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "item");

  if (-[SFCollectionViewLayout shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
    v10 = ~v9 + a4;
  else
    v10 = v9;
  -[SFCollectionViewLayout evaluatedItemSize](self, "evaluatedItemSize");
  v12 = v11;
  v14 = v13;
  -[SFCollectionViewLayout evaluatedHorizontalItemOffset](self, "evaluatedHorizontalItemOffset");
  v16 = v12 * 0.5 + v12 * (double)v10 + v15 * (double)v10;
  -[SFCollectionViewLayout evaluatedInset](self, "evaluatedInset");
  v18 = v17 + v16;
  -[SFCollectionViewLayout evaluatedInset](self, "evaluatedInset");
  v20 = v14 * 0.5 + v19;
  objc_msgSend(v8, "setSize:", v12, v14);
  objc_msgSend(v8, "setCenter:", v18, v20);
  return v8;
}

- (void)invalidateGroupViewLayoutAnimated:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (a3)
  {
    -[SFCollectionViewLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __60__SFCollectionViewLayout_invalidateGroupViewLayoutAnimated___block_invoke;
    v5[3] = &unk_24CE0ED80;
    v5[4] = self;
    objc_msgSend(v4, "performBatchUpdates:completion:", v5, 0);

  }
  else
  {
    -[SFCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

uint64_t __60__SFCollectionViewLayout_invalidateGroupViewLayoutAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayout");
}

- (SFCollectionViewDelegateLayout)fallbackDelegate
{
  return (SFCollectionViewDelegateLayout *)objc_loadWeakRetained((id *)&self->_fallbackDelegate);
}

- (void)setFallbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_fallbackDelegate, a3);
}

- (UIEdgeInsets)evaluatedInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_evaluatedInset.top;
  left = self->_evaluatedInset.left;
  bottom = self->_evaluatedInset.bottom;
  right = self->_evaluatedInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEvaluatedInset:(UIEdgeInsets)a3
{
  self->_evaluatedInset = a3;
}

- (CGSize)evaluatedItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_evaluatedItemSize.width;
  height = self->_evaluatedItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEvaluatedItemSize:(CGSize)a3
{
  self->_evaluatedItemSize = a3;
}

- (CGSize)evaluatedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_evaluatedContentSize.width;
  height = self->_evaluatedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEvaluatedContentSize:(CGSize)a3
{
  self->_evaluatedContentSize = a3;
}

- (double)evaluatedHorizontalItemOffset
{
  return self->_evaluatedHorizontalItemOffset;
}

- (void)setEvaluatedHorizontalItemOffset:(double)a3
{
  self->_evaluatedHorizontalItemOffset = a3;
}

- (NSArray)preparedLayoutAttributes
{
  return self->_preparedLayoutAttributes;
}

- (void)setPreparedLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)preparedUpdateItems
{
  return self->_preparedUpdateItems;
}

- (void)setPreparedUpdateItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedUpdateItems, 0);
  objc_storeStrong((id *)&self->_preparedLayoutAttributes, 0);
  objc_destroyWeak((id *)&self->_fallbackDelegate);
}

@end
