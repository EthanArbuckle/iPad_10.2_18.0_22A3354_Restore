@implementation TRIBackgroundMLTaskHistoryDatabase

- (TRIBackgroundMLTaskHistoryDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIBackgroundMLTaskHistoryDatabase *v7;
  TRIBackgroundMLTaskHistoryDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIBackgroundMLTaskHistoryDatabase;
  v7 = -[TRIBackgroundMLTaskHistoryDatabase init](&v11, sel_init);
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
  TRIBackgroundMLTaskHistoryDatabase *v13;
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke;
  v10[3] = &unk_1E9335FD8;
  v14 = &v15;
  v11 = CFSTR(" INSERT INTO backgroundMlTaskHistory(    eventSecondsFromEpoch,     eventType,     backgroundMlTaskId,     deploymentId,     factorPackSetId) VALUES(    :timestamp,     :event_type,     :background_ml_task_id,     :deployment_id,     :factor_pack_set_id);");
  v6 = v5;
  v12 = v6;
  v13 = self;
  -[TRIBackgroundMLTaskHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v10);
  v7 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke_2;
  v10[3] = &unk_1E932F1F0;
  v4 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, v10, 0, v5);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v8 = v7;
  else
    v8 = v6;
  return *v8;
}

void __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "eventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":event_type", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":background_ml_task_id", v6);

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(*(id *)(a1 + 32), "factorPackSetId");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":factor_pack_set_id", v7);

}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  TRIBackgroundMLTaskHistoryDatabase *v24;
  id v25;
  id v26;
  uint64_t *v27;
  SEL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v13 = (void *)MEMORY[0x1D8232A5C]();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v22[3] = &unk_1E9336000;
  v14 = v9;
  v23 = v14;
  v15 = v10;
  v28 = a2;
  v24 = self;
  v25 = v15;
  v16 = v12;
  v26 = v16;
  v27 = &v29;
  v17 = (void *)MEMORY[0x1D8232C48](v22);
  -[TRIBackgroundMLTaskHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v17);
  v18 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  objc_autoreleasePoolPop(v13);

  return v18;
}

uint64_t __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (const __CFString *)a1[4];
  if (!v6)
    v6 = &stru_1E9336E60;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM     backgroundMlTaskHistory %@ ORDER BY     eventSecondsFromEpoch ASC,     rowid ASC;"),
                 v6);
  objc_msgSend(v3, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v28[3] = &unk_1E932F420;
  v9 = a1[5];
  v10 = a1[6];
  v30 = a1[9];
  v28[4] = v9;
  v11 = v4;
  v29 = v11;
  objc_msgSend(*(id *)(a1[5] + 8), "generalErrorHandlerWithOutError:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v10, v28, v12);

  v27 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
LABEL_5:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v17)
        objc_enumerationMutation(v14);
      if (v27)
        break;
      (*(void (**)(void))(a1[7] + 16))();
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v16)
          goto LABEL_5;
        break;
      }
    }
  }

  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v13;
  v19 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v20 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if (v13)
    v21 = v19;
  else
    v21 = v20;
  return *v21;
}

uint64_t __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 *v13;
  void *v15;
  void *v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "eventSecondsFromEpoch", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 109, CFSTR("nil eventSecondsFromEpoch read from NOT NULL column"));

  }
  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v5, "doubleValue");
  v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSince1970:");

  v8 = objc_msgSend(v3, "getInt64ForColumnName:table:", "eventType", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "backgroundMlTaskId", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 115, CFSTR("Unexpected NULL backgroundMLTaskId"));

  }
  v10 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentId", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "factorPackSetId", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC09B8]), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  v13 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  objc_autoreleasePoolPop(v4);
  return *v13;
}

- (id)getAllAllocationStatusesForBMLTId:(id)a3 deploymentId:(int)a4 factorPackSetId:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  TRIBackgroundMLTaskHistoryDatabase *v22;
  _QWORD *v23;
  int v24;
  _QWORD v25[3];
  char v26;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltId"));

  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v11 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke;
  v18[3] = &unk_1E9336028;
  v23 = v25;
  v12 = v9;
  v19 = v12;
  v24 = a4;
  v13 = v10;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  v22 = self;
  -[TRIBackgroundMLTaskHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v18);
  v15 = v14;

  _Block_object_dispose(v25, 8);
  return v15;
}

uint64_t __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_2;
  v12[3] = &unk_1E9331478;
  v13 = *(id *)(a1 + 32);
  v15 = *(_DWORD *)(a1 + 72);
  v14 = *(id *)(a1 + 40);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_3;
  v10[3] = &unk_1E93331E0;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0, v4, 3221225472, __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_3, &unk_1E93331E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM backgroundMlTaskHistory WHERE         backgroundMlTaskId = :background_ml_task_id    AND deploymentId = :deployment_id    AND factorPackSetId = :factor_pack_set_id ORDER BY rowid DESC"), v12, v10, v5);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v8 = v7;
  else
    v8 = v6;
  return *v8;
}

void __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":background_ml_task_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", *(int *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":factor_pack_set_id", *(_QWORD *)(a1 + 40));

}

uint64_t __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "getInt64ForColumnName:table:", "eventType", "backgroundMlTaskHistory");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return *MEMORY[0x1E0D81780];
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
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__TRIBackgroundMLTaskHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke;
  v15[3] = &unk_1E932F1F0;
  v16 = v7;
  v10 = v7;
  v11 = -[TRIBackgroundMLTaskHistoryDatabase _enumerateRecordsMatchingWhereClause:bind:block:](self, "_enumerateRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE eventSecondsFromEpoch > :threshold"), v15, v9);

  return v11;
}

void __74__TRIBackgroundMLTaskHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");

}

- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4
{
  id v7;
  id v8;
  char v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  TRIBackgroundMLTaskHistoryDatabase *v14;
  uint64_t *v15;
  unint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskHistoryDatabase.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E932F3A8;
  v8 = v7;
  v13 = v8;
  v14 = self;
  v15 = &v17;
  v16 = a4;
  -[TRIBackgroundMLTaskHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  int v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  v13[3] = &unk_1E932F1F0;
  v14 = *(id *)(a1 + 32);
  v4 = (void *)MEMORY[0x1D8232C48](v13);
  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     backgroundMLTaskHistory WHERE         eventSecondsFromEpoch < :threshold"), v4, 0, v6);

  if (v7)
  {
    objc_msgSend(v3, "db");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = sqlite3_changes((sqlite3 *)objc_msgSend(v8, "handle"));

    v10 = *(_QWORD **)(a1 + 56);
    if (v10)
      *v10 = v9;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v11 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    v11 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v11;
}

void __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
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
