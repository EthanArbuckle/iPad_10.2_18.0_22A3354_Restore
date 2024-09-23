@implementation PLSyndicationSyncEngine

- (PLSyndicationSyncEngine)initWithQueryTypes:(id)a3 savedAssetTypeMask:(unsigned __int16)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PLSyndicationSyncEngine *v11;
  PLSyndicationSyncEngine *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PLSyndicationSyncEngine;
  v11 = -[PLSyndicationSyncEngine init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_suppportedQueryTypes, a3);
    v12->_savedAssetTypeMask = a4;
  }

  return v12;
}

- (BOOL)_isQueryTypeSupported:(int64_t)a3
{
  NSSet *suppportedQueryTypes;
  void *v4;

  suppportedQueryTypes = self->_suppportedQueryTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(suppportedQueryTypes) = -[NSSet containsObject:](suppportedQueryTypes, "containsObject:", v4);

  return (char)suppportedQueryTypes;
}

- (void)_processZombieItem:(id)a3 library:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  NSObject *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithSyndicationIdentifier:inLibrary:](PLManagedAsset, "assetWithSyndicationIdentifier:inLibrary:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    +[PLConversation albumWithConversationID:inLibrary:](PLConversation, "albumWithConversationID:inLibrary:", v6, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    PLSyndicationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        -[NSObject uuid](v10, "uuid");
        v15 = objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v15;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "[sync] deleting conversation with uuid: %{public}@, syndication identifier: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_msgSend(v5, "managedObjectContext");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteObject:](v13, "deleteObject:", v10);
      goto LABEL_15;
    }
    if (!v14)
    {
LABEL_15:

      goto LABEL_16;
    }
    v19 = 138412290;
    v20 = v6;
    v16 = "[sync] did not find asset/conversation to delete with syndication identifier: %@";
    v17 = v13;
    v18 = 12;
LABEL_14:
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    goto LABEL_15;
  }
  objc_msgSend(v7, "savedAssetType");
  v9 = PLValidatedSavedAssetTypeApplies();
  PLSyndicationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11)
      goto LABEL_16;
    objc_msgSend(v8, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v13;
    v21 = 2114;
    v22 = v6;
    v23 = 1024;
    v24 = objc_msgSend(v8, "savedAssetType");
    v16 = "[sync] not deleting asset with uuid: %{public}@, syndication identifier: %{public}@ because savedAssetType=%hu";
    v17 = v10;
    v18 = 28;
    goto LABEL_14;
  }
  if (v11)
  {
    objc_msgSend(v8, "uuid");
    v12 = objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v12;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "[sync] deleting asset with uuid: %{public}@, syndication identifier: %{public}@", (uint8_t *)&v19, 0x16u);

  }
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("Syndication sync"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteWithReason:", v10);
LABEL_16:

}

- (BOOL)_deleteGuestAssetWithSyndicationIdentifiers:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  PLSyndicationSyncEngine *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke;
  v13[3] = &unk_1E3677998;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v10, "performTransactionAndWait:", v13);

  return 1;
}

- (BOOL)_deleteConversationWithSyndicationIdentifiers:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke;
  v12[3] = &unk_1E3677530;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v9, "performTransactionAndWait:", v12);

  return 1;
}

- (void)_processZombieItems:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = *MEMORY[0x1E0CA6420];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "attributeSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "attributeDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (v16)
        {
          objc_msgSend(v12, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  -[PLSyndicationSyncEngine _deleteGuestAssetWithSyndicationIdentifiers:library:](self, "_deleteGuestAssetWithSyndicationIdentifiers:library:", v20, v18);
  -[PLSyndicationSyncEngine _deleteConversationWithSyndicationIdentifiers:library:](self, "_deleteConversationWithSyndicationIdentifiers:library:", v20, v18);

}

- (void)_createOrUpdateObjectFromSearchableItem:(id)a3 library:(id)a4 fullIndexSyncStartDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  char v22;
  char v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = 0;
  if ((PLSearchableItemRepresentsAsset(v7) & 1) != 0 || PLSearchableItemRepresentsConversation(v7))
  {
    v10 = (objc_class *)objc_opt_class();
    if (v10)
    {
      v11 = v10;
      v22 = 1;
      v21 = 0;
      -[objc_class createOrUpdateObjectFromSearchableItem:library:fullIndexSyncStartDate:createIfNeeded:didCreate:isSyndicatable:error:](v10, "createOrUpdateObjectFromSearchableItem:library:fullIndexSyncStartDate:createIfNeeded:didCreate:isSyndicatable:error:", v7, v8, v9, 1, &v23, &v22, &v21);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v21;
      v14 = v13;
      if (v12)
        v15 = 1;
      else
        v15 = v22 == 0;
      if (v15)
        goto LABEL_18;
      -[NSObject domain](v13, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D74498]))
      {
        v17 = -[NSObject code](v14, "code");

        if (v17 == 49501)
        {
          PLSyndicationGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v14;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "[sync] skipping attachment with invalid content type: %@", buf, 0xCu);
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {

      }
      PLSyndicationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(v11);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[sync] failed to insert %{public}@ with syndication ID: %@, error: %@", buf, 0x20u);

      }
      goto LABEL_17;
    }
  }
  PLSyndicationGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    v26 = 2112;
    v27 = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "[sync] failed to resolve object class for item with syndication ID: %@, error: %@", buf, 0x16u);
LABEL_18:

  }
}

- (BOOL)_canHandleSearchableItem:(id)a3 forQueryType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  v5 = a3;
  objc_msgSend(v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6420]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  switch(a4)
  {
    case 1:
    case 4:
      v10 = PLSearchableItemRepresentsAsset(v5);
      goto LABEL_5;
    case 2:
      v10 = PLSearchableItemRepresentsConversation(v5);
LABEL_5:
      v9 = v10;
      break;
    case 3:
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void)_processSearchableItem:(id)a3 forQueryType:(int64_t)a4 library:(id)a5 fullIndexSyncStartDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__PLSyndicationSyncEngine__processSearchableItem_forQueryType_library_fullIndexSyncStartDate___block_invoke;
  v16[3] = &unk_1E36710D8;
  v16[4] = self;
  v17 = v10;
  v19 = v12;
  v20 = a4;
  v18 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v14, "performTransactionAndWait:", v16);

}

- (void)_updateSyncTokenWithDate:(id)a3 queryType:(int64_t)a4 library:(id)a5 syncTokenIsCurrent:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = a6;
  v14 = a3;
  v9 = a5;
  v10 = v9;
  switch(a4)
  {
    case 1:
      objc_msgSend(v9, "globalValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastAttachmentSyndicationSyncDate:", v14);
      goto LABEL_9;
    case 2:
      objc_msgSend(v9, "globalValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastChatSyndicationSyncDate:", v14);
      goto LABEL_9;
    case 3:
      objc_msgSend(v9, "globalValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastDeleteSyndicationSyncDate:", v14);
      goto LABEL_9;
    case 4:
      objc_msgSend(v9, "globalValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      if (v6)
        v13 = 0;
      else
        v13 = v14;
      objc_msgSend(v12, "setInProgressFullIndexSyndicationSyncDate:", v13);
LABEL_9:

      break;
    default:
      break;
  }

}

- (void)_changeSyncRangeDenominatorWithInterrupted:(BOOL)a3 success:(BOOL)a4 library:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  if (v6 || v5)
  {
    v15 = v7;
    objc_msgSend(v7, "globalValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syndicationSyncRangeDenominator");
    v10 = v9;

    v7 = v15;
    v11 = v10 + v10;
    if (!v6)
      v11 = v10;
    v12 = fmax(v10 * 0.75, 1.0);
    if (v5)
      v13 = v12;
    else
      v13 = v11;
    if (vabdd_f64(v13, v10) > 2.22044605e-16)
    {
      objc_msgSend(v15, "globalValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSyndicationSyncRangeDenominator:", v13);

      v7 = v15;
    }
  }

}

- (void)syncSyndicationItemsWithStartDate:(id)a3 endDate:(id)a4 queryType:(int64_t)a5 library:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  __CFString *v16;
  __CFString *v17;
  double v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  BOOL v34;
  id WeakRetained;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  BOOL v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id *v60;
  id *v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  __CFString *v66;
  id v67;
  id v68;
  PLSyndicationSyncEngine *v69;
  void (**v70)(id, _QWORD, void *);
  _BYTE *v71;
  id v72[2];
  BOOL v73;
  _QWORD v74[4];
  id v75;
  _BYTE *v76;
  id v77;
  _QWORD v78[4];
  __CFString *v79;
  id v80;
  id v81;
  PLSyndicationSyncEngine *v82;
  void (**v83)(id, _QWORD, void *);
  _BYTE *v84;
  id v85[2];
  BOOL v86;
  _QWORD v87[4];
  id v88;
  id *v89;
  _BYTE *v90;
  id v91[2];
  id location;
  uint8_t buf[4];
  int64_t v94;
  __int16 v95;
  id v96;
  __int16 v97;
  void *v98;
  uint64_t v99;
  const __CFString *v100;
  _BYTE v101[24];
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  _QWORD v108[4];

  v108[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  if ((unint64_t)(a5 - 1) > 3)
    v16 = 0;
  else
    v16 = off_1E36670A8[a5 - 1];
  v17 = v16;
  if (-[PLSyndicationSyncEngine _isQueryTypeSupported:](self, "_isQueryTypeSupported:", a5))
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    if (v18 <= 0.0)
    {
      PLSyndicationGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v101 = 138543618;
        *(_QWORD *)&v101[4] = v17;
        *(_WORD *)&v101[12] = 2114;
        *(_QWORD *)&v101[14] = v13;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "[sync] invalid %{public}@ sync date: %{public}@, resetting to reference date", v101, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSyndicationSyncEngine _updateSyncTokenWithDate:queryType:library:syncTokenIsCurrent:](self, "_updateSyncTokenWithDate:queryType:library:syncTokenIsCurrent:", v45, a5, v14, 0);

      v46 = (void *)MEMORY[0x1E0CB35C8];
      v105 = *MEMORY[0x1E0CB2938];
      v106 = CFSTR("sync date invalid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 50003, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v48);

    }
    else
    {
      *(_QWORD *)v101 = 0;
      *(_QWORD *)&v101[8] = v101;
      *(_QWORD *)&v101[16] = 0x3032000000;
      v102 = __Block_byref_object_copy__76469;
      v103 = __Block_byref_object_dispose__76470;
      v104 = 0;
      -[PLSyndicationSyncEngine delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "syncManager:shouldContinueWithLibrary:", self, v14);

      if ((v20 & 1) != 0)
      {
        if (a5 == 4)
        {
          objc_msgSend(v14, "globalValues");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "inProgressFullIndexSyndicationSyncDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22 == 0;

          if (v23)
          {
            objc_msgSend(v14, "globalValues");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setInProgressFullIndexSyndicationSyncDate:", v12);

            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "globalValues");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setLastFullIndexSyndicationSyncStartDate:", v25);

          }
        }
        objc_initWeak(&location, self);
        v27 = v13;
        v28 = v12;
        v29 = v27;
        v30 = v27;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "compare:", v30);
        v62 = v31;
        v63 = v30;
        v64 = v30;
        v12 = v28;
        if (v32 == -1)
        {
          v64 = v31;

        }
        PLSyndicationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v13 = v29;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v94 = (int64_t)v17;
          v95 = 2114;
          v96 = v12;
          v97 = 2114;
          v98 = v63;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "[sync] starting %{public}@ spotlight query to sync syndication items with start date: %{public}@, end date: %{public}@", buf, 0x20u);
        }

        if (a5 == 3)
        {
          v34 = v32 == -1;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v36 = MEMORY[0x1E0C809B0];
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_53;
          v74[3] = &unk_1E3671150;
          objc_copyWeak(&v77, &location);
          v37 = v14;
          v75 = v37;
          v76 = v101;
          v65[0] = v36;
          v65[1] = 3221225472;
          v65[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_55;
          v65[3] = &unk_1E3671128;
          v71 = v101;
          v66 = v17;
          objc_copyWeak(v72, &location);
          v67 = v64;
          v72[1] = (id)3;
          v38 = v37;
          v73 = v34;
          v68 = v38;
          v69 = self;
          v70 = v15;
          objc_msgSend(WeakRetained, "executeQueryForSyncManager:type:startDate:endDate:batchHandler:completionHandler:", self, 3, v12, v63, v74, v65);

          objc_destroyWeak(v72);
          objc_destroyWeak(&v77);
        }
        else
        {
          objc_msgSend(v14, "globalValues");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "lastFullIndexSyndicationSyncStartDate");
          v60 = (id *)objc_claimAutoreleasedReturnValue();
          v55 = v32 == -1;

          v59 = objc_loadWeakRetained((id *)&self->_delegate);
          v56 = MEMORY[0x1E0C809B0];
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke;
          v87[3] = &unk_1E3671100;
          objc_copyWeak(v91, &location);
          v57 = v14;
          v88 = v57;
          v91[1] = (id)a5;
          v61 = v60;
          v89 = v61;
          v90 = v101;
          v78[0] = v56;
          v78[1] = 3221225472;
          v78[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_2;
          v78[3] = &unk_1E3671128;
          v84 = v101;
          v79 = v17;
          objc_copyWeak(v85, &location);
          v80 = v64;
          v85[1] = (id)a5;
          v58 = v57;
          v86 = v55;
          v81 = v58;
          v82 = self;
          v83 = v15;
          objc_msgSend(v59, "executeQueryForSyncManager:type:startDate:endDate:itemHandler:completionHandler:", self, a5, v12, v63, v87, v78);

          objc_destroyWeak(v85);
          objc_destroyWeak(v91);

        }
        objc_destroyWeak(&location);
      }
      else
      {
        PLSyndicationGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v94 = a5;
          _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEFAULT, "[sync] sync for type: %td interrupted by mutex", buf, 0xCu);
        }

        v50 = (void *)MEMORY[0x1E0CB35C8];
        v99 = *MEMORY[0x1E0CB2938];
        v100 = CFSTR("shouldStopUsingSyndicationIngestLibrary");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 50003, v51);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = *(void **)(*(_QWORD *)&v101[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v101[8] + 40) = v52;

        v15[2](v15, 0, *(void **)(*(_QWORD *)&v101[8] + 40));
      }
      _Block_object_dispose(v101, 8);

    }
  }
  else
  {
    PLSyndicationGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v101 = 134217984;
      *(_QWORD *)&v101[4] = a5;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "[sync] unsupported query type: %td", v101, 0xCu);
    }

    v40 = (void *)MEMORY[0x1E0CB35C8];
    v107 = *MEMORY[0x1E0CB2938];
    objc_msgSend(CFSTR("unsupported query type: "), "stringByAppendingString:", v17);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 50003, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v43);

  }
}

- (BOOL)syncSyndicationItemWithUniqueIdentifier:(id)a3 bundleID:(id)a4 queryType:(int64_t)a5 library:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v29[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationSearchAttributes();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers(v14, a5, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "globalValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastFullIndexSyndicationSyncStartDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSyndicationSyncEngine _processSearchableItem:forQueryType:library:fullIndexSyncStartDate:](self, "_processSearchableItem:forQueryType:library:fullIndexSyncStartDate:", v17, a5, v13, v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No CSSI found for %@ with bundleID %@"), v11, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2938];
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 47017, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a7)
      *a7 = objc_retainAutorelease(v23);

  }
  return isKindOfClass & 1;
}

- (PLSyndicationSyncEngineDelegate)delegate
{
  return (PLSyndicationSyncEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suppportedQueryTypes, 0);
}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "syncManager:shouldContinueWithLibrary:", WeakRetained, *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(WeakRetained, "_processSearchableItem:forQueryType:library:fullIndexSyncStartDate:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("shouldStopUsingSyndicationIngestLibrary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 50003, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if (a3)
      *a3 = 1;
  }

}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
    goto LABEL_2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    PLSyndicationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v15;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "[sync] %{public}@ (MUTEX) query completion handler error not set, reporting %@", v20, 0x16u);
    }

    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v3)
    {
LABEL_2:
      objc_msgSend(v3, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA5F00]))
      {
        v5 = objc_msgSend(v3, "code");

        if (v5 == -2003)
        {
          PLSyndicationGetLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v20 = 138543362;
            *(_QWORD *)&v20[4] = v7;
            v8 = "[sync] %{public}@ spotlight search query was cancelled";
            v9 = v6;
            v10 = OS_LOG_TYPE_DEFAULT;
            v11 = 12;
LABEL_9:
            _os_log_impl(&dword_199541000, v9, v10, v8, v20, v11);
            goto LABEL_10;
          }
          goto LABEL_10;
        }
      }
      else
      {

      }
      PLSyndicationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v20 = 138543618;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v3;
        v8 = "[sync] %{public}@ spotlight search query failed with error: %@";
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        v11 = 22;
        goto LABEL_9;
      }
LABEL_10:
      v13 = 0;
      goto LABEL_18;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "_updateSyncTokenWithDate:queryType:library:syncTokenIsCurrent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 96));

  PLSyndicationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v18;
    *(_WORD *)&v20[12] = 2114;
    *(_QWORD *)&v20[14] = v19;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[sync] finished %{public}@ spotlight query to sync syndication items, setting sync token date: %{public}@", v20, 0x16u);
  }
  v3 = 0;
  v13 = 1;
LABEL_18:

  objc_msgSend(*(id *)(a1 + 56), "_changeSyncRangeDenominatorWithInterrupted:success:library:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0, v13, *(_QWORD *)(a1 + 48), *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_53(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "syncManager:shouldContinueWithLibrary:", WeakRetained, *(_QWORD *)(a1 + 32));

  if (v8)
  {
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "libraryID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[sync] processing zombie items in %@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "_processZombieItems:library:", v5, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2938];
    v18 = CFSTR("shouldStopUsingSyndicationIngestLibrary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 50003, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    if (a3)
      *a3 = 1;
  }

}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
    goto LABEL_2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    PLSyndicationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v15;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "[sync] %{public}@ (MUTEX) query completion handler error not set, reporting %@", v20, 0x16u);
    }

    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v3)
    {
LABEL_2:
      objc_msgSend(v3, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA5F00]))
      {
        v5 = objc_msgSend(v3, "code");

        if (v5 == -2003)
        {
          PLSyndicationGetLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v20 = 138543362;
            *(_QWORD *)&v20[4] = v7;
            v8 = "[sync] %{public}@ spotlight search query was cancelled";
            v9 = v6;
            v10 = OS_LOG_TYPE_DEFAULT;
            v11 = 12;
LABEL_9:
            _os_log_impl(&dword_199541000, v9, v10, v8, v20, v11);
            goto LABEL_10;
          }
          goto LABEL_10;
        }
      }
      else
      {

      }
      PLSyndicationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v20 = 138543618;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v3;
        v8 = "[sync] %{public}@ spotlight search query failed with error: %@";
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        v11 = 22;
        goto LABEL_9;
      }
LABEL_10:
      v13 = 0;
      goto LABEL_18;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "_updateSyncTokenWithDate:queryType:library:syncTokenIsCurrent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 96));

  PLSyndicationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v18;
    *(_WORD *)&v20[12] = 2114;
    *(_QWORD *)&v20[14] = v19;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[sync] finished %{public}@ spotlight query to sync syndication items, setting sync token date: %{public}@", v20, 0x16u);
  }
  v3 = 0;
  v13 = 1;
LABEL_18:

  objc_msgSend(*(id *)(a1 + 56), "_changeSyncRangeDenominatorWithInterrupted:success:library:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0, v13, *(_QWORD *)(a1 + 48), *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __94__PLSyndicationSyncEngine__processSearchableItem_forQueryType_library_fullIndexSyncStartDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_canHandleSearchableItem:forQueryType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64)))
  {
    objc_msgSend(*(id *)(a1 + 40), "attributeSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6420]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    if (v5)
      objc_msgSend(v6, "_processZombieItem:library:", v7, v8);
    else
      objc_msgSend(v6, "_createOrUpdateObjectFromSearchableItem:library:fullIndexSyncStartDate:", v7, v8, *(_QWORD *)(a1 + 56));
  }
  else
  {
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "[sync] skipping unexpected searchable item %@", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshAllObjects");

}

void __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLConversation entityName](PLConversation, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("importSessionID"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke_2;
    v14[3] = &unk_1E36710B0;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    v9 = (id)objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v7, v14);
    PLSyndicationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(","));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Deleted %tu conversation(s), identifiers: %@", buf, 0x16u);

    }
    v13 = v15;
  }
  else
  {
    PLSyndicationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = (uint64_t)v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Error fetching conversations: %@", buf, 0xCu);
    }
  }

}

void __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "importSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", v4);

}

void __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset predicateForSyndicatedAssetIdentifiers:includeRejected:](PLManagedAsset, "predicateForSyndicatedAssetIdentifiers:includeRejected:", *(_QWORD *)(a1 + 32), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 16), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  v27 = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v4, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  if (v12)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke_2;
    v19[3] = &unk_1E3677A78;
    v20 = *(id *)(a1 + 56);
    v21 = v11;
    v14 = (id)objc_msgSend(v21, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v19);
    PLSyndicationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(*(id *)(a1 + 56), "count");
      objc_msgSend(*(id *)(a1 + 56), "componentsJoinedByString:", CFSTR(","));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Deleted %tu guest asset(s), uuid: %{public}@", buf, 0x16u);

    }
    v18 = v20;
  }
  else
  {
    PLSyndicationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = (uint64_t)v13;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Error fetching guest assets: %@", buf, 0xCu);
    }
  }

}

void __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v4, "additionalAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syndicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v4);

}

+ (void)_recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  void (**v21)(id, id, _QWORD);
  _BYTE *v22;
  id v23;
  _QWORD v24[5];
  _BYTE buf[24];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  PLSyndicationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "[sync] recursively searching syndication start date in interval: %@, %@", buf, 0x16u);
  }

  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  if (v12 <= 86400.0)
  {
    v10[2](v10, v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, v12 * 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v26 = 0;
    PLSyndicationCheckQueryWithDates(v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke;
    v24[3] = &unk_1E3671178;
    v24[4] = buf;
    objc_msgSend(v14, "setFoundItemsHandler:", v24);
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke_2;
    v17[3] = &unk_1E3672048;
    v21 = v10;
    v22 = buf;
    v23 = a1;
    v18 = v8;
    v16 = v13;
    v19 = v16;
    v20 = v9;
    objc_msgSend(v14, "setCompletionHandler:", v17);
    objc_msgSend(v14, "start");

    _Block_object_dispose(buf, 8);
  }

}

+ (void)findStartDateForMessagesSpotlightItemsWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:endDate:completionHandler:", v7, v6, v5);

}

uint64_t __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

void __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
    }
    objc_msgSend(*(id *)(a1 + 72), "_recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:endDate:completionHandler:", v3, v4, *(_QWORD *)(a1 + 56));
  }

}

@end
