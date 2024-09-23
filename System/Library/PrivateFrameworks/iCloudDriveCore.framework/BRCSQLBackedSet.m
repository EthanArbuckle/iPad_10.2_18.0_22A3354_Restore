@implementation BRCSQLBackedSet

+ (id)createStringsSetWithError:(id *)a3
{
  return +[BRCSQLBackedSet createSetOfClass:withSQLType:error:](BRCSQLBackedSet, "createSetOfClass:withSQLType:error:", objc_opt_class(), CFSTR("text"), a3);
}

+ (id)createSetOfClass:(Class)a3 withSQLType:(id)a4 error:(id *)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = -[BRCSQLBackedSet initArrayOfClass:withSQLType:error:]([BRCSQLBackedSet alloc], "initArrayOfClass:withSQLType:error:", a3, v7, a5);

  return v8;
}

+ (void)clearTempDatabases
{
  void *v2;
  id v3;

  +[BRCSQLBackedSet _databaseRootDirectory](BRCSQLBackedSet, "_databaseRootDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BRCRemoveFolder(v2, 0, 1, 0);

}

+ (id)_databaseRootDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE17360]))
  {
    objc_msgSend(MEMORY[0x24BE17610], "cloudDocsAppSupportURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("session/tmp"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporaryDirectory");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initArrayOfClass:(Class)a3 withSQLType:(id)a4 error:(id *)a5
{
  id v8;
  BRCSQLBackedSet *v9;
  id *p_isa;
  BRCPQLConnection *v11;
  uint64_t v12;
  BRCPQLConnection *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  char *v21;
  char *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  void *v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id *v32;
  const char *v34;
  const char *v35;
  const char *v36;
  char *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  char *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)BRCSQLBackedSet;
  v9 = -[BRCSQLBackedSet init](&v46, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
    goto LABEL_21;
  v9->_class = a3;
  v9->_count = 0;
  objc_initWeak(&location, v9);
  v11 = [BRCPQLConnection alloc];
  v12 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke;
  v43[3] = &unk_24FE3FE88;
  objc_copyWeak(&v44, &location);
  v13 = -[BRCPQLConnection initWithLabel:dbCorruptionHandler:](v11, "initWithLabel:dbCorruptionHandler:", CFSTR("BRCSQLBackedSet"), v43);
  v41[0] = v12;
  v41[1] = 3221225472;
  v41[2] = __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_11;
  v41[3] = &unk_24FE42280;
  objc_copyWeak(&v42, &location);
  -[BRCPQLConnection setSqliteErrorHandler:](v13, "setSqliteErrorHandler:", v41);
  v39[0] = v12;
  v39[1] = 3221225472;
  v39[2] = __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_13;
  v39[3] = &unk_24FE42280;
  objc_copyWeak(&v40, &location);
  -[BRCPQLConnection setAutoRollbackHandler:](v13, "setAutoRollbackHandler:", v39);
  +[BRCSQLBackedSet _databaseRootDirectory](BRCSQLBackedSet, "_databaseRootDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "UUIDString");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = p_isa[2];
  p_isa[2] = (id)v17;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = p_isa[2];
  v38 = 0;
  LOBYTE(v16) = objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v38);
  v21 = (char *)v38;

  if ((v16 & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      v34 = (const char *)p_isa[2];
      *(_DWORD *)buf = 138412802;
      v48 = v34;
      v49 = 2112;
      v50 = v21;
      v51 = 2112;
      v52 = v28;
      _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] Failed creating root folder for DB: %@. %@%@", buf, 0x20u);
    }

    v22 = v21;
    if (v22)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v48 = "-[BRCSQLBackedSet initArrayOfClass:withSQLType:error:]";
        v49 = 2080;
        if (!a5)
          v35 = "(ignored by caller)";
        v50 = v35;
        v51 = 2112;
        v52 = v22;
        v53 = 2112;
        v54 = v30;
        _os_log_error_impl(&dword_230455000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
    {
      v22 = objc_retainAutorelease(v22);
      *a5 = v22;
    }
    v25 = v22;
    goto LABEL_18;
  }
  objc_msgSend(p_isa[2], "URLByAppendingPathComponent:", CFSTR("db.db"));
  v22 = (char *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[BRCSQLBackedSet initArrayOfClass:withSQLType:error:].cold.1();

  v37 = v21;
  -[BRCPQLConnection openAtURL:withFlags:error:](v13, "openAtURL:withFlags:error:", v22, 3145734, &v37);
  v25 = v37;

  if (v25)
  {
    v25 = v25;
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v48 = "-[BRCSQLBackedSet initArrayOfClass:withSQLType:error:]";
      v49 = 2080;
      if (!a5)
        v36 = "(ignored by caller)";
      v50 = v36;
      v51 = 2112;
      v52 = v25;
      v53 = 2112;
      v54 = v26;
      _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v25);

    goto LABEL_18;
  }
  objc_storeStrong(p_isa + 1, v13);
  if (objc_msgSend(p_isa, "_createSchemaForSQLType:error:", v8, a5))
  {
    -[BRCPQLConnection setSynchronousMode:](v13, "setSynchronousMode:", 1);
    -[BRCPQLConnection useSerialQueue](v13, "useSerialQueue");

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&location);
LABEL_21:
    v32 = p_isa;
    goto LABEL_22;
  }
LABEL_18:

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&location);
  v32 = 0;
LABEL_22:

  return v32;
}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dbBecameCorrupted");

}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
  {
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_230455000, v9, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called - %@ (%@)%@", (uint8_t *)&v11, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dbBecameCorrupted");

}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
  {
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_230455000, v9, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called - %@ (%@)%@", (uint8_t *)&v11, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dbBecameCorrupted");

}

- (void)_closeDB
{
  BRCSQLBackedSet *v2;
  BRCPQLConnection *v3;
  NSURL *v4;
  BRCPQLConnection *db;
  NSURL *dbRootFolder;
  NSObject *v7;
  _QWORD v8[4];
  BRCPQLConnection *v9;
  NSURL *v10;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_db;
  v4 = v2->_dbRootFolder;
  db = v2->_db;
  v2->_db = 0;

  dbRootFolder = v2->_dbRootFolder;
  v2->_dbRootFolder = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    -[BRCPQLConnection serialQueue](v3, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __27__BRCSQLBackedSet__closeDB__block_invoke;
    v8[3] = &unk_24FE3FA40;
    v9 = v3;
    v10 = v4;
    dispatch_async(v7, v8);

  }
}

void __27__BRCSQLBackedSet__closeDB__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "close:", 0);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__BRCSQLBackedSet__closeDB__block_invoke_2;
  block[3] = &unk_24FE3FA18;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

void __27__BRCSQLBackedSet__closeDB__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  BRCRemoveFolder(v1, 0, 0, 0);

}

- (void)dealloc
{
  objc_super v3;

  -[BRCSQLBackedSet _closeDB](self, "_closeDB");
  v3.receiver = self;
  v3.super_class = (Class)BRCSQLBackedSet;
  -[BRCSQLBackedSet dealloc](&v3, sel_dealloc);
}

- (BOOL)_createSchemaForSQLType:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BRCPQLConnection *db;
  id v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  const char *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BEDD648];
  v7 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v7, "UTF8String");
  v9 = objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4);

  objc_msgSend(v6, "rawInjection:length:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__BRCSQLBackedSet__createSchemaForSQLType_error___block_invoke;
  v19[3] = &unk_24FE40140;
  v12 = v10;
  v20 = v12;
  v13 = -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", 8, v19);
  if ((v13 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    -[BRCPQLConnection lastError](self->_db, "lastError");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCSQLBackedSet _createSchemaForSQLType:error:]";
        v23 = 2080;
        if (!a4)
          v18 = "(ignored by caller)";
        v24 = v18;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        _os_log_error_impl(&dword_230455000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v13;
}

uint64_t __49__BRCSQLBackedSet__createSchemaForSQLType_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "execute:", CFSTR("CREATE TABLE array_items (item %@ PRIMARY KEY)"), *(_QWORD *)(a1 + 32));
}

- (BOOL)addObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BRCPQLConnection *db;
  BOOL v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  BRCSQLBackedSet *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __35__BRCSQLBackedSet_addObject_error___block_invoke;
    v18 = &unk_24FE41988;
    v19 = v6;
    v20 = self;
    v9 = 1;
    LOBYTE(db) = -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", 1, &v15);

    if ((db & 1) != 0)
      goto LABEL_14;
    -[BRCPQLConnection lastError](self->_db, "lastError", v15, v16, v17, v18);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCSQLBackedSet addObject:error:]";
        v23 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
LABEL_17:
        v24 = v13;
        v25 = 2112;
        v26 = v10;
        v27 = 2112;
        v28 = v11;
        _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("object"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCSQLBackedSet addObject:error:]";
        v23 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        goto LABEL_17;
      }
LABEL_10:

    }
  }
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    *a4 = v10;
  }

  v9 = 0;
LABEL_14:

  return v9;
}

uint64_t __35__BRCSQLBackedSet_addObject_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v4, "execute:", CFSTR("INSERT OR IGNORE INTO array_items (item) VALUES (%@)"), v3);
  v6 = objc_msgSend(v4, "changes");

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) += v6;
  return v5;
}

- (void)enumerateObjectsWithSortOrder:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  BRCPQLConnection *db;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  switch(a3)
  {
    case 3uLL:
      v7 = (void *)MEMORY[0x24BEDD648];
      v8 = "ORDER BY item DESC";
      v9 = 18;
      break;
    case 2uLL:
      v7 = (void *)MEMORY[0x24BEDD648];
      v8 = "ORDER BY item ASC";
      v9 = 17;
      break;
    case 1uLL:
      v7 = (void *)MEMORY[0x24BEDD648];
      v8 = "ORDER BY rowid";
      v9 = 14;
      break;
    default:
      v10 = 0;
      goto LABEL_9;
  }
  objc_msgSend(v7, "rawInjection:length:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  db = self->_db;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__BRCSQLBackedSet_enumerateObjectsWithSortOrder_usingBlock___block_invoke;
  v14[3] = &unk_24FE3FB70;
  v14[4] = self;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", 1, v14);

}

uint64_t __60__BRCSQLBackedSet_enumerateObjectsWithSortOrder_usingBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1[4] + 8), "fetch:", CFSTR("SELECT item FROM array_items %@"), a1[5]);
  while (objc_msgSend(v4, "next"))
  {
    v5 = (void *)MEMORY[0x2348B9F14]();
    objc_msgSend(v4, "objectOfClass:atIndex:", *(_QWORD *)(a1[4] + 24), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

    objc_autoreleasePoolPop(v5);
  }
  objc_msgSend(v4, "close");

  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ count:%lu>"), objc_opt_class(), self->_count);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbRootFolder, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)initArrayOfClass:withSQLType:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening db at: %@%@", v1, 0x16u);
}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] db corruption handler called: %@%@", v1, 0x16u);
}

@end
