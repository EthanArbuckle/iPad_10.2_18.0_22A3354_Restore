@implementation SKUICarouselPageSection

- (SKUICarouselPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUICarouselPageSection *v5;
  SKUICarouselPageSection *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICarouselPageSection initWithPageComponent:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUICarouselPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v8, sel_initWithPageComponent_, v4);
  v6 = v5;
  if (v5)
    -[SKUICarouselPageSection _reloadViewElementProperties](v5, "_reloadViewElementProperties");

  return v6;
}

- (void)dealloc
{
  NSObject *cycleTimer;
  objc_super v4;

  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
    dispatch_source_cancel(cycleTimer);
  -[UICollectionView setDataSource:](self->_carouselCollectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_carouselCollectionView, "setDelegate:", 0);
  -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection dealloc](&v4, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[SKUICarouselPageSection _indexPathIsProgressIndicator:](self, "_indexPathIsProgressIndicator:", a3))
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItemViewElement:", v8);

    -[UICollectionView indexPathsForVisibleItems](self->_carouselCollectionView, "indexPathsForVisibleItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "item")% -[NSArray count](self->_modelObjects, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addItemViewElement:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSIndexPath *reloadIndexPath;
  UICollectionView *carouselCollectionView;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  NSIndexPath *v17;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  -[SKUICarouselPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  v5 = a3 == 2 && !self->_needsReload;
  v6 = !v5;
  self->_needsReload = v6;
  if (!v5)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "updateType");

    if ((unint64_t)(v9 - 3) <= 1)
    {
      reloadIndexPath = self->_reloadIndexPath;
      self->_reloadIndexPath = 0;
LABEL_12:

      goto LABEL_13;
    }
    carouselCollectionView = self->_carouselCollectionView;
    if (carouselCollectionView)
    {
      -[UICollectionView bounds](carouselCollectionView, "bounds");
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
      MidX = CGRectGetMidX(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      -[UICollectionView indexPathForItemAtPoint:](self->_carouselCollectionView, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v21));
      v17 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      reloadIndexPath = self->_reloadIndexPath;
      self->_reloadIndexPath = v17;
      goto LABEL_12;
    }
  }
LABEL_13:
  v19.receiver = self;
  v19.super_class = (Class)SKUICarouselPageSection;
  return -[SKUIStorePageSection applyUpdateType:](&v19, sel_applyUpdateType_, a3);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUICarouselPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v13, sel_backgroundColorForIndexPath_, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  SKUIProgressIndicatorViewElement *progressIndicatorElement;
  void *v11;
  void *v12;
  NSIndexPath *reloadIndexPath;
  NSIndexPath *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int64_t v27;
  float v28;
  double v29;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKUICarouselPageSection _indexPathIsProgressIndicator:](self, "_indexPathIsProgressIndicator:", v4);
  objc_msgSend(v5, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73AA1F0, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    progressIndicatorElement = self->_progressIndicatorElement;
    objc_msgSend(v5, "activePageWidth");
    objc_msgSend(v9, "reloadWithViewElement:width:context:", progressIndicatorElement, self->_cellLayoutContext);
    objc_msgSend(v9, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v9, "setCurrentPage:", -[SKUICarouselPageSection _currentPageIndex](self, "_currentPageIndex"));
    objc_msgSend(v9, "setNumberOfPages:", -[NSArray count](self->_modelObjects, "count"));
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B7D10, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (self->_needsReload)
    {
      objc_msgSend(v11, "reloadData");
      self->_needsReload = 0;
      reloadIndexPath = self->_reloadIndexPath;
      if (reloadIndexPath)
      {
        -[SKUICarouselPageSection _scrollToItemAtIndexPath:animated:](self, "_scrollToItemAtIndexPath:animated:", reloadIndexPath, 0);
        v14 = self->_reloadIndexPath;
        self->_reloadIndexPath = 0;

      }
    }
    objc_msgSend(v9, "setCollectionView:", v12);
    objc_msgSend(v9, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v9, "setRendersWithPerspective:", 0);
    objc_msgSend(v9, "setRendersWithParallax:", 0);
    -[SKUIStorePageSection context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activePageWidth");
    v17 = v16;

    -[SKUICarouselPageSection _actualContentWidth](self, "_actualContentWidth");
    v19 = v18;
    -[SKUIStorePageSection context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activePageWidth");
    v22 = v21 + v21;

    if (v19 <= v22)
    {
      objc_msgSend(v12, "contentInset");
      v24 = v23;
      v26 = v25;
      v27 = -[NSArray count](self->_modelObjects, "count");
      v28 = (v17 - v19) * 0.5;
      v29 = fmaxf(floorf(v28), 0.0);
      objc_msgSend(v12, "setAlwaysBounceHorizontal:", v27 > 1);
      objc_msgSend(v12, "setContentInset:", v24, v29, v26, v29);
    }
    -[SKUICarouselPageSection _startCycleTimerIfNecessary](self, "_startCycleTimerIfNecessary");

  }
  return v9;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat height;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePageWidth");
  v7 = v6;

  if (-[SKUICarouselPageSection _indexPathIsProgressIndicator:](self, "_indexPathIsProgressIndicator:", v4))
  {
    +[SKUIPageControlCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIPageControlCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", self->_progressIndicatorElement, self->_cellLayoutContext, v7);
    height = v8;
  }
  else
  {
    if (self->_needsHeightCalculation)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = self->_modelObjects;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        v14 = 0.0;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            -[objc_class sizeThatFitsWidth:viewElement:context:](-[SKUICarouselPageSection _cellClassForViewElement:](self, "_cellClassForViewElement:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21), "sizeThatFitsWidth:viewElement:context:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), self->_cellLayoutContext, self->_itemSize.width);
            if (v14 < v16)
              v14 = v16;
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }
      else
      {
        v14 = 0.0;
      }

      self->_itemSize.height = v14;
      self->_needsHeightCalculation = 0;
      -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "collectionViewLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setItemSize:", self->_itemSize.width, self->_itemSize.height);
    }
    height = self->_itemSize.height;
  }

  v19 = v7;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (!-[SKUICarouselPageSection _indexPathIsProgressIndicator:](self, "_indexPathIsProgressIndicator:", v4))
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeMetricsImpressionSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  }
  v9.receiver = self;
  v9.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (!-[SKUICarouselPageSection _indexPathIsProgressIndicator:](self, "_indexPathIsProgressIndicator:", v4))
  {
    -[SKUICarouselPageSection _cancelCycleTimer](self, "_cancelCycleTimer");
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeMetricsImpressionSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  }
  v9.receiver = self;
  v9.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)defaultItemPinningStyle
{
  objc_super v4;

  if (-[SKUIStorePageSection isTopSection](self, "isTopSection"))
    return 3;
  v4.receiver = self;
  v4.super_class = (Class)SKUICarouselPageSection;
  return -[SKUIStorePageSection defaultItemPinningStyle](&v4, sel_defaultItemPinningStyle);
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_modelObjects;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[objc_class requestLayoutForViewElement:width:context:](-[SKUICarouselPageSection _cellClassForViewElement:](self, "_cellClassForViewElement:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12)), "requestLayoutForViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), self->_cellLayoutContext, self->_itemSize.width);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13.receiver = self;
  v13.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection entityProvider:didInvalidateWithContext:](&v13, sel_entityProvider_didInvalidateWithContext_, v6, v7);

}

- (void)invalidateCachedLayoutInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    self->_needsHeightCalculation = 1;
  v5.receiver = self;
  v5.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection invalidateCachedLayoutInformation](&v5, sel_invalidateCachedLayoutInformation);
}

- (int64_t)numberOfCells
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_modelObjects, "count");
  if (self->_progressIndicatorElement)
    return 2;
  else
    return v3 != 0;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_modelObjects;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (v6)
        {
          -[objc_class prefetchResourcesForViewElement:reason:context:](-[SKUICarouselPageSection _cellClassForViewElement:](self, "_cellClassForViewElement:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)), "prefetchResourcesForViewElement:reason:context:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a3, self->_cellLayoutContext);
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "artworkForSize:", self->_itemSize.width, self->_itemSize.height);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIViewElementLayoutContext loadImageForArtwork:reason:](self->_cellLayoutContext, "loadImageForArtwork:reason:", v12, a3);

        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (!v6)
    -[SKUICarouselPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", 0, a3);
  v13.receiver = self;
  v13.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection prefetchResourcesWithReason:](&v13, sel_prefetchResourcesWithReason_, a3);

}

- (UIEdgeInsets)sectionContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  UIEdgeInsets result;

  if (!self->_progressIndicatorElement || self->_progressIndicatorCellIndex != 1)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "valueForStyle:", *MEMORY[0x1E0D3A5B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(v9, "valueForStyle:", CFSTR("itml-padding"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v20.receiver = self;
        v20.super_class = (Class)SKUICarouselPageSection;
        -[SKUIStorePageSection sectionContentInset](&v20, sel_sectionContentInset);
        goto LABEL_8;
      }
    }
    objc_msgSend(v9, "elementPadding");
LABEL_8:
    v3 = v12;
    v4 = v13;
    v5 = v14;
    v6 = v15;

    goto LABEL_9;
  }
  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
LABEL_9:
  v16 = v3;
  v17 = v4;
  v18 = v5;
  v19 = v6;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SKUIViewElementLayoutContext *v6;
  SKUIViewElementLayoutContext *cellLayoutContext;
  void *v8;
  void *v9;
  int *v10;
  int *v11;
  float64x2_t *p_itemSize;
  double itemWidth;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  float64_t v25;
  float64x2_t v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  double v32;
  double v33;
  void *v34;
  double *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  _BOOL8 v48;
  void *v49;
  float v50;
  void *v51;
  void *v52;
  SKUIViewElementLayoutContext *v53;
  objc_super v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AA1F0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7D10);
  v53 = self->_cellLayoutContext;
  v6 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v53);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v6;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", objc_msgSend(v9, "elementType"));
  v10 = &OBJC_IVAR___SKUIItemOffer__fileSize;
  v11 = &OBJC_IVAR___SKUIItemOffer__fileSize;
  v52 = v9;
  if (v9)
  {
    v51 = v5;
    p_itemSize = (float64x2_t *)&self->_itemSize;
    self->_itemSize = (CGSize)*MEMORY[0x1E0C9D820];
    itemWidth = self->_itemWidth;
    if (itemWidth > 0.0)
      p_itemSize->f64[0] = itemWidth;
    self->_needsHeightCalculation = 1;
    objc_msgSend(v9, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "elementPadding");
    v16 = v15;
    v18 = v17;

    if (v16 >= v18)
      v19 = v16;
    else
      v19 = v18;
    self->_itemSpacing = v19;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v20 = self->_modelObjects;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v60 != v23)
            objc_enumerationMutation(v20);
          -[objc_class preferredSizeForViewElement:context:](-[SKUICarouselPageSection _cellClassForViewElement:](self, "_cellClassForViewElement:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i)), "preferredSizeForViewElement:context:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), self->_cellLayoutContext);
          v26.f64[1] = v25;
          *(int8x16_t *)p_itemSize = vbslq_s8((int8x16_t)vcgtq_f64(v26, *p_itemSize), (int8x16_t)v26, *(int8x16_t *)p_itemSize);
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v22);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v27 = self->_modelObjects;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    v5 = v51;
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v56 != v30)
            objc_enumerationMutation(v27);
          -[objc_class requestLayoutForViewElement:width:context:](-[SKUICarouselPageSection _cellClassForViewElement:](self, "_cellClassForViewElement:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j)), "requestLayoutForViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j), self->_cellLayoutContext, p_itemSize->f64[0]);
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v29);
    }

    v11 = &OBJC_IVAR___SKUIItemOffer__fileSize;
    v10 = &OBJC_IVAR___SKUIItemOffer__fileSize;
  }
  else
  {
    -[SKUICarouselPageSection _reloadLegacySizing](self, "_reloadLegacySizing");
  }
  objc_msgSend(v4, "activePageWidth");
  v33 = v32;
  -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSemanticContentAttribute:", storeSemanticContentAttribute());
  v35 = (double *)((char *)self + v10[942]);
  objc_msgSend(v34, "setFrame:", 0.0, 0.0, v33, v35[1]);
  objc_msgSend(v34, "collectionViewLayout");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setItemSize:", *v35, v35[1]);
  v37 = v11[936];
  v38 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v37), "count");
  if (v38)
  {
    v39 = v38;
    objc_msgSend(v34, "contentInset");
    v41 = v40;
    v43 = v42;
    -[SKUICarouselPageSection _actualContentWidth](self, "_actualContentWidth");
    v45 = v44;
    if (v44 <= v33 + v33)
    {
      v46 = 0;
      self->_cellCount = objc_msgSend(*(id *)((char *)&self->super.super.isa + v37), "count");
      v50 = (v33 - v45) * 0.5;
      v47 = fmaxf(floorf(v50), 15.0);
      v48 = v39 > 1;
    }
    else
    {
      self->_cellCount = 100000;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 20000 / v39 * v39, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0.0;
      v48 = 1;
    }
    v49 = v52;
    objc_msgSend(v34, "setAlwaysBounceHorizontal:", v48);
    objc_msgSend(v34, "setContentInset:", v41, v47, v43, v47);
    if (v46)
    {
      if (self->_needsReload)
      {
        if (!self->_reloadIndexPath)
          objc_storeStrong((id *)&self->_reloadIndexPath, v46);
      }
      else
      {
        -[SKUICarouselPageSection _scrollToItemAtIndexPath:animated:](self, "_scrollToItemAtIndexPath:animated:", v46, 0);
      }
    }

  }
  else
  {
    self->_cellCount = 0;
    *v35 = v33;
    v35[1] = 20.0;
    v49 = v52;
  }
  v54.receiver = self;
  v54.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v54, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat v17;
  CGFloat v18;
  double MidX;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL8 v31;
  float v32;
  void *v33;
  uint64_t v34;
  id v35;
  double v36;
  objc_super v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  SKUICarouselPageSection *v41;
  double v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = -[NSArray count](self->_modelObjects, "count");
  if (v8 >= 1)
  {
    v9 = v8;
    v36 = height;
    -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInset");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v10, "bounds");
    x = v44.origin.x;
    y = v44.origin.y;
    v17 = v44.size.width;
    v18 = v44.size.height;
    MidX = CGRectGetMidX(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = v17;
    v45.size.height = v18;
    objc_msgSend(v10, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v45));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "item");

    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "viewElement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[SKUICarouselPageSection _reloadLegacySizing](self, "_reloadLegacySizing");
      -[SKUICarouselPageSection prefetchResourcesWithReason:](self, "prefetchResourcesWithReason:", 0);
    }
    v24 = v21 % (uint64_t)v9;
    -[SKUIStorePageSection context](self, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activePageWidth");
    v27 = v26;

    -[SKUICarouselPageSection _actualContentWidth](self, "_actualContentWidth");
    v29 = v28;
    if (v28 <= v27 + v27)
    {
      self->_cellCount = -[NSArray count](self->_modelObjects, "count");
      v32 = (v27 - v29) * 0.5;
      v30 = fmaxf(floorf(v32), 0.0);
      v31 = v9 > 1;
    }
    else
    {
      self->_cellCount = 100000;
      v24 += 0x4E20 / v9 * v9;
      v30 = 0.0;
      v31 = 1;
    }
    height = v36;
    objc_msgSend(v10, "setAlwaysBounceHorizontal:", v31);
    objc_msgSend(v10, "setContentInset:", v12, v30, v14, v30);
    v33 = (void *)MEMORY[0x1E0DC3F10];
    v34 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __74__SKUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke;
    v39[3] = &unk_1E73A3520;
    v42 = v27;
    v40 = v10;
    v41 = self;
    v43 = v24;
    v35 = v10;
    objc_msgSend(v33, "performWithoutAnimation:", v39);
    -[SKUICarouselPageSection _cancelCycleTimer](self, "_cancelCycleTimer");
    v38[0] = v34;
    v38[1] = 3221225472;
    v38[2] = __74__SKUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v38[3] = &unk_1E739FF90;
    v38[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v38);

  }
  v37.receiver = self;
  v37.super_class = (Class)SKUICarouselPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v37, sel_willTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __74__SKUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItemSize:", *(double *)(*(_QWORD *)(a1 + 40) + 120), *(double *)(*(_QWORD *)(a1 + 40) + 128));
  objc_msgSend(v2, "setMinimumInteritemSpacing:", *(double *)(*(_QWORD *)(a1 + 40) + 136));
  objc_msgSend(v2, "setMinimumLineSpacing:", *(double *)(*(_QWORD *)(a1 + 40) + 136));
  objc_msgSend(v2, "invalidateLayout");
  objc_msgSend(*(id *)(a1 + 32), "reloadData");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_scrollToItemAtIndexPath:animated:", v3, 0);
  v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItemsAtIndexPaths:", v5);

}

uint64_t __74__SKUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startCycleTimerIfNecessary");
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UICollectionView indexPathsForVisibleItems](self->_carouselCollectionView, "indexPathsForVisibleItems");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      -[UICollectionView cellForItemAtIndexPath:](self->_carouselCollectionView, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "setImage:forArtworkRequest:context:", v7, v6, self->_cellLayoutContext);

      if ((v14 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithMissingItems:", v7);

  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "item");
  v9 = v8 % -[NSArray count](self->_modelObjects, "count");
  -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SKUICarouselPageSection _dequeueCellForViewElement:collectionView:indexPath:](self, "_dequeueCellForViewElement:collectionView:indexPath:", v10, v7, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "reloadWithViewElement:width:context:", v10, self->_cellLayoutContext, self->_itemSize.width);
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73AA4B0, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "reloadWithCarouselItem:size:context:", v10, self->_cellLayoutContext, self->_itemSize.width, self->_itemSize.height);
    -[SKUIStorePageSection context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metricsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activeImpressionsSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[SKUICarouselPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", v9, v16);
    -[SKUICarouselPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", v9, 1);

  }
  return v13;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return self->_cellCount;
}

- (void)collectionView:(id)a3 carouselLayout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSArray *modelObjects;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a5;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_3;
  modelObjects = self->_modelObjects;
  objc_msgSend(v7, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](modelObjects, "objectAtIndex:", objc_msgSend(v11, "item") % -[NSArray count](self->_modelObjects, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ikBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_3:
    objc_msgSend(v16, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setBackgroundColor:", v15);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "item");
  v9 = v8 % -[NSArray count](self->_modelObjects, "count");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewElement");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v11, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }
  else
  {
    objc_msgSend(v11, "link");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v12, *MEMORY[0x1E0DAFC98], v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[SKUIStorePageSection context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metricsController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recordEvent:", v13);

    }
    -[SKUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v12);

  }
  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[SKUICarouselPageSection _isItemEnabledAtIndexPath:](self, "_isItemEnabledAtIndexPath:", a4);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return -[SKUICarouselPageSection _isItemEnabledAtIndexPath:](self, "_isItemEnabledAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", objc_msgSend(a5, "item", a3, a4) % -[NSArray count](self->_modelObjects, "count"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeMetricsImpressionSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginActiveImpressionForViewElement:", v8);

  objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 9, 1, 1, 0, 0);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  if (-[NSArray count](self->_modelObjects, "count"))
  {
    -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", objc_msgSend(v9, "item") % -[NSArray count](self->_modelObjects, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeMetricsImpressionSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

    objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 10, 1, 1, 0, 0);
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_progressIndicatorElement)
  {
    -[SKUIStorePageSection context](self, "context", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", self->_progressIndicatorCellIndex, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setCurrentPage:", -[SKUICarouselPageSection _currentPageIndex](self, "_currentPageIndex"));
  }
  -[SKUICarouselPageSection _startCycleTimerIfNecessary](self, "_startCycleTimerIfNecessary", a3);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_progressIndicatorElement)
  {
    -[SKUIStorePageSection context](self, "context", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", self->_progressIndicatorCellIndex, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setCurrentPage:", -[SKUICarouselPageSection _currentPageIndex](self, "_currentPageIndex"));
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  NSObject *cycleTimer;
  OS_dispatch_source *v5;

  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    dispatch_source_cancel(cycleTimer);
    v5 = self->_cycleTimer;
    self->_cycleTimer = 0;

  }
}

- (double)_actualContentWidth
{
  uint64_t v3;
  double result;

  v3 = -[NSArray count](self->_modelObjects, "count");
  result = self->_itemSize.width * (double)v3;
  if (v3 >= 2)
    return result + (double)(v3 - 1) * self->_itemSpacing;
  return result;
}

- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4
{
  NSArray *modelObjects;
  id v6;
  id v7;

  modelObjects = self->_modelObjects;
  v6 = a4;
  -[NSArray objectAtIndex:](modelObjects, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v7, "carouselItemIdentifier"));

}

- (void)_cancelCycleTimer
{
  NSObject *cycleTimer;
  OS_dispatch_source *v4;

  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    dispatch_source_cancel(cycleTimer);
    v4 = self->_cycleTimer;
    self->_cycleTimer = 0;

  }
}

- (id)_carouselCollectionView
{
  UICollectionView *carouselCollectionView;
  SKUICarouselCollectionViewLayout *v4;
  id v5;
  UICollectionView *v6;
  UICollectionView *v7;
  void *v8;
  UICollectionView *v9;
  void *v10;

  carouselCollectionView = self->_carouselCollectionView;
  if (!carouselCollectionView)
  {
    v4 = objc_alloc_init(SKUICarouselCollectionViewLayout);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v4, "setMinimumInteritemSpacing:", self->_itemSpacing);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", self->_itemSpacing);
    -[UICollectionViewFlowLayout setScrollDirection:](v4, "setScrollDirection:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_carouselCollectionView;
    self->_carouselCollectionView = v6;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_carouselCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B36D0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_carouselCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BD8F0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_carouselCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7A90);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_carouselCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AA4B0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_carouselCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B2830);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_carouselCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AE590);
    -[UICollectionView setDataSource:](self->_carouselCollectionView, "setDataSource:", self);
    -[UICollectionView setDecelerationRate:](self->_carouselCollectionView, "setDecelerationRate:", 0.7);
    -[UICollectionView setDelegate:](self->_carouselCollectionView, "setDelegate:", self);
    -[UICollectionView setScrollsToTop:](self->_carouselCollectionView, "setScrollsToTop:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_carouselCollectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](self->_carouselCollectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setSemanticContentAttribute:](self->_carouselCollectionView, "setSemanticContentAttribute:", storeSemanticContentAttribute());
    -[UICollectionView setPrefetchingEnabled:](self->_carouselCollectionView, "setPrefetchingEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_carouselCollectionView;
    -[SKUICarouselPageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    carouselCollectionView = self->_carouselCollectionView;
  }
  return carouselCollectionView;
}

- (Class)_cellClassForLockup:(id)a3
{
  void *v3;

  if ((unint64_t)objc_msgSend(a3, "lockupViewType") <= 8)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (Class)_cellClassForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0;
  if (v5 > 65)
  {
    if (v5 == 66)
    {
      -[SKUICarouselPageSection _cellClassForLockup:](self, "_cellClassForLockup:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (v5 != 152)
      goto LABEL_10;
LABEL_7:
    objc_opt_class();
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v7;
    goto LABEL_10;
  }
  if (v5 == 14 || v5 == 49)
    goto LABEL_7;
LABEL_10:

  return (Class)v6;
}

- (int64_t)_currentPageIndex
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  CGRect v13;
  CGRect v14;

  -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  objc_msgSend(v3, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v14));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "item");
  v11 = v10 % -[NSArray count](self->_modelObjects, "count");

  return v11;
}

- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(a3, "lockupViewType");
  if (v9 > 8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", *off_1E73A3988[v9], v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_dequeueCellForViewElement:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "elementType");
  v12 = 0;
  if (v11 <= 48)
  {
    if (v11 == 14)
    {
      objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B36D0, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setArtworkBoundingSize:", 0);
      objc_msgSend(v12, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
      goto LABEL_13;
    }
    if (v11 == 28)
    {
      v13 = CFSTR("SKUICounterReuseIdentifier");
      goto LABEL_9;
    }
  }
  else
  {
    switch(v11)
    {
      case 49:
        goto LABEL_5;
      case 66:
        -[SKUICarouselPageSection _dequeueCellForLockup:collectionView:indexPath:](self, "_dequeueCellForLockup:collectionView:indexPath:", v8, v9, v10);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 152:
LABEL_5:
        v13 = CFSTR("SKUIImageReuseIdentifier");
LABEL_9:
        objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v10);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v12 = (void *)v14;
        break;
    }
  }
LABEL_13:

  return v12;
}

- (void)_fireCycleTimer
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  objc_msgSend(v11, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v13));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "item");

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9 + 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICarouselPageSection _scrollToItemAtIndexPath:animated:](self, "_scrollToItemAtIndexPath:animated:", v10, 1);

}

- (BOOL)_indexPathIsProgressIndicator:(id)a3
{
  return self->_progressIndicatorElement && objc_msgSend(a3, "item") == self->_progressIndicatorCellIndex;
}

- (BOOL)_isItemEnabledAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", objc_msgSend(v4, "item") % -[NSArray count](self->_modelObjects, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEnabled");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (CGSize)_legacyItemSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  -[SKUIStorePageSection context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activePageWidth");
  v4 = v3;
  objc_msgSend(v2, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SKUIUserInterfaceIdiom(v5);

  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    if (v4 >= v9)
    {
      *(double *)&v10 = 260.0;
      *(double *)&v11 = 530.0;
      goto LABEL_12;
    }
    if (v4 >= v9 * 0.666666687)
    {
      *(double *)&v10 = 195.0;
      *(double *)&v11 = 398.0;
      goto LABEL_12;
    }
    *(double *)&v10 = 130.0;
  }
  else
  {
    *(double *)&v10 = 130.0;
    if (v4 >= 736.0)
    {
      *(double *)&v11 = 265.0;
      goto LABEL_12;
    }
    *(double *)&v11 = 375.0;
    if (v4 >= 375.0)
    {
      *(double *)&v10 = 152.0;
      goto LABEL_12;
    }
  }
  *(double *)&v11 = 320.0;
LABEL_12:

  v12 = *(double *)&v11;
  v13 = *(double *)&v10;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)_legacyItemSpacing
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[SKUIStorePageSection context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activePageWidth");
  v4 = v3;
  objc_msgSend(v2, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SKUIUserInterfaceIdiom(v5);

  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    v10 = v9 * 0.5;
    v11 = 5.0;
  }
  else
  {
    v11 = 3.0;
    v10 = 736.0;
  }
  if (v4 >= v10)
    v12 = v11;
  else
    v12 = 0.0;

  return v12;
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMissingItemData"))
  {
    -[SKUICarouselPageSection _missingItemLoader](self, "_missingItemLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadItemsForPageComponent:startIndex:reason:", v8, a3, a4);

  }
}

- (id)_missingItemLoader
{
  SKUIMissingItemLoader *missingItemLoader;
  SKUIMissingItemLoader *v4;
  void *v5;
  void *v6;
  SKUIMissingItemLoader *v7;
  SKUIMissingItemLoader *v8;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SKUIMissingItemLoader alloc];
    -[SKUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v6);
    v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (void)_reloadLegacySizing
{
  CGSize *p_itemSize;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  SKUIViewElementLayoutContext *cellLayoutContext;
  id v9;

  p_itemSize = &self->_itemSize;
  -[SKUICarouselPageSection _legacyItemSize](self, "_legacyItemSize");
  p_itemSize->width = v4;
  p_itemSize->height = v5;
  -[SKUICarouselPageSection _legacyItemSpacing](self, "_legacyItemSpacing");
  self->_itemSpacing = v6;
  v7 = 1.0;
  if (v6 <= 0.00000011920929)
    v7 = 0.0;
  cellLayoutContext = self->_cellLayoutContext;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", 0.0, v7, 1.0, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](cellLayoutContext, "setAggregateValue:forKey:", v9, 0x1E73AA490);

}

- (void)_reloadViewElementProperties
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  NSArray *v8;
  NSArray *modelObjects;
  SKUIProgressIndicatorViewElement *v10;
  SKUIProgressIndicatorViewElement *progressIndicatorElement;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  int64_t v15;
  id v16;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }
  self->_itemWidth = v7;
  if (v3)
  {
    objc_msgSend(v3, "flattenedChildren");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    modelObjects = self->_modelObjects;
    self->_modelObjects = v8;

    objc_msgSend(v3, "progressIndicatorElement");
    v10 = (SKUIProgressIndicatorViewElement *)objc_claimAutoreleasedReturnValue();
    progressIndicatorElement = self->_progressIndicatorElement;
    self->_progressIndicatorElement = v10;
  }
  else
  {
    objc_msgSend(v16, "carouselItems");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_modelObjects;
    self->_modelObjects = v12;

    progressIndicatorElement = self->_progressIndicatorElement;
    self->_progressIndicatorElement = 0;
  }

  -[SKUIProgressIndicatorViewElement style](self->_progressIndicatorElement, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "elementPosition") != 2;

  self->_progressIndicatorCellIndex = v15;
}

- (void)_startCycleTimerIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *cycleTimer;
  double v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (!self->_cycleTimer)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cycleInterval");
    v5 = v4;

    if (v5 > 2.22044605e-16)
    {
      -[SKUICarouselPageSection _actualContentWidth](self, "_actualContentWidth");
      v7 = v6;
      -[SKUIStorePageSection context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activePageWidth");
      v10 = v9 + v9;

      if (v7 > v10)
      {
        v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        cycleTimer = self->_cycleTimer;
        self->_cycleTimer = v11;

        v13 = v5 * 1000000000.0;
        v14 = self->_cycleTimer;
        v15 = dispatch_time(0, (uint64_t)v13);
        dispatch_source_set_timer(v14, v15, (unint64_t)v13, 0);
        objc_initWeak(&location, self);
        v16 = self->_cycleTimer;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __54__SKUICarouselPageSection__startCycleTimerIfNecessary__block_invoke;
        v17[3] = &unk_1E739FF68;
        objc_copyWeak(&v18, &location);
        dispatch_source_set_event_handler(v16, v17);
        dispatch_resume((dispatch_object_t)self->_cycleTimer);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __54__SKUICarouselPageSection__startCycleTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fireCycleTimer");

}

- (void)_scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", 0);

  if (objc_msgSend(v9, "row") < v7)
  {
    -[SKUICarouselPageSection _carouselCollectionView](self, "_carouselCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 16, v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadIndexPath, 0);
  objc_storeStrong((id *)&self->_progressIndicatorElement, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_cycleTimer, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_carouselCollectionView, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICarouselPageSection initWithPageComponent:]";
}

@end
