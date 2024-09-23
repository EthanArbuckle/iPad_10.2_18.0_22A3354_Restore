@implementation SHClusterMetadataQuery

+ (int64_t)dataStoreTypeFromString:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 1;
  objc_msgSend(a1, "stringFromStoreType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v5 = 2;
    objc_msgSend(a1, "stringFromStoreType:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      shcore_log_object();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_21A508000, v10, OS_LOG_TYPE_ERROR, "Unknown database type %@, assuming it is tracks", (uint8_t *)&v12, 0xCu);
      }

      v5 = 1;
    }
  }

  return v5;
}

+ (id)stringFromStoreType:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("tracks");
  else
    return CFSTR("artists");
}

+ (id)dateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)dateFormatter__dateFormatter;
  if (!dateFormatter__dateFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD15D0]);
    v4 = (void *)dateFormatter__dateFormatter;
    dateFormatter__dateFormatter = (uint64_t)v3;

    objc_msgSend((id)dateFormatter__dateFormatter, "setFormatOptions:", 1907);
    v2 = (void *)dateFormatter__dateFormatter;
  }
  return v2;
}

+ (id)metadataFromDatabaseAtLocation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint8_t v15[4];
  id v16;
  uint64_t v17;
  const __CFString *v18;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = 0;
  if (+[SHSQLiteUtils openDatabase:atURL:error:](SHSQLiteUtils, "openDatabase:atURL:error:", &v14, v6, a4))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__SHClusterMetadataQuery_metadataFromDatabaseAtLocation_error___block_invoke;
    v13[3] = &unk_24DCD2588;
    v13[4] = &buf;
    v13[5] = a1;
    +[SHSQLiteUtils runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:](SHSQLiteUtils, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", CFSTR("select type, storefront, hash, creationDate from Metadata LIMIT 1"), v14, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v13, a4);
    if (!a4 || *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      if (!a4)
      {
LABEL_14:
        +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", v14, 0);
        a4 = (id *)*(id *)(*((_QWORD *)&buf + 1) + 40);
        _Block_object_dispose(&buf, 8);

        goto LABEL_15;
      }
    }
    else
    {
      v17 = *MEMORY[0x24BDD0BA0];
      v18 = CFSTR("Failed to read the database metadata");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHInsightsError errorWithCode:underlyingError:keyOverrides:](SHInsightsError, "errorWithCode:underlyingError:keyOverrides:", 201, 0, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*a4)
    {
      shcore_log_object();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *a4;
        *(_DWORD *)v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_21A508000, v10, OS_LOG_TYPE_ERROR, "Error reading metadata %@", v15, 0xCu);
      }

    }
    goto LABEL_14;
  }
  if (a4)
  {
    shcore_log_object();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *a4;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_21A508000, v8, OS_LOG_TYPE_ERROR, "Failed to open database for metadata with error %@", (uint8_t *)&buf, 0xCu);
    }

    a4 = 0;
  }
LABEL_15:

  return a4;
}

void __63__SHClusterMetadataQuery_metadataFromDatabaseAtLocation_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  SHClusterMetadata *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];

  objc_msgSend(*(id *)(a1 + 40), "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sh_columnToText(a2, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  sh_columnToText(a2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    shcore_log_object();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21A508000, v10, OS_LOG_TYPE_ERROR, "Unreadable metadata, failing", v18, 2u);
    }

  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_class(), "dataStoreTypeFromString:", v7);
    v12 = [SHClusterMetadata alloc];
    sh_columnToText(a2, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sh_columnToText(a2, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SHClusterMetadata initWithType:storefront:uniqueHash:creationDate:](v12, "initWithType:storefront:uniqueHash:creationDate:", v11, v13, v14, v6);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

+ (BOOL)writeMetadata:(id)a3 toDatabaseAtLocation:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  BOOL v10;
  NSObject *v11;
  const __CFString *v12;
  sqlite3_stmt *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  sqlite3_stmt *v22;
  id v23;
  int v24;
  const char *v25;
  NSObject *v26;
  __CFString *v27;
  sqlite3_stmt *pStmt;
  sqlite3 *v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v30 = 0;
  if (+[SHSQLiteUtils createDatabase:atURL:error:](SHSQLiteUtils, "createDatabase:atURL:error:", &v30, a4, a5))
  {
    if (+[SHSQLiteUtils database:hasPopulatedTable:error:](SHSQLiteUtils, "database:hasPopulatedTable:error:", v30, CFSTR("Metadata"), 0))
    {
      v9 = CFSTR("UPDATE Metadata set type = ?, hash = ?, storefront = ?, creationDate = ?");
    }
    else
    {
      v9 = CFSTR("INSERT into Metadata(type, hash, storefront, creationDate) VALUES(?,?,?,?)");
    }
    if (sqlite3_prepare_v2(v30, (const char *)-[__CFString cStringUsingEncoding:](v9, "cStringUsingEncoding:", 4, 0), -1, &pStmt, 0))
    {
      v10 = 0;
    }
    else
    {
      v13 = pStmt;
      objc_msgSend((id)objc_opt_class(), "stringFromStoreType:", objc_msgSend(v8, "clusterType"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v13, 1, (const char *)objc_msgSend(v14, "cStringUsingEncoding:", 4), -1, 0);

      v15 = pStmt;
      objc_msgSend(v8, "uniqueHash");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "cStringUsingEncoding:", 4), -1, 0);

      v17 = pStmt;
      objc_msgSend(v8, "storefront");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v17, 3, (const char *)objc_msgSend(v18, "cStringUsingEncoding:", 4), -1, 0);

      objc_msgSend(a1, "dateFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "creationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromDate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = pStmt;
      v23 = objc_retainAutorelease(v21);
      sqlite3_bind_text(v22, 4, (const char *)objc_msgSend(v23, "cStringUsingEncoding:", 4), -1, 0);
      v24 = sqlite3_step(pStmt);
      v10 = v24 == 101;
      if (v24 != 101)
      {
        v25 = sqlite3_errmsg(v30);
        shcore_log_object();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v27;
          _os_log_impl(&dword_21A508000, v26, OS_LOG_TYPE_ERROR, "Error updating metadata %@", buf, 0xCu);

        }
        if (a5)
        {
          +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    sqlite3_finalize(pStmt);
    +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", v30, 0);
  }
  else
  {
    shcore_log_object();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v12 = (const __CFString *)*a5;
      else
        v12 = CFSTR("Unknown Error");
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_21A508000, v11, OS_LOG_TYPE_ERROR, "Failed to open database for metadata with error %@", buf, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

@end
