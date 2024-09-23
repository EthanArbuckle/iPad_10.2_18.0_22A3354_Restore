@implementation PLBackgroundJobGuestAssetSyncWorker

- (PLBackgroundJobGuestAssetSyncWorker)initWithLibraryBundle:(id)a3
{
  PLBackgroundJobGuestAssetSyncWorker *v3;
  PLBackgroundJobGuestAssetSyncWorker *v4;
  PLGuestAssetSyncEngine *v5;
  PLGuestAssetSyncEngine *manager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLBackgroundJobGuestAssetSyncWorker;
  v3 = -[PLBackgroundJobWorker initWithLibraryBundle:](&v8, sel_initWithLibraryBundle_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_lock._os_unfair_lock_opaque = 0;
    v5 = -[PLGuestAssetSyncEngine initWithDelegate:]([PLGuestAssetSyncEngine alloc], "initWithDelegate:", v3);
    manager = v4->_manager;
    v4->_manager = v5;

  }
  return v4;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLBackgroundJobWorkerPendingWorkItems *v9;
  id v10;
  void *v11;
  id *v12;
  _BOOL4 v13;
  PLBackgroundJobWorkerPendingWorkItems *v14;
  void *v15;
  void *v16;
  void **v17;
  _BOOL4 v18;
  void *v19;
  PLBackgroundJobWorkerPendingWorkItems *v20;
  void *v21;
  PLGuestAssetSyncEngine *manager;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  id v42;
  id v43;
  void *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLBackgroundJobCriteria criteriaForHubbleWorker](PLBackgroundJobCriteria, "criteriaForHubbleWorker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorker libraryBundle](self, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !objc_msgSend(v7, "wellKnownPhotoLibraryIdentifier"))
  {
    v18 = +[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:](PLGuestAssetSyncEngine, "didIngestGuestAssetsInLibrary:", v4);
    v14 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    if (v18)
    {
      +[PLBackgroundJobGuestAssetSyncWorkItemContainer libraryOrPreferencesChangedWorkItem](PLBackgroundJobGuestAssetSyncWorkItemContainer, "libraryOrPreferencesChangedWorkItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v15;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = (void **)v45;
      goto LABEL_10;
    }
LABEL_11:
    v20 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems](v14, "initWithZeroWorkItems");
    goto LABEL_31;
  }
  if ((PLSyndicationPreferencesEnabled(1) & 1) != 0)
  {
    -[PLBackgroundJobGuestAssetSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobGuestAssetSyncWorker workItemsNeedingProcessingInLibrary:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLBackgroundJobGuestAssetSyncWorker _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:](self, "_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:", v8, v4))
    {
      v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      +[PLBackgroundJobGuestAssetSyncWorkItemContainer libraryOrPreferencesChangedWorkItem](PLBackgroundJobGuestAssetSyncWorkItemContainer, "libraryOrPreferencesChangedWorkItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v43 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v43;
    }
    else
    {
      if (!objc_msgSend((id)objc_opt_class(), "_needsInitialSyncForSourceLibrary:targetLibrary:", v8, v4))
      {
        manager = self->_manager;
        v38 = 0;
        -[PLGuestAssetSyncEngine workItemObjectIDsInLibrary:error:](manager, "workItemObjectIDsInLibrary:error:", v8, &v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v38;
        if (!v21)
        {
          PLSyndicationGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v10;
            _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to fetch work items needed, error: %@", buf, 0xCu);
          }

        }
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v21, "count"))
        {
          v32 = v10;
          v33 = v5;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v25 = v21;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v35 != v28)
                  objc_enumerationMutation(v25);
                +[PLBackgroundJobGuestAssetSyncWorkItemContainer persistedJobWorkItemWithObjectID:](PLBackgroundJobGuestAssetSyncWorkItemContainer, "persistedJobWorkItemWithObjectID:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v30);

              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
            }
            while (v27);
          }

          v5 = v33;
          v20 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithCriteria:workItemsNeedingProcessing:", v33, v24);
          v10 = v32;
        }
        else
        {
          v20 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
        }

        goto LABEL_30;
      }
      v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      +[PLBackgroundJobGuestAssetSyncWorkItemContainer initialSyncWorkItem](PLBackgroundJobGuestAssetSyncWorkItemContainer, "initialSyncWorkItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v42 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v42;
    }
    objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v9, "initWithCriteria:workItemsNeedingProcessing:", v5, v21);
LABEL_30:

    goto LABEL_31;
  }
  v13 = +[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:](PLGuestAssetSyncEngine, "didIngestGuestAssetsInLibrary:", v4);
  v14 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  if (!v13)
    goto LABEL_11;
  +[PLBackgroundJobGuestAssetSyncWorkItemContainer libraryOrPreferencesChangedWorkItem](PLBackgroundJobGuestAssetSyncWorkItemContainer, "libraryOrPreferencesChangedWorkItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v15;
  v16 = (void *)MEMORY[0x1E0C99D20];
  v17 = &v44;
LABEL_10:
  objc_msgSend(v16, "arrayWithObjects:count:", v17, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v14, "initWithCriteria:workItemsNeedingProcessing:", v5, v19);

LABEL_31:
  return v20;
}

- (void)_performWorkOnItem:(id)a3 inSystemPhotoLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  PLGuestAssetSyncEngine *manager;
  NSObject *v17;
  NSObject *v18;
  PLGuestAssetSyncEngine *v19;
  _QWORD v20[5];
  void (**v21)(id, id);
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  PLBackgroundJobGuestAssetSyncWorker *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (-[PLBackgroundJobGuestAssetSyncWorker _checkSyndicationPreferencesEnabledAndCleanupGuestAssetsIfNeededWithPhotoLibrary:](self, "_checkSyndicationPreferencesEnabledAndCleanupGuestAssetsIfNeededWithPhotoLibrary:", v9))
  {
    -[PLBackgroundJobGuestAssetSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobGuestAssetSyncWorker _performWorkOnItem:inSystemPhotoLibrary:completion:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (-[PLBackgroundJobGuestAssetSyncWorker _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:](self, "_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:targetLibrary:", v11, v9))
      {
        v27 = 0;
        v12 = -[PLBackgroundJobGuestAssetSyncWorker _resetSyndicationProcessingInSourceLibrary:error:](self, "_resetSyndicationProcessingInSourceLibrary:error:", v11, &v27);
        v13 = v27;
        if (!v12)
        {
          v10[2](v10, v13);
          goto LABEL_20;
        }
        -[PLBackgroundJobGuestAssetSyncWorker _updateLastGuestAssetSyncTargetLibraryURLInSourceLibrary:targetLibrary:](self, "_updateLastGuestAssetSyncTargetLibraryURLInSourceLibrary:targetLibrary:", v11, v9);

      }
      if (objc_msgSend((id)objc_opt_class(), "_needsInitialSyncForSourceLibrary:targetLibrary:", v11, v9))
      {
        PLSyndicationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Performing initial guest asset sync", buf, 2u);
        }

        v15 = MEMORY[0x1E0C809B0];
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke;
        v25 = &unk_1E3677AA0;
        v26 = self;
        PLSafeRunWithUnfairLock();
        manager = self->_manager;
        v20[0] = v15;
        v20[1] = 3221225472;
        v20[2] = __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke_2;
        v20[3] = &unk_1E3676398;
        v20[4] = self;
        v21 = v10;
        -[PLGuestAssetSyncEngine performInitialSyncWithSourceLibrary:targetLibrary:completion:](manager, "performInitialSyncWithSourceLibrary:targetLibrary:completion:", v11, v9, v20);

        goto LABEL_21;
      }
      if (objc_msgSend(v8, "type") == 2)
      {
        v19 = self->_manager;
        objc_msgSend(v8, "objectID");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[PLGuestAssetSyncEngine processWorkItemObjectID:sourceLibrary:targetLibrary:completion:](v19, "processWorkItemObjectID:sourceLibrary:targetLibrary:completion:", v13, v11, v9, v10);
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      PLSyndicationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v8;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "GuestAssetSync: No work for item %p: sourceLibrary is nil", buf, 0xCu);
      }

    }
    v10[2](v10, 0);
LABEL_21:

    goto LABEL_22;
  }
  PLSyndicationGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v8;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "GuestAssetSync: No work for item %p: syndication preference is disabled", buf, 0xCu);
  }

  v10[2](v10, 0);
LABEL_22:

}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id);
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  SEL v24;
  PLBackgroundJobGuestAssetSyncWorker *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id))a5;
  PLSyndicationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v37 = v9;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: PLBackgroundJobGuestAssetSyncWorker performWorkOnItem: %p %@", buf, 0x16u);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobGuestAssetSyncWorker.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library != nil"));

  }
  if (-[PLBackgroundJobWorker hasEnoughDiskSpaceToContinue:](self, "hasEnoughDiskSpaceToContinue:", v11))
  {
    -[PLBackgroundJobWorker libraryBundle](self, "libraryBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      switch(objc_msgSend(v14, "wellKnownPhotoLibraryIdentifier"))
      {
        case 0:
          if (+[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:](PLGuestAssetSyncEngine, "didIngestGuestAssetsInLibrary:", v10))
          {
            objc_msgSend(v10, "managedObjectContext");
            v15 = objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = (void *)v15;
              v31 = 0;
              -[PLBackgroundJobGuestAssetSyncWorker _deleteAllGuestAssetsInPhotoLibrary:reason:error:](self, "_deleteAllGuestAssetsInPhotoLibrary:reason:error:", v10, CFSTR("Guest asset sync worker on non-SPL library deleting guest assets"), &v31);
              v17 = v31;
            }
            else
            {
              v27 = (void *)MEMORY[0x1E0CB35C8];
              v28 = *MEMORY[0x1E0D74498];
              v32 = *MEMORY[0x1E0CB2938];
              v33 = CFSTR("MOC is nil during guest asset sync performWorkOnItem");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 41003, v29);
              v17 = (id)objc_claimAutoreleasedReturnValue();

              v16 = 0;
            }
          }
          else
          {
            objc_msgSend(v10, "globalValues");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setGuestAssetSyncStatus:", 0);
            v17 = 0;
          }

          v11[2](v11, v17);
          goto LABEL_17;
        case 1:
          -[PLBackgroundJobGuestAssetSyncWorker _performWorkOnItem:inSystemPhotoLibrary:completion:](self, "_performWorkOnItem:inSystemPhotoLibrary:completion:", v9, v10, v11);
          goto LABEL_17;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          v23 = CFSTR("Guest asset sync worker should not run on messages photo library");
          v24 = a2;
          v25 = self;
          v26 = 253;
          goto LABEL_15;
        case 3:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          v23 = CFSTR("Guest asset sync worker should not run on syndication photo library");
          v24 = a2;
          v25 = self;
          v26 = 250;
LABEL_15:
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("PLBackgroundJobGuestAssetSyncWorker.m"), v26, v23);
          goto LABEL_16;
        default:
          goto LABEL_17;
      }
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D74498];
    v34 = *MEMORY[0x1E0CB2938];
    v35 = CFSTR("nil lsm");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 46002, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v21);

LABEL_16:
LABEL_17:

  }
}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)stopWorkingOnItem:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v6 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "GuestAssetSync: PLBackgroundJobGuestAssetSyncWorker stopWorkingOnItem: %p", buf, 0xCu);
  }

  PLSafeRunWithUnfairLock();
}

- (BOOL)_checkSyndicationPreferencesEnabledAndCleanupGuestAssetsIfNeededWithPhotoLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v4 = a3;
  PLSyndicationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: checking syndication preferences...", v10, 2u);
  }

  v6 = PLSyndicationPreferencesEnabled(0);
  if ((v6 & 1) == 0)
  {
    if (+[PLGuestAssetSyncEngine didIngestGuestAssetsInLibrary:](PLGuestAssetSyncEngine, "didIngestGuestAssetsInLibrary:", v4))
    {
      -[PLBackgroundJobGuestAssetSyncWorker _deleteAllGuestAssetsInPhotoLibrary:reason:error:](self, "_deleteAllGuestAssetsInPhotoLibrary:reason:error:", v4, CFSTR("Deleting all guest assets in SPL because syndication prefs are disabled"), 0);
    }
    else
    {
      objc_msgSend(v4, "globalValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGuestAssetSyncStatus:", 0);

      objc_msgSend(v4, "globalValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGuestAssetInitialSyncResumeMarker:", 0);

    }
  }

  return v6;
}

- (BOOL)_deleteAllGuestAssetsInPhotoLibrary:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLSyndicationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: deleting all guest assets in library %@", buf, 0xCu);
  }

  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v12 = PLDeleteGuestAssetsInLibraryWithManagedObjectContext(v10, v11, v8, 0, &v18);

  v13 = v18;
  if (v12)
  {
    v14 = v13;
  }
  else
  {
    PLSyndicationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "GuestAssetSync: failed to delete guest assets in library %@ error: %@", buf, 0x16u);
    }

    v16 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
  }

  return v12;
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
  objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", 3);
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
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to provide source library for guest asset sync worker", v15, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)_resetSyndicationProcessingInSourceLibrary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__31902;
  v19 = __Block_byref_object_dispose__31903;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PLBackgroundJobGuestAssetSyncWorker__resetSyndicationProcessingInSourceLibrary_error___block_invoke;
  v11[3] = &unk_1E3676348;
  v13 = &v21;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  v14 = &v15;
  objc_msgSend(v7, "performTransactionAndWait:", v11);
  v8 = (void *)v16[5];
  if (v8 && a4)
    *a4 = objc_retainAutorelease(v8);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (BOOL)_batchResetGuestSavedAssetTypeInManagedObjectContext:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C97AB0];
  v6 = a3;
  v7 = [v5 alloc];
  +[PLManagedAsset entity](PLManagedAsset, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEntity:", v8);

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setResultType:", 2);
  v22 = CFSTR("savedAssetType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForInsertIntoSyndicationLibrary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToUpdate:", v12);

  v19 = 0;
  objc_msgSend(v6, "executeRequest:error:", v9, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v19;
  PLSyndicationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "result");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "GuestAssetSync: Batch reset savedAssetType for %@ assets", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "GuestAssetSync: Failed to batch reset savedAssetType for assets: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v13 != 0;
}

- (BOOL)_batchResetSyndicationProcessingInManagedObjectContext:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C97AB0];
  v6 = a3;
  v7 = [v5 alloc];
  +[PLMediaAnalysisAssetAttributes entity](PLMediaAnalysisAssetAttributes, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEntity:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("syndicationProcessingVersion"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setResultType:", 2);
  v21[0] = CFSTR("syndicationProcessingVersion");
  v21[1] = CFSTR("syndicationProcessingValue");
  v22[0] = &unk_1E375E7A8;
  v22[1] = &unk_1E375E7A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToUpdate:", v11);

  v18 = 0;
  objc_msgSend(v6, "executeRequest:error:", v9, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v18;
  PLSyndicationGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "GuestAssetSync: Batch reset syndicationProcessing on %@ media analysis attributes", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "GuestAssetSync: Failed to batch reset syndicationProcessing on media analysis attributes: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  return v12 != 0;
}

- (BOOL)_safeIsCancelled
{
  void *v2;
  char v3;

  PLSafeResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_lastGuestAssetSyncTargetLibraryURLFromSourceLibrary:(id)a3 targetLibrary:(id)a4
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
  objc_msgSend(v5, "globalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastGuestAssetSyncTargetLibraryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "GuestAssetSync: last target library URL is nil, setting to %@", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(v9, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "globalValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLastGuestAssetSyncTargetLibraryPath:", v13);

  }
  return v9;
}

- (void)_updateLastGuestAssetSyncTargetLibraryURLInSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(a4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryURL");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLastGuestAssetSyncTargetLibraryPath:", v7);
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
  v6 = a4;
  -[PLBackgroundJobGuestAssetSyncWorker _lastGuestAssetSyncTargetLibraryURLFromSourceLibrary:targetLibrary:](self, "_lastGuestAssetSyncTargetLibraryURLFromSourceLibrary:targetLibrary:", a3, v6);
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
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: System photo library URL changed since last run %{public}@ -> %@", (uint8_t *)&v15, 0x16u);

    }
  }

  return v10 ^ 1;
}

- (void)guestAssetSyncManager:(id)a3 isTransferingAsset:(id)a4 toLibrary:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "libraryBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "libraryBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = +[PLInterLibraryTransferOptions newTransferOptionsForAssetsFromSyndicationToSystem](PLInterLibraryTransferOptions, "newTransferOptionsForAssetsFromSyndicationToSystem");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__PLBackgroundJobGuestAssetSyncWorker_guestAssetSyncManager_isTransferingAsset_toLibrary_completion___block_invoke;
  v20[3] = &unk_1E3674E40;
  v21 = v11;
  v22 = v8;
  v17 = v8;
  v18 = v11;
  v19 = (id)objc_msgSend(v13, "transferAssets:toBundle:options:completion:", v16, v14, v15, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

void __101__PLBackgroundJobGuestAssetSyncWorker_guestAssetSyncManager_isTransferingAsset_toLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v6;
      v16 = 2112;
      v17 = v3;
      v7 = "GuestAssetSync: _syncAsset %{public}@ failed with error %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v14, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v14 = 138543362;
    v15 = v11;
    v7 = "GuestAssetSync: _syncAsset %{public}@ succeeded";
    v8 = v5;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v12, v13);
}

uint64_t __55__PLBackgroundJobGuestAssetSyncWorker__safeIsCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 117));
}

void __88__PLBackgroundJobGuestAssetSyncWorker__resetSyndicationProcessingInSourceLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = objc_msgSend(v2, "_batchResetGuestSavedAssetTypeInManagedObjectContext:error:", v3, &v14);
  v5 = v14;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v6, "_batchResetSyndicationProcessingInManagedObjectContext:error:", v7, &v13);
    v9 = v13;
    v10 = v13;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = v5;
    v10 = *(id *)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
  }

}

uint64_t __57__PLBackgroundJobGuestAssetSyncWorker_stopWorkingOnItem___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 116))
    *(_BYTE *)(v1 + 117) = 1;
  return result;
}

uint64_t __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 116) = 1;
  return result;
}

void __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  PLSafeRunWithUnfairLock();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __90__PLBackgroundJobGuestAssetSyncWorker__performWorkOnItem_inSystemPhotoLibrary_completion___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 117) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 116) = 0;
  return result;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)usesMultipleLibrariesConcurrently
{
  return 1;
}

+ (BOOL)_needsInitialSyncForSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a4;
  objc_msgSend(a3, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guestAssetSyncStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "globalValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guestAssetSyncStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "globalValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "guestAssetSyncStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_msgSend(v11, "integerValue") & 4) == 0;

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

@end
