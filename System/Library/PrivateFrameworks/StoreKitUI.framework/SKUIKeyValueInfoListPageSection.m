@implementation SKUIKeyValueInfoListPageSection

- (SKUIKeyValueInfoListPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIKeyValueInfoListPageSection *v5;
  SKUIKeyValueInfoListPageSection *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIKeyValueInfoListPageSection initWithPageComponent:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIKeyValueInfoListPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v8, sel_initWithPageComponent_, v4);
  v6 = v5;
  if (v5)
    -[SKUIKeyValueInfoListPageSection _reloadViewElementProperties](v5, "_reloadViewElementProperties");

  return v6;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *viewElements;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v9);

  viewElements = self->_viewElements;
  v11 = objc_msgSend(v7, "item");

  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v12);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  objc_super v6;

  -[SKUIKeyValueInfoListPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  v6.receiver = self;
  v6.super_class = (Class)SKUIKeyValueInfoListPageSection;
  return -[SKUIStorePageSection applyUpdateType:](&v6, sel_applyUpdateType_, a3);
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
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v4, "item"));
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
    v12.super_class = (Class)SKUIKeyValueInfoListPageSection;
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
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  NSArray *viewElements;
  uint64_t v19;
  void *v20;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B8130, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "horizontalPadding");
  v10 = v9;
  -[SKUIStorePageSection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "horizontalPadding");
  objc_msgSend(v7, "setContentInset:", 0.0, v10, 3.0, v12);

  objc_msgSend(v5, "activePageWidth");
  v14 = v13;
  -[SKUIStorePageSection context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "horizontalPadding");
  v17 = v14 + v16 * -2.0;

  viewElements = self->_viewElements;
  v19 = objc_msgSend(v4, "item");

  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadWithViewElement:width:context:", v20, self->_cellLayoutContext, v17);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSArray *viewElements;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePageWidth");
  v7 = v6;

  viewElements = self->_viewElements;
  v9 = objc_msgSend(v4, "item");

  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "horizontalPadding");
  +[SKUIKeyValueInfoListCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIKeyValueInfoListCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v10, self->_cellLayoutContext, v7 + v12 * -2.0);
  v14 = v13;

  v15 = v7;
  v16 = v14 + 3.0;
  result.height = v16;
  result.width = v15;
  return result;
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
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v4, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SKUIKeyValueInfoListPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v10, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  objc_super v11;

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
  v9 = objc_msgSend(v4, "item");
  if (v9 < -[NSArray count](self->_viewElements, "count"))
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endActiveImpressionForViewElement:", v10);
    v8 = (void *)v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIKeyValueInfoListPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v11, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SKUIKeyValueInfoListPageSection _requestCellLayout](self, "_requestCellLayout");
  v8.receiver = self;
  v8.super_class = (Class)SKUIKeyValueInfoListPageSection;
  -[SKUIStorePageSection entityProvider:didInvalidateWithContext:](&v8, sel_entityProvider_didInvalidateWithContext_, v7, v6);

}

- (int64_t)numberOfCells
{
  return -[NSArray count](self->_viewElements, "count");
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "activePageWidth");
    v9 = v8;
    -[SKUIStorePageSection context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "horizontalPadding");
    v12 = v9 + v11 * -2.0;

    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v14, "item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadWithViewElement:width:context:", v13, self->_cellLayoutContext, v12);

  }
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
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  UIEdgeInsets result;

  v16.receiver = self;
  v16.super_class = (Class)SKUIKeyValueInfoListPageSection;
  -[SKUIStorePageSection sectionContentInset](&v16, sel_sectionContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SKUIStorePageSection isTopSection](self, "isTopSection");
  v12 = 12.0;
  if (!v11)
    v12 = v4;
  v13 = fmax(v8 + -3.0, 0.0);
  v14 = v6;
  v15 = v10;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
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
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B8130);
  v6 = self->_cellLayoutContext;
  v7 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", -[SKUIInfoListViewElement elementType](self->_infoList, "elementType"));
  -[SKUIKeyValueInfoListPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIKeyValueInfoListPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v9, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SKUIViewElementLayoutContext *cellLayoutContext;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  v8 = a4;
  -[SKUIViewElementLayoutContext setActivePageWidth:](cellLayoutContext, "setActivePageWidth:", width);
  -[SKUIKeyValueInfoListPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIKeyValueInfoListPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

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
  SKUIKeyValueInfoListPageSection *v17;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__SKUIKeyValueInfoListPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_1E73A8C90;
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v17 = self;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  -[SKUIKeyValueInfoListPageSection _enumerateVisibleViewElementsUsingBlock:](self, "_enumerateVisibleViewElementsUsingBlock:", v13);

}

void __63__SKUIKeyValueInfoListPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forArtworkRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 88));

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
  v10[2] = __75__SKUIKeyValueInfoListPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke;
  v10[3] = &unk_1E73A7FA0;
  v11 = v4;
  v12 = v7;
  v10[4] = self;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __75__SKUIKeyValueInfoListPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "section") == a1[6])
  {
    v6 = a1[5];
    objc_msgSend(*(id *)(a1[4] + 112), "objectAtIndex:", objc_msgSend(v8, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, uint64_t))(v6 + 16))(v6, v8, v7, a4);

  }
}

- (void)_reloadViewElementProperties
{
  void *v3;
  SKUIInfoListViewElement *v4;
  SKUIInfoListViewElement *infoList;
  NSArray *v6;
  NSArray *viewElements;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (SKUIInfoListViewElement *)objc_claimAutoreleasedReturnValue();
  infoList = self->_infoList;
  self->_infoList = v4;

  -[SKUIViewElement flattenedChildren](self->_infoList, "flattenedChildren");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewElements = self->_viewElements;
  self->_viewElements = v6;

}

- (void)_requestCellLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  SKUIViewElementLayoutContext *cellLayoutContext;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePageWidth");
  v5 = v4;
  -[SKUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalPadding");
  v8 = v5 + v7 * -2.0;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self->_viewElements;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        +[SKUIKeyValueInfoListCollectionViewCell titleColumnWidthWithViewElement:width:context:](SKUIKeyValueInfoListCollectionViewCell, "titleColumnWidthWithViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), self->_cellLayoutContext, v8);
        if (v13 < v15)
          v13 = v15;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  cellLayoutContext = self->_cellLayoutContext;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](cellLayoutContext, "setAggregateValue:forKey:", v17, 0x1E73B8150);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->_viewElements;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        +[SKUIKeyValueInfoListCollectionViewCell requestLayoutForViewElement:width:context:](SKUIKeyValueInfoListCollectionViewCell, "requestLayoutForViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), self->_cellLayoutContext, v8, (_QWORD)v23);
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_titleColumnWidth, 0);
  objc_storeStrong((id *)&self->_infoList, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIKeyValueInfoListPageSection initWithPageComponent:]";
}

@end
