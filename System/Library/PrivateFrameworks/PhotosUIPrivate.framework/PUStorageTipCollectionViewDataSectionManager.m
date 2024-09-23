@implementation PUStorageTipCollectionViewDataSectionManager

- (PUStorageTipCollectionViewDataSectionManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PUStorageTipCollectionViewDataSectionManager *v6;
  PUStorageTipCollectionViewDataSectionManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *tipQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *fetchResults;
  PUStorageTipCollectionViewDataSection *v12;
  PUStorageTipCollectionViewDataSection *pendingDataSection;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  PUStorageTipCollectionViewDataSectionManager *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUStorageTipCollectionViewDataSectionManager;
  v6 = -[PXDataSectionManager initWithChildDataSectionManagers:](&v19, sel_initWithChildDataSectionManagers_, MEMORY[0x1E0C9AA60]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    -[PHPhotoLibrary px_registerChangeObserver:](v7->_photoLibrary, "px_registerChangeObserver:", v7);
    v8 = dispatch_queue_create("storageTipQueue", 0);
    tipQueue = v7->_tipQueue;
    v7->_tipQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchResults = v7->_fetchResults;
    v7->_fetchResults = v10;

    v12 = -[PUStorageTipCollectionViewDataSection initWithZerosWithStorageTipCount:]([PUStorageTipCollectionViewDataSection alloc], "initWithZerosWithStorageTipCount:", 3);
    pendingDataSection = v7->_pendingDataSection;
    v7->_pendingDataSection = v12;

    objc_msgSend(MEMORY[0x1E0D7CCC8], "changeDetailsWithNoIncrementalChanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager updateDataSectionWithChangeDetails:](v7, "updateDataSectionWithChangeDetails:", v14);

    v15 = v7->_tipQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PUStorageTipCollectionViewDataSectionManager_initWithPhotoLibrary___block_invoke;
    block[3] = &unk_1E58ABD10;
    v18 = v7;
    dispatch_async(v15, block);

  }
  return v7;
}

- (id)createDataSection
{
  void *v3;

  -[PUStorageTipCollectionViewDataSectionManager pendingDataSection](self, "pendingDataSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageTipCollectionViewDataSectionManager setPendingDataSection:](self, "setPendingDataSection:", 0);
  return v3;
}

- (void)tipQueue_populateInitialFetches
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUStorageTipCollectionViewDataSectionManager photoLibrary](self, "photoLibrary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:photoLibrary:](PUStorageManagementUtility, "storageTipAssetFetchOptionsForType:photoLibrary:", i, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUStorageManagementUtility storageTipAssetCollectionForType:photoLibrary:](PUStorageManagementUtility, "storageTipAssetCollectionForType:photoLibrary:", i, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUStorageTipCollectionViewDataSectionManager fetchResults](self, "fetchResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (void)tipQueue_createPendingDataSection
{
  PUStorageTipCollectionViewDataSection *v3;
  void *v4;
  void *v5;
  PUStorageTipCollectionViewDataSection *v6;
  PUStorageTipCollectionViewDataSection *v7;
  _QWORD v8[5];
  PUStorageTipCollectionViewDataSection *v9;

  v3 = [PUStorageTipCollectionViewDataSection alloc];
  -[PUStorageTipCollectionViewDataSectionManager tipQueue_fetchSizesDictionary](self, "tipQueue_fetchSizesDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageTipCollectionViewDataSectionManager tipQueue_fetchCountsDictionary](self, "tipQueue_fetchCountsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUStorageTipCollectionViewDataSection initWithSizesDictionary:countsDictionary:](v3, "initWithSizesDictionary:countsDictionary:", v4, v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PUStorageTipCollectionViewDataSectionManager_tipQueue_createPendingDataSection__block_invoke;
  v8[3] = &unk_1E58ABCA8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

- (id)tipQueue_fetchSizesDictionary
{
  void *v2;
  char v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PUStorageTipCollectionViewDataSectionManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  v3 = objc_msgSend(v2, "cloudQuotaResourceBytesUsed:error:", &v23, &v22);
  v4 = v23;
  v5 = v22;

  if ((v3 & 1) == 0 && !v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = 0;
      _os_log_error_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to get iCloud storage used with error %@", buf, 0xCu);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = +[PUStorageTipListItem storageTipTypeForCloudQuotaUsedBytesIdentifier:](PUStorageTipListItem, "storageTipTypeForCloudQuotaUsedBytesIdentifier:", v13, (_QWORD)v18);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)tipQueue_fetchCountsDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PUStorageTipCollectionViewDataSectionManager fetchResults](self, "fetchResults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "intValue");
        v8 = (void *)MEMORY[0x1E0CB37E8];
        -[PUStorageTipCollectionViewDataSectionManager fetchResults](self, "fetchResults");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, v13);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v16;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  NSObject *tipQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  tipQueue = self->_tipQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PUStorageTipCollectionViewDataSectionManager_photoLibraryDidChangeOnMainQueue___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(tipQueue, v7);

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)tipQueue
{
  return self->_tipQueue;
}

- (NSMutableDictionary)fetchResults
{
  return self->_fetchResults;
}

- (PUStorageTipCollectionViewDataSection)pendingDataSection
{
  return self->_pendingDataSection;
}

- (void)setPendingDataSection:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDataSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDataSection, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_storeStrong((id *)&self->_tipQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __81__PUStorageTipCollectionViewDataSectionManager_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "dataSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "fetchResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "changeDetailsForFetchResult:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "fetchResultAfterChanges");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "fetchResults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        v4 = 1;
      }

      ++v5;
      objc_msgSend(*(id *)(a1 + 32), "dataSection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v5 < v15);
    if ((v4 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "tipQueue_createPendingDataSection");
  }
}

void __81__PUStorageTipCollectionViewDataSectionManager_tipQueue_createPendingDataSection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setPendingDataSection:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D7CCC8], "changeDetailsWithNoIncrementalChanges");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDataSectionWithChangeDetails:", v3);

}

uint64_t __69__PUStorageTipCollectionViewDataSectionManager_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "tipQueue_populateInitialFetches");
  return objc_msgSend(*(id *)(a1 + 32), "tipQueue_createPendingDataSection");
}

@end
