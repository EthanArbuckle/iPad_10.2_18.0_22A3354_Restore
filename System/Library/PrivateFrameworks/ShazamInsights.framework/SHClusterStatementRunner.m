@implementation SHClusterStatementRunner

- (void)dealloc
{
  sqlite3 *db;
  objc_super v4;

  db = self->_db;
  if (db)
    +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", db, 0);
  v4.receiver = self;
  v4.super_class = (Class)SHClusterStatementRunner;
  -[SHClusterStatementRunner dealloc](&v4, sel_dealloc);
}

- (SHClusterStatementRunner)initWithDatabaseURL:(id)a3
{
  id v5;
  SHClusterStatementRunner *v6;
  SHClusterStatementRunner *v7;
  uint64_t v8;
  NSArray *validDatabaseKeys;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHClusterStatementRunner;
  v6 = -[SHClusterStatementRunner init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseURL, a3);
    -[SHClusterStatementRunner supportedKeysForDatabase](v7, "supportedKeysForDatabase");
    v8 = objc_claimAutoreleasedReturnValue();
    validDatabaseKeys = v7->_validDatabaseKeys;
    v7->_validDatabaseKeys = (NSArray *)v8;

  }
  return v7;
}

- (sqlite3)db
{
  sqlite3 *result;
  sqlite3 **p_db;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_db = &self->_db;
  result = self->_db;
  if (!result)
  {
    -[SHClusterStatementRunner databaseURL](self, "databaseURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = +[SHSQLiteUtils openDatabase:atURL:error:](SHSQLiteUtils, "openDatabase:atURL:error:", p_db, v5, &v9);
    v7 = v9;

    if (!v6)
    {
      sh_log_object();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_impl(&dword_21A508000, v8, OS_LOG_TYPE_ERROR, "Failed to open database for artist query %@", buf, 0xCu);
      }

    }
    return *p_db;
  }
  return result;
}

+ (id)supportedKeys
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDE9858];
  v7[0] = *MEMORY[0x24BDE9810];
  v7[1] = v3;
  v7[2] = *MEMORY[0x24BDE9800];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)supportedKeysForDatabase
{
  void *v3;
  sqlite3 *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SHClusterStatementRunner db](self, "db");
  v11 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__SHClusterStatementRunner_supportedKeysForDatabase__block_invoke;
  v12[3] = &unk_24DCD27A8;
  v13 = v3;
  v5 = v3;
  +[SHSQLiteUtils runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:](SHSQLiteUtils, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", CFSTR("PRAGMA table_info('MediaItems')"), v4, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v12, &v11);
  v6 = v11;
  objc_msgSend((id)objc_opt_class(), "supportedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "intersectSet:", v5);
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __52__SHClusterStatementRunner_supportedKeysForDatabase__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  sh_columnToText(a2, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)mediaItemsSimilarToMediaItemValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a4;
  v10 = a3;
  -[SHClusterStatementRunner supportedKeysForDatabaseAsString](self, "supportedKeysForDatabaseAsString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("select %@ from MediaItems where cohesion = (select cohesion from MediaItems where %@ = <MEDIA_NAME> COLLATE %@) and %@ != <MEDIA_NAME2> COLLATE %@"), v11, v9, SHInsightsCustomCollation, v9, SHInsightsCustomCollation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v18 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHClusterStatementRunner mediaItemsWithQuery:tokens:objects:error:](self, "mediaItemsWithQuery:tokens:objects:error:", v12, &unk_24DCD5F50, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)mediaItemsFromPropertyCollection:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  -[SHClusterStatementRunner supportedKeysForDatabaseAsString](self, "supportedKeysForDatabaseAsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "property");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("select %@ from MediaItems where %@ COLLATE %@ in (<MEDIA_IDS>)"), v8, v9, SHInsightsCustomCollation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHClusterStatementRunner mediaItemsWithQuery:tokens:objects:error:](self, "mediaItemsWithQuery:tokens:objects:error:", v10, &unk_24DCD5F68, v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)mediaItemsWithQuery:(id)a3 tokens:(id)a4 objects:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  sqlite3 *v15;
  id v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, sqlite3_stmt *);
  void *v24;
  SHClusterStatementRunner *v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDBCEF0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SHClusterStatementRunner db](self, "db");
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __69__SHClusterStatementRunner_mediaItemsWithQuery_tokens_objects_error___block_invoke;
  v24 = &unk_24DCD27D0;
  v25 = self;
  v16 = v14;
  v26 = v16;
  LOBYTE(self) = +[SHSQLiteUtils runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:](SHSQLiteUtils, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", v13, v15, v12, v11, &v21, a6);

  if ((self & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "copy", v21, v22, v23, v24, v25);
  }
  else
  {
    sh_log_object();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a6)
        v19 = (const __CFString *)*a6;
      else
        v19 = &stru_24DCD2C90;
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_21A508000, v18, OS_LOG_TYPE_ERROR, "Failed to perform artists query %@", buf, 0xCu);
    }

    v17 = 0;
  }

  return v17;
}

void __69__SHClusterStatementRunner_mediaItemsWithQuery_tokens_objects_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "validDatabaseKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      sh_columnToText(a2, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "validDatabaseKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forKey:", v7, v9);

      ++v6;
      objc_msgSend(*(id *)(a1 + 32), "validDatabaseKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v11 > v6);
  }
  objc_msgSend(MEMORY[0x24BDE97D8], "mediaItemWithProperties:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

}

- (id)mediaItemsAtCohesionLevel:(int64_t)a3 forQueryMediaIDs:(id)a4 filteredBySeedMediaIDs:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  sqlite3 *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  const __CFString *v31;
  void *v33;
  void *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  const __CFString *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a5;
  -[SHClusterStatementRunner supportedKeysForDatabaseAsStringWithPrefix:](self, "supportedKeysForDatabaseAsStringWithPrefix:", CFSTR("t1."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "property");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "property");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("select %@ from MediaItems t1, Cohesion c1 INNER JOIN (select  c2.high, c2.medium, c2.low from MediaItems t2, Cohesion c2 where t2.%@ in (<SEED_MEDIA_IDS>) AND t2.cohesion = c2.id order by %@) as s1 ON s1.low = c1.low"), v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v35 = (void *)v15;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a3 == 2)
  {
    v18 = CFSTR(" AND s1.medium = c1.medium");
  }
  else
  {
    if (a3 != 1)
      goto LABEL_6;
    v18 = CFSTR(" AND s1.high = c1.high AND s1.medium = c1.medium");
  }
  objc_msgSend(v16, "appendString:", v18);
LABEL_6:
  objc_msgSend(v9, "property");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "property");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendFormat:", CFSTR(" where t1.%@ in (<QUERY_MEDIA_IDS>) AND t1.cohesion = c1.id order by %@"), v19, v20);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = -[SHClusterStatementRunner db](self, "db");
  objc_msgSend(v11, "collection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v24;
  v33 = v9;
  objc_msgSend(v9, "collection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __100__SHClusterStatementRunner_mediaItemsAtCohesionLevel_forQueryMediaIDs_filteredBySeedMediaIDs_error___block_invoke;
  v36[3] = &unk_24DCD27D0;
  v36[4] = self;
  v28 = (id)v21;
  v37 = v28;
  LOBYTE(v21) = +[SHSQLiteUtils runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:](SHSQLiteUtils, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", v17, v22, &unk_24DCD5F80, v27, v36, a6);

  if ((v21 & 1) != 0)
  {

    v29 = (void *)objc_msgSend(v28, "copy");
  }
  else
  {
    sh_log_object();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (a6)
        v31 = (const __CFString *)*a6;
      else
        v31 = &stru_24DCD2C90;
      *(_DWORD *)buf = 138412290;
      v39 = v31;
      _os_log_impl(&dword_21A508000, v30, OS_LOG_TYPE_ERROR, "Failed to query database %@", buf, 0xCu);
    }

    v29 = 0;
  }

  return v29;
}

void __100__SHClusterStatementRunner_mediaItemsAtCohesionLevel_forQueryMediaIDs_filteredBySeedMediaIDs_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "validDatabaseKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      sh_columnToText(a2, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "validDatabaseKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v8, v10);

      ++v7;
      objc_msgSend(*(id *)(a1 + 32), "validDatabaseKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v12 > v7);
  }
  objc_msgSend(MEMORY[0x24BDE97D8], "mediaItemWithProperties:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  }
  else
  {
    sh_log_object();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21A508000, v14, OS_LOG_TYPE_ERROR, "Failed get a trackID from tracks query", v15, 2u);
    }

  }
}

- (id)supportedKeysForDatabaseAsString
{
  return -[SHClusterStatementRunner supportedKeysForDatabaseAsStringWithPrefix:](self, "supportedKeysForDatabaseAsStringWithPrefix:", &stru_24DCD2C90);
}

- (id)supportedKeysForDatabaseAsStringWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHClusterStatementRunner validDatabaseKeys](self, "validDatabaseKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "appendString:", v4);
      -[SHClusterStatementRunner validDatabaseKeys](self, "validDatabaseKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v10);

      -[SHClusterStatementRunner validDatabaseKeys](self, "validDatabaseKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") - 1;

      if (v8 != v12)
        objc_msgSend(v5, "appendString:", CFSTR(", "));
      ++v8;
      -[SHClusterStatementRunner validDatabaseKeys](self, "validDatabaseKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v14 > v8);
  }

  return v5;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSArray)validDatabaseKeys
{
  return self->_validDatabaseKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDatabaseKeys, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
