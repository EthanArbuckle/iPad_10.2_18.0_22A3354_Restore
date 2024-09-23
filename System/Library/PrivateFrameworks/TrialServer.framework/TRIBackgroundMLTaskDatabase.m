@implementation TRIBackgroundMLTaskDatabase

- (TRIBackgroundMLTaskDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIBackgroundMLTaskDatabase *v7;
  TRIBackgroundMLTaskDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIBackgroundMLTaskDatabase;
  v7 = -[TRIBackgroundMLTaskDatabase init](&v11, sel_init);
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

- ($61A80719B04F7407D3E47539F1B23CAA)addBackgroundMLTaskWithTaskDeployment:(id)a3 pluginId:(id)a4 status:(int64_t)a5 endDate:(id)a6 artifact:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  $61A80719B04F7407D3E47539F1B23CAA v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  TRIBackgroundMLTaskDatabase *v30;
  uint64_t *v31;
  int64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pluginId"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_5;
LABEL_3:
  v33 = 0;
  v34 = &v33;
  v35 = 0x2810000000;
  v36 = "";
  v37 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke;
  v25[3] = &unk_1E932F3F8;
  v17 = v13;
  v26 = v17;
  v18 = v14;
  v27 = v18;
  v32 = a5;
  v19 = v15;
  v28 = v19;
  v20 = v16;
  v29 = v20;
  v30 = self;
  v31 = &v33;
  -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v25);
  v21.var0 = v34[4];

  _Block_object_dispose(&v33, 8);
  return v21;
}

uint64_t __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  sqlite3_int64 insert_rowid;
  uint64_t v12;
  unsigned __int8 *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_set_last_insert_rowid((sqlite3 *)objc_msgSend(v4, "handle"), 0x8000000000000000);

  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke_2;
  v15[3] = &unk_1E932F3D0;
  v16 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 80);
  v17 = v6;
  v20 = v7;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "generalErrorHandlerWithOutError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR IGNORE INTO backgroundMlTasks(    backgroundMlTaskId,     deploymentId,     pluginId,     status,     endSecondsFromEpoch,     activeFactorPackSetId,     activeTargetingRuleIndex,     targetedFactorPackSetId,     targetedTargetingRuleIndex,     artifact) VALUES(    :background_ml_task_id,     :deployment_id,     :plugin_id,     :status,     :end_seconds,     :active_fp_set_id,     :active_targeting_rule_index,     :targeted_fp_set_id,     :targeted_targeting_rule_index,     :artifact);"),
         v15,
         0,
         v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(v10, "handle"));

    if (insert_rowid == 0x8000000000000000)
      v12 = 2;
    else
      v12 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v12;
    v13 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = 0;
    v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v13;
}

void __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":background_ml_task_id", v3);

  objc_msgSend(v8, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":plugin_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(v8, "bindNamedParam:toInt64:", ":status", *(_QWORD *)(a1 + 64));
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bindNamedParam:toDoubleAsNSNumber:", ":end_seconds", v6);

  }
  else
  {
    objc_msgSend(v8, "bindNamedParam:toDoubleAsNSNumber:", ":end_seconds", 0);
  }
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":active_fp_set_id", 0);
  objc_msgSend(v8, "bindNamedParam:toInt64AsNSNumber:", ":active_targeting_rule_index", 0);
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":targeted_fp_set_id", 0);
  objc_msgSend(v8, "bindNamedParam:toInt64AsNSNumber:", ":targeted_targeting_rule_index", 0);
  objc_msgSend(*(id *)(a1 + 56), "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindNamedParam:toNSData:", ":artifact", v7);

}

- (BOOL)setStatus:(int64_t)a3 forTaskDeployment:(id)a4 usingTransaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  TRIBackgroundMLTaskDatabase *v19;
  uint64_t *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E932F3A8;
  v21 = a3;
  v11 = v9;
  v18 = v11;
  v19 = self;
  v20 = &v22;
  v12 = MEMORY[0x1D8232C48](v17);
  v13 = (void *)v12;
  if (v10)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v10);
  else
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v14 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F218;
  v14 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke_2, &unk_1E932F218);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE backgroundMlTasks SET         status = :status WHERE     backgroundMlTaskId = :background_ml_task_id       AND deploymentId = :deployment_id;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v8)
      *(_BYTE *)(v9 + 24) = 1;
    else
      *(_BYTE *)(v9 + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":status", v3);
  objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":background_ml_task_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)_enumerateTaskRecordsMatchingWhereClause:(id)a3 bind:(id)a4 transaction:(id)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  TRIBackgroundMLTaskDatabase *v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  SEL v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if ((v11 == 0) == (v12 == 0))
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v16 = (void *)MEMORY[0x1D8232A5C]();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__0;
  v34[4] = __Block_byref_object_dispose__0;
  v35 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke;
  v26[3] = &unk_1E932F448;
  v17 = v11;
  v27 = v17;
  v18 = v12;
  v33 = a2;
  v28 = self;
  v29 = v18;
  v19 = v15;
  v30 = v19;
  v31 = v34;
  v32 = &v36;
  v20 = MEMORY[0x1D8232C48](v26);
  v21 = (void *)v20;
  if (v13)
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v13);
  else
    -[TRIBackgroundMLTaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v20);
  v22 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);
  objc_autoreleasePoolPop(v16);

  return v22;
}

uint64_t __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke(_QWORD *a1, void *a2)
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
  uint64_t v19;
  void *v20;
  id v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (const __CFString *)a1[4];
  if (!v6)
    v6 = &stru_1E9336E60;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM     backgroundMlTasks as t %@ ORDER BY     endSecondsFromEpoch ASC,     rowid ASC;"),
                 v6);
  objc_msgSend(v3, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke_2;
  v31[3] = &unk_1E932F420;
  v9 = a1[5];
  v10 = a1[6];
  v33 = a1[10];
  v31[4] = v9;
  v11 = v4;
  v32 = v11;
  objc_msgSend(*(id *)(a1[5] + 8), "generalErrorHandlerWithOutError:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v10, v31, v12);

  v30 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
LABEL_5:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v17)
        objc_enumerationMutation(v14);
      if (v30)
        break;
      (*(void (**)(void))(a1[7] + 16))();
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v16)
          goto LABEL_5;
        break;
      }
    }
  }

  v19 = *(_QWORD *)(a1[8] + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v14;
  v21 = v14;

  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v13;
  v22 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v23 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if (v13)
    v24 = v22;
  else
    v24 = v23;
  return *v24;
}

uint64_t __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TRIBackgroundMLTaskRecord *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  TRIBackgroundMLTaskRecord *v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = MEMORY[0x1D8232A5C]();
  objc_msgSend(v2, "getNSStringForColumnName:table:", "backgroundMlTaskId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "getInt64ForColumnName:table:", "deploymentId", 0);
  objc_msgSend(v2, "getNSStringForColumnName:table:", "pluginId", 0);
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForColumnName:table:", "activeFactorPackSetId", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    TRIValidateFactorPackSetId();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v2, "getInt64AsNSNumberForColumnName:table:", "activeTargetingRuleIndex", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForColumnName:table:", "targetedFactorPackSetId", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    TRIValidateFactorPackSetId();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v9;
  v45 = (void *)v3;
  objc_msgSend(v2, "getInt64AsNSNumberForColumnName:table:", "targetedTargetingRuleIndex", 0);
  v43 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v2, "getInt64ForColumnName:table:", "status", 0);
  objc_msgSend(v2, "getNSDataForColumnName:table:", "artifact", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v10;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIBackgroundMLTaskDatabase.m"), 208, CFSTR("Unexpected NULL artifact"));

    v13 = 0;
    goto LABEL_8;
  }
  +[TRIClientBMLTArtifact artifactWithTransientData:](TRIClientBMLTArtifact, "artifactWithTransientData:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
LABEL_8:
    v38 = v11;
    v14 = (void *)v13;

    objc_msgSend(v2, "getDoubleAsNSNumberForColumnName:table:", "endSecondsFromEpoch", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)v8;
    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v15, "doubleValue");
      v17 = objc_msgSend(v16, "initWithTimeIntervalSince1970:");
    }
    else
    {
      v17 = 0;
    }
    v19 = (void *)v7;
    v40 = v6;

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIBackgroundMLTaskDatabase.m"), 225, CFSTR("Unexpected NULL backgroundMLTaskId"));

    }
    objc_msgSend(MEMORY[0x1E0DC09A8], "deploymentWithBackgroundMLTaskId:deploymentId:", v4, v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIBackgroundMLTaskDatabase.m"), 228, CFSTR("Unexpected NULL pluginId"));

    }
    v27 = [TRIBackgroundMLTaskRecord alloc];
    v28 = v14;
    v36 = v17;
    v37 = v14;
    v29 = v7;
    v30 = (void *)v17;
    v23 = v39;
    v24 = (void *)v43;
    v25 = v44;
    v31 = -[TRIBackgroundMLTaskRecord initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:](v27, "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", v26, v46, v29, v39, v44, v43, v38, v36, v37);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v31);
    v42 = *MEMORY[0x1E0D81780];

    v22 = v45;
    v21 = (void *)v46;
    v6 = v40;
    goto LABEL_19;
  }
  v18 = (void *)v8;
  v19 = (void *)v7;
  TRILogCategory_Server();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v49 = v4;
    v50 = 1024;
    v51 = v5;
    v52 = 2114;
    v53 = 0;
    _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to parse persisted TRIClientBMLTArtifact for artifact for %{public}@.%d: %{public}@", buf, 0x1Cu);
  }

  v42 = *MEMORY[0x1E0D81780];
  v22 = v45;
  v21 = (void *)v46;
  v23 = v18;
  v24 = (void *)v43;
  v25 = v44;
LABEL_19:

  objc_autoreleasePoolPop(v22);
  return v42;
}

- (id)taskRecordWithTaskDeployment:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

  }
  objc_msgSend(v5, "backgroundMLTaskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment.backgroundMLTaskId"));

  }
  if ((objc_msgSend(v5, "hasDeploymentId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment.hasDeploymentId"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke;
  v16[3] = &unk_1E932F1F0;
  v8 = v5;
  v17 = v8;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke_2;
  v15[3] = &unk_1E932F470;
  v15[4] = &v18;
  if (-[TRIBackgroundMLTaskDatabase _enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:](self, "_enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:", CFSTR(" WHERE     t.backgroundMlTaskId = :background_ml_task_id       AND t.deploymentId = :deployment_id"), v16, 0, v15))
  {
    v9 = (void *)v19[5];
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":background_ml_task_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

void __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)setTargetedFactorPackSetId:(id)a3 targetedTargetingRuleIndex:(id)a4 forTaskDeployment:(id)a5 usingTransaction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  TRIBackgroundMLTaskDatabase *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E932F4C0;
  v14 = v10;
  v22 = v14;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v25 = self;
  v26 = &v27;
  v17 = MEMORY[0x1D8232C48](v21);
  v18 = (void *)v17;
  if (v13)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  else
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v17);
  v19 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F498;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE backgroundMlTasks SET         targetedFactorPackSetId = :set_id,         targetedTargetingRuleIndex = :rule_index WHERE         backgroundMlTaskId = :background_ml_task_id     AND deploymentId = :deployment_id;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v8)
      *(_BYTE *)(v9 + 24) = 1;
    else
      *(_BYTE *)(v9 + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":set_id", v3);
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":rule_index", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":background_ml_task_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)targetTaskDeployment:(id)a3 toFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 usingTransaction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  char v20;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD, _QWORD);
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  v32 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke;
  v25[3] = &unk_1E932F240;
  v25[4] = self;
  v16 = v11;
  v26 = v16;
  v17 = v12;
  v27 = v17;
  v28 = &v29;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v25);
  v19 = v18;
  if (v14)
  {
    ((void (**)(_QWORD, id))v18)[2](v18, v14);
  }
  else
  {
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_81;
    v23[3] = &unk_1E932F4E8;
    v24 = v18;
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v23);

  }
  v20 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v20;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;
  NSObject *v9;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "taskRecordWithTaskDeployment:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "shortDesc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "TRIBMLTDatabase unable to target BMLT deployment %{public}@; not found.",
        (uint8_t *)&v12,
        0xCu);

    }
    goto LABEL_9;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(v4, "status") != 1)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v5, "bmltDeployment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "setStatus:forTaskDeployment:usingTransaction:", 2, v7, v3);

      if (!(_DWORD)v6)
      {
LABEL_9:
        v8 = (unsigned __int8 *)MEMORY[0x1E0D81680];
        goto LABEL_10;
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];
LABEL_10:

  return *v8;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setActiveFactorPackSetId:(id)a3 activeTargetingRuleIndex:(id)a4 forTaskDeployment:(id)a5 usingTransaction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  TRIBackgroundMLTaskDatabase *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E932F4C0;
  v14 = v10;
  v22 = v14;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v25 = self;
  v26 = &v27;
  v17 = MEMORY[0x1D8232C48](v21);
  v18 = (void *)v17;
  if (v13)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  else
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v17);
  v19 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F498;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE backgroundMlTasks SET         activeFactorPackSetId = :set_id,         activeTargetingRuleIndex = :rule_index WHERE     backgroundMlTaskId = :background_ml_task_id       AND deploymentId = :deployment_id;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v8)
      *(_BYTE *)(v9 + 24) = 1;
    else
      *(_BYTE *)(v9 + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":set_id", v3);
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":rule_index", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":background_ml_task_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)activateDeployment:(id)a3 withFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 usingTransaction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  char v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD, _QWORD);
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

LABEL_3:
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  v35 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke;
  v27[3] = &unk_1E932F4C0;
  v27[4] = self;
  v16 = v11;
  v28 = v16;
  v17 = v12;
  v29 = v17;
  v18 = v13;
  v30 = v18;
  v31 = &v32;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v27);
  v20 = v19;
  if (v14)
  {
    ((void (**)(_QWORD, id))v19)[2](v19, v14);
  }
  else
  {
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_86;
    v25[3] = &unk_1E932F4E8;
    v26 = v19;
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v25);

  }
  v21 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v32, 8);
  return v21;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned __int8 *v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "taskRecordWithTaskDeployment:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "shortDesc");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v22;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "TRIBMLTDatabase unable to activate BMLT deployment %{public}@; not found.",
        (uint8_t *)&v27,
        0xCu);

    }
    goto LABEL_18;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "bmltDeployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "setStatus:forTaskDeployment:usingTransaction:", 1, v7, v3);

  if ((v8 & 1) == 0)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "bmltDeployment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v23;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Failed to set Active status of BMLT deployment %{public}@", (uint8_t *)&v27, 0xCu);

    }
  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "bmltDeployment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 & objc_msgSend(v10, "setActiveFactorPackSetId:activeTargetingRuleIndex:forTaskDeployment:usingTransaction:", v11, v12, v13, v3);

  if ((v14 & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = *(void **)(a1 + 48);
      objc_msgSend(v5, "bmltDeployment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v24;
      v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to set active FPS %{public}@ for BMLT deployment %{public}@", (uint8_t *)&v27, 0x16u);

    }
  }
  v16 = *(void **)(a1 + 32);
  objc_msgSend(v5, "bmltDeployment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = v14 & objc_msgSend(v16, "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forTaskDeployment:usingTransaction:", 0, 0, v17, v3);

  if ((v16 & 1) == 0)
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "bmltDeployment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v26;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to unset targeted FPS for BMLT deployment %{public}@", (uint8_t *)&v27, 0xCu);

    }
LABEL_18:
    v18 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    goto LABEL_19;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v18 = (unsigned __int8 *)MEMORY[0x1E0D81678];
LABEL_19:

  return *v18;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)deactivateDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  char v13;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke;
  v18[3] = &unk_1E932F510;
  v20 = &v21;
  v18[4] = self;
  v10 = v7;
  v19 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v18);
  v12 = v11;
  if (v8)
  {
    ((void (**)(_QWORD, id))v11)[2](v11, v8);
  }
  else
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke_2;
    v16[3] = &unk_1E932F4E8;
    v17 = v11;
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v16);

  }
  v13 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned __int8 *v15;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  v6 = objc_msgSend(v3, "setStatus:forTaskDeployment:usingTransaction:", 3, v4, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = v6;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  v9 = objc_msgSend(*(id *)(a1 + 32), "setActiveFactorPackSetId:activeTargetingRuleIndex:forTaskDeployment:usingTransaction:", 0, 0, *(_QWORD *)(a1 + 40), v5);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v10 + 24))
    v11 = v9;
  else
    v11 = 0;
  *(_BYTE *)(v10 + 24) = v11;
  v12 = objc_msgSend(*(id *)(a1 + 32), "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forTaskDeployment:usingTransaction:", 0, 0, *(_QWORD *)(a1 + 40), v5);

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v13 + 24))
    v14 = v12;
  else
    v14 = 0;
  *(_BYTE *)(v13 + 24) = v14;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v15 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  else
    v15 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  return *v15;
}

uint64_t __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)deactivateTaskDeployment:(id)a3 deactivatedFactorPackSetId:(id *)a4 usingTransaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  char v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD, _QWORD);
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  id *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deactivatedFactorPackSetId"));

LABEL_3:
  v11 = *a4;
  *a4 = 0;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke;
  v22[3] = &unk_1E932F560;
  v24 = &v26;
  v22[4] = self;
  v13 = v9;
  v23 = v13;
  v25 = a4;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v22);
  v15 = v14;
  if (v10)
  {
    ((void (**)(_QWORD, id))v14)[2](v14, v10);
  }
  else
  {
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_89;
    v20[3] = &unk_1E932F4E8;
    v21 = v14;
    -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v20);

  }
  v16 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v16;
}

uint64_t __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void *v14;
  int v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundMLTaskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_2;
  v16[3] = &unk_1E932F538;
  v17 = *(id *)(a1 + 40);
  v18 = &v20;
  v19 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "enumerateTaskRecordsMatchingTaskId:transaction:block:", v5, v3, v16);

  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v7 = v21[5];
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "deactivateDeployment:usingTransaction:", v7, v3);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v9 + 24))
        v10 = v8;
      else
        v10 = 0;
      *(_BYTE *)(v9 + 24) = v10;
    }
    else
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "backgroundMLTaskId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(*(id *)(a1 + 40), "deploymentId");
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        v28 = 1024;
        v29 = v15;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to find deployment to deactivate in BMLT database (for deployment: (bmlt: %{public}@, d: %d)", buf, 0x12u);

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v6 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  v12 = *v6;

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void **v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bmltDeployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToDeployment:", a1[4]);

  if (v5)
  {
    objc_msgSend(v3, "activeFactorPackSetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v3, "targetedFactorPackSetId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_9;
    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bmltDeployment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundMLTaskId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bmltDeployment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v10;
      v21 = 1024;
      v22 = objc_msgSend(v11, "deploymentId");
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Deactivating BMLT deployment matching %{public}@: %d", (uint8_t *)&v19, 0x12u);

    }
    objc_msgSend(v3, "bmltDeployment");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(v3, "activeFactorPackSetId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "activeFactorPackSetId");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void **)a1[6];
      v18 = *v17;
      *v17 = (void *)v16;

    }
  }
LABEL_9:

}

uint64_t __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)enumerateActiveTasksWithBlock:(id)a3
{
  return -[TRIBackgroundMLTaskDatabase _enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:](self, "_enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:", CFSTR("WHERE status = :status_active"), &__block_literal_global, 0, a3);
}

uint64_t __61__TRIBackgroundMLTaskDatabase_enumerateActiveTasksWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":status_active", 1);
}

- (BOOL)enumerateActiveTasksNotInList:(id)a3 usingTransaction:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_95);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v11);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__TRIBackgroundMLTaskDatabase_enumerateActiveTasksNotInList_usingTransaction_withBlock___block_invoke_2;
  v18[3] = &unk_1E932F608;
  v19 = v14;
  v20 = v10;
  v15 = v10;
  v16 = v14;
  LOBYTE(self) = -[TRIBackgroundMLTaskDatabase enumerateActiveTasksWithTransaction:block:](self, "enumerateActiveTasksWithTransaction:block:", v9, v18);

  return (char)self;
}

uint64_t __88__TRIBackgroundMLTaskDatabase_enumerateActiveTasksNotInList_usingTransaction_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasDeploymentId");
}

void __88__TRIBackgroundMLTaskDatabase_enumerateActiveTasksNotInList_usingTransaction_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "bmltDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)enumerateTaskRecordsWithBlock:(id)a3
{
  return -[TRIBackgroundMLTaskDatabase _enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:](self, "_enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:", 0, 0, 0, a3);
}

- (BOOL)enumerateActiveTasksWithTransaction:(id)a3 block:(id)a4
{
  return -[TRIBackgroundMLTaskDatabase _enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:](self, "_enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:", CFSTR("WHERE status = :status_active"), &__block_literal_global_97, a3, a4);
}

uint64_t __73__TRIBackgroundMLTaskDatabase_enumerateActiveTasksWithTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":status_active", 1);
}

- (BOOL)enumerateTaskRecordsWithTransaction:(id)a3 block:(id)a4
{
  return -[TRIBackgroundMLTaskDatabase _enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:](self, "_enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:", 0, 0, a3, a4);
}

- (BOOL)enumerateTaskRecordsMatchingTaskId:(id)a3 transaction:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__TRIBackgroundMLTaskDatabase_enumerateTaskRecordsMatchingTaskId_transaction_block___block_invoke;
  v16[3] = &unk_1E932F1F0;
  v17 = v9;
  v12 = v9;
  v13 = -[TRIBackgroundMLTaskDatabase _enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:](self, "_enumerateTaskRecordsMatchingWhereClause:bind:transaction:block:", CFSTR(" WHERE t.backgroundMlTaskId = :background_ml_task_id"), v16, v10, v11);

  return v13;
}

uint64_t __84__TRIBackgroundMLTaskDatabase_enumerateTaskRecordsMatchingTaskId_transaction_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":background_ml_task_id", *(_QWORD *)(a1 + 32));
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3
{
  id v5;
  id v6;
  $61A80719B04F7407D3E47539F1B23CAA v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  TRIBackgroundMLTaskDatabase *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBackgroundMLTaskDatabase.m"), 632, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2810000000;
  v17 = "";
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke;
  v10[3] = &unk_1E932F650;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v13 = &v14;
  -[TRIBackgroundMLTaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v10);
  v7.var0 = v15[4];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke_2;
  v13[3] = &unk_1E932F1F0;
  v14 = *(id *)(a1 + 32);
  v4 = (void *)MEMORY[0x1D8232C48](v13);
  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     backgroundMlTasks WHERE   backgroundMlTaskId = :background_ml_task_id     AND deploymentId = :deployment_id"), v4, 0, v6);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = sqlite3_changes((sqlite3 *)objc_msgSend(v8, "handle"));

    v10 = 1;
    if (v9 <= 0)
      v10 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v10;
    v11 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = 0;
    v11 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v11;
}

void __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":background_ml_task_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
