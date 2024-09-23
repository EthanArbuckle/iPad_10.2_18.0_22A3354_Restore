@implementation WBSTouchIconCacheSettingsSQLiteStore

- (id)_selectAllEntriesSQLiteStatement
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDatabase:query:", v4, CFSTR("SELECT * FROM cache_settings"));

  return v5;
}

+ (Class)cacheSettingsEntryClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)databaseSchemaVersion
{
  return 4;
}

- (id)_createNewDatabaseSQLiteStatement
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDatabase:query:", v4, CFSTR("CREATE TABLE IF NOT EXISTS cache_settings (id INTEGER PRIMARY KEY AUTOINCREMENT,host TEXT NOT NULL UNIQUE,last_request_date REAL NOT NULL,last_request_was_in_user_loaded_page BOOLEAN NOT NULL DEFAULT 0,request_count INTEGER NOT NULL DEFAULT 0,icon_is_in_cache BOOLEAN NOT NULL DEFAULT 0,download_status_flags INTEGER NOT NULL DEFAULT 0,extracted_color BLOB NULL,transparency_analysis_result INTEGER NOT NULL DEFAULT 0,uuid TEXT NULL,last_response_status_code INTEGER NOT NULL DEFAULT 0)"));

  return v5;
}

- (id)_selectEntrySQLiteStatementWithHost:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:", v6, CFSTR("SELECT * FROM cache_settings WHERE host = ? LIMIT 1"));

  objc_msgSend(v7, "bindString:atParameterIndex:", v4, 1);
  return v7;
}

- (id)_insertEntrySQLiteStatementWithEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:", v6, CFSTR("INSERT INTO cache_settings (host, last_request_date, last_request_was_in_user_loaded_page, request_count, icon_is_in_cache, download_status_flags, transparency_analysis_result, uuid, last_response_status_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"));

  objc_msgSend(v4, "host");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastRequestDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v18 = v9;
  v17 = objc_msgSend(v4, "lastRequestWasInUserLoadedWebpage");
  v16 = objc_msgSend(v4, "requestCount");
  v15 = objc_msgSend(v4, "isIconInCache");
  v14 = objc_msgSend(v4, "downloadStatusFlags");
  v13 = objc_msgSend(v4, "transparencyAnalysisResult");
  objc_msgSend(v4, "UUIDString");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "lastResponseStatusCode");
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(v7, &v19, (double *)&v18, &v17, &v16, &v15, &v14, &v13, &v12, &v11);

  return v7;
}

- (id)_updateEntrySQLiteStatementWithEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:", v6, CFSTR("UPDATE cache_settings SET host = ?, last_request_date = ?, last_request_was_in_user_loaded_page = ?, request_count = ?, icon_is_in_cache = ?, download_status_flags = ?, transparency_analysis_result = ?, uuid = ?, last_response_status_code = ? WHERE id = ?"));

  objc_msgSend(v4, "host");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastRequestDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v19 = v9;
  v18 = objc_msgSend(v4, "lastRequestWasInUserLoadedWebpage");
  v17 = objc_msgSend(v4, "requestCount");
  v16 = objc_msgSend(v4, "isIconInCache");
  v15 = objc_msgSend(v4, "downloadStatusFlags");
  v14 = objc_msgSend(v4, "transparencyAnalysisResult");
  objc_msgSend(v4, "UUIDString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "lastResponseStatusCode");
  v11 = objc_msgSend(v4, "databaseID");
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(v7, &v20, (double *)&v19, &v18, &v17, &v16, &v15, &v14, &v13, &v12, &v11);

  return v7;
}

- (id)_deleteEntrySQLiteStatementWithHost:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:", v6, CFSTR("DELETE FROM cache_settings WHERE host = ?"));

  objc_msgSend(v7, "bindString:atParameterIndex:", v4, 1);
  return v7;
}

- (id)_deleteAllEntriesSQLiteStatement
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDatabase:query:", v4, CFSTR("DELETE FROM cache_settings"));

  return v5;
}

- (id)_statementsForMigrationToSchemaVersion:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "databaseSchemaVersion") != a3)
    return 0;
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE cache_settings ADD COLUMN uuid TEXT NULL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D8A1B8]);
    -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v12, "initWithDatabase:query:", v13, v5);

    v18 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = (void *)v14;
    goto LABEL_9;
  }
  if (a3 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE cache_settings ADD COLUMN last_response_status_code INTEGER NOT NULL DEFAULT 0"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0D8A1B8]);
    -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v15, "initWithDatabase:query:", v16, v5);

    v17 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS cache_settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D8A1B8]);
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDatabase:query:", v7, v5);

  v19[0] = v8;
  -[WBSTouchIconCacheSettingsSQLiteStore _createNewDatabaseSQLiteStatement](self, "_createNewDatabaseSQLiteStatement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

@end
