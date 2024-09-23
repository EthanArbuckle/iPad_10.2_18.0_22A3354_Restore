@implementation TRITaskDatabase

- (TRITaskDatabase)initWithDatabase:(id)a3 taskSetProvider:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRITaskDatabase *v11;
  TRITaskDatabase *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskSetProvider"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRITaskDatabase;
  v11 = -[TRITaskDatabase init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_db, a3);
    objc_storeStrong((id *)&v12->_taskSetProvider, a4);
  }

  return v12;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- (id)addTask:(id)a3 startTime:(id)a4 tags:(id)a5 dependencies:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

  }
  if (-[TRITaskSetProviding taskClassForTaskType:](self->_taskSetProvider, "taskClassForTaskType:", objc_msgSend(v13, "taskType")))
  {
    objc_msgSend(v13, "serialize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__19;
    v45 = __Block_byref_object_dispose__19;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__19;
    v39 = __Block_byref_object_dispose__19;
    v40 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke;
    v27[3] = &unk_1E9332A98;
    v27[4] = self;
    v28 = v13;
    v33 = &v41;
    v34 = &v35;
    v29 = v16;
    v18 = v17;
    v30 = v18;
    v31 = v14;
    v32 = v15;
    -[TRITaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v27);
    if (a7)
    {
      v19 = (void *)v42[5];
      if (v19)
        *a7 = objc_retainAutorelease(v19);
    }
    a7 = (id *)(id)v36[5];

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);

    goto LABEL_10;
  }
  if (a7)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v47 = *MEMORY[0x1E0CB2D50];
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("Can't add task of class %@ which is not registered"), v18);
    v48[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *a7 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v24);

    a7 = 0;
LABEL_10:

  }
  return a7;
}

uint64_t __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  id v39;
  sqlite3_int64 insert_rowid;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  sqlite3_int64 v59;
  id v60;
  _QWORD v61[4];
  id v62;
  sqlite3_int64 v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id obj;
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;
  uint8_t v73[4];
  void *v74;
  uint64_t v75;
  void *v76;
  __int128 buf;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "idForTask:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Tried to add TRITask %@, which has a duplicate already present in the database"), *(_QWORD *)(a1 + 40));
    v80 = *MEMORY[0x1E0CB2D50];
    v81[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    goto LABEL_5;
  }
  v15 = objc_msgSend(*(id *)(a1 + 48), "count");
  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v78 = 0x2020000000;
    v79 = 0x8000000000000000;
    objc_msgSend(v3, "db");
    v4 = objc_claimAutoreleasedReturnValue();
    v71[0] = v16;
    v71[1] = 3221225472;
    v71[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_22;
    v71[3] = &unk_1E932F1F0;
    v72 = *(id *)(a1 + 48);
    v70[1] = 3221225472;
    v70[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2;
    v70[3] = &unk_1E9332A70;
    v70[4] = &buf;
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v18 + 40);
    v70[0] = v16;
    objc_msgSend(v17, "generalErrorHandlerWithOutError:", &obj);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v18 + 40), obj);
    LOBYTE(v18) = objc_msgSend((id)v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" WITH depsTable (dep_rowid) AS(    SELECT * FROM _pas_nsarray(:dependencies)) SELECT dep_rowid FROM     depsTable WHERE     dep_rowid NOT IN (SELECT rowid FROM tasks) LIMIT 1;"),
                    v71,
                    v70,
                    v19);

    if ((v18 & 1) != 0)
    {
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) == 0x8000000000000000)
      {
        v20 = 1;
        goto LABEL_18;
      }
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      v24 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Tried to add TRITask with dependent task %lld, which is not in the db"), *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
      v75 = *MEMORY[0x1E0CB2D50];
      v76 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v25);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

      TRILogCategory_Server();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v73 = 138543362;
        v74 = v24;
        _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "%{public}@", v73, 0xCu);
      }

      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = 0;

    }
    else
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

    }
    v20 = 0;
    v4 = *MEMORY[0x1E0D81680];
LABEL_18:

    _Block_object_dispose(&buf, 8);
    if ((v20 & 1) == 0)
      goto LABEL_7;
  }
  objc_msgSend(v3, "db");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v16;
  v65[1] = 3221225472;
  v65[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_32;
  v65[3] = &unk_1E932F498;
  v66 = *(id *)(a1 + 40);
  v67 = *(id *)(a1 + 56);
  v68 = *(id *)(a1 + 64);
  v33 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v64 = *(id *)(v34 + 40);
  objc_msgSend(v33, "generalErrorHandlerWithOutError:", &v64);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v34 + 40), v64);
  v36 = objc_msgSend(v32, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO tasks(    taskType,     serializedTask,     startSecondsFromEpoch,     hash,     capabilities) VALUES(    :task_type,     :serialized_task,     :start_seconds,     :hash,     :capabilities_mask);"),
          v65,
          0,
          v35);

  if ((v36 & 1) == 0)
  {
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = 0;

    v4 = *MEMORY[0x1E0D81680];
  }

  if (v36)
  {
    objc_msgSend(v3, "db");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(v39, "handle"));

    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      objc_msgSend(v3, "db");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v16;
      v61[1] = 3221225472;
      v61[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2_41;
      v61[3] = &unk_1E932F218;
      v63 = insert_rowid;
      v62 = *(id *)(a1 + 72);
      v42 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v43 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v60 = *(id *)(v43 + 40);
      objc_msgSend(v42, "generalErrorHandlerWithOutError:", &v60);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v43 + 40), v60);
      LODWORD(v43) = objc_msgSend(v41, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR IGNORE INTO taskTags(    taskId,     tag) SELECT     :tasks_rowid,     * FROM     _pas_nsarray(:tags);"),
                       v61,
                       0,
                       v44);

      if (!(_DWORD)v43)
      {
        v52 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v53 = *(void **)(v52 + 40);
        *(_QWORD *)(v52 + 40) = 0;

        goto LABEL_5;
      }

    }
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
    {
LABEL_28:
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", insert_rowid);
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = v49;

      v13 = (unsigned __int8 *)MEMORY[0x1E0D81678];
      goto LABEL_6;
    }
    objc_msgSend(v3, "db");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v16;
    v57[1] = 3221225472;
    v57[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_3;
    v57[3] = &unk_1E932F218;
    v59 = insert_rowid;
    v58 = *(id *)(a1 + 48);
    v46 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v56 = *(id *)(v47 + 40);
    objc_msgSend(v46, "generalErrorHandlerWithOutError:", &v56);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v47 + 40), v56);
    LODWORD(v47) = objc_msgSend(v45, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR IGNORE INTO taskDependencies(    taskId,     dependentTaskId) SELECT     :tasks_rowid,     * FROM     _pas_nsarray(:dependencies);"),
                     v57,
                     0,
                     v48);

    if ((_DWORD)v47)
    {

      goto LABEL_28;
    }
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v55 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = 0;

LABEL_5:
    v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_6:
    v4 = *v13;
  }
LABEL_7:

  return v4;
}

uint64_t __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_22(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":dependencies", *(_QWORD *)(a1 + 32));
}

uint64_t __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnName:table:", "dep_rowid", "depsTable");
  return *MEMORY[0x1E0D81788];
}

void __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":task_type", (int)objc_msgSend(*(id *)(a1 + 32), "taskType"));
  objc_msgSend(v6, "bindNamedParam:toNSData:", ":serialized_task", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bindNamedParam:toDoubleAsNSNumber:", ":start_seconds", v5);

  }
  else
  {
    objc_msgSend(v6, "bindNamedParam:toDoubleAsNSNumber:", ":start_seconds", 0);
  }
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":hash", objc_msgSend(*(id *)(a1 + 32), "hash"));
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":capabilities_mask", objc_msgSend(*(id *)(a1 + 32), "requiredCapabilities"));

}

void __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2_41(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":tasks_rowid", v3);
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":tags", *(_QWORD *)(a1 + 32));

}

void __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":tasks_rowid", v3);
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":dependencies", *(_QWORD *)(a1 + 32));

}

- (BOOL)removeTaskWithId:(id)a3 cleanupBlock:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  TRITaskDatabase *v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  SEL v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__49;
  v21[4] = __Block_byref_object_dispose__50;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke;
  v14[3] = &unk_1E9332AE8;
  v9 = v8;
  v17 = v9;
  v10 = v7;
  v19 = &v23;
  v20 = a2;
  v15 = v10;
  v16 = self;
  v18 = v21;
  -[TRITaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v14);
  v11 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  __int128 v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;

  v3 = a2;
  v4 = v3;
  v5 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v3, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v5;
    v33[1] = 3221225472;
    v33[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2;
    v33[3] = &unk_1E932F1F0;
    v34 = *(id *)(a1 + 32);
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3;
    v30[3] = &unk_1E9332AC0;
    v7 = *(_QWORD *)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 72);
    v30[4] = v7;
    v23 = *(_OWORD *)(a1 + 48);
    v8 = (id)v23;
    v31 = v23;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT     taskType, serializedTask FROM     tasks WHERE     rowid = :task_id LIMIT 1;"),
      v33,
      v30,
      v9);

  }
  objc_msgSend(v4, "db", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2_62;
  v28[3] = &unk_1E932F1F0;
  v29 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM         taskDependencies WHERE         taskId = :task_id    OR   dependentTaskId = :task_id;"),
          v28,
          0,
          v11);

  if ((v12 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v20 = *MEMORY[0x1E0D81680];
    v21 = v29;
LABEL_12:

    goto LABEL_13;
  }

  objc_msgSend(v4, "db");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3_65;
  v26[3] = &unk_1E932F1F0;
  v27 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     taskTags WHERE     taskId = :task_id;"),
          v26,
          0,
          v14);

  if ((v15 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v20 = *MEMORY[0x1E0D81680];
    v21 = v27;
    goto LABEL_12;
  }

  objc_msgSend(v4, "db");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_4;
  v24[3] = &unk_1E932F1F0;
  v25 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     tasks WHERE     rowid = :task_id;"),
          v24,
          0,
          v17);

  if ((v18 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v20 = *MEMORY[0x1E0D81680];
    v21 = v25;
    goto LABEL_12;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v19)
    (*(void (**)(void))(v19 + 16))();
  v20 = *MEMORY[0x1E0D81678];
LABEL_13:

  return v20;
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "taskType", 0);
  objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedTask", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 250, CFSTR("read NULL serializedTask for NOT NULL column"));

  }
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "taskClassForTaskType:", v4);
  if (v6)
  {
    objc_msgSend(v6, "parseFromData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_58;
      v15[3] = &unk_1E932F8F0;
      v17 = *(id *)(a1 + 40);
      v16 = v7;
      v8 = MEMORY[0x1D8232C48](v15);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *MEMORY[0x1E0D81788];
    }
    else
    {
      v11 = *MEMORY[0x1E0D81788];
    }

  }
  else
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v4;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", buf, 8u);
    }

    v11 = *MEMORY[0x1E0D81788];
  }

  return v11;
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3_65(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

- (id)allTasks
{
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__TRITaskDatabase_allTasks__block_invoke;
  v6[3] = &unk_1E9332B88;
  v6[5] = &v7;
  v6[6] = a2;
  v6[4] = self;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void (**v28)(_QWORD);
  id v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  _QWORD v35[4];
  uint64_t v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[4];
  __int128 v61;
  uint64_t v62;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __27__TRITaskDatabase_allTasks__block_invoke_2;
  v60[3] = &unk_1E9332B10;
  v62 = a1[6];
  v61 = *((_OWORD *)a1 + 2);
  objc_msgSend(*(id *)(v61 + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM tasks;"), 0, v60, v6);

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__19;
    v58 = __Block_byref_object_dispose__19;
    v59 = 0;
    v50[0] = v5;
    v50[1] = 3221225472;
    v50[2] = __27__TRITaskDatabase_allTasks__block_invoke_81;
    v50[3] = &unk_1E9332B38;
    v9 = a1[5];
    v52 = &v54;
    v53 = v9;
    v10 = v8;
    v51 = v10;
    v11 = (void *)MEMORY[0x1D8232C48](v50);
    objc_msgSend(v3, "db");
    v12 = objc_claimAutoreleasedReturnValue();
    v45[0] = v5;
    v45[1] = 3221225472;
    v45[2] = __27__TRITaskDatabase_allTasks__block_invoke_2_84;
    v45[3] = &unk_1E9332B60;
    v13 = a1[6];
    v48 = &v54;
    v49 = v13;
    v45[4] = a1[4];
    v14 = v11;
    v47 = v14;
    v15 = v10;
    v46 = v15;
    objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend((id)v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     taskTags ORDER BY     taskId ASC,     rowid ASC;"),
            0,
            v45,
            v16);

    if ((v17 & 1) != 0)
    {
      v14[2](v14);
    }
    else
    {
      v20 = *(_QWORD *)(a1[5] + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = 0;

      v12 = *MEMORY[0x1E0D81680];
    }

    _Block_object_dispose(&v54, 8);
    if (v17)
    {
      v22 = (void *)objc_opt_new();
      v54 = 0;
      v55 = &v54;
      v56 = 0x3032000000;
      v57 = __Block_byref_object_copy__19;
      v58 = __Block_byref_object_dispose__19;
      v59 = 0;
      v41[0] = v5;
      v41[1] = 3221225472;
      v41[2] = __27__TRITaskDatabase_allTasks__block_invoke_3;
      v41[3] = &unk_1E9332B38;
      v23 = a1[5];
      v43 = &v54;
      v44 = v23;
      v24 = v22;
      v42 = v24;
      v25 = (void *)MEMORY[0x1D8232C48](v41);
      objc_msgSend(v3, "db");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v5;
      v35[1] = 3221225472;
      v35[2] = __27__TRITaskDatabase_allTasks__block_invoke_4;
      v35[3] = &unk_1E9332B60;
      v27 = a1[6];
      v36 = a1[4];
      v39 = &v54;
      v40 = v27;
      v28 = v25;
      v38 = v28;
      v29 = v24;
      v37 = v29;
      objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0, v5, 3221225472, __27__TRITaskDatabase_allTasks__block_invoke_4, &unk_1E9332B60, v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v26, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     taskDependencies ORDER BY     taskId ASC,     dependentTaskId ASC;"),
              0,
              v35,
              v30);

      if ((v31 & 1) != 0)
      {
        v28[2](v28);
      }
      else
      {
        v32 = *(_QWORD *)(a1[5] + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = 0;

        LODWORD(v12) = *MEMORY[0x1E0D81680];
      }

      _Block_object_dispose(&v54, 8);
      if (v31)
        v12 = *MEMORY[0x1E0D81678];
      else
        v12 = v12;
    }
  }
  else
  {
    v18 = *(_QWORD *)(a1[5] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

    v12 = *MEMORY[0x1E0D81680];
  }

  return v12;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TRITaskRecord *v13;
  TRITaskRecord *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "rowid", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 349, CFSTR("read NULL rowid from PRIMARY KEY column"));

  }
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "taskType", 0);
  objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "startSecondsFromEpoch", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "doubleValue");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedTask", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 358, CFSTR("read NULL serializedTask from NOT NULL column"));

  }
  v10 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "taskClassForTaskType:", v5);
  if (v10)
  {
    objc_msgSend(v10, "parseFromData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(v3, "getInt64ForColumnName:table:", "capabilities", 0);
      if (v12 == objc_msgSend(v11, "requiredCapabilities"))
      {
        v13 = [TRITaskRecord alloc];
        v14 = -[TRITaskRecord initWithTaskId:task:startDate:dependencies:capabilities:tags:](v13, "initWithTaskId:task:startDate:dependencies:capabilities:tags:", v4, v11, v8, MEMORY[0x1E0C9AA60], v12, MEMORY[0x1E0C9AA60]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v14, v4);
        v15 = *MEMORY[0x1E0D81780];

LABEL_19:
        goto LABEL_20;
      }
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        v15 = *MEMORY[0x1E0D81780];
        goto LABEL_19;
      }
      LOWORD(v24) = 0;
      v18 = "task capabilities mismatch in tasks table";
      v19 = v17;
      v20 = 2;
    }
    else
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v24 = 67109120;
      v25 = v5;
      v18 = "Failure deserializing task of type %d";
      v19 = v17;
      v20 = 8;
    }
    _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v24, v20);
    goto LABEL_18;
  }
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v24 = 67109120;
    v25 = v5;
    _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)&v24, 8u);
  }

  v15 = *MEMORY[0x1E0D81780];
LABEL_20:

  return v15;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_81(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      v4 = (void *)objc_msgSend(v2, "copyWithReplacementTags:", v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "taskId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 423, CFSTR("read NULL taskId from NOT NULL column"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "tag", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 426, CFSTR("read NULL tag from NOT NULL column"));

  }
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v8;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      v4 = (void *)objc_msgSend(v2, "copyWithReplacementDependencies:", v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "taskId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 472, CFSTR("read NULL taskId from NOT NULL column"));

  }
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "dependentTaskId", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 475, CFSTR("read NULL dependentTaskId from NOT NULL column"));

  }
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v8;
}

- (id)dependencyFreeTasksForAllowedCapabilities:(unint64_t)a3 dateForRunnability:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  unint64_t v16;

  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __80__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability___block_invoke;
  v14 = &unk_1E932F218;
  v15 = v6;
  v16 = a3;
  v7 = v6;
  v8 = (void *)MEMORY[0x1D8232C48](&v11);
  -[TRITaskDatabase _tasksForQuery:onPrep:](self, "_tasksForQuery:onPrep:", CFSTR(" SELECT * FROM tasks WHERE rowid NOT IN (SELECT taskId FROM taskDependencies)       AND (startSecondsFromEpoch IS NULL OR startSecondsFromEpoch <= :date_for_runnability)       AND (capabilities & :capabilities_mask) = capabilities;"),
    v8,
    v11,
    v12,
    v13,
    v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __80__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":date_for_runnability");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":capabilities_mask", *(_QWORD *)(a1 + 40));

}

- (id)dependencyFreeTasksForAllowedCapabilities:(unint64_t)a3 dateForRunnability:(id)a4 taskType:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  int v16;

  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability_taskType___block_invoke;
  v13[3] = &unk_1E9332BB0;
  v14 = v8;
  v15 = a3;
  v16 = a5;
  v9 = v8;
  v10 = (void *)MEMORY[0x1D8232C48](v13);
  -[TRITaskDatabase _tasksForQuery:onPrep:](self, "_tasksForQuery:onPrep:", CFSTR(" SELECT * FROM tasks WHERE rowid NOT IN (SELECT taskId FROM taskDependencies)       AND (startSecondsFromEpoch IS NULL OR startSecondsFromEpoch <= :date_for_runnability)       AND (capabilities & :capabilities_mask) = capabilities       AND (taskType = :task_type);"),
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __89__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability_taskType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":date_for_runnability");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":capabilities_mask", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":task_type", *(int *)(a1 + 48));

}

- (id)_tasksForQuery:(id)a3 onPrep:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  TRITaskDatabase *v15;
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__19;
  v23 = __Block_byref_object_dispose__19;
  v24 = (id)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke;
  v13[3] = &unk_1E9332BD8;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = self;
  v16 = v10;
  v17 = &v19;
  v18 = a2;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v13);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  uint64_t v36;
  __int128 v37;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2;
  v35[3] = &unk_1E9332B10;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v36 = *(_QWORD *)(a1 + 40);
  v37 = *(_OWORD *)(a1 + 56);
  objc_msgSend(*(id *)(v36 + 8), "generalErrorHandlerWithOutError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v6, v7, v35, v8);

  if ((v7 & 1) != 0)
  {
    v9 = (void *)objc_opt_new();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__19;
    v33[4] = __Block_byref_object_dispose__19;
    v34 = 0;
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_102;
    v29[3] = &unk_1E9332B38;
    v10 = *(_QWORD *)(a1 + 56);
    v31 = v33;
    v32 = v10;
    v11 = v9;
    v30 = v11;
    v12 = (void *)MEMORY[0x1D8232C48](v29);
    objc_msgSend(v3, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2_103;
    v24[3] = &unk_1E9332B60;
    v14 = *(_QWORD *)(a1 + 64);
    v27 = v33;
    v28 = v14;
    v24[4] = *(_QWORD *)(a1 + 40);
    v15 = v12;
    v26 = v15;
    v16 = v11;
    v25 = v16;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     taskTags ORDER BY     taskId ASC,     rowid ASC;"),
            0,
            v24,
            v17);

    if ((v18 & 1) != 0)
    {
      v15[2](v15);
    }
    else
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

      LODWORD(a1) = *MEMORY[0x1E0D81680];
    }

    _Block_object_dispose(v33, 8);
    if (v18)
      a1 = *MEMORY[0x1E0D81678];
    else
      a1 = a1;
  }
  else
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;

    a1 = *MEMORY[0x1E0D81680];
  }

  return a1;
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TRITaskRecord *v13;
  TRITaskRecord *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "rowid", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 538, CFSTR("read NULL rowid from PRIMARY KEY column"));

  }
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "taskType", 0);
  objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "startSecondsFromEpoch", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "doubleValue");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedTask", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 547, CFSTR("read NULL serializedTask from NOT NULL column"));

  }
  v10 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "taskClassForTaskType:", v5);
  if (v10)
  {
    objc_msgSend(v10, "parseFromData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(v3, "getInt64ForColumnName:table:", "capabilities", 0);
      if (v12 == objc_msgSend(v11, "requiredCapabilities"))
      {
        v13 = [TRITaskRecord alloc];
        v14 = -[TRITaskRecord initWithTaskId:task:startDate:dependencies:capabilities:tags:](v13, "initWithTaskId:task:startDate:dependencies:capabilities:tags:", v4, v11, v8, MEMORY[0x1E0C9AA60], v12, MEMORY[0x1E0C9AA60]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v14, v4);
        v15 = *MEMORY[0x1E0D81780];

LABEL_19:
        goto LABEL_20;
      }
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        v15 = *MEMORY[0x1E0D81780];
        goto LABEL_19;
      }
      LOWORD(v24) = 0;
      v18 = "task capabilities mismatch in tasks table";
      v19 = v17;
      v20 = 2;
    }
    else
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v24 = 67109120;
      v25 = v5;
      v18 = "Failure deserializing task of type %d";
      v19 = v17;
      v20 = 8;
    }
    _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v24, v20);
    goto LABEL_18;
  }
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v24 = 67109120;
    v25 = v5;
    _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)&v24, 8u);
  }

  v15 = *MEMORY[0x1E0D81780];
LABEL_20:

  return v15;
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_102(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      v4 = (void *)objc_msgSend(v2, "copyWithReplacementTags:", v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2_103(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "taskId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 611, CFSTR("read NULL taskId from NOT NULL column"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "tag", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 614, CFSTR("read NULL tag from NOT NULL column"));

  }
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v8;
}

- (unint64_t)count
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__TRITaskDatabase_count__block_invoke;
  v4[3] = &unk_1E9332C00;
  v4[4] = &v5;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__TRITaskDatabase_count__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__TRITaskDatabase_count__block_invoke_2;
  v5[3] = &unk_1E9332A70;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT count(*) FROM tasks"), 0, v5, 0);

  return *MEMORY[0x1E0D81678];
}

uint64_t __24__TRITaskDatabase_count__block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

- (BOOL)updateTaskWithTaskId:(id)a3 startDate:(id)a4 task:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  TRITaskDatabase *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 656, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 657, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task != nil"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 655, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke;
  v20[3] = &unk_1E932F4C0;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = v11;
  v23 = v14;
  v24 = self;
  v25 = &v26;
  -[TRITaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v20);
  v15 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v15;
}

uint64_t __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  unsigned __int8 *v9;
  char v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke_2;
  v14[3] = &unk_1E932F498;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE tasks SET     startSecondsFromEpoch = :start_seconds_from_epoch,     serializedTask = :serialized_task,     hash = :hash WHERE     rowid = :task_id;"),
         v14,
         0,
         v5);

  if (v6)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    if (v8)
    {
      v9 = (unsigned __int8 *)MEMORY[0x1E0D81678];
      v10 = 1;
    }
    else
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "updateStartDateForTaskId: called with invalid id", v13, 2u);
      }

      v10 = 0;
      v9 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    }
  }
  else
  {
    v10 = 0;
    v9 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;

  return *v9;
}

void __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":task_id", v3);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":start_seconds_from_epoch");
  objc_msgSend(*(id *)(a1 + 48), "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSData:", ":serialized_task", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":hash", objc_msgSend(*(id *)(a1 + 48), "hash"));
}

- (BOOL)updateTaskWithTaskId:(id)a3 capabilities:(unint64_t)a4 task:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  TRITaskDatabase *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 698, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 699, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task != nil"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke;
  v17[3] = &unk_1E932F240;
  v11 = v8;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  v20 = self;
  v21 = &v22;
  -[TRITaskDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v17);
  v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  unsigned __int8 *v9;
  char v10;
  NSObject *v11;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke_2;
  v14[3] = &unk_1E932FCA8;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE tasks SET     capabilities = :capabilities_mask,     serializedTask = :serialized_task,     hash = :hash WHERE     rowid = :task_id;"),
         v14,
         0,
         v5);

  if (v6)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));

    if (v8)
    {
      v9 = (unsigned __int8 *)MEMORY[0x1E0D81678];
      v10 = 1;
    }
    else
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "updateCapabilitiesForTaskId: called with invalid id", v13, 2u);
      }

      v10 = 0;
      v9 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    }
  }
  else
  {
    v10 = 0;
    v9 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

  return *v9;
}

void __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":task_id", v3);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":capabilities_mask", objc_msgSend(*(id *)(a1 + 40), "requiredCapabilities"));
  objc_msgSend(*(id *)(a1 + 40), "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSData:", ":serialized_task", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":hash", objc_msgSend(*(id *)(a1 + 40), "hash"));
}

- (BOOL)enumerateTasksWithTagsIntersectingTagSet:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 741, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tagSet"));

  }
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 742, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tagSet.count > 0"));

  }
  -[TRITaskDatabase allTasks](self, "allTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__TRITaskDatabase_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke;
    v13[3] = &unk_1E9332C28;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  return v9 != 0;
}

void __66__TRITaskDatabase_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "tags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "intersectsSet:", v10);

  if ((_DWORD)v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v6);

}

- (id)taskIdsWithTag:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  TRITaskDatabase *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 764, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tag"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  v20 = (id)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__TRITaskDatabase_taskIdsWithTag___block_invoke;
  v10[3] = &unk_1E9332C50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v13 = &v15;
  v14 = a2;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v10);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __34__TRITaskDatabase_taskIdsWithTag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__TRITaskDatabase_taskIdsWithTag___block_invoke_2;
  v12[3] = &unk_1E932F1F0;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v4, 3221225472, __34__TRITaskDatabase_taskIdsWithTag___block_invoke_3, &unk_1E9332B10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v12[0], 3221225472, __34__TRITaskDatabase_taskIdsWithTag___block_invoke_2, &unk_1E932F1F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT taskId FROM     taskTags WHERE     tag = :tag ORDER BY taskId ASC;"),
         v12,
         &v11,
         v5);

  if ((v6 & 1) != 0)
  {
    v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    v7 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v7;
}

uint64_t __34__TRITaskDatabase_taskIdsWithTag___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":tag", *(_QWORD *)(a1 + 32));
}

uint64_t __34__TRITaskDatabase_taskIdsWithTag___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  void *v6;

  objc_msgSend(a2, "getInt64AsNSNumberForColumnName:table:", "taskId", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 780, CFSTR("read NULL taskId from NOT NULL column"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (BOOL)_checkTaskId:(id)a3 IsPresent:(BOOL *)a4 transaction:(id)a5
{
  id v9;
  id v10;
  void *v11;
  TRIDatabase *db;
  id v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 801, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isPresent"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  *a4 = 0;
  objc_msgSend(v10, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = a4;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke;
  v21[3] = &unk_1E932F1F0;
  v22 = v9;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke_2;
  v20[3] = &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l;
  db = self->_db;
  v13 = v9;
  -[TRIDatabase generalErrorHandlerWithOutError:](db, "generalErrorHandlerWithOutError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT 1 FROM     tasks WHERE     rowid = :task_id LIMIT 1;"),
          v21,
          v20,
          v14);

  return v15;
}

uint64_t __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

uint64_t __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke_2(uint64_t a1)
{
  **(_BYTE **)(a1 + 32) = 1;
  return *MEMORY[0x1E0D81788];
}

- (id)directDependenciesOfTaskWithId:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 826, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = (id)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke;
  v10[3] = &unk_1E9332C50;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  v12 = &v14;
  v13 = a2;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v10);
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[15];
  char v19;

  v3 = a2;
  v19 = 0;
  if (!objc_msgSend(*(id *)(a1 + 32), "_checkTaskId:IsPresent:transaction:", *(_QWORD *)(a1 + 40), &v19, v3))
  {
LABEL_11:
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

    v10 = *MEMORY[0x1E0D81680];
    goto LABEL_12;
  }
  if (!v19)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "directDependenciesOfTaskWithId invoked with missing taskId", buf, 2u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_134;
  v16[3] = &unk_1E932F1F0;
  v17 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0, v5, 3221225472, __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_2, &unk_1E9332B10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v16[0], 3221225472, __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_134, &unk_1E932F1F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT dependentTaskId FROM     taskDependencies WHERE     taskId = :task_id ORDER BY dependentTaskId ASC;"),
         v16,
         &v15,
         v6);

  if ((v7 & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    LODWORD(v4) = *MEMORY[0x1E0D81680];
  }

  if (v7)
    v10 = *MEMORY[0x1E0D81678];
  else
    v10 = v4;
LABEL_12:

  return v10;
}

uint64_t __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_134(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

uint64_t __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  void *v6;

  objc_msgSend(a2, "getInt64AsNSNumberForColumnName:table:", "dependentTaskId", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 863, CFSTR("read NULL dependentTaskId from NOT NULL column"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (id)tasksDependentOnTask:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 882, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = (id)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__TRITaskDatabase_tasksDependentOnTask___block_invoke;
  v10[3] = &unk_1E9332C50;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  v12 = &v14;
  v13 = a2;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v10);
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __40__TRITaskDatabase_tasksDependentOnTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  unsigned __int8 *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[15];
  char v20;

  v3 = a2;
  v20 = 0;
  if (!objc_msgSend(*(id *)(a1 + 32), "_checkTaskId:IsPresent:transaction:", *(_QWORD *)(a1 + 40), &v20, v3))
  {
LABEL_8:
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    v12 = *MEMORY[0x1E0D81680];
    goto LABEL_11;
  }
  if (!v20)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "tasksDependentOnTask invoked with missing taskId", buf, 2u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_137;
  v17[3] = &unk_1E932F1F0;
  v18 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0, v5, 3221225472, __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_2, &unk_1E9332B10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v17[0], 3221225472, __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_137, &unk_1E932F1F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT taskId FROM     taskDependencies WHERE     dependentTaskId = :task_id ORDER BY taskId ASC;"),
         v17,
         &v16,
         v6);

  if ((v7 & 1) != 0)
  {
    v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    v8 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  v12 = *v8;

LABEL_11:
  return v12;
}

uint64_t __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_137(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":task_id", *(_QWORD *)(a1 + 32));
}

uint64_t __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  void *v6;

  objc_msgSend(a2, "getInt64AsNSNumberForColumnName:table:", "taskId", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRITaskDatabase.m"), 918, CFSTR("read NULL taskId from NOT NULL column"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (id)idForTask:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  TRITaskDatabase *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskDatabase.m"), 935, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  v20 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__TRITaskDatabase_idForTask___block_invoke;
  v10[3] = &unk_1E9332C50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v13 = &v15;
  v14 = a2;
  -[TRITaskDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v10);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __29__TRITaskDatabase_idForTask___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  void *v11;
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __29__TRITaskDatabase_idForTask___block_invoke_2;
  v18[3] = &unk_1E932F1F0;
  v19 = *(id *)(a1 + 32);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __29__TRITaskDatabase_idForTask___block_invoke_3;
  v14[3] = &unk_1E9332C98;
  v17 = *(_QWORD *)(a1 + 56);
  v13 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v13.i64[0];
  v15 = vextq_s8(v13, v13, 8uLL);
  v6 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(v6 + 8), "generalErrorHandlerWithOutError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     tasks WHERE     hash = :hash;"),
         v18,
         v14,
         v7);

  if ((v8 & 1) != 0)
  {
    v9 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    v9 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v9;
}

void __29__TRITaskDatabase_idForTask___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":hash", objc_msgSend(v2, "hash"));

}

uint64_t __29__TRITaskDatabase_idForTask___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "taskType", 0);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "taskClassForTaskType:", v4);
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedTask", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 962, CFSTR("read NULL serializedTask from NOT NULL column"));

    }
    objc_msgSend(v6, "parseFromData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend(*(id *)(a1 + 40), "isEqual:", v8))
    {
      objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "rowid", 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRITaskDatabase.m"), 971, CFSTR("read NULL rowid from PRIMARY KEY column"));

      }
      v12 = (unsigned __int8 *)MEMORY[0x1E0D81788];
    }
    else
    {
      v12 = (unsigned __int8 *)MEMORY[0x1E0D81780];
    }
    v13 = *v12;

  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 67109120;
      v18[1] = v4;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)v18, 8u);
    }

    v13 = *MEMORY[0x1E0D81780];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskSetProvider, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
