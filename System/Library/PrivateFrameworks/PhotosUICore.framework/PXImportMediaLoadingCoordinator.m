@implementation PXImportMediaLoadingCoordinator

- (PXImportMediaLoadingCoordinator)initWithImportController:(id)a3
{
  id v4;
  PXImportMediaLoadingCoordinator *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *modelQueue;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *workerQueue;
  void *v20;
  id WeakRetained;
  uint64_t v22;
  PXImportAssetsDataSourceManager *dataSourceManager;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXImportMediaLoadingCoordinator;
  v5 = -[PXImportMediaLoadingCoordinator init](&v25, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-modelQueue"), v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), v7);
    modelQueue = v5->_modelQueue;
    v5->_modelQueue = (OS_dispatch_queue *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-workerQueue"), v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), v7);
    workerQueue = v5->_workerQueue;
    v5->_workerQueue = (OS_dispatch_queue *)v18;

    v5->_paused = 1;
    objc_storeWeak((id *)&v5->_importController, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, sel_mediaProviderThumbnailingBecameIdle_, CFSTR("PXImportMediaProviderThumbnailingBecameIdleNotification"), 0);

    WeakRetained = objc_loadWeakRetained((id *)&v5->_importController);
    if (!WeakRetained)
      _PFAssertContinueHandler();

    objc_msgSend(v4, "dataSourceManager");
    v22 = objc_claimAutoreleasedReturnValue();
    dataSourceManager = v5->_dataSourceManager;
    v5->_dataSourceManager = (PXImportAssetsDataSourceManager *)v22;

    -[PXImportAssetsDataSourceManager registerChangeObserver:context:](v5->_dataSourceManager, "registerChangeObserver:context:", v5, PXImportAssetsDataSourceManagerObserverContext);
    if (!v5->_dataSourceManager)
      _PFAssertContinueHandler();

  }
  return v5;
}

- (void)shutdown
{
  PXImportAssetsDataSourceManager *dataSourceManager;
  PXImportAssetsDataSourceManager *v4;
  id WeakRetained;
  void *v6;
  PXImportAssetsDataSource *dataSource;

  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager)
  {
    -[PXImportAssetsDataSourceManager unregisterChangeObserver:context:](dataSourceManager, "unregisterChangeObserver:context:", self, PXImportAssetsDataSourceManagerObserverContext);
    v4 = self->_dataSourceManager;
    self->_dataSourceManager = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_importController);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PXImportMediaProviderThumbnailingBecameIdleNotification"), 0);

    objc_storeWeak((id *)&self->_importController, 0);
  }
  dataSource = self->_dataSource;
  self->_dataSource = 0;

}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_paused != a3)
  {
    v3 = a3;
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_debug_impl(&dword_1A6789000, 0, OS_LOG_TYPE_DEBUG, "paused state changed %d", (uint8_t *)v5, 8u);
    }
    self->_paused = v3;
    if (!v3)
      -[PXImportMediaLoadingCoordinator _processItemIfPossible](self, "_processItemIfPossible");
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  void *v7;
  NSObject *modelQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  if ((void *)PXImportAssetsDataSourceManagerObserverContext == a5)
  {
    -[PXImportMediaLoadingCoordinator dataSourceManager](self, "dataSourceManager", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    modelQueue = self->_modelQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PXImportMediaLoadingCoordinator_observable_didChange_context___block_invoke;
    v10[3] = &unk_1E5148D08;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_async(modelQueue, v10);

  }
}

- (void)handleNewDataSource:(id)a3
{
  NSObject *modelQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  modelQueue = self->_modelQueue;
  v5 = a3;
  dispatch_assert_queue_V2(modelQueue);
  if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1A6789000, 0, OS_LOG_TYPE_DEBUG, "new datasource", v10, 2u);
  }
  -[PXImportMediaLoadingCoordinator setDataSource:](self, "setDataSource:", v5);

  -[PXImportMediaLoadingCoordinator dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("importAsset.uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[PXImportMediaLoadingCoordinator setThumbnailWorkItemUuids:](self, "setThumbnailWorkItemUuids:", v9);

  -[PXImportMediaLoadingCoordinator _processItemIfPossible](self, "_processItemIfPossible");
}

- (id)dequeueNextThumbnailWorkItem
{
  NSObject *modelQueue;
  id v3;
  uint64_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__275302;
  v11 = __Block_byref_object_dispose__275303;
  v12 = 0;
  modelQueue = self->_modelQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(modelQueue, v6);
  if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
  {
    v5 = v8[5];
    *(_DWORD *)buf = 136315394;
    v14 = "-[PXImportMediaLoadingCoordinator dequeueNextThumbnailWorkItem]";
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_1A6789000, 0, OS_LOG_TYPE_DEBUG, "%s: Lazy loader candidate %@", buf, 0x16u);
  }
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)_processItemIfPossible
{
  void *v2;
  id v3;

  -[PXImportMediaLoadingCoordinator importController](self, "importController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importMediaProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMediaProviderThumbnailingBecameIdle");

}

- (void)mediaProviderThumbnailingBecameIdle:(id)a3
{
  const char *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *workerQueue;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[PXImportMediaLoadingCoordinator paused](self, "paused", a3))
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v4 = "skipping: paused";
LABEL_10:
      _os_log_debug_impl(&dword_1A6789000, 0, OS_LOG_TYPE_DEBUG, v4, buf, 2u);
    }
  }
  else
  {
    v5 = -[PXImportMediaLoadingCoordinator completedDataSourceIdentifier](self, "completedDataSourceIdentifier");
    -[PXImportMediaLoadingCoordinator dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "identifier");

    if (v5 == v7)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v4 = "skipping: current datasource completed";
        goto LABEL_10;
      }
    }
    else
    {
      workerQueue = self->_workerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(workerQueue, block);
    }
  }
}

- (BOOL)paused
{
  return self->_paused;
}

- (PXImportController)importController
{
  return (PXImportController *)objc_loadWeakRetained((id *)&self->_importController);
}

- (PXImportAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (NSMutableArray)thumbnailWorkItemUuids
{
  return self->_thumbnailWorkItemUuids;
}

- (void)setThumbnailWorkItemUuids:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailWorkItemUuids, a3);
}

- (PXImportAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (int64_t)completedDataSourceIdentifier
{
  return self->_completedDataSourceIdentifier;
}

- (void)setCompletedDataSourceIdentifier:(int64_t)a3
{
  self->_completedDataSourceIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_thumbnailWorkItemUuids, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_destroyWeak((id *)&self->_importController);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_modelQueue, 0);
}

void __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dequeueNextThumbnailWorkItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_msgSend(*(id *)(a1 + 32), "paused") & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v2;
      _os_log_debug_impl(&dword_1A6789000, 0, OS_LOG_TYPE_DEBUG, "firing lazy loading image request for %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "importController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "importMediaProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke_16;
    v10[3] = &unk_1E5143F28;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "requestImageForImportItem:ofSize:completion:", v2, 0, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailWorkItemUuids");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCompletedDataSourceIdentifier:", objc_msgSend(v5, "identifier"));

      objc_msgSend(*(id *)(a1 + 32), "importController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "importMediaProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ppt_sendMediaProviderDidProcessAsset:", &unk_1E53F0F98);

      if (os_log_type_enabled(0, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1A6789000, 0, OS_LOG_TYPE_DEBUG, "nothing left to lazy loading", buf, 2u);
      }
    }
  }

}

void __71__PXImportMediaLoadingCoordinator_mediaProviderThumbnailingBecameIdle___block_invoke_16(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "importController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "restartTimedAssetsLoadingPowerAssertion");

}

void __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailWorkItemUuids");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copy");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke_2;
  v4[3] = &unk_1E5143F00;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __63__PXImportMediaLoadingCoordinator_dequeueNextThumbnailWorkItem__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForImportAssetUuid:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "thumbnailError");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "thumbnailError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "code");

    if (!objc_msgSend(v7, "isMediaAsset") || v11 != 252)
      goto LABEL_8;
  }
  else if (!objc_msgSend(v7, "isMediaAsset"))
  {
    goto LABEL_8;
  }
  objc_msgSend(v7, "imageRepresentations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E53EF630);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
    *a4 = 1;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "thumbnailWorkItemUuids");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v15);

}

uint64_t __64__PXImportMediaLoadingCoordinator_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewDataSource:", *(_QWORD *)(a1 + 40));
}

@end
