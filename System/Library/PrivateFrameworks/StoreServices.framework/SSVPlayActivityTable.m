@implementation SSVPlayActivityTable

- (SSVPlayActivityTable)init
{
  void *v3;
  SSSQLiteDatabase *v4;
  void *v5;
  SSSQLiteDatabase *v6;
  uint64_t v7;
  SSVPlayActivityTable *v8;
  SSVPlayActivityTable *v9;
  objc_super v11;
  _QWORD v12[5];

  objc_msgSend((id)objc_opt_class(), "databasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SSSQLiteDatabase alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:](v4, "initWithDatabaseURL:readOnly:protectionType:", v5, 0, *MEMORY[0x1E0CB2AC0]);

  v7 = objc_opt_class();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__SSVPlayActivityTable_init__block_invoke;
  v12[3] = &__block_descriptor_40_e26_v16__0__SSSQLiteDatabase_8lu32l8;
  v12[4] = v7;
  -[SSSQLiteDatabase setSetupBlock:](v6, "setSetupBlock:", v12);
  v11.receiver = self;
  v11.super_class = (Class)SSVPlayActivityTable;
  v8 = -[SSVPlayActivityTable init](&v11, sel_init);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_database, v6);

  return v9;
}

uint64_t __28__SSVPlayActivityTable_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupDatabase:", a2);
}

- (unint64_t)currentEventsRevision
{
  void *v2;
  unint64_t v3;

  -[SSVPlayActivityTable _valueForDatabasePropertyKey:](self, "_valueForDatabasePropertyKey:", CFSTR("events_current_revision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)setCurrentEventsRevision:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSVPlayActivityTable _setValue:forDatabasePropertyKey:](self, "_setValue:forDatabasePropertyKey:", v4, CFSTR("events_current_revision"));

}

+ (id)databasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("com.apple.itunesstored"), CFSTR("play_activity.sqlitedb"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)eventsRevisionVersionToken
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SSVPlayActivityTable _valueForDatabasePropertyKey:](self, "_valueForDatabasePropertyKey:", CFSTR("events_revision_version_token"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("unknown-revision-version");
  v4 = v2;

  return v4;
}

- (BOOL)insertPlayActivityEvent:(id)a3 withRevision:(unint64_t)a4 returningError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  int v13;
  SSSQLiteDatabase *database;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  _QWORD v21[4];
  id v22;
  SSVPlayActivityTable *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;

  v8 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = v8 == 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__88;
  v32 = __Block_byref_object_dispose__88;
  v33 = 0;
  objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT OR REPLACE INTO "));
  objc_msgSend(v10, "appendString:", v9);
  objc_msgSend(v10, "appendString:", CFSTR(" ("));
  objc_msgSend(v10, "appendString:", CFSTR("pid"));
  v11 = 0;
  do
  {
    objc_msgSend(v10, "appendString:", CFSTR(", "));
    if ((v11 + 1) > 3)
      v12 = 0;
    else
      v12 = off_1E47C0DB0[v11];
    objc_msgSend(v10, "appendString:", v12);
    ++v11;
  }
  while ((_DWORD)v11 != 3);
  objc_msgSend(v10, "appendString:", CFSTR(") VALUES (?"));
  v13 = 3;
  do
  {
    objc_msgSend(v10, "appendString:", CFSTR(", ?"));
    --v13;
  }
  while (v13);
  objc_msgSend(v10, "appendString:", CFSTR(");"));
  database = self->_database;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__SSVPlayActivityTable_insertPlayActivityEvent_withRevision_returningError___block_invoke;
  v21[3] = &unk_1E47C0BD8;
  v27 = a4;
  v15 = v8;
  v25 = &v28;
  v26 = &v34;
  v22 = v15;
  v23 = self;
  v16 = v10;
  v24 = v16;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v16, 1, v21);
  if (!*((_BYTE *)v35 + 24) && !v29[5])
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v29[5];
    v29[5] = v17;

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v29[5]);
  v19 = *((_BYTE *)v35 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __76__SSVPlayActivityTable_insertPlayActivityEvent_withRevision_returningError___block_invoke()
{
  __asm { BR              X9 }
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4;
  void *v5;
  SSSQLiteDatabase *database;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    database = self->_database;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SSVPlayActivityTable_performTransactionWithBlock___block_invoke;
    v7[3] = &unk_1E47C0C00;
    v8 = v4;
    -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);

  }
}

uint64_t __52__SSVPlayActivityTable_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 additionalRevisionsIndexSet:(id)a7 ignoredRevisionsIndexSet:(id)a8 error:(id *)a9
{
  return -[SSVPlayActivityTable _getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:storeAccountID:shouldFilterStoreAccountID:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:](self, "_getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:storeAccountID:shouldFilterStoreAccountID:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:", a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

- (BOOL)getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 storeAccountID:(unint64_t)a7 additionalRevisionsIndexSet:(id)a8 ignoredRevisionsIndexSet:(id)a9 error:(id *)a10
{
  return -[SSVPlayActivityTable _getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:storeAccountID:shouldFilterStoreAccountID:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:](self, "_getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:storeAccountID:shouldFilterStoreAccountID:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:", a3, a4, a5, a6, a7, 1, a8, a9, a10);
}

- (BOOL)removePlayActivityEventsUpToRevision:(unint64_t)a3 returningError:(id *)a4
{
  void *v7;
  void *v8;
  SSSQLiteDatabase *database;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ <= ?;"),
                 v7,
                 CFSTR("revision_id"));
  database = self->_database;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__SSVPlayActivityTable_removePlayActivityEventsUpToRevision_returningError___block_invoke;
  v14[3] = &unk_1E47C0C28;
  v16 = &v18;
  v17 = a3;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v10, 0, v14);
  if (!*((_BYTE *)v19 + 24))
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v11);
LABEL_4:
  v12 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __76__SSVPlayActivityTable_removePlayActivityEventsUpToRevision_returningError___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  _BYTE v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, a1[7]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:](SSSQLiteDatabase, "statementDidFinishAfterStepping:", a2);
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v8 = (void *)objc_opt_class();
      v9 = a1[5];
      *(_DWORD *)v35 = 138412546;
      *(_QWORD *)&v35[4] = v8;
      *(_WORD *)&v35[12] = 2112;
      *(_QWORD *)&v35[14] = v9;
      v10 = v8;
      LODWORD(v34) = 22;
      v33 = v35;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v35, v34, *(_OWORD *)v35, *(_QWORD *)&v35[16], v36);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
    }

    goto LABEL_13;
  }
LABEL_14:
  v18 = objc_msgSend(*(id *)(a1[4] + 8), "countChanges", v33);
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    v21 &= 2u;
  if (!v21)
    goto LABEL_24;
  v23 = (void *)objc_opt_class();
  v24 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  *(_DWORD *)v35 = 138412802;
  *(_QWORD *)&v35[4] = v23;
  *(_WORD *)&v35[12] = 1024;
  *(_DWORD *)&v35[14] = v24;
  *(_WORD *)&v35[18] = 1024;
  *(_DWORD *)&v35[20] = v18;
  v25 = v23;
  LODWORD(v34) = 24;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, v35, v34);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v26);
    SSFileLog(v19, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v22);
LABEL_24:

  }
}

- (id)revisionsIndexSetForPlayActivityEvents:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEvents___block_invoke;
  v8[3] = &unk_1E47C0C50;
  v9 = v4;
  v5 = v4;
  -[SSVPlayActivityTable _revisionsIndexSetUsingPersisentIDGenerationBlock:count:](self, "_revisionsIndexSetUsingPersisentIDGenerationBlock:count:", v8, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "persistentID");

  return v3;
}

- (id)revisionsIndexSetForPlayActivityEventPersistentIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke;
  v8[3] = &unk_1E47C0C50;
  v9 = v4;
  v5 = v4;
  -[SSVPlayActivityTable _revisionsIndexSetUsingPersisentIDGenerationBlock:count:](self, "_revisionsIndexSetUsingPersisentIDGenerationBlock:count:", v8, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __75__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

+ (id)_eventsDatabaseTableName
{
  return CFSTR("events");
}

+ (id)_propertiesDatabaseTableName
{
  return CFSTR("properties");
}

+ (BOOL)_setupDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  int v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  __CFString *v32;
  uint64_t v33;
  _QWORD v34[4];
  __CFString *v35;
  __CFString *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v4 = a3;
  if (!v4)
  {
    v24 = 0;
    goto LABEL_39;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  objc_msgSend(a1, "_eventsDatabaseTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ INTEGER, %@ INTEGER, %@ BLOB);"),
    v5,
    CFSTR("pid"),
    CFSTR("revision_id"),
    CFSTR("store_account_id"),
    CFSTR("event_data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_propertiesDatabaseTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@ TEXT PRIMARY KEY, %@ TEXT);"),
    v7,
    CFSTR("key"),
    CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "executeSQL:", CFSTR("PRAGMA legacy_file_format = 0;"));
  *((_BYTE *)v39 + 24) = v9;
  if ((v9 & 1) == 0)
    goto LABEL_37;
  v10 = objc_msgSend(v4, "executeSQL:", CFSTR("PRAGMA journal_mode=WAL;"));
  *((_BYTE *)v39 + 24) = v10;
  if (!v10)
    goto LABEL_37;
  v11 = objc_msgSend(v4, "executeSQL:", v6);
  *((_BYTE *)v39 + 24) = v11;
  if (!v11)
    goto LABEL_37;
  v12 = objc_msgSend(v4, "executeSQL:", v8);
  *((_BYTE *)v39 + 24) = v12;
  if (!v12)
    goto LABEL_37;
  v13 = objc_msgSend(v4, "userVersion");
  if (!v13)
  {
    if (*((_BYTE *)v39 + 24))
    {
      v33 = 2005;
      goto LABEL_33;
    }
    goto LABEL_37;
  }
  v14 = v39;
  if (v13 < 1)
  {
    v33 = v13;
    if (*((_BYTE *)v39 + 24))
      goto LABEL_36;
    goto LABEL_37;
  }
  v15 = 0;
  if (!*((_BYTE *)v39 + 24))
  {
    v16 = v13;
    goto LABEL_31;
  }
  v16 = v13;
  if ((unint64_t)v13 > 0x7D4)
    goto LABEL_31;
  v15 = 0;
  LOBYTE(v17) = 1;
  while (1)
  {
    v18 = v16;
    if ((unint64_t)(v16 - 2000) > 4)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v4, "executeSQL:", v19);
    *((_BYTE *)v39 + 24) = v20;

    v14 = v39;
    if (!*((_BYTE *)v39 + 24))
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v4, "executeSQL:", v21);
    *((_BYTE *)v39 + 24) = v22;

    v14 = v39;
    if (!*((_BYTE *)v39 + 24))
      goto LABEL_28;
    v23 = objc_msgSend(v4, "executeSQL:", v6);
    v14 = v39;
    *((_BYTE *)v39 + 24) = v23;
    if (!v23)
      goto LABEL_29;
    v17 = objc_msgSend(v4, "executeSQL:", v8);
    v14 = v39;
    *((_BYTE *)v39 + 24) = v17;
    if (v17)
      v18 = 2005;
    v15 = 1;
LABEL_18:
    if (!(_BYTE)v17)
      goto LABEL_30;
    v16 = v18;
    if (v18 >= 2005)
      goto LABEL_31;
  }
  *((_BYTE *)v39 + 24) = 0;
LABEL_28:
  *((_BYTE *)v14 + 24) = 0;
LABEL_29:
  *((_BYTE *)v14 + 24) = 0;
  v15 = 1;
LABEL_30:
  v16 = v18;
LABEL_31:
  v33 = v16;
  if (*((_BYTE *)v14 + 24))
  {
    if ((v15 & 1) == 0)
      goto LABEL_36;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = &stru_1E47D72B0;
    if (v26)
      v28 = (__CFString *)v26;
    v32 = v28;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ (%@, %@) VALUES (?, ?);"),
      v7,
      CFSTR("key"),
      CFSTR("value"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __39__SSVPlayActivityTable__setupDatabase___block_invoke;
    v34[3] = &unk_1E47C0C78;
    v30 = v32;
    v35 = v30;
    v36 = CFSTR("events_revision_version_token");
    v37 = &v38;
    objc_msgSend(v4, "prepareStatementForSQL:cache:usingBlock:", v29, 0, v34);

    if (*((_BYTE *)v39 + 24))
    {
LABEL_36:
      objc_msgSend(v4, "setUserVersion:", v33);
      v24 = 1;
      goto LABEL_38;
    }
  }
LABEL_37:
  v24 = 0;
LABEL_38:

  _Block_object_dispose(&v38, 8);
LABEL_39:

  return v24;
}

BOOL __39__SSVPlayActivityTable__setupDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  _BOOL8 result;

  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), objc_msgSend(*(id *)(a1 + 40), "length"), 0);
  sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  result = +[SSSQLiteDatabase statementDidFinishAfterStepping:](SSSQLiteDatabase, "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 storeAccountID:(unint64_t)a7 shouldFilterStoreAccountID:(BOOL)a8 additionalRevisionsIndexSet:(id)a9 ignoredRevisionsIndexSet:(id)a10 error:(id *)a11
{
  _BOOL4 v11;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  SSSQLiteDatabase *database;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id *v43;
  id *v44;
  BOOL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v11 = a8;
  v34 = a9;
  v18 = a10;
  v19 = v18;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v33 = v18;
    v30 = a5;
    v31 = a7;
    v32 = a6;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__88;
    v58 = __Block_byref_object_dispose__88;
    v59 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
    v21 = v20;
    if (a3)
    {
      v22 = 0;
      do
      {
        if (v22 > 3)
          v23 = 0;
        else
          v23 = off_1E47C0DC8[v22];
        if ((_DWORD)v22 == 3)
          v24 = &stru_1E47D72B0;
        else
          v24 = CFSTR(",");
        objc_msgSend(v21, "appendFormat:", CFSTR("%@%@"), v23, v24);
        ++v22;
      }
      while ((_DWORD)v22 != 4);
    }
    else
    {
      objc_msgSend(v20, "appendFormat:", CFSTR("%@"), CFSTR("revision_id"));
    }
    objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendFormat:", CFSTR(" FROM %@ WHERE ("), v25);
    if (v11)
      objc_msgSend(v21, "appendFormat:", CFSTR("(%@ == ?) AND ("), CFSTR("store_account_id"));
    objc_msgSend(v21, "appendFormat:", CFSTR("%@ BETWEEN ? AND ?"), CFSTR("revision_id"));
    v26 = objc_msgSend(v34, "count");
    v27 = MEMORY[0x1E0C809B0];
    if (v26)
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke;
      v52[3] = &unk_1E47C0CA0;
      v53 = v21;
      objc_msgSend(v34, "enumerateRangesUsingBlock:", v52);

    }
    if (v11)
      objc_msgSend(v21, "appendString:", CFSTR(")"));
    objc_msgSend(v21, "appendString:", CFSTR(") ORDER BY "));
    if (v11)
      objc_msgSend(v21, "appendFormat:", CFSTR("%@,%@ ASC;"), CFSTR("store_account_id"), CFSTR("revision_id"));
    else
      objc_msgSend(v21, "appendFormat:", CFSTR("%@ ASC;"), CFSTR("revision_id"));
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__88;
    v50 = __Block_byref_object_dispose__88;
    v51 = 0;
    database = self->_database;
    v35[0] = v27;
    v35[1] = 3221225472;
    v35[2] = __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_2;
    v35[3] = &unk_1E47C0CF0;
    v45 = v11;
    v40 = v31;
    v41 = v30;
    v42 = v32;
    v36 = v34;
    v43 = a3;
    v19 = v33;
    v37 = v33;
    v38 = &v54;
    v44 = a4;
    v39 = &v46;
    -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v21, v26 == 0, v35);
    if (a11)
      *a11 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v47[5]);
    if (a4)
      *a4 = objc_retainAutorelease((id)v55[5]);

    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v54, 8);

  }
  return 1;
}

uint64_t __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR(" OR %@ BETWEEN ? AND ?"), CFSTR("revision_id"));
  return result;
}

void __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int *v5;
  int v6;
  void *v7;
  sqlite3_int64 v8;
  int v9;
  sqlite3_int64 v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  int v16;
  void *v17;
  SSVPlayActivityEvent *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v4 = 1;
  v31 = 1;
  if (*(_BYTE *)(a1 + 104))
  {
    v31 = 2;
    sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 64));
    v5 = (int *)(v29 + 3);
    v4 = *((_DWORD *)v29 + 6);
  }
  else
  {
    v5 = &v31;
  }
  *v5 = v4 + 1;
  sqlite3_bind_int64(a2, v4, *(_QWORD *)(a1 + 72));
  v6 = *((_DWORD *)v29 + 6);
  *((_DWORD *)v29 + 6) = v6 + 1;
  sqlite3_bind_int64(a2, v6, *(_QWORD *)(a1 + 80));
  v7 = *(void **)(a1 + 32);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_3;
  v27[3] = &unk_1E47C0CC8;
  v27[4] = &v28;
  v27[5] = a2;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v27);
  while (+[SSSQLiteDatabase statementHasRowAfterStepping:](SSSQLiteDatabase, "statementHasRowAfterStepping:", a2))
  {
    if (*(_QWORD *)(a1 + 88))
    {
      if (sqlite3_column_type(a2, 1) == 1)
      {
        v8 = sqlite3_column_int64(a2, 1);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v8) & 1) != 0)
        {
          v9 = 0;
        }
        else
        {
          v9 = 1;
          if (*(_QWORD *)(a1 + 96) && v8)
          {
            v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            if (!v23)
            {
              v24 = objc_alloc_init(MEMORY[0x1E0CB3788]);
              v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v26 = *(void **)(v25 + 40);
              *(_QWORD *)(v25 + 40) = v24;

              v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            }
            objc_msgSend(v23, "addIndex:", v8);
          }
        }
      }
      else
      {
        v9 = 1;
      }
      if (sqlite3_column_type(a2, 3) != 4)
      {
        v17 = 0;
        if (!v9)
          goto LABEL_30;
LABEL_24:
        if (objc_msgSend(v17, "length"))
        {
          v18 = -[SSVPlayActivityEvent initWithDataRepresentation:]([SSVPlayActivityEvent alloc], "initWithDataRepresentation:", v17);
          if (v18)
          {
            v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            if (!v19)
            {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
              v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v22 = *(void **)(v21 + 40);
              *(_QWORD *)(v21 + 40) = v20;

              v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            }
            objc_msgSend(v19, "addObject:", v18);
          }

        }
        goto LABEL_30;
      }
      v15 = sqlite3_column_blob(a2, 3);
      v16 = sqlite3_column_bytes(a2, 3);
      v17 = 0;
      if (v16 >= 1 && v15)
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v15, v16);
      if (v9)
        goto LABEL_24;
LABEL_30:

    }
    else if (sqlite3_column_type(a2, 0) == 1)
    {
      v10 = sqlite3_column_int64(a2, 0);
      if (v10)
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v10) & 1) == 0)
        {
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v11)
          {
            v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v14 = *(void **)(v13 + 40);
            *(_QWORD *)(v13 + 40) = v12;

            v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v11, "addIndex:", v10);
        }
      }
    }
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_3(uint64_t result, sqlite3_int64 a2, uint64_t a3)
{
  uint64_t v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  int v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  int v11;

  if (a3)
  {
    v5 = result;
    v6 = *(sqlite3_stmt **)(result + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8);
    v8 = *(_DWORD *)(v7 + 24);
    *(_DWORD *)(v7 + 24) = v8 + 1;
    sqlite3_bind_int64(v6, v8, a2);
    v9 = *(sqlite3_stmt **)(v5 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8);
    v11 = *(_DWORD *)(v10 + 24);
    *(_DWORD *)(v10 + 24) = v11 + 1;
    return sqlite3_bind_int64(v9, v11, a3 + a2 - 1);
  }
  return result;
}

- (id)_revisionsIndexSetUsingPersisentIDGenerationBlock:(id)a3 count:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  SSSQLiteDatabase *database;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@ WHERE %@ IN ("), CFSTR("revision_id"), v8, CFSTR("pid"));
    v10 = 0;
    do
    {
      if (v10 >= a4 - 1)
        v11 = &stru_1E47D72B0;
      else
        v11 = CFSTR(",");
      objc_msgSend(v9, "appendFormat:", CFSTR("?%@"), v11);
      ++v10;
    }
    while (a4 != v10);
    objc_msgSend(v9, "appendString:", CFSTR(");"));
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__88;
    v22 = __Block_byref_object_dispose__88;
    v23 = 0;
    database = self->_database;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__SSVPlayActivityTable__revisionsIndexSetUsingPersisentIDGenerationBlock_count___block_invoke;
    v14[3] = &unk_1E47C0D18;
    v17 = a4;
    v15 = v6;
    v16 = &v18;
    -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v9, 0, v14);
    v7 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

BOOL __80__SSVPlayActivityTable__revisionsIndexSetUsingPersisentIDGenerationBlock_count___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  unint64_t v4;
  unint64_t v5;
  sqlite3_int64 v6;
  _BOOL8 result;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  if (a1[6])
  {
    v4 = 0;
    do
    {
      v5 = v4 + 1;
      v6 = (*(uint64_t (**)(void))(a1[4] + 16))();
      sqlite3_bind_int64(a2, v5, v6);
      v4 = v5;
    }
    while (v5 < a1[6]);
  }
  for (result = +[SSSQLiteDatabase statementHasRowAfterStepping:](SSSQLiteDatabase, "statementHasRowAfterStepping:", a2);
        result;
        result = +[SSSQLiteDatabase statementHasRowAfterStepping:](SSSQLiteDatabase, "statementHasRowAfterStepping:", a2))
  {
    if (sqlite3_column_type(a2, 0) == 1)
    {
      v8 = sqlite3_column_int64(a2, 0);
      if (v8)
      {
        v9 = v8;
        v10 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        if (!v10)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          v12 = *(_QWORD *)(a1[5] + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          v10 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        }
        objc_msgSend(v10, "addIndex:", v9);
      }
    }
  }
  return result;
}

- (BOOL)_setValue:(id)a3 forDatabasePropertyKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SSSQLiteDatabase *database;
  id v11;
  id *v12;
  void *v13;
  BOOL v14;
  void *v15;
  SSSQLiteDatabase *v16;
  _QWORD v18[4];
  _QWORD v19[2];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SSVPlayActivityTable *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    objc_msgSend((id)objc_opt_class(), "_propertiesDatabaseTableName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@) VALUES (?, ?);"),
        v8,
        CFSTR("key"),
        CFSTR("value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      database = self->_database;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke;
      v22[3] = &unk_1E47C0D40;
      v23 = v6;
      v27 = &v28;
      v24 = v7;
      v25 = self;
      v11 = v9;
      v26 = v11;
      -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v11, 1, v22);
      v12 = &v23;

      v13 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?;"), v8, CFSTR("key"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_database;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke_104;
      v18[3] = &unk_1E47C0D68;
      v21 = &v28;
      v19[0] = v7;
      v19[1] = self;
      v11 = v15;
      v20 = v11;
      -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](v16, "prepareStatementForSQL:cache:usingBlock:", v11, 1, v18);
      v12 = (id *)v19;
      v13 = v20;
    }

    v14 = *((_BYTE *)v29 + 24) != 0;
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

void __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), objc_msgSend(*(id *)(a1 + 40), "length"), 0);
  sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:](SSSQLiteDatabase, "statementDidFinishAfterStepping:", a2);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)v19 = 138412546;
      *(_QWORD *)&v19[4] = v8;
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v9;
      v10 = v8;
      LODWORD(v18) = 22;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v19, v18, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
    }

    goto LABEL_13;
  }
}

void __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke_104(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:](SSSQLiteDatabase, "statementDidFinishAfterStepping:", a2);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v19 = 138412546;
      *(_QWORD *)&v19[4] = v8;
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v9;
      v10 = v8;
      LODWORD(v18) = 22;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v19, v18, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
    }

    goto LABEL_13;
  }
}

- (id)_valueForDatabasePropertyKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SSSQLiteDatabase *database;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__88;
    v17 = __Block_byref_object_dispose__88;
    v18 = 0;
    objc_msgSend((id)objc_opt_class(), "_propertiesDatabaseTableName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?;"),
      CFSTR("value"),
      v5,
      CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    database = self->_database;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__SSVPlayActivityTable__valueForDatabasePropertyKey___block_invoke;
    v10[3] = &unk_1E47C0D90;
    v11 = v4;
    v12 = &v13;
    -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v6, 1, v10);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __53__SSVPlayActivityTable__valueForDatabasePropertyKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v4;
  void *v5;
  id v6;

  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  if (+[SSSQLiteDatabase statementHasRowAfterStepping:](SSSQLiteDatabase, "statementHasRowAfterStepping:", a2)&& sqlite3_column_type(a2, 0) == 3)
  {
    v4 = sqlite3_column_text(a2, 0);
    if (v4)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
    else
      v5 = 0;
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    if (v4)

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
