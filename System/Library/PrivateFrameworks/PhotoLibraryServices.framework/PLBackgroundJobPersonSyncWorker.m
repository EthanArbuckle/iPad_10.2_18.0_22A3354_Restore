@implementation PLBackgroundJobPersonSyncWorker

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 3;
}

+ (BOOL)usesMultipleLibrariesConcurrently
{
  return 1;
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
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "PersonSync: Persistent history transaction iterator error was unrecognized: %@", (uint8_t *)&v11, 0xCu);
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
  PLBackgroundJobWorkerPendingWorkItems *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PLBackgroundJobWorkerPendingWorkItems *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLBackgroundJobWorkerPendingWorkItems *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  PLBackgroundJobWorkerPendingWorkItems *v24;
  void *v25;
  void *context;
  _QWORD v28[5];
  void *v29;
  uint64_t v30;
  uint8_t v31[4];
  uint64_t v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  void *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLBackgroundJobCriteria criteriaForHubbleWorker](PLBackgroundJobCriteria, "criteriaForHubbleWorker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x19AEC1554]();
  -[PLBackgroundJobPersonSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobPersonSyncWorker workItemsNeedingProcessingInLibrary:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLBackgroundJobPersonSyncWorker _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:](self, "_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:", v6, v4))
  {
    -[PLBackgroundJobPersonSyncWorker _anyPersistentHistoryTokenWithLibrary:](self, "_anyPersistentHistoryTokenWithLibrary:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v9 = v8;
    if (v7)
    {
      v39[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v9, "initWithCriteria:workItemsNeedingProcessing:", v5, v10);

    }
    else
    {
      self = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems](v8, "initWithZeroWorkItems");
    }

    objc_autoreleasePoolPop(context);
  }
  else
  {
    -[PLBackgroundJobPersonSyncWorker _lastPersonSyncTokenFromLibrary:](self, "_lastPersonSyncTokenFromLibrary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundJobPersonSyncWorker _transactionIteratorSinceLastToken:sourceLibrary:error:](self, "_transactionIteratorSinceLastToken:sourceLibrary:error:", v11, v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      if (v11)
      {
        PLSyndicationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker returning 1 work item (lastToken %@)", (uint8_t *)&buf, 0xCu);
        }

        v14 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        v38 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v14, "initWithCriteria:workItemsNeedingProcessing:", v5, v15);

      }
      else
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__54387;
        v36 = __Block_byref_object_dispose__54388;
        v37 = 0;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __71__PLBackgroundJobPersonSyncWorker_workItemsNeedingProcessingInLibrary___block_invoke;
        v28[3] = &unk_1E366C5D0;
        v28[4] = &buf;
        objc_msgSend(v12, "enumerateRemainingTransactionsWithBlock:", v28);
        PLSyndicationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v31 = 138412290;
          v32 = v23;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker returning 1 work item (firstTransactionToken %@)", v31, 0xCu);
        }

        v24 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v24, "initWithCriteria:workItemsNeedingProcessing:", v5, v25);

        _Block_object_dispose(&buf, 8);
      }
      v21 = 1;
    }
    else
    {
      -[PLBackgroundJobPersonSyncWorker _faceCropUuidsFromLibrary:error:](self, "_faceCropUuidsFromLibrary:error:", v4, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBackgroundJobPersonSyncWorker _faceCropUuidsMissingFromList:inLibrary:error:](self, "_faceCropUuidsMissingFromList:inLibrary:error:", v16, v6, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count")
        && (-[PLBackgroundJobPersonSyncWorker _anyPersistentHistoryTokenWithLibrary:](self, "_anyPersistentHistoryTokenWithLibrary:", v4), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        v29 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v19, "initWithCriteria:workItemsNeedingProcessing:", v5, v20);

        v21 = 1;
      }
      else
      {
        v21 = 0;
      }

    }
    objc_autoreleasePoolPop(context);
    if (!v21)
      self = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
  }

  return self;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id);
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  void (**v24)(id, id);
  SEL v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id))a5;
  -[PLBackgroundJobPersonSyncWorker _resetCancelledWorkItem](self, "_resetCancelledWorkItem");
  PLSyndicationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v29 = v9;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker performWorkOnItem: %p %@", buf, 0x16u);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobPersonSyncWorker.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library != nil"));

  }
  -[PLBackgroundJobPersonSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobPersonSyncWorker performWorkOnItem:inLibrary:completion:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (-[PLBackgroundJobPersonSyncWorker _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:](self, "_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:", v13, v10))
    {
      v27 = 0;
      v14 = -[PLBackgroundJobPersonSyncWorker _resetPersonSyncInTargetLibrary:error:](self, "_resetPersonSyncInTargetLibrary:error:", v10, &v27);
      v15 = v27;
      if (!v14)
      {
        v11[2](v11, v15);
LABEL_18:

        goto LABEL_19;
      }
      -[PLBackgroundJobPersonSyncWorker _updateLastPersonSyncSourceLibraryURLWithSourceLibrary:targetLibrary:](self, "_updateLastPersonSyncSourceLibraryURLWithSourceLibrary:targetLibrary:", v13, v10);

    }
    v26 = 0;
    v16 = -[PLBackgroundJobPersonSyncWorker _syncFaceCropsFromLibrary:toLibrary:error:](self, "_syncFaceCropsFromLibrary:toLibrary:error:", v10, v13, &v26);
    v15 = v26;
    if (!v16)
    {
      PLSyndicationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "PersonSync: continuing after _syncFaceCropsFromLibrary failed with error %@", buf, 0xCu);
      }

    }
    -[PLBackgroundJobPersonSyncWorker _setupPropertiesToIgnoreWithSourceLibrary:](self, "_setupPropertiesToIgnoreWithSourceLibrary:", v13);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke;
    v20[3] = &unk_1E3676218;
    v20[4] = self;
    v21 = v10;
    v22 = v13;
    v24 = v11;
    v23 = v9;
    v25 = a2;
    objc_msgSend(v22, "performBlock:", v20);

    goto LABEL_18;
  }
  PLSyndicationGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v9;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "PersonSync: No work for item %p: sourceLibrary is nil", buf, 0xCu);
  }

  v11[2](v11, 0);
LABEL_19:

}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)stopWorkingOnItem:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSyndicationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker stopWorkingOnItem: %p", (uint8_t *)&v6, 0xCu);
  }

  -[PLBackgroundJobPersonSyncWorker setCancelledWorkItem:](self, "setCancelledWorkItem:", v4);
}

- (id)_faceCropUuidsFromLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("type"), &unk_1E3763C80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setResultType:", 2);
  v37[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v10);

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__54387;
  v33 = __Block_byref_object_dispose__54388;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__54387;
  v27 = __Block_byref_object_dispose__54388;
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__PLBackgroundJobPersonSyncWorker__faceCropUuidsFromLibrary_error___block_invoke;
  v18[3] = &unk_1E3676348;
  v21 = &v29;
  v11 = v5;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v22 = &v23;
  objc_msgSend(v11, "performBlockAndWait:", v18);
  v13 = (void *)v30[5];
  if (v13)
  {
    objc_msgSend(v13, "valueForKey:", CFSTR("uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSyndicationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v24[5];
      *(_DWORD *)buf = 138412290;
      v36 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "PersonSync: Unable to fetch face crop uuids from the processing library: %@", buf, 0xCu);
    }

    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v24[5]);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (id)_faceCropUuidsMissingFromList:(id)a3 inLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setResultType:", 2);
  v46[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToFetch:", v13);

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__54387;
  v42 = __Block_byref_object_dispose__54388;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__54387;
  v36 = __Block_byref_object_dispose__54388;
  v37 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __81__PLBackgroundJobPersonSyncWorker__faceCropUuidsMissingFromList_inLibrary_error___block_invoke;
  v27[3] = &unk_1E3676348;
  v30 = &v38;
  v14 = v8;
  v28 = v14;
  v15 = v11;
  v29 = v15;
  v31 = &v32;
  objc_msgSend(v14, "performBlockAndWait:", v27);
  if (v39[5])
  {
    v16 = objc_msgSend(v7, "count");
    if (v16 == objc_msgSend((id)v39[5], "count"))
    {
      PLSyndicationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "PersonSync: all face crops from processing library are in the SPL", buf, 2u);
      }

      v18 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v7);
      v22 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend((id)v39[5], "valueForKey:", CFSTR("uuid"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);

      objc_msgSend(v21, "minusSet:", v24);
      PLSyndicationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v21;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "PersonSync: missing the following face crops in the SPL: %{public}@", buf, 0xCu);
      }

      objc_msgSend(v21, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    PLSyndicationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)v33[5];
      *(_DWORD *)buf = 138412290;
      v45 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "PersonSync: Unable to fetch face crop uuids from the SPL: %@", buf, 0xCu);
    }

    v18 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)v33[5]);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v18;
}

- (BOOL)_syncFaceCropsFromLibrary:(id)a3 toLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PLInterLibraryTransfer *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  BOOL v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PLBackgroundJobPersonSyncWorker _faceCropUuidsFromLibrary:error:](self, "_faceCropUuidsFromLibrary:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PLBackgroundJobPersonSyncWorker _faceCropUuidsMissingFromList:inLibrary:error:](self, "_faceCropUuidsMissingFromList:inLibrary:error:", v10, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = +[PLInterLibraryTransferOptions newTransferOptionsForFaceCropFromSyndicationToSystem](PLInterLibraryTransferOptions, "newTransferOptionsForFaceCropFromSyndicationToSystem");
      v13 = -[PLInterLibraryTransfer initWithSourceLibrary:destinationLibrary:options:]([PLInterLibraryTransfer alloc], "initWithSourceLibrary:destinationLibrary:options:", v8, v9, v12);
      PLSyndicationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v29 = objc_msgSend(v11, "count");
        v30 = 2114;
        v31 = v11;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "PersonSync: %tu face crops to copy to SPL: %{public}@", buf, 0x16u);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v22 = v12;
        v18 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            if (!-[PLInterLibraryTransfer transferFaceCropWithUuid:error:](v13, "transferFaceCropWithUuid:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), a5))
            {
              v20 = 0;
              goto LABEL_16;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v17)
            continue;
          break;
        }
        v20 = 1;
LABEL_16:
        v12 = v22;
      }
      else
      {
        v20 = 1;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_setupPropertiesToIgnoreWithSourceLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  NSSet *propertiesToIgnore;
  id v16;

  v4 = (void *)MEMORY[0x1E0C97B20];
  v5 = a3;
  +[PLPerson entityName](PLPerson, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "entityForName:inManagedObjectContext:", v6, v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "attributesByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "relationshipsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v9, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("faceCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  v14 = (NSSet *)objc_msgSend(v12, "copy");
  propertiesToIgnore = self->_propertiesToIgnore;
  self->_propertiesToIgnore = v14;

}

- (void)_processNextPersonInChangedObjectIDs:(id)a3 fromSourceLibrary:(id)a4 toDestLibrary:(id)a5 group:(id)a6 workItem:(id)a7 deletedUuids:(id)a8 errorHandler:(id)a9
{
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  PLBackgroundJobPersonSyncWorker *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;

  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend(v22, "anyObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLBackgroundJobPersonSyncWorker _shouldCancelCurrentWorkItem:](self, "_shouldCancelCurrentWorkItem:", v18)
    || !v21)
  {
    dispatch_group_leave(v17);
  }
  else
  {
    objc_msgSend(v22, "removeObject:", v21);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke;
    v23[3] = &unk_1E366C670;
    v24 = v15;
    v25 = v21;
    v26 = v19;
    v27 = self;
    v28 = v22;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v32 = v20;
    objc_msgSend(v24, "performBlockAndWait:", v23);

  }
}

- (void)_syncPerson:(id)a3 toLibrary:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  PLInterLibraryTransfer *v14;
  void *v15;
  PLInterLibraryTransfer *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  PLBackgroundJobPersonSyncWorker *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = a3;
  objc_msgSend(v10, "personUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "PersonSync: _syncPerson %{public}@ begin", buf, 0xCu);
  }

  v13 = +[PLInterLibraryTransferOptions newTransferOptionsForPersonFromSystemToSyndication](PLInterLibraryTransferOptions, "newTransferOptionsForPersonFromSystemToSyndication");
  v14 = [PLInterLibraryTransfer alloc];
  objc_msgSend(v10, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PLInterLibraryTransfer initWithSourceLibrary:destinationLibrary:options:](v14, "initWithSourceLibrary:destinationLibrary:options:", v15, v8, v13);
  v25 = 0;
  v17 = -[PLInterLibraryTransfer transferPersonWithUuid:error:](v16, "transferPersonWithUuid:error:", v11, &v25);
  v18 = v25;
  PLSyndicationGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "PersonSync: _syncPerson %{public}@ succeeded", buf, 0xCu);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__PLBackgroundJobPersonSyncWorker__syncPerson_toLibrary_completion___block_invoke;
    v21[3] = &unk_1E3677530;
    v22 = v11;
    v23 = v8;
    v24 = self;
    objc_msgSend(v23, "performTransactionAndWait:", v21);

    v20 = v22;
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2112;
    v29 = v18;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "PersonSync: _syncPerson %{public}@ failed with error %@", buf, 0x16u);
  }

  v9[2](v9, v18);
}

- (void)_resetFacesProcessingForPerson:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "personUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "PersonSync: resetting faces processing on person %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "resetFacesProcessing");

}

- (void)_deletePersonWithUuid:(id)a3 fromLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PLBackgroundJobPersonSyncWorker *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__54387;
  v20 = __Block_byref_object_dispose__54388;
  v21 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PLBackgroundJobPersonSyncWorker__deletePersonWithUuid_fromLibrary___block_invoke;
  v11[3] = &unk_1E3676EC8;
  v15 = &v16;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "performTransactionAndWait:", v11);
  if (v17[5])
  {
    PLSyndicationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "PersonSync: Finished deleting person %{public}@ from syndication library.", buf, 0xCu);
    }

  }
  _Block_object_dispose(&v16, 8);

}

- (void)_resetCancelledWorkItem
{
  NSObject *v3;
  uint8_t v4[16];

  PLSyndicationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "PersonSync: reset cancelled work item", v4, 2u);
  }

  -[PLBackgroundJobPersonSyncWorker setCancelledWorkItem:](self, "setCancelledWorkItem:", 0);
}

- (BOOL)_shouldCancelCurrentWorkItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  -[PLBackgroundJobPersonSyncWorker cancelledWorkItem](self, "cancelledWorkItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    PLSyndicationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "PersonSync: current work item cancelled", v9, 2u);
    }

  }
  return v6;
}

- (id)_transactionIteratorSinceLastToken:(id)a3 sourceLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v15 = 0;
    -[PLBackgroundJobPersonSyncWorker _transactionIteratorSinceTokenIfValid:sourceLibrary:error:](self, "_transactionIteratorSinceTokenIfValid:sourceLibrary:error:", v8, v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (!v10)
    {
      while (1)
      {
        PLSyndicationGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "PersonSync: Error creating persistent history transaction iterator: %@", buf, 0xCu);
        }

        if (!objc_msgSend((id)objc_opt_class(), "_isTokenInvalidError:", v11))
          break;
        PLSyndicationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "PersonSync: Assuming people sync in syndication library has been reset, creating iterator with nil token", buf, 2u);
        }

        v15 = 0;
        -[PLBackgroundJobPersonSyncWorker _transactionIteratorSinceTokenIfValid:sourceLibrary:error:](self, "_transactionIteratorSinceTokenIfValid:sourceLibrary:error:", 0, v9, &v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v15;
        v8 = 0;
        if (v10)
          goto LABEL_14;
      }
      if (a5)
      {
        v11 = objc_retainAutorelease(v11);
        v10 = 0;
        *a5 = v11;
      }
      else
      {
        v10 = 0;
      }
    }
LABEL_14:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_transactionIteratorSinceTokenIfValid:(id)a3 sourceLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v13;

  v7 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", v7, v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v9)
    v11 = 1;
  else
    v11 = a5 == 0;
  if (!v11)
    *a5 = objc_retainAutorelease(v10);

  return v9;
}

- (id)_anyPersistentHistoryTokenWithLibrary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[5];
  uint8_t v15[4];
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBackgroundJobPersonSyncWorker _lastPersonSyncTokenFromLibrary:](self, "_lastPersonSyncTokenFromLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PLSyndicationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "PersonSync: anyPersistentHistoryToken is lastToken %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v7 = v5;
  }
  else
  {
    -[PLBackgroundJobPersonSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobPersonSyncWorker _anyPersistentHistoryTokenWithLibrary:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundJobPersonSyncWorker _transactionIteratorSinceLastToken:sourceLibrary:error:](self, "_transactionIteratorSinceLastToken:sourceLibrary:error:", 0, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__54387;
      v20 = __Block_byref_object_dispose__54388;
      v21 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __73__PLBackgroundJobPersonSyncWorker__anyPersistentHistoryTokenWithLibrary___block_invoke;
      v14[3] = &unk_1E366C5D0;
      v14[4] = &buf;
      objc_msgSend(v9, "enumerateRemainingTransactionsWithBlock:", v14);
      PLSyndicationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v15 = 138543362;
        v16 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "PersonSync: anyPersistentHistoryToken is %{public}@", v15, 0xCu);
      }

      v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      PLSyndicationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "PersonSync: anyPersistentHistoryToken found no token", (uint8_t *)&buf, 2u);
      }

      v7 = 0;
    }

  }
  return v7;
}

- (id)_sourcePhotoLibraryWithName:(const char *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[16];
  id v16;
  id v17;

  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openBundleAtLibraryURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v7, "activate:", &v17);
  v9 = v17;
  v10 = v9;
  if (v8
    && (v9,
        v16 = 0,
        v11 = objc_msgSend(v7, "awaitLibraryState:error:", 7, &v16),
        v10 = v16,
        v11))
  {
    objc_msgSend(v7, "databaseContext");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)-[NSObject newShortLivedLibraryWithName:](v12, "newShortLivedLibraryWithName:", a3);
  }
  else
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "PersonSync: Unable to provide source library for person sync worker", v15, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)_lastPersonSyncTokenFromLibrary:(id)a3
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
  objc_msgSend(v3, "lastPersonSyncToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLSyndicationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "PersonSync: last people sync token is %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)_resetPersonSyncInTargetLibrary:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  __int128 *p_buf;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  id v24;
  PLBackgroundJobPersonSyncWorker *v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLSyndicationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "libraryBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PersonSync: resetting all faces and persons in library %@", (uint8_t *)&buf, 0xCu);

  }
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke;
  v23[3] = &unk_1E3677C18;
  v10 = v6;
  v24 = v10;
  v25 = self;
  objc_msgSend(v10, "performTransactionAndWait:", v23);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__54387;
  v29 = __Block_byref_object_dispose__54388;
  v30 = 0;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_65;
  v15[3] = &unk_1E3677830;
  v11 = v10;
  v16 = v11;
  v17 = &v19;
  p_buf = &buf;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v12 && a4)
    *a4 = objc_retainAutorelease(v12);
  v13 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)_savePersonSyncToken:(id)a3 toLibrary:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLSyndicationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "PersonSync: saving sync token %{public}@ to library %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v6, "globalValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastPersonSyncToken:", v5);

}

- (id)_lastPersonSyncSourceLibraryURLFromSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "globalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPersonSyncSourceLibraryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "PersonSync: last source library URL is nil, setting to %@", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(v9, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "globalValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLastPersonSyncSourceLibraryPath:", v13);

  }
  return v9;
}

- (void)_updateLastPersonSyncSourceLibraryURLWithSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryURL");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLastPersonSyncSourceLibraryPath:", v7);
}

- (BOOL)_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLBackgroundJobPersonSyncWorker _lastPersonSyncSourceLibraryURLFromSourceLibrary:targetLibrary:](self, "_lastPersonSyncSourceLibraryURLFromSourceLibrary:targetLibrary:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForFileURL:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "PersonSync: System photo library URL changed since last run %{public}@ -> %@", (uint8_t *)&v15, 0x16u);

    }
  }

  return v10 ^ 1;
}

- (PLPhotoLibraryBundle)testingSourceBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTestingSourceBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSPersistentHistoryToken)cancelledWorkItem
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCancelledWorkItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelledWorkItem, 0);
  objc_storeStrong((id *)&self->_testingSourceBundle, 0);
  objc_storeStrong((id *)&self->_propertiesToIgnore, 0);
}

void __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_2;
  v7[3] = &unk_1E366C698;
  v7[4] = *(_QWORD *)(a1 + 40);
  v6 = (id)objc_msgSend(v5, "enumerateObjectsFromFetchRequest:usingDefaultBatchSizeWithBlock:", v4, v7);

}

void __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_65(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = objc_msgSend(v5, "countForFetchRequest:error:", v4, &v16);
  v7 = v16;
  v8 = v16;

  if (v6)
    v9 = 0;
  else
    v9 = v8 == 0;
  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("Persons still present in target library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 41001, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "personUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "PersonSync: resetting nameSource on faces from person %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_resetFacesProcessingForPerson:", v3);
  PLSyndicationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "PersonSync: deleting person %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(v3, "deletePersonWithReason:", 9);

}

void __73__PLBackgroundJobPersonSyncWorker__anyPersistentHistoryTokenWithLibrary___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "token");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

void __69__PLBackgroundJobPersonSyncWorker__deletePersonWithUuid_fromLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_resetFacesProcessingForPerson:");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "deletePersonWithReason:", 9);
  }
  else
  {
    PLSyndicationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PersonSync: Person with uuid %{public}@ does not exist in syndication library", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __68__PLBackgroundJobPersonSyncWorker__syncPerson_toLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v2, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "_resetFacesProcessingForPerson:", v5);
    v4 = v5;
  }

}

void __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v4))
    {
      PLSyndicationGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v4;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "PersonSync: Found unexpected deleted person in source library with uuid %{public}@", buf, 0xCu);
      }

      v6 = *(void **)(a1 + 32);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_59;
      v35[3] = &unk_1E366C620;
      v7 = *(void **)(a1 + 64);
      v35[4] = *(_QWORD *)(a1 + 56);
      v36 = v7;
      v37 = *(id *)(a1 + 32);
      v38 = *(id *)(a1 + 72);
      v39 = *(id *)(a1 + 80);
      v40 = *(id *)(a1 + 88);
      v41 = *(id *)(a1 + 48);
      v42 = *(id *)(a1 + 96);
      objc_msgSend(v6, "performBlock:", v35);

      v8 = v36;
    }
    else
    {
      v13 = *(void **)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 72);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_2;
      v26[3] = &unk_1E366C648;
      v34 = *(id *)(a1 + 96);
      v27 = *(id *)(a1 + 80);
      v15 = *(id *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(void **)(a1 + 64);
      v28 = v15;
      v29 = v16;
      v30 = v17;
      v31 = *(id *)(a1 + 72);
      v32 = *(id *)(a1 + 88);
      v33 = *(id *)(a1 + 48);
      objc_msgSend(v13, "_syncPerson:toLibrary:completion:", v3, v14, v26);

      v8 = v34;
    }
  }
  else
  {
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v44 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "PersonSync: Unable to find changed object %@ in source library", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_60;
    v18[3] = &unk_1E366C620;
    v12 = *(void **)(a1 + 64);
    v18[4] = *(_QWORD *)(a1 + 56);
    v19 = v12;
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 72);
    v22 = *(id *)(a1 + 80);
    v23 = *(id *)(a1 + 88);
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 96);
    objc_msgSend(v11, "performBlock:", v18);

    v8 = v19;
  }

}

uint64_t __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextPersonInChangedObjectIDs:fromSourceLibrary:toDestLibrary:group:workItem:deletedUuids:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

void __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_3;
    v4[3] = &unk_1E366C620;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 64);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 72);
    v10 = *(id *)(a1 + 80);
    v11 = *(id *)(a1 + 88);
    objc_msgSend(v3, "performBlock:", v4);

  }
}

uint64_t __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextPersonInChangedObjectIDs:fromSourceLibrary:toDestLibrary:group:workItem:deletedUuids:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

uint64_t __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextPersonInChangedObjectIDs:fromSourceLibrary:toDestLibrary:group:workItem:deletedUuids:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

void __81__PLBackgroundJobPersonSyncWorker__faceCropUuidsMissingFromList_inLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v9;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);

}

void __67__PLBackgroundJobPersonSyncWorker__faceCropUuidsFromLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v9;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);

}

void __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  objc_class *v13;
  void *v14;
  id v15;
  const char *v16;
  qos_class_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  _QWORD block[4];
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 *p_buf;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  uint8_t v61[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_lastPersonSyncTokenFromLibrary:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v60 = 0;
  objc_msgSend(v4, "_transactionIteratorSinceTokenIfValid:sourceLibrary:error:", v3, v5, &v60);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v60;
  if (v6)
    goto LABEL_2;
  if (!objc_msgSend((id)objc_opt_class(), "_isTokenInvalidError:", v7))
    goto LABEL_11;
  if (v3)
  {
    PLSyndicationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "PersonSync: last people sync token was non-null but invalid. Resetting people sync in syndication library.", (uint8_t *)&buf, 2u);
    }

    v25 = *(void **)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 40);
    v59 = 0;
    v27 = objc_msgSend(v25, "_resetPersonSyncInTargetLibrary:error:", v26, &v59);
    v28 = v59;
    v29 = v28;
    if ((v27 & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

      goto LABEL_18;
    }

  }
  v30 = *(void **)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 48);
  v58 = v7;
  objc_msgSend(v30, "_transactionIteratorSinceLastToken:sourceLibrary:error:", v3, v31, &v58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v58;

  v7 = v32;
  if (v6)
  {
LABEL_2:
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = 0;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_28;
    v50[3] = &unk_1E366C5F8;
    v50[4] = *(_QWORD *)(a1 + 32);
    v51 = *(id *)(a1 + 56);
    v52 = *(id *)(a1 + 48);
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 72);
    v53 = v10;
    v56 = v11;
    v12 = v9;
    v54 = v12;
    v55 = v57;
    objc_msgSend(v6, "enumerateRemainingTransactionsWithBlock:", v50);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__54387;
    v68 = __Block_byref_object_dispose__54388;
    v69 = 0;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(".transferpersonsgroupcompletion"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(0, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v16, v18);

    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_37;
    block[3] = &unk_1E3677948;
    p_buf = &buf;
    v21 = v12;
    v22 = *(_QWORD *)(a1 + 32);
    v43 = v21;
    v44 = v22;
    v45 = *(id *)(a1 + 56);
    v46 = *(id *)(a1 + 40);
    v23 = v6;
    v47 = v23;
    v48 = *(id *)(a1 + 64);
    dispatch_group_notify(v20, v19, block);
    if ((objc_msgSend(*(id *)(a1 + 32), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 56)) & 1) != 0)
    {
      dispatch_group_leave(v20);
    }
    else
    {
      PLSyndicationGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = objc_msgSend(v10, "count");
        v36 = objc_msgSend(v21, "count");
        *(_DWORD *)v61 = 134218240;
        v62 = v35;
        v63 = 2048;
        v64 = v36;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_INFO, "PersonSync: %tu changes, %tu deletes to process", v61, 0x16u);
      }

      v37 = *(void **)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 40);
      v39 = *(_QWORD *)(a1 + 48);
      v40 = *(_QWORD *)(a1 + 56);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_41;
      v41[3] = &unk_1E36767E0;
      v41[4] = &buf;
      objc_msgSend(v37, "_processNextPersonInChangedObjectIDs:fromSourceLibrary:toDestLibrary:group:workItem:deletedUuids:errorHandler:", v10, v39, v38, v20, v40, v21, v41);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v57, 8);

  }
  else
  {
LABEL_11:
    PLSyndicationGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "PersonSync: no transactionIterator, error: %@", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
LABEL_18:

}

void __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_28(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  _BYTE *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  unint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 40)))
  {
    *a3 = 1;
    goto LABEL_29;
  }
  v33 = a3;
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B20];
  +[PLPerson entityName](PLPerson, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v6;
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v5;
  objc_msgSend(v5, "changes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v11)
    goto LABEL_20;
  v12 = v11;
  v13 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v36 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v15, "changedObjectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v9);

      if (v18)
      {
        v19 = objc_msgSend(v15, "changeType");
        switch(v19)
        {
          case 2:
            objc_msgSend(v15, "tombstone");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("personUUID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PLBackgroundJobPersonSyncWorker.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUuid != nil"));

            }
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v23);

            break;
          case 1:
            objc_msgSend(v15, "updatedProperties");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isSubsetOfSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

            if ((v21 & 1) != 0)
              break;
LABEL_14:
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
            break;
          case 0:
            goto LABEL_14;
        }
      }

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  }
  while (v12);
LABEL_20:
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v26 = *(_QWORD *)(v25 + 24) + 1;
  *(_QWORD *)(v25 + 24) = v26;
  if (v26 == 1000)
  {
    PLSyndicationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v40 = v28;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_INFO, "PersonSync: reached transaction batch limit of %tu", buf, 0xCu);
    }

    *v33 = 1;
  }
  v29 = objc_msgSend(*(id *)(a1 + 56), "count");
  v30 = objc_msgSend(*(id *)(a1 + 64), "count") + v29;
  if (v30 >= 0xC8)
  {
    PLSyndicationGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v40 = v30;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_INFO, "PersonSync: reached changes per batch limit: %tu", buf, 0xCu);
    }

    *v33 = 1;
  }

  v5 = v34;
LABEL_29:

}

uint64_t __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_37(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x19AEC1554](v3);
          if (objc_msgSend(*(id *)(a1 + 40), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 48), (_QWORD)v15))
          {
            objc_autoreleasePoolPop(v8);
            goto LABEL_12;
          }
          objc_msgSend(*(id *)(a1 + 40), "_deletePersonWithUuid:fromLibrary:", v7, *(_QWORD *)(a1 + 56));
          objc_autoreleasePoolPop(v8);
          ++v6;
        }
        while (v4 != v6);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        v4 = v3;
        if (v3)
          continue;
        break;
      }
    }
LABEL_12:

    if ((objc_msgSend(*(id *)(a1 + 40), "_shouldCancelCurrentWorkItem:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 64), "lastIteratedToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_savePersonSyncToken:toLibrary:", v10, *(_QWORD *)(a1 + 56));

    }
  }
  PLSyndicationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v13 = CFSTR("success");
    if (v12)
      v13 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "PersonSync: calling completionBlock with %p %@", buf, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_41(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71__PLBackgroundJobPersonSyncWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "token");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

@end
