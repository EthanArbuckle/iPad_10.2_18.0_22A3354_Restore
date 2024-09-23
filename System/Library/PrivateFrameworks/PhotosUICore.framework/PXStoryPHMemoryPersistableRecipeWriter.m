@implementation PXStoryPHMemoryPersistableRecipeWriter

- (PXStoryPHMemoryPersistableRecipeWriter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPHMemoryPersistableRecipeWriter.m"), 34, CFSTR("%s is not available as initializer"), "-[PXStoryPHMemoryPersistableRecipeWriter init]");

  abort();
}

- (PXStoryPHMemoryPersistableRecipeWriter)initWithMemory:(id)a3
{
  id v5;
  PXStoryPHMemoryPersistableRecipeWriter *v6;
  PXStoryPHMemoryPersistableRecipeWriter *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryPHMemoryPersistableRecipeWriter;
  v6 = -[PXStoryPHMemoryPersistableRecipeWriter init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_memory, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  PXStoryPHMemoryPersistableRecipeWriter *v36;
  id v37;
  id v38;
  SEL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime v49;
  _OWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[32];
  CMTime v58;
  CMTime time2;
  CMTime time1;
  _BYTE buf[48];
  CMTime v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[PXStoryPHMemoryPersistableRecipeWriter memory](self, "memory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "overallDurationInfo");
    if ((_QWORD)v51)
    {
      if (v11)
        objc_msgSend(v11, "overallDurationInfo");
      else
        memset(v50, 0, sizeof(v50));
      objc_msgSend(v12, "overallDurationInfo");
      if (*(_QWORD *)&v50[0] != v45)
        goto LABEL_11;
      v62 = *(CMTime *)((char *)&v50[3] + 8);
      v58 = v49;
      time1 = *(CMTime *)((char *)v50 + 8);
      *(_OWORD *)&buf[32] = *(_OWORD *)((char *)&v50[2] + 8);
      *(_OWORD *)buf = *(_OWORD *)((char *)v50 + 8);
      *(_OWORD *)&buf[16] = *(_OWORD *)((char *)&v50[1] + 8);
      *(_OWORD *)&v57[16] = v48;
      v56 = v46;
      *(_OWORD *)v57 = v47;
      *(_OWORD *)&time2.value = v46;
      time2.epoch = v47;
      if (CMTimeCompare(&time1, &time2)
        || (time1 = *(CMTime *)&buf[24], time2 = *(CMTime *)&v57[8], CMTimeCompare(&time1, &time2))
        || (time1 = v62, time2 = v58, CMTimeCompare(&time1, &time2)))
      {
LABEL_11:
        PXAssertGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          if (v11)
          {
            objc_msgSend(v11, "overallDurationInfo");
          }
          else
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v40 = 0u;
          }
          PFStoryOverallDurationInfoDescription();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "overallDurationInfo");
          PFStoryOverallDurationInfoDescription();
          v29 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v29;
          v30 = (void *)v29;
          _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Mismatch between overallDurationInfo in metadata:%@ and assetEdits:%@", buf, 0x16u);

        }
      }
    }
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v51 = 0u;
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPHMemoryPersistableRecipeWriter workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke;
  v31[3] = &unk_1E5148398;
  v19 = v17;
  v32 = v19;
  v33 = v11;
  v34 = v15;
  v35 = v12;
  v38 = v14;
  v39 = a2;
  v36 = self;
  v37 = v13;
  v20 = v13;
  v21 = v14;
  v22 = v12;
  v23 = v15;
  v24 = v11;
  dispatch_async(v18, v31);

  v25 = v37;
  v26 = v19;

  return v26;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PXEditMemoryAction *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PXEditMemoryAction *v17;
  PXEditMemoryAction *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0D752B0]);
      objc_msgSend(v2, "archivedDataWithRecipe:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "currentStyle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2;
      v30[3] = &unk_1E5148320;
      v31 = v3;
      v7 = v5;
      v32 = v7;
      v33 = *(id *)(a1 + 56);
      v29 = 0;
      objc_msgSend(v6, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v30, &v29);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v29;
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
        if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
        {
          if (v7)
          {
            v9 = objc_msgSend(v7, "customColorGradeKind");
            +[PXStoryColorGradingRepositoryFactory sharedRepository](PXStoryColorGradingRepositoryFactory, "sharedRepository");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v9)
            {
              objc_msgSend(v7, "originalColorGradeCategory");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v10, "colorGradeKindForColorGradeCategory:", v11);

            }
          }
          else
          {
            v9 = 0;
          }
          v25 = v9;
          objc_msgSend(*(id *)(a1 + 56), "keyAsset");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = *(_QWORD *)(a1 + 64);
              v24 = *(_QWORD *)(a1 + 88);
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "px_descriptionForAssertionMessage");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v24, v23, CFSTR("PXStoryPHMemoryPersistableRecipeWriter.m"), 89, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetEdits.keyAsset"), v21, v22);

            }
          }
          v13 = [PXEditMemoryAction alloc];
          v14 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 56), "userCuratedAssets");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "customUserAssetsEdit");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PXEditMemoryAction initWithMemory:photosGraphData:storyColorGradeKind:keyAsset:userCuratedAssets:customUserAssetsEdit:](v13, "initWithMemory:photosGraphData:storyColorGradeKind:keyAsset:userCuratedAssets:customUserAssetsEdit:", v14, v8, v25, v12, v15, v16);

          v26 = *(id *)(a1 + 72);
          v27 = *(id *)(a1 + 32);
          v28 = *(id *)(a1 + 80);
          v18 = v17;
          px_dispatch_on_main_queue();

        }
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      }

    }
  }
}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("storyRecipeData"));
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "customColorGradeKind"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("storyColorGradeKind"));

    objc_msgSend(*(id *)(a1 + 40), "originalColorGradeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("storyColorGradeCategory"));

  }
  objc_msgSend(*(id *)(a1 + 48), "customUserAssetsEdit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 1)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("chapterTitles"));

}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_4;
  v4[3] = &unk_1E5148348;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "executeWithUndoManager:completionHandler:", v3, v4);

}

void __102__PXStoryPHMemoryPersistableRecipeWriter_writePersistableRecipe_assetEdits_undoManager_resultHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
