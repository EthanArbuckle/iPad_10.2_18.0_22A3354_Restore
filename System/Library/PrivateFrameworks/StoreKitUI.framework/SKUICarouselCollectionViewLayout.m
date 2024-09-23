@implementation SKUICarouselCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUICarouselCollectionViewLayout layoutAttributesForElementsInRect:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUICarouselCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v29, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v18, "collectionView:carouselLayout:willApplyLayoutAttributes:", v17, self, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23++), (_QWORD)v25);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v21);
    }

  }
  return v16;
}

- (void)prepareLayout
{
  OUTLINED_FUNCTION_1();
}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICarouselCollectionViewLayout prepareForTransitionToLayout:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUICarouselCollectionViewLayout;
  -[SKUICarouselCollectionViewLayout prepareForTransitionToLayout:](&v15, sel_prepareForTransitionToLayout_, v4);
  -[SKUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "panGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeTarget:action:", self, 0);

}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  int ShouldReverseLayoutDirection;
  int v36;
  _BOOL4 v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  objc_super v53;
  CGPoint result;
  CGRect v55;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUICarouselCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v53.receiver = self;
  v53.super_class = (Class)SKUICarouselCollectionViewLayout;
  -[SKUICarouselCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v53, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  v18 = v17;
  -[SKUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v23 = v22;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v25 = v23 + v24;
  -[SKUICarouselCollectionViewLayout startScrollingIndexPath](self, "startScrollingIndexPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICarouselCollectionViewLayout _collectionViewBoundsCenter](self, "_collectionViewBoundsCenter");
  v28 = v27;
  v30 = v29;
  -[SKUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "indexPathForItemAtPoint:", v28, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (v21 - v25) * 0.5;
  v34 = floorf(v33);
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v36 = ShouldReverseLayoutDirection;
  if (ShouldReverseLayoutDirection)
    v37 = x > 0.0;
  else
    v37 = x < 0.0;
  if (v37)
  {
    v38 = objc_msgSend(v26, "item") - 1;
  }
  else
  {
    if (ShouldReverseLayoutDirection)
      v39 = x < 0.0;
    else
      v39 = x > 0.0;
    if (v39)
    {
      v38 = objc_msgSend(v26, "item") + 1;
    }
    else
    {
      v40 = objc_msgSend(v32, "item");
      if (v40 == objc_msgSend(v26, "item"))
        v41 = v26;
      else
        v41 = v32;
      v38 = objc_msgSend(v41, "item");
    }
  }
  v42 = -(v34 - (double)v38 * v25);
  if (v36)
  {
    objc_msgSend(v19, "contentSize");
    v44 = v43;
    objc_msgSend(v19, "bounds");
    v42 = v44 - CGRectGetWidth(v55) - v42;
  }
  objc_msgSend(v19, "contentSize");
  v46 = v45;
  objc_msgSend(v19, "contentInset");
  v48 = v46 + v47;
  objc_msgSend(v19, "bounds");
  if (v42 >= v48 - v49)
    v50 = v48 - v49;
  else
    v50 = v42;

  v51 = v50;
  v52 = v18;
  result.y = v52;
  result.x = v51;
  return result;
}

- (CGPoint)_collectionViewBoundsCenter
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat MidX;
  double MidY;
  double v13;
  CGPoint result;
  CGRect v15;
  CGRect v16;

  -[SKUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidY = CGRectGetMidY(v16);
  v13 = MidX;
  result.y = MidY;
  result.x = v13;
  return result;
}

- (void)_panGestureRecognized:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[SKUICarouselCollectionViewLayout _collectionViewBoundsCenter](self, "_collectionViewBoundsCenter");
    v5 = v4;
    v7 = v6;
    -[SKUICarouselCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItemAtPoint:", v5, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[SKUICarouselCollectionViewLayout setStartScrollingIndexPath:](self, "setStartScrollingIndexPath:", v9);
  }
}

- (NSIndexPath)startScrollingIndexPath
{
  return self->_startScrollingIndexPath;
}

- (void)setStartScrollingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_startScrollingIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startScrollingIndexPath, 0);
}

- (void)layoutAttributesForElementsInRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)prepareForTransitionToLayout:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)targetContentOffsetForProposedContentOffset:(uint64_t)a3 withScrollingVelocity:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
