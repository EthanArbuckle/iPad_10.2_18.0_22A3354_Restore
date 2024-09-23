@implementation SKUIShelfPageSection

- (SKUIShelfPageSection)initWithPageComponent:(id)a3
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
  SKUIShelfPageSection *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIShelfPageSection initWithPageComponent:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIShelfPageSection initWithPageComponent:configuration:](self, "initWithPageComponent:configuration:", v4, 0);

  return v13;
}

- (SKUIShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4
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
  SKUIShelfPageSection *v16;
  SKUIShelfPageSectionConfiguration *v17;
  SKUIShelfPageSectionConfiguration *configuration;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIShelfPageSection initWithPageComponent:configuration:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIShelfPageSection;
  v16 = -[SKUIStorePageSection initWithPageComponent:](&v20, sel_initWithPageComponent_, v6);
  if (v16)
  {
    if (v7)
      v17 = (SKUIShelfPageSectionConfiguration *)v7;
    else
      v17 = objc_alloc_init(SKUIShelfPageSectionConfiguration);
    configuration = v16->_configuration;
    v16->_configuration = v17;

    -[SKUIShelfPageSectionConfiguration setDataSource:](v16->_configuration, "setDataSource:", v16);
    -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:](v16->_configuration, "setShelfCollectionViewDataSource:", v16);
    -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:](v16->_configuration, "setShelfCollectionViewDelegate:", v16);
    -[SKUIShelfPageSection _reloadViewElementProperties](v16, "_reloadViewElementProperties");
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:](self->_configuration, "setShelfCollectionViewDataSource:", 0);
  -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:](self->_configuration, "setShelfCollectionViewDelegate:", 0);
  -[SKUIViewElementSlideshowController setDelegate:](self->_slideshowController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v7);

  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "item", (_QWORD)v16));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addItemViewElement:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  objc_super v6;

  -[SKUIShelfPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  if (!-[SKUIShelfPageSectionConfiguration needsShelfCollectionViewReload](self->_configuration, "needsShelfCollectionViewReload"))-[SKUIShelfPageSectionConfiguration setNeedsShelfCollectionViewReload:](self->_configuration, "setNeedsShelfCollectionViewReload:", -[SKUIShelfViewElement updateType](self->_shelfViewElement, "updateType") != 0);
  v6.receiver = self;
  v6.super_class = (Class)SKUIShelfPageSection;
  return -[SKUIStorePageSection applyUpdateType:](&v6, sel_applyUpdateType_, a3);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SKUIShelfPageSectionConfiguration backgroundColorForShelfViewElement:](self->_configuration, "backgroundColorForShelfViewElement:", self->_shelfViewElement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIShelfPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v7, sel_backgroundColorForIndexPath_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  return -[SKUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:](self->_configuration, "cellForShelfViewElement:indexPath:", self->_shelfViewElement, a3);
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  SKUIShelfPageSectionConfiguration *configuration;
  SKUIShelfViewElement *shelfViewElement;
  NSArray *viewElements;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  configuration = self->_configuration;
  shelfViewElement = self->_shelfViewElement;
  viewElements = self->_viewElements;
  v6 = a3;
  -[SKUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:](configuration, "cellSizeForShelfViewElement:indexPath:numberOfShelfItems:", shelfViewElement, v6, -[NSArray count](viewElements, "count"));
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIShelfPageSection;
  v4 = a3;
  -[SKUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v5, sel_collectionViewWillApplyLayoutAttributes_, v4);
  -[SKUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](self->_configuration, "collectionViewWillApplyLayoutAttributes:", v4, v5.receiver, v5.super_class);

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
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIShelfPageSection;
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
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)deselectItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection deselectItemsAnimated:](&v11, sel_deselectItemsAnimated_, v3);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  SKUIShelfPageSectionConfiguration *configuration;
  SKUIShelfViewElement *shelfViewElement;
  NSArray *viewElements;
  id v9;
  id v10;
  objc_super v11;

  configuration = self->_configuration;
  shelfViewElement = self->_shelfViewElement;
  viewElements = self->_viewElements;
  v9 = a4;
  v10 = a3;
  -[SKUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](configuration, "reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:", shelfViewElement, viewElements, 1, -[NSArray count](viewElements, "count"));
  v11.receiver = self;
  v11.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection entityProvider:didInvalidateWithContext:](&v11, sel_entityProvider_didInvalidateWithContext_, v10, v9);

}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, SKUIModalSourceViewProvider *);
  NSArray *viewElements;
  id v9;
  SKUIModalSourceViewProvider *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, SKUIModalSourceViewProvider *))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__21;
  v24 = __Block_byref_object_dispose__21;
  viewElements = self->_viewElements;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__SKUIShelfPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke;
  v17[3] = &unk_1E73A30E8;
  v17[4] = self;
  v9 = v6;
  v18 = v9;
  v19 = &v20;
  -[NSArray enumerateObjectsUsingBlock:](viewElements, "enumerateObjectsUsingBlock:", v17);
  v10 = (SKUIModalSourceViewProvider *)v21[5];
  if (v10)
  {
    -[SKUIShelfPageSectionConfiguration actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:numberOfShelfItems:](self->_configuration, "actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:numberOfShelfItems:", v10, -[NSArray count](self->_viewElements, "count"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v21[5];
    v21[5] = v11;

    v10 = objc_alloc_init(SKUIModalSourceViewProvider);
    -[SKUIModalSourceViewProvider setUserInfo:](v10, "setUserInfo:", v9);
    -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v21[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "itmlID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewForElementIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[SKUIModalSourceViewProvider setOriginalSourceView:](v10, "setOriginalSourceView:", v16);
    else
      -[SKUIModalSourceViewProvider setOriginalSourceView:](v10, "setOriginalSourceView:", v14);

  }
  v7[2](v7, v10);

  _Block_object_dispose(&v20, 8);
}

void __73__SKUIShelfPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "effectiveViewElementForShelfItemViewElement:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "isDescendentFromViewElement:"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

- (void)invalidateCachedLayoutInformation
{
  void *v3;
  objc_super v4;

  -[SKUIShelfPageSectionConfiguration setNeedsShelfCollectionViewLayout:](self->_configuration, "setNeedsShelfCollectionViewLayout:", 1);
  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  v4.receiver = self;
  v4.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection invalidateCachedLayoutInformation](&v4, sel_invalidateCachedLayoutInformation);
}

- (int64_t)numberOfCells
{
  return -[SKUIShelfPageSectionConfiguration numberOfSectionCells](self->_configuration, "numberOfSectionCells");
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  NSArray *viewElements;
  objc_super v6;
  _QWORD v7[7];
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  viewElements = self->_viewElements;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SKUIShelfPageSection_prefetchResourcesWithReason___block_invoke;
  v7[3] = &unk_1E73A3110;
  v7[5] = v8;
  v7[6] = a3;
  v7[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](viewElements, "enumerateObjectsUsingBlock:", v7);
  v6.receiver = self;
  v6.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection prefetchResourcesWithReason:](&v6, sel_prefetchResourcesWithReason_, a3);
  _Block_object_dispose(v8, 8);
}

uint64_t __52__SKUIShelfPageSection_prefetchResourcesWithReason___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 96), "prefetchResourcesForShelfItemViewElement:reason:", a2, a1[6]);
  if ((_DWORD)result)
    *a4 = ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > 9;
  return result;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  SKUIShelfPageSectionConfiguration *configuration;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a4.y;
  x = a4.x;
  configuration = self->_configuration;
  v8 = a3;
  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](configuration, "existingShelfCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  objc_msgSend(v9, "indexPathForItemAtPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v11, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previewViewControllerForViewElement:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y;
  double x;
  SKUIShelfPageSectionConfiguration *configuration;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  y = a4.y;
  x = a4.x;
  configuration = self->_configuration;
  v9 = a5;
  v10 = a3;
  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](configuration, "existingShelfCollectionView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertPoint:fromView:", v9, x, y);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v18, "indexPathForItemAtPoint:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cellForItemAtIndexPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setSourceView:", v16);
  objc_msgSend(v16, "bounds");
  objc_msgSend(v17, "setSourceRect:");

}

- (UIEdgeInsets)sectionContentInset
{
  SKUIShelfPageSectionConfiguration *configuration;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  UIEdgeInsets result;

  configuration = self->_configuration;
  v12.receiver = self;
  v12.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection sectionContentInset](&v12, sel_sectionContentInset);
  -[SKUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:](configuration, "sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:", self->_shelfViewElement, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"), v4, v5, v6, v7);
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)setTopSection:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection setTopSection:](&v5, sel_setTopSection_);
  -[SKUIShelfPageSectionConfiguration setTopSection:](self->_configuration, "setTopSection:", v3);
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v22 = a4;
  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForVisibleItems");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v7, "cellForItemAtIndexPath:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "updateWithItemState:context:animated:", v22, self->_cellLayoutContext, v5))
        {
          v15 = objc_msgSend(v12, "item");
          -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIShelfPageSectionConfiguration shelfLayoutData](self->_configuration, "shelfLayoutData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sizeForItemAtIndex:", v15);
          v19 = v18;

          objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", v16, self->_cellLayoutContext, v19);
          v14 = 1;
          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SKUIViewElementLayoutContext *v6;
  SKUIViewElementLayoutContext *v7;
  SKUIViewElementLayoutContext *cellLayoutContext;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:](self->_configuration, "registerReusableClassesForCollectionView:", v5);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7D10);
  v6 = self->_cellLayoutContext;
  v7 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x1E0C9AAB0], 0x1E73B5C30);
  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", -[SKUIShelfViewElement elementType](self->_shelfViewElement, "elementType"));
  -[SKUIShelfPageSectionConfiguration setCellLayoutContext:](self->_configuration, "setCellLayoutContext:", self->_cellLayoutContext);
  -[SKUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](self->_configuration, "reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:", self->_shelfViewElement, self->_viewElements, 1, -[NSArray count](self->_viewElements, "count"));
  -[SKUIShelfPageSectionConfiguration setNeedsShelfCollectionViewLayout:](self->_configuration, "setNeedsShelfCollectionViewLayout:", 1);
  if (!-[NSArray count](self->_viewElements, "count"))
    -[SKUIShelfViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_shelfViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);
  v9.receiver = self;
  v9.super_class = (Class)SKUIShelfPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v9, sel_willAppearInContext_, v4);

}

- (void)_setContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIShelfPageSection;
  v4 = a3;
  -[SKUIStorePageSection _setContext:](&v5, sel__setContext_, v4);
  -[SKUIShelfPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setImage:forArtworkRequest:context:", v7, v6, self->_cellLayoutContext);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4
{
  return -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", a4);
}

- (void)viewElementSlideshowWillDismiss:(id)a3
{
  SKUIViewElementSlideshowController *slideshowController;

  if (self->_slideshowController == a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);
    -[SKUIViewElementSlideshowController setLayoutContext:](self->_slideshowController, "setLayoutContext:", 0);
    slideshowController = self->_slideshowController;
    self->_slideshowController = 0;

  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  v5 = a4;
  -[SKUIShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "item");
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration cellForShelfItemViewElement:indexPath:](self->_configuration, "cellForShelfItemViewElement:indexPath:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NSArray count](self->_viewElements, "count");
  if (self->_lastNeedsMoreCount < v10 && v7 + 10 > v10)
  {
    self->_lastNeedsMoreCount = v10;
    -[SKUIShelfViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_shelfViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);
  }

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[SKUIShelfPageSectionConfiguration numberOfCellsForNumberOfShelfItems:](self->_configuration, "numberOfCellsForNumberOfShelfItems:", -[NSArray count](self->_viewElements, "count", a3, a4));
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v9 = a5;
  v10 = a4;
  -[SKUIShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v12, "item"), -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:](self, "collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v10, v9, v11);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  -[SKUIShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v8, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self->_configuration, "effectiveViewElementForShelfItemViewElement:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isEnabled"))
    {
      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__SKUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke;
      v14[3] = &unk_1E73A3160;
      objc_copyWeak(&v16, &location);
      v12 = v11;
      v15 = v12;
      objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v14);
      if (objc_msgSend(v12, "elementType") == 66)
      {
        v13 = -[SKUIShelfPageSectionConfiguration lockupTypeForLockup:](self->_configuration, "lockupTypeForLockup:", v12)- 3;

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
        if (v13 >= 0xFFFFFFFFFFFFFFFELL)
          goto LABEL_9;
      }
      else
      {

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      objc_msgSend(v11, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x1E73B7150, 0x1E73B7170, 1, 0, 0, 0);
    }
  }
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1);
LABEL_9:

}

void __64__SKUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2, char a3)
{
  _QWORD v4[4];
  id v5;
  id v6;

  if (!a2 || (a3 & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __64__SKUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v4[3] = &unk_1E73A3138;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }
}

void __64__SKUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performDefaultSelectActionForEffectiveViewElement:", *(_QWORD *)(a1 + 32));

}

- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v12, "item");
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:](self->_configuration, "shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:", v8, v7, v11, v10);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SKUIShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v5, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self->_configuration, "effectiveViewElementForShelfItemViewElement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabled");

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(a5, "item", a3, a4));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeMetricsImpressionSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginActiveImpressionForViewElement:", v8);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v6 = objc_msgSend(a5, "item", a3, a4);
  if (v6 < -[NSArray count](self->_viewElements, "count"))
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeMetricsImpressionSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endActiveImpressionForViewElement:", v9);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewDidEndDecelerating:", v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  if (-[SKUIShelfPageSectionConfiguration rendersWithParallax](self->_configuration, "rendersWithParallax"))
  {
    -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SKUICollectionViewUpdatePerspectiveCells(v4, 0);

  }
  -[SKUIShelfPageSectionConfiguration scrollViewDidScroll:](self->_configuration, "scrollViewDidScroll:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewDidScroll:", v6);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewWillBeginDecelerating:", v5);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewWillBeginDragging:", v5);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id WeakRetained;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, x, y, a5->x, a5->y);

}

- (id)_normalizedShelfItemIndexPathFromActualIndexPath:(id)a3
{
  SKUIShelfPageSectionConfiguration *configuration;
  NSArray *viewElements;
  id v5;
  void *v6;

  configuration = self->_configuration;
  viewElements = self->_viewElements;
  v5 = a3;
  -[SKUIShelfPageSectionConfiguration normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:](configuration, "normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:", v5, -[NSArray count](viewElements, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_performDefaultSelectActionForEffectiveViewElement:(id)a3
{
  SKUIViewElementSlideshowController *v4;
  void *v5;
  void *v6;
  SKUIViewElementSlideshowController *v7;
  SKUIViewElementSlideshowController *slideshowController;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!-[SKUIStorePageSection performDefaultActionForViewElement:](self, "performDefaultActionForViewElement:")
    && objc_msgSend(v11, "elementType") == 66)
  {
    v4 = [SKUIViewElementSlideshowController alloc];
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUIViewElementSlideshowController initWithShelf:selectedLockup:](v4, "initWithShelf:selectedLockup:", v6, v11);

    if (-[SKUIViewElementSlideshowController numberOfSlideshowItems](v7, "numberOfSlideshowItems") >= 1)
    {
      objc_storeStrong((id *)&self->_slideshowController, v7);
      -[SKUIViewElementSlideshowController setDelegate:](self->_slideshowController, "setDelegate:", self);
      -[SKUIViewElementSlideshowController setLayoutContext:](self->_slideshowController, "setLayoutContext:", self->_cellLayoutContext);
      slideshowController = self->_slideshowController;
      -[SKUIStorePageSection context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewElementSlideshowController presentFromParentViewController:](slideshowController, "presentFromParentViewController:", v10);

    }
  }

}

- (void)_reloadViewElementProperties
{
  void *v3;
  SKUIShelfViewElement *v4;
  SKUIShelfViewElement *shelfViewElement;
  NSArray *v6;
  NSArray *viewElements;
  SKUIShelfPageSectionConfiguration *configuration;
  void *v9;
  void *v10;
  SKUIShelfPageSectionConfiguration *v11;
  void *v12;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (SKUIShelfViewElement *)objc_claimAutoreleasedReturnValue();
  shelfViewElement = self->_shelfViewElement;
  self->_shelfViewElement = v4;

  -[SKUIViewElement flattenedChildren](self->_shelfViewElement, "flattenedChildren");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewElements = self->_viewElements;
  self->_viewElements = v6;

  -[SKUIShelfPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", -[SKUIViewElement rendersWithPerspective](self->_shelfViewElement, "rendersWithPerspective"));
  -[SKUIShelfPageSectionConfiguration setRendersWithParallax:](self->_configuration, "setRendersWithParallax:", -[SKUIViewElement rendersWithParallax](self->_shelfViewElement, "rendersWithParallax"));
  configuration = self->_configuration;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration setShelfCollectionViewBackgroundColor:](configuration, "setShelfCollectionViewBackgroundColor:", v10);

  v11 = self->_configuration;
  -[SKUIShelfViewElement style](self->_shelfViewElement, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration setShelfViewElementStyle:](v11, "setShelfViewElementStyle:", v12);

  -[SKUIShelfPageSectionConfiguration reloadLockupTypeForShelfViewElement:](self->_configuration, "reloadLockupTypeForShelfViewElement:", self->_shelfViewElement);
}

- (SKUIShelfPageSectionConfiguration)configuration
{
  return self->_configuration;
}

- (SKUIScrollViewDelegateObserver)scrollViewDelegateObserver
{
  return (SKUIScrollViewDelegateObserver *)objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
}

- (void)setScrollViewDelegateObserver:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegateObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegateObserver);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_slideshowController, 0);
  objc_storeStrong((id *)&self->_shelfViewElement, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPageComponent:(uint64_t)a3 configuration:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
