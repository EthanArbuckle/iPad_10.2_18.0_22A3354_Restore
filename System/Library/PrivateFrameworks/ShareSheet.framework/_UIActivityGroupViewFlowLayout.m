@implementation _UIActivityGroupViewFlowLayout

- (void)setEditingGestureRecognizer:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[_UIActivityGroupViewFlowLayout editingGestureRecognizer](self, "editingGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[UILongPressGestureRecognizer removeTarget:action:](self->_editingGestureRecognizer, "removeTarget:action:", self, 0);
    objc_storeStrong((id *)&self->_editingGestureRecognizer, a3);
    -[UILongPressGestureRecognizer addTarget:action:](self->_editingGestureRecognizer, "addTarget:action:", self, sel_handleEditingGesture_);
  }

}

- (id)indexPathForItemRecognizedByGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[_UIActivityGroupViewFlowLayout evaluatedInset](self, "evaluatedInset");
  v20 = v12 + v19;
  v22 = v14 + v21;
  v24 = v16 - (v19 + v23);
  v26 = v18 - (v21 + v25);

  v42.origin.x = v20;
  v42.origin.y = v22;
  v42.size.width = v24;
  v42.size.height = v26;
  v27 = CGRectGetWidth(v42) * 0.5;
  if (v27 <= 0.5)
    v28 = v27;
  else
    v28 = 0.5;
  v43.origin.x = v20;
  v43.origin.y = v22;
  v43.size.width = v24;
  v43.size.height = v26;
  v29 = CGRectGetHeight(v43) * 0.5;
  if (v29 <= 0.5)
    v30 = v29;
  else
    v30 = 0.5;
  v44.origin.x = v20;
  v44.origin.y = v22;
  v44.size.width = v24;
  v44.size.height = v26;
  v45 = CGRectInset(v44, v28, v30);
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;
  v35 = fmax(v7, CGRectGetMinX(v45));
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v36 = fmin(v35, CGRectGetMaxX(v46));
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v37 = fmax(v9, CGRectGetMinY(v47));
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  -[_UIActivityGroupViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v36 + -0.5, fmin(v37, CGRectGetMaxY(v48)) + -0.5, 1.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "indexPath");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  float v10;
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
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;

  v60 = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)_UIActivityGroupViewFlowLayout;
  -[_UIActivityGroupViewFlowLayout prepareLayout](&v58, sel_prepareLayout);
  -[_UIActivityGroupViewFlowLayout _indexPathsForItemsInSection:](self, "_indexPathsForItemsInSection:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupViewFlowLayout _evaluatePreferredItemSizeForItemsAtIndexPaths:](self, "_evaluatePreferredItemSizeForItemsAtIndexPaths:", v3);
  v5 = v4;
  v7 = v6;
  v50 = *MEMORY[0x1E0DC49E8];
  v52 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v48 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v53 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v8 = 15;
  v9 = 3.40282347e38;
  do
  {
    v10 = (double)v8 / 100.0;
    -[_UIActivityGroupViewFlowLayout _evaluateInsetForSectionAtIndex:](self, "_evaluateInsetForSectionAtIndex:", 0, *(_QWORD *)&v48);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    *(float *)&v19 = v10;
    -[_UIActivityGroupViewFlowLayout _evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:", v5, v7, v11, v13, v15, v17, v19);
    if (v20 > 0.0)
    {
      v18 = 9.0;
      *(float *)&v21 = (double)v8 / 100.0;
      -[_UIActivityGroupViewFlowLayout _evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:", v5, v7, v12, 9.0, v16, 9.0, v21);
      v14 = 9.0;
    }
    if (v20 <= v9)
    {
      if (v20 >= 8.0)
        v9 = v20;
      else
        v9 = 8.0;
      v52 = v14;
      v53 = v18;
      v48 = v16;
      v50 = v12;
    }
    if (v9 <= 12.0)
      break;
    v22 = v8 >= 0x2E;
    v8 += 5;
  }
  while (!v22);
  -[_UIActivityGroupViewFlowLayout externalSafeInset](self, "externalSafeInset", *(_QWORD *)&v48);
  v24 = fmax(v49 - v23, 0.0);
  -[_UIActivityGroupViewFlowLayout externalSafeInset](self, "externalSafeInset");
  v26 = fmax(v50 - v25, 0.0);
  v27 = v53 + v52 + (double)(unint64_t)objc_msgSend(v3, "count") * v5;
  v51 = v27 + (double)(unint64_t)(objc_msgSend(v3, "count") - 1) * v9;
  -[_UIActivityGroupViewFlowLayout externalSafeInset](self, "externalSafeInset");
  v29 = v24;
  v30 = v24 + v26 + v7 + v28;
  -[_UIActivityGroupViewFlowLayout externalSafeInset](self, "externalSafeInset");
  v32 = v31 + v30;
  -[_UIActivityGroupViewFlowLayout setEvaluatedHorizontalItemOffset:](self, "setEvaluatedHorizontalItemOffset:", v9);
  -[_UIActivityGroupViewFlowLayout setEvaluatedInset:](self, "setEvaluatedInset:", v26, v52, v29, v53);
  -[_UIActivityGroupViewFlowLayout setEvaluatedItemSize:](self, "setEvaluatedItemSize:", v5, v7);
  -[_UIActivityGroupViewFlowLayout evaluatedContentSize](self, "evaluatedContentSize");
  v34 = v33;
  v36 = v35;
  -[_UIActivityGroupViewFlowLayout setEvaluatedContentSize:](self, "setEvaluatedContentSize:", v51, v32);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v38 = v3;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v55 != v41)
          objc_enumerationMutation(v38);
        -[_UIActivityGroupViewFlowLayout _layoutAttributesForItemAtIndexPath:numberOfItemsInSection:](self, "_layoutAttributesForItemAtIndexPath:numberOfItemsInSection:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), objc_msgSend(v38, "count"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
          objc_msgSend(v37, "addObject:", v43);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v40);
  }

  -[_UIActivityGroupViewFlowLayout setPreparedLayoutAttributes:](self, "setPreparedLayoutAttributes:", v37);
  if (-[_UIActivityGroupViewFlowLayout shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
  {
    -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "frame");
    CGRectGetWidth(v61);
    objc_msgSend(v44, "contentInset");
    objc_msgSend(v44, "setContentInset:");
    if (v34 != v51 || v36 != v32)
    {
      objc_msgSend(v44, "frame");
      v47 = v51 - v46;
      objc_msgSend(v44, "contentOffset");
      objc_msgSend(v44, "setContentOffset:", v47);
    }

  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  void *v11;
  BOOL v12;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetHeight(a3);
  -[_UIActivityGroupViewFlowLayout collectionViewContentSize](self, "collectionViewContentSize");
  if (v8 != v9)
    return 1;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = CGRectGetWidth(v14);
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = v10 != CGRectGetWidth(v15);

  return v12;
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
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupViewFlowLayout preparedLayoutAttributes](self, "preparedLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68___UIActivityGroupViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
  v14[3] = &unk_1E4003C30;
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_UIActivityGroupViewFlowLayout preparedLayoutAttributes](self, "preparedLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_UIActivityGroupViewFlowLayout adjustLayoutAttributesForDraggingIfNeeded:](self, "adjustLayoutAttributesForDraggingIfNeeded:", v7);
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

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIActivityGroupViewFlowLayout;
  -[_UIActivityGroupViewFlowLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v21, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_UIActivityGroupViewFlowLayout preparedUpdateItems](self, "preparedUpdateItems");
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

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIActivityGroupViewFlowLayout;
  -[_UIActivityGroupViewFlowLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v21, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_UIActivityGroupViewFlowLayout preparedUpdateItems](self, "preparedUpdateItems");
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
  v5.super_class = (Class)_UIActivityGroupViewFlowLayout;
  v4 = a3;
  -[_UIActivityGroupViewFlowLayout prepareForCollectionViewUpdates:](&v5, sel_prepareForCollectionViewUpdates_, v4);
  -[_UIActivityGroupViewFlowLayout setPreparedUpdateItems:](self, "setPreparedUpdateItems:", v4, v5.receiver, v5.super_class);

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  -[_UIActivityGroupViewFlowLayout setPreparedUpdateItems:](self, "setPreparedUpdateItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityGroupViewFlowLayout;
  -[_UIActivityGroupViewFlowLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
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
  _UIActivityGroupViewFlowLayout *v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  const char *v21;
  __int128 v22;
  CGSize result;

  v4 = a3;
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v21 = "";
  v22 = *MEMORY[0x1E0C9D820];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81___UIActivityGroupViewFlowLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke;
  v13[3] = &unk_1E4003C58;
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

- (UIEdgeInsets)_evaluateInsetForSectionAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verticalSizeClass");

  v6 = 7.0;
  if (v5 != 1)
    v6 = 19.0;
  v7 = 14.0;
  if (v5 != 1)
    v7 = 19.0;
  v8 = 2.0;
  v9 = 2.0;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (id)_indexPathsForItemsInSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;

  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfSections") <= a3)
  {
    v6 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

      }
    }
  }

  return v6;
}

- (double)_evaluateHorizontalItemOffsetForItemSize:(CGSize)a3 inset:(UIEdgeInsets)a4 offscreenPeekInFactor:(float)a5
{
  double left;
  double width;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  CGRect v13;

  left = a4.left;
  width = a3.width;
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = CGRectGetWidth(v13);

  v10 = v9 - width * a5 - left;
  v11 = vcvtmd_u64_f64(v10 / width);
  if (v11)
    return floor((v10 - (double)v11 * width) / (double)v11);
  else
    return 0.0;
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

  v6 = (void *)MEMORY[0x1E0DC3628];
  v7 = a3;
  objc_msgSend(v6, "layoutAttributesForCellWithIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "item");

  if (-[_UIActivityGroupViewFlowLayout shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
    v10 = ~v9 + a4;
  else
    v10 = v9;
  -[_UIActivityGroupViewFlowLayout evaluatedItemSize](self, "evaluatedItemSize");
  v12 = v11;
  v14 = v13;
  -[_UIActivityGroupViewFlowLayout evaluatedHorizontalItemOffset](self, "evaluatedHorizontalItemOffset");
  v16 = v12 * 0.5 + v12 * (double)v10 + v15 * (double)v10;
  -[_UIActivityGroupViewFlowLayout evaluatedInset](self, "evaluatedInset");
  v18 = v17 + v16;
  -[_UIActivityGroupViewFlowLayout evaluatedInset](self, "evaluatedInset");
  v20 = v14 * 0.5 + v19;
  objc_msgSend(v8, "setSize:", v12, v14);
  objc_msgSend(v8, "setCenter:", v18, v20);
  return v8;
}

- (id)adjustLayoutAttributesForDraggingIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[_UIActivityGroupViewFlowLayout indexPathForDraggedItem](self, "indexPathForDraggedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    objc_msgSend(v4, "setHidden:", 1);
  return v4;
}

- (void)handleEditingGesture:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v22 = a3;
  if (objc_msgSend(v22, "state") == 1)
  {
    -[_UIActivityGroupViewFlowLayout indexPathForItemRecognizedByGesture:](self, "indexPathForItemRecognizedByGesture:", v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "locationInView:", v5);
      v7 = v6;
      v9 = v8;

      -[_UIActivityGroupViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "center");
      v12 = v11;
      v14 = v13;

      -[_UIActivityGroupViewFlowLayout setDraggingOffset:](self, "setDraggingOffset:", v7 - v12, v9 - v14);
      -[_UIActivityGroupViewFlowLayout setIndexPathForDraggedItem:](self, "setIndexPathForDraggedItem:", v4);
      -[_UIActivityGroupViewFlowLayout beginDraggingForGesture:](self, "beginDraggingForGesture:", v22);
    }
    else
    {
      -[_UIActivityGroupViewFlowLayout setIndexPathForDraggedItem:](self, "setIndexPathForDraggedItem:", 0);
    }

  }
  if (objc_msgSend(v22, "state") == 2)
  {
    -[_UIActivityGroupViewFlowLayout indexPathForItemRecognizedByGesture:](self, "indexPathForItemRecognizedByGesture:", v22);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIActivityGroupViewFlowLayout indexPathForDraggedItem](self, "indexPathForDraggedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqual:", v15) & 1) == 0)
    {
      -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "collectionView:layout:moveItemAtIndexPath:toIndexPath:", v19, self, v16, v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __55___UIActivityGroupViewFlowLayout_handleEditingGesture___block_invoke;
        v23[3] = &unk_1E4001730;
        v23[4] = self;
        v24 = v16;
        v15 = v20;
        v25 = v15;
        objc_msgSend(v21, "performBatchUpdates:completion:", v23, &__block_literal_global_47);

      }
      else
      {
        v15 = 0;
      }
    }
    -[_UIActivityGroupViewFlowLayout updateDraggingViewForGesture:](self, "updateDraggingViewForGesture:", v22);
    if (-[_UIActivityGroupViewFlowLayout shouldCancelDraggingForGesture:](self, "shouldCancelDraggingForGesture:", v22))
      objc_msgSend(v22, "setState:", 4);

  }
  if (objc_msgSend(v22, "state") == 3 || objc_msgSend(v22, "state") == 4)
    -[_UIActivityGroupViewFlowLayout cancelDraggingForGesture:](self, "cancelDraggingForGesture:", v22);

}

- (void)invalidateGroupViewLayoutAnimated:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (a3)
  {
    -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68___UIActivityGroupViewFlowLayout_invalidateGroupViewLayoutAnimated___block_invoke;
    v5[3] = &unk_1E4001608;
    v5[4] = self;
    objc_msgSend(v4, "performBatchUpdates:completion:", v5, 0);

  }
  else
  {
    -[_UIActivityGroupViewFlowLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)shouldReverseLayoutDirection
{
  void *v3;
  int v4;

  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_shouldReverseLayoutDirection"))
    v4 = -[_UIActivityGroupViewFlowLayout _wantsRightToLeftHorizontalMirroringIfNeeded](self, "_wantsRightToLeftHorizontalMirroringIfNeeded") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)draggingViewForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v4 = a3;
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:layout:needsContainerViewForDraggingItemAtIndexPath:", v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "convertRect:toView:", v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "draggingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v8, "addSubview:", v18);

  return v18;
}

- (void)beginDraggingForGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[_UIActivityGroupViewFlowLayout indexPathForDraggedItem](self, "indexPathForDraggedItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupViewFlowLayout draggingViewForItemAtIndexPath:](self, "draggingViewForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupViewFlowLayout setDraggingView:](self, "setDraggingView:", v5);

  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___UIActivityGroupViewFlowLayout_beginDraggingForGesture___block_invoke;
  v8[3] = &unk_1E4001608;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 132, v8, &__block_literal_global_17_1, 0.3, 0.0);
  -[_UIActivityGroupViewFlowLayout invalidateGroupViewLayoutAnimated:](self, "invalidateGroupViewLayoutAnimated:", 0);

}

- (void)updateDraggingViewForGesture:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  -[_UIActivityGroupViewFlowLayout draggingView](self, "draggingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIActivityGroupViewFlowLayout editingGestureRecognizer](self, "editingGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v16);
  v7 = v6;
  v9 = v8;

  -[_UIActivityGroupViewFlowLayout draggingOffset](self, "draggingOffset");
  v11 = v7 - v10;
  -[_UIActivityGroupViewFlowLayout draggingOffset](self, "draggingOffset");
  v13 = v9 - v12;
  -[_UIActivityGroupViewFlowLayout draggingView](self, "draggingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCenter:", v11, v13);

  -[_UIActivityGroupViewFlowLayout draggingView](self, "draggingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaskView:", 0);

}

- (BOOL)shouldCancelDraggingForGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGPoint v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  v26 = CGRectInset(v25, -120.0, -120.0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[_UIActivityGroupViewFlowLayout collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v18);
  v20 = v19;
  v22 = v21;

  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v24.x = v20;
  v24.y = v22;
  return !CGRectContainsPoint(v27, v24);
}

- (void)cancelDraggingForGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  _UIActivityGroupViewFlowLayout *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _UIActivityGroupViewFlowLayout *v16;

  -[_UIActivityGroupViewFlowLayout draggingView](self, "draggingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke;
    v14[3] = &unk_1E4001248;
    v15 = v4;
    v16 = self;
    v8 = v7;
    v9 = 3221225472;
    v10 = __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke_2;
    v11 = &unk_1E4002C78;
    v12 = self;
    v13 = v15;
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 132, v14, &v8, 0.3, 0.0);
    -[_UIActivityGroupViewFlowLayout setDraggingView:](self, "setDraggingView:", 0, v8, v9, v10, v11, v12);

  }
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return -[_UIActivityGroupViewFlowLayout _wantsRightToLeftHorizontalMirroringIfNeeded](self, "_wantsRightToLeftHorizontalMirroringIfNeeded") ^ 1;
}

- (UILongPressGestureRecognizer)editingGestureRecognizer
{
  return self->_editingGestureRecognizer;
}

- (NSIndexPath)indexPathForDraggedItem
{
  return self->_indexPathForDraggedItem;
}

- (void)setIndexPathForDraggedItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (UIEdgeInsets)externalSafeInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_externalSafeInset.top;
  left = self->_externalSafeInset.left;
  bottom = self->_externalSafeInset.bottom;
  right = self->_externalSafeInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExternalSafeInset:(UIEdgeInsets)a3
{
  self->_externalSafeInset = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)preparedUpdateItems
{
  return self->_preparedUpdateItems;
}

- (void)setPreparedUpdateItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (UIOffset)draggingOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_draggingOffset.horizontal;
  vertical = self->_draggingOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setDraggingOffset:(UIOffset)a3
{
  self->_draggingOffset = a3;
}

- (_UIActivityGroupActivityCell)draggingView
{
  return self->_draggingView;
}

- (void)setDraggingView:(id)a3
{
  objc_storeStrong((id *)&self->_draggingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggingView, 0);
  objc_storeStrong((id *)&self->_preparedUpdateItems, 0);
  objc_storeStrong((id *)&self->_preparedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_indexPathForDraggedItem, 0);
  objc_storeStrong((id *)&self->_editingGestureRecognizer, 0);
}

@end
