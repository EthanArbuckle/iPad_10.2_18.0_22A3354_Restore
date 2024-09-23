@implementation SKUIZoomingShelfCollectionViewLayout

+ (Class)layoutAttributesClass
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIZoomingShelfCollectionViewLayout layoutAttributesClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)prepareLayout
{
  OUTLINED_FUNCTION_1();
}

- (CGSize)collectionViewContentSize
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double width;
  double height;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIZoomingShelfCollectionViewLayout collectionViewContentSize].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  width = self->_cachedCollectionViewContentSize.width;
  height = self->_cachedCollectionViewContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSMutableDictionary *cachedLayoutAttributes;
  id v18;
  _QWORD v20[4];
  id v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIZoomingShelfCollectionViewLayout layoutAttributesForElementsInRect:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__SKUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v20[3] = &unk_1E73A6840;
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  v18 = v16;
  v21 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedLayoutAttributes, "enumerateKeysAndObjectsUsingBlock:", v20);

  return v18;
}

void __74__SKUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CGRect v5;

  v4 = a3;
  objc_msgSend(v4, "frame");
  if (CGRectIntersectsRect(v5, *(CGRect *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
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

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIZoomingShelfCollectionViewLayout layoutAttributesForItemAtIndexPath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[NSMutableDictionary objectForKey:](self->_cachedLayoutAttributes, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

+ (Class)invalidationContextClass
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIZoomingShelfCollectionViewLayout invalidationContextClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
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
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIZoomingShelfCollectionViewLayout invalidationContextForBoundsChange:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIZoomingShelfCollectionViewLayout;
  -[SKUIZoomingShelfCollectionViewLayout invalidationContextForBoundsChange:](&v24, sel_invalidationContextForBoundsChange_, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;

  if (v19 == width && v21 == height)
    objc_msgSend(v16, "setInvalidateGeometryOnlyOfExistingLayoutAttributes:", 1);
  return v16;
}

- (void)invalidateLayoutWithContext:(id)a3
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
  id v13;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIZoomingShelfCollectionViewLayout invalidateLayoutWithContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = v4;
  self->_invalidateGeometryOnlyOfExistingLayoutAttributes = objc_msgSend(v13, "invalidateGeometryOnlyOfExistingLayoutAttributes");
  v14.receiver = self;
  v14.super_class = (Class)SKUIZoomingShelfCollectionViewLayout;
  -[SKUIZoomingShelfCollectionViewLayout invalidateLayoutWithContext:](&v14, sel_invalidateLayoutWithContext_, v13);

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
  void *v17;
  double focusedItemHorizontalCenterOffset;
  double interItemSpacing;
  double itemWidth;
  double scaledItemWidth;
  NSMutableDictionary *cachedLayoutAttributes;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  _QWORD v35[7];
  _QWORD v36[4];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  CGPoint result;

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
        -[SKUIZoomingShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  -[SKUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  focusedItemHorizontalCenterOffset = self->_focusedItemHorizontalCenterOffset;
  interItemSpacing = self->_interItemSpacing;
  itemWidth = self->_itemWidth;
  scaledItemWidth = self->_scaledItemWidth;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__62;
  v41 = __Block_byref_object_dispose__62;
  v42 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0x7FEFFFFFFFFFFFFFLL;
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __106__SKUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v35[3] = &unk_1E73A6868;
  *(double *)&v35[6] = v7 + focusedItemHorizontalCenterOffset;
  v35[4] = v36;
  v35[5] = &v37;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedLayoutAttributes, "enumerateKeysAndObjectsUsingBlock:", v35);
  v34.receiver = self;
  v34.super_class = (Class)SKUIZoomingShelfCollectionViewLayout;
  -[SKUIZoomingShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v34, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  v25 = v24;
  v26 = (void *)v38[5];
  if (v26)
  {
    v27 = objc_msgSend(v26, "section");
    v28 = objc_msgSend((id)v38[5], "item");
    if (v27 < 1)
    {
      v30 = 0;
    }
    else
    {
      v29 = 0;
      v30 = 0;
      do
        v30 += objc_msgSend(v17, "numberOfItemsInSection:", v29++);
      while (v27 != v29);
    }
    v31 = itemWidth * 0.5
        + focusedItemHorizontalCenterOffset
        - scaledItemWidth * 0.5
        + (double)(v30 + v28) * (interItemSpacing + itemWidth)
        + (scaledItemWidth - itemWidth) * 0.5
        - focusedItemHorizontalCenterOffset;
  }
  else
  {
    v31 = v23;
  }
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);

  v32 = v31;
  v33 = v25;
  result.y = v33;
  result.x = v32;
  return result;
}

void __106__SKUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "center");
  v7 = vabdd_f64(v6, *(double *)(a1 + 48));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 < *(double *)(v8 + 24))
  {
    *(double *)(v8 + 24) = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)menuBarFocusedItemIndexPathWithTransitionProgress:(double *)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void **v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIZoomingShelfCollectionViewLayout menuBarFocusedItemIndexPathWithTransitionProgress:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  -[SKUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");
  objc_msgSend(v12, "indexPathsForVisibleItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(v12, "contentOffset");
    if (v14 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v17;
      v18 = (void **)v40;
    }
    else
    {
      v15 = objc_msgSend(v12, "numberOfSections") - 1;
      v16 = objc_msgSend(v12, "numberOfItemsInSection:", v15);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16 - 1, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v17;
      v18 = &v39;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v35;
    v25 = 1.79769313e308;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_cachedLayoutAttributes, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_zoomingImageLambda");
        v30 = v29;
        if (fabs(v29 + -0.5) < fabs(v25 + -0.5))
        {
          v31 = v27;

          v25 = v30;
          v23 = v31;
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
    v25 = 1.79769313e308;
  }

  if (a3)
    *a3 = v25 * 2.0 + -1.0;

  return v23;
}

- (void)setMenuBarFocusedItemIndexPath:(id)a3 withTransitionProgress:(double)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double interItemSpacing;
  double itemWidth;
  double scaledItemWidth;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIZoomingShelfCollectionViewLayout setMenuBarFocusedItemIndexPath:withTransitionProgress:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  interItemSpacing = self->_interItemSpacing;
  itemWidth = self->_itemWidth;
  scaledItemWidth = self->_scaledItemWidth;
  v19 = objc_msgSend(v6, "section");
  if (v19 < 1)
  {
    v22 = 0;
  }
  else
  {
    v20 = v19;
    v21 = 0;
    v22 = 0;
    do
      v22 += objc_msgSend(v15, "numberOfItemsInSection:", v21++);
    while (v20 != v21);
  }
  v23 = itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5
      + itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5;
  v24 = objc_msgSend(v6, "item") + v22;
  objc_msgSend(v15, "contentOffset");
  objc_msgSend(v15, "setContentOffset:", v23 * 0.5+ itemWidth * 0.5+ scaledItemWidth * -0.5+ (double)v24 * (interItemSpacing + itemWidth)+ (a4 + 1.0) * -0.5 * (v23 - (scaledItemWidth - itemWidth)));

}

- (void)setFocusedItemHorizontalCenterOffset:(double)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIZoomingShelfCollectionViewLayout setFocusedItemHorizontalCenterOffset:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_focusedItemHorizontalCenterOffset != a3)
  {
    self->_focusedItemHorizontalCenterOffset = a3;
    -[SKUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setLayoutData:(id)a3
{
  SKUIShelfLayoutData *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (SKUIShelfLayoutData *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIZoomingShelfCollectionViewLayout setLayoutData:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_layoutData != v5)
  {
    objc_storeStrong((id *)&self->_layoutData, a3);
    -[SKUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }

}

- (void)setInterItemSpacing:(double)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIZoomingShelfCollectionViewLayout setInterItemSpacing:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_interItemSpacing != a3)
  {
    self->_interItemSpacing = a3;
    -[SKUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setItemWidth:(double)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIZoomingShelfCollectionViewLayout setItemWidth:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_itemWidth != a3)
  {
    self->_itemWidth = a3;
    -[SKUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setScaledItemWidth:(double)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIZoomingShelfCollectionViewLayout setScaledItemWidth:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_scaledItemWidth != a3)
  {
    self->_scaledItemWidth = a3;
    -[SKUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

+ (double)snapToBoundariesDecelerationRate
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIZoomingShelfCollectionViewLayout snapToBoundariesDecelerationRate].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0.98;
}

+ (BOOL)collectionViewCanClipToBounds
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIZoomingShelfCollectionViewLayout collectionViewCanClipToBounds].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (SKUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (double)focusedItemHorizontalCenterOffset
{
  return self->_focusedItemHorizontalCenterOffset;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (double)itemWidth
{
  return self->_itemWidth;
}

- (double)scaledItemWidth
{
  return self->_scaledItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutData, 0);
  objc_storeStrong((id *)&self->_cachedLayoutAttributes, 0);
}

+ (void)layoutAttributesClass
{
  OUTLINED_FUNCTION_1();
}

- (void)collectionViewContentSize
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutAttributesForElementsInRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutAttributesForItemAtIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)invalidationContextClass
{
  OUTLINED_FUNCTION_1();
}

- (void)invalidationContextForBoundsChange:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)invalidateLayoutWithContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)targetContentOffsetForProposedContentOffset:(uint64_t)a3 withScrollingVelocity:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)menuBarFocusedItemIndexPathWithTransitionProgress:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setMenuBarFocusedItemIndexPath:(uint64_t)a3 withTransitionProgress:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setFocusedItemHorizontalCenterOffset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setLayoutData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setInterItemSpacing:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemWidth:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setScaledItemWidth:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)snapToBoundariesDecelerationRate
{
  OUTLINED_FUNCTION_1();
}

+ (void)collectionViewCanClipToBounds
{
  OUTLINED_FUNCTION_1();
}

@end
