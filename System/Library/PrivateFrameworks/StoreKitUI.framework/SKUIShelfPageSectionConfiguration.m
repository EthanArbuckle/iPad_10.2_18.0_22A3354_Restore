@implementation SKUIShelfPageSectionConfiguration

- (UICollectionView)existingShelfCollectionView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIShelfPageSectionConfiguration existingShelfCollectionView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return self->_shelfCollectionView;
}

- (unint64_t)numberOfIterations
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        -[SKUIShelfPageSectionConfiguration numberOfIterations].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (UICollectionView)shelfCollectionView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UICollectionView *shelfCollectionView;
  void *v12;
  id v13;
  UICollectionView *v14;
  UICollectionView *v15;
  UICollectionView *v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIShelfPageSectionConfiguration shelfCollectionView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  shelfCollectionView = self->_shelfCollectionView;
  if (!shelfCollectionView)
  {
    -[SKUIShelfPageSectionConfiguration _styledShelfCollectionViewLayoutForExistingLayout:](self, "_styledShelfCollectionViewLayoutForExistingLayout:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v14 = (UICollectionView *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v15 = self->_shelfCollectionView;
    self->_shelfCollectionView = v14;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B36D0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BD8F0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B6AF0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7A90);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AA4B0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B2830);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AE590);
    -[UICollectionView setAlwaysBounceHorizontal:](self->_shelfCollectionView, "setAlwaysBounceHorizontal:", 1);
    -[UICollectionView setBackgroundColor:](self->_shelfCollectionView, "setBackgroundColor:", self->_shelfCollectionViewBackgroundColor);
    -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", objc_msgSend((id)objc_opt_class(), "collectionViewCanClipToBounds"));
    -[UICollectionView setDataSource:](self->_shelfCollectionView, "setDataSource:", self->_shelfCollectionViewDataSource);
    v16 = self->_shelfCollectionView;
    objc_msgSend((id)objc_opt_class(), "snapToBoundariesDecelerationRate");
    -[UICollectionView setDecelerationRate:](v16, "setDecelerationRate:");
    -[UICollectionView setDelegate:](self->_shelfCollectionView, "setDelegate:", self->_shelfCollectionViewDelegate);
    -[UICollectionView setScrollsToTop:](self->_shelfCollectionView, "setScrollsToTop:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_shelfCollectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](self->_shelfCollectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setPrefetchingEnabled:](self->_shelfCollectionView, "setPrefetchingEnabled:", 0);
    if (self->_rendersWithPerspective)
      -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", 0);

    shelfCollectionView = self->_shelfCollectionView;
  }
  return shelfCollectionView;
}

- (void)setShelfCollectionViewBackgroundColor:(id)a3
{
  UIColor *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIShelfPageSectionConfiguration setShelfCollectionViewBackgroundColor:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_shelfCollectionViewBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, a3);
    -[UICollectionView setBackgroundColor:](self->_shelfCollectionView, "setBackgroundColor:", v5);
  }

}

- (void)setShelfCollectionViewDataSource:(id)a3
{
  UICollectionViewDataSource *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (UICollectionViewDataSource *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_shelfCollectionViewDataSource != v4)
  {
    self->_shelfCollectionViewDataSource = v4;
    -[UICollectionView setDataSource:](self->_shelfCollectionView, "setDataSource:", v4);
  }

}

- (void)setShelfCollectionViewDelegate:(id)a3
{
  UICollectionViewDelegate *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (UICollectionViewDelegate *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_shelfCollectionViewDelegate != v4)
  {
    self->_shelfCollectionViewDelegate = v4;
    -[UICollectionView setDelegate:](self->_shelfCollectionView, "setDelegate:", v4);
  }

}

- (void)setShelfViewElementStyle:(id)a3
{
  IKViewElementStyle *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  UICollectionView *shelfCollectionView;
  void *v25;
  void *v26;
  UICollectionView *v27;

  v5 = (IKViewElementStyle *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIShelfPageSectionConfiguration setShelfViewElementStyle:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_shelfViewElementStyle != v5)
  {
    objc_storeStrong((id *)&self->_shelfViewElementStyle, a3);
    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-peeking-item-width"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-inter-item-spacing"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    self->_zoomingShelfLayoutInterItemSpacing = v18;

    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-item-width"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    self->_zoomingShelfLayoutItemWidth = v20;

    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-zoomed-item-width"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    self->_zoomingShelfLayoutScaledItemWidth = v22;

    self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset = self->_zoomingShelfLayoutInterItemSpacing
                                                               + v16
                                                               + self->_zoomingShelfLayoutScaledItemWidth * 0.5;
    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-layout"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wantsZoomingShelfLayout = objc_msgSend(v23, "isEqualToString:", CFSTR("zooming"));

    -[SKUIShelfPageSectionConfiguration _updateShelfLayoutDataContentInset](self, "_updateShelfLayoutDataContentInset");
    shelfCollectionView = self->_shelfCollectionView;
    if (shelfCollectionView)
    {
      -[UICollectionView collectionViewLayout](shelfCollectionView, "collectionViewLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIShelfPageSectionConfiguration _styledShelfCollectionViewLayoutForExistingLayout:](self, "_styledShelfCollectionViewLayoutForExistingLayout:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 != v26)
      {
        -[UICollectionView setCollectionViewLayout:](self->_shelfCollectionView, "setCollectionViewLayout:", v26);
        v27 = self->_shelfCollectionView;
        objc_msgSend((id)objc_opt_class(), "snapToBoundariesDecelerationRate");
        -[UICollectionView setDecelerationRate:](v27, "setDecelerationRate:");
        -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", objc_msgSend((id)objc_opt_class(), "collectionViewCanClipToBounds"));
      }

    }
  }

}

- (id)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
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
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIShelfPageSectionConfiguration actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:numberOfShelfItems:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (-[SKUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") == 1)
  {
    v15 = v6;
  }
  else
  {
    v16 = objc_msgSend(v6, "item");
    -[SKUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "indexPathsForVisibleItems");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
LABEL_9:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v22);
        if (objc_msgSend(v23, "item", (_QWORD)v35) % a4 == v16)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v20)
            goto LABEL_9;
          goto LABEL_15;
        }
      }
      v15 = v23;

      if (v15)
        goto LABEL_28;
    }
    else
    {
LABEL_15:

    }
    if (objc_msgSend(v18, "count", (_QWORD)v35))
    {
      objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_65);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      if (v25 != v26)
      {
        v28 = objc_msgSend(v25, "item") % a4;
        v29 = objc_msgSend(v26, "item") % a4;
        v30 = v28 - v16;
        if ((uint64_t)(v28 - v16) < 0)
          v30 = v16 - v28;
        v31 = v29 - v16;
        if (v31 < 0)
          v31 = -v31;
        if (v30 >= v31)
          v27 = v26;
        else
          v27 = v25;
      }
      v32 = v27;
      v33 = objc_msgSend(v32, "item");
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16 + v33 / a4 * a4, objc_msgSend(v6, "section"));
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v18 = v24;
    }
    else
    {
      v15 = v6;
    }
LABEL_28:

  }
  return v15;
}

uint64_t __127__SKUIShelfPageSectionConfiguration_actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath_numberOfShelfItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "item");
  v6 = objc_msgSend(v4, "item");

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (id)backgroundColorForShelfViewElement:(id)a3
{
  id v3;
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
  void *v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        -[SKUIShelfPageSectionConfiguration backgroundColorForShelfViewElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ikBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;

  v5 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  -[SKUIStorePageSectionContext collectionView](self->_pageSectionContext, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B7D10, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCollectionView:", v16);
  if (self->_needsShelfCollectionViewReload)
  {
    objc_msgSend(v16, "reloadData");
    self->_needsShelfCollectionViewReload = 0;
  }
  if (self->_rendersWithPerspective)
  {
    -[SKUIShelfLayoutData totalContentSize](self->_shelfLayoutData, "totalContentSize");
    -[SKUIShelfPageSectionConfiguration _perspectiveHeightForContentSize:](self, "_perspectiveHeightForContentSize:", v17);
    objc_msgSend(v15, "setContentInset:");
    objc_msgSend(v15, "setRendersWithPerspective:", 1);
  }
  else
  {
    objc_msgSend(v15, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v15, "setRendersWithPerspective:", 0);
    objc_msgSend(v15, "setRendersWithParallax:", 0);
  }

  return v15;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        -[SKUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
  v16 = v15;
  if (self->_needsShelfCollectionViewLayout)
  {
    v17 = -[SKUIShelfPageSectionConfiguration _reloadShelfLayoutDataWithNumberOfShelfItems:](self, "_reloadShelfLayoutDataWithNumberOfShelfItems:", a5);
    self->_needsShelfCollectionViewLayout = 0;
  }
  -[SKUIShelfLayoutData totalContentSize](self->_shelfLayoutData, "totalContentSize");
  v19 = v18;
  if (self->_rendersWithPerspective)
  {
    -[SKUIShelfPageSectionConfiguration _perspectiveHeightForContentSize:](self, "_perspectiveHeightForContentSize:", v18);
    v19 = v19 + v20;
  }
  if (self->_wantsZoomingShelfLayout)
    v19 = v19 + self->_zoomingShelfLayoutScaledItemWidth - self->_zoomingShelfLayoutItemWidth;
  v21 = v16;
  v22 = v19;
  result.height = v22;
  result.width = v21;
  return result;
}

- (id)cellForShelfItemViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  SKUIStorePageSectionContext *pageSectionContext;
  id v29;
  void *v30;
  void *v31;
  CGRect v33;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIShelfPageSectionConfiguration cellForShelfItemViewElement:indexPath:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "elementType");
  v19 = 0;
  if (v18 <= 48)
  {
    if (v18 == 14)
    {
      if (objc_msgSend(v6, "cardType") != 3)
      {
        objc_msgSend(v16, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B36D0, v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setArtworkBoundingSize:", 0);
        goto LABEL_18;
      }
      v20 = CFSTR("SKUIEditorialCardCellReuseIdentifier");
    }
    else
    {
      if (v18 != 28)
        goto LABEL_18;
      v20 = CFSTR("SKUICounterReuseIdentifier");
    }
    objc_msgSend(v16, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v20, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v18 == 49)
  {
LABEL_9:
    objc_msgSend(v16, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73AA4B0, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShowsReflectionImage:", 0);
    goto LABEL_18;
  }
  if (v18 != 66)
  {
    if (v18 != 152)
      goto LABEL_18;
    goto LABEL_9;
  }
  -[SKUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration _dequeueCellForLockup:collectionView:indexPath:](self, "_dequeueCellForLockup:collectionView:indexPath:", v17, v21, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  -[SKUIShelfLayoutData sizeForItemAtIndex:](self->_shelfLayoutData, "sizeForItemAtIndex:", objc_msgSend(v7, "item"));
  v23 = v22;
  objc_msgSend(v17, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "visibility");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("hidden"));

  if (v26)
    v27 = 0;
  else
    v27 = v17;
  objc_msgSend(v19, "reloadWithViewElement:width:context:", v27, self->_cellLayoutContext, v23);
  if (self->_rendersWithPerspective && objc_msgSend(v19, "conformsToProtocol:", &unk_1EF42F8D8))
  {
    pageSectionContext = self->_pageSectionContext;
    v29 = v19;
    -[SKUIStorePageSectionContext parentViewController](pageSectionContext, "parentViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setPerspectiveTargetView:", v31);
    objc_msgSend(v31, "bounds");
    objc_msgSend(v29, "setVanishingPoint:", CGRectGetMidX(v33), -800.0);

  }
  return v19;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return v3;
}

- (int64_t)lockupTypeForLockup:(id)a3
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
  uint64_t lockupType;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIShelfPageSectionConfiguration lockupTypeForLockup:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  lockupType = self->_lockupType;
  if (lockupType == -1)
    lockupType = objc_msgSend(v4, "lockupViewType");

  return lockupType;
}

- (id)normalizedShelfItemIndexPathFromActualIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
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
  id v15;
  void *v16;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIShelfPageSectionConfiguration normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (-[SKUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") == 1)
  {
    v15 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v6, "item") % a4, objc_msgSend(v6, "section"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (unint64_t)numberOfCellsForNumberOfShelfItems:(unint64_t)a3
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
        -[SKUIShelfPageSectionConfiguration numberOfCellsForNumberOfShelfItems:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return -[SKUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") * a3;
}

- (int64_t)numberOfSectionCells
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        -[SKUIShelfPageSectionConfiguration numberOfSectionCells].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (BOOL)prefetchResourcesForShelfItemViewElement:(id)a3 reason:(int64_t)a4
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
  char v16;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        -[SKUIShelfPageSectionConfiguration prefetchResourcesForShelfItemViewElement:reason:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[objc_class prefetchResourcesForViewElement:reason:context:](-[SKUIShelfPageSectionConfiguration _cellClassForEffectiveShelfItemViewElement:](self, "_cellClassForEffectiveShelfItemViewElement:", v15), "prefetchResourcesForViewElement:reason:context:", v15, a4, self->_cellLayoutContext);

  return v16;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        -[SKUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7D10);

}

- (void)reloadLockupTypeForShelfViewElement:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockupType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    v6 = SKUILockupViewTypeForString(v7);
    v5 = v7;
  }
  else
  {
    v6 = -1;
  }
  self->_lockupType = v6;

}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SKUIShelfLayoutData *v20;
  uint64_t v21;
  double v22;
  double v23;
  SKUIShelfLayoutData *v24;
  SKUIShelfLayoutData *shelfLayoutData;
  void *v26;
  unint64_t v27;
  int64_t v28;
  SKUIShelfLayoutData *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  SKUIShelfPageSectionConfiguration *v33;
  int64_t v34;
  int64_t v35;
  unint64_t v36;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v12)
        -[SKUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v20 = [SKUIShelfLayoutData alloc];
  v21 = objc_msgSend(v11, "numberOfRows");

  -[SKUIShelfPageSectionConfiguration _columnSpacingForShelfItemViewElements:](self, "_columnSpacingForShelfItemViewElements:", v10);
  v23 = v22;

  v24 = -[SKUIShelfLayoutData initWithNumberOfRows:columnSpacing:](v20, "initWithNumberOfRows:columnSpacing:", v21, v23);
  shelfLayoutData = self->_shelfLayoutData;
  self->_shelfLayoutData = v24;

  -[SKUIShelfPageSectionConfiguration _updateShelfLayoutDataContentInset](self, "_updateShelfLayoutDataContentInset");
  -[SKUIShelfPageSectionConfiguration _reloadShelfLayoutDataWithNumberOfShelfItems:](self, "_reloadShelfLayoutDataWithNumberOfShelfItems:", a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v27 = -[SKUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations");
    v28 = -[SKUIShelfLayoutData numberOfRows](self->_shelfLayoutData, "numberOfRows");
    v29 = self->_shelfLayoutData;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __142__SKUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke;
    v31[3] = &unk_1E73A99D8;
    v34 = v28;
    v35 = a6;
    v36 = v27;
    v32 = v26;
    v33 = self;
    -[SKUIShelfLayoutData enumerateColumnsUsingBlock:](v29, "enumerateColumnsUsingBlock:", v31);

  }
  -[UICollectionView collectionViewLayout](self->_shelfCollectionView, "collectionViewLayout");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLayoutData:", self->_shelfLayoutData);

}

void __142__SKUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3 >= 1)
  {
    v6 = 0;
    v7 = v3 * a2;
    do
    {
      v8 = v7 + v6;
      v9 = *(_QWORD *)(a1 + 56);
      if (v7 + v6 >= (unint64_t)(*(_QWORD *)(a1 + 64) * v9))
        break;
      v10 = v8 % v9;
      v11 = *(void **)(a1 + 32);
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 % v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          continue;
      }
      objc_msgSend(*(id *)(a1 + 40), "_shelfItemViewElementAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "requestCellLayoutForViewElement:withColumnWidth:", v14, a3);
      v15 = *(void **)(a1 + 32);
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", v16);

      }
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 48));
  }
}

- (void)requestCellLayoutForViewElement:(id)a3 withColumnWidth:(double)a4
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

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        -[SKUIShelfPageSectionConfiguration requestCellLayoutForViewElement:withColumnWidth:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class requestLayoutForViewElement:width:context:](-[SKUIShelfPageSectionConfiguration _cellClassForEffectiveShelfItemViewElement:](self, "_cellClassForEffectiveShelfItemViewElement:", v15), "requestLayoutForViewElement:width:context:", v15, self->_cellLayoutContext, a4);

}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forShelfViewElement:(id)a4 withSectionIndex:(int64_t)a5
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char v29;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v10 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v11)
        -[SKUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v29 = 0;
  objc_msgSend(v10, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = SKUIViewElementPaddingForStyle(v19, &v29);
  v22 = v21;

  if (a5)
    v23 = top;
  else
    v23 = bottom;
  if (v29)
  {
    bottom = v22;
    v24 = v20;
  }
  else
  {
    v24 = v23;
  }

  v25 = v24;
  v26 = left;
  v27 = bottom;
  v28 = right;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)shelfItemsCollectionView:(id)a3 willApplyLayoutAttributes:(id)a4 forViewElement:(id)a5 withItemIndex:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  uint64_t v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v13)
        -[SKUIShelfPageSectionConfiguration shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ikBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "color");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v11, "setBackgroundColor:", v24);
  }
  else
  {
    objc_msgSend(v10, "backgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v25);

  }
  v26 = -[SKUIShelfLayoutData numberOfRows](self->_shelfLayoutData, "numberOfRows");
  if (v26 == 1)
  {
    v27 = 40;
  }
  else if (a6 % v26)
  {
    if (a6 % v26 == v26 - 1)
      v27 = 32;
    else
      v27 = 16;
  }
  else
  {
    v27 = 8;
  }
  objc_msgSend(v11, "setPosition:", v27);

}

- (BOOL)supportsDuplicateShelfItems
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIShelfPageSectionConfiguration supportsDuplicateShelfItems].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return -[SKUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") > 1;
}

- (Class)_cellClassForEffectiveShelfItemViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  objc_class *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0;
  if (v5 <= 48)
  {
    if (v5 != 14)
    {
      if (v5 == 28)
        goto LABEL_11;
      goto LABEL_12;
    }
    objc_msgSend(v4, "cardType");
LABEL_11:
    v6 = (objc_class *)objc_opt_class();
    goto LABEL_12;
  }
  switch(v5)
  {
    case 49:
      goto LABEL_11;
    case 66:
      v6 = -[SKUIShelfPageSectionConfiguration _lockupCellClassWithLockup:](self, "_lockupCellClassWithLockup:", v4);
      break;
    case 152:
      goto LABEL_11;
  }
LABEL_12:
  v7 = v6;

  return v7;
}

- (double)_columnSpacingForShelfItemViewElements:(id)a3
{
  void *v4;
  uint64_t v5;
  double result;
  double v7;
  BOOL v8;

  -[SKUIStorePageSectionContext clientContext](self->_pageSectionContext, "clientContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SKUIUserInterfaceIdiom(v4);

  result = 15.0;
  if (v5 == 1)
  {
    -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth", 15.0);
    v8 = v7 < 768.0;
    result = 30.0;
    if (v8)
      return 20.0;
  }
  return result;
}

- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  __CFString *v12;

  v8 = a4;
  v9 = a5;
  v10 = -[SKUIShelfPageSectionConfiguration lockupTypeForLockup:](self, "lockupTypeForLockup:", a3);
  if (v10 > 8)
  {
    v11 = 0;
  }
  else if (((1 << v10) & 0x1E6) != 0)
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B7A90, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSeparatorStyle:", 5);
  }
  else
  {
    if (((1 << v10) & 0x11) != 0)
      v12 = CFSTR("SKUIVerticalLockupReuseIdentifier");
    else
      v12 = CFSTR("SKUIProductLockupReuseIdentifier");
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (Class)_lockupCellClassWithLockup:(id)a3
{
  void *v3;

  if ((unint64_t)-[SKUIShelfPageSectionConfiguration lockupTypeForLockup:](self, "lockupTypeForLockup:", a3) <= 8)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (double)_perspectiveHeightForContentSize:(double)a3
{
  double v4;
  double v5;
  _BOOL4 v6;
  double result;

  +[SKUIStackedImageView maximumPerspectiveHeightForSize:](SKUIStackedImageView, "maximumPerspectiveHeightForSize:", a3, a3);
  v5 = v4;
  v6 = -[SKUIShelfPageSectionConfiguration isTopSection](self, "isTopSection");
  result = v5 + -15.0;
  if (v6)
    return v5;
  return result;
}

- (id)_reloadShelfLayoutDataWithNumberOfShelfItems:(int64_t)a3
{
  unint64_t v5;
  id v6;
  SKUIShelfLayoutData *shelfLayoutData;
  int64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SKUIShelfPageSectionConfiguration *v14;
  int64_t v15;

  v5 = -[SKUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations");
  if (v5 < 2)
    v6 = 0;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  shelfLayoutData = self->_shelfLayoutData;
  v8 = v5 * a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__SKUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke;
  v12[3] = &unk_1E73A9A00;
  v15 = a3;
  v9 = v6;
  v13 = v9;
  v14 = self;
  -[SKUIShelfLayoutData reloadWithItemCount:sizeBlock:](shelfLayoutData, "reloadWithItemCount:sizeBlock:", v8, v12);
  v10 = v9;

  return v10;
}

double __82__SKUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2 % v3;
  v5 = *(void **)(a1 + 32);
  if (v5
    && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2 % v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKey:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    objc_msgSend(v7, "CGSizeValue");
    v9 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_shelfItemViewElementAtIndex:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "effectiveViewElementForShelfItemViewElement:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_cellClassForEffectiveShelfItemViewElement:", v10), "preferredSizeForViewElement:context:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
    v9 = v11;
    v13 = *(void **)(a1 + 32);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v15);

    }
  }

  return v9;
}

- (id)_shelfItemViewElementAtIndex:(int64_t)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "shelfPageSectionConfiguration:viewElementAtIndex:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_styledShelfCollectionViewLayoutForExistingLayout:(id)a3
{
  id v4;
  SKUIZoomingShelfCollectionViewLayout *v5;

  v4 = a3;
  if (self->_wantsZoomingShelfLayout)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (SKUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      v5 = objc_alloc_init(SKUIZoomingShelfCollectionViewLayout);
      -[SKUIZoomingShelfCollectionViewLayout setLayoutData:](v5, "setLayoutData:", self->_shelfLayoutData);
    }
    -[SKUIZoomingShelfCollectionViewLayout setFocusedItemHorizontalCenterOffset:](v5, "setFocusedItemHorizontalCenterOffset:", self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset);
    -[SKUIZoomingShelfCollectionViewLayout setInterItemSpacing:](v5, "setInterItemSpacing:", self->_zoomingShelfLayoutInterItemSpacing);
    -[SKUIZoomingShelfCollectionViewLayout setItemWidth:](v5, "setItemWidth:", self->_zoomingShelfLayoutItemWidth);
    -[SKUIZoomingShelfCollectionViewLayout setScaledItemWidth:](v5, "setScaledItemWidth:", self->_zoomingShelfLayoutScaledItemWidth);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (SKUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      v5 = objc_alloc_init(SKUIShelfCollectionViewLayout);
      -[SKUIZoomingShelfCollectionViewLayout setLayoutData:](v5, "setLayoutData:", self->_shelfLayoutData);
    }
  }

  return v5;
}

- (void)_updateShelfLayoutDataContentInset
{
  SKUIShelfLayoutData *shelfLayoutData;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  if (self->_wantsZoomingShelfLayout)
  {
    shelfLayoutData = self->_shelfLayoutData;
    v4 = *MEMORY[0x1E0DC49E8];
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "horizontalPadding");
    v10 = v9;
    -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "horizontalPadding");
    v13 = v12;

    v5 = v10 + 100.0;
    if (self->_rendersWithPerspective)
    {
      v7 = v13 + 100.0;
    }
    else
    {
      v5 = v10;
      v7 = v13;
    }
    shelfLayoutData = self->_shelfLayoutData;
    v4 = 0.0;
    v6 = 0.0;
  }
  -[SKUIShelfLayoutData setContentInset:](shelfLayoutData, "setContentInset:", v4, v5, v6, v7);
}

- (SKUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayoutContext, a3);
}

- (SKUIShelfPageSectionConfigurationDataSource)dataSource
{
  return (SKUIShelfPageSectionConfigurationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)needsShelfCollectionViewReload
{
  return self->_needsShelfCollectionViewReload;
}

- (void)setNeedsShelfCollectionViewReload:(BOOL)a3
{
  self->_needsShelfCollectionViewReload = a3;
}

- (BOOL)needsShelfCollectionViewLayout
{
  return self->_needsShelfCollectionViewLayout;
}

- (void)setNeedsShelfCollectionViewLayout:(BOOL)a3
{
  self->_needsShelfCollectionViewLayout = a3;
}

- (SKUIStorePageSectionContext)pageSectionContext
{
  return self->_pageSectionContext;
}

- (void)setPageSectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_pageSectionContext, a3);
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void)setRendersWithParallax:(BOOL)a3
{
  self->_rendersWithParallax = a3;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (UIColor)shelfCollectionViewBackgroundColor
{
  return self->_shelfCollectionViewBackgroundColor;
}

- (UICollectionViewDataSource)shelfCollectionViewDataSource
{
  return self->_shelfCollectionViewDataSource;
}

- (UICollectionViewDelegate)shelfCollectionViewDelegate
{
  return self->_shelfCollectionViewDelegate;
}

- (SKUIShelfLayoutData)shelfLayoutData
{
  return self->_shelfLayoutData;
}

- (IKViewElementStyle)shelfViewElementStyle
{
  return self->_shelfViewElementStyle;
}

- (BOOL)isTopSection
{
  return self->_topSection;
}

- (void)setTopSection:(BOOL)a3
{
  self->_topSection = a3;
}

- (BOOL)wantsZoomingShelfLayout
{
  return self->_wantsZoomingShelfLayout;
}

- (double)zoomingShelfLayoutFocusedItemHorizontalCenterOffset
{
  return self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset;
}

- (double)zoomingShelfLayoutInterItemSpacing
{
  return self->_zoomingShelfLayoutInterItemSpacing;
}

- (double)zoomingShelfLayoutItemWidth
{
  return self->_zoomingShelfLayoutItemWidth;
}

- (double)zoomingShelfLayoutScaledItemWidth
{
  return self->_zoomingShelfLayoutScaledItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfViewElementStyle, 0);
  objc_storeStrong((id *)&self->_shelfLayoutData, 0);
  objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pageSectionContext, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_shelfCollectionView, 0);
}

- (void)existingShelfCollectionView
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfIterations
{
  OUTLINED_FUNCTION_1();
}

- (void)shelfCollectionView
{
  OUTLINED_FUNCTION_1();
}

- (void)setShelfCollectionViewBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShelfCollectionViewDataSource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShelfCollectionViewDelegate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShelfViewElementStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(uint64_t)a3 numberOfShelfItems:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)backgroundColorForShelfViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellForShelfViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellSizeForShelfViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 numberOfShelfItems:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellForShelfItemViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)effectiveViewElementForShelfItemViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)lockupTypeForLockup:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)normalizedShelfItemIndexPathFromActualIndexPath:(uint64_t)a3 numberOfShelfItems:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfCellsForNumberOfShelfItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfSectionCells
{
  OUTLINED_FUNCTION_1();
}

- (void)prefetchResourcesForShelfItemViewElement:(uint64_t)a3 reason:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)registerReusableClassesForCollectionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadShelfLayoutDataForShelfViewElement:(uint64_t)a3 withShelfItemViewElements:(uint64_t)a4 requestCellLayouts:(uint64_t)a5 numberOfShelfItems:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)requestCellLayoutForViewElement:(uint64_t)a3 withColumnWidth:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sectionContentInsetAdjustedFromValue:(uint64_t)a3 forShelfViewElement:(uint64_t)a4 withSectionIndex:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)shelfItemsCollectionView:(uint64_t)a3 willApplyLayoutAttributes:(uint64_t)a4 forViewElement:(uint64_t)a5 withItemIndex:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)supportsDuplicateShelfItems
{
  OUTLINED_FUNCTION_1();
}

@end
