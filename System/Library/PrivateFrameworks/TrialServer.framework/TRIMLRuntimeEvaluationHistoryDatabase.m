@implementation TRIMLRuntimeEvaluationHistoryDatabase

- (TRIMLRuntimeEvaluationHistoryDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIMLRuntimeEvaluationHistoryDatabase *v7;
  TRIMLRuntimeEvaluationHistoryDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIMLRuntimeEvaluationHistoryDatabase;
  v7 = -[TRIMLRuntimeEvaluationHistoryDatabase init](&v11, sel_init);
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

- (BOOL)addRecord:(id)a3 usingTransaction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  __CFString *v25;
  id v26;
  id v27;
  id v28;
  TRIMLRuntimeEvaluationHistoryDatabase *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  objc_msgSend(v7, "evaluation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 51, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[record.evaluation data]"));

  }
  v11 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v7, "status");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 54, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[NSKeyedArchiver archivedDataWithRootObject:record.status requiringSecureCoding:YES error:nil]"));

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke;
  v24[3] = &unk_1E93305C0;
  v30 = &v31;
  v25 = CFSTR(" INSERT OR REPLACE INTO mlRuntimeEvaluationStatusHistory(    evaluationId,     eventSecondsFromEpoch,     serializedMLRuntimeEvaluation,     serializedEvaluationStatus) VALUES(    :evaluation_id,     :timestamp,     :eval_data,     :status_data);");
  v14 = v7;
  v26 = v14;
  v15 = v10;
  v27 = v15;
  v16 = v13;
  v28 = v16;
  v29 = self;
  v17 = MEMORY[0x1D8232C48](v24);
  v18 = (void *)v17;
  if (v8)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v8);
  else
    -[TRIMLRuntimeEvaluationHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v17);
  if (*((_BYTE *)v32 + 24))
  {
    notify_post("com.apple.trial.shadow-evaluation.mlruntime.status-change");
    v19 = *((_BYTE *)v32 + 24) != 0;
  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v19;
}

uint64_t __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke_2;
  v10[3] = &unk_1E932F498;
  v4 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, v10, 0, v5);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v8 = v7;
  else
    v8 = v6;
  return *v8;
}

void __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "evaluation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":evaluation_id", v5);

  objc_msgSend(*(id *)(a1 + 32), "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v8, "bindNamedParam:toDouble:", ":timestamp");

  objc_msgSend(v8, "bindNamedParam:toNSData:", ":eval_data", *(_QWORD *)(a1 + 40));
  objc_msgSend(v8, "bindNamedParam:toNSData:", ":status_data", *(_QWORD *)(a1 + 48));

}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  TRIMLRuntimeEvaluationHistoryDatabase *v22;
  id v23;
  id v24;
  uint64_t *v25;
  SEL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v20[3] = &unk_1E9330610;
  v13 = v9;
  v26 = a2;
  v21 = v13;
  v22 = self;
  v14 = v12;
  v23 = v14;
  v25 = &v27;
  v15 = v10;
  v24 = v15;
  -[TRIMLRuntimeEvaluationHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v20);
  v16 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v16;
}

uint64_t __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  _QWORD v19[5];
  id v20;
  uint64_t v21;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (const __CFString *)a1[4];
  if (!v6)
    v6 = &stru_1E9336E60;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM     mlRuntimeEvaluationStatusHistory %@ ORDER BY     eventSecondsFromEpoch ASC,     rowid ASC;"),
                 v6);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[2] = __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v19[3] = &unk_1E93305E8;
  v8 = a1[5];
  v9 = (void *)a1[6];
  v21 = a1[9];
  v19[4] = v8;
  v19[1] = 3221225472;
  v20 = v9;
  v10 = (void *)MEMORY[0x1D8232C48](v19);
  objc_msgSend(v4, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = a1[7];
  objc_msgSend(*(id *)(a1[5] + 8), "generalErrorHandlerWithOutError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", v7, v12, v10, v13);

  v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
  v15 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v16 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if (v14)
    v17 = v16;
  else
    v17 = v15;
  return *v17;
}

uint64_t __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedMLRuntimeEvaluation", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 115, CFSTR("read nil value for NOT NULL serializedMLRuntimeEvaluation"));

  }
  objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedEvaluationStatus", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 117, CFSTR("read nil value for NOT NULL serializedEvaluationStatus"));

  }
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0DC0F00], "parseFromData:error:", v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v6)
  {
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    if (v8)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AC8]), "initWithEvaluation:status:", v6, v8);
      buf[0] = 0;
      (*(void (**)(void))(a1[5] + 16))();
      v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];
      if (buf[0])
        v11 = (unsigned __int8 *)MEMORY[0x1E0D81788];
      v12 = *v11;

    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v9;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize TRIEvaluationStatus: %{public}@", buf, 0xCu);
      }

      v12 = *MEMORY[0x1E0D81780];
    }

    v7 = v9;
  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize MLRuntimeEvaluation: %{public}@", buf, 0xCu);
    }

    v12 = *MEMORY[0x1E0D81780];
  }

  return v12;
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
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__TRIMLRuntimeEvaluationHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke;
  v15[3] = &unk_1E932F1F0;
  v16 = v7;
  v10 = v7;
  v11 = -[TRIMLRuntimeEvaluationHistoryDatabase _enumerateRecordsMatchingWhereClause:bind:block:](self, "_enumerateRecordsMatchingWhereClause:bind:block:", CFSTR("WHERE eventSecondsFromEpoch > :threshold"), v15, v9);

  return v11;
}

void __77__TRIMLRuntimeEvaluationHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMLRuntimeEvaluationHistoryDatabase.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E9330638;
  v14 = &v16;
  v8 = v7;
  v13 = v8;
  v15 = a4;
  -[TRIMLRuntimeEvaluationHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  v11[3] = &unk_1E932F1F0;
  v12 = *(id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     mlRuntimeEvaluationStatusHistory WHERE     eventSecondsFromEpoch < :threshold;"),
                                                                 v11,
                                                                 0,
                                                                 0);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v3, "db");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    **(_QWORD **)(a1 + 48) = sqlite3_changes((sqlite3 *)objc_msgSend(v5, "handle"));

  }
  v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if (v6)
    v9 = v8;
  else
    v9 = v7;
  return *v9;
}

void __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
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
