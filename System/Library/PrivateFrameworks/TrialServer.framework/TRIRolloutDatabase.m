@implementation TRIRolloutDatabase

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 prependingWithClause:(id)a5 usingTransaction:(id)a6 block:(id)a7
{
  unint64_t v13;
  id v14;
  unint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  TRIRolloutDatabase *v33;
  id v34;
  id v35;
  uint64_t *v36;
  SEL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v13 = (unint64_t)a3;
  v14 = a4;
  v15 = (unint64_t)a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if ((v14 != 0) == ((v13 | v15) != 0))
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("((whereClause != nil) || (withClause != nil)) == (bind != nil)"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v19 = (void *)MEMORY[0x1D8232A5C]();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke;
  v30[3] = &unk_1E93339B0;
  v20 = (id)v15;
  v31 = v20;
  v21 = (id)v13;
  v32 = v21;
  v22 = v14;
  v37 = a2;
  v33 = self;
  v34 = v22;
  v23 = v18;
  v35 = v23;
  v36 = &v38;
  v24 = MEMORY[0x1D8232C48](v30);
  v25 = (void *)v24;
  if (v16)
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v16);
  else
    -[TRIRolloutDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v24);
  v26 = *((_BYTE *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  objc_autoreleasePoolPop(v19);

  return v26;
}

- (BOOL)enumerateRecordsUsingTransaction:(id)a3 block:(id)a4
{
  return -[TRIRolloutDatabase _enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:](self, "_enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:", 0, 0, 0, a3, a4);
}

- (TRIRolloutDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIRolloutDatabase *v7;
  TRIRolloutDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIRolloutDatabase;
  v7 = -[TRIRolloutDatabase init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- (BOOL)addNewRolloutWithRecord:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  objc_msgSend(v5, "namespaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "_pas_leftFoldWithInitialObject:accumulate:", v7, &__block_literal_global_18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v5, "namespaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 == v11)
  {

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x2020000000;
    v23 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_23;
    v18[3] = &unk_1E932F650;
    v18[4] = self;
    v19 = v5;
    p_buf = &buf;
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v18);
    v12 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "deployment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDesc");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Namespace names in rollout %{public}@ are not unique.", (uint8_t *)&buf, 0xCu);

    }
    v12 = 0;
  }

  return v12;
}

id __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addObject:", a3);
  return v4;
}

uint64_t __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  sqlite3_int64 insert_rowid;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordWithDeployment:usingTransaction:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "deployment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDesc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v9;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Unable to add new rollout deployment %{public}@: already present in database.", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v10 = *MEMORY[0x1E0D81680];
  }
  else
  {
    objc_msgSend(v3, "db");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_set_last_insert_rowid((sqlite3 *)objc_msgSend(v11, "handle"), 0x8000000000000000);

    objc_msgSend(v3, "db");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_26;
    v32[3] = &unk_1E932F1F0;
    v33 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO rolloutsV2(    rolloutId,     deploymentId,     rampId,     status,     isShadow,     activeFactorPackSetId,     activeTargetingRuleIndex,     targetedFactorPackSetId,     targetedTargetingRuleIndex,     artifact) VALUES(    :rollout_id,     :deployment_id,     :ramp_id,     :status,     :is_shadow,     :active_fp_set_id,     :active_targeting_rule_index,     :targeted_fp_set_id,     :targeted_targeting_rule_index,     :artifact);"),
            v32,
            0,
            v13);

    if ((v14 & 1) != 0
      && (objc_msgSend(v3, "db"),
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
          insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(v15, "handle")),
          v15,
          insert_rowid != 0x8000000000000000))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "namespaces");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v22 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v3, "db");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_2;
            v27[3] = &unk_1E932F218;
            v27[4] = v21;
            v27[5] = insert_rowid;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v21) = objc_msgSend(v23, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO rolloutV2Namespaces(    rolloutsV2_rowid,     name) VALUES(    :rolloutsV2_rowid,     :name);"),
                             v27,
                             0,
                             v24);

            if (!(_DWORD)v21)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
              v10 = *MEMORY[0x1E0D81680];
              objc_autoreleasePoolPop(v22);

              goto LABEL_18;
            }
            objc_autoreleasePoolPop(v22);
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v18)
            continue;
          break;
        }
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v10 = *MEMORY[0x1E0D81678];
LABEL_18:
      v6 = 0;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v10 = *MEMORY[0x1E0D81680];
    }

  }
  return v10;
}

void __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_26(uint64_t a1, void *a2)
{
  void *v3;
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

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "deployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":rollout_id", v6);

  objc_msgSend(*(id *)(a1 + 32), "deployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(v7, "deploymentId"));

  objc_msgSend(*(id *)(a1 + 32), "rampId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":ramp_id", v8);

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":status", objc_msgSend(*(id *)(a1 + 32), "status"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":is_shadow", objc_msgSend(*(id *)(a1 + 32), "isShadow"));
  objc_msgSend(*(id *)(a1 + 32), "activeFactorPackSetId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":active_fp_set_id", v9);

  objc_msgSend(*(id *)(a1 + 32), "activeTargetingRuleIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":active_targeting_rule_index", v10);

  objc_msgSend(*(id *)(a1 + 32), "targetedFactorPackSetId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":targeted_fp_set_id", v11);

  objc_msgSend(*(id *)(a1 + 32), "targetedTargetingRuleIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":targeted_targeting_rule_index", v12);

  objc_msgSend(*(id *)(a1 + 32), "artifact");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":artifact", v13);

}

void __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rolloutsV2_rowid", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));

}

- (BOOL)setStatus:(int64_t)a3 forDeployment:(id)a4 usingTransaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  TRIRolloutDatabase *v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke;
  v18 = &unk_1E932F3A8;
  v22 = a3;
  v10 = v8;
  v19 = v10;
  v20 = self;
  v21 = &v23;
  v11 = MEMORY[0x1D8232C48](&v15);
  v12 = (void *)v11;
  if (v9)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  else
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v11, v15, v16, v17, v18);
  v13 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v13;
}

uint64_t __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F218;
  v14 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke_2, &unk_1E932F218);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE rolloutsV2 SET         status = :status WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id;"),
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

void __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":status", v3);
  objc_msgSend(*(id *)(a1 + 32), "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":rollout_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)setActiveFactorPackSetId:(id)a3 activeTargetingRuleIndex:(id)a4 forDeployment:(id)a5 usingTransaction:(id)a6
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
  TRIRolloutDatabase *v25;
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
  v21[2] = __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke;
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
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v17);
  v19 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F498;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE rolloutsV2 SET         activeFactorPackSetId = :set_id,         activeTargetingRuleIndex = :rule_index WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id;"),
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

void __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":set_id", v3);
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":rule_index", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":rollout_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)setTargetedFactorPackSetId:(id)a3 targetedTargetingRuleIndex:(id)a4 forDeployment:(id)a5 usingTransaction:(id)a6
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
  TRIRolloutDatabase *v25;
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
  v21[2] = __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke;
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
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v17);
  v19 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F498;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE rolloutsV2 SET         targetedFactorPackSetId = :set_id,         targetedTargetingRuleIndex = :rule_index WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id;"),
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

void __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":set_id", v3);
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":rule_index", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":rollout_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (id)_dataNoCopyFromStmt:(id)a3 columnName:(const char *)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  id v9;
  const char *v10;
  void *v11;
  id v13;
  const void *v14;

  v5 = objc_retainAutorelease(a3);
  v6 = sqlite3_column_count((sqlite3_stmt *)objc_msgSend(v5, "stmt"));
  if (v6 < 1)
    goto LABEL_6;
  v7 = v6;
  v8 = 0;
  while (1)
  {
    v9 = objc_retainAutorelease(v5);
    v10 = sqlite3_column_name((sqlite3_stmt *)objc_msgSend(v9, "stmt"), v8);
    if (v10)
    {
      if (!strcmp(a4, v10))
        break;
    }
    if (v7 == ++v8)
      goto LABEL_6;
  }
  v13 = objc_retainAutorelease(v9);
  v14 = sqlite3_column_blob((sqlite3_stmt *)objc_msgSend(v13, "stmt"), v8);
  if (v14)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v14, sqlite3_column_bytes((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v13), "stmt"), v8), 0);
  else
LABEL_6:
    v11 = 0;

  return v11;
}

uint64_t __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  unsigned __int8 *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = &stru_1E9336E60;
  v7 = *(const __CFString **)(a1 + 32);
  if (!v7)
    v7 = &stru_1E9336E60;
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" %@ SELECT * FROM     rolloutsV2 as r %@"), v7, v6);
  objc_msgSend(v3, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_2;
  v37[3] = &unk_1E932F420;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v39 = *(_QWORD *)(a1 + 80);
  v37[4] = v11;
  v13 = v4;
  v38 = v13;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, v12, v37, v14);

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "db");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v10;
  v34[1] = 3221225472;
  v34[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_3;
  v34[3] = &unk_1E9333960;
  v18 = v13;
  v35 = v18;
  v19 = v16;
  v36 = v19;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     rolloutV2Namespaces as n"), 0, v34, v20);

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  objc_msgSend(v18, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_4;
  v27[3] = &unk_1E9333988;
  v23 = v18;
  v28 = v23;
  v31 = v32;
  v24 = v19;
  v29 = v24;
  v30 = *(id *)(a1 + 64);
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v27);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v15 & v16;
  if ((v15 & v16) != 0)
    v25 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  else
    v25 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  _Block_object_dispose(v32, 8);
  return *v25;
}

uint64_t __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  char v21;
  BOOL v22;
  char v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  void *v27;
  TRIRolloutRecord *v28;
  TRIRolloutRecord *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 *v34;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v3 = a2;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "rowid", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "rolloutId", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentId", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "rampId", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v3, "getInt64ForColumnName:table:", "status", 0);
  v37 = objc_msgSend(v3, "getInt64ForColumnName:table:", "isShadow", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "activeFactorPackSetId", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "activeTargetingRuleIndex", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "targetedFactorPackSetId", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "targetedTargetingRuleIndex", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSDataForColumnName:table:", "artifact", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v6)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIRolloutDatabase.m"), 359, CFSTR("unexpected NULL rolloutId"));

    v5 = v13;
    if (v11)
    {
LABEL_3:
      if (v8)
        goto LABEL_4;
LABEL_8:
      v46 = 0;
      if (v9)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIRolloutDatabase.m"), 360, CFSTR("unexpected NULL artifact"));

  v5 = v15;
  if (!v8)
    goto LABEL_8;
LABEL_4:
  TRIValidateFactorPackSetId();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_5:
    TRIValidateFactorPackSetId();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_9:
  v12 = 0;
LABEL_10:
  v45 = (void *)v9;
  if (v7)
  {
    TRIValidateRampId();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v42 = v11;
  +[TRIClientRolloutArtifact artifactWithTransientData:](TRIClientRolloutArtifact, "artifactWithTransientData:", v11);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v45)
    v20 = v12 == 0;
  else
    v20 = 0;
  v21 = v20;
  if (v7)
    v22 = v17 == 0;
  else
    v22 = 0;
  v23 = v22;
  if (v46)
    v24 = 1;
  else
    v24 = v8 == 0;
  if (v24 && (v21 & 1) == 0 && (v23 & 1) == 0 && v18)
  {
    v20 = v37 == 0;
    v38 = v7;
    v25 = !v20;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B60]), "initWithRolloutId:deploymentId:", v6, v39);
    v40 = v4;
    v27 = (void *)v26;
    v28 = [TRIRolloutRecord alloc];
    LOBYTE(v36) = v25;
    v29 = -[TRIRolloutRecord initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:](v28, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", v27, v17, v46, v44, v12, v43, v41, MEMORY[0x1E0C9AA60], v36, v19);
    v30 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v31 = v8;
    v32 = v6;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v29, v33);

    v6 = v32;
    v8 = v31;

    v7 = v38;
    v4 = v40;
  }

  objc_autoreleasePoolPop(v4);
  v34 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v34;
}

uint64_t __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 *v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "getInt64ForColumnName:table:", "rolloutsV2_rowid", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "getNSStringForColumnName:table:", "name", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v7)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v5);
      if (!v7)
        goto LABEL_5;
    }
    objc_msgSend(v8, "addObject:", v7);
    goto LABEL_5;
  }
LABEL_6:

  objc_autoreleasePoolPop(v4);
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v9;
}

void __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v14);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = (void *)objc_msgSend(v7, "copyWithReplacementNamespaces:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v6);

}

- (id)recordWithDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke;
  v22[3] = &unk_1E932F1F0;
  v10 = v7;
  v23 = v10;
  v11 = (void *)MEMORY[0x1D8232C48](v22);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__28;
  v20 = __Block_byref_object_dispose__28;
  v21 = 0;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke_95;
  v15[3] = &unk_1E93339D8;
  v15[4] = &v16;
  if (-[TRIRolloutDatabase _enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:](self, "_enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:", CFSTR(" WHERE   rolloutId = :rollout_id     AND deploymentId = :deployment_id"), v11, 0, v8, v15))
  {
    v12 = (id)v17[5];
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":rollout_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

void __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke_95(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)enumerateRecordsWithRolloutId:(id)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v16;
  _QWORD v17[4];
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__TRIRolloutDatabase_enumerateRecordsWithRolloutId_usingTransaction_block___block_invoke;
  v17[3] = &unk_1E932F1F0;
  v18 = v9;
  v12 = v9;
  v13 = (void *)MEMORY[0x1D8232C48](v17);
  v14 = -[TRIRolloutDatabase _enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:](self, "_enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:", CFSTR("WHERE rolloutId = :rollout_id"), v13, 0, v10, v11);

  return v14;
}

uint64_t __75__TRIRolloutDatabase_enumerateRecordsWithRolloutId_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":rollout_id", *(_QWORD *)(a1 + 32));
}

- (BOOL)enumerateRecordsOverlappingNamespaces:(id)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces"));

  }
  if (objc_msgSend(v9, "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__TRIRolloutDatabase_enumerateRecordsOverlappingNamespaces_usingTransaction_block___block_invoke;
    v16[3] = &unk_1E932F1F0;
    v17 = v9;
    v12 = (void *)MEMORY[0x1D8232C48](v16);
    v13 = -[TRIRolloutDatabase _enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:](self, "_enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:", CFSTR(" WHERE r.rowid IN selectedRowIds"), v12, CFSTR(" WITH selectedRowIds AS(    SELECT rolloutsV2_rowid FROM rolloutV2Namespaces     WHERE name IN _pas_nsset(:name_set))"), v10, v11);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t __83__TRIRolloutDatabase_enumerateRecordsOverlappingNamespaces_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":name_set", *(_QWORD *)(a1 + 32));
}

- (BOOL)enumerateActiveRecordsWithVisibility:(unsigned int)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v9 = a4;
  v10 = a5;
  if (a3 - 1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 553, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("andClause"));

    v11 = 0;
  }
  else
  {
    v11 = off_1E9333AE0[a3 - 1];
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WHERE activeFactorPackSetId IS NOT NULL %@"), v11);
  v14 = -[TRIRolloutDatabase _enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:](self, "_enumerateRecordsMatchingWhereClause:bind:prependingWithClause:usingTransaction:block:", v13, &__block_literal_global_116, 0, v9, v10);

  return v14;
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3 usingRefCounting:(BOOL)a4
{
  id v7;
  id v8;
  $61A80719B04F7407D3E47539F1B23CAA v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2810000000;
  v19 = "";
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke;
  v12[3] = &unk_1E9333A20;
  v15 = a4;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  v14 = &v16;
  -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v9.var0 = v17[4];

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "appendString:", CFSTR(" SELECT rowid FROM         rolloutsV2 WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id"));
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v4, "appendString:", CFSTR("     AND respectRefCount = 1"));
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke_2;
  v26 = &unk_1E932F1F0;
  v27 = v5;
  objc_msgSend(v6, "createTempTableContainingRowsFromQuery:bind:namePrefix:transaction:", v4, &v23, CFSTR("remove_rollout_rowids"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = 0;
    v20 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_14:
    v21 = *v20;
    goto LABEL_15;
  }
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR(" DELETE FROM     rolloutV2Namespaces WHERE     rolloutsV2_rowid IN %@;"),
                 v7,
                 v23,
                 v24,
                 v25,
                 v26);
  objc_msgSend(v3, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v9, 0, 0, v11);

  if ((v12 & 1) != 0)
  {

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     rolloutsV2 WHERE     rowid IN %@;"),
                   v7);
    objc_msgSend(v3, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", v9, 0, 0, v14);

    if ((v15 & 1) != 0)
    {

      objc_msgSend(v3, "db");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = sqlite3_changes((sqlite3 *)objc_msgSend(v16, "handle"));

      v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dropTableWithName:transaction:", v7, v3);
      v19 = 1;
      if (v17 <= 0)
        v19 = 2;
      if (!v18)
        v19 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v19;
      v20 = (unsigned __int8 *)MEMORY[0x1E0D81678];
      if (!v18)
        v20 = (unsigned __int8 *)MEMORY[0x1E0D81680];
      goto LABEL_14;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = 0;
  v21 = *MEMORY[0x1E0D81680];

LABEL_15:
  return v21;
}

void __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":rollout_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3
{
  return ($61A80719B04F7407D3E47539F1B23CAA)-[TRIRolloutDatabase removeRecordWithDeployment:usingRefCounting:](self, "removeRecordWithDeployment:usingRefCounting:", a3, 0);
}

- (BOOL)targetDeployment:(id)a3 toFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 deallocatedDeployments:(id)a6 usingTransaction:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  char v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD);
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 654, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deallocatedDeployments"));

LABEL_3:
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v18 = MEMORY[0x1E0C809B0];
  v40 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke;
  v31[3] = &unk_1E93302C8;
  v31[4] = self;
  v19 = v13;
  v32 = v19;
  v20 = v14;
  v33 = v20;
  v21 = v15;
  v34 = v21;
  v22 = v16;
  v35 = v22;
  v36 = &v37;
  v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v31);
  v24 = v23;
  if (v17)
  {
    ((void (**)(_QWORD, id))v23)[2](v23, v17);
  }
  else
  {
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_131;
    v29[3] = &unk_1E932F4E8;
    v30 = v23;
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v29);

  }
  v25 = *((_BYTE *)v38 + 24);

  _Block_object_dispose(&v37, 8);
  return v25;
}

uint64_t __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  NSObject *v33;
  void *v35;
  id v36;
  char v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_2;
  v44[3] = &unk_1E93304F8;
  v7 = v4;
  v45 = v7;
  LOBYTE(v5) = objc_msgSend(v5, "enumerateRecordsWithRolloutId:usingTransaction:block:", v6, v3, v44);

  if ((v5 & 1) != 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v36 = v7;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v9)
    {
      v10 = v9;
      v37 = 0;
      v39 = *(_QWORD *)v41;
      obj = v8;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v39)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v12, "deployment");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToDeployment:", *(_QWORD *)(a1 + 40));

          if (v15)
          {
            if (*(_QWORD *)(a1 + 48))
            {
              if (objc_msgSend(v12, "status") != 1)
              {
                v16 = *(void **)(a1 + 32);
                objc_msgSend(v12, "deployment");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v16) = objc_msgSend(v16, "setStatus:forDeployment:usingTransaction:", 2, v17, v3);

                if (!(_DWORD)v16)
                  goto LABEL_31;
              }
            }
            v18 = *(void **)(a1 + 32);
            v20 = *(_QWORD *)(a1 + 48);
            v19 = *(_QWORD *)(a1 + 56);
            objc_msgSend(v12, "deployment");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v18) = objc_msgSend(v18, "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forDeployment:usingTransaction:", v20, v19, v21, v3);

            objc_autoreleasePoolPop(v13);
            if ((v18 & 1) == 0)
              goto LABEL_25;
            v37 = 1;
          }
          else
          {
            if (objc_msgSend(v12, "status") == 2)
            {
              v22 = *(void **)(a1 + 32);
              objc_msgSend(v12, "deployment");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v22) = objc_msgSend(v22, "setStatus:forDeployment:usingTransaction:", 0, v23, v3);

              if (!(_DWORD)v22)
              {
LABEL_31:
                v32 = *MEMORY[0x1E0D81680];
                objc_autoreleasePoolPop(v13);
                goto LABEL_32;
              }
            }
            objc_msgSend(v12, "targetedFactorPackSetId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              TRILogCategory_Server();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 40), "shortDesc");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "deployment");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "shortDesc");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v47 = v26;
                v48 = 2114;
                v49 = v28;
                _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Completion of targeting for rollout deployment %{public}@ invalidated targeted rollout deployment: %{public}@", buf, 0x16u);

              }
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);
            }
            v29 = *(void **)(a1 + 32);
            objc_msgSend(v12, "deployment");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v29) = objc_msgSend(v29, "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forDeployment:usingTransaction:", 0, 0, v30, v3);

            objc_autoreleasePoolPop(v13);
            if (!(_DWORD)v29)
            {
LABEL_25:
              v32 = *MEMORY[0x1E0D81680];
LABEL_32:

              goto LABEL_33;
            }
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v10)
          continue;
        break;
      }

      if ((v37 & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        v31 = (unsigned __int8 *)MEMORY[0x1E0D81678];
        goto LABEL_30;
      }
    }
    else
    {

    }
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "shortDesc");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v35;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "TRIRolloutDatabase unable to target rollout deployment %{public}@; not found.",
        buf,
        0xCu);

    }
    v31 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_30:
    v32 = *v31;
LABEL_33:
    v7 = v36;
  }
  else
  {
    v32 = *MEMORY[0x1E0D81680];
  }

  return v32;
}

void __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC0B38], "partialRecordWithFullRecord:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_131(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)activateDeployment:(id)a3 withFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 deactivatedDeployments:(id)a6 deactivatedFactorPackSetIds:(id)a7 deactivationStateTransitions:(id)a8 usingTransaction:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  char v32;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  void (**v38)(_QWORD, _QWORD);
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 740, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    if (v19)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 739, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  if (!v17)
    goto LABEL_9;
LABEL_3:
  if (v19)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 741, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deactivatedDeployments"));

LABEL_4:
  objc_msgSend(v19, "removeAllObjects");
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v23 = MEMORY[0x1E0C809B0];
  v50 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke;
  v39[3] = &unk_1E9333A48;
  v39[4] = self;
  v24 = v16;
  v40 = v24;
  v25 = v17;
  v41 = v25;
  v26 = v18;
  v42 = v26;
  v27 = v21;
  v43 = v27;
  v28 = v19;
  v44 = v28;
  v29 = v20;
  v45 = v29;
  v46 = &v47;
  v30 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v39);
  v31 = v30;
  if (v22)
  {
    ((void (**)(_QWORD, id))v30)[2](v30, v22);
  }
  else
  {
    v37[0] = v23;
    v37[1] = 3221225472;
    v37[2] = __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_137;
    v37[3] = &unk_1E932F4E8;
    v38 = v30;
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v37);

  }
  v32 = *((_BYTE *)v48 + 24);

  _Block_object_dispose(&v47, 8);
  return v32;
}

uint64_t __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 *v49;
  uint64_t v50;
  NSObject *v51;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  int v57;
  char v58;
  id obj;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "recordWithDeployment:usingTransaction:", *(_QWORD *)(a1 + 40), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "namespaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_2;
  v66[3] = &unk_1E93304F8;
  v10 = (id)v4;
  v67 = v10;
  LOBYTE(v4) = objc_msgSend(v6, "enumerateRecordsOverlappingNamespaces:usingTransaction:block:", v9, v3, v66);

  if ((v4 & 1) == 0)
    goto LABEL_45;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v10;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (!v61)
  {

    goto LABEL_42;
  }
  v54 = v10;
  v55 = v5;
  v58 = 0;
  v11 = *(_QWORD *)v63;
  v56 = *(_QWORD *)v63;
  while (2)
  {
    for (i = 0; i != v61; ++i)
    {
      if (*(_QWORD *)v63 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      v14 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "deployment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToDeployment:", *(_QWORD *)(a1 + 40));

      if (v16)
      {
        v17 = *(void **)(a1 + 32);
        objc_msgSend(v13, "deployment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v17, "setStatus:forDeployment:usingTransaction:", 1, v18, v3);

        if (!(_DWORD)v17)
          goto LABEL_40;
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v13, "deployment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v19, "setActiveFactorPackSetId:activeTargetingRuleIndex:forDeployment:usingTransaction:", v20, v21, v22, v3);

        if (!(_DWORD)v19)
          goto LABEL_40;
        v23 = *(void **)(a1 + 32);
        objc_msgSend(v13, "deployment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = objc_msgSend(v23, "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forDeployment:usingTransaction:", 0, 0, v24, v3);

        objc_autoreleasePoolPop(v14);
        if ((v23 & 1) == 0)
          goto LABEL_47;
        v58 = 1;
        continue;
      }
      if (objc_msgSend(v13, "status"))
      {
        if (*(_QWORD *)(a1 + 64))
        {
          v26 = objc_msgSend(v13, "status");
          v25 = CFSTR("roll_st_DE");
          if (v26 == 1
            || *(_QWORD *)(a1 + 64)
            && (v27 = objc_msgSend(v13, "status", CFSTR("roll_st_DE")),
                v25 = CFSTR("obsoleted-unknown-previous-state"),
                v27 == 2))
          {
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v25, v13, v54, v55);
          }
        }
        v28 = *(void **)(a1 + 32);
        objc_msgSend(v13, "deployment", v25, v54, v55);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v28) = objc_msgSend(v28, "setStatus:forDeployment:usingTransaction:", 3, v29, v3);

        if (!(_DWORD)v28)
        {
LABEL_40:
          v50 = *MEMORY[0x1E0D81680];
          objc_autoreleasePoolPop(v14);
LABEL_48:

          v10 = v54;
          v5 = v55;
          goto LABEL_49;
        }
      }
      objc_msgSend(v13, "activeFactorPackSetId", v54, v55);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {

      }
      else
      {
        objc_msgSend(v13, "targetedFactorPackSetId");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_34;
      }
      v60 = v14;
      TRILogCategory_Server();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "shortDesc");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deployment");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "shortDesc");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v33;
        v70 = 2114;
        v71 = v35;
        _os_log_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEFAULT, "Activating rollout deployment %{public}@ obsoleted rollout deployment: %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "rolloutId");
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deployment");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rolloutId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToString:](v36, "isEqualToString:", v38) & 1) != 0)
      {
        v57 = objc_msgSend(*(id *)(a1 + 40), "deploymentId");
        objc_msgSend(v13, "deployment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "deploymentId");

        v41 = v57 < v40;
        v11 = v56;
        if (!v41)
          goto LABEL_31;
        TRILogCategory_Server();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "Accidentally obsoleted a newer rollout deployment by activating an old deployment.", buf, 2u);
        }
      }
      else
      {

      }
LABEL_31:
      v42 = *(void **)(a1 + 72);
      objc_msgSend(v13, "deployment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v43);

      objc_msgSend(v13, "activeFactorPackSetId");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v44, *(_QWORD *)(a1 + 40));

      v14 = v60;
LABEL_34:
      v45 = *(void **)(a1 + 32);
      objc_msgSend(v13, "deployment");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v45) = objc_msgSend(v45, "setActiveFactorPackSetId:activeTargetingRuleIndex:forDeployment:usingTransaction:", 0, 0, v46, v3);

      if ((v45 & 1) == 0)
        goto LABEL_40;
      v47 = *(void **)(a1 + 32);
      objc_msgSend(v13, "deployment");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v47) = objc_msgSend(v47, "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forDeployment:usingTransaction:", 0, 0, v48, v3);

      objc_autoreleasePoolPop(v14);
      if (!(_DWORD)v47)
      {
LABEL_47:
        v50 = *MEMORY[0x1E0D81680];
        goto LABEL_48;
      }
    }
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v61)
      continue;
    break;
  }

  v10 = v54;
  v5 = v55;
  if ((v58 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    v49 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    goto LABEL_46;
  }
LABEL_42:
  TRILogCategory_Server();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "shortDesc");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v53;
    _os_log_error_impl(&dword_1D207F000, v51, OS_LOG_TYPE_ERROR, "TRIRolloutDatabase unable to activate rollout deployment %{public}@; not found.",
      buf,
      0xCu);

  }
LABEL_45:
  v49 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_46:
  v50 = *v49;
LABEL_49:

  return v50;
}

void __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC0B38], "partialRecordWithFullRecord:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_137(uint64_t a1)
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 856, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke;
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
    v16[2] = __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke_2;
    v16[3] = &unk_1E932F4E8;
    v17 = v11;
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v16);

  }
  v13 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  v6 = objc_msgSend(v3, "setStatus:forDeployment:usingTransaction:", 3, v4, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = v6;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  v9 = objc_msgSend(*(id *)(a1 + 32), "setActiveFactorPackSetId:activeTargetingRuleIndex:forDeployment:usingTransaction:", 0, 0, *(_QWORD *)(a1 + 40), v5);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v10 + 24))
    v11 = v9;
  else
    v11 = 0;
  *(_BYTE *)(v10 + 24) = v11;
  v12 = objc_msgSend(*(id *)(a1 + 32), "setTargetedFactorPackSetId:targetedTargetingRuleIndex:forDeployment:usingTransaction:", 0, 0, *(_QWORD *)(a1 + 40), v5);

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

uint64_t __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)deactivateDeploymentsWithRolloutId:(id)a3 deactivatedDeployment:(id *)a4 deactivatedFactorPackSetId:(id *)a5 deactivatedRampId:(id *)a6 deactivationStateTransitions:(id)a7 usingTransaction:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  char v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD);
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t *v35;
  id *v36;
  id *v37;
  id *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (v15)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 884, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 885, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deactivatedDeployment"));

LABEL_3:
  v18 = *a4;
  *a4 = 0;

  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 887, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deactivatedFactorPackSetId"));

  }
  v19 = *a5;
  *a5 = 0;

  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  v20 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke;
  v32[3] = &unk_1E9333A98;
  v35 = &v39;
  v32[4] = self;
  v21 = v15;
  v33 = v21;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  v22 = v16;
  v34 = v22;
  v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v32);
  v24 = v23;
  if (v17)
  {
    ((void (**)(_QWORD, id))v23)[2](v23, v17);
  }
  else
  {
    v30[0] = v20;
    v30[1] = 3221225472;
    v30[2] = __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_142;
    v30[3] = &unk_1E932F4E8;
    v31 = v23;
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v30);

  }
  v25 = *((_BYTE *)v40 + 24);

  _Block_object_dispose(&v39, 8);
  return v25;
}

uint64_t __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unsigned __int8 *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_2;
  v22[3] = &unk_1E9333A70;
  v23 = v5;
  v7 = v4;
  v24 = v7;
  v26 = *(_OWORD *)(a1 + 64);
  v27 = *(_QWORD *)(a1 + 80);
  v25 = *(id *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "enumerateRecordsWithRolloutId:usingTransaction:block:", v23, v3, v22);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(a1 + 32), "deactivateDeployment:usingTransaction:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), v3, (_QWORD)v18);
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (*(_BYTE *)(v15 + 24))
            v16 = v14;
          else
            v16 = 0;
          *(_BYTE *)(v15 + 24) = v16;
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v11);
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }

  return *v8;
}

void __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void **v13;
  void *v14;
  uint64_t v15;
  void **v16;
  void *v17;
  uint64_t v18;
  void **v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void **v24;
  void *v25;
  uint64_t v26;
  void **v27;
  void *v28;
  uint64_t v29;
  void **v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "activeFactorPackSetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v3, "targetedFactorPackSetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_11;
  }
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    objc_msgSend(v3, "deployment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v7;
    v34 = 1024;
    v35 = objc_msgSend(v8, "deploymentId");
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Deactivating rollout deployments matching %{public}@: %d", (uint8_t *)&v32, 0x12u);

  }
  v9 = (void *)a1[5];
  objc_msgSend(v3, "deployment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  objc_msgSend(v3, "activeFactorPackSetId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "deployment");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void **)a1[7];
    v14 = *v13;
    *v13 = (void *)v12;

    objc_msgSend(v3, "activeFactorPackSetId");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void **)a1[8];
    v17 = *v16;
    *v16 = (void *)v15;

    objc_msgSend(v3, "rampId");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void **)a1[9];
    v20 = *v19;
    *v19 = (void *)v18;

    v21 = (void *)a1[6];
    if (v21)
    {
      v22 = CFSTR("roll_st_DE");
LABEL_9:
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v3);
    }
  }
  else if (!*(_QWORD *)a1[7])
  {
    objc_msgSend(v3, "deployment");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void **)a1[7];
    v25 = *v24;
    *v24 = (void *)v23;

    objc_msgSend(v3, "targetedFactorPackSetId");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void **)a1[8];
    v28 = *v27;
    *v27 = (void *)v26;

    objc_msgSend(v3, "rampId");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void **)a1[9];
    v31 = *v30;
    *v30 = (void *)v29;

    v21 = (void *)a1[6];
    if (v21)
    {
      v22 = CFSTR("obsoleted-unknown-previous-state");
      goto LABEL_9;
    }
  }
LABEL_11:

}

uint64_t __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasRecordReferencingFactorPackSetId:(id)a3 withReferenceType:(unsigned int)a4
{
  id v7;
  id v8;
  char v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  SEL v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutDatabase.m"), 940, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke;
  v12[3] = &unk_1E9333AC0;
  v16 = a4;
  v15 = a2;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  v14 = &v17;
  -[TRIRolloutDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 64) - 1;
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIRolloutDatabase.m"), 956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("whereClause"));

    v5 = 0;
  }
  else
  {
    v5 = off_1E9333AF8[v4];
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" SELECT * FROM     rolloutsV2 WHERE %@ LIMIT 1"), v5);
  objc_msgSend(v3, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2;
  v16[3] = &unk_1E932F1F0;
  v17 = *(id *)(a1 + 40);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3;
  v15[3] = &unk_1E9332A70;
  v15[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v16, v15, v10);

  v11 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if ((_DWORD)v9)
    v13 = v11;
  else
    v13 = v12;
  return *v13;
}

uint64_t __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":setId", *(_QWORD *)(a1 + 32));
}

uint64_t __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
