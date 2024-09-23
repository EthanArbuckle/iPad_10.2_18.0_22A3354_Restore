@implementation SKUIVerticalInfoListPageSection

- (SKUIVerticalInfoListPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIVerticalInfoListPageSection *v5;
  NSMutableArray *v6;
  NSMutableArray *columns;
  uint64_t v8;
  SKUIInfoListViewElement *infoList;
  objc_super v11;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIVerticalInfoListPageSection initWithPageComponent:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIVerticalInfoListPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v11, sel_initWithPageComponent_, v4);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    columns = v5->_columns;
    v5->_columns = v6;

    objc_msgSend(v4, "viewElement");
    v8 = objc_claimAutoreleasedReturnValue();
    infoList = v5->_infoList;
    v5->_infoList = (SKUIInfoListViewElement *)v8;

  }
  return v5;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[SKUIInfoListViewElement style](self->_infoList, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ikBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUIVerticalInfoListPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v11, sel_backgroundColorForIndexPath_, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73BEFB0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIVerticalInfoListPageSection _contentInsetForIndexPath:](self, "_contentInsetForIndexPath:", v4);
  objc_msgSend(v7, "setContentInset:");
  -[SKUIVerticalInfoListPageSection _reloadColumnDataIfNecessary](self, "_reloadColumnDataIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "item");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadWithViewElements:width:context:", v10, self->_cellLayoutContext, self->_columnWidth);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  id v5;
  double columnWidth;
  double columnHeight;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  v5 = -[SKUIVerticalInfoListPageSection _reloadColumnDataIfNecessary](self, "_reloadColumnDataIfNecessary");
  columnWidth = self->_columnWidth;
  columnHeight = self->_columnHeight;
  -[SKUIVerticalInfoListPageSection _contentInsetForIndexPath:](self, "_contentInsetForIndexPath:", v4);
  v9 = v8;
  v11 = v10;

  v12 = columnWidth + v9 + v11;
  v13 = columnHeight;
  result.height = v13;
  result.width = v12;
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
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
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
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SKUIVerticalInfoListPageSection _requestCellLayout](self, "_requestCellLayout");
  v8.receiver = self;
  v8.super_class = (Class)SKUIVerticalInfoListPageSection;
  -[SKUIStorePageSection entityProvider:didInvalidateWithContext:](&v8, sel_entityProvider_didInvalidateWithContext_, v7, v6);

}

- (int64_t)numberOfCells
{
  void *v2;
  int64_t v3;

  -[SKUIVerticalInfoListPageSection _reloadColumnDataIfNecessary](self, "_reloadColumnDataIfNecessary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SKUIVerticalInfoListPageSection _reloadColumnDataIfNecessary](self, "_reloadColumnDataIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v10, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadWithViewElements:width:context:", v9, self->_cellLayoutContext, self->_columnWidth);

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
  v16.super_class = (Class)SKUIVerticalInfoListPageSection;
  -[SKUIStorePageSection sectionContentInset](&v16, sel_sectionContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SKUIStorePageSection isTopSection](self, "isTopSection");
  v12 = 12.0;
  if (!v11)
    v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
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
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BEFB0);
  v6 = self->_cellLayoutContext;
  v7 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", -[SKUIInfoListViewElement elementType](self->_infoList, "elementType"));
  -[SKUIVerticalInfoListPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
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
  -[SKUIVerticalInfoListPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
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
  SKUIVerticalInfoListPageSection *v17;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__SKUIVerticalInfoListPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_1E73A7A78;
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v17 = self;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  -[SKUIVerticalInfoListPageSection _enumerateVisibleIndexPathsUsingBlock:](self, "_enumerateVisibleIndexPathsUsingBlock:", v13);

}

void __63__SKUIVerticalInfoListPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forArtworkRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 88));

}

- (UIEdgeInsets)_contentInsetForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v4 = a3;
  -[SKUIVerticalInfoListPageSection _reloadColumnDataIfNecessary](self, "_reloadColumnDataIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  v7 = objc_msgSend(v5, "count");
  v8 = 11.0;
  if (v6 == v7 - 1)
    v9 = 15.0;
  else
    v9 = 11.0;
  if (v6)
    v10 = 11.0;
  else
    v10 = 15.0;
  if (v6)
    v8 = v9;
  if (v7 == 1)
    v11 = 15.0;
  else
    v11 = v10;
  if (v7 == 1)
    v12 = 15.0;
  else
    v12 = v8;

  v13 = 0.0;
  v14 = 0.0;
  v15 = v11;
  v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (void)_enumerateVisibleIndexPathsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
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
  v10[2] = __73__SKUIVerticalInfoListPageSection__enumerateVisibleIndexPathsUsingBlock___block_invoke;
  v10[3] = &unk_1E73A7AA0;
  v11 = v4;
  v12 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __73__SKUIVerticalInfoListPageSection__enumerateVisibleIndexPathsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "section") == *(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)_numberOfColumnsForWidth:(double)a3
{
  double v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = fmax(a3 / 160.0, 1.0);
  if (v3 > 3.0)
    v3 = 3.0;
  v4 = (uint64_t)v3;
  -[SKUIViewElement flattenedChildren](self->_infoList, "flattenedChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= v4)
    return v4;
  else
    return v6;
}

- (id)_reloadColumnDataIfNecessary
{
  double *v3;
  int64_t numberOfColumns;
  int64_t i;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  double columnHeight;
  uint64_t v24;
  void *v25;

  if (!-[NSMutableArray count](self->_columns, "count") && self->_numberOfColumns >= 1)
  {
    -[SKUIViewElement flattenedChildren](self->_infoList, "flattenedChildren");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "count");
    v3 = (double *)malloc_type_malloc(8 * self->_numberOfColumns, 0x100004000313F17uLL);
    bzero(v3, 8 * self->_numberOfColumns);
    numberOfColumns = self->_numberOfColumns;
    if (numberOfColumns >= 1)
    {
      for (i = 0; i < numberOfColumns; ++i)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableArray addObject:](self->_columns, "addObject:", v6);

        numberOfColumns = self->_numberOfColumns;
      }
    }
    v7 = v24 - 1;
    if (v24 >= 1)
    {
      v8 = 0;
      do
      {
        v9 = self->_numberOfColumns;
        if (v9 >= 2)
        {
          v10 = v7;
          do
          {
            v11 = v9--;
            if (v10 >= v8 && v24 >= v11)
            {
              while (v3[v9] < v3[v11 - 2])
              {
                objc_msgSend(v25, "objectAtIndex:", v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", v9);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "insertObject:atIndex:", v12, 0);

                +[SKUIVerticalInfoListCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIVerticalInfoListCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v12, self->_cellLayoutContext, self->_columnWidth);
                v3[v9] = v3[v9] + v14;
                v7 = v10 - 1;

                v15 = v10-- <= v8;
                if (v15)
                  goto LABEL_17;
              }
            }
            v7 = v10;
LABEL_17:
            v10 = v7;
          }
          while (v11 > 2);
        }
        if (v7 >= v8)
        {
          objc_msgSend(v25, "objectAtIndex:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v16);

          +[SKUIVerticalInfoListCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIVerticalInfoListCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v16, self->_cellLayoutContext, self->_columnWidth);
          *v3 = *v3 + v18;

        }
        v15 = v8++ < v7;
      }
      while (v15);
      numberOfColumns = self->_numberOfColumns;
    }
    if (numberOfColumns >= 1)
    {
      v19 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21 <= 1)
        {
          columnHeight = v3[v19];
        }
        else
        {
          columnHeight = v3[v19] + (float)((float)(v21 - 1) * 13.0);
          v3[v19] = columnHeight;
        }
        if (self->_columnHeight >= columnHeight)
          columnHeight = self->_columnHeight;
        self->_columnHeight = columnHeight;
        ++v19;
      }
      while (v19 < self->_numberOfColumns);
    }
    free(v3);

  }
  return self->_columns;
}

- (void)_requestCellLayout
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  float v7;
  SKUIInfoListViewElement *infoList;
  _QWORD v9[5];

  -[SKUIStorePageSection context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePageWidth");
  v5 = v4;

  self->_columnWidth = v5 + -30.0;
  v6 = -[SKUIVerticalInfoListPageSection _numberOfColumnsForWidth:](self, "_numberOfColumnsForWidth:", v5);
  self->_numberOfColumns = v6;
  if (v6 >= 2)
  {
    v7 = (self->_columnWidth + (float)((float)(v6 - 1) * -22.0)) / (double)v6;
    self->_columnWidth = floorf(v7);
  }
  infoList = self->_infoList;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SKUIVerticalInfoListPageSection__requestCellLayout__block_invoke;
  v9[3] = &unk_1E73A12A8;
  v9[4] = self;
  -[SKUIInfoListViewElement enumerateChildrenUsingBlock:](infoList, "enumerateChildrenUsingBlock:", v9);
  self->_columnHeight = -1.0;
  -[NSMutableArray removeAllObjects](self->_columns, "removeAllObjects");
}

uint64_t __53__SKUIVerticalInfoListPageSection__requestCellLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SKUIVerticalInfoListCollectionViewCell requestLayoutForViewElement:width:context:](SKUIVerticalInfoListCollectionViewCell, "requestLayoutForViewElement:width:context:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(double *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoList, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIVerticalInfoListPageSection initWithPageComponent:]";
}

@end
