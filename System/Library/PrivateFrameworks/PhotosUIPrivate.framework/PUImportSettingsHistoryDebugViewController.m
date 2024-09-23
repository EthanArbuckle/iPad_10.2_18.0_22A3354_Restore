@implementation PUImportSettingsHistoryDebugViewController

- (PUImportSettingsHistoryDebugViewController)init
{
  id v3;
  PUImportSettingsHistoryDebugViewController *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v7.receiver = self;
  v7.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  v4 = -[PUImportSettingsHistoryDebugViewController initWithCollectionViewLayout:](&v7, sel_initWithCollectionViewLayout_, v3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerChangeObserver:", v4);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  -[PUImportSettingsHistoryDebugViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  -[PUImportSettingsHistoryDebugViewController viewDidLoad](&v27, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Bottom"), 0, self, sel__scrollToBottom_);
  v28[0] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Reload"), 0, self, sel__reloadData);
  v28[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSettingsHistoryDebugViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItems:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 1);

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClipsToBounds:", 1);

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlwaysBounceVertical:", 1);

  v12 = (void *)objc_opt_class();
  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSettingsHistoryDebugViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[PUImportSettingsHistoryDebugViewController traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateFlowLayout:withBounds:traitCollection:", v14, v24, v17, v19, v21, v23);

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cell"));

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("header"));

  -[PUImportSettingsHistoryDebugViewController _reloadData](self, "_reloadData");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  -[PUImportSettingsHistoryDebugViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  v3 = (void *)objc_opt_class();
  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSettingsHistoryDebugViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PUImportSettingsHistoryDebugViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateFlowLayout:withBounds:traitCollection:", v5, v15, v8, v10, v12, v14);

}

- (void)setImportSessions:(id)a3
{
  PHFetchResult *v5;
  void *v6;
  PHFetchResult *v7;

  v5 = (PHFetchResult *)a3;
  if (self->_importSessions != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_importSessions, a3);
    -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    -[PUImportSettingsHistoryDebugViewController _updateTitle](self, "_updateTitle");
    v5 = v7;
  }

}

- (void)_updateTitle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PUImportSettingsHistoryDebugViewController importSessions](self, "importSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += (int)objc_msgSend(v9, "count");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Import History - Total: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSettingsHistoryDebugViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v12);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUImportSettingsHistoryDebugViewController importSessions](self, "importSessions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PUImportSettingsHistoryDebugViewController importSessions](self, "importSessions", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v7 = a5;
  v8 = a3;
  -[PUImportSettingsHistoryDebugViewController importSessions](self, "importSessions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", *MEMORY[0x1E0DC48A8], CFSTR("header"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPrimaryText:", v13);

  PULocalizedString(CFSTR("IMPORT_ITEMS_COUNT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v11, "count");
  PUStringWithValidatedFormat();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSecondaryText:", v15, v20);

  v16 = (void *)MEMORY[0x1E0DC3658];
  v17 = objc_msgSend(v7, "section");

  objc_msgSend(v16, "colorWithHue:saturation:brightness:alpha:", (double)(v17 % 10) / 10.0, 0.5, 1.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v18);

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PUImportSettingsHistoryDebugViewController _assetForIndexPath:](self, "_assetForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAsset:", v8);
  return v9;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  v4 = a3;
  -[PUImportSettingsHistoryDebugViewController importSessions](self, "importSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PUImportSettingsHistoryDebugViewController_photoLibraryDidChange___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)_reloadData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CD15D0];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchImportSessionsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSettingsHistoryDebugViewController setImportSessions:](self, "setImportSessions:", v5);

}

- (void)_scrollToBottom:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;
  CGRect v10;

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = v6 - CGRectGetHeight(v10);

  -[PUImportSettingsHistoryDebugViewController collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, v8);

}

- (id)_assetForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PUImportSettingsHistoryDebugViewController _assetsForSection:](self, "_assetsForSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_assetsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PUImportSettingsHistoryDebugViewController importSessions](self, "importSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PHFetchResult)importSessions
{
  return self->_importSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSessions, 0);
}

uint64_t __68__PUImportSettingsHistoryDebugViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadData");
}

+ (void)_updateFlowLayout:(id)a3 withBounds:(CGRect)a4 traitCollection:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  id v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v10 = objc_msgSend(a5, "horizontalSizeClass");
  if (v10 == 1)
    v11 = 4.0;
  else
    v11 = 20.0;
  if (v10 == 1)
    v12 = 5;
  else
    v12 = 10;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v13 = floor((CGRectGetWidth(v15) - (double)(v12 + 1) * v11) / (double)v12);
  objc_msgSend(v14, "setItemSize:", v13, v13);
  objc_msgSend(v14, "setMinimumLineSpacing:", v11);
  objc_msgSend(v14, "setMinimumInteritemSpacing:", v11);
  objc_msgSend(v14, "setScrollDirection:", 0);
  objc_msgSend(v14, "setSectionInset:", v11, v11, v11, v11);
  objc_msgSend(v14, "setHeaderReferenceSize:", 0.0, 50.0);
  objc_msgSend(v14, "setSectionHeadersPinToVisibleBounds:", 1);

}

@end
