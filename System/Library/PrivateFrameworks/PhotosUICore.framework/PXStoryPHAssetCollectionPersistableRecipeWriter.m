@implementation PXStoryPHAssetCollectionPersistableRecipeWriter

- (PXStoryPHAssetCollectionPersistableRecipeWriter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPHAssetCollectionPersistableRecipeWriter.m"), 28, CFSTR("%s is not available as initializer"), "-[PXStoryPHAssetCollectionPersistableRecipeWriter init]");

  abort();
}

- (PXStoryPHAssetCollectionPersistableRecipeWriter)initWithAssetCollection:(id)a3 referencePersons:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *workQueue;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    objc_storeStrong((id *)&self->_referencePersons, a4);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (OS_dispatch_queue *)dispatch_queue_create(v11, v13);
    workQueue = self->_workQueue;
    self->_workQueue = v14;

  }
  return self;
}

- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v26;
  PXStoryPHAssetCollectionPersistableRecipeWriter *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPHAssetCollectionPersistableRecipeWriter workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke;
  block[3] = &unk_1E51430C0;
  v17 = v15;
  v26 = v17;
  v27 = self;
  v31 = v14;
  v32 = a2;
  v28 = v11;
  v29 = v12;
  v30 = v13;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  dispatch_async(v16, block);

  v22 = v31;
  v23 = v17;

  return v23;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHFetchResult)referencePersons
{
  return self->_referencePersons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

void __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PXStoryPHMemoryPersistableRecipeWriter *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__58471;
    v44 = __Block_byref_object_dispose__58472;
    v45 = 0;
    objc_msgSend(*(id *)(a1 + 40), "assetCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_132;
    v36[3] = &unk_1E513FD98;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 40);
    v37 = v4;
    v38 = v5;
    v39 = &v40;
    v35 = 0;
    v6 = objc_msgSend(v3, "performChangesAndWait:error:", v36, &v35);
    v7 = v35;
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    if (v6 && v41[5])
    {
      v8 = (void *)MEMORY[0x1E0CD1630];
      v50[0] = v41[5];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchAssetCollectionsWithLocalIdentifiers:options:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v11, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("PXStoryPHAssetCollectionPersistableRecipeWriter.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[createdMemory isKindOfClass:PHMemory.class]"));

        }
        v19 = -[PXStoryPHMemoryPersistableRecipeWriter initWithMemory:]([PXStoryPHMemoryPersistableRecipeWriter alloc], "initWithMemory:", v18);
        v20 = *(_QWORD *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 56);
        v22 = *(_QWORD *)(a1 + 64);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2;
        v30[3] = &unk_1E511E7A8;
        v34 = &v40;
        v31 = *(id *)(a1 + 32);
        v33 = *(id *)(a1 + 72);
        v23 = v18;
        v32 = v23;
        v24 = -[PXStoryPHMemoryPersistableRecipeWriter writePersistableRecipe:assetEdits:undoManager:resultHandler:](v19, "writePersistableRecipe:assetEdits:undoManager:resultHandler:", v20, v21, v22, v30);

        v25 = (uint64_t)v7;
      }
      else
      {
        PXStoryErrorCreateWithCodeDebugFormat(14, CFSTR("Should be able to fetch the newly created memory with identifier:%@"), v12, v13, v14, v15, v16, v17, v41[5]);
        v25 = objc_claimAutoreleasedReturnValue();

        PLMemoriesGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v25;
          _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch newly created memory:%@", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }

      v7 = (id)v25;
    }
    else
    {
      PLMemoriesGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = v41[5];
        *(_DWORD *)buf = 138412546;
        v47 = (uint64_t)v7;
        v48 = 2112;
        v49 = v27;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "Failed to create memory with error:%@ localIdentifier:%@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

    _Block_object_dispose(&v40, 8);
  }
}

void __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_132(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = +[PXStoryPHAssetCollectionAssetsProducer shouldEnableCurationForAssetCollection:](PXStoryPHAssetCollectionAssetsProducer, "shouldEnableCurationForAssetCollection:", *(_QWORD *)(a1 + 32)) ^ 1;
  v3 = (void *)MEMORY[0x1E0CD1640];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "referencePersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_creationRequestForAssetCollection:displayTitleInfo:people:ignoreCuration:", v4, 0, v5, v2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setUserCreated:", 1);
  objc_msgSend(v10, "placeholderForCreatedMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __111__PXStoryPHAssetCollectionPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((a2 & 1) == 0)
  {
    PLMemoriesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to write recipe to newly created memory with identifier:%@ error:%@", (uint8_t *)&v9, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
