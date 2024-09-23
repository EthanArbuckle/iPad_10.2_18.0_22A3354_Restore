@implementation PLGuestAssetSyncEngine

- (PLGuestAssetSyncEngine)initWithDelegate:(id)a3
{
  id v4;
  PLGuestAssetSyncEngine *v5;
  PLGuestAssetSyncEngine *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLGuestAssetSyncEngine;
  v5 = -[PLGuestAssetSyncEngine init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)workItemObjectIDsInLibrary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__100099;
  v26 = __Block_byref_object_dispose__100100;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__100099;
  v20 = __Block_byref_object_dispose__100100;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PLGuestAssetSyncEngine_workItemObjectIDsInLibrary_error___block_invoke;
  v12[3] = &unk_1E3677830;
  v14 = &v22;
  v6 = v5;
  v13 = v6;
  v15 = &v16;
  objc_msgSend(v6, "performBlockAndWait:", v12);
  v7 = v23[5];
  v8 = (id)v17[5];
  v9 = v8;
  if (!v7 && a4)
    *a4 = objc_retainAutorelease(v8);

  v10 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

- (void)_finishProcessingWorkItemManagedObjectID:(id)a3 library:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__PLGuestAssetSyncEngine__finishProcessingWorkItemManagedObjectID_library_error_completion___block_invoke;
  v15[3] = &unk_1E3677C18;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v14 = v9;
  v12 = (void (**)(id, id))a6;
  v13 = a5;
  objc_msgSend(v11, "performTransactionAndWait:", v15);
  v12[2](v12, v13);

}

- (void)_processSyndicationLibraryAsset:(id)a3 targetLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = objc_msgSend(v8, "shouldSyncToSPL");
  PLSyndicationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "additionalAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syndicationIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "savedAssetType");
      PLValidatedSavedAssetTypeDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PLManagedAssetSyndicationStateDescription(objc_msgSend(v8, "syndicationState"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544130;
      v30 = v14;
      v31 = 2114;
      v32 = v16;
      v33 = 2114;
      v34 = v17;
      v35 = 2114;
      v36 = v18;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: %{public}@ / %{public}@ (%{public}@) syndicationState %{public}@ says sync to SPL", (uint8_t *)&v29, 0x2Au);

    }
    -[PLGuestAssetSyncEngine _syncAsset:toLibrary:completion:](self, "_syncAsset:toLibrary:completion:", v8, v9, v10);
  }
  else
  {
    if (v13)
    {
      objc_msgSend(v8, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "additionalAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "syndicationIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "savedAssetType");
      PLValidatedSavedAssetTypeDescription();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PLManagedAssetSyndicationStateDescription(objc_msgSend(v8, "syndicationState"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544130;
      v30 = v19;
      v31 = 2114;
      v32 = v21;
      v33 = 2114;
      v34 = v22;
      v35 = 2114;
      v36 = v23;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: %{public}@ / %{public}@ (%{public}@) syndicationState %{public}@ says don't sync to SPL", (uint8_t *)&v29, 0x2Au);

    }
    objc_msgSend(v8, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "syndicationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGuestAssetSyncEngine _deleteAssetWithUuid:syndicationIdentifier:fromLibrary:](self, "_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", v24, v26, v9);

    objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
    objc_msgSend(v8, "savedAssetType");
    if (PLValidatedSavedAssetTypeApplies())
    {
      objc_msgSend(v8, "additionalAttributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "syndicationIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLGuestAssetSyncEngine _markAsWasGuestAssetOnAssetWithSyndicationIdentifier:inLibrary:](self, "_markAsWasGuestAssetOnAssetWithSyndicationIdentifier:inLibrary:", v28, v9);

    }
    v10[2](v10, 0);
  }

}

- (void)processWorkItemObjectID:(id)a3 sourceLibrary:(id)a4 targetLibrary:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLGuestAssetSyncEngine *v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__100099;
  v26[4] = __Block_byref_object_dispose__100100;
  v27 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke;
  v18[3] = &unk_1E3677880;
  v14 = v11;
  v19 = v14;
  v15 = v10;
  v24 = v26;
  v20 = v15;
  v21 = self;
  v16 = v12;
  v22 = v16;
  v25 = &v28;
  v17 = v13;
  v23 = v17;
  objc_msgSend(v14, "performBlockAndWait:", v18);
  if (!*((_BYTE *)v29 + 24))
    -[PLGuestAssetSyncEngine _finishProcessingWorkItemManagedObjectID:library:error:completion:](self, "_finishProcessingWorkItemManagedObjectID:library:error:completion:", v15, v14, 0, v17);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

}

- (id)_assetWithUUID:(id)a3 orSyndicationIdentifier:(id)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v7, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
  {
    if (!v10)
    {
      +[PLManagedAsset assetWithSyndicationIdentifier:inLibrary:](PLManagedAsset, "assetWithSyndicationIdentifier:inLibrary:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        PLSyndicationGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543874;
          v16 = v8;
          v17 = 2114;
          v18 = v7;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Found asset by looking up syndicationIdentifier %{public}@ uuid %{public}@ did not match asset uuid %{public%}@", (uint8_t *)&v15, 0x20u);

        }
      }
    }
  }

  return v11;
}

- (BOOL)_inTransaction_deleteAssetWithUuid:(id)a3 syndicationIdentifier:(id)a4 fromLibrary:(id)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PLGuestAssetSyncEngine _assetWithUUID:orSyndicationIdentifier:inLibrary:](self, "_assetWithUUID:orSyndicationIdentifier:inLibrary:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "GuestAssetSync: Unable to delete guest asset with uuid %@, does not exist", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
  objc_msgSend(v9, "savedAssetType");
  v10 = PLValidatedSavedAssetTypeApplies();
  PLSyndicationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "savedAssetType");
      PLValidatedSavedAssetTypeDescription();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: Not deleting %{public}@ asset in system library with uuid %{public}@", (uint8_t *)&v16, 0x16u);

    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Deleting guest asset from system library with uuid %{public}@", (uint8_t *)&v16, 0xCu);
  }

  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("Syndication Guest Asset Sync"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteWithReason:", v12);
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_deleteAssetWithUuid:(id)a3 syndicationIdentifier:(id)a4 fromLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PLGuestAssetSyncEngine__deleteAssetWithUuid_syndicationIdentifier_fromLibrary___block_invoke;
  v15[3] = &unk_1E3677970;
  v19 = &v20;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  objc_msgSend(v13, "performTransactionAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

- (void)_markAsWasGuestAssetOnAssetWithSyndicationIdentifier:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__PLGuestAssetSyncEngine__markAsWasGuestAssetOnAssetWithSyndicationIdentifier_inLibrary___block_invoke;
  v9[3] = &unk_1E3677C18;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "performTransactionAndWait:", v9);

}

- (void)_syncAsset:(id)a3 toLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  unsigned int v17;
  char v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _BYTE *v44;
  uint64_t *v45;
  uint64_t *v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint8_t v56[4];
  id v57;
  __int16 v58;
  id v59;
  _BYTE buf[24];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "syndicationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v8, "shouldSyncToSPL");
  PLSyndicationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v14 & 1) != 0)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "GuestAssetSync: _syncAsset %{public}@ / %{public}@ begin", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v61) = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v17 = objc_msgSend(v8, "syndicationState");
    v18 = v17;
    v19 = v11;
    v20 = v10;
    v21 = (v17 >> 1) & 1;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke;
    v40[3] = &unk_1E36778A8;
    v22 = v13;
    v41 = v22;
    v23 = v9;
    v42 = v23;
    v44 = buf;
    v47 = v21;
    v10 = v20;
    v11 = v19;
    v24 = v19;
    v43 = v24;
    v45 = &v48;
    v46 = &v52;
    objc_msgSend(v23, "performBlockAndWait:", v40);
    if (*((_BYTE *)v49 + 24))
      objc_msgSend(v8, "updateSyndicationStateWithSavedToLibrary:", (v18 & 2) == 0);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) || (v18 & 2) == 0)
    {
      if (!*((_BYTE *)v53 + 24))
      {
        -[PLGuestAssetSyncEngine delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke_35;
        v36[3] = &unk_1E36778D0;
        v36[4] = self;
        v37 = v23;
        v38 = v10;
        objc_msgSend(v35, "guestAssetSyncManager:isTransferingAsset:toLibrary:completion:", self, v8, v37, v36);

LABEL_24:
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(buf, 8);
        goto LABEL_25;
      }
    }
    else
    {
      PLSyndicationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v56 = 138543618;
        v57 = v24;
        v58 = 2114;
        v59 = v22;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "GuestAssetSync: no existing asset in SPL. Resetting savedToLibrary for source asset %{public}@ / %{public}@, skipping this sync pass", v56, 0x16u);
      }

      objc_msgSend(v8, "updateSyndicationStateWithSavedToLibrary:", 0);
      *((_BYTE *)v53 + 24) = 1;
    }
    objc_msgSend(v8, "managedObjectContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "hasChanges");

    if (v30)
    {
      objc_msgSend(v8, "managedObjectContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v32 = objc_msgSend(v31, "save:", &v39);
      v33 = v39;

      if ((v32 & 1) == 0)
      {
        PLSyndicationGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v56 = 138412290;
          v57 = v33;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "GuestAssetSync: failed to save syndication photo library changes to syndicationState, error: %@", v56, 0xCu);
        }

      }
    }
    else
    {
      v33 = 0;
    }
    (*((void (**)(id, id))v10 + 2))(v10, v33);

    goto LABEL_24;
  }
  if (v16)
  {
    objc_msgSend(v8, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "savedAssetType");
    PLValidatedSavedAssetTypeDescription();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PLManagedAssetSyndicationStateDescription(objc_msgSend(v8, "syndicationState"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v61 = v27;
    v62 = 2114;
    v63 = v28;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "GuestAssetSync: _syncAsset %{public}@ / %{public}@ (%{public}@) syndicationState %{public}@ says don't sync to SPL", buf, 0x2Au);

  }
  -[PLGuestAssetSyncEngine _deleteAssetWithUuid:syndicationIdentifier:fromLibrary:](self, "_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", v11, v13, v9);
  objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
  objc_msgSend(v8, "savedAssetType");
  if (PLValidatedSavedAssetTypeApplies())
    -[PLGuestAssetSyncEngine _markAsWasGuestAssetOnAssetWithSyndicationIdentifier:inLibrary:](self, "_markAsWasGuestAssetOnAssetWithSyndicationIdentifier:inLibrary:", v13, v9);
  (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_25:

}

- (void)_deleteAllWorkItemsInSourceLibrary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLGuestAssetSyncEngine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke;
  v6[3] = &unk_1E3677C18;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "performTransactionAndWait:", v6);

}

- (void)_initialSyncTransferNextAssetFromSourceLibrary:(id)a3 targetLibrary:(id)a4 iterator:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void (**v20)(id, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PLGuestAssetSyncEngine *v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[PLGuestAssetSyncEngine delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "guestAssetSyncManagerShouldCancel:", self);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v16);
  }
  else
  {
    objc_msgSend(v10, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextObjectWithManagedObjectContext:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (objc_msgSend(v16, "isSuccess"))
      {
        objc_msgSend(v16, "result");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v31 = &v30;
        v32 = 0x2020000000;
        v33 = 0;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke;
        v22[3] = &unk_1E3677948;
        v23 = v10;
        v19 = v18;
        v29 = &v30;
        v24 = v19;
        v25 = self;
        v26 = v11;
        v20 = v13;
        v28 = v20;
        v27 = v12;
        objc_msgSend(v23, "performBlockAndWait:", v22);
        if (!*((_BYTE *)v31 + 24))
          v20[2](v20, 1, 0);

        _Block_object_dispose(&v30, 8);
      }
      else
      {
        objc_msgSend(v16, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, 0, v21);

      }
    }
    else
    {
      v13[2](v13, 1, 0);
    }
  }

}

- (void)performInitialSyncWithSourceLibrary:(id)a3 targetLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  PLManagedObjectPagingIterator *v20;
  void *v21;
  void *v22;
  PLManagedObjectPagingIterator *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PLManagedObjectPagingIterator *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  PLManagedObjectPagingIterator *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  PLManagedObjectPagingIterator *v50;
  _QWORD v51[4];
  id v52;
  PLGuestAssetSyncEngine *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  PLGuestAssetSyncEngine *v58;
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "_guestAssetSyncStatusIsSet:inLibrary:", 1, v8) & 1) == 0)
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Detected syndication library rebuild, dropping initial sync resume markers and starting over", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_setGuestAssetSyncStatus:inLibrary:", 1, v8);
    objc_msgSend((id)objc_opt_class(), "_setGuestAssetSyncStatus:inLibrary:", 0, v9);
    objc_msgSend(v9, "globalValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGuestAssetInitialSyncResumeMarker:", 0);

  }
  v13 = objc_msgSend((id)objc_opt_class(), "_guestAssetSyncStatusIsSet:inLibrary:", 2, v9);
  v14 = (void *)objc_opt_class();
  if (v13)
    v15 = v8;
  else
    v15 = v9;
  objc_msgSend(v14, "_resumeMarkerObjectIDInGlobalValuesOfLibrary:storedInLibrary:", v9, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) == 0)
  {
    PLSyndicationGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    v49 = v10;
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        v61 = v16;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Starting initial sync, verifying SPL guest assets from resume token: %@", buf, 0xCu);
      }

    }
    else
    {
      if (v18)
      {
        objc_msgSend(v9, "libraryID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v61 = (uint64_t)v19;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Starting initial sync for library: %@, no resume token found, deleting all queued work items in syndication library", buf, 0xCu);

      }
      -[PLGuestAssetSyncEngine _deleteAllWorkItemsInSourceLibrary:](self, "_deleteAllWorkItemsInSourceLibrary:", v8);
    }
    v20 = [PLManagedObjectPagingIterator alloc];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v16;
    v23 = -[PLManagedObjectPagingIterator initWithEntityName:resultType:resumeObjectID:additionalPredicate:](v20, "initWithEntityName:resultType:resumeObjectID:additionalPredicate:", v21, 0, v16, v22);

    objc_msgSend(v9, "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v23;
    -[PLManagedObjectPagingIterator nextObjectWithManagedObjectContext:](v23, "nextObjectWithManagedObjectContext:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLGuestAssetSyncEngine delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v26, "guestAssetSyncManagerShouldCancel:", self);

    v27 = v9;
    if (objc_msgSend(v25, "isSuccess") && (v16 & 1) == 0)
    {
      do
      {
        v16 = (uint64_t)v25;
        objc_msgSend(v25, "result");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke;
        v55[3] = &unk_1E3677998;
        v56 = v28;
        v29 = v8;
        v57 = v8;
        v58 = self;
        v30 = v27;
        v59 = v30;
        v31 = v28;
        objc_msgSend(v30, "performTransactionAndWait:", v55);
        objc_msgSend(v31, "objectID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "URIRepresentation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "absoluteString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "globalValues");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setGuestAssetInitialSyncResumeMarker:", v34);

        objc_msgSend(v30, "managedObjectContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectPagingIterator nextObjectWithManagedObjectContext:](v50, "nextObjectWithManagedObjectContext:", v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLGuestAssetSyncEngine delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v37, "guestAssetSyncManagerShouldCancel:", self);

        v8 = v29;
      }
      while (objc_msgSend(v25, "isSuccess") && !(_DWORD)v16);
    }
    if (objc_msgSend(v25, "isFailure"))
    {
      objc_msgSend(v25, "error");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v49;
      (*((void (**)(id, _QWORD, void *))v49 + 2))(v49, 0, v38);

      v9 = v27;
LABEL_24:
      v16 = (uint64_t)v48;
      v40 = v50;
      goto LABEL_31;
    }
    v9 = v27;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v49;
      (*((void (**)(id, _QWORD, void *))v49 + 2))(v49, 0, v39);

      goto LABEL_24;
    }
    PLSyndicationGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v27, "libraryID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = (uint64_t)v42;
      _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Initial sync, verify SPL Guest assets complete for library: %@", buf, 0xCu);

    }
    objc_msgSend(v27, "globalValues");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setGuestAssetInitialSyncResumeMarker:", 0);

    objc_msgSend((id)objc_opt_class(), "_setGuestAssetSyncStatus:inLibrary:", 2, v27);
    v16 = 0;
    v10 = v49;
  }
  PLSyndicationGetLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v16;
    _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Initial sync, transfering Syndication guest assets from resume token: %@", buf, 0xCu);
  }

  v45 = [PLManagedObjectPagingIterator alloc];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateForShouldSyncToSPL](PLManagedAsset, "predicateForShouldSyncToSPL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PLManagedObjectPagingIterator initWithEntityName:resultType:resumeObjectID:additionalPredicate:](v45, "initWithEntityName:resultType:resumeObjectID:additionalPredicate:", v46, 1, v16, v47);

  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_49;
  v51[3] = &unk_1E36779C0;
  v52 = v9;
  v53 = self;
  v54 = v10;
  -[PLGuestAssetSyncEngine _initialSyncTransferNextAssetFromSourceLibrary:targetLibrary:iterator:completion:](self, "_initialSyncTransferNextAssetFromSourceLibrary:targetLibrary:iterator:completion:", v8, v52, v40, v51);

  v25 = v52;
LABEL_31:

}

- (PLGuestAssetSyncEngineDelegate)delegate
{
  return (PLGuestAssetSyncEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "additionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syndicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_2;
  v8[3] = &unk_1E3677970;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  v11 = *(id *)(a1 + 40);
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  if (*((_BYTE *)v14 + 24))
    objc_msgSend(*(id *)(a1 + 48), "_inTransaction_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", v6, v7, *(_QWORD *)(a1 + 56));
  else
    objc_msgSend((id)objc_opt_class(), "setDidIngestGuestAssetsInLibrary:", *(_QWORD *)(a1 + 56));

  _Block_object_dispose(&v13, 8);
}

void __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_49(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    PLSyndicationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "libraryID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Initial sync complete for library: %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "globalValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGuestAssetInitialSyncResumeMarker:", 0);

    objc_msgSend((id)objc_opt_class(), "_setGuestAssetSyncStatus:inLibrary:", 4, *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_assetWithUUID:orSyndicationIdentifier:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "shouldSyncToSPL");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v4 ^ 1;
    PLSyndicationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "uuid");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = *(_QWORD *)(a1 + 40);
      v9 = CFSTR("don't");
      if (v4)
        v9 = CFSTR("do");
      v13 = 138544130;
      v14 = v6;
      v16 = v9;
      v10 = CFSTR("keep");
      v15 = 2114;
      v17 = 2114;
      if (!v4)
        v10 = CFSTR("delete");
      v18 = v10;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: Asset %{public}@ in syndication library says %{public}@ sync to SPL, will %{public}@ corresponding guest asset %{public}@ in SPL", (uint8_t *)&v13, 0x2Au);

    }
  }
  else
  {
    PLSyndicationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = *(const __CFString **)(a1 + 40);
      v12 = *(const __CFString **)(a1 + 48);
      v13 = 138543874;
      v14 = (uint64_t)v11;
      v15 = 2114;
      v16 = v12;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: Unable to find asset %{public}@/%{public}@ in syndication library, will delete corresponding guest asset %{public}@ in SPL", (uint8_t *)&v13, 0x20u);
    }
  }

}

void __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    PLSyndicationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "GuestAssetSync: Initial sync transfering syndication library guest asset: %{public}@ to SPL", buf, 0xCu);

    }
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke_39;
    v12[3] = &unk_1E3677920;
    v18 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v8, "_syncAsset:toLibrary:completion:", v4, v9, v12);

  }
}

uint64_t __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke_39(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "URIRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGuestAssetInitialSyncResumeMarker:", v5);

  return objc_msgSend(*(id *)(a1 + 48), "_initialSyncTransferNextAssetFromSourceLibrary:targetLibrary:iterator:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLBackgroundJobWorkItem entityName](PLBackgroundJobWorkItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("jobType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke_2;
  v12[3] = &unk_1E36778F8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v14 = v10;
  v11 = (id)objc_msgSend(v8, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v7, v12);

}

void __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a1;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteObject:", v7);

  objc_msgSend(*(id *)(v5 + 40), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v9, "guestAssetSyncManagerShouldCancel:", *(_QWORD *)(v5 + 40));

  if ((_DWORD)v5)
    *a4 = 1;
}

void __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithSyndicationIdentifier:inLibrary:](PLManagedAsset, "assetWithSyndicationIdentifier:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary");
    objc_msgSend(v2, "savedAssetType");
    v3 = PLValidatedSavedAssetTypeApplies();
    if (*(unsigned __int8 *)(a1 + 80) != v3)
    {
      v4 = v3;
      PLSyndicationGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 32);
        v8[0] = 67109634;
        v8[1] = v4;
        v9 = 2114;
        v10 = v6;
        v11 = 2114;
        v12 = v7;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: setting savedToLibrary %d for source asset %{public}@ / %{public}@, skipping this sync pass", (uint8_t *)v8, 0x1Cu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
  }

}

void __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3)
    objc_msgSend((id)objc_opt_class(), "setDidIngestGuestAssetsInLibrary:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __89__PLGuestAssetSyncEngine__markAsWasGuestAssetOnAssetWithSyndicationIdentifier_inLibrary___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  +[PLManagedAsset assetWithSyndicationIdentifier:inLibrary:](PLManagedAsset, "assetWithSyndicationIdentifier:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "setWasGuestAsset:", 1);
    v1 = v2;
  }

}

uint64_t __81__PLGuestAssetSyncEngine__deleteAssetWithUuid_syndicationIdentifier_fromLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inTransaction_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

void __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!v5)
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 40);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v38 = v15;
      v39 = 2112;
      v40 = v16;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to fetch work item with objectID: %{public}@, error: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  v6 = objc_msgSend(v5, "jobFlags");
  v7 = v6;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v5, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v23, *(_QWORD *)(a1 + 32));
      v11 = objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
        v25 = *(void **)(a1 + 48);
        v24 = *(_QWORD *)(a1 + 56);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke_26;
        v30[3] = &unk_1E3677858;
        v26 = *(void **)(a1 + 40);
        v30[4] = v25;
        v31 = v26;
        v32 = *(id *)(a1 + 32);
        v33 = *(id *)(a1 + 64);
        objc_msgSend(v25, "_processSyndicationLibraryAsset:targetLibrary:completion:", v11, v24, v30);

      }
      else
      {
        PLSyndicationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          v39 = 2112;
          v40 = v29;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to fetch asset with uuid: %{public}@, error: %@", buf, 0x16u);

        }
        v11 = 0;
      }
    }
    else
    {
      PLSyndicationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v7;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "GuestAssetSync: Invalid job flags for work item: %X", buf, 8u);
      }

      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D74498];
      v35 = *MEMORY[0x1E0CB2938];
      v36 = CFSTR("Invalid job flags for guest asset sync work item");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 46309, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
LABEL_19:

    goto LABEL_20;
  }
  PLSyndicationGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v18;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "GuestAssetSync: attempting to delete asset with uuid: %{public}@", buf, 0xCu);

  }
  v19 = *(void **)(a1 + 48);
  objc_msgSend(v5, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", v20, 0, *(_QWORD *)(a1 + 56));

  if (v21)
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "GuestAssetSync: deleted asset with uuid: %{public}@", buf, 0xCu);

    }
    goto LABEL_19;
  }
LABEL_20:

}

uint64_t __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke_26(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishProcessingWorkItemManagedObjectID:library:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));
}

void __92__PLGuestAssetSyncEngine__finishProcessingWorkItemManagedObjectID_library_error_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLSyndicationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "GuestAssetSync: Finishing performWork and deleting job item: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingObjectWithID:error:", *(_QWORD *)(a1 + 32), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteObject:", v5);

  }
}

void __59__PLGuestAssetSyncEngine_workItemObjectIDsInLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLBackgroundJobWorkItem entityName](PLBackgroundJobWorkItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("jobType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setFetchLimit:", 100);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (BOOL)_guestAssetSyncStatusIsSet:(int64_t)a3 inLibrary:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a4, "globalValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guestAssetSyncStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (a3 & ~objc_msgSend(v6, "integerValue")) == 0;
  else
    v7 = 0;

  return v7;
}

+ (void)_setGuestAssetSyncStatus:(int64_t)a3 inLibrary:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "globalValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guestAssetSyncStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (v7 = objc_msgSend(v6, "integerValue"), a3 |= v7, a3 != v7))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "globalValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGuestAssetSyncStatus:", v8);

  }
}

+ (BOOL)didIngestGuestAssetsInLibrary:(id)a3
{
  return objc_msgSend(a1, "_guestAssetSyncStatusIsSet:inLibrary:", 8, a3);
}

+ (void)setDidIngestGuestAssetsInLibrary:(id)a3
{
  objc_msgSend(a1, "_setGuestAssetSyncStatus:inLibrary:", 8, a3);
}

+ (id)_resumeMarkerObjectIDInGlobalValuesOfLibrary:(id)a3 storedInLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(a3, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guestAssetInitialSyncResumeMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistentStoreCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectIDForURIRepresentation:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
