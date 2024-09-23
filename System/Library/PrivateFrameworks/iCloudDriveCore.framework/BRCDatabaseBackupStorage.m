@implementation BRCDatabaseBackupStorage

- (BRCDatabaseBackupStorage)initWithDatabaseURL:(id)a3
{
  id v5;
  BRCDatabaseBackupStorage *v6;
  BRCDatabaseBackupStorage *v7;
  BRCPQLConnection *v8;
  BRCPQLConnection *database;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *urlPropertiesToFetch;
  void *v16;
  NSObject *v17;
  void *v19;
  id v20;
  objc_super v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCDatabaseBackupStorage;
  v6 = -[BRCDatabaseBackupStorage init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseURL, a3);
    v8 = -[BRCPQLConnection initWithLabel:dbCorruptionHandler:]([BRCPQLConnection alloc], "initWithLabel:dbCorruptionHandler:", CFSTR("backup-db"), 0);
    database = v7->_database;
    v7->_database = v8;

    v20 = 0;
    v10 = -[BRCDatabaseBackupStorage setUpDatabaseWithError:](v7, "setUpDatabaseWithError:", &v20);
    v11 = v20;
    if (v10)
    {
      v12 = *MEMORY[0x24BDBD210];
      v22[0] = *MEMORY[0x24BDBCBD0];
      v22[1] = v12;
      v13 = *MEMORY[0x24BDBCC50];
      v22[2] = *MEMORY[0x24BDBCBF8];
      v22[3] = v13;
      v22[4] = *MEMORY[0x24BDBCC60];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
      v14 = objc_claimAutoreleasedReturnValue();
      urlPropertiesToFetch = v7->_urlPropertiesToFetch;
      v7->_urlPropertiesToFetch = (NSArray *)v14;
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        objc_msgSend(v5, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v19;
        v25 = 2112;
        v26 = v11;
        v27 = 2112;
        v28 = v16;
        _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] Can't open database at %@: %@%@", buf, 0x20u);

      }
      urlPropertiesToFetch = v7;
      v7 = 0;
    }

  }
  return v7;
}

- (void)dealloc
{
  NSURL *v3;
  BRCPQLConnection *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  _QWORD block[4];
  BRCPQLConnection *v9;
  NSURL *v10;

  v3 = self->_databaseURL;
  v4 = self->_database;
  -[BRCPQLConnection serialQueue](v4, "serialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BRCPQLConnection serialQueue](v4, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__BRCDatabaseBackupStorage_dealloc__block_invoke;
    block[3] = &unk_24FE3FA40;
    v9 = v4;
    v10 = v3;
    dispatch_sync(v6, block);

  }
  v7.receiver = self;
  v7.super_class = (Class)BRCDatabaseBackupStorage;
  -[BRCDatabaseBackupStorage dealloc](&v7, sel_dealloc);
}

void __35__BRCDatabaseBackupStorage_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v8 = 0;
  v3 = objc_msgSend(v2, "brc_closeWithError:", &v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 40), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_230455000, v6, (os_log_type_t)0x90u, "[ERROR] Can't close database at %@: %@%@", buf, 0x20u);

    }
  }

}

- (BOOL)setUpDatabaseWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  v5 = -[BRCPQLConnection openAtURL:withFlags:error:](self->_database, "openAtURL:withFlags:error:", self->_databaseURL, 3145734, a3);
  if (v5)
  {
    -[BRCPQLConnection userVersion](self->_database, "userVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (v7 > 0
      || (v8 = -[BRCPQLConnection execute:](self->_database, "execute:", CFSTR("create table backup_manifest (relative_path blob not null, file_id integer, doc_id integer, gen_count integer, is_directory integer, new_file_id integer, new_doc_id integer, new_gen_count integer)")), -[BRCPQLConnection setUserVersion:](self->_database, "setUserVersion:", 1), v8))
    {
      -[BRCPQLConnection useBatchingWithDelay:changeCount:](self->_database, "useBatchingWithDelay:changeCount:", 1000, 0.5);
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      -[BRCPQLConnection lastError](self->_database, "lastError");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v9;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)addRecord:(id)a3
{
  id v4;
  BRCPQLConnection *database;
  id v6;
  _QWORD v8[4];
  id v9;
  BRCDatabaseBackupStorage *v10;

  v4 = a3;
  database = self->_database;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__BRCDatabaseBackupStorage_addRecord___block_invoke;
  v8[3] = &unk_24FE41988;
  v9 = v4;
  v10 = self;
  v6 = v4;
  LOBYTE(database) = -[BRCPQLConnection performWithFlags:action:](database, "performWithFlags:action:", 1, v8);

  return (char)database;
}

uint64_t __38__BRCDatabaseBackupStorage_addRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relativePath");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "fileID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  objc_msgSend(*(id *)(a1 + 32), "docID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "execute:", CFSTR("INSERT INTO backup_manifest (relative_path, file_id, doc_id, gen_count, is_directory, new_file_id, new_doc_id, new_gen_count) VALUES (%s, %lld, %lld, %d, %d, NULL, NULL, NULL)"), v5, v7, objc_msgSend(v8, "longLongValue"), objc_msgSend(*(id *)(a1 + 32), "genCount"), objc_msgSend(*(id *)(a1 + 32), "isDirectory"));

  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 40), "databaseURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] Can't insert into the database %@: %@%@", buf, 0x20u);

    }
  }

  return v9;
}

- (BOOL)addRecordIfNotExist:(id)a3
{
  id v4;
  BRCPQLConnection *database;
  id v6;
  _QWORD v8[4];
  id v9;
  BRCDatabaseBackupStorage *v10;

  v4 = a3;
  database = self->_database;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke;
  v8[3] = &unk_24FE41988;
  v9 = v4;
  v10 = self;
  v6 = v4;
  LOBYTE(database) = -[BRCPQLConnection performWithFlags:action:](database, "performWithFlags:action:", 1, v8);

  return (char)database;
}

uint64_t __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "relativePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "numberWithSQL:", CFSTR("SELECT 1 FROM backup_manifest WHERE relative_path = %@"), v5);

  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v19 = v6;
    objc_msgSend(*v4, "relativePath");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");
    objc_msgSend(*v4, "fileID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");
    objc_msgSend(*v4, "docID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "execute:", CFSTR("INSERT INTO backup_manifest (relative_path, file_id, doc_id, gen_count, is_directory, new_file_id, new_doc_id, new_gen_count) VALUES (%s, %lld, %lld, %d, %d, NULL, NULL, NULL)"), v9, v11, objc_msgSend(v12, "longLongValue"), objc_msgSend(*v4, "genCount"), objc_msgSend(*v4, "isDirectory"));

    if ((v7 & 1) != 0)
    {
      if (!objc_msgSend(v3, "changes"))
      {
        v7 = 1;
        goto LABEL_10;
      }
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke_cold_1((uint64_t *)(a1 + 32));
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        objc_msgSend(*(id *)(a1 + 40), "databaseURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lastError");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v17;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = v13;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] Can't insert into the database %@: %@%@", buf, 0x20u);

      }
    }
    v6 = v19;

  }
LABEL_10:

  return v7;
}

- (void)flushAndClose
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[BRCPQLConnection serialQueue](self->_database, "serialQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BRCPQLConnection serialQueue](self->_database, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke;
    block[3] = &unk_24FE3FA18;
    block[4] = self;
    dispatch_sync(v4, block);

  }
}

void __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "execute:", CFSTR("CREATE UNIQUE INDEX relative_path_index ON backup_manifest (relative_path)"));

  if ((v3 & 1) == 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke_cold_1(v1, (uint64_t)v4, v5);

  }
  objc_msgSend(*v1, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeNextFlushFullSync");

  objc_msgSend(*v1, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flush");

  objc_msgSend(*v1, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "close:", &v15);
  v10 = v15;

  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      objc_msgSend(*v1, "databaseURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] Can't close database at %@: %@%@", buf, 0x20u);

    }
  }
  objc_msgSend(*v1, "setDatabase:", 0);

}

- (id)backupManifestEnumerator:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "fetch:", CFSTR("SELECT * FROM backup_manifest WHERE new_file_id IS NULL"));
  objc_msgSend(v3, "enumerateObjects:", &__block_literal_global_25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BRCDatabaseBackupRecord *__53__BRCDatabaseBackupStorage_backupManifestEnumerator___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BRCDatabaseBackupRecord *v3;

  v2 = a2;
  v3 = -[BRCDatabaseBackupRecord initWithPQLResultSet:]([BRCDatabaseBackupRecord alloc], "initWithPQLResultSet:", v2);

  return v3;
}

- (void)populateNewColumnsWithBasePath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BRCPQLConnection *database;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_INFO, "[INFO] Populating new columns with base path: %@%@", buf, 0x16u);
  }

  database = self->_database;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__BRCDatabaseBackupStorage_populateNewColumnsWithBasePath___block_invoke;
  v9[3] = &unk_24FE41988;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[BRCPQLConnection performWithFlags:action:](database, "performWithFlags:action:", 5, v9);

}

uint64_t __59__BRCDatabaseBackupStorage_populateNewColumnsWithBasePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backupManifestEnumerator:", v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2348B9F14](v5);
        objc_msgSend(*(id *)(a1 + 32), "populateNewColumnsInDatabase:forRecord:basePath:", v3, v9, *(_QWORD *)(a1 + 40), (_QWORD)v12);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
  }

  return 1;
}

- (void)populateNewColumnsInDatabase:(id)a3 forRecord:(id)a4 basePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *urlPropertiesToFetch;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  _BYTE v41[14];
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "relativePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  urlPropertiesToFetch = self->_urlPropertiesToFetch;
  v35 = 0;
  objc_msgSend(v13, "resourceValuesForKeys:error:", urlPropertiesToFetch, &v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;
  if (v15)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDBD210]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "docID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v12;
    v34 = v16;
    if (objc_msgSend(v18, "unsignedLongLongValue"))
    {
      -[BRCDatabaseBackupStorage docIDForURL:](self, "docIDForURL:", v13);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDBCC50]);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = *(unsigned int *)(objc_msgSend(v21, "bytes") + 8);
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "relativePath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v37 = v17;
      v38 = 2112;
      v39 = v19;
      v40 = 1024;
      *(_DWORD *)v41 = v22;
      *(_WORD *)&v41[4] = 2112;
      *(_QWORD *)&v41[6] = v32;
      v42 = 2112;
      v43 = v23;
      _os_log_debug_impl(&dword_230455000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating %@ %@ %d into database for %@%@", buf, 0x30u);

    }
    v25 = objc_msgSend(v17, "unsignedLongLongValue");
    objc_msgSend(v9, "relativePath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v22;
    LOBYTE(v25) = objc_msgSend(v8, "execute:", CFSTR("UPDATE backup_manifest SET new_file_id = %llu,    new_doc_id = %@,    new_gen_count = %d WHERE relative_path = %@"), v25, v19, v22, v26);

    v12 = v33;
    if ((v25 & 1) == 0)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        objc_msgSend(v9, "relativePath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastError");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v37 = v17;
        v38 = 2112;
        v39 = v19;
        v40 = 1024;
        *(_DWORD *)v41 = v31;
        *(_WORD *)&v41[4] = 2112;
        *(_QWORD *)&v41[6] = v30;
        v42 = 2112;
        v43 = v29;
        v44 = 2112;
        v45 = v27;
        _os_log_error_impl(&dword_230455000, v28, (os_log_type_t)0x90u, "[ERROR] Failed to update %@ %@ %d into database for %@: %@%@", buf, 0x3Au);

      }
    }

    v16 = v34;
  }
  else
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      objc_msgSend(v13, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v20;
      v38 = 2112;
      v39 = v16;
      v40 = 2112;
      *(_QWORD *)v41 = v17;
      _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] Unable to fetch URL properties for %@: %@%@", buf, 0x20u);

    }
  }

}

- (BOOL)attachDatabase:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSURL **p_attachedDatabaseURL;
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  char v14;
  BRCPQLConnection *database;
  id v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _BYTE *v29;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_INFO, "[INFO] Attaching database %@%@", buf, 0x16u);

  }
  p_attachedDatabaseURL = &self->_attachedDatabaseURL;
  if (self->_attachedDatabaseURL)
  {
    brc_bread_crumbs();
    v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      -[NSURL path](*p_attachedDatabaseURL, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v37 = v12;
      _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] Already have attached database %@ while trying to attach database %@.%@", buf, 0x20u);

    }
    v14 = 1;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__20;
    v38 = __Block_byref_object_dispose__20;
    v39 = 0;
    database = self->_database;
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __49__BRCDatabaseBackupStorage_attachDatabase_error___block_invoke;
    v27 = &unk_24FE434F8;
    v16 = v7;
    v28 = v16;
    v29 = buf;
    v14 = -[BRCPQLConnection performWithFlags:action:](database, "performWithFlags:action:", 1, &v24);
    if ((v14 & 1) != 0)
    {
      objc_storeStrong((id *)p_attachedDatabaseURL, a3);
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        objc_msgSend(v16, "path", v24, v25, v26, v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v30 = 138412802;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v17;
        _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] Unable to attach db %@: %@%@", v30, 0x20u);

      }
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
  }

  return v14;
}

uint64_t __49__BRCDatabaseBackupStorage_attachDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "execute:", CFSTR("ATTACH DATABASE %@ AS clientdb"), v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return v5;
}

- (id)docIDForURL:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0);
  if (v4 < 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage docIDForURL:].cold.1();
    v6 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", GSLibraryGetOrAllocateDocumentId());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (close(v5))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage docIDForURL:].cold.2();
LABEL_8:

  }
  return v6;
}

- (BOOL)updateAttachedDatabase
{
  void *v3;
  NSObject *v4;
  void *v5;
  BRCPQLConnection *database;
  BRCPQLConnection *v7;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  BRCPQLConnection *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_attachedDatabaseURL)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[NSURL path](self->_attachedDatabaseURL, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      database = self->_database;
      *(_DWORD *)buf = 138412802;
      v13 = v5;
      v14 = 2112;
      v15 = database;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_INFO, "[INFO] Updating attached database %@ %@%@", buf, 0x20u);

    }
    v7 = self->_database;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke;
    v11[3] = &unk_24FE40140;
    v11[4] = self;
    return -[BRCPQLConnection performWithFlags:action:](v7, "performWithFlags:action:", 5, v11);
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage updateAttachedDatabase].cold.1();

    return 0;
  }
}

uint64_t __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_2((uint64_t)v3);

  v6 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "setForeignKeys:enabled:", v3, 0))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "negateIDs:", v3)
      && objc_msgSend(*(id *)(a1 + 32), "updateIDs:", v3)
      && objc_msgSend(*(id *)(a1 + 32), "clearStagedIDs:", v3)
      && objc_msgSend(*(id *)(a1 + 32), "fixUpBackupDetector:", v3)
      && objc_msgSend(*(id *)(a1 + 32), "setForeignKeys:enabled:", v3, 1))
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_1((uint64_t)v3);

      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)setForeignKeys:(id)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    if ((objc_msgSend(v5, "execute:", CFSTR("PRAGMA foreign_keys = ON")) & 1) == 0)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
        -[BRCDatabaseBackupStorage setForeignKeys:enabled:].cold.1();
LABEL_9:

      v9 = 0;
      goto LABEL_10;
    }
  }
  else if ((objc_msgSend(v5, "execute:", CFSTR("PRAGMA foreign_keys = OFF")) & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage setForeignKeys:enabled:].cold.2();
    goto LABEL_9;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)negateIDs:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE clientdb.client_items SET item_file_id = -item_file_id")) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage negateIDs:].cold.4();
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage negateIDs:].cold.3();

  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE clientdb.client_items SET item_doc_id = -item_doc_id")) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage negateIDs:].cold.2();
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage negateIDs:].cold.1();
LABEL_12:

  return v7;
}

- (BOOL)updateIDs:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;

  v3 = a3;
  if ((objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX file_id_gen_count_index ON backup_manifest(file_id, gen_count)")) & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage updateIDs:].cold.10();
    goto LABEL_26;
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage updateIDs:].cold.9();

  if ((objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX doc_id_index ON backup_manifest(doc_id)")) & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage updateIDs:].cold.8();
    goto LABEL_26;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage updateIDs:].cold.7();

  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE clientdb.client_items  SET item_generation = (SELECT new_gen_count FROM backup_manifest WHERE file_id = -clientdb.client_items.item_file_id AND gen_count = clientdb.client_items.item_generation)")) & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage updateIDs:].cold.6();
    goto LABEL_26;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage updateIDs:].cold.5();

  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE OR IGNORE clientdb.client_items  SET item_file_id = (SELECT new_file_id FROM backup_manifest WHERE file_id = -clientdb.client_items.item_file_id)")) & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage updateIDs:].cold.4();
    goto LABEL_26;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage updateIDs:].cold.3();

  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE OR IGNORE clientdb.client_items  SET item_doc_id = (SELECT new_doc_id FROM backup_manifest WHERE doc_id = -clientdb.client_items.item_doc_id)")) & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupStorage updateIDs:].cold.2();
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage updateIDs:].cold.1();
LABEL_27:

  return v13;
}

- (BOOL)clearStagedIDs:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE OR IGNORE clientdb.client_items SET item_staged_generation = NULL WHERE item_staged_generation IS NOT NULL")) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      goto LABEL_10;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage clearStagedIDs:].cold.3();

  if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE OR IGNORE clientdb.client_items SET item_staged_file_id = NULL WHERE item_staged_file_id IS NOT NULL")) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
LABEL_10:
      -[BRCDatabaseBackupStorage clearStagedIDs:].cold.2();
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCDatabaseBackupStorage clearStagedIDs:].cold.1();
LABEL_12:

  return v7;
}

- (BOOL)fixUpBackupDetector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  id v13;
  char v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCDatabaseBackupStorage attachedDatabaseURL](self, "attachedDatabaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("control-odd"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("control-even"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT counter FROM clientdb.backup_detector"));
  v30 = 0;
  v10 = *MEMORY[0x24BDBD210];
  v29 = 0;
  v11 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v30, v10, &v29);
  v12 = v30;
  v13 = v29;
  v26 = v8;
  if ((v11 & 1) != 0)
  {
    v27 = 0;
    v28 = 0;
    v14 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v28, v10, &v27);
    v15 = v28;
    v16 = v27;

    if ((v14 & 1) != 0)
    {
      if ((objc_msgSend(v9, "unsignedLongLongValue") & 1) != 0)
        v17 = v15;
      else
        v17 = v12;
      v18 = -[NSObject unsignedLongLongValue](v17, "unsignedLongLongValue");
      if ((objc_msgSend(v9, "unsignedLongLongValue") & 1) != 0)
        v19 = v12;
      else
        v19 = v15;
      if ((objc_msgSend(v4, "execute:", CFSTR("UPDATE clientdb.backup_detector SET old = %llu, new = %llu"), v18, -[NSObject unsignedLongLongValue](v19, "unsignedLongLongValue")) & 1) != 0)
      {
        brc_bread_crumbs();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 1;
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[BRCDatabaseBackupStorage fixUpBackupDetector:].cold.1();
        goto LABEL_20;
      }
      brc_bread_crumbs();
      v20 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        -[BRCDatabaseBackupStorage fixUpBackupDetector:].cold.2();
    }
    else
    {
      brc_bread_crumbs();
      v20 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        objc_msgSend(v26, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v23;
        v33 = 2112;
        v34 = v16;
        v35 = 2112;
        v36 = v20;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] Unable to get inode for %@: %@%@", buf, 0x20u);

      }
    }
    v21 = 0;
LABEL_20:

    goto LABEL_21;
  }
  brc_bread_crumbs();
  v15 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    objc_msgSend(v7, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v25;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v15;
    _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] Unable to get inode for %@: %@%@", buf, 0x20u);

  }
  v21 = 0;
  v16 = v13;
LABEL_21:

  return v21;
}

- (BRCPQLConnection)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void)setDatabaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_databaseURL, a3);
}

- (NSArray)urlPropertiesToFetch
{
  return self->_urlPropertiesToFetch;
}

- (void)setUrlPropertiesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_urlPropertiesToFetch, a3);
}

- (NSURL)attachedDatabaseURL
{
  return self->_attachedDatabaseURL;
}

- (void)setAttachedDatabaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachedDatabaseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedDatabaseURL, 0);
  objc_storeStrong((id *)&self->_urlPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __48__BRCDatabaseBackupStorage_addRecordIfNotExist___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v2, (uint64_t)v2, "[DEBUG] Added record: %@%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void __41__BRCDatabaseBackupStorage_flushAndClose__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "databaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v9;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_230455000, a3, (os_log_type_t)0x90u, "[ERROR] Could not create a unique index %@: %@%@", (uint8_t *)&v10, 0x20u);

}

- (void)docIDForURL:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to open %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)docIDForURL:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] failed closing %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)updateAttachedDatabase
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] Not updating attached database because no database has been attached.%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v1, (uint64_t)v1, "[DEBUG] Successfully finished updating attach database batch: %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

void __50__BRCDatabaseBackupStorage_updateAttachedDatabase__block_invoke_cold_2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v1, (uint64_t)v1, "[DEBUG] Beginning update attach database batch: %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)setForeignKeys:enabled:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to enable foreign keys: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)setForeignKeys:enabled:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to disable foreign keys: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)negateIDs:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when negating doc ids%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)negateIDs:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to negate doc ids: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)negateIDs:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when negating file ids%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)negateIDs:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to negate file ids: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)updateIDs:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when updating doc ids%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)updateIDs:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to update the doc ids: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)updateIDs:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when updating file ids%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)updateIDs:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to update the file ids: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)updateIDs:.cold.5()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when updating gen counts%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)updateIDs:.cold.6()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to update the gen count: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)updateIDs:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Created doc_id_index%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateIDs:.cold.8()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to create doc_id_index, so updating will be incredibly slow: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)updateIDs:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Created file_id_gen_count_index%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateIDs:.cold.10()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to create file_id_gen_count_index, so updating will be incredibly slow: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)clearStagedIDs:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when clearing the staged file ids%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)clearStagedIDs:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to update the staged file ids: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)clearStagedIDs:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v0, v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] Changed %lld items when clearing the staged generation ids%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)fixUpBackupDetector:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Patched the backup detector%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)fixUpBackupDetector:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_230455000, v2, v3, "[ERROR] Failed to update the backup detector value: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
