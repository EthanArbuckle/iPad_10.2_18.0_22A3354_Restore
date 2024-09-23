@implementation PPSourceStorage

- (PPSourceStorage)initWithDatabase:(id)a3
{
  id v5;
  PPSourceStorage *v6;
  PPSourceStorage *v7;
  PPContactStorage *v8;
  PPContactStorage *contactStorage;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSourceStorage;
  v6 = -[PPSourceStorage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    v8 = -[PPContactStorage initWithDatabase:foundInAppsHarvestStoreGetter:]([PPContactStorage alloc], "initWithDatabase:foundInAppsHarvestStoreGetter:", v7->_db, &__block_literal_global_13732);
    contactStorage = v7->_contactStorage;
    v7->_contactStorage = v8;

  }
  return v7;
}

- (BOOL)iterSourcesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  PPContactStorage *contactStorage;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  PPSQLDatabase *db;
  id v38;
  id v39;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  PPSourceStorage *v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[4];
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[4];
  id v57;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1C3BD6630]();
  if (objc_msgSend(v7, "limit"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v7, "fromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      v13 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(CFSTR("SELECT * FROM sources AS src WHERE 1 "), "stringByAppendingString:", CFSTR("AND src.seconds_from_1970 >= :fromDateEpoch "));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = v12;
      aBlock[1] = 3221225472;
      aBlock[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke;
      aBlock[3] = &unk_1E7E1F040;
      v57 = v7;
      v15 = _Block_copy(aBlock);
      objc_msgSend(v10, "addObject:", v15);

      objc_autoreleasePoolPop(v13);
    }
    else
    {
      v14 = CFSTR("SELECT * FROM sources AS src WHERE 1 ");
    }
    objc_msgSend(v7, "toDate", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1C3BD6630]();
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("AND src.seconds_from_1970 <= :toDateEpoch "));
      v18 = objc_claimAutoreleasedReturnValue();

      v54[0] = v12;
      v54[1] = 3221225472;
      v54[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_2;
      v54[3] = &unk_1E7E1F040;
      v55 = v7;
      v19 = _Block_copy(v54);
      objc_msgSend(v10, "addObject:", v19);

      objc_autoreleasePoolPop(v17);
      v14 = (__CFString *)v18;
    }
    v20 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingBundleIds");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("AND src.bundle_id IN _pas_nsset(:matchingBundleIds) "));
      v22 = objc_claimAutoreleasedReturnValue();

      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_3;
      v52[3] = &unk_1E7E1F040;
      v53 = v21;
      v23 = _Block_copy(v52);
      objc_msgSend(v10, "addObject:", v23);

      v14 = (__CFString *)v22;
    }

    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingDocumentIds");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("AND src.doc_id IN _pas_nsset(:matchingDocumentIds) "));
      v26 = objc_claimAutoreleasedReturnValue();

      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_4;
      v50[3] = &unk_1E7E1F040;
      v51 = v25;
      v27 = _Block_copy(v50);
      objc_msgSend(v10, "addObject:", v27);

      v14 = (__CFString *)v26;
    }

    objc_autoreleasePoolPop(v24);
    v28 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "matchingContactHandle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      contactStorage = self->_contactStorage;
      objc_msgSend(v7, "matchingContactHandle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage sourcesForContactHandle:](contactStorage, "sourcesForContactHandle:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[PPSourceStorage whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:](self, "whereSourceIdInSubclauseWithSourceIds:tableNameAlias:binders:", v33, CFSTR("src"), v10);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v14 = (__CFString *)v35;
    }
    objc_autoreleasePoolPop(v28);
    -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("ORDER BY src.seconds_from_1970 DESC "));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v49[3] = 0;
    db = self->_db;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_5;
    v42[3] = &unk_1E7E1F0D0;
    v38 = v36;
    v43 = v38;
    v39 = v10;
    v44 = v39;
    v48 = v49;
    v45 = v7;
    v46 = self;
    v47 = v8;
    -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 8, v42);

    _Block_object_dispose(v49, 8);
    v9 = v41;
  }
  objc_autoreleasePoolPop(v9);

  return 1;
}

- (id)whereSourceIdInSubclauseWithSourceIds:(id)a3 tableNameAlias:(id)a4 binders:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  id v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v18;
  _QWORD aBlock[4];
  id v20;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSourceStorage.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceIds"));

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = CFSTR("sources");
    if (v10)
      v14 = v10;
    v15 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR(" AND %@.id IN _pas_nsset(:sourceIdSet) "), v14);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PPSourceStorage_whereSourceIdInSubclauseWithSourceIds_tableNameAlias_binders___block_invoke;
    aBlock[3] = &unk_1E7E1F040;
    v20 = v12;
    v16 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v16);

  }
  else
  {
    v15 = CFSTR(" AND sources.id IN () ");
  }

  return v15;
}

- (id)loadSourcesWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 txnWitness:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v13, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke;
  v27[3] = &unk_1E7E1A800;
  v28 = v10;
  v29 = v11;
  v30 = v12;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke_2;
  v24[3] = &unk_1E7E1DB68;
  v24[4] = self;
  v25 = v13;
  v16 = v14;
  v26 = v16;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM sources WHERE bundle_id = :bundleId AND group_id = :groupId AND doc_id = :docId"), v27, v24, 0);

  v21 = v26;
  v22 = v16;

  return v22;
}

- (id)createSourceWithStatement:(id)a3 txnWitness:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "nonnullNSStringForColumnName:table:", "bundle_id", "sources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNSStringForColumnName:table:", "group_id", "sources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonnullNSStringForColumnName:table:", "doc_id", "sources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDoubleForColumnName:table:", "seconds_from_1970", "sources");
  v12 = v11;
  v13 = fabs(v11);
  if (v13 < INFINITY || v13 > INFINITY)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v12);
    v22 = v6;
    if ((objc_msgSend(v5, "isNullForColumnName:table:", "relevance_seconds_from_1970", "sources") & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v5, "getDoubleForColumnName:table:", "relevance_seconds_from_1970", "sources");
      v16 = 0;
      if (fabs(v17) != INFINITY)
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v17);
    }
    objc_msgSend(v5, "getNSStringForColumnName:table:", "language", "sources");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", objc_msgSend(v5, "getInt64ForColumnName:table:", "dwell_time_seconds", "sources"), objc_msgSend(v5, "getInt64ForColumnName:table:", "length_seconds", "sources"), objc_msgSend(v5, "getInt64ForColumnName:table:", "length_characters", "sources"), (unsigned __int16)objc_msgSend(v5, "getInt64ForColumnName:table:", "donation_count", "sources"), (unsigned __int16)objc_msgSend(v5, "getInt64ForColumnName:table:", "contact_handle_count", "sources"), objc_msgSend(v5, "getInt64ForColumnName:table:", "flags", "sources"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C78]), "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v8, v9, v10, v21, v16, 0, v18, v19);

    v6 = v22;
  }
  else
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPSourceStorage createSourceWithStatement got NaN or Inf secondsFrom1970", buf, 2u);
    }

    v15 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v15;
}

- (int64_t)updateOrCreateRowForSource:(id)a3 addingRefCount:(int64_t)a4 txnWitness:(id)a5
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  PPContactStorage *contactStorage;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[7];
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  int64_t v42;
  _QWORD v43[6];
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v9 = a3;
  v10 = a5;
  if (a4 > 0)
  {
    if (v9)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSourceStorage.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    if (v10)
      goto LABEL_4;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSourceStorage.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("refCount > 0"));

  if (!v9)
    goto LABEL_19;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSourceStorage.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("txnWitness"));

LABEL_4:
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (fabs(v13) != INFINITY)
  {
    objc_msgSend(v9, "sha256");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0x7FFFFFFFFFFFFFFFLL;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v10, "db");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke;
    v44[3] = &unk_1E7E1F040;
    v18 = v15;
    v45 = v18;
    v43[0] = v17;
    v43[1] = 3221225472;
    v43[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_2;
    v43[3] = &unk_1E7E1A828;
    v43[4] = &v50;
    v43[5] = &v46;
    objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id, ref_count FROM sources WHERE sha256 = :sha256"), v44, v43, 0);

    if (v51[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "relevanceDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "relevanceDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSince1970");
        objc_msgSend(v20, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v10, "db");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v17;
      v38[1] = 3221225472;
      v38[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_3;
      v38[3] = &unk_1E7E1DB40;
      v42 = a4;
      v23 = v9;
      v39 = v23;
      v24 = v19;
      v40 = v24;
      v41 = v18;
      objc_msgSend(v22, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR ABORT INTO sources (ref_count, bundle_id, group_id, doc_id, seconds_from_1970, relevance_seconds_from_1970, sha256, dwell_time_seconds, length_seconds, length_characters, donation_count, language, flags, contact_handle_count) VALUES (:refCount, :bundleId, :groupId, :docId, :timestamp, :relevanceTimestamp, :sha256, :dwellTimeSeconds, :lengthSeconds, :lengthCharacters, :donationCount, :language, :flags, :contactHandleCount)"), v38, 0, 0);

      objc_msgSend(v10, "db");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "lastInsertRowId");
      v51[3] = v26;

      if (v51[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSourceStorage.m"), 289, CFSTR("Failed to insert new source row"));

      }
      objc_msgSend(v23, "contactHandles");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28)
      {
        contactStorage = self->_contactStorage;
        objc_msgSend(v23, "contactHandles");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPContactStorage storeHandleSourceMapWithHandles:sourceId:txnWitness:](contactStorage, "storeHandleSourceMapWithHandles:sourceId:txnWitness:", v30, v51[3], v10);

      }
    }
    else
    {
      if (v47[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSourceStorage.m"), 294, CFSTR("Failed to load preexisting source ref_count"));

      }
      objc_msgSend(v10, "db");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v37[0] = v17;
      v37[1] = 3221225472;
      v37[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_4;
      v37[3] = &unk_1E7E1A850;
      v37[4] = &v46;
      v37[5] = &v50;
      v37[6] = a4;
      objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE sources SET ref_count = :refCount, donation_count = donation_count + 1 WHERE id = :rowId"), v37, 0, 0);
    }

    v14 = v51[3];
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);

  }
  return v14;
}

- (int64_t)pruneSourcesWithNoReferencesWithTxnWitness:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  int64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(v4, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__PPSourceStorage_pruneSourcesWithNoReferencesWithTxnWitness___block_invoke;
  v13[3] = &unk_1E7E1BB80;
  v13[4] = &v14;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) as count FROM sources WHERE ref_count <= 0"), 0, v13, 0);

  if (!v15[3])
    goto LABEL_10;
  objc_msgSend(v4, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepAndRunNonDataQueries:onError:", &unk_1E7E5B5D8, 0);

  v7 = -[PPContactStorage pruneOrphanedHandlesWithTxnWitness:](self->_contactStorage, "pruneOrphanedHandlesWithTxnWitness:", v4);
  if (v7)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v7;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted %lld contact handles", buf, 0xCu);
    }
  }
  else
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted 0 contact handles", buf, 2u);
    }
  }

  if (v15[3])
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v15[3];
      *(_DWORD *)buf = 134217984;
      v19 = v10;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted %lld sources", buf, 0xCu);
    }
  }
  else
  {
LABEL_10:
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted 0 sources", buf, 2u);
    }
  }

  v11 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStorage, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

uint64_t __62__PPSourceStorage_pruneSourcesWithNoReferencesWithTxnWitness___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "count");
  return *MEMORY[0x1E0D81788];
}

uint64_t __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSData:", ":sha256", *(_QWORD *)(a1 + 32));
}

uint64_t __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 0);
  v4 = objc_msgSend(v3, "getInt64ForColumn:", 1);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return *MEMORY[0x1E0D81788];
}

void __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":refCount", v3);
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", v5);

  objc_msgSend(*(id *)(a1 + 32), "groupId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":groupId", v6);

  objc_msgSend(*(id *)(a1 + 32), "documentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":docId", v7);

  objc_msgSend(*(id *)(a1 + 32), "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");

  objc_msgSend(v4, "bindNamedParam:toDoubleAsNSNumber:", ":relevanceTimestamp", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":sha256", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":dwellTimeSeconds", objc_msgSend(v9, "dwellTimeSeconds"));

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":lengthSeconds", objc_msgSend(v10, "lengthSeconds"));

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":lengthCharacters", objc_msgSend(v11, "lengthCharacters"));

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":donationCount", 1);
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":contactHandleCount", objc_msgSend(v12, "contactHandleCount"));

  objc_msgSend(*(id *)(a1 + 32), "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":language", v13);

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":flags", objc_msgSend(v14, "flags"));

}

void __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6] + *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":refCount", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));

}

void __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":groupId", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":docId", a1[6]);

}

uint64_t __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(*(id *)(a1 + 32), "createSourceWithStatement:txnWitness:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __80__PPSourceStorage_whereSourceIdInSubclauseWithSourceIds_tableNameAlias_binders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":sourceIdSet", *(_QWORD *)(a1 + 32));
}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
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

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":matchingDocumentIds", *(_QWORD *)(a1 + 32));
}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_6;
  v17[3] = &unk_1E7E1F040;
  v6 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_7;
  v11[3] = &unk_1E7E1A7D8;
  v16 = *(_QWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 64);
  v12 = v7;
  v13 = v8;
  v14 = v3;
  v15 = v9;
  v10 = v3;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v6, v17, v11, 0);

}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_6(uint64_t a1, void *a2)
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

uint64_t __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[16];

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v5 == objc_msgSend(*(id *)(a1 + 32), "limit"))
  {
    v6 = *MEMORY[0x1E0D81788];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "createSourceWithStatement:txnWitness:", v3, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if (v9 != objc_msgSend(*(id *)(a1 + 32), "limit"))
        v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
      v6 = *v8;
    }
    else
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "failed to create source while iterating.", buf, 2u);
      }

      v6 = *MEMORY[0x1E0D81780];
    }

  }
  objc_autoreleasePoolPop(v4);

  return v6;
}

uint64_t __36__PPSourceStorage_initWithDatabase___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D19E98], "defaultHarvestStore");
}

+ (double)matchAccuracyForSecondsFrom1970
{
  return 1.0;
}

@end
