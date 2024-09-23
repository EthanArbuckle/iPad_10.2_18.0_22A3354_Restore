@implementation SKUILockupSwooshViewController

- (SKUILockupSwooshViewController)initWithItemList:(id)a3
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
  SKUILockupSwooshViewController *v13;
  SKUILockupSwooshViewController *v14;
  SKUILockupStyle *p_defaultLockupStyle;
  __int128 v16;
  uint64_t v17;
  NSString *seeAllTitle;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  NSArray *lockups;
  void *v30;
  uint64_t v31;
  NSURL *seeAllURL;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unint64_t visibleFields;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILockupSwooshViewController initWithItemList:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)SKUILockupSwooshViewController;
  v13 = -[SKUILockupSwooshViewController init](&v41, sel_init);
  v14 = v13;
  if (v13)
  {
    p_defaultLockupStyle = &v13->_defaultLockupStyle;
    SKUILockupStyleDefault((uint64_t)&v39);
    v16 = v39;
    v14->_defaultLockupStyle.visibleFields = visibleFields;
    *(_OWORD *)&p_defaultLockupStyle->artworkSize = v16;
    objc_msgSend(v4, "seeAllTitle");
    v17 = objc_claimAutoreleasedReturnValue();
    seeAllTitle = v14->_seeAllTitle;
    v14->_seeAllTitle = (NSString *)v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24);
          v26 = *(_OWORD *)&p_defaultLockupStyle->artworkSize;
          visibleFields = v14->_defaultLockupStyle.visibleFields;
          v39 = v26;
          v27 = -[SKUILockupSwooshViewController _newLockupComponentWithItem:defaultStyle:](v14, "_newLockupComponentWithItem:defaultStyle:", v25, &v39);
          objc_msgSend(v19, "addObject:", v27);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v22);
    }
    v28 = objc_msgSend(v19, "copy");
    lockups = v14->_lockups;
    v14->_lockups = (NSArray *)v28;

    objc_msgSend(v4, "seeAllURLString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v30);
      seeAllURL = v14->_seeAllURL;
      v14->_seeAllURL = (NSURL *)v31;

    }
    v14->_swooshType = objc_msgSend((id)objc_opt_class(), "_swooshTypeForLockups:", v14->_lockups);
    objc_msgSend(v4, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupSwooshViewController setTitle:](v14, "setTitle:", v33);

  }
  return v14;
}

- (SKUILockupSwooshViewController)initWithSwoosh:(id)a3
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
  SKUILockupSwooshViewController *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *lockups;
  uint64_t v24;
  NSString *seeAllTitle;
  uint64_t v26;
  NSURL *seeAllURL;
  void *v28;
  __int128 v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILockupSwooshViewController initWithSwoosh:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)SKUILockupSwooshViewController;
  v13 = -[SKUILockupSwooshViewController init](&v36, sel_init);
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "lockups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "item");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v17);
    }
    v22 = objc_msgSend(v14, "copy");
    lockups = v13->_lockups;
    v13->_lockups = (NSArray *)v22;

    if (v4)
    {
      objc_msgSend(v4, "lockupStyle");
    }
    else
    {
      v30 = 0uLL;
      v31 = 0;
    }
    v13->_defaultLockupStyle.visibleFields = v31;
    *(_OWORD *)&v13->_defaultLockupStyle.artworkSize = v30;
    v13->_seeAllStyle = objc_msgSend(v4, "seeAllStyle");
    objc_msgSend(v4, "seeAllTitle");
    v24 = objc_claimAutoreleasedReturnValue();
    seeAllTitle = v13->_seeAllTitle;
    v13->_seeAllTitle = (NSString *)v24;

    objc_msgSend(v4, "seeAllURL");
    v26 = objc_claimAutoreleasedReturnValue();
    seeAllURL = v13->_seeAllURL;
    v13->_seeAllURL = (NSURL *)v26;

    v13->_swooshType = objc_msgSend((id)objc_opt_class(), "_swooshTypeForLockups:", v13->_lockups);
    objc_msgSend(v4, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupSwooshViewController setTitle:](v13, "setTitle:", v28);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[SKUISwooshView chevronTitleControl](self->_swooshView, "chevronTitleControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUISwooshView seeAllControl](self->_swooshView, "seeAllControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshViewController;
  -[SKUILockupSwooshViewController dealloc](&v5, sel_dealloc);
}

- (NSArray)items
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_lockups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "item", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CGRect)seeAllButtonFrame
{
  int64_t seeAllStyle;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  seeAllStyle = self->_seeAllStyle;
  if (seeAllStyle == 1)
  {
    -[SKUISwooshView chevronTitleControl](self->_swooshView, "chevronTitleControl");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (seeAllStyle)
    {
      v4 = 0;
      goto LABEL_7;
    }
    -[SKUISwooshView seeAllControl](self->_swooshView, "seeAllControl");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
LABEL_7:
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setLockups:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  NSArray *lockups;
  double height;
  double width;
  UICollectionView *collectionView;
  BOOL *p_didInitialReload;
  _QWORD v17[4];
  id v18;
  id v19;
  SKUILockupSwooshViewController *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0x7FFFFFFFFFFFFFFFLL;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__35;
  v27 = __Block_byref_object_dispose__35;
  v28 = 0;
  if (-[NSArray count](self->_lockups, "count"))
  {
    v30[3] = 0;
    -[NSArray objectAtIndex:](self->_lockups, "objectAtIndex:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v24[5];
    v24[5] = v5;

  }
  -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__SKUILockupSwooshViewController_setLockups___block_invoke;
  v17[3] = &unk_1E73A4988;
  v21 = &v23;
  v9 = v8;
  v18 = v9;
  v10 = v7;
  v22 = &v29;
  v19 = v10;
  v20 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);
  v11 = (NSArray *)objc_msgSend(v9, "copy");
  lockups = self->_lockups;
  self->_lockups = v11;

  if (objc_msgSend(v10, "count"))
  {
    width = self->_maxCellSize.width;
    height = self->_maxCellSize.height;
    self->_swooshType = objc_msgSend((id)objc_opt_class(), "_swooshTypeForLockups:", self->_lockups);
    -[SKUILockupSwooshViewController _reloadSizes](self, "_reloadSizes");
    collectionView = self->_collectionView;
    if (collectionView)
    {
      if (width == self->_maxCellSize.width && height == self->_maxCellSize.height)
      {
        p_didInitialReload = &self->_didInitialReload;
        if (self->_didInitialReload)
        {
          -[UICollectionView insertItemsAtIndexPaths:](collectionView, "insertItemsAtIndexPaths:", v10);
          goto LABEL_11;
        }
      }
      else
      {
        -[UICollectionView frame](collectionView, "frame");
        -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
        -[SKUISwooshView sizeToFit](self->_swooshView, "sizeToFit");
        p_didInitialReload = &self->_didInitialReload;
      }
      *p_didInitialReload = 1;
      -[UICollectionView reloadData](self->_collectionView, "reloadData");
    }
  }
LABEL_11:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

}

void __45__SKUILockupSwooshViewController_setLockups___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v4 && (v5 = objc_msgSend(v4, "itemIdentifier"), v5 == objc_msgSend(v11, "itemIdentifier")))
    {
      v6 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1064), "count");
      if (v6 >= v7)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1064), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
      if (v6 >= v7)
        goto LABEL_8;
    }
    else
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "count");
      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v8);
    }

LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  }

}

- (void)setSeeAllHidden:(BOOL)a3
{
  _BOOL8 v3;
  int64_t seeAllStyle;
  _BOOL8 v5;
  id v6;

  if (self->_seeAllHidden != a3)
  {
    v3 = a3;
    self->_seeAllHidden = a3;
    seeAllStyle = self->_seeAllStyle;
    if (seeAllStyle == 1)
    {
      v5 = !a3 && self->_seeAllURL != 0;
      -[SKUISwooshView setShowsChevronForTitle:](self->_swooshView, "setShowsChevronForTitle:", v5);
    }
    else if (!seeAllStyle)
    {
      -[SKUISwooshView seeAllControl](self->_swooshView, "seeAllControl");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", v3);

    }
  }
}

- (SKUIVideoImageDataConsumer)videoImageConsumer
{
  SKUIVideoImageDataConsumer *videoImageConsumer;
  SKUIVideoImageDataConsumer *v4;
  SKUIVideoImageDataConsumer *v5;
  void *v6;
  SKUIVideoImageDataConsumer *v7;
  void *v8;

  videoImageConsumer = self->_videoImageConsumer;
  if (!videoImageConsumer)
  {
    v4 = objc_alloc_init(SKUIVideoImageDataConsumer);
    v5 = self->_videoImageConsumer;
    self->_videoImageConsumer = v4;

    -[SKUIVideoImageDataConsumer setAllowedOrientations:](self->_videoImageConsumer, "setAllowedOrientations:", 2);
    -[SKUIVideoImageDataConsumer setLandscapeSize:](self->_videoImageConsumer, "setLandscapeSize:", self->_metrics.videoThumbnailSize.width, self->_metrics.videoThumbnailSize.height);
    -[SKUISwooshViewController colorScheme](self, "colorScheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_videoImageConsumer;
    objc_msgSend(v6, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIVideoImageDataConsumer setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[SKUIVideoImageDataConsumer setColorScheme:](self->_videoImageConsumer, "setColorScheme:", v6);
    videoImageConsumer = self->_videoImageConsumer;
  }
  return videoImageConsumer;
}

- (void)deselectAllItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  UICollectionView *collectionView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertRect:toView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)indexPathsForVisibleItems
{
  return -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
}

- (id)popImageViewForItemAtIndex:(int64_t)a3
{
  UICollectionView *collectionView;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableIndexSet *hiddenIconIndexSet;
  NSMutableIndexSet *v15;
  NSMutableIndexSet *v16;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v8, "iconImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithImage:", v10);

    objc_msgSend(v8, "iconImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupSwooshViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    objc_msgSend(v13, "convertRect:fromView:", v7);
    objc_msgSend(v11, "setFrame:");

    hiddenIconIndexSet = self->_hiddenIconIndexSet;
    if (!hiddenIconIndexSet)
    {
      v15 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
      v16 = self->_hiddenIconIndexSet;
      self->_hiddenIconIndexSet = v15;

      hiddenIconIndexSet = self->_hiddenIconIndexSet;
    }
    -[NSMutableIndexSet addIndex:](hiddenIconIndexSet, "addIndex:", a3);
    objc_msgSend(v8, "setIconImageHidden:", 1);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setClientContext:(id)a3
{
  $45B10E57DEA105D1635A7EC64B0FE0A5 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshViewController;
  -[SKUISwooshViewController setClientContext:](&v5, sel_setClientContext_, a3);
  -[SKUILockupSwooshViewController _lockupSwooshMetrics](self, "_lockupSwooshMetrics");
  self->_metrics = v4;
  -[SKUILockupSwooshViewController _reloadSizes](self, "_reloadSizes");
}

- (void)setColorScheme:(id)a3
{
  id v4;
  id v5;
  SKUIVideoImageDataConsumer *videoImageConsumer;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[SKUISwooshViewController colorScheme](self, "colorScheme");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUILockupSwooshViewController;
    -[SKUISwooshViewController setColorScheme:](&v8, sel_setColorScheme_, v4);
    -[SKUIItemArtworkContext setColorScheme:](self->_artworkContext, "setColorScheme:", v4);
    -[SKUISwooshView setColoringWithColorScheme:](self->_swooshView, "setColoringWithColorScheme:", v4);
    videoImageConsumer = self->_videoImageConsumer;
    objc_msgSend(v4, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIVideoImageDataConsumer setBackgroundColor:](videoImageConsumer, "setBackgroundColor:", v7);

    -[SKUIVideoImageDataConsumer setColorScheme:](self->_videoImageConsumer, "setColorScheme:", v4);
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshViewController;
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

  objc_msgSend(v10, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIconImage:", v7);

}

- (void)setVideoThumbnail:(id)a3 forItemAtIndex:(int64_t)a4
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

  objc_msgSend(v10, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoThumbnailImage:", v7);

}

- (void)unhideImages
{
  NSMutableIndexSet *hiddenIconIndexSet;
  NSMutableIndexSet *v4;
  _QWORD v5[5];

  hiddenIconIndexSet = self->_hiddenIconIndexSet;
  if (hiddenIconIndexSet)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__SKUILockupSwooshViewController_unhideImages__block_invoke;
    v5[3] = &unk_1E73A4750;
    v5[4] = self;
    -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](hiddenIconIndexSet, "enumerateIndexesWithOptions:usingBlock:", 0, v5);
    v4 = self->_hiddenIconIndexSet;
    self->_hiddenIconIndexSet = 0;

  }
}

void __46__SKUILockupSwooshViewController_unhideImages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForItemAtIndexPath:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconImageHidden:", 0);

}

- (void)loadView
{
  SKUISwooshView *v3;
  SKUISwooshView *swooshView;
  int64_t seeAllStyle;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  SKUISwooshView *v10;
  void *v11;
  double v12;
  double v13;
  NSString *v14;
  UICollectionView *collectionView;
  SKUISwooshCollectionViewLayout *v16;
  void *v17;
  double *p_interItemSpacingVideoLockup;
  NSString *seeAllTitle;
  UICollectionView *v20;
  UICollectionView *v21;
  UICollectionView *v22;
  void *v23;
  UICollectionView *v24;
  float v25;
  SKUISwooshView *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *v31;

  if (!self->_swooshView)
  {
    v3 = objc_alloc_init(SKUISwooshView);
    swooshView = self->_swooshView;
    self->_swooshView = v3;

    seeAllStyle = self->_seeAllStyle;
    if (seeAllStyle == 1)
    {
      -[SKUISwooshView chevronTitleControl](self->_swooshView, "chevronTitleControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__seeAllAction_, 64);

      v9 = !self->_seeAllHidden && self->_seeAllURL != 0;
      -[SKUISwooshView setShowsChevronForTitle:](self->_swooshView, "setShowsChevronForTitle:", v9);
    }
    else if (!seeAllStyle)
    {
      -[SKUISwooshView seeAllControl](self->_swooshView, "seeAllControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__seeAllAction_, 64);

      -[SKUISwooshView seeAllControl](self->_swooshView, "seeAllControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", self->_seeAllHidden);

    }
    v10 = self->_swooshView;
    -[SKUISwooshViewController colorScheme](self, "colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setColoringWithColorScheme:](v10, "setColoringWithColorScheme:", v11);

    -[SKUISwooshView contentInsets](self->_swooshView, "contentInsets");
    -[SKUISwooshView setCollectionViewInsets:](self->_swooshView, "setCollectionViewInsets:", -5.0, -v12, 2.0, -v13);
  }
  if (self->_seeAllStyle || !self->_seeAllURL)
  {
    v14 = 0;
  }
  else
  {
    seeAllTitle = self->_seeAllTitle;
    if (seeAllTitle)
    {
      v14 = seeAllTitle;
    }
    else
    {
      -[SKUISwooshViewController clientContext](self, "clientContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        objc_msgSend(v28, "localizedStringForKey:", CFSTR("SWOOSH_SEE_ALL_TITLE"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SWOOSH_SEE_ALL_TITLE"), 0);
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();

      v14 = v31;
    }
  }
  v30 = v14;
  -[SKUISwooshView setSeeAllTitle:](self->_swooshView, "setSeeAllTitle:", v14);
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v16 = objc_alloc_init(SKUISwooshCollectionViewLayout);
    -[SKUISwooshView backgroundColor](self->_swooshView, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshCollectionViewLayout setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[SKUISwooshCollectionViewLayout setSnapsToItemBoundaries:](v16, "setSnapsToItemBoundaries:", 1);
    if ((self->_defaultLockupStyle.visibleFields & 0x400) != 0)
    {
      p_interItemSpacingVideoLockup = &self->_metrics.interItemSpacingVideoLockup;
    }
    else if (self->_swooshType == 2)
    {
      p_interItemSpacingVideoLockup = &self->_metrics.interItemSpacingNewsstand;
    }
    else
    {
      p_interItemSpacingVideoLockup = &self->_metrics.interItemSpacingMixed;
    }
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v16, "setMinimumInteritemSpacing:", *p_interItemSpacingVideoLockup);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v16, "setMinimumLineSpacing:", *p_interItemSpacingVideoLockup);
    v20 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v16, 0.0, 0.0, 0.0, self->_maxCellSize.height);
    v21 = self->_collectionView;
    self->_collectionView = v20;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("0"));
    -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
    v22 = self->_collectionView;
    -[SKUISwooshView backgroundColor](self->_swooshView, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    v24 = self->_collectionView;
    +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate](SKUISwooshCollectionViewLayout, "snapToBoundariesDecelerationRate");
    -[UICollectionView setDecelerationRate:](v24, "setDecelerationRate:", v25);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setScrollsToTop:](self->_collectionView, "setScrollsToTop:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);

    collectionView = self->_collectionView;
  }
  -[SKUISwooshView setCollectionView:](self->_swooshView, "setCollectionView:", collectionView);
  v26 = self->_swooshView;
  -[SKUILockupSwooshViewController title](self, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISwooshView setTitle:](v26, "setTitle:", v27);

  -[SKUISwooshView sizeToFit](self->_swooshView, "sizeToFit");
  -[SKUILockupSwooshViewController setView:](self, "setView:", self->_swooshView);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_didInitialReload)
  {
    self->_didInitialReload = 1;
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), v3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUILockupSwooshViewController;
  -[SKUILockupSwooshViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("0"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISwooshViewController clientContext](self, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClientContext:", v8);
  v10 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndex:](self->_lockups, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureForItem:clientContext:", v12, v8);

  -[SKUISwooshViewController colorScheme](self, "colorScheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColoringWithColorScheme:", v13);

  objc_msgSend(v9, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", v10));
  objc_msgSend(v9, "setMaxImageSize:", self->_maxImageSize.width, self->_maxImageSize.height);
  objc_msgSend(v9, "setVideoSize:", self->_metrics.videoThumbnailSize.width, self->_metrics.videoThumbnailSize.height);
  if (v11)
  {
    objc_msgSend(v11, "lockupStyle");
    v14 = v24;
  }
  else
  {
    v14 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
  }
  objc_msgSend(v9, "setVisibleFields:", v14);
  -[SKUISwooshViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "swoosh:imageForCellAtIndex:", self, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v9, "setIconImage:", v16);
  if (v11)
  {
    objc_msgSend(v11, "lockupStyle");
    if ((v21 & 0x400) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "swoosh:videoThumbnailForCellAtIndex:", self, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
  }
  objc_msgSend(v9, "setVideoThumbnailImage:", v17, v19, v20, v21, v22, v23, v24);
  if (self->_delegateWantsWillDisplay)
    objc_msgSend(v15, "swoosh:willDisplayCellAtIndex:", self, v10);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_lockups, "count", a3, a4);
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
  double horizontalPadding;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  if ((self->_defaultLockupStyle.visibleFields & 0x400) != 0)
    horizontalPadding = self->_metrics.horizontalPadding;
  else
    horizontalPadding = self->_metrics.horizontalPadding
                      - floor((self->_maxCellSize.width - self->_maxImageSize.width) * 0.5);
  v6 = 0.0;
  v7 = 0.0;
  v8 = horizontalPadding;
  result.right = v8;
  result.bottom = v7;
  result.left = horizontalPadding;
  result.top = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  SKUILockupSwooshCollectionViewCell *v7;
  void *v8;
  NSArray *lockups;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SKUIItemArtworkContext *artworkContext;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat height;
  double v22;
  double v23;
  uint64_t v24;
  CGSize result;

  v6 = a5;
  v7 = objc_alloc_init(SKUILockupSwooshCollectionViewCell);
  -[SKUILockupSwooshCollectionViewCell layout](v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  lockups = self->_lockups;
  v10 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndex:](lockups, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaxImageSize:", self->_maxImageSize.width, self->_maxImageSize.height);
  objc_msgSend(v8, "setVideoSize:", self->_metrics.videoThumbnailSize.width, self->_metrics.videoThumbnailSize.height);
  if (v11)
  {
    objc_msgSend(v11, "lockupStyle");
    v12 = v24;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v8, "setVisibleFields:", v12);
  artworkContext = self->_artworkContext;
  objc_msgSend(v11, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemArtworkContext imageSizeForItem:](artworkContext, "imageSizeForItem:", v14);
  v16 = v15;
  v18 = v17;

  objc_msgSend(v8, "cellSizeForImageOfSize:", v16, v18);
  v20 = v19;
  height = self->_maxCellSize.height;

  v22 = v20;
  v23 = height;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_seeAllAction:(id)a3
{
  id v4;

  -[SKUISwooshViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "swooshDidSelectSeeAll:", self);

}

- (void)_setExpectedImageSize:(CGSize)a3
{
  self->_expectedImageSize = a3;
  -[SKUILockupSwooshViewController _reloadSizes](self, "_reloadSizes");
}

- (CGSize)_maximumCellSizeForImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  SKUILockupSwooshCollectionViewCell *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = self->_metrics.videoThumbnailSize.width;
  v9 = self->_metrics.videoThumbnailSize.height;
  v10 = objc_alloc_init(SKUILockupSwooshCollectionViewCell);
  -[SKUILockupSwooshCollectionViewCell layout](v10, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_lockups;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v14 = v7;
  v15 = v6;
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v30;
    v14 = v7;
    v15 = v6;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "setVideoSize:", v8, v9);
        if (v19)
        {
          objc_msgSend(v19, "lockupStyle");
          v20 = v28;
        }
        else
        {
          v20 = 0;
          v28 = 0;
        }
        objc_msgSend(v11, "setVisibleFields:", v20);
        objc_msgSend(v11, "cellSizeForImageOfSize:", width, height);
        if (v22 >= v14)
          v14 = v22;
        if (v21 >= v15)
          v15 = v21;
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  if (v15 == v6 && v14 == v7)
  {
    objc_msgSend(v11, "setVideoSize:", v8, v9);
    objc_msgSend(v11, "setVisibleFields:", self->_defaultLockupStyle.visibleFields);
    objc_msgSend(v11, "cellSizeForImageOfSize:", width, height);
    v15 = v24;
    v14 = v25;
  }

  v26 = v15;
  v27 = v14;
  result.height = v27;
  result.width = v26;
  return result;
}

- (id)_newArtworkContextForSwooshType:(int64_t)a3
{
  SKUIItemArtworkContext *v5;
  void *v6;
  $45B10E57DEA105D1635A7EC64B0FE0A5 *p_metrics;
  void *v8;
  void *v9;
  double *p_height;
  CGSize *p_videoLockupIconSize;
  double width;
  void *v13;
  void *v14;
  void *v15;

  v5 = objc_alloc_init(SKUIItemArtworkContext);
  -[SKUISwooshViewController colorScheme](self, "colorScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemArtworkContext setColorScheme:](v5, "setColorScheme:", v6);

  p_metrics = &self->_metrics;
  if ((self->_defaultLockupStyle.visibleFields & 0x400) != 0)
  {
    p_videoLockupIconSize = &self->_metrics.videoLockupIconSize;
    width = self->_metrics.videoLockupIconSize.width;
    p_height = &p_videoLockupIconSize->height;
    +[SKUIProductImageDataConsumer consumerWithSize:](SKUIProductImageDataConsumer, "consumerWithSize:", width, p_videoLockupIconSize->height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setGeneralConsumer:](v5, "setGeneralConsumer:", v13);

    +[SKUIStyledImageDataConsumer appIconConsumerWithSize:](SKUIStyledImageDataConsumer, "appIconConsumerWithSize:", p_videoLockupIconSize->width, p_videoLockupIconSize->height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setIconConsumer:](v5, "setIconConsumer:", v14);

  }
  else
  {
    +[SKUIProductImageDataConsumer consumerWithSize:](SKUIProductImageDataConsumer, "consumerWithSize:", self->_metrics.newsstandSize.width, self->_metrics.newsstandSize.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setGeneralConsumer:](v5, "setGeneralConsumer:", v8);

    +[SKUIStyledImageDataConsumer appIconConsumerWithSize:](SKUIStyledImageDataConsumer, "appIconConsumerWithSize:", p_metrics->iconSize.width, p_metrics->iconSize.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setIconConsumer:](v5, "setIconConsumer:", v9);

    if (a3)
      p_height = &p_metrics->newsstandSwooshSize.height;
    else
      p_height = &p_metrics->newsstandSize.height;
    if (a3)
      p_videoLockupIconSize = &p_metrics->newsstandSwooshSize;
    else
      p_videoLockupIconSize = &p_metrics->newsstandSize;
  }
  +[SKUIStyledImageDataConsumer productImageConsumerWithSize:](SKUIStyledImageDataConsumer, "productImageConsumerWithSize:", p_videoLockupIconSize->width, *p_height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemArtworkContext setNewsstandConsumer:](v5, "setNewsstandConsumer:", v15);

  return v5;
}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4
{
  id v5;
  SKUILockupComponent *v6;
  SKUILockupComponent *v7;
  __int128 v9;
  unint64_t visibleFields;

  v5 = a3;
  if (objc_msgSend(v5, "itemKind") == 17)
    a4->visibleFields = 150;
  v6 = [SKUILockupComponent alloc];
  v9 = *(_OWORD *)&a4->artworkSize;
  visibleFields = a4->visibleFields;
  v7 = -[SKUILockupComponent initWithItem:style:](v6, "initWithItem:style:", v5, &v9);

  return v7;
}

- (void)_reloadSizes
{
  SKUIItemArtworkContext *v3;
  SKUIItemArtworkContext *artworkContext;
  BOOL v5;
  double width;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v3 = -[SKUILockupSwooshViewController _newArtworkContextForSwooshType:](self, "_newArtworkContextForSwooshType:", self->_swooshType);
  artworkContext = self->_artworkContext;
  self->_artworkContext = v3;

  if (-[NSArray count](self->_lockups, "count")
    || (self->_expectedImageSize.width == *MEMORY[0x1E0C9D820]
      ? (v5 = self->_expectedImageSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v5 = 0),
        v5))
  {
    -[SKUIItemArtworkContext largestImageSizeForLockups:](self->_artworkContext, "largestImageSizeForLockups:", self->_lockups);
    self->_maxImageSize.width = width;
    self->_maxImageSize.height = v7;
  }
  else
  {
    self->_maxImageSize = self->_expectedImageSize;
    width = self->_maxImageSize.width;
  }
  -[SKUILockupSwooshViewController _maximumCellSizeForImageSize:](self, "_maximumCellSizeForImageSize:", width, self->_maxImageSize.height);
  self->_maxCellSize.width = v8;
  self->_maxCellSize.height = v9;
}

+ (int64_t)_swooshTypeForLockups:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "item");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isNewsstandApp");

        v6 |= v11 ^ 1;
        v7 |= v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
    if ((v7 & 1) != 0)
      v12 = 2;
    else
      v12 = 1;
    if ((v7 & 1 & v6) != 0)
      v12 = 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- ($0F9D46A54E891E2DFD6B960C8B4302D3)_lockupSwooshMetrics
{
  void *v4;
  uint64_t v5;
  $0F9D46A54E891E2DFD6B960C8B4302D3 *result;
  void *v12;
  double v13;
  double v14;
  CGSize v15;
  void *v16;
  double v17;
  double v18;

  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  retstr->var3 = 0u;
  retstr->var4 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  -[SKUISwooshViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SKUIUserInterfaceIdiom(v4);

  if (v5 == 1)
  {
    retstr->var0 = (CGSize)vdupq_n_s64(0x4056800000000000uLL);
    retstr->var1 = (CGSize)xmmword_1BBED1B20;
    retstr->var2 = (CGSize)xmmword_1BBED1B50;
    retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
    retstr->var4 = (CGSize)xmmword_1BBED1B60;
    *(_OWORD *)&retstr->var5 = xmmword_1BBED1B70;
    __asm { FMOV            V0.2D, #30.0 }
    *(_OWORD *)&retstr->var7 = _Q0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    if (v14 <= 375.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v18 = v17;

      if (v18 <= 320.0)
      {
        retstr->var0 = (CGSize)vdupq_n_s64(0x4052000000000000uLL);
        retstr->var1 = (CGSize)xmmword_1BBED1AC0;
        retstr->var2 = (CGSize)xmmword_1BBED1AD0;
        retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
        v15 = (CGSize)xmmword_1BBED1AE0;
      }
      else
      {
        retstr->var0 = (CGSize)vdupq_n_s64(0x4057C00000000000uLL);
        retstr->var1 = (CGSize)xmmword_1BBED1AF0;
        retstr->var2 = (CGSize)xmmword_1BBED1B00;
        retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
        v15 = (CGSize)xmmword_1BBED1B10;
      }
    }
    else
    {
      retstr->var0 = (CGSize)vdupq_n_s64(0x4054000000000000uLL);
      retstr->var1 = (CGSize)xmmword_1BBED1B20;
      retstr->var2 = (CGSize)xmmword_1BBED1B30;
      retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
      v15 = (CGSize)xmmword_1BBED1B40;
    }
    __asm { FMOV            V1.2D, #15.0 }
    retstr->var4 = v15;
    *(_OWORD *)&retstr->var5 = _Q1;
    *(_OWORD *)&retstr->var7 = _Q1;
  }
  return result;
}

- (SKUIItemArtworkContext)artworkContext
{
  return self->_artworkContext;
}

- (NSArray)lockups
{
  return self->_lockups;
}

- (int64_t)swooshType
{
  return self->_swooshType;
}

- (void)setSwooshType:(int64_t)a3
{
  self->_swooshType = a3;
}

- (BOOL)isSeeAllHidden
{
  return self->_seeAllHidden;
}

- (NSURL)seeAllURL
{
  return self->_seeAllURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoImageConsumer, 0);
  objc_storeStrong((id *)&self->_swooshView, 0);
  objc_storeStrong((id *)&self->_seeAllURL, 0);
  objc_storeStrong((id *)&self->_seeAllTitle, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);
}

- (void)initWithItemList:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithSwoosh:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
