@implementation PUAvalancheReviewCollectionViewLayout

- (void)setZoomingCellIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;

  v5 = (NSIndexPath *)a3;
  if (self->_zoomingCellIndexPath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_zoomingCellIndexPath, a3);
    -[PUAvalancheReviewCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    v5 = v6;
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
  -[PUAvalancheReviewCollectionViewLayout sharingBadgeOffset](self, "sharingBadgeOffset");
  v13 = v12;
  -[PUAvalancheReviewCollectionViewLayout collectionView](self, "collectionView");
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
  uint64_t v28;
  void *v29;
  void *v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = a3;
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUAvalancheReviewBadgeKind"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewCollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v4, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v32.origin.x = v9;
  v32.origin.y = v11;
  v32.size.width = v13;
  v32.size.height = v15;
  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  v33 = CGRectIntersection(v32, v35);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  if (CGRectIsNull(v33))
  {
    height = v23;
    width = v21;
    y = v19;
    x = v17;
  }
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (CGRectIsEmpty(v34))
  {
    v28 = 1;
  }
  else
  {
    objc_msgSend(v6, "indexPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAvalancheReviewCollectionViewLayout zoomingCellIndexPath](self, "zoomingCellIndexPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v29, "isEqual:", v30);

  }
  objc_msgSend(v6, "setHidden:", v28);
  -[PUAvalancheReviewCollectionViewLayout _floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:](self, "_floatingSelectionBadgeFrameForItemFrame:visibleItemFrame:atIndexPath:", v5, v17, v19, v21, v23, x, y, width, height);
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setZIndex:", objc_msgSend(v4, "zIndex") + 1);
  objc_msgSend(v6, "setAlpha:", 1.0);

  return v6;
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  -[PUAvalancheReviewCollectionViewLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  return v9 != height || v7 != width;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUAvalancheReviewCollectionViewLayout;
  -[PUHorizontalCollectionViewLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
      -[PUAvalancheReviewCollectionViewLayout zoomingCellIndexPath](self, "zoomingCellIndexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", objc_msgSend(v10, "isEqual:", v11));

      -[PUAvalancheReviewCollectionViewLayout _badgeLayoutAttributesForItemLayoutAttributes:](self, "_badgeLayoutAttributesForItemLayoutAttributes:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

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
  v9.super_class = (Class)PUAvalancheReviewCollectionViewLayout;
  v4 = a3;
  -[PUHorizontalCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v9, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewCollectionViewLayout zoomingCellIndexPath](self, "zoomingCellIndexPath", v9.receiver, v9.super_class);
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
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUAvalancheReviewCollectionViewLayout;
  -[PUAvalancheReviewCollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v11, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUAvalancheReviewBadgeKind")))
    {
      -[PUAvalancheReviewCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAvalancheReviewCollectionViewLayout _badgeLayoutAttributesForItemLayoutAttributes:](self, "_badgeLayoutAttributesForItemLayoutAttributes:", v9);
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

- (NSIndexPath)zoomingCellIndexPath
{
  return self->_zoomingCellIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingCellIndexPath, 0);
}

@end
