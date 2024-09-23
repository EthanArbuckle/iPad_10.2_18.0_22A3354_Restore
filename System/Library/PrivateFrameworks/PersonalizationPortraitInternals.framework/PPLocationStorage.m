@implementation PPLocationStorage

void __117__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v4, "rowIdsForRecordsSourcedFromBundleId:groupIds:txnWitness:", v3, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](a1[4], v7, v6, a1[7], a1[8]);

}

- (void)_deleteLocationsWithRowIds:(void *)a3 txnWitness:(uint64_t)a4 atLeastOneLocationRemoved:(uint64_t)a5 deletedCount:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v16 = a1;
  if (a1)
  {
    if (objc_msgSend(v7, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = objc_msgSend(&unk_1E7E5BDD0, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(&unk_1E7E5BDD0);
            v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
            objc_msgSend(v8, "db");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE loc_id IN _pas_nsindexset(:rowIds)"), v13);
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __98__PPLocationStorage__deleteLocationsWithRowIds_txnWitness_atLeastOneLocationRemoved_deletedCount___block_invoke;
            v19[3] = &unk_1E7E1F040;
            v20 = v7;
            objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", v15, v19, 0, 0);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(&unk_1E7E5BDD0, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }
    }
    objc_msgSend(*(id *)(v16 + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v7, v8, a4, a5);
  }

}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneLocationRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11;
  id v12;
  PPSQLDatabase *db;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL *v18;
  unint64_t *v19;

  v11 = a3;
  v12 = a4;
  if (objc_msgSend(v12, "count"))
  {
    db = self->_db;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __117__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
    v15[3] = &unk_1E7E1F270;
    v15[4] = self;
    v16 = v11;
    v17 = v12;
    v18 = a5;
    v19 = a6;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v15);

  }
  else
  {
    if (a5)
      *a5 = 0;
    if (a6)
      *a6 = 0;
  }

  return 1;
}

void __108__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_atLeastOneLocationRemoved_deletedCount_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = *(void **)(v3 + 32);
  v6 = a2;
  objc_msgSend(v5, "rowIdsForRecordsSourcedFromBundleId:txnWitness:", v4, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](v3, v7, v6, a1[6], a1[7]);

}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 atLeastOneLocationRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  PPSQLDatabase *db;
  id v11;
  _QWORD v13[5];
  id v14;
  BOOL *v15;
  unint64_t *v16;

  v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E7E1F248;
  v13[4] = self;
  v14 = v9;
  v15 = a4;
  v16 = a5;
  v11 = v9;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v13);

  return 1;
}

- (PPLocationStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  PPLocationStorage *v16;
  PPLocationStorage *v17;
  PPSourceStorage *v18;
  PPSourceStorage *sourceStorage;
  PPRecordStorageHelper *v20;
  PPRecordStorageHelper *storageHelper;
  void *v23;
  void *v24;
  objc_super v25;

  v9 = *(_QWORD *)&a4;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    if (!v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStorage.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

    if (!v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStorage.m"), 64, CFSTR("_DK sync not yet supported for this store"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)PPLocationStorage;
  v16 = -[PPLocationStorage init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_db, a3);
    objc_storeStrong((id *)&v17->_dkStorage, a5);
    v18 = -[PPSourceStorage initWithDatabase:]([PPSourceStorage alloc], "initWithDatabase:", v17->_db);
    sourceStorage = v17->_sourceStorage;
    v17->_sourceStorage = v18;

    v20 = -[PPRecordStorageHelper initWithName:table:clusterIdentifierColumn:maxRecords:duetStorage:duetStream:sourceStorage:]([PPRecordStorageHelper alloc], "initWithName:table:clusterIdentifierColumn:maxRecords:duetStorage:duetStream:sourceStorage:", CFSTR("Location"), CFSTR("loc_records"), CFSTR("lc_description"), v9, v17->_dkStorage, 0, v17->_sourceStorage);
    storageHelper = v17->_storageHelper;
    v17->_storageHelper = v20;

    objc_storeStrong((id *)&v17->_trialWrapper, a7);
  }

  return v17;
}

- (PPLocationStorage)initWithDatabase:(id)a3
{
  id v4;
  PPTrialWrapper *v5;
  void *v6;
  void *v7;
  PPTrialWrapper *v8;
  PPLocationStorage *v9;

  v4 = a3;
  v5 = [PPTrialWrapper alloc];
  v6 = (void *)objc_opt_new();
  +[PPTrialWrapper sharedTrialClient](PPTrialWrapper, "sharedTrialClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPTrialWrapper initWithSettings:database:trialClient:](v5, "initWithSettings:database:trialClient:", v6, v4, v7);

  v9 = -[PPLocationStorage initWithDatabase:maxRecords:dkStorage:loadEmptyDatabaseFromDK:trialWrapper:](self, "initWithDatabase:maxRecords:dkStorage:loadEmptyDatabaseFromDK:trialWrapper:", v4, 1000, 0, 0, v8);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PPDKStorage removeObserver:](self->_dkStorage, "removeObserver:", self->_deletionObserver);
  v3.receiver = self;
  v3.super_class = (Class)PPLocationStorage;
  -[PPLocationStorage dealloc](&v3, sel_dealloc);
}

- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  PPContactStorage *v25;
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
  const __CFString *v37;
  PPSQLDatabase *db;
  id v39;
  id v40;
  NSObject *v41;
  PPSQLDatabase *v42;
  uint64_t v44;
  _QWORD v45[6];
  _QWORD v46[4];
  id v47;
  id v48;
  PPLocationStorage *v49;
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD aBlock[4];
  id v74;
  uint8_t buf[4];
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "limit"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT * FROM sources AS src CROSS JOIN loc_records AS loc ON loc.source_id = src.id WHERE 1 "));
    v10 = (void *)objc_opt_new();
    objc_msgSend(v7, "fromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      if (objc_msgSend(v7, "filterByRelevanceDate"))
        v13 = CFSTR("AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) >= :fromDateEpoch ");
      else
        v13 = CFSTR("AND src.seconds_from_1970 >= :fromDateEpoch ");
      objc_msgSend(v9, "appendString:", v13);
      aBlock[0] = v12;
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke;
      aBlock[3] = &unk_1E7E1F040;
      v74 = v7;
      v14 = _Block_copy(aBlock);
      objc_msgSend(v10, "addObject:", v14);

    }
    objc_msgSend(v7, "toDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (objc_msgSend(v7, "filterByRelevanceDate"))
        v16 = CFSTR("AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) <= :toDateEpoch ");
      else
        v16 = CFSTR("AND src.seconds_from_1970 <= :toDateEpoch ");
      objc_msgSend(v9, "appendString:", v16);
      v71[0] = v12;
      v71[1] = 3221225472;
      v71[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2;
      v71[3] = &unk_1E7E1F040;
      v72 = v7;
      v17 = _Block_copy(v71);
      objc_msgSend(v10, "addObject:", v17);

    }
    if (objc_msgSend(v7, "deviceFilter"))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AND loc.is_remote = %u "), objc_msgSend(v7, "deviceFilter") == 2);
      objc_msgSend(v9, "appendString:", v18);

    }
    if (objc_msgSend(v7, "excludingWithoutSentiment"))
      objc_msgSend(v9, "appendString:", CFSTR("AND loc.sentiment_score != 0 "));
    objc_msgSend(v7, "matchingSourceBundleIds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v9, "appendString:", CFSTR("AND src.bundle_id IN _pas_nsset(:matchingSourceBundleIds) "));
      v69[0] = v12;
      v69[1] = 3221225472;
      v69[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3;
      v69[3] = &unk_1E7E1F040;
      v70 = v19;
      v20 = _Block_copy(v69);
      objc_msgSend(v10, "addObject:", v20);

    }
    objc_msgSend(v7, "excludingSourceBundleIds");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v9, "appendString:", CFSTR("AND src.bundle_id NOT IN _pas_nsset(:excludingSourceBundleIds) "));
      v67[0] = v12;
      v67[1] = 3221225472;
      v67[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_4;
      v67[3] = &unk_1E7E1F040;
      v68 = v21;
      v22 = _Block_copy(v67);
      objc_msgSend(v10, "addObject:", v22);

    }
    objc_msgSend(v7, "matchingContactHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length") == 0;

    if (!v24)
    {
      v25 = -[PPContactStorage initWithDatabase:foundInAppsHarvestStoreGetter:]([PPContactStorage alloc], "initWithDatabase:foundInAppsHarvestStoreGetter:", self->_db, &__block_literal_global_21604);
      objc_msgSend(v7, "matchingContactHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage sourcesForContactHandle:](v25, "sourcesForContactHandle:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[PPSourceStorage whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:](self->_sourceStorage, "whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:", v27, CFSTR("src"), v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendString:", v28);

    }
    objc_msgSend(v7, "matchingCategories");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
    {
      objc_msgSend(v9, "appendString:", CFSTR("AND loc.category IN _pas_nsset(:matchingCategories) "));
      v65[0] = v12;
      v65[1] = 3221225472;
      v65[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_6;
      v65[3] = &unk_1E7E1F040;
      v66 = v29;
      v30 = _Block_copy(v65);
      objc_msgSend(v10, "addObject:", v30);

    }
    objc_msgSend(v7, "matchingAlgorithms");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v9, "appendString:", CFSTR("AND loc.algorithm IN _pas_nsset(:matchingAlgorithms) "));
      v63[0] = v12;
      v63[1] = 3221225472;
      v63[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_7;
      v63[3] = &unk_1E7E1F040;
      v64 = v31;
      v32 = _Block_copy(v63);
      objc_msgSend(v10, "addObject:", v32);

    }
    objc_msgSend(v7, "excludingAlgorithms");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(v9, "appendString:", CFSTR("AND loc.algorithm NOT IN _pas_nsset(:excludingAlgorithms) "));
      v61[0] = v12;
      v61[1] = 3221225472;
      v61[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_8;
      v61[3] = &unk_1E7E1F040;
      v62 = v33;
      v34 = _Block_copy(v61);
      objc_msgSend(v10, "addObject:", v34);

    }
    objc_msgSend(v7, "fuzzyMatchingString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v9, "appendString:", CFSTR("AND loc.lc_description || loc.clp_locality || loc.clp_administrativeArea LIKE :fuzzyString "));
      v59[0] = v12;
      v59[1] = 3221225472;
      v59[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_9;
      v59[3] = &unk_1E7E1F040;
      v60 = v7;
      v36 = _Block_copy(v59);
      objc_msgSend(v10, "addObject:", v36);

    }
    if (objc_msgSend(v7, "orderByAscendingDate"))
      v37 = CFSTR("ORDER BY src.seconds_from_1970 ASC");
    else
      v37 = CFSTR("ORDER BY src.seconds_from_1970 DESC");
    objc_msgSend(v9, "appendString:", v37);
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__21499;
    v57 = __Block_byref_object_dispose__21500;
    v58 = 0;
    db = self->_db;
    v46[0] = v12;
    v46[1] = 3221225472;
    v46[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_115;
    v46[3] = &unk_1E7E1F0D0;
    v39 = v9;
    v47 = v39;
    v40 = v10;
    v48 = v40;
    v49 = self;
    v52 = &v53;
    v51 = v8;
    v50 = v7;
    -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 5, v46);
    if (v54[5])
    {
      pp_default_log_handle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        v44 = objc_msgSend((id)v54[5], "count");
        *(_DWORD *)buf = 134217984;
        v76 = v44;
        _os_log_fault_impl(&dword_1C392E000, v41, OS_LOG_TYPE_FAULT, "iterLocationRecordsWithQuery encountered %tu sources which did not validate; deleting associated location records now.",
          buf,
          0xCu);
      }

      v42 = self->_db;
      v45[0] = v12;
      v45[1] = 3221225472;
      v45[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_134;
      v45[3] = &unk_1E7E1F148;
      v45[4] = self;
      v45[5] = &v53;
      -[PPSQLDatabase writeTransactionWithClient:block:](v42, "writeTransactionWithClient:block:", 5, v45);
    }

    _Block_object_dispose(&v53, 8);
  }

  return 1;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return -[PPRecordStorageHelper clearWithDatabase:client:deletedCount:error:clearExternalTableReferences:](self->_storageHelper, "clearWithDatabase:client:deletedCount:error:clearExternalTableReferences:", self->_db, 5, a4, a3, &__block_literal_global_163);
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  BOOL v17;
  PPSQLDatabase *db;
  int v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  unsigned __int16 v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = 1;
  if (objc_msgSend(v14, "count"))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    db = self->_db;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __94__PPLocationStorage_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke;
    v23[3] = &unk_1E7E1F1D0;
    v27 = &v30;
    v23[4] = self;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    v28 = a6;
    v29 = a7;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v23);
    v19 = *((unsigned __int8 *)v31 + 24);
    if (a8 && !*((_BYTE *)v31 + 24))
    {
      v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = CFSTR("The donated data is invalid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *a8 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 9, v21);

      v19 = *((unsigned __int8 *)v31 + 24);
    }
    v17 = v19 != 0;

    _Block_object_dispose(&v30, 8);
  }

  return v17;
}

- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3
{
  return -[PPRecordStorageHelper decayedFeedbackCountsForItemString:database:client:](self->_storageHelper, "decayedFeedbackCountsForItemString:database:client:", a3, self->_db, 5);
}

- (BOOL)donateLocationFeedback:(id)a3
{
  return -[PPRecordStorageHelper storeFeedback:database:client:lowercaseItemStrings:limit:](self->_storageHelper, "storeFeedback:database:client:lowercaseItemStrings:limit:", a3, self->_db, 5, 1, 2500);
}

- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4
{
  int v7;

  do
    v7 = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  while (v7
       && !-[PPRecordStorageHelper decayFeedbackWithDatabase:client:decayRate:](self->_storageHelper, "decayFeedbackWithDatabase:client:decayRate:", self->_db, 5, a3));
  return v7;
}

- (BOOL)deleteAllLocationsOlderThanDate:(id)a3 atLeastOneLocationRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  PPSQLDatabase *db;
  id v11;
  _QWORD v13[5];
  id v14;
  BOOL *v15;
  unint64_t *v16;

  v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__PPLocationStorage_deleteAllLocationsOlderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E7E1F248;
  v13[4] = self;
  v14 = v9;
  v15 = a4;
  v16 = a5;
  v11 = v9;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v13);

  return 1;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneLocationRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11;
  id v12;
  PPSQLDatabase *db;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL *v20;
  unint64_t *v21;

  v11 = a3;
  v12 = a4;
  db = self->_db;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __120__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_documentIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v17[3] = &unk_1E7E1F270;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = a5;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v17);

  return 1;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneLocationRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  PPSQLDatabase *db;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  BOOL *v25;
  unint64_t *v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  db = self->_db;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __130__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v21[3] = &unk_1E7E1F298;
  v21[4] = self;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v25 = a6;
  v26 = a7;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v21);

  return 1;
}

- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4
{
  id v6;
  PPSQLDatabase *db;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21499;
  v19 = __Block_byref_object_dispose__21500;
  v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PPLocationStorage_sourceStats_withExcludedAlgorithms___block_invoke;
  v11[3] = &unk_1E7E1F2C0;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = a3;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)deleteAllLocationFeedbackCountRecordsOlderThanDate:(id)a3
{
  id v4;
  PPSQLDatabase *db;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PPLocationStorage_deleteAllLocationFeedbackCountRecordsOlderThanDate___block_invoke;
  v8[3] = &unk_1E7E1F2E8;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v8);
  LOBYTE(db) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

- (BOOL)pruneOrphanedLocationFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  PPSQLDatabase *db;
  char v7;
  _QWORD v9[10];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__PPLocationStorage_pruneOrphanedLocationFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke;
  v9[3] = &unk_1E7E1F310;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  v9[9] = a6;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 5, v9);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)tempViewForSourceIdsExcludedAlgorithms:(id)a3 txnWitness:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_pas_componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT source_id FROM loc_records WHERE algorithm NOT IN (%@)"), v9);

    +[PPSQLDatabase createTempViewContainingRowsFromQuery:descriptiveTableName:txnWitness:](PPSQLDatabase, "createTempViewContainingRowsFromQuery:descriptiveTableName:txnWitness:", v10, CFSTR("loc_sourceids"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)thirdPartyBundleIdsFromToday
{
  return -[PPRecordStorageHelper thirdPartyBundleIdsFromTodayInDatabase:client:](self->_storageHelper, "thirdPartyBundleIdsFromTodayInDatabase:client:", self->_db, 6);
}

- (id)lastDonationTimeForSourcesBeforeDate:(id)a3
{
  return -[PPRecordStorageHelper lastDonationTimeForSourcesInDatabase:client:before:](self->_storageHelper, "lastDonationTimeForSourcesInDatabase:client:before:", self->_db, 6, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_sourceStorage, 0);
  objc_storeStrong((id *)&self->_storageHelper, 0);
  objc_storeStrong(&self->_deletionObserver, 0);
  objc_storeStrong((id *)&self->_dkStorage, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

uint64_t __106__PPLocationStorage_pruneOrphanedLocationFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "pruneOrphanedFeedbackCountRecordsWithLimit:rowOffset:deletedCount:txnWitness:isComplete:", a1[6], a1[7], a1[8], a2, a1[9]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __72__PPLocationStorage_deleteAllLocationFeedbackCountRecordsOlderThanDate___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "deleteFeedbackCountRecordsOlderThanDate:txnWitness:", a1[5], a2);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __56__PPLocationStorage_sourceStats_withExcludedAlgorithms___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tempViewForSourceIdsExcludedAlgorithms:txnWitness:", *(_QWORD *)(a1 + 40), v8);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("loc_records");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sourceStats:forTableWithName:txnWitness:", *(_QWORD *)(a1 + 56), v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (v3)
    +[PPSQLDatabase dropViewWithName:txnWitness:](PPSQLDatabase, "dropViewWithName:txnWitness:", v3, v8);

}

void __130__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v4, "rowIdsForRecordsSourcedFromBundleId:exactMatchGroupId:olderThanDate:txnWitness:", v3, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](a1[4], v8, v7, a1[8], a1[9]);

}

uint64_t __98__PPLocationStorage__deleteLocationsWithRowIds_txnWitness_atLeastOneLocationRemoved_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSIndexSet:", ":rowIds", *(_QWORD *)(a1 + 32));
}

void __120__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_documentIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v4, "rowIdsForRecordsSourcedFromBundleId:documentIds:txnWitness:", v3, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](a1[4], v7, v6, a1[7], a1[8]);

}

void __98__PPLocationStorage_deleteAllLocationsOlderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = *(void **)(v3 + 32);
  v6 = a2;
  objc_msgSend(v5, "rowIdsForRecordsOlderThanDate:txnWitness:", v4, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](v3, v7, v6, a1[6], a1[7]);

}

void __94__PPLocationStorage_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  NSObject *obj;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  unsigned int v119;
  id v120;
  uint64_t v121;
  void *context;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t buf[8];
  uint64_t v131;
  void (*v132)(uint64_t);
  void *v133;
  uint64_t v134;
  id v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  void (*v139)(uint64_t, void *);
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;

  v3 = a1;
  v143 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v119 = *(unsigned __int16 *)(a1 + 72);
  v7 = *(unsigned __int8 *)(a1 + 74);
  v8 = *(id *)(a1 + 40);
  v9 = v5;
  v120 = v6;
  v10 = a2;
  if (v4)
  {
    v11 = objc_msgSend(v8, "count");
    v12 = v10;
    objc_msgSend(v12, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v131 = 3221225472;
    v132 = __83__PPLocationStorage__truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke;
    v133 = &unk_1E7E1F1F8;
    v134 = v4;
    v136 = v11;
    v14 = v12;
    v135 = v14;
    objc_msgSend(v13, "writeTransaction:", buf);

    v118 = v14;
    v117 = objc_msgSend(*(id *)(v4 + 40), "updateOrCreateRowForSource:addingRefCount:txnWitness:", v9, objc_msgSend(v8, "count"), v14);
    v15 = v117 != 0x7FFFFFFFFFFFFFFFLL;
    if (v117 == 0x7FFFFFFFFFFFFFFFLL)
    {
      pp_locations_log_handle();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, obj, OS_LOG_TYPE_ERROR, "Suppressing location donation due to source with bogus date.", buf, 2u);
      }
    }
    else
    {
      +[PPSettings sharedInstance](PPSettings, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "weightMultiplier");
      v18 = v17;

      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      obj = v8;
      v121 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
      if (v121)
      {
        v109 = v10;
        v110 = v9;
        v111 = v8;
        v112 = v3;
        v19 = &unk_1E7E5A800;
        v115 = *(_QWORD *)v127;
        v116 = v4;
        if (!v7)
          v19 = &unk_1E7E5A7D0;
        v114 = v19;
        v20 = 0x1E0CB3000uLL;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v127 != v115)
              objc_enumerationMutation(obj);
            v123 = v21;
            v22 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v21);
            context = (void *)MEMORY[0x1C3BD6630]();
            v23 = (void *)objc_opt_new();
            v137 = 0;
            v138 = 0;
            v125 = v23;
            objc_msgSend(v23, "getUUIDBytes:", &v137);
            v124 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v137, 16);
            v24 = (void *)objc_opt_new();
            objc_msgSend(v22, "location");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "placemark");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "location");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("clp_location"));

            objc_msgSend(v22, "location");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "placemark");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "location");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v31 = *(void **)(v20 + 2024);
              objc_msgSend(v22, "location");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "placemark");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "location");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "coordinate");
              objc_msgSend(v31, "numberWithDouble:");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, CFSTR("cll_latitude_degrees"));

            }
            else
            {
              objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, CFSTR("cll_latitude_degrees"));
            }

            objc_msgSend(v22, "location");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "placemark");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "location");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              v39 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v22, "location");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "placemark");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "location");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "coordinate");
              objc_msgSend(v39, "numberWithDouble:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v44, CFSTR("cll_longitude_degrees"));

              v20 = 0x1E0CB3000;
            }
            else
            {
              objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, CFSTR("cll_longitude_degrees"));
              v20 = 0x1E0CB3000uLL;
            }

            objc_msgSend(v22, "location");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "placemark");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "name");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v47, CFSTR("clp_name"));

            objc_msgSend(v22, "location");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "placemark");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "thoroughfare");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v50, CFSTR("clp_thoroughfare"));

            objc_msgSend(v22, "location");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "placemark");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "subThoroughfare");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v53, CFSTR("clp_subThoroughfare"));

            objc_msgSend(v22, "location");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "placemark");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "locality");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v56, CFSTR("clp_locality"));

            objc_msgSend(v22, "location");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "placemark");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "subLocality");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v59, CFSTR("clp_subLocality"));

            objc_msgSend(v22, "location");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "placemark");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "administrativeArea");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v62, CFSTR("clp_administrativeArea"));

            objc_msgSend(v22, "location");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "placemark");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "subAdministrativeArea");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v65, CFSTR("clp_subAdministrativeArea"));

            objc_msgSend(v22, "location");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "placemark");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "postalCode");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v68, CFSTR("clp_postalCode"));

            objc_msgSend(v22, "location");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "placemark");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "ISOcountryCode");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v71, CFSTR("clp_ISOcountryCode"));

            objc_msgSend(v22, "location");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "placemark");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "country");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v74, CFSTR("clp_country"));

            objc_msgSend(v22, "location");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "placemark");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "inlandWater");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v77, CFSTR("clp_inlandWater"));

            objc_msgSend(v22, "location");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "placemark");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "ocean");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v80, CFSTR("clp_ocean"));

            v81 = (void *)v124;
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v124, CFSTR("uuid"));
            v82 = *(void **)(v20 + 2024);
            objc_msgSend(v22, "location");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "numberWithUnsignedShort:", objc_msgSend(v83, "category"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v84, CFSTR("category"));

            objc_msgSend(*(id *)(v20 + 2024), "numberWithUnsignedShort:", v119);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v85, CFSTR("algorithm"));

            v86 = *(void **)(v20 + 2024);
            objc_msgSend(v22, "score");
            objc_msgSend(v86, "numberWithDouble:", v18 * v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v88, CFSTR("initial_score"));

            v89 = *(void **)(v20 + 2024);
            objc_msgSend(v22, "sentimentScore");
            objc_msgSend(v89, "numberWithDouble:");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v90, CFSTR("sentiment_score"));

            objc_msgSend(MEMORY[0x1E0D70D00], "osBuild");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v91, CFSTR("extraction_os_build"));

            objc_msgSend(*(id *)(v20 + 2024), "numberWithUnsignedInt:", objc_msgSend(*(id *)(v116 + 48), "treatmentsHash"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v92, CFSTR("extraction_asset_version"));

            objc_msgSend(*(id *)(v20 + 2024), "numberWithLongLong:", v117);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v93, CFSTR("source_id"));

            objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1E7E5A7D0, CFSTR("is_remote"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1E7E5A7E8, CFSTR("decay_rate"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v114, CFSTR("is_sync_eligible"));
            objc_msgSend(v22, "location");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "clusterIdentifier");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            if (v95)
            {
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v95, CFSTR("lc_description"));
            }
            else
            {
              objc_msgSend(v125, "UUIDString");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "lowercaseString");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v97, CFSTR("lc_description"));

              v81 = (void *)v124;
            }

            objc_msgSend(v118, "db");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "insertIntoTable:dictionary:", CFSTR("loc_records"), v24);

            objc_msgSend(v118, "db");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "lastInsertRowId");

            v101 = v120;
            v102 = v118;
            if (objc_msgSend(v101, "count"))
            {
              objc_msgSend(v102, "db");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v137 = MEMORY[0x1E0C809B0];
              v138 = 3221225472;
              v139 = __84__PPLocationStorage__insertContextualNamedEntities_forLocationWithRowId_txnWitness___block_invoke;
              v140 = &unk_1E7E1F220;
              v142 = v100;
              v141 = v101;
              objc_msgSend(v103, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO loc_records_contextual_ne (loc_id, name) SELECT :locId, value FROM _pas_nsset(:contextualNamedEntities)"), &v137, 0, 0);

            }
            objc_msgSend(v22, "location");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "placemark");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "areasOfInterest");
            v106 = (id)objc_claimAutoreleasedReturnValue();
            v107 = v102;
            if (objc_msgSend(v106, "count"))
            {
              objc_msgSend(v107, "db");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v137 = MEMORY[0x1E0C809B0];
              v138 = 3221225472;
              v139 = __76__PPLocationStorage__insertAreasOfInterest_forLocationWithRowId_txnWitness___block_invoke;
              v140 = &unk_1E7E1F220;
              v142 = v100;
              v141 = v106;
              objc_msgSend(v108, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO loc_records_clp_areasOfInterest (loc_id, name) SELECT :locId, value FROM _pas_nsarray(:areasOfInterest)"), &v137, 0, 0);

            }
            objc_autoreleasePoolPop(context);
            v21 = v123 + 1;
          }
          while (v121 != v123 + 1);
          v121 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
        }
        while (v121);
        v8 = v111;
        v3 = v112;
        v10 = v109;
        v9 = v110;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24) = v15;
}

void __76__PPLocationStorage__insertAreasOfInterest_forLocationWithRowId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":locId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":areasOfInterest", *(_QWORD *)(a1 + 32));

}

void __84__PPLocationStorage__insertContextualNamedEntities_forLocationWithRowId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":locId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSSet:", ":contextualNamedEntities", *(_QWORD *)(a1 + 32));

}

void __83__PPLocationStorage__truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "rowIdsForRecordsToDropMakingRoomForCount:txnWitness:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](*(_QWORD *)(a1 + 32), v2, *(void **)(a1 + 40), 0, 0);

}

void __49__PPLocationStorage_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM loc_records_contextual_ne"), 0, 0, 0);

  objc_msgSend(v2, "db");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM loc_records_clp_areasOfInterest"), 0, 0, 0);
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "fromDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":fromDateEpoch");

}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "toDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":toDateEpoch");

}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingSourceBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":excludingSourceBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingCategories", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingAlgorithms", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":excludingAlgorithms", *(_QWORD *)(a1 + 32));
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_9(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "fuzzyMatchingString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%%%@%%"), v7);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":fuzzyString", v6);

}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];

  v3 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_116;
  v15[3] = &unk_1E7E1F040;
  v6 = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_117;
  v10[3] = &unk_1E7E1F0A8;
  v10[4] = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v11 = v7;
  v9 = *(_OWORD *)(a1 + 64);
  v8 = (id)v9;
  v13 = v9;
  v14 = v17;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v6, v15, v10, 0);

  _Block_object_dispose(v17, 8);
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_138;
  v9[3] = &unk_1E7E1F0F8;
  v9[4] = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_140;
  v7[3] = &unk_1E7E1F120;
  v6 = v4;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM loc_records WHERE source_id IN _pas_nsset(:sourceIds)"), v9, v7, 0);

  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](*(_QWORD *)(a1 + 32), v6, v3, 0, 0);
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_138(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":sourceIds", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_140(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", "loc_records"));
  return *MEMORY[0x1E0D81780];
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_116(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_117(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  unsigned __int16 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  BOOL v57;
  unsigned __int8 *v58;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, void *);
  void *v75;
  id v76;
  __int128 buf;
  uint64_t (*v78)(uint64_t, void *);
  void *v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v61 = a1;
  v7 = v3;
  v8 = v7;
  if (!v6)
  {

LABEL_55:
    v29 = 0;
    v44 = *MEMORY[0x1E0D81780];
    goto LABEL_56;
  }
  v9 = v5;
  objc_msgSend(v8, "getNSDataForColumnName:table:", "clp_location", "loc_records");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v4;
  v60 = v6;
  if (v10)
  {
    v71 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v71);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v71;
    if (!v11)
    {
      pp_locations_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "Unable to decode CLLocation from field clp_location: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v65 = (void *)v11;
  }
  else
  {
    v65 = 0;
  }

  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_name", "loc_records");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_thoroughfare", "loc_records");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_subThoroughfare", "loc_records");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_locality", "loc_records");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_subLocality", "loc_records");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_administrativeArea", "loc_records");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_subAdministrativeArea", "loc_records");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_postalCode", "loc_records");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_ISOcountryCode", "loc_records");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_country", "loc_records");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_inlandWater", "loc_records");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSStringForColumnName:table:", "clp_ocean", "loc_records");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v8, "getInt64ForColumnName:table:", "id", "loc_records");
  v20 = v9;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v20, "db");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v78 = __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke;
  v79 = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v80 = v19;
  v23 = v15;
  v72 = MEMORY[0x1E0C809B0];
  v73 = 3221225472;
  v74 = __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke_2;
  v75 = &unk_1E7E1F120;
  v76 = v21;
  v24 = v21;
  objc_msgSend(v22, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM loc_records_clp_areasOfInterest WHERE loc_id = :locId"), &buf, &v72, 0);

  if (!v65
    && !objc_msgSend(v63, "length")
    && !objc_msgSend(v70, "length")
    && !objc_msgSend(v69, "length")
    && !objc_msgSend(v68, "length")
    && !objc_msgSend(v62, "length")
    && !objc_msgSend(v14, "length")
    && !objc_msgSend(v15, "length")
    && !objc_msgSend(v67, "length")
    && !objc_msgSend(v66, "length")
    && !objc_msgSend(v16, "length")
    && !objc_msgSend(v17, "length")
    && !objc_msgSend(v18, "length")
    || (objc_msgSend(MEMORY[0x1E0D70B98], "placemarkWithLocation:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", v65, v63, v70, v69, v68, v62, v14, v15, v67, v66, v16, v17, v18, 0), (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(*(id *)(v60 + 32), "uuidForStatement:columnName:tableName:", v8, "uuid", "loc_records");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    pp_locations_log_handle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, "loc_records row %@ has empty placemark.", (uint8_t *)&buf, 0xCu);
    }

    v25 = 0;
    v23 = v15;
  }

  v4 = v64;
  if (!v25)
    goto LABEL_55;
  v28 = objc_msgSend(v8, "getInt64ForColumnName:table:", "category", "loc_records");
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v25, v28, 0);

  if (!v29)
    goto LABEL_55;
  objc_msgSend(*(id *)(*(_QWORD *)(v61 + 32) + 40), "createSourceWithStatement:txnWitness:", v8, *(_QWORD *)(v61 + 40));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(v61 + 32) + 32), "uuidForStatement:columnName:tableName:", v8, "uuid", "loc_records");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setUuid:", v32);

    objc_msgSend(v31, "setLocation:", v29);
    objc_msgSend(v31, "setSource:", v30);
    objc_msgSend(v31, "setAlgorithm:", (unsigned __int16)objc_msgSend(v8, "getInt64ForColumnName:table:", "algorithm", "loc_records"));
    objc_msgSend(v8, "getDoubleForColumnName:table:", "initial_score", "loc_records");
    objc_msgSend(v31, "setInitialScore:");
    objc_msgSend(v31, "initialScore");
    objc_msgSend(v31, "initialScore");
    if (fabs(v33) == INFINITY)
      objc_msgSend(v31, "setInitialScore:", 0.0);
    objc_msgSend(v8, "getDoubleForColumnName:table:", "decay_rate", "loc_records");
    objc_msgSend(v31, "setDecayRate:");
    objc_msgSend(v31, "decayRate");
    objc_msgSend(v31, "decayRate");
    if (fabs(v34) == INFINITY)
      objc_msgSend(v31, "setDecayRate:", *MEMORY[0x1E0D70F28]);
    objc_msgSend(v8, "getDoubleForColumnName:table:", "sentiment_score", "loc_records");
    objc_msgSend(v31, "setSentimentScore:");
    objc_msgSend(v31, "sentimentScore");
    objc_msgSend(v31, "sentimentScore");
    if (fabs(v35) == INFINITY)
      objc_msgSend(v31, "setSentimentScore:", 0.0);
    objc_msgSend(v8, "getNSStringForColumnName:table:", "extraction_os_build", "loc_records");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setExtractionOsBuild:", v36);

    if ((objc_msgSend(v8, "isNullForColumnName:table:", "extraction_asset_version", "loc_records") & 1) != 0)
      v37 = 0xFFFFFFFFLL;
    else
      v37 = objc_msgSend(v8, "getInt64ForColumnName:table:", "extraction_asset_version", "loc_records");
    objc_msgSend(v31, "setExtractionAssetVersion:", v37);
    v45 = objc_msgSend(v8, "getInt64ForColumnName:table:", "id", "loc_records");
    if (*(_QWORD *)(v61 + 32))
    {
      v46 = v45;
      v47 = *(id *)(v61 + 40);
      v48 = (void *)objc_opt_new();
      objc_msgSend(v47, "db");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v78 = __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke;
      v79 = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v80 = v46;
      v72 = MEMORY[0x1E0C809B0];
      v73 = 3221225472;
      v74 = __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke_2;
      v75 = &unk_1E7E1F120;
      v76 = v48;
      v50 = v48;
      objc_msgSend(v49, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM loc_records_contextual_ne WHERE loc_id = :locId"), &buf, &v72, 0);

      if (objc_msgSend(v50, "count"))
        v51 = v50;
      else
        v51 = 0;
      v52 = v51;

    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v31, "setContextualNamedEntities:", v52);

    LOBYTE(buf) = 0;
    v53 = *(_QWORD *)(v61 + 56);
    v54 = (void *)objc_msgSend(v31, "copy");
    (*(void (**)(uint64_t, void *, __int128 *))(v53 + 16))(v53, v54, &buf);

    v55 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v61 + 72) + 8) + 24);
    v56 = objc_msgSend(*(id *)(v61 + 48), "limit");
    if ((_BYTE)buf)
      v57 = 1;
    else
      v57 = v55 >= v56;
    v58 = (unsigned __int8 *)MEMORY[0x1E0D81780];
    if (v57)
      v58 = (unsigned __int8 *)MEMORY[0x1E0D81788];
    v44 = *v58;

  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v61 + 64) + 8) + 40))
    {
      v38 = objc_opt_new();
      v39 = *(_QWORD *)(*(_QWORD *)(v61 + 64) + 8);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v38;

    }
    v41 = objc_msgSend(v8, "getInt64ForColumnName:table:", "id", "sources");
    v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(v61 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v43);

    v44 = *MEMORY[0x1E0D81780];
  }

LABEL_56:
  objc_autoreleasePoolPop(v4);

  return v44;
}

uint64_t __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":locId", *(_QWORD *)(a1 + 32));
}

uint64_t __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "nonnullNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":locId", *(_QWORD *)(a1 + 32));
}

uint64_t __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "nonnullNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_5()
{
  return objc_msgSend(MEMORY[0x1E0D19E98], "defaultHarvestStore");
}

@end
