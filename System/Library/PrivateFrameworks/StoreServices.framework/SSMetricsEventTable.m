@implementation SSMetricsEventTable

void __51__SSMetricsEventTable_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  int *v21;
  uint64_t v22;
  objc_super v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v23.receiver = *(id *)(a1 + 32);
  v23.super_class = (Class)SSMetricsEventTable;
  objc_msgSendSuper2(&v23, sel_performTransactionWithBlock_, v2);
  objc_msgSend(*(id *)(a1 + 32), "_pragmaValueForName:", CFSTR("freelist_count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 < 501)
    return;
  objc_msgSend(*(id *)(a1 + 32), "_pragmaValueForName:", CFSTR("auto_vacuum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    v9 &= 2u;
  if (!v9)
    goto LABEL_12;
  v11 = (void *)objc_opt_class();
  v24 = 138543874;
  v25 = v11;
  v26 = 2048;
  v27 = v4;
  v28 = 2048;
  v29 = v6;
  v12 = v11;
  LODWORD(v22) = 32;
  v21 = &v24;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v24, v22);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v10);
LABEL_12:

  }
  if (v6)
  {
    if (v6 != 2)
      return;
    v20 = CFSTR("PRAGMA incremental_vacuum(500);");
  }
  else
  {
    v20 = CFSTR("VACUUM;");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeSQL:", v20, v21);
}

void __43__SSMetricsEventTable__pragmaValueForName___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (+[SSSQLiteDatabase statementHasRowAfterStepping:](SSSQLiteDatabase, "statementHasRowAfterStepping:", a2))
  {
    v4 = SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4;
  SSSQLiteDatabase *database;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  database = self->super._database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SSMetricsEventTable_performTransactionWithBlock___block_invoke;
  v7[3] = &unk_1E47B8A98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SSSQLiteDatabase dispatchBlockSync:](database, "dispatchBlockSync:", v7);

}

- (id)_pragmaValueForName:(id)a3
{
  id v4;
  void *v5;
  SSSQLiteDatabase *database;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__81;
  v14 = __Block_byref_object_dispose__81;
  v15 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA %@;"), v4);
  database = self->super._database;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SSMetricsEventTable__pragmaValueForName___block_invoke;
  v9[3] = &unk_1E47C0478;
  v9[4] = &v10;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v5, 0, v9);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), CFSTR("com.apple.storeServices.analytics"), CFSTR("eventsTable_v1"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("eventsTable_v1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("db"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_eventsTableName
{
  return +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
}

- (BOOL)_migrateToVersion1
{
  void *v3;
  void *v4;
  SSSQLiteDatabase *database;
  void *v6;
  SSSQLiteDatabase *v7;
  void *v8;
  SSSQLiteDatabase *v9;
  void *v10;
  BOOL v11;

  objc_msgSend((id)objc_opt_class(), "_eventsTableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER, %@ TEXT,%@ BLOB, %@ REAL, %@ INTEGER, PRIMARY KEY (%@));"),
    v3,
    CFSTR("pid"),
    CFSTR("report_url"),
    CFSTR("eventBody"),
    CFSTR("timestampInserted"),
    CFSTR("timestampReported"),
    CFSTR("pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", CFSTR("PRAGMA legacy_file_format = 0;")))
    goto LABEL_7;
  if (!-[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", CFSTR("PRAGMA journal_mode=WAL;")))
    goto LABEL_7;
  if (!-[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", v4))
    goto LABEL_7;
  database = self->super._database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_%@ ON %@ (%@);"),
    v3,
    CFSTR("report_url"),
    v3,
    CFSTR("report_url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(database) = -[SSSQLiteDatabase executeSQL:](database, "executeSQL:", v6);

  if (!(_DWORD)database)
    goto LABEL_7;
  v7 = self->super._database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_%@ ON %@ (%@);"),
    v3,
    CFSTR("timestampInserted"),
    v3,
    CFSTR("timestampInserted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = -[SSSQLiteDatabase executeSQL:](v7, "executeSQL:", v8);

  if ((_DWORD)v7)
  {
    v9 = self->super._database;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_%@ ON %@ (%@);"),
      v3,
      CFSTR("timestampReported"),
      v3,
      CFSTR("timestampReported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SSSQLiteDatabase executeSQL:](v9, "executeSQL:", v10);

  }
  else
  {
LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (BOOL)_migrateToVersion2
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_eventsTableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ INTEGER DEFAULT 0;"),
    v3,
    CFSTR("supressDsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", v4);

  return (char)self;
}

- (BOOL)_migrateToVersion3
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "_eventsTableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SSSQLiteDatabase columnName:existsInTable:](self->super._database, "columnName:existsInTable:", CFSTR("supressDsid"), v3))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ INTEGER DEFAULT 0;"),
      v3,
      CFSTR("supressDsid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", v5);
    if (v4
      && -[SSSQLiteDatabase columnName:existsInTable:](self->super._database, "columnName:existsInTable:", CFSTR("suppressUserInfo"), v3))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = %@;"),
        v3,
        CFSTR("supressDsid"),
        CFSTR("suppressUserInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", v6);

    }
  }

  return v4;
}

- (BOOL)_setupDatabase
{
  uint64_t v3;
  _UNKNOWN **v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  void *v19;
  _UNKNOWN **v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int *v45;
  uint64_t v46;
  int v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = -[SSSQLiteDatabase userVersion](self->super._database, "userVersion");
  v4 = &off_1E47B6000;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 138412290;
  v48 = v9;
  LODWORD(v46) = 12;
  v45 = &v47;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v47, v46);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:

  }
  -[SSSQLiteDatabase executeSQL:](self->super._database, "executeSQL:", CFSTR("PRAGMA auto_vacuum = 2;"));
  if (v3 == 3)
    return 1;
  v17 = v3 < 3;
  if (v3 > 2)
  {
LABEL_38:
    -[SSSQLiteDatabase setUserVersion:](self->super._database, "setUserVersion:", 3, v45);
    return v17;
  }
  v18 = 0;
  while (1)
  {
    if (v3 == 2)
    {
      v3 = 3;
      if (!-[SSMetricsEventTable _migrateToVersion3](self, "_migrateToVersion3"))
        goto LABEL_39;
      goto LABEL_26;
    }
    if (v3 != 1)
      break;
    v3 = 2;
    if (!-[SSMetricsEventTable _migrateToVersion2](self, "_migrateToVersion2"))
      goto LABEL_39;
LABEL_26:
    objc_msgSend(v4[387], "sharedStoreServicesConfig", v45, v46);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(v4[387], "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v4;
    v21 = objc_msgSend(v19, "shouldLog");
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v19, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      v22 &= 2u;
    if (!v22)
      goto LABEL_36;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138412290;
    v48 = v24;
    LODWORD(v46) = 12;
    v45 = &v47;
    v25 = (void *)_os_log_send_and_compose_impl();

    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v47, v46);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog(v19, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_36:

    }
    v18 = 1;
    v4 = v20;
    if (v3 >= 3)
      goto LABEL_38;
  }
  if (!v3)
  {
    v3 = 1;
    if (!-[SSMetricsEventTable _migrateToVersion1](self, "_migrateToVersion1"))
      goto LABEL_39;
    goto LABEL_26;
  }
  if ((v18 & 1) != 0)
    goto LABEL_26;
LABEL_39:
  objc_msgSend(v4[387], "sharedStoreServicesConfig", v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    objc_msgSend(v4[387], "sharedConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = objc_msgSend(v32, "shouldLog");
  if (objc_msgSend(v32, "shouldLogToDisk"))
    v34 = v33 | 2;
  else
    v34 = v33;
  objc_msgSend(v32, "OSLogObject");
  v35 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    v34 &= 2u;
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138412290;
    v48 = v36;
    LODWORD(v46) = 12;
    v37 = (void *)_os_log_send_and_compose_impl();

    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v47, v46);
      v35 = objc_claimAutoreleasedReturnValue();
      free(v37);
      SSFileLog(v32, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v35);
      goto LABEL_49;
    }
  }
  else
  {
LABEL_49:

  }
  return 0;
}

@end
