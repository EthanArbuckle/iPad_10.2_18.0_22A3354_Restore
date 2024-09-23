@implementation PLBackgroundJobDuplicateDetectorWorker

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)_isTokenInvalidError:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = v4 == 134501 || v4 == 134301;
  if (v5
    && (objc_msgSend(v3, "domain"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Persistent history transaction iterator error was unrecognized: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PLBackgroundJobWorkerPendingWorkItems *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  PLBackgroundJobWorkerPendingWorkItems *v15;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  PLBackgroundJobWorkerPendingWorkItems *v22;
  void *v23;
  const __CFString **v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLBackgroundJobCriteria criteriaForDuplicateDetectorWorker](PLBackgroundJobCriteria, "criteriaForDuplicateDetectorWorker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorker libraryBundle](self, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
  if (!+[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v7))
  {
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. Library not supported";
      goto LABEL_13;
    }
LABEL_14:

LABEL_15:
    v15 = v8;
    goto LABEL_16;
  }
  objc_msgSend(v7, "duplicateProcessor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMerging");

  if (v10)
  {
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. Merging";
LABEL_13:
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  objc_msgSend(v7, "libraryBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PLIsCloudPhotoLibraryDisableInProgressForPhotoLibraryBundle(v13);

  if (v14)
  {
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. CPL disable in progress";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (+[PLDuplicateProcessor isExitingSharedLibraryForLibrary:](PLDuplicateProcessor, "isExitingSharedLibraryForLibrary:", v4))
  {
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker skipping duplicate processing. Exiting Shared Library";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v17 = (void *)MEMORY[0x19AEC1554]();
  -[PLBackgroundJobDuplicateDetectorWorker _resetTokenIfRequiredFromLibrary:](self, "_resetTokenIfRequiredFromLibrary:", v4);
  -[PLBackgroundJobDuplicateDetectorWorker _lastDuplicateDetectorProcessingTokenFromLibrary:](self, "_lastDuplicateDetectorProcessingTokenFromLibrary:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobDuplicateDetectorWorker _transactionIteratorSinceTokenIfValid:library:error:](self, "_transactionIteratorSinceTokenIfValid:library:error:", v18, v4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count"))
  {

    objc_autoreleasePoolPop(v17);
    goto LABEL_15;
  }
  PLDuplicateDetectionGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker returning 1 work item (lastToken %@)", buf, 0xCu);
    }

    v22 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v27 = v18;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = (const __CFString **)&v27;
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker returning entire library marker", buf, 2u);
    }

    v22 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v26 = CFSTR("PLBackgroundJobDuplicateDetectorProcessEntireLibrary");
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = &v26;
  }
  objc_msgSend(v23, "arrayWithObjects:count:", v24, 1, v26, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v22, "initWithCriteria:workItemsNeedingProcessing:", v5, v25);

  objc_autoreleasePoolPop(v17);
LABEL_16:

  return v15;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _BYTE *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _BYTE *v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[3];
  char v42;
  _QWORD v43[3];
  char v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobDuplicateDetectorWorker.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  PLDuplicateDetectionGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: PLBackgroundJobDuplicateDetectorWorker performWorkOnItem: %p %@", buf, 0x16u);
  }

  -[PLBackgroundJobDuplicateDetectorWorker _resetCancelledWorkItem](self, "_resetCancelledWorkItem");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__82049;
  v47 = __Block_byref_object_dispose__82050;
  v48 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__82049;
  v39[4] = __Block_byref_object_dispose__82050;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v28[3] = &unk_1E3673200;
  v32 = v37;
  v28[4] = self;
  v14 = v10;
  v29 = v14;
  v33 = v39;
  v34 = v41;
  v15 = v9;
  v30 = v15;
  v16 = v11;
  v31 = v16;
  v35 = v43;
  v36 = buf;
  objc_msgSend(v14, "performBlockAndWait:", v28);
  if (-[PLBackgroundJobDuplicateDetectorWorker _shouldCancelCurrentWorkItem:](self, "_shouldCancelCurrentWorkItem:", v15))
  {
    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
  }
  else
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_41;
    v19[3] = &unk_1E3673200;
    v19[4] = self;
    v20 = v15;
    v21 = v14;
    v23 = v41;
    v24 = v39;
    v25 = v37;
    v26 = buf;
    v27 = v43;
    v22 = v16;
    objc_msgSend(v17, "async:identifyingBlock:library:", v19, 0, v21);

  }
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);

}

- (void)_resetCancelledWorkItem
{
  NSObject *v3;
  uint8_t v4[16];

  PLDuplicateDetectionGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: reset cancelled work item", v4, 2u);
  }

  -[PLBackgroundJobDuplicateDetectorWorker setCancelledWorkItem:](self, "setCancelledWorkItem:", 0);
}

- (BOOL)_shouldCancelCurrentWorkItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  -[PLBackgroundJobDuplicateDetectorWorker cancelledWorkItem](self, "cancelledWorkItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: current work item cancelled", v9, 2u);
    }

  }
  return v6;
}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)stopWorkingOnItem:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLDuplicateDetectionGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: %{public}@ stopWorkingOnItem: %p", (uint8_t *)&v8, 0x16u);

  }
  -[PLBackgroundJobDuplicateDetectorWorker setCancelledWorkItem:](self, "setCancelledWorkItem:", v4);

}

- (id)_validObjectIDFromChange:(id)a3 entityDescriptionMap:(id)a4 requiresFingerprintDedupe:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  BOOL *v34;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "changedObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "changeType") != 1)
    goto LABEL_20;
  objc_msgSend(v10, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a5;
  if ((objc_msgSend(v11, "isEqual:", v13) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v8, "updatedProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intersectsSet:", self->_additionalAttributesPropertiesToInclude);

  if (!v15)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v8, "updatedProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intersectsSet:", self->_additionalAttributesPropertiesToIncludeForMetadataProcessing);

  v18 = 1;
  if ((v17 & 1) != 0)
  {
    v19 = 0;
LABEL_11:
    v25 = 0;
    v18 |= v19;
    v26 = 1;
    goto LABEL_17;
  }
LABEL_8:
  objc_msgSend(v10, "entity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isEqual:", v22) & 1) != 0)
  {
    objc_msgSend(v8, "updatedProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "intersectsSet:", self->_managedAssetPropertiesToInclude);

    if ((v24 & 1) != 0)
    {
      v19 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v10, "entity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqual:", v29))
  {
    objc_msgSend(v8, "updatedProperties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v30, "intersectsSet:", self->_duplicateAlbumPropertiesToInclude);

  }
  else
  {
    v25 = 0;
  }

  v26 = 0;
LABEL_17:
  v31 = v18 | v25;
  if (!v34 || !(v26 | v25))
  {
    if (!v31)
      goto LABEL_20;
LABEL_22:
    v32 = v10;
    goto LABEL_23;
  }
  *v34 = 1;
  if ((v31 & 1) != 0)
    goto LABEL_22;
LABEL_20:
  v32 = 0;
LABEL_23:

  return v32;
}

- (BOOL)_processDuplicatesWithLimitedSelection:(id)a3 requiresFingerprintDedupe:(BOOL)a4 library:(id)a5 error:(id *)a6 continuationHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__82049;
  v35 = __Block_byref_object_dispose__82050;
  v36 = 0;
  if (objc_msgSend(v12, "count"))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __141__PLBackgroundJobDuplicateDetectorWorker__processDuplicatesWithLimitedSelection_requiresFingerprintDedupe_library_error_continuationHandler___block_invoke;
    v27[3] = &unk_1E3676EC8;
    v30 = &v31;
    v27[4] = self;
    v28 = v12;
    v29 = v13;
    objc_msgSend(v29, "performBlockAndWait:", v27);

  }
  if (v10)
    v15 = 3;
  else
    v15 = 2;
  -[PLBackgroundJobWorker libraryBundle](self, "libraryBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "libraryServicesManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "duplicateProcessor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v32[5];
  v26 = 0;
  v20 = objc_msgSend(v18, "processDuplicatesOfAssetObjectIds:processingType:error:continuationHandler:", v19, v15, &v26, v14);
  v21 = v26;

  v22 = v21;
  v23 = v22;
  if (a6)
    v24 = v20;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
    *a6 = objc_retainAutorelease(v22);

  _Block_object_dispose(&v31, 8);
  return v20;
}

- (id)_convertToPLManagedAssetOIDsFromSelectionOIDs:(id)a3 library:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, void *);
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C97B20];
  v8 = a3;
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C97B20];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entityForName:inManagedObjectContext:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C97B20];
  +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entityForName:inManagedObjectContext:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __96__PLBackgroundJobDuplicateDetectorWorker__convertToPLManagedAssetOIDsFromSelectionOIDs_library___block_invoke;
  v38 = &unk_1E3673228;
  v39 = v11;
  v23 = v21;
  v40 = v23;
  v41 = v19;
  v24 = v22;
  v42 = v24;
  v43 = v15;
  v25 = v20;
  v44 = v25;
  v26 = v15;
  v27 = v19;
  v28 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v35);

  -[PLBackgroundJobDuplicateDetectorWorker _managedAssetOIDsFromAdditionalAssetAttributesOIDs:library:](self, "_managedAssetOIDsFromAdditionalAssetAttributesOIDs:library:", v23, v6, v35, v36, v37, v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v30);

  }
  -[PLBackgroundJobDuplicateDetectorWorker _managedAssetOIDsFromDuplicateAlbumOIDs:library:](self, "_managedAssetOIDsFromDuplicateAlbumOIDs:library:", v24, v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v31, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v32);

  }
  v33 = v25;

  return v33;
}

- (id)_managedAssetOIDsFromAdditionalAssetAttributesOIDs:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)MEMORY[0x1E0C97B48];
    +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

    v27[0] = CFSTR("asset");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPropertiesToFetch:", v12);

    objc_msgSend(v10, "setResultType:", 2);
    objc_msgSend(v6, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v13, "executeFetchRequest:error:", v10, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;

    if (v14)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __101__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromAdditionalAssetAttributesOIDs_library___block_invoke;
      v20[3] = &unk_1E3673250;
      v21 = v7;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
      v16 = v21;
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Failed to fetch oids for %{public}@. Error: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_managedAssetOIDsFromDuplicateAlbumOIDs:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)MEMORY[0x1E0C97B48];
    +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

    v27[0] = CFSTR("assets");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v12);

    objc_msgSend(v6, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v13, "executeFetchRequest:error:", v10, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;

    if (v14)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __90__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromDuplicateAlbumOIDs_library___block_invoke;
      v20[3] = &unk_1E3673278;
      v21 = v7;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
      v16 = v21;
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Failed to fetch oids for %{public}@. Error: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isFullLibraryWorkItem:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PLBackgroundJobDuplicateDetectorProcessEntireLibrary"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasCompletedPerceptualProcessingWithLibrary:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "globalValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInitialDuplicateDetectorProcessingCompleted");

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PLDuplicateDetector duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:pathManager:](PLDuplicateDetector, "duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:pathManager:", v7, v8);

  }
  return v6;
}

- (void)_setupPropertiesWithLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *additionalAttributesPropertiesToInclude;
  void *v15;
  NSSet *v16;
  NSSet *additionalAttributesPropertiesToIncludeForMetadataProcessing;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSSet *v28;
  NSSet *managedAssetPropertiesToInclude;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSSet *v36;
  NSSet *duplicateAlbumPropertiesToInclude;
  id v38;

  v4 = (void *)MEMORY[0x1E0C97B20];
  v5 = a3;
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", v6, v7);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "attributesByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sceneAnalysisTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("originalStableHash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  v13 = (NSSet *)objc_msgSend(v9, "copy");
  additionalAttributesPropertiesToInclude = self->_additionalAttributesPropertiesToInclude;
  self->_additionalAttributesPropertiesToInclude = v13;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v15);

  v16 = (NSSet *)objc_msgSend(v9, "copy");
  additionalAttributesPropertiesToIncludeForMetadataProcessing = self->_additionalAttributesPropertiesToIncludeForMetadataProcessing;
  self->_additionalAttributesPropertiesToIncludeForMetadataProcessing = v16;

  objc_msgSend(v9, "removeAllObjects");
  v18 = (void *)MEMORY[0x1E0C97B20];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entityForName:inManagedObjectContext:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "attributesByName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("hidden"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v23);

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("trashedState"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v24);

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v25);

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("adjustmentTimestamp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v26);

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("activeLibraryScopeParticipationState"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v27);

  v28 = (NSSet *)objc_msgSend(v9, "copy");
  managedAssetPropertiesToInclude = self->_managedAssetPropertiesToInclude;
  self->_managedAssetPropertiesToInclude = v28;

  objc_msgSend(v9, "removeAllObjects");
  v30 = (void *)MEMORY[0x1E0C97B20];
  +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "entityForName:inManagedObjectContext:", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "attributesByName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("processingVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v35);

  v36 = (NSSet *)objc_msgSend(v9, "copy");
  duplicateAlbumPropertiesToInclude = self->_duplicateAlbumPropertiesToInclude;
  self->_duplicateAlbumPropertiesToInclude = v36;

}

- (void)_resetTokenIfRequiredFromLibrary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  PLBackgroundJobDuplicateDetectorWorker *v11;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke;
  block[3] = &unk_1E3677C18;
  v10 = v4;
  v11 = self;
  v5 = _resetTokenIfRequiredFromLibrary__onceToken;
  v6 = v4;
  v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&_resetTokenIfRequiredFromLibrary__onceToken, block);
    v7 = v10;
  }

}

- (void)_setTokenMarkerWithPrivateData:(id)a3 value:(BOOL)a4 wellKnownIdentifier:(int64_t)a5
{
  _BOOL8 v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  __CFString *v20;
  id v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v10 = objc_msgSend(v8, "setValue:forKey:error:", v9, CFSTR("DuplicateSharedLibraryEnabledMarker"), &v21);

  v11 = v21;
  PLDuplicateDetectionGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("NO");
      if (v6)
        v14 = CFSTR("YES");
      v15 = v14;
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2048;
      v25 = a5;
      v16 = "Duplicate Detector Worker: Setting the initial enable marker %{public}@ for library identifier: %td";
      v17 = v13;
      v18 = OS_LOG_TYPE_DEFAULT;
      v19 = 22;
LABEL_10:
      _os_log_impl(&dword_199541000, v17, v18, v16, buf, v19);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v20 = CFSTR("NO");
    if (v6)
      v20 = CFSTR("YES");
    v15 = v20;
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    v24 = 2048;
    v25 = a5;
    v26 = 2112;
    v27 = v11;
    v16 = "Duplicate Detector Worker: Failed to set the initial enable marker %{public}@ for library identifier: %td. Error: %@";
    v17 = v13;
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 32;
    goto LABEL_10;
  }

}

- (id)_lastDuplicateDetectorProcessingTokenFromLibrary:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "globalValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastDuplicateDetectorProcessingToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLDuplicateDetectionGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Duplicate Detector Worker: last history token is %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)_setLastDuplicateDetectorProcessingToken:(id)a3 isCompleted:(BOOL)a4 library:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLDuplicateDetectionGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = 138543618;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: saving token %{public}@ to library %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v8, "globalValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastDuplicateDetectorProcessingToken:", v7);

  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v8, "globalValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isInitialDuplicateDetectorProcessingCompleted");

      if ((v12 & 1) == 0)
      {
        PLDuplicateDetectionGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138543618;
          v16 = v7;
          v17 = 2112;
          v18 = v8;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: saving completed initial processing token %{public}@ to library %@", (uint8_t *)&v15, 0x16u);
        }

        objc_msgSend(v8, "globalValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastInitialDuplicateDetectorProcessingCompletedToken:", v7);

      }
    }
  }

}

- (id)_transactionIteratorSinceTokenIfValid:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  id v15;

  v7 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", v7, v8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  v11 = v10;
  v12 = v11;
  if (v9)
    v13 = 1;
  else
    v13 = a5 == 0;
  if (!v13)
    *a5 = objc_retainAutorelease(v11);

  return v9;
}

- (NSCopying)cancelledWorkItem
{
  return (NSCopying *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCancelledWorkItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelledWorkItem, 0);
  objc_storeStrong((id *)&self->_duplicateAlbumPropertiesToInclude, 0);
  objc_storeStrong((id *)&self->_managedAssetPropertiesToInclude, 0);
  objc_storeStrong((id *)&self->_additionalAttributesPropertiesToIncludeForMetadataProcessing, 0);
  objc_storeStrong((id *)&self->_additionalAttributesPropertiesToInclude, 0);
}

void __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D73158];
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appPrivateDataForLibraryURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKey:", CFSTR("DuplicateSharedLibraryEnabledMarker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:](PLDuplicateProcessor, "sharedLibraryDedupeEnabledWithPathManager:", v7);

  if (v6)
  {
    v9 = objc_msgSend(v6, "BOOLValue");
    PLDuplicateDetectionGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8 == v9)
    {
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v27 = objc_msgSend(v22, "wellKnownPhotoLibraryIdentifier");
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Duplicate Detector Worker: Matching enable marker for library identifier: %td", buf, 0xCu);

      }
    }
    else
    {
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v27 = objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier");
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Duplicate Detector Worker: Resetting token due to enable marker mismatch for library identifier: %td", buf, 0xCu);

      }
      v13 = *(void **)(a1 + 32);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke_78;
      v24[3] = &unk_1E3677AA0;
      v25 = v13;
      objc_msgSend(v25, "performBlockAndWait:", v24);
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setTokenMarkerWithPrivateData:value:wellKnownIdentifier:", v5, v8, objc_msgSend(v15, "wellKnownPhotoLibraryIdentifier"));

      v16 = *(_QWORD *)(a1 + 32);
      v23 = 0;
      v17 = +[PLDuplicateProcessor removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:error:](PLDuplicateProcessor, "removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:error:", v16, &v23);
      v18 = v23;
      if (!v17)
      {
        PLDuplicateDetectionGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = (uint64_t)v18;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Failed to remove Shared Library assets from duplicate albums. Error: %@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    v20 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setTokenMarkerWithPrivateData:value:wellKnownIdentifier:", v5, v8, objc_msgSend(v21, "wellKnownPhotoLibraryIdentifier"));

  }
}

void __75__PLBackgroundJobDuplicateDetectorWorker__resetTokenIfRequiredFromLibrary___block_invoke_78(uint64_t a1)
{
  PLGlobalValues *v2;
  void *v3;
  PLGlobalValues *v4;

  v2 = [PLGlobalValues alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLGlobalValues initWithManagedObjectContext:](v2, "initWithManagedObjectContext:", v3);

  -[PLGlobalValues setLastDuplicateDetectorProcessingToken:](v4, "setLastDuplicateDetectorProcessingToken:", 0);
  -[PLGlobalValues setLastInitialDuplicateDetectorProcessingCompletedToken:](v4, "setLastInitialDuplicateDetectorProcessingCompletedToken:", 0);

}

void __90__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromDuplicateAlbumOIDs_library___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("objectID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

void __101__PLBackgroundJobDuplicateDetectorWorker__managedAssetOIDsFromAdditionalAssetAttributesOIDs_library___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __96__PLBackgroundJobDuplicateDetectorWorker__convertToPLManagedAssetOIDsFromSelectionOIDs_library___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", a1[4]);

  if (v5)
  {
    v6 = (void *)a1[5];
LABEL_7:
    objc_msgSend(v6, "addObject:", v3);
    goto LABEL_8;
  }
  objc_msgSend(v3, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", a1[6]);

  if (v8)
  {
    v6 = (void *)a1[7];
    goto LABEL_7;
  }
  objc_msgSend(v3, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", a1[8]);

  if (v10)
  {
    v6 = (void *)a1[9];
    goto LABEL_7;
  }
  PLDuplicateDetectionGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "entity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: Unexpected entity type for limited selection: %{public}@", (uint8_t *)&v14, 0xCu);

  }
LABEL_8:

}

void __141__PLBackgroundJobDuplicateDetectorWorker__processDuplicatesWithLimitedSelection_requiresFingerprintDedupe_library_error_continuationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_convertToPLManagedAssetOIDsFromSelectionOIDs:library:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  __int128 v43;
  __int128 *p_buf;
  id v45;
  id v46;
  __int128 buf;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v3 = (uint64_t *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_hasCompletedPerceptualProcessingWithLibrary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)v2, "_lastDuplicateDetectorProcessingTokenFromLibrary:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)v2;
  v6 = *v3;
  v46 = 0;
  objc_msgSend(v5, "_transactionIteratorSinceTokenIfValid:library:error:", v4, v6, &v46);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v46;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    && objc_msgSend((id)objc_opt_class(), "_isTokenInvalidError:", v8))
  {
    if (v4)
    {
      PLDuplicateDetectionGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: last duplicate processing token was non-null but invalid. Processing duplicates for the entire library.", (uint8_t *)&buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v45 = v8;
    objc_msgSend(v12, "_transactionIteratorSinceTokenIfValid:library:error:", 0, v13, &v45);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v45;

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v14;

    v4 = 0;
    v8 = v15;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isFullLibraryWorkItem:", *(_QWORD *)(a1 + 48)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                          + 24);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_setupPropertiesWithLibrary:", *(_QWORD *)(a1 + 40));
      +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v39;
      v18 = (void *)MEMORY[0x1E0C97B20];
      +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "entityForName:inManagedObjectContext:", v38, v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v36;
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v35;
      v19 = (void *)MEMORY[0x1E0C97B20];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "entityForName:inManagedObjectContext:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v22;
      +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v23;
      v24 = (void *)MEMORY[0x1E0C97B20];
      +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "entityForName:inManagedObjectContext:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v48 = 0x2020000000;
      v49 = 0;
      v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_37;
      v40[3] = &unk_1E3673188;
      v40[4] = *(_QWORD *)(a1 + 32);
      v41 = *(id *)(a1 + 48);
      v32 = v34;
      v42 = v32;
      v43 = *(_OWORD *)(a1 + 88);
      p_buf = &buf;
      objc_msgSend(v31, "enumerateRemainingTransactionsWithBlock:", v40);

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: no transactionIterator, error: %@", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19[3];
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[3];
  char v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__82049;
    v35[4] = __Block_byref_object_dispose__82050;
    v36 = 0;
    v3 = *(void **)(a1 + 48);
    v4 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_2;
    v28[3] = &unk_1E36731B0;
    v5 = *(_QWORD *)(a1 + 64);
    v30 = v35;
    v31 = v5;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v29 = v6;
    v32 = v7;
    v33 = v37;
    v34 = v8;
    objc_msgSend(v6, "performBlockAndWait:", v28);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
      || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      v27 = 0;
      v24[0] = v4;
      v24[1] = 3221225472;
      v24[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_3;
      v24[3] = &unk_1E36731D8;
      v11 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v25 = *(id *)(a1 + 32);
      v26 = v11;
      LODWORD(v10) = objc_msgSend(v25, "_processDuplicatesWithLimitedSelection:requiresFingerprintDedupe:library:error:continuationHandler:", v9, v10, v12, &v27, v24);
      v13 = &v26;
      v14 = v27;
      v2 = v14;
      if ((_DWORD)v10)
      {
        v15 = *(void **)(a1 + 48);
        v20[0] = v4;
        v20[1] = 3221225472;
        v20[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_4;
        v20[3] = &unk_1E3676348;
        v20[4] = *(_QWORD *)(a1 + 32);
        v22 = v35;
        v23 = v37;
        v21 = v15;
        objc_msgSend(v21, "performBlockAndWait:", v20);

      }
      else if (objc_msgSend(v14, "code") != 49406)
      {
        PLDuplicateDetectionGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v2;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Duplicate Detector Worker: failed to process entire library duplicates. Error: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v17 = *(void **)(a1 + 48);
      v18[0] = v4;
      v18[1] = 3221225472;
      v18[2] = __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_43;
      v18[3] = &unk_1E3676348;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19[1] = v35;
      v19[2] = v37;
      v19[0] = v17;
      objc_msgSend(v19[0], "performBlockAndWait:", v18);
      v2 = 0;
      v13 = v19;
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  int v5;
  void *v6;
  BOOL v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(unsigned __int8 *)(v4 + 24);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "persistentStoreCoordinator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentPersistentHistoryTokenFromStores:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "lastIteratedToken");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
  if (v5)
  {

    v6 = v1;
  }

  v7 = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
     || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "hasMoreTransactions") & 1) == 0)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7;
}

uint64_t __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 40)) ^ 1;
}

uint64_t __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLastDuplicateDetectorProcessingToken:isCompleted:library:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 40));
}

uint64_t __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLastDuplicateDetectorProcessingToken:isCompleted:library:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 40));
}

void __81__PLBackgroundJobDuplicateDetectorWorker_performWorkOnItem_inLibrary_completion___block_invoke_37(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 40)))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "changes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "_validObjectIDFromChange:entityDescriptionMap:requiresFingerprintDedupe:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(_QWORD *)(v12 + 24) + 1;
    *(_QWORD *)(v12 + 24) = v13;
    if (v13 == 5000)
    {
      PLDuplicateDetectionGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
        *(_DWORD *)buf = 134218240;
        v25 = v15;
        v26 = 2048;
        v27 = v16;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: reached transaction batch limit of %tu (changes per batch: %tu)", buf, 0x16u);
      }

      *a3 = 1;
    }
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") >= 0x3E8)
    {
      PLDuplicateDetectionGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        *(_DWORD *)buf = 134218240;
        v25 = v18;
        v26 = 2048;
        v27 = v19;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Duplicate Detector Worker: reached changes per batch limit: %tu (transactions per batch: %tu)", buf, 0x16u);
      }

      *a3 = 1;
    }

  }
}

@end
