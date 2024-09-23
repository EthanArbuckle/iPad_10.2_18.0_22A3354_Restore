@implementation TRINamespaceDatabase

- (TRINamespaceDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRINamespaceDatabase *v7;
  TRINamespaceDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRINamespaceDatabase;
  v7 = -[TRINamespaceDatabase init](&v11, sel_init);
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

- (BOOL)addOrUpdateDynamicNamespaceWithName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 teamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainer:(int)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  BOOL v22;
  NSObject *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  TRINamespaceDatabase *v34;
  _BYTE *v35;
  int64_t v36;
  int v37;
  unsigned int v38;
  _BYTE buf[24];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (v16)
  {
    if (v18)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

    if (v19)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appContainerId"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  if (!v18)
    goto LABEL_12;
LABEL_3:
  if (!v19)
    goto LABEL_13;
LABEL_4:
  if (objc_msgSend(v18, "length")
    && (objc_msgSend(v18, "stringByAppendingString:", CFSTR(".")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v16, "hasPrefix:", v20),
        v20,
        (v21 & 1) == 0))
  {
    TRILogCategory_Server();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      TRILoggedNamespaceName(v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "dynamic namespace name (%{public}@) must be prefixed with teamId (%{public}@)", buf, 0x16u);

    }
    v22 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v40 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke;
    v29[3] = &unk_1E9335260;
    v35 = buf;
    v30 = v16;
    v31 = v18;
    v32 = v19;
    v36 = a8;
    v37 = a9;
    v38 = a4;
    v33 = v17;
    v34 = self;
    -[TRINamespaceDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v29);
    v22 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }

  return v22;
}

uint64_t __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke_2;
  v11[3] = &unk_1E9334F58;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 80);
  v14 = v4;
  v16 = v5;
  v17 = *(_QWORD *)(a1 + 88);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "generalErrorHandlerWithOutError:", 0, v11[0], 3221225472, __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke_2, &unk_1E9334F58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO dynamicNamespaces(    name,     teamId,     appContainerId,     appContainerType,     cloudKitContainerId,     compatibilityVersion,     defaultsFileURL) VALUES(    :name,     :team_id,     :app_container_id,     :app_container_type,     :cloudkit_container_id,     :compat_version,     :defaults_url) ON CONFLICT (name) DO UPDATE SET     teamId = :team_id,     appContainerId = :app_container_id,     appContainerType = :app_container_type,     cloudKitContainerId = :cloudkit_container_id,     compatibilityVersion = :compat_version,     defaultsFileURL = :defaults_url;"),
                                                                 v11,
                                                                 0,
                                                                 v6);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v9 = v8;
  else
    v9 = v7;
  return *v9;
}

void __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":team_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":app_container_id", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":app_container_type", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":cloudkit_container_id", *(int *)(a1 + 72));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":compat_version", *(unsigned int *)(a1 + 76));
  objc_msgSend(*(id *)(a1 + 56), "triSaveURLToString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":defaults_url", v5);

}

- ($61A80719B04F7407D3E47539F1B23CAA)removeDynamicNamespaceRecordWithNamespaceName:(id)a3
{
  id v5;
  id v6;
  $61A80719B04F7407D3E47539F1B23CAA v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  TRINamespaceDatabase *v12;
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2810000000;
  v17 = "";
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke;
  v10[3] = &unk_1E932F650;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v13 = &v14;
  -[TRINamespaceDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v10);
  v7.var0 = v15[4];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke(uint64_t a1, void *a2)
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

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke_2;
  v12[3] = &unk_1E932F1F0;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     dynamicNamespaces WHERE     name = :name;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));
    v9 = 1;
    if (v8 <= 0)
      v9 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v9;

    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

uint64_t __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));
}

- (BOOL)_enumerateDynamicNamespaceRecordsWithWhereClause:(id)a3 bind:(id)a4 block:(id)a5
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
  TRINamespaceDatabase *v22;
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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(whereClause == nil) == (bind == nil)"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

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
  v20[2] = __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke;
  v20[3] = &unk_1E9335288;
  v13 = v9;
  v21 = v13;
  v25 = &v27;
  v14 = v10;
  v26 = a2;
  v22 = self;
  v23 = v14;
  v15 = v12;
  v24 = v15;
  -[TRINamespaceDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v20);
  v16 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v16;
}

uint64_t __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
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
  int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  _QWORD v17[5];
  id v18;
  uint64_t v19;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(const __CFString **)(a1 + 32);
  if (!v6)
    v6 = &stru_1E9336E60;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM dynamicNamespaces %@ ORDER BY rowid ASC"), v6);
  objc_msgSend(v4, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke_2;
  v17[3] = &unk_1E93305E8;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 72);
  v17[4] = v9;
  v18 = *(id *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v10, v17, v11);

  v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v14 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if (v12)
    v15 = v14;
  else
    v15 = v13;
  return *v15;
}

uint64_t __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  TRIDynamicNamespaceRecord *v15;
  int v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isNullForColumnName:table:", "compatibilityVersion", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 151, CFSTR("NULL compatibilityVersion read from NOT NULL column"));

  }
  if (objc_msgSend(v3, "isNullForColumnName:table:", "appContainerType", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 152, CFSTR("NULL appContainerType read from NOT NULL column"));

  }
  if (objc_msgSend(v3, "isNullForColumnName:table:", "cloudKitContainerId", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 153, CFSTR("NULL cloudKitContainerId read from NOT NULL column"));

  }
  if (objc_msgSend(v3, "isNullForColumnName:table:", "hasFetched", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 154, CFSTR("NULL hasFetched read from NOT NULL column"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "name", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "teamId", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "appContainerId", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "getIntegerForColumnName:table:", "appContainerType", 0);
  v8 = objc_msgSend(v3, "getInt64ForColumnName:table:", "cloudKitContainerId", 0);
  v9 = objc_msgSend(v3, "getInt64ForColumnName:table:", "compatibilityVersion", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "defaultsFileURL", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "triParseURLFromString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_15;
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v29;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "failed to parse url from %@", buf, 0xCu);
    }

  }
  v11 = 0;
LABEL_15:
  v13 = objc_msgSend(v3, "getInt64ForColumnName:table:", "hasFetched", 0);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC0990], "containerWithIdentifier:type:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_17;
  }
  else
  {
    v14 = 0;
    if (v4)
    {
LABEL_17:
      if (v5)
        goto LABEL_18;
LABEL_25:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 174, CFSTR("NULL teamId read from NOT NULL column"));

      if (v6)
        goto LABEL_19;
      goto LABEL_26;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 173, CFSTR("NULL namespaceName read from NOT NULL column"));

  if (!v5)
    goto LABEL_25;
LABEL_18:
  if (v6)
    goto LABEL_19;
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 175, CFSTR("NULL appContainerId read from NOT NULL column"));

LABEL_19:
  LOBYTE(v25) = v13 != 0;
  v15 = -[TRIDynamicNamespaceRecord initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:]([TRIDynamicNamespaceRecord alloc], "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", v4, v5, v14, v8, v9, v11, v25);
  buf[0] = 0;
  (*(void (**)(void))(a1[5] + 16))();
  v16 = buf[0];
  v17 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v18 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if (v16)
    v19 = v18;
  else
    v19 = v17;
  return *v19;
}

- (id)dynamicNamespaceRecordWithNamespaceName:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
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
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__41;
  v19 = __Block_byref_object_dispose__41;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke;
  v13[3] = &unk_1E932F1F0;
  v7 = v5;
  v14 = v7;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke_2;
  v12[3] = &unk_1E93352B0;
  v12[4] = &v15;
  if (-[TRINamespaceDatabase _enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:](self, "_enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:", CFSTR("WHERE name = :name"), v13, v12))
  {
    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));
}

void __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)enumerateDynamicNamespaceRecordsWithBlock:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = -[TRINamespaceDatabase _enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:](self, "_enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:", 0, 0, v5);

  return v6;
}

- (BOOL)enumerateDynamicNamespaceRecordsForContainer:(int)a3 teamId:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  int v19;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__TRINamespaceDatabase_enumerateDynamicNamespaceRecordsForContainer_teamId_block___block_invoke;
  v17[3] = &unk_1E93352D8;
  v19 = a3;
  v18 = v9;
  v12 = v9;
  v13 = -[TRINamespaceDatabase _enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:](self, "_enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:", CFSTR(" WHERE         cloudKitContainerId = :container_id     AND teamId = :team_id"), v17, v11);

  return v13;
}

void __82__TRINamespaceDatabase_enumerateDynamicNamespaceRecordsForContainer_teamId_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":container_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":team_id", *(_QWORD *)(a1 + 32));

}

- (BOOL)enumerateAppContainerIdsForContainer:(int)a3 block:(id)a4
{
  id v7;
  id v8;
  char v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  SEL v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke;
  v12[3] = &unk_1E9335320;
  v16 = a3;
  v14 = &v17;
  v15 = a2;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  -[TRINamespaceDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v12);
  v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _QWORD v11[4];
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  int v16;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_2;
  v15[3] = &__block_descriptor_36_e29_v16__0___PASSqliteStatement_8l;
  v16 = *(_DWORD *)(a1 + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_3;
  v11[3] = &unk_1E93305E8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 56);
  v12 = v4;
  v13 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0, v11[0], 3221225472, __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_3, &unk_1E93305E8, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT appContainerId, teamId, appContainerType FROM     dynamicNamespaces WHERE     cloudKitContainerId = :container_id;"),
                                                                 v15,
                                                                 v11,
                                                                 v6);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v9 = v8;
  else
    v9 = v7;
  return *v9;
}

uint64_t __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":container_id", *(int *)(a1 + 32));
}

uint64_t __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "teamId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 254, CFSTR("NULL teamId read from NOT NULL column"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "appContainerId", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRINamespaceDatabase.m"), 256, CFSTR("NULL appContainerId read from NOT NULL column"));

  }
  objc_msgSend(v3, "getIntegerForColumnName:table:", "appContainerType", 0);
  (*(void (**)(void))(a1[5] + 16))();
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v6;
}

- ($61A80719B04F7407D3E47539F1B23CAA)setFetched:(BOOL)a3 forDynamicNamespaceName:(id)a4
{
  id v7;
  id v8;
  $61A80719B04F7407D3E47539F1B23CAA v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  TRINamespaceDatabase *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2810000000;
  v20 = "";
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke;
  v12[3] = &unk_1E9333A20;
  v16 = a3;
  v8 = v7;
  v13 = v8;
  v14 = self;
  v15 = &v17;
  -[TRINamespaceDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v12);
  v9.var0 = v18[4];

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke_2;
  v12[3] = &unk_1E9334FA8;
  v14 = *(_BYTE *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke_2, &unk_1E9334FA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE     dynamicNamespaces SET     hasFetched = :fetched_int WHERE     name = :name;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));
    v9 = 1;
    if (v8 <= 0)
      v9 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v9;

    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":fetched_int", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));

}

- (BOOL)hasUnfetchedNamespaceForTeamId:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDatabase.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke;
  v12[3] = &unk_1E932F1F0;
  v7 = v5;
  v13 = v7;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke_2;
  v11[3] = &unk_1E93352B0;
  v11[4] = &v14;
  -[TRINamespaceDatabase _enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:](self, "_enumerateDynamicNamespaceRecordsWithWhereClause:bind:block:", CFSTR(" WHERE         teamId = :team_id     and hasFetched = 0"), v12, v11);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":team_id", *(_QWORD *)(a1 + 32));
}

uint64_t __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
