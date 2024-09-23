@implementation SKUIGallerySwooshViewController

- (SKUIGallerySwooshViewController)initWithGallerySwoosh:(id)a3
{
  id v5;
  SKUIGallerySwooshViewController *v6;
  SKUIGallerySwooshViewController *v7;
  id *p_gallerySwoosh;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double itemHeight;
  double v14;
  objc_super v16;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGallerySwooshViewController initWithGallerySwoosh:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGallerySwooshViewController;
  v6 = -[SKUIGallerySwooshViewController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    p_gallerySwoosh = (id *)&v6->_gallerySwoosh;
    objc_storeStrong((id *)&v6->_gallerySwoosh, a3);
    objc_msgSend(*p_gallerySwoosh, "mediaComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 >= 1)
    {
      for (i = 0; i != v10; ++i)
      {
        -[SKUIGallerySwooshViewController artworkForItemAtIndex:](v7, "artworkForItemAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        itemHeight = v7->_itemHeight;
        v14 = (double)objc_msgSend(v12, "height");
        if (itemHeight >= v14)
          v14 = itemHeight;
        v7->_itemHeight = v14;

      }
    }
    if ((objc_msgSend(*p_gallerySwoosh, "showsMediaTitles") & 1) != 0)
      v7->_itemHeight = v7->_itemHeight + 27.0;
  }

  return v7;
}

- (id)artworkForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SKUISwooshPageComponent mediaComponents](self->_gallerySwoosh, "mediaComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bestThumbnailArtwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performActionForItemAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionView *collectionView;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentChildView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginPlaybackAnimated:", v4);

}

- (void)setColorScheme:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[SKUISwooshViewController colorScheme](self, "colorScheme");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIGallerySwooshViewController;
    -[SKUISwooshViewController setColorScheme:](&v6, sel_setColorScheme_, v4);
    -[SKUISwooshView setColoringWithColorScheme:](self->_swooshView, "setColoringWithColorScheme:", v4);
  }

}

- (id)indexPathsForVisibleItems
{
  return -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  v5.receiver = self;
  v5.super_class = (Class)SKUIGallerySwooshViewController;
  -[SKUISwooshViewController setDelegate:](&v5, sel_setDelegate_, v4);

}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  UICollectionView *collectionView;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  collectionView = self->_collectionView;
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = a3;
  objc_msgSend(v6, "indexPathForItem:inSection:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contentChildView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailImage:", v7);

}

- (void)loadView
{
  SKUISwooshView *v3;
  SKUISwooshView *swooshView;
  SKUISwooshView *v5;
  void *v6;
  SKUISwooshView *v7;
  void *v8;
  double v9;
  double v10;
  UICollectionView *collectionView;
  SKUISwooshCollectionViewLayout *v12;
  UICollectionView *v13;
  UICollectionView *v14;
  UICollectionView *v15;
  void *v16;
  UICollectionView *v17;
  float v18;

  if (!self->_swooshView)
  {
    v3 = objc_alloc_init(SKUISwooshView);
    swooshView = self->_swooshView;
    self->_swooshView = v3;

    v5 = self->_swooshView;
    -[SKUISwooshViewController colorScheme](self, "colorScheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setColoringWithColorScheme:](v5, "setColoringWithColorScheme:", v6);

    v7 = self->_swooshView;
    -[SKUISwooshPageComponent title](self->_gallerySwoosh, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setTitle:](v7, "setTitle:", v8);

    -[SKUISwooshView contentInsets](self->_swooshView, "contentInsets");
    -[SKUISwooshView setCollectionViewInsets:](self->_swooshView, "setCollectionViewInsets:", 0.0, -v9, 0.0, -v10);
  }
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v12 = objc_alloc_init(SKUISwooshCollectionViewLayout);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v12, "setMinimumInteritemSpacing:", 20.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v12, "setMinimumLineSpacing:", 20.0);
    -[UICollectionViewFlowLayout setScrollDirection:](v12, "setScrollDirection:", 1);
    -[SKUISwooshCollectionViewLayout setSnapsToItemBoundaries:](v12, "setSnapsToItemBoundaries:", 1);
    v13 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v12, 0.0, 0.0, 0.0, self->_itemHeight);
    v14 = self->_collectionView;
    self->_collectionView = v13;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("0"));
    -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
    v15 = self->_collectionView;
    -[SKUISwooshView backgroundColor](self->_swooshView, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    v17 = self->_collectionView;
    +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate](SKUISwooshCollectionViewLayout, "snapToBoundariesDecelerationRate");
    -[UICollectionView setDecelerationRate:](v17, "setDecelerationRate:", v18);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setScrollsToTop:](self->_collectionView, "setScrollsToTop:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);

    collectionView = self->_collectionView;
  }
  -[SKUISwooshView setCollectionView:](self->_swooshView, "setCollectionView:", collectionView);
  -[SKUISwooshView sizeToFit](self->_swooshView, "sizeToFit");
  -[SKUIGallerySwooshViewController setView:](self, "setView:", self->_swooshView);
}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SKUISwooshViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "bounds");
    objc_msgSend(v9, "convertRect:toView:", self->_collectionView);
    -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v6, "swoosh:didChangePlaybackState:forItemAtIndex:", self, a4, objc_msgSend(v7, "item"));

  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("0"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBackgroundColor:", v9);
  v10 = objc_msgSend(v6, "item");

  -[SKUISwooshPageComponent mediaComponents](self->_gallerySwoosh, "mediaComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUISwooshViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "swoosh:imageForCellAtIndex:", self, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v12, "bestThumbnailArtwork");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SKUIGallerySwooshViewController _newViewWithMediaComponent:](self, "_newViewWithMediaComponent:", v12);
  objc_msgSend(v16, "setThumbnailImage:", v14);
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v21 = (double)objc_msgSend(v15, "width");
  v22 = (double)objc_msgSend(v15, "height");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v23);

  objc_msgSend(v16, "setFrame:", v18, v20, v21, v22);
  objc_msgSend(v8, "setContentChildView:", v16);
  if (-[SKUISwooshPageComponent showsMediaTitles](self->_gallerySwoosh, "showsMediaTitles"))
  {
    -[SKUISwooshViewController colorScheme](self, "colorScheme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColoringWithColorScheme:", v24);

    objc_msgSend(v12, "title");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_1E73A9FB0;
    objc_msgSend(v8, "setTitle:", v27);

  }
  if (self->_delegateWantsWillDisplay)
    objc_msgSend(v13, "swoosh:willDisplayCellAtIndex:", self, v10);

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SKUISwooshPageComponent mediaComponents](self->_gallerySwoosh, "mediaComponents", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SKUISwooshViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "swoosh:didSelectCellAtIndex:", self, objc_msgSend(v6, "item"));

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 15.0;
  v7 = 0.0;
  v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double itemHeight;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  itemHeight = self->_itemHeight;
  -[SKUIGallerySwooshViewController artworkForItemAtIndex:](self, "artworkForItemAtIndex:", objc_msgSend(a5, "item", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)objc_msgSend(v6, "width");

  v8 = v7;
  v9 = itemHeight;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_newViewWithMediaComponent:(id)a3
{
  id v4;
  SKUIEmbeddedMediaView *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(SKUIEmbeddedMediaView);
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEmbeddedMediaView setAccessibilityLabel:](v5, "setAccessibilityLabel:", v6);

  -[SKUIEmbeddedMediaView setDelegate:](v5, "setDelegate:", self);
  -[SKUIEmbeddedMediaView setMediaType:](v5, "setMediaType:", objc_msgSend(v4, "mediaType"));
  objc_msgSend(v4, "mediaURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIEmbeddedMediaView setMediaURLString:](v5, "setMediaURLString:", v7);
  return v5;
}

- (SKUISwooshPageComponent)gallerySwoosh
{
  return self->_gallerySwoosh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshView, 0);
  objc_storeStrong((id *)&self->_gallerySwoosh, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)initWithGallerySwoosh:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGallerySwooshViewController initWithGallerySwoosh:]";
}

@end
