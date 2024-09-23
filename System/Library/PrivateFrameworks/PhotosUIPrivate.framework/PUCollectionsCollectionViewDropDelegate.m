@implementation PUCollectionsCollectionViewDropDelegate

- (BOOL)_allowDrop
{
  void *v3;
  void *v4;
  char v6;

  -[PUCollectionsCollectionViewDropDelegate dropDataProvider](self, "dropDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_dataProviderImplementsAllowDrop || v3 == 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "allowDropForCollectionViewDropDelegate:", self);

  return v6;
}

- (id)_collectionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUCollectionsCollectionViewDropDelegate dropDataProvider](self, "dropDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewDropDelegate:collectionAtIndexPath:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_canHandleDropSession:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[PUCollectionsCollectionViewDropDelegate _allowDrop](self, "_allowDrop"))
  {
    objc_msgSend(MEMORY[0x1E0D7B528], "supportedTypeIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_handleDrop:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_handleDrop: %@", (uint8_t *)&v13, 0xCu);
  }

  -[PUCollectionsCollectionViewDropDelegate _collectionAtIndexPath:](self, "_collectionAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
  {
    objc_msgSend(MEMORY[0x1E0D7B6D0], "dropAssetsActionPerformerForAssetCollection:dropSession:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCollectionsCollectionViewDropDelegate dropDataProvider](self, "dropDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionPerformerDelegateForCollectionViewDropDelegate:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v12);

    objc_msgSend(v10, "performActionWithCompletionHandler:", 0);
  }

}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  char v10;

  -[PUCollectionsCollectionViewDropDelegate _collectionAtIndexPath:](self, "_collectionAtIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUCollectionsCollectionViewDropDelegate _allowDrop](self, "_allowDrop");
  objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "springLoadingEnabled");

  v10 = 0;
  if (v7 && v9)
    v10 = objc_msgSend(v6, "px_allowsSpringLoading");

  return v10;
}

- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ canHandleDropSesson: %@ ", (uint8_t *)&v11, 0x16u);
  }

  v9 = -[PUCollectionsCollectionViewDropDelegate _canHandleDropSession:](self, "_canHandleDropSession:", v7);
  return v9;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "_collectionView: %@ dropSessionDidUpdate:%@ withDestinationIndexPath: %@", (uint8_t *)&v19, 0x20u);
  }

  -[PUCollectionsCollectionViewDropDelegate _collectionAtIndexPath:](self, "_collectionAtIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "px_assetsDropMode");
  if (v13 == 1 || v13 == 2 && PXDropSessionHasItemsNeedingImport())
  {
    v14 = objc_alloc(MEMORY[0x1E0DC3608]);
    v15 = 2;
    v16 = 2;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0DC3608]);
    v15 = 1;
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(v14, "initWithDropOperation:intent:", v15, v16);

  return v17;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ performDropWithCoordinator: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v7, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCollectionsCollectionViewDropDelegate _handleDrop:forItemAtIndexPath:](self, "_handleDrop:forItemAtIndexPath:", v9, v10);

}

- (PUCollectionsCollectionViewDropDataProvider)dropDataProvider
{
  return (PUCollectionsCollectionViewDropDataProvider *)objc_loadWeakRetained((id *)&self->_dropDataProvider);
}

- (void)setDropDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dropDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dropDataProvider);
}

@end
