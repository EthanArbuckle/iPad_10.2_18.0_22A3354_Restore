@implementation WBSCloudHistoryStore

- (WBSCloudHistoryStore)initWithConfiguration:(id)a3 useManateeContainer:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  WBSCloudHistoryStore *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  uint64_t v11;
  NSOperationQueue *cloudKitOperationQueue;
  void *v13;
  void *v14;
  uint64_t v15;
  CKDatabase *database;
  id v17;
  uint64_t v18;
  CKRecordZoneID *recordZoneID;
  WBSCloudHistoryStore *v20;
  objc_super v22;

  v4 = a4;
  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSCloudHistoryStore;
  v8 = -[WBSCloudHistoryStore init](&v22, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.SafariShared.WBSCloudHistoryStore", 0);
    databaseQueue = v8->_databaseQueue;
    v8->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    cloudKitOperationQueue = v8->_cloudKitOperationQueue;
    v8->_cloudKitOperationQueue = (NSOperationQueue *)v11;

    -[NSOperationQueue setQualityOfService:](v8->_cloudKitOperationQueue, "setQualityOfService:", 17);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSCloudHistoryStore.%@.%p.operationQueue"), objc_opt_class(), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v8->_cloudKitOperationQueue, "setName:", v13);

    objc_storeStrong((id *)&v8->_configuration, a3);
    if (NSClassFromString(CFSTR("CKDatabase")))
    {
      v8->_useManateeContainer = v4;
      if (v4)
        objc_msgSend(MEMORY[0x1E0C94C30], "safari_historyManateeContainer");
      else
        objc_msgSend(MEMORY[0x1E0C94C30], "safari_historyContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "privateCloudDatabase");
      v15 = objc_claimAutoreleasedReturnValue();
      database = v8->_database;
      v8->_database = (CKDatabase *)v15;

      v17 = objc_alloc(MEMORY[0x1E0C950A0]);
      v18 = objc_msgSend(v17, "initWithZoneName:ownerName:", CFSTR("History"), *MEMORY[0x1E0C94920]);
      recordZoneID = v8->_recordZoneID;
      v8->_recordZoneID = (CKRecordZoneID *)v18;

    }
    v20 = v8;
  }

  return v8;
}

- (void)initializePushNotifications:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_2;
  v4[3] = &unk_1E4B2B8F8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_prepareRecordZoneWithCompletion:", v4);

}

void __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C94F58]);
    objc_msgSend(v4, "setShouldSendContentAvailable:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950B8]), "initWithZoneID:subscriptionID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("ZoneSubscription"));
    objc_msgSend(v5, "setNotificationInfo:", v4);
    v6 = objc_alloc(MEMORY[0x1E0C94F20]);
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v7, 0);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_3;
    v9[3] = &unk_1E4B2B8D0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setModifySubscriptionsCompletionBlock:", v9);
    objc_msgSend(*(id *)(a1 + 32), "_scheduleOperation:", v8);

  }
}

uint64_t __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldTryToResetRecordZoneForError:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 26) & 1) != 0
    || (objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 28) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 5001);
  }

  return v4;
}

- (void)saveCloudHistoryVisits:(id)a3 tombstones:(id)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *databaseQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke;
  block[3] = &unk_1E4B2B920;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(databaseQueue, block);

}

void __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke_2;
  v5[3] = &unk_1E4B2B768;
  v5[4] = v1;
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v1, "_saveCloudHistoryVisits:tombstones:longLivedOperationPersistenceCompletion:completion:", v2, v3, v4, v5);

}

void __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldTryToResetRecordZoneForError:"))
    objc_msgSend(*(id *)(a1 + 32), "_resetRecordZone");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_saveCloudHistoryVisits:(id)a3 tombstones:(id)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(id, void *);
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[WBSCloudHistoryStore _recordsWithCloudHistoryVisits:](self, "_recordsWithCloudHistoryVisits:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistoryStoreErrorDomain"), 1, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v36);

      goto LABEL_32;
    }
    v15 = (void *)v14;
    objc_msgSend(v41, "addObjectsFromArray:", v14);

  }
  v37 = v13;
  v38 = v12;
  v39 = v11;
  v40 = v10;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v46;
    v20 = *MEMORY[0x1E0D89E20];
LABEL_6:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v19)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v21);
      objc_msgSend(v16, "objectForKeyedSubscript:", v22, v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v20) & 1) == 0)
      {
        if (objc_msgSend(v23, "count"))
          break;
      }
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __110__WBSCloudHistoryStore__saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke;
        v42[3] = &unk_1E4B2B948;
        v25 = v26;
        v43 = v25;
        v28 = v27;
        v44 = v28;
        objc_msgSend(v23, "enumerateObjectsUsingBlock:", v42);
        if (objc_msgSend(v25, "count"))
        {
          -[WBSCloudHistoryStore _recordWithHistoryTombstones:version:](self, "_recordWithHistoryTombstones:version:", v25, 2);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!v29)
            goto LABEL_26;
          v30 = (void *)v29;
          objc_msgSend(v41, "addObject:", v29);

        }
        if (objc_msgSend(v28, "count"))
        {
          -[WBSCloudHistoryStore _recordWithHistoryTombstones:version:](self, "_recordWithHistoryTombstones:version:", v28, 1);
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
LABEL_26:
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistoryStoreErrorDomain"), 1, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v37;
            v37[2](v37, v35);

LABEL_29:
            goto LABEL_31;
          }
          v32 = (void *)v31;
          objc_msgSend(v41, "addObject:", v31);

        }
        goto LABEL_21;
      }
LABEL_22:

      if (v18 == ++v21)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v18)
          goto LABEL_6;
        goto LABEL_24;
      }
    }
    -[WBSCloudHistoryStore _recordWithHistoryTombstones:version:](self, "_recordWithHistoryTombstones:version:", v23, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistoryStoreErrorDomain"), 1, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v37;
      v37[2](v37, v25);
      goto LABEL_29;
    }
    v25 = v24;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, CFSTR("ProfileUUID"));
    objc_msgSend(v41, "addObject:", v25);
LABEL_21:

    goto LABEL_22;
  }
LABEL_24:

  v33 = -[WBSCloudHistoryConfiguration shouldBatchSaveRecords](self->_configuration, "shouldBatchSaveRecords");
  v34 = (void *)objc_msgSend(v41, "mutableCopy");
  if (v33)
  {
    v13 = v37;
    v12 = v38;
    -[WBSCloudHistoryStore _batchSaveRecords:useLongLivedOperation:longLivedOperationPersistenceCompletion:completion:](self, "_batchSaveRecords:useLongLivedOperation:longLivedOperationPersistenceCompletion:completion:", v34, -[WBSCloudHistoryConfiguration shouldUseLongLivedOperationsToSaveRecords](self->_configuration, "shouldUseLongLivedOperationsToSaveRecords"), v38, v37);

    v11 = v39;
    v10 = v40;
  }
  else
  {
    v13 = v37;
    -[WBSCloudHistoryStore _saveRecords:withCompletion:](self, "_saveRecords:withCompletion:", v34, v37);

LABEL_31:
    v11 = v39;
    v10 = v40;
    v12 = v38;
  }
LABEL_32:

}

void __110__WBSCloudHistoryStore__saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "isSecure");
  v4 = 40;
  if (v3)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

- (void)_saveRecords:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");
    v9 = objc_alloc(MEMORY[0x1E0C94F08]);
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithRecordsToSave:recordIDsToDelete:", v10, 0);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke;
    v12[3] = &unk_1E4B2B970;
    v14 = v7;
    v12[4] = self;
    v13 = v6;
    objc_msgSend(v11, "setPerRecordCompletionBlock:", v12);
    -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    NSLog(CFSTR("Failed to save record: %@"), v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(v6 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke_2;
    block[3] = &unk_1E4B2A0F0;
    block[4] = v6;
    v10 = v7;
    v11 = *(id *)(a1 + 48);
    dispatch_async(v8, block);

  }
}

uint64_t __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveRecords:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_batchSaveRecords:(id)a3 useLongLivedOperation:(BOOL)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C94F08];
  v13 = a3;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithRecordsToSave:recordIDsToDelete:", v13, 0);

  v15 = MEMORY[0x1E0C809B0];
  if (v10 && v7)
  {
    objc_msgSend(v14, "operationID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLongLived:", 1);
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke;
    v21[3] = &unk_1E4B2B998;
    v22 = v16;
    v23 = v10;
    v17 = v16;
    objc_msgSend(v14, "setLongLivedOperationWasPersistedBlock:", v21);

  }
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2;
  v19[3] = &unk_1E4B2B8D0;
  v20 = v11;
  v18 = v11;
  objc_msgSend(v14, "setModifyRecordsCompletionBlock:", v19);
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v14);

}

uint64_t __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;

  v5 = a4;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2_cold_1(v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_recordsWithCloudHistoryVisits:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  WBSCloudHistoryStore *v34;
  id v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self;
  v5 = -[WBSCloudHistoryConfiguration maximumRequestCharacterCount](self->_configuration, "maximumRequestCharacterCount");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v4;
  v31 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v31)
  {
    v7 = 0;
    v28 = *MEMORY[0x1E0D89E20];
    v29 = *(_QWORD *)v43;
    v30 = v6;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
        objc_msgSend(v6, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v28))
          v11 = 0;
        else
          v11 = v9;
        v35 = v11;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        obj = v10;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        v32 = v8;
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v16, "visitIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "urlString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "length");
              objc_msgSend(v16, "title");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "length") + v19;

              if (v21 <= v5)
              {
                if (v21 + v7 > v5)
                {
                  -[WBSCloudHistoryStore _recordWithCloudHistoryVisits:profileServerIdentifier:](v34, "_recordWithCloudHistoryVisits:profileServerIdentifier:", v37, v35);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v24)
                    objc_msgSend(v33, "addObject:", v24);
                  objc_msgSend(v37, "removeAllObjects");

                  v7 = 0;
                }
                objc_msgSend(v37, "addObject:", v16);
                v7 += v21;
              }
              else
              {
                v22 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  v47 = v16;
                  _os_log_error_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_ERROR, "Skipping large WBSCloudHistoryVisit: %p", buf, 0xCu);
                }
                v23 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138477827;
                  v47 = v16;
                  _os_log_debug_impl(&dword_1A3D90000, v23, OS_LOG_TYPE_DEBUG, "Skipping large WBSCloudHistoryVisit: %{private}@", buf, 0xCu);
                }
              }
            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          }
          while (v13);
        }

        v6 = v30;
        if (objc_msgSend(v37, "count"))
        {
          -[WBSCloudHistoryStore _recordWithCloudHistoryVisits:profileServerIdentifier:](v34, "_recordWithCloudHistoryVisits:profileServerIdentifier:", v37, v35);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {

            v26 = v33;
            goto LABEL_33;
          }
          objc_msgSend(v33, "addObject:", v25);
          objc_msgSend(v37, "removeAllObjects");

        }
        v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v31)
        continue;
      break;
    }
  }

  v26 = v33;
  v25 = v33;
LABEL_33:

  return v25;
}

- (id)_recordWithCloudHistoryVisits:(id)a3 profileServerIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  WBSCloudHistoryStore *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v29 = self;
  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "dictionaryRepresentation", v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "addObject:", v13);
        }
        else
        {
          v14 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v38 = v12;
            _os_log_error_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_ERROR, "Skipping invalid WBSCloudHistoryVisit: %{private}@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v9);
  }

  v35[0] = CFSTR("Visits");
  v35[1] = CFSTR("ClientVersion");
  v36[0] = v6;
  v36[1] = &unk_1E4B87970;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    v16 = 2;
  else
    v16 = 1;
  -[WBSCloudHistoryStore _recordWithType:version:dataDictionary:](v29, "_recordWithType:version:dataDictionary:", CFSTR("Visits"), v16, v15, v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v30)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("ProfileUUID"));
  if (v18)
  {
    v19 = v18;
  }
  else
  {
    v20 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[WBSCloudHistoryStore _recordWithCloudHistoryVisits:profileServerIdentifier:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  return v18;
}

- (id)_recordWithHistoryTombstones:(id)a3 version:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v10);
  }

  v31[0] = CFSTR("Tombstones");
  v31[1] = CFSTR("ClientVersion");
  v32[0] = v7;
  v32[1] = &unk_1E4B87970;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudHistoryStore _recordWithType:version:dataDictionary:](self, "_recordWithType:version:dataDictionary:", CFSTR("Tombstones"), a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    v18 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WBSCloudHistoryStore _recordWithHistoryTombstones:version:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  return v16;
}

- (void)replayPersistedLongLivedSaveOperationWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke;
  block[3] = &unk_1E4B2A0F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_28;
  v10[3] = &unk_1E4B2B9C0;
  v12 = &v13;
  v6 = v2;
  v11 = v6;
  objc_msgSend(v3, "fetchLongLivedOperationWithID:completionHandler:", v5, v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (v14[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (id)v14[5];
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_2;
    v8[3] = &unk_1E4B2B8D0;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "setModifyRecordsCompletionBlock:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_scheduleOperation:", v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(&v13, 8);
}

void __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRecordsWithServerChangeTokenData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSCloudHistoryStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke;
  block[3] = &unk_1E4B2A0F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke(_QWORD *a1)
{
  WBSCloudHistoryFetchResult *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[3];
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(WBSCloudHistoryFetchResult);
  if (a1[4])
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3710]);
    v4 = a1[4];
    v14[0] = 0;
    v5 = (void *)objc_msgSend(v3, "initForReadingFromData:error:", v4, v14);
    v6 = v14[0];
    if (v6)
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_cold_2(v8, (uint64_t)v15, v7);
      }

    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishDecoding");

  }
  else
  {
    v9 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_33;
  v11[3] = &unk_1E4B2B9E8;
  v10 = (void *)a1[6];
  v12 = (id)a1[5];
  v13 = v10;
  objc_msgSend(v12, "_fetchRecordsWithServerChangeToken:numberOfFetchRecordsOperationsPerformedSoFar:result:completion:", v9, 1, v2, v11);

}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_33(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldTryToResetRecordZoneForError:", v6))
    objc_msgSend(*(id *)(a1 + 32), "_resetRecordZone");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_configureFetchChangesOperation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setFetchAllChanges:", 0);
  objc_msgSend(v3, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:", v4);

}

- (void)_fetchRecordsWithServerChangeToken:(id)a3 numberOfFetchRecordsOperationsPerformedSoFar:(unint64_t)a4 result:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t, uint64_t);
  void *v21;
  id v22;
  WBSCloudHistoryStore *v23;
  id v24;
  id v25[2];
  id location;
  _QWORD v27[4];
  id v28;
  WBSCloudHistoryStore *v29;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DC8]), "initWithRecordZoneID:previousServerChangeToken:", self->_recordZoneID, v10);
  -[WBSCloudHistoryStore _configureFetchChangesOperation:](self, "_configureFetchChangesOperation:", v13);
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke;
  v27[3] = &unk_1E4B2BA10;
  v15 = v11;
  v28 = v15;
  v29 = self;
  objc_msgSend(v13, "setRecordChangedBlock:", v27);
  objc_initWeak(&location, v13);
  v18 = v14;
  v19 = 3221225472;
  v20 = __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2;
  v21 = &unk_1E4B2BA60;
  v16 = v12;
  v24 = v16;
  v17 = v15;
  v22 = v17;
  v25[1] = (id)a4;
  objc_copyWeak(v25, &location);
  v23 = self;
  objc_msgSend(v13, "setFetchRecordChangesCompletionBlock:", &v18);
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v13, v18, v19, v20, v21);
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
}

uint64_t __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendRecord:usingConfiguration:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
}

void __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v6 = a2;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v8 = objc_msgSend(WeakRetained, "moreComing");

    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(NSObject **)(v9 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_3;
      block[3] = &unk_1E4B2BA38;
      block[4] = v9;
      v11 = v6;
      v12 = *(_QWORD *)(a1 + 64);
      v18 = v11;
      v21 = v12;
      v19 = *(id *)(a1 + 32);
      v20 = *(id *)(a1 + 48);
      dispatch_async(v10, block);

    }
    else
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v14)
      {
        v15 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2_cold_1(v15);
      }
      objc_msgSend(*(id *)(a1 + 32), "_setServerChangeTokenData:", v13);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

uint64_t __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRecordsWithServerChangeToken:numberOfFetchRecordsOperationsPerformedSoFar:result:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_scheduleOperation:(id)a3
{
  CKDatabase *database;
  id v5;
  id v6;

  database = self->_database;
  v5 = a3;
  objc_msgSend(v5, "setDatabase:", database);
  objc_msgSend(v5, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v6);
  -[NSOperationQueue addOperation:](self->_cloudKitOperationQueue, "addOperation:", v5);

}

- (id)_recordWithType:(id)a3 version:(unint64_t)a4 dataDictionary:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (objc_class *)MEMORY[0x1E0C95050];
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithRecordType:zoneID:", v10, self->_recordZoneID);

  -[WBSCloudHistoryStore _recordDataForDictionary:](self, "_recordDataForDictionary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "safari_encryptedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("EncryptedData"));

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("UUID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("Version"));

    v17 = v11;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_recordDataForDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v7;
  id v8;

  if (!a3)
    return 0;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(v3, "safari_dataByCompressingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSCloudHistoryStore _recordDataForDictionary:].cold.1(v7);
    v5 = 0;
  }

  return v5;
}

- (id)_prepareRecordZoneWithoutCachingWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  WBSCloudHistoryStore *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_alloc(MEMORY[0x1E0C94E00]);
  v33[0] = self->_recordZoneID;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordZoneIDs:", v7);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke;
  v16 = &unk_1E4B2BAB0;
  v17 = self;
  v19 = &v27;
  v20 = &v21;
  v9 = v5;
  v18 = v9;
  objc_msgSend(v8, "setFetchRecordZonesCompletionBlock:", &v13);
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v8, v13, v14, v15, v16, v17);
  v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistoryStoreErrorDomain"), 2, 0);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
    v11 = (id)v28[5];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  int8x16_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95090]), "initWithZoneID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v9 = objc_alloc(MEMORY[0x1E0C94EF8]);
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v10, 0);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke_2;
    v12[3] = &unk_1E4B2BA88;
    v14 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v11, "setModifyRecordZonesCompletionBlock:", v12);
    objc_msgSend(*(id *)(a1 + 32), "_scheduleOperation:", v11);

  }
}

void __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke_2(uint64_t a1, void *a2, int a3, id obj)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v11 = obj;
  v7 = a2;
  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_prepareRecordZoneWithCompletion:(id)a3
{
  void (*v3)(void);
  id v4;
  void (**v6)(id, CKRecordZone *, id);
  CKRecordZone *v7;
  CKRecordZone *recordZone;
  CKRecordZone *v9;
  id v10;

  if (self->_recordZone)
  {
    v3 = (void (*)(void))*((_QWORD *)a3 + 2);
    v4 = a3;
    v3();
  }
  else
  {
    v10 = 0;
    v6 = (void (**)(id, CKRecordZone *, id))a3;
    -[WBSCloudHistoryStore _prepareRecordZoneWithoutCachingWithError:](self, "_prepareRecordZoneWithoutCachingWithError:", &v10);
    v7 = (CKRecordZone *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    recordZone = self->_recordZone;
    self->_recordZone = v7;
    v9 = v7;

    v6[2](v6, self->_recordZone, v4);
  }

}

- (void)_resetRecordZone
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WBSCloudHistoryStore__resetRecordZone__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(databaseQueue, block);
}

uint64_t __40__WBSCloudHistoryStore__resetRecordZone__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Resetting Cloud History record zone.", v6, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_prepareRecordZoneWithCompletion:", &__block_literal_global_17);
}

void __40__WBSCloudHistoryStore__resetRecordZone__block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40__WBSCloudHistoryStore__resetRecordZone__block_invoke_47_cold_1(v4);
  }

}

- (void)deleteHistoryZoneWithCompletion:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C94EF8]);
  v7[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v3);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke_2;
  v5[3] = &unk_1E4B2B8D0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setModifyRecordZonesCompletionBlock:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_scheduleOperation:", v4);

}

void __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a4;
  v5 = objc_msgSend(v8, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 26);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = v8;
    if (v5)
      v7 = 0;
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)fetchNumberOfDevicesInSyncCircleWithCompletion:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_prepareRecordZoneWithoutCachingWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (!objc_msgSend(v3, "deviceCount"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchAllRecordsWithQueryOperation:(id)a3 enumerationBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  WBSCloudHistoryStore *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke;
  v22[3] = &unk_1E4B2BB18;
  v11 = v8;
  v23 = v11;
  v12 = a3;
  objc_msgSend(v12, "setRecordMatchedBlock:", v22);
  v15 = v10;
  v16 = 3221225472;
  v17 = __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke_2;
  v18 = &unk_1E4B2BB40;
  v19 = self;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  objc_msgSend(v12, "setQueryCompletionBlock:", &v15);
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v12, v15, v16, v17, v18, v19);

}

uint64_t __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95030]), "initWithCursor:", v4);
    objc_msgSend(v3, "setZoneID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(a1 + 32), "_fetchAllRecordsWithQueryOperation:enumerationBlock:completionBlock:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)fetchRecordsForProfileServerIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  WBSCloudHistoryFetchResult *v8;
  void *v9;
  dispatch_group_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  WBSCloudHistoryFetchResult *v14;
  void (**v15)(_QWORD, _QWORD);
  NSObject *databaseQueue;
  WBSCloudHistoryFetchResult *v17;
  id v18;
  _QWORD block[4];
  WBSCloudHistoryFetchResult *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  WBSCloudHistoryStore *v26;
  WBSCloudHistoryFetchResult *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(WBSCloudHistoryFetchResult);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("ProfileUUID"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__4;
  v29[4] = __Block_byref_object_dispose__4;
  v30 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke;
  v23[3] = &unk_1E4B2BBB8;
  v12 = v10;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v26 = self;
  v14 = v8;
  v27 = v14;
  v28 = v29;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v23);
  ((void (**)(_QWORD, const __CFString *))v15)[2](v15, CFSTR("Visits"));
  ((void (**)(_QWORD, const __CFString *))v15)[2](v15, CFSTR("Tombstones"));
  databaseQueue = self->_databaseQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_6;
  block[3] = &unk_1E4B2BBE0;
  v20 = v14;
  v21 = v7;
  v22 = v29;
  v17 = v14;
  v18 = v7;
  dispatch_group_notify(v12, databaseQueue, block);

  _Block_object_dispose(v29, 8);
}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95018]), "initWithRecordType:predicate:", v4, *(_QWORD *)(a1 + 40));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95030]), "initWithQuery:", v5);
  objc_msgSend(v6, "setZoneID:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E4B2BA10;
  v8 = *(void **)(a1 + 56);
  v14 = *(id *)(a1 + 48);
  v15 = v8;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_4;
  v10[3] = &unk_1E4B2BB90;
  v9 = *(_QWORD *)(a1 + 64);
  v10[4] = *(_QWORD *)(a1 + 48);
  v12 = v9;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v14, "_fetchAllRecordsWithQueryOperation:enumerationBlock:completionBlock:", v6, v13, v10);

}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E4B2A5F8;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendRecord:usingConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_5;
  block[3] = &unk_1E4B2BB68;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_5(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (BOOL)useManateeContainer
{
  return self->_useManateeContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_cloudKitOperationQueue, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
}

void __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to save Visits record: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)_recordWithCloudHistoryVisits:(uint64_t)a3 profileServerIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Couldn't serialize data for Visits record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_recordWithHistoryTombstones:(uint64_t)a3 version:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Couldn't serialize data for Tombstones record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a3, (uint64_t)a3, "Failed to decode server change token with exception: %{public}@", (uint8_t *)a2);

}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a3, (uint64_t)a3, "Failed to read from server change token data: %{public}@", (uint8_t *)a2);

}

void __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to archive server change token: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)_recordDataForDictionary:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to serialize dictionary: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __40__WBSCloudHistoryStore__resetRecordZone__block_invoke_47_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Resetting Cloud History record zone failed: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Number of device in sync circle is 0", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
