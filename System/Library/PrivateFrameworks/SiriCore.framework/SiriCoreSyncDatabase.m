@implementation SiriCoreSyncDatabase

- (SiriCoreSyncDatabase)initWithPath:(id)a3
{
  id v5;
  SiriCoreSyncDatabase *v6;
  SiriCoreSyncDatabase *v7;
  SiriCoreSQLiteDatabase *v8;
  SiriCoreSQLiteDatabase *db;
  SiriCoreSyncDatabase *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreSyncDatabase;
  v6 = -[SiriCoreSyncDatabase init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_inTransaction = 0;
    objc_storeStrong((id *)&v6->_path, a3);
    v8 = -[SiriCoreSQLiteDatabase initWithPath:dataProtectionClass:options:]([SiriCoreSQLiteDatabase alloc], "initWithPath:dataProtectionClass:options:", v7->_path, 2, 1);
    db = v7->_db;
    v7->_db = v8;

    v10 = v7;
  }

  return v7;
}

- (BOOL)prepare
{
  _BOOL4 v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  os_log_t *v10;
  _BOOL4 v11;
  id v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  SiriCoreSQLiteDatabase *db;
  BOOL v23;
  id v24;
  id *v25;
  NSObject *v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v3 = -[SiriCoreSyncDatabase openWithError:](self, "openWithError:", &v42);
  v4 = v42;
  v5 = v4;
  if (!v3)
    goto LABEL_24;
  v41 = v4;
  v3 = -[SiriCoreSyncDatabase beginTransactionWithError:](self, "beginTransactionWithError:", &v41);
  v6 = v41;

  if (!v3)
  {
    v5 = v6;
    goto LABEL_24;
  }
  v7 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[SiriCoreSyncDatabase prepare]";
    _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_DEFAULT, "%s Prepping Sync DB", buf, 0xCu);
  }
  v40 = v6;
  v8 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE TABLE IF NOT EXISTS \"db_metadata\"(\"metadatakey\" varchar NOT NULL, \"value\" varchar);"),
         &v40);
  v9 = v40;

  v10 = (os_log_t *)MEMORY[0x24BE09008];
  if (!v8)
    goto LABEL_16;
  v39 = v9;
  v11 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE TABLE IF NOT EXISTS \"sync_items\" (\"sourcekey\" varchar NOT NULL, \"priority\" integer, \"uniqueid\" varchar NOT NULL, \"debug\" varchar, \"update_time\" integer, \"v_hash\" integer, \"app_meta\" blob, \"sync_value\" blob, \"added_value\" blob, PRIMARY KEY(\"sourcekey\", \"uniqueid\"));"),
          &v39);
  v12 = v39;

  if (!v11)
    goto LABEL_15;
  v38 = v12;
  v13 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE TABLE IF NOT EXISTS \"removed_items\"(\"sourcekey\" varchar NOT NULL, \"uniqueid\" varchar NOT NULL, \"update_time\" integer, PRIMARY KEY(\"sourcekey\", \"uniqueid\"));"),
          &v38);
  v9 = v38;

  if (!v13)
    goto LABEL_16;
  v37 = v9;
  v14 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE INDEX IF NOT EXISTS dk ON \"sync_items\" (\"sourcekey\",\"uniqueid\");"),
          &v37);
  v12 = v37;

  if (!v14)
    goto LABEL_15;
  v36 = v12;
  v15 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE INDEX IF NOT EXISTS du ON \"sync_items\" (\"update_time\");"),
          &v36);
  v9 = v36;

  if (!v15)
    goto LABEL_16;
  v35 = v9;
  v16 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE INDEX IF NOT EXISTS rk ON \"removed_items\" (\"sourcekey\",\"uniqueid\");"),
          &v35);
  v12 = v35;

  if (!v16)
  {
LABEL_15:
    v9 = v12;
    goto LABEL_16;
  }
  v34 = v12;
  v17 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE TABLE IF NOT EXISTS \"sync_anchors\"(\"sourcekey\" varchar NOT NULL, \"anchor\" integer, \"update_time\" integer, PRIMARY KEY(\"sourcekey\", \"anchor\"));"),
          &v34);
  v9 = v34;

  if (!v17
    || (v33 = v9,
        v18 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", CFSTR("CREATE TABLE IF NOT EXISTS \"sent_items\" (\"sourcekey\" varchar NOT NULL, \"priority\" integer, \"uniqueid\" varchar NOT NULL, \"debug\" varchar, \"update_time\" integer, \"v_hash\" integer, \"app_meta\" blob, \"sync_value\" blob, \"added_value\" blob);"),
                &v33),
        v19 = v33,
        v9,
        v9 = v19,
        !v18))
  {
LABEL_16:
    v20 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[SiriCoreSyncDatabase prepare]";
      _os_log_impl(&dword_211AB2000, v20, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not initialize db schema", buf, 0xCu);
    }
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 8);
  objc_msgSend(v21, "setValue:forKey:", CFSTR("version"), CFSTR("metadatakey"));
  objc_msgSend(v21, "setValue:forKey:", CFSTR("0.1"), CFSTR("value"));
  db = self->_db;
  v32 = v9;
  v23 = -[SiriCoreSQLiteDatabase insertIntoTableWithName:valueMap:error:](db, "insertIntoTableWithName:valueMap:error:", CFSTR("db_metadata"), v21, &v32);
  v24 = v32;

  if (v23)
  {
    v31 = v24;
    v25 = &v31;
    LOBYTE(v3) = -[SiriCoreSyncDatabase commitTransactionWithError:](self, "commitTransactionWithError:", &v31);
  }
  else
  {
    v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[SiriCoreSyncDatabase prepare]";
      _os_log_impl(&dword_211AB2000, v26, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not initialize db version info", buf, 0xCu);
    }
    v30 = v24;
    v25 = &v30;
    -[SiriCoreSyncDatabase rollbackTransactionWithError:](self, "rollbackTransactionWithError:", &v30);
    LOBYTE(v3) = 0;
  }
  v5 = *v25;

LABEL_24:
  v29 = v5;
  -[SiriCoreSyncDatabase closeWithError:](self, "closeWithError:", &v29);
  v27 = v29;

  return v3;
}

- (BOOL)openWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase openWithError:](self->_db, "openWithError:", a3);
}

- (BOOL)closeWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase closeWithError:](self->_db, "closeWithError:", a3);
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  void *v4;
  void *v5;
  BOOL result;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    if (a3)
    {
      v4 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BDD0BA0];
      v9[0] = CFSTR("attempted to begin transaction when one is already active");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.assistant.syncdb"), 100, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    result = -[SiriCoreSQLiteDatabase beginTransactionWithError:](self->_db, "beginTransactionWithError:", a3);
    self->_inTransaction = result;
  }
  return result;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  BOOL result;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    result = -[SiriCoreSQLiteDatabase commitTransactionWithError:](self->_db, "commitTransactionWithError:", a3);
    self->_inTransaction = !result;
  }
  else
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BDD0BA0];
      v9[0] = CFSTR("attempted to finalize transaction when none are in active");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.assistant.syncdb"), 101, v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return result;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  BOOL result;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    result = -[SiriCoreSQLiteDatabase rollbackTransactionWithError:](self->_db, "rollbackTransactionWithError:", a3);
    self->_inTransaction = !result;
  }
  else
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BDD0BA0];
      v9[0] = CFSTR("attempted to finalize transaction when none are in active");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.assistant.syncdb"), 101, v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return result;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  NSString *path;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[SiriCoreSQLiteDatabase executeQueryString:error:](self->_db, "executeQueryString:error:", v6, a4);
  if (!v7)
  {
    v8 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      v11 = *a4;
      v12 = 136315906;
      v13 = "-[SiriCoreSyncDatabase _executeStatement:error:]";
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = path;
      v18 = 2112;
      v19 = v11;
      _os_log_error_impl(&dword_211AB2000, v8, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Could not execute %@ in database file at %@, err=%@", (uint8_t *)&v12, 0x2Au);
    }
  }

  return v7;
}

- (BOOL)succeedOrRollbackOnFail:(id)a3 error:(id *)a4 whileExecuting:(id)a5
{
  id v8;
  uint64_t (**v9)(id, id *);
  char v10;
  char v11;
  NSObject *v12;
  char v13;
  BOOL v14;
  os_log_t *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (uint64_t (**)(id, id *))a5;
  if (-[SiriCoreSyncDatabase beginTransactionWithError:](self, "beginTransactionWithError:", a4))
  {
    if (v9 && (v9[2](v9, a4) & 1) != 0)
    {
      v10 = 1;
      if (-[SiriCoreSyncDatabase commitTransactionWithError:](self, "commitTransactionWithError:", a4))
      {
        v11 = 1;
LABEL_20:
        v13 = v10 & v11;
        goto LABEL_21;
      }
      v14 = 0;
    }
    else
    {
      v14 = -[SiriCoreSyncDatabase rollbackTransactionWithError:](self, "rollbackTransactionWithError:", a4);
      v10 = 0;
    }
    v15 = (os_log_t *)MEMORY[0x24BE08FB8];
    v16 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
      v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_211AB2000, v16, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Failed to commit succeedOrRollBack %@", (uint8_t *)&v20, 0x16u);
      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else if ((v10 & 1) != 0)
    {
LABEL_12:
      v11 = 0;
      v10 = 1;
      goto LABEL_20;
    }
    v17 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
      v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_211AB2000, v17, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Failed to complete succeedOrRollBack block %@", (uint8_t *)&v20, 0x16u);
      if (!v14)
      {
LABEL_17:
        v18 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          v20 = 136315394;
          v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
          v22 = 2112;
          v23 = v8;
          _os_log_error_impl(&dword_211AB2000, v18, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync ...and failed to rollback %@. DB is in trouble.", (uint8_t *)&v20, 0x16u);
        }
      }
    }
    else if (!v14)
    {
      goto LABEL_17;
    }
    v10 = 0;
    v11 = 0;
    goto LABEL_20;
  }
  v12 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
  {
    v20 = 136315394;
    v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
    v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_211AB2000, v12, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Failed to begin transaction for succeedOrRollBack %@", (uint8_t *)&v20, 0x16u);
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (BOOL)donate:(id)a3 error:(id *)a4
{
  return -[SiriCoreSyncDatabase _insertSyncRec:intoTable:error:](self, "_insertSyncRec:intoTable:error:", a3, CFSTR("sync_items"), a4);
}

- (BOOL)remove:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  BOOL v14;
  os_log_t *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSString *path;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("sourcekey"));

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("uniqueid"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v10, "numberWithInt:", (int)v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v13, CFSTR("update_time"));

  v14 = -[SiriCoreSQLiteDatabase insertIntoTableWithName:valueMap:error:](self->_db, "insertIntoTableWithName:valueMap:error:", CFSTR("removed_items"), v7, a4);
  v15 = (os_log_t *)MEMORY[0x24BE09008];
  if (!v14)
  {
    v16 = *MEMORY[0x24BE09008];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09008], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SiriCoreSyncDatabase remove:error:]";
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not add deletion record %@", buf, 0x16u);
    }
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("DELETE FROM sync_items WHERE sourcekey = \"%@\" AND uniqueid = \"%@\";"),
    v18,
    v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SiriCoreSyncDatabase remove:error:]";
    v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_211AB2000, v21, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync delete cmd %@", buf, 0x16u);
  }
  v22 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", v20, a4);
  if (!v22)
  {
    v23 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v6, "key");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      path = self->_path;
      *(_DWORD *)buf = 136315906;
      v30 = "-[SiriCoreSyncDatabase remove:error:]";
      v31 = 2112;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      v35 = 2112;
      v36 = path;
      _os_log_impl(&dword_211AB2000, v24, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not delete (%@, %@) of  in db %@", buf, 0x2Au);

    }
  }

  return v22;
}

- (BOOL)removeAllItemsOfKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSString *path;
  NSObject *v12;
  NSString *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSERT INTO removed_items SELECT sourcekey, uniqueid, update_time FROM sync_items WHERE sourcekey = \"%@\";"),
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", v7, a4))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM sync_items WHERE sourcekey = \"%@\"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", v8, a4);
    if (!v9)
    {
      v10 = *MEMORY[0x24BE09008];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09008], OS_LOG_TYPE_DEFAULT))
      {
        path = self->_path;
        *(_DWORD *)buf = 136315650;
        v16 = "-[SiriCoreSyncDatabase removeAllItemsOfKey:error:]";
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = path;
        _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not remove all items from key %@ in db %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v12 = *MEMORY[0x24BE09008];
    v9 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09008], OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_path;
      *(_DWORD *)buf = 136315650;
      v16 = "-[SiriCoreSyncDatabase removeAllItemsOfKey:error:]";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not tombstone all items from key %@ in db %@", buf, 0x20u);
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)markAsSent:(id)a3 error:(id *)a4
{
  return -[SiriCoreSyncDatabase _insertSyncRec:intoTable:error:](self, "_insertSyncRec:intoTable:error:", a3, CFSTR("sent_items"), a4);
}

- (BOOL)_insertSyncRec:(id)a3 intoTable:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  unint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 8);
  objc_msgSend(v8, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("sourcekey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "itemPriority"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v12, CFSTR("priority"));

  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("uniqueid"));

  objc_msgSend(v8, "dataValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v14, CFSTR("sync_value"));

  objc_msgSend(v8, "addedValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v15, CFSTR("added_value"));

  objc_msgSend(v8, "metaValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v16, CFSTR("app_meta"));

  objc_msgSend(v8, "debugValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v17, CFSTR("debug"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "updateTime");
  objc_msgSend(v18, "numberWithInt:", (int)v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v20, CFSTR("update_time"));

  v26 = 0;
  objc_msgSend(v8, "checkHash");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getBytes:length:", &v26, 8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v22, CFSTR("v_hash"));

  v23 = -[SiriCoreSQLiteDatabase insertIntoTableWithName:valueMap:error:](self->_db, "insertIntoTableWithName:valueMap:error:", v9, v10, a5);
  if (!v23)
  {
    v24 = *MEMORY[0x24BE09008];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09008], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[SiriCoreSyncDatabase _insertSyncRec:intoTable:error:]";
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_211AB2000, v24, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not insert tble: %@ record: %@", buf, 0x20u);
    }
  }

  return v23;
}

- (int)countRemovalsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5
{
  return -[SiriCoreSyncDatabase _countKey:fromTable:updatedAfter:error:](self, "_countKey:fromTable:updatedAfter:error:", a3, CFSTR("removed_items"), a4, a5);
}

- (int)countItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5
{
  return -[SiriCoreSyncDatabase _countKey:fromTable:updatedAfter:error:](self, "_countKey:fromTable:updatedAfter:error:", a3, CFSTR("sync_items"), a4, a5);
}

- (int)countSentItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5
{
  return -[SiriCoreSyncDatabase _countKey:fromTable:updatedAfter:error:](self, "_countKey:fromTable:updatedAfter:error:", a3, CFSTR("sent_items"), a4, a5);
}

- (int)_countKey:(id)a3 fromTable:(id)a4 updatedAfter:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  SiriCoreSQLiteQuery *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a4;
  v12 = a3;
  objc_msgSend(a5, "timeIntervalSince1970");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT COUNT() FROM %@ WHERE update_time > %.0f AND sourcekey = \"%@\";"),
    v11,
    v13,
    v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v14, 0, 0, 0, 16);
  if (a6)
    *a6 = 0;
  -[SiriCoreSQLiteDatabase executeQuery:](self->_db, "executeQuery:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a6 && v17)
  {
    *a6 = objc_retainAutorelease(v17);
  }
  else if (!v17)
  {
    objc_msgSend(v16, "rowValueTuples");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "siriCoreSQLiteValue_toNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v23, "intValue");

    goto LABEL_9;
  }
  v19 = -1;
LABEL_9:

  return v19;
}

- (BOOL)enumerateItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  return -[SiriCoreSyncDatabase _enumerateKey:updatedAfter:fromTable:usingBlock:error:](self, "_enumerateKey:updatedAfter:fromTable:usingBlock:error:", a3, a4, CFSTR("sync_items"), a6, a5);
}

- (BOOL)enumerateRemovalsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  return -[SiriCoreSyncDatabase _enumerateKey:updatedAfter:fromTable:usingBlock:error:](self, "_enumerateKey:updatedAfter:fromTable:usingBlock:error:", a3, a4, CFSTR("removed_items"), a6, a5);
}

- (BOOL)enumerateSentItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  return -[SiriCoreSyncDatabase _enumerateKey:updatedAfter:fromTable:usingBlock:error:](self, "_enumerateKey:updatedAfter:fromTable:usingBlock:error:", a3, a4, CFSTR("sent_items"), a6, a5);
}

- (BOOL)_enumerateKey:(id)a3 updatedAfter:(id)a4 fromTable:(id)a5 usingBlock:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  SiriCoreSQLiteQuery *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("SELECT * FROM %@ WHERE update_time > %.0f AND sourcekey = \"%@\";"),
    v14,
    v17,
    v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v18, 0, 0, 0, 16);
  if (a7)
    *a7 = 0;
  -[SiriCoreSQLiteDatabase executeQuery:](self->_db, "executeQuery:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a7 && v21)
    *a7 = objc_retainAutorelease(v21);
  v23 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v32[0] = 0;
  v32[1] = v32;
  v32[3] = __Block_byref_object_copy__3571;
  v32[4] = __Block_byref_object_dispose__3572;
  v37 = 0;
  v32[2] = 0x3032000000;
  v33 = 0;
  if (!v22)
  {
    objc_msgSend(v20, "rowValueTuples");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __78__SiriCoreSyncDatabase__enumerateKey_updatedAfter_fromTable_usingBlock_error___block_invoke;
    v26[3] = &unk_24CCE6E08;
    v27 = v14;
    v28 = v12;
    v30 = &v34;
    v29 = v15;
    v31 = v32;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v26);

    v23 = *((_BYTE *)v35 + 24) != 0;
  }
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (BOOL)inTransaction
{
  return self->_inTransaction;
}

- (void)setInTransaction:(BOOL)a3
{
  self->_inTransaction = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __78__SiriCoreSyncDatabase__enumerateKey_updatedAfter_fromTable_usingBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BYTE *v33;
  void *v34;
  id obj;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("sync_items")))
  {
    v30 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "siriCoreSQLiteValue_toString");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "siriCoreSQLiteValue_toNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v31, "intValue");
    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "siriCoreSQLiteValue_toString");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "siriCoreSQLiteValue_toData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siriCoreSQLiteValue_toData");
    v33 = a4;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siriCoreSQLiteValue_toData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7;
    v15 = v7;
    v16 = (void *)v8;
    +[SiriCoreSyncRecord syncRecordWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:](SiriCoreSyncRecord, "syncRecordWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:", v30, v15, v27, v8, v9, v11, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    a4 = v33;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "siriCoreSQLiteValue_toNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUpdateTime:", (double)objc_msgSend(v19, "longValue"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "siriCoreSQLiteValue_toData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCheckHash:", v21);
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("removed_items")))
    {
      v17 = 0;
      goto LABEL_7;
    }
    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "siriCoreSQLiteValue_toString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriCoreSyncRecord syncRecordWithKey:identifier:](SiriCoreSyncRecord, "syncRecordWithKey:identifier:", v22, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "siriCoreSQLiteValue_toNumber");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUpdateTime:", (double)objc_msgSend(v21, "longValue"));
  }

LABEL_7:
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v25 + 40);
  v26 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_storeStrong((id *)(v25 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v26 ^ 1;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

+ (id)currentSyncDatabase
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  SiriCoreSyncDatabase *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = (void *)_currentSyncDB;
  if (!_currentSyncDB)
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    _SiriCoreSharedResourcesDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("SiriSyncItems.db"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    v10 = [SiriCoreSyncDatabase alloc];
    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SiriCoreSyncDatabase initWithPath:](v10, "initWithPath:", v11);
    v13 = (void *)_currentSyncDB;
    _currentSyncDB = v12;

    if ((v9 & 1) == 0)
      objc_msgSend((id)_currentSyncDB, "prepare");

    v2 = (void *)_currentSyncDB;
  }
  return v2;
}

+ (void)removeCurrentSyncDatabase
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  BOOL v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  _SiriCoreSharedResourcesDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("SiriSyncItems.db"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x24BE08FB8];
  v8 = (void *)*MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "+[SiriCoreSyncDatabase removeCurrentSyncDatabase]";
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_DEFAULT, "%s removing Sync DB at %@", buf, 0x16u);

  }
  objc_msgSend(v5, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = objc_msgSend(v6, "removeItemAtPath:error:", v11, &v19);
  v13 = v19;

  if (v12)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (!v14)
  {
    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v17 = v15;
      objc_msgSend(v5, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v21 = "+[SiriCoreSyncDatabase removeCurrentSyncDatabase]";
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_211AB2000, v17, OS_LOG_TYPE_ERROR, "%s failedremoving Sync DB at %@ err: %@", buf, 0x20u);

    }
  }
  v16 = (void *)_currentSyncDB;
  _currentSyncDB = 0;

}

@end
