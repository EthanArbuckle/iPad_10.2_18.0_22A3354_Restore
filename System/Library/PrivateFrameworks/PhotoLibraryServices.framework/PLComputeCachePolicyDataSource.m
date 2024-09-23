@implementation PLComputeCachePolicyDataSource

- (PLComputeCachePolicyDataSource)initWithPhotoLibrary:(id)a3 restoreState:(int64_t)a4
{
  id v8;
  PLComputeCachePolicyDataSource *v9;
  PLComputeCachePolicyDataSource *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLComputeCachePolicyDataSource.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLComputeCachePolicyDataSource;
  v9 = -[PLComputeCachePolicyDataSource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v10->_restoreState = a4;
  }

  return v10;
}

- (BOOL)isEnabled
{
  void *v2;
  BOOL v3;

  -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PLComputeCacheManager isEnabledWithPathManager:error:](PLComputeCacheManager, "isEnabledWithPathManager:error:", v2, 0);

  return v3;
}

- (int64_t)restoreState
{
  return self->_restoreState;
}

- (unint64_t)assetCount
{
  return +[PLManagedAsset iCPLAssetCountInPhotoLibrary:](PLManagedAsset, "iCPLAssetCountInPhotoLibrary:", self->_photoLibrary);
}

- (BOOL)hasAtLeastExpungedAssetCount:(unint64_t)a3
{
  PLPhotoLibrary *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PLPhotoLibrary *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t *v18;
  _QWORD v19[4];
  PLPhotoLibrary *v20;
  _QWORD *v21;
  uint8_t *v22;
  unint64_t v23;
  _QWORD v24[4];
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  char v28;

  if (a3)
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x2020000000;
    v28 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v4 = self->_photoLibrary;
    -[PLPhotoLibrary pathManager](v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLComputeCacheManager baseURLFromPathManager:](PLComputeCacheManager, "baseURLFromPathManager:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke;
    v19[3] = &unk_1E366A1A8;
    v8 = v4;
    v20 = v8;
    v21 = v24;
    v22 = buf;
    v23 = a3;
    v9 = (void *)MEMORY[0x19AEC174C](v19);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_2;
    v15[3] = &unk_1E3676F20;
    v10 = v6;
    v16 = v10;
    v11 = v9;
    v17 = v11;
    v18 = buf;
    -[PLPhotoLibrary performBlockAndWait:](v8, "performBlockAndWait:", v15);
    v12 = v26[24] != 0;

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "ComputeCachePolicyDataSource: minExpungedAssetCount is set to 0, always report expunged asset", buf, 2u);
    }

    return 1;
  }
  return v12;
}

- (NSDate)lastSnapshotDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__42273;
  v15 = __Block_byref_object_dispose__42274;
  v16 = 0;
  -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLComputeCacheManager baseURLFromPathManager:](PLComputeCacheManager, "baseURLFromPathManager:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLComputeCacheManager payloadClasses](PLComputeCacheManager, "payloadClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PLComputeCachePolicyDataSource_lastSnapshotDate__block_invoke;
  v8[3] = &unk_1E366A1F8;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDate *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __50__PLComputeCachePolicyDataSource_lastSnapshotDate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PLJournal *v10;

  v10 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", *(_QWORD *)(a1 + 32), a2);
  -[PLJournal metadata](v10, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("snapshotDate"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;

  v5 = a2;
  objc_msgSend(v5, "assetIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "assetIdentifierType");
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
    v9 = +[PLManagedAsset countForAssetsWithCloudAssetGUIDs:includePendingChanges:inManagedObjectContext:error:](PLManagedAsset, "countForAssetsWithCloudAssetGUIDs:includePendingChanges:inManagedObjectContext:error:", v11, 0, v8, 0);
  else
    v9 = +[PLManagedAsset countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:](PLManagedAsset, "countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:", v11, 0, v8, 0);
  v10 = v9;

  if (v10 < objc_msgSend(v11, "count"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v11, "count") - v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

void __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  +[PLComputeCacheManager payloadClasses](PLComputeCacheManager, "payloadClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_3;
  v5[3] = &unk_1E366A1D0;
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  PLJournal *v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", a1[4], a2);
  v8 = a1[5];
  v13 = 0;
  v9 = -[PLJournal enumeratePayloadsUsingBlock:error:](v7, "enumeratePayloadsUsingBlock:error:", v8, &v13);
  v10 = v13;
  if (!v9)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a2, "payloadClassID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "ComputeCachePolicyDataSource: Failed to enumerate %@ journal. Error: %@", buf, 0x16u);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a4 = 1;

}

@end
