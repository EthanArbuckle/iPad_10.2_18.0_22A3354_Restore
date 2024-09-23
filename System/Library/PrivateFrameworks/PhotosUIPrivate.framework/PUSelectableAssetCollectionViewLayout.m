@implementation PUSelectableAssetCollectionViewLayout

- (void)setFloatingCellIndexPaths:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  char v7;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v5 = self->_floatingCellIndexPaths;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_floatingCellIndexPaths, a3);
      -[PUSelectableAssetCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    }
  }

}

- (CGRect)_floatingSelectionBadgeFrameForItemFrame:(CGRect)a3 visibleItemFrame:(CGRect)a4 atIndexPath:(id)a5
{
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
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
  double MaxX;
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
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat rect;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  v42 = a3.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v6 = a3.size.height;
  v7 = a3.size.width;
  v41 = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  v11 = a5;
  -[PUSelectableAssetCollectionViewLayout sharingBadgeOffset](self, "sharingBadgeOffset");
  v13 = v12;
  -[PUSelectableAssetCollectionViewLayout collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalCollectionViewLayout delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v9;
  objc_msgSend(v15, "layout:collectionView:selectionBadgeFrameForItemFrame:atIndexPath:", self, v14, v11, v9, v8, v7, v6);
  v17 = v16;
  v19 = v18;
  v40 = v20;
  rect = v21;

  v22 = v9 + v17;
  v23 = v8 + v19;
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v38 = v13;
  v24 = v13 + CGRectGetMinX(v47);
  if (v9 + v17 >= v24)
    v25 = v9 + v17;
  else
    v25 = v24;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MaxX = CGRectGetMaxX(v48);
  v49.origin.x = v22;
  v49.origin.y = v23;
  v49.size.width = v40;
  v49.size.height = rect;
  v27 = MaxX - CGRectGetWidth(v49) - v13;
  if (v25 >= v27)
    v28 = v27;
  else
    v28 = v25;
  v50.origin.x = v39;
  v50.origin.y = v8;
  v50.size.width = v41;
  v50.size.height = v42;
  v29 = v13 + CGRectGetMinX(v50);
  if (v28 >= v29)
    v30 = v28;
  else
    v30 = v29;
  v51.origin.x = v39;
  v51.origin.y = v8;
  v51.size.width = v41;
  v51.size.height = v42;
  v31 = CGRectGetMaxX(v51);
  v52.origin.x = v28;
  v52.origin.y = v23;
  v52.size.width = v40;
  v52.size.height = rect;
  v32 = v31 - CGRectGetWidth(v52) - v38;
  if (v30 >= v32)
    v33 = v32;
  else
    v33 = v30;

  v34 = v33;
  v35 = v23;
  v36 = v40;
  v37 = rect;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)_badgeLayoutAttributesForItemLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsNull;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUSelectableAssetBadgeKind"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSelectableAssetCollectionViewLayout collectionViewBounds](self, "collectionViewBounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v40.origin.x = v9;
    v40.origin.y = v11;
    v40.size.width = v13;
    v40.size.height = v15;
    v42.origin.x = v17;
    v42.origin.y = v19;
    v42.size.width = v21;
    v42.size.height = v23;
    v41 = CGRectIntersection(v40, v42);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    IsNull = CGRectIsNull(v41);
    if (IsNull)
      v29 = v23;
    else
      v29 = height;
    if (IsNull)
    {
      width = v21;
      y = v19;
      v30 = v17;
    }
    else
    {
      v30 = x;
    }
    v31 = v30;
    v32 = y;
    v33 = width;
    v39 = v29;
    v34 = 0.0;
    if (!CGRectIsEmpty(*(CGRect *)(&v29 - 3)))
    {
      -[PUSelectableAssetCollectionViewLayout floatingCellIndexPaths](self, "floatingCellIndexPaths");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexPath");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "member:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
        v34 = 0.0;
      else
        v34 = 1.0;

    }
    objc_msgSend(v7, "setAlpha:", v34);
    -[PUSelectableAssetCollectionViewLayout _floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:](self, "_floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:", v6, v17, v19, v21, v23, v30, y, width, v39);
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v7, "setZIndex:", objc_msgSend(v5, "zIndex") + 1);
    objc_msgSend(v7, "setAlpha:", 1.0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.size.height;
  width = a3.size.width;
  -[PUSelectableAssetCollectionViewLayout collectionViewBounds](self, "collectionViewBounds", a3.origin.x, a3.origin.y);
  return v6 != height || v5 != width;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
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
  double v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  -[PUHorizontalCollectionViewLayout layoutAttributesForElementsInRect:](&v16, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
      -[PUSelectableAssetCollectionViewLayout floatingCellIndexPaths](self, "floatingCellIndexPaths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "member:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = 0.0;
      else
        v13 = 1.0;
      objc_msgSend(v9, "setAlpha:", v13);
      -[PUSelectableAssetCollectionViewLayout _badgeLayoutAttributesForItemLayoutAttributes:](self, "_badgeLayoutAttributesForItemLayoutAttributes:", v9);
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
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  v4 = a3;
  -[PUHorizontalCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v10, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSelectableAssetCollectionViewLayout floatingCellIndexPaths](self, "floatingCellIndexPaths", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "member:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (!v7)
    v8 = 1.0;
  objc_msgSend(v5, "setAlpha:", v8);
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  -[PUSelectableAssetCollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v11, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUSelectableAssetBadgeKind")))
    {
      -[PUSelectableAssetCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSelectableAssetCollectionViewLayout _badgeLayoutAttributesForItemLayoutAttributes:](self, "_badgeLayoutAttributesForItemLayoutAttributes:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  CGSize *p_layoutReferenceSize;
  double width;
  double height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  p_layoutReferenceSize = &self->_layoutReferenceSize;
  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  if (width != a3.width || height != a3.height)
  {
    p_layoutReferenceSize->width = a3.width;
    self->_layoutReferenceSize.height = a3.height;
    -[PUSelectableAssetCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;

    v13 = p_layoutReferenceSize->height;
    if (p_layoutReferenceSize->width == *MEMORY[0x1E0C9D820] && v13 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      if (width != v10 || height != v12)
        goto LABEL_13;
    }
    else if (p_layoutReferenceSize->width != v10 || v13 != v12)
    {
LABEL_13:
      -[PUSelectableAssetCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    }
  }
}

- (CGRect)collectionViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  -[PUSelectableAssetCollectionViewLayout layoutReferenceSize](self, "layoutReferenceSize");
  v4 = v3;
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)PUSelectableAssetCollectionViewLayout;
  -[PUHorizontalCollectionViewLayout collectionViewBounds](&v11, sel_collectionViewBounds);
  if (v4 != *MEMORY[0x1E0C9D820] || v6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v9 = v4;
    v10 = v6;
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (UIOffset)sharingBadgeOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_sharingBadgeOffset.horizontal;
  vertical = self->_sharingBadgeOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setSharingBadgeOffset:(UIOffset)a3
{
  self->_sharingBadgeOffset = a3;
}

- (NSSet)floatingCellIndexPaths
{
  return self->_floatingCellIndexPaths;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingCellIndexPaths, 0);
}

@end
