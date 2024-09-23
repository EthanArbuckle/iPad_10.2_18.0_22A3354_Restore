@implementation PUPhotosSharingCollectionViewLayout

- (void)setZoomingCellIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;

  v5 = (NSIndexPath *)a3;
  if (self->_zoomingCellIndexPath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_zoomingCellIndexPath, a3);
    -[PUPhotosSharingCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    v5 = v6;
  }

}

- (void)_floatingBadgeContainerFrameForBadgeContainerFrame:(CGFloat)a3 itemFrame:(CGFloat)a4 visibleItemFrame:(CGFloat)a5
{
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxX;
  double v27;
  CGFloat v28;
  _BYTE v31[32];
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  *(double *)&v31[16] = a8;
  *(double *)&v31[24] = a9;
  *(double *)v31 = a6;
  *(double *)&v31[8] = a7;
  objc_msgSend(a1, "sharingBadgesOffset");
  v23 = v22;
  v33.origin.x = a10;
  v33.origin.y = a11;
  v33.size.width = a12;
  v33.size.height = a13;
  v24 = CGRectGetMinX(v33) + v23;
  if (a2 >= v24)
    v25 = a2;
  else
    v25 = v24;
  v34.origin.x = a10;
  v34.origin.y = a11;
  v34.size.width = a12;
  v34.size.height = a13;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = a2;
  v35.origin.y = a3;
  v35.size.width = a4;
  v35.size.height = a5;
  v27 = MaxX - CGRectGetWidth(v35) - v23;
  if (v25 >= v27)
    v28 = v27;
  else
    v28 = v25;
  CGRectGetMinX(*(CGRect *)v31);
  CGRectGetMaxX(*(CGRect *)v31);
  v36.origin.x = v28;
  v36.origin.y = a3;
  v36.size.width = a4;
  v36.size.height = a5;
  CGRectGetWidth(v36);
}

- (double)_floatingBadgeOffsetForBadgesContainerFrame:(CGFloat)a3 ItemFrame:(CGFloat)a4 visibleItemFrame:(CGFloat)a5
{
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v43;
  double v44;
  double v45;
  double v46;
  double MinX;
  double v48;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  objc_msgSend(a1, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_msgSend(a1, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeAreaInsets");
  PXEdgeInsetsForEdges();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  objc_msgSend(a1, "_floatingBadgeContainerFrameForBadgeContainerFrame:itemFrame:visibleItemFrame:", a2, a3, a4, a5, a6, a7, a8, a9, v23 + v34, v25 + v32, v27 - (v34 + v38), v29 - (v32 + v36));
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  if (CGRectIsEmpty(v58))
  {
    objc_msgSend(a1, "_floatingBadgeContainerFrameForBadgeContainerFrame:itemFrame:visibleItemFrame:", a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19, a20);
    x = v43;
    y = v44;
    width = v45;
    height = v46;
  }
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  MinX = CGRectGetMinX(v59);
  v60.origin.x = a2;
  v60.origin.y = a3;
  v60.size.width = a4;
  v60.size.height = a5;
  v48 = MinX - CGRectGetMinX(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  CGRectGetMinY(v61);
  v62.origin.y = a3;
  v62.origin.x = a2;
  v62.size.width = a4;
  v62.size.height = a5;
  CGRectGetMinY(v62);
  return v48;
}

- (id)_sublayoutForItemLayoutAttributes:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedItemSublayouts;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  PUPhotosSharingCollectionViewItemSublayout *v16;
  PUPhotosSharingCollectionViewItemSublayout *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double x;
  double y;
  double width;
  double height;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  _BOOL4 IsNull;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double MinX;
  double v50;
  double v51;
  double MinY;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  CGFloat v63;
  CGFloat v64;
  CGFloat rect;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v4 = a3;
  if (!self->_cachedItemSublayouts)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedItemSublayouts = self->_cachedItemSublayouts;
    self->_cachedItemSublayouts = v5;

  }
  objc_msgSend(v4, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "indexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_cachedItemSublayouts, "objectForKey:", v15);
  v16 = (PUPhotosSharingCollectionViewItemSublayout *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    -[PUPhotosSharingCollectionViewItemSublayout itemFrame](v16, "itemFrame");
    v74.origin.x = v18;
    v74.origin.y = v19;
    v74.size.width = v20;
    v74.size.height = v21;
    v66.origin.x = v8;
    v66.origin.y = v10;
    v66.size.width = v12;
    v66.size.height = v14;
    if (!CGRectEqualToRect(v66, v74))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_cachedItemSublayouts, "removeObjectForKey:", v15);

      v17 = 0;
    }
  }
  -[PUPhotosSharingCollectionViewLayout collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalTiledCollectionViewLayout delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = -[PUPhotosSharingCollectionViewItemSublayout initWithIndexPath:itemFrame:]([PUPhotosSharingCollectionViewItemSublayout alloc], "initWithIndexPath:itemFrame:", v15, v8, v10, v12, v14);
    objc_msgSend(v23, "layout:collectionView:sizeForBadgeViewOfKind:forItemAtIndexPath:", self, v22, CFSTR("PUPhotosSharingSelectionBadgeKind"), v15);
    -[PUPhotosSharingCollectionViewItemSublayout setSelectionBadgeSize:](v17, "setSelectionBadgeSize:");
    objc_msgSend(v23, "layout:collectionView:sizeForBadgeViewOfKind:forItemAtIndexPath:", self, v22, CFSTR("PUPhotosSharingOptionBadgeKind"), v15);
    -[PUPhotosSharingCollectionViewItemSublayout setOptionBadgeSize:](v17, "setOptionBadgeSize:");
    objc_msgSend(v23, "layout:collectionView:bottomBadgeInsetforItemAtIndexPath:", self, v22, v15);
    -[PUPhotosSharingCollectionViewItemSublayout setBottomBadgeInset:](v17, "setBottomBadgeInset:");
    -[PUPhotosSharingCollectionViewItemSublayout setBadgesCorner:](v17, "setBadgesCorner:", -[PUPhotosSharingCollectionViewLayout sharingBadgesCorner](self, "sharingBadgesCorner"));
    -[PUPhotosSharingCollectionViewLayout sharingBadgesOffset](self, "sharingBadgesOffset");
    -[PUPhotosSharingCollectionViewItemSublayout setBadgesOffset:](v17, "setBadgesOffset:");
    -[PUPhotosSharingCollectionViewItemSublayout prepareSublayout](v17, "prepareSublayout");
    -[NSMutableDictionary setObject:forKey:](self->_cachedItemSublayouts, "setObject:forKey:", v17, v15);
  }
  -[PUPhotosSharingCollectionViewLayout collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v67.origin.x = v26;
  v67.origin.y = v28;
  v67.size.width = v30;
  v67.size.height = v32;
  v75.origin.x = v8;
  v75.origin.y = v10;
  v75.size.width = v12;
  v75.size.height = v14;
  v68 = CGRectIntersection(v67, v75);
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  -[PUPhotosSharingCollectionViewItemSublayout visibleItemFrame](v17, "visibleItemFrame");
  v76.origin.x = v37;
  v76.origin.y = v38;
  v76.size.width = v39;
  v76.size.height = v40;
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  if (!CGRectEqualToRect(v69, v76))
  {
    -[PUPhotosSharingCollectionViewItemSublayout setVisibleItemFrame:](v17, "setVisibleItemFrame:", x, y, width, height);
    objc_msgSend(v23, "layout:collectionView:itemAtIndexPath:didChangeToVisibleFrame:", self, v22, v15, x, y, width, height);
  }
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  IsNull = CGRectIsNull(v70);
  if (IsNull)
  {
    x = v8;
    y = v10;
  }
  v63 = x;
  v64 = y;
  if (IsNull)
    width = v12;
  rect = width;
  if (IsNull)
    height = v14;
  -[PUPhotosSharingCollectionViewItemSublayout badgesContainerFrame](v17, "badgesContainerFrame");
  -[PUPhotosSharingCollectionViewLayout _floatingBadgeOffsetForBadgesContainerFrame:ItemFrame:visibleItemFrame:](self, "_floatingBadgeOffsetForBadgesContainerFrame:ItemFrame:visibleItemFrame:", *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
  -[PUPhotosSharingCollectionViewItemSublayout setFloatingOffset:](v17, "setFloatingOffset:");
  -[PUPhotosSharingCollectionViewItemSublayout optionBadgeLayoutAttributes](v17, "optionBadgeLayoutAttributes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "frame");
  v44 = v43;
  v46 = v45;

  v71.origin.x = v8;
  v71.origin.y = v10;
  v71.size.width = v12;
  v71.size.height = v14;
  v47 = v14;
  v48 = v12;
  MinX = CGRectGetMinX(v71);
  -[PUPhotosSharingCollectionViewItemSublayout badgesOffset](v17, "badgesOffset");
  v51 = MinX + v50;
  v72.origin.x = v8;
  v72.origin.y = v10;
  v72.size.width = v48;
  v72.size.height = v47;
  MinY = CGRectGetMinY(v72);
  -[PUPhotosSharingCollectionViewItemSublayout badgesOffset](v17, "badgesOffset");
  v54 = MinY + v53;
  -[PUPhotosSharingCollectionViewItemSublayout optionBadgeLayoutAttributes](v17, "optionBadgeLayoutAttributes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v51, v54, v44, v46);

  -[PUPhotosSharingCollectionViewItemSublayout selectionBadgeLayoutAttributes](v17, "selectionBadgeLayoutAttributes");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingCollectionViewItemSublayout optionBadgeLayoutAttributes](v17, "optionBadgeLayoutAttributes");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v73.origin.x = v63;
  v73.origin.y = v64;
  v73.size.width = rect;
  v73.size.height = height;
  if (CGRectIsEmpty(v73))
  {
    v58 = 1;
  }
  else
  {
    objc_msgSend(v4, "indexPath");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosSharingCollectionViewLayout zoomingCellIndexPath](self, "zoomingCellIndexPath");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v59, "isEqual:", v60);

  }
  objc_msgSend(v56, "setHidden:", v58);
  objc_msgSend(v57, "setHidden:", v58);
  v61 = objc_msgSend(v4, "zIndex") + 1;
  objc_msgSend(v56, "setZIndex:", v61);
  objc_msgSend(v57, "setZIndex:", v61);
  objc_msgSend(v56, "setAlpha:", 1.0);
  objc_msgSend(v57, "setAlpha:", 1.0);

  return v17;
}

- (void)invalidateCachedLayout
{
  NSMutableDictionary *cachedItemSublayouts;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  -[PUHorizontalTiledCollectionViewLayout invalidateCachedLayout](&v4, sel_invalidateCachedLayout);
  cachedItemSublayouts = self->_cachedItemSublayouts;
  self->_cachedItemSublayouts = 0;

}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v47 = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  -[PUHorizontalTiledCollectionViewLayout invalidationContextForBoundsChange:](&v45, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingCollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v48.origin.x = v11;
  v48.origin.y = v13;
  v48.size.width = v15;
  v48.size.height = v17;
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  if (CGRectIntersectsRect(v48, v52) && (objc_msgSend(v8, "invalidateCachedLayout") & 1) == 0)
  {
    v49.origin.x = v11;
    v49.origin.y = v13;
    v49.size.width = v15;
    v49.size.height = v17;
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    v50 = CGRectUnion(v49, v53);
    -[PUHorizontalTiledCollectionViewLayout layoutAttributesForItemsInRect:](self, "layoutAttributesForItemsInRect:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v42 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v25, "indexPath", (_QWORD)v41);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotosSharingCollectionViewLayout _sublayoutForItemLayoutAttributes:](self, "_sublayoutForItemLayoutAttributes:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "badgesContainerFrame");
            v29 = v28;
            v31 = v30;
            v33 = v32;
            v35 = v34;
            objc_msgSend(v27, "floatingBadgesContainerFrame");
            v54.origin.x = v36;
            v54.origin.y = v37;
            v54.size.width = v38;
            v54.size.height = v39;
            v51.origin.x = v29;
            v51.origin.y = v31;
            v51.size.width = v33;
            v51.size.height = v35;
            if (!CGRectEqualToRect(v51, v54))
              objc_msgSend(v19, "addObject:", v26);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v22);
      }

      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("PUPhotosSharingSelectionBadgeKind"), v19);
        objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("PUPhotosSharingOptionBadgeKind"), v19);
      }

    }
  }
  return v8;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  -[PUHorizontalTiledCollectionViewLayout layoutAttributesForElementsInRect:](&v16, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v5, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosSharingCollectionViewLayout zoomingCellIndexPath](self, "zoomingCellIndexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", objc_msgSend(v10, "isEqual:", v11));

      -[PUPhotosSharingCollectionViewLayout _sublayoutForItemLayoutAttributes:](self, "_sublayoutForItemLayoutAttributes:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectionBadgeLayoutAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

      objc_msgSend(v12, "optionBadgeLayoutAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

    }
  }
  return v5;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  v4 = a3;
  -[PUHorizontalTiledCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v9, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingCollectionViewLayout zoomingCellIndexPath](self, "zoomingCellIndexPath", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  objc_msgSend(v5, "setHidden:", v7);
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotosSharingCollectionViewLayout;
  -[PUPhotosSharingCollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v13, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[PUPhotosSharingCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosSharingCollectionViewLayout _sublayoutForItemLayoutAttributes:](self, "_sublayoutForItemLayoutAttributes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUPhotosSharingSelectionBadgeKind")))
    {
      objc_msgSend(v10, "selectionBadgeLayoutAttributes");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("PUPhotosSharingOptionBadgeKind")))
      {
        v8 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v10, "optionBadgeLayoutAttributes");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v11;
LABEL_8:

  }
  return v8;
}

- (UIOffset)sharingBadgesOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_sharingBadgesOffset.horizontal;
  vertical = self->_sharingBadgesOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setSharingBadgesOffset:(UIOffset)a3
{
  self->_sharingBadgesOffset = a3;
}

- (unint64_t)sharingBadgesCorner
{
  return self->_sharingBadgesCorner;
}

- (void)setSharingBadgesCorner:(unint64_t)a3
{
  self->_sharingBadgesCorner = a3;
}

- (NSIndexPath)zoomingCellIndexPath
{
  return self->_zoomingCellIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingCellIndexPath, 0);
  objc_storeStrong((id *)&self->_cachedItemSublayouts, 0);
}

@end
