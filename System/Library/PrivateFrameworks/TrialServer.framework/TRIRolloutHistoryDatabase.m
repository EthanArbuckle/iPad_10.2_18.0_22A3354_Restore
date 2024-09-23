@implementation TRIRolloutHistoryDatabase

- (TRIRolloutHistoryDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIRolloutHistoryDatabase *v7;
  TRIRolloutHistoryDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIRolloutHistoryDatabase;
  v7 = -[TRIRolloutHistoryDatabase init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- (BOOL)addRecord:(id)a3
{
  id v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[4];
  __CFString *v11;
  id v12;
  TRIRolloutHistoryDatabase *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__TRIRolloutHistoryDatabase_addRecord___block_invoke;
  v10[3] = &unk_1E932F240;
  v11 = CFSTR(" INSERT INTO rolloutHistory(    eventLogTime,     eventType,     rolloutId,     rampId,     deploymentId,     factorPackSetId) VALUES(    :event_log_time,     :event_type,     :rollout_id,     :ramp_id,     :dep_id,     :fps_id);");
  v6 = v5;
  v12 = v6;
  v13 = self;
  v14 = &v15;
  -[TRIRolloutHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v10);
  v7 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __39__TRIRolloutHistoryDatabase_addRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  unsigned __int8 *v18;
  uint64_t v19;
  NSObject *v20;
  id obj;
  uint64_t v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_2;
  v29[3] = &unk_1E932F1F0;
  v5 = *(_QWORD *)(a1 + 32);
  v30 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v5, v29, 0, v6);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "lastInsertRowId");

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "namespaces");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D8232A5C]();
          v14 = v3;
          objc_msgSend(v3, "db");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_3;
          v24[3] = &unk_1E932F218;
          v24[4] = v12;
          v24[5] = v23;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO rolloutHistoryNamespaces(    rolloutHistory_rowid,     name) VALUES(    :rollout_rowid,     :name);"),
                  v24,
                  0,
                  v16);

          if ((v17 & 1) == 0)
          {
            TRILogCategory_Server();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218243;
              v32 = v23;
              v33 = 2113;
              v34 = v12;
              _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_INFO, "TRIRolloutHistoryDatabase failed to insert rowId: %lld, namespace name:%{private}@", buf, 0x16u);
            }

            v19 = *MEMORY[0x1E0D81680];
            objc_autoreleasePoolPop(v13);

            v3 = v14;
            goto LABEL_16;
          }
          objc_autoreleasePoolPop(v13);
          ++v11;
          v3 = v14;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        if (v9)
          continue;
        break;
      }
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v18 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    v18 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  v19 = *v18;
LABEL_16:

  return v19;
}

void __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "eventLogTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":event_log_time");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":event_type", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  objc_msgSend(*(id *)(a1 + 32), "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":rollout_id", v6);

  objc_msgSend(*(id *)(a1 + 32), "rampId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":ramp_id", v7);

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":dep_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(*(id *)(a1 + 32), "factorPackSetId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":fps_id", v8);

}

void __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rollout_rowid", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));

}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  void *v31;
  void *v32;
  void *context;
  void *v34;
  _QWORD v35[4];
  id v36;
  TRIRolloutHistoryDatabase *v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  SEL v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t *v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v34 = v10;
  if ((v9 == 0) != (v10 == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  context = (void *)MEMORY[0x1D8232A5C]();
  v13 = (void *)objc_opt_new();
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy_;
  v65 = __Block_byref_object_dispose_;
  v14 = MEMORY[0x1E0C809B0];
  v66 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v60[3] = &unk_1E932F268;
  v60[4] = &v61;
  v15 = (void *)MEMORY[0x1D8232C48](v60);
  v56[0] = v14;
  v56[1] = 3221225472;
  v56[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v56[3] = &unk_1E932F290;
  v59 = &v61;
  v16 = v13;
  v57 = v16;
  v17 = v12;
  v58 = v17;
  v18 = (void *)MEMORY[0x1D8232C48](v56);
  v54[0] = v14;
  v54[1] = 3221225472;
  v54[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3;
  v54[3] = &unk_1E932F2B8;
  v55 = v16;
  v19 = v16;
  v20 = (void *)MEMORY[0x1D8232C48](v54);

  _Block_object_dispose(&v61, 8);
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  LOBYTE(v64) = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0x8000000000000000;
  v43[0] = v14;
  v43[1] = 3221225472;
  v43[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4;
  v43[3] = &unk_1E932F2E0;
  v47 = &v50;
  v21 = v18;
  v48 = &v61;
  v49 = a2;
  v43[4] = self;
  v44 = v21;
  v22 = v15;
  v45 = v22;
  v23 = v20;
  v46 = v23;
  v24 = (void *)MEMORY[0x1D8232C48](v43);

  _Block_object_dispose(&v50, 8);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  LOBYTE(v53) = 0;
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5;
  v35[3] = &unk_1E932F308;
  v25 = v9;
  v36 = v25;
  v26 = v34;
  v38 = v26;
  v27 = v24;
  v39 = v27;
  v37 = self;
  v28 = v21;
  v40 = v28;
  v41 = &v61;
  v42 = &v50;
  -[TRIRolloutHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v35);
  v29 = *((_BYTE *)v51 + 24);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v61, 8);

  objc_autoreleasePoolPop(context);
  return v29;
}

void __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v6 = (void *)objc_msgSend(v3, "copyWithReplacementNamespaces:", v5);

    if (!*a2)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "rowid", "rolloutHistory");
  if (v4 != *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
    if (*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
    {
      v5 = *MEMORY[0x1E0D81788];
      goto LABEL_12;
    }
    objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "eventLogTime", "rolloutHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIRolloutHistoryDatabase.m"), 176, CFSTR("nil eventLogTime read from NOT NULL column"));

    }
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "doubleValue");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");

    v9 = objc_msgSend(v3, "getInt64ForColumnName:table:", "eventType", "rolloutHistory");
    objc_msgSend(v3, "getNSStringForColumnName:table:", "rolloutId", "rolloutHistory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIRolloutHistoryDatabase.m"), 181, CFSTR("nil rolloutId read from NOT NULL column"));

    }
    objc_msgSend(v3, "getNSStringForColumnName:table:", "rampId", "rolloutHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentId", "rolloutHistory");
    objc_msgSend(v3, "getNSStringForColumnName:table:", "factorPackSetId", "rolloutHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0DC0B70]);
    v15 = (void *)objc_msgSend(v14, "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", v8, v9, v10, v11, v13, v12, MEMORY[0x1E0C9AA60]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "name", "rolloutHistoryNamespaces");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    (*(void (**)(void))(a1[7] + 16))();
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
  v5 = *MEMORY[0x1E0D81780];

LABEL_12:
  return v5;
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 *v12;
  NSObject *v13;
  uint8_t buf[16];

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (const __CFString *)a1[4];
  if (!v6)
    v6 = &stru_1E9336E60;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM     rolloutHistory AS rh LEFT JOIN     rolloutHistoryNamespaces AS n ON     rh.rowid = n.rolloutHistory_rowid %@ ORDER BY     rh.eventLogTime ASC,     n.rowid ASC;"),
                 v6);
  objc_msgSend(v4, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = a1[6];
  v9 = a1[7];
  objc_msgSend(*(id *)(a1[5] + 8), "generalErrorHandlerWithOutError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v10, v9, v11);

  if ((_DWORD)v9)
  {
    (*(void (**)(void))(a1[8] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
    v12 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 0;
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_INFO, "TRIRolloutHistoryDatabase failed to enumerate records", buf, 2u);
    }

    v12 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v12;
}

- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__TRIRolloutHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke;
  v15[3] = &unk_1E932F1F0;
  v16 = v7;
  v10 = v7;
  v11 = -[TRIRolloutHistoryDatabase _enumerateRecordsMatchingWhereClause:bind:block:](self, "_enumerateRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE rh.eventLogTime > :threshold"), v15, v9);

  return v11;
}

void __65__TRIRolloutHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");

}

- (id)getAllAllocationStatusesForRolloutId:(id)a3 rampId:(id)a4 deploymentId:(int)a5 factorPackSetId:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  TRIRolloutHistoryDatabase *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  _QWORD v36[3];
  char v37;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId"));

  }
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = "rolloutHistory";
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = (id)objc_opt_new();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke;
  v20[3] = &unk_1E932F380;
  v25 = v36;
  v14 = v11;
  v21 = v14;
  v15 = v12;
  v22 = v15;
  v28 = a5;
  v16 = v13;
  v26 = v35;
  v27 = &v29;
  v23 = v16;
  v24 = self;
  -[TRIRolloutHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v20);
  v17 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);

  return v17;
}

uint64_t __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  int v15;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_2;
  v11[3] = &unk_1E932F330;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v15 = *(_DWORD *)(a1 + 88);
  v14 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0, v4, 3221225472, __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_3, &unk_1E932F358, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v11[0], 3221225472, __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_2, &unk_1E932F330);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM rolloutHistory WHERE         rolloutId = :rollout_id    AND rampId = :ramp_id    AND deploymentId = :deployment_id    AND factorPackSetId = :factor_pack_set_id ORDER BY rowid DESC"), v11, &v10, v5);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v8 = v7;
  else
    v8 = v6;
  return *v8;
}

void __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":rollout_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":ramp_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", *(int *)(a1 + 56));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":factor_pack_set_id", *(_QWORD *)(a1 + 48));

}

uint64_t __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "getInt64ForColumnName:table:", "eventType", "rolloutHistory");
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return *MEMORY[0x1E0D81780];
}

- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4
{
  id v7;
  id v8;
  char v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutHistoryDatabase.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E932F3A8;
  v12[4] = self;
  v8 = v7;
  v14 = &v16;
  v15 = a4;
  v13 = v8;
  -[TRIRolloutHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  int v16;
  _QWORD *v17;
  unsigned __int8 *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  v28 = &unk_1E932F1F0;
  v29 = v4;
  objc_msgSend(v5, "createTempTableContainingRowsFromQuery:bind:namePrefix:transaction:", CFSTR(" SELECT rowid FROM         rolloutHistory WHERE         eventLogTime < :threshold"), &v25, CFSTR("remove_hist_rowids"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
      *(_DWORD *)buf = 134217984;
      v31 = v20;
      _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_INFO, "TRIRolloutHistoryDatabase: failed to expire records for threshold date: %f", buf, 0xCu);
    }

    goto LABEL_11;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR(" DELETE FROM     rolloutHistoryNamespaces WHERE     rolloutHistory_rowid IN %@;"),
                 v6,
                 v25,
                 v26,
                 v27,
                 v28);
  objc_msgSend(v3, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, v10);

  if ((v11 & 1) == 0)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v23 = "TRIRolloutHistoryDatabase: failed to delete row from RolloutHistoryNamespaces";
LABEL_17:
      _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_INFO, v23, buf, 2u);
    }
LABEL_18:

    v21 = *MEMORY[0x1E0D81680];
    goto LABEL_19;
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     rolloutHistory WHERE     rowid IN %@;"),
                 v6);
  objc_msgSend(v3, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, v13);

  if ((v14 & 1) == 0)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v23 = "RolloutHistoryDatabase: Failed to delete row from rolloutHistory";
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  objc_msgSend(v3, "db");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = sqlite3_changes((sqlite3 *)objc_msgSend(v15, "handle"));

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dropTableWithName:transaction:", v6, v3))
  {
    v17 = *(_QWORD **)(a1 + 56);
    if (v17)
      *v17 = v16;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v18 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    goto LABEL_12;
  }
LABEL_11:
  v18 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_12:
  v21 = *v18;
LABEL_19:

  return v21;
}

void __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
