@implementation PPTopicStorage

void __118__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
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

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned int *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:groupIds:algorithm:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, v6, a2, v7, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
}

void __108__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
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
  v30 = __Block_byref_object_copy__19200;
  v31 = __Block_byref_object_dispose__19201;
  v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __108__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
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
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v20);
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 algorithm:(unint64_t)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14;
  id v15;
  PPSQLDatabase *db;
  id v17;
  id v18;
  void *v19;
  char v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  BOOL *v28;
  unint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v14 = a3;
  v15 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__19200;
  v34 = __Block_byref_object_dispose__19201;
  v35 = 0;
  db = self->_db;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __118__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v22[3] = &unk_1E7E1DA18;
  v25 = &v36;
  v22[4] = self;
  v17 = v14;
  v23 = v17;
  v18 = v15;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v24 = v18;
  v26 = &v30;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v22);
  if (a8)
  {
    v19 = (void *)v31[5];
    if (v19)
      *a8 = objc_retainAutorelease(v19);
  }
  v20 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

void __99__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_atLeastOneTopicRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
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

void __109__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = *(unsigned int *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:algorithm:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, a2, v6, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
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
  v25 = __Block_byref_object_copy__19200;
  v26 = __Block_byref_object_dispose__19201;
  v27 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v16[3] = &unk_1E7E1D9A0;
  v18 = &v28;
  v16[4] = self;
  v12 = v10;
  v20 = a4;
  v21 = a5;
  v17 = v12;
  v19 = &v22;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v16);
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 algorithm:(unint64_t)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  PPSQLDatabase *db;
  id v14;
  void *v15;
  char v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  BOOL *v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v12 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__19200;
  v29 = __Block_byref_object_dispose__19201;
  v30 = 0;
  db = self->_db;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v18[3] = &unk_1E7E1D9C8;
  v20 = &v31;
  v18[4] = self;
  v14 = v12;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v19 = v14;
  v21 = &v25;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v18);
  if (a7)
  {
    v15 = (void *)v26[5];
    if (v15)
      *a7 = objc_retainAutorelease(v15);
  }
  v16 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (PPTopicStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v14;
  id v15;
  PPTopicStorage *v16;
  PPTopicStorage *v17;
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
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTopicStorage.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v38.receiver = self;
  v38.super_class = (Class)PPTopicStorage;
  v16 = -[PPTopicStorage init](&v38, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_db, a3);
    objc_storeStrong((id *)&v17->_dkStorage, a5);
    v18 = -[PPSourceStorage initWithDatabase:]([PPSourceStorage alloc], "initWithDatabase:", v17->_db);
    sourceStorage = v17->_sourceStorage;
    v17->_sourceStorage = v18;

    v20 = [PPRecordStorageHelper alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tp_records");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    dkStorage = v17->_dkStorage;
    -[PPDKStorage topicStream](dkStorage, "topicStream");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PPRecordStorageHelper initWithName:table:clusterIdentifierColumn:maxRecords:duetStorage:duetStream:sourceStorage:](v20, "initWithName:table:clusterIdentifierColumn:maxRecords:duetStorage:duetStream:sourceStorage:", CFSTR("Topic"), v21, CFSTR("topic_id"), v10, dkStorage, v23, v17->_sourceStorage);
    storageHelper = v17->_storageHelper;
    v17->_storageHelper = (PPRecordStorageHelper *)v24;

    objc_storeStrong((id *)&v17->_trialWrapper, a7);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.PersonalizationPortrait.Topic.PopulateDatabaseQueue", 9);
    v26 = objc_claimAutoreleasedReturnValue();
    populateDatabaseQueue = v17->_populateDatabaseQueue;
    v17->_populateDatabaseQueue = (OS_dispatch_queue *)v26;

    v28 = v17->_dkStorage;
    if (v8 && v28)
    {
      v29 = v17->_populateDatabaseQueue;
      block[0] = (id)MEMORY[0x1E0C809B0];
      block[1] = (id)3221225472;
      block[2] = __63__PPTopicStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke;
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
      v36[2] = __93__PPTopicStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke;
      v36[3] = &unk_1E7E1D758;
      objc_copyWeak(&v37, block);
      -[PPDKStorage registerForTopicsRemoteDeletionWithBlock:](v30, "registerForTopicsRemoteDeletionWithBlock:", v36);
      v31 = objc_claimAutoreleasedReturnValue();
      deletionObserver = v17->_deletionObserver;
      v17->_deletionObserver = (id)v31;

      objc_destroyWeak(&v37);
      objc_destroyWeak(block);
    }
    -[PPTopicStorage _asyncProcessNewDKEventDeletions]((uint64_t)v17);
  }

  return v17;
}

- (PPTopicStorage)initWithDatabase:(id)a3
{
  id v4;
  PPTrialWrapper *v5;
  void *v6;
  void *v7;
  PPTrialWrapper *v8;
  void *v9;
  PPTopicStorage *v10;

  v4 = a3;
  v5 = [PPTrialWrapper alloc];
  v6 = (void *)objc_opt_new();
  +[PPTrialWrapper sharedTrialClient](PPTrialWrapper, "sharedTrialClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPTrialWrapper initWithSettings:database:trialClient:](v5, "initWithSettings:database:trialClient:", v6, v4, v7);

  +[PPDKStorage sharedInstance](PPDKStorage, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPTopicStorage initWithDatabase:maxRecords:dkStorage:loadEmptyDatabaseFromDK:trialWrapper:](self, "initWithDatabase:maxRecords:dkStorage:loadEmptyDatabaseFromDK:trialWrapper:", v4, 15000, v9, 1, v8);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PPDKStorage removeObserver:](self->_dkStorage, "removeObserver:", self->_deletionObserver);
  v3.receiver = self;
  v3.super_class = (Class)PPTopicStorage;
  -[PPTopicStorage dealloc](&v3, sel_dealloc);
}

- (NSString)parentDirectory
{
  return (NSString *)-[PPSQLDatabase parentDirectory](self->_db, "parentDirectory");
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  PPContactStorage *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  PPTrialWrapper *trialWrapper;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  PPSQLDatabase *db;
  id v76;
  NSObject *v77;
  PPSQLDatabase *v78;
  BOOL v79;
  NSObject *v80;
  uint64_t v82;
  const __CFString *v83;
  void *v84;
  void *context;
  _QWORD v86[6];
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  PPTopicStorage *v91;
  id v92;
  id v93;
  _QWORD *v94;
  uint64_t *v95;
  uint8_t *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  _QWORD v103[4];
  _QWORD v104[5];
  uint8_t v105[8];
  uint8_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD aBlock[4];
  id v130;
  uint8_t buf[4];
  uint64_t v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  context = (void *)MEMORY[0x1C3BD6630]();
  if (objc_msgSend(v7, "limit"))
  {
    v84 = v8;
    v9 = CFSTR("ORDER BY topic_id ASC, src.seconds_from_1970 DESC");
    v10 = CFSTR("INNER JOIN");
    if ((objc_msgSend(v7, "orderByIdentifier") & 1) == 0 && !objc_msgSend(v7, "removeNearDuplicates"))
    {
      v10 = CFSTR("CROSS JOIN");
      v9 = CFSTR("ORDER BY src.seconds_from_1970 DESC");
    }
    v83 = v9;
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT tp.id, src.id FROM sources AS src %@ tp_records AS tp ON tp.source_id = src.id WHERE 1 "), v10);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v7, "fromDate");
    v8 = v84;
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1C3BD6630]();
      if (objc_msgSend(v7, "filterByRelevanceDate"))
        v15 = CFSTR("AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) >= :fromDateEpoch ");
      else
        v15 = CFSTR("AND src.seconds_from_1970 >= :fromDateEpoch ");
      objc_msgSend(v11, "stringByAppendingString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke;
      aBlock[3] = &unk_1E7E1F040;
      v130 = v7;
      v17 = _Block_copy(aBlock);
      objc_msgSend(v12, "addObject:", v17);

      objc_autoreleasePoolPop(v14);
      v11 = (id)v16;
    }
    objc_msgSend(v7, "toDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1C3BD6630]();
      if (objc_msgSend(v7, "filterByRelevanceDate"))
        v20 = CFSTR("AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) <= :toDateEpoch ");
      else
        v20 = CFSTR("AND src.seconds_from_1970 <= :toDateEpoch ");
      objc_msgSend(v11, "stringByAppendingString:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2;
      v127[3] = &unk_1E7E1F040;
      v128 = v7;
      v22 = _Block_copy(v127);
      objc_msgSend(v12, "addObject:", v22);

      objc_autoreleasePoolPop(v19);
      v11 = (id)v21;
    }
    if (objc_msgSend(v7, "deviceFilter"))
    {
      v23 = (void *)MEMORY[0x1C3BD6630]();
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AND tp.is_remote = %u "), objc_msgSend(v7, "deviceFilter") == 2);
      objc_msgSend(v11, "stringByAppendingString:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v23);
      v11 = (id)v25;
    }
    if (objc_msgSend(v7, "excludeWithoutSentiment"))
    {
      v26 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND tp.sentiment_score != 0 "));
      v27 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v26);
      v11 = (id)v27;
    }
    v28 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingDocumentIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND src.doc_id IN _pas_nsset(:matchingDocumentIds) "));
      v30 = objc_claimAutoreleasedReturnValue();

      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = 3221225472;
      v125[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3;
      v125[3] = &unk_1E7E1F040;
      v126 = v29;
      v31 = _Block_copy(v125);
      objc_msgSend(v12, "addObject:", v31);

      v11 = (id)v30;
    }

    objc_autoreleasePoolPop(v28);
    v32 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingSourceBundleIds");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND src.bundle_id IN _pas_nsset(:matchingSourceBundleIds) "));
      v34 = objc_claimAutoreleasedReturnValue();

      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4;
      v123[3] = &unk_1E7E1F040;
      v124 = v33;
      v35 = _Block_copy(v123);
      objc_msgSend(v12, "addObject:", v35);

      v11 = (id)v34;
    }

    objc_autoreleasePoolPop(v32);
    v36 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "excludingSourceBundleIds");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND src.bundle_id NOT IN _pas_nsset(:excludingSourceBundleIds) "));
      v38 = objc_claimAutoreleasedReturnValue();

      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_5;
      v121[3] = &unk_1E7E1F040;
      v122 = v37;
      v39 = _Block_copy(v121);
      objc_msgSend(v12, "addObject:", v39);

      v11 = (id)v38;
    }

    objc_autoreleasePoolPop(v36);
    v40 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingContactHandle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length") == 0;

    if (!v42)
    {
      v43 = -[PPContactStorage initWithDatabase:foundInAppsHarvestStoreGetter:]([PPContactStorage alloc], "initWithDatabase:foundInAppsHarvestStoreGetter:", self->_db, &__block_literal_global_19322);
      objc_msgSend(v7, "matchingContactHandle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage sourcesForContactHandle:](v43, "sourcesForContactHandle:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[PPSourceStorage whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:](self->_sourceStorage, "whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:", v45, CFSTR("src"), v12);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", v46);
      v47 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v47;
    }
    objc_autoreleasePoolPop(v40);
    v48 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingGroupIds");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND src.group_id IN _pas_nsset(:matchingGroupIds) "));
      v50 = objc_claimAutoreleasedReturnValue();

      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_7;
      v119[3] = &unk_1E7E1F040;
      v120 = v49;
      v51 = _Block_copy(v119);
      objc_msgSend(v12, "addObject:", v51);

      v11 = (id)v50;
    }

    objc_autoreleasePoolPop(v48);
    v52 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingAlgorithms");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND tp.algorithm IN _pas_nsset(:matchingAlgorithms) "));
      v54 = objc_claimAutoreleasedReturnValue();

      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_8;
      v117[3] = &unk_1E7E1F040;
      v118 = v53;
      v55 = _Block_copy(v117);
      objc_msgSend(v12, "addObject:", v55);

      v11 = (id)v54;
    }

    objc_autoreleasePoolPop(v52);
    v56 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "excludingAlgorithms");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND tp.algorithm NOT IN _pas_nsset(:excludingAlgorithms) "));
      v58 = objc_claimAutoreleasedReturnValue();

      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_9;
      v115[3] = &unk_1E7E1F040;
      v116 = v57;
      v59 = _Block_copy(v115);
      objc_msgSend(v12, "addObject:", v59);

      v11 = (id)v58;
    }

    objc_autoreleasePoolPop(v56);
    v60 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingTopicIds");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "count"))
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND tp.topic_id IN _pas_nsset(:matchingTopicIds) "));
      v62 = objc_claimAutoreleasedReturnValue();

      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_10;
      v113[3] = &unk_1E7E1F040;
      v114 = v61;
      v63 = _Block_copy(v113);
      objc_msgSend(v12, "addObject:", v63);

      v11 = (id)v62;
    }

    objc_autoreleasePoolPop(v60);
    v64 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingTopicTrie");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      trialWrapper = self->_trialWrapper;
      objc_msgSend(v7, "matchingTopicTrie");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPTrialWrapper trieForFactorName:namespaceName:](trialWrapper, "trieForFactorName:namespaceName:", v67, CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v68)
      {
        pp_default_log_handle();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v105 = 0;
          _os_log_fault_impl(&dword_1C392E000, v80, OS_LOG_TYPE_FAULT, "Failed to load topic trie, stops this query.", v105, 2u);
        }

        objc_autoreleasePoolPop(v64);
        v79 = 0;
        goto LABEL_47;
      }
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("AND _pas_block(:matchingTopicTrieBlock, tp.topic_id) "));
      v69 = objc_claimAutoreleasedReturnValue();

      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_125;
      v111[3] = &unk_1E7E1F040;
      v112 = v68;
      v70 = v68;
      v71 = _Block_copy(v111);
      objc_msgSend(v12, "addObject:", v71);

      v11 = (id)v69;
    }
    objc_autoreleasePoolPop(v64);
    v72 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v11, "stringByAppendingString:", v83);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v72);
    *(_QWORD *)v105 = 0;
    v106 = v105;
    v107 = 0x3032000000;
    v108 = __Block_byref_object_copy__19200;
    v109 = __Block_byref_object_dispose__19201;
    v110 = 0;
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_130;
    v104[3] = &unk_1E7E1D7C8;
    v104[4] = v105;
    v74 = _Block_copy(v104);
    v103[0] = 0;
    v103[1] = v103;
    v103[2] = 0x2020000000;
    v103[3] = 0;
    v97 = 0;
    v98 = &v97;
    v99 = 0x3032000000;
    v100 = __Block_byref_object_copy__19200;
    v101 = __Block_byref_object_dispose__19201;
    v102 = 0;
    db = self->_db;
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_132;
    v87[3] = &unk_1E7E1D818;
    v11 = v73;
    v88 = v11;
    v89 = v12;
    v94 = v103;
    v90 = v7;
    v91 = self;
    v95 = &v97;
    v8 = v84;
    v76 = v74;
    v92 = v76;
    v96 = v105;
    v93 = v84;
    -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 2, v87);
    if (v98[5])
    {
      pp_default_log_handle();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      {
        v82 = objc_msgSend((id)v98[5], "count");
        *(_DWORD *)buf = 134217984;
        v132 = v82;
        _os_log_fault_impl(&dword_1C392E000, v77, OS_LOG_TYPE_FAULT, "iterTopicRecordsWithQuery encountered %tu sources which did not validate; deleting associated topic records now.",
          buf,
          0xCu);
      }

      v78 = self->_db;
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_140;
      v86[3] = &unk_1E7E1F148;
      v86[4] = self;
      v86[5] = &v97;
      -[PPSQLDatabase writeTransactionWithClient:block:](v78, "writeTransactionWithClient:block:", 2, v86);
    }

    _Block_object_dispose(&v97, 8);
    _Block_object_dispose(v103, 8);

    _Block_object_dispose(v105, 8);
    v79 = 1;
LABEL_47:

    goto LABEL_48;
  }
  v79 = 1;
LABEL_48:
  objc_autoreleasePoolPop(context);

  return v79;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return -[PPRecordStorageHelper clearWithDatabase:client:deletedCount:error:clearExternalTableReferences:](self->_storageHelper, "clearWithDatabase:client:deletedCount:error:clearExternalTableReferences:", self->_db, 2, a4, a3, 0);
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 decayRate:(double)a7 sentimentScore:(double)a8 exactMatchesInSourceText:(id)a9 error:(id *)a10
{
  id v18;
  id v19;
  id v20;
  BOOL v21;
  PPSQLDatabase *db;
  int v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  PPTopicStorage *v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  unint64_t v36;
  double v37;
  double v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a9;
  v21 = 1;
  if (objc_msgSend(v18, "count"))
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 1;
    db = self->_db;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __114__PPTopicStorage_donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_error___block_invoke;
    v30 = &unk_1E7E1D900;
    v35 = &v40;
    v31 = self;
    v32 = v18;
    v33 = v19;
    v36 = a5;
    v39 = a6;
    v37 = a7;
    v38 = a8;
    v34 = v20;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, &v27);
    v23 = *((unsigned __int8 *)v41 + 24);
    if (a10 && !*((_BYTE *)v41 + 24))
    {
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = CFSTR("The donated data is invalid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1, v27, v28, v29, v30, v31, v32, v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *a10 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 9, v25);

      v23 = *((unsigned __int8 *)v41 + 24);
    }
    v21 = v23 != 0;

    _Block_object_dispose(&v40, 8);
  }

  return v21;
}

- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3
{
  return -[PPRecordStorageHelper decayedFeedbackCountsForItemString:database:client:](self->_storageHelper, "decayedFeedbackCountsForItemString:database:client:", a3, self->_db, 2);
}

- (BOOL)donateTopicFeedback:(id)a3
{
  return -[PPRecordStorageHelper storeFeedback:database:client:lowercaseItemStrings:limit:](self->_storageHelper, "storeFeedback:database:client:lowercaseItemStrings:limit:", a3, self->_db, 2, 0, 2500);
}

- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4
{
  int v7;

  do
    v7 = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  while (v7
       && !-[PPRecordStorageHelper decayFeedbackWithDatabase:client:decayRate:](self->_storageHelper, "decayFeedbackWithDatabase:client:decayRate:", self->_db, 2, a3));
  return v7;
}

- (BOOL)deleteAllTopicsOlderThanDate:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
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
  v13[2] = __89__PPTopicStorage_deleteAllTopicsOlderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E7E1F248;
  v13[4] = self;
  v14 = v9;
  v15 = a4;
  v16 = a5;
  v11 = v9;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v13);

  return 1;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
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
  v25 = __Block_byref_object_copy__19200;
  v26 = __Block_byref_object_dispose__19201;
  v27 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__PPTopicStorage_deleteAllTopicsWithTopicId_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v16[3] = &unk_1E7E1D9A0;
  v18 = &v28;
  v16[4] = self;
  v12 = v10;
  v20 = a4;
  v21 = a5;
  v17 = v12;
  v19 = &v22;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v16);
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

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 algorithm:(unint64_t)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  PPSQLDatabase *db;
  id v14;
  void *v15;
  char v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  BOOL *v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v12 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__19200;
  v29 = __Block_byref_object_dispose__19201;
  v30 = 0;
  db = self->_db;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__PPTopicStorage_deleteAllTopicsWithTopicId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v18[3] = &unk_1E7E1D9C8;
  v20 = &v31;
  v18[4] = self;
  v14 = v12;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v19 = v14;
  v21 = &v25;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v18);
  if (a7)
  {
    v15 = (void *)v26[5];
    if (v15)
      *a7 = objc_retainAutorelease(v15);
  }
  v16 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
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
  v30 = __Block_byref_object_copy__19200;
  v31 = __Block_byref_object_dispose__19201;
  v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
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
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v20);
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 algorithm:(unint64_t)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14;
  id v15;
  PPSQLDatabase *db;
  id v17;
  id v18;
  void *v19;
  char v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  BOOL *v28;
  unint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v14 = a3;
  v15 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__19200;
  v34 = __Block_byref_object_dispose__19201;
  v35 = 0;
  db = self->_db;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v22[3] = &unk_1E7E1DA18;
  v25 = &v36;
  v22[4] = self;
  v17 = v14;
  v23 = v17;
  v18 = v15;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v24 = v18;
  v26 = &v30;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v22);
  if (a8)
  {
    v19 = (void *)v31[5];
    if (v19)
      *a8 = objc_retainAutorelease(v19);
  }
  v20 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
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
  v35 = __Block_byref_object_copy__19200;
  v36 = __Block_byref_object_dispose__19201;
  v37 = 0;
  db = self->_db;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
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
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v24);
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 algorithm:(unint64_t)a6 atLeastOneTopicRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  PPSQLDatabase *db;
  id v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  BOOL *v32;
  unint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__19200;
  v38 = __Block_byref_object_dispose__19201;
  v39 = 0;
  db = self->_db;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __131__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v25[3] = &unk_1E7E1DA68;
  v29 = &v40;
  v25[4] = self;
  v19 = v15;
  v26 = v19;
  v20 = v16;
  v27 = v20;
  v21 = v17;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v28 = v21;
  v30 = &v34;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v25);
  if (a9)
  {
    v22 = (void *)v35[5];
    if (v22)
      *a9 = objc_retainAutorelease(v22);
  }
  v23 = *((_BYTE *)v41 + 24);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v23;
}

- (BOOL)deleteAllTopicFeedbackCountRecordsOlderThanDate:(id)a3
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
  v8[2] = __66__PPTopicStorage_deleteAllTopicFeedbackCountRecordsOlderThanDate___block_invoke;
  v8[3] = &unk_1E7E1F2E8;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v8);
  LOBYTE(db) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

- (BOOL)pruneOrphanedTopicFeedbackCountRecordsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
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
  v9[2] = __100__PPTopicStorage_pruneOrphanedTopicFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke;
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

  -[PPTopicStorage _asyncProcessNewDKEventDeletions]((uint64_t)self);
  -[PPTopicStorage _deletionQueue](self);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_224);

}

- (void)importRemotelyGeneratedTopicDKEventsWithLimit:(unsigned int)a3 isComplete:(BOOL *)a4 shouldContinueBlock:(id)a5
{
  -[PPTopicStorage _importDKEventsWithShouldContinueBlock:remoteEventsOnly:isComplete:shouldContinueBlock:]((uint64_t)self, *(uint64_t *)&a3, 1, (uint64_t)a4, (uint64_t)a5);
}

- (void)exportRecordsToDKWithShouldContinueBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  uint64_t v5;
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
  _QWORD v24[4];
  id v25;
  PPTopicStorage *v26;
  id v27;
  _QWORD v28[4];
  __CFString *v29;
  id v30;
  _QWORD *v31;
  unsigned int v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD aBlock[4];
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[5];
  id v48;
  _QWORD v49[3];
  int v50;
  _QWORD v51[3];
  int v52;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (self->_dkStorage)
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      if (!v4[2](v4))
        break;
      v6 = -[PPDKStorage topicWriteBatchSize](self->_dkStorage, "topicWriteBatchSize");
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v52 = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v50 = 0;
      v47[0] = 0;
      v47[1] = v47;
      v47[2] = 0x3032000000;
      v47[3] = __Block_byref_object_copy__19200;
      v47[4] = __Block_byref_object_dispose__19201;
      v48 = 0;
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x2020000000;
      v46[3] = 0;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0x7FFFFFFFFFFFFFFFLL;
      v7 = (void *)objc_opt_new();
      aBlock[0] = v5;
      aBlock[1] = 3221225472;
      aBlock[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke;
      aBlock[3] = &unk_1E7E1DBB8;
      v41 = v47;
      v8 = v7;
      v40 = v8;
      v42 = v45;
      v43 = v49;
      v44 = v46;
      v9 = _Block_copy(aBlock);
      v33[0] = v5;
      v33[1] = 3221225472;
      v33[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2;
      v33[3] = &unk_1E7E1DBE0;
      v35 = v51;
      v36 = v47;
      v10 = v9;
      v34 = v10;
      v37 = v46;
      v38 = v45;
      v11 = _Block_copy(v33);
      db = self->_db;
      v28[0] = v5;
      v28[1] = 3221225472;
      v28[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3;
      v28[3] = &unk_1E7E1DC30;
      v29 = CFSTR("SELECT tp.id, tp.topic_id, src.seconds_from_1970 FROM tp_records AS tp INNER JOIN sources AS src ON tp.source_id = src.id WHERE tp.topic_id NOT IN (SELECT DISTINCT(topic_id) FROM tp_records WHERE is_remote = 0 AND dk_event_id IS NOT NULL) AND tp.is_remote = 0 AND tp.is_sync_eligible = 1 ORDER BY tp.topic_id ASC");
      v13 = v11;
      v30 = v13;
      v31 = v49;
      v32 = v6;
      -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 2, v28);
      v14 = objc_msgSend(v8, "count");
      if (v14 < v6)
        v10[2](v10);
      v15 = v6;
      v16 = v30;
      v17 = v8;

      _Block_object_dispose(v45, 8);
      _Block_object_dispose(v46, 8);
      _Block_object_dispose(v47, 8);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(v51, 8);
      v18 = (void *)objc_opt_new();
      v19 = self->_db;
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke;
      v24[3] = &unk_1E7E1DB90;
      v25 = v17;
      v26 = self;
      v27 = v18;
      v20 = v18;
      v21 = v17;
      -[PPSQLDatabase writeTransactionWithClient:timeoutInSeconds:block:](v19, "writeTransactionWithClient:timeoutInSeconds:block:", 2, v24, 2.5);
      dkStorage = self->_dkStorage;
      -[PPDKStorage topicStream](dkStorage, "topicStream");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPDKStorage saveEvents:stream:maxRetries:retryInterval:shouldContinueBlock:](dkStorage, "saveEvents:stream:maxRetries:retryInterval:shouldContinueBlock:", v20, v23, -1, v4, 5.0);

    }
    while (v14 >= v15);
  }

}

- (void)clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:(id)a3
{
  -[PPRecordStorageHelper deleteAllRemoteRecordsMissingInDuetFromDatabase:client:shouldContinueBlock:](self->_storageHelper, "deleteAllRemoteRecordsMissingInDuetFromDatabase:client:shouldContinueBlock:", self->_db, 2, a3);
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
      v8 = -[PPDKStorage topicWriteBatchSize](self->_dkStorage, "topicWriteBatchSize");
      v9[4] = self;
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke;
      v10[3] = &unk_1E7E1DC58;
      v10[4] = self;
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2;
      v9[3] = &unk_1E7E1DC80;
    }
    while (!-[PPRecordStorageHelper fixupDKEventsWithDatabase:fixup49995922Table:batchSize:shouldContinueBlock:createRecordWithStatement:eventForRecord:](storageHelper, "fixupDKEventsWithDatabase:fixup49995922Table:batchSize:shouldContinueBlock:createRecordWithStatement:eventForRecord:", db, CFSTR("tp_dk_fixup_49995922"), v8, v4, v10, v9));
  }

}

- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3
{
  -[PPRecordStorageHelper fixupDKEventsMetadataWithShouldContinueBlock:database:client:](self->_storageHelper, "fixupDKEventsMetadataWithShouldContinueBlock:database:client:", a3, self->_db, 2);
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
    v6[2] = __42__PPTopicStorage_disableSyncForBundleIds___block_invoke;
    v6[3] = &unk_1E7E1DCA8;
    v6[4] = self;
    v7 = v5;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v6);

  }
}

- (unsigned)duetReadBatchSize
{
  return -[PPDKStorage readBatchSize](self->_dkStorage, "readBatchSize");
}

- (unsigned)duetWriteBatchSize
{
  return -[PPDKStorage topicWriteBatchSize](self->_dkStorage, "topicWriteBatchSize");
}

- (double)duetWriteBatchInterval
{
  double result;

  -[PPDKStorage topicWriteBatchInterval](self->_dkStorage, "topicWriteBatchInterval");
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
  v18 = __Block_byref_object_copy__19200;
  v19 = __Block_byref_object_dispose__19201;
  v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PPTopicStorage_sourceStats_withExcludedAlgorithms___block_invoke;
  v11[3] = &unk_1E7E1F2C0;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = a3;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 2, v11);
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
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT source_id FROM tp_records WHERE algorithm NOT IN (%@)"), v9);

    +[PPSQLDatabase createTempViewContainingRowsFromQuery:descriptiveTableName:txnWitness:](PPSQLDatabase, "createTempViewContainingRowsFromQuery:descriptiveTableName:txnWitness:", v10, CFSTR("topic_sourceids"), v6);
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

void __53__PPTopicStorage_sourceStats_withExcludedAlgorithms___block_invoke(uint64_t a1, void *a2)
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
    v4 = CFSTR("tp_records");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sourceStats:forTableWithName:txnWitness:", *(_QWORD *)(a1 + 56), v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (v3)
    +[PPSQLDatabase dropViewWithName:txnWitness:](PPSQLDatabase, "dropViewWithName:txnWitness:", v3, v8);

}

uint64_t __42__PPTopicStorage_disableSyncForBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "disableSyncForBundleIds:txnWitness:", *(_QWORD *)(a1 + 40), a2);
}

id __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[PPTopicStorage _createRecordWithStatement:txnWitness:](*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "eventForTopicRecord:sourceDeviceID:", a2, 0);
}

- (id)_createRecordWithStatement:(void *)a3 txnWitness:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  BOOL v30;
  double v31;
  void *v32;
  unsigned __int16 v33;
  void *v34;
  void *v35;
  unsigned __int16 v36;
  void *v37;
  void *v38;
  unsigned __int16 v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  unsigned __int16 v46;
  id v47;
  void *v48;
  uint8_t buf[16];

  v5 = a2;
  if (a1)
  {
    v6 = a3;
    objc_msgSend(v5, "nonnullNSStringForColumnName:table:", "topic_id", "tp_records");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "getInt64ForColumnName:table:", "algorithm", "tp_records");
    objc_msgSend(v5, "getDoubleForColumnName:table:", "initial_score", "tp_records");
    v10 = fabs(v9);
    v11 = v10 < INFINITY;
    v12 = v10 <= INFINITY;
    v13 = 0.0;
    if (v11)
      v13 = v9;
    if (v12)
      v14 = v13;
    else
      v14 = v9;
    objc_msgSend(v5, "getDoubleForColumnName:table:", "decay_rate", "tp_records");
    v16 = fabs(v15);
    v17 = v16 <= INFINITY;
    if (v16 >= INFINITY)
      v18 = *MEMORY[0x1E0D70F28];
    else
      v18 = v15;
    if (v17)
      v19 = v18;
    else
      v19 = v15;
    objc_msgSend(v5, "getNSStringForColumnName:table:", "extraction_os_build", "tp_records");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getInt64AsNSNumberForColumnName:table:", "extraction_asset_version", "tp_records");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      v23 = objc_msgSend(v21, "unsignedLongValue");
    else
      v23 = 0xFFFFFFFFLL;
    objc_msgSend(v5, "getDoubleForColumnName:table:", "sentiment_score", "tp_records");
    v25 = v24;
    v26 = objc_msgSend(v5, "getInt64ForColumnName:table:", "is_remote", "tp_records");
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v7);
    objc_msgSend(*(id *)(a1 + 40), "createSourceWithStatement:txnWitness:", v5, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = fabs(v25);
      v11 = v29 < INFINITY;
      v30 = v29 <= INFINITY;
      v31 = 0.0;
      if (v11)
        v31 = v25;
      if (v30)
        v25 = v31;
      v32 = (void *)objc_opt_new();
      objc_msgSend(v32, "setTopic:", v27);
      objc_msgSend(v32, "setSource:", v28);
      objc_msgSend(v32, "setAlgorithm:", v8);
      objc_msgSend(v32, "setInitialScore:", v14);
      objc_msgSend(v32, "setDecayRate:", v19);
      objc_msgSend(v32, "setExtractionOsBuild:", v20);
      objc_msgSend(v32, "setExtractionAssetVersion:", v23);
      objc_msgSend(v32, "setIsLocal:", v26 == 0);
      objc_msgSend(v32, "setSentimentScore:", v25);
      v47 = objc_alloc(MEMORY[0x1E0D70CC0]);
      v46 = objc_msgSend(v5, "getInt64ForColumnName:table:", "impression_count", "tp_records");
      v48 = v7;
      v33 = objc_msgSend(v5, "getInt64ForColumnName:table:", "occurrences_in_source", "tp_records");
      v34 = v22;
      v35 = v20;
      v36 = objc_msgSend(v5, "getInt64ForColumnName:table:", "algorithm_result_position", "tp_records");
      v37 = v28;
      v38 = v27;
      v39 = objc_msgSend(v5, "getInt64ForColumnName:table:", "algorithm_result_count", "tp_records");
      v40 = objc_msgSend(v5, "getInt64ForColumnName:table:", "exact_match_in_source_text", "tp_records") != 0;
      v41 = v36;
      v20 = v35;
      v22 = v34;
      v42 = v39;
      v27 = v38;
      v28 = v37;
      v43 = (void *)objc_msgSend(v47, "initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:", v46, v33, v41, v42, v40);
      objc_msgSend(v32, "setMetadata:", v43);

      v7 = v48;
    }
    else
    {
      pp_topics_log_handle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v44, OS_LOG_TYPE_ERROR, "Suppressing construction of topic record due to source with bogus date.", buf, 2u);
      }

      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
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
  v11[2] = __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2;
  v11[3] = &unk_1E7E1F040;
  v12 = *(id *)(a1 + 32);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3;
  v8[3] = &unk_1E7E1DB68;
  v6 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM tp_records AS tp JOIN sources AS src ON tp.source_id = src.id WHERE tp.id IN _pas_nsarray(:rowIds)"), v11, v8, 0);

}

uint64_t __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3(uint64_t a1, void *a2)
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
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t v22;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = v4;
  if (v3)
  {
    v7 = a2;
    v8 = objc_msgSend(v7, "getInt64ForColumnName:table:", "id", "tp_records");
    -[PPTopicStorage _createRecordWithStatement:txnWitness:](v3, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(v3 + 16), "eventForTopicRecord:sourceDeviceID:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShouldSync:", 1);
      objc_msgSend(v6, "db");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __55__PPTopicStorage__populateEvents_statement_txnWitness___block_invoke;
      v20 = &unk_1E7E1F220;
      v12 = v10;
      v21 = v12;
      v22 = v8;
      v13 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE tp_records SET dk_event_id = :uuidBlob WHERE id = :rowid"), &v17, 0, 0);

      if (v13)
        objc_msgSend(v5, "addObject:", v12, v17, v18, v19, v20);
      v14 = *MEMORY[0x1E0D81780];

    }
    else
    {
      pp_topics_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "failed to create topic record from statement during _populateEvents", (uint8_t *)&v17, 2u);
      }

      v14 = *MEMORY[0x1E0D81780];
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __55__PPTopicStorage__populateEvents_statement_txnWitness___block_invoke(uint64_t a1, void *a2)
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

void __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

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

    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
}

void __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double v13;
  id v14;

  v14 = a3;
  ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) && (objc_msgSend(v14, "isEqualToString:") & 1) == 0)
    (*(void (**)(void))(a1[4] + 16))();
  v8 = *(_QWORD *)(a1[6] + 8);
  v10 = *(_QWORD *)(v8 + 40);
  v9 = (id *)(v8 + 40);
  if (v10)
  {
    v11 = *(_QWORD *)(a1[7] + 8);
    v13 = *(double *)(v11 + 24);
    v12 = (double *)(v11 + 24);
    if (v13 >= a4)
      goto LABEL_9;
  }
  else
  {
    objc_storeStrong(v9, a3);
    v12 = (double *)(*(_QWORD *)(a1[7] + 8) + 24);
  }
  *v12 = a4;
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a2;
LABEL_9:

}

void __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3(uint64_t a1, void *a2)
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
  v7[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4;
  v7[3] = &unk_1E7E1DC08;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v7, 0);

}

uint64_t __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;

  v3 = a2;
  objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "tp_records");
  objc_msgSend(v3, "getNSStringForColumnName:table:", "topic_id", "tp_records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnName:table:", "seconds_from_1970", "sources");
  v6 = v5;

  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6);
  LODWORD(v3) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  LODWORD(a1) = *(_DWORD *)(a1 + 48);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if (v3 >= a1)
    v9 = v8;
  else
    v9 = v7;
  return *v9;
}

- (uint64_t)_importDKEventsWithShouldContinueBlock:(uint64_t)a3 remoteEventsOnly:(uint64_t)a4 isComplete:(uint64_t)a5 shouldContinueBlock:
{
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  if (result)
  {
    v6 = *(void **)(result + 32);
    v7 = *(_QWORD *)(result + 8);
    v8[1] = 3221225472;
    v8[2] = __105__PPTopicStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke;
    v8[3] = &unk_1E7E1DB18;
    v8[4] = result;
    v8[0] = MEMORY[0x1E0C809B0];
    return objc_msgSend(v6, "importDuetEventsWithLimit:database:client:remoteEventsOnly:isComplete:shouldContinueBlock:eventImportBlock:", a2, v7, 2, a3, a4, a5, v8);
  }
  return result;
}

void __105__PPTopicStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  if (v6)
  {
    objc_msgSend(*(id *)(v6 + 16), "topicRecordFromEvent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = *(void **)(v6 + 40);
      objc_msgSend(v10, "source");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "updateOrCreateRowForSource:addingRefCount:txnWitness:", v13, 1, v9);

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        pp_topics_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17[0]) = 0;
          _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "Suppressing topic DKEvent import due to source with bogus date.", (uint8_t *)v17, 2u);
        }

      }
      else
      {
        objc_msgSend(v9, "db");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __77__PPTopicStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness___block_invoke;
        v17[3] = &unk_1E7E1DB40;
        v18 = v11;
        v21 = v14;
        v19 = v7;
        v20 = v8;
        objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO tp_records (topic_id, algorithm, initial_score, decay_rate, sentiment_score,     extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible,     dk_event_id, exact_match_in_source_text) VALUES (:topic_id, :algorithm, :initialScore, :decayRate, :sentimentScore, :osBuild,     :assetVersion, :sourceRowId, :isRemote, 0, :uuidBlob, :exactMatchInSourceText)"), v17, 0, 0);

      }
    }

  }
}

void __77__PPTopicStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":topic_id", v4);

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":algorithm", objc_msgSend(*(id *)(a1 + 32), "algorithm"));
  objc_msgSend(*(id *)(a1 + 32), "initialScore");
  objc_msgSend(v9, "bindNamedParam:toDouble:", ":initialScore");
  objc_msgSend(*(id *)(a1 + 32), "decayRate");
  objc_msgSend(v9, "bindNamedParam:toDouble:", ":decayRate");
  objc_msgSend(*(id *)(a1 + 32), "sentimentScore");
  objc_msgSend(v9, "bindNamedParam:toDouble:", ":sentimentScore");
  objc_msgSend(*(id *)(a1 + 32), "extractionOsBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":osBuild", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion") == -1)
    objc_msgSend(v9, "bindNamedParamToNull:", ":assetVersion");
  else
    objc_msgSend(v9, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":sourceRowId", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":isRemote", v7 != 0);

  objc_msgSend(v9, "bindNamedParam:toNSData:", ":uuidBlob", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":exactMatchInSourceText", objc_msgSend(v8, "exactMatchInSourceText"));

}

- (void)_asyncProcessNewDKEventDeletions
{
  void *v2;
  NSObject *queue;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      -[PPTopicStorage _deletionQueue]((id)a1);
      queue = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "duetEventDeletionProcessingBlockWithDatabase:client:", *(_QWORD *)(a1 + 8), 2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(queue, v2);

    }
  }
}

- (id)_deletionQueue
{
  if (a1)
  {
    if (_deletionQueue__pasOnceToken12 != -1)
      dispatch_once(&_deletionQueue__pasOnceToken12, &__block_literal_global_222);
    a1 = (id)_deletionQueue__pasExprOnceResult_19254;
  }
  return a1;
}

void __32__PPTopicStorage__deletionQueue__block_invoke()
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

  v3 = dispatch_queue_create("PPTopicStorage-_DKEvent-deletion", v2);
  v4 = (void *)_deletionQueue__pasExprOnceResult_19254;
  _deletionQueue__pasExprOnceResult_19254 = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

uint64_t __100__PPTopicStorage_pruneOrphanedTopicFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "pruneOrphanedFeedbackCountRecordsWithLimit:rowOffset:deletedCount:txnWitness:isComplete:", a1[6], a1[7], a1[8], a2, a1[9]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __66__PPTopicStorage_deleteAllTopicFeedbackCountRecordsOlderThanDate___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "deleteFeedbackCountRecordsOlderThanDate:txnWitness:", a1[5], a2);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __131__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id obj;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(unsigned int *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:groupId:olderThanDate:algorithm:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, v6, v7, a2, v8, v9, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
}

void __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
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

void __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
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

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned int *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v4, "deleteAllRecordsSourcedFromBundleId:documentIds:algorithm:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, v6, a2, v7, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
}

void __111__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
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

void __97__PPTopicStorage_deleteAllTopicsWithTopicId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = *(unsigned int *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v4, "deleteAllRecordsWithClusterIdentifier:algorithm:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, v5, a2, v6, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
}

void __87__PPTopicStorage_deleteAllTopicsWithTopicId_atLeastOneTopicRemoved_deletedCount_error___block_invoke(_QWORD *a1, uint64_t a2)
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
  v8 = objc_msgSend(v4, "deleteAllRecordsWithClusterIdentifier:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:error:", v3, a2, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
}

void __89__PPTopicStorage_deleteAllTopicsOlderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke(_QWORD *a1, void *a2)
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
  objc_msgSend(*(id *)(a1[4] + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, v5, a1[6], a1[7]);

}

void __114__PPTopicStorage_donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  NSObject *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  BOOL v91;
  void *v92;
  id obj;
  NSObject *obja;
  char v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  _QWORD v102[4];
  id v103;
  id v104;
  _QWORD v105[5];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  _QWORD v115[4];
  id v116;
  id v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[5];
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  char v131;
  uint8_t buf[128];
  uint64_t v133;

  v3 = a1;
  v133 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v96 = *(_QWORD *)(a1 + 72);
  v95 = *(_BYTE *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a2;
  v97 = v4;
  if (v4)
  {
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke;
    v98[3] = &unk_1E7E1D928;
    v15 = v13;
    v99 = v15;
    v100 = v11;
    v16 = v14;
    v101 = v16;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v98);
    if (objc_msgSend(v15, "count"))
    {
      v81 = v11;
      v83 = v9;
      v84 = v3;
      v79 = v15;
      v17 = v15;
      v82 = v10;
      v18 = v10;
      v80 = v12;
      v19 = v12;
      if (!objc_msgSend(v17, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", sel__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness_, v97, CFSTR("PPTopicStorage.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topics.count > 0"));

      }
      v92 = v16;
      +[PPSettings sharedInstance](PPSettings, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "weightMultiplier");
      v22 = v21;

      v23 = (void *)objc_opt_new();
      v24 = (void *)objc_opt_new();
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v119, buf, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v120 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
            objc_msgSend(v30, "item");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, v31);

            objc_msgSend(v30, "item");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "topicIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v33);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v119, buf, 16);
        }
        while (v27);
      }

      obj = v25;
      v34 = objc_msgSend(v25, "count");
      if (v34 != objc_msgSend(v23, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", sel__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness_, v97, CFSTR("PPTopicStorage.m"), 466, CFSTR("scored topics array contains duplicate topics"));

      }
      v35 = (void *)objc_opt_new();
      v36 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v18, "groupId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("= :groupId");
      if (!v37)
        v38 = CFSTR("IS NULL");
      v39 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("SELECT tp.id, tp.topic_id, tp.initial_score, tp.decay_rate, src.seconds_from_1970 FROM tp_records AS tp INNER JOIN sources AS src ON tp.source_id = src.id WHERE src.bundle_id = :bundleId AND src.group_id %@ AND src.doc_id = :docId AND tp.is_remote = 0 AND tp.algorithm = :algorithm AND tp.topic_id IN _pas_nsset(:uniqueTopicIDs)"), v38);

      objc_msgSend(v19, "db");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = MEMORY[0x1E0C809B0];
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke;
      v115[3] = &unk_1E7E1D888;
      v42 = v18;
      v116 = v42;
      v118 = v96;
      v87 = v24;
      v117 = v87;
      *(_QWORD *)&v110 = v41;
      *((_QWORD *)&v110 + 1) = 3221225472;
      *(_QWORD *)&v111 = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_2;
      *((_QWORD *)&v111 + 1) = &unk_1E7E1D8B0;
      *(_QWORD *)&v112 = v97;
      v43 = v35;
      *((_QWORD *)&v112 + 1) = v43;
      v90 = v42;
      *(_QWORD *)&v113 = v90;
      v114 = v22;
      v85 = v23;
      *((_QWORD *)&v113 + 1) = v85;
      objc_msgSend(v40, "prepAndRunQuery:onPrep:onRow:onError:", v39, v115, &v110, 0);

      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v44 = v43;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v107;
        do
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v107 != v47)
              objc_enumerationMutation(v44);
            v49 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j);
            objc_msgSend(v19, "db");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v105[0] = MEMORY[0x1E0C809B0];
            v105[1] = 3221225472;
            v105[2] = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_3;
            v105[3] = &unk_1E7E1F040;
            v105[4] = v49;
            objc_msgSend(v50, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE tp_records SET initial_score = :initialScore, impression_count = impression_count + 1 WHERE id = :rowId"), v105, 0, 0);

          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
        }
        while (v46);
      }

      v51 = (void *)objc_opt_new();
      v52 = MEMORY[0x1E0C809B0];
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_4;
      v102[3] = &unk_1E7E1D8D8;
      v103 = v85;
      v53 = v51;
      v104 = v53;
      v54 = v85;
      objc_msgSend(obj, "enumerateObjectsUsingBlock:", v102);
      v55 = v104;
      v56 = v53;

      v57 = (void *)MEMORY[0x1E0CB3880];
      *(_QWORD *)&v119 = v52;
      *((_QWORD *)&v119 + 1) = 3221225472;
      *(_QWORD *)&v120 = __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_205;
      *((_QWORD *)&v120 + 1) = &unk_1E7E1D950;
      v58 = v56;
      *(_QWORD *)&v121 = v58;
      objc_msgSend(v57, "predicateWithBlock:", &v119);
      v59 = objc_claimAutoreleasedReturnValue();
      v16 = v92;
      objc_msgSend(v92, "filteredArrayUsingPredicate:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v60;
      v89 = (void *)v59;
      if (objc_msgSend(v60, "count"))
      {
        objc_msgSend(*(id *)(v97 + 32), "truncateRecordsByDroppingOldestMakingRoomForCount:txnWitness:", objc_msgSend(v60, "count"), v19);
        v61 = objc_msgSend(*(id *)(v97 + 40), "updateOrCreateRowForSource:addingRefCount:txnWitness:", v90, objc_msgSend(v60, "count"), v19);
        v62 = v61 != 0x7FFFFFFFFFFFFFFFLL;
        if (v61 == 0x7FFFFFFFFFFFFFFFLL)
        {
          pp_topics_log_handle();
          obja = objc_claimAutoreleasedReturnValue();
          v10 = v82;
          v12 = v80;
          if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C392E000, obja, OS_LOG_TYPE_ERROR, "Suppressing topic donation due to source with bogus date.", buf, 2u);
          }
          v9 = v83;
          v3 = v84;
          v11 = v81;
          v15 = v79;
        }
        else
        {
          v63 = v61;
          v91 = v61 != 0x7FFFFFFFFFFFFFFFLL;
          +[PPSettings sharedInstance](PPSettings, "sharedInstance");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "weightMultiplier");
          v66 = v65;

          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          obja = v60;
          v67 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
          if (v67)
          {
            v68 = v67;
            v86 = v58;
            v69 = *(_QWORD *)v111;
            do
            {
              for (k = 0; k != v68; ++k)
              {
                if (*(_QWORD *)v111 != v69)
                  objc_enumerationMutation(obja);
                v71 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
                objc_msgSend(v71, "first");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "second");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = objc_msgSend(v73, "BOOLValue");

                objc_msgSend(v19, "db");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v123[0] = MEMORY[0x1E0C809B0];
                v123[1] = 3221225472;
                v123[2] = __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_209;
                v123[3] = &unk_1E7E1D978;
                v123[4] = v97;
                v124 = v72;
                v125 = v96;
                v130 = v95;
                v126 = v5;
                v127 = v6;
                v131 = v74;
                v128 = v66;
                v129 = v63;
                v76 = v72;
                objc_msgSend(v75, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO tp_records (topic_id, algorithm, initial_score, decay_rate, sentiment_score,     extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible,     occurrences_in_source, algorithm_result_position, algorithm_result_count, exact_match_in_source_text) VALUES (:topic_id, :algorithm, :initialScore, :decayRate, :sentimentScore,     :osBuild, :assetVersion, :sourceRowId, 0, :shouldSync, :occurrencesInSource,     :algorithmResultPosition, :algorithmResultCount, :exactMatchInSourceText)"), v123, 0, 0);

              }
              v68 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
            }
            while (v68);
            v9 = v83;
            v3 = v84;
            v11 = v81;
            v10 = v82;
            v15 = v79;
            v12 = v80;
            v16 = v92;
            v58 = v86;
          }
          else
          {
            v9 = v83;
            v3 = v84;
            v11 = v81;
            v10 = v82;
            v15 = v79;
            v12 = v80;
          }
          v62 = v91;
        }

      }
      else
      {
        v62 = 1;
        v9 = v83;
        v3 = v84;
        v11 = v81;
        v10 = v82;
        v15 = v79;
        v12 = v80;
      }

    }
    else
    {
      pp_topics_log_handle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v58, OS_LOG_TYPE_DEFAULT, "PPTopicStorage: suppressed all donations as none were non-QID.", buf, 2u);
      }
      v62 = 1;
    }

  }
  else
  {
    v62 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24) = v62;
}

void __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "scoredTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topicIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("Q"));

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v14, "scoredTopic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v11 = objc_alloc(MEMORY[0x1E0D81638]);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFirst:second:", v14, v12);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
  }

}

uint64_t __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_205(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scoredTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsObject:", v5);

  return v6;
}

void __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_209(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  id v26;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "scoredTopic");
  v6 = objc_claimAutoreleasedReturnValue();
  v25 = *(unsigned __int8 *)(a1 + 88);
  v26 = (id)v6;
  v8 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 48);
  v24 = objc_msgSend(*(id *)(a1 + 40), "occurrencesInSource");
  objc_msgSend(*(id *)(a1 + 40), "scoredTopic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "resultPosition");
  objc_msgSend(*(id *)(a1 + 40), "scoredTopic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v11, "resultCount");
  if (v4)
  {
    v12 = *(_QWORD *)(a1 + 80);
    v13 = *(double *)(a1 + 72);
    v23 = *(unsigned __int8 *)(a1 + 89);
    v14 = v26;
    v15 = v5;
    objc_msgSend(v14, "item");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topicIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bindNamedParam:toNSString:", ":topic_id", v17);

    objc_msgSend(v15, "bindNamedParam:toInt64:", ":algorithm", v9);
    objc_msgSend(v14, "score");
    v19 = v18;

    objc_msgSend(v15, "bindNamedParam:toDouble:", ":initialScore", v19 * v13);
    objc_msgSend(v15, "bindNamedParam:toDouble:", ":decayRate", v8);
    objc_msgSend(v15, "bindNamedParam:toDouble:", ":sentimentScore", v7);
    objc_msgSend(MEMORY[0x1E0D70D00], "osBuild");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bindNamedParam:toNSString:", ":osBuild", v20);
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(v4 + 48), "treatmentsHash"));
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":sourceRowId", v12);
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":shouldSync", v25);
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":occurrencesInSource", v24);
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":algorithmResultPosition", v22);
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":algorithmResultCount", v21);
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":exactMatchInSourceText", v23);

  }
}

void __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v7, "bindNamedParam:toNSSet:", ":uniqueTopicIDs", *(_QWORD *)(a1 + 40));

}

uint64_t __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(a1 + 64);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  v8 = a2;
  v9 = v5;
  v10 = v6;
  if (v3)
  {
    v11 = (void *)MEMORY[0x1C3BD6630]();
    v12 = objc_msgSend(v8, "getInt64ForColumnName:table:", "id", "tp_records");
    objc_msgSend(v8, "nonnullNSStringForColumnName:table:", "topic_id", "tp_records");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getDoubleForColumnName:table:", "initial_score", "tp_records");
    v15 = fabs(v14);
    v16 = v15 <= INFINITY;
    if (v15 >= INFINITY)
      v17 = 0.0;
    else
      v17 = v14;
    if (v16)
      v18 = v17;
    else
      v18 = v14;
    objc_msgSend(v8, "getDoubleForColumnName:table:", "decay_rate", "tp_records");
    v20 = fabs(v19);
    v21 = v20 <= INFINITY;
    if (v20 >= INFINITY)
      v22 = *MEMORY[0x1E0D70F28];
    else
      v22 = v19;
    if (v21)
      v23 = v22;
    else
      v23 = v19;
    objc_msgSend(v8, "getDoubleForColumnName:table:", "seconds_from_1970", "sources");
    v25 = fabs(v24);
    v26 = v25 <= INFINITY;
    if (v25 >= INFINITY)
      v27 = 0.0;
    else
      v27 = v24;
    if (v26)
      v28 = v27;
    else
      v28 = v24;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v13);
    objc_msgSend(v10, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v29);
      objc_msgSend(v9, "bundleId");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v50 = v7;
      if (_shouldSuppressRepeatedImpressions___pasOnceToken8 != -1)
        dispatch_once(&_shouldSuppressRepeatedImpressions___pasOnceToken8, &__block_literal_global_168);
      v32 = objc_msgSend((id)_shouldSuppressRepeatedImpressions___pasExprOnceResult_19290, "containsObject:", v31);

      if (v32)
      {
        pp_topics_log_handle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "bundleId");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v52 = v48;
          _os_log_debug_impl(&dword_1C392E000, v33, OS_LOG_TYPE_DEBUG, "Suppressing repeated impressions sourced from %@.", buf, 0xCu);

        }
        v7 = v50;
      }
      else
      {
        v49 = v11;
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v28);
        objc_msgSend(v9, "date");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = v34;
        objc_opt_self();
        objc_msgSend(v35, "timeIntervalSinceDate:", v36);
        v38 = v37;

        if (v38 >= 0.0)
        {
          v39 = 0.0;
          if (v23 >= 0.0)
            v39 = v23;
          v18 = exp(-(v39 * v38)) * v18;
        }

        objc_msgSend(v30, "score");
        v41 = v18 * 0.5 + v40 * v4;
        v42 = (void *)MEMORY[0x1E0D81638];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "tupleWithFirst:second:", v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v45);

        v7 = v50;
        v11 = v49;
      }
    }
    v46 = *MEMORY[0x1E0D81780];

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

void __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_3(uint64_t a1, void *a2)
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

void __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_4(uint64_t a1, void *a2)
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

void __53__PPTopicStorage__shouldSuppressRepeatedImpressions___block_invoke()
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
  v4 = (void *)_shouldSuppressRepeatedImpressions___pasExprOnceResult_19290;
  _shouldSuppressRepeatedImpressions___pasExprOnceResult_19290 = v3;

  objc_autoreleasePoolPop(v0);
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
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

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingDocumentIds", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingSourceBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":excludingSourceBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingGroupIds", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingAlgorithms", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":excludingAlgorithms", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingTopicIds", *(_QWORD *)(a1 + 32));
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_125(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_127;
  v3[3] = &unk_1E7E1D7A0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "bindNamedParam:toBlock:", ":matchingTopicTrieBlock", v3);

}

BOOL __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_130(uint64_t a1, void *a2)
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
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "topic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToTopic:", v8);

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

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_132(uint64_t a1, void *a2)
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
  v23[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_133;
  v23[3] = &unk_1E7E1F040;
  v6 = *(_QWORD *)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4_134;
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

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_140(uint64_t a1, void *a2)
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
  v9[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_144;
  v9[3] = &unk_1E7E1F0F8;
  v9[4] = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_146;
  v7[3] = &unk_1E7E1F120;
  v6 = v4;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM tp_records WHERE source_id IN _pas_nsset(:rowidsForSourcesContainingBadData)"), v9, v7, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, v3, 0, 0);
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_144(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":rowidsForSourcesContainingBadData", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_146(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", "tp_records"));
  return *MEMORY[0x1E0D81780];
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_133(uint64_t a1, void *a2)
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

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4_134(uint64_t a1, void *a2)
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
    v7 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "tp_records");
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = v9;
    if (v8)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__19200;
      v36 = __Block_byref_object_dispose__19201;
      v37 = 0;
      objc_msgSend(v9, "db");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = &v32;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke;
      v31[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v31[4] = v7;
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke_2;
      v27 = &unk_1E7E1D840;
      v28 = v8;
      v12 = v10;
      v29 = v12;
      objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM tp_records AS tp CROSS JOIN sources AS src ON tp.source_id = src.id WHERE tp.id = :recordId LIMIT 1"), v31, &v24, 0);

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

uint64_t __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":recordId", *(_QWORD *)(a1 + 32));
}

uint64_t __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[PPTopicStorage _createRecordWithStatement:txnWitness:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

id __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_127(uint64_t a1, void *a2)
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

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_6()
{
  return objc_msgSend(MEMORY[0x1E0D19E98], "defaultHarvestStore");
}

void __93__PPTopicStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPTopicStorage _asyncProcessNewDKEventDeletions]((uint64_t)WeakRetained);

}

void __63__PPTopicStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "handleWithClient:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tp_records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "numberOfRowsInTable:", v3);

  if (v4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPTopicStorage.m"), 1030, CFSTR("negative record count in tp_records"));

LABEL_3:
    pp_topics_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "Skipping initial _DKEvent topic import because database is nonempty.", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v4)
    goto LABEL_3;
  pp_topics_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "Database is empty; trying to load topic data in the background from the _DKKnowledgeStore.",
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
      -[PPTopicStorage _importDKEventsWithShouldContinueBlock:remoteEventsOnly:isComplete:shouldContinueBlock:]((uint64_t)v11, v12, 0, (uint64_t)&v19, (uint64_t)&__block_literal_global_230);
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
      _os_log_fault_impl(&dword_1C392E000, v14, OS_LOG_TYPE_FAULT, "PPTopicStorage:_asyncPopulateDatabaseFromDKEventsIfNecessary terminated due to excessive loop count %tu", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tp_records");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v2, "numberOfRowsInTable:", v15);

  if (v16 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPTopicStorage.m"), 1050, CFSTR("negative record count in tp_records"));

  }
  pp_topics_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v16;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "Completed initial _DKEvent topic import. Database now contains %lld topic records.", buf, 0xCu);
  }
LABEL_23:

}

uint64_t __71__PPTopicStorage__importDKEventsWithLimit_remoteEventsOnly_isComplete___block_invoke()
{
  return 1;
}

@end
