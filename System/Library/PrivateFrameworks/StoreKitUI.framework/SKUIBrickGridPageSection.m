@implementation SKUIBrickGridPageSection

- (SKUIBrickGridPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIBrickGridPageSection *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  NSMapTable *artworkRequests;
  uint64_t v14;
  NSMapTable *editorialLayouts;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrickGridPageSection initWithPageComponent:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIBrickGridPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v17, sel_initWithPageComponent_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v8 = 145.0;
    if (v7 == 1)
      v8 = 208.0;
    v9 = 2;
    if (v7 == 1)
      v9 = 3;
    v10 = 10.0;
    v11 = 20.0;
    if (v7 == 1)
      v10 = 20.0;
    else
      v11 = 15.0;
    *(_QWORD *)&v5->_baseHeight = qword_1BBED29E0[v7 == 1];
    v5->_columnWidth = v8;
    v5->_numberOfColumns = v9;
    v5->_paddingHorizontal = v10;
    v5->_paddingTop = v11;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    artworkRequests = v5->_artworkRequests;
    v5->_artworkRequests = (NSMapTable *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    editorialLayouts = v5->_editorialLayouts;
    v5->_editorialLayouts = (NSMapTable *)v14;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIBrickGridPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addItemViewElement:", v8);

  v9 = objc_msgSend(v6, "item");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 < objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addItemIdentifier:", objc_msgSend(v12, "brickIdentifier"));

  }
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIImage *v20;
  UIImage *placeholderImage;
  void *v22;
  void *v23;
  UIImage *v24;
  UIImage *v25;
  void *v26;
  void *v28;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73BD330, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = objc_msgSend(v4, "row");
  v10 = (uint64_t)v9 % self->_numberOfColumns;
  objc_msgSend(v6, "bounds");
  -[SKUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", v10, v11);
  objc_msgSend(v7, "setContentInsets:");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 >= objc_msgSend(v13, "count"))
  {
    objc_msgSend(v7, "applyEditorialLayout:orientation:", 0, 0);
    objc_msgSend(v7, "setBrickImage:", 0);
    goto LABEL_11;
  }
  objc_msgSend(v13, "objectAtIndex:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v15);

  -[SKUIBrickGridPageSection _editorialLayoutForBrick:](self, "_editorialLayoutForBrick:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyEditorialLayout:orientation:", v16, 0);
  objc_msgSend(v5, "resourceLoader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (!v19)
    goto LABEL_5;
  objc_msgSend(v17, "cachedResourceForRequestIdentifier:", v19);
  v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if ((objc_msgSend(v17, "trySetReason:forRequestWithIdentifier:", 1, v19) & 1) != 0)
    {
LABEL_6:
      placeholderImage = self->_placeholderImage;
      if (!placeholderImage)
      {
        +[SKUIStyledImageDataConsumer brickConsumer](SKUIStyledImageDataConsumer, "brickConsumer");
        v28 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "imageForColor:", v23);
        v24 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v25 = self->_placeholderImage;
        self->_placeholderImage = v24;

        v16 = v28;
        placeholderImage = self->_placeholderImage;
      }
      v20 = placeholderImage;
      goto LABEL_9;
    }
LABEL_5:
    -[SKUIBrickGridPageSection _loadArtworkForBrick:artworkLoader:reason:](self, "_loadArtworkForBrick:artworkLoader:reason:", v14, v17, 1);
    goto LABEL_6;
  }
LABEL_9:
  objc_msgSend(v7, "setBrickImage:", v20);
  objc_msgSend(v5, "colorScheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColoringWithColorScheme:", v26);

LABEL_11:
  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  double v4;
  uint64_t v5;
  int64_t numberOfColumns;
  void *v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double columnWidth;
  void *v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double baseHeight;
  void *v28;
  void *v29;
  double v30;
  double v32;
  double v33;
  CGSize result;

  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v5 = objc_msgSend(a3, "item");
  numberOfColumns = self->_numberOfColumns;
  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5 % self->_numberOfColumns;
  objc_msgSend(v8, "bounds");
  -[SKUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  columnWidth = self->_columnWidth;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "count");
  v23 = self->_numberOfColumns;
  if (v23 >= 1)
  {
    v24 = v22;
    v25 = v23 * (v5 / numberOfColumns);
    if (v25 < v22)
    {
      v26 = v23 * (v5 / numberOfColumns);
      do
      {
        baseHeight = self->_baseHeight;
        objc_msgSend(v21, "objectAtIndex:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIBrickGridPageSection _editorialLayoutForBrick:](self, "_editorialLayoutForBrick:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v29, "layoutHeightForOrientation:expanded:", 0, 1);
          baseHeight = v30 + self->_baseHeight + 27.0;
        }
        if (v4 < baseHeight)
          v4 = baseHeight;

      }
      while (++v26 < self->_numberOfColumns + v25 && v26 < v24);
    }
  }

  v32 = v14 + v18 + columnWidth;
  v33 = v12 + v16 + v4;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickGridPageSection;
  -[SKUIStorePageSection clickEventWithLink:elementName:index:](&v13, sel_clickEventWithLink_elementName_index_, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a5, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    SKUIMetricsSetClickEventPositionWithView(v7, v11);
  }
  return v7;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "item");
  v7 = v6 >= objc_msgSend(v14, "count");
  v8 = v14;
  if (!v7)
  {
    objc_msgSend(v14, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "link");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBrickGridPageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v10, *MEMORY[0x1E0DAFC88], v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SKUIStorePageSection context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metricsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordEvent:", v11);

    }
    -[SKUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v10);

    v8 = v14;
  }

}

- (int64_t)numberOfCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = v5 % self->_numberOfColumns + v5;
  return v6;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  int64_t v13;
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SKUIBrickGridPageSection_prefetchResourcesWithReason___block_invoke;
  v10[3] = &unk_1E73A8E10;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = v14;
  v13 = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

void __56__SKUIBrickGridPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadArtworkForBrick:artworkLoader:reason:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    *a4 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 8;
  }

}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BD330);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    objc_msgSend(v6, "bounds");
    v9 = 3;
    if (v10 > v11)
      v9 = 4;
    self->_numberOfColumns = v9;
  }
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        -[SKUIBrickGridPageSection _editorialLayoutForBrick:](self, "_editorialLayoutForBrick:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "enqueueLayoutRequests");

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)SKUIBrickGridPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v20, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  int64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  height = a3.height;
  width = a3.width;
  v32 = *MEMORY[0x1E0C80C00];
  v25 = a4;
  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "portraitPageWidth");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 1)
  {
    if (width <= height)
    {
      v13 = 3;
    }
    else
    {
      objc_msgSend(v7, "landscapePageWidth");
      v9 = v12;
      v13 = 4;
    }
    self->_numberOfColumns = v13;
  }
  -[SKUIStorePageSection context](self, "context", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  objc_msgSend(v15, "indexPathsForVisibleItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v22, "section") == v16)
        {
          objc_msgSend(v15, "cellForItemAtIndexPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", objc_msgSend(v22, "item") % self->_numberOfColumns, v9);
          objc_msgSend(v23, "setContentInsets:");

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIBrickGridPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v26, sel_willTransitionToSize_withTransitionCoordinator_, v25, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v6 = a4;
  v7 = objc_msgSend(a3, "requestIdentifier");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SKUIBrickGridPageSection_artworkRequest_didLoadImage___block_invoke;
  v9[3] = &unk_1E73A8E38;
  v10 = v6;
  v11 = v7;
  v9[4] = self;
  v8 = v6;
  -[SKUIBrickGridPageSection _enumerateVisibleBricksUsingBlock:](self, "_enumerateVisibleBricksUsingBlock:", v9);

}

void __56__SKUIBrickGridPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "unsignedIntegerValue") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setBrickImage:", *(_QWORD *)(a1 + 40));
    *a4 = 1;

  }
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  int64_t v20;

  v17 = a4;
  v7 = a5;
  if (objc_msgSend(v17, "count"))
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "_updateWithMissingItems:", v17);

  }
  if (objc_msgSend(v7, "count"))
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_updateWithInvalidItemIdentifiers:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __82__SKUIBrickGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v18[3] = &unk_1E73A8E60;
      v19 = v12;
      v20 = v13;
      v14 = v12;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v18);
      -[SKUIStorePageSection context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "deleteItemsAtIndexPaths:", v14);
    }

  }
}

void __82__SKUIBrickGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (UIEdgeInsets)_contentInsetsForColumnIndex:(int64_t)a3 rowWidth:(double)a4
{
  int64_t numberOfColumns;
  uint64_t v5;
  float v6;
  double paddingHorizontal;
  double *p_paddingTop;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  numberOfColumns = self->_numberOfColumns;
  v5 = numberOfColumns - 1;
  if (numberOfColumns == 1)
  {
    v6 = (a4 - self->_columnWidth) * 0.5;
    paddingHorizontal = floorf(v6);
    p_paddingTop = &self->_paddingTop;
    v9 = paddingHorizontal;
  }
  else
  {
    paddingHorizontal = self->_paddingHorizontal;
    v10 = (a4 + paddingHorizontal * -2.0 - self->_columnWidth * (double)numberOfColumns) / (double)v5;
    v11 = floorf(v10);
    if (a3)
    {
      p_paddingTop = &self->_paddingTop;
      v12 = floorf(v11 * 0.5);
      if (v5 == a3)
        v9 = self->_paddingHorizontal;
      else
        v9 = v12;
      paddingHorizontal = v12;
    }
    else
    {
      p_paddingTop = &self->_paddingTop;
      v9 = floorf(v11 * 0.5);
    }
  }
  v13 = *p_paddingTop;
  v14 = 0.0;
  result.right = v9;
  result.bottom = v14;
  result.left = paddingHorizontal;
  result.top = v13;
  return result;
}

- (id)_editorialLayoutForBrick:(id)a3
{
  id v4;
  SKUIEditorialLayout *v5;
  void *v6;
  SKUIEditorialLayout *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v4);
  v5 = (SKUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "editorial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [SKUIEditorialLayout alloc];
      -[SKUIStorePageSection context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLayoutCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SKUIEditorialLayout initWithEditorial:layoutCache:](v7, "initWithEditorial:layoutCache:", v6, v9);

      -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 0, self->_columnWidth);
      -[NSMapTable setObject:forKey:](self->_editorialLayouts, "setObject:forKey:", v5, v4);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_enumerateVisibleBricksUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  objc_msgSend(v12, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SKUIBrickGridPageSection__enumerateVisibleBricksUsingBlock___block_invoke;
  v13[3] = &unk_1E73A8338;
  v15 = v4;
  v16 = v8;
  v14 = v6;
  v10 = v4;
  v11 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

}

void __62__SKUIBrickGridPageSection__enumerateVisibleBricksUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "section") == *(_QWORD *)(a1 + 48))
  {
    v3 = objc_msgSend(v5, "item");
    if (v3 < objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (void)_loadArtworkForBrick:(id)a3 artworkLoader:(id)a4 reason:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  SKUIArtworkRequest *v11;
  void *v12;
  NSMapTable *artworkRequests;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  objc_msgSend(v15, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(SKUIArtworkRequest);
    +[SKUIStyledImageDataConsumer brickConsumerWithBrickSize:](SKUIStyledImageDataConsumer, "brickConsumerWithBrickSize:", self->_columnWidth, self->_baseHeight);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtworkRequest setDataConsumer:](v11, "setDataConsumer:", v12);

    -[SKUIArtworkRequest setDelegate:](v11, "setDelegate:", self);
    -[SKUIArtworkRequest setURL:](v11, "setURL:", v10);
    artworkRequests = self->_artworkRequests;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v11, "requestIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v14, v15);

    objc_msgSend(v8, "loadResourceWithRequest:reason:", v11, a5);
  }

}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMissingItemData"))
  {
    -[SKUIBrickGridPageSection _missingItemLoader](self, "_missingItemLoader");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrickGridPageSection initWithPageComponent:]";
}

@end
