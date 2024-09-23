@implementation PLBackgroundJobSyndicationSyncWorker

- (PLBackgroundJobSyndicationSyncWorker)initWithLibraryBundle:(id)a3
{
  id v4;
  PLBackgroundJobSyndicationSyncWorker *v5;
  PLBackgroundJobSyndicationSyncWorker *v6;
  id v7;
  id v8;
  id v9;
  uint64_t i;
  uint64_t v11;
  PLSyndicationSyncEngine *v12;
  PLSyndicationSyncEngine *syncManager;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLBackgroundJobSyndicationSyncWorker;
  v5 = -[PLBackgroundJobWorker initWithLibraryBundle:](&v21, sel_initWithLibraryBundle_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __62__PLBackgroundJobSyndicationSyncWorker_initWithLibraryBundle___block_invoke;
    v18 = &unk_1E3668318;
    v8 = v4;
    v19 = v8;
    v9 = v7;
    v20 = v9;
    for (i = 1; i != 5; ++i)
      v17((uint64_t)&v15, i);
    objc_storeStrong((id *)&v6->_supportedQueryTypes, v7);
    if (objc_msgSend(v8, "isSystemPhotoLibrary", v15, v16))
      v11 = objc_msgSend(MEMORY[0x1E0D73310], "maskForSyndicationSyncWorkerInSystemPhotoLibrary");
    else
      v11 = objc_msgSend(MEMORY[0x1E0D73310], "maskForSyndicationSyncWorkerInSyndicationLibrary");
    v12 = -[PLSyndicationSyncEngine initWithQueryTypes:savedAssetTypeMask:delegate:]([PLSyndicationSyncEngine alloc], "initWithQueryTypes:savedAssetTypeMask:delegate:", v6->_supportedQueryTypes, v11, v6);
    syncManager = v6->_syncManager;
    v6->_syncManager = v12;

  }
  return v6;
}

- (BOOL)_supportsSyndicationQueryType:(int64_t)a3
{
  NSSet *supportedQueryTypes;
  void *v4;

  supportedQueryTypes = self->_supportedQueryTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(supportedQueryTypes) = -[NSSet containsObject:](supportedQueryTypes, "containsObject:", v4);

  return (char)supportedQueryTypes;
}

- (BOOL)_hasPendingJobsBasedOnLastSyncDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("PLSyndicationLastUpdateDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = objc_msgSend(v3, "compare:", v5) != 1;
    else
      v6 = 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_hasPendingAttachmentJobsInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[PLBackgroundJobSyndicationSyncWorker _supportsSyndicationQueryType:](self, "_supportsSyndicationQueryType:", 1))
  {
    objc_msgSend(v4, "globalValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastAttachmentSyndicationSyncDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PLBackgroundJobSyndicationSyncWorker _hasPendingJobsBasedOnLastSyncDate:](self, "_hasPendingJobsBasedOnLastSyncDate:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_hasPendingChatJobsInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[PLBackgroundJobSyndicationSyncWorker _supportsSyndicationQueryType:](self, "_supportsSyndicationQueryType:", 2))
  {
    objc_msgSend(v4, "globalValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastChatSyndicationSyncDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PLBackgroundJobSyndicationSyncWorker _hasPendingJobsBasedOnLastSyncDate:](self, "_hasPendingJobsBasedOnLastSyncDate:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_hasPendingDeleteJobsInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLBackgroundJobSyndicationSyncWorker _supportsSyndicationQueryType:](self, "_supportsSyndicationQueryType:", 3))
  {
    objc_msgSend(v4, "globalValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastDeleteSyndicationSyncDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;
    if (!-[PLBackgroundJobSyndicationSyncWorker _hasPendingJobsBasedOnLastSyncDate:](self, "_hasPendingJobsBasedOnLastSyncDate:", v6))
    {
      if (v8 >= -604800.0)
      {
        v11 = 0;
        goto LABEL_10;
      }
      PLSyndicationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PLBackgroundJobWorker workerName](self, "workerName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v10;
        v15 = 2048;
        v16 = 7;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[sync.delete] %@ has pending delete sync since it has been over %ld days since the previous delete sync", (uint8_t *)&v13, 0x16u);

      }
    }
    v11 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_needsSyndicationFullIndexSyncInLibrary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;

  v3 = a3;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

  if (v5 == 3)
  {
    objc_msgSend(v3, "globalValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inProgressFullIndexSyndicationSyncDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v3, "globalValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastDeleteSyndicationSyncDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v10);
        v13 = v12;
        objc_msgSend(v3, "globalValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastFullIndexSyndicationSyncStartDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "timeIntervalSinceDate:", v15);
          if (v13 >= v16)
            v13 = v16;
        }
        v8 = v13 > 1209600.0;

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_workItemsBatchedFromDate:(id)a3 library:(id)a4 type:(int64_t)a5
{
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  if (v9 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  objc_msgSend(v8, "globalValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syndicationSyncRangeDenominator");
  v13 = v12;

  v14 = fmin(604800.0 / v13, 604800.0);
  if (v14 >= 1.0)
    v15 = v14;
  else
    v15 = 1.0;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v7;
  objc_msgSend(v17, "timeIntervalSinceNow");
  v24 = v17;
  if (v18 <= 0.0)
  {
    v19 = v17;
    while ((unint64_t)objc_msgSend(v16, "count") <= 0x3E7)
    {
      objc_msgSend(v19, "dateByAddingTimeInterval:", v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v25[0] = CFSTR("QueryType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v20;
      v26[1] = v19;
      v25[1] = CFSTR("StartDate");
      v25[2] = CFSTR("EndDate");
      v26[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v21);

      objc_msgSend(v17, "timeIntervalSinceNow");
      v19 = v17;
      if (v22 > 0.0)
        goto LABEL_12;
    }
    v17 = v19;
  }
LABEL_12:

  return v16;
}

- (id)_syndicationStartingDateInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  id v13;
  void *v14;
  uint8_t v16[8];
  _QWORD v17[5];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  objc_msgSend(v4, "globalValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syndicationStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__31695;
    v24 = __Block_byref_object_dispose__31696;
    v25 = 0;
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__PLBackgroundJobSyndicationSyncWorker__syndicationStartingDateInLibrary___block_invoke;
    v17[3] = &unk_1E3668348;
    v17[4] = self;
    v19 = &v20;
    v8 = v7;
    v18 = v8;
    +[PLSyndicationSyncEngine findStartDateForMessagesSpotlightItemsWithCompletionHandler:](PLSyndicationSyncEngine, "findStartDateForMessagesSpotlightItemsWithCompletionHandler:", v17);
    v9 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v8, v9))
    {
      PLSyndicationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "[sync.worker] failed to find syndication start date, timed out", v16, 2u);
      }

    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    v12 = (void *)v21[5];
    if (v12)
    {
      v13 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v13;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v4, "globalValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSyndicationStartDate:", v6);

    _Block_object_dispose(&v20, 8);
  }

  return v6;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  PLBackgroundJobWorkerPendingWorkItems *v34;
  void *v35;
  PLBackgroundJobWorkerPendingWorkItems *v36;
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t v40[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PLBackgroundJobSyndicationSyncWorker _needsSyndicationFullIndexSyncInLibrary:](self, "_needsSyndicationFullIndexSyncInLibrary:", v4))
  {
    PLSyndicationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[sync.worker] requires full index reset sync", buf, 2u);
    }

    objc_msgSend(v4, "globalValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inProgressFullIndexSyndicationSyncDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[PLBackgroundJobSyndicationSyncWorker _syndicationStartingDateInLibrary:](self, "_syndicationStartingDateInLibrary:", v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    -[PLBackgroundJobSyndicationSyncWorker _workItemsBatchedFromDate:library:type:](self, "_workItemsBatchedFromDate:library:type:", v11, v4, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v12);

  }
  if (-[PLBackgroundJobSyndicationSyncWorker _hasPendingDeleteJobsInLibrary:](self, "_hasPendingDeleteJobsInLibrary:", v4))
  {
    PLSyndicationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "[sync.worker] has delete jobs", v40, 2u);
    }

    objc_msgSend(v4, "globalValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastDeleteSyndicationSyncDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    -[PLBackgroundJobSyndicationSyncWorker _workItemsBatchedFromDate:library:type:](self, "_workItemsBatchedFromDate:library:type:", v18, v4, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v19);

  }
  if (-[PLBackgroundJobSyndicationSyncWorker _hasPendingAttachmentJobsInLibrary:](self, "_hasPendingAttachmentJobsInLibrary:", v4))
  {
    PLSyndicationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "[sync.worker] has attachment jobs", v39, 2u);
    }

    objc_msgSend(v4, "globalValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastAttachmentSyndicationSyncDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      -[PLBackgroundJobSyndicationSyncWorker _syndicationStartingDateInLibrary:](self, "_syndicationStartingDateInLibrary:", v4);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    -[PLBackgroundJobSyndicationSyncWorker _workItemsBatchedFromDate:library:type:](self, "_workItemsBatchedFromDate:library:type:", v25, v4, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v26);

  }
  if (-[PLBackgroundJobSyndicationSyncWorker _hasPendingChatJobsInLibrary:](self, "_hasPendingChatJobsInLibrary:", v4))
  {
    PLSyndicationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "[sync.worker] has chat jobs", v38, 2u);
    }

    objc_msgSend(v4, "globalValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastChatSyndicationSyncDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      -[PLBackgroundJobSyndicationSyncWorker _syndicationStartingDateInLibrary:](self, "_syndicationStartingDateInLibrary:", v4);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;

    -[PLBackgroundJobSyndicationSyncWorker _workItemsBatchedFromDate:library:type:](self, "_workItemsBatchedFromDate:library:type:", v32, v4, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v33);

  }
  v34 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  +[PLBackgroundJobCriteria criteriaForHubbleWorker](PLBackgroundJobCriteria, "criteriaForHubbleWorker");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v34, "initWithCriteria:workItemsNeedingProcessing:", v35, v5);

  return v36;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PLSyndicationSyncEngine *syncManager;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (-[PLBackgroundJobWorker hasEnoughDiskSpaceToContinue:](self, "hasEnoughDiskSpaceToContinue:", v11))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("QueryType"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StartDate"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EndDate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          os_unfair_lock_lock(&self->_lock);
          objc_storeStrong((id *)&self->_currentWorkItem, a3);
          os_unfair_lock_unlock(&self->_lock);
          syncManager = self->_syncManager;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StartDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EndDate"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("QueryType"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "integerValue");
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __79__PLBackgroundJobSyndicationSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke;
          v28[3] = &unk_1E3676398;
          v28[4] = self;
          v29 = v11;
          -[PLSyndicationSyncEngine syncSyndicationItemsWithStartDate:endDate:queryType:library:completion:](syncManager, "syncSyndicationItemsWithStartDate:endDate:queryType:library:completion:", v18, v19, v21, v10, v28);

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    PLSyndicationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[PLBackgroundJobWorker workerName](self, "workerName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v23;
      v34 = 2114;
      v35 = v9;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "[sync.worker] %{public}@ invalid work item: %{public}@", buf, 0x16u);

    }
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D74498];
    v30 = *MEMORY[0x1E0CB2938];
    v31 = CFSTR("Invalid work item");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 46309, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v27);

  }
LABEL_10:

}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)stopWorkingOnItem:(id)a3
{
  os_unfair_lock_s *p_lock;
  CSSearchQuery *currentQuery;
  CSSearchQuery *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentQuery = self->_currentQuery;
  if (self->_currentWorkItem)
    self->_cancelled = 1;
  v6 = currentQuery;
  os_unfair_lock_unlock(p_lock);
  -[CSSearchQuery cancel](v6, "cancel");

}

- (id)photoLibraryWithDatabaseContext:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "syndicationIngestMutex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tryUsingSyndicationIngestLibraryWithIdentifier:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (self->_databaseContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSyndicationSyncWorker.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_databaseContext == nil"));

    }
    objc_storeStrong((id *)&self->_databaseContext, a3);
  }
  else
  {
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "syndicationIngestMutex");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "syndicationIngestMutexStateDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[sync.worker] (MUTEX) not allowed to run right now: %@", buf, 0xCu);

    }
  }

  return v8;
}

- (void)workerDidFinishWithDatabaseContext:(id)a3
{
  PLDatabaseContext *v5;
  PLDatabaseContext *v6;
  PLDatabaseContext *databaseContext;
  void *v8;
  PLDatabaseContext *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  uint8_t buf[2];
  __int16 v15;

  v5 = (PLDatabaseContext *)a3;
  v6 = v5;
  databaseContext = self->_databaseContext;
  if (databaseContext)
  {
    if (databaseContext != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSyndicationSyncWorker.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_databaseContext == databaseContext"));

    }
    -[PLDatabaseContext syndicationIngestMutex](v6, "syndicationIngestMutex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopUsingSyndicationIngestLibraryWithIdentifier:", 1);

    v9 = self->_databaseContext;
    self->_databaseContext = 0;

    PLSyndicationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 0;
      v11 = "[sync.worker] (MUTEX) stopped using syndication ingest library";
      v12 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
    }
  }
  else
  {
    PLSyndicationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "[sync.worker] (MUTEX) finished without having a library (no-op)";
      v12 = buf;
      goto LABEL_8;
    }
  }

}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 itemHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  PLSyndicationSyncQueryWithDates(v15, v16, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_initWeak(location, self);
    v20 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke;
    v30[3] = &unk_1E3668370;
    objc_copyWeak(&v32, location);
    v30[4] = self;
    v31 = v17;
    objc_msgSend(v19, "setFoundItemsHandler:", v30);
    v25 = v20;
    v26 = 3221225472;
    v27 = __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke_48;
    v28 = &unk_1E3676858;
    v29 = v18;
    objc_msgSend(v19, "setCompletionHandler:", &v25);
    objc_msgSend(v19, "start", v25, v26, v27, v28);
    os_unfair_lock_lock(&self->_lock);
    if (self->_cancelled)
    {
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v19, "cancel");
    }
    else
    {
      objc_storeStrong((id *)&self->_currentQuery, v19);
      os_unfair_lock_unlock(&self->_lock);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
  else
  {
    PLSyndicationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)(a4 - 1) > 3)
        v22 = 0;
      else
        v22 = off_1E36670A8[a4 - 1];
      v23 = v22;
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v23;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "[sync] no valid spotlight search query for query type: %{public}@", (uint8_t *)location, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v18 + 2))(v18, v24);

  }
}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 batchHandler:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = a8;
  PLSyndicationSyncQueryWithDates(a5, a6, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke;
    v23[3] = &unk_1E3668398;
    v23[4] = self;
    v24 = v13;
    objc_msgSend(v15, "setFoundItemsHandler:", v23);
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke_50;
    v21[3] = &unk_1E3676858;
    v22 = v14;
    objc_msgSend(v15, "setCompletionHandler:", v21);
    objc_msgSend(v15, "start");
    os_unfair_lock_lock(&self->_lock);
    if (self->_cancelled)
    {
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v15, "cancel");
    }
    else
    {
      objc_storeStrong((id *)&self->_currentQuery, v15);
      os_unfair_lock_unlock(&self->_lock);
    }

  }
  else
  {
    PLSyndicationGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)(a4 - 1) > 3)
        v18 = 0;
      else
        v18 = off_1E36670A8[a4 - 1];
      v19 = v18;
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "[sync] no valid spotlight search query for query type: %{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v20);

  }
}

- (BOOL)syncManager:(id)a3 shouldContinueWithLibrary:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a4, "libraryServicesManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syndicationIngestMutex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldStopUsingSyndicationIngestLibraryWithIdentifier:", 1);

  return v7 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseContext, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_currentWorkItem, 0);
  objc_storeStrong((id *)&self->_supportedQueryTypes, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
}

void __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[sync] spotlight search query found %{public}lu items, batch processing", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(v5 + 124);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 120));
  if (!v6)
  {
    LOBYTE(v7) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if ((_BYTE)v7)
      objc_msgSend(*(id *)(a1 + 32), "stopWorkingOnItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  }

}

uint64_t __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  PLSyndicationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134217984;
      v21 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[sync] spotlight search query found %lu items", buf, 0xCu);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v14 = v3;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = (void *)MEMORY[0x19AEC1554]();
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(unsigned __int8 *)(v12 + 124);
          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 120));
          if (v13)
            goto LABEL_17;
          buf[0] = 0;
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          if (buf[0])
          {
            objc_msgSend(WeakRetained, "stopWorkingOnItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
LABEL_17:
            objc_autoreleasePoolPop(v11);
            goto LABEL_18;
          }
          objc_autoreleasePoolPop(v11);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
LABEL_18:
      v3 = v14;
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[sync] spotlight search query found stuff but worker is already gone", buf, 2u);
  }

}

uint64_t __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PLBackgroundJobSyndicationSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 120);
  v9 = a3;
  os_unfair_lock_lock(v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 136);
  *(_QWORD *)(v7 + 136) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 124) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__PLBackgroundJobSyndicationSyncWorker__syndicationStartingDateInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
    PLSyndicationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      v9 = "[sync.worker] found syndication start date: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_199541000, v10, v11, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    PLSyndicationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      v9 = "[sync.worker] failed to find syndication start date, error: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__PLBackgroundJobSyndicationSyncWorker_initWithLibraryBundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v4 = *(id *)(a1 + 32);
  if ((unint64_t)(a2 - 1) < 2 || a2 == 4)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "isSystemPhotoLibrary");

    if ((v5 & 1) != 0)
      return;
    goto LABEL_6;
  }
  if (a2 == 3)
  {

LABEL_6:
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);
    v4 = v8;
  }

}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if ((a3 | 2) != 3)
    return 0;
  v8 = v3;
  v9 = v4;
  if (PLSyndicationRuntimeEnabled())
    return 1;
  PLSyndicationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Syndication Sync Worker is disabled via internal user defaults", v7, 2u);
  }

  return 0;
}

@end
