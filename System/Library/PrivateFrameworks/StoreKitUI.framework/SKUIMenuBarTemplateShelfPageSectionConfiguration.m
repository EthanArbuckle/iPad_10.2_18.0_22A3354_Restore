@implementation SKUIMenuBarTemplateShelfPageSectionConfiguration

- (SKUIMenuBarTemplateShelfPageSectionConfiguration)init
{
  return -[SKUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:](self, "initWithNumberOfIterations:", 1);
}

- (SKUIMenuBarTemplateShelfPageSectionConfiguration)initWithNumberOfIterations:(unint64_t)a3
{
  SKUIMenuBarTemplateShelfPageSectionConfiguration *result;
  unint64_t v6;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  result = -[SKUIMenuBarTemplateShelfPageSectionConfiguration init](&v7, sel_init);
  if (result)
  {
    if (a3 <= 1)
      v6 = 1;
    else
      v6 = a3;
    result->_numberOfIterations = v6;
  }
  return result;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  uint64_t v8;

  v7[0] = 0;
  v7[1] = 0;
  v8 = 0;
  v3 = a3;
  SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(v3, (uint64_t)v7);
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (int64_t)numberOfSectionCells
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  return -[SKUIShelfPageSectionConfiguration numberOfSectionCells](&v3, sel_numberOfSectionCells) + 1;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id fixedElementsCollectionViewCell;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "item") + 1;
  if (v8 == -[SKUIMenuBarTemplateShelfPageSectionConfiguration numberOfSectionCells](self, "numberOfSectionCells"))
  {
    -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73AC750, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activePageWidth");
    v15 = v14;
    -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadWithViewElement:width:context:", v12, v16, v15);

    fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
    self->_fixedElementsCollectionViewCell = v11;

    v18 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
    -[SKUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:](&v20, sel_cellForShelfViewElement_indexPath_, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
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
  objc_super v25;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "item") + 1;
  if (v10 == -[SKUIMenuBarTemplateShelfPageSectionConfiguration numberOfSectionCells](self, "numberOfSectionCells"))
  {
    -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activePageWidth");
    v13 = v12;

    -[SKUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v14, v15, v13);
    v17 = v16;

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
    -[SKUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:](&v25, sel_cellSizeForShelfViewElement_indexPath_numberOfShelfItems_, v8, v9, a5);
    v13 = v18;
    v17 = v19;
    if (-[SKUIShelfPageSectionConfiguration wantsZoomingShelfLayout](self, "wantsZoomingShelfLayout"))
    {
      -[SKUIShelfPageSectionConfiguration zoomingShelfLayoutScaledItemWidth](self, "zoomingShelfLayoutScaledItemWidth");
      v21 = v20;
      -[SKUIShelfPageSectionConfiguration zoomingShelfLayoutItemWidth](self, "zoomingShelfLayoutItemWidth");
      v17 = v17 - (v21 - v22);
    }
  }

  v23 = v13;
  v24 = v17;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  -[SKUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](&v8, sel_collectionViewWillApplyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item") + 1;
  v7 = -[SKUIMenuBarTemplateShelfPageSectionConfiguration numberOfSectionCells](self, "numberOfSectionCells");

  if (v6 == v7)
    objc_msgSend(v4, "setZIndex:", 1);

}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  v3 = a3;
  -[SKUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:](&v4, sel_registerReusableClassesForCollectionView_, v3);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AC750, v4.receiver, v4.super_class);

}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  -[SKUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](&v16, sel_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems_, a3, a4, a5, a6);
  if (v6)
  {
    -[SKUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activePageWidth");
    v11 = v10;
    -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:width:context:](SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell, "requestLayoutForViewElement:width:context:", v8, v12, v11);

    -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "labelLayoutCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "commitLayoutRequests");

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t focusedIndex;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id fixedElementsCollectionViewCell;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  -[SKUIShelfPageSectionConfiguration scrollViewDidScroll:](&v22, sel_scrollViewDidScroll_, v4);
  if (-[SKUIShelfPageSectionConfiguration wantsZoomingShelfLayout](self, "wantsZoomingShelfLayout"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "collectionViewLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "menuBarFocusedItemIndexPathWithTransitionProgress:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        focusedIndex = self->_focusedIndex;
        if (focusedIndex != objc_msgSend(v6, "item"))
        {
          self->_focusedIndex = objc_msgSend(v6, "item");
          -[SKUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "activePageWidth");
          v11 = v10;
          -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:width:context:](SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell, "requestLayoutForViewElement:width:context:", v8, v12, v11);

          -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "labelLayoutCache");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "layoutCache");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "commitLayoutRequests");

          fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
          -[SKUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "activePageWidth");
          v20 = v19;
          -[SKUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(fixedElementsCollectionViewCell, "reloadWithViewElement:width:context:", v17, v21, v20);

        }
      }

    }
  }

}

- (id)_focusedViewElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[SKUIShelfPageSectionConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shelfPageSectionConfiguration:viewElementAtIndex:", self, self->_focusedIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v10 = 0;
  SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(v4, (uint64_t)&v8);
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fixedElementsCollectionViewCell, 0);
}

- (void)initWithNumberOfIterations:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:]";
}

@end
