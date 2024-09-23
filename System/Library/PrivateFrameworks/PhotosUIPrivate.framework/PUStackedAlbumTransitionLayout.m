@implementation PUStackedAlbumTransitionLayout

- (PUStackedAlbumTransitionLayout)initWithCurrentLayout:(id)a3 nextLayout:(id)a4 isExpanding:(BOOL)a5
{
  id v8;
  id v9;
  PUStackedAlbumTransitionLayout *v10;
  PUCollectionViewLayoutCache *v11;
  PUCollectionViewLayoutCache *currentLayoutCache;
  PUCollectionViewLayoutCache *v13;
  PUCollectionViewLayoutCache *nextLayoutCache;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUStackedAlbumTransitionLayout;
  v10 = -[UICollectionViewTransitionLayout initWithCurrentLayout:nextLayout:](&v16, sel_initWithCurrentLayout_nextLayout_, v8, v9);
  if (v10)
  {
    v11 = -[PUCollectionViewLayoutCache initWithProvider:]([PUCollectionViewLayoutCache alloc], "initWithProvider:", v8);
    currentLayoutCache = v10->_currentLayoutCache;
    v10->_currentLayoutCache = v11;

    v13 = -[PUCollectionViewLayoutCache initWithProvider:]([PUCollectionViewLayoutCache alloc], "initWithProvider:", v9);
    nextLayoutCache = v10->_nextLayoutCache;
    v10->_nextLayoutCache = v13;

    v10->_isExpanding = a5;
  }

  return v10;
}

- (CGPoint)_newCenterForLayoutAttributes:(id)a3 transitionProgress:(double)a4
{
  id v6;
  void *v7;
  PUCollectionViewLayoutCache *v8;
  PUCollectionViewLayoutCache *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGPoint result;

  v6 = a3;
  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_currentLayoutCache;
  v9 = self->_nextLayoutCache;
  v10 = objc_msgSend(v6, "representedElementCategory");
  if (v10 == 2)
  {
    objc_msgSend(v6, "representedElementKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCollectionViewLayoutCache layoutAttributesForDecorationViewOfKind:atIndexPath:](v8, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v13, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "representedElementKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCollectionViewLayoutCache layoutAttributesForDecorationViewOfKind:atIndexPath:](v9, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v14, v7);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10 != 1)
    {
      if (v10)
      {
        v12 = 0;
        v11 = 0;
      }
      else
      {
        -[PUCollectionViewLayoutCache layoutAttributesForItemAtIndexPath:](v8, "layoutAttributesForItemAtIndexPath:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCollectionViewLayoutCache layoutAttributesForItemAtIndexPath:](v9, "layoutAttributesForItemAtIndexPath:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_9;
    }
    objc_msgSend(v6, "representedElementKind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCollectionViewLayoutCache layoutAttributesForSupplementaryViewOfKind:atIndexPath:](v8, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v16, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "representedElementKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCollectionViewLayoutCache layoutAttributesForSupplementaryViewOfKind:atIndexPath:](v9, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v14, v7);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v15;

LABEL_9:
  objc_msgSend(v11, "center");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "center");
  v22 = v21;
  v24 = v23;
  v25 = -[PUStackedAlbumTransitionLayout isExpanding](self, "isExpanding");
  if (v25)
  {
    v26 = v22 - self->_expandedStackDelta.x;
    v27 = v24 - self->_expandedStackDelta.y;
    -[PUStackedAlbumTransitionLayout collectionView](self, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentInset");
    v30 = v27 - v29;

  }
  else
  {
    -[PUStackedAlbumTransitionLayout currentCollapsedStackCenter](self, "currentCollapsedStackCenter");
    v32 = v31;
    v34 = v33;
    -[PUStackedAlbumTransitionLayout finalCollapsedStackCenter](self, "finalCollapsedStackCenter");
    v26 = v22 + v32 - v35;
    v30 = v24 + v34 - v36;
  }
  v37 = v26 * a4 + (1.0 - a4) * v18;
  v38 = v30 * a4 + (1.0 - a4) * v20;
  if (v25)
  {
    v37 = v37 + self->_interactionOffset.x;
    v38 = v38 + self->_interactionOffset.y;
  }

  v39 = v37;
  v40 = v38;
  result.y = v40;
  result.x = v39;
  return result;
}

- (CGPoint)_centerOfLayoutAttributes:(id)a3
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL IsNull;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGPoint result;
  CGRect v36;
  CGRect v37;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
          v36.origin.x = v4;
          v36.origin.y = v5;
          v36.size.width = v6;
          v36.size.height = v7;
          IsNull = CGRectIsNull(v36);
          objc_msgSend(v13, "frame", (_QWORD)v29);
          v19 = v15;
          v20 = v16;
          v21 = v17;
          v22 = v18;
          if (!IsNull)
          {
            v37.origin.x = v4;
            v37.origin.y = v5;
            v37.size.width = v6;
            v37.size.height = v7;
            *(CGRect *)&v15 = CGRectUnion(v37, *(CGRect *)&v19);
          }
          v4 = v15;
          v5 = v16;
          v6 = v17;
          v7 = v18;
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v10);
    }

    UIRectGetCenter();
    v24 = v23;
    v26 = v25;
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D538];
    v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v27 = v24;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)prepareLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGPoint *p_expandedStackFinalDelta;
  CGFloat v32;
  CGFloat MidY;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  v41.receiver = self;
  v41.super_class = (Class)PUStackedAlbumTransitionLayout;
  -[UICollectionViewTransitionLayout prepareLayout](&v41, sel_prepareLayout);
  if (!self->_didPrepareLayout)
  {
    self->_didPrepareLayout = 1;
    -[UICollectionViewTransitionLayout _oldVisibleBounds](self, "_oldVisibleBounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UICollectionViewTransitionLayout _newVisibleBounds](self, "_newVisibleBounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v38 = v4;
    v34 = v11;
    v36 = v13;
    if (-[PUStackedAlbumTransitionLayout isExpanding](self, "isExpanding"))
    {
      -[UICollectionViewTransitionLayout nextLayout](self, "nextLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v12;
    }
    else
    {
      -[UICollectionViewTransitionLayout currentLayout](self, "currentLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v6;
      v16 = v8;
      v18 = v10;
    }
    -[PUStackedAlbumTransitionLayout initialCollapsedStackCenter](self, "initialCollapsedStackCenter", *(_QWORD *)&v34, *(_QWORD *)&v36, *(_QWORD *)&v38, *(_QWORD *)&v6);
    v21 = v20;
    v23 = v22;
    objc_msgSend(v19, "layoutAttributesForElementsInRect:", v4, v14, v16, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUStackedAlbumTransitionLayout _centerOfLayoutAttributes:](self, "_centerOfLayoutAttributes:", v24);
    v26 = v25;
    v28 = v27;
    if (-[PUStackedAlbumTransitionLayout isExpanding](self, "isExpanding"))
    {
      v29 = v26 - (v26 - v35 - (v21 - v39));
      v30 = v28 - (v28 - v37 - (v23 - v40));
    }
    else
    {
      v29 = v26;
      v30 = v28;
    }
    self->_expandedStackDelta.x = v26 - v29;
    self->_expandedStackDelta.y = v28 - v30;
    p_expandedStackFinalDelta = &self->_expandedStackFinalDelta;
    v42.origin.x = v4;
    v42.origin.y = v14;
    v42.size.width = v16;
    v42.size.height = v18;
    v32 = v26 - CGRectGetMidX(v42);
    v43.origin.x = v4;
    v43.origin.y = v14;
    v43.size.width = v16;
    v43.size.height = v18;
    MidY = CGRectGetMidY(v43);
    p_expandedStackFinalDelta->x = v32;
    p_expandedStackFinalDelta->y = v28 - MidY;

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewTransitionLayout transitionProgress](self, "transitionProgress");
  v9 = v8;
  v23.receiver = self;
  v23.super_class = (Class)PUStackedAlbumTransitionLayout;
  -[UICollectionViewTransitionLayout layoutAttributesForElementsInRect:](&v23, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "representedElementKind");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PUGridGlobalHeader"));

        if ((v17 & 1) == 0)
        {
          -[PUStackedAlbumTransitionLayout _newCenterForLayoutAttributes:transitionProgress:](self, "_newCenterForLayoutAttributes:transitionProgress:", v15, v9);
          objc_msgSend(v15, "setCenter:");
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v12);
  }
  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUStackedAlbumTransitionLayout;
  -[UICollectionViewTransitionLayout layoutAttributesForItemAtIndexPath:](&v6, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UICollectionViewTransitionLayout transitionProgress](self, "transitionProgress");
    -[PUStackedAlbumTransitionLayout _newCenterForLayoutAttributes:transitionProgress:](self, "_newCenterForLayoutAttributes:transitionProgress:", v4);
    objc_msgSend(v4, "setCenter:");
  }
  return v4;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUStackedAlbumTransitionLayout;
  -[UICollectionViewTransitionLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v10, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "representedElementKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PUGridGlobalHeader"));

    if ((v8 & 1) == 0)
    {
      -[UICollectionViewTransitionLayout transitionProgress](self, "transitionProgress");
      -[PUStackedAlbumTransitionLayout _newCenterForLayoutAttributes:transitionProgress:](self, "_newCenterForLayoutAttributes:transitionProgress:", v6);
      objc_msgSend(v6, "setCenter:");
    }
  }
  return v6;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUStackedAlbumTransitionLayout;
  -[UICollectionViewTransitionLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](&v7, sel_layoutAttributesForDecorationViewOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UICollectionViewTransitionLayout transitionProgress](self, "transitionProgress");
    -[PUStackedAlbumTransitionLayout _newCenterForLayoutAttributes:transitionProgress:](self, "_newCenterForLayoutAttributes:transitionProgress:", v5);
    objc_msgSend(v5, "setCenter:");
  }
  return v5;
}

- (BOOL)isExpanding
{
  return self->_isExpanding;
}

- (CGPoint)expandedStackFinalDelta
{
  double x;
  double y;
  CGPoint result;

  x = self->_expandedStackFinalDelta.x;
  y = self->_expandedStackFinalDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)interactionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_interactionOffset.x;
  y = self->_interactionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInteractionOffset:(CGPoint)a3
{
  self->_interactionOffset = a3;
}

- (CGPoint)initialCollapsedStackCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialCollapsedStackCenter.x;
  y = self->_initialCollapsedStackCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCollapsedStackCenter:(CGPoint)a3
{
  self->_initialCollapsedStackCenter = a3;
}

- (CGPoint)finalCollapsedStackCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_finalCollapsedStackCenter.x;
  y = self->_finalCollapsedStackCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFinalCollapsedStackCenter:(CGPoint)a3
{
  self->_finalCollapsedStackCenter = a3;
}

- (CGPoint)currentCollapsedStackCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentCollapsedStackCenter.x;
  y = self->_currentCollapsedStackCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentCollapsedStackCenter:(CGPoint)a3
{
  self->_currentCollapsedStackCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextLayoutCache, 0);
  objc_storeStrong((id *)&self->_currentLayoutCache, 0);
}

@end
