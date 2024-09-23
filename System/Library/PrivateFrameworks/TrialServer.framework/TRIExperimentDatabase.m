@implementation TRIExperimentDatabase

- (BOOL)_enumerateExperimentRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
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
  TRIExperimentDatabase *v37;
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
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

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
  v64 = __Block_byref_object_copy__38;
  v65 = __Block_byref_object_dispose__38;
  v14 = MEMORY[0x1E0C809B0];
  v66 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke;
  v60[3] = &unk_1E9334FD0;
  v60[4] = &v61;
  v15 = (void *)MEMORY[0x1D8232C48](v60);
  v56[0] = v14;
  v56[1] = 3221225472;
  v56[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v56[3] = &unk_1E932F290;
  v59 = &v61;
  v16 = v13;
  v57 = v16;
  v17 = v12;
  v58 = v17;
  v18 = (void *)MEMORY[0x1D8232C48](v56);
  v54[0] = v14;
  v54[1] = 3221225472;
  v54[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_3;
  v54[3] = &unk_1E9334FF8;
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
  v43[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_4;
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
  v35[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_105;
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
  -[TRIExperimentDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v35);
  v29 = *((_BYTE *)v51 + 24);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v61, 8);

  objc_autoreleasePoolPop(context);
  return v29;
}

- (BOOL)enumerateExperimentRecordsWithBlock:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 663, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = -[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", 0, 0, v5);

  return v6;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (void)activeCountWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E9363738);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__TRIExperimentDatabase_CountProviding__activeCountWithCompletion___block_invoke;
  v9[3] = &unk_1E9330E28;
  v9[4] = &v14;
  v9[5] = &v10;
  v6 = (void *)MEMORY[0x1D8232C48](v9);
  if (-[TRIExperimentDatabase enumerateExperimentRecordsMatchingStatuses:block:](self, "enumerateExperimentRecordsMatchingStatuses:block:", v5, v6))
  {
    v7 = v15[3];
    v8 = v11[3];
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v4[2](v4, v7, v8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

void __67__TRIExperimentDatabase_CountProviding__activeCountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isShadow");
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(v6, "deploymentEnvironment"))
      v5 = *(_QWORD *)(a1 + 40);
    else
      v5 = *(_QWORD *)(a1 + 32);
    ++*(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
    v4 = v6;
  }

}

- (TRIExperimentDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIExperimentDatabase *v7;
  TRIExperimentDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIExperimentDatabase;
  v7 = -[TRIExperimentDatabase init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- ($61A80719B04F7407D3E47539F1B23CAA)addExperimentWithExperimentDeployment:(id)a3 environment:(int)a4 type:(int)a5 status:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 namespaces:(id)a9 artifact:(id)a10
{
  uint64_t v13;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  $61A80719B04F7407D3E47539F1B23CAA v27;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  TRIExperimentDatabase *v44;
  id v45;
  _BYTE *v46;
  int64_t v47;
  int v48;
  int v49;
  _BYTE buf[24];
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  v13 = *(_QWORD *)&a5;
  v53 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a7;
  v38 = a8;
  v19 = a9;
  v20 = a10;
  if (v17)
  {
    if (v19)
      goto LABEL_3;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces"));

    if (v20)
      goto LABEL_4;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  if (!v19)
    goto LABEL_27;
LABEL_3:
  if (v20)
    goto LABEL_4;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifact"));

LABEL_4:
  if ((v13 & 0xFFFFFFFD) == 1)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(v19, "_pas_leftFoldWithInitialObject:accumulate:", v21, &__block_literal_global_23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "count");
    if (v23 != objc_msgSend(v19, "count"))
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "shortDesc");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v30;
        _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Namespace names in experiment %{public}@ are not unique.", buf, 0xCu);

      }
      goto LABEL_18;
    }

    if (v18 && v38 && objc_msgSend(v18, "compare:", v38) != -1)
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "shortDesc");
        v31 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2114;
        v51 = v31;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Start date (%@) does not precede end date (%@) in experiment %{public}@.", buf, 0x20u);

      }
      goto LABEL_18;
    }
    if ((_DWORD)v13 == 2 || (objc_msgSend(v17, "hasDeploymentId") & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2810000000;
      v51 = "";
      v52 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_23;
      v39[3] = &unk_1E9334F80;
      v48 = a4;
      v49 = v13;
      v40 = v17;
      v47 = a6;
      v41 = v18;
      v42 = v38;
      v43 = v20;
      v44 = self;
      v46 = buf;
      v45 = v19;
      -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v39);
      v27.var0 = *(_QWORD *)(*(_QWORD *)&buf[8] + 32);

      _Block_object_dispose(buf, 8);
      goto LABEL_19;
    }
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      TRICloudKitSupport_NotificationType_EnumDescriptor();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textFormatNameForValue:", v13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "experimentId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v34;
      _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Refusing to add experiment record of type %@ with id %{public}@ and missing deploymentId", buf, 0x16u);

    }
  }
  else
  {
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "shortDesc");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)&buf[8] = 2114;
      *(_QWORD *)&buf[10] = v29;
      _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Refusing to add experiment record of type %d with experiment deployment  %{public}@", buf, 0x12u);

    }
  }

LABEL_18:
  v27.var0 = 0;
LABEL_19:

  return v27;
}

id __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_msgSend(a3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

uint64_t __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_23(uint64_t a1, void *a2)
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
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id obj;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  int v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_set_last_insert_rowid((sqlite3 *)objc_msgSend(v4, "handle"), 0x8000000000000000);

  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_2;
  v32[3] = &unk_1E9334F58;
  v38 = *(_DWORD *)(a1 + 96);
  v6 = *(id *)(a1 + 32);
  v39 = *(_DWORD *)(a1 + 100);
  v7 = *(_QWORD *)(a1 + 88);
  v33 = v6;
  v37 = v7;
  v34 = *(id *)(a1 + 40);
  v35 = *(id *)(a1 + 48);
  v36 = *(id *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "generalErrorHandlerWithOutError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR IGNORE INTO experiments(    deploymentEnvironment,     experimentId,     deploymentId,     type,     status,     startSecondsFromEpoch,     endSecondsFromEpoch,     isShadow,     artifact) VALUES(    :deployment_env,     :experiment_id,     :deployment_id,     :type,     :status,     :start_seconds,     :end_seconds,     :is_shadow,     :artifact);"),
         v32,
         0,
         v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(v10, "handle"));

    if (insert_rowid == 0x8000000000000000)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v13 = 2;
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = *(id *)(a1 + 72);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18);
            v20 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v3, "db");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_3;
            v27[3] = &unk_1E932F218;
            v27[4] = v19;
            v27[5] = insert_rowid;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "generalErrorHandlerWithOutError:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO namespaces(    experiments_rowid,     name,     compatibilityVersion) VALUES(    :experiments_rowid,     :name,     :compatibility_version);"),
                    v27,
                    0,
                    v22);

            if (!v23)
            {
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = 0;
              v24 = *MEMORY[0x1E0D81680];
              objc_autoreleasePoolPop(v20);

              goto LABEL_16;
            }
            objc_autoreleasePoolPop(v20);
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          if (v16)
            continue;
          break;
        }
      }

      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v13 = 1;
    }
    *(_QWORD *)(v12 + 32) = v13;
    v14 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = 0;
    v14 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  v24 = *v14;
LABEL_16:

  return v24;
}

void __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_2(uint64_t a1, void *a2)
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
  id v12;

  v12 = a2;
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":deployment_env", *(int *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toNSString:", ":experiment_id", v3);

  objc_msgSend(v12, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":type", *(int *)(a1 + 76));
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":status", *(_QWORD *)(a1 + 64));
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bindNamedParam:toDoubleAsNSNumber:", ":start_seconds", v6);

  }
  else
  {
    objc_msgSend(v12, "bindNamedParam:toDoubleAsNSNumber:", ":start_seconds", 0);
  }
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bindNamedParam:toDoubleAsNSNumber:", ":end_seconds", v9);

  }
  else
  {
    objc_msgSend(v12, "bindNamedParam:toDoubleAsNSNumber:", ":end_seconds", 0);
  }
  objc_msgSend(*(id *)(a1 + 56), "experiment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":is_shadow", objc_msgSend(v10, "hasShadowEvaluation"));

  objc_msgSend(*(id *)(a1 + 56), "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toNSData:", ":artifact", v11);

}

void __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":experiments_rowid", v3);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":name", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":compatibility_version", objc_msgSend(*(id *)(a1 + 32), "compatibilityVersion"));
}

- (BOOL)setStatus:(int64_t)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
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
  TRIExperimentDatabase *v19;
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke;
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
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v14 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F218;
  v14 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E932F218);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE experiments SET         status = :status WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;"),
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

void __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":status", v3);
  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)setTreatmentId:(id)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  TRIExperimentDatabase *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke;
  v20 = &unk_1E932F240;
  v11 = v8;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v23 = self;
  v24 = &v25;
  v13 = MEMORY[0x1D8232C48](&v17);
  v14 = (void *)v13;
  if (v10)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v10);
  else
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v13, v17, v18, v19, v20, v21);
  v15 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return v15;
}

uint64_t __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932FCA8;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E932FCA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE experiments SET         treatmentId = :treatment_id WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8)
      *(_BYTE *)(v9 + 24) = 1;
    else
      *(_BYTE *)(v9 + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":treatment_id", v3);
  objc_msgSend(*(id *)(a1 + 40), "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 40), "deploymentId"));
}

- (BOOL)setTreatmentId:(id)a3 factorPackSetId:(id)a4 forExperimentDeployment:(id)a5 usingTransaction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  TRIExperimentDatabase *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke;
  v23[3] = &unk_1E932F4C0;
  v15 = v11;
  v24 = v15;
  v16 = v12;
  v25 = v16;
  v17 = v13;
  v26 = v17;
  v27 = self;
  v28 = &v29;
  v18 = MEMORY[0x1D8232C48](v23);
  v19 = (void *)v18;
  if (v14)
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v14);
  else
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v18);
  v20 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v20;
}

uint64_t __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932F498;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE experiments SET         treatmentId = :treatment_id,     factorPackSetId = :factor_pack_set_id WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;"),
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

void __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":treatment_id", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":factor_pack_set_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)setTreatmentURL:(id)a3 forExperimentDeployment:(id)a4 namespaceName:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  TRIExperimentDatabase *v23;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

    if (v11)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentURL"));

  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_4:
  objc_msgSend(v9, "triSaveURLToString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x2020000000;
    v27 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke;
    v19[3] = &unk_1E932F4C0;
    v20 = v10;
    v21 = v12;
    v22 = v11;
    v23 = self;
    p_buf = &buf;
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v19);
    v13 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "failed to convert URL to string: %@", (uint8_t *)&buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

uint64_t __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke_2;
  v12[3] = &unk_1E932F498;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" WITH experiments_rowids AS(    SELECT rowid FROM             experiments     WHERE             experimentId = :experiment_id         AND deploymentId = :deployment_id     LIMIT 1) UPDATE namespaces SET         treatmentPath = :treatment_path WHERE         name = :namespace_name     AND experiments_rowid IN experiments_rowids;"),
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

void __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":treatment_path", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":namespace_name", *(_QWORD *)(a1 + 48));

}

- (BOOL)setManuallyTargeted:(BOOL)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
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
  TRIExperimentDatabase *v19;
  uint64_t *v20;
  BOOL v21;
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E9333A20;
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
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v14 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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
  char v14;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E9334FA8;
  v14 = *(_BYTE *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E9334FA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE experiments SET         isManuallyTargeted = :is_manually_targeted WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;"),
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

void __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":is_manually_targeted", v3);
  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)updateEndDate:(id)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  TRIExperimentDatabase *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updatedEndDate"));

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke;
  v19[3] = &unk_1E932F240;
  v12 = v9;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  v22 = self;
  v23 = &v24;
  v14 = MEMORY[0x1D8232C48](v19);
  v15 = (void *)v14;
  if (v11)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v11);
  else
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v14);
  v16 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
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

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E932FCA8;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E932FCA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE experiments SET         endSecondsFromEpoch = :end_seconds WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8)
      *(_BYTE *)(v9 + 24) = 1;
    else
      *(_BYTE *)(v9 + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toDoubleAsNSNumber:", ":end_seconds", v5);

  }
  else
  {
    objc_msgSend(v7, "bindNamedParam:toDoubleAsNSNumber:", ":end_seconds", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":experiment_id", v6);

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 40), "deploymentId"));
}

void __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, _BYTE *a2)
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

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  TRIExperimentRecord *v29;
  TRIExperimentRecord *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "rowid", "experiments");
  if (v4 == *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
    goto LABEL_2;
  (*(void (**)(void))(a1[5] + 16))();
  if (*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
  {
    v11 = *MEMORY[0x1E0D81788];
    goto LABEL_11;
  }
  v13 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentEnvironment", "experiments");
  objc_msgSend(v3, "getNSStringForColumnName:table:", "experimentId", "experiments");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentId", "experiments");
  v37 = objc_msgSend(v3, "getInt64ForColumnName:table:", "type", "experiments");
  v36 = objc_msgSend(v3, "getInt64ForColumnName:table:", "status", "experiments");
  objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "startSecondsFromEpoch", "experiments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v15, "doubleValue");
    v40 = (void *)objc_msgSend(v16, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v40 = 0;
  }

  objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "endSecondsFromEpoch", "experiments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v17, "doubleValue");
    v19 = (void *)objc_msgSend(v18, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(v3, "getNSStringForColumnName:table:", "treatmentId", "experiments");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "factorPackSetId", "experiments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "getInt64ForColumnName:table:", "isShadow", "experiments");
  v21 = objc_msgSend(v3, "getInt64ForColumnName:table:", "isManuallyTargeted", "experiments");
  objc_msgSend(v3, "getNSDataForColumnName:table:", "artifact", "experiments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIExperimentDatabase.m"), 550, CFSTR("Unexpected NULL artifact"));

  }
  v42 = 0;
  +[TRIClientExperimentArtifact parseFromData:error:](TRIClientExperimentArtifact, "parseFromData:error:", v22, &v42);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    v35 = v13;
    v25 = v19;

    v26 = v41;
    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIExperimentDatabase.m"), 561, CFSTR("Unexpected NULL experimentId"));

      v26 = 0;
    }
    v27 = v21 != 0;
    objc_msgSend(MEMORY[0x1E0DC0A30], "deploymentWithExperimentId:deploymentId:", v26, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = [TRIExperimentRecord alloc];
    BYTE1(v34) = v27;
    LOBYTE(v34) = v20 != 0;
    v30 = -[TRIExperimentRecord initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:](v29, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", v35, v28, v39, v38, v37, v36, v40, v25, MEMORY[0x1E0C9AA60], v34, v24);
    (*(void (**)(void))(a1[6] + 16))();

LABEL_2:
    objc_msgSend(v3, "getNSStringForColumnName:table:", "name", "namespaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_8:
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
      v11 = *MEMORY[0x1E0D81780];

      goto LABEL_11;
    }
    v6 = objc_msgSend(v3, "getInt64ForColumnName:table:", "compatibilityVersion", "namespaces");
    objc_msgSend(v3, "getNSStringForColumnName:table:", "treatmentPath", "namespaces");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "triParseURLFromString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_7:
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B00]), "initWithName:compatibilityVersion:treatmentURL:", v5, v6, v8);
        (*(void (**)(void))(a1[7] + 16))();

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIExperimentDatabase.m"), 588, CFSTR("failed to parse url from %@"), v7);

    }
    v8 = 0;
    goto LABEL_7;
  }
  TRILogCategory_Server();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v44 = v41;
    v45 = 1024;
    v46 = v14;
    v47 = 2114;
    v48 = v42;
    _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to parse persisted TRIClientExperiment Artifact for %{public}@.%d: %{public}@", buf, 0x1Cu);
  }

  v11 = *MEMORY[0x1E0D81780];
LABEL_11:

  return v11;
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_105(_QWORD *a1, void *a2)
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
  char v13;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (const __CFString *)a1[4];
  if (!v6)
    v6 = &stru_1E9336E60;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM     experiments AS e LEFT JOIN     namespaces AS n ON     e.rowid = n.experiments_rowid %@ ORDER BY     e.rowid ASC,     n.rowid ASC;"),
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
    v12 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    v13 = 1;
  }
  else
  {
    v13 = 0;
    v12 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = v13;

  return *v12;
}

- (id)experimentRecordWithExperimentDeployment:(id)a3
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

  }
  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment.experimentId"));

  }
  if ((objc_msgSend(v5, "hasDeploymentId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment.hasDeploymentId"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__38;
  v22 = __Block_byref_object_dispose__38;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke;
  v16[3] = &unk_1E932F1F0;
  v8 = v5;
  v17 = v8;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke_2;
  v15[3] = &unk_1E9332ED0;
  v15[4] = &v18;
  if (-[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE         e.experimentId = :experiment_id     AND e.deploymentId = :deployment_id"), v16, v15))
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

void __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

void __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)enumerateExperimentRecordsMatchingExperimentId:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 671, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__TRIExperimentDatabase_enumerateExperimentRecordsMatchingExperimentId_block___block_invoke;
  v13[3] = &unk_1E932F1F0;
  v14 = v7;
  v9 = v7;
  v10 = -[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE e.experimentId = :experiment_id"), v13, v8);

  return v10;
}

uint64_t __78__TRIExperimentDatabase_enumerateExperimentRecordsMatchingExperimentId_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":experiment_id", *(_QWORD *)(a1 + 32));
}

- (BOOL)enumerateExperimentRecordsMatchingStatuses:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 683, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statuses"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__TRIExperimentDatabase_enumerateExperimentRecordsMatchingStatuses_block___block_invoke;
  v13[3] = &unk_1E932F1F0;
  v14 = v7;
  v9 = v7;
  v10 = -[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE e.status IN _pas_nsset(:status_set)"), v13, v8);

  return v10;
}

uint64_t __74__TRIExperimentDatabase_enumerateExperimentRecordsMatchingStatuses_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":status_set", *(_QWORD *)(a1 + 32));
}

- (BOOL)enumerateExperimentRecordsMatchingNamespaceName:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 695, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__TRIExperimentDatabase_enumerateExperimentRecordsMatchingNamespaceName_block___block_invoke;
  v13[3] = &unk_1E932F1F0;
  v14 = v7;
  v9 = v7;
  v10 = -[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE n.name = :namespace_name"), v13, v8);

  return v10;
}

uint64_t __79__TRIExperimentDatabase_enumerateExperimentRecordsMatchingNamespaceName_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":namespace_name", *(_QWORD *)(a1 + 32));
}

- (BOOL)enumerateNamespaceRecordsForExperimentDeployment:(id)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  TRIExperimentDatabase *v23;
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
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 708, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 709, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke;
  v21[3] = &unk_1E9335020;
  v13 = v9;
  v26 = a2;
  v22 = v13;
  v23 = self;
  v14 = v12;
  v24 = v14;
  v25 = &v27;
  v15 = MEMORY[0x1D8232C48](v21);
  v16 = (void *)v15;
  if (v10)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v10);
  else
    -[TRIExperimentDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v15);
  v17 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  _QWORD v13[4];
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_2;
  v17[3] = &unk_1E932F1F0;
  v18 = *(id *)(a1 + 32);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_3;
  v13[3] = &unk_1E93305E8;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  v14 = v5;
  v15 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v4, 3221225472, __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_3, &unk_1E93305E8, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" WITH experiments_rowids AS(    SELECT rowid FROM             experiments     WHERE             experimentId = :experiment_id         AND deploymentId = :deployment_id     LIMIT 1) SELECT * FROM     namespaces WHERE     experiments_rowid IN experiments_rowids ORDER BY rowid ASC;"),
         v17,
         v13,
         v7);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if (v8)
    v11 = v9;
  else
    v11 = v10;
  return *v11;
}

void __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

uint64_t __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  void *v15;
  unsigned __int8 v16;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "name", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIExperimentDatabase.m"), 733, CFSTR("NULL namespaceName decoded from NOT NULL column"));

  }
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "compatibilityVersion", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "treatmentPath", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "triParseURLFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIExperimentDatabase.m"), 740, CFSTR("failed to parse url from %@"), v6);

  }
  v7 = 0;
LABEL_7:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B00]), "initWithName:compatibilityVersion:treatmentURL:", v4, v5, v7);
  v16 = 0;
  (*(void (**)(void))(a1[5] + 16))();
  v10 = v16;
  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if (v10)
    v13 = v12;
  else
    v13 = v11;
  return *v13;
}

- (id)treatmentURLsForExperimentDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 771, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  }
  v9 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__TRIExperimentDatabase_treatmentURLsForExperimentDeployment_usingTransaction___block_invoke;
  v15[3] = &unk_1E9335048;
  v16 = v9;
  v10 = v9;
  if (-[TRIExperimentDatabase enumerateNamespaceRecordsForExperimentDeployment:usingTransaction:block:](self, "enumerateNamespaceRecordsForExperimentDeployment:usingTransaction:block:", v7, v8, v15))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

void __79__TRIExperimentDatabase_treatmentURLsForExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "treatmentURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

- (BOOL)namespacesAreAvailableForExperiment:(id)a3 startDate:(id)a4 endDate:(id)a5 namespaces:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _BYTE buf[24];
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 786, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

    if (v15)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_8:
      v12 = (id)objc_opt_new();
      if (v13)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 787, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces"));

  if (!v12)
    goto LABEL_8;
LABEL_4:
  if (v13)
    goto LABEL_10;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  if (objc_msgSend(v12, "compare:", v13) == 1)
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "experimentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v11, "deploymentId");
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Trying to enumerate records overlapping inverted time range for experiment: %{public}@, deployment:%d.", buf, 0x12u);

    }
    v19 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v30 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke;
    v24[3] = &unk_1E9335070;
    v25 = v11;
    v26 = v12;
    v27 = v13;
    v28 = v15;
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke_2;
    v23[3] = &unk_1E9332ED0;
    v23[4] = buf;
    if (-[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE         (e.experimentId != :experiment_id OR e.deploymentId != :deployment_id)     AND e.type IN (:type_update)     AND e.status IN (:status_enroll, :status_active)     AND e.isShadow = 0     AND(            e.startSecondsFromEpoch IS NULL         OR  e.endSecondsFromEpoch IS NULL         OR  max(:start_seconds, e.startSecondsFromEpoch) < min(:end_seconds, e.endSecondsFromEpoch)    )     AND n.name IN _pas_nsarray(:namespaces)"), v24, v23))
    {
      v19 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;
    }
    else
    {
      v19 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

void __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":type_update", 1);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":status_enroll", 2);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":status_active", 1);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":start_seconds");
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":end_seconds");
  objc_msgSend(v5, "bindNamedParam:toNSArray:", ":namespaces", *(_QWORD *)(a1 + 56));

}

uint64_t __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeExperimentRecordWithExperimentDeployment:(id)a3
{
  id v5;
  id v6;
  $61A80719B04F7407D3E47539F1B23CAA v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2810000000;
  v16 = "";
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke;
  v10[3] = &unk_1E932F650;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  v12 = &v13;
  -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v10);
  v7.var0 = v14[4];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke(_QWORD *a1, void *a2)
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
  int v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(void **)(a1[4] + 8);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke_2;
  v25 = &unk_1E932F1F0;
  v26 = v4;
  objc_msgSend(v5, "createTempTableContainingRowsFromQuery:bind:namePrefix:transaction:", CFSTR(" SELECT rowid FROM         experiments WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id"), &v22, CFSTR("remove_exp_rowids"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32) = 0;
    v19 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_12:
    v20 = *v19;
    goto LABEL_13;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR(" DELETE FROM     namespaces WHERE     experiments_rowid IN %@;"),
                 v6,
                 v22,
                 v23,
                 v24,
                 v25);
  objc_msgSend(v3, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, v10);

  if ((v11 & 1) != 0)
  {

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     experiments WHERE     rowid IN %@;"),
                   v6);
    objc_msgSend(v3, "db");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, v13);

    if ((v14 & 1) != 0)
    {

      objc_msgSend(v3, "db");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = sqlite3_changes((sqlite3 *)objc_msgSend(v15, "handle"));

      v17 = objc_msgSend(*(id *)(a1[4] + 8), "dropTableWithName:transaction:", v6, v3);
      v18 = 1;
      if (v16 <= 0)
        v18 = 2;
      if (!v17)
        v18 = 0;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32) = v18;
      v19 = (unsigned __int8 *)MEMORY[0x1E0D81678];
      if (!v17)
        v19 = (unsigned __int8 *)MEMORY[0x1E0D81680];
      goto LABEL_12;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32) = 0;
  v20 = *MEMORY[0x1E0D81680];

LABEL_13:
  return v20;
}

void __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":experiment_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)hasRecordReferencingTreatmentId:(id)a3 withReferenceType:(unsigned int)a4
{
  id v7;
  id v8;
  char v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 911, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke;
  v12[3] = &unk_1E9335098;
  v12[4] = self;
  v15 = a4;
  v8 = v7;
  v13 = v8;
  v14 = &v16;
  -[TRIExperimentDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned int *)(a1 + 56);
  v5 = a2;
  objc_msgSend(v3, "_statusTypesForFactorPackSetReferenceType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_2;
  v17[3] = &unk_1E932FCA8;
  v18 = *(id *)(a1 + 40);
  v19 = v6;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_3;
  v16[3] = &unk_1E9332A70;
  v16[4] = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = v6;
  objc_msgSend(v9, "generalErrorHandlerWithOutError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     experiments WHERE         treatmentId = :treatment_id     AND status IN _pas_nsset(:status_set) LIMIT 1"), v17, v16, v11);

  v12 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if ((_DWORD)v8)
    v14 = v12;
  else
    v14 = v13;
  return *v14;
}

void __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":treatment_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSSet:", ":status_set", *(_QWORD *)(a1 + 40));

}

uint64_t __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
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
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 945, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke;
  v12[3] = &unk_1E9335098;
  v12[4] = self;
  v15 = a4;
  v8 = v7;
  v13 = v8;
  v14 = &v16;
  -[TRIExperimentDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned int *)(a1 + 56);
  v5 = a2;
  objc_msgSend(v3, "_statusTypesForFactorPackSetReferenceType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2;
  v17[3] = &unk_1E932FCA8;
  v18 = *(id *)(a1 + 40);
  v19 = v6;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3;
  v16[3] = &unk_1E9332A70;
  v16[4] = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = v6;
  objc_msgSend(v9, "generalErrorHandlerWithOutError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     experiments WHERE         factorPackSetId = :factor_pack_set_id     AND status IN _pas_nsset(:status_set) LIMIT 1"), v17, v16, v11);

  v12 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if ((_DWORD)v8)
    v14 = v12;
  else
    v14 = v13;
  return *v14;
}

void __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":factor_pack_set_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSSet:", ":status_set", *(_QWORD *)(a1 + 40));

}

uint64_t __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (id)_statusTypesForFactorPackSetReferenceType:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1)
  {
    v6 = (void *)MEMORY[0x1D8232A5C]();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E9363F18, 0, v13);
  }
  else
  {
    if (a3 == 3)
    {
      v6 = (void *)MEMORY[0x1D8232A5C]();
      v7 = objc_alloc(MEMORY[0x1E0C99E60]);
      v12 = &unk_1E9363F18;
      v13 = 0;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 988, CFSTR("Unhandled reference type: 0x%x"), v3);

        v9 = 0;
        return v9;
      }
      v6 = (void *)MEMORY[0x1D8232A5C]();
      v7 = objc_alloc(MEMORY[0x1E0C99E60]);
      v12 = 0;
    }
    v8 = objc_msgSend(v7, "initWithObjects:", &unk_1E9363F00, v12, v13);
  }
  v9 = (void *)v8;
  objc_autoreleasePoolPop(v6);
  if (!v9)
    goto LABEL_9;
  return v9;
}

- (BOOL)enumerateActiveExperimentRecordsWithVisibility:(unsigned int)a3 block:(id)a4
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v7 = a4;
  if (a3 - 1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentDatabase.m"), 1006, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("andClause"));

    v8 = 0;
  }
  else
  {
    v8 = off_1E93350D8[a3 - 1];
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WHERE status = :status_active %@"), v8);
  v11 = -[TRIExperimentDatabase _enumerateExperimentRecordsMatchingWhereClause:bind:block:](self, "_enumerateExperimentRecordsMatchingWhereClause:bind:block:", v10, &__block_literal_global_172, v7);

  return v11;
}

uint64_t __78__TRIExperimentDatabase_enumerateActiveExperimentRecordsWithVisibility_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":status_active", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
