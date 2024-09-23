@implementation PPNamedEntityStorage

void __127__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[6];
  v6 = a1[9];
  v7 = a1[10];
  v8 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:groupIds:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, a2, v6, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneNamedEntityRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  id v13;
  PPSQLDatabase *db;
  id v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL *v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v12 = a3;
  v13 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2706;
  v31 = __Block_byref_object_dispose__2707;
  v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __127__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v20[3] = &unk_1E7E1D9F0;
  v23 = &v33;
  v20[4] = self;
  v15 = v12;
  v21 = v15;
  v16 = v13;
  v25 = a5;
  v26 = a6;
  v22 = v16;
  v24 = &v27;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v20);
  if (a7)
  {
    v17 = (void *)v28[5];
    if (v17)
      *a7 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

void __118__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[8];
  v6 = a1[9];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, a2, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  PPSQLDatabase *db;
  id v12;
  void *v13;
  char v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  BOOL *v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2706;
  v26 = __Block_byref_object_dispose__2707;
  v27 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __118__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v16[3] = &unk_1E7E1D9A0;
  v18 = &v28;
  v16[4] = self;
  v12 = v10;
  v20 = a4;
  v21 = a5;
  v17 = v12;
  v19 = &v22;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v16);
  if (a6)
  {
    v13 = (void *)v23[5];
    if (v13)
      *a6 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (PPNamedEntityStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v14;
  id v15;
  PPNamedEntityStorage *v16;
  PPNamedEntityStorage *v17;
  PPSourceStorage *v18;
  PPSourceStorage *sourceStorage;
  PPRecordStorageHelper *v20;
  void *v21;
  PPDKStorage *dkStorage;
  void *v23;
  uint64_t v24;
  PPRecordStorageHelper *storageHelper;
  uint64_t v26;
  OS_dispatch_queue *populateDatabaseQueue;
  PPDKStorage *v28;
  NSObject *v29;
  PPDKStorage *v30;
  uint64_t v31;
  id deletionObserver;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  objc_super v38;
  id block[6];

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v14 = a3;
  v35 = a5;
  v15 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntityStorage.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v38.receiver = self;
  v38.super_class = (Class)PPNamedEntityStorage;
  v16 = -[PPNamedEntityStorage init](&v38, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_db, a3);
    objc_storeStrong((id *)&v17->_dkStorage, a5);
    v18 = -[PPSourceStorage initWithDatabase:]([PPSourceStorage alloc], "initWithDatabase:", v17->_db);
    sourceStorage = v17->_sourceStorage;
    v17->_sourceStorage = v18;

    v20 = [PPRecordStorageHelper alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ne_records");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    dkStorage = v17->_dkStorage;
    -[PPDKStorage entityStream](dkStorage, "entityStream");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PPRecordStorageHelper initWithName:table:clusterIdentifierColumn:maxRecords:duetStorage:duetStream:sourceStorage:](v20, "initWithName:table:clusterIdentifierColumn:maxRecords:duetStorage:duetStream:sourceStorage:", CFSTR("NamedEntity"), v21, CFSTR("lc_name"), v10, dkStorage, v23, v17->_sourceStorage);
    storageHelper = v17->_storageHelper;
    v17->_storageHelper = (PPRecordStorageHelper *)v24;

    objc_storeStrong((id *)&v17->_trialWrapper, a7);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.PersonalizationPortrait.NamedEntity.PopulateDatabaseQueue", 9);
    v26 = objc_claimAutoreleasedReturnValue();
    populateDatabaseQueue = v17->_populateDatabaseQueue;
    v17->_populateDatabaseQueue = (OS_dispatch_queue *)v26;

    v28 = v17->_dkStorage;
    if (v8 && v28)
    {
      v29 = v17->_populateDatabaseQueue;
      block[0] = (id)MEMORY[0x1E0C809B0];
      block[1] = (id)3221225472;
      block[2] = __69__PPNamedEntityStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke;
      block[3] = &unk_1E7E1DAD0;
      block[4] = v17;
      block[5] = sel__asyncPopulateDatabaseFromDKEventsIfNecessary;
      dispatch_async(v29, block);
      v28 = v17->_dkStorage;
    }
    if (v28)
    {
      block[0] = 0;
      objc_initWeak(block, v17);
      v30 = v17->_dkStorage;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __99__PPNamedEntityStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke;
      v36[3] = &unk_1E7E1D758;
      objc_copyWeak(&v37, block);
      -[PPDKStorage registerForNamedEntitiesRemoteDeletionWithBlock:](v30, "registerForNamedEntitiesRemoteDeletionWithBlock:", v36);
      v31 = objc_claimAutoreleasedReturnValue();
      deletionObserver = v17->_deletionObserver;
      v17->_deletionObserver = (id)v31;

      objc_destroyWeak(&v37);
      objc_destroyWeak(block);
    }
    -[PPNamedEntityStorage _asyncProcessNewDKEventDeletions]((uint64_t)v17);
  }

  return v17;
}

- (PPNamedEntityStorage)initWithDatabase:(id)a3
{
  id v4;
  PPTrialWrapper *v5;
  void *v6;
  void *v7;
  PPTrialWrapper *v8;
  void *v9;
  PPNamedEntityStorage *v10;

  v4 = a3;
  v5 = [PPTrialWrapper alloc];
  v6 = (void *)objc_opt_new();
  +[PPTrialWrapper sharedTrialClient](PPTrialWrapper, "sharedTrialClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPTrialWrapper initWithSettings:database:trialClient:](v5, "initWithSettings:database:trialClient:", v6, v4, v7);

  +[PPDKStorage sharedInstance](PPDKStorage, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPNamedEntityStorage initWithDatabase:maxRecords:dkStorage:loadEmptyDatabaseFromDK:trialWrapper:](self, "initWithDatabase:maxRecords:dkStorage:loadEmptyDatabaseFromDK:trialWrapper:", v4, 15000, v9, 1, v8);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PPDKStorage removeObserver:](self->_dkStorage, "removeObserver:", self->_deletionObserver);
  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityStorage;
  -[PPNamedEntityStorage dealloc](&v3, sel_dealloc);
}

- (BOOL)iterNamedEntityRecordsAndIdsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  int v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  PPContactStorage *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  PPTrialWrapper *trialWrapper;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  PPSQLDatabase *db;
  id v84;
  NSObject *v85;
  PPSQLDatabase *v86;
  NSObject *v87;
  BOOL v88;
  uint64_t v90;
  const __CFString *v91;
  uint64_t v92;
  void *v93;
  id v94;
  _QWORD v96[6];
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  PPNamedEntityStorage *v101;
  id v102;
  id v103;
  _QWORD *v104;
  uint64_t *v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _QWORD v113[4];
  _QWORD v114[5];
  uint8_t v115[8];
  uint8_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD aBlock[4];
  id v140;
  uint8_t buf[4];
  uint64_t v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v94 = a5;
  v7 = MEMORY[0x1C3BD6630]();
  v92 = objc_msgSend(v6, "limit");
  v93 = (void *)v7;
  if (!v92)
  {
    v9 = 1;
    goto LABEL_59;
  }
  if ((objc_msgSend(v6, "orderByName") & 1) != 0 || (objc_msgSend(v6, "removeNearDuplicates") & 1) != 0)
  {
    v8 = CFSTR("INNER JOIN");
    v91 = CFSTR("ORDER BY lc_name ASC, src.seconds_from_1970 DESC");
  }
  else
  {
    v10 = objc_msgSend(v6, "orderByAscendingDate");
    v11 = CFSTR("ORDER BY src.seconds_from_1970 DESC");
    if (v10)
      v11 = CFSTR("ORDER BY src.seconds_from_1970 ASC");
    v91 = v11;
    v8 = CFSTR("CROSS JOIN");
  }
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT ne.id, src.id FROM sources AS src %@ ne_records AS ne ON ne.source_id = src.id WHERE 1 "), v8);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v6, "fromDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1C3BD6630]();
    if (objc_msgSend(v6, "filterByRelevanceDate"))
      v16 = CFSTR("AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) >= :fromDateEpoch ");
    else
      v16 = CFSTR("AND src.seconds_from_1970 >= :fromDateEpoch ");
    objc_msgSend(v12, "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke;
    aBlock[3] = &unk_1E7E1F040;
    v140 = v6;
    v18 = _Block_copy(aBlock);
    objc_msgSend(v13, "addObject:", v18);

    objc_autoreleasePoolPop(v15);
    v12 = (id)v17;
  }
  objc_msgSend(v6, "toDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1C3BD6630]();
    if (objc_msgSend(v6, "filterByRelevanceDate"))
      v21 = CFSTR("AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) <= :toDateEpoch ");
    else
      v21 = CFSTR("AND src.seconds_from_1970 <= :toDateEpoch ");
    objc_msgSend(v12, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v137[0] = MEMORY[0x1E0C809B0];
    v137[1] = 3221225472;
    v137[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2;
    v137[3] = &unk_1E7E1F040;
    v138 = v6;
    v23 = _Block_copy(v137);
    objc_msgSend(v13, "addObject:", v23);

    objc_autoreleasePoolPop(v20);
    v12 = (id)v22;
  }
  if (objc_msgSend(v6, "deviceFilter"))
  {
    v24 = (void *)MEMORY[0x1C3BD6630]();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AND ne.is_remote = %u "), objc_msgSend(v6, "deviceFilter") == 2);
    objc_msgSend(v12, "stringByAppendingString:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v24);
    v12 = (id)v26;
  }
  if (objc_msgSend(v6, "excludeWithoutSentiment"))
  {
    v27 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND ne.sentiment_score != 0 "));
    v28 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v27);
    v12 = (id)v28;
  }
  v29 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingSourceBundleIds");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND src.bundle_id IN _pas_nsset(:matchingSourceBundleIds) "));
    v31 = objc_claimAutoreleasedReturnValue();

    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3;
    v135[3] = &unk_1E7E1F040;
    v136 = v30;
    v32 = _Block_copy(v135);
    objc_msgSend(v13, "addObject:", v32);

    v12 = (id)v31;
  }

  objc_autoreleasePoolPop(v29);
  v33 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "excludingSourceBundleIds");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND src.bundle_id NOT IN _pas_nsset(:excludingSourceBundleIds) "));
    v35 = objc_claimAutoreleasedReturnValue();

    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4;
    v133[3] = &unk_1E7E1F040;
    v134 = v34;
    v36 = _Block_copy(v133);
    objc_msgSend(v13, "addObject:", v36);

    v12 = (id)v35;
  }

  objc_autoreleasePoolPop(v33);
  v37 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingContactHandle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "length") == 0;

  if (!v39)
  {
    v40 = -[PPContactStorage initWithDatabase:foundInAppsHarvestStoreGetter:]([PPContactStorage alloc], "initWithDatabase:foundInAppsHarvestStoreGetter:", self->_db, &__block_literal_global_2775);
    objc_msgSend(v6, "matchingContactHandle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPContactStorage sourcesForContactHandle:](v40, "sourcesForContactHandle:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPSourceStorage whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:](self->_sourceStorage, "whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:", v42, CFSTR("src"), v13);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", v43);
    v44 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v44;
  }
  objc_autoreleasePoolPop(v37);
  v45 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingSourceGroupIds");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "count"))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND src.group_id IN _pas_nsset(:matchingGroupIds) "));
    v47 = objc_claimAutoreleasedReturnValue();

    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_6;
    v131[3] = &unk_1E7E1F040;
    v132 = v46;
    v48 = _Block_copy(v131);
    objc_msgSend(v13, "addObject:", v48);

    v12 = (id)v47;
  }

  objc_autoreleasePoolPop(v45);
  v49 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingCategories");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "count"))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND ne.category IN _pas_nsset(:matchingCategories) "));
    v51 = objc_claimAutoreleasedReturnValue();

    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_7;
    v129[3] = &unk_1E7E1F040;
    v130 = v50;
    v52 = _Block_copy(v129);
    objc_msgSend(v13, "addObject:", v52);

    v12 = (id)v51;
  }

  objc_autoreleasePoolPop(v49);
  v53 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "excludingAlgorithms");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "count"))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND ne.algorithm NOT IN _pas_nsset(:excludingAlgorithms) "));
    v55 = objc_claimAutoreleasedReturnValue();

    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_8;
    v127[3] = &unk_1E7E1F040;
    v128 = v54;
    v56 = _Block_copy(v127);
    objc_msgSend(v13, "addObject:", v56);

    v12 = (id)v55;
  }

  objc_autoreleasePoolPop(v53);
  v57 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingSourceDocumentIds");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "count"))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND src.doc_id IN _pas_nsset(:matchingSourceDocumentIds) "));
    v59 = objc_claimAutoreleasedReturnValue();

    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_9;
    v125[3] = &unk_1E7E1F040;
    v126 = v58;
    v60 = _Block_copy(v125);
    objc_msgSend(v13, "addObject:", v60);

    v12 = (id)v59;
  }

  objc_autoreleasePoolPop(v57);
  v61 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingNames");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchingName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v62, "count") || v63)
  {
    objc_msgSend(v62, "_pas_mappedSetWithTransform:", &__block_literal_global_125);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v64;
    if (v63)
    {
      objc_msgSend(MEMORY[0x1E0D70BC0], "clusterIdentifierFromName:", v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v65, "count") && !objc_msgSend(v65, "containsObject:", v66))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v67 = (void *)MEMORY[0x1C3BD6630]();
        v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v66, 0);
        objc_autoreleasePoolPop(v67);
      }

    }
    else
    {
      v68 = (void *)v64;
    }
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND ne.lc_name IN _pas_nsset(:lowercaseMatchingNames) "));
    v69 = objc_claimAutoreleasedReturnValue();

    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_11;
    v123[3] = &unk_1E7E1F040;
    v124 = v68;
    v70 = v68;
    v71 = _Block_copy(v123);
    objc_msgSend(v13, "addObject:", v71);

    v12 = (id)v69;
  }

  objc_autoreleasePoolPop(v61);
  v72 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "matchingEntityTrie");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    trialWrapper = self->_trialWrapper;
    objc_msgSend(v6, "matchingEntityTrie");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPTrialWrapper trieForFactorName:namespaceName:](trialWrapper, "trieForFactorName:namespaceName:", v75, CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v76)
    {
      pp_default_log_handle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v115 = 0;
        _os_log_fault_impl(&dword_1C392E000, v87, OS_LOG_TYPE_FAULT, "Failed to load entity trie, stops this query.", v115, 2u);
      }

      objc_autoreleasePoolPop(v72);
      v9 = 1;
      goto LABEL_58;
    }
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("AND _pas_block(:matchingEntityTrieBlock, ne.name) "));
    v77 = objc_claimAutoreleasedReturnValue();

    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_135;
    v121[3] = &unk_1E7E1F040;
    v122 = v76;
    v78 = v76;
    v79 = _Block_copy(v121);
    objc_msgSend(v13, "addObject:", v79);

    v12 = (id)v77;
  }
  objc_autoreleasePoolPop(v72);
  v80 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v12, "stringByAppendingString:", v91);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v80);
  *(_QWORD *)v115 = 0;
  v116 = v115;
  v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__2706;
  v119 = __Block_byref_object_dispose__2707;
  v120 = 0;
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_140;
  v114[3] = &unk_1E7E15D08;
  v114[4] = v115;
  v82 = _Block_copy(v114);
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  v113[3] = 0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__2706;
  v111 = __Block_byref_object_dispose__2707;
  v112 = 0;
  db = self->_db;
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_142;
  v97[3] = &unk_1E7E1D818;
  v12 = v81;
  v98 = v12;
  v99 = v13;
  v104 = v113;
  v100 = v6;
  v101 = self;
  v105 = &v107;
  v84 = v82;
  v102 = v84;
  v106 = v115;
  v103 = v94;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 1, v97);
  if (v108[5])
  {
    pp_default_log_handle();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
    {
      v90 = objc_msgSend((id)v108[5], "count");
      *(_DWORD *)buf = 134217984;
      v142 = v90;
      _os_log_fault_impl(&dword_1C392E000, v85, OS_LOG_TYPE_FAULT, "iterNamedEntityRecordsWithQuery encountered %tu sources which did not validate; deleting associated named entity records now.",
        buf,
        0xCu);
    }

    v86 = self->_db;
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_150;
    v96[3] = &unk_1E7E1F148;
    v96[4] = self;
    v96[5] = &v107;
    -[PPSQLDatabase writeTransactionWithClient:block:](v86, "writeTransactionWithClient:block:", 1, v96);
  }

  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(v113, 8);

  _Block_object_dispose(v115, 8);
  v9 = 0;
LABEL_58:

LABEL_59:
  objc_autoreleasePoolPop(v93);
  if (v9)
    v88 = v92 == 0;
  else
    v88 = 1;

  return v88;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PPNamedEntityStorage_iterNamedEntityRecordsWithQuery_error_block___block_invoke;
  v11[3] = &unk_1E7E15D30;
  v12 = v8;
  v9 = v8;
  LOBYTE(a4) = -[PPNamedEntityStorage iterNamedEntityRecordsAndIdsWithQuery:error:block:](self, "iterNamedEntityRecordsAndIdsWithQuery:error:block:", a3, a4, v11);

  return (char)a4;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return -[PPRecordStorageHelper clearWithDatabase:client:deletedCount:error:clearExternalTableReferences:](self->_storageHelper, "clearWithDatabase:client:deletedCount:error:clearExternalTableReferences:", self->_db, 1, a4, a3, 0);
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 decayRate:(double)a7 sentimentScore:(double)a8 error:(id *)a9
{
  id v16;
  id v17;
  BOOL v18;
  PPSQLDatabase *db;
  int v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  double v29;
  double v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = 1;
  if (objc_msgSend(v16, "count"))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    db = self->_db;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __102__PPNamedEntityStorage_donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_error___block_invoke;
    v24[3] = &unk_1E7E15D78;
    v27 = &v32;
    v24[4] = self;
    v25 = v16;
    v26 = v17;
    v28 = a5;
    v31 = a6;
    v29 = a7;
    v30 = a8;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v24);
    v20 = *((unsigned __int8 *)v33 + 24);
    if (a9 && !*((_BYTE *)v33 + 24))
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("The donated data is invalid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *a9 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 9, v22);

      v20 = *((unsigned __int8 *)v33 + 24);
    }
    v18 = v20 != 0;

    _Block_object_dispose(&v32, 8);
  }

  return v18;
}

- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3
{
  return -[PPRecordStorageHelper decayedFeedbackCountsForItemString:database:client:](self->_storageHelper, "decayedFeedbackCountsForItemString:database:client:", a3, self->_db, 1);
}

- (BOOL)donateNamedEntityFeedback:(id)a3
{
  return -[PPRecordStorageHelper storeFeedback:database:client:lowercaseItemStrings:limit:](self->_storageHelper, "storeFeedback:database:client:lowercaseItemStrings:limit:", a3, self->_db, 1, 1, 2500);
}

- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4
{
  int v7;

  do
    v7 = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  while (v7
       && !-[PPRecordStorageHelper decayFeedbackWithDatabase:client:decayRate:](self->_storageHelper, "decayFeedbackWithDatabase:client:decayRate:", self->_db, 1, a3));
  return v7;
}

- (BOOL)deleteAllNamedEntitiesOlderThanDate:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
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
  v13[2] = __108__PPNamedEntityStorage_deleteAllNamedEntitiesOlderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E7E1F248;
  v13[4] = self;
  v14 = v9;
  v15 = a4;
  v16 = a5;
  v11 = v9;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v13);

  return 1;
}

- (BOOL)deleteNamedEntitiesMatchingRowIds:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
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
  v13[2] = __106__PPNamedEntityStorage_deleteNamedEntitiesMatchingRowIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E7E1F248;
  v13[4] = self;
  v14 = v9;
  v15 = a4;
  v16 = a5;
  v11 = v9;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v13);

  return 1;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneNamedEntityRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  id v13;
  PPSQLDatabase *db;
  id v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL *v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v12 = a3;
  v13 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2706;
  v31 = __Block_byref_object_dispose__2707;
  v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __130__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v20[3] = &unk_1E7E1D9F0;
  v23 = &v33;
  v20[4] = self;
  v15 = v12;
  v21 = v15;
  v16 = v13;
  v25 = a5;
  v26 = a6;
  v22 = v16;
  v24 = &v27;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v20);
  if (a7)
  {
    v17 = (void *)v28[5];
    if (v17)
      *a7 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneNamedEntityRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  PPSQLDatabase *db;
  id v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  BOOL *v30;
  unint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2706;
  v36 = __Block_byref_object_dispose__2707;
  v37 = 0;
  db = self->_db;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __140__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v24[3] = &unk_1E7E1DA40;
  v28 = &v38;
  v24[4] = self;
  v18 = v14;
  v25 = v18;
  v19 = v15;
  v26 = v19;
  v20 = v16;
  v30 = a6;
  v31 = a7;
  v27 = v20;
  v29 = &v32;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v24);
  if (a8)
  {
    v21 = (void *)v33[5];
    if (v21)
      *a8 = objc_retainAutorelease(v21);
  }
  v22 = *((_BYTE *)v39 + 24);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

- (BOOL)deleteAllNamedEntityFeedbackCountRecordsOlderThanDate:(id)a3
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
  v8[2] = __78__PPNamedEntityStorage_deleteAllNamedEntityFeedbackCountRecordsOlderThanDate___block_invoke;
  v8[3] = &unk_1E7E1F2E8;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v8);
  LOBYTE(db) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

- (BOOL)pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
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
  v9[2] = __112__PPNamedEntityStorage_pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke;
  v9[3] = &unk_1E7E1F310;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  v9[9] = a6;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v9);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)processNewDKEventDeletions
{
  NSObject *v3;

  -[PPNamedEntityStorage _asyncProcessNewDKEventDeletions]((uint64_t)self);
  -[PPNamedEntityStorage _deletionQueue](self);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_229);

}

- (void)importRemotelyGeneratedNamedEntityDKEventsWithLimit:(unsigned int)a3 isComplete:(BOOL *)a4 shouldContinueBlock:(id)a5
{
  -[PPNamedEntityStorage _importDKEventsWithShouldContinueBlock:remoteEventsOnly:isComplete:shouldContinueBlock:]((uint64_t)self, *(uint64_t *)&a3, 1, (uint64_t)a4, a5);
}

- (void)exportRecordsToDKWithShouldContinueBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  unsigned int (**v5)(_QWORD);
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  PPSQLDatabase *db;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  PPSQLDatabase *v19;
  id v20;
  id v21;
  PPDKStorage *dkStorage;
  void *v23;
  unsigned int (**v24)(_QWORD);
  _QWORD v25[4];
  id v26;
  PPNamedEntityStorage *v27;
  id v28;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  _QWORD *v32;
  unsigned int v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD aBlock[4];
  id v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD v51[3];
  char v52;
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[3];
  int v60;
  _QWORD v61[3];
  int v62;

  v4 = (unsigned int (**)(_QWORD))a3;
  v5 = v4;
  if (self->_dkStorage)
  {
    v24 = v4;
    do
    {
      if (!v5[2](v5))
        break;
      v6 = -[PPDKStorage namedEntityWriteBatchSize](self->_dkStorage, "namedEntityWriteBatchSize");
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x2020000000;
      v62 = 0;
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x2020000000;
      v60 = 0;
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x3032000000;
      v57[3] = __Block_byref_object_copy__2706;
      v57[4] = __Block_byref_object_dispose__2707;
      v58 = 0;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__2706;
      v55[4] = __Block_byref_object_dispose__2707;
      v56 = 0;
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x2020000000;
      v54[3] = 0;
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      v53[3] = 0x7FFFFFFFFFFFFFFFLL;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v52 = 0;
      v7 = (void *)objc_opt_new();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2;
      aBlock[3] = &unk_1E7E15EB8;
      v45 = v57;
      v8 = v7;
      v44 = v8;
      v46 = v53;
      v47 = v59;
      v48 = v55;
      v49 = v54;
      v50 = v51;
      v9 = _Block_copy(aBlock);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3;
      v34[3] = &unk_1E7E15EE0;
      v37 = v61;
      v38 = v57;
      v10 = v9;
      v39 = v55;
      v40 = v54;
      v41 = v53;
      v42 = v51;
      v35 = v10;
      v36 = &__block_literal_global_249;
      v11 = _Block_copy(v34);
      db = self->_db;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4;
      v29[3] = &unk_1E7E1DC30;
      v30 = CFSTR("SELECT ne.id, ne.name, ne.lc_name, src.seconds_from_1970 FROM ne_records AS ne INNER JOIN sources AS src ON ne.source_id = src.id WHERE ne.lc_name NOT IN (SELECT DISTINCT(lc_name) FROM ne_records WHERE is_remote = 0 AND dk_event_id IS NOT NULL) AND ne.is_remote = 0 AND ne.is_sync_eligible = 1 ORDER BY ne.lc_name ASC");
      v13 = v11;
      v31 = v13;
      v32 = v59;
      v33 = v6;
      -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 1, v29);
      v14 = objc_msgSend(v8, "count");
      if (v14 < v6)
        v10[2](v10);
      v15 = v6;
      v16 = v31;
      v17 = v8;

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v53, 8);
      _Block_object_dispose(v54, 8);
      _Block_object_dispose(v55, 8);

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(v59, 8);
      _Block_object_dispose(v61, 8);
      v18 = (void *)objc_opt_new();
      v19 = self->_db;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke;
      v25[3] = &unk_1E7E1DB90;
      v26 = v17;
      v27 = self;
      v28 = v18;
      v20 = v18;
      v21 = v17;
      -[PPSQLDatabase writeTransactionWithClient:timeoutInSeconds:block:](v19, "writeTransactionWithClient:timeoutInSeconds:block:", 1, v25, 2.5);
      dkStorage = self->_dkStorage;
      -[PPDKStorage entityStream](dkStorage, "entityStream");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v24;
      -[PPDKStorage saveEvents:stream:maxRetries:retryInterval:shouldContinueBlock:](dkStorage, "saveEvents:stream:maxRetries:retryInterval:shouldContinueBlock:", v20, v23, -1, v24, 5.0);

    }
    while (v14 >= v15);
  }

}

- (void)clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:(id)a3
{
  -[PPRecordStorageHelper deleteAllRemoteRecordsMissingInDuetFromDatabase:client:shouldContinueBlock:](self->_storageHelper, "deleteAllRemoteRecordsMissingInDuetFromDatabase:client:shouldContinueBlock:", self->_db, 1, a3);
}

- (void)fixupDKEventsWithShouldContinueBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  uint64_t v5;
  PPRecordStorageHelper *storageHelper;
  PPSQLDatabase *db;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = (unsigned int (**)(_QWORD))a3;
  if (self->_dkStorage)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      if (!v4[2](v4))
        break;
      storageHelper = self->_storageHelper;
      db = self->_db;
      v8 = -[PPDKStorage namedEntityWriteBatchSize](self->_dkStorage, "namedEntityWriteBatchSize");
      v9[4] = self;
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke;
      v10[3] = &unk_1E7E1DC58;
      v10[4] = self;
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2;
      v9[3] = &unk_1E7E1DC80;
    }
    while (!-[PPRecordStorageHelper fixupDKEventsWithDatabase:fixup49995922Table:batchSize:shouldContinueBlock:createRecordWithStatement:eventForRecord:](storageHelper, "fixupDKEventsWithDatabase:fixup49995922Table:batchSize:shouldContinueBlock:createRecordWithStatement:eventForRecord:", db, CFSTR("ne_dk_fixup_49995922"), v8, v4, v10, v9));
  }

}

- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3
{
  -[PPRecordStorageHelper fixupDKEventsMetadataWithShouldContinueBlock:database:client:](self->_storageHelper, "fixupDKEventsMetadataWithShouldContinueBlock:database:client:", a3, self->_db, 1);
}

- (void)disableSyncForBundleIds:(id)a3
{
  PPSQLDatabase *db;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    db = self->_db;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PPNamedEntityStorage_disableSyncForBundleIds___block_invoke;
    v6[3] = &unk_1E7E1DCA8;
    v6[4] = self;
    v7 = v5;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v6);

  }
}

- (unsigned)duetReadBatchSize
{
  return -[PPDKStorage readBatchSize](self->_dkStorage, "readBatchSize");
}

- (unsigned)duetWriteBatchSize
{
  return -[PPDKStorage namedEntityWriteBatchSize](self->_dkStorage, "namedEntityWriteBatchSize");
}

- (double)duetWriteBatchInterval
{
  double result;

  -[PPDKStorage namedEntityWriteBatchInterval](self->_dkStorage, "namedEntityWriteBatchInterval");
  return result;
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
  v18 = __Block_byref_object_copy__2706;
  v19 = __Block_byref_object_dispose__2707;
  v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PPNamedEntityStorage_sourceStats_withExcludedAlgorithms___block_invoke;
  v11[3] = &unk_1E7E1F2C0;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = a3;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 1, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
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
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT source_id FROM ne_records WHERE algorithm NOT IN (%@)"), v9);

    +[PPSQLDatabase createTempViewContainingRowsFromQuery:descriptiveTableName:txnWitness:](PPSQLDatabase, "createTempViewContainingRowsFromQuery:descriptiveTableName:txnWitness:", v10, CFSTR("ne_sourceids"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)clusterIdentifiersExistingBeforeDate:(id)a3
{
  return -[PPRecordStorageHelper clusterIdentifiersExistingInDatabaseBeforeDate:client:date:](self->_storageHelper, "clusterIdentifiersExistingInDatabaseBeforeDate:client:date:", self->_db, 6, a3);
}

- (unsigned)uniqueClusterIdentifierCount
{
  return -[PPRecordStorageHelper distinctClusterCountInDatabase:client:](self->_storageHelper, "distinctClusterCountInDatabase:client:", self->_db, 6);
}

- (id)thirdPartyBundleIdsFromToday
{
  return -[PPRecordStorageHelper thirdPartyBundleIdsFromTodayInDatabase:client:](self->_storageHelper, "thirdPartyBundleIdsFromTodayInDatabase:client:", self->_db, 6);
}

- (id)lastDonationTimeForSourcesBeforeDate:(id)a3
{
  return -[PPRecordStorageHelper lastDonationTimeForSourcesInDatabase:client:before:](self->_storageHelper, "lastDonationTimeForSourcesInDatabase:client:before:", self->_db, 6, a3);
}

- (id)namedEntityFilterLastRunDateWithError:(id *)a3
{
  PPSQLDatabase *db;
  id v5;
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
  v17 = __Block_byref_object_copy__2706;
  v18 = __Block_byref_object_dispose__2707;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2706;
  v12 = __Block_byref_object_dispose__2707;
  v13 = 0;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PPNamedEntityStorage_namedEntityFilterLastRunDateWithError___block_invoke;
  v7[3] = &unk_1E7E18630;
  v7[4] = &v8;
  v7[5] = &v14;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 1, v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)namedEntityFilterLastRecordDate
{
  PPSQLDatabase *db;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2706;
  v14 = __Block_byref_object_dispose__2707;
  v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2706;
  v8[4] = __Block_byref_object_dispose__2707;
  v9 = 0;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PPNamedEntityStorage_namedEntityFilterLastRecordDate__block_invoke;
  v7[3] = &unk_1E7E18630;
  v7[4] = &v10;
  v7[5] = v8;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 1, v7);
  v3 = (void *)v11[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)setNamedEntityFilterLastRecordDate:(id)a3 error:(id *)a4
{
  id v6;
  PPSQLDatabase *db;
  id v8;
  char v9;
  _QWORD v11[4];
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
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2706;
  v19 = __Block_byref_object_dispose__2707;
  v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PPNamedEntityStorage_setNamedEntityFilterLastRecordDate_error___block_invoke;
  v11[3] = &unk_1E7E15F08;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v21;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 6, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (BOOL)setNamedEntityFilterLastRunDate:(id)a3 error:(id *)a4
{
  id v6;
  PPSQLDatabase *db;
  id v8;
  char v9;
  _QWORD v11[4];
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
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2706;
  v19 = __Block_byref_object_dispose__2707;
  v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PPNamedEntityStorage_setNamedEntityFilterLastRunDate_error___block_invoke;
  v11[3] = &unk_1E7E15F08;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v21;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 6, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)firstDonationSourceCountsWithShouldContinueBlock:(id)a3
{
  return -[PPRecordStorageHelper firstDonationSourceCountsForDatabase:client:shouldContinueBlock:](self->_storageHelper, "firstDonationSourceCountsForDatabase:client:shouldContinueBlock:", self->_db, 6, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_populateDatabaseQueue, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_sourceStorage, 0);
  objc_storeStrong((id *)&self->_storageHelper, 0);
  objc_storeStrong(&self->_deletionObserver, 0);
  objc_storeStrong((id *)&self->_dkStorage, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __62__PPNamedEntityStorage_setNamedEntityFilterLastRunDate_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v3 = a2;
  v4 = a1[4];
  v5 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v6, CFSTR("namedEntityLastFilteredTime"), v3);
    +[PPSQLKVStore removeBlobForKey:transaction:](PPSQLKVStore, "removeBlobForKey:transaction:", CFSTR("namedEntityLastRecordFilteredTime"), v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

void __65__PPNamedEntityStorage_setNamedEntityFilterLastRecordDate_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v3 = a2;
  v4 = a1[4];
  v5 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v6, CFSTR("namedEntityLastRecordFilteredTime"), v3);
  else
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;

}

void __55__PPNamedEntityStorage_namedEntityFilterLastRecordDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", CFSTR("namedEntityLastRecordFilteredTime"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "PPNamedEntityStorage: named entities have never been filtered via CTS.", buf, 2u);
    }
    goto LABEL_7;
  }
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v7, v4, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    pp_entities_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPNamedEntityStorage: error unarchiving filter date %@", buf, 0xCu);
    }
LABEL_7:

  }
}

void __62__PPNamedEntityStorage_namedEntityFilterLastRunDateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id obj;
  uint8_t buf[16];

  v3 = a2;
  +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", CFSTR("namedEntityLastFilteredTime"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = (void *)MEMORY[0x1C3BD6630]();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v7, v4, &obj);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), obj);

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "PPNamedEntityStorage: named entities have never been filtered via CTS.", buf, 2u);
    }
  }

}

void __59__PPNamedEntityStorage_sourceStats_withExcludedAlgorithms___block_invoke(uint64_t a1, void *a2)
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
    v4 = CFSTR("ne_records");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sourceStats:forTableWithName:txnWitness:", *(_QWORD *)(a1 + 56), v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (v3)
    +[PPSQLDatabase dropViewWithName:txnWitness:](PPSQLDatabase, "dropViewWithName:txnWitness:", v3, v8);

}

uint64_t __48__PPNamedEntityStorage_disableSyncForBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "disableSyncForBundleIds:txnWitness:", *(_QWORD *)(a1 + 40), a2);
}

id __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[PPNamedEntityStorage _createRecordWithStatement:txnWitness:](*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "eventForNamedEntityRecord:sourceDeviceID:", a2, 0);
}

- (id)_createRecordWithStatement:(void *)a3 txnWitness:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v44;
  id v45;
  uint8_t buf[16];

  v5 = a2;
  if (a1)
  {
    v6 = a3;
    objc_msgSend(v5, "nonnullNSStringForColumnName:table:", "name", "ne_records");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "getInt64ForColumnName:table:", "category", "ne_records");
    objc_msgSend(v5, "getNSStringForColumnName:table:", "dynamic_category", "ne_records");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nonnullNSStringForColumnName:table:", "language", "ne_records");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v5, "getInt64ForColumnName:table:", "algorithm", "ne_records");
    objc_msgSend(v5, "getDoubleForColumnName:table:", "initial_score", "ne_records");
    v12 = fabs(v11);
    v13 = v12 < INFINITY;
    v14 = v12 <= INFINITY;
    v15 = 0.0;
    if (v13)
      v15 = v11;
    if (v14)
      v16 = v15;
    else
      v16 = v11;
    objc_msgSend(v5, "getDoubleForColumnName:table:", "decay_rate", "ne_records");
    v18 = fabs(v17);
    v19 = v18 <= INFINITY;
    if (v18 >= INFINITY)
      v20 = *MEMORY[0x1E0D70F28];
    else
      v20 = v17;
    if (v19)
      v21 = v20;
    else
      v21 = v17;
    objc_msgSend(v5, "getNSStringForColumnName:table:", "extraction_os_build", "ne_records");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getInt64AsNSNumberForColumnName:table:", "extraction_asset_version", "ne_records");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      v25 = objc_msgSend(v23, "unsignedLongValue");
    else
      v25 = 0xFFFFFFFFLL;
    objc_msgSend(v5, "getDoubleForColumnName:table:", "sentiment_score", "ne_records");
    v27 = v26;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:dynamicCategory:language:", v7, v8, v9, v10);
    objc_msgSend(*(id *)(a1 + 40), "createSourceWithStatement:txnWitness:", v5, v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = fabs(v27);
      v13 = v30 < INFINITY;
      v31 = v30 <= INFINITY;
      v32 = 0.0;
      if (v13)
        v32 = v27;
      if (v31)
        v27 = v32;
      v33 = (void *)objc_opt_new();
      objc_msgSend(v33, "setEntity:", v28);
      objc_msgSend(v33, "setSource:", v29);
      objc_msgSend(v33, "setAlgorithm:", v44);
      objc_msgSend(v33, "setInitialScore:", v16);
      objc_msgSend(v33, "setDecayRate:", v21);
      objc_msgSend(v33, "setExtractionOsBuild:", v22);
      objc_msgSend(v33, "setExtractionAssetVersion:", v25);
      objc_msgSend(v33, "setSentimentScore:", v27);
      v45 = objc_alloc(MEMORY[0x1E0D70BC8]);
      v34 = v28;
      v35 = v10;
      v36 = v9;
      v37 = v7;
      v38 = objc_msgSend(v5, "getInt64ForColumnName:table:", "impression_count", "ne_records");
      v39 = objc_msgSend(v5, "getInt64ForColumnName:table:", "occurrences_in_source", "ne_records");
      v40 = v38;
      v7 = v37;
      v9 = v36;
      v10 = v35;
      v28 = v34;
      v41 = (void *)objc_msgSend(v45, "initWithImpressionCount:occurrencesInSource:", v40, v39);
      objc_msgSend(v33, "setMetadata:", v41);

    }
    else
    {
      pp_entities_log_handle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v42, OS_LOG_TYPE_ERROR, "Suppressing construction of named entity record due to source with bogus date.", buf, 2u);
      }

      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2;
  v11[3] = &unk_1E7E1F040;
  v12 = *(id *)(a1 + 32);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3;
  v8[3] = &unk_1E7E1DB68;
  v6 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM ne_records AS ne JOIN sources AS src ON ne.source_id = src.id WHERE ne.id IN _pas_nsarray(:rowIds)"), v11, v8, 0);

}

uint64_t __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = v4;
  if (v3)
  {
    v7 = a2;
    v8 = objc_msgSend(v7, "getInt64ForColumnName:table:", "id", "ne_records");
    -[PPNamedEntityStorage _createRecordWithStatement:txnWitness:](v3, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(v3 + 16), "eventForNamedEntityRecord:sourceDeviceID:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShouldSync:", 1);
      objc_msgSend(v6, "db");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __61__PPNamedEntityStorage__populateEvents_statement_txnWitness___block_invoke;
      v19 = &unk_1E7E1F220;
      v12 = v10;
      v20 = v12;
      v21 = v8;
      v13 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE ne_records SET dk_event_id = :uuidBlob WHERE id = :rowid"), &v16, 0, 0);

      if (v13)
        objc_msgSend(v5, "addObject:", v12, v16, v17, v18, v19);
      v14 = *MEMORY[0x1E0D81780];

    }
    else
    {
      v14 = *MEMORY[0x1E0D81780];
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __61__PPNamedEntityStorage__populateEvents_statement_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", v7);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 16);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":uuidBlob", v6);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowid", *(_QWORD *)(a1 + 40));

}

void __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v2 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

    ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1[8] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 0;
  }
}

void __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4, double a5)
{
  id v10;
  void *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  int v15;
  char v16;
  int v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = v10;
  ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) && (objc_msgSend(v10, "isEqualToString:") & 1) == 0)
    (*(void (**)(void))(a1[4] + 16))();
  v12 = *(_QWORD *)(a1[7] + 8);
  v14 = *(_QWORD *)(v12 + 40);
  v13 = (id *)(v12 + 40);
  if (!v14)
  {
    objc_storeStrong(v13, a4);
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
    *(double *)(*(_QWORD *)(a1[9] + 8) + 24) = a5;
    *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
    goto LABEL_12;
  }
  v15 = (*(uint64_t (**)(void))(a1[5] + 16))();
  v16 = v15;
  v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[11] + 8) + 24);
  if (v15)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
    {
LABEL_10:
      objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
      *(double *)(*(_QWORD *)(a1[9] + 8) + 24) = a5;
      *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = a2;
      *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = v16;
      goto LABEL_12;
    }
    v17 = 1;
  }
  if (v17 == v15 && *(double *)(*(_QWORD *)(a1[9] + 8) + 24) < a5)
    goto LABEL_10;
LABEL_12:

}

void __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  int v10;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_5;
  v7[3] = &unk_1E7E1DC08;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v7, 0);

}

uint64_t __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v3 = a2;
  objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "ne_records");
  objc_msgSend(v3, "getNSStringForColumnName:table:", "name", "ne_records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "lc_name", "ne_records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnName:table:", "seconds_from_1970", "sources");
  v7 = v6;

  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v7);
  LODWORD(v3) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  LODWORD(a1) = *(_DWORD *)(a1 + 48);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if (v3 >= a1)
    v10 = v9;
  else
    v10 = v8;
  return *v10;
}

uint64_t __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v2, "localizedLowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedCapitalizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isEqualToString:", v5);

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (void)_importDKEventsWithShouldContinueBlock:(uint64_t)a3 remoteEventsOnly:(uint64_t)a4 isComplete:(void *)a5 shouldContinueBlock:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;

  if (a1)
  {
    v9 = a5;
    v10 = (void *)objc_opt_new();
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __111__PPNamedEntityStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke;
    v14[3] = &unk_1E7E15E50;
    v14[4] = a1;
    v15 = v10;
    v13 = v10;
    objc_msgSend(v11, "importDuetEventsWithLimit:database:client:remoteEventsOnly:isComplete:shouldContinueBlock:eventImportBlock:", a2, v12, 1, a3, a4, v9, v14);

  }
}

void __111__PPNamedEntityStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = v6;
  if (v7)
  {
    objc_msgSend(*(id *)(v7 + 16), "namedEntityRecordFromEvent:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v30[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filterNamedEntityRecords:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = *(void **)(v7 + 40);
        objc_msgSend(v13, "source");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "updateOrCreateRowForSource:addingRefCount:txnWitness:", v18, 1, v10);

        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          pp_entities_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v25[0]) = 0;
            _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "Suppressing named entity DKEvent import due to source with bogus date.", (uint8_t *)v25, 2u);
          }
        }
        else
        {
          objc_msgSend(v13, "entity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "clusterIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            pp_default_log_handle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v25[0]) = 0;
              _os_log_fault_impl(&dword_1C392E000, v23, OS_LOG_TYPE_FAULT, "Named entity record unexpectedly had nil cluster identifier during DKEvent import.", (uint8_t *)v25, 2u);
            }

          }
          objc_msgSend(v10, "db");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __90__PPNamedEntityStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness_filter___block_invoke;
          v25[3] = &unk_1E7E1DB40;
          v26 = v13;
          v29 = v19;
          v27 = v8;
          v28 = v9;
          objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO ne_records (name, lc_name, category, dynamic_category, language, algorithm, initial_score, decay_rate,     extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible, sentiment_score, dk_event_id) VALUES (:name, :lcName, :category, :dynamicCategory, :language, :algorithm, :initialScore, :decayRate, :osBuild,     :assetVersion, :sourceRowId, :isRemote, 0, :sentimentScore, :uuidBlob)"), v25, 0, 0);

          v20 = v26;
        }

      }
    }

  }
}

void __90__PPNamedEntityStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness_filter___block_invoke(uint64_t a1, void *a2)
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
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindNamedParam:toNSString:", ":name", v4);

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clusterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v18, "bindNamedParam:toNSString:", ":lcName", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bindNamedParam:toNSString:", ":lcName", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindNamedParam:toInt64:", ":category", objc_msgSend(v10, "category"));

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dynamicCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindNamedParam:toNSString:", ":dynamicCategory", v12);

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestLanguage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindNamedParam:toNSString:", ":language", v14);

  objc_msgSend(v18, "bindNamedParam:toInt64:", ":algorithm", objc_msgSend(*(id *)(a1 + 32), "algorithm"));
  objc_msgSend(*(id *)(a1 + 32), "initialScore");
  objc_msgSend(v18, "bindNamedParam:toDouble:", ":initialScore");
  objc_msgSend(*(id *)(a1 + 32), "decayRate");
  objc_msgSend(v18, "bindNamedParam:toDouble:", ":decayRate");
  objc_msgSend(*(id *)(a1 + 32), "extractionOsBuild");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindNamedParam:toNSString:", ":osBuild", v15);

  if (objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion") == -1)
    objc_msgSend(v18, "bindNamedParamToNull:", ":assetVersion");
  else
    objc_msgSend(v18, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion"));
  objc_msgSend(v18, "bindNamedParam:toInt64:", ":sourceRowId", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindNamedParam:toInt64:", ":isRemote", v17 != 0);

  objc_msgSend(*(id *)(a1 + 32), "sentimentScore");
  objc_msgSend(v18, "bindNamedParam:toDouble:", ":sentimentScore");
  objc_msgSend(v18, "bindNamedParam:toNSData:", ":uuidBlob", *(_QWORD *)(a1 + 48));

}

- (void)_asyncProcessNewDKEventDeletions
{
  void *v2;
  NSObject *queue;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      -[PPNamedEntityStorage _deletionQueue]((id)a1);
      queue = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "duetEventDeletionProcessingBlockWithDatabase:client:", *(_QWORD *)(a1 + 8), 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(queue, v2);

    }
  }
}

- (id)_deletionQueue
{
  if (a1)
  {
    if (_deletionQueue__pasOnceToken14 != -1)
      dispatch_once(&_deletionQueue__pasOnceToken14, &__block_literal_global_227);
    a1 = (id)_deletionQueue__pasExprOnceResult;
  }
  return a1;
}

void __38__PPNamedEntityStorage__deletionQueue__block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = dispatch_queue_create("PPNamedEntityStorage-_DKEvent-deletion", v2);
  v4 = (void *)_deletionQueue__pasExprOnceResult;
  _deletionQueue__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

uint64_t __112__PPNamedEntityStorage_pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "pruneOrphanedFeedbackCountRecordsWithLimit:rowOffset:deletedCount:txnWitness:isComplete:", a1[6], a1[7], a1[8], a2, a1[9]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __78__PPNamedEntityStorage_deleteAllNamedEntityFeedbackCountRecordsOlderThanDate___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "deleteFeedbackCountRecordsOlderThanDate:txnWitness:", a1[5], a2);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __140__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[10];
  v8 = a1[11];
  v9 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:groupId:olderThanDate:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, v6, a2, v7, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v10;
}

void __130__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a1[6];
  v6 = a1[9];
  v7 = a1[10];
  v8 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:documentIds:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, a2, v6, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
}

uint64_t __106__PPNamedEntityStorage_deleteNamedEntitiesMatchingRowIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", a1[5], a2, a1[6], a1[7]);
}

void __108__PPNamedEntityStorage_deleteAllNamedEntitiesOlderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  v5 = a2;
  objc_msgSend(v4, "rowIdsForRecordsOlderThanDate:txnWitness:", v3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, v5, a1[6], a1[7]);

}

void __102__PPNamedEntityStorage_donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  id v79;
  BOOL v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id obj;
  NSObject *obja;
  char v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  id v100;
  _QWORD v101[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  _QWORD v111[4];
  id v112;
  id v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _QWORD v120[11];
  char v121;
  uint8_t buf[128];
  uint64_t v123;

  v3 = a1;
  v123 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v92 = *(_QWORD *)(a1 + 64);
  v91 = *(_BYTE *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(id *)(a1 + 40);
  v9 = v5;
  v10 = a2;
  v93 = v4;
  if (v4)
  {
    v11 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v95 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "scoredNamedEntity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
      }
      while (v14);
    }
    v77 = v8;
    v78 = v3;
    obj = v12;

    v18 = v11;
    v76 = v9;
    v19 = v9;
    v87 = v10;
    v20 = v10;
    if (!objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", sel__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness_, v93, CFSTR("PPNamedEntityStorage.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entities.count > 0"));

    }
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "weightMultiplier");
    v23 = v22;

    v24 = (void *)objc_opt_new();
    v25 = (void *)objc_opt_new();
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v26 = v18;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v116;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v116 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
          objc_msgSend(v31, "item");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, v32);

          objc_msgSend(v31, "item");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v34);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
      }
      while (v28);
    }

    v88 = v26;
    v35 = objc_msgSend(v26, "count");
    if (v35 != objc_msgSend(v24, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", sel__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness_, v93, CFSTR("PPNamedEntityStorage.m"), 483, CFSTR("scored entities array contains duplicate entities"));

    }
    v36 = (void *)objc_opt_new();
    v37 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v19, "groupId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = CFSTR("= :groupId");
    if (!v38)
      v39 = CFSTR("IS NULL");
    v40 = objc_msgSend(v37, "initWithFormat:", CFSTR("SELECT ne.id, ne.name, ne.category, ne.dynamic_category, ne.language, ne.initial_score, ne.decay_rate, src.seconds_from_1970 FROM ne_records AS ne INNER JOIN sources AS src ON ne.source_id = src.id WHERE src.bundle_id = :bundleId AND src.group_id %@ AND src.doc_id = :docId AND ne.is_remote = 0 AND ne.algorithm = :algorithm AND ne.name IN _pas_nsset(:uniqueEntityNames)"), v39);

    objc_msgSend(v20, "db");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = MEMORY[0x1E0C809B0];
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke;
    v111[3] = &unk_1E7E1D888;
    v43 = v19;
    v112 = v43;
    v114 = v92;
    v81 = v25;
    v113 = v81;
    *(_QWORD *)&v106 = v42;
    *((_QWORD *)&v106 + 1) = 3221225472;
    *(_QWORD *)&v107 = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_2;
    *((_QWORD *)&v107 + 1) = &unk_1E7E1D8B0;
    *(_QWORD *)&v108 = v93;
    v44 = v36;
    *((_QWORD *)&v108 + 1) = v44;
    v85 = v43;
    *(_QWORD *)&v109 = v85;
    v110 = v23;
    v79 = v24;
    *((_QWORD *)&v109 + 1) = v79;
    v83 = (void *)v40;
    objc_msgSend(v41, "prepAndRunQuery:onPrep:onRow:onError:", v40, v111, &v106, 0);

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v103;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v103 != v48)
            objc_enumerationMutation(v45);
          v50 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * k);
          objc_msgSend(v20, "db");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_3;
          v101[3] = &unk_1E7E1F040;
          v101[4] = v50;
          objc_msgSend(v51, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE ne_records SET initial_score = :initialScore, impression_count = impression_count + 1 WHERE id = :rowId"), v101, 0, 0);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
      }
      while (v47);
    }

    v52 = (void *)objc_opt_new();
    v53 = MEMORY[0x1E0C809B0];
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_4;
    v98[3] = &unk_1E7E1D8D8;
    v99 = v79;
    v54 = v52;
    v100 = v54;
    v55 = v79;
    objc_msgSend(v88, "enumerateObjectsUsingBlock:", v98);
    v56 = v100;
    v57 = v54;

    v58 = (void *)MEMORY[0x1E0CB3880];
    *(_QWORD *)&v115 = v53;
    *((_QWORD *)&v115 + 1) = 3221225472;
    *(_QWORD *)&v116 = __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke;
    *((_QWORD *)&v116 + 1) = &unk_1E7E15DA0;
    v59 = v57;
    *(_QWORD *)&v117 = v59;
    objc_msgSend(v58, "predicateWithBlock:", &v115);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "filteredArrayUsingPredicate:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v87;
    if (objc_msgSend(v61, "count"))
    {
      objc_msgSend(*(id *)(v93 + 32), "truncateRecordsByDroppingOldestMakingRoomForCount:txnWitness:", objc_msgSend(v61, "count"), v20);
      v62 = objc_msgSend(*(id *)(v93 + 40), "updateOrCreateRowForSource:addingRefCount:txnWitness:", v85, objc_msgSend(v61, "count"), v20);
      v63 = v62 != 0x7FFFFFFFFFFFFFFFLL;
      if (v62 == 0x7FFFFFFFFFFFFFFFLL)
      {
        pp_entities_log_handle();
        obja = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C392E000, obja, OS_LOG_TYPE_ERROR, "Suppressing named entity donation due to source with bogus date.", buf, 2u);
        }
        v8 = v77;
        v3 = v78;
        v9 = v76;
      }
      else
      {
        v64 = v62;
        +[PPSettings sharedInstance](PPSettings, "sharedInstance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "weightMultiplier");
        v67 = v66;

        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        obja = v61;
        v68 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v106, buf, 16);
        if (v68)
        {
          v69 = v68;
          v80 = v63;
          v82 = v61;
          v84 = v60;
          v86 = v59;
          v70 = *(_QWORD *)v107;
          do
          {
            for (m = 0; m != v69; ++m)
            {
              if (*(_QWORD *)v107 != v70)
                objc_enumerationMutation(obja);
              v72 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * m);
              objc_msgSend(v20, "db");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v120[0] = MEMORY[0x1E0C809B0];
              v120[1] = 3221225472;
              v120[2] = __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke_213;
              v120[3] = &unk_1E7E15DC8;
              v120[4] = v93;
              v120[5] = v72;
              v120[6] = v92;
              v121 = v91;
              v120[7] = v6;
              v120[8] = v7;
              v120[9] = v67;
              v120[10] = v64;
              objc_msgSend(v73, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO ne_records (name, lc_name, category, dynamic_category, language, algorithm, initial_score, decay_rate,     extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible,     sentiment_score, occurrences_in_source) VALUES (:name, :lcName, :category, :dynamicCategory, :language, :algorithm, :initialScore, :decayRate,     :osBuild, :assetVersion, :sourceRowId, 0, :shouldSync, :sentimentScore, :occurrencesInSource)"), v120, 0, 0);

            }
            v69 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v106, buf, 16);
          }
          while (v69);
          v8 = v77;
          v3 = v78;
          v9 = v76;
          v59 = v86;
          v10 = v87;
          v61 = v82;
          v60 = v84;
          v63 = v80;
        }
        else
        {
          v8 = v77;
          v3 = v78;
          v9 = v76;
          v10 = v87;
        }
      }

    }
    else
    {
      v63 = 1;
      v8 = v77;
      v3 = v78;
      v9 = v76;
    }

  }
  else
  {
    v63 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 24) = v63;
}

uint64_t __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "scoredNamedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

void __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke_213(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  unsigned int v11;
  double v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[16];

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "scoredNamedEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 88);
  v9 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = objc_msgSend(*(id *)(a1 + 40), "occurrencesInSource");
  v12 = *(double *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = v5;
  v38 = v6;
  if (v4)
  {
    v15 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v38, "item");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clusterIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      pp_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C392E000, v18, OS_LOG_TYPE_FAULT, "Named entity record unexpectedly had nil cluster identifier during named entity donation.", buf, 2u);
      }

    }
    objc_msgSend(v38, "item");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bindNamedParam:toNSString:", ":name", v20);
    objc_msgSend(v38, "item");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clusterIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v14, "bindNamedParam:toNSString:", ":lcName", v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D70BC0], "clusterIdentifierFromName:", v20);
      v37 = v20;
      v23 = v4;
      v24 = v10;
      v25 = v13;
      v26 = v15;
      v27 = v7;
      v28 = v11;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bindNamedParam:toNSString:", ":lcName", v29);

      v11 = v28;
      v7 = v27;
      v15 = v26;
      v13 = v25;
      v10 = v24;
      v4 = v23;
      v20 = v37;
    }

    objc_msgSend(v38, "item");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":category", objc_msgSend(v30, "category"));

    objc_msgSend(v38, "item");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dynamicCategory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bindNamedParam:toNSString:", ":dynamicCategory", v32);

    objc_msgSend(v38, "item");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bestLanguage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bindNamedParam:toNSString:", ":language", v34);

    objc_msgSend(v14, "bindNamedParam:toInt64:", ":algorithm", v10);
    objc_msgSend(v38, "score");
    objc_msgSend(v14, "bindNamedParam:toDouble:", ":initialScore", v35 * v12);
    objc_msgSend(v14, "bindNamedParam:toDouble:", ":decayRate", v9);
    objc_msgSend(MEMORY[0x1E0D70D00], "osBuild");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bindNamedParam:toNSString:", ":osBuild", v36);
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(v4 + 48), "treatmentsHash"));
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":sourceRowId", v13);
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":shouldSync", v7);
    objc_msgSend(v14, "bindNamedParam:toDouble:", ":sentimentScore", v8);
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":occurrencesInSource", v11);

    objc_autoreleasePoolPop(v15);
  }

}

void __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":bundleId", v3);

  objc_msgSend(*(id *)(a1 + 32), "groupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNSString:", ":groupId", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "documentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":docId", v6);

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":algorithm", *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "bindNamedParam:toNSSet:", ":uniqueEntityNames", *(_QWORD *)(a1 + 40));

}

uint64_t __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(a1 + 64);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v54 = *(id *)(a1 + 40);
  v7 = a2;
  v8 = v5;
  v9 = v6;
  if (v3)
  {
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v11 = objc_msgSend(v7, "getInt64ForColumnName:table:", "id", "ne_records");
    objc_msgSend(v7, "nonnullNSStringForColumnName:table:", "name", "ne_records");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "getInt64ForColumnName:table:", "category", "ne_records");
    objc_msgSend(v7, "getNSStringForColumnName:table:", "dynamic_category", "ne_records");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nonnullNSStringForColumnName:table:", "language", "ne_records");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getDoubleForColumnName:table:", "initial_score", "ne_records");
    v17 = fabs(v16);
    v18 = v17 <= INFINITY;
    if (v17 >= INFINITY)
      v19 = 0.0;
    else
      v19 = v16;
    if (v18)
      v20 = v19;
    else
      v20 = v16;
    objc_msgSend(v7, "getDoubleForColumnName:table:", "decay_rate", "ne_records");
    v22 = fabs(v21);
    v23 = v22 <= INFINITY;
    if (v22 >= INFINITY)
      v24 = *MEMORY[0x1E0D70F28];
    else
      v24 = v21;
    if (v23)
      v25 = v24;
    else
      v25 = v21;
    objc_msgSend(v7, "getDoubleForColumnName:table:", "seconds_from_1970", "sources");
    v27 = fabs(v26);
    v28 = v27 <= INFINITY;
    if (v27 >= INFINITY)
      v29 = 0.0;
    else
      v29 = v26;
    if (v28)
      v30 = v29;
    else
      v30 = v26;
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:dynamicCategory:language:", v12, v13, v14, v15);
    objc_msgSend(v9, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v31);
      v53 = v8;
      objc_msgSend(v8, "bundleId");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v52 = v11;
      if (_shouldSuppressRepeatedImpressions___pasOnceToken10 != -1)
        dispatch_once(&_shouldSuppressRepeatedImpressions___pasOnceToken10, &__block_literal_global_177);
      v34 = objc_msgSend((id)_shouldSuppressRepeatedImpressions___pasExprOnceResult, "containsObject:", v33);

      if (v34)
      {
        pp_entities_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v53, "bundleId");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v50;
          _os_log_debug_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEBUG, "Suppressing repeated impressions sourced from %@.", buf, 0xCu);

        }
        v8 = v53;
      }
      else
      {
        v51 = v10;
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v30);
        objc_msgSend(v53, "date");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = v36;
        objc_opt_self();
        objc_msgSend(v37, "timeIntervalSinceDate:", v38);
        v40 = v39;

        if (v40 >= 0.0)
        {
          v41 = 0.0;
          if (v25 >= 0.0)
            v41 = v25;
          v20 = exp(-(v41 * v40)) * v20;
        }

        objc_msgSend(v32, "score");
        v43 = v20 + v42 * v4;
        v44 = (void *)MEMORY[0x1E0D81638];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v52);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "tupleWithFirst:second:", v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v47);

        v8 = v53;
        v10 = v51;
      }
    }
    v48 = *MEMORY[0x1E0D81780];

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

void __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":initialScore");

  objc_msgSend(*(id *)(a1 + 32), "first");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", objc_msgSend(v6, "longLongValue"));

}

void __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __59__PPNamedEntityStorage__shouldSuppressRepeatedImpressions___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = (void *)MEMORY[0x1C3BD6630]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0D70DF0], *MEMORY[0x1E0D70E00], 0);
  objc_autoreleasePoolPop(v1);
  v4 = (void *)_shouldSuppressRepeatedImpressions___pasExprOnceResult;
  _shouldSuppressRepeatedImpressions___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

uint64_t __68__PPNamedEntityStorage_iterNamedEntityRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
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

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingSourceBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":excludingSourceBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingGroupIds", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingCategories", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":excludingAlgorithms", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingSourceDocumentIds", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":lowercaseMatchingNames", *(_QWORD *)(a1 + 32));
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_135(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_137;
  v3[3] = &unk_1E7E1D7A0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "bindNamedParam:toBlock:", ":matchingEntityTrieBlock", v3);

}

BOOL __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;

  v3 = a2;
  v4 = 0;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v5)
    {
      v6 = objc_msgSend(v5, "algorithm");
      if (v6 != objc_msgSend(v3, "algorithm"))
        goto LABEL_7;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "entity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToNamedEntity:", v8);

      if (!v9)
        goto LABEL_7;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "source");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

      if (v14)
      {
        objc_msgSend(v3, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "source");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", v18);
        v4 = fabs(v19) <= 1.0;

      }
      else
      {
LABEL_7:
        v4 = 0;
      }
    }
  }

  return v4;
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_142(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_143;
  v23[3] = &unk_1E7E1F040;
  v6 = *(_QWORD *)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4_144;
  v14[3] = &unk_1E7E1D7F0;
  v20 = *(_QWORD *)(a1 + 80);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 64);
  v15 = v7;
  v16 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  v17 = v3;
  v21 = v10;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 96);
  v18 = v11;
  v22 = v12;
  v19 = *(id *)(a1 + 72);
  v13 = v3;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v6, v23, v14, 0);

}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_150(uint64_t a1, void *a2)
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
  v9[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_154;
  v9[3] = &unk_1E7E1F0F8;
  v9[4] = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_156;
  v7[3] = &unk_1E7E1F120;
  v6 = v4;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM ne_records WHERE source_id IN _pas_nsset(:sourceIds)"), v9, v7, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, v3, 0, 0);
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_154(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":sourceIds", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_156(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", "ne_records"));
  return *MEMORY[0x1E0D81780];
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_143(uint64_t a1, void *a2)
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

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4_144(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v5 != objc_msgSend(*(id *)(a1 + 32), "limit"))
  {
    v7 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "ne_records");
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = v9;
    if (v8)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__2706;
      v36 = __Block_byref_object_dispose__2707;
      v37 = 0;
      objc_msgSend(v9, "db");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = &v32;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke;
      v31[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v31[4] = v7;
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke_2;
      v27 = &unk_1E7E1D840;
      v28 = v8;
      v12 = v10;
      v29 = v12;
      objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM ne_records AS ne CROSS JOIN sources AS src ON ne.source_id = src.id WHERE ne.id = :recordId LIMIT 1"), v31, &v24, 0);

      v13 = (void *)v33[5];
      v14 = v13;

      _Block_object_dispose(&v32, 8);
      if (v14)
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "removeNearDuplicates", v24, v25, v26, v27, v28)
          || !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v13);
          LOBYTE(v24) = 0;
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          v15 = (unsigned __int8 *)MEMORY[0x1E0D81788];
          if (!(_BYTE)v24)
          {
            v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            if (v16 != objc_msgSend(*(id *)(a1 + 32), "limit"))
              v15 = (unsigned __int8 *)MEMORY[0x1E0D81780];
          }
          v6 = *v15;
          goto LABEL_16;
        }
LABEL_15:
        v6 = *MEMORY[0x1E0D81780];
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      v17 = objc_opt_new();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    v20 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "sources", v24, v25, v26, v27, v28);
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    v14 = 0;
    goto LABEL_15;
  }
  v6 = *MEMORY[0x1E0D81788];
LABEL_17:
  objc_autoreleasePoolPop(v4);

  return v6;
}

uint64_t __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":recordId", *(_QWORD *)(a1 + 32));
}

uint64_t __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[PPNamedEntityStorage _createRecordWithStatement:txnWitness:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

id __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_137(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "payloadForString:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D70BC0], "clusterIdentifierFromName:", a2);
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_5()
{
  return objc_msgSend(MEMORY[0x1E0D19E98], "defaultHarvestStore");
}

void __99__PPNamedEntityStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPNamedEntityStorage _asyncProcessNewDKEventDeletions]((uint64_t)WeakRetained);

}

void __69__PPNamedEntityStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "handleWithClient:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ne_records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "numberOfRowsInTable:", v3);

  if (v4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPNamedEntityStorage.m"), 925, CFSTR("negative record count in ne_records"));

LABEL_3:
    pp_entities_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "Skipping initial _DKEvent named entity import because database is nonempty.", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v4)
    goto LABEL_3;
  pp_entities_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "Database is empty; trying to load named entity data in the background from the _DKKnowledgeStore.",
      buf,
      2u);
  }

  v7 = objc_msgSend(*(id *)(a1 + 32), "duetReadBatchSize") + 99999;
  v8 = objc_msgSend(*(id *)(a1 + 32), "duetReadBatchSize");
  v9 = 0;
  v19 = 0;
  v10 = v7 / v8;
  do
  {
    v11 = *(void **)(a1 + 32);
    v12 = objc_msgSend(v11, "duetReadBatchSize");
    if (v11)
      -[PPNamedEntityStorage _importDKEventsWithShouldContinueBlock:remoteEventsOnly:isComplete:shouldContinueBlock:]((uint64_t)v11, v12, 0, (uint64_t)&v19, &__block_literal_global_235);
    ++v9;
    if (v19)
      v13 = 1;
    else
      v13 = v9 >= v10;
  }
  while (!v13);
  if (!v19)
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v9;
      _os_log_fault_impl(&dword_1C392E000, v14, OS_LOG_TYPE_FAULT, "PPNamedEntityStorage:_asyncPopulateDatabaseFromDKEventsIfNecessary terminated due to excessive loop count %tu", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ne_records");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v2, "numberOfRowsInTable:", v15);

  if (v16 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPNamedEntityStorage.m"), 946, CFSTR("negative record count in ne_records"));

  }
  pp_entities_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v16;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "Completed initial _DKEvent named entity import. Database now contains %lld named entity records.", buf, 0xCu);
  }
LABEL_23:

}

uint64_t __77__PPNamedEntityStorage__importDKEventsWithLimit_remoteEventsOnly_isComplete___block_invoke()
{
  return 1;
}

@end
