@implementation PPSSQLMetadataStore

+ (id)queryMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  sqlite3 *v12;
  int64_t v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = +[PPSSQLMetadataStore openReadConnection:](PPSSQLMetadataStore, "openReadConnection:", a3);
  v13 = +[PPSSQLMetadataStore queryIDForSubsystem:category:conn:](PPSSQLMetadataStore, "queryIDForSubsystem:category:conn:", v11, v10, v12);

  +[PPSSQLMetadataStore queryMetadataForFKID:name:conn:](PPSSQLMetadataStore, "queryMetadataForFKID:name:conn:", v13, v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  sqlite3_close(v12);
  return v14;
}

+ (id)querySubsystemsForFilepath:(id)a3
{
  sqlite3 *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = +[PPSSQLMetadataStore openReadConnection:](PPSSQLMetadataStore, "openReadConnection:", a3);
  objc_msgSend(a1, "performReadQuery:conn:", CFSTR("SELECT DISTINCT subsystem FROM PLCoreStorage_Metadata;"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_close(v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "objectForKeyedSubscript:", CFSTR("subsystem"), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)queryMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  sqlite3 *v9;
  int64_t v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = +[PPSSQLMetadataStore openReadConnection:](PPSSQLMetadataStore, "openReadConnection:", a3);
  v10 = +[PPSSQLMetadataStore queryIDForSubsystem:category:conn:](PPSSQLMetadataStore, "queryIDForSubsystem:category:conn:", v8, v7, v9);

  +[PPSSQLMetadataStore queryMetadataForFKID:conn:](PPSSQLMetadataStore, "queryMetadataForFKID:conn:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_close(v9);
  return v11;
}

+ (int64_t)queryIDForSubsystem:(id)a3 category:(id)a4 conn:(sqlite3 *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = -1;
  if (v8 && v9 && a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ID FROM PLCoreStorage_Metadata WHERE subsystem='%@' AND category='%@'"), v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "performReadQuery:conn:", v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "longValue");

    }
    else
    {
      PPSSQLStoreLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v8;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_24399D000, v16, OS_LOG_TYPE_INFO, "ID not found for subsystem: %@ category: %@", buf, 0x16u);
      }

      v11 = -1;
    }

  }
  return v11;
}

+ (id)queryMetadataForFKID:(int64_t)a3 name:(id)a4 conn:(sqlite3 *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  uint8_t v34[128];
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v8 && a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT build, metadata FROM PLCoreStorage_Metadata_Dynamic WHERE FK_ID=%lu AND name='%@'"), a3, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "performReadQuery:conn:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = v12;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v14)
      {
        v15 = v14;
        v25 = v12;
        v26 = v11;
        v27 = v9;
        v16 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("build"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("metadata"));
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            if (v19)
              v22 = v20 == 0;
            else
              v22 = 1;
            if (!v22)
            {
              v32 = v19;
              v33 = v20;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v23);

            }
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v15);
        v11 = v26;
        v9 = v27;
        v12 = v25;
      }
    }
    else
    {
      PPSSQLStoreLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v36 = a3;
        v37 = 2112;
        v38 = v9;
        _os_log_impl(&dword_24399D000, v13, OS_LOG_TYPE_INFO, "Metadata not found for FKID: %lu name: %@", buf, 0x16u);
      }
      v10 = 0;
    }

  }
  return v10;
}

+ (id)queryMetadataForFKID:(int64_t)a3 conn:(sqlite3 *)a4
{
  void *v4;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  NSObject *obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  void *v43;
  uint8_t v44[128];
  uint8_t buf[4];
  int64_t v46;
  uint64_t v47;

  v4 = 0;
  v47 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) == 0 && a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT name, build, metadata FROM PLCoreStorage_Metadata_Dynamic WHERE FK_ID=%lu"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "performReadQuery:conn:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v4 = (void *)objc_opt_new();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v9;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v10)
      {
        v11 = v10;
        v34 = v8;
        v35 = v4;
        v33 = v9;
        v12 = *(_QWORD *)v39;
        v13 = CFSTR("name");
        v14 = CFSTR("build");
        v15 = obj;
        do
        {
          v16 = 0;
          v37 = v11;
          do
          {
            if (*(_QWORD *)v39 != v12)
              objc_enumerationMutation(v15);
            v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
            objc_msgSend(v17, "objectForKeyedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("metadata"));
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            if (v18)
              v22 = v19 == 0;
            else
              v22 = 1;
            if (!v22 && v20 != 0)
            {
              v24 = v12;
              v25 = v14;
              v26 = v13;
              objc_msgSend(v35, "objectForKeyedSubscript:", v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v27)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSObject count](v15, "count"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKeyedSubscript:", v28, v18);

              }
              objc_msgSend(v35, "objectForKeyedSubscript:", v18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v19;
              v43 = v21;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v30);

              v15 = obj;
              v13 = v26;
              v14 = v25;
              v12 = v24;
              v11 = v37;
            }

            ++v16;
          }
          while (v11 != v16);
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v11);
        v9 = v33;
        v8 = v34;
        v4 = v35;
      }
    }
    else
    {
      PPSSQLStoreLog();
      v31 = objc_claimAutoreleasedReturnValue();
      obj = v31;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v46 = a3;
        _os_log_impl(&dword_24399D000, v31, OS_LOG_TYPE_INFO, "Metadata not found for FKID: %lu", buf, 0xCu);
      }
      v4 = 0;
    }

  }
  return v4;
}

+ (sqlite3)openReadConnection:(id)a3
{
  id v4;
  NSObject *v5;
  sqlite3 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3 *ppDb;

  ppDb = 0;
  v4 = objc_retainAutorelease(a3);
  if (sqlite3_open_v2((const char *)objc_msgSend(v4, "UTF8String"), &ppDb, 3145729, 0))
  {
    PPSSQLStoreLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSSQLMetadataStore openReadConnection:].cold.2((uint64_t)v4, &ppDb, v5);
LABEL_8:

    sqlite3_close(ppDb);
    v6 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(a1, "performQuery:conn:", CFSTR("PRAGMA cache_size=50"), ppDb) & 1) == 0)
  {
    PPSSQLStoreLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSSQLMetadataStore openReadConnection:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_8;
  }
  v6 = ppDb;
LABEL_9:

  return v6;
}

+ (BOOL)performQuery:(id)a3 conn:(sqlite3 *)a4
{
  id v5;
  int v6;
  NSObject *v7;
  char *errmsg;

  errmsg = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = sqlite3_exec(a4, (const char *)objc_msgSend(v5, "UTF8String"), 0, 0, &errmsg);
  if (v6)
  {
    PPSSQLStoreLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PPSSQLMetadataStore performQuery:conn:].cold.1((uint64_t)v5, (uint64_t *)&errmsg, v7);

    sqlite3_free(errmsg);
  }

  return v6 == 0;
}

+ (id)performReadQuery:(id)a3 conn:(sqlite3 *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v5 = objc_retainAutorelease(a3);
  if (sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0))
  {
    PPSSQLStoreLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PPSSQLMetadataStore performReadQuery:conn:].cold.1((uint64_t)v5, v6);

  }
  performStatement(ppStmt);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_finalize(ppStmt);

  return v7;
}

+ (void)openReadConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24399D000, a1, a3, "Failed to set cache size", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)openReadConnection:(NSObject *)a3 .cold.2(uint64_t a1, sqlite3 **a2, NSObject *a3)
{
  const char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = sqlite3_errmsg(*a2);
  v7 = 138412546;
  v8 = a1;
  v9 = 2080;
  v10 = v5;
  OUTLINED_FUNCTION_1_0(&dword_24399D000, a3, v6, "Failed to create connection to db %@ - %s", (uint8_t *)&v7);
}

+ (void)performQuery:(NSObject *)a3 conn:.cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2080;
  v7 = v3;
  OUTLINED_FUNCTION_1_0(&dword_24399D000, a3, (uint64_t)a3, "Failed to execute query %@ - %s", (uint8_t *)&v4);
}

+ (void)performReadQuery:(uint64_t)a1 conn:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24399D000, a2, OS_LOG_TYPE_ERROR, "Failed to prepare statement for query: %@", (uint8_t *)&v2, 0xCu);
}

@end
