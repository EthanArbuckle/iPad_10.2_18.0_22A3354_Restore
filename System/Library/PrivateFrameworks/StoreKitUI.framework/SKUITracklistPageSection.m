@implementation SKUITracklistPageSection

- (SKUITracklistPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUITracklistPageSection *v5;
  SKUITracklistPageSection *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITracklistPageSection initWithPageComponent:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUITracklistPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v8, sel_initWithPageComponent_, v4);
  v6 = v5;
  if (v5)
    -[SKUITracklistPageSection _reloadEntityProvider](v5, "_reloadEntityProvider");

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v9);

  v10 = objc_msgSend(v7, "item");
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v11);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUITracklistPageSection;
  v4 = -[SKUIStorePageSection applyUpdateType:](&v6, sel_applyUpdateType_, a3);
  if (v4 != (id)2)
    -[SKUITracklistPageSection _reloadEntityProvider](self, "_reloadEntityProvider");
  return (int64_t)v4;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ikBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUITracklistPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v12, sel_backgroundColorForIndexPath_, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", objc_msgSend(v4, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "elementType") == 146)
    {
      objc_msgSend(v5, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (uint64_t *)&SKUITracklistLockupCollectionViewCellReuseIdentifier;
    }
    else
    {
      -[SKUIStorePageSection pageComponent](self, "pageComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "viewElement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "header");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = &SKUITracklistSectionHeaderReuseIdentifier;
      if (v7 == v17)
        v9 = &SKUITracklistHeaderReuseIdentifier;
    }
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", *v9, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "activePageWidth");
    objc_msgSend(v11, "reloadWithViewElement:width:context:", v7, self->_cellLayoutContext, v18 + -30.0);
  }
  else
  {
    objc_msgSend(v5, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73BCD10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColoringWithStyle:", v14);

    objc_msgSend(v11, "setLeftEdgeInset:", 0.0);
    objc_msgSend(v11, "setRightEdgeInset:", 0.0);
    objc_msgSend(v11, "setVerticalAlignment:", 1);
  }

  return v11;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __objc2_class **v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePageWidth");
  v7 = v6;

  v8 = objc_msgSend(v4, "item");
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "elementType") == 146)
    {
      v11 = off_1E739E6B8;
    }
    else
    {
      -[SKUIStorePageSection pageComponent](self, "pageComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "header");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = off_1E739E6C8;
      if (v10 == v15)
        v11 = off_1E739E6B0;
    }
    -[__objc2_class sizeThatFitsWidth:viewElement:context:](*v11, "sizeThatFitsWidth:viewElement:context:", v10, self->_cellLayoutContext, v7 + -30.0);
    v12 = v16;
  }
  else
  {
    v12 = 15.0;
  }

  v17 = v7;
  v18 = v12;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char, char);
  void *v15;
  SKUITracklistPageSection *v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEnabled"))
  {
    -[SKUIStorePageSection context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
    v15 = &unk_1E73A8208;
    v16 = self;
    v17 = v8;
    v18 = v4;
    v19 = v5;
    v9 = v8;
    objc_msgSend(v19, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, &v12);

  }
  else
  {
    objc_msgSend(v5, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x1E73B7150, 0x1E73B7170, 1, 0, 0, 0);
  }
  -[SKUIStorePageSection context](self, "context", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v4, 0);

}

void __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  char v11;
  char v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E73A81E0;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[1] = 3221225472;
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  v11 = a2;
  v12 = a3;
  v10 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__SKUITracklistPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 48))
    && (!*(_BYTE *)(a1 + 64) || !*(_BYTE *)(a1 + 65))
    && objc_msgSend(*(id *)(a1 + 56), "elementType") == 146)
  {
    objc_msgSend(*(id *)(a1 + 40), "togglePreviewPlaybackAnimated:", 1);
  }

}

- (void)collectionViewWillScrollToOffset:(CGPoint)a3 visibleRange:(SKUIIndexPathRange *)a4
{
  double y;
  double x;
  int64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;

  y = a3.y;
  x = a3.x;
  v8 = -[SKUITracklistPageSection numberOfCells](self, "numberOfCells");
  if (self->_lastNeedsMoreCount < v8)
  {
    v9 = v8;
    v10 = *(_OWORD *)&a4->var2;
    v17 = *(_OWORD *)&a4->var0;
    v18 = v10;
    v11 = -[SKUIStorePageSection itemRangeForIndexPathRange:](self, "itemRangeForIndexPathRange:", &v17);
    if (v12 + v11 + 30 >= v9)
    {
      self->_lastNeedsMoreCount = v9;
      -[SKUIStorePageSection pageComponent](self, "pageComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUITracklistPageSection;
  v15 = *(_OWORD *)&a4->var2;
  v17 = *(_OWORD *)&a4->var0;
  v18 = v15;
  -[SKUIStorePageSection collectionViewWillScrollToOffset:visibleRange:](&v16, sel_collectionViewWillScrollToOffset_visibleRange_, &v17, x, y);
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMetricsImpressionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v8);
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", objc_msgSend(v4, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v10, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMetricsImpressionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endActiveImpressionForViewElement:", v8);
  -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", objc_msgSend(v4, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endActiveImpressionForViewElement:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v10, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  SKUITracklistColumnData *columnData;
  id v7;
  id v8;
  objc_super v9;

  columnData = self->_columnData;
  v7 = a4;
  v8 = a3;
  -[SKUITracklistPageSection _requestCellLayoutWithColumnData:](self, "_requestCellLayoutWithColumnData:", columnData);
  v9.receiver = self;
  v9.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection entityProvider:didInvalidateWithContext:](&v9, sel_entityProvider_didInvalidateWithContext_, v8, v7);

}

- (id)firstAppearanceIndexPath
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[SKUITracklistPageSection numberOfCells](self, "numberOfCells");
  if (v3 < 1)
  {
    v7 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 1;
    do
    {
      -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "elementType") == 146 && objc_msgSend(v6, "isSelected"))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5 - 1, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      if (v7)
        break;
    }
    while (v5++ < v4);
  }
  return v7;
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, SKUIModalSourceViewProvider *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  SKUIModalSourceViewProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = (void (**)(id, SKUIModalSourceViewProvider *))a4;
  v7 = -[SKUITracklistPageSection numberOfCells](self, "numberOfCells");
  if (v7 < 1)
  {
LABEL_5:
    v12 = 0;
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  v8 = v7;
  v9 = 0;
  while (1)
  {
    -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v20, "isDescendentFromViewElement:", v10);

    if ((v11 & 1) != 0)
      break;
    if (v8 == ++v9)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_6;
  v13 = objc_alloc_init(SKUIModalSourceViewProvider);
  -[SKUIModalSourceViewProvider setUserInfo:](v13, "setUserInfo:", v20);
  -[SKUIStorePageSection context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellForItemAtIndexPath:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "itmlID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewForElementIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = v18;
  else
    v19 = v16;
  -[SKUIModalSourceViewProvider setOriginalSourceView:](v13, "setOriginalSourceView:", v19);

LABEL_7:
  v6[2](v6, v13);

}

- (int64_t)numberOfCells
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "header");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 != 0;
  objc_msgSend(v3, "tracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v5 += objc_msgSend(v6, "count");
  }
  else
  {
    objc_msgSend(v3, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "flattenedChildren");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5 += objc_msgSend(v13, "count");

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
      v5 = v5 + objc_msgSend(v8, "count") - 1;

  }
  return v5;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = -[SKUITracklistPageSection numberOfCells](self, "numberOfCells");
  if (v5 <= 29 && self->_lastNeedsMoreCount < v5)
  {
    self->_lastNeedsMoreCount = v5;
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection prefetchResourcesWithReason:](&v8, sel_prefetchResourcesWithReason_, a3);
}

- (id)relevantEntityProviders
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection relevantEntityProviders](&v7, sel_relevantEntityProviders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_entityProvider)
  {
    if (v3)
    {
      objc_msgSend(v3, "setByAddingObject:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "activePageWidth");
    v9 = v8;
    -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", objc_msgSend(v11, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadWithViewElement:width:context:", v10, self->_cellLayoutContext, v9 + -30.0);

  }
}

- (BOOL)requestLayoutWithReloadReason:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  BOOL v12;
  SKUITracklistColumnData *columnData;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  SKUITracklistPageSection *v20;
  id v21;

  if (a3 != 2)
    return 0;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke;
  v19 = &unk_1E73A8258;
  v20 = self;
  v7 = v6;
  v21 = v7;
  objc_msgSend(v5, "enumerateTracksUsingBlock:", &v16);
  -[SKUITracklistPageSection _widthForButtonElements:](self, "_widthForButtonElements:", v7, v16, v17, v18, v19, v20);
  v9 = v8;
  -[SKUITracklistColumnData columnForIdentifier:](self->_columnData, "columnForIdentifier:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredWidth");
  v12 = v9 != v11;
  if (v9 != v11)
  {
    objc_msgSend(v10, "setPreferredWidth:", v9);
    columnData = self->_columnData;
    -[SKUIStorePageSection context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activePageWidth");
    -[SKUITracklistColumnData adjustColumnsToFitWidth:](columnData, "adjustColumnsToFitWidth:");

    -[SKUITracklistPageSection _requestCellLayoutWithColumnData:](self, "_requestCellLayoutWithColumnData:", self->_columnData);
  }

  return v12;
}

void __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke_2;
  v5[3] = &unk_1E73A8230;
  v6 = v3;
  objc_msgSend(v4, "enumerateColumnsForTrack:usingBlock:", a2, v5);

}

void __58__SKUITracklistPageSection_requestLayoutWithReloadReason___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5 && objc_msgSend(v6, "columnIdentifier") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);

}

- (UIEdgeInsets)sectionContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21;
  objc_super v22;
  UIEdgeInsets result;

  v22.receiver = self;
  v22.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection sectionContentInset](&v22, sel_sectionContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v21 = 0;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SKUIViewElementPaddingForStyle(v13, &v21);
  v16 = v15;

  if (v21)
    v17 = v14;
  else
    v17 = v4;
  if (v21)
    v18 = v16;
  else
    v18 = v8;
  v19 = v6;
  v20 = v10;
  result.right = v20;
  result.bottom = v18;
  result.left = v19;
  result.top = v17;
  return result;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[SKUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v12, "updateWithItemState:context:animated:", v8, self->_cellLayoutContext, v5);
  return v5;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SKUITracklistColumnData *columnData;
  SKUIViewElementLayoutContext *v7;
  SKUIViewElementLayoutContext *v8;
  SKUIViewElementLayoutContext *cellLayoutContext;
  void *v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BCD10);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BD870);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SKUITracklistLockupCollectionViewCellReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B1CF0);
  columnData = self->_columnData;
  self->_columnData = 0;

  v7 = self->_cellLayoutContext;
  v8 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v7);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v8;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SKUITracklistPageSection _columnData](self, "_columnData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", v10, 0x1E73B05F0);
  objc_msgSend(v4, "activePageWidth");
  objc_msgSend(v10, "adjustColumnsToFitWidth:");
  -[SKUITracklistPageSection _requestCellLayoutWithColumnData:](self, "_requestCellLayoutWithColumnData:", v10);
  v11.receiver = self;
  v11.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v11, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SKUITracklistColumnData *columnData;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  columnData = self->_columnData;
  v8 = a4;
  -[SKUIStorePageSection context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activePageWidth");
  -[SKUITracklistColumnData adjustColumnsToFitWidth:](columnData, "adjustColumnsToFitWidth:");

  -[SKUIViewElementLayoutContext setActivePageWidth:](self->_cellLayoutContext, "setActivePageWidth:", width);
  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", self->_columnData, 0x1E73B05F0);
  -[SKUITracklistPageSection _requestCellLayoutWithColumnData:](self, "_requestCellLayoutWithColumnData:", self->_columnData);
  v10.receiver = self;
  v10.super_class = (Class)SKUITracklistPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v10, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  SKUITracklistPageSection *v17;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__SKUITracklistPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_1E73A7F78;
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v17 = self;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  -[SKUITracklistPageSection _enumerateVisibleViewElementsUsingBlock:](self, "_enumerateVisibleViewElementsUsingBlock:", v13);

}

void __56__SKUITracklistPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forArtworkRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 88));

}

- (id)_columnData
{
  SKUITracklistColumnData *columnData;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  SKUITracklistPageSection *v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];

  columnData = self->_columnData;
  if (!columnData)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __39__SKUITracklistPageSection__columnData__block_invoke;
    v30[3] = &unk_1E73A82A8;
    v30[4] = self;
    v33 = v34;
    v9 = v6;
    v31 = v9;
    v10 = v7;
    v32 = v10;
    objc_msgSend(v5, "enumerateTracksUsingBlock:", v30);
    SKUIFontLimitedPreferredFontForTextStyle(20, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIFontPreferredFontForTextStyle(5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITracklistColumnData columns](self->_columnData, "columns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    v21 = 3221225472;
    v22 = __39__SKUITracklistPageSection__columnData__block_invoke_3;
    v23 = &unk_1E73A82D0;
    v14 = v10;
    v29 = v34;
    v24 = v14;
    v25 = self;
    v15 = v9;
    v26 = v15;
    v16 = v12;
    v27 = v16;
    v17 = v11;
    v28 = v17;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v20);

    objc_msgSend(v5, "header", v20, v21, v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[SKUITracklistColumnData enumerateColumnsForHeader:usingBlock:](self->_columnData, "enumerateColumnsForHeader:usingBlock:", v18, &__block_literal_global_51);

    _Block_object_dispose(v34, 8);
    columnData = self->_columnData;
  }
  return columnData;
}

void __39__SKUITracklistPageSection__columnData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  SKUITracklistColumnData *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  if (!v5)
  {
    v6 = -[SKUITracklistColumnData initWithRepresentativeTrack:]([SKUITracklistColumnData alloc], "initWithRepresentativeTrack:", v3);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 96);
    *(_QWORD *)(v7 + 96) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setInterColumnSpacing:", 15.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setLeftEdgeInset:", 15.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setRightEdgeInset:", 15.0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__SKUITracklistPageSection__columnData__block_invoke_2;
  v10[3] = &unk_1E73A8280;
  v9 = *(_QWORD *)(a1 + 56);
  v10[4] = v4;
  v13 = v9;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v5, "enumerateColumnsForTrack:usingBlock:", v3, v10);

}

void __39__SKUITracklistPageSection__columnData__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(a2, "columnIdentifier");
  if (v8 == 1)
  {
    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  }
  else
  {
    if (v8)
    {
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v17 = v7;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(a1 + 32), "_representativeStringForViewElement:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              if (!v16 || (v24 = objc_msgSend(v22, "length"), v24 > objc_msgSend(v16, "length")))
                objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v23, v9);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v19);
      }

    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "sizeForBadgeElement:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (*(double *)(v15 + 24) >= v14)
              v14 = *(double *)(v15 + 24);
            *(double *)(v15 + 24) = v14;
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v11);
      }
    }

  }
}

void __39__SKUITracklistPageSection__columnData__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  id v8;
  SKUIBarRatingView *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  id v16;

  v16 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v16, "columnIdentifier"))
  {
    case 0:
      v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      goto LABEL_4;
    case 1:
      objc_msgSend(v16, "setMaximumWidthFraction:", 0.3);
      objc_msgSend(*(id *)(a1 + 40), "_widthForButtonElements:", *(_QWORD *)(a1 + 48));
LABEL_4:
      objc_msgSend(v16, "setPreferredWidth:", v7);
      goto LABEL_12;
    case 2:
      if (!v6)
        goto LABEL_12;
      v8 = objc_alloc(MEMORY[0x1E0C99D80]);
      v9 = (SKUIBarRatingView *)objc_msgSend(v8, "initWithObjectsAndKeys:", *(_QWORD *)(a1 + 56), *MEMORY[0x1E0DC1138], 0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v9);
      objc_msgSend(v10, "size");
      *(float *)&v11 = v11;
      v12 = ceilf(*(float *)&v11);
      break;
    case 3:
      v9 = objc_alloc_init(SKUIBarRatingView);
      -[SKUIBarRatingView sizeThatFits:](v9, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      *(float *)&v13 = v13;
      objc_msgSend(v16, "setPreferredWidth:", ceilf(*(float *)&v13));
      goto LABEL_11;
    case 5:
      if (!v6)
        goto LABEL_12;
      v14 = objc_alloc(MEMORY[0x1E0C99D80]);
      v9 = (SKUIBarRatingView *)objc_msgSend(v14, "initWithObjectsAndKeys:", *(_QWORD *)(a1 + 64), *MEMORY[0x1E0DC1138], 0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v9);
      objc_msgSend(v10, "size");
      v12 = ceil(v15);
      break;
    default:
      goto LABEL_12;
  }
  objc_msgSend(v16, "setPreferredWidth:", v12);

LABEL_11:
LABEL_12:

}

void __39__SKUITracklistPageSection__columnData__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  id v10;

  v10 = a2;
  v4 = a3;
  if ((objc_msgSend(v10, "sizesToFit") & 1) == 0)
  {
    +[SKUITracklistHeaderCollectionViewCell sizeForHeaderTitleLabel:](SKUITracklistHeaderCollectionViewCell, "sizeForHeaderTitleLabel:", v4);
    v6 = v5;
    objc_msgSend(v10, "preferredWidth");
    v8 = v6;
    v9 = ceilf(v8);
    if (v7 < v9)
      v7 = v9;
    objc_msgSend(v10, "setPreferredWidth:", v7);
  }

}

- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__SKUITracklistPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke;
  v10[3] = &unk_1E73A8338;
  v11 = v4;
  v12 = v7;
  v10[4] = self;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __68__SKUITracklistPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "section") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_viewElementForIndex:", objc_msgSend(v4, "item"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (BOOL)_isDynamicTracklist
{
  return self->_entityProvider != 0;
}

- (void)_reloadEntityProvider
{
  void *v3;
  SKUIEntityProviding *v4;
  SKUIEntityProviding **p_entityProvider;
  id v6;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "explicitEntityProvider");
  v4 = (SKUIEntityProviding *)objc_claimAutoreleasedReturnValue();
  p_entityProvider = &self->_entityProvider;
  if (*p_entityProvider != v4 && (-[SKUIEntityProviding isEqual:](*p_entityProvider, "isEqual:", v4) & 1) == 0)
    objc_storeStrong((id *)p_entityProvider, v4);

}

- (id)_representativeStringForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  unint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0;
  if (v5 > 89)
  {
    if (v5 == 90)
    {
      objc_msgSend(v4, "flattenedChildren");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUITracklistPageSection _representativeStringForViewElement:](self, "_representativeStringForViewElement:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    if (v5 == 138)
    {
      v8 = v4;
      v11 = objc_msgSend(v8, "labelViewStyle");
      v6 = 0;
      if (v11 <= 3 && v11 != 2)
      {
        objc_msgSend(v8, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "string");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_10;
    }
    if (v5 != 141)
      goto LABEL_11;
LABEL_8:
    objc_msgSend(v4, "buttonText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((unint64_t)(v5 - 12) < 2)
    goto LABEL_8;
  if (v5 == 80)
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = v7;
    objc_msgSend(v7, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
LABEL_11:

  return v6;
}

- (void)_requestCellLayoutWithColumnData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "header");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activePageWidth");
  v9 = v8;
  objc_msgSend(v23, "leftEdgeInset");
  v11 = v10;
  objc_msgSend(v23, "rightEdgeInset");
  v13 = v12;

  v14 = -[SKUITracklistPageSection numberOfCells](self, "numberOfCells");
  if (v14 >= 1)
  {
    v15 = v14;
    v16 = 0;
    v17 = v9 - v11 - v13;
    v18 = (double)(uint64_t)vcvtps_s32_f32(v17);
    do
    {
      v19 = (void *)MEMORY[0x1BCCE6C7C]();
      -[SKUITracklistPageSection _viewElementForIndex:](self, "_viewElementForIndex:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "elementType");
      if (v21 == 146 || v21 == 48)
      {
        v22 = (void *)objc_opt_class();
        if (v22)
          objc_msgSend(v22, "requestLayoutForViewElement:width:context:", v20, self->_cellLayoutContext, v18);
      }

      objc_autoreleasePoolPop(v19);
      ++v16;
    }
    while (v15 != v16);
  }

}

- (id)_viewElementForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  int64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "header");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 >= 1 && v6)
  {

    --a3;
  }
  else if (v6)
  {
    goto LABEL_24;
  }
  objc_msgSend(v5, "tracks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (a3 >= (unint64_t)objc_msgSend(v8, "count"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v5, "sections");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "flattenedChildren", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");
          if (a3 <= v14)
          {
            if (a3 == v14)
            {
              v7 = 0;
            }
            else
            {
              objc_msgSend(v13, "objectAtIndex:", a3);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_22;
          }
          a3 += ~v14;

        }
        v7 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_22:

  }
LABEL_24:

  return v7;
}

- (double)_widthForButtonElements:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  unint64_t v27;
  id v28;
  void *v29;
  unint64_t v30;
  double v31;
  double v32;
  void *v33;
  SKUIItemOfferButton *v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v43;
  uint64_t v45;
  void *v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v3)
  {
    v33 = 0;
    v36 = 0;
    v32 = 0.0;
    v6 = 0.0;
    v31 = 0.0;
    goto LABEL_46;
  }
  v4 = v3;
  v5 = 0;
  v45 = 0;
  v46 = 0;
  v48 = *(_QWORD *)v50;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v50 != v48)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      v9 = objc_msgSend(v8, "itemIdentifier");
      if (v9)
      {
        v10 = v9;
        +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stateForItemWithIdentifier:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "buyButtonDescriptor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v13, "canPersonalizeUsingItemState:", v12);

        if ((_DWORD)v11)
        {
          -[SKUIStorePageSection context](self, "context");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "clientContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKUIItemOfferButton localizedTitleForItemState:clientContext:](SKUIItemOfferButton, "localizedTitleForItemState:clientContext:", v12, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      else
      {
        v12 = 0;
      }
      v16 = 0;
LABEL_11:
      v17 = objc_msgSend(v8, "elementType");
      switch(v17)
      {
        case 141:
          if (+[SKUIStyledButton usesItemOfferAppearanceForButtonType:itemState:](SKUIStyledButton, "usesItemOfferAppearanceForButtonType:itemState:", 1, v12))
          {
            v18 = v16;
          }
          else
          {
            v18 = 0;
          }
          if (!v45)
          {
            objc_msgSend(v8, "buttonTitleStyle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (!v21)
            {
              objc_msgSend(v8, "style");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v21;
            }
            SKUIViewElementFontWithStyle(v21);
            v45 = objc_claimAutoreleasedReturnValue();
            v23 = v43;
            if (!v22)
LABEL_28:

          }
          break;
        case 50:
          objc_msgSend(v8, "buttonImage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "size");
          v6 = v20;

LABEL_33:
          objc_msgSend(v8, "buttonText");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "string");
          v28 = (id)objc_claimAutoreleasedReturnValue();

          v30 = objc_msgSend(v28, "length");
          if (v30 <= objc_msgSend(v5, "length"))
          {
            v18 = 0;
          }
          else
          {
            v28 = v28;

            v18 = 0;
            v5 = v28;
          }
          goto LABEL_36;
        case 13:
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            objc_msgSend(v8, "buttonText");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "string");
            v18 = (id)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v8, "buttonViewType") == 3)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[SKUIItemOfferButton cloudImageWithTintColor:arrowTintColor:](SKUIItemOfferButton, "cloudImageWithTintColor:arrowTintColor:", v22, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "size");
            v6 = v26;

            goto LABEL_28;
          }
          break;
        default:
          goto LABEL_33;
      }
      if (!v18)
        goto LABEL_33;
      v27 = objc_msgSend(v18, "length");
      v28 = v46;
      if (v27 <= objc_msgSend(v46, "length"))
        goto LABEL_37;
      v18 = v18;
      v46 = v18;
LABEL_36:

LABEL_37:
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  }
  while (v4);
  v31 = 0.0;
  v32 = 0.0;
  v33 = v46;
  if (v46)
  {
    v34 = objc_alloc_init(SKUIItemOfferButton);
    -[SKUIItemOfferButton setTitle:](v34, "setTitle:", v46);
    -[SKUIItemOfferButton sizeThatFits:](v34, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    *(float *)&v35 = v35;
    v32 = ceilf(*(float *)&v35);

  }
  v36 = (void *)v45;
  if (v5)
  {
    if (!v45)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 9.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = objc_alloc(MEMORY[0x1E0C99D80]);
    v38 = (void *)objc_msgSend(v37, "initWithObjectsAndKeys:", v36, *MEMORY[0x1E0DC1138], 0);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v38);
    objc_msgSend(v39, "size");
    *(float *)&v40 = v40;
    v31 = ceilf(*(float *)&v40);

  }
LABEL_46:
  if (v32 >= v31)
    v41 = v32;
  else
    v41 = v31;
  if (v41 >= v6)
    v6 = v41;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITracklistPageSection initWithPageComponent:]";
}

@end
