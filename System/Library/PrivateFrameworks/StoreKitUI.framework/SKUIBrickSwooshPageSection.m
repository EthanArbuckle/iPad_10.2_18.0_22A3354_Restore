@implementation SKUIBrickSwooshPageSection

- (SKUIBrickSwooshPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIBrickSwooshPageSection *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrickSwooshPageSection initWithPageComponent:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIBrickSwooshPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  -[SKUIBrickSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIBrickSwooshPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemViewElement:", v9);

  -[SKUIBrickSwooshViewController indexPathsForVisibleItems](self->_swooshViewController, "indexPathsForVisibleItems");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1BCCE6C7C](v11);
        -[SKUIBrickSwooshPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", objc_msgSend(v15, "item", (_QWORD)v17), v7);
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v12 = v11;
    }
    while (v11);
  }

}

- (void)willAppearInContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SKUIBrickSwooshPageSectionReuseIdentifier"));

}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SKUIBrickSwooshPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIBrickSwooshPageSection _swooshViewController](self, "_swooshViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentChildView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[SKUIStorePageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v11);

    objc_msgSend(v7, "setContentChildView:", v9);
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
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
  CGSize result;

  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIBrickSwooshPageSection _swooshViewController](self, "_swooshViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;

  v12 = v11;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  -[SKUISwooshArtworkLoader deprioritizePendingImageLoads](self->_artworkLoader, "deprioritizePendingImageLoads", a3);
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;

  -[SKUIBrickSwooshPageSection _artworkLoader](self, "_artworkLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadImagesForNextPageWithReason:", a3);

  -[SKUIBrickSwooshPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", 0, a3);
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "count"))
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateBricksWithItems:", v10);
    -[SKUIBrickSwooshPageSection _swooshViewController](self, "_swooshViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bricks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBricks:", v8);

    -[SKUIBrickSwooshPageSection _artworkLoader](self, "_artworkLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadImagesForNextPageWithReason:", 0);

  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "bricks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v8, *MEMORY[0x1E0DAFC88], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v20, "frameForItemAtIndex:", a4);
    SKUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
    -[SKUIStorePageSection context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metricsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordEvent:", v9);

  }
  -[SKUIStorePageSection context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v8);
  objc_msgSend(v15, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 == v17)
    objc_msgSend(v20, "deselectAllItems");

}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "bricks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIBrickSwooshArtworkLoader cachedImageForBrick:](self->_artworkLoader, "cachedImageForBrick:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[SKUIBrickSwooshPageSection _artworkLoader](self, "_artworkLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadImageForBrick:reason:", v7, 1);
    objc_msgSend(v9, "placeholderImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[SKUIStorePageSection context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeImpressionsSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SKUIBrickSwooshPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", a4, v8);
  -[SKUIBrickSwooshPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", a4, 1);

}

- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4
{
  SKUIBrickSwooshViewController *swooshViewController;
  id v6;
  void *v7;
  id v8;

  swooshViewController = self->_swooshViewController;
  v6 = a4;
  -[SKUIBrickSwooshViewController bricks](swooshViewController, "bricks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v8, "brickIdentifier"));
}

- (id)_artworkLoader
{
  SKUIBrickSwooshArtworkLoader *artworkLoader;
  void *v4;
  SKUIBrickSwooshArtworkLoader *v5;
  void *v6;
  void *v7;
  SKUIBrickSwooshArtworkLoader *v8;
  SKUIBrickSwooshArtworkLoader *v9;
  SKUIBrickSwooshArtworkLoader *v10;
  void *v11;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    -[SKUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SKUIBrickSwooshArtworkLoader alloc];
    objc_msgSend(v4, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBrickSwooshPageSection _swooshViewController](self, "_swooshViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUIBrickSwooshArtworkLoader initWithArtworkLoader:swoosh:](v5, "initWithArtworkLoader:swoosh:", v6, v7);
    v9 = self->_artworkLoader;
    self->_artworkLoader = v8;

    v10 = self->_artworkLoader;
    objc_msgSend(v4, "colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshArtworkLoader setPlaceholderColorWithColorScheme:](v10, "setPlaceholderColorWithColorScheme:", v11);

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMissingItemData"))
  {
    -[SKUIBrickSwooshPageSection _missingItemLoader](self, "_missingItemLoader");
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

- (id)_swooshViewController
{
  SKUIBrickSwooshViewController *swooshViewController;
  void *v4;
  void *v5;
  SKUIBrickSwooshViewController *v6;
  void *v7;
  SKUIBrickSwooshViewController *v8;
  SKUIBrickSwooshViewController *v9;
  SKUIBrickSwooshViewController *v10;
  void *v11;
  SKUIBrickSwooshViewController *v12;
  void *v13;
  void *v14;

  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    -[SKUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [SKUIBrickSwooshViewController alloc];
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUIBrickSwooshViewController initWithSwoosh:](v6, "initWithSwoosh:", v7);
    v9 = self->_swooshViewController;
    self->_swooshViewController = v8;

    v10 = self->_swooshViewController;
    objc_msgSend(v5, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBrickSwooshViewController setClientContext:](v10, "setClientContext:", v11);

    v12 = self->_swooshViewController;
    -[SKUIStorePageSection context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorScheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBrickSwooshViewController setColorScheme:](v12, "setColorScheme:", v14);

    -[SKUIBrickSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", self);
    objc_msgSend(v5, "addChildViewController:", self->_swooshViewController);

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrickSwooshPageSection initWithPageComponent:]";
}

@end
