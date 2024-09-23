@implementation PXZoomableInlineHeadersDataSourceManager

uint64_t __76__PXZoomableInlineHeadersDataSourceManager_initWithAssetsDataSourceManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
}

- (void)_invalidateDataSource
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateDataSource);
}

- (void)setNeedsUpdate
{
  -[PXZoomableInlineHeadersDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (PXZoomableInlineHeadersDataSourceManager)initWithAssetsDataSourceManager:(id)a3
{
  id v6;
  PXZoomableInlineHeadersDataSourceManager *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PXUpdater *updater;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *prepareQueue;
  void *v16;
  _QWORD v17[4];
  PXZoomableInlineHeadersDataSourceManager *v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXZoomableInlineHeadersDataSourceManager;
  v7 = -[PXSectionedDataSourceManager init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfSections");

    if (v9 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsDataSourceManager.dataSource.numberOfSections == 1"));

    }
    objc_storeStrong((id *)&v7->_assetsDataSourceManager, a3);
    objc_msgSend(v6, "registerChangeObserver:context:", v7, PXAssetsDataSourceManagerObserverContext);
    v10 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel_setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v10;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateDataSource);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.photos.inline-headers-queue", v12);
    prepareQueue = v7->_prepareQueue;
    v7->_prepareQueue = (OS_dispatch_queue *)v13;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__PXZoomableInlineHeadersDataSourceManager_initWithAssetsDataSourceManager___block_invoke;
    v17[3] = &unk_1E51479C8;
    v18 = v7;
    -[PXZoomableInlineHeadersDataSourceManager performChanges:](v18, "performChanges:", v17);

  }
  return v7;
}

+ (BOOL)supportsAssetsDataSourceManager:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateDataSource
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *metaDataStore;
  PXZoomableInlineHeadersDataSource *v14;
  PXZoomableInlineHeadersDataSource *yearsDataSource;
  PXZoomableInlineHeadersDataSource *v16;
  PXZoomableInlineHeadersDataSource *monthsDataSource;
  void *v18;
  id v19;

  -[PXAssetsDataSourceManager dataSource](self->_assetsDataSourceManager, "dataSource");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "numberOfSections") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 114, CFSTR("Only supports data sources with 1 section (or empty)"));

  }
  if (self->_metaDataStore)
  {
    if (objc_msgSend(v19, "numberOfSections") && objc_msgSend(v19, "numberOfItemsInSection:", 0))
    {
      -[PXZoomableInlineHeaderSectionInfoMetaDataStore dataSource](self->_metaDataStore, "dataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetsDataSourceManager changeHistory](self->_assetsDataSourceManager, "changeHistory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v4, "identifier"), objc_msgSend(v19, "identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = -[PXZoomableInlineHeaderSectionInfoMetaDataStore updateWithDataSourceAfterChanges:changeDetails:](self->_metaDataStore, "updateWithDataSourceAfterChanges:changeDetails:", v19, v6);
      -[PXZoomableInlineHeadersDataSourceManager _fetchResultForDataSource:](self, "_fetchResultForDataSource:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchSortDescriptors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXZoomableInlineHeadersDataSourceManager _fetchResultForDataSource:](self, "_fetchResultForDataSource:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchSortDescriptors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v11)
      {
        v12 = 0;
        if (!v7)
          goto LABEL_16;
      }
      else
      {
        v12 = objc_msgSend(v9, "isEqual:", v11) ^ 1;
        if (!v7)
          goto LABEL_16;
      }
      if (!v12)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_16:
      if (!self->_isPreparingMetadataInBackground)
        -[PXZoomableInlineHeadersDataSourceManager _prepareInBackgroundWithDataSource:](self, "_prepareInBackgroundWithDataSource:", v19);
      goto LABEL_18;
    }
    metaDataStore = self->_metaDataStore;
    self->_metaDataStore = 0;

  }
  else if (!self->_isPreparingMetadataInBackground
         && objc_msgSend(v19, "containsAnyItems")
         && objc_msgSend(v19, "areAllSectionsConsideredAccurate"))
  {
    -[PXZoomableInlineHeadersDataSourceManager _prepareInBackgroundWithDataSource:](self, "_prepareInBackgroundWithDataSource:", v19);
  }
LABEL_19:
  v14 = -[PXZoomableInlineHeadersDataSource initWithAssetsDataSource:level:metaDataStore:]([PXZoomableInlineHeadersDataSource alloc], "initWithAssetsDataSource:level:metaDataStore:", v19, 0, self->_metaDataStore);
  yearsDataSource = self->_yearsDataSource;
  self->_yearsDataSource = v14;

  v16 = -[PXZoomableInlineHeadersDataSource initWithAssetsDataSource:level:metaDataStore:]([PXZoomableInlineHeadersDataSource alloc], "initWithAssetsDataSource:level:metaDataStore:", v19, 1, self->_metaDataStore);
  monthsDataSource = self->_monthsDataSource;
  self->_monthsDataSource = v16;

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", self->_monthsDataSource, 0);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXZoomableInlineHeadersDataSourceManager;
  -[PXZoomableInlineHeadersDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXZoomableInlineHeadersDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)dataSourceForLevel:(unint64_t)a3
{
  int *v3;
  void *v7;

  if (a3)
  {
    if (a3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 101, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v3 = &OBJC_IVAR___PXZoomableInlineHeadersDataSourceManager__monthsDataSource;
  }
  else
  {
    v3 = &OBJC_IVAR___PXZoomableInlineHeadersDataSourceManager__yearsDataSource;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)_fetchResultForDataSource:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = a3;
  v6 = objc_msgSend(v3, "identifier");
  v7 = xmmword_1A7C0C1F0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "assetsInSectionIndexPath:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_prepareInBackgroundWithDataSource:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v5 = a3;
  if (self->_isPreparingMetadataInBackground)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isPreparingMetadataInBackground"));

  }
  self->_isPreparingMetadataInBackground = 1;
  objc_initWeak(&location, self);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke;
  v9[3] = &unk_1E5147B18;
  v9[4] = self;
  objc_copyWeak(&v11, &location);
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "scheduleTaskAfterCATransactionCommits:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_prepareQueue_prepareInBackroundWithDataSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prepareQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXZoomableInlineHeadersDataSourceManager _prepareQueue_createMetaDataStoreForAlbumWithDataSource:](self, "_prepareQueue_createMetaDataStoreForAlbumWithDataSource:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__PXZoomableInlineHeadersDataSourceManager__prepareQueue_prepareInBackroundWithDataSource___block_invoke;
    block[3] = &unk_1E5147B18;
    objc_copyWeak(&v13, location);
    v11 = v6;
    v12 = v5;
    v7 = v5;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = self;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%@ requires a PhotoKit data source.", (uint8_t *)location, 0xCu);
    }

  }
}

- (void)_didFinishBackgroundPreparationWithResult:(id)a3 forDataSource:(id)a4
{
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v6;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *metaDataStore;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v8;
  void *v9;
  _QWORD v10[5];

  v6 = (PXZoomableInlineHeaderSectionInfoMetaDataStore *)a3;
  if (!self->_isPreparingMetadataInBackground)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPreparingMetadataInBackground"));

  }
  self->_isPreparingMetadataInBackground = 0;
  metaDataStore = self->_metaDataStore;
  self->_metaDataStore = v6;
  v8 = v6;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__PXZoomableInlineHeadersDataSourceManager__didFinishBackgroundPreparationWithResult_forDataSource___block_invoke;
  v10[3] = &unk_1E51479C8;
  v10[4] = self;
  -[PXZoomableInlineHeadersDataSourceManager performChanges:](self, "performChanges:", v10);

}

- (id)_prepareQueue_createMetaDataStoreForAlbumWithDataSource:(id)a3
{
  id v4;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;

  v4 = a3;
  v5 = -[PXZoomableInlineHeaderSectionInfoMetaDataStore initWithDataSource:]([PXZoomableInlineHeaderSectionInfoMetaDataStore alloc], "initWithDataSource:", v4);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomableInlineHeadersDataSourceManager _fetchResultForDataSource:](self, "_fetchResultForDataSource:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "px_sortOrder");
  if (v8 != 1)
  {
    if (v8 != 2)
      goto LABEL_11;
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "enableAddedDateZoomingHeader") & 1) != 0)
    {

    }
    else
    {
      v10 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");

      if (!v10)
        goto LABEL_11;
    }
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke;
  v33[3] = &unk_1E51407B0;
  v11 = v6;
  v34 = v11;
  objc_msgSend(v7, "px_fetchAssetSortDatesWithDateRangeEliminationBlock:", v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "sortDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ascending");

    objc_msgSend(v12, "dateByIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x4010000000;
    v30[3] = &unk_1A7E74EE7;
    v31 = 0u;
    v32 = 0u;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x4010000000;
    v27[3] = &unk_1A7E74EE7;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v12, "fetchedIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v17 = &__block_literal_global_141199;
    else
      v17 = &__block_literal_global_159_141200;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_4;
    v20[3] = &unk_1E512CF30;
    v18 = v15;
    v21 = v18;
    v24 = v17;
    v25 = v30;
    v22 = v11;
    v23 = v5;
    v26 = v27;
    objc_msgSend(v16, "enumerateIndexesUsingBlock:", v20);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v30, 8);

  }
LABEL_11:

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXAssetsDataSourceManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 281, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__PXZoomableInlineHeadersDataSourceManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E51479C8;
    v12[4] = self;
    -[PXZoomableInlineHeadersDataSourceManager performChanges:](self, "performChanges:", v12);
  }

}

- (PXZoomableInlineHeadersDataSource)monthsDataSource
{
  return self->_monthsDataSource;
}

- (PXZoomableInlineHeadersDataSource)yearsDataSource
{
  return self->_yearsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_yearsDataSource, 0);
  objc_storeStrong((id *)&self->_monthsDataSource, 0);
  objc_storeStrong((id *)&self->_prepareQueue, 0);
  objc_storeStrong((id *)&self->_metaDataStore, 0);
  objc_storeStrong((id *)&self->_previousAssetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

uint64_t __73__PXZoomableInlineHeadersDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
}

BOOL __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "components:fromDate:", 12, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", 12, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "year");
  if (v9 == objc_msgSend(v8, "year"))
  {
    v10 = objc_msgSend(v7, "month");
    v11 = v10 == objc_msgSend(v8, "month");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "components:fromDate:", 12, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "year");
    v9 = objc_msgSend(v7, "month");
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
      || (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v10 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8);
      v10[4] = a2;
      v10[5] = v8;
      v10[6] = v9;
      v10[7] = v11;
      v12 = *(void **)(a1 + 48);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(_OWORD *)(v13 + 48);
      v20 = *(_OWORD *)(v13 + 32);
      v21 = v14;
      objc_msgSend(v12, "addSectionInfo:forLevel:", &v20, 0);
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
      || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0
      || (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v15 = *(_QWORD **)(*(_QWORD *)(a1 + 72) + 8);
      v15[4] = a2;
      v15[5] = v8;
      v15[6] = v9;
      v15[7] = v16;
      v17 = *(void **)(a1 + 48);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v19 = *(_OWORD *)(v18 + 48);
      v20 = *(_OWORD *)(v18 + 32);
      v21 = v19;
      objc_msgSend(v17, "addSectionInfo:forLevel:", &v20, 1);
    }

  }
}

BOOL __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 < a2;
}

BOOL __100__PXZoomableInlineHeadersDataSourceManager__prepareQueue_createMetaDataStoreForAlbumWithDataSource___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 > a2;
}

uint64_t __100__PXZoomableInlineHeadersDataSourceManager__didFinishBackgroundPreparationWithResult_forDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
}

void __91__PXZoomableInlineHeadersDataSourceManager__prepareQueue_prepareInBackroundWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didFinishBackgroundPreparationWithResult:forDataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 152);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke_2;
  v3[3] = &unk_1E5147280;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __79__PXZoomableInlineHeadersDataSourceManager__prepareInBackgroundWithDataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_prepareQueue_prepareInBackroundWithDataSource:", *(_QWORD *)(a1 + 32));

}

@end
