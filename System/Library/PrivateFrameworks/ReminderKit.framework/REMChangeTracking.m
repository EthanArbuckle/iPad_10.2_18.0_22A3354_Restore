@implementation REMChangeTracking

+ (id)entityNamesToIncludeFromTrackingWithOptionProvider:(Class)a3
{
  return (id)-[objc_class entityNamesToIncludeFromTracking](a3, "entityNamesToIncludeFromTracking");
}

+ (id)internalTransactionAuthorKeysToExclude
{
  if (internalTransactionAuthorKeysToExclude_onceTokenAuthorExclude != -1)
    dispatch_once(&internalTransactionAuthorKeysToExclude_onceTokenAuthorExclude, &__block_literal_global_10);
  return (id)internalTransactionAuthorKeysToExclude_defaultAuthorsToExclude;
}

void __59__REMChangeTracking_internalTransactionAuthorKeysToExclude__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D0C4B0], CFSTR("com.apple.remindd.RDStoreController.defaultValuesMigration"), CFSTR("com.apple.remindd.RDStoreController.JSONPropertiesMigration"), CFSTR("com.apple.remindd.RDStoreController.CKParentReminderIdentifierMigration"), CFSTR("com.apple.remindd.RDStoreController.OrphanedListMigration"), CFSTR("com.apple.RDStoreController.deleteAccountStore"), CFSTR("com.apple.remindd.RDDisplayDateUpdater"), CFSTR("com.apple.remindd.notificationConsumer.lastBannerPresentationDate"), CFSTR("com.apple.remindd.todayEngine.notification.lastBannerPresentationDate"), CFSTR("com.apple.remindd.ICCloudContext.internal"), CFSTR("com.apple.remindd.ICCloudContext.serverChangeToken"), CFSTR("com.apple.remindd.RDHashtagLabelUpdater.author"), CFSTR("com.apple.remindd.RDTemplateOperation.author"), CFSTR("com.apple.remindd.RDGroceryOperation.author"), CFSTR("com.apple.remindd.RDSharedInlineTagAutoConvertEngine.author"), CFSTR("com.apple.remindd.RDSyncActivityNotificationEngine.author"), CFSTR("com.apple.remindd.RDStagedLightweightMigrationAuthor.author"),
    CFSTR("RDStoreControllerUnsetCKDirtyFlagsInNonCKAccountsMigrationAuthor"),
    CFSTR("com.apple.remindd.RDStoreController.IsPinnedByCurrentUserMigrationAuthor"),
    CFSTR("com.apple.remindd.RDStoreController.MostRecentTargetTemplateIdentifierByCurrentUserMigrationAuthor"),
    CFSTR("com.apple.remindd.RDStoreController.RemoveObsoleteDueDateDeltasMigrationAuthor"),
    CFSTR("com.apple.remindd.RDStalePinnedListsEventHandler.author"),
    CFSTR("com.apple.remindd.RDStaleSharedToMeListMostRecentTargetTemplateIdentifierByCurrentUserEventHandler.author"),
    CFSTR("RDStoreController.DeduplicationActivityAuthor"),
    CFSTR("RDStoreController.SuggestConversionToGroceryListActivityAuthor"),
    CFSTR("com.apple.remindd.RDStoreController.UpdateAlternativeDueDatesOfCalDavRemindersMigrationAuthor"),
    CFSTR("RDStoreController.BatchDeleteExpiredRemindersActivityAuthor"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)internalTransactionAuthorKeysToExclude_defaultAuthorsToExclude;
  internalTransactionAuthorKeysToExclude_defaultAuthorsToExclude = v0;

}

+ (id)defaultTransactionAuthorKeysToExclude
{
  if (defaultTransactionAuthorKeysToExclude_onceTokenAuthorExclude != -1)
    dispatch_once(&defaultTransactionAuthorKeysToExclude_onceTokenAuthorExclude, &__block_literal_global_1);
  return (id)defaultTransactionAuthorKeysToExclude_defaultAuthorsToExclude;
}

void __58__REMChangeTracking_defaultTransactionAuthorKeysToExclude__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[REMChangeTracking internalTransactionAuthorKeysToExclude](REMChangeTracking, "internalTransactionAuthorKeysToExclude");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("com.apple.remindd.dataaccess.REMSaveRequest.author"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)defaultTransactionAuthorKeysToExclude_defaultAuthorsToExclude;
  defaultTransactionAuthorKeysToExclude_defaultAuthorsToExclude = v1;

}

+ (id)lastTransactionTimestampWithManagedObjectContext:(id)a3 affectedStores:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke;
  v14[3] = &unk_1E67F92E8;
  v7 = v5;
  v15 = v7;
  v8 = v6;
  v16 = v8;
  v17 = &v18;
  objc_msgSend(v7, "performBlockAndWait:", v14);
  v9 = (void *)v19[5];
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v19[5];
    v19[5] = v10;

    v9 = (void *)v19[5];
  }
  v12 = v9;

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersistentHistoryTokenFromStores:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryTransactionForToken:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v19 = 0;
    objc_msgSend(v5, "executeRequest:error:", v4, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9)
    {
      objc_msgSend(v6, "result");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      -[NSObject lastObject](v10, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      REMCheckedDynamicCast(v11, (uint64_t)v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_opt_class();
      objc_msgSend(v13, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      REMCheckedDynamicCast(v14, (uint64_t)v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
    else
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_2();
    }

  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_1((uint64_t *)(a1 + 40), v4);
  }

}

- (REMChangeTracking)initWithClientID:(id)a3 daemonController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  REMChangeTracking *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultTransactionAuthorKeysToExclude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMChangeTracking initWithClientID:daemonController:transactionAuthorKeysToExclude:](self, "initWithClientID:daemonController:transactionAuthorKeysToExclude:", v7, v6, v8);

  return v9;
}

- (REMChangeTracking)initWithClientID:(id)a3 daemonController:(id)a4 transactionAuthorKeysToExclude:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMChangeTracking *v12;
  REMChangeTracking *v13;
  NSArray *entityNames;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)REMChangeTracking;
  v12 = -[REMChangeTracking init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changeTrackingClientID, a3);
    objc_storeStrong((id *)&v13->_daemonController, a4);
    objc_storeStrong((id *)&v13->_transactionAuthorKeysToExclude, a5);
    entityNames = v13->_entityNames;
    v13->_entityNames = 0;
    v13->_transactionFetchLimit = 0;

  }
  return v13;
}

- (id)currentChangeTokenForAllAccountsWithError:(id *)a3
{
  id v4;
  _QWORD v6[5];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke;
  v7[3] = &unk_1E67F9338;
  v7[4] = &v14;
  v7[5] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_3;
  v6[3] = &unk_1E67F8490;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("currentChangeTokenForAllAccounts"), v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

uint64_t __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_2;
  v3[3] = &unk_1E67F9310;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "currentChangeToken:", v3);
}

void __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 11);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

}

void __63__REMChangeTracking_currentChangeTokenForAllAccountsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)currentChangeTokenForAccountTypes:(int64_t)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[5];
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke;
  v8[3] = &unk_1E67F9388;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = &v15;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_3;
  v7[3] = &unk_1E67F8490;
  v7[4] = &v9;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("currentChangeTokenForAccountTypes"), v8, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  v5 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v5;
}

uint64_t __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *, void *);
  void *v7;
  __int128 v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 48);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_2;
  v7 = &unk_1E67F9360;
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v2;
  return objc_msgSend(a2, "currentChangeTokenForAccountTypes:completion:");
}

void __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = a2;
  v14 = v3;
  if (v3)
  {
    v4 = *(_QWORD *)(a1[4] + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("types=%@"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithREMChangeErrorCode:debugDescription:", 11, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

void __61__REMChangeTracking_currentChangeTokenForAccountTypes_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)currentChangeTokenWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = objc_opt_class();
  -[REMChangeTracking changeTrackingClientID](self, "changeTrackingClientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  REMCheckedDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__REMChangeTracking_currentChangeTokenWithError___block_invoke;
  v13[3] = &unk_1E67F93D8;
  v9 = v7;
  v14 = v9;
  v15 = &v23;
  v16 = &v17;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_3;
  v12[3] = &unk_1E67F8490;
  v12[4] = &v17;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("currentChangeToken"), v13, v12);
  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v10 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __49__REMChangeTracking_currentChangeTokenWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_2;
  v8[3] = &unk_1E67F93B0;
  v10 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v4, "currentChangeTokenForAccountID:completion:", v5, v8);

}

void __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  v13 = v3;
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("accountIdentifier=%@"), v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithREMChangeErrorCode:debugDescription:", 11, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __49__REMChangeTracking_currentChangeTokenWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)earliestChangeTokenWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = objc_opt_class();
  -[REMChangeTracking changeTrackingClientID](self, "changeTrackingClientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  REMCheckedDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke;
  v13[3] = &unk_1E67F93D8;
  v9 = v7;
  v14 = v9;
  v15 = &v23;
  v16 = &v17;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_3;
  v12[3] = &unk_1E67F8490;
  v12[4] = &v17;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("earliestChangeToken"), v13, v12);
  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v10 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_2;
  v8[3] = &unk_1E67F93B0;
  v10 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v4, "earliestChangeTokenForAccountID:completion:", v5, v8);

}

void __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  v13 = v3;
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("accountIdentifier=%@"), v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithREMChangeErrorCode:debugDescription:", 11, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __50__REMChangeTracking_earliestChangeTokenWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getTrackingStateWithError:(id *)a3
{
  id v4;
  _QWORD v6[5];
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__REMChangeTracking_getTrackingStateWithError___block_invoke;
  v7[3] = &unk_1E67F93D8;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__REMChangeTracking_getTrackingStateWithError___block_invoke_3;
  v6[3] = &unk_1E67F8490;
  v6[4] = &v8;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("getTrackingState"), v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __47__REMChangeTracking_getTrackingStateWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "changeTrackingClientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__REMChangeTracking_getTrackingStateWithError___block_invoke_2;
  v6[3] = &unk_1E67F9400;
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "getTrackingStateWithClientID:completion:", v5, v6);

}

void __47__REMChangeTracking_getTrackingStateWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __47__REMChangeTracking_getTrackingStateWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)saveTrackingState:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  REMChangeTracking *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__REMChangeTracking_saveTrackingState_error___block_invoke;
  v10[3] = &unk_1E67F9428;
  v8 = v6;
  v11 = v8;
  v12 = self;
  v13 = &v14;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __45__REMChangeTracking_saveTrackingState_error___block_invoke_3;
  v9[3] = &unk_1E67F8490;
  v9[4] = &v14;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("saveTrackingState"), v10, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);

  _Block_object_dispose(&v14, 8);
}

void __45__REMChangeTracking_saveTrackingState_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "changeTrackingClientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__REMChangeTracking_saveTrackingState_error___block_invoke_2;
  v7[3] = &unk_1E67F8490;
  v7[4] = a1[6];
  objc_msgSend(v5, "saveTrackingState:withClientID:completionHandler:", v3, v6, v7);

}

void __45__REMChangeTracking_saveTrackingState_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__REMChangeTracking_saveTrackingState_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchHistoryAfterToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  REMChangeTracking *v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
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

  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5;
  v42 = __Block_byref_object_dispose__5;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  v37 = 0;
  -[REMChangeTracking entityNames](self, "entityNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = 0;
  else
    v8 = -[REMChangeTracking transactionFetchLimit](self, "transactionFetchLimit");

  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke;
  v26[3] = &unk_1E67F9478;
  v10 = v6;
  v27 = v10;
  v28 = self;
  v29 = &v38;
  v30 = &v32;
  v31 = v8;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_3;
  v25[3] = &unk_1E67F8490;
  v25[4] = &v32;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("fetchHistoryAfterToken"), v26, v25);
  v11 = (void *)v39[5];
  -[REMChangeTracking transactionAuthorKeysToExclude](self, "transactionAuthorKeysToExclude");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consolidateAndFilterChangesWithTransactionAuthors:isExclusion:", v13, 1);

  if (!v39[5])
  {
    if (!v33[5])
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[REMChangeTracking fetchHistoryAfterToken:error:].cold.1((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);

    }
    +[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v39[5];
    v39[5] = v14;

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v33[5]);
  v16 = (id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v16;
}

void __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "entityNames");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = MEMORY[0x1E0C9AA60];
  v9 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_2;
  v10[3] = &unk_1E67F9450;
  v11 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v5, "fetchHistoryAfterToken:entityNames:transactionFetchLimit:completionHandler:", v3, v8, v9, v10);

}

void __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __50__REMChangeTracking_fetchHistoryAfterToken_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchHistoryAfterDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  REMChangeTracking *v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
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

  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5;
  v42 = __Block_byref_object_dispose__5;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  v37 = 0;
  -[REMChangeTracking entityNames](self, "entityNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = 0;
  else
    v8 = -[REMChangeTracking transactionFetchLimit](self, "transactionFetchLimit");

  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke;
  v26[3] = &unk_1E67F9478;
  v10 = v6;
  v27 = v10;
  v28 = self;
  v29 = &v38;
  v30 = &v32;
  v31 = v8;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_3;
  v25[3] = &unk_1E67F8490;
  v25[4] = &v32;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("fetchHistoryAfterDate"), v26, v25);
  v11 = (void *)v39[5];
  -[REMChangeTracking transactionAuthorKeysToExclude](self, "transactionAuthorKeysToExclude");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consolidateAndFilterChangesWithTransactionAuthors:isExclusion:", v13, 1);

  if (!v39[5])
  {
    if (!v33[5])
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[REMChangeTracking fetchHistoryAfterDate:error:].cold.1((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);

    }
    +[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v39[5];
    v39[5] = v14;

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v33[5]);
  v16 = (id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v16;
}

void __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "entityNames");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = MEMORY[0x1E0C9AA60];
  v9 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_2;
  v10[3] = &unk_1E67F9450;
  v11 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v5, "fetchHistoryAfterDate:entityNames:transactionFetchLimit:completionHandler:", v3, v8, v9, v10);

}

void __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __49__REMChangeTracking_fetchHistoryAfterDate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)deleteHistoryBeforeToken:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke;
  v10[3] = &unk_1E67F94A0;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_3;
  v9[3] = &unk_1E67F8490;
  v9[4] = &v13;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("deleteHistoryBeforeToken"), v10, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);

  _Block_object_dispose(&v13, 8);
}

uint64_t __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_2;
  v4[3] = &unk_1E67F8490;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "deleteHistoryBeforeToken:completionHandler:", v2, v4);
}

void __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__REMChangeTracking_deleteHistoryBeforeToken_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)deleteHistoryBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke;
  v10[3] = &unk_1E67F94A0;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_3;
  v9[3] = &unk_1E67F8490;
  v9[4] = &v13;
  -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("deleteHistoryBeforeDate"), v10, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);

  _Block_object_dispose(&v13, 8);
}

uint64_t __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_2;
  v4[3] = &unk_1E67F8490;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "deleteHistoryBeforeDate:completionHandler:", v2, v4);
}

void __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__REMChangeTracking_deleteHistoryBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)persistenceStoreIDForAccountID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[6];
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

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  -[REMChangeTracking daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke;
  v20[3] = &unk_1E67F85C0;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend(v7, "syncDebugPerformerWithReason:errorHandler:", CFSTR("persistenceStoreID"), v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22[5])
  {
    if (!v9)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[REMChangeTracking persistenceStoreIDForAccountID:error:].cold.1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);

    }
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_41;
    v19[3] = &unk_1E67F94C8;
    v19[4] = &v27;
    objc_msgSend(v9, "persistenceStoreIDForAccountID:completion:", v6, v19);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v10 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v10;
}

void __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLog changeTracking](REMLog, "changeTracking");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_41(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_performChangeTrackingWithReason:(id)a3 block:(id)a4 xpcErrorHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  -[REMChangeTracking daemonController](self, "daemonController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke;
  v22[3] = &unk_1E67F94F0;
  v22[4] = self;
  v12 = v10;
  v23 = v12;
  v24 = &v25;
  objc_msgSend(v11, "syncChangeTrackingPerformerWithReason:errorHandler:", v8, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26[5])
  {
    if (!v13)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    v9[2](v9, v13);
  }

  _Block_object_dispose(&v25, 8);
}

void __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLog changeTracking](REMLog, "changeTracking");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (REMChangeTrackingClientIdentifying)changeTrackingClientID
{
  return self->_changeTrackingClientID;
}

- (REMDaemonController)daemonController
{
  return self->_daemonController;
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (void)setEntityNames:(id)a3
{
  objc_storeStrong((id *)&self->_entityNames, a3);
}

- (unint64_t)transactionFetchLimit
{
  return self->_transactionFetchLimit;
}

- (void)setTransactionFetchLimit:(unint64_t)a3
{
  self->_transactionFetchLimit = a3;
}

- (NSSet)transactionAuthorKeysToExclude
{
  return self->_transactionAuthorKeysToExclude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAuthorKeysToExclude, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_changeTrackingClientID, 0);
}

- (id)fetchAuxiliaryChangeInfosOfType:(Class)a3 withChangeObject:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  id v64;
  void *v66;
  id obj;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  _QWORD v82[4];
  id v83;
  _BYTE *v84;
  uint64_t *v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t v100[128];
  uint8_t v101[4];
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  uint64_t v106;
  _BYTE buf[24];
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v64 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v64);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v64, "isCoalesced"))
  {
    objc_msgSend(v64, "coalescedChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        -[REMChangeTracking(REMAuxiliaryChangeInfoAdditions) fetchAuxiliaryChangeInfosOfType:withChangeObject:error:].cold.1(v53, v54, v55, v56, v57, v58, v59, v60);

    }
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  -[objc_class cdEntityName](a3, "cdEntityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v5;
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
  if (v70)
  {
    v68 = *(id *)v97;
    do
    {
      v9 = 0;
      do
      {
        if (*(id *)v97 != v68)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v72 = v9;
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v9), "transaction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "changes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v93;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v93 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v16);
              if (!objc_msgSend(v17, "changeType"))
              {
                objc_msgSend(v17, "changedObjectID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  objc_msgSend(v17, "changedObjectID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "entityName");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isEqual:", v8);

                  if (v21)
                  {
                    objc_msgSend(v17, "changedObjectID");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "addObject:", v22);

                    objc_msgSend(v17, "changedObjectID");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "setObject:forKey:", v17, v23);

                  }
                }
              }
              ++v16;
            }
            while (v14 != v16);
            v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
            v14 = v24;
          }
          while (v24);
        }

        v9 = v72 + 1;
      }
      while (v72 + 1 != v70);
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
    }
    while (v70);
  }

  +[REMAuxiliaryChangeInfoFetchResult auxiliaryChangeInfoFetchResultOfType:](REMAuxiliaryChangeInfoFetchResult, "auxiliaryChangeInfoFetchResultOfType:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v74, "count") == 0;
  +[REMLog changeTracking](REMLog, "changeTracking");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v64;
      _os_log_impl(&dword_1B4A39000, v27, OS_LOG_TYPE_INFO, "No auxiliary change info object IDs found with change object {changeObject: %@}", buf, 0xCu);
    }

    v34 = v25;
  }
  else
  {
    if (v28)
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v74;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v64;
      _os_log_impl(&dword_1B4A39000, v27, OS_LOG_TYPE_INFO, "Auxiliary change info object IDs to fetch {objectIDs: %{public}@, changeObject: %@}", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v108 = __Block_byref_object_copy__5;
    v109 = __Block_byref_object_dispose__5;
    v110 = 0;
    v86 = 0;
    v87 = (id *)&v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__5;
    v90 = __Block_byref_object_dispose__5;
    v91 = 0;
    v29 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke;
    v82[3] = &unk_1E67F93D8;
    v30 = v74;
    v83 = v30;
    v84 = buf;
    v85 = &v86;
    v81[0] = v29;
    v81[1] = 3221225472;
    v81[2] = __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_3;
    v81[3] = &unk_1E67F8490;
    v81[4] = &v86;
    -[REMChangeTracking _performChangeTrackingWithReason:block:xpcErrorHandler:](self, "_performChangeTrackingWithReason:block:xpcErrorHandler:", CFSTR("fetchAuxiliaryChangeInfo"), v82, v81);
    if (v87[5] || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v25;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v87[5], "localizedDescription");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v101 = 138543874;
        v102 = v52;
        v103 = 2112;
        v104 = v64;
        v105 = 2114;
        v106 = (uint64_t)v30;
        _os_log_error_impl(&dword_1B4A39000, v31, OS_LOG_TYPE_ERROR, "Daemon returned error for auxiliary change info fetch with {error: %{public}@, changeObject: %@, auxChgInfoIds: %{public}@}", v101, 0x20u);

      }
      v33 = v32;
      v73 = 0;
    }
    else
    {
      v73 = v25;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v69 = v30;
      v35 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v77, v100, 16);
      if (v35)
      {
        v71 = *(_QWORD *)v78;
        *(_QWORD *)&v36 = 138543362;
        v61 = v36;
        do
        {
          v37 = v35;
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v78 != v71)
              objc_enumerationMutation(v69);
            v39 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            objc_msgSend(v75, "objectForKeyedSubscript:", v39, v61);
            v40 = objc_claimAutoreleasedReturnValue();
            if (!v40)
            {
              +[REMLog changeTracking](REMLog, "changeTracking");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v101 = v61;
                v102 = v39;
                _os_log_fault_impl(&dword_1B4A39000, v49, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!changeObject) -- ERROR changeObjectsMap lost track of {auxiliaryChangeInfoObjectID: %{public}@}", v101, 0xCu);
              }

            }
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v41)
            {
              +[REMLog changeTracking](REMLog, "changeTracking");
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v101 = v61;
                v102 = v39;
                _os_log_fault_impl(&dword_1B4A39000, v50, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!data) -- ERROR XPC returned a mapOfData that has no data entry for {auxiliaryChangeInfoObjectID: %{public}@}", v101, 0xCu);
              }

            }
            v76 = 0;
            v42 = (void *)v40;
            objc_msgSend(v73, "auxiliaryChangeInfoFromData:withObjectID:fromChangeObject:error:", v41, v39, v40, &v76);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v76;
            v45 = v76;
            if (v45 || !v43)
            {
              +[REMLog changeTracking](REMLog, "changeTracking");
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v45, "localizedDescription");
                v47 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v101 = 138412802;
                v102 = v42;
                v103 = 2114;
                v104 = v39;
                v105 = 2114;
                v106 = v47;
                v48 = (void *)v47;
                _os_log_error_impl(&dword_1B4A39000, v46, OS_LOG_TYPE_ERROR, "Failed to decode one of the change infos data for {changeObject: %@, objectID: %{public}@, decodeError: %{public}@}", v101, 0x20u);

              }
              objc_storeStrong(v87 + 5, v44);
            }
            else
            {
              objc_msgSend(v66, "addObject:", v43);
            }

          }
          v35 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v77, v100, 16);
        }
        while (v35);
      }

      objc_msgSend(v73, "setAuxiliaryChangeInfos:", v66);
      v33 = v66;
    }

    if (a5)
      *a5 = objc_retainAutorelease(v87[5]);
    v34 = v73;

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(buf, 8);

  }
  return v34;
}

uint64_t __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_2;
  v4[3] = &unk_1E67F89E8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "fetchAuxiliaryChangeInfos:completionHandler:", v2, v4);
}

void __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __109__REMChangeTracking_REMAuxiliaryChangeInfoAdditions__fetchAuxiliaryChangeInfosOfType_withChangeObject_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "+[lastTransactionTimestampWithManagedObjectContext:affectedStores:] Failed to obtain current PHT token {affectedsStores: %@}", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3_1();
}

void __85__REMChangeTracking_lastTransactionTimestampWithManagedObjectContext_affectedStores___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "+[lastTransactionTimestampWithManagedObjectContext:affectedStores:] Failed to fetch history {error: %{public}@, affectedsStores: %@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)fetchHistoryAfterToken:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "rem_log_fault_if (!error) -- Daemon returned nil result and error for persistentHistoryFetch {token: %{public}@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)fetchHistoryAfterDate:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "rem_log_fault_if (!error) -- Daemon returned nil result and error for persistentHistoryFetch {date: %{public}@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)persistenceStoreIDForAccountID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "rem_log_fault_if (!debugPerformer) -- Failed to get debugPerformer fetching persistentStoreID {accountID: %{public}@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

void __58__REMChangeTracking_persistenceStoreIDForAccountID_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "xpc error while using debug performer {error: %{public}@, store: %@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)_performChangeTrackingWithReason:(uint64_t)a3 block:(uint64_t)a4 xpcErrorHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "rem_log_fault_if (!changeTrackingPerformer) -- Returned nil for both error and changeTrackingPerformer", a5, a6, a7, a8, 0);
}

void __76__REMChangeTracking__performChangeTrackingWithReason_block_xpcErrorHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "xpc error while using changeTracking performer {error: %{public}@, store: %@}");
  OUTLINED_FUNCTION_3_1();
}

@end
