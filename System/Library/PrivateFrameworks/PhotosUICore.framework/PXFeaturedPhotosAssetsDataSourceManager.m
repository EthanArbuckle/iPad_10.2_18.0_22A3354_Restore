@implementation PXFeaturedPhotosAssetsDataSourceManager

- (PXFeaturedPhotosAssetsDataSourceManager)initWithSuggestionsDataSourceManager:(id)a3 assetCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXFeaturedPhotosAssetsDataSourceManager *v10;
  PXFeaturedPhotosAssetsDataSourceManager *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  NSCache *v14;
  NSCache *keyAssetBySuggestionIdentifierCache;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  initialPhotosDataSourceWithAssetCollection(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)PXFeaturedPhotosAssetsDataSourceManager;
  v10 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:](&v22, sel_initWithPhotosDataSource_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a4);
    objc_storeStrong((id *)&v11->_suggestionsDataSourceManager, a3);
    px_dispatch_queue_create_serial();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    keyAssetBySuggestionIdentifierCache = v11->_keyAssetBySuggestionIdentifierCache;
    v11->_keyAssetBySuggestionIdentifierCache = v14;

    objc_msgSend(v7, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeaturedPhotosAssetsDataSourceManager setSuggestionsDataSource:](v11, "setSuggestionsDataSource:", v16);

    objc_msgSend(v7, "registerChangeObserver:context:", v11, dataSourceManagerObservationContext);
    -[PXFeaturedPhotosAssetsDataSourceManager suggestionsDataSource](v11, "suggestionsDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeaturedPhotosAssetsDataSourceManager assetCollection](v11, "assetCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeaturedPhotosAssetsDataSourceManager keyAssetBySuggestionIdentifierCache](v11, "keyAssetBySuggestionIdentifierCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    newDataSourceWithSuggestionsDataSource(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetsDataSourceManager setPhotosDataSource:changeDetails:](v11, "setPhotosDataSource:changeDetails:", v20, 0);
  }

  return v11;
}

- (BOOL)supportsFiltering
{
  return 0;
}

- (void)updateDataSourceWithNewSuggestions:(id)a3 changeDetails:(id)a4 assetCollection:(id)a5 cache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "identifier");

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__PXFeaturedPhotosAssetsDataSourceManager_updateDataSourceWithNewSuggestions_changeDetails_assetCollection_cache___block_invoke;
  block[3] = &unk_1E51245A0;
  v22 = v10;
  v23 = v12;
  v24 = v13;
  v25 = v11;
  v26[1] = v15;
  v17 = v11;
  v18 = v13;
  v19 = v12;
  v20 = v10;
  objc_copyWeak(v26, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(v26);

  objc_destroyWeak(&location);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  if ((void *)dataSourceManagerObservationContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      -[PXFeaturedPhotosAssetsDataSourceManager suggestionsDataSource](self, "suggestionsDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFeaturedPhotosAssetsDataSourceManager suggestionsDataSourceManager](self, "suggestionsDataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXFeaturedPhotosAssetsDataSourceManager setSuggestionsDataSource:](self, "setSuggestionsDataSource:", v11);
      -[PXFeaturedPhotosAssetsDataSourceManager suggestionsDataSourceManager](self, "suggestionsDataSourceManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "changeHistory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v9, "identifier"), objc_msgSend(v11, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXFeaturedPhotosAssetsDataSourceManager assetCollection](self, "assetCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFeaturedPhotosAssetsDataSourceManager keyAssetBySuggestionIdentifierCache](self, "keyAssetBySuggestionIdentifierCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFeaturedPhotosAssetsDataSourceManager updateDataSourceWithNewSuggestions:changeDetails:assetCollection:cache:](self, "updateDataSourceWithNewSuggestions:changeDetails:assetCollection:cache:", v11, v14, v15, v16);

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXFeaturedPhotosAssetsDataSourceManager;
    -[PXPhotoKitAssetsDataSourceManager observable:didChange:context:](&v17, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXSuggestionsDataSourceManager)suggestionsDataSourceManager
{
  return self->_suggestionsDataSourceManager;
}

- (PXSuggestionsDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (void)setSuggestionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, a3);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (NSCache)keyAssetBySuggestionIdentifierCache
{
  return self->_keyAssetBySuggestionIdentifierCache;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyAssetBySuggestionIdentifierCache, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSourceManager, 0);
}

void __114__PXFeaturedPhotosAssetsDataSourceManager_updateDataSourceWithNewSuggestions_changeDetails_assetCollection_cache___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  newDataSourceWithSuggestionsDataSource(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 56), "count") == 1)
  {
    v3 = objc_alloc((Class)off_1E50B4A18);
    objc_msgSend(*(id *)(a1 + 56), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithSectionedDataSourceChangeDetails:withFromDataSourceIdentifier:toDataSourceIdentifier:", v4, *(_QWORD *)(a1 + 72), objc_msgSend(v2, "versionIdentifier"));

  }
  else
  {
    v5 = 0;
  }
  objc_copyWeak(&v8, (id *)(a1 + 64));
  v6 = v2;
  v7 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v8);
}

void __114__PXFeaturedPhotosAssetsDataSourceManager_updateDataSourceWithNewSuggestions_changeDetails_assetCollection_cache___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPhotosDataSource:changeDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
