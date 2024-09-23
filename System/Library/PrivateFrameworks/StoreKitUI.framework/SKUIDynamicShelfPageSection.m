@implementation SKUIDynamicShelfPageSection

- (SKUIDynamicShelfPageSection)initWithPageComponent:(id)a3
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
  SKUIDynamicShelfPageSection *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDynamicShelfPageSection initWithPageComponent:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIDynamicShelfPageSection initWithPageComponent:configuration:](self, "initWithPageComponent:configuration:", v4, 0);

  return v13;
}

- (SKUIDynamicShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4
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
  SKUIDynamicShelfPageSection *v16;
  SKUIShelfPageSectionConfiguration *v17;
  SKUIShelfPageSectionConfiguration *configuration;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIDynamicShelfPageSection initWithPageComponent:configuration:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIDynamicShelfPageSection;
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
    -[SKUIDynamicShelfPageSection _reloadViewElementProperties](v16, "_reloadViewElementProperties");
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:](self->_configuration, "setShelfCollectionViewDataSource:", 0);
  -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:](self->_configuration, "setShelfCollectionViewDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection dealloc](&v4, sel_dealloc);
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  objc_super v6;

  -[SKUIDynamicShelfPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  if (!-[SKUIShelfPageSectionConfiguration needsShelfCollectionViewReload](self->_configuration, "needsShelfCollectionViewReload"))-[SKUIShelfPageSectionConfiguration setNeedsShelfCollectionViewReload:](self->_configuration, "setNeedsShelfCollectionViewReload:", -[SKUIDynamicShelfViewElement updateType](self->_dynamicShelfViewElement, "updateType") != 0);
  v6.receiver = self;
  v6.super_class = (Class)SKUIDynamicShelfPageSection;
  return -[SKUIStorePageSection applyUpdateType:](&v6, sel_applyUpdateType_, a3);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SKUIShelfPageSectionConfiguration backgroundColorForShelfViewElement:](self->_configuration, "backgroundColorForShelfViewElement:", self->_dynamicShelfViewElement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIDynamicShelfPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v7, sel_backgroundColorForIndexPath_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  return -[SKUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:](self->_configuration, "cellForShelfViewElement:indexPath:", self->_dynamicShelfViewElement, a3);
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  SKUIShelfPageSectionConfiguration *configuration;
  SKUIDynamicShelfViewElement *dynamicShelfViewElement;
  SKUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  configuration = self->_configuration;
  dynamicShelfViewElement = self->_dynamicShelfViewElement;
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  v6 = a3;
  -[SKUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:](configuration, "cellSizeForShelfViewElement:indexPath:numberOfShelfItems:", dynamicShelfViewElement, v6, -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities](dynamicPageSectionIndexMapper, "totalNumberOfEntities"));
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
  v5.super_class = (Class)SKUIDynamicShelfPageSection;
  v4 = a3;
  -[SKUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v5, sel_collectionViewWillApplyLayoutAttributes_, v4);
  -[SKUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](self->_configuration, "collectionViewWillApplyLayoutAttributes:", v4, v5.receiver, v5.super_class);

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
  v11.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection deselectItemsAnimated:](&v11, sel_deselectItemsAnimated_, v3);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v5;

  if (self->_entityProvider == a3)
  {
    -[SKUIDynamicPageSectionIndexMapper reloadData](self->_dynamicPageSectionIndexMapper, "reloadData");
    -[SKUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

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
  v4.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection invalidateCachedLayoutInformation](&v4, sel_invalidateCachedLayoutInformation);
}

- (int64_t)numberOfCells
{
  return -[SKUIShelfPageSectionConfiguration numberOfSectionCells](self->_configuration, "numberOfSectionCells");
}

- (id)relevantEntityProviders
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIDynamicShelfPageSection;
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
  v12.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection sectionContentInset](&v12, sel_sectionContentInset);
  -[SKUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:](configuration, "sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:", self->_dynamicShelfViewElement, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"), v4, v5, v6, v7);
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
  v5.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection setTopSection:](&v5, sel_setTopSection_);
  -[SKUIShelfPageSectionConfiguration setTopSection:](self->_configuration, "setTopSection:", v3);
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKUIViewElementTextLayoutCache *v7;
  void *v8;
  SKUIViewElementTextLayoutCache *v9;
  SKUIViewElementTextLayoutCache *labelLayoutCache;
  SKUIViewElementLayoutContext *cellLayoutContext;
  SKUIViewElementLayoutContext *v12;
  SKUIViewElementLayoutContext *v13;
  void *v14;
  SKUIViewElementLayoutContext *v15;
  void *v16;
  SKUIViewElementLayoutContext *v17;
  void *v18;
  SKUIViewElementLayoutContext *v19;
  void *v20;
  SKUIViewElementLayoutContext *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:](self->_configuration, "registerReusableClassesForCollectionView:", v5);
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  v7 = [SKUIViewElementTextLayoutCache alloc];
  objc_msgSend(v4, "textLayoutCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:](v7, "initWithLayoutCache:", v8);
  labelLayoutCache = self->_labelLayoutCache;
  self->_labelLayoutCache = v9;

  cellLayoutContext = self->_cellLayoutContext;
  if (!cellLayoutContext)
  {
    v12 = objc_alloc_init(SKUIViewElementLayoutContext);
    v13 = self->_cellLayoutContext;
    self->_cellLayoutContext = v12;

    -[SKUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x1E0C9AAB0], 0x1E73B5C30);
    -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
    cellLayoutContext = self->_cellLayoutContext;
  }
  objc_msgSend(v4, "clientContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setClientContext:](cellLayoutContext, "setClientContext:", v14);

  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", -[SKUIDynamicShelfViewElement elementType](self->_dynamicShelfViewElement, "elementType"));
  -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_cellLayoutContext, "setLabelLayoutCache:", self->_labelLayoutCache);
  v15 = self->_cellLayoutContext;
  objc_msgSend(v4, "parentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setParentViewController:](v15, "setParentViewController:", v16);

  v17 = self->_cellLayoutContext;
  objc_msgSend(v4, "placeholderColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setPlaceholderColor:](v17, "setPlaceholderColor:", v18);

  v19 = self->_cellLayoutContext;
  objc_msgSend(v4, "resourceLoader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setResourceLoader:](v19, "setResourceLoader:", v20);

  v21 = self->_cellLayoutContext;
  objc_msgSend(v5, "tintColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setTintColor:](v21, "setTintColor:", v22);

  -[SKUIShelfPageSectionConfiguration setCellLayoutContext:](self->_configuration, "setCellLayoutContext:", self->_cellLayoutContext);
  -[SKUIDynamicShelfViewElement cellTemplateViewElement](self->_dynamicShelfViewElement, "cellTemplateViewElement");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
  {
    v27[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  -[SKUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](self->_configuration, "reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:", self->_dynamicShelfViewElement, v25, 1, -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities"));
  -[SKUIShelfPageSectionConfiguration setNeedsShelfCollectionViewLayout:](self->_configuration, "setNeedsShelfCollectionViewLayout:", 1);
  v26.receiver = self;
  v26.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v26, sel_willAppearInContext_, v4);

}

- (void)willHideInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection willHideInContext:](&v6, sel_willHideInContext_, v4);

}

- (void)setSectionIndex:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIDynamicShelfPageSection;
  -[SKUIStorePageSection setSectionIndex:](&v5, sel_setSectionIndex_);
  -[SKUIShelfPageSectionConfiguration setSectionIndex:](self->_configuration, "setSectionIndex:", a3);
}

- (void)_setContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIDynamicShelfPageSection;
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

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SKUIDynamicShelfPageSection_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_1E739FD10;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __65__SKUIDynamicShelfPageSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "existingShelfCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 40);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v17 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v3);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v5 = v15;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v19 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "existingShelfCollectionView");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "cellForItemAtIndexPath:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v12, "updateWithItemState:context:animated:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1)&& (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "supportsDuplicateShelfItems") & 1) == 0)
              {

                goto LABEL_17;
              }

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_17:

        v3 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

}

- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4
{
  return -[SKUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[SKUIDynamicShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", objc_msgSend(v6, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration cellForShelfItemViewElement:indexPath:](self->_configuration, "cellForShelfItemViewElement:indexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[SKUIShelfPageSectionConfiguration numberOfCellsForNumberOfShelfItems:](self->_configuration, "numberOfCellsForNumberOfShelfItems:", -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities", a3, a4));
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v9 = a5;
  v10 = a4;
  -[SKUIDynamicShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v12, "item"), -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:](self, "collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v10, v9, v11);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", a4, 1);
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
  -[SKUIDynamicShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v12, "item");
  -[SKUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:](self->_configuration, "shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:", v8, v7, v11, v10);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
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
  SKUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  id v5;
  void *v6;

  configuration = self->_configuration;
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  v5 = a3;
  -[SKUIShelfPageSectionConfiguration normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:](configuration, "normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:", v5, -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities](dynamicPageSectionIndexMapper, "totalNumberOfEntities"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reloadViewElementProperties
{
  void *v3;
  SKUIDynamicShelfViewElement *v4;
  SKUIDynamicShelfViewElement *dynamicShelfViewElement;
  SKUIShelfPageSectionConfiguration *configuration;
  void *v7;
  SKUIShelfPageSectionConfiguration *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SKUIEntityProviding *entityProvider;
  SKUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  SKUIDynamicPageSectionIndexMapper *v14;
  SKUIDynamicPageSectionIndexMapper *v15;
  id obj;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (SKUIDynamicShelfViewElement *)objc_claimAutoreleasedReturnValue();
  dynamicShelfViewElement = self->_dynamicShelfViewElement;
  self->_dynamicShelfViewElement = v4;

  -[SKUIShelfPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", -[SKUIViewElement rendersWithPerspective](self->_dynamicShelfViewElement, "rendersWithPerspective"));
  -[SKUIShelfPageSectionConfiguration setRendersWithParallax:](self->_configuration, "setRendersWithParallax:", -[SKUIViewElement rendersWithParallax](self->_dynamicShelfViewElement, "rendersWithParallax"));
  configuration = self->_configuration;
  -[SKUIDynamicShelfViewElement style](self->_dynamicShelfViewElement, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration setShelfViewElementStyle:](configuration, "setShelfViewElementStyle:", v7);

  v8 = self->_configuration;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDynamicShelfPageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfPageSectionConfiguration setShelfCollectionViewBackgroundColor:](v8, "setShelfCollectionViewBackgroundColor:", v10);

  -[SKUIViewElement entityProvider](self->_dynamicShelfViewElement, "entityProvider");
  v11 = objc_claimAutoreleasedReturnValue();
  entityProvider = self->_entityProvider;
  obj = (id)v11;
  if (entityProvider != (SKUIEntityProviding *)v11
    && (-[SKUIEntityProviding isEqual:](entityProvider, "isEqual:", v11) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entityProvider, obj);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    if (!dynamicPageSectionIndexMapper)
    {
      v14 = objc_alloc_init(SKUIDynamicPageSectionIndexMapper);
      v15 = self->_dynamicPageSectionIndexMapper;
      self->_dynamicPageSectionIndexMapper = v14;

      dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    }
    -[SKUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicPageSectionIndexMapper, "setEntityProvider:", self->_entityProvider);
  }
  -[SKUIShelfPageSectionConfiguration reloadLockupTypeForShelfViewElement:](self->_configuration, "reloadLockupTypeForShelfViewElement:", self->_dynamicShelfViewElement);

}

- (id)_viewElementForEntityAtGlobalIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SKUIDynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:](self->_dynamicPageSectionIndexMapper, "entityIndexPathForGlobalIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEntityProviding entityValueProviderAtIndexPath:](self->_entityProvider, "entityValueProviderAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDynamicShelfViewElement cellTemplateViewElement](self->_dynamicShelfViewElement, "cellTemplateViewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntityValueProvider:", v5);

  return v6;
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
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicShelfViewElement, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
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
