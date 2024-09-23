@implementation PUImportAddToLibraryAndAlbumsPickerViewController

- (id)_userCreatredAlbumsPhotoKitConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PUImportAddToLibraryAndAlbumsPickerViewController photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionsFetchResult:", v6);

  return v7;
}

- (void)_updateDatasource
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_needsDatasourceUpdate)
  {
    _importToAlbumLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315138;
      v6 = "-[PUImportAddToLibraryAndAlbumsPickerViewController _updateDatasource]";
      _os_log_debug_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "%s: datasource update", (uint8_t *)&v5, 0xCu);
    }

    -[PUImportAddToLibraryAndAlbumsPickerViewController _userCreatredAlbumsPhotoKitConfiguration](self, "_userCreatredAlbumsPhotoKitConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportAddToLibraryAndAlbumsPickerViewController setDataSourceManagerConfiguration:](self, "setDataSourceManagerConfiguration:", v4);
    self->_needsDatasourceUpdate = 0;

  }
}

- (void)_dismissPicker
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PUImportAddToLibraryAndAlbumsPickerViewController__dismissPicker__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (PUImportAddToLibraryAndAlbumsPickerViewController)initWithPhotoLibrary:(id)a3
{
  id v5;
  PUImportAddToLibraryAndAlbumsPickerViewController *v6;
  PUImportAddToLibraryAndAlbumsPickerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  v6 = -[PUImportAddToLibraryAndAlbumsPickerViewController initWithStyle:](&v9, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_needsDatasourceUpdate = 1;
    -[PUImportAddToLibraryAndAlbumsPickerViewController _updateDatasource](v7, "_updateDatasource");
  }

  return v7;
}

- (PUImportAddToLibraryAndAlbumsPickerViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportAddToLibraryAndAlbumsPickerViewController.m"), 86, CFSTR("%s is not available as initializer"), "-[PUImportAddToLibraryAndAlbumsPickerViewController init]");

  abort();
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  -[PUImportAddToLibraryAndAlbumsPickerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUImportAddToLibraryAndAlbumsPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PUImportAddToLibraryAndAlbumsPickerViewControllereCellReuseIdentifier"));
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setSelfSizingInvalidation:", 2);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  -[PUImportAddToLibraryAndAlbumsPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PUImportAddToLibraryAndAlbumsPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  -[PUImportAddToLibraryAndAlbumsPickerViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[PUImportAddToLibraryAndAlbumsPickerViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    -[PUImportAddToLibraryAndAlbumsPickerViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeToFit");
    objc_msgSend(v6, "frame");
    v8 = v7;
    objc_msgSend(v6, "frame");
    -[PUImportAddToLibraryAndAlbumsPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, fmin(v9, 400.0));

  }
}

- (id)posterImageForCollection:(id)a3 indexPath:(id)a4 forCellType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5 == 1)
  {
    v11 = (void *)MEMORY[0x1E0DC3870];
    v10 = CFSTR("plus");
LABEL_8:
    objc_msgSend(v11, "systemImageNamed:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!a5)
  {
    if (objc_msgSend(v8, "px_item"))
      v10 = CFSTR("person.2");
    else
      v10 = CFSTR("person");
    v11 = (void *)MEMORY[0x1E0DC3870];
    goto LABEL_8;
  }
  if (!v7 || a5 != 2)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CD13B8], "posterImageForAssetCollection:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v13 = (void *)v12;
  if (!v12)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSObject *v4;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _importToAlbumLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[PUImportAddToLibraryAndAlbumsPickerViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PUImportAddToLibraryAndAlbumsPickerViewController numberOfSectionsInTableView:]";
    v9 = 2048;
    v10 = objc_msgSend(v6, "numberOfSections");
    _os_log_debug_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "%s: %lu", (uint8_t *)&v7, 0x16u);

  }
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[PUImportAddToLibraryAndAlbumsPickerViewController dataSource](self, "dataSource", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);
    v6 = objc_msgSend((id)objc_opt_class(), "dataSourceOffset") + v5;

    _importToAlbumLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "-[PUImportAddToLibraryAndAlbumsPickerViewController tableView:numberOfRowsInSection:]";
      v13 = 2048;
      v14 = v6;
      _os_log_debug_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "%s: %lu", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D7B970];
    -[PUImportAddToLibraryAndAlbumsPickerViewController photoLibrary](self, "photoLibrary", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedLibraryStatusProviderWithPhotoLibrary:", v9);
    v7 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject hasSharedLibraryOrPreview](v7, "hasSharedLibraryOrPreview"))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a4)
  {
    PLLocalizedFrameworkString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D7B970];
    -[PUImportAddToLibraryAndAlbumsPickerViewController photoLibrary](self, "photoLibrary", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedLibraryStatusProviderWithPhotoLibrary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hasSharedLibraryOrPreview");
    PXLocalizedSharedLibraryString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PUImportAddToLibraryAndAlbumsPickerViewControllereCellReuseIdentifier"), a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PHCollection *selectedCollection;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend((id)objc_opt_class(), "cellTypeForPosition:", v8);
  if (v9 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "dataSourceShiftedIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportAddToLibraryAndAlbumsPickerViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[PUImportAddToLibraryAndAlbumsPickerViewController posterImageForCollection:indexPath:forCellType:](self, "posterImageForCollection:indexPath:forCellType:", v12, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v14 = 2;
  else
    v14 = 4;
  if (!v12)
  {
    if (v9 == 1)
    {
      PLLocalizedFrameworkString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v9)
      {
        if (objc_msgSend(v8, "px_item"))
        {
          v20 = (void *)MEMORY[0x1E0D7B970];
          -[PUImportAddToLibraryAndAlbumsPickerViewController photoLibrary](self, "photoLibrary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sharedLibraryStatusProviderWithPhotoLibrary:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "hasPreview");
          PXLocalizedSharedLibraryString();
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          PXLocalizedSharedLibraryString();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_19;
      }
      v15 = 0;
    }
LABEL_17:
    v19 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v12, "localizedTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    selectedCollection = self->_selectedCollection;
    if (selectedCollection)
    {
      -[PHCollection localIdentifier](selectedCollection, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_19:
  v23 = objc_msgSend(v8, "px_item");
  v19 = v23 == PXTargetLibraryGetTypePreference();
LABEL_20:
  v30 = v7;
  objc_msgSend(v30, "thumbnailView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImage:", v13);

  objc_msgSend(v30, "thumbnailView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentMode:", v14);

  objc_msgSend(v30, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v15);

  if (v9 == 1)
    objc_msgSend(v30, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextColor:", v27);

  objc_msgSend(v30, "setSelected:", v19);
  if ((_DWORD)v19)
    v29 = 3;
  else
    v29 = 0;
  objc_msgSend(v30, "setAccessoryType:", v29);
  objc_msgSend(v30, "invalidateIntrinsicContentSize");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PHCollection *v14;
  PHCollection *v15;
  PHCollection *v16;
  PHCollection *v17;
  int v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  PUImportAddToLibraryAndAlbumsPickerViewController *v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _importToAlbumLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[PUImportAddToLibraryAndAlbumsPickerViewController tableView:didSelectRowAtIndexPath:]";
    _os_log_debug_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v7 = objc_msgSend((id)objc_opt_class(), "cellTypeForPosition:", v5);
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      v19 = objc_alloc(MEMORY[0x1E0D7B700]);
      v20 = *MEMORY[0x1E0D7C240];
      -[PUImportAddToLibraryAndAlbumsPickerViewController photoLibrary](self, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "px_virtualCollections");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rootAlbumCollectionList");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v19, "initWithActionType:collectionList:", v20, v23);

      objc_msgSend(v24, "setDelegate:", self);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __87__PUImportAddToLibraryAndAlbumsPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v29[3] = &unk_1E58AA020;
      v30 = v24;
      v31 = self;
      v25 = v24;
      objc_msgSend(v25, "performActionWithCompletionHandler:", v29);

    }
    else if (!v7)
    {
      v8 = objc_msgSend(v5, "px_item");
      PXTargetLibrarySetTypePreference();
      -[PUImportAddToLibraryAndAlbumsPickerViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[PUImportAddToLibraryAndAlbumsPickerViewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "targetLibrarySelected:", v8);

      }
      -[PUImportAddToLibraryAndAlbumsPickerViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

      -[PUImportAddToLibraryAndAlbumsPickerViewController _dismissPicker](self, "_dismissPicker");
    }
    goto LABEL_18;
  }
  objc_msgSend((id)objc_opt_class(), "dataSourceShiftedIndexPath:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToLibraryAndAlbumsPickerViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionAtIndexPath:", v12);
  v14 = (PHCollection *)objc_claimAutoreleasedReturnValue();

  v15 = self->_selectedCollection;
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    v17 = v14;
    v18 = -[PHCollection isEqual:](v17, "isEqual:", v16);

    if (!v18)
      goto LABEL_15;
  }
  v17 = 0;
LABEL_15:
  objc_storeStrong((id *)&self->_selectedCollection, v17);
  -[PUImportAddToLibraryAndAlbumsPickerViewController delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[PUImportAddToLibraryAndAlbumsPickerViewController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "collectionSelected:", self->_selectedCollection);

  }
  -[PUImportAddToLibraryAndAlbumsPickerViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reloadData");

  -[PUImportAddToLibraryAndAlbumsPickerViewController _dismissPicker](self, "_dismissPicker");
LABEL_18:

}

- (void)setDataSourceManagerConfiguration:(id)a3
{
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v5;
  NSObject *v6;
  PXPhotoKitCollectionsDataSource *dataSource;
  PXPhotoKitCollectionsDataSourceManager *v8;
  PXPhotoKitCollectionsDataSourceManager *dataSourceManager;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (PXPhotoKitCollectionsDataSourceManagerConfiguration *)a3;
  _importToAlbumLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "-[PUImportAddToLibraryAndAlbumsPickerViewController setDataSourceManagerConfiguration:]";
    _os_log_debug_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  if (self->_dataSourceManagerConfiguration != v5)
  {
    -[PUImportAddToLibraryAndAlbumsPickerViewController configureDataSourceManagerConfiguration:](self, "configureDataSourceManagerConfiguration:", v5);
    objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, a3);
    -[PXPhotoKitCollectionsDataSourceManager unregisterChangeObserver:context:](self->_dataSourceManager, "unregisterChangeObserver:context:", self, PXPhotoKitCollectionsDataSourceManagerObservationContext_11761);
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    v8 = (PXPhotoKitCollectionsDataSourceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B708]), "initWithConfiguration:", v5);
    dataSourceManager = self->_dataSourceManager;
    self->_dataSourceManager = v8;

    -[PXPhotoKitCollectionsDataSourceManager registerChangeObserver:context:](self->_dataSourceManager, "registerChangeObserver:context:", self, PXPhotoKitCollectionsDataSourceManagerObservationContext_11761);
  }

}

- (PXPhotoKitCollectionsDataSource)dataSource
{
  PXPhotoKitCollectionsDataSource *dataSource;
  void *v4;
  PXPhotoKitCollectionsDataSource *v5;
  PXPhotoKitCollectionsDataSource *v6;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    -[PUImportAddToLibraryAndAlbumsPickerViewController dataSourceManager](self, "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (PXPhotoKitCollectionsDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dataSource;
    self->_dataSource = v5;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  NSObject *v7;
  PXPhotoKitCollectionsDataSource *dataSource;
  PHCollection *createdAlbum;
  PHCollection **p_selectedCollection;
  PHCollection *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PHCollection *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _importToAlbumLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v19 = 136315138;
    v20 = "-[PUImportAddToLibraryAndAlbumsPickerViewController observable:didChange:context:]";
    _os_log_debug_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "%s: data manager changed", (uint8_t *)&v19, 0xCu);
  }

  if ((void *)PXPhotoKitCollectionsDataSourceManagerObservationContext_11761 == a5)
  {
    self->_needsDatasourceUpdate = 1;
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    -[PUImportAddToLibraryAndAlbumsPickerViewController _updateDatasource](self, "_updateDatasource");
    createdAlbum = self->_createdAlbum;
    if (!createdAlbum)
      createdAlbum = self->_selectedCollection;
    p_selectedCollection = &self->_selectedCollection;
    objc_storeStrong((id *)&self->_selectedCollection, createdAlbum);
    v11 = self->_createdAlbum;
    self->_createdAlbum = 0;

    -[PUImportAddToLibraryAndAlbumsPickerViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForCollection:", self->_selectedCollection);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _importToAlbumLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136315138;
        v20 = "-[PUImportAddToLibraryAndAlbumsPickerViewController observable:didChange:context:]";
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "%s: data manager changed. Selected collection is missing from data source. Unselecting.", (uint8_t *)&v19, 0xCu);
      }

      v15 = *p_selectedCollection;
      *p_selectedCollection = 0;

    }
    -[PUImportAddToLibraryAndAlbumsPickerViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PUImportAddToLibraryAndAlbumsPickerViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "collectionSelected:", *p_selectedCollection);

    }
    -[PUImportAddToLibraryAndAlbumsPickerViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

  }
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  -[PUImportAddToLibraryAndAlbumsPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return 1;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)dataSourceManagerConfiguration
{
  return self->_dataSourceManagerConfiguration;
}

- (PXImportAlbumPickerDelegate)delegate
{
  return (PXImportAlbumPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, 0);
  objc_storeStrong((id *)&self->_createdAlbum, 0);
  objc_storeStrong((id *)&self->_selectedCollection, 0);
}

void __87__PUImportAddToLibraryAndAlbumsPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "createdCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 && v4)
  {
    v6 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v4, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "lastObject");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 1024);
    *(_QWORD *)(v13 + 1024) = v12;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1032) = 1;
  }
  _importToAlbumLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315394;
    v17 = "-[PUImportAddToLibraryAndAlbumsPickerViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "%s: notified of new album: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_dismissPicker");
}

uint64_t __67__PUImportAddToLibraryAndAlbumsPickerViewController__dismissPicker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

+ (int64_t)dataSourceOffset
{
  return 1;
}

+ (id)dataSourceShiftedIndexPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(a3, "row") - objc_msgSend(a1, "dataSourceOffset"), 0);
}

+ (unint64_t)cellTypeForPosition:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "px_section");
  v5 = v4;
  if (v4)
  {
    if (v4 == 1)
    {
      if (objc_msgSend(v3, "px_item"))
        v5 = 2;
      else
        v5 = 1;
    }
    else
    {
      v5 = 2;
    }
  }

  return v5;
}

@end
