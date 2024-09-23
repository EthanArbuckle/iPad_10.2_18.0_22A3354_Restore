@implementation WFDatabase

- (id)descriptorsForFetchOperation:(id)a3 state:(id *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  WFDatabase *v38;
  void *v39;
  id *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  getWFDatabaseLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  getWFDatabaseLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v8;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GetDescriptors", "operation=%{signpost.description:attribute}@", buf, 0xCu);
  }

  -[WFDatabase context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultsWithContext:error:", v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  getWFDatabaseLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v16, OS_SIGNPOST_INTERVAL_END, v10, "GetDescriptors", ", buf, 2u);
  }

  if (v14)
  {
    v38 = self;
    v40 = a4;
    v42 = v8;
    objc_msgSend(v8, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "relationshipsByName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (id)objc_opt_new();
    v18 = (void *)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v39 = v14;
    v19 = v14;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v49 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v25 = (void *)MEMORY[0x1C3BB3598]();
          objc_msgSend(v24, "descriptor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_opt_class();
          WFEnforceClass(v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v24, "objectID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v29);

            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __55__WFDatabase_descriptorsForFetchOperation_state_error___block_invoke;
            v44[3] = &unk_1E7AF2D38;
            v45 = v42;
            v46 = v18;
            v47 = v24;
            objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v44);
            objc_msgSend(v43, "addObject:", v28);

          }
          objc_autoreleasePoolPop(v25);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v21);
    }

    v8 = v42;
    objc_msgSend(v42, "entity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = WFDatabaseObjectTypeForEntityName(v31);

    -[WFDatabase context](v38, "context");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    WFDescriptorsForObjectIDs(v18, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_alloc(MEMORY[0x1E0DC7AB0]);
    v36 = v34;
    if (!v34)
      v36 = (void *)objc_opt_new();
    *v40 = (id)objc_msgSend(v35, "initWithObjectType:state:", v32, v36);
    if (!v34)

    v14 = v39;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

void __55__WFDatabase_descriptorsForFetchOperation_state_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relationshipKeysAffectingDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v9);

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectIDsForRelationshipNamed:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

  }
}

- (unint64_t)countForResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  WFDatabase *v14;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __29__WFDatabase_countForResult___block_invoke;
    v12 = &unk_1E7AF9350;
    v13 = v4;
    v14 = self;
    v5 = v4;
    -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting count for result"), &v9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue", v9, v10, v11, v12);

  }
  else
  {

    objc_msgSend(v4, "descriptors");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "count");
  }

  return v7;
}

- (id)sortedVisibleAppAssociatedWorkflows
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  -[WFDatabase visiblePredicate](self, "visiblePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("associatedAppBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v10);

  -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __45__WFDatabase_startObservingChangesForResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "resultsToNotify");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)resultsToNotify
{
  return self->_resultsToNotify;
}

- (BOOL)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  _QWORD v24[4];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+ShortcutSuggestions.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutSuggestions"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+ShortcutSuggestions.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v13 = MEMORY[0x1E0C809B0];
    v24[3] = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke;
    v23[3] = &unk_1E7AEDF20;
    v23[4] = v24;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke_2;
    v19[3] = &unk_1E7AEDF48;
    v19[4] = self;
    v20 = v11;
    v21 = v12;
    v22 = v24;
    -[WFDatabase performSuggestionsOperationWithBlock:error:](self, "performSuggestionsOperationWithBlock:error:", v19, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    _Block_object_dispose(v24, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __78__WFDatabase_ShortcutSuggestions__performSuggestionsOperationWithBlock_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)MEMORY[0x1C3BB3598]();
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  (*(void (**)(void))(v3 + 16))();
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_autoreleasePoolPop(v2);
}

- (id)performSuggestionsOperationWithBlock:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
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

  v6 = a3;
  v7 = (void *)os_transaction_create();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__16117;
  v26 = __Block_byref_object_dispose__16118;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__16117;
  v20 = __Block_byref_object_dispose__16118;
  v21 = 0;
  -[WFDatabase suggestionsContext](self, "suggestionsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__WFDatabase_ShortcutSuggestions__performSuggestionsOperationWithBlock_error___block_invoke;
  v12[3] = &unk_1E7AEDFE0;
  v14 = &v22;
  v9 = v6;
  v13 = v9;
  v15 = &v16;
  objc_msgSend(v8, "performBlockAndWait:", v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

id __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  VCVoiceShortcutSuggestionListManagedObject *v4;
  void *v5;
  VCVoiceShortcutSuggestionListManagedObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = [VCVoiceShortcutSuggestionListManagedObject alloc];
  objc_msgSend(*(id *)(a1 + 32), "suggestionsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCVoiceShortcutSuggestionListManagedObject initWithContext:](v4, "initWithContext:", v5);

  -[VCVoiceShortcutSuggestionListManagedObject setAssociatedAppBundleIdentifier:](v6, "setAssociatedAppBundleIdentifier:", *(_QWORD *)(a1 + 40));
  -[VCVoiceShortcutSuggestionListManagedObject setSerializedSuggestions:](v6, "setSerializedSuggestions:", *(_QWORD *)(a1 + 48));
  -[VCVoiceShortcutSuggestionListManagedObject setShortcutAvailabilityOptions:](v6, "setShortcutAvailabilityOptions:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "suggestionsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:", v6);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "suggestionsContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "saveContextOrRollback:error:", v9, a2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSManagedObjectContext)suggestionsContext
{
  return self->_suggestionsContext;
}

uint64_t __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "wf_shortcutAvailability");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (id)mostRunOrLatestImportedVisibleShortcut
{
  NSObject *v3;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFTipsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WFDatabase(TipKit) mostRunOrLatestImportedVisibleShortcut]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Fetching the most run or the latest imported shortcut.", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke;
  v5[3] = &unk_1E7AEB900;
  v5[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting most run/latest imported shortcut"), v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (WFDatabase)defaultDatabase
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&WFDefaultDatabaseLock);
  v2 = (id)_defaultDatabase;
  os_unfair_lock_unlock((os_unfair_lock_t)&WFDefaultDatabaseLock);
  return (WFDatabase *)v2;
}

- (void)addObjectObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  void *v6;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[WFDatabase observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)clearTombstonesAndSyncState
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[WFDatabase context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__WFDatabase_Sync__clearTombstonesAndSyncState__block_invoke;
  v7[3] = &unk_1E7AF93C8;
  v7[4] = self;
  v8 = v3;
  v4 = v3;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("clear tombstones and sync state"), v7, &v6);
  v5 = v6;

}

- (id)descriptorsForCoreDataResult:(id)a3 state:(id *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__38009;
  v19 = __Block_byref_object_dispose__38010;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__WFDatabase_descriptorsForCoreDataResult_state_error___block_invoke;
  v12[3] = &unk_1E7AF2D60;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v14 = &v15;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting descriptors for result"), v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_retainAutorelease((id)v16[5]);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)performTransactionWithReason:(id)a3 block:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a4;
  if (!a3)
    a3 = CFSTR("transaction");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__WFDatabase_performTransactionWithReason_block_error___block_invoke;
  v11[3] = &unk_1E7AF2B90;
  v12 = v8;
  v10 = v8;
  v9 = -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", a3, v11, a5);

}

- (id)performSaveOperationWithReason:(id)a3 block:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  if (!a3)
    a3 = CFSTR("save");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__WFDatabase_performSaveOperationWithReason_block_error___block_invoke;
  v12[3] = &unk_1E7AF2BE0;
  v12[4] = self;
  v13 = v8;
  v9 = v8;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__WFDatabase_performOperationWithReason_block_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;

  v2 = (void *)MEMORY[0x1C3BB3598]();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  (*(void (**)(void))(v3 + 16))();
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "transactionCount") <= 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

  }
}

- (id)performOperationWithReason:(id)a3 block:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t v22[16];
  _QWORD v23[5];
  id v24;
  __int128 *p_buf;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = (void *)os_transaction_create();
  getWFDatabaseLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  getWFDatabaseLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = CFSTR("none");
    if (v8)
      v15 = v8;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CoreDataOperation", "reason=%{signpost.description:attribute}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__38009;
  v36 = __Block_byref_object_dispose__38010;
  v37 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__38009;
  v31 = __Block_byref_object_dispose__38010;
  v32 = 0;
  -[WFDatabase context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__WFDatabase_performOperationWithReason_block_error___block_invoke;
  v23[3] = &unk_1E7AF2BB8;
  p_buf = &buf;
  v17 = v9;
  v26 = &v27;
  v23[4] = self;
  v24 = v17;
  objc_msgSend(v16, "performBlockAndWait:", v23);

  if (a5)
    *a5 = objc_retainAutorelease((id)v28[5]);
  getWFDatabaseLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v19, OS_SIGNPOST_INTERVAL_END, v12, "CoreDataOperation", ", v22, 2u);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  return v20;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

id __57__WFDatabase_performSaveOperationWithReason_block_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") + 1);
  v4 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  (*(void (**)(void))(v4 + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") - 1);
  if (objc_msgSend(*(id *)(a1 + 32), "transactionCount") <= 0)
  {
    if (v6
      || (objc_msgSend(*(id *)(a1 + 32), "context"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = 0,
          objc_msgSend(v7, "save:", &v11),
          v6 = v11,
          v7,
          v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rollback");

    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reset");

  }
  if (a2 && v6)
    *a2 = objc_retainAutorelease(v6);

  return v5;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

uint64_t __55__WFDatabase_performTransactionWithReason_block_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

id __29__WFDatabase_countForResult___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "fetchOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "countWithContext:error:", v6, a2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __55__WFDatabase_descriptorsForCoreDataResult_state_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id obj;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fetchOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "descriptorsForFetchOperation:state:error:", v5, &obj, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  return v7;
}

uint64_t __82__WFDatabase_initWithStoreDescription_runMigrationsIfNecessary_useLockFile_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reloadLibrary");
  objc_msgSend(*(id *)(a1 + 32), "addActionCountsToShortcutsIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "addSyncHashesToShortcutsIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "removeRunEventsWithoutAssociatedShortcuts");
  objc_msgSend(*(id *)(a1 + 32), "markTriggersAsRunAfterConfirmationIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "updateWalrusStatus");
}

void __56__WFDatabase_markTriggersAsRunAfterConfirmationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[WFCoreDataTrigger fetchRequest](WFCoreDataTrigger, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NO"), CFSTR("shouldPrompt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = v4;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1C3BB3598]();
          objc_msgSend(v13, "data");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFTrigger triggerWithSerializedData:](WFTrigger, "triggerWithSerializedData:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically") & 1) == 0)
            objc_msgSend(v13, "setShouldPrompt:", 1);

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v4 = v17;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __55__WFDatabase_removeRunEventsWithoutAssociatedShortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = nil"), CFSTR("shortcut"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeRequest:error:", v5, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 != 0;

}

void __51__WFDatabase_addActionCountsToShortcutsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  const __CFString *v24;
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("actionCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v25[0] = CFSTR("actionCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v6);

  v24 = CFSTR("actions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", v7);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v4, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1C3BB3598]();
          if (!objc_msgSend(v15, "actionCount"))
          {
            objc_msgSend(v15, "deserializedActions");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (v18 >= 1)
              objc_msgSend(v15, "setActionCount:", v18);
          }
          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __49__WFDatabase_addSyncHashesToShortcutsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = nil"), CFSTR("syncHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1C3BB3598]();
          objc_msgSend(v13, "setSyncHash:", objc_msgSend(v13, "computedSyncHash"));
          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __47__WFDatabase_Sync__clearTombstonesAndSyncState__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  char v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  char v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *context;
  void *contexta;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  _QWORD v82[7];
  _QWORD v83[7];
  _QWORD v84[2];
  _QWORD v85[2];
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  id v89;
  _BYTE v90[128];
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BB3598]();
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tombstonedShortcutsPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(v3, "setIncludesPropertyValues:", 0);
  v91[0] = CFSTR("actions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelationshipKeyPathsForPrefetching:", v5);

  objc_msgSend(v3, "setFetchLimit:", 50);
  v6 = *(void **)(a1 + 40);
  v81 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v3, &v81);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v81;
  if (objc_msgSend(v7, "count"))
  {
    do
    {
      v9 = (void *)MEMORY[0x1C3BB3598]();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v78 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1C3BB3598]();
            objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v15);
            objc_autoreleasePoolPop(v16);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
        }
        while (v12);
      }

      objc_msgSend(v3, "setFetchOffset:", objc_msgSend(v3, "fetchOffset") + objc_msgSend(v3, "fetchLimit"));
      v17 = *(void **)(a1 + 40);
      v76 = v8;
      objc_msgSend(v17, "executeFetchRequest:error:", v3, &v76);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v76;

      objc_autoreleasePoolPop(v9);
      v8 = v18;
    }
    while (objc_msgSend(v7, "count"));
  }
  else
  {
    v18 = v8;
  }

  objc_autoreleasePoolPop(context);
  v19 = (void *)MEMORY[0x1C3BB3598]();
  +[WFCoreDataCollection fetchRequest](WFCoreDataCollection, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("tombstoned"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v20);
  v23 = *(void **)(a1 + 40);
  v75 = v18;
  objc_msgSend(v23, "executeRequest:error:", v22, &v75);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v75;

  objc_msgSend(v24, "result");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  v29 = objc_msgSend(v28, "BOOLValue");
  if ((v29 & 1) == 0)
  {
    getWFDatabaseLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[WFDatabase(Sync) clearTombstonesAndSyncState]_block_invoke";
      v88 = 2114;
      v89 = v25;
      _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_ERROR, "%s Failed to perform batch deletion of tombstoned folders: %{public}@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(v19);
  v31 = (void *)MEMORY[0x1C3BB3598]();
  v32 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[WFCoreDataWorkflow entity](WFCoreDataWorkflow, "entity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithEntity:", v33);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPredicate:", v35);

  v84[0] = CFSTR("cloudKitRecordMetadata");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = CFSTR("lastSyncedHash");
  v85[0] = v36;
  v85[1] = &unk_1E7B8B4E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPropertiesToUpdate:", v37);

  v38 = *(void **)(a1 + 40);
  v74 = v25;
  objc_msgSend(v38, "executeRequest:error:", v34, &v74);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v74;

  objc_msgSend(v39, "result");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
  }
  else
  {
    v42 = 0;
  }
  v43 = v42;

  v44 = objc_msgSend(v43, "BOOLValue");
  if ((v44 & 1) == 0)
  {
    getWFDatabaseLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[WFDatabase(Sync) clearTombstonesAndSyncState]_block_invoke";
      v88 = 2114;
      v89 = v40;
      _os_log_impl(&dword_1C15B3000, v45, OS_LOG_TYPE_ERROR, "%s Failed to perform batch reset of sync state on all workflows: %{public}@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(v31);
  contexta = (void *)MEMORY[0x1C3BB3598]();
  v46 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[WFCoreDataCollection entity](WFCoreDataCollection, "entity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v46, "initWithEntity:", v47);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPredicate:", v49);

  v82[0] = CFSTR("cloudKitFolderRecordMetadata");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v50;
  v82[1] = CFSTR("cloudKitOrderingRecordMetadata");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v51;
  v82[2] = CFSTR("lastRemoteCollectionOrderingData");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v52;
  v82[3] = CFSTR("lastRemoteCollectionOrderingSubsetData");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v53;
  v82[4] = CFSTR("lastRemoteShortcutOrderingData");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v83[4] = v54;
  v82[5] = CFSTR("lastRemoteShortcutOrderingSubsetData");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = CFSTR("lastSyncedHash");
  v83[5] = v55;
  v83[6] = &unk_1E7B8B4E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 7);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPropertiesToUpdate:", v56);

  v57 = *(void **)(a1 + 40);
  v73 = v40;
  objc_msgSend(v57, "executeRequest:error:", v48, &v73);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v73;

  objc_msgSend(v58, "result");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v61 = v60;
    else
      v61 = 0;
  }
  else
  {
    v61 = 0;
  }
  v62 = v61;

  v63 = objc_msgSend(v62, "BOOLValue");
  if ((v63 & 1) == 0)
  {
    getWFDatabaseLogObject();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[WFDatabase(Sync) clearTombstonesAndSyncState]_block_invoke";
      v88 = 2114;
      v89 = v59;
      _os_log_impl(&dword_1C15B3000, v64, OS_LOG_TYPE_ERROR, "%s Failed to perform batch reset of sync state on all collections: %{public}@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(contexta);
  v65 = *(void **)(a1 + 32);
  v72 = v59;
  objc_msgSend(v65, "_syncTokenWithError:", &v72);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v72;

  if (v66)
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v66);
  v68 = objc_retainAutorelease(v67);
  *a2 = v68;

}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void (**v31)(void);
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  int64_t v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[4];
  os_activity_scope_state_s v44;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _QWORD v63[6];

  v63[3] = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  v44 = state;
  v31 = (void (**)(void))_Block_copy(aBlock);
  v37 = +[WFCloudKitWorkflow latestEncryptedSchemaVersion](WFCloudKitWorkflow, "latestEncryptedSchemaVersion");
  getWFWalrusLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    v48 = 2048;
    v49 = v37;
    v50 = 2112;
    v51 = (uint64_t)v5;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s Looks like we want Walrus schema version %lld for %@", buf, 0x20u);

  }
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFetchBatchSize:", *(_QWORD *)(a1 + 64));
  v63[0] = CFSTR("wantedEncryptedSchemaVersion");
  v63[1] = CFSTR("syncHash");
  v63[2] = CFSTR("lastSyncedEncryptedSchemaVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPropertiesToFetch:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lld OR %K = nil"), CFSTR("wantedEncryptedSchemaVersion"), v37, CFSTR("wantedEncryptedSchemaVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPredicate:", v7);

  getWFWalrusLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    v48 = 2112;
    v49 = (int64_t)v10;
    v50 = 2112;
    v51 = (uint64_t)v11;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Running predicate on %@: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeFetchRequest:error:", v33, a2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  getWFWalrusLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v32, "count");
    objc_msgSend(v33, "predicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    v48 = 2112;
    v49 = (int64_t)v15;
    v50 = 2048;
    v51 = v16;
    v52 = 2112;
    v53 = (uint64_t)v17;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEFAULT, "%s Ran predicate on %@, found %ld entities: %@", buf, 0x2Au);

  }
  if (v32)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v32;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v62, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v40;
      v34 = *(_QWORD *)v40;
      do
      {
        v20 = 0;
        v35 = v18;
        do
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1C3BB3598]();
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v23 = objc_msgSend(v21, "wantedEncryptedSchemaVersion");
          v24 = objc_msgSend(v21, "syncHash");
          v25 = objc_msgSend(v21, "lastSyncedEncryptedSchemaVersion");
          objc_msgSend(v21, "setWantedEncryptedSchemaVersion:", v37);
          objc_msgSend(v21, "setSyncHash:", objc_msgSend(v21, "computedSyncHash"));
          getWFWalrusLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_msgSend(v21, "wantedEncryptedSchemaVersion");
            v28 = objc_msgSend(v21, "syncHash");
            v29 = objc_msgSend(v21, "lastSyncedEncryptedSchemaVersion");
            objc_msgSend(v21, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316930;
            v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
            v48 = 2048;
            v49 = v23;
            v50 = 2048;
            v51 = v24;
            v52 = 2048;
            v53 = v25;
            v54 = 2048;
            v55 = v27;
            v56 = 2048;
            v57 = v28;
            v58 = 2048;
            v59 = v29;
            v60 = 2112;
            v61 = v30;
            _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_DEFAULT, "%s Updated workflow <old: wanted schema ver %lld, sync hash %lld, last synced schema ver %lld> <new: wanted schema ver %lld, sync hash %lld, last synced schema ver %lld>: %@", buf, 0x52u);

            v19 = v34;
            v18 = v35;
          }

          objc_autoreleasePoolPop(v22);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v62, 16);
      }
      while (v18);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

  v31[2]();
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2(os_activity_scope_state_s *a1)
{
  os_activity_scope_leave(a1 + 2);
}

- (id)_syncTokenWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataCloudKitSyncToken fetchRequest](WFCoreDataCloudKitSyncToken, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  objc_msgSend(v5, "setFetchLimit:", 1);
  -[WFDatabase context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeFetchRequest:error:", v5, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)removeRunEventsWithoutAssociatedShortcuts
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v4 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__WFDatabase_removeRunEventsWithoutAssociatedShortcuts__block_invoke;
  v5[3] = &unk_1E7AF2DB0;
  v5[4] = self;
  v5[5] = &v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("remove extra run events"), v5, &v4);
  v2 = v4;
  if (!*((_BYTE *)v7 + 24))
  {
    getWFDatabaseLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFDatabase removeRunEventsWithoutAssociatedShortcuts]";
      v12 = 2114;
      v13 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Unable to remove invalid run events: %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v6, 8);
}

- (void)reloadLibrary
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled") & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __27__WFDatabase_reloadLibrary__block_invoke;
    v4[3] = &unk_1E7AF2B60;
    v4[4] = self;
    -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("reload library"), v4, 0);
  }
  else
  {
    getWFCoherenceLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[WFDatabase reloadLibrary]";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Not reloading the library because the feature flag is disabled", buf, 0xCu);
    }

  }
}

- (void)markTriggersAsRunAfterConfirmationIfNeeded
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v4 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__WFDatabase_markTriggersAsRunAfterConfirmationIfNeeded__block_invoke;
  v5[3] = &unk_1E7AF2DB0;
  v5[4] = self;
  v5[5] = &v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("migrate invalid location triggers"), v5, &v4);
  v2 = v4;
  if (!*((_BYTE *)v7 + 24))
  {
    getWFDatabaseLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFDatabase markTriggersAsRunAfterConfirmationIfNeeded]";
      v12 = 2114;
      v13 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Unable to add editable shortcut flag: %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v6, 8);
}

- (void)addSyncHashesToShortcutsIfNecessary
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v4 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__WFDatabase_addSyncHashesToShortcutsIfNecessary__block_invoke;
  v5[3] = &unk_1E7AF2DB0;
  v5[4] = self;
  v5[5] = &v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("add sync hashes"), v5, &v4);
  v2 = v4;
  if (!*((_BYTE *)v7 + 24))
  {
    getWFDatabaseLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFDatabase addSyncHashesToShortcutsIfNecessary]";
      v12 = 2114;
      v13 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Unable to add action counts: %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v6, 8);
}

- (void)addActionCountsToShortcutsIfNecessary
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v4 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__WFDatabase_addActionCountsToShortcutsIfNecessary__block_invoke;
  v5[3] = &unk_1E7AF2DB0;
  v5[4] = self;
  v5[5] = &v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("add action counts"), v5, &v4);
  v2 = v4;
  if (!*((_BYTE *)v7 + 24))
  {
    getWFDatabaseLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFDatabase addActionCountsToShortcutsIfNecessary]";
      v12 = 2114;
      v13 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Unable to add action counts: %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v6, 8);
}

- (void)updateWalrusStatus
{
  os_activity_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  WFDatabase *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  WFDatabase *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v3 = _os_activity_create(&dword_1C15B3000, "database walrus update", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  getWFWalrusLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(&unk_1E7B8D8C8, "componentsJoinedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v39 = "-[WFDatabase(Sync) updateWalrusStatus]";
    v40 = 2112;
    v41 = v5;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Updating Walrus status in the database - per:\n%@", buf, 0x16u);

  }
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke;
  v24[3] = &unk_1E7AEFD08;
  v7 = v3;
  v29 = 5;
  v25 = v7;
  v26 = self;
  v27 = &v34;
  v28 = &v30;
  v23 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("updating walrus schema status for shortcuts"), v24, &v23);
  v8 = v23;
  if (*((_BYTE *)v35 + 24))
  {
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_195;
    v17[3] = &unk_1E7AEFD08;
    v22 = 5;
    v18 = v7;
    v19 = self;
    v20 = &v34;
    v21 = &v30;
    v16 = v8;
    -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("updating walrus schema status for collections"), v17, &v16);
    v9 = v16;

    if (*((_BYTE *)v35 + 24))
    {
      getWFWalrusLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)v31[3];
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFDatabase(Sync) updateWalrusStatus]";
        v40 = 2048;
        v41 = v11;
        v12 = "%s Updated %lu Walrus schema versions.";
        v13 = v10;
        v14 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        _os_log_impl(&dword_1C15B3000, v13, v14, v12, buf, 0x16u);
      }
    }
    else
    {
      getWFWalrusLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFDatabase(Sync) updateWalrusStatus]";
        v40 = 2114;
        v41 = v9;
        v12 = "%s Unable to update wanted schema versions for Walrus: %{public}@";
        v13 = v10;
        v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_11;
      }
    }

    v15 = v18;
    v8 = v9;
    goto LABEL_13;
  }
  getWFWalrusLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[WFDatabase(Sync) updateWalrusStatus]";
    v40 = 2114;
    v41 = v8;
    _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Unable to update wanted schema versions for Walrus: %{public}@", buf, 0x16u);
  }
LABEL_13:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

- (id)sortedVisibleWorkflowsInCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC7E58]);
    v9 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Root"));

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC7E58]);
    v9 = 0;
LABEL_5:
    v10 = (void *)objc_msgSend(v8, "initWithLocation:", v9);
    goto LABEL_10;
  }
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WFWorkflowTypeForCollectionIdentifier(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0DC7E58]);
  v14 = v13;
  if (v12)
  {
    v10 = (void *)objc_msgSend(v13, "initWithWorkflowType:", v12);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v14, "initWithFolderIdentifier:", v15);

  }
LABEL_10:
  -[WFDatabase sortedWorkflowsWithQuery:](self, "sortedWorkflowsWithQuery:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)sortedVisibleFolders
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    +[WFLibraryQuery sortedVisibleFolders](WFLibraryQuery, "sortedVisibleFolders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase collectionResultWithLibraryQuery:](self, "collectionResultWithLibraryQuery:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WFCoreDataCollection descriptorFetchRequest](WFCoreDataCollection, "descriptorFetchRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY parents.identifier == %@ AND %K == NO"), CFSTR("Root"), CFSTR("tombstoned"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v5);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("parents"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSortDescriptors:", v7);

    -[WFDatabase collectionResultWithFetchRequest:](self, "collectionResultWithFetchRequest:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v4;

  return v8;
}

- (id)sortedWorkflowsWithQuery:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WFCoreDataDatabaseResult *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  WFCoreDataDatabaseResult *v17;
  WFCoreDataDatabaseResultConcatFetchRequestOperation *v18;
  uint64_t v19;
  void *v20;
  WFCoreDataDatabaseResultConcatFetchRequestOperation *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    switch(objc_msgSend(v4, "location"))
    {
      case 0:
        v5 = (void *)objc_opt_new();
        -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", CFSTR("Root"), objc_msgSend(v4, "includeTombstonesAndConflicts"), objc_msgSend(v4, "resultsLimit"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[WFDatabase sortedVisibleFolders](self, "sortedVisibleFolders", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "descriptors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", v15, objc_msgSend(v4, "includeTombstonesAndConflicts"), objc_msgSend(v4, "resultsLimit"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v16);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v12);
        }

        v17 = [WFCoreDataDatabaseResult alloc];
        v18 = [WFCoreDataDatabaseResultConcatFetchRequestOperation alloc];
        v19 = objc_msgSend(v4, "resultsLimit");
        -[WFDatabase workflowRelationshipKeysAffectingDescriptors](self, "workflowRelationshipKeysAffectingDescriptors");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation initWithFetchRequests:resultsLimit:relationshipKeysAffectingDescriptors:](v18, "initWithFetchRequests:resultsLimit:relationshipKeysAffectingDescriptors:", v5, v19, v20);
        v7 = -[WFCoreDataDatabaseResult initWithDatabase:fetchOperation:](v17, "initWithDatabase:fetchOperation:", self, v21);

        goto LABEL_18;
      case 1:
        -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", CFSTR("Root"), objc_msgSend(v4, "includeTombstonesAndConflicts"), objc_msgSend(v4, "resultsLimit"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      case 2:
        objc_msgSend(v4, "workflowType");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        WFWorkflowCollectionIdentifierForWorkflowType(v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", v22, objc_msgSend(v4, "includeTombstonesAndConflicts"), objc_msgSend(v4, "resultsLimit"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v23);
        v7 = (WFCoreDataDatabaseResult *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      case 3:
        objc_msgSend(v4, "folderIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", v5, objc_msgSend(v4, "includeTombstonesAndConflicts"), objc_msgSend(v4, "resultsLimit"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v22);
        v7 = (WFCoreDataDatabaseResult *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      default:
        v7 = 0;
        goto LABEL_19;
    }
  }
  +[WFLibraryQuery sortedWorkflowsWithQuery:](WFLibraryQuery, "sortedWorkflowsWithQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v7 = (WFCoreDataDatabaseResult *)v6;
LABEL_18:

LABEL_19:
  return v7;
}

- (id)collectionResultWithFetchRequest:(id)a3
{
  id v4;
  WFCoreDataDatabaseResult *v5;
  void *v6;
  WFCoreDataDatabaseResult *v7;

  v4 = a3;
  v5 = [WFCoreDataDatabaseResult alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("icon"), CFSTR("parents"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:relationshipKeysAffectingDescriptors:](v5, "initWithDatabase:fetchRequest:relationshipKeysAffectingDescriptors:", self, v4, v6);

  return v7;
}

- (id)workflowResultWithFetchRequest:(id)a3
{
  id v4;
  WFCoreDataDatabaseResult *v5;
  WFCoreDataDatabaseResultFetchRequestOperation *v6;
  void *v7;
  WFCoreDataDatabaseResultFetchRequestOperation *v8;
  WFCoreDataDatabaseResult *v9;

  v4 = a3;
  v5 = [WFCoreDataDatabaseResult alloc];
  v6 = [WFCoreDataDatabaseResultFetchRequestOperation alloc];
  -[WFDatabase workflowRelationshipKeysAffectingDescriptors](self, "workflowRelationshipKeysAffectingDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFCoreDataDatabaseResultFetchRequestOperation initWithFetchRequest:relationshipKeysAffectingDescriptors:](v6, "initWithFetchRequest:relationshipKeysAffectingDescriptors:", v4, v7);

  v9 = -[WFCoreDataDatabaseResult initWithDatabase:fetchOperation:](v5, "initWithDatabase:fetchOperation:", self, v8);
  return v9;
}

- (BOOL)startObservingChangesForResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WFDatabase context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__WFDatabase_startObservingChangesForResult___block_invoke;
  v8[3] = &unk_1E7AF92C0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v8);

  return 1;
}

- (id)workflowRelationshipKeysAffectingDescriptors
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("icon"), CFSTR("parents"), 0);
}

id __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  __CFString *v53;
  _QWORD v54[3];
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visiblePredicate");
  v3 = objc_claimAutoreleasedReturnValue();
  WFWorkflowCollectionIdentifierForWorkflowType((void *)*MEMORY[0x1E0DC8500]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $p, $p.identifier == %@).@count == 0"), CFSTR("parents"), v49);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v50 = (void *)v3;
  v58[0] = v3;
  v58[1] = v4;
  v48 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v8;
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, -7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $r, $r.date >= %@).@count > 0"), CFSTR("runEvents"), v44);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("runEvents"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("source"), CFSTR("ShortcutSourceOnDevice"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("source"), CFSTR("ShortcutSourceDefaultShortcut"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v41 = (void *)v11;
  v57[0] = v11;
  v57[1] = v12;
  v39 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("source"), CFSTR("ShortcutSourceDefaultShortcut"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3528];
  v47 = (void *)v7;
  v55[3] = v17;
  v56[0] = v7;
  v43 = (void *)v9;
  v55[0] = v9;
  v55[1] = v10;
  v19 = (void *)v10;
  v55[2] = v16;
  v38 = (void *)v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "orPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v51;
  objc_msgSend(v51, "setPredicate:", v23);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("runEventsCount"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastRunEventDate"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v25;
  v54[1] = v26;
  v54[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setSortDescriptors:", v28);

  objc_msgSend(v51, "setFetchLimit:", 10);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "executeFetchRequest:error:", v51, a2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "runEventsCount") < 1)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke_2;
    v52[3] = &unk_1E7AEB8D8;
    v53 = CFSTR("ShortcutSourceDefaultShortcut");
    objc_msgSend(v30, "sortedArrayUsingComparator:", v52);
    v33 = v16;
    v34 = v19;
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v35;
    v19 = v34;
    v16 = v33;
    v24 = v51;
    v31 = v36;
  }
  else
  {
    objc_msgSend(v31, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v32;
}

- (id)workflowFetchRequestWithCollectionID:(id)a3 includeTombstones:(BOOL)a4 limit:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY parents.identifier == %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    v11 = (void *)MEMORY[0x1E0CB3528];
    v19[0] = v10;
    -[WFDatabase visiblePredicate](self, "visiblePredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("parents"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v16);

  if (a5)
    objc_msgSend(v9, "setFetchLimit:", a5);

  return v9;
}

- (id)visiblePredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[WFDatabase tombstonedShortcutsPredicate](self, "tombstonedShortcutsPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[WFDatabase mergeAutomationsAndShortcuts](self, "mergeAutomationsAndShortcuts"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO OR %K == nil"), CFSTR("hiddenFromLibraryAndSync"), CFSTR("hiddenFromLibraryAndSync"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3528];
    v11[0] = v5;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

- (id)tombstonedShortcutsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES OR (%K != nil AND %K == NO)"), CFSTR("tombstoned"), CFSTR("conflictOf"), CFSTR("conflictOf.tombstoned"));
}

- (BOOL)mergeAutomationsAndShortcuts
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFAutomationsMergeEnabled"));

  return v3;
}

- (void)contextDidSave:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *changeNotificationQueue;
  id v37;
  _BOOL4 v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  _QWORD block[5];
  id v50;
  _QWORD v51[4];
  id v52;
  _BYTE buf[24];
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFDatabase context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97880]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v7 != 0;

  }
  else
  {
    v48 = 1;
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97888]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C979A0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v10);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v11);

  v12 = v8;
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __WFUpdateSmartPromptChangesToShortcutChanges_block_invoke;
  v54 = &unk_1E7AF2E50;
  v55 = v13;
  v56 = v15;
  v57 = v14;
  v17 = v14;
  v18 = v15;
  v19 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", buf);
  v51[0] = v16;
  v51[1] = 3221225472;
  v51[2] = __WFUpdateSmartPromptChangesToShortcutChanges_block_invoke_464;
  v51[3] = &unk_1E7AF2E78;
  v52 = v12;
  v20 = v12;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v51);
  objc_msgSend(v17, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97870]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_opt_new();
  v25 = v24;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    v28 = v26;
  else
    v28 = (id)objc_opt_new();
  v29 = v28;

  v30 = objc_alloc(MEMORY[0x1E0DC7AA0]);
  WFDescriptorsForObjectIDs(v20, v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  WFDescriptorsForObjectIDs(v25, v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  WFDescriptorsForObjectIDs(v29, v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v30, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", v48, v31, v32, v33, getpid());

  -[WFDatabase addPendingLocalChangeNotification:](self, "addPendingLocalChangeNotification:", v34);
  if (-[WFDatabase transactionCount](self, "transactionCount") <= 0)
  {
    -[WFDatabase pendingLocalChangeNotification](self, "pendingLocalChangeNotification");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase setPendingLocalChangeNotification:](self, "setPendingLocalChangeNotification:", 0);
    if (objc_msgSend(v35, "hasChanges"))
    {
      changeNotificationQueue = self->_changeNotificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__WFDatabase_contextDidSave___block_invoke;
      block[3] = &unk_1E7AF92C0;
      block[4] = self;
      v37 = v35;
      v50 = v37;
      dispatch_async(changeNotificationQueue, block);
      v38 = -[WFDatabase isPostingDistributedNotifications](self, "isPostingDistributedNotifications");
      getWFDatabaseLogObject();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
      if (v38)
      {
        if (v40)
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[WFDatabase contextDidSave:]";
          _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_INFO, "%s Posting distributed notification.", buf, 0xCu);
        }

        getWFDatabaseLogObject();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v37, "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase contextDidSave:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v42;
          _os_log_impl(&dword_1C15B3000, v41, OS_LOG_TYPE_DEBUG, "%s Change notification: %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v39 = objc_claimAutoreleasedReturnValue();
        v43 = *MEMORY[0x1E0DC8090];
        -[WFDatabase persistentStoreDescription](self, "persistentStoreDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "URL");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "path");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "dictionaryRepresentation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject postNotificationName:object:userInfo:](v39, "postNotificationName:object:userInfo:", v43, v46, v47);

      }
      else if (v40)
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFDatabase contextDidSave:]";
        _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_INFO, "%s Not posting distributed notification because it's explicitly disabled.", buf, 0xCu);
      }

    }
  }
}

- (void)setPendingLocalChangeNotification:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLocalChangeNotification, a3);
}

- (WFCoreDataChangeNotification)pendingLocalChangeNotification
{
  return self->_pendingLocalChangeNotification;
}

- (BOOL)saveContextOrRollback:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (objc_msgSend(v5, "hasChanges") && (objc_msgSend(v5, "save:", a4) & 1) == 0)
  {
    objc_msgSend(v5, "rollback");
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (WFDatabase)initWithStoreDescription:(id)a3 runMigrationsIfNecessary:(BOOL)a4 useLockFile:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  WFManagedObjectContext *v45;
  void *v46;
  WFDatabase *v47;
  NSHashTable *v48;
  NSHashTable *resultsToNotify;
  NSHashTable *v50;
  NSHashTable *observers;
  NSObject *v52;
  OS_dispatch_queue *v53;
  OS_dispatch_queue *callbackQueue;
  NSObject *v55;
  OS_dispatch_queue *v56;
  OS_dispatch_queue *changeNotificationQueue;
  void *v58;
  NSObject *v59;
  OS_dispatch_queue *v60;
  OS_dispatch_queue *remoteChangeQueue;
  WFDebouncer *v62;
  WFDebouncer *remoteChangeNotificationDebouncer;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  WFDatabase *v71;
  uint64_t v72;
  NSURL *fileURL;
  WFDatabase *v74;
  WFDatabase *v75;
  id *v77;
  void *v78;
  void *v79;
  id v80;
  id *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  _QWORD v88[4];
  WFDatabase *v89;
  objc_super v90;
  id v91;
  _QWORD v92[2];
  _BYTE buf[22];
  __int16 v94;
  id v95;
  _QWORD v96[3];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v96[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = a6;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeDescription"));

    a6 = v77;
  }
  v13 = (void *)os_transaction_create();
  v14 = (void *)MEMORY[0x1C3BB3598]();
  v91 = 0;
  v15 = v12;
  if (v8
    && !+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:](WFProgressiveCoreDataMigrator, "migrateDatabaseAtPersistentStoreDescription:useLockFile:error:", v15, v7, &v91))
  {
    v34 = 0;
  }
  else
  {
    v83 = v14;
    v81 = a6;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C97B98];
    v96[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mergedModelFromBundles:", v18);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C97C00];
    v20 = *MEMORY[0x1E0C979E8];
    objc_msgSend(v15, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "metadataForPersistentStoreOfType:URL:options:error:", v20, v21, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = v22;
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0C979F8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = v24;

    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    v28 = v84;
    v86 = v27;

    objc_msgSend(v84, "versionIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "anyObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
    }
    else
    {
      v31 = 0;
    }
    v32 = v31;

    if (v86 && v32 && objc_msgSend(v86, "compare:options:", v32, 64) == 1)
    {
      getWFDatabaseLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "WFPersistentStoreCoordinator";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v86;
        v94 = 2112;
        v95 = v32;
        _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_ERROR, "%s Model version from persistent store metadata is '%@' and is greater than the current model version '%@'. This likely indicates a schema downgrade, which is not supported", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 1, 0);
      v34 = 0;
      v91 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v79 = v16;
      v80 = v9;
      v35 = v13;
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v84);
      v37 = *MEMORY[0x1E0C97868];
      v92[0] = *MEMORY[0x1E0C978D0];
      v92[1] = v37;
      *(_QWORD *)buf = MEMORY[0x1E0C9AAB0];
      *(_QWORD *)&buf[8] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v92, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "type");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "configuration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v15;
      objc_msgSend(v15, "URL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addPersistentStoreWithType:configuration:URL:options:error:", v39, v40, v42, v38, &v91);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        v34 = v36;
      else
        v34 = 0;
      v13 = v35;

      v15 = v41;
      v9 = v80;
      a6 = v81;
      v16 = v79;
      v28 = v84;
    }

    v14 = v83;
  }

  v44 = v91;
  objc_autoreleasePoolPop(v14);
  if (a6)
    *a6 = objc_retainAutorelease(v44);
  if (v34)
  {
    v45 = -[WFManagedObjectContext initWithConcurrencyType:]([WFManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[WFManagedObjectContext setDatabase:](v45, "setDatabase:", self);
    -[WFManagedObjectContext setMergePolicy:](v45, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
    -[WFManagedObjectContext setPersistentStoreCoordinator:](v45, "setPersistentStoreCoordinator:", v34);
    -[WFManagedObjectContext setStalenessInterval:](v45, "setStalenessInterval:", 0.0);
    -[WFManagedObjectContext setUndoManager:](v45, "setUndoManager:", 0);
    -[WFManagedObjectContext setName:](v45, "setName:", CFSTR("WFDatabase"));
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
    objc_msgSend(v46, "setPersistentStoreCoordinator:", v34);
    objc_msgSend(v46, "setMergePolicy:", *MEMORY[0x1E0C978D8]);
    v90.receiver = self;
    v90.super_class = (Class)WFDatabase;
    v47 = -[WFDatabase init](&v90, sel_init);
    self = v47;
    if (v47)
    {
      objc_storeStrong((id *)&v47->_context, v45);
      objc_storeStrong((id *)&self->_suggestionsContext, v46);
      objc_storeStrong((id *)&self->_persistentStoreDescription, v9);
      v85 = v46;
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v48 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      resultsToNotify = self->_resultsToNotify;
      self->_resultsToNotify = v48;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v50 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      observers = self->_observers;
      self->_observers = v50;

      self->_observersLock._os_unfair_lock_opaque = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFCoreDataDatabase-callback", v52);
      callbackQueue = self->_callbackQueue;
      self->_callbackQueue = v53;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFCoreDataDatabase-change-notification", v55);
      changeNotificationQueue = self->_changeNotificationQueue;
      self->_changeNotificationQueue = v56;

      self->_postDistributedNotifications = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObserver:selector:name:object:", self, sel_contextDidSave_, *MEMORY[0x1E0C978A8], v45);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFCoreDataDatabase-remote-change", v59);
      remoteChangeQueue = self->_remoteChangeQueue;
      self->_remoteChangeQueue = v60;

      v62 = -[WFDebouncer initWithDelay:maximumDelay:queue:]([WFDebouncer alloc], "initWithDelay:maximumDelay:queue:", self->_remoteChangeQueue, 2.0, 10.0);
      remoteChangeNotificationDebouncer = self->_remoteChangeNotificationDebouncer;
      self->_remoteChangeNotificationDebouncer = v62;

      -[WFDebouncer addTarget:action:](self->_remoteChangeNotificationDebouncer, "addTarget:action:", self, sel_remoteChangeDebouncerDidFire);
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *MEMORY[0x1E0DC8090];
      objc_msgSend(v15, "URL");
      v87 = v34;
      v66 = v15;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "path");
      v68 = v44;
      v69 = v13;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObserver:selector:name:object:", self, sel_remoteContextDidSave_, v65, v70);

      v13 = v69;
      v44 = v68;

      v15 = v66;
      v34 = v87;

      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __82__WFDatabase_initWithStoreDescription_runMigrationsIfNecessary_useLockFile_error___block_invoke;
      v88[3] = &unk_1E7AF2B60;
      v71 = self;
      v89 = v71;
      -[WFDatabase performTransactionWithReason:block:error:](v71, "performTransactionWithReason:block:error:", CFSTR("initial setup"), v88, 0);
      objc_msgSend(v15, "URL");
      v72 = objc_claimAutoreleasedReturnValue();
      fileURL = v71->_fileURL;
      v71->_fileURL = (NSURL *)v72;

      v74 = v71;
      v46 = v85;

    }
    v75 = self;
  }
  else
  {
    v75 = 0;
  }

  return v75;
}

+ (void)setDefaultDatabase:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&WFDefaultDatabaseLock);
  v4 = (void *)_defaultDatabase;
  _defaultDatabase = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&WFDefaultDatabaseLock);
}

- (id)latestLibrary
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__WFDatabase_Library__latestLibrary__block_invoke;
  v3[3] = &unk_1E7AEA818;
  v3[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting latest library"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allLatestLibraries
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__WFDatabase_Library__allLatestLibraries__block_invoke;
  v9[3] = &unk_1E7AEA880;
  objc_copyWeak(&v10, &location);
  v8 = 0;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting all latest libraries"), v9, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    getWFDatabaseLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFDatabase(Library) allLatestLibraries]";
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Error getting all latest libraries: %{public}@", buf, 0x16u);
    }

    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)wipeAllLibrariesWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  +[WFCoreDataLibrary fetchRequest](WFCoreDataLibrary, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v5);
  -[WFDatabase context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = (id)objc_msgSend(v7, "executeRequest:error:", v6, &v14);
  v9 = v14;

  -[WFDatabase context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  objc_msgSend(v10, "save:", &v13);
  v11 = v13;

  if (a3)
    *a3 = objc_retainAutorelease(v11);

  return v11 != 0;
}

- (id)libraryDotRepresentation
{
  WFLibrary *library;
  WFLibrary *v3;
  void *v4;

  if (self)
    library = self->_library;
  else
    library = 0;
  v3 = library;
  -[WFLibrary dotRepresentation](v3, "dotRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rootCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[WFCoreDataCollection fetchRequest](WFCoreDataCollection, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), CFSTR("Root"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(v3, "setFetchLimit:", 1);
  -[WFDatabase context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeFetchRequest:error:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchBuiltInCollections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[WFCoreDataCollection fetchRequest](WFCoreDataCollection, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFGetBuiltInCollectionIdentifiers(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY parents = nil && (%K in %@)"), CFSTR("identifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v5);

  -[WFDatabase context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createLibraryFromCurrentDatabaseSnapshot
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  id v7;
  id location;
  __int128 buf;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  getWFCoherenceLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Creating library from database...", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke;
  v6[3] = &unk_1E7AEA920;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v6[5] = &buf;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("create library from current database snapshot"), v6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
  return v4;
}

- (void)saveLibraryToDatabase:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCoherenceLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFDatabase(Library) saveLibraryToDatabase:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Saving library...", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__WFDatabase_Library__saveLibraryToDatabase___block_invoke;
  v12[3] = &unk_1E7AEA948;
  v6 = v4;
  v13 = v6;
  objc_copyWeak(&v14, &location);
  v11 = 0;
  v7 = -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("saving library"), v12, &v11);
  v8 = v11;
  if (v8)
  {
    getWFDatabaseLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFDatabase(Library) saveLibraryToDatabase:]";
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Error saving updated library: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    getWFCoherenceLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "dotRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFDatabase(Library) saveLibraryToDatabase:]";
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEBUG, "%s Saved library to disk: %@", buf, 0x16u);

    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)latestCoreDataLibrary
{
  void *v2;
  void *v3;

  -[WFDatabase allLatestLibrariesLimitedTo:](self, "allLatestLibrariesLimitedTo:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)coreDataLibraryWithVersion:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("version"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase coreDataLibraryWithPredicate:](self, "coreDataLibraryWithPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)coreDataLibraryWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase coreDataLibraryWithPredicate:](self, "coreDataLibraryWithPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)coreDataLibraryWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[WFCoreDataLibrary fetchRequest](WFCoreDataLibrary, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v4);

  objc_msgSend(v5, "setFetchLimit:", 1);
  -[WFDatabase context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allLatestLibrariesLimitedTo:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataLibrary fetchRequest](WFCoreDataLibrary, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("version"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "setFetchLimit:", a3);
  -[WFDatabase context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)libraryRecordForVersion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__WFDatabase_Library__libraryRecordForVersion___block_invoke;
  v11[3] = &unk_1E7AEA970;
  objc_copyWeak(&v13, &location);
  v5 = v4;
  v12 = v5;
  v10 = 0;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("create library record"), v11, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    getWFDatabaseLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFDatabase(Library) libraryRecordForVersion:]";
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Error creating library record: %{public}@", buf, 0x16u);
    }

  }
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v6;
}

WFLibraryRecord *__47__WFDatabase_Library__libraryRecordForVersion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  WFLibraryRecord *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "coreDataLibraryWithVersion:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[WFRecord initWithStorage:]([WFLibraryRecord alloc], "initWithStorage:", v3);
  else
    v4 = 0;

  return v4;
}

id __45__WFDatabase_Library__saveLibraryToDatabase___block_invoke(uint64_t a1, NSObject **a2)
{
  void *v3;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "version");
    v5 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "coreDataLibraryWithVersion:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "capsuleDataWithError:", a2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        objc_msgSend(v7, "setData:", v8);
        v10 = v7;
LABEL_14:

        goto LABEL_15;
      }
      getWFCoherenceLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *a2;
        v14 = 136315394;
        v15 = "-[WFDatabase(Library) saveLibraryToDatabase:]_block_invoke";
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Could not generate capsule data: %@", (uint8_t *)&v14, 0x16u);
      }

      v9 = 0;
    }
    else
    {
      getWFCoherenceLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315394;
        v15 = "-[WFDatabase(Library) saveLibraryToDatabase:]_block_invoke";
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Attempting to save library but there's no existing Core Data library with version: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
    v10 = 0;
    goto LABEL_14;
  }
  getWFCoherenceLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v14 = 136315138;
    v15 = "-[WFDatabase(Library) saveLibraryToDatabase:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Attempting to save library but there are no changes", (uint8_t *)&v14, 0xCu);
  }
  v10 = 0;
LABEL_15:

  return v10;
}

WFLibrary *__63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke(uint64_t a1, uint64_t *a2)
{
  WFCoreDataLibrary *v4;
  void *v5;
  WFCoreDataLibrary *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFLibrary *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t *v18;
  void *v19;
  WFLibrary *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  WFLibrary *v28;
  void *v29;
  NSObject *v30;
  WFLibrary *v31;
  NSObject *v32;
  uint64_t v33;
  void *v35;
  _QWORD v36[4];
  WFLibrary *v37;
  _QWORD v38[4];
  WFLibrary *v39;
  _QWORD v40[4];
  WFLibrary *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = [WFCoreDataLibrary alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCoreDataLibrary initWithContext:](v4, "initWithContext:", v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "latestCoreDataLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v8;
  objc_msgSend(v8, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(&unk_1E7B8AF78, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFCoreDataLibrary setVersion:](v6, "setVersion:", v12);
  v13 = -[WFLibrary initWithIdentifier:version:]([WFLibrary alloc], "initWithIdentifier:version:", CFSTR("Library"), v12);
  -[WFLibrary identifier](v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataLibrary setIdentifier:](v6, "setIdentifier:", v14);

  objc_msgSend(*(id *)(a1 + 32), "_rootCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    getWFDatabaseLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "shortcuts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v43 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      v44 = 2048;
      v45 = objc_msgSend(v17, "count");
      _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s Migrating %lu root shortcuts", buf, 0x16u);

    }
    v18 = a2;

    objc_msgSend(v15, "shortcuts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_132;
    v40[3] = &unk_1E7AEA8A8;
    v20 = v13;
    v41 = v20;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v40);

    getWFDatabaseLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "collections");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 136315394;
      v43 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke_2";
      v44 = 2048;
      v45 = v23;
      _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_INFO, "%s Migrating %lu folders", buf, 0x16u);

    }
    objc_msgSend(v15, "collections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_135;
    v38[3] = &unk_1E7AEA8F8;
    v39 = v20;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v38);

    a2 = v18;
  }
  objc_msgSend(*(id *)(a1 + 32), "fetchBuiltInCollections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  getWFDatabaseLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 136315394;
    v43 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
    v44 = 2048;
    v45 = v27;
    _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_INFO, "%s Found %lu built in collections to migrate", buf, 0x16u);
  }

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_138;
  v36[3] = &unk_1E7AEA8F8;
  v28 = v13;
  v37 = v28;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v36);
  -[WFLibrary capsuleDataWithError:](v28, "capsuleDataWithError:", a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    getWFDatabaseLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_INFO, "%s Saving capsule data in Core Data", buf, 0xCu);
    }

    -[WFCoreDataLibrary setData:](v6, "setData:", v29);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v31 = v28;
  }
  else
  {
    getWFCoherenceLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = *a2;
      *(_DWORD *)buf = 136315394;
      v43 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_ERROR, "%s Could not generate capsule data: %@", buf, 0x16u);
    }

    v31 = 0;
  }

  return v31;
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_132(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "workflowID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertShortcutWithId:", v3);

}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "glyphNumber");
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v9 = (id)objc_msgSend(v4, "insertFolderWithName:icon:identifier:error:", v5, v7, v8, &v21);
  v10 = v21;

  if (v10)
  {
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      v24 = 2112;
      v25 = (uint64_t)v3;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create folder %@: %@", buf, 0x20u);
    }

  }
  getWFDatabaseLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortcuts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    objc_msgSend(v3, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
    v24 = 2048;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Migrating %lu shortcuts to folder with identifier {public}%@", buf, 0x20u);

  }
  objc_msgSend(v3, "shortcuts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_136;
  v18[3] = &unk_1E7AEA8D0;
  v19 = *(id *)(a1 + 32);
  v20 = v3;
  v17 = v3;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getWFDatabaseLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortcuts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v13 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
    v14 = 2048;
    v15 = objc_msgSend(v6, "count");
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Migrating %lu shortcuts to built in collection with identifier {public}%@", buf, 0x20u);

  }
  objc_msgSend(v3, "shortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_139;
  v9[3] = &unk_1E7AEA8D0;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_139(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "workflowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v3, "addShortcutWithIdentifier:toCollectionWithIdentifier:error:", v4, v5, &v9);
  v6 = v9;

  if (v6)
  {
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v11 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to add shortcut to collection with identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }

  }
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_136(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "workflowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertShortcutWithId:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "workflowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "moveShortcutWithIdentifier:toFolder:error:", v7, v8, &v12);
  v9 = v12;

  if (v9)
  {
    getWFDatabaseLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v14 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to insert shortcut into folder with identifier: %{public}@, error: %{public}@", buf, 0x20u);

    }
  }

}

id __41__WFDatabase_Library__allLatestLibraries__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "allLatestLibrariesLimitedTo:", 0x7FFFFFFFFFFFFFFFLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_1583);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

WFLibrary *__41__WFDatabase_Library__allLatestLibraries__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFLibrary *v3;
  void *v4;
  void *v5;
  void *v6;
  WFLibrary *v7;

  v2 = a2;
  v3 = [WFLibrary alloc];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFLibrary initWithIdentifier:version:data:](v3, "initWithIdentifier:version:data:", v4, v5, v6);
  return v7;
}

WFLibrary *__36__WFDatabase_Library__latestLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  WFLibrary *v5;
  void *v6;
  void *v7;
  void *v8;
  WFLibrary *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "latestCoreDataLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getWFDatabaseLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v11 = 136315138;
      v12 = "-[WFDatabase(Library) latestLibrary]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Found the latest library in Core Data; creating library with persisted data",
        (uint8_t *)&v11,
        0xCu);
    }

    v5 = [WFLibrary alloc];
    objc_msgSend(v2, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFLibrary initWithIdentifier:version:data:](v5, "initWithIdentifier:version:data:", v6, v7, v8);

  }
  else
  {
    if (v4)
    {
      v11 = 136315138;
      v12 = "-[WFDatabase(Library) latestLibrary]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Didn't find the latest library in Core Data; creating one from current snapshot",
        (uint8_t *)&v11,
        0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createLibraryFromCurrentDatabaseSnapshot");
    v9 = (WFLibrary *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__WFDatabase_AccessResources__setTrustedToRunScripts_forReference_onDomain___block_invoke;
  v16[3] = &unk_1E7AEB0C8;
  v16[4] = self;
  v10 = v8;
  v17 = v10;
  v11 = v9;
  v18 = v11;
  v19 = a3;
  v15 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("set domain trust"), v16, &v15);
  v12 = v15;
  if (v12)
  {
    getWFDatabaseLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFDatabase(AccessResources) setTrustedToRunScripts:forReference:onDomain:]";
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Unable to update trusted run scripts: %@", buf, 0x16u);

    }
  }

}

- (BOOL)isReference:(id)a3 allowedToRunOnDomain:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  id v14;
  id v15;
  WFDatabase *v16;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__WFDatabase_AccessResources__isReference_allowedToRunOnDomain___block_invoke;
  v13[3] = &unk_1E7AEB0F0;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v8 = v6;
  v9 = v7;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting domain trust"), v13, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

id __64__WFDatabase_AccessResources__isReference_allowedToRunOnDomain___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  +[WFCoreDataTrustedDomain fetchRequest](WFCoreDataTrustedDomain, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchLimit:", 1);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1[4], "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("domain"), v6, CFSTR("shortcut.workflowID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(a1[6], "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeFetchRequest:error:", v4, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __76__WFDatabase_AccessResources__setTrustedToRunScripts_forReference_onDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  BOOL v24;
  BOOL v25;
  WFCoreDataTrustedDomain *v26;
  void *v27;
  WFCoreDataTrustedDomain *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE buf[12];
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "WFEnforceClass";
      v38 = 2114;
      v39 = v6;
      v40 = 2114;
      v41 = (id)objc_opt_class();
      v42 = 2114;
      v43 = v5;
      v9 = v41;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  objc_msgSend(v7, "trustedDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v14;
  v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v31 = a2;
    v17 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v19, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "lowercaseString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if (v22)
        {
          v16 = v19;
          goto LABEL_20;
        }
      }
      v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v16)
        continue;
      break;
    }
LABEL_20:
    a2 = v31;
  }

  v23 = *(unsigned __int8 *)(a1 + 56);
  if (v16)
    v24 = 1;
  else
    v24 = v23 == 0;
  if (v24)
  {
    if (v16)
      v25 = v23 == 0;
    else
      v25 = 0;
    if (v25)
      objc_msgSend(v15, "removeObject:", v16);
  }
  else
  {
    v26 = [WFCoreDataTrustedDomain alloc];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[WFCoreDataTrustedDomain initWithContext:](v26, "initWithContext:", v27);

    -[WFCoreDataTrustedDomain setDomain:](v28, "setDomain:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v15, "addObject:", v28);

  }
  objc_msgSend(v7, "setTrustedDomains:", v15);
  v29 = *(void **)(a1 + 32);
  *(_QWORD *)buf = CFSTR("trustedDomains");
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

  objc_msgSend(v29, "object:didUpdateProperties:error:", v7, v30, a2);
}

- (id)workflowSiriRunEventWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  WFDatabase *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__WFDatabase_TipKit__workflowSiriRunEventWithIdentifier___block_invoke;
  v8[3] = &unk_1E7AEB928;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting siri run event by id"), v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)latestWorkflowSiriRunEvent
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__WFDatabase_TipKit__latestWorkflowSiriRunEvent__block_invoke;
  v3[3] = &unk_1E7AF8EF8;
  v3[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting latest siri run event"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __48__WFDatabase_TipKit__latestWorkflowSiriRunEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchLimit:", 1);
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), *MEMORY[0x1E0DC84B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), *MEMORY[0x1E0DC84B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), *MEMORY[0x1E0DC84C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v12);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeFetchRequest:error:", v4, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __57__WFDatabase_TipKit__workflowSiriRunEventWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 1);
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), *MEMORY[0x1E0DC84B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), *MEMORY[0x1E0DC84B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), *MEMORY[0x1E0DC84C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v15);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executeFetchRequest:error:", v3, a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v6, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)) << 63 >> 63;
  }

  return v11;
}

- (id)shortcutSuggestionsForAppWithBundleIdentifier:(id)a3 shortcutAvailability:(unint64_t)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  WFDatabase *v16;
  unint64_t v17;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+ShortcutSuggestions.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke;
  v14[3] = &unk_1E7AEDF90;
  v16 = self;
  v17 = a4;
  v15 = v9;
  v10 = v9;
  -[WFDatabase performSuggestionsOperationWithBlock:error:](self, "performSuggestionsOperationWithBlock:error:", v14, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)shortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 shortcutAvailability:(unint64_t)a4 error:(id *)a5
{
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke;
  v6[3] = &unk_1E7AEDFB8;
  v6[4] = self;
  v6[5] = a4;
  v6[6] = a3;
  -[WFDatabase performSuggestionsOperationWithBlock:error:](self, "performSuggestionsOperationWithBlock:error:", v6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allShortcutSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  WFCoreDataDatabaseResult *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[VCVoiceShortcutSuggestionListManagedObject fetchRequest](VCVoiceShortcutSuggestionListManagedObject, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("associatedAppBundleIdentifier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:]([WFCoreDataDatabaseResult alloc], "initWithDatabase:fetchRequest:", self, v3);
  return v6;
}

- (void)deleteShortcutSuggestionsFromApps:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  WFDatabase *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+ShortcutSuggestions.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifiers"));

  }
  -[WFDatabase suggestionsContext](self, "suggestionsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__WFDatabase_ShortcutSuggestions__deleteShortcutSuggestionsFromApps___block_invoke;
  v9[3] = &unk_1E7AF92C0;
  v10 = v5;
  v11 = self;
  v8 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v9);

}

void __69__WFDatabase_ShortcutSuggestions__deleteShortcutSuggestionsFromApps___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[VCVoiceShortcutSuggestionListManagedObject fetchRequest](VCVoiceShortcutSuggestionListManagedObject, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("associatedAppBundleIdentifier IN %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v2);
  objc_msgSend(*(id *)(a1 + 40), "suggestionsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = (id)objc_msgSend(v5, "executeRequest:error:", v4, &v13);
  v7 = v13;

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "suggestionsContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  objc_msgSend(v8, "saveContextOrRollback:error:", v9, &v12);
  v10 = v12;

  if (v10)
  {
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFDatabase(ShortcutSuggestions) deleteShortcutSuggestionsFromApps:]_block_invoke";
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Error deleting suggested shortcuts (%{public}@)", buf, 0x16u);
    }

  }
}

id __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[VCVoiceShortcutSuggestionListManagedObject fetchRequest](VCVoiceShortcutSuggestionListManagedObject, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((shortcutAvailabilityOptions & %d) != 0)"), *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "suggestionsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeFetchRequest:error:", v4, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v27 = v5;
    v25 = v4;
    v28 = (id)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = v8;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v29 = *(_QWORD *)v33;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1E0CB3710];
          v14 = (void *)MEMORY[0x1E0C99E60];
          v36[0] = objc_opt_class();
          v36[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setWithArray:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "serializedSuggestions");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v16, v17, &v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v31;

          if (v18)
          {
            if (v27)
            {
              v30[0] = MEMORY[0x1E0C809B0];
              v30[1] = 3221225472;
              v30[2] = __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke_2;
              v30[3] = &__block_descriptor_40_e20_B16__0__INShortcut_8l;
              v30[4] = *(_QWORD *)(a1 + 40);
              objc_msgSend(v18, "if_objectsPassingTest:", v30);
              v20 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v20;
            }
            if ((unint64_t)objc_msgSend(v18, "count") > *(_QWORD *)(a1 + 48))
            {
              objc_msgSend(v18, "subarrayWithRange:", 0);
              v21 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v21;
            }
            objc_msgSend(v12, "associatedAppBundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, v22);

          }
          ++v11;
        }
        while (v10 != v11);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    v8 = v24;
    v4 = v25;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

BOOL __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return (objc_msgSend(a2, "wf_shortcutAvailability") & v2) != 0;
}

id __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  +[VCVoiceShortcutSuggestionListManagedObject fetchRequest](VCVoiceShortcutSuggestionListManagedObject, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(associatedAppBundleIdentifier = %@)"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR(" ((shortcutAvailabilityOptions & %d) != 0)"), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3528];
    v27[0] = v5;
    v27[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 40), "suggestionsContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v4, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;

  if (v13)
  {
    v14 = 0;
    *a2 = objc_retainAutorelease(v13);
  }
  else
  {
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serializedSuggestions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB3710];
      v23 = a2;
      v18 = (void *)MEMORY[0x1E0C99E60];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", v20, v16, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && v6)
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke_2;
        v24[3] = &__block_descriptor_40_e20_B16__0__INShortcut_8l;
        v24[4] = *(_QWORD *)(a1 + 48);
        objc_msgSend(v14, "if_objectsPassingTest:", v24);
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v21;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v14;
}

BOOL __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return (objc_msgSend(a2, "wf_shortcutAvailability") & v2) != 0;
}

- (void)setSyncToken:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__WFDatabase_Sync__setSyncToken___block_invoke;
  v10[3] = &unk_1E7AF93C8;
  v10[4] = self;
  v5 = v4;
  v11 = v5;
  v9 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("set sync token"), v10, &v9);
  v6 = v9;
  if (v6)
  {
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFDatabase(Sync) setSyncToken:]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Unable to set sync token: %@", buf, 0x16u);

    }
  }

}

- (id)syncToken
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__WFDatabase_Sync__syncToken__block_invoke;
  v3[3] = &unk_1E7AEFC60;
  v3[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting sync token"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deletedWorkflowIDsForSync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES AND (%K == nil OR %K == YES)"), CFSTR("tombstoned"), CFSTR("conflictOf"), CFSTR("conflictOf.tombstoned"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__WFDatabase_Sync__deletedWorkflowIDsForSync__block_invoke;
  v10[3] = &unk_1E7AF3888;
  v10[4] = self;
  v11 = v3;
  v7 = v3;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("get deleted workflow ids for sync"), v10, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)changedWorkflowIDsForSync
{
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
  void *v14;
  _QWORD v16[5];
  id v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  v20[0] = CFSTR("workflowID");
  v20[1] = CFSTR("syncHash");
  v20[2] = CFSTR("lastSyncedHash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPropertiesToFetch:", v4);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %K"), CFSTR("syncHash"), CFSTR("lastSyncedHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil && %K.@count == 0"), CFSTR("conflictOf"), CFSTR("conflicts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  -[WFDatabase visiblePredicate](self, "visiblePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = v5;
  v19[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__WFDatabase_Sync__changedWorkflowIDsForSync__block_invoke;
  v16[3] = &unk_1E7AF3888;
  v16[4] = self;
  v17 = v3;
  v13 = v3;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("get changed workflow ids for sync"), v16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_195(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void (**v33)(void);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[4];
  os_activity_scope_state_s v46;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _QWORD v61[2];
  _QWORD v62[5];

  v62[2] = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2_196;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  v46 = state;
  v33 = (void (**)(void))_Block_copy(aBlock);
  v38 = +[WFCloudKitFolder latestEncryptedSchemaVersion](WFCloudKitFolder, "latestEncryptedSchemaVersion");
  +[WFCoreDataCollection fetchRequest](WFCoreDataCollection, "fetchRequest");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFetchBatchSize:", *(_QWORD *)(a1 + 64));
  v62[0] = CFSTR("wantedEncryptedSchemaVersion");
  v62[1] = CFSTR("lastSyncedEncryptedSchemaVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPropertiesToFetch:", v3);

  getWFWalrusLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    v50 = 2048;
    v51 = v38;
    v52 = 2112;
    v53 = (uint64_t)v6;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Looks like we want Walrus schema version %lld for %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY parents.identifier == %@ AND %K == NO"), CFSTR("Root"), CFSTR("tombstoned"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lld OR %K = nil"), CFSTR("wantedEncryptedSchemaVersion"), v38, CFSTR("wantedEncryptedSchemaVersion"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v61[0] = v35;
  v61[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPredicate:", v9);

  getWFWalrusLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    v50 = 2112;
    v51 = (int64_t)v12;
    v52 = 2112;
    v53 = (uint64_t)v13;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_INFO, "%s Running predicate on %@: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executeFetchRequest:error:", v37, a2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  getWFWalrusLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v36, "count");
    objc_msgSend(v37, "predicate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    v50 = 2112;
    v51 = (int64_t)v17;
    v52 = 2048;
    v53 = v18;
    v54 = 2112;
    v55 = (uint64_t)v19;
    _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEFAULT, "%s Ran predicate on %@, found %ld entities: %@", buf, 0x2Au);

  }
  if (v36)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v36;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v42;
      do
      {
        v40 = v21;
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v25 = (void *)MEMORY[0x1C3BB3598]();
          if ((objc_msgSend(v24, "isFolder") & 1) != 0)
          {
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v26 = objc_msgSend(v24, "wantedEncryptedSchemaVersion");
            v27 = objc_msgSend(v24, "lastSyncedEncryptedSchemaVersion");
            objc_msgSend(v24, "setWantedEncryptedSchemaVersion:", v38);
            getWFWalrusLogObject();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(v24, "wantedEncryptedSchemaVersion");
              v30 = objc_msgSend(v24, "lastSyncedEncryptedSchemaVersion");
              objc_msgSend(v24, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316418;
              v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
              v50 = 2048;
              v51 = v26;
              v52 = 2048;
              v53 = v27;
              v54 = 2048;
              v55 = v29;
              v56 = 2048;
              v57 = v30;
              v58 = 2112;
              v59 = v31;
              _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Updated collection <old: wanted schema ver %lld, last synced schema ver %lld> <new: wanted schema ver %lld, last synced schema ver %lld>: %@", buf, 0x3Eu);

            }
          }
          else
          {
            getWFWalrusLogObject();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v24, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
              v50 = 2112;
              v51 = (int64_t)v32;
              _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Skipping collection %@ for Walrus, as it's not a user-created one", buf, 0x16u);

            }
          }

          objc_autoreleasePoolPop(v25);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
      }
      while (v21);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

  v33[2]();
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2_196(os_activity_scope_state_s *a1)
{
  os_activity_scope_leave(a1 + 2);
}

id __45__WFDatabase_Sync__changedWorkflowIDsForSync__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_map:", &__block_literal_global_178);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __45__WFDatabase_Sync__changedWorkflowIDsForSync__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workflowID");
}

id __45__WFDatabase_Sync__deletedWorkflowIDsForSync__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_map:", &__block_literal_global_23833);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __45__WFDatabase_Sync__deletedWorkflowIDsForSync__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workflowID");
}

WFCloudKitSyncToken *__29__WFDatabase_Sync__syncToken__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  WFCloudKitSyncToken *v3;

  objc_msgSend(*(id *)(a1 + 32), "_syncTokenWithError:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[WFRecord initWithStorage:]([WFCloudKitSyncToken alloc], "initWithStorage:", v2);
  else
    v3 = 0;

  return v3;
}

void __33__WFDatabase_Sync__setSyncToken___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  WFCoreDataCloudKitSyncToken *v5;
  void *v6;
  void *v7;
  WFCoreDataCloudKitSyncToken *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_syncTokenWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if (!v3)
    {
      v5 = [WFCoreDataCloudKitSyncToken alloc];
      objc_msgSend(*(id *)(a1 + 32), "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WFCoreDataCloudKitSyncToken initWithContext:](v5, "initWithContext:", v6);

      v3 = (uint64_t)v8;
      v4 = *(void **)(a1 + 40);
    }
    v9 = (id)v3;
    objc_msgSend(v4, "writeToStorage:error:", v3, 0);

  }
  else if (v3)
  {
    v10 = (id)v3;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteObject:", v10);

  }
}

- (id)autoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForAppDescriptor_error___block_invoke;
  v10[3] = &unk_1E7AEFF78;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting auto shortcut preferences for app"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)autoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForIdentifier_error___block_invoke;
  v10[3] = &unk_1E7AEFF78;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting auto shortcut preferences for id"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFAutoShortcutsPreferences *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  WFAutoShortcutsPreferences *v13;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "appDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDatabase appDescriptorFromData:](WFDatabase, "appDescriptorFromData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "disabledAutoShortcuts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDatabase disabledAutoShortcutsFromData:](WFDatabase, "disabledAutoShortcutsFromData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [WFAutoShortcutsPreferences alloc];
    v9 = objc_msgSend(v3, "siriEnabled");
    v10 = objc_msgSend(v3, "spotlightEnabled");
    objc_msgSend(v3, "cloudKitMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "lastSyncedHash");

    v13 = -[WFAutoShortcutsPreferences initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:](v8, "initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:lastSyncedHash:", v5, v9, v10, v7, v11, v12);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)autoShortcutsPreferencesForBundleIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase autoShortcutsPreferencesForAppDescriptor:error:](self, "autoShortcutsPreferencesForAppDescriptor:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)coreDataAutoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  +[WFDatabase identifierForAppDescriptor:](WFDatabase, "identifierForAppDescriptor:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase coreDataAutoShortcutsPreferencesForIdentifier:error:](self, "coreDataAutoShortcutsPreferencesForIdentifier:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)coreDataAutoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  +[WFCoreDataAutoShortcutsPreferences fetchRequest](WFCoreDataAutoShortcutsPreferences, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v7, "setFetchLimit:", 1);
  -[WFDatabase context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeFetchRequest:error:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isSiriEnabledForAutoShortcutsWithAppDescriptor:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  -[WFDatabase autoShortcutsPreferencesForAppDescriptor:error:](self, "autoShortcutsPreferencesForAppDescriptor:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSiriEnabled");

  return v5;
}

- (BOOL)isSiriEnabledForAutoShortcutsWithBundleIdentifier:(id)a3 error:(id *)a4
{
  void *v6;

  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[WFDatabase isSiriEnabledForAutoShortcutsWithAppDescriptor:error:](self, "isSiriEnabledForAutoShortcutsWithAppDescriptor:error:", v6, a4);

  return (char)a4;
}

- (BOOL)isSiriEnabledForAutoShortcutsWithBundleIdentifier:(id)a3
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = -[WFDatabase isSiriEnabledForAutoShortcutsWithBundleIdentifier:error:](self, "isSiriEnabledForAutoShortcutsWithBundleIdentifier:error:", a3, &v7);
  v4 = v7;
  if (v4)
  {
    getWFDatabaseLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFDatabase(AutoShortcutsPreferences) isSiriEnabledForAutoShortcutsWithBundleIdentifier:]";
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Error fetching Siri auto shortcuts preference from the database: %{public}@", buf, 0x16u);
    }

  }
  return v3;
}

- (BOOL)setSiriAutoShortcutsEnablement:(BOOL)a3 forAppDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  getWFDatabaseLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[WFDatabase(AutoShortcutsPreferences) setSiriAutoShortcutsEnablement:forAppDescriptor:error:]";
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Setting Siri auto shortcuts enablement", buf, 0xCu);
  }

  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__WFDatabase_AutoShortcutsPreferences__setSiriAutoShortcutsEnablement_forAppDescriptor_error___block_invoke;
    v13[3] = &__block_descriptor_33_e44_v16__0__WFCoreDataAutoShortcutsPreferences_8l;
    v14 = a3;
    -[WFDatabase saveAutoShortcutsPreferencesForAppDescriptor:update:error:](self, "saveAutoShortcutsPreferencesForAppDescriptor:update:error:", v8, v13, a5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;
  }
  else
  {
    getWFDatabaseLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFDatabase(AutoShortcutsPreferences) setSiriAutoShortcutsEnablement:forAppDescriptor:error:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Attempting to set Siri auto shortcuts enablement but app descriptor is nil; skipping setting",
        buf,
        0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;

  v8 = a3;
  v10 = a4;
  -[WFDatabase trackMetricsForToggleType:source:bundleIdentifier:isEnabled:](self, "trackMetricsForToggleType:source:bundleIdentifier:isEnabled:", 0, a5, v10, v8);
  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = -[WFDatabase setSiriAutoShortcutsEnablement:forAppDescriptor:error:](self, "setSiriAutoShortcutsEnablement:forAppDescriptor:error:", v8, v11, a6);
  return (char)a6;
}

- (BOOL)isSpotlightEnabledForAutoShortcutsWithAppDescriptor:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  -[WFDatabase autoShortcutsPreferencesForAppDescriptor:error:](self, "autoShortcutsPreferencesForAppDescriptor:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSpotlightEnabled");

  return v5;
}

- (BOOL)isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:(id)a3 error:(id *)a4
{
  void *v6;

  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[WFDatabase isSpotlightEnabledForAutoShortcutsWithAppDescriptor:error:](self, "isSpotlightEnabledForAutoShortcutsWithAppDescriptor:error:", v6, a4);

  return (char)a4;
}

- (BOOL)isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:(id)a3
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = -[WFDatabase isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:error:](self, "isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:error:", a3, &v7);
  v4 = v7;
  if (v4)
  {
    getWFDatabaseLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFDatabase(AutoShortcutsPreferences) isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:]";
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Error fetching Spotlight auto shortcuts preference from the database: %{public}@", buf, 0x16u);
    }

  }
  return v3;
}

- (BOOL)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forAppDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  getWFDatabaseLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[WFDatabase(AutoShortcutsPreferences) setSpotlightAutoShortcutsEnablement:forAppDescriptor:error:]";
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Setting Spotlight auto shortcuts enablement", buf, 0xCu);
  }

  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__WFDatabase_AutoShortcutsPreferences__setSpotlightAutoShortcutsEnablement_forAppDescriptor_error___block_invoke;
    v13[3] = &__block_descriptor_33_e44_v16__0__WFCoreDataAutoShortcutsPreferences_8l;
    v14 = a3;
    -[WFDatabase saveAutoShortcutsPreferencesForAppDescriptor:update:error:](self, "saveAutoShortcutsPreferencesForAppDescriptor:update:error:", v8, v13, a5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;
  }
  else
  {
    getWFDatabaseLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFDatabase(AutoShortcutsPreferences) setSpotlightAutoShortcutsEnablement:forAppDescriptor:error:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Attempting to set Spotlight auto shortcuts enablement but app descriptor is nil; skipping update",
        buf,
        0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;

  v8 = a3;
  v10 = a4;
  -[WFDatabase trackMetricsForToggleType:source:bundleIdentifier:isEnabled:](self, "trackMetricsForToggleType:source:bundleIdentifier:isEnabled:", 1, a5, v10, v8);
  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = -[WFDatabase setSpotlightAutoShortcutsEnablement:forAppDescriptor:error:](self, "setSpotlightAutoShortcutsEnablement:forAppDescriptor:error:", v8, v11, a6);
  return (char)a6;
}

- (BOOL)isAutoShortcutDisabledForAppDescriptor:(id)a3 autoShortcutIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[WFDatabase autoShortcutsPreferencesForAppDescriptor:error:](self, "autoShortcutsPreferencesForAppDescriptor:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disabledAutoShortcuts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v10, "containsObject:", v8);

  return (char)self;
}

- (BOOL)isAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[WFDatabase isAutoShortcutDisabledForAppDescriptor:autoShortcutIdentifier:error:](self, "isAutoShortcutDisabledForAppDescriptor:autoShortcutIdentifier:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)isAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutIdentifier:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = -[WFDatabase isAutoShortcutDisabledForAppDescriptor:autoShortcutIdentifier:error:](self, "isAutoShortcutDisabledForAppDescriptor:autoShortcutIdentifier:error:", v7, v6, &v12);

  v9 = v12;
  if (v9)
  {
    getWFDatabaseLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFDatabase(AutoShortcutsPreferences) isAutoShortcutDisabledForBundleIdentifier:autoShortcutIdentifier:]";
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Error fetching auto shortcut disabled: %{public}@", buf, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)setAutoShortcutDisabledForAppDescriptor:(id)a3 autoShortcutDisabled:(BOOL)a4 autoShortcutIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  _QWORD v17[4];
  NSObject *v18;
  id *v19;
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  getWFDatabaseLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFDatabase(AutoShortcutsPreferences) setAutoShortcutDisabledForAppDescriptor:autoShortcutDisabled:autoShortc"
          "utIdentifier:error:]";
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Setting disabled auto shortcuts", buf, 0xCu);
  }

  if (v10)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __130__WFDatabase_AutoShortcutsPreferences__setAutoShortcutDisabledForAppDescriptor_autoShortcutDisabled_autoShortcutIdentifier_error___block_invoke;
    v17[3] = &unk_1E7AEFFC0;
    v20 = a4;
    v18 = v11;
    v19 = a6;
    -[WFDatabase saveAutoShortcutsPreferencesForAppDescriptor:update:error:](self, "saveAutoShortcutsPreferencesForAppDescriptor:update:error:", v10, v17, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

    v15 = v18;
  }
  else
  {
    getWFDatabaseLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFDatabase(AutoShortcutsPreferences) setAutoShortcutDisabledForAppDescriptor:autoShortcutDisabled:autoShor"
            "tcutIdentifier:error:]";
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Attempting to set disabled auto shortcuts but app descriptor is nil; skipping update",
        buf,
        0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)setAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutDisabled:(BOOL)a4 autoShortcutIdentifier:(id)a5 source:(unint64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  _BOOL8 v12;
  id v13;
  id v14;
  void *v15;

  v9 = a4;
  v12 = !a4;
  v13 = a5;
  v14 = a3;
  -[WFDatabase trackMetricsForToggleType:source:bundleIdentifier:isEnabled:](self, "trackMetricsForToggleType:source:bundleIdentifier:isEnabled:", 2, a6, v14, v12);
  +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:](WFAutoShortcutsPreferences, "appDescriptorWithBundleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a7) = -[WFDatabase setAutoShortcutDisabledForAppDescriptor:autoShortcutDisabled:autoShortcutIdentifier:error:](self, "setAutoShortcutDisabledForAppDescriptor:autoShortcutDisabled:autoShortcutIdentifier:error:", v15, v9, v13, a7);
  return (char)a7;
}

- (id)saveAutoShortcutsPreferencesForAppDescriptor:(id)a3 update:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+AutoShortcutsPreferences.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appDescriptor"));

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__WFDatabase_AutoShortcutsPreferences__saveAutoShortcutsPreferencesForAppDescriptor_update_error___block_invoke;
  v16[3] = &unk_1E7AEFFE8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("saving auto shortcut preferences for app"), v16, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultCoreDataAutoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  WFCoreDataAutoShortcutsPreferences *v8;
  void *v9;
  WFCoreDataAutoShortcutsPreferences *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  +[WFAutoShortcutsPreferences defaultSettingsForAppDescriptor:](WFAutoShortcutsPreferences, "defaultSettingsForAppDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [WFCoreDataAutoShortcutsPreferences alloc];
  -[WFDatabase context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFCoreDataAutoShortcutsPreferences initWithContext:](v8, "initWithContext:", v9);

  +[WFDatabase identifierForAppDescriptor:](WFDatabase, "identifierForAppDescriptor:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCoreDataAutoShortcutsPreferences setIdentifier:](v10, "setIdentifier:", v11);
  objc_msgSend(v7, "appDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDatabase dataFromObject:error:](WFDatabase, "dataFromObject:error:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataAutoShortcutsPreferences setAppDescriptor:](v10, "setAppDescriptor:", v13);

  objc_msgSend(v7, "appName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataAutoShortcutsPreferences setAppName:](v10, "setAppName:", v14);

  objc_msgSend(v7, "disabledAutoShortcuts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDatabase dataFromObject:error:](WFDatabase, "dataFromObject:error:", v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataAutoShortcutsPreferences setDisabledAutoShortcuts:](v10, "setDisabledAutoShortcuts:", v16);

  -[WFCoreDataAutoShortcutsPreferences setSiriEnabled:](v10, "setSiriEnabled:", objc_msgSend(v7, "isSiriEnabled"));
  -[WFCoreDataAutoShortcutsPreferences setSpotlightEnabled:](v10, "setSpotlightEnabled:", objc_msgSend(v7, "isSpotlightEnabled"));

  return v10;
}

- (BOOL)updateAutoShortcutsPreferencesWithNewPreferences:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFDatabaseLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFDatabase(AutoShortcutsPreferences) updateAutoShortcutsPreferencesWithNewPreferences:error:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Updating local auto shortcuts preferences with new preferences", buf, 0xCu);
  }

  objc_msgSend(v6, "appDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "appDescriptor");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__WFDatabase_AutoShortcutsPreferences__updateAutoShortcutsPreferencesWithNewPreferences_error___block_invoke;
    v13[3] = &unk_1E7AF0010;
    v14 = v6;
    v15 = a4;
    -[WFDatabase saveAutoShortcutsPreferencesForAppDescriptor:update:error:](self, "saveAutoShortcutsPreferencesForAppDescriptor:update:error:", v9, v13, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    getWFDatabaseLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFDatabase(AutoShortcutsPreferences) updateAutoShortcutsPreferencesWithNewPreferences:error:]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Attempting to update auto shortcuts preferences but app descriptor is nil; skipping update",
        buf,
        0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)mergeAutoShortcutsPreferencesWithNewPreferences:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFDatabaseLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Merging local auto shortcuts preferences with new preferences", buf, 0xCu);
  }

  objc_msgSend(v6, "appDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "appDescriptor");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__WFDatabase_AutoShortcutsPreferences__mergeAutoShortcutsPreferencesWithNewPreferences_error___block_invoke;
    v13[3] = &unk_1E7AF0010;
    v14 = v6;
    v15 = a4;
    -[WFDatabase saveAutoShortcutsPreferencesForAppDescriptor:update:error:](self, "saveAutoShortcutsPreferencesForAppDescriptor:update:error:", v9, v13, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    getWFDatabaseLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Attempting to merge auto shortcuts preferences but app descriptor is nil; skipping merge",
        buf,
        0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)deleteAutoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFDatabaseLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WFDatabase(AutoShortcutsPreferences) deleteAutoShortcutsPreferencesForIdentifier:error:]";
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Deleting auto shortcut preferences with identifier: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__WFDatabase_AutoShortcutsPreferences__deleteAutoShortcutsPreferencesForIdentifier_error___block_invoke;
  v11[3] = &unk_1E7AF0038;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("deleting auto shortcut preferences by id"), v11, a4);

  return a4 == 0;
}

- (void)trackMetricsForToggleType:(unint64_t)a3 source:(unint64_t)a4 bundleIdentifier:(id)a5 isEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  WFAutoShortcutToggleEvent *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  WFAutoShortcutToggleEvent *v15;

  v6 = a6;
  v9 = a5;
  v10 = objc_alloc_init(WFAutoShortcutToggleEvent);
  v15 = v10;
  v11 = CFSTR("Siri");
  if (a4 == 1)
    v11 = CFSTR("Spotlight");
  if (a4 == 2)
    v12 = CFSTR("Shortcuts");
  else
    v12 = v11;
  -[WFAutoShortcutToggleEvent setSource:](v10, "setSource:", v12);
  v13 = CFSTR("AppSiri");
  if (a3 == 1)
    v13 = CFSTR("AppSpotlight");
  if (a3 == 2)
    v14 = CFSTR("Spotlight");
  else
    v14 = v13;
  -[WFAutoShortcutToggleEvent setToggleType:](v15, "setToggleType:", v14);
  -[WFAutoShortcutToggleEvent setEnabled:](v15, "setEnabled:", v6);
  -[WFAutoShortcutToggleEvent setBundleIdentifier:](v15, "setBundleIdentifier:", v9);

  -[WFEvent track](v15, "track");
}

uint64_t __90__WFDatabase_AutoShortcutsPreferences__deleteAutoShortcutsPreferencesForIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "coreDataAutoShortcutsPreferencesForIdentifier:error:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteObject:", v3);

  }
  return 0;
}

void __94__WFDatabase_AutoShortcutsPreferences__mergeAutoShortcutsPreferencesWithNewPreferences_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "disabledAutoShortcuts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDatabase disabledAutoShortcutsFromData:](WFDatabase, "disabledAutoShortcutsFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v5);
  objc_msgSend(*(id *)(a1 + 32), "disabledAutoShortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);

  +[WFDatabase dataFromObject:error:](WFDatabase, "dataFromObject:error:", v6, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisabledAutoShortcuts:", v9);

  if (objc_msgSend(v3, "siriEnabled"))
    v10 = objc_msgSend(*(id *)(a1 + 32), "isSiriEnabled");
  else
    v10 = 0;
  objc_msgSend(v3, "setSiriEnabled:", v10);
  if (objc_msgSend(v3, "spotlightEnabled"))
    v11 = objc_msgSend(*(id *)(a1 + 32), "isSpotlightEnabled");
  else
    v11 = 0;
  objc_msgSend(v3, "setSpotlightEnabled:", v11);
  objc_msgSend(v3, "cloudKitMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cloudKitMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemRequest recordFromSystemFieldsData:error:](WFCloudKitItemRequest, "recordFromSystemFieldsData:error:", v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[WFCloudKitItemRequest recordFromSystemFieldsData:error:](WFCloudKitItemRequest, "recordFromSystemFieldsData:error:", v12, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    getWFDatabaseLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 136315650;
      v18 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]_block_invoke";
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s CloudKit metadata exists for auto shortcuts preferences. Existing record: %{public}@, new record: %{public}@", (uint8_t *)&v17, 0x20u);
    }

  }
  else
  {
    getWFDatabaseLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = 136315394;
      v18 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]_block_invoke";
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s No existing CloudKit metadata for auto shortcuts preferences - setting incoming metdata. New record: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  objc_msgSend(v3, "setCloudKitMetadata:", v13);
}

void __95__WFDatabase_AutoShortcutsPreferences__updateAutoShortcutsPreferencesWithNewPreferences_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDatabase dataFromObject:error:](WFDatabase, "dataFromObject:error:", v4, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppDescriptor:", v5);

    objc_msgSend(*(id *)(a1 + 32), "appName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppName:", v6);

    objc_msgSend(*(id *)(a1 + 32), "disabledAutoShortcuts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDatabase dataFromObject:error:](WFDatabase, "dataFromObject:error:", v7, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDisabledAutoShortcuts:", v8);

    objc_msgSend(v3, "setSiriEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSiriEnabled"));
    objc_msgSend(v3, "setSpotlightEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSpotlightEnabled"));
    objc_msgSend(*(id *)(a1 + 32), "cloudKitMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCloudKitMetadata:", v9);

    objc_msgSend(v3, "setLastSyncedHash:", objc_msgSend(*(id *)(a1 + 32), "lastSyncedHash"));
  }
  else
  {
    getWFDatabaseLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[WFDatabase(AutoShortcutsPreferences) updateAutoShortcutsPreferencesWithNewPreferences:error:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Attempting to update auto shortcuts preferences but they were not created because app descriptor is nil", (uint8_t *)&v11, 0xCu);
    }

  }
}

id __98__WFDatabase_AutoShortcutsPreferences__saveAutoShortcutsPreferencesForAppDescriptor_update_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "coreDataAutoShortcutsPreferencesForAppDescriptor:error:", *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultCoreDataAutoShortcutsPreferencesForAppDescriptor:error:", *(_QWORD *)(a1 + 40), a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return v4;
}

void __130__WFDatabase_AutoShortcutsPreferences__setAutoShortcutDisabledForAppDescriptor_autoShortcutDisabled_autoShortcutIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "disabledAutoShortcuts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDatabase disabledAutoShortcutsFromData:](WFDatabase, "disabledAutoShortcutsFromData:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v11, "mutableCopy");
  v6 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32));
  v7 = v6;
  v8 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48) && (v6 & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
    v8 = *(unsigned __int8 *)(a1 + 48);
  }
  if (v8)
    v9 = 0;
  else
    v9 = v7;
  if (v9 == 1)
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  +[WFDatabase dataFromObject:error:](WFDatabase, "dataFromObject:error:", v5, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisabledAutoShortcuts:", v10);

}

uint64_t __99__WFDatabase_AutoShortcutsPreferences__setSpotlightAutoShortcutsEnablement_forAppDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSpotlightEnabled:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __94__WFDatabase_AutoShortcutsPreferences__setSiriAutoShortcutsEnablement_forAppDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSiriEnabled:", *(unsigned __int8 *)(a1 + 32));
}

id __84__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "coreDataAutoShortcutsPreferencesForIdentifier:error:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __87__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForAppDescriptor_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "coreDataAutoShortcutsPreferencesForAppDescriptor:error:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:", v3);
  else
    +[WFAutoShortcutsPreferences defaultSettingsForAppDescriptor:](WFAutoShortcutsPreferences, "defaultSettingsForAppDescriptor:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dataFromObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)identifierForAppDescriptor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = +[WFAutoShortcutsPreferences crossPlatformHashForAppDescriptor:](WFAutoShortcutsPreferences, "crossPlatformHashForAppDescriptor:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)disabledAutoShortcutsFromData:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFDatabaseLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Unarchiving disabled auto shortcuts", buf, 0xCu);
  }

  if (v3)
  {
    v5 = (void *)objc_opt_new();
    v26 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v26);
    v7 = v26;
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v12, *MEMORY[0x1E0CB2CD0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      getWFDatabaseLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
        v29 = 2114;
        v30 = v7;
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: failed with error %{public}@", buf, 0x16u);
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      getWFDatabaseLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
        v29 = 2114;
        v30 = v13;
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: found array %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_21;
        getWFDatabaseLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
          v29 = 2114;
          v30 = v13;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: found dictionary %{public}@", buf, 0x16u);
        }

        v23 = (void *)MEMORY[0x1E0C99E60];
        v24 = v13;
        objc_msgSend(v24, "allKeys");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setWithArray:", v25);
        v20 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v25;
LABEL_20:

        v5 = (void *)v20;
LABEL_21:
        v18 = v5;

        goto LABEL_22;
      }
      getWFDatabaseLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
        v29 = 2114;
        v30 = v13;
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: found set %{public}@", buf, 0x16u);
      }

      v16 = v13;
    }
    v20 = (uint64_t)v16;
    goto LABEL_20;
  }
  getWFDatabaseLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
    _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: data is nil; returning empty disabled auto shortcuts",
      buf,
      0xCu);
  }

  v18 = (id)objc_opt_new();
LABEL_22:

  return v18;
}

+ (id)appDescriptorFromData:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFDatabaseLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "+[WFDatabase(AutoShortcutsPreferences) appDescriptorFromData:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Unarchiving app descriptor for auto shortcuts preferences", buf, 0xCu);
  }

  if (v3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v6)
    {
      getWFDatabaseLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "+[WFDatabase(AutoShortcutsPreferences) appDescriptorFromData:]";
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Unarchiving app descriptor for auto shortcuts preferences: failed with error %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    getWFDatabaseLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "+[WFDatabase(AutoShortcutsPreferences) appDescriptorFromData:]";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Unarchiving app descriptor for auto shortcuts preferences: data is nil; returning nil app descriptor",
        buf,
        0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFActionOutputVariable *v11;
  void *v12;
  WFActionOutputVariable *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = 0;
  +[WFWorkflow workflowWithReference:database:error:](WFWorkflow, "workflowWithReference:database:error:", a3, self, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);
  objc_msgSend(v5, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "generateUUIDIfNecessaryWithUUIDProvider:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [WFActionOutputVariable alloc];
  objc_msgSend(v9, "outputName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFActionOutputVariable initWithOutputUUID:outputName:variableProvider:aggrandizements:](v11, "initWithOutputUUID:outputName:variableProvider:aggrandizements:", v10, v12, v9, 0);

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.output"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "inputParameter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v16, "stateClass")), "initWithVariable:", v13);
  objc_msgSend(v16, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setParameterState:forKey:", v17, v18);

  objc_msgSend(v5, "addAction:", v15);
  objc_msgSend(v5, "save");

}

- (id)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  WFSmartPromptApprovalResult *v19;
  NSObject *v20;
  void *v21;
  WFSmartPromptState *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  WFSmartPromptState *v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  WFSmartPromptState *v34;
  void *v35;
  WFSmartPromptState *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  WFSmartPromptState *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  BOOL v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  WFSmartPromptState *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t m;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  WFSmartPromptApprovalResult *v100;
  WFSmartPromptDatabaseLookupResult *v101;
  WFSmartPromptDatabaseLookupResult *v102;
  void *v103;
  WFSmartPromptApprovalResult *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  WFSmartPromptApprovalResult *v110;
  void *v111;
  NSObject *v113;
  uint64_t v114;
  void *v115;
  WFSmartPromptState *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  uint64_t v122;
  void *v123;
  WFSmartPromptApprovalResult *v124;
  uint64_t v125;
  WFSmartPromptState *v126;
  void *v127;
  void *v128;
  void *v129;
  WFSmartPromptState *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  _BYTE v165[128];
  uint8_t v166[128];
  uint8_t buf[4];
  const char *v168;
  __int16 v169;
  id v170;
  __int16 v171;
  id v172;
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v117 = a6;
  v136 = a8;
  v119 = a9;
  if (!v16)
  {
    objc_msgSend(v136, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:](self, "generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:", v117, a7, v17);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "attributionSetByReplacingAccountWithAppOrigins");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[WFSmartPromptApprovalResult initWithActionUUID:]([WFSmartPromptApprovalResult alloc], "initWithActionUUID:", v16);
  v118 = v18;
  if (objc_msgSend(v18, "derivedDisclosureLevel") == 1 || objc_msgSend(v15, "promptingBehaviour"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "promptingBehaviour"))
    {
      getWFSecurityLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315395;
        v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIde"
               "ntifier:actionIndex:reference:allowedOnceStates:]";
        v169 = 2113;
        v170 = v21;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Content destination %{private}@ requires first run approval, will prompt for special request", buf, 0x16u);

      }
      v22 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("ActionWildcard"), 0, v16, v15, CFSTR("Undefined"));
      objc_msgSend(v120, "addObject:", v22);

    }
    v116 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("UserWildcard"), 0, v16, v15, CFSTR("Allow"));
    -[WFDatabase fetchFirstAllowedStateMatching:actionUUID:forReference:](self, "fetchFirstAllowedStateMatching:actionUUID:forReference:");
    v133 = v16;
    v134 = v15;
    v124 = v19;
    v114 = objc_claimAutoreleasedReturnValue();
    if (v114)
    {
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      objc_msgSend(v118, "attributions", v114);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v160, v175, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v161;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v161 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
            if (objc_msgSend(v28, "disclosureLevel") == 1)
            {
              v29 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("Normal"), v28, v16, v15, CFSTR("Allow"));
              v159 = 0;
              v30 = -[WFDatabase saveSmartPromptState:reference:error:](self, "saveSmartPromptState:reference:error:", v29, v136, &v159);
              v31 = v159;
              if (!v30)
              {
                getWFSecurityLogObject();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID"
                         ":actionIdentifier:actionIndex:reference:allowedOnceStates:]";
                  v169 = 2112;
                  v170 = v31;
                  _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_ERROR, "%s Failed to save smart prompt state: %@", buf, 0x16u);
                }

              }
              v16 = v133;
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v160, v175, 16);
        }
        while (v25);
      }

      getWFSecurityLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIde"
               "ntifier:actionIndex:reference:allowedOnceStates:]";
        v169 = 2113;
        v170 = v15;
        _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_DEFAULT, "%s Flattened wildcard smart prompt with content destination: %{private}@", buf, 0x16u);
      }

      v19 = v124;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = [WFSmartPromptState alloc];
      objc_msgSend(MEMORY[0x1E0D140C0], "locationMatchingAnyHostname");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:](v34, "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("UserWildcard"), 0, v16, v35, CFSTR("Allow"));

      -[WFDatabase fetchFirstAllowedStateMatching:actionUUID:forReference:](self, "fetchFirstAllowedStateMatching:actionUUID:forReference:", v36, v16, v136);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v128 = v37;
        v130 = v36;
        v38 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v118, "attributions");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "arrayWithCapacity:", objc_msgSend(v39, "count") + 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v126 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("ActionWildcard"), 0, v16, v15, CFSTR("Allow"));
        objc_msgSend(v40, "addObject:");
        v157 = 0u;
        v158 = 0u;
        v155 = 0u;
        v156 = 0u;
        objc_msgSend(v118, "attributions");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v156;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v156 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * j);
              if (objc_msgSend(v46, "disclosureLevel", v114) == 1)
              {
                v47 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("Normal"), v46, v133, v15, CFSTR("Allow"));
                objc_msgSend(v40, "addObject:", v47);

              }
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
          }
          while (v43);
        }

        v153 = 0u;
        v154 = 0u;
        v151 = 0u;
        v152 = 0u;
        v48 = v40;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v151, v173, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v152;
          do
          {
            for (k = 0; k != v50; ++k)
            {
              if (*(_QWORD *)v152 != v51)
                objc_enumerationMutation(v48);
              v53 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * k);
              v150 = 0;
              v54 = -[WFDatabase saveSmartPromptState:reference:error:](self, "saveSmartPromptState:reference:error:", v53, v136, &v150, v114);
              v55 = v150;
              if (!v54)
              {
                getWFSecurityLogObject();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID"
                         ":actionIdentifier:actionIndex:reference:allowedOnceStates:]";
                  v169 = 2112;
                  v170 = v55;
                  _os_log_impl(&dword_1C15B3000, v56, OS_LOG_TYPE_ERROR, "%s Failed to save smart prompt state: %@", buf, 0x16u);
                }

              }
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v151, v173, 16);
          }
          while (v50);
        }

        getWFSecurityLogObject();
        v57 = objc_claimAutoreleasedReturnValue();
        v19 = v124;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionI"
                 "dentifier:actionIndex:reference:allowedOnceStates:]";
          v169 = 2112;
          v170 = v15;
          v171 = 2112;
          v172 = v48;
          _os_log_impl(&dword_1C15B3000, v57, OS_LOG_TYPE_DEFAULT, "%s Flattened network wildcard with content destination: %@ into states %@", buf, 0x20u);
        }

        v37 = v128;
        v36 = v130;
      }

    }
    if (objc_msgSend(v15, "promptingBehaviour", v114) != 2)
    {
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      objc_msgSend(v118, "attributions");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v146, v166, 16);
      if (!v59)
        goto LABEL_92;
      v60 = v59;
      v61 = *(_QWORD *)v147;
      v122 = *(_QWORD *)v147;
      v123 = v58;
      while (1)
      {
        v62 = 0;
        v125 = v60;
        do
        {
          if (*(_QWORD *)v147 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v62);
          if (objc_msgSend(v63, "disclosureLevel") == 1)
          {
            v132 = v63;
            objc_msgSend(v63, "origin");
            v64 = (id)objc_claimAutoreleasedReturnValue();
            v65 = v15;
            if ((objc_msgSend(v64, "isEqual:", v65) & 1) != 0)
              goto LABEL_73;
            v66 = v64;
            if (v66)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v67 = v66;
              else
                v67 = 0;
            }
            else
            {
              v67 = 0;
            }
            v68 = v67;

            v69 = v65;
            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v70 = v69;
              else
                v70 = 0;
            }
            else
            {
              v70 = 0;
            }
            v71 = v70;

            objc_msgSend(v68, "appDescriptor");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "bundleIdentifier");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "appDescriptor");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "bundleIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v71;
            v131 = v68;
            if (objc_msgSend(v72, "isEqualToString:", v74))
            {
              objc_msgSend(v68, "accountIdentifier");
              v121 = v69;
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "accountIdentifier");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v75, "isEqualToString:", v76);

              v69 = v121;
              if ((v77 & 1) != 0)
              {

                v15 = v134;
                v58 = v123;
                v19 = v124;
                v61 = v122;
                v60 = v125;
LABEL_73:

LABEL_86:
                getWFSecurityLogObject();
                v89 = (WFSmartPromptState *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v89->super, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v132, "origin");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315395;
                  v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID"
                         ":actionIdentifier:actionIndex:reference:allowedOnceStates:]";
                  v169 = 2113;
                  v170 = v90;
                  _os_log_impl(&dword_1C15B3000, &v89->super, OS_LOG_TYPE_DEFAULT, "%s Ignoring content attribution with origin %{private}@, as source and destination of content are the same", buf, 0x16u);

                  v60 = v125;
                }
                goto LABEL_89;
              }
            }
            else
            {

            }
            v78 = v66;
            v19 = v124;
            if (v66)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v79 = v78;
              else
                v79 = 0;
            }
            else
            {
              v79 = 0;
            }
            v80 = v79;

            v81 = v69;
            if (v134)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v82 = v81;
              else
                v82 = 0;
            }
            else
            {
              v82 = 0;
            }
            v83 = v82;

            objc_msgSend(v80, "appDescriptor");
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v84, "bundleIdentifier");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "appDescriptor");
            v86 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v86, "bundleIdentifier");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v85, "isEqualToString:", v87);

            v15 = v134;
            v61 = v122;
            v58 = v123;
            v60 = v125;
            if ((v88 & 1) != 0)
              goto LABEL_86;
            v89 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("Normal"), v132, v133, v81, CFSTR("Undefined"));
            objc_msgSend(v120, "addObject:", v89);
LABEL_89:

          }
          ++v62;
        }
        while (v60 != v62);
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v146, v166, 16);
        if (!v60)
        {
LABEL_92:

          break;
        }
      }
    }
    if (objc_msgSend(v119, "count"))
    {
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v91 = v120;
      v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v142, v165, 16);
      if (v92)
      {
        v93 = v92;
        v94 = *(_QWORD *)v143;
        v95 = MEMORY[0x1E0C809B0];
        while (2)
        {
          for (m = 0; m != v93; ++m)
          {
            if (*(_QWORD *)v143 != v94)
              objc_enumerationMutation(v91);
            v97 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * m);
            v141[0] = v95;
            v141[1] = 3221225472;
            v141[2] = __154__WFDatabase_SmartPrompts__approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates___block_invoke;
            v141[3] = &unk_1E7AF0218;
            v141[4] = v97;
            objc_msgSend(v119, "objectsPassingTest:", v141);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend(v98, "count");

            if (!v99)
            {

              v19 = v124;
              goto LABEL_104;
            }
          }
          v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v142, v165, 16);
          if (v93)
            continue;
          break;
        }
      }

      v16 = v133;
      v100 = -[WFSmartPromptApprovalResult initWithActionUUID:]([WFSmartPromptApprovalResult alloc], "initWithActionUUID:", v133);
      v101 = [WFSmartPromptDatabaseLookupResult alloc];
      v102 = -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:](v101, "initWithAllowedStates:deniedStates:undefinedStates:", v91, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
      -[WFSmartPromptApprovalResult resultByAddingDatabaseResult:](v100, "resultByAddingDatabaseResult:", v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      v104 = v124;
    }
    else
    {
LABEL_104:
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v105 = v120;
      v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v137, v164, 16);
      if (v106)
      {
        v107 = v106;
        v108 = *(_QWORD *)v138;
        v16 = v133;
        do
        {
          v109 = 0;
          v110 = v19;
          do
          {
            if (*(_QWORD *)v138 != v108)
              objc_enumerationMutation(v105);
            -[WFDatabase performDatabaseLookupForState:actionUUID:reference:](self, "performDatabaseLookupForState:actionUUID:reference:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * v109), v133, v136);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFSmartPromptApprovalResult resultByAddingDatabaseResult:](v110, "resultByAddingDatabaseResult:", v111);
            v19 = (WFSmartPromptApprovalResult *)objc_claimAutoreleasedReturnValue();

            ++v109;
            v110 = v19;
          }
          while (v107 != v109);
          v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v137, v164, 16);
        }
        while (v107);
      }
      else
      {
        v16 = v133;
      }

      v104 = v19;
      v103 = v104;
    }

    v15 = v134;
  }
  else
  {
    getWFSecurityLogObject();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v168 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIdent"
             "ifier:actionIndex:reference:allowedOnceStates:]";
      _os_log_impl(&dword_1C15B3000, v113, OS_LOG_TYPE_DEFAULT, "%s The current content attribution set has public disclosure level, no approval required.", buf, 0xCu);
    }

    v104 = v19;
    v103 = v104;
  }

  return v103;
}

- (id)fetchFirstAllowedStateMatching:(id)a3 actionUUID:(id)a4 forReference:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFDatabase performDatabaseLookupForState:actionUUID:reference:](self, "performDatabaseLookupForState:actionUUID:reference:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "allowedStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)performDatabaseLookupForState:(id)a3 actionUUID:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WFDatabase *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  WFSmartPromptDatabaseLookupResult *v18;
  id v19;
  WFSmartPromptDatabaseLookupResult *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  NSObject *v33;
  WFSmartPromptDatabaseLookupResult *v34;
  void *v35;
  void *v36;
  WFSmartPromptDatabaseLookupResult *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  NSObject *v61;
  WFSmartPromptDatabaseLookupResult *v62;
  NSObject *v63;
  void *v64;
  WFSmartPromptDatabaseLookupResult *v65;
  void *v66;
  id *v67;
  void *v68;
  BOOL v69;
  id v70;
  void *v71;
  WFSmartPromptDatabaseLookupResult *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  _BOOL4 v79;
  WFSmartPromptDatabaseLookupResult *v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  WFSmartPromptDatabaseLookupResult *v84;
  id v86;
  id v87;
  int v88;
  void *v89;
  uint64_t v90;
  id v91;
  WFDatabase *v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  _BYTE v108[128];
  _BYTE v109[128];
  id v110;
  uint8_t buf[4];
  const char *v112;
  __int16 v113;
  id v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[WFShortcutsSecuritySettings allowsSharingLargeAmountsOfData](WFShortcutsSecuritySettings, "allowsSharingLargeAmountsOfData"))
  {
    objc_msgSend(v8, "sourceContentAttribution");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self;
    v13 = objc_msgSend(v11, "count");
    objc_msgSend(v8, "sourceContentAttribution");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[WFContentExfiltrationQuantityInfo sharingItemCountLimitForContentWithAttribution:](WFContentExfiltrationQuantityInfo, "sharingItemCountLimitForContentWithAttribution:", v14);

    v16 = v13 > v15;
    self = v12;
    if (v16)
    {
      objc_msgSend(v8, "stateWithStatus:", CFSTR("Restricted"));
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = [WFSmartPromptDatabaseLookupResult alloc];
      v115[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:](v18, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v19);
      v8 = (id)v17;
      goto LABEL_67;
    }
  }
  -[WFDatabase smartPromptStatesForReference:actionUUID:](self, "smartPromptStatesForReference:actionUUID:", v10, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "count"))
  {
    -[WFDatabase smartPromptStatesForReference:](self, "smartPromptStatesForReference:", v10);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v19, "count"))
    {
      getWFWorkflowExecutionLogObject();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "name");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
        v113 = 2112;
        v114 = v64;
        _os_log_impl(&dword_1C15B3000, v63, OS_LOG_TYPE_DEFAULT, "%s No saved smart prompt states found for workflow '%@'", buf, 0x16u);

      }
      v65 = [WFSmartPromptDatabaseLookupResult alloc];
      v110 = v8;
      v66 = (void *)MEMORY[0x1E0C99D20];
      v67 = &v110;
      goto LABEL_60;
    }
    v21 = v19;
  }
  v92 = self;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v19 = v21;
  v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
  if (v22)
  {
    v23 = v22;
    v24 = v19;
    v25 = 0;
    v26 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v99 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        -[WFDatabase migrateAccountStateToAppOriginIfNecessary:reference:actionUUID:](v92, "migrateAccountStateToAppOriginIfNecessary:reference:actionUUID:", v28, v10, v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "matches:", v8))
        {
          v30 = v28;

          v25 = v30;
        }

      }
      v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
    }
    while (v23);
    v19 = v24;

    if (v25)
    {
      objc_msgSend(v25, "status");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("Disallow"));

      if (v32)
      {
        getWFSecurityLogObject();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315395;
          v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
          v113 = 2113;
          v114 = v25;
          _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_DEFAULT, "%s Will stop execution because user selected Do Not Allow: %{private}@", buf, 0x16u);
        }

        v34 = [WFSmartPromptDatabaseLookupResult alloc];
        v105 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0C9AA60];
        v37 = v34;
        v38 = v35;
        v39 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend(v25, "status");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("Undefined"));

        if (v60)
        {
          getWFSecurityLogObject();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315395;
            v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
            v113 = 2113;
            v114 = v25;
            _os_log_impl(&dword_1C15B3000, v61, OS_LOG_TYPE_DEFAULT, "%s Will prompt because user selected Ask Each Time: %{private}@", buf, 0x16u);
          }

          v62 = [WFSmartPromptDatabaseLookupResult alloc];
          v104 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1E0C9AA60];
          v37 = v62;
          v38 = (void *)MEMORY[0x1E0C9AA60];
          v39 = v35;
        }
        else
        {
          objc_msgSend(v25, "sourceContentAttribution");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "count");

          objc_msgSend(v8, "sourceContentAttribution");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "count");

          LODWORD(v76) = -[WFDatabase shouldPromptForCurrentContentItemCount:previousCount:](v92, "shouldPromptForCurrentContentItemCount:previousCount:", v77, v75);
          getWFSecurityLogObject();
          v78 = objc_claimAutoreleasedReturnValue();
          v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v76)
          {
            if (v79)
            {
              *(_DWORD *)buf = 136315395;
              v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
              v113 = 2113;
              v114 = v25;
              _os_log_impl(&dword_1C15B3000, v78, OS_LOG_TYPE_DEFAULT, "%s Will prompt because exfiltrating more data than saved authorization: %{private}@", buf, 0x16u);
            }

            v80 = [WFSmartPromptDatabaseLookupResult alloc];
            v103 = v8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sourceContentAttribution");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:previousAttribution:](v80, "initWithAllowedStates:deniedStates:undefinedStates:previousAttribution:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v35, v81);

            goto LABEL_65;
          }
          if (v79)
          {
            *(_DWORD *)buf = 136315395;
            v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
            v113 = 2113;
            v114 = v25;
            _os_log_impl(&dword_1C15B3000, v78, OS_LOG_TYPE_DEFAULT, "%s Will not prompt because we have a valid authorization saved: %{private}@", buf, 0x16u);
          }

          v84 = [WFSmartPromptDatabaseLookupResult alloc];
          v102 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)MEMORY[0x1E0C9AA60];
          v37 = v84;
          v36 = v35;
          v39 = (void *)MEMORY[0x1E0C9AA60];
        }
      }
      v20 = -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:](v37, "initWithAllowedStates:deniedStates:undefinedStates:", v36, v38, v39);
LABEL_65:

      goto LABEL_66;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "mode");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("ActionWildcard"));

  if (!v41)
    goto LABEL_57;
  v86 = v19;
  v87 = v10;
  -[WFDatabase smartPromptStatesForReference:](v92, "smartPromptStatesForReference:", v10);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
  if (!v42)
    goto LABEL_56;
  v43 = v42;
  v44 = *(_QWORD *)v95;
  v45 = CFSTR("ActionWildcard");
  v91 = v9;
  v89 = v25;
LABEL_26:
  v46 = 0;
  v90 = v43;
  while (1)
  {
    if (*(_QWORD *)v95 != v44)
      objc_enumerationMutation(v25);
    v47 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v46);
    objc_msgSend(v47, "mode");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v48, "isEqualToString:", v45))
      goto LABEL_36;
    objc_msgSend(v47, "actionUUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionUUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v49, "isEqualToString:", v50) & 1) != 0)
      goto LABEL_35;
    v51 = v45;
    v52 = v44;
    objc_msgSend(v47, "contentDestination");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v8;
    v55 = v8;
    v56 = (void *)v53;
    objc_msgSend(v55, "contentDestination");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v56, "isEqual:", v57))
    {

      v44 = v52;
      v45 = v51;
      v8 = v54;
      v25 = v89;
      v43 = v90;
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    objc_msgSend(v47, "status");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v58, "isEqualToString:", CFSTR("Allow"));

    v44 = v52;
    v45 = v51;
    v8 = v54;
    v25 = v89;
    v43 = v90;
    if (v88)
      break;
LABEL_37:
    ++v46;
    v9 = v91;
    if (v43 == v46)
    {
      v43 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
      if (v43)
        goto LABEL_26;
      goto LABEL_56;
    }
  }
  objc_msgSend(v8, "stateWithStatus:", CFSTR("Allow"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  v69 = -[WFDatabase saveSmartPromptState:reference:error:](v92, "saveSmartPromptState:reference:error:", v68, v87, &v93);
  v70 = v93;
  v71 = v70;
  v9 = v91;
  if (v69)
  {
    v72 = [WFSmartPromptDatabaseLookupResult alloc];
    v107 = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:](v72, "initWithAllowedStates:deniedStates:undefinedStates:", v73, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

    v19 = v86;
    v10 = v87;
    goto LABEL_66;
  }
  getWFSecurityLogObject();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
    _os_log_impl(&dword_1C15B3000, v82, OS_LOG_TYPE_ERROR, "%s Failed to save new smart prompt state.", buf, 0xCu);
  }

LABEL_56:
  v19 = v86;
  v10 = v87;
LABEL_57:
  getWFWorkflowExecutionLogObject();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
    v113 = 2113;
    v114 = v8;
    _os_log_impl(&dword_1C15B3000, v83, OS_LOG_TYPE_DEFAULT, "%s Will prompt because no state in database matches lookup state: %{private}@", buf, 0x16u);
  }

  v65 = [WFSmartPromptDatabaseLookupResult alloc];
  v106 = v8;
  v66 = (void *)MEMORY[0x1E0C99D20];
  v67 = &v106;
LABEL_60:
  objc_msgSend(v66, "arrayWithObjects:count:", v67, 1);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v20 = -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:](v65, "initWithAllowedStates:deniedStates:undefinedStates:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v25);
LABEL_66:

LABEL_67:
  return v20;
}

- (BOOL)shouldPromptForCurrentContentItemCount:(unint64_t)a3 previousCount:(unint64_t)a4
{
  NSObject *v6;
  BOOL v8;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  getWFSecurityLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "-[WFDatabase(SmartPrompts) shouldPromptForCurrentContentItemCount:previousCount:]";
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEBUG, "%s Smart Prompts counts: current = %lu, previousCount = %lu", (uint8_t *)&v10, 0x20u);
  }

  v8 = a3 > 0x64 && a4 < 0x65;
  if (a4 <= 0x19)
    v8 = a3 > 0x19;
  if (a4 <= 5)
    return a3 > 5;
  else
    return v8;
}

- (id)migrateAccountStateToAppOriginIfNecessary:(id)a3 reference:(id)a4 actionUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "sourceContentAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "origin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    getWFWorkflowExecutionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFDatabase(SmartPrompts) migrateAccountStateToAppOriginIfNecessary:reference:actionUUID:]";
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Migrating saved state from account to app origin: %@", buf, 0x16u);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__WFDatabase_SmartPrompts__migrateAccountStateToAppOriginIfNecessary_reference_actionUUID___block_invoke;
    v19[3] = &unk_1E7AF0240;
    v19[4] = self;
    v13 = v7;
    v20 = v13;
    v21 = v8;
    v18 = 0;
    -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("migrating smart prompt state"), v19, &v18);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (v15)
    {
      getWFSecurityLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[WFDatabase(SmartPrompts) migrateAccountStateToAppOriginIfNecessary:reference:actionUUID:]";
        v24 = 2114;
        v25 = v13;
        v26 = 2114;
        v27 = v15;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Failed to migrate smart prompt state: %{public}@, error: %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v14 = v7;
  }

  return v14;
}

- (void)createSmartPromptStatesForInsertedActions:(id)a3 forReference:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  WFSmartPromptState *v18;
  void *v19;
  WFSmartPromptState *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFSecurityLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
    v38 = 2048;
    v39 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEBUG, "%s Will attempt to create SP states for %lu inserted actions.", buf, 0x16u);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v33;
    *(_QWORD *)&v10 = 136315650;
    v28 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v14, "allowsAnyURLDestinationWhenAddedToWorkflowByUser", v28))
        {
          getWFSecurityLogObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
            v38 = 2112;
            v39 = (uint64_t)v16;
            _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEBUG, "%s Creating a network wildcard permission for action %@", buf, 0x16u);

          }
          objc_msgSend(v14, "generateUUIDIfNecessaryWithUUIDProvider:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = [WFSmartPromptState alloc];
          objc_msgSend(MEMORY[0x1E0D140C0], "locationMatchingAnyHostname");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:](v18, "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("UserWildcard"), 0, v17, v19, CFSTR("Allow"));

          v31 = 0;
          v21 = -[WFDatabase saveSmartPromptState:reference:error:](self, "saveSmartPromptState:reference:error:", v20, v7, &v31);
          v22 = v31;
          if (!v21)
          {
            getWFSecurityLogObject();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
              v38 = 2112;
              v39 = (uint64_t)v22;
              _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Error storing state data in database for network wildcard: %@", buf, 0x16u);
            }

          }
        }
        v30 = 0;
        objc_msgSend(v14, "contentDestinationWithError:", &v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v30;
        if (v24)
        {
          -[WFDatabase saveSmartPromptStatesForInsertedAction:contentDestination:reference:](self, "saveSmartPromptStatesForInsertedAction:contentDestination:reference:", v14, v24, v7);
        }
        else
        {
          getWFSecurityLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
            v38 = 2112;
            v39 = (uint64_t)v27;
            v40 = 2114;
            v41 = v25;
            _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create content destination for inserted action %@ with error: %{public}@", buf, 0x20u);

          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v11);
  }

}

- (void)saveSmartPromptStatesForInsertedAction:(id)a3 contentDestination:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  WFSmartPromptState *v12;
  WFSmartPromptState *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "generateUUIDIfNecessaryWithUUIDProvider:", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("UserWildcard"), 0, v10, v8, CFSTR("Allow"));
  objc_msgSend(v11, "addObject:", v12);

  if (objc_msgSend(v8, "promptingBehaviour"))
  {
    v13 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("ActionWildcard"), 0, v10, v8, CFSTR("Allow"));
    objc_msgSend(v11, "addObject:", v13);

  }
  v23 = (void *)v10;
  v24 = v8;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = 0;
        v20 = -[WFDatabase saveSmartPromptState:reference:error:](self, "saveSmartPromptState:reference:error:", v19, v9, &v25, v23, v24);
        v21 = v25;
        if (!v20)
        {
          getWFSecurityLogObject();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v31 = "-[WFDatabase(SmartPrompts) saveSmartPromptStatesForInsertedAction:contentDestination:reference:]";
            v32 = 2112;
            v33 = v21;
            _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Error storing state data in database for inserted action: %@", buf, 0x16u);
          }

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

}

- (id)smartPromptStatesForReference:(id)a3
{
  return -[WFDatabase smartPromptStatesForReference:actionUUID:](self, "smartPromptStatesForReference:actionUUID:", a3, 0);
}

- (id)smartPromptStatesForReference:(id)a3 actionUUID:(id)a4
{
  void *v4;
  void *v5;

  -[WFDatabase allStatesDataForReference:actionUUID:](self, "allStatesDataForReference:actionUUID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_25717);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  WFDeletionAuthorizationState *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  WFDeletionAuthorizationState *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = v17;
  if (!v15)
  {
    objc_msgSend(v17, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:](self, "generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:", v16, a6, v19);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (+[WFShortcutsSecuritySettings allowsDeletingLargeAmountsOfData](WFShortcutsSecuritySettings, "allowsDeletingLargeAmountsOfData")|| +[WFContentExfiltrationQuantityInfo deletionItemCountLimitForContentWithContentItemClassName:](WFContentExfiltrationQuantityInfo, "deletionItemCountLimitForContentWithContentItemClassName:", v14) >= a7)
  {
    -[WFDatabase compactDeletionAuthorizationsIfNecessaryForWorkflowReference:](self, "compactDeletionAuthorizationsIfNecessaryForWorkflowReference:", v18);
    -[WFDatabase deletionAuthorizationStatesForReference:](self, "deletionAuthorizationStatesForReference:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __143__WFDatabase_SmartPrompts__currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference___block_invoke;
    v35[3] = &unk_1E7AF02A8;
    v23 = v14;
    v36 = v23;
    objc_msgSend(v22, "if_firstObjectPassingTest:", v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v24)
    {
      getWFSecurityLogObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIde"
              "ntifier:actionIndex:count:reference:]";
        v39 = 2114;
        v40 = v23;
        v41 = 2114;
        v42 = v15;
        _os_log_impl(&dword_1C15B3000, v29, OS_LOG_TYPE_DEFAULT, "%s No deletion authorization states found for content item class %{public}@, actionUUID: %{public}@", buf, 0x20u);
      }

      v30 = -[WFDeletionAuthorizationState initWithStatus:contentItemClassName:actionUUID:count:]([WFDeletionAuthorizationState alloc], "initWithStatus:contentItemClassName:actionUUID:count:", CFSTR("Undefined"), v23, v15, a7);
      goto LABEL_24;
    }
    objc_msgSend(v24, "status");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Disallow"));

    if (v27)
    {
      getWFSecurityLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIde"
              "ntifier:actionIndex:count:reference:]";
        _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Not authorizing deletion because the user disallowed deletion previously", buf, 0xCu);
      }

    }
    else
    {
      v31 = objc_msgSend(v25, "count");
      getWFSecurityLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (a7 > 2 * v31)
      {
        if (v33)
        {
          *(_DWORD *)buf = 136315138;
          v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionI"
                "dentifier:actionIndex:count:reference:]";
          _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_DEFAULT, "%s Will prompt for deletion because currentCount > 2 * previousCount", buf, 0xCu);
        }

        objc_msgSend(v25, "stateWithStatus:count:", CFSTR("Undefined"), a7);
        v30 = (WFDeletionAuthorizationState *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (v33)
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIde"
              "ntifier:actionIndex:count:reference:]";
        _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_DEFAULT, "%s Will not prompt for deletion because there is a valid deletion authorization in the database.", buf, 0xCu);
      }

    }
    v30 = v25;
LABEL_24:
    v21 = v30;

    goto LABEL_25;
  }
  getWFSecurityLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentif"
          "ier:actionIndex:count:reference:]";
    v39 = 2114;
    v40 = v14;
    _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Deletion action will be restricted because allowsDeletingLargeAmountsOfData is set to NO, and the count for %{public}@ is greater than the maximum allowed", buf, 0x16u);
  }

  v21 = -[WFDeletionAuthorizationState initWithStatus:contentItemClassName:actionUUID:count:]([WFDeletionAuthorizationState alloc], "initWithStatus:contentItemClassName:actionUUID:count:", CFSTR("Restricted"), v14, v15, a7);
LABEL_25:

  return v21;
}

- (void)compactDeletionAuthorizationsIfNecessaryForWorkflowReference:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  NSObject *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  -[WFDatabase deletionAuthorizationStatesForReference:](self, "deletionAuthorizationStatesForReference:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  v32 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v10, "contentItemClassName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_12;
        objc_msgSend(v12, "status");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v13 == CFSTR("Disallow"))
          goto LABEL_14;
        objc_msgSend(v10, "status");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v14 == CFSTR("Disallow"))
          goto LABEL_12;
        objc_msgSend(v10, "status");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v15 != CFSTR("Allow"))
          goto LABEL_13;
        v16 = objc_msgSend(v10, "count");
        v17 = objc_msgSend(v12, "count");

        v18 = v16 >= v17;
        v5 = v32;
        if (v18)
        {
LABEL_12:
          objc_msgSend(v10, "contentItemClassName");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v10, v15);
LABEL_13:

        }
LABEL_14:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase deleteAllDeletionAuthorizationsForReference:](self, "deleteAllDeletionAuthorizationsForReference:", v34);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v36 = 0;
        objc_msgSend(v25, "databaseDataWithError:", &v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v36;
        if (v27)
        {
          getWFSecurityLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "-[WFDatabase(SmartPrompts) compactDeletionAuthorizationsIfNecessaryForWorkflowReference:]";
            v47 = 2112;
            v48 = v27;
            _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_ERROR, "%s Failed to serialize WFDeletionAuthorizationState for save with error %@", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v25, "actionUUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          v30 = -[WFDatabase saveSmartPromptStateData:actionUUID:reference:error:](self, "saveSmartPromptStateData:actionUUID:reference:error:", v26, v29, v34, &v35);
          v28 = v35;

          if (!v30)
          {
            getWFSecurityLogObject();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v46 = "-[WFDatabase(SmartPrompts) compactDeletionAuthorizationsIfNecessaryForWorkflowReference:]";
              v47 = 2112;
              v48 = v28;
              _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_ERROR, "%s Failed to save WFDeletionAuthorizationState with error %@", buf, 0x16u);
            }

          }
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v22);
  }

}

- (id)deletionAuthorizationStatesForReference:(id)a3
{
  void *v3;
  void *v4;

  -[WFDatabase allStatesDataForReference:actionUUID:](self, "allStatesDataForReference:actionUUID:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_130_25707);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allStatesDataForReference:(id)a3 actionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  WFDatabase *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__WFDatabase_SmartPrompts__allStatesDataForReference_actionUUID___block_invoke;
  v16[3] = &unk_1E7AF0350;
  v8 = v7;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  v19 = self;
  v15 = 0;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting smart prompt data for shortcut"), v16, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v11)
  {
    getWFSecurityLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFDatabase(SmartPrompts) allStatesDataForReference:actionUUID:]";
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to lookup smart prompt states for reference: %@", buf, 0x16u);
    }

    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (BOOL)saveSmartPromptState:(id)a3 reference:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19 = 0;
  objc_msgSend(v8, "databaseDataWithError:", &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(v8, "actionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v13 = -[WFDatabase saveSmartPromptStateData:actionUUID:reference:error:](self, "saveSmartPromptStateData:actionUUID:reference:error:", v10, v12, v9, &v18);
    v14 = v18;

    if (!v13)
    {
      getWFSecurityLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[WFDatabase(SmartPrompts) saveSmartPromptState:reference:error:]";
        v22 = 2114;
        v23 = v14;
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Could not save flattened smart prompt state: %{public}@", buf, 0x16u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v14);
    }

  }
  else
  {
    getWFSecurityLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFDatabase(SmartPrompts) saveSmartPromptState:reference:error:]";
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Could not serialize smart prompt state: %{public}@", buf, 0x16u);
    }

    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }

  return v13;
}

- (BOOL)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__WFDatabase_SmartPrompts__saveSmartPromptStateData_actionUUID_reference_error___block_invoke;
  v20[3] = &unk_1E7AF8CB8;
  v20[4] = self;
  v13 = v12;
  v21 = v13;
  v14 = v10;
  v22 = v14;
  v15 = v11;
  v23 = v15;
  v19 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("save smart prompt state"), v20, &v19);
  v16 = v19;
  v17 = v16;
  if (a6)
    *a6 = objc_retainAutorelease(v16);

  return v17 == 0;
}

- (void)_saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 forWorkflow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  WFCoreDataSmartPromptPermission *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  WFCoreDataSmartPromptPermission *v25;
  NSObject *v26;
  NSObject *v27;
  WFCoreDataSmartPromptPermission *v28;
  void *v29;
  WFDatabase *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WFDeletionAuthorizationState stateFromDatabaseData:](WFDeletionAuthorizationState, "stateFromDatabaseData:", v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v10, "smartPromptPermissions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v12)
  {
    v13 = v12;
    v30 = self;
    v31 = v10;
    v32 = v9;
    v33 = v8;
    v14 = 0;
    v15 = *(_QWORD *)v38;
    obj = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v17, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFDeletionAuthorizationState stateFromDatabaseData:](WFDeletionAuthorizationState, "stateFromDatabaseData:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "data");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19
          && (objc_msgSend(v19, "actionUUID"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v36, "actionUUID"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v22, "isEqual:", v23),
              v23,
              v22,
              (v24 & 1) != 0)
          || v21 && objc_msgSend(v21, "matches:", v34))
        {
          v25 = v17;

          v14 = v25;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v13);

    v9 = v32;
    v8 = v33;
    self = v30;
    v10 = v31;
    if (v14)
    {
      getWFSecurityLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[WFDatabase(SmartPrompts) _saveSmartPromptStateData:actionUUID:forWorkflow:]";
        v43 = 2114;
        v44 = v34;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_DEBUG, "%s Replacing existing WFCoreDataSmartPromptPermission with new data: %{public}@", buf, 0x16u);
      }

      goto LABEL_21;
    }
  }
  else
  {

  }
  getWFSecurityLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[WFDatabase(SmartPrompts) _saveSmartPromptStateData:actionUUID:forWorkflow:]";
    v43 = 2114;
    v44 = v34;
    _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_DEBUG, "%s Inserting new WFCoreDataSmartPromptPermission with data: %{public}@", buf, 0x16u);
  }

  v28 = [WFCoreDataSmartPromptPermission alloc];
  -[WFDatabase context](self, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFCoreDataSmartPromptPermission initWithContext:](v28, "initWithContext:", v29);

  objc_msgSend(v10, "addSmartPromptPermissionsObject:", v14);
LABEL_21:
  -[WFCoreDataSmartPromptPermission setShortcut:](v14, "setShortcut:", v10);
  -[WFCoreDataSmartPromptPermission setActionUUID:](v14, "setActionUUID:", v9);
  -[WFCoreDataSmartPromptPermission setData:](v14, "setData:", v8);

}

- (void)_updateStatesToMatchSmartPromptState:(id)a3 forWorkflow:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  id obj;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getWFSecurityLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "smartPromptPermissions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v51 = "-[WFDatabase(SmartPrompts) _updateStatesToMatchSmartPromptState:forWorkflow:]";
    v52 = 2048;
    v53 = objc_msgSend(v8, "count");
    v54 = 2114;
    v55 = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s Grouping: updating %lu permissions to match %{public}@", buf, 0x20u);

  }
  objc_msgSend(v5, "status");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v38 = v6;
  objc_msgSend(v6, "smartPromptPermissions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    v40 = *(_QWORD *)v46;
    do
    {
      v12 = 0;
      v42 = v10;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
        objc_msgSend(v13, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "mode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Normal"));

          if (v17)
          {
            objc_msgSend(v15, "sourceContentAttribution");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "origin");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v5;
            objc_msgSend(v5, "sourceContentAttribution");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "origin");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v19;
            v24 = v22;
            v25 = v24;
            if (v23 == v24)
            {

              goto LABEL_24;
            }
            if (v23)
              v26 = v24 == 0;
            else
              v26 = 1;
            if (v26)
            {

            }
            else
            {
              v33 = -[NSObject isEqual:](v23, "isEqual:", v24);

              if (v33)
              {
LABEL_24:
                objc_msgSend(v15, "contentDestination");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = v20;
                objc_msgSend(v20, "contentDestination");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v34, "isEqual:", v35);

                v11 = v40;
                v10 = v42;
                if ((v41 & 1) == 0)
                  goto LABEL_31;
LABEL_25:
                objc_msgSend(v15, "stateWithStatus:", v39);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = 0;
                objc_msgSend(v36, "databaseDataWithError:", &v44);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v44;
                objc_msgSend(v13, "setData:", v37);

                if (v18)
                {
                  getWFSecurityLogObject();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v51 = "-[WFDatabase(SmartPrompts) _updateStatesToMatchSmartPromptState:forWorkflow:]";
                    v52 = 2112;
                    v53 = (uint64_t)v18;
                    _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Failed to generate database data for smart prompt state upon grouping: %@", buf, 0x16u);
                  }
LABEL_29:

                  v10 = v42;
                }

                goto LABEL_31;
              }
            }

            v5 = v20;
            v11 = v40;
            goto LABEL_29;
          }
          objc_msgSend(v15, "mode");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "isEqualToString:", CFSTR("UserWildcard")))
          {

          }
          else
          {
            objc_msgSend(v15, "mode");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("ActionWildcard"));

            if (!v29)
              goto LABEL_31;
          }
          objc_msgSend(v15, "contentDestination");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "contentDestination");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "isEqual:", v31);

          if (v32)
            goto LABEL_25;
        }
LABEL_31:

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v10);
  }

}

- (void)_updateDeletionAuthorizationsToMatchAuthorization:(id)a3 forWorkflow:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v5, "status");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = v6;
  objc_msgSend(v6, "smartPromptPermissions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFDeletionAuthorizationState stateFromDatabaseData:](WFDeletionAuthorizationState, "stateFromDatabaseData:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "contentItemClassName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "contentItemClassName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {
            objc_msgSend(v15, "stateWithStatus:count:", v24, objc_msgSend(v15, "count"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
            objc_msgSend(v19, "databaseDataWithError:", &v25);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v25;
            objc_msgSend(v13, "setData:", v20);

            if (v21)
            {
              getWFSecurityLogObject();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v31 = "-[WFDatabase(SmartPrompts) _updateDeletionAuthorizationsToMatchAuthorization:forWorkflow:]";
                v32 = 2112;
                v33 = v21;
                _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to generate deletion authorization state data upon grouping: %@", buf, 0x16u);
              }

            }
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v10);
  }

}

- (void)deleteSmartPromptState:(id)a3 forReference:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__WFDatabase_SmartPrompts__deleteSmartPromptState_forReference___block_invoke;
  v14[3] = &unk_1E7AF8CE0;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v13 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete smart prompt state"), v14, &v13);
  v10 = v13;
  if (v10)
  {
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFDatabase(SmartPrompts) deleteSmartPromptState:forReference:]";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Unable to delete smart prompt state: %@", buf, 0x16u);

    }
  }

}

- (void)_deleteSmartPromptState:(id)a3 forReference:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFDatabase objectForDescriptor:properties:](self, "objectForDescriptor:properties:", a4, MEMORY[0x1E0C9AA60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v9;
  objc_msgSend(v9, "smartPromptPermissions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "data");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "matches:", v6))
        {
          -[WFDatabase context](self, "context");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "deleteObject:", v20);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

}

- (void)deleteSmartPromptStatesForDeletedActionUUIDs:(id)a3 forReference:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__WFDatabase_SmartPrompts__deleteSmartPromptStatesForDeletedActionUUIDs_forReference___block_invoke;
  v14[3] = &unk_1E7AF8CE0;
  v14[4] = self;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  v13 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete smart prompt state for deleted actions"), v14, &v13);
  v10 = v13;
  if (v10)
  {
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFDatabase(SmartPrompts) deleteSmartPromptStatesForDeletedActionUUIDs:forReference:]";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Unable to delete smart prompt data upon action deletion: %@", buf, 0x16u);

    }
  }

}

- (void)deleteAllSmartPromptStateDataForReference:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WFDatabase_SmartPrompts__deleteAllSmartPromptStateDataForReference___block_invoke;
  v10[3] = &unk_1E7AF93C8;
  v10[4] = self;
  v5 = v4;
  v11 = v5;
  v9 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete all smart prompt states"), v10, &v9);
  v6 = v9;
  if (v6)
  {
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFDatabase(SmartPrompts) deleteAllSmartPromptStateDataForReference:]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Unable to delete all per-workflow smart prompt data: %@", buf, 0x16u);

    }
  }

}

- (void)deleteAllDeletionAuthorizationsForReference:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__WFDatabase_SmartPrompts__deleteAllDeletionAuthorizationsForReference___block_invoke;
  v10[3] = &unk_1E7AF93C8;
  v10[4] = self;
  v5 = v4;
  v11 = v5;
  v9 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete all deletion authorizations"), v10, &v9);
  v6 = v9;
  if (v6)
  {
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFDatabase(SmartPrompts) deleteAllDeletionAuthorizationsForReference:]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Unable to delete all per-workflow smart prompt data: %@", buf, 0x16u);

    }
  }

}

- (id)generateAndPersistUUIDForActionWithIdentifier:(id)a3 actionIndex:(unint64_t)a4 workflowIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;
  WFDatabase *v18;
  id v19;
  unint64_t v20;

  v8 = a3;
  v9 = a5;
  v15 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__WFDatabase_SmartPrompts__generateAndPersistUUIDForActionWithIdentifier_actionIndex_workflowIdentifier___block_invoke;
  v16[3] = &unk_1E7AF0378;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = a4;
  v10 = v8;
  v11 = v9;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("generating UUID for action"), v16, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  return v12;
}

id __105__WFDatabase_SmartPrompts__generateAndPersistUUIDForActionWithIdentifier_actionIndex_workflowIdentifier___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflowActions fetchRequest](WFCoreDataWorkflowActions, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("shortcut.workflowID"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v31 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 1, 0, &v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v31;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v11, "objectAtIndex:", *(_QWORD *)(a1 + 56));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("WFWorkflowActionIdentifier"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) != 0)
        {
          v29 = v13;
          objc_msgSend(v13, "objectForKey:", CFSTR("WFWorkflowActionParameters"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            getWFWorkflowExecutionLogObject();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 136315394;
              v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentif"
                    "ier:]_block_invoke";
              v34 = 2114;
              v35 = v16;
              _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEBUG, "%s Action %{public}@ does not have WFWorkflowActionParameters, creating dictionary", buf, 0x16u);
            }

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", v14, CFSTR("WFWorkflowActionParameters"));
          }
          objc_msgSend(v14, "objectForKey:", CFSTR("UUID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v19 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "UUIDString");
            v19 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("UUID"));
            objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, a2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setData:", v26);

          }
          v13 = v29;
        }
        else
        {
          getWFWorkflowExecutionLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifie"
                  "r:]_block_invoke";
            _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s actionIdentifier mismatch found, result won't be saved", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDString");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {

        getWFSecurityLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = *a2;
          *(_DWORD *)buf = 136315394;
          v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:]_block_invoke";
          v34 = 2114;
          v35 = v23;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Could not deserialize actions from plist: %{public}@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      getWFSecurityLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_ERROR, "%s No NSData found on WFCoreDataWorkflowActions object.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    getWFSecurityLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:]_block_invoke";
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s No WFCoreDataWorkflowActions object found for workflow with identifier %@.", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

void __72__WFDatabase_SmartPrompts__deleteAllDeletionAuthorizationsForReference___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "smartPromptPermissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFDeletionAuthorizationState stateFromDatabaseData:](WFDeletionAuthorizationState, "stateFromDatabaseData:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(*(id *)(a1 + 32), "context");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "deleteObject:", v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v13);
  }

  v20 = *(void **)(a1 + 32);
  v27 = CFSTR("smartPromptPermissions");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v27, 1);

  objc_msgSend(v20, "object:didUpdateProperties:error:", v5, v21, a2);
}

void __70__WFDatabase_SmartPrompts__deleteAllSmartPromptStateDataForReference___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE buf[12];
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  +[WFCoreDataSmartPromptPermission fetchRequest](WFCoreDataSmartPromptPermission, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("shortcut"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v24 = a2;
  objc_msgSend(v9, "executeFetchRequest:error:", v7, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        getWFWorkflowExecutionLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "actionUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(SmartPrompts) deleteAllSmartPromptStateDataForReference:]_block_invoke";
          v30 = 2114;
          v31 = v18;
          _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEBUG, "%s Deleting smart prompt permission with actionUUID: %{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deleteObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v13);
  }

  v20 = *(void **)(a1 + 32);
  *(_QWORD *)buf = CFSTR("smartPromptPermissions");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

  objc_msgSend(v20, "object:didUpdateProperties:error:", v23, v21, v24);
}

void __86__WFDatabase_SmartPrompts__deleteSmartPromptStatesForDeletedActionUUIDs_forReference___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE buf[12];
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  +[WFCoreDataSmartPromptPermission fetchRequest](WFCoreDataSmartPromptPermission, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K IN %@"), CFSTR("shortcut"), v6, CFSTR("actionUUID"), *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v24 = a2;
  objc_msgSend(v9, "executeFetchRequest:error:", v7, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        getWFWorkflowExecutionLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "actionUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(SmartPrompts) deleteSmartPromptStatesForDeletedActionUUIDs:forReference:]_block_invoke";
          v30 = 2114;
          v31 = v18;
          _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEBUG, "%s Deleting smart prompt permission with actionUUID: %{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deleteObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v13);
  }

  v20 = *(void **)(a1 + 32);
  *(_QWORD *)buf = CFSTR("smartPromptPermissions");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

  objc_msgSend(v20, "object:didUpdateProperties:error:", v23, v21, v24);
}

uint64_t __64__WFDatabase_SmartPrompts__deleteSmartPromptState_forReference___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSmartPromptState:forReference:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __80__WFDatabase_SmartPrompts__saveSmartPromptStateData_actionUUID_reference_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BYTE v13[12];
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_saveSmartPromptStateData:actionUUID:forWorkflow:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6);
    +[WFDeletionAuthorizationState stateFromDatabaseData:](WFDeletionAuthorizationState, "stateFromDatabaseData:", *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();
    +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      getWFSecurityLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v13 = 136315394;
        *(_QWORD *)&v13[4] = "-[WFDatabase(SmartPrompts) saveSmartPromptStateData:actionUUID:reference:error:]_block_invoke";
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEBUG, "%s Updating existing smart prompt states to match %{public}@", v13, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_updateStatesToMatchSmartPromptState:forWorkflow:", v8, v6);
    }
    else if (v7)
    {
      getWFSecurityLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v13 = 136315394;
        *(_QWORD *)&v13[4] = "-[WFDatabase(SmartPrompts) saveSmartPromptStateData:actionUUID:reference:error:]_block_invoke";
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEBUG, "%s Updating existing deletion states to match %{public}@", v13, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_updateDeletionAuthorizationsToMatchAuthorization:forWorkflow:", v7, v6);
    }
    v11 = *(void **)(a1 + 32);
    *(_QWORD *)v13 = CFSTR("smartPromptPermissions");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v13, 1);

    objc_msgSend(v11, "object:didUpdateProperties:error:", v6, v12, a2);
  }
  else
  {
    getWFSecurityLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)&v13[4] = "-[WFDatabase(SmartPrompts) saveSmartPromptStateData:actionUUID:reference:error:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Bad reference passed to saveSmartPromptStateData", v13, 0xCu);
    }
  }

}

id __65__WFDatabase_SmartPrompts__allStatesDataForReference_actionUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  +[WFCoreDataSmartPromptPermission fetchRequest](WFCoreDataSmartPromptPermission, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("shortcut.workflowID"), v7, CFSTR("actionUUID"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("shortcut.workflowID"), v7, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  objc_msgSend(*(id *)(a1 + 48), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeFetchRequest:error:", v4, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_map:", &__block_literal_global_144);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __65__WFDatabase_SmartPrompts__allStatesDataForReference_actionUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

id __68__WFDatabase_SmartPrompts__deletionAuthorizationStatesForReference___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFDeletionAuthorizationState stateFromDatabaseData:](WFDeletionAuthorizationState, "stateFromDatabaseData:", a2);
}

uint64_t __143__WFDatabase_SmartPrompts__currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentItemClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __69__WFDatabase_SmartPrompts__smartPromptStatesForReference_actionUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", a2);
}

id __91__WFDatabase_SmartPrompts__migrateAccountStateToAppOriginIfNecessary_reference_actionUUID___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_deleteSmartPromptState:forReference:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "stateByReplacingAccountWithAppOrigin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "databaseDataWithError:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    *a2 = objc_retainAutorelease(v6);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v4, "actionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 48), MEMORY[0x1E0C9AA60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_saveSmartPromptStateData:actionUUID:forWorkflow:", v5, v10, v13);

    v8 = v4;
  }

  return v8;
}

uint64_t __154__WFDatabase_SmartPrompts__approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "matches:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

- (id)conflictForWorkflowReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFDatabase conflictingReferenceForReference:](self, "conflictingReferenceForReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFDatabase recordWithDescriptor:error:](self, "recordWithDescriptor:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase recordWithDescriptor:error:](self, "recordWithDescriptor:error:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "isConflictOfOtherWorkflow"))
    {
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocalWorkflowID:", v9);

      objc_msgSend(v8, "setLocalWorkflowRecord:", v7);
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocalWorkflowID:", v12);

      objc_msgSend(v8, "setLocalWorkflowRecord:", v6);
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
    }
    objc_msgSend(v8, "setRemoteWorkflowID:", v10);

    objc_msgSend(v8, "setRemoteWorkflowRecord:", v11);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSURL)exportableURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  void *v34;
  sqlite3 *db;
  sqlite3 *ppDb;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDatabase fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_claimAutoreleasedReturnValue();

  v49[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v8;
  v34 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v5, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v11, "fileExistsAtPath:", v18);

        if (v19)
        {
          v37 = 0;
          objc_msgSend(v11, "removeItemAtURL:error:", v17, &v37);
          v20 = v37;
          if (v20)
          {
            v24 = v20;
            getWFDatabaseLogObject();
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v34;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v43 = "-[WFDatabase exportableURL]";
              v44 = 2112;
              v45 = v34;
              v46 = 2112;
              v47 = v24;
              _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s Error removing the existing %@ database file: %@", buf, 0x20u);
            }

            v27 = 0;
            goto LABEL_26;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v14)
        continue;
      break;
    }
  }

  ppDb = 0;
  -[WFDatabase fileURL](self, "fileURL");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = sqlite3_open_v2((const char *)objc_msgSend(v21, "fileSystemRepresentation"), &ppDb, 1, 0);

  if (v22)
  {
    getWFDatabaseLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[WFDatabase exportableURL]";
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Failed to open the database to export", buf, 0xCu);
    }
    goto LABEL_24;
  }
  -[WFDatabase fileURL](self, "fileURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastPathComponent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_retainAutorelease(v30);
  -[NSObject fileSystemRepresentation](v23, "fileSystemRepresentation");
  if (!_sqlite3_db_copy_compact())
  {
    db = 0;
    v23 = objc_retainAutorelease(v23);
    if (!sqlite3_open_v2((const char *)-[NSObject fileSystemRepresentation](v23, "fileSystemRepresentation"), &db, 1, 0))
    {
      sqlite3_wal_checkpoint_v2(db, 0, 1, 0, 0);
      v27 = v23;
      goto LABEL_25;
    }
    getWFDatabaseLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_DWORD *)buf = 136315138;
    v43 = "-[WFDatabase exportableURL]";
    v32 = "%s Failed to open the database to export";
    goto LABEL_22;
  }
  getWFDatabaseLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[WFDatabase exportableURL]";
    v32 = "%s Failed to copy the database to export";
LABEL_22:
    _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
  }
LABEL_23:

LABEL_24:
  v27 = 0;
LABEL_25:
  v26 = v34;

LABEL_26:
  return (NSURL *)v27;
}

- (BOOL)replaceWithFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFDatabase context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDatabase persistentStoreDescription](self, "persistentStoreDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "startAccessingSecurityScopedResource");
    v11 = *MEMORY[0x1E0C97868];
    v37[0] = *MEMORY[0x1E0C978D0];
    v37[1] = v11;
    v38[0] = MEMORY[0x1E0C9AAB0];
    v38[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C979E8];
    v32 = 0;
    v14 = objc_msgSend(v8, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v10, 0, v6, v12, v13, &v32);
    v15 = v32;
    v16 = v15;
    if ((v14 & 1) != 0)
    {
      v29 = v15;
      objc_msgSend(v6, "stopAccessingSecurityScopedResource");
      objc_msgSend(MEMORY[0x1E0C97C08], "wf_shortcutsConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "configuration");
      v19 = v12;
      v20 = a4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v19;
      v31 = v8;
      objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v18, v21, v22, v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 != 0;

      if (v23)
      {
        -[WFDatabase invalidateAllObjectsAndNotify](self, "invalidateAllObjectsAndNotify");
      }
      else
      {
        getWFDatabaseLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = *v20;
          *(_DWORD *)buf = 136315394;
          v34 = "-[WFDatabase replaceWithFileAtURL:error:]";
          v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s Error adding persistent store: %@", buf, 0x16u);
        }

      }
      v8 = v31;
      v16 = v29;

      v12 = v30;
    }
    else
    {
      getWFDatabaseLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFDatabase replaceWithFileAtURL:error:]";
        v35 = 2112;
        v36 = v16;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s Error replacing persistent store: %@", buf, 0x16u);
      }

      v24 = 0;
      *a4 = objc_retainAutorelease(v16);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 0, MEMORY[0x1E0C9AA70]);
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (void)invalidateAllObjectsAndNotify
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *changeNotificationQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0DC7AA0]);
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(v3, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", 1, v4, v5, v6, getpid());

  changeNotificationQueue = self->_changeNotificationQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__WFDatabase_invalidateAllObjectsAndNotify__block_invoke;
  v10[3] = &unk_1E7AF92C0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(changeNotificationQueue, v10);

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  getWFDatabaseLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFDatabase dealloc]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s Deallocating WFDatabase", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C978A8];
  -[WFDatabase context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

  if (-[WFDatabase destroysOnDeallocation](self, "destroysOnDeallocation"))
  {
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFDatabase dealloc]";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Destroying persistent store coordinator", buf, 0xCu);
    }

    -[WFDatabase context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistentStoreCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase fileURL](self, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destroyPersistentStoreAtURL:withType:options:error:", v10, *MEMORY[0x1E0C979E8], 0, 0);

  }
  v11.receiver = self;
  v11.super_class = (Class)WFDatabase;
  -[WFDatabase dealloc](&v11, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  WFDatabase *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFDatabase *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFDatabase context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDatabase context](v4, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)removeObjectObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  void *v6;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[WFDatabase observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (id)objectForDescriptor:(id)a3 properties:(id)a4
{
  return -[WFDatabase objectForDescriptor:properties:createIfNecessary:](self, "objectForDescriptor:properties:createIfNecessary:", a3, a4, 0);
}

- (id)objectForDescriptor:(id)a3 properties:(id)a4 createIfNecessary:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)WFRecordStorageClassForObjectType(objc_msgSend(v8, "objectType"));
  v11 = (objc_class *)WFCoreDataClassForObjectType(objc_msgSend(v8, "objectType"));
  v12 = 0;
  if (v10)
  {
    v13 = v11;
    if (v11)
    {
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "objectType");
      if (v15 <= 0xA && ((0x6FFu >> v15) & 1) != 0 && v14)
      {
        -[WFDatabase objectOfClass:withIdentifier:forKey:createIfNecessary:properties:](self, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v13, v14, off_1E7AF2FC8[v15], v5, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v10 == v13)
          v18 = v16;
        else
          v18 = (id)objc_msgSend([v10 alloc], "initWithManagedObject:database:", v16, self);
        v12 = v18;

      }
      else
      {
        v12 = 0;
      }

    }
  }

  return v12;
}

- (void)accessStorageForDescriptor:(id)a3 forWriting:(BOOL)a4 readingRecordProperties:(id)a5 usingBlock:(id)a6 withError:(id *)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t aBlock;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  WFDatabase *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!v13)
  {
    v25 = 0;
LABEL_11:
    aBlock = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_3;
    v37 = &unk_1E7AF2C08;
    v38 = self;
    v28 = v12;
    v39 = v28;
    v29 = v25;
    v40 = v29;
    v41 = v14;
    v30 = _Block_copy(&aBlock);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("writing to storage for %@"), v28, aBlock, v35, v36, v37, v38, v39, v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", v31, v30, a7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reading storage for %@"), v28, aBlock, v35, v36, v37, v38, v39, v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", v31, v30, a7);
    }

    goto LABEL_15;
  }
  v15 = WFRecordStorageClassForObjectType(objc_msgSend(v12, "objectType"));
  v16 = WFCoreDataClassForObjectType(objc_msgSend(v12, "objectType"));
  if (v15)
  {
    v17 = v16;
    if (v16)
    {
      v18 = objc_opt_respondsToSelector();
      v19 = MEMORY[0x1E0C809B0];
      v20 = &unk_1C1B47000;
      if ((v18 & 1) != 0)
      {
        objc_msgSend(v15, "recordPropertyMap");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v19;
        v44[1] = 3221225472;
        v44[2] = __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke;
        v44[3] = &unk_1E7AF8178;
        v45 = v21;
        v23 = v21;
        objc_msgSend(v22, "if_map:", v44);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (_QWORD *)&unk_1C1B47000;
        v19 = MEMORY[0x1E0C809B0];
      }
      else
      {
        objc_msgSend(v13, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "entity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v19;
      v42[1] = v20[301];
      v42[2] = __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_2;
      v42[3] = &unk_1E7AF3978;
      v43 = v26;
      v27 = v26;
      objc_msgSend(v24, "if_objectsPassingTest:", v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 0, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

}

- (id)recordWithDescriptor:(id)a3 error:(id *)a4
{
  return -[WFDatabase recordWithDescriptor:properties:error:](self, "recordWithDescriptor:properties:error:", a3, 0, a4);
}

- (id)recordWithDescriptor:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t v20[16];
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  getWFDatabaseLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getWFDatabaseLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LoadRecord", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__38009;
  v29 = __Block_byref_object_dispose__38010;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__WFDatabase_recordWithDescriptor_properties_error___block_invoke;
  v21[3] = &unk_1E7AF2C30;
  v21[4] = self;
  v14 = v8;
  v22 = v14;
  v24 = buf;
  v15 = v9;
  v23 = v15;
  -[WFDatabase accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:](self, "accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:", v14, 0, v15, v21, a5);
  getWFDatabaseLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v17, OS_SIGNPOST_INTERVAL_END, v11, "LoadRecord", ", v20, 2u);
  }

  v18 = *((id *)v26 + 5);
  _Block_object_dispose(buf, 8);

  return v18;
}

- (id)objectOfClass:(Class)a3 withIdentifier:(id)a4 forKey:(id)a5 createIfNecessary:(BOOL)a6 properties:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[objc_class fetchRequest](a3, "fetchRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);

  objc_msgSend(v15, "setFetchLimit:", 1);
  objc_msgSend(v15, "setPropertiesToFetch:", v14);

  -[WFDatabase context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "executeFetchRequest:error:", v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WFEnforceClass(v19, (uint64_t)a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20 && v8)
  {
    v21 = [a3 alloc];
    -[WFDatabase context](self, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "initWithContext:", v22);

    objc_msgSend(v20, "setValue:forKey:", v12, v13);
    -[WFDatabase objectWasCreated:identifier:](self, "objectWasCreated:identifier:", v20, v12);
  }

  return v20;
}

- (void)objectWasCreated:(id)a3 identifier:(id)a4
{
  WFCoreDataWorkflowActions *v5;
  void *v6;
  WFCoreDataWorkflowActions *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [WFCoreDataWorkflowActions alloc];
    -[WFDatabase context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFCoreDataWorkflowActions initWithContext:](v5, "initWithContext:", v6);

    objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("actions"));
  }

}

- (BOOL)object:(id)a3 didUpdateProperties:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase.m"), 579, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("properties %@ of %@ updated out-of-band from WFRecord change tracking"), v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__WFDatabase_object_didUpdateProperties_error___block_invoke;
    v18[3] = &unk_1E7AF3A68;
    v19 = v9;
    v20 = v10;
    v17 = 0;
    v12 = -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", v11, v18, &v17);
    v13 = v17;

    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v14 = v13 == 0;

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)addPendingLocalChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v8 = a3;
  -[WFDatabase pendingLocalChangeNotification](self, "pendingLocalChangeNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDatabase pendingLocalChangeNotification](self, "pendingLocalChangeNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationByMergingChangesFromNotification:", v8);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v6;
  }
  else
  {
    v7 = v8;
  }
  v9 = v7;
  -[WFDatabase setPendingLocalChangeNotification:](self, "setPendingLocalChangeNotification:", v7);

}

- (void)addPendingUpdatedDescriptor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0DC7AA0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_alloc(MEMORY[0x1E0DC7AA8]);
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "objectType");

  v11 = (void *)objc_msgSend(v8, "initWithIdentifier:objectType:", v9, v10);
  objc_msgSend(v7, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (id)objc_msgSend(v6, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", 0, v12, v13, v14, getpid());

  -[WFDatabase addPendingLocalChangeNotification:](self, "addPendingLocalChangeNotification:", v15);
}

- (void)addPendingInsertedDescriptor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0DC7AA0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_alloc(MEMORY[0x1E0DC7AA8]);
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "objectType");

  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:objectType:", v10, v11);
  objc_msgSend(v8, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = (id)objc_msgSend(v6, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", 0, v7, v13, v14, getpid());

  -[WFDatabase addPendingLocalChangeNotification:](self, "addPendingLocalChangeNotification:", v15);
}

- (void)addPendingDeletedDescriptor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0DC7AA0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_alloc(MEMORY[0x1E0DC7AA8]);
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "objectType");

  v13 = (void *)objc_msgSend(v10, "initWithIdentifier:objectType:", v11, v12);
  objc_msgSend(v9, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v6, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", 0, v7, v8, v14, getpid());

  -[WFDatabase addPendingLocalChangeNotification:](self, "addPendingLocalChangeNotification:", v15);
}

- (void)remoteContextDidSave:(id)a3
{
  id v4;
  NSObject *remoteChangeQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WFDatabase *v9;

  v4 = a3;
  remoteChangeQueue = self->_remoteChangeQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__WFDatabase_remoteContextDidSave___block_invoke;
  v7[3] = &unk_1E7AF92C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(remoteChangeQueue, v7);

}

- (void)remoteChangeDebouncerDidFire
{
  void *v3;
  NSObject *changeNotificationQueue;
  _QWORD v5[4];
  id v6;
  WFDatabase *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_remoteChangeQueue);
  -[WFDatabase pendingRemoteChangeNotification](self, "pendingRemoteChangeNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFDatabase setPendingRemoteChangeNotification:](self, "setPendingRemoteChangeNotification:", 0);
    changeNotificationQueue = self->_changeNotificationQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__WFDatabase_remoteChangeDebouncerDidFire__block_invoke;
    v5[3] = &unk_1E7AF92C0;
    v6 = v3;
    v7 = self;
    dispatch_async(changeNotificationQueue, v5);

  }
}

- (void)notifyResultsAboutChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  id obja;
  WFDatabase *v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD block[6];
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeNotificationQueue);
  v40 = self;
  -[WFDatabase activeObjectObservers](self, "activeObjectObservers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "count"))
  {
    objc_msgSend(v41, "updatedDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "insertedDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "deletedDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      obj = v37;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v53 != v9)
              objc_enumerationMutation(obj);
            v11 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            -[WFDatabase callbackQueue](v40, "callbackQueue");
            v12 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke;
            block[3] = &unk_1E7AF2C98;
            block[4] = v11;
            block[5] = v40;
            v49 = v4;
            v50 = v5;
            v51 = v6;
            dispatch_async(v12, block);

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v8);
      }

    }
  }
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[WFDatabase activeResults](v40, "activeResults");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    v18 = v13;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(obja);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v20, "state");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(v20, "state");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v41, "appliesToResultState:", v23);

          if (!v24)
            continue;
        }
        v25 = v20;
        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v25, "fetchOperation");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              v28 = (void *)objc_opt_new();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, v26);

            }
            objc_msgSend(v13, "objectForKeyedSubscript:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v25);

            v30 = v25;
          }
          else
          {
            v30 = 0;
            v26 = v25;
          }

          v31 = v25;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v31, "libraryQuery");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              v34 = (void *)objc_opt_new();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, v32);

            }
            objc_msgSend(v14, "objectForKeyedSubscript:", v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v31);

          }
        }
        else
        {
          v30 = 0;
        }

        v13 = v18;
      }
      v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v16);
  }

  v36 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke_2;
  v43[3] = &unk_1E7AF2CE8;
  v43[4] = v40;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v43);
  v42[0] = v36;
  v42[1] = 3221225472;
  v42[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke_212;
  v42[3] = &unk_1E7AF2D10;
  v42[4] = v40;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v42);

}

- (BOOL)hasValidLibrary
{
  WFLibrary *library;

  if (self)
    library = self->_library;
  else
    library = 0;
  return library != 0;
}

- (id)missingErrorForDescriptor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "name");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;

  }
  else
  {
    v8 = v3;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      WFLocalizedString(CFSTR("Item does not exist"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("“%@” does not exist."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v18 = *MEMORY[0x1E0CB2D50];
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (Class)recordClassForObjectType:(unint64_t)a3
{
  void *v3;

  if (a3 <= 0xA && ((0x40Fu >> a3) & 1) != 0)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

- (BOOL)saveRecord:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19;
  uint8_t v21[8];
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t *v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  getWFDatabaseLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getWFDatabaseLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SaveRecord", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x2020000000;
  v29 = 0;
  v14 = (void *)objc_opt_new();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__WFDatabase_saveRecord_withDescriptor_error___block_invoke;
  v22[3] = &unk_1E7AF2D88;
  v15 = v8;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  v25 = buf;
  -[WFDatabase accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:](self, "accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:", v16, 1, v14, v22, a5);

  getWFDatabaseLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v18, OS_SIGNPOST_INTERVAL_END, v11, "SaveRecord", ", v21, 2u);
  }

  v19 = v27[24];
  _Block_object_dispose(buf, 8);

  return v19;
}

- (BOOL)reloadRecord:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18;
  uint8_t v20[8];
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a4;
  getWFDatabaseLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getWFDatabaseLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ReloadRecord", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__WFDatabase_reloadRecord_withDescriptor_error___block_invoke;
  v21[3] = &unk_1E7AF2D88;
  v14 = v8;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  v24 = buf;
  -[WFDatabase accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:](self, "accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:", v15, 0, 0, v21, a5);
  getWFDatabaseLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v17, OS_SIGNPOST_INTERVAL_END, v11, "ReloadRecord", ", v20, 2u);
  }

  v18 = v26[24];
  _Block_object_dispose(buf, 8);

  return v18;
}

- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  WFDatabase *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v27 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke;
  v28[3] = &unk_1E7AF2E00;
  v29 = v19;
  v30 = self;
  v31 = v16;
  v32 = v18;
  v33 = v17;
  v34 = v14;
  v35 = v15;
  v20 = v15;
  v21 = v14;
  v22 = v17;
  v23 = v18;
  v24 = v16;
  v25 = v19;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("update app descriptor for action"), v28, &v27);
  v26 = v27;

}

- (NSArray)activeObjectObservers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[WFDatabase observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_observersLock);
  return (NSArray *)v5;
}

- (NSArray)activeResults
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__38009;
  v11 = __Block_byref_object_dispose__38010;
  v12 = 0;
  -[WFDatabase context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__WFDatabase_activeResults__block_invoke;
  v6[3] = &unk_1E7AF92E8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, fileURL: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)setWalrusStateForTesting:(int64_t)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  id v8;
  _QWORD v9[6];

  v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__WFDatabase_setWalrusStateForTesting_withError___block_invoke;
  v9[3] = &unk_1E7AF2E28;
  v9[4] = self;
  v9[5] = a3;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("clearing Walrus state for testing"), v9, &v8);
  v5 = v8;
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)destroysOnDeallocation
{
  return self->_destroysOnDeallocation;
}

- (void)setDestroysOnDeallocation:(BOOL)a3
{
  self->_destroysOnDeallocation = a3;
}

- (NSPersistentStoreDescription)persistentStoreDescription
{
  return self->_persistentStoreDescription;
}

- (void)setPersistentStoreDescription:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreDescription, a3);
}

- (OS_dispatch_queue)remoteChangeQueue
{
  return self->_remoteChangeQueue;
}

- (WFCoreDataChangeNotification)pendingRemoteChangeNotification
{
  return self->_pendingRemoteChangeNotification;
}

- (void)setPendingRemoteChangeNotification:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRemoteChangeNotification, a3);
}

- (WFDebouncer)remoteChangeNotificationDebouncer
{
  return self->_remoteChangeNotificationDebouncer;
}

- (void)setResultsToNotify:(id)a3
{
  objc_storeStrong((id *)&self->_resultsToNotify, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (OS_dispatch_queue)changeNotificationQueue
{
  return self->_changeNotificationQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setSuggestionsContext:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsContext, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)isPostingDistributedNotifications
{
  return self->_postDistributedNotifications;
}

- (void)setPostDistributedNotifications:(BOOL)a3
{
  self->_postDistributedNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_suggestionsContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_changeNotificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_resultsToNotify, 0);
  objc_storeStrong((id *)&self->_remoteChangeNotificationDebouncer, 0);
  objc_storeStrong((id *)&self->_pendingRemoteChangeNotification, 0);
  objc_storeStrong((id *)&self->_remoteChangeQueue, 0);
  objc_storeStrong((id *)&self->_pendingLocalChangeNotification, 0);
  objc_storeStrong((id *)&self->_persistentStoreDescription, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

void __49__WFDatabase_setWalrusStateForTesting_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeFetchRequest:error:", v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "setWantedEncryptedSchemaVersion:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v12, "setLastSyncedEncryptedSchemaVersion:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v12, "setSyncHash:", objc_msgSend(v12, "computedSyncHash"));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  +[WFCoreDataCollection fetchRequest](WFCoreDataCollection, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executeFetchRequest:error:", v13, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v21, "setWantedEncryptedSchemaVersion:", *(_QWORD *)(a1 + 40), (_QWORD)v22);
        objc_msgSend(v21, "setLastSyncedEncryptedSchemaVersion:", *(_QWORD *)(a1 + 40));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

void __27__WFDatabase_activeResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "resultsToNotify");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke(uint64_t a1)
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
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "recordWithDescriptor:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__38009;
  v36 = __Block_byref_object_dispose__38010;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke_2;
  v15[3] = &unk_1E7AF2DD8;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v21 = &v32;
  v19 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  v22 = &v28;
  v23 = &v24;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);

  if (*((_BYTE *)v25 + 24) && v33[5])
  {
    objc_msgSend(v3, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = v29[3];
    v8 = *(_QWORD *)(a1 + 56);
    v42[0] = CFSTR("WFWorkflowActionIdentifier");
    v42[1] = CFSTR("WFWorkflowActionParameters");
    v9 = v33[5];
    v43[0] = v8;
    v43[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, v10);

    objc_msgSend(v3, "setActions:", v6);
    v11 = *(void **)(a1 + 40);
    v14 = 0;
    LOBYTE(v7) = objc_msgSend(v11, "saveRecord:withDescriptor:error:", v3, v2, &v14);
    v12 = v14;
    if ((v7 & 1) == 0)
    {
      getWFDatabaseLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFDatabase updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:]_block_invoke";
        v40 = 2112;
        v41 = v12;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Unable to update app descriptor in workflow: %@", buf, 0x16u);
      }

    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

}

void __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a2;
  v19 = v7;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("WFWorkflowActionParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "objectForKey:", CFSTR("UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));
    v10 = v19;
    if ((v8 & 1) == 0)
      goto LABEL_8;
LABEL_6:
    objc_msgSend(v19, "objectForKey:", CFSTR("WFWorkflowActionParameters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 56), "serializedRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, *(_QWORD *)(a1 + 64));

    v10 = v19;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("WFWorkflowActionIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

    v10 = v19;
    goto LABEL_8;
  }
  v12 = objc_msgSend(*(id *)(a1 + 48), "integerValue");

  v10 = v19;
  if (v12 == a3)
    goto LABEL_6;
LABEL_8:

}

void __48__WFDatabase_reloadRecord_withDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadFromStorage:", a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't reload record %@, descriptor %@ is missing backing storage"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 4, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void __46__WFDatabase_saveRecord_withDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "saveChangesToStorage:error:", a2, a3);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't save record %@, descriptor %@ is missing backing storage"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 4, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void __27__WFDatabase_reloadLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "latestLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(id *)(v3 + 120);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)(a1 + 32);
      v7 = v6 ? *(_QWORD *)(v6 + 120) : 0;
      v8 = objc_msgSend(v2, "isEqual:", v7);

      if (v8)
      {
        getWFCoherenceLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v2, "dotRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 136315394;
          v15 = "-[WFDatabase reloadLibrary]_block_invoke";
          v16 = 2112;
          v17 = v10;
          _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Got a new Coherence blob from database, but didn't reload (== local): %@", (uint8_t *)&v14, 0x16u);

        }
        goto LABEL_12;
      }
    }
  }
  getWFCoherenceLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "-[WFDatabase reloadLibrary]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_INFO, "%s Succesfully reloaded the library", (uint8_t *)&v14, 0xCu);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v13 = v2;
    v9 = *(NSObject **)(v12 + 120);
    *(_QWORD *)(v12 + 120) = v13;
LABEL_12:

  }
}

uint64_t __39__WFDatabase_notifyResultsAboutChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "databaseDidChange:modified:inserted:removed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __39__WFDatabase_notifyResultsAboutChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__38009;
  v27 = __Block_byref_object_dispose__38010;
  v28 = 0;
  v7 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke_3;
  v20[3] = &unk_1E7AF2CC0;
  v20[4] = v7;
  v8 = v5;
  v21 = v8;
  v22 = &v23;
  v19 = 0;
  objc_msgSend(v7, "performOperationWithReason:block:error:", CFSTR("re-querying for results"), v20, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v9)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = v6;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "updateDescriptorsAndNotify:state:", v9, v24[5], (_QWORD)v15);
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
      }
      while (v12);
    }
  }
  else
  {
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFDatabase notifyResultsAboutChange:]_block_invoke_2";
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to query descriptors for fetch operation: %@. Error: %@", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v23, 8);
}

void __39__WFDatabase_notifyResultsAboutChange___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(_QWORD *)(v7 + 120);
  else
    v8 = 0;
  objc_msgSend(v5, "performReturningShortcutsIn:database:error:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    goto LABEL_8;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    v13 = *(_QWORD *)(v12 + 120);
  else
    v13 = 0;
  objc_msgSend(v5, "performReturningCollectionsIn:database:error:", v13);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_8:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v6;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v19, "state", (_QWORD)v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "updateDescriptorsAndNotify:state:", v11, v20);

        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }
    goto LABEL_19;
  }
  getWFDatabaseLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[WFDatabase notifyResultsAboutChange:]_block_invoke";
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Failed to query descriptors for library query: %@", buf, 0x16u);
  }
  v11 = 0;
LABEL_19:

}

id __39__WFDatabase_notifyResultsAboutChange___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "descriptorsForFetchOperation:state:error:", v2, &obj, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

void __42__WFDatabase_remoteChangeDebouncerDidFire__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updatedDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_38137);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "reloadLibrary");
  objc_msgSend(*(id *)(a1 + 40), "notifyResultsAboutChange:", *(_QWORD *)(a1 + 32));

}

BOOL __42__WFDatabase_remoteChangeDebouncerDidFire__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;

  v4 = objc_msgSend(a2, "objectType");
  if (v4 == 10)
    *a3 = 1;
  return v4 == 10;
}

void __35__WFDatabase_remoteContextDidSave___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  getWFDatabaseLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[WFDatabase remoteContextDidSave:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s Received remote context save notification: %@", (uint8_t *)&v10, 0x16u);

  }
  v4 = objc_alloc(MEMORY[0x1E0DC7AA0]);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionaryRepresentation:", v5);

  if ((objc_msgSend(v6, "originatedInCurrentProcess") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "pendingRemoteChangeNotification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "pendingRemoteChangeNotification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "notificationByMergingChangesFromNotification:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    objc_msgSend(*(id *)(a1 + 40), "setPendingRemoteChangeNotification:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "poke");
  }

}

uint64_t __29__WFDatabase_contextDidSave___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyResultsAboutChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__WFDatabase_object_didUpdateProperties_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didUpdateProperties:", *(_QWORD *)(a1 + 40));
  return 0;
}

void __52__WFDatabase_recordWithDescriptor_properties_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    v3 = (void *)a1[4];
    v4 = (void *)a1[5];
    v5 = a2;
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "recordClassForObjectType:", objc_msgSend(v4, "objectType"))), "initWithStorage:properties:", v5, a1[6]);

    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

id __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

BOOL __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "propertiesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

uint64_t __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  return 0;
}

uint64_t __43__WFDatabase_invalidateAllObjectsAndNotify__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyResultsAboutChange:", *(_QWORD *)(a1 + 40));
}

+ (id)createDatabaseForTesting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D140A0];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createTemporaryFileWithFilename:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getWFTestingLifecycleLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFDatabase createDatabaseForTesting]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating test database at %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C08]), "initWithURL:", v6);
  objc_msgSend(v8, "setType:", *MEMORY[0x1E0C979E8]);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStoreDescription:runMigrationsIfNecessary:useLockFile:error:", v8, 0, 1, 0);
  objc_msgSend(v9, "setDestroysOnDeallocation:", 1);
  objc_msgSend(v9, "setPostDistributedNotifications:", 0);

  return v9;
}

- (id)createBookmarkWithWorkflowID:(id)a3 path:(id)a4 bookmarkData:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  WFDatabase *v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__WFDatabase_Bookmarks__createBookmarkWithWorkflowID_path_bookmarkData_error___block_invoke;
  v18[3] = &unk_1E7AF37F8;
  v19 = v10;
  v20 = v11;
  v21 = self;
  v22 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("save bookmark for workflow+path (update if needed)"), v18, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)bookmarkDataForWorkflowID:(id)a3 path:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  WFDatabase *v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__WFDatabase_Bookmarks__bookmarkDataForWorkflowID_path_error___block_invoke;
  v14[3] = &unk_1E7AF3820;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v10 = v9;
  v11 = v8;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting bookmark data for workflow+path"), v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)bookmarksForWorkflowID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  WFDatabase *v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__WFDatabase_Bookmarks__bookmarksForWorkflowID_error___block_invoke;
  v10[3] = &unk_1E7AF3888;
  v11 = v6;
  v12 = self;
  v7 = v6;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting bookmarks for workflow"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)deleteAllBookmarksForWorkflowID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  WFDatabase *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__WFDatabase_Bookmarks__deleteAllBookmarksForWorkflowID_error___block_invoke;
  v9[3] = &unk_1E7AF93C8;
  v10 = v6;
  v11 = self;
  v7 = v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete all bookmarks for shortcut"), v9, a4);

  return a4 == 0;
}

- (id)allShortcutBookmarks
{
  void *v3;
  void *v4;
  void *v5;
  WFCoreDataDatabaseResult *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataShortcutBookmark fetchRequest](WFCoreDataShortcutBookmark, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("path"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:]([WFCoreDataDatabaseResult alloc], "initWithDatabase:fetchRequest:", self, v3);
  return v6;
}

void __63__WFDatabase_Bookmarks__deleteAllBookmarksForWorkflowID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  +[WFCoreDataShortcutBookmark fetchRequest](WFCoreDataShortcutBookmark, "fetchRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "executeRequest:error:", v5, a2);

}

id __54__WFDatabase_Bookmarks__bookmarksForWorkflowID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[WFCoreDataShortcutBookmark fetchRequest](WFCoreDataShortcutBookmark, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_40143);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __54__WFDatabase_Bookmarks__bookmarksForWorkflowID_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

id __62__WFDatabase_Bookmarks__bookmarkDataForWorkflowID_path_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[WFCoreDataShortcutBookmark fetchRequest](WFCoreDataShortcutBookmark, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32), CFSTR("path"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 48), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __78__WFDatabase_Bookmarks__createBookmarkWithWorkflowID_path_bookmarkData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  WFCoreDataShortcutBookmark *v11;
  void *v12;
  WFCoreDataShortcutBookmark *v13;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[WFCoreDataShortcutBookmark fetchRequest](WFCoreDataShortcutBookmark, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32), CFSTR("path"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 48), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    getWFFilesLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFDatabase(Bookmarks) createBookmarkWithWorkflowID:path:bookmarkData:error:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Found existing bookmark updating instead", buf, 0xCu);
    }

    objc_msgSend(v8, "setBookmarkData:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v8, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [WFCoreDataShortcutBookmark alloc];
    objc_msgSend(*(id *)(a1 + 48), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFCoreDataShortcutBookmark initWithContext:](v11, "initWithContext:", v12);

    -[WFCoreDataShortcutBookmark setPath:](v13, "setPath:", *(_QWORD *)(a1 + 40));
    -[WFCoreDataShortcutBookmark setBookmarkData:](v13, "setBookmarkData:", *(_QWORD *)(a1 + 56));
    -[WFCoreDataShortcutBookmark setIdentifier:](v13, "setIdentifier:", *(_QWORD *)(a1 + 32));
    -[WFCoreDataShortcutBookmark descriptor](v13, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)workflowResultWithLibraryQuery:(id)a3
{
  id v4;
  WFCoherenceDatabaseResult *v5;

  v4 = a3;
  v5 = -[WFCoherenceDatabaseResult initWithDatabase:libraryQuery:]([WFCoherenceDatabaseResult alloc], "initWithDatabase:libraryQuery:", self, v4);

  return v5;
}

- (unint64_t)countOfAllVisibleWorkflows
{
  WFLibrary *library;
  WFLibrary *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    if (self)
      library = self->_library;
    else
      library = 0;
    v4 = library;
    -[WFLibrary shortcutIdentifiers](v4, "shortcutIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    return v6;
  }
  else
  {
    +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase visiblePredicate](self, "visiblePredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    -[WFDatabase context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__WFDatabase_Shortcuts__countOfAllVisibleWorkflows__block_invoke;
    v13[3] = &unk_1E7AF8A80;
    v15 = &v16;
    v13[4] = self;
    v11 = v8;
    v14 = v11;
    objc_msgSend(v10, "performBlockAndWait:", v13);

    v12 = v17[3];
    _Block_object_dispose(&v16, 8);

    return v12;
  }
}

- (id)sortedVisibleWorkflowsWithType:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC7E58];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithWorkflowType:", v5);

  -[WFDatabase sortedWorkflowsWithQuery:](self, "sortedWorkflowsWithQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sortedVisibleWorkflowsByName
{
  return -[WFDatabase sortedVisibleWorkflowsByNameWithLimit:](self, "sortedVisibleWorkflowsByNameWithLimit:", 0);
}

- (id)sortedVisibleWorkflowsByNameWithLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:sortByName:limit:](WFLibraryQuery, "sortedWorkflowsWithQuery:sortByName:limit:", v5, 1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOWORD(v9) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, 0, 0, 0, 0, v9, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)sortedVisibleWorkflowsByLastRunOrModificationDateWithLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:sortByName:limit:](WFLibraryQuery, "sortedWorkflowsWithQuery:sortByName:limit:", v5, 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E7B8B818, &unk_1E7B8B830, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v9) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, v6, 0, 0, 0, 0, v9, a3);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:sortByName:associatedAppBundleIdentifier:](WFLibraryQuery, "sortedWorkflowsWithQuery:sortByName:associatedAppBundleIdentifier:", v5, 1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOWORD(v9) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, 0, 0, v4, 0, v9, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)sortedVisibleWorkflowsNameContains:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:sortByName:nameContaining:limit:](WFLibraryQuery, "sortedWorkflowsWithQuery:sortByName:nameContaining:limit:", v7, 1, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOWORD(v11) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, v6, 0, 0, 0, v11, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)workflowsWithTombstonedConflicts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:hasTombstonedConflicts:](WFLibraryQuery, "sortedWorkflowsWithQuery:hasTombstonedConflicts:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOWORD(v7) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 0, 0, 0, 0, 1, v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)allShortcuts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:](WFLibraryQuery, "sortedWorkflowsWithQuery:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOWORD(v7) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 0, 0, 0, 0, 0, v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)visibleReferencesForWorkflowName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    +[WFLibraryQuery sortedWorkflowsWithQuery:sortByName:nameEqualing:](WFLibraryQuery, "sortedWorkflowsWithQuery:sortByName:nameEqualing:", v5, 1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDatabase workflowResultWithLibraryQuery:](self, "workflowResultWithLibraryQuery:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LOWORD(v10) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, 0, v4, 0, 0, v10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)recentlyModifiedShortcuts
{
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
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -30, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("modificationDate"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  -[WFDatabase visiblePredicate](self, "visiblePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v13);

  -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)recentlyRunShortcuts
{
  return -[WFDatabase recentlyRunShortcutsWithLimit:](self, "recentlyRunShortcutsWithLimit:", 0);
}

- (id)recentlyRunShortcutsWithLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -30, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY runEvents.date >= %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  -[WFDatabase visiblePredicate](self, "visiblePredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastRunEventDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v15);

  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
    objc_msgSend(v8, "setFetchLimit:", a3);
  -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)shortcutsWithOutOfSyncWalrusStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K != %K) OR (%K == NIL AND %K > 0)"), CFSTR("wantedEncryptedSchemaVersion"), CFSTR("lastSyncedEncryptedSchemaVersion"), CFSTR("lastSyncedEncryptedSchemaVersion"), CFSTR("wantedEncryptedSchemaVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v9);

  -[WFDatabase workflowResultWithFetchRequest:](self, "workflowResultWithFetchRequest:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)referenceForWorkflowID:(id)a3
{
  return -[WFDatabase referenceForWorkflowID:includingTombstones:](self, "referenceForWorkflowID:includingTombstones:", a3, 0);
}

- (id)referenceForWorkflowID:(id)a3 includingTombstones:(BOOL)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  WFDatabase *v14;
  BOOL v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Shortcuts.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowID"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__WFDatabase_Shortcuts__referenceForWorkflowID_includingTombstones___block_invoke;
  v12[3] = &unk_1E7AF3928;
  v13 = v7;
  v14 = self;
  v15 = a4;
  v8 = v7;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting shortcut with id"), v12, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)visibleReferencesForWorkflowIDs:(id)a3 sortByKeys:(id)a4 nameContaining:(id)a5 nameEqualing:(id)a6 associatedAppBundleIdentifier:(id)a7 hasTombstonedConflicts:(BOOL)a8 isRecentlyModified:(BOOL)a9 isRecentlyRun:(BOOL)a10 limitTo:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  WFDatabase *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __190__WFDatabase_Shortcuts__visibleReferencesForWorkflowIDs_sortByKeys_nameContaining_nameEqualing_associatedAppBundleIdentifier_hasTombstonedConflicts_isRecentlyModified_isRecentlyRun_limitTo___block_invoke;
  v29[3] = &unk_1E7AF3950;
  v30 = v17;
  v31 = self;
  v32 = v19;
  v33 = v20;
  v37 = a8;
  v38 = a9;
  v39 = a10;
  v34 = v21;
  v35 = v18;
  v36 = a11;
  v22 = v18;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v17;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting visible references for workflow ids"), v29, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)visibleReferencesForWorkflowIDs:(id)a3 sortBy:(unint64_t)a4 nameContaining:(id)a5 nameEqualing:(id)a6 associatedAppBundleIdentifier:(id)a7 hasTombstonedConflicts:(BOOL)a8 isRecentlyModified:(BOOL)a9 isRecentlyRun:(BOOL)a10 limitTo:(unint64_t)a11
{
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _BOOL4 v27;

  v27 = a8;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v16, "numberWithUnsignedInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v25) = __PAIR16__(a10, a9);
  -[WFDatabase visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", v20, v22, v19, v18, v17, v27, v25, a11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)uniqueVisibleReferenceForWorkflowName:(id)a3
{
  void *v3;
  void *v4;

  -[WFDatabase visibleReferencesForWorkflowName:](self, "visibleReferencesForWorkflowName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasVisibleWorkflowsWithName:(id)a3
{
  void *v3;
  BOOL v4;

  -[WFDatabase visibleReferencesForWorkflowName:](self, "visibleReferencesForWorkflowName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)hasConflictWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  +[WFHomeManager cachedHomeSceneNames](WFHomeManager, "cachedHomeSceneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__WFDatabase_Shortcuts__hasConflictWithName___block_invoke;
  v10[3] = &unk_1E7AF3978;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "if_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 0;
  else
    v8 = -[WFDatabase hasVisibleWorkflowsWithName:](self, "hasVisibleWorkflowsWithName:", v6);

  return v8;
}

- (id)createWorkflowWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  -[WFDatabase createWorkflowWithOptions:nameCollisionBehavior:error:](self, "createWorkflowWithOptions:nameCollisionBehavior:error:", v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createWorkflowWithOptions:(id)a3 error:(id *)a4
{
  return -[WFDatabase createWorkflowWithOptions:nameCollisionBehavior:error:](self, "createWorkflowWithOptions:nameCollisionBehavior:error:", a3, 0, a4);
}

- (id)createWorkflowWithOptions:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  WFDatabase *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__40568;
  v21 = __Block_byref_object_dispose__40569;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__WFDatabase_Shortcuts__createWorkflowWithOptions_nameCollisionBehavior_error___block_invoke;
  v12[3] = &unk_1E7AF39A0;
  v9 = v8;
  v13 = v9;
  v14 = self;
  v15 = &v17;
  v16 = a4;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("create shortcut"), v12, a5);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)createWorkflowWithIdentifier:(id)a3 record:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v8, 0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__WFDatabase_Shortcuts__createWorkflowWithIdentifier_record_error___block_invoke;
  v14[3] = &unk_1E7AF39C8;
  v14[4] = self;
  v11 = v10;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = &v18;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("create shortcut"), v14, a5);
  LOBYTE(a5) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)a5;
}

- (id)duplicateReference:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Shortcuts.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reference"));

  }
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase suggestedWorkflowNameForName:](self, "suggestedWorkflowNameForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDatabase duplicateReference:newName:error:](self, "duplicateReference:newName:error:", v7, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)renameReference:(id)a3 to:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v24;
  id *v25;
  void *v26;
  id *v27;
  WFDatabase *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v25 = a5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Shortcuts.m"), 452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reference"));

    a5 = v25;
  }
  v27 = a5;
  v28 = self;
  -[WFDatabase validateWorkflowName:forCreation:overwriting:error:](self, "validateWorkflowName:forCreation:overwriting:error:", v10, 0, 0, a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v29;
  if (v29)
  {
    -[WFDatabase visibleReferencesForWorkflowName:](self, "visibleReferencesForWorkflowName:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

          if (v21)
          {
            v22 = v9;

            goto LABEL_16;
          }
          objc_msgSend(v13, "addObject:", v18);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (objc_msgSend(v13, "count"))
    {
      if (v27)
      {
        -[WFDatabase duplicateNameErrorWithName:](v28, "duplicateNameErrorWithName:", v29);
        v22 = 0;
        *v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__40568;
      v37 = __Block_byref_object_dispose__40569;
      v38 = 0;
      v24 = (void *)objc_opt_new();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __50__WFDatabase_Shortcuts__renameReference_to_error___block_invoke;
      v30[3] = &unk_1E7AF39F0;
      v31 = v29;
      v32 = &v33;
      -[WFDatabase accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:](v28, "accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:", v9, 1, v24, v30, v27);

      v22 = (id)v34[5];
      _Block_object_dispose(&v33, 8);

    }
LABEL_16:

    v11 = v29;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)deleteReference:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = -[WFDatabase deleteReference:tombstone:deleteConflictIfPresent:error:](self, "deleteReference:tombstone:deleteConflictIfPresent:error:", v6, +[WFCloudKitSyncSession isSyncEnabled](WFCloudKitSyncSession, "isSyncEnabled"), 1, a4);

  return (char)a4;
}

- (BOOL)deleteReference:(id)a3 tombstone:(BOOL)a4 deleteConflictIfPresent:(BOOL)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  WFDatabase *v20;
  BOOL v21;
  BOOL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!objc_msgSend(v10, "objectType"))
  {
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase deleteDonationsForShortcutWithIdentifier:](self, "deleteDonationsForShortcutWithIdentifier:", v11);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__WFDatabase_Shortcuts__deleteReference_tombstone_deleteConflictIfPresent_error___block_invoke;
  v18[3] = &unk_1E7AF3A18;
  v21 = a4;
  v12 = v10;
  v19 = v12;
  v20 = self;
  v22 = a5;
  v17 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete reference"), v18, &v17);
  v13 = v17;
  if (v13)
  {
    getWFDatabaseLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]";
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Failed to delete reference: %{public}@", buf, 0x16u);

    }
    *a6 = objc_retainAutorelease(v13);
  }

  return v13 == 0;
}

- (id)conflictingReferenceForReference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__WFDatabase_Shortcuts__conflictingReferenceForReference___block_invoke;
  v8[3] = &unk_1E7AF3A40;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting conflicts for shortcut"), v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remoteConflictingReferenceForReference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__WFDatabase_Shortcuts__remoteConflictingReferenceForReference___block_invoke;
  v8[3] = &unk_1E7AF3A40;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting remote conflict for shortcut"), v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localConflictingReferenceForReference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__WFDatabase_Shortcuts__localConflictingReferenceForReference___block_invoke;
  v8[3] = &unk_1E7AF3A40;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting local conflict for shortcut"), v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasConflictingReferenceForReference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  WFDatabase *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __61__WFDatabase_Shortcuts__hasConflictingReferenceForReference___block_invoke;
  v12 = &unk_1E7AF9350;
  v13 = self;
  v14 = v4;
  v5 = v4;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting conflict status for shortcut"), &v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue", v9, v10, v11, v12, v13);

  return v7;
}

- (void)setConflictingReference:(id)a3 forReference:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WFDatabase *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__WFDatabase_Shortcuts__setConflictingReference_forReference___block_invoke;
  v14[3] = &unk_1E7AF8CE0;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v9 = v7;
  v17 = v9;
  v13 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("create conflict for shortcut"), v14, &v13);
  v10 = v13;
  if (v10)
  {
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFDatabase(Shortcuts) setConflictingReference:forReference:]";
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Unable to mark reference as conflict: %{public}@", buf, 0x16u);

    }
  }

}

- (id)suggestedWorkflowNameForName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Shortcuts.m"), 657, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }
  else
  {
    v12 = 1;
  }
  v14 = v5;
  v20 = v14;
  if (-[WFDatabase hasVisibleWorkflowsWithName:](self, "hasVisibleWorkflowsWithName:", v14))
  {
    v15 = v14;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      ++v12;
      v15 = v14;
    }
    while (-[WFDatabase hasVisibleWorkflowsWithName:](self, "hasVisibleWorkflowsWithName:", v14));
  }

  return v14;
}

- (id)_createWorkflowWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  WFDatabase *v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__WFDatabase_Shortcuts___createWorkflowWithOptions_error___block_invoke;
  v10[3] = &unk_1E7AF3A68;
  v11 = v6;
  v12 = self;
  v7 = v6;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("create workflow"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)duplicateReference:(id)a3 newName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke;
  v14[3] = &unk_1E7AF3AB8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("duplicate workflow"), v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)validateWorkflowName:(id)a3 forCreation:(BOOL)a4 overwriting:(BOOL)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "wf_trimmedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "wf_isEmpty"))
  {
    if (a6)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v27[0] = *MEMORY[0x1E0CB2D68];
      WFLocalizedString(CFSTR("Invalid Name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v10;
      v27[1] = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("Please enter a name for this shortcut."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 0, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      a6 = 0;
    }
  }
  else
  {
    if (!a5)
    {
      +[WFHomeManager cachedHomeSceneNames](WFHomeManager, "cachedHomeSceneNames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __76__WFDatabase_Shortcuts__validateWorkflowName_forCreation_overwriting_error___block_invoke;
      v23[3] = &unk_1E7AF3978;
      v14 = v8;
      v24 = v14;
      objc_msgSend(v13, "if_firstObjectPassingTest:", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (a6 && v15)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v25[0] = *MEMORY[0x1E0CB2D68];
        WFLocalizedString(CFSTR("Name Cannot Be Used"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v17;
        v25[1] = *MEMORY[0x1E0CB2D50];
        v18 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("You already have a Home scene named “%@”. Please choose another name for this shortcut."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v19, v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 1, v21);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }

      if (v15)
        goto LABEL_10;
    }
    a6 = v8;
  }

  return a6;
}

- (id)duplicateNameErrorWithName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v12[0] = *MEMORY[0x1E0CB2D68];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedString(CFSTR("You already have a shortcut named “%@”."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, v5, v12[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v12[1] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Please choose another name for this shortcut."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)deleteDonationsForShortcutWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Shortcuts.m"), 889, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC7FD8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__WFDatabase_Shortcuts__deleteDonationsForShortcutWithIdentifier___block_invoke;
  v11[3] = &unk_1E7AF7B78;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v7, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:", v6, v8, 0, v11);

}

void __66__WFDatabase_Shortcuts__deleteDonationsForShortcutWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFDatabaseLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *MEMORY[0x1E0DC7FA0];
      v7 = 136315906;
      v8 = "-[WFDatabase(Shortcuts) deleteDonationsForShortcutWithIdentifier:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_ERROR, "%s Error deleting interactions for workflow reference %@, attributed to %@: %{public}@", (uint8_t *)&v7, 0x2Au);
    }

  }
}

BOOL __76__WFDatabase_Shortcuts__validateWorkflowName_forCreation_overwriting_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

id __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  WFWorkflowRecord *v6;
  WFWorkflowRecord *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  WFWorkflowRecord *v45;
  uint64_t v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  id v55;
  _BYTE v56[128];
  _BYTE buf[12];
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[WFRecord initWithStorage:properties:]([WFWorkflowRecord alloc], "initWithStorage:properties:", v5, 0);
    v7 = v6;
    if (v6)
    {
      -[WFWorkflowRecord setName:](v6, "setName:", *(_QWORD *)(a1 + 48));
      v8 = *(void **)(a1 + 32);
      v9 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v9, v11, CFSTR("workflowID"), 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
      {
        getWFCoherenceLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "workflowID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) duplicateReference:newName:error:]_block_invoke";
          v58 = 2114;
          v59 = v14;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEBUG, "%s Duplicate shortcut with id %{public}@", buf, 0x16u);

        }
        v15 = *(_QWORD **)(a1 + 32);
        if (v15)
          v15 = (_QWORD *)v15[15];
        v16 = v15;
        objc_msgSend(v12, "workflowID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "prependShortcutWithId:", v17);

        v18 = *(void **)(a1 + 32);
        v19 = objc_alloc(MEMORY[0x1E0DC7AA8]);
        objc_msgSend(v12, "workflowID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithIdentifier:objectType:", v20, 0);
        objc_msgSend(v18, "addPendingInsertedDescriptor:", v21);

        v22 = *(_QWORD **)(a1 + 32);
        if (v22)
          v22 = (_QWORD *)v22[15];
        v23 = v22;
        objc_msgSend(v5, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "collectionsAndFoldersContainingShortcut:error:", v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke_231;
        v52[3] = &unk_1E7AF3A90;
        v26 = v12;
        v27 = *(_QWORD *)(a1 + 32);
        v53 = v26;
        v54 = v27;
        v55 = v5;
        objc_msgSend(v25, "enumerateObjectsUsingBlock:", v52);
        v28 = *(_QWORD **)(a1 + 32);
        if (v28)
          v29 = (void *)v28[15];
        else
          v29 = 0;
        v30 = v29;
        objc_msgSend(v28, "saveLibraryToDatabase:", v30);

      }
      else
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v32 = v5;
        objc_msgSend(v5, "parents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v33)
        {
          v34 = v33;
          v45 = v7;
          v46 = a2;
          v35 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v49 != v35)
                objc_enumerationMutation(v25);
              v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v37, "shortcuts", v45, v46);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "indexOfObject:", v32);

              if (v39 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v37, "shortcuts");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (void *)objc_msgSend(v40, "mutableCopy");

                objc_msgSend(v41, "insertObject:atIndex:", v12, v39 + 1);
                objc_msgSend(v37, "setShortcuts:", v41);
                v42 = *(void **)(a1 + 32);
                *(_QWORD *)buf = CFSTR("shortcuts");
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

                objc_msgSend(v42, "object:didUpdateProperties:error:", v37, v43, 0);
                v32 = v5;
              }
            }
            v34 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v34);
          v7 = v45;
          a2 = v46;
        }
      }

      if (-[WFRecord writeToStorage:error:](v7, "writeToStorage:error:", v12, a2))
      {
        objc_msgSend(v12, "descriptor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

void __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFWorkflowTypeForCollectionIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getWFCoherenceLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "workflowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v51 = "-[WFDatabase(Shortcuts) duplicateReference:newName:error:]_block_invoke";
      v52 = 2114;
      v53 = v7;
      v54 = 2114;
      v55 = v8;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEBUG, "%s Add duplicate with id %{public}@ to built-in collection with id %{public}@", buf, 0x20u);

    }
    v9 = *(_QWORD **)(a1 + 40);
    if (v9)
      v9 = (_QWORD *)v9[15];
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v10, "indexOfShortcutWithIdentifier:inCollectionWithIdentifier:error:", v11, v12, &v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v49;

    if (v13)
    {
      v15 = *(_QWORD **)(a1 + 40);
      if (v15)
        v15 = (_QWORD *)v15[15];
      v16 = v15;
      objc_msgSend(*(id *)(a1 + 32), "workflowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "integerValue") + 1;
      objc_msgSend(v3, "identifier");
      v19 = objc_claimAutoreleasedReturnValue();
      v48 = v14;
      objc_msgSend(v16, "insertShortcutWithIdentifier:atIndex:toCollection:error:", v17, v18, v19, &v48);
      v20 = v48;
LABEL_27:
      v30 = v20;

      v14 = (id)v19;
LABEL_28:

      v14 = v30;
    }
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Root"));

    getWFCoherenceLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if ((v22 & 1) != 0)
    {
      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "workflowID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v51 = "-[WFDatabase(Shortcuts) duplicateReference:newName:error:]_block_invoke";
        v52 = 2114;
        v53 = v25;
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_DEBUG, "%s Add duplicate with id %{public}@ to root collection", buf, 0x16u);

      }
      v26 = *(_QWORD **)(a1 + 40);
      if (v26)
        v26 = (_QWORD *)v26[15];
      v27 = v26;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v27, "indexOfShortcutWithIdentifier:inCollectionWithIdentifier:error:", v28, CFSTR("Root"), &v45);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v45;

      if (v13)
      {
        v29 = *(_QWORD **)(a1 + 40);
        if (v29)
          v29 = (_QWORD *)v29[15];
        v16 = v29;
        objc_msgSend(*(id *)(a1 + 32), "workflowID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v14;
        objc_msgSend(v16, "moveShortcutWithIdentifier:toIndex:ofCollectionWithIdentifier:error:", v17, objc_msgSend(v13, "integerValue"), CFSTR("Root"), &v44);
        v30 = v44;
        goto LABEL_28;
      }
    }
    else
    {
      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "workflowID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v51 = "-[WFDatabase(Shortcuts) duplicateReference:newName:error:]_block_invoke";
        v52 = 2114;
        v53 = v31;
        v54 = 2114;
        v55 = v32;
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_DEBUG, "%s Add duplicate with id %{public}@ to folder with id %{public}@", buf, 0x20u);

      }
      v33 = *(_QWORD **)(a1 + 40);
      if (v33)
        v33 = (_QWORD *)v33[15];
      v34 = v33;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend(v34, "indexOfShortcutWithShortcut:folderIdentifier:error:", v35, v36, &v47);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v47;

      if (v13)
      {
        v37 = *(_QWORD **)(a1 + 40);
        if (v37)
          v37 = (_QWORD *)v37[15];
        v16 = v37;
        objc_msgSend(*(id *)(a1 + 32), "workflowID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v13, "integerValue") + 1;
        objc_msgSend(v3, "identifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v46 = v14;
        objc_msgSend(v16, "moveShortcutWithIdentifier:toIndex:ofFolderWithIdentifier:error:", v17, v38, v19, &v46);
        v20 = v46;
        goto LABEL_27;
      }
    }
  }

  if (v14)
  {
    getWFCoherenceLogObject();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[WFDatabase(Shortcuts) duplicateReference:newName:error:]_block_invoke";
      v52 = 2114;
      v53 = v14;
      _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_ERROR, "%s Failed to move duplicate: %{public}@", buf, 0x16u);
    }

  }
  v40 = *(void **)(a1 + 40);
  v41 = objc_alloc(MEMORY[0x1E0DC7AA8]);
  objc_msgSend(v3, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v41, "initWithIdentifier:objectType:", v42, 2);
  objc_msgSend(v40, "addPendingUpdatedDescriptor:", v43);

}

id __58__WFDatabase_Shortcuts___createWorkflowWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD *v49;
  _QWORD *v50;
  void *v51;
  id v52;
  uint64_t v53;
  _QWORD *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  _QWORD *v72;
  void *v73;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _BYTE buf[12];
  __int16 v81;
  id v82;
  __int16 v83;
  __CFString *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "collectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_3;
  v21 = *(void **)(a1 + 40);
  v22 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v22, v23, CFSTR("workflowID"), 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "record");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "writeToStorage:error:", v9, a2);

    if (v25)
    {
      objc_msgSend(v9, "setTombstoned:", objc_msgSend(*(id *)(a1 + 32), "deleted"));
      objc_msgSend(v9, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), v9, CFSTR("workflowID"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "writeToStorage:error:", v11, a2);

    v14 = 0;
    if (v13)
    {
      objc_msgSend(v11, "setTombstoned:", objc_msgSend(*(id *)(a1 + 32), "deleted"));
      objc_msgSend(*(id *)(a1 + 32), "collectionIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("Root");
      if (v15)
        v17 = (__CFString *)v15;
      v18 = v17;

      WFWorkflowTypeForCollectionIdentifier(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v20 = 0;
      else
        v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Root")) ^ 1;
      v26 = objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled");
      v27 = *(void **)(a1 + 40);
      v28 = objc_opt_class();
      if (v26)
      {
        v29 = (id)objc_msgSend(v27, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v28, v18, CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
        v30 = *(_QWORD **)(a1 + 40);
        if (v30)
          v30 = (_QWORD *)v30[15];
        v31 = v30;
        objc_msgSend(v11, "workflowID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "prependShortcutWithId:", v32);

        v33 = *(void **)(a1 + 40);
        v34 = objc_alloc(MEMORY[0x1E0DC7AA8]);
        objc_msgSend(v11, "workflowID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v34, "initWithIdentifier:objectType:", v35, 0);
        objc_msgSend(v33, "addPendingInsertedDescriptor:", v36);

        getWFCoherenceLogObject();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
        if (v19)
        {
          if (v38)
          {
            objc_msgSend(v11, "workflowID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) _createWorkflowWithOptions:error:]_block_invoke";
            v81 = 2114;
            v82 = v39;
            v83 = 2114;
            v84 = v18;
            _os_log_impl(&dword_1C15B3000, v37, OS_LOG_TYPE_DEBUG, "%s Add new shortcut with id %{public}@ to built-in collection with id %{public}@", buf, 0x20u);

          }
          v40 = *(_QWORD **)(a1 + 40);
          if (v40)
            v40 = (_QWORD *)v40[15];
          v37 = v40;
          objc_msgSend(v11, "workflowID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0;
          -[NSObject insertShortcutWithIdentifier:atIndex:toCollection:error:](v37, "insertShortcutWithIdentifier:atIndex:toCollection:error:", v41, 0, v18, &v79);
          v42 = v79;

        }
        else if (v20)
        {
          if (v38)
          {
            objc_msgSend(v11, "workflowID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) _createWorkflowWithOptions:error:]_block_invoke";
            v81 = 2114;
            v82 = v48;
            v83 = 2114;
            v84 = v18;
            _os_log_impl(&dword_1C15B3000, v37, OS_LOG_TYPE_DEBUG, "%s Add new shortcut with id %{public}@ to folder with id %{public}@", buf, 0x20u);

          }
          v49 = *(_QWORD **)(a1 + 40);
          if (v49)
            v49 = (_QWORD *)v49[15];
          v50 = v49;
          v78 = 0;
          objc_msgSend(v50, "shortcutsInFolderWithIdentifier:error:", v18, &v78);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v78;
          v53 = objc_msgSend(v51, "count");

          v54 = *(_QWORD **)(a1 + 40);
          if (v54)
            v54 = (_QWORD *)v54[15];
          v37 = v54;
          objc_msgSend(v11, "workflowID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v53)
          {
            v77 = v52;
            -[NSObject moveShortcutWithIdentifier:toIndex:ofFolderWithIdentifier:error:](v37, "moveShortcutWithIdentifier:toIndex:ofFolderWithIdentifier:error:", v55, 0, v18, &v77);
            v56 = v77;
          }
          else
          {
            v76 = v52;
            -[NSObject moveShortcutWithIdentifier:toFolder:error:](v37, "moveShortcutWithIdentifier:toFolder:error:", v55, v18, &v76);
            v56 = v76;
          }
          v42 = v56;

        }
        else
        {
          if (v38)
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) _createWorkflowWithOptions:error:]_block_invoke";
            _os_log_impl(&dword_1C15B3000, v37, OS_LOG_TYPE_DEBUG, "%s Added new shortcut to root collection", buf, 0xCu);
          }
          v42 = 0;
        }

        v69 = *(void **)(a1 + 40);
        v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v18, 2);
        objc_msgSend(v69, "addPendingUpdatedDescriptor:", v70);

        if (v42)
        {
          getWFCoherenceLogObject();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) _createWorkflowWithOptions:error:]_block_invoke";
            v81 = 2114;
            v82 = v42;
            _os_log_impl(&dword_1C15B3000, v71, OS_LOG_TYPE_ERROR, "%s Error when trying to add shortcut to built-in collection or folder: %{public}@", buf, 0x16u);
          }

        }
        v72 = *(_QWORD **)(a1 + 40);
        if (v72)
          v73 = (void *)v72[15];
        else
          v73 = 0;
        v64 = v73;
        objc_msgSend(v72, "saveLibraryToDatabase:", v64);
      }
      else
      {
        objc_msgSend(v27, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v28, v18, CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v75 = v19;
          objc_msgSend(*(id *)(a1 + 40), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), CFSTR("Root"), CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "shortcuts");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "mutableCopy");
          v46 = v45;
          if (v45)
            v47 = v45;
          else
            v47 = (id)objc_opt_new();
          v57 = v47;

          objc_msgSend(v57, "insertObject:atIndex:", v11, 0);
          objc_msgSend(v43, "setShortcuts:", v57);
          v58 = *(void **)(a1 + 40);
          *(_QWORD *)buf = CFSTR("shortcuts");
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

          objc_msgSend(v58, "object:didUpdateProperties:error:", v43, v59, a2);
          v19 = v75;
        }
        objc_msgSend(v42, "shortcuts");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)objc_msgSend(v60, "mutableCopy");
        v62 = v61;
        if (v61)
          v63 = v61;
        else
          v63 = (id)objc_opt_new();
        v64 = v63;

        if (objc_msgSend(*(id *)(a1 + 32), "location") == 0x7FFFFFFFFFFFFFFFLL
          || (v65 = objc_msgSend(*(id *)(a1 + 32), "location"), v65 >= objc_msgSend(v64, "count")))
        {
          v66 = 0;
        }
        else
        {
          v66 = objc_msgSend(*(id *)(a1 + 32), "location");
        }
        objc_msgSend(v64, "insertObject:atIndex:", v11, v66);
        objc_msgSend(v42, "setShortcuts:", v64);
        v67 = *(void **)(a1 + 40);
        *(_QWORD *)buf = CFSTR("shortcuts");
        v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

        objc_msgSend(v67, "object:didUpdateProperties:error:", v42, v68, a2);
      }

      objc_msgSend(v11, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v14;
}

void __62__WFDatabase_Shortcuts__setConflictingReference_forReference___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:", v4, MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    WFEnforceClass(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 48), MEMORY[0x1E0C9AA60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setConflictOf:", v7);
  v11 = *(void **)(a1 + 40);
  v13[0] = CFSTR("conflictOf");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v13, 1);

  objc_msgSend(v11, "object:didUpdateProperties:error:", v10, v12, a2);
}

id __61__WFDatabase_Shortcuts__hasConflictingReferenceForReference___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "conflictOf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(v4, "conflicts");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "numberWithBool:", v7 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

  }
  return v8;
}

id __63__WFDatabase_Shortcuts__localConflictingReferenceForReference___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  WFEnforceClass(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conflictOf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__WFDatabase_Shortcuts__remoteConflictingReferenceForReference___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  WFEnforceClass(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conflicts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__WFDatabase_Shortcuts__conflictingReferenceForReference___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  WFEnforceClass(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conflictOf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "conflicts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __81__WFDatabase_Shortcuts__deleteReference_tombstone_deleteConflictIfPresent_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  _QWORD *v48;
  _QWORD *v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  _BYTE buf[12];
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    v5 = objc_msgSend(*(id *)(a1 + 32), "objectType");
    if (v4)
    {
      if (v5)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "objectType") != 2)
          goto LABEL_33;
        getWFCoherenceLogObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
          v57 = 2114;
          v58 = v7;
          _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEBUG, "%s Tombstone folder with id %{public}@", buf, 0x16u);

        }
        v8 = *(_QWORD **)(a1 + 40);
        if (v8)
          v8 = (_QWORD *)v8[15];
        v9 = v8;
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tombstoneFolderWithIdentifier:error:", v10, a2);
      }
      else
      {
        getWFCoherenceLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
          v57 = 2114;
          v58 = v17;
          _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_DEBUG, "%s Remove shortcut with id %{public}@", buf, 0x16u);

        }
        v18 = *(_QWORD **)(a1 + 40);
        if (v18)
          v18 = (_QWORD *)v18[15];
        v9 = v18;
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeShortcutWithIdentifier:error:", v10, a2);
      }

      v19 = *(_QWORD **)(a1 + 40);
      if (v19)
        v20 = (void *)v19[15];
      else
        v20 = 0;
      v21 = v20;
      objc_msgSend(v19, "saveLibraryToDatabase:", v21);

      objc_msgSend(*(id *)(a1 + 40), "addPendingUpdatedDescriptor:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v5)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "objectType") != 2)
          goto LABEL_33;
        getWFCoherenceLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
          v57 = 2114;
          v58 = v12;
          _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEBUG, "%s Delete folder with id %{public}@", buf, 0x16u);

        }
        v13 = *(_QWORD **)(a1 + 40);
        if (v13)
          v13 = (_QWORD *)v13[15];
        v14 = v13;
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deleteFolderWithIdentifier:error:", v15, a2);
      }
      else
      {
        getWFCoherenceLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
          v57 = 2114;
          v58 = v23;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_DEBUG, "%s Remove shortcut with id %{public}@", buf, 0x16u);

        }
        v24 = *(_QWORD **)(a1 + 40);
        if (v24)
          v24 = (_QWORD *)v24[15];
        v14 = v24;
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeShortcutWithIdentifier:error:", v15, a2);
      }

      v25 = *(_QWORD **)(a1 + 40);
      if (v25)
        v26 = (void *)v25[15];
      else
        v26 = 0;
      v27 = v26;
      objc_msgSend(v25, "saveLibraryToDatabase:", v27);

      objc_msgSend(*(id *)(a1 + 40), "addPendingDeletedDescriptor:", *(_QWORD *)(a1 + 32));
    }
  }
LABEL_33:
  objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 32), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend(*(id *)(a1 + 40), "missingErrorForDescriptor:", *(_QWORD *)(a1 + 32));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_66;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v28;
  }
  else
  {
    objc_msgSend(v28, "managedObject");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;
  if (*(_BYTE *)(a1 + 48))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "objectType"))
    {
      v33 = v30;
      v32 = v33;
      if (*(_BYTE *)(a1 + 49))
      {
        objc_msgSend(v33, "conflictOf");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34
          || (objc_msgSend(v32, "conflicts"),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v35, "anyObject"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              v35,
              v34))
        {
          objc_msgSend(*(id *)(a1 + 40), "context");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "deleteObject:", v34);

        }
      }
      v31 = v32;
      goto LABEL_48;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "objectType") == 2)
    {
      v31 = v30;
      v32 = v31;
LABEL_48:
      objc_msgSend(v31, "setTombstoned:", 1);
      if ((objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled") & 1) == 0)
        objc_msgSend(v32, "setParents:", 0);
      v37 = *(void **)(a1 + 40);
      *(_QWORD *)buf = CFSTR("tombstoned");
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

      objc_msgSend(v37, "object:didUpdateProperties:error:", v32, v38, a2);
      goto LABEL_51;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deleteObject:", v30);
LABEL_51:

  if (!objc_msgSend(*(id *)(a1 + 32), "objectType"))
  {
    v39 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "deleteAllBookmarksForWorkflowID:error:", v40, a2);

    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WFCollapsedActions-%@"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "removeObjectForKey:", v43);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(*(id *)(a1 + 40), "mergeAutomationsAndShortcuts") & 1) == 0)
  {
    objc_msgSend(v30, "shortcut");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "hiddenFromLibraryAndSync"))
    {
      objc_msgSend(*(id *)(a1 + 40), "context");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "deleteObject:", v28);

      if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
      {
        getWFCoherenceLogObject();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v44, "workflowID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
          v57 = 2114;
          v58 = v47;
          _os_log_impl(&dword_1C15B3000, v46, OS_LOG_TYPE_DEBUG, "%s Remove shortcut with id %{public}@", buf, 0x16u);

        }
        v48 = *(_QWORD **)(a1 + 40);
        if (v48)
          v48 = (_QWORD *)v48[15];
        v49 = v48;
        objc_msgSend(v44, "workflowID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "removeShortcutWithIdentifier:error:", v50, a2);

        v51 = *(_QWORD **)(a1 + 40);
        if (v51)
          v52 = (void *)v51[15];
        else
          v52 = 0;
        v53 = v52;
        objc_msgSend(v51, "saveLibraryToDatabase:", v53);

        v54 = *(void **)(a1 + 40);
        objc_msgSend(v44, "descriptor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addPendingDeletedDescriptor:", v55);

      }
    }

  }
LABEL_66:

}

void __50__WFDatabase_Shortcuts__renameReference_to_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  WFWorkflowRecord *v6;
  void *v7;
  WFWorkflowRecord *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  if (v5)
  {
    v12 = v5;
    v6 = [WFWorkflowRecord alloc];
    v7 = (void *)objc_opt_new();
    v8 = -[WFRecord initWithStorage:properties:](v6, "initWithStorage:properties:", v12, v7);

    if (v8)
    {
      -[WFWorkflowRecord setName:](v8, "setName:", *(_QWORD *)(a1 + 32));
      if (-[WFWorkflowRecord saveChangesToStorage:error:](v8, "saveChangesToStorage:error:", v12, a3))
      {
        objc_msgSend(v12, "descriptor");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
    }

    v5 = v12;
  }

}

void __67__WFDatabase_Shortcuts__createWorkflowWithIdentifier_record_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:createIfNecessary:", *(_QWORD *)(a1 + 40), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = objc_msgSend(*(id *)(a1 + 48), "writeToStorage:error:", v4, a2);
    v4 = v6;
    if (v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __79__WFDatabase_Shortcuts__createWorkflowWithOptions_nameCollisionBehavior_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[WFWorkflow defaultName](WFWorkflow, "defaultName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 40), "validateWorkflowName:forCreation:overwriting:error:", v8, 1, *(_QWORD *)(a1 + 56) == 1, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "visibleReferencesForWorkflowName:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") < 2)
        {
          objc_msgSend(v12, "firstObject");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v18 = objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_24;
            v19 = (void *)v18;
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqualToString:", v21);

            if ((v22 & 1) == 0)
            {
              v28 = *(void **)(a1 + 40);
              objc_msgSend(*(id *)(a1 + 32), "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "referenceForWorkflowID:", v29);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23
                && (objc_msgSend(*(id *)(a1 + 40), "deleteReference:tombstone:deleteConflictIfPresent:error:", v13, 0, 1, a2) & 1) == 0)
              {

                goto LABEL_28;
              }
            }
            else
            {
LABEL_24:
              objc_msgSend(v13, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "setIdentifier:", v23);
            }

          }
        }
        else
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v31 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(a1 + 40), "deleteReference:tombstone:deleteConflictIfPresent:error:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), 0, 1, a2, (_QWORD)v30);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            }
            while (v15);
          }
        }

      }
      else if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "suggestedWorkflowNameForName:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      goto LABEL_27;
    }
    if (!objc_msgSend(*(id *)(a1 + 40), "hasVisibleWorkflowsWithName:", v9))
    {
LABEL_27:
      objc_msgSend(*(id *)(a1 + 32), "record", (_QWORD)v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setName:", v9);

      objc_msgSend(*(id *)(a1 + 40), "_createWorkflowWithOptions:error:", *(_QWORD *)(a1 + 32), a2);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      goto LABEL_28;
    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "duplicateNameErrorWithName:", v9);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_28:

}

BOOL __45__WFDatabase_Shortcuts__hasConflictWithName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

id __190__WFDatabase_Shortcuts__visibleReferencesForWorkflowIDs_sortByKeys_nameContaining_nameEqualing_associatedAppBundleIdentifier_hasTombstonedConflicts_isRecentlyModified_isRecentlyRun_limitTo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
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

  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("workflowID"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "visiblePredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K CONTAINS[cd] %@"), CFSTR("name"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == [c] %@"), CFSTR("name"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  v11 = *(_QWORD *)(a1 + 64);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("associatedAppBundleIdentifier"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("conflictOf.tombstoned"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (*(_BYTE *)(a1 + 89))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, -30, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("modificationDate"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  if (*(_BYTE *)(a1 + 90))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateByAddingUnit:value:toDate:options:", 16, -30, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY runEvents.date >= %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v22);

  v23 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", &unk_1E7B8B848))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v24);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", &unk_1E7B8B860))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("workflowID"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v25);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", &unk_1E7B8B818))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastRunEventDate"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v26);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", &unk_1E7B8B830))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v27);

  }
  objc_msgSend(v2, "setSortDescriptors:", v23);
  if (*(_QWORD *)(a1 + 80))
    objc_msgSend(v2, "setFetchLimit:");
  objc_msgSend(*(id *)(a1 + 40), "workflowResultWithFetchRequest:", v2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

id __68__WFDatabase_Shortcuts__referenceForWorkflowID_includingTombstones___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("workflowID"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeFetchRequest:error:", v4, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
    if (!*(_BYTE *)(a1 + 48))
    {
      if (objc_msgSend(v12, "isDeleted"))
        v14 = 0;
      else
        v14 = v13;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __51__WFDatabase_Shortcuts__countOfAllVisibleWorkflows__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "countForFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);

}

- (id)createTriggerWithRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__WFDatabase_Triggers__createTriggerWithRecord_error___block_invoke;
  v10[3] = &unk_1E7AF7220;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("creating trigger"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createTriggerWithRecord:(id)a3 workflow:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__WFDatabase_Triggers__createTriggerWithRecord_workflow_error___block_invoke;
  v14[3] = &unk_1E7AF7248;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("creating trigger"), v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)associateWorkflowToTrigger:(id)a3 workflow:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  WFDatabase *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__WFDatabase_Triggers__associateWorkflowToTrigger_workflow_error___block_invoke;
  v14[3] = &unk_1E7AF7248;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v10 = v8;
  v11 = v9;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("associating trigger with shortcut"), v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)configuredTriggersForWorkflowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[WFCoreDataTrigger fetchRequest](WFCoreDataTrigger, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("shortcut.workflowID == %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  -[WFDatabase triggerResultWithFetchRequest:](self, "triggerResultWithFetchRequest:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)allConfiguredTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataTrigger fetchRequest](WFCoreDataTrigger, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  -[WFDatabase triggerResultWithFetchRequest:](self, "triggerResultWithFetchRequest:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)triggerResultWithFetchRequest:(id)a3
{
  id v4;
  WFCoreDataDatabaseResult *v5;
  void *v6;
  WFCoreDataDatabaseResult *v7;

  v4 = a3;
  v5 = [WFCoreDataDatabaseResult alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("shortcut"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:relationshipKeysAffectingDescriptors:](v5, "initWithDatabase:fetchRequest:relationshipKeysAffectingDescriptors:", self, v4, v6);

  return v7;
}

- (id)configuredTriggerForTriggerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v4, 1);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__56131;
  v13 = __Block_byref_object_dispose__56132;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__WFDatabase_Triggers__configuredTriggerForTriggerID___block_invoke;
  v8[3] = &unk_1E7AF7270;
  v8[4] = &v9;
  -[WFDatabase accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:](self, "accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:", v5, 0, 0, v8, 0);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)createTriggerEventWithTriggerID:(id)a3 eventInfo:(id)a4 confirmed:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__WFDatabase_Triggers__createTriggerEventWithTriggerID_eventInfo_confirmed_error___block_invoke;
  v16[3] = &unk_1E7AF7298;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = a5;
  v12 = v11;
  v13 = v10;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("creating trigger event"), v16, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)triggerEventForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v6, 4);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__56131;
  v15 = __Block_byref_object_dispose__56132;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__WFDatabase_Triggers__triggerEventForIdentifier_error___block_invoke;
  v10[3] = &unk_1E7AF72C0;
  v10[4] = &v11;
  -[WFDatabase accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:](self, "accessStorageForDescriptor:forWriting:readingRecordProperties:usingBlock:withError:", v7, 0, 0, v10, a4);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)setConfirmedForTriggerEventWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__WFDatabase_Triggers__setConfirmedForTriggerEventWithIdentifier_error___block_invoke;
  v8[3] = &unk_1E7AF93C8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("set trigger confirmed"), v8, a4);

}

- (id)sortedTriggerEventsWithConfirmationOnly:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFCoreDataDatabaseResult *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataTriggerEvent fetchRequest](WFCoreDataTriggerEvent, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("confirmed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);

  }
  else
  {
    objc_msgSend(v5, "setPredicate:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v9);

  v10 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:]([WFCoreDataDatabaseResult alloc], "initWithDatabase:fetchRequest:", self, v6);
  return v10;
}

- (id)allConfiguredTriggersNeedingRunningNotifications
{
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
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataTrigger fetchRequest](WFCoreDataTrigger, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %i"), CFSTR("notificationLevel"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NO"), CFSTR("shouldNotify"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NO"), CFSTR("shouldPrompt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v15[0] = v4;
  v15[1] = v5;
  v15[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v11);

  -[WFDatabase triggerResultWithFetchRequest:](self, "triggerResultWithFetchRequest:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __72__WFDatabase_Triggers__setConfirmedForTriggerEventWithIdentifier_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), *(_QWORD *)(a1 + 40), CFSTR("identifier"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setConfirmed:", 1);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trigger event with ID %@ does not exist"), *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB2D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 3, v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void __56__WFDatabase_Triggers__triggerEventForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "descriptor");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __82__WFDatabase_Triggers__createTriggerEventWithTriggerID_eventInfo_confirmed_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  WFCoreDataTriggerEvent *v5;
  void *v6;
  WFCoreDataTriggerEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), *(_QWORD *)(a1 + 40), CFSTR("identifier"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [WFCoreDataTriggerEvent alloc];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFCoreDataTriggerEvent initWithContext:](v5, "initWithContext:", v6);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataTriggerEvent setIdentifier:](v7, "setIdentifier:", v9);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataTriggerEvent setDateCreated:](v7, "setDateCreated:", v10);

    -[WFCoreDataTriggerEvent setTrigger:](v7, "setTrigger:", v4);
    -[WFCoreDataTriggerEvent setEventInfo:](v7, "setEventInfo:", *(_QWORD *)(a1 + 48));
    -[WFCoreDataTriggerEvent setConfirmed:](v7, "setConfirmed:", *(unsigned __int8 *)(a1 + 56));
    -[WFCoreDataTriggerEvent descriptor](v7, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trigger with ID %@ does not exist"), *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB2D50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WFDatabaseErrorDomain"), 3, v14);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }

  return v11;
}

void __54__WFDatabase_Triggers__configuredTriggerForTriggerID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "descriptor");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __66__WFDatabase_Triggers__associateWorkflowToTrigger_workflow_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:", v3, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 48), MEMORY[0x1E0C9AA60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setShortcut:", v7);
    objc_msgSend(v11, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  objc_msgSend(*(id *)(a1 + 40), "missingErrorForDescriptor:", *(_QWORD *)(a1 + 32));
  v8 = 0;
  *a2 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

id __63__WFDatabase_Triggers__createTriggerWithRecord_workflow_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  WFCoreDataTrigger *v7;
  void *v8;
  WFCoreDataTrigger *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [WFCoreDataTrigger alloc];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFCoreDataTrigger initWithContext:](v7, "initWithContext:", v8);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataTrigger setIdentifier:](v9, "setIdentifier:", v11);

    if (objc_msgSend(*(id *)(a1 + 48), "writeToStorage:error:", v9, a2))
    {
      -[WFCoreDataTrigger setShortcut:](v9, "setShortcut:", v6);
      -[WFCoreDataTrigger descriptor](v9, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "missingErrorForDescriptor:", *(_QWORD *)(a1 + 40));
    v12 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __54__WFDatabase_Triggers__createTriggerWithRecord_error___block_invoke(uint64_t a1, uint64_t a2)
{
  WFCoreDataTrigger *v4;
  void *v5;
  WFCoreDataTrigger *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = [WFCoreDataTrigger alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCoreDataTrigger initWithContext:](v4, "initWithContext:", v5);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataTrigger setIdentifier:](v6, "setIdentifier:", v8);

  if (objc_msgSend(*(id *)(a1 + 40), "writeToStorage:error:", v6, a2))
  {
    -[WFCoreDataTrigger descriptor](v6, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)countOfWorkflowsInAFolder
{
  WFLibrary *library;
  WFLibrary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WFLibrary *v9;
  void *v10;
  WFLibrary *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  unint64_t v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE buf[24];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    if (self)
      library = self->_library;
    else
      library = 0;
    v4 = library;
    -[WFLibrary folders](v4, "folders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v6)
    {
      v29 = 0;
      v7 = *(_QWORD *)v35;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(obj);
          if (self)
            v9 = self->_library;
          else
            v9 = 0;
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
          v11 = v9;
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          -[WFLibrary shortcutsInFolderWithIdentifier:error:](v11, "shortcutsInFolderWithIdentifier:error:", v12, &v33);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v33;
          v15 = objc_msgSend(v13, "count");

          if (v14)
          {
            getWFDatabaseLogObject();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v10, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) countOfWorkflowsInAFolder]";
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v17;
              *(_WORD *)&buf[22] = 2114;
              v40 = v14;
              _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_FAULT, "%s Error fetching contents of folder with id %{public}@: %{public}@", buf, 0x20u);

            }
          }
          else
          {
            v29 += v15;
          }

          ++v8;
        }
        while (v6 != v8);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        v6 = v18;
      }
      while (v18);
    }
    else
    {
      v29 = 0;
    }
    v20 = obj;
    v26 = obj;
  }
  else
  {
    +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(parents, $folder, ANY $folder.identifier == %@).@count == 0"), CFSTR("Root"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3528];
    -[WFDatabase visiblePredicate](self, "visiblePredicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v22;
    v38[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v24);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v40 = 0;
    -[WFDatabase context](self, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __52__WFDatabase_Collections__countOfWorkflowsInAFolder__block_invoke;
    v30[3] = &unk_1E7AF8A80;
    v32 = buf;
    v30[4] = self;
    v26 = v19;
    v31 = v26;
    objc_msgSend(v25, "performBlockAndWait:", v30);

    v29 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }

  return v29;
}

- (id)createFolderWithName:(id)a3 icon:(unsigned __int16)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  WFDatabase *v14;
  unsigned __int16 v15;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__WFDatabase_Collections__createFolderWithName_icon_error___block_invoke;
  v12[3] = &unk_1E7AF8AA8;
  v13 = v8;
  v14 = self;
  v15 = a4;
  v9 = v8;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("create folder"), v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)updateFolder:(id)a3 newName:(id)a4 newIcon:(unsigned __int16)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  unsigned __int16 v19;

  v10 = a3;
  v11 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__WFDatabase_Collections__updateFolder_newName_newIcon_error___block_invoke;
  v16[3] = &unk_1E7AF8AD0;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v19 = a5;
  v12 = v10;
  v13 = v11;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("update folder"), v16, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)collectionsForWorkflowReference:(id)a3
{
  id v4;
  WFLibrary *library;
  WFLibrary *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    if (self)
      library = self->_library;
    else
      library = 0;
    v6 = library;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[WFLibrary collectionsAndFoldersContainingShortcut:error:](v6, "collectionsAndFoldersContainingShortcut:error:", v7, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v9)
    {
      getWFCoherenceLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v19 = "-[WFDatabase(Collections) collectionsForWorkflowReference:]";
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v9;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Fetching collections for shortcut with id %{public}@ failed with error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__WFDatabase_Collections__collectionsForWorkflowReference___block_invoke;
    v15[3] = &unk_1E7AF8B38;
    v15[4] = self;
    v16 = v4;
    -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting collections for shortcut"), v15, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)folderForWorkflowReference:(id)a3
{
  void *v4;
  id v5;
  WFLibrary *library;
  WFLibrary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  if (objc_msgSend(v4, "databaseCoherenceEnabled"))
  {
    if (self)
      library = self->_library;
    else
      library = 0;
    v7 = library;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFLibrary folderContainingShortcut:error:](v7, "folderContainingShortcut:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFGetBuiltInCollectionIdentifiers(1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase collectionsForWorkflowReference:](self, "collectionsForWorkflowReference:", v5);
    v7 = (WFLibrary *)objc_claimAutoreleasedReturnValue();

    -[WFLibrary allObjects](v7, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__WFDatabase_Collections__folderForWorkflowReference___block_invoke;
    v14[3] = &unk_1E7AF8B60;
    v15 = v10;
    v12 = v10;
    objc_msgSend(v11, "if_firstObjectPassingTest:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)collectionForWorkflowType:(id)a3
{
  id v4;
  WFLibrary *library;
  WFLibrary *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  WFDatabase *v13;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    if (self)
      library = self->_library;
    else
      library = 0;
    v6 = library;
    -[WFLibrary collectionWithWorkflowType:](v6, "collectionWithWorkflowType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    WFHumanReadableNameForWorkflowType();
    v6 = (WFLibrary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("getting collection for workflow type %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__WFDatabase_Collections__collectionForWorkflowType___block_invoke;
    v11[3] = &unk_1E7AF8B88;
    v12 = v4;
    v13 = self;
    -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", v9, v11, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)collectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  WFLibrary *library;
  WFLibrary *v8;
  WFLibrary *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  WFDatabase *v14;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    WFGetBuiltInCollectionIdentifiers(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);
    if (self)
      library = self->_library;
    else
      library = 0;
    v8 = library;
    v9 = v8;
    if ((v6 & 1) != 0)
      -[WFLibrary collectionWithIdentifier:](v8, "collectionWithIdentifier:", v4);
    else
      -[WFLibrary folderWithIdentifier:error:](v8, "folderWithIdentifier:error:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__WFDatabase_Collections__collectionWithIdentifier___block_invoke;
    v12[3] = &unk_1E7AF8B88;
    v13 = v4;
    v14 = self;
    -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting collection for id"), v12, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
  }

  return v10;
}

- (id)collectionWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  WFDatabase *v11;
  BOOL v12;

  v6 = a3;
  if (a4 && !objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__WFDatabase_Collections__collectionWithIdentifier_createIfNecessary___block_invoke;
    v9[3] = &unk_1E7AF8BB0;
    v10 = v6;
    v11 = self;
    v12 = a4;
    -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("get/create collection by id"), v9, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFDatabase collectionWithIdentifier:](self, "collectionWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)moveReferences:(id)a3 toIndex:(int64_t)a4 ofCollection:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  BOOL v15;
  void *v16;

  v10 = a3;
  objc_msgSend(a5, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("Root");
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = -[WFDatabase _moveReferences:toIndexes:ofCollectionID:error:](self, "_moveReferences:toIndexes:ofCollectionID:error:", v10, 0, v14, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a4, objc_msgSend(v10, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFDatabase _moveReferences:toIndexes:ofCollectionID:error:](self, "_moveReferences:toIndexes:ofCollectionID:error:", v10, v16, v14, a6);

  }
  return v15;
}

- (BOOL)moveReferences:(id)a3 toIndexes:(id)a4 ofCollection:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  BOOL v16;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("Root");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  v16 = -[WFDatabase _moveReferences:toIndexes:ofCollectionID:error:](self, "_moveReferences:toIndexes:ofCollectionID:error:", v11, v10, v15, a6);
  return v16;
}

- (BOOL)_moveReferences:(id)a3 toIndexes:(id)a4 ofCollectionID:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  WFDatabase *v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Collections.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationID"));

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke;
  v22[3] = &unk_1E7AF8CB8;
  v14 = v12;
  v23 = v14;
  v15 = v11;
  v24 = v15;
  v16 = v13;
  v25 = v16;
  v26 = self;
  v21 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("move shortcut"), v22, &v21);
  v17 = v21;
  v18 = v17;
  if (a6)
    *a6 = objc_retainAutorelease(v17);

  return v18 == 0;
}

- (BOOL)prependReferences:(id)a3 toCollection:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  BOOL v14;

  v8 = a3;
  objc_msgSend(a4, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("Root");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFDatabase _moveReferences:toIndexes:ofCollectionID:error:](self, "_moveReferences:toIndexes:ofCollectionID:error:", v8, v13, v12, a5);

  return v14;
}

- (BOOL)prependReferences:(id)a3 toCollectionWithType:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  WFWorkflowCollectionIdentifierForWorkflowType(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[WFDatabase _moveReferences:toIndexes:ofCollectionID:error:](self, "_moveReferences:toIndexes:ofCollectionID:error:", v8, v10, v9, a5);

  return (char)a5;
}

- (BOOL)removeReferences:(id)a3 fromCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  WFDatabase *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke;
  v16[3] = &unk_1E7AF8CE0;
  v10 = v8;
  v17 = v10;
  v18 = self;
  v11 = v9;
  v19 = v11;
  v15 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("remove shortcut from collection"), v16, &v15);
  v12 = v15;
  v13 = v12;
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v13 == 0;
}

- (BOOL)moveCollections:(id)a3 toIndexes:(id)a4 error:(id *)a5
{
  return -[WFDatabase moveCollections:toIndexes:ofCollectionWithIdentifier:error:](self, "moveCollections:toIndexes:ofCollectionWithIdentifier:error:", a3, a4, CFSTR("Root"), a5);
}

- (BOOL)moveCollections:(id)a3 toIndexes:(id)a4 ofCollectionWithIdentifier:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  WFDatabase *v27;
  id v28;
  __CFString *v29;
  __CFString *v30;

  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Collections.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collections"));

  }
  v14 = CFSTR("Root");
  if (v13)
    v14 = v13;
  v15 = v14;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke;
  v25[3] = &unk_1E7AF8D70;
  v16 = v12;
  v26 = v16;
  v27 = self;
  v17 = v11;
  v28 = v17;
  v18 = v15;
  v29 = v18;
  v19 = v13;
  v30 = v19;
  v24 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("move collection(s)"), v25, &v24);
  v20 = v24;
  v21 = v20;
  if (a6)
    *a6 = objc_retainAutorelease(v20);

  return v21 == 0;
}

- (id)allCollections
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    +[WFLibraryQuery sortedGroupings](WFLibraryQuery, "sortedGroupings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase collectionResultWithLibraryQuery:](self, "collectionResultWithLibraryQuery:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WFCoreDataCollection descriptorFetchRequest](WFCoreDataCollection, "descriptorFetchRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v5);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSortDescriptors:", v7);

    -[WFDatabase collectionResultWithFetchRequest:](self, "collectionResultWithFetchRequest:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v4;

  return v8;
}

- (id)deletedFolders
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    +[WFLibraryQuery deletedFolders](WFLibraryQuery, "deletedFolders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase collectionResultWithLibraryQuery:](self, "collectionResultWithLibraryQuery:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WFCoreDataCollection descriptorFetchRequest](WFCoreDataCollection, "descriptorFetchRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("tombstoned"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v5);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSortDescriptors:", v7);

    -[WFDatabase collectionResultWithFetchRequest:](self, "collectionResultWithFetchRequest:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v4;

  return v8;
}

- (id)collectionRecordForCollectionIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = (objc_class *)MEMORY[0x1E0DC7AA8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithIdentifier:objectType:", v7, 2);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__WFDatabase_Collections__collectionRecordForCollectionIdentifier_createIfNecessary___block_invoke;
  v12[3] = &unk_1E7AF8D98;
  v12[4] = self;
  v13 = v8;
  v14 = a4;
  v9 = v8;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("get/create collection by id"), v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)suggestedFolderNameForName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Collections.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }
  else
  {
    v12 = 1;
  }
  v14 = v5;
  -[WFDatabase visibleCollectionForFolderName:](self, "visibleCollectionForFolderName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v14;
  if (v15)
  {
    v16 = v14;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      ++v12;
      -[WFDatabase visibleCollectionForFolderName:](self, "visibleCollectionForFolderName:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v14;
    }
    while (v19);
  }

  return v14;
}

- (id)orphanedFoldersPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  WFGetBuiltInCollectionIdentifiers(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K.@count == 0 AND NOT %K IN %@"), CFSTR("parents"), CFSTR("identifier"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)orphanedFolders
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__WFDatabase_Collections__orphanedFolders__block_invoke;
  v3[3] = &unk_1E7AF8E40;
  v3[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting orphaned folders"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)orphanedWorkflowsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(parents, $folder, ANY $folder.parents.identifier == %@ OR $folder.identifier == %@).@count == 0"), CFSTR("Root"), CFSTR("Root"));
}

- (id)orphanedShortcuts
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__WFDatabase_Collections__orphanedShortcuts__block_invoke;
  v3[3] = &unk_1E7AF8E40;
  v3[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting orphaned shortcuts"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)collectionsWithOutOfSyncWalrusStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataCollection descriptorFetchRequest](WFCoreDataCollection, "descriptorFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K != %K) OR (%K == NIL AND %K > 0)"), CFSTR("wantedEncryptedSchemaVersion"), CFSTR("lastSyncedEncryptedSchemaVersion"), CFSTR("lastSyncedEncryptedSchemaVersion"), CFSTR("wantedEncryptedSchemaVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  -[WFDatabase collectionResultWithFetchRequest:](self, "collectionResultWithFetchRequest:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)collectionResultWithLibraryQuery:(id)a3
{
  id v4;
  WFCoherenceDatabaseResult *v5;

  v4 = a3;
  v5 = -[WFCoherenceDatabaseResult initWithDatabase:libraryQuery:]([WFCoherenceDatabaseResult alloc], "initWithDatabase:libraryQuery:", self, v4);

  return v5;
}

- (id)validateFolderName:(id)a3 forCollection:(id)a4 error:(id *)a5
{
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
  int v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "wf_trimmedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "wf_isEmpty"))
  {
    -[WFDatabase visibleCollectionForFolderName:](self, "visibleCollectionForFolderName:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if (!v15
      || (objc_msgSend(v15, "identifier"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "identifier"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v16, "isEqualToString:", v17),
          v17,
          v16,
          v18))
    {
      a5 = v10;
      goto LABEL_9;
    }
    if (!a5)
      goto LABEL_9;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Name Cannot Be Used"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    v27 = *MEMORY[0x1E0CB2D50];
    v22 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("You already have a folder named “%@”. Please choose another name for this folder."));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v23, v10, v26, v27, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v26, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 1, v25);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
    a5 = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v29[0] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Invalid Name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v29[1] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Please enter a name for this folder."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 0, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
LABEL_10:

  return a5;
}

- (id)visibleCollectionForFolderName:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabase+Collections.m"), 678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__WFDatabase_Collections__visibleCollectionForFolderName___block_invoke;
  v10[3] = &unk_1E7AF8B88;
  v10[4] = self;
  v11 = v5;
  v6 = v5;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting collection by name"), v10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __58__WFDatabase_Collections__visibleCollectionForFolderName___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[15];
    v5 = v4;
    objc_msgSend(v5, "folderWithName:tombstoned:", *(_QWORD *)(a1 + 40), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WFCoreDataCollection descriptorFetchRequest](WFCoreDataCollection, "descriptorFetchRequest");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name == %@ AND %K == NO"), *(_QWORD *)(a1 + 40), CFSTR("tombstoned"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v7);

    objc_msgSend(v5, "setFetchLimit:", 1);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executeFetchRequest:error:", v5, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __44__WFDatabase_Collections__orphanedShortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow descriptorFetchRequest](WFCoreDataWorkflow, "descriptorFetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "orphanedWorkflowsPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v4, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_213_61837);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44__WFDatabase_Collections__orphanedShortcuts__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

id __42__WFDatabase_Collections__orphanedFolders__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataCollection descriptorFetchRequest](WFCoreDataCollection, "descriptorFetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "orphanedFoldersPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v4, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indexesOfObjectsPassingTest:", &__block_literal_global_204);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_compactMap:", &__block_literal_global_206_61843);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __42__WFDatabase_Collections__orphanedFolders__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

BOOL __42__WFDatabase_Collections__orphanedFolders__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  v4 = v3 != 0;

  return v4;
}

WFWorkflowCollectionRecord *__85__WFDatabase_Collections__collectionRecordForCollectionIdentifier_createIfNecessary___block_invoke(uint64_t a1)
{
  void *v1;
  WFWorkflowCollectionRecord *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:createIfNecessary:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = -[WFRecord initWithStorage:]([WFWorkflowCollectionRecord alloc], "initWithStorage:", v1);
  else
    v2 = 0;

  return v2;
}

void __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id obj;
  __CFString *v39;
  _QWORD v41[4];
  __CFString *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE buf[12];
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    getWFCoherenceLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) moveCollections:toIndexes:ofCollectionWithIdentifier:error:]_block_invoke";
      v49 = 2114;
      v50 = v4;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEBUG, "%s Move collections to indexes %{public}@", buf, 0x16u);
    }

    v5 = *(_QWORD **)(a1 + 40);
    if (v5)
      v5 = (_QWORD *)v5[15];
    v6 = v5;
    objc_msgSend(v6, "moveFolders:toIndexes:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), a2);

    v7 = *(_QWORD **)(a1 + 40);
    if (v7)
      v8 = (void *)v7[15];
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v7, "saveLibraryToDatabase:", v9);

    v10 = *(void **)(a1 + 40);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 56), 2);
    objc_msgSend(v10, "addPendingUpdatedDescriptor:", v11);
  }
  else
  {
    v11 = (void *)objc_opt_new();
    v12 = *(__CFString **)(a1 + 64);
    if (!v12)
      v12 = CFSTR("Root");
    v39 = v12;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = *(id *)(a1 + 48);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          v17 = v11;
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v19 = *(void **)(a1 + 40);
          v20 = objc_opt_class();
          objc_msgSend(v18, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v20, v21, CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "parents");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke_187;
          v41[3] = &unk_1E7AF8D08;
          v42 = v39;
          objc_msgSend(v23, "if_compactMap:", v41);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setParents:", v24);

          v25 = *(void **)(a1 + 40);
          *(_QWORD *)buf = CFSTR("parents");
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

          objc_msgSend(v25, "object:didUpdateProperties:error:", v22, v26, a2);
          v11 = v17;
          objc_msgSend(v17, "addObject:", v22);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 40), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), v39, CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "collections");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");
    v30 = v29;
    if (v29)
      v31 = v29;
    else
      v31 = (id)objc_opt_new();
    v32 = v31;

    objc_msgSend(v32, "if_compactMap:", &__block_literal_global_189_61862);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");

    v35 = objc_msgSend(*(id *)(a1 + 32), "firstIndex");
    if (v35 >= objc_msgSend(v34, "count"))
      objc_msgSend(v34, "addObjectsFromArray:", v11);
    else
      objc_msgSend(v34, "insertObjects:atIndexes:", v11, *(_QWORD *)(a1 + 32));
    objc_msgSend(v27, "setCollections:", v34);
    v36 = *(void **)(a1 + 40);
    *(_QWORD *)buf = CFSTR("collections");
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

    objc_msgSend(v36, "object:didUpdateProperties:error:", v27, v37, a2);
  }

}

id __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke_187(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

id __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "tombstoned"))
  {
    objc_msgSend(v2, "setParents:", 0);
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

void __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke(id *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE buf[12];
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v4)
  {
    v6 = v4;
    v7 = MEMORY[0x1E0C9AA60];
    v8 = *(_QWORD *)v39;
    *(_QWORD *)&v5 = 136315394;
    v33 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
        objc_msgSend(a1[5], "objectForDescriptor:properties:", v10, v7, v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_class();
        WFEnforceClass(v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(a1[5], "missingErrorForDescriptor:", v10);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
        if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
        {
          getWFCoherenceLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = a1[6];
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) removeReferences:fromCollectionWithIdentifier:error:]_block_invoke";
            v43 = 2114;
            v44 = v15;
            v45 = 2114;
            v46 = v16;
            _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEBUG, "%s Remove shortcut with id %{public}@ from collection with id %{public}@", buf, 0x20u);

          }
          v17 = a1[5];
          if (v17)
            v17 = (_QWORD *)v17[15];
          v18 = v17;
          objc_msgSend(v10, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = a1[6];
          v37 = 0;
          objc_msgSend(v18, "removeShortcutWithIdentifier:fromCollectionWithIdentifier:error:", v19, v20, &v37);
          v21 = v37;

          if (v21)
          {
            getWFCoherenceLogObject();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v33;
              *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) removeReferences:fromCollectionWithIdentifier:error:]_block_invoke";
              v43 = 2114;
              v44 = v21;
              _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to remove workflow from a collection with error: %{public}@", buf, 0x16u);
            }

          }
          v23 = a1[5];
          if (v23)
            v24 = (void *)v23[15];
          else
            v24 = 0;
          v25 = v24;
          objc_msgSend(v23, "saveLibraryToDatabase:", v25);

          v26 = a1[5];
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", a1[6], 2);
          objc_msgSend(v26, "addPendingUpdatedDescriptor:", v27);

        }
        else
        {
          objc_msgSend(v13, "parents");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke_184;
          v35[3] = &unk_1E7AF8C28;
          v36 = a1[6];
          objc_msgSend(v28, "if_compactMap:", v35);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setParents:", v29);

          v30 = a1[5];
          *(_QWORD *)buf = CFSTR("parents");
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

          objc_msgSend(v30, "object:didUpdateProperties:error:", v13, v31, a2);
          v21 = v36;
        }

        ++v9;
      }
      while (v6 != v9);
      v32 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      v6 = v32;
    }
    while (v32);
  }
LABEL_26:

}

id __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((a1 & 1) != 0)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

void __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke(id *a1, _QWORD *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint8_t v52[128];
  _BYTE buf[12];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    if (!a1[4])
    {
      getWFCoherenceLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to move shortcuts because target index set is nil", buf, 0xCu);
      }
      goto LABEL_28;
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_168;
    v48[3] = &unk_1E7AF8C00;
    v3 = a1[5];
    v4 = a1[6];
    v5 = a1[7];
    v49 = v4;
    v50 = v5;
    v51 = a1[4];
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v48);

  }
  objc_msgSend(a1[7], "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), a1[6], CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
  v6 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = a1[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(a1[7], "objectForDescriptor:properties:", v12, MEMORY[0x1E0C9AA60]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        WFEnforceClass(v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(a1[7], "missingErrorForDescriptor:", v12);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
          v31 = v7;
          goto LABEL_27;
        }
        objc_msgSend(v15, "parents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v6;
        v18 = objc_msgSend(v16, "containsObject:", v6);

        WFWorkflowTypeForCollectionIdentifier(a1[6]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "parents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((v18 & 1) != 0 || v19)
        {
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_174;
          v42[3] = &unk_1E7AF8C28;
          v43 = a1[6];
          objc_msgSend(v21, "if_compactMap:", v42);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setParents:", v23);

          v21 = v43;
        }
        else
        {
          objc_msgSend(v20, "if_compactMap:", &__block_literal_global_176);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setParents:", v22);

        }
        v24 = a1[7];
        *(_QWORD *)buf = CFSTR("parents");
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

        objc_msgSend(v24, "object:didUpdateProperties:error:", v15, v25, a2);
        objc_msgSend(v40, "addObject:", v15);

        v6 = v17;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v9)
        continue;
      break;
    }
  }

  v26 = v6;
  -[NSObject shortcuts](v6, "shortcuts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");
  v29 = v28;
  if (v28)
    v30 = v28;
  else
    v30 = (id)objc_opt_new();
  v32 = v30;

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_3;
  v41[3] = &unk_1E7AF8C90;
  v41[4] = a1[7];
  objc_msgSend(v32, "if_compactMap:", v41);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v33, "mutableCopy");

  v34 = a1[4];
  if (v34 && (v35 = objc_msgSend(v34, "firstIndex"), v35 <= objc_msgSend(v31, "count")))
  {
    objc_msgSend(a1[4], "firstIndex");
    objc_msgSend(v31, "insertObjects:atIndexes:", v40, a1[4]);
    -[NSObject setShortcuts:](v26, "setShortcuts:", v31);
    v38 = a1[7];
    *(_QWORD *)buf = CFSTR("shortcuts");
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

    objc_msgSend(v38, "object:didUpdateProperties:error:", v26, v37, a2);
    v6 = v26;
  }
  else
  {
    objc_msgSend(v31, "addObjectsFromArray:", v40);
    v6 = v26;
    -[NSObject setShortcuts:](v26, "setShortcuts:", v31);
    v36 = a1[7];
    *(_QWORD *)buf = CFSTR("shortcuts");
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

    objc_msgSend(v36, "object:didUpdateProperties:error:", v26, v37, a2);
  }

LABEL_27:
LABEL_28:

}

void __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_168(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  _QWORD *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  id v45;
  _QWORD *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  id v75;
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  getWFCoherenceLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
    v79 = 2114;
    v80 = v7;
    v81 = 2114;
    v82 = v8;
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEBUG, "%s Move shortcut with id %{public}@ to collection with id %{public}@", buf, 0x20u);

  }
  v9 = *(_QWORD **)(a1 + 40);
  if (v9)
    v9 = (_QWORD *)v9[15];
  v10 = v9;
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  objc_msgSend(v10, "collectionAndFolderIdentifiersContainingShortcut:error:", v11, &v75);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v75;

  if (v13)
  {
    getWFCoherenceLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
      v79 = 2114;
      v80 = v13;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get collection and folder identifiers: %{public}@", buf, 0x16u);
    }

  }
  v15 = objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 32));
  WFWorkflowTypeForCollectionIdentifier(*(void **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v18 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Root"));
    if (objc_msgSend(*(id *)(a1 + 48), "count") == 1)
    {
      v19 = objc_msgSend(*(id *)(a1 + 48), "firstIndex");
    }
    else
    {
      v25 = (void *)objc_opt_new();
      v26 = *(void **)(a1 + 48);
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_170;
      v73[3] = &unk_1E7AF8BD8;
      v74 = v25;
      v27 = v13;
      v28 = v25;
      objc_msgSend(v26, "enumerateIndexesUsingBlock:", v73);
      objc_msgSend(v28, "objectAtIndex:", a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v29, "unsignedIntValue");

      v13 = v27;
    }
    if (v16)
      v30 = 1;
    else
      v30 = v18;
    v31 = *(_QWORD **)(a1 + 40);
    if (v31)
      v31 = (_QWORD *)v31[15];
    v32 = v31;
    v33 = v32;
    v34 = *(_QWORD *)(a1 + 32);
    if (v30)
    {
      v72 = 0;
      v35 = (id *)&v72;
      objc_msgSend(v32, "moveShortcutWithIdentifier:toIndex:ofCollectionWithIdentifier:error:", v17, v19, v34, &v72);
    }
    else
    {
      v71 = 0;
      v35 = (id *)&v71;
      objc_msgSend(v32, "moveShortcutWithIdentifier:toIndex:ofFolderWithIdentifier:error:", v17, v19, v34, &v71);
    }
    v24 = *v35;

    v36 = *(void **)(a1 + 40);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 32), 2);
    objc_msgSend(v36, "addPendingUpdatedDescriptor:", v37);

    if (v24)
    {
      getWFCoherenceLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke_2";
        v79 = 2114;
        v80 = v24;
        _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_ERROR, "%s Failed to reorder shortcut with error: %{public}@", buf, 0x16u);
      }
LABEL_46:

    }
  }
  else
  {
    v20 = *(_QWORD **)(a1 + 40);
    if (v20)
      v20 = (_QWORD *)v20[15];
    v21 = v20;
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 32);
    v60 = v17;
    v61 = v13;
    if (v16)
    {
      v70 = 0;
      objc_msgSend(v21, "insertShortcutWithIdentifier:atIndex:toCollection:error:", v17, a3, v23, &v70);
      v24 = v70;
    }
    else
    {
      v69 = 0;
      objc_msgSend(v21, "shortcutsInFolderWithIdentifier:error:", v23, &v69);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v69;
      v41 = objc_msgSend(v39, "count");

      v42 = *(_QWORD **)(a1 + 40);
      if (v42)
        v42 = (_QWORD *)v42[15];
      v43 = v42;
      v22 = v43;
      v44 = *(_QWORD *)(a1 + 32);
      if (v41)
      {
        v68 = v40;
        objc_msgSend(v43, "moveShortcutWithIdentifier:toIndex:ofFolderWithIdentifier:error:", v17, a3, v44, &v68);
        v24 = v68;

      }
      else
      {
        v67 = v40;
        objc_msgSend(v43, "appendShortcutWithIdentifier:toFolder:error:", v17, v44, &v67);
        v45 = v67;

        v46 = *(_QWORD **)(a1 + 40);
        if (v46)
          v46 = (_QWORD *)v46[15];
        v22 = v46;
        v47 = *(_QWORD *)(a1 + 32);
        v66 = v45;
        objc_msgSend(v22, "moveShortcutWithIdentifier:toIndex:ofFolderWithIdentifier:error:", v17, 0, v47, &v66);
        v24 = v66;

      }
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v48 = v12;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v63 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(a1 + 40);
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), 2);
          objc_msgSend(v53, "addPendingUpdatedDescriptor:", v54);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
      }
      while (v50);
    }

    v55 = *(void **)(a1 + 40);
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 32), 2);
    objc_msgSend(v55, "addPendingUpdatedDescriptor:", v56);

    if (v24)
    {
      getWFCoherenceLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      v13 = v61;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
        v79 = 2114;
        v80 = v24;
        _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_ERROR, "%s Failed to move shortcut with error: %{public}@", buf, 0x16u);
      }
      v17 = v60;
      goto LABEL_46;
    }
    v13 = v61;
    v17 = v60;
  }

  v57 = *(_QWORD **)(a1 + 40);
  if (v57)
    v58 = (void *)v57[15];
  else
    v58 = 0;
  v59 = v58;
  objc_msgSend(v57, "saveLibraryToDatabase:", v59);

}

id __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((a1 & 1) != 0)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

id __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "tombstoned"))
  {
    objc_msgSend(v3, "setParents:", 0);
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "visiblePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "evaluateWithObject:", v3);

  if (!v5)
    goto LABEL_5;
  v6 = v3;
LABEL_6:

  return v6;
}

id __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFWorkflowTypeForCollectionIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v2;
  else
    v5 = 0;

  return v5;
}

void __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_170(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

id __70__WFDatabase_Collections__collectionWithIdentifier_createIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 32), 2);
  objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:createIfNecessary:", v2, 0, *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__WFDatabase_Collections__collectionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 32), 2);
  objc_msgSend(*(id *)(a1 + 40), "objectForDescriptor:properties:createIfNecessary:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53__WFDatabase_Collections__collectionForWorkflowType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  WFWorkflowCollectionIdentifierForWorkflowType(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), v2, CFSTR("identifier"), 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __54__WFDatabase_Collections__folderForWorkflowReference___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

id __59__WFDatabase_Collections__collectionsForWorkflowReference___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:createIfNecessary:", *(_QWORD *)(a1 + 40), 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "parents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_61897);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __59__WFDatabase_Collections__collectionsForWorkflowReference___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

id __62__WFDatabase_Collections__updateFolder_newName_newIcon_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t i;
  _BYTE v31[22];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "validateFolderName:forCollection:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
    {
      getWFCoherenceLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 136315394;
        *(_QWORD *)&v31[4] = "-[WFDatabase(Collections) updateFolder:newName:newIcon:error:]_block_invoke";
        *(_WORD *)&v31[12] = 2114;
        *(_QWORD *)&v31[14] = v6;
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Update folder with id %{public}@", v31, 0x16u);

      }
      v7 = *(_QWORD **)(a1 + 32);
      if (v7)
        v7 = (_QWORD *)v7[15];
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateFolderWithIdentifier:newName:newIcon:error:", v9, v4, *(unsigned __int16 *)(a1 + 56), a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(_QWORD **)(a1 + 32);
      if (v11)
        v12 = (void *)v11[15];
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v11, "saveLibraryToDatabase:", v13);

      v14 = *(void **)(a1 + 32);
      v15 = objc_alloc(MEMORY[0x1E0DC7AA8]);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithIdentifier:objectType:", v16, 2);
      objc_msgSend(v14, "addPendingUpdatedDescriptor:", v17);

      goto LABEL_19;
    }
    v18 = *(void **)(a1 + 32);
    v19 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v19, v20, CFSTR("identifier"), 0, MEMORY[0x1E0C9AA60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(void **)(a1 + 40);
    objc_msgSend(v16, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0)
    {
      objc_msgSend(v16, "workflowIcon");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "glyphCharacter");
      v25 = *(unsigned __int16 *)(a1 + 56);

      if (v24 == v25)
      {
LABEL_18:
        objc_msgSend(v16, "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v16, "setName:", v4);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", 0, *(unsigned __int16 *)(a1 + 56), 0);
    objc_msgSend(v16, "setWorkflowIcon:", v26);

    v27 = *(void **)(a1 + 32);
    *(_QWORD *)v31 = CFSTR("name");
    *(_QWORD *)&v31[8] = CFSTR("workflowIcon");
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v31, 2);
    for (i = 8; i != -8; i -= 8)

    objc_msgSend(v27, "object:didUpdateProperties:error:", v16, v28, a2, *(_QWORD *)v31, *(_QWORD *)&v31[8]);
    goto LABEL_18;
  }
  v10 = 0;
LABEL_20:

  return v10;
}

id __59__WFDatabase_Collections__createFolderWithName_icon_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFCoreDataCollection *v10;
  void *v11;
  WFCoreDataCollection *v12;
  void *v13;
  NSObject *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t i;
  id v39;
  _BYTE buf[24];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  if (v4 && (objc_msgSend(v4, "wf_isEmpty") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "validateFolderName:forCollection:error:", *(_QWORD *)(a1 + 32), 0, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_4;
LABEL_17:
    v18 = 0;
    goto LABEL_26;
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DC7E10], "defaultName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestedFolderNameForName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_17;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [WFCoreDataCollection alloc];
  objc_msgSend(*(id *)(a1 + 40), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFCoreDataCollection initWithContext:](v10, "initWithContext:", v11);

  -[WFCoreDataCollection setIdentifier:](v12, "setIdentifier:", v9);
  objc_msgSend(*(id *)(a1 + 40), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), CFSTR("Root"), CFSTR("identifier"), 1, MEMORY[0x1E0C9AA60]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    getWFCoherenceLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) createFolderWithName:icon:error:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEBUG, "%s Create folder with id %{public}@", buf, 0x16u);
    }

    v15 = *(_QWORD **)(a1 + 40);
    if (v15)
      v15 = (_QWORD *)v15[15];
    v16 = v15;
    v17 = *(unsigned __int16 *)(a1 + 48);
    v39 = 0;
    objc_msgSend(v16, "insertFolderWithName:icon:identifier:error:", v7, v17, v9, &v39);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v39;

    if (v19)
    {
      getWFCoherenceLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFDatabase(Collections) createFolderWithName:icon:error:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s Failed to create folder in library: %@", buf, 0x16u);
      }

    }
    v21 = *(void **)(a1 + 40);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v9, 2);
    objc_msgSend(v21, "addPendingInsertedDescriptor:", v22);

    v23 = *(void **)(a1 + 40);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", CFSTR("Root"), 2);
    objc_msgSend(v23, "addPendingUpdatedDescriptor:", v24);

    v25 = *(_QWORD **)(a1 + 40);
    if (v25)
      v26 = (void *)v25[15];
    else
      v26 = 0;
    v27 = v26;
    objc_msgSend(v25, "saveLibraryToDatabase:", v27);

    v28 = 0x1E0C99000;
  }
  else
  {
    -[WFCoreDataCollection setName:](v12, "setName:", v7);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", 0, *(unsigned __int16 *)(a1 + 48), 0);
    -[WFCoreDataCollection setWorkflowIcon:](v12, "setWorkflowIcon:", v29);

    objc_msgSend(v13, "collections");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v30)
      v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "orderedSetByAddingObject:", v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCollections:", v32);

    if (!v30)
    v33 = *(void **)(a1 + 40);
    *(_QWORD *)buf = CFSTR("collections");
    v28 = 0x1E0C99000uLL;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", buf, 1);

    objc_msgSend(v33, "object:didUpdateProperties:error:", v13, v34, a2);
    -[WFCoreDataCollection descriptor](v12, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = *(void **)(a1 + 40);
  *(_QWORD *)buf = CFSTR("identifier");
  *(_QWORD *)&buf[8] = CFSTR("name");
  *(_QWORD *)&buf[16] = CFSTR("workflowIcon");
  v36 = (void *)objc_msgSend(objc_alloc(*(Class *)(v28 + 3680)), "initWithObjects:count:", buf, 3);
  for (i = 16; i != -8; i -= 8)

  objc_msgSend(v35, "object:didUpdateProperties:error:", v12, v36, a2);
LABEL_26:

  return v18;
}

void __52__WFDatabase_Collections__countOfWorkflowsInAFolder__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "countForFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);

}

- (id)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabase logRunOfWorkflow:atDate:withIdentifier:source:triggerID:](self, "logRunOfWorkflow:atDate:withIdentifier:source:triggerID:", v11, v12, v14, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)logRunOfWorkflow:(id)a3 atDate:(id)a4 withIdentifier:(id)a5 source:(id)a6 triggerID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__WFDatabase_RunEvents__logRunOfWorkflow_atDate_withIdentifier_source_triggerID___block_invoke;
  v28[3] = &unk_1E7AF8EA8;
  v28[4] = self;
  v17 = v13;
  v29 = v17;
  v18 = v14;
  v30 = v18;
  v19 = v15;
  v31 = v19;
  v20 = v12;
  v32 = v20;
  v21 = v16;
  v33 = v21;
  v27 = 0;
  -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("creating run event"), v28, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  if (v23)
  {
    getWFDatabaseLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFDatabase(RunEvents) logRunOfWorkflow:atDate:withIdentifier:source:triggerID:]";
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_ERROR, "%s Unable to log workflow run event: %@", buf, 0x16u);

    }
  }

  return v22;
}

- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__WFDatabase_RunEvents__setOutcome_forRunEvent___block_invoke;
  v12[3] = &unk_1E7AF8ED0;
  v12[4] = self;
  v7 = v6;
  v13 = v7;
  v14 = a3;
  v11 = 0;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("set run event outcome"), v12, &v11);
  v8 = v11;
  if (v8)
  {
    getWFDatabaseLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFDatabase(RunEvents) setOutcome:forRunEvent:]";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Unable to set outcome for run event: %@", buf, 0x16u);

    }
  }

}

- (id)sortedRunEventsWithSource:(id)a3
{
  return -[WFDatabase sortedRunEventsWithSource:startDate:endDate:](self, "sortedRunEventsWithSource:startDate:endDate:", a3, 0, 0);
}

- (id)sortedRunEventsWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFCoreDataDatabaseResult *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == %@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("date >= %@"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("date <= %@"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v16);

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v18);

  v19 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:]([WFCoreDataDatabaseResult alloc], "initWithDatabase:fetchRequest:", self, v11);
  return v19;
}

- (id)sortedRunEventsForTriggerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFCoreDataDatabaseResult *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trigger.identifier == %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  v9 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:]([WFCoreDataDatabaseResult alloc], "initWithDatabase:fetchRequest:", self, v5);
  return v9;
}

- (id)triggerRunEventsInTheLastWeek
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFCoreDataDatabaseResult *v8;

  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, -7, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trigger.identifier != nil && date > %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v7);

  v8 = -[WFCoreDataDatabaseResult initWithDatabase:fetchRequest:]([WFCoreDataDatabaseResult alloc], "initWithDatabase:fetchRequest:", self, v3);
  return v8;
}

- (id)latestRunEvent
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__WFDatabase_RunEvents__latestRunEvent__block_invoke;
  v3[3] = &unk_1E7AF8EF8;
  v3[4] = self;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting latest run event"), v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__WFDatabase_RunEvents__latestRunEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataRunEvent fetchRequest](WFCoreDataRunEvent, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v4, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __48__WFDatabase_RunEvents__setOutcome_forRunEvent___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", v5, v6, CFSTR("identifier"), 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setOutcome:", *(unsigned int *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "missingErrorForDescriptor:", *(_QWORD *)(a1 + 40));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

}

id __81__WFDatabase_RunEvents__logRunOfWorkflow_atDate_withIdentifier_source_triggerID___block_invoke(uint64_t a1)
{
  WFCoreDataRunEvent *v2;
  void *v3;
  WFCoreDataRunEvent *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v2 = [WFCoreDataRunEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFCoreDataRunEvent initWithContext:](v2, "initWithContext:", v3);

  -[WFCoreDataRunEvent setDate:](v4, "setDate:", *(_QWORD *)(a1 + 40));
  -[WFCoreDataRunEvent setIdentifier:](v4, "setIdentifier:", *(_QWORD *)(a1 + 48));
  -[WFCoreDataRunEvent setSource:](v4, "setSource:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "objectForDescriptor:properties:", *(_QWORD *)(a1 + 64), MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataRunEvent setShortcut:](v4, "setShortcut:", v5);

  v6 = *(_QWORD *)(a1 + 40);
  -[WFCoreDataRunEvent shortcut](v4, "shortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastRunEventDate:", v6);

  -[WFCoreDataRunEvent shortcut](v4, "shortcut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceUnknown")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceOnDevice")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceGallery")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceAddToSiri")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceCloudLink")) & 1) == 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceDefaultShortcut")) & 1) != 0)
    {

      -[WFCoreDataRunEvent shortcut](v4, "shortcut");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSource:", CFSTR("ShortcutSourceActiveStarterShortcut"));
      goto LABEL_17;
    }
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceSiriTopLevelShortcut")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceAutomatorMigration")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceFilePublic")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceFileKnownContacts")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceFilePersonal")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceEditorDocumentMenu")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceAppShortcut")) & 1) == 0)
    {
      objc_msgSend(v9, "isEqualToString:", CFSTR("ShortcutSourceActiveStarterShortcut"));
    }
  }

LABEL_17:
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), *(_QWORD *)(a1 + 72), CFSTR("identifier"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataRunEvent setTrigger:](v4, "setTrigger:", v10);

  }
  -[WFCoreDataRunEvent descriptor](v4, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)badgeTypeForEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  WFDatabase *v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__WFDatabase_PersistedSerializedParameters__badgeTypeForEntityIdentifier_error___block_invoke;
  v10[3] = &unk_1E7AF9350;
  v11 = v6;
  v12 = self;
  v7 = v6;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting entity badge"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)serializedParametersForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  WFDatabase *v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__WFDatabase_PersistedSerializedParameters__serializedParametersForIdentifier_error___block_invoke;
  v10[3] = &unk_1E7AF9378;
  v11 = v6;
  v12 = self;
  v7 = v6;
  -[WFDatabase performOperationWithReason:block:error:](self, "performOperationWithReason:block:error:", CFSTR("getting serialized parameters"), v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)storeSerializedParameters:(id)a3 forIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __111__WFDatabase_PersistedSerializedParameters__storeSerializedParameters_forIdentifier_queryName_badgeType_error___block_invoke;
  v19[3] = &unk_1E7AF93A0;
  v19[4] = self;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  v23 = a6;
  v15 = v14;
  v16 = v12;
  v18 = v13;
  v17 = -[WFDatabase performSaveOperationWithReason:block:error:](self, "performSaveOperationWithReason:block:error:", CFSTR("save serialized parameters"), v19, a7);

}

- (void)removeAllSerializedParametersForQueryName:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFDatabase *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__WFDatabase_PersistedSerializedParameters__removeAllSerializedParametersForQueryName_error___block_invoke;
  v8[3] = &unk_1E7AF93C8;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[WFDatabase performTransactionWithReason:block:error:](self, "performTransactionWithReason:block:error:", CFSTR("delete all serialized parameters for query"), v8, a4);

}

void __93__WFDatabase_PersistedSerializedParameters__removeAllSerializedParametersForQueryName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  +[WFPersistedSerializedParameters fetchRequest](WFPersistedSerializedParameters, "fetchRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("queryName"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "executeRequest:error:", v5, a2);

}

WFPersistedSerializedParameters *__111__WFDatabase_PersistedSerializedParameters__storeSerializedParameters_forIdentifier_queryName_badgeType_error___block_invoke(uint64_t a1)
{
  WFPersistedSerializedParameters *v2;
  void *v3;
  WFPersistedSerializedParameters *v4;

  v2 = [WFPersistedSerializedParameters alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFPersistedSerializedParameters initWithContext:](v2, "initWithContext:", v3);

  -[WFPersistedSerializedParameters setIdentifier:](v4, "setIdentifier:", *(_QWORD *)(a1 + 40));
  -[WFPersistedSerializedParameters setData:](v4, "setData:", *(_QWORD *)(a1 + 48));
  -[WFPersistedSerializedParameters setQueryName:](v4, "setQueryName:", *(_QWORD *)(a1 + 56));
  -[WFPersistedSerializedParameters setBadgeType:](v4, "setBadgeType:", *(unsigned int *)(a1 + 64));
  return v4;
}

id __85__WFDatabase_PersistedSerializedParameters__serializedParametersForIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[WFPersistedSerializedParameters fetchRequest](WFPersistedSerializedParameters, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __80__WFDatabase_PersistedSerializedParameters__badgeTypeForEntityIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[WFPersistedSerializedParameters fetchRequest](WFPersistedSerializedParameters, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "badgeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
