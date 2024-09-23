@implementation PLLibraryScopeRuleManager

- (PLLibraryScopeRuleManager)initWithLibraryScope:(id)a3
{
  id v4;
  PLLibraryScopeRuleManager *v5;
  PLLibraryScopeRuleManager *v6;
  void *v7;
  void *v8;
  PLManagedAssetRuleInterpreter *v9;
  PLLibraryScopeRuleEvaluator *v10;
  NSObject *v11;
  PLLibraryScopeRuleEvaluator *v12;
  objc_super v14;
  uint8_t buf[4];
  PLLibraryScopeRuleEvaluator *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLLibraryScopeRuleManager;
  v5 = -[PLLibraryScopeRuleManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PLLibraryScopeRuleManager setLibraryScope:](v5, "setLibraryScope:", v4);
    objc_msgSend(v4, "rulesData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:](PLLibraryScopeRule, "libraryScopeRulesForLibraryScopeRulesData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_alloc_init(PLManagedAssetRuleInterpreter);
      -[PLLibraryScopeRuleManager setInterpreter:](v6, "setInterpreter:", v9);

      v10 = [PLLibraryScopeRuleEvaluator alloc];
      -[PLLibraryScopeRuleManager interpreter](v6, "interpreter");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[PLLibraryScopeRuleEvaluator initWithRules:andInterpreter:](v10, "initWithRules:andInterpreter:", v8, v11);
      -[PLLibraryScopeRuleManager setRuleEvaluator:](v6, "setRuleEvaluator:", v12);
    }
    else
    {
      PLBackendSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        goto LABEL_8;
      }
      -[PLLibraryScopeRuleManager libraryScope](v6, "libraryScope");
      v12 = (PLLibraryScopeRuleEvaluator *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Library scope %@ do not contain any rules.", buf, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (BOOL)evaluateAssetObjectIDs:(id)a3 withResultEnumerationBlock:(id)a4
{
  return -[PLLibraryScopeRuleManager evaluateAssetObjectIDs:simulate:withResultEnumerationBlock:](self, "evaluateAssetObjectIDs:simulate:withResultEnumerationBlock:", a3, 0, a4);
}

- (BOOL)evaluateAssetObjectIDs:(id)a3 simulate:(BOOL)a4 withResultEnumerationBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND (%K == %i OR %K == %i)"), CFSTR("activeLibraryScopeParticipationState"), 0, CFSTR("libraryScopeShareState"), 0, CFSTR("libraryScopeShareState"), 0x10000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[PLLibraryScopeRuleManager evaluateAssetObjectIDs:simulate:predicateToFetchAssetsToEvaluate:withResultEnumerationBlock:](self, "evaluateAssetObjectIDs:simulate:predicateToFetchAssetsToEvaluate:withResultEnumerationBlock:", v9, v5, v10, v8);

  return v5;
}

- (BOOL)evaluateAssetObjectIDs:(id)a3 simulate:(BOOL)a4 predicateToFetchAssetsToEvaluate:(id)a5 withResultEnumerationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  PLLibraryScopeRuleManager *v24;
  id v25;
  id v26;
  uint8_t *v27;
  uint64_t v28;
  BOOL v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "count");
  if (v13)
  {
    v14 = v13;
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x2020000000;
    v33 = 1;
    -[PLLibraryScopeRuleManager libraryScope](self, "libraryScope");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke;
    v21[3] = &unk_1E3667740;
    v17 = v16;
    v22 = v17;
    v28 = v14;
    v23 = v10;
    v24 = self;
    v25 = v11;
    v29 = a4;
    v26 = v12;
    v27 = buf;
    objc_msgSend(v17, "performTransactionAndWait:", v21);
    v18 = v31[24] != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLBackendSharingGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Evaluation called on an empty array of assets.", buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (BOOL)evaluateFaceObjectIDs:(id)a3 withResultEnumerationBlock:(id)a4
{
  return -[PLLibraryScopeRuleManager evaluateFaceObjectIDs:simulate:withResultEnumerationBlock:](self, "evaluateFaceObjectIDs:simulate:withResultEnumerationBlock:", a3, 0, a4);
}

- (BOOL)evaluateFaceObjectIDs:(id)a3 simulate:(BOOL)a4 withResultEnumerationBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[PLLibraryScopeRuleManager _personUUIDsUsedInRules](self, "_personUUIDsUsedInRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1;
  if (objc_msgSend(v10, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__27772;
    v30 = __Block_byref_object_dispose__27773;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    -[PLLibraryScopeRuleManager libraryScope](self, "libraryScope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__PLLibraryScopeRuleManager_evaluateFaceObjectIDs_simulate_withResultEnumerationBlock___block_invoke;
    v16[3] = &unk_1E366F518;
    v14 = v13;
    v17 = v14;
    v18 = v8;
    v19 = v10;
    v20 = &v22;
    v21 = &v26;
    objc_msgSend(v14, "performBlockAndWait:", v16);
    if (objc_msgSend((id)v27[5], "count"))
      v11 = -[PLLibraryScopeRuleManager evaluateAssetObjectIDs:simulate:withResultEnumerationBlock:](self, "evaluateAssetObjectIDs:simulate:withResultEnumerationBlock:", v27[5], v6, v9);
    else
      v11 = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

  }
  return v11;
}

- (id)_personUUIDsUsedInRules
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PLLibraryScopeRuleManager ruleEvaluator](self, "ruleEvaluator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "personCondition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "personUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
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
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[2];
  uint8_t buf[4];
  id v48;
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  v40 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v10;
  +[PLManagedAsset predicateToIncludeSharedLibrarySharingSuggestionsAssets](PLManagedAsset, "predicateToIncludeSharedLibrarySharingSuggestionsAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v13;
  v14 = (void *)MEMORY[0x1E0CB3880];
  v41 = v5;
  objc_msgSend(v5, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("moment in %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v18);

  v19 = v8;
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", &unk_1E3763938);
  v45 = 0;
  objc_msgSend(v40, "executeFetchRequest:error:", v8, &v45);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v45;
  if (!v20)
  {
    PLBackendGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v21;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Failed to fetch assets to validate: %@", buf, 0xCu);
    }

    v36 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v20, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v34 = v41;
    goto LABEL_9;
  }
  v22 = (void *)MEMORY[0x1E0CB3528];
  -[PLLibraryScopeRuleManager _predicateToIncludeAssetsSuggestedByCamera](self, "_predicateToIncludeAssetsSuggestedByCamera");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v23;
  PLManagedAssetPredicateToFetchAssetsSuggestedForSharing();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "orPredicateWithSubpredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_pl_map:", &__block_literal_global_57);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithArray:", v29);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __122__PLLibraryScopeRuleManager__fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId_inManagedObjectContext___block_invoke_2;
  v42[3] = &unk_1E3667788;
  v43 = v30;
  v32 = v31;
  v44 = v32;
  v33 = v30;
  v34 = v41;
  objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v42);
  v35 = v44;
  v36 = v32;

LABEL_9:
  return v36;
}

- (id)_fetchAssetObjectIDsContainedInMomentObjectIDs:(id)a3 excludingAssetObjectIDs:(id)a4 inManagedObjectContext:(id)a5 predicateToFetchAssetsToEvaluate:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C97B48];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setResultType:", 1);
  v17 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND NOT self IN %@"), CFSTR("moment"), v14, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v18;
  v30[1] = v10;
  -[PLLibraryScopeRuleManager _predicateToIncludeAssetsCapturedByCamera](self, "_predicateToIncludeAssetsCapturedByCamera");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v21);

  v27 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v16, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v27;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v23;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Unable to fetch assetObjectIDs contained in momentObjectIDs: %@", buf, 0xCu);
    }

    v24 = 0;
  }

  return v24;
}

- (BOOL)_shouldTryToPropagateResultsToMomentWithInclusiveMatchedConditions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "type", (_QWORD)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_predicateToIncludeAssetsSuggestedByCamera
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND (%K & %i) != 0"), CFSTR("activeLibraryScopeParticipationState"), 1, CFSTR("libraryScopeShareState"), 12, 12);
}

- (id)_predicateToIncludeAssetsCapturedByCamera
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d OR %K = %d"), CFSTR("additionalAttributes.importedBy"), 1, CFSTR("additionalAttributes.importedBy"), 2);
}

- (PLLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_libraryScope, a3);
}

- (PLLibraryScopeRuleEvaluator)ruleEvaluator
{
  return self->_ruleEvaluator;
}

- (void)setRuleEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_ruleEvaluator, a3);
}

- (PLManagedAssetRuleInterpreter)interpreter
{
  return self->_interpreter;
}

- (void)setInterpreter:(id)a3
{
  objc_storeStrong((id *)&self->_interpreter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpreter, 0);
  objc_storeStrong((id *)&self->_ruleEvaluator, 0);
  objc_storeStrong((id *)&self->_libraryScope, 0);
}

void __122__PLLibraryScopeRuleManager__fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId_inManagedObjectContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

id __122__PLLibraryScopeRuleManager__fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "moment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __87__PLLibraryScopeRuleManager_evaluateFaceObjectIDs_simulate_withResultEnumerationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@ AND %K IN %@"), *(_QWORD *)(a1 + 40), CFSTR("personForFace.personUUID"), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v20 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = (void *)MEMORY[0x1E0C97B48];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setResultType:", 1);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("detectedFaces"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPredicate:", v12);

      v19 = v8;
      objc_msgSend(v2, "executeFetchRequest:error:", v11, &v19);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v19;

      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v13;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to fetch assetObjectIDs containing in faces: %@", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }

      v8 = v14;
    }
  }
  else
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unable to fetch assetObjectIDs containing in faces: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *context;
  void *contexta;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[4];
  id v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  NSObject *v108;
  id v109;
  _QWORD v110[4];
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  _QWORD v117[3];
  uint8_t buf[4];
  uint64_t v119;
  __int16 v120;
  void *v121;
  _BYTE v122[128];
  _QWORD v123[3];
  _BYTE v124[128];
  _QWORD v125[2];
  _QWORD v126[5];

  v126[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 80))
  {
    v2 = 0;
    while (1)
    {
      v90 = MEMORY[0x19AEC1554]();
      v3 = *(_QWORD *)(a1 + 80) - v2 >= 0x3E8 ? 1000 : *(_QWORD *)(a1 + 80) - v2;
      v84 = v3;
      objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", v2);
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)MEMORY[0x19AEC1554]();
      v5 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(*(id *)(a1 + 48), "_predicateToIncludeAssetsCapturedByCamera");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v6;
      v7 = (void *)MEMORY[0x1E0CB3528];
      v8 = *(void **)(a1 + 48);
      v125[0] = *(_QWORD *)(a1 + 56);
      objc_msgSend(v8, "_predicateToIncludeAssetsSuggestedByCamera");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "orPredicateWithSubpredicates:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v126[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "andPredicateWithSubpredicates:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)v4;
      v116 = 0;
      +[PLMoment batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:andAssetPredicate:inManagedObjectContext:error:](PLMoment, "batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:andAssetPredicate:inManagedObjectContext:error:", v4, v13, v94, &v116);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v116;
      v92 = v15;
      if (!v15)
        break;
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "_fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId:inManagedObjectContext:", v15, v94);
        v17 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject count](v17, "count"))
        {
          v86 = v13;
          if (*(_QWORD *)(a1 + 64))
          {
            v18 = v14;
            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            v19 = v17;
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v113;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v113 != v22)
                    objc_enumerationMutation(v19);
                  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
                }
                v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
              }
              while (v21);
            }

            v14 = v18;
            v15 = v92;
          }
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT self IN %@"), v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "filteredArrayUsingPredicate:", v24);
          v25 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v85, "unionSet:", v17);
          -[NSObject allObjects](v17, "allObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v110[0] = MEMORY[0x1E0C809B0];
          v110[1] = 3221225472;
          v110[2] = __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_26;
          v110[3] = &unk_1E36676D0;
          v111 = v15;
          objc_msgSend(v26, "_pl_map:", v110);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObjectsFromArray:", v27);

          objc_msgSend(v95, "unionSet:", v17);
          v14 = (void *)v25;
          v13 = v86;
        }
LABEL_21:

      }
      objc_autoreleasePoolPop(context);
      contexta = v14;
      v28 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v85, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeObjectsInArray:", v29);

      v30 = (void *)MEMORY[0x1E0C97B48];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fetchRequestWithEntityName:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x1E0CB3528];
      v87 = v28;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = v34;
      objc_msgSend(*(id *)(a1 + 48), "_predicateToIncludeAssetsCapturedByCamera");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(a1 + 56);
      v123[1] = v35;
      v123[2] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "andPredicateWithSubpredicates:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPredicate:", v38);

      v109 = v16;
      objc_msgSend(v94, "executeFetchRequest:error:", v32, &v109);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v109;

      if (objc_msgSend(v39, "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "ruleEvaluator");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_33;
        v100[3] = &unk_1E36676F8;
        v108 = *(id *)(a1 + 64);
        v43 = v85;
        v44 = *(_QWORD *)(a1 + 48);
        v101 = v43;
        v102 = v44;
        v103 = v92;
        v45 = v93;
        v104 = v93;
        v105 = v95;
        v106 = v83;
        v107 = v82;
        v46 = (id)objc_msgSend(v41, "evaluateObjects:withResultEnumerationBlock:", v42, v100);

        v47 = v108;
      }
      else
      {
        PLBackendSharingGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        v45 = v93;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v119 = v48;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "No assets available for this batch: %@", buf, 0xCu);
        }
      }
      v49 = (void *)v90;

      if (objc_msgSend(v45, "count"))
      {
        v91 = v32;
        v50 = v49;
        v51 = v40;
        objc_msgSend(*(id *)(a1 + 48), "_fetchAssetObjectIDsContainedInMomentObjectIDs:excludingAssetObjectIDs:inManagedObjectContext:predicateToFetchAssetsToEvaluate:", v45, v95, v94, *(_QWORD *)(a1 + 56));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (*(_QWORD *)(a1 + 64))
        {
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v96, v122, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v97;
            do
            {
              for (j = 0; j != v55; ++j)
              {
                if (*(_QWORD *)v97 != v56)
                  objc_enumerationMutation(v53);
                (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v96, v122, 16);
            }
            while (v55);
          }
        }
        objc_msgSend(v85, "unionSet:", v53);

        v45 = v93;
        v40 = v51;
        v49 = v50;
        v32 = v91;
      }
      PLBackendSharingGetLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 134218240;
        v119 = v84 + v2;
        v120 = 2048;
        v121 = v59;
        _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_INFO, "Evaluated %lu assets out of %lu\n", buf, 0x16u);
      }

      objc_autoreleasePoolPop(v49);
      v2 += 1000;
      if (v2 >= *(_QWORD *)(a1 + 80))
        goto LABEL_39;
    }
    PLBackendSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v119 = (uint64_t)v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch moments with error: %@", buf, 0xCu);
    }
    goto LABEL_21;
  }
LABEL_39:
  PLBackendSharingGetLog();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    v61 = objc_msgSend(v85, "count");
    *(_DWORD *)buf = 134217984;
    v119 = v61;
    _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_INFO, "\t%lu assets matched inclusive rule(s).\n", buf, 0xCu);
  }

  PLBackendSharingGetLog();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    v63 = objc_msgSend(v83, "count");
    *(_DWORD *)buf = 134217984;
    v119 = v63;
    _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_INFO, "\t%lu assets matched exclusive rule(s).\n", buf, 0xCu);
  }

  PLBackendSharingGetLog();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    v65 = objc_msgSend(v82, "count");
    *(_DWORD *)buf = 134217984;
    v119 = v65;
    _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_INFO, "\t%lu assets did not match any rule(s).\n", buf, 0xCu);
  }

  v66 = objc_msgSend(v85, "count");
  if (!*(_BYTE *)(a1 + 88))
  {
    v67 = v66;
    if (v66)
    {
      PLBackendSharingGetLog();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "libraryScope");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v119 = v67;
        v120 = 2112;
        v121 = v69;
        _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_INFO, "Contributing %lu assets to library scope %@.", buf, 0x16u);

      }
      v70 = (void *)MEMORY[0x1E0C97B48];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "fetchRequestWithEntityName:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v73 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v85);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *(void **)(a1 + 48);
      v76 = *(_QWORD *)(a1 + 56);
      v117[0] = v74;
      v117[1] = v76;
      objc_msgSend(v75, "_predicateToIncludeAssetsCapturedByCamera");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v117[2] = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "andPredicateWithSubpredicates:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setPredicate:", v79);

      objc_msgSend(v94, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v72, 0, &__block_literal_global_27797);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        PLBackendSharingGetLog();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v119 = (uint64_t)v80;
          _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_ERROR, "Failed to fetch moments with error: %@", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      }

    }
  }

}

uint64_t __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_26(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_33(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  PLBackendSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Asset %@ have been matched with %@.", (uint8_t *)&v17, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 88);
  if (v11)
  {
    objc_msgSend(v7, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, id))(v11 + 16))(v11, v12, a3, v8);

  }
  objc_msgSend(v7, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  switch((_DWORD)a3)
  {
    case 0:
      v15 = *(void **)(a1 + 80);
LABEL_13:
      objc_msgSend(v15, "addObject:", v13);
      break;
    case 2:
      v15 = *(void **)(a1 + 72);
      goto LABEL_13;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
      if (objc_msgSend(*(id *)(a1 + 40), "_shouldTryToPropagateResultsToMomentWithInclusiveMatchedConditions:", v8))
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);
        }
        else
        {
          PLBackendSharingGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = 138412290;
            v18 = v13;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Couldn't find moment for asset objectID: %@", (uint8_t *)&v17, 0xCu);
          }

        }
      }
      break;
  }

}

void __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;

  v4 = a2;
  if (!+[PLSceneClassification isUtilityAssetForSharedLibrary:](PLSceneClassification, "isUtilityAssetForSharedLibrary:"))
  {
    PLLibraryScopeAssetRemoveSuggestedByClientType(v4);
    v2 = v4;
    objc_msgSend(v2, "setLibraryScopeShareState:", objc_msgSend(v2, "libraryScopeShareState") & 0xFFFFFFFFFF7FFFFFLL);

    v3 = v2;
    objc_msgSend(v3, "setLibraryScopeShareState:", objc_msgSend(v3, "libraryScopeShareState") | 2);

  }
}

@end
