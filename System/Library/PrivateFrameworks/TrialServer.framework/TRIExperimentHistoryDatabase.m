@implementation TRIExperimentHistoryDatabase

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (BOOL)enumerateRecordsNewerThanDate:(id)a3 matchingDeploymentEnvironments:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentEnvironments"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__TRIExperimentHistoryDatabase_enumerateRecordsNewerThanDate_matchingDeploymentEnvironments_block___block_invoke;
  v19[3] = &unk_1E932FCA8;
  v20 = v10;
  v21 = v9;
  v12 = v9;
  v13 = v10;
  v14 = -[TRIExperimentHistoryDatabase _enumerateRecordsMatchingWhereClause:bind:block:](self, "_enumerateRecordsMatchingWhereClause:bind:block:", CFSTR(" WHERE         e.deploymentEnvironment IN _pas_nsset(:matching_envs)     AND e.eventSecondsFromEpoch > :threshold"), v19, v11);

  return v14;
}

- (unsigned)previousExperimentStateForTriple:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "deploymentId");
  objc_msgSend(v4, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIExperimentHistoryDatabase getAllAllocationStatusesForExperimentId:deploymentId:treatmentId:](self, "getAllAllocationStatusesForExperimentId:deploymentId:treatmentId:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "intValue");

  return v5;
}

- (BOOL)storeExperimentEvent:(id)a3 wasNewEvent:(BOOL *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = -[TRIExperimentHistoryDatabase _isPreviouslyRecordedStateForEvent:](self, "_isPreviouslyRecordedStateForEvent:", v6);
  if (a4)
    *a4 = !v7;
  objc_msgSend(v6, "experimentRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TRIExperimentHistoryDatabase addRecord:](self, "addRecord:", v8);
  return v9;
}

- (BOOL)_isPreviouslyRecordedStateForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "treatmentTriple");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentTriple");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deploymentId");
  objc_msgSend(v4, "treatmentTriple");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "treatmentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentHistoryDatabase getAllAllocationStatusesForExperimentId:deploymentId:treatmentId:](self, "getAllAllocationStatusesForExperimentId:deploymentId:treatmentId:", v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "eventType");

  objc_msgSend(v12, "numberWithUnsignedChar:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v11, "containsObject:", v14);

  return (char)v12;
}

- (TRIExperimentHistoryDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIExperimentHistoryDatabase *v7;
  TRIExperimentHistoryDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIExperimentHistoryDatabase;
  v7 = -[TRIExperimentHistoryDatabase init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- (BOOL)addRecord:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  TRIExperimentHistoryDatabase *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__TRIExperimentHistoryDatabase_addRecord___block_invoke;
  v15[3] = &unk_1E932F240;
  v16 = CFSTR(" INSERT INTO experimentHistory(    eventSecondsFromEpoch,     eventType,     deploymentEnvironment,     experimentId,     deploymentId,     treatmentId,     errorOrDeactivationReason) VALUES(    :timestamp,     :event_type,     :environment,     :exp_id,     :dep_id,     :trt_id,     :reason);");
  v6 = v5;
  v17 = v6;
  v18 = self;
  v19 = &v20;
  -[TRIExperimentHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v15);
  if (*((_BYTE *)v21 + 24))
  {
    objc_msgSend(MEMORY[0x1E0DC0988], "internalToExternalStatusMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v6, "eventType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC0988], "notificationNameForDeploymentEnvironment:", objc_msgSend(v6, "deploymentEnvironment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        notify_post((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));

    }
  }
  v12 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __42__TRIExperimentHistoryDatabase_addRecord___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  id obj;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_2;
  v27[3] = &unk_1E932F1F0;
  v5 = *(_QWORD *)(a1 + 32);
  v28 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v5, v27, 0, v6);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "lastInsertRowId");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "namespaces");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v3, "db");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_3;
          v22[3] = &unk_1E932F218;
          v22[4] = v13;
          v22[5] = v8;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO experimentHistoryNamespaces(    experimentHistory_rowid,     name,     compatibilityVersion) VALUES(    :exp_rowid,     :name,     :cv);"),
                  v22,
                  0,
                  v16);

          objc_autoreleasePoolPop(v14);
          if (!v17)
          {
            v19 = *MEMORY[0x1E0D81680];

            goto LABEL_14;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v10)
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
LABEL_14:

  return v19;
}

void __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "eventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":event_type", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":environment", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentEnvironment"));
  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":exp_id", v6);

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":dep_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  objc_msgSend(*(id *)(a1 + 32), "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":trt_id", v7);

  objc_msgSend(*(id *)(a1 + 32), "errorOrDeactivationReason");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":reason", v8);

}

void __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":exp_rowid", v3);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":name", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":cv", objc_msgSend(*(id *)(a1 + 32), "compatibilityVersion"));
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
  TRIExperimentHistoryDatabase *v37;
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
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

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
  v64 = __Block_byref_object_copy__59;
  v65 = __Block_byref_object_dispose__59;
  v14 = MEMORY[0x1E0C809B0];
  v66 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v60[3] = &unk_1E9336B08;
  v60[4] = &v61;
  v15 = (void *)MEMORY[0x1D8232C48](v60);
  v56[0] = v14;
  v56[1] = 3221225472;
  v56[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v56[3] = &unk_1E932F290;
  v59 = &v61;
  v16 = v13;
  v57 = v16;
  v17 = v12;
  v58 = v17;
  v18 = (void *)MEMORY[0x1D8232C48](v56);
  v54[0] = v14;
  v54[1] = 3221225472;
  v54[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3;
  v54[3] = &unk_1E9336B30;
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
  v43[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4;
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
  v35[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5;
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
  -[TRIExperimentHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v35);
  v29 = *((_BYTE *)v51 + 24);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v61, 8);

  objc_autoreleasePoolPop(context);
  return v29;
}

void __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, _BYTE *a2)
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

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "rowid", "experimentHistory");
  if (v4 != *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
    if (*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
    {
      v5 = *MEMORY[0x1E0D81788];
      goto LABEL_14;
    }
    objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "eventSecondsFromEpoch", "experimentHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIExperimentHistoryDatabase.m"), 187, CFSTR("nil eventSecondsFromEpoch read from NOT NULL column"));

    }
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "doubleValue");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");

    v9 = objc_msgSend(v3, "getInt64ForColumnName:table:", "eventType", "experimentHistory");
    v10 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentEnvironment", "experimentHistory");
    objc_msgSend(v3, "getNSStringForColumnName:table:", "experimentId", "experimentHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIExperimentHistoryDatabase.m"), 193, CFSTR("nil experimentId read from NOT NULL column"));

    }
    v12 = objc_msgSend(v3, "getInt64ForColumnName:table:", "deploymentId", "experimentHistory");
    objc_msgSend(v3, "getNSStringForColumnName:table:", "treatmentId", "experimentHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("TRIExperimentHistoryDatabase.m"), 196, CFSTR("nil treatmentId read from NOT NULL column"));

    }
    objc_msgSend(v3, "getNSStringForColumnName:table:", "errorOrDeactivationReason", "experimentHistory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0DC0A40]);
    v16 = (void *)objc_msgSend(v15, "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", v8, v9, v10, v11, v12, v13, v14, MEMORY[0x1E0C9AA60]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "name", "experimentHistoryNamespaces");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_msgSend(v3, "getInt64ForColumnName:table:", "compatibilityVersion", "experimentHistoryNamespaces");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0BB0]), "initWithName:compatibilityVersion:", v17, v18);
    (*(void (**)(void))(a1[7] + 16))();

  }
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
  v5 = *MEMORY[0x1E0D81780];

LABEL_14:
  return v5;
}

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5(_QWORD *a1, void *a2)
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
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM     experimentHistory AS e LEFT JOIN     experimentHistoryNamespaces AS n ON     e.rowid = n.experimentHistory_rowid %@ ORDER BY     e.eventSecondsFromEpoch ASC,     n.rowid ASC;"),
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

void __99__TRIExperimentHistoryDatabase_enumerateRecordsNewerThanDate_matchingDeploymentEnvironments_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSSet:", ":matching_envs", v3);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":threshold");

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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E932F3A8;
  v12[4] = self;
  v8 = v7;
  v14 = &v16;
  v15 = a4;
  v13 = v8;
  -[TRIExperimentHistoryDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  int v18;
  _QWORD *v19;
  unsigned __int8 *v20;
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
  v24 = __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  v25 = &unk_1E932F1F0;
  v26 = v4;
  objc_msgSend(v5, "createTempTableContainingRowsFromQuery:bind:namePrefix:transaction:", CFSTR(" SELECT rowid FROM         experimentHistory WHERE         eventSecondsFromEpoch < :threshold"), &v22, CFSTR("remove_hist_rowids"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v20 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_9:
    v12 = *v20;
    goto LABEL_10;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR(" DELETE FROM     experimentHistoryNamespaces WHERE     experimentHistory_rowid IN %@;"),
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

  v12 = *MEMORY[0x1E0D81680];
  if (v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     experimentHistory WHERE     rowid IN %@;"),
                    v6);
    objc_msgSend(v3, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", v13, 0, 0, v15);

    if (v16)
    {
      objc_msgSend(v3, "db");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = sqlite3_changes((sqlite3 *)objc_msgSend(v17, "handle"));

      if (objc_msgSend(*(id *)(a1[4] + 8), "dropTableWithName:transaction:", v6, v3))
      {
        v19 = (_QWORD *)a1[7];
        if (v19)
          *v19 = v18;
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
        v20 = (unsigned __int8 *)MEMORY[0x1E0D81678];
        goto LABEL_9;
      }
    }
  }
LABEL_10:

  return v12;
}

void __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");

}

- (id)getAllAllocationStatusesForExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  TRIExperimentHistoryDatabase *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t *v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  _QWORD v33[3];
  char v34;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentId"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentHistoryDatabase.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId"));

  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = "experimentHistory";
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__59;
  v30 = __Block_byref_object_dispose__59;
  v31 = (id)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke;
  v18[3] = &unk_1E9336B58;
  v22 = v33;
  v11 = v9;
  v19 = v11;
  v25 = a4;
  v12 = v10;
  v23 = v32;
  v24 = &v26;
  v20 = v12;
  v21 = self;
  -[TRIExperimentHistoryDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v18);
  v13 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);

  return v13;
}

uint64_t __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD v10[4];
  __int128 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_2;
  v12[3] = &unk_1E9331478;
  v13 = *(id *)(a1 + 32);
  v15 = *(_DWORD *)(a1 + 80);
  v14 = *(id *)(a1 + 40);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_3;
  v10[3] = &unk_1E932F358;
  v11 = *(_OWORD *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM experimentHistory WHERE         experimentId = :experiment_id    AND deploymentId = :deployment_id    AND treatmentId = :treatment_id ORDER BY rowid DESC"), v12, v10, v5);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v8 = v7;
  else
    v8 = v6;
  return *v8;
}

void __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":experiment_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", *(int *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":treatment_id", *(_QWORD *)(a1 + 40));

}

uint64_t __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "getInt64ForColumnName:table:", "eventType", "experimentHistory");
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return *MEMORY[0x1E0D81780];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
