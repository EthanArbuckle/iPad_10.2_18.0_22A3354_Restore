@implementation PLPTPdAssetEnumerator

+ (id)enumeratorForAssetManager:(id)a3 assetObjectIDs:(id)a4 managedObjectContext:(id)a5 conversionSupport:(id)a6
{
  void *v6;
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = 0;
  if (a4 && a5)
  {
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAssetManager:assetObjectIDs:managedObjectContext:conversionSupport:", v14, v13, v12, v11);

  }
  return v6;
}

- (PLPTPdAssetEnumerator)initWithAssetManager:(id)a3 assetObjectIDs:(id)a4 managedObjectContext:(id)a5 conversionSupport:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PLPTPdAssetEnumerator *v14;
  uint64_t v15;
  NSArray *assetObjectIDs;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PLPTPdAssetEnumerator init](self, "init");
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    assetObjectIDs = v14->_assetObjectIDs;
    v14->_assetObjectIDs = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_managedObjectContext, a5);
    objc_storeStrong((id *)&v14->_conversionSupport, a6);
    objc_storeWeak((id *)&v14->_assetManager, v10);
  }

  return v14;
}

- (void)enumerateAssetsUsingBlock:(id)a3
{
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  __uint64_t v13;
  NSObject *v14;
  double v15;
  __uint64_t v16;
  id v17;
  unint64_t v18;
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = -[NSArray count](self->_assetObjectIDs, "count");
  PLPTPGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v18;
    _os_signpost_emit_with_name_impl(&dword_199541000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PTP enumerate assets", "Asset count %lu", buf, 0xCu);
  }

  do
    v5 = __ldxr(&enumerateAssetsUsingBlock__sEnumerationCount);
  while (__stxr(v5 + 1, &enumerateAssetsUsingBlock__sEnumerationCount));
  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Enumeration %llu started", buf, 0xCu);
  }

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (v18)
  {
    v7 = 16;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = (void *)MEMORY[0x19AEC1554]();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v28 = 0.0;
      v28 = COERCE_DOUBLE(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __51__PLPTPdAssetEnumerator_enumerateAssetsUsingBlock___block_invoke;
      v19[3] = &unk_1E3668138;
      v21 = buf;
      v22 = &v23;
      v20 = v17;
      v10 = -[PLPTPdAssetEnumerator enumerateAssetsWithCount:fetchOffset:usingBlock:](self, "enumerateAssetsWithCount:fetchOffset:usingBlock:", 16, v7 - 16, v19);

      _Block_object_dispose(buf, 8);
      objc_autoreleasePoolPop(v9);
      v11 = v7 >= v18 || v10;
      v7 += 16;
    }
    while (v11 != 1);
  }
  PLPTPGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PTP enumerate assets", ", buf, 2u);
  }

  v13 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  PLPTPGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (double)(unint64_t)v24[3] / 1000000000.0;
    *(_DWORD *)buf = 134219008;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    v28 = (double)(v13 - v16) / 1000000000.0;
    v29 = 2048;
    v30 = v15;
    v31 = 2048;
    v32 = (double)v18 / v28;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Enumeration %llu ended: %lu assets in %.2fs, enumeration-only time %.2fs (%.1f assets per second)", buf, 0x34u);
  }

  _Block_object_dispose(&v23, 8);
}

- (id)_enumerateAssetsWithCount:(unint64_t)a3 fetchOffset:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id WeakRetained;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPTPdAssetEnumerator assetsFromOffset:count:](self, "assetsFromOffset:count:", a4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v34;
    *(_QWORD *)&v12 = 138412290;
    v28 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v16, "deferredProcessingNeeded", v28) == 1)
        {
          PLPTPGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v39 = v18;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Found asset requiring finalization (uuid: %@)", buf, 0xCu);

          }
          objc_msgSend(v16, "objectID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v9;
        }
        else
        {
          objc_msgSend(v16, "pictureTransferProtocolAssetsWithConversionSupport:", self->_conversionSupport);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v7;
        }
        objc_msgSend(v20, "addObject:", v19);

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v13);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        -[PLManagedObjectContext refreshObject:mergeChanges:](self->_managedObjectContext, "refreshObject:mergeChanges:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "hasChanges"));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_assetManager);
  objc_msgSend(WeakRetained, "addAssetsNeedingFinalization:", v9);

  -[PLManagedObjectContext processPendingChanges](self->_managedObjectContext, "processPendingChanges");
  return v7;
}

- (BOOL)enumerateAssetsWithCount:(unint64_t)a3 fetchOffset:(unint64_t)a4 usingBlock:(id)a5
{
  void (**v8)(id, _QWORD, char *);
  PLManagedObjectContext *managedObjectContext;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _QWORD v21[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD, char *))a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__30900;
  v26 = __Block_byref_object_dispose__30901;
  v27 = 0;
  managedObjectContext = self->_managedObjectContext;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__PLPTPdAssetEnumerator_enumerateAssetsWithCount_fetchOffset_usingBlock___block_invoke;
  v21[3] = &unk_1E3675558;
  v21[4] = self;
  v21[5] = &v22;
  v21[6] = a3;
  v21[7] = a4;
  -[PLManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v21);
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (id)v23[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v10);
      v8[2](v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), &v20);
      if (v20)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = v20 != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)assetsFromOffset:(unint64_t)a3 count:(unint64_t)a4
{
  id v7;
  id v8;
  NSRange v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLManagedObjectContext *managedObjectContext;
  void *v16;
  id v17;
  void *v18;
  id v20;
  NSRange v21;
  NSRange v22;

  pl_dispatch_once();
  v7 = (id)assetsFromOffset_count__pl_once_object_22;
  pl_dispatch_once();
  v8 = (id)assetsFromOffset_count__pl_once_object_23;
  v22.length = -[NSArray count](self->_assetObjectIDs, "count");
  v21.location = a3;
  v21.length = a4;
  v22.location = 0;
  v9 = NSIntersectionRange(v21, v22);
  -[NSArray subarrayWithRange:](self->_assetObjectIDs, "subarrayWithRange:", v9.location, v9.length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);
  objc_msgSend(v13, "setPropertiesToFetch:", v8);
  objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v7);
  managedObjectContext = self->_managedObjectContext;
  v20 = 0;
  -[PLManagedObjectContext executeFetchRequest:error:](managedObjectContext, "executeFetchRequest:error:", v13, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  v18 = v17;
  if (!v16)
    NSLog(CFSTR("Failed to fetch assets: %@"), v17);

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetManager);
  objc_storeStrong((id *)&self->_conversionSupport, 0);
  objc_storeStrong((id *)&self->_assetObjectIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __48__PLPTPdAssetEnumerator_assetsFromOffset_count___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("modificationDate");
  v3[1] = CFSTR("duration");
  v3[2] = CFSTR("locationData");
  v3[3] = CFSTR("mediaGroupUUID");
  v3[4] = CFSTR("avalancheUUID");
  v3[5] = CFSTR("avalanchePickType");
  v3[6] = CFSTR("kindSubtype");
  v3[7] = CFSTR("kind");
  v3[8] = CFSTR("uuid");
  v3[9] = CFSTR("hdrType");
  v3[10] = CFSTR("deferredProcessingNeeded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)assetsFromOffset_count__pl_once_object_23;
  assetsFromOffset_count__pl_once_object_23 = v1;

}

void __48__PLPTPdAssetEnumerator_assetsFromOffset_count___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("modernResources");
  v3[1] = CFSTR("additionalAttributes");
  v3[2] = CFSTR("extendedAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)assetsFromOffset_count__pl_once_object_22;
  assetsFromOffset_count__pl_once_object_22 = v1;

}

void __73__PLPTPdAssetEnumerator_enumerateAssetsWithCount_fetchOffset_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "_enumerateAssetsWithCount:fetchOffset:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

void __51__PLPTPdAssetEnumerator_enumerateAssetsUsingBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)
                                                  - *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  (*(void (**)(void))(a1[4] + 16))();

}

@end
