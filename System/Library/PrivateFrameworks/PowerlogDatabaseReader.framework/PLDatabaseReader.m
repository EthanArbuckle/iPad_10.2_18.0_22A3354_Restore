@implementation PLDatabaseReader

- (sqlite3)openDatabaseFile:(id)a3
{
  char *errmsg;
  sqlite3 *ppDb;

  ppDb = 0;
  if (sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &ppDb, 6, 0))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "failed to open conn: %d\n");
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec(ppDb, "PRAGMA cache_size = 50;", 0, 0, &errmsg))
      return ppDb;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "failed to set cache size to 50 x 4KB: %d");
  }
  return 0;
}

- (PLDatabaseReader)initWithDatabaseFile:(id)a3
{
  id v4;
  PLDatabaseReader *v5;
  uint64_t v6;
  PLDatabaseReader *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDatabaseReader;
  v5 = -[PLDatabaseReader init](&v9, sel_init);
  if (v5)
  {
    if (!v4)
    {
      NSLog(CFSTR("Input database file (%@) is invalid!"), 0);
      goto LABEL_9;
    }
    v6 = sqlite3_initialize();
    if ((_DWORD)v6)
    {
      NSLog(CFSTR("failed to initialize library: %d\n"), v6);
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
    v5->_dbConnection = -[PLDatabaseReader openDatabaseFile:](v5, "openDatabaseFile:", v4);
    if (!-[PLDatabaseReader dbConnection](v5, "dbConnection"))
    {
      NSLog(CFSTR("Fail to open connection to database file!"));
      goto LABEL_9;
    }
  }
  v7 = v5;
LABEL_10:

  return v7;
}

- (void)dealloc
{
  sqlite3 *dbConnection;
  objc_super v4;

  dbConnection = self->_dbConnection;
  if (dbConnection)
    sqlite3_close(dbConnection);
  v4.receiver = self;
  v4.super_class = (Class)PLDatabaseReader;
  -[PLDatabaseReader dealloc](&v4, sel_dealloc);
}

- (id)prepareStatementAndPerformWithString:(id)a3
{
  id v4;
  int v5;
  sqlite3 *v6;
  id v7;
  const char *v8;
  void *v9;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  v5 = 5;
  while (1)
  {
    v6 = -[PLDatabaseReader dbConnection](self, "dbConnection");
    v7 = objc_retainAutorelease(v4);
    if (!sqlite3_prepare_v2(v6, (const char *)objc_msgSend(v7, "UTF8String"), -1, &ppStmt, 0))
      break;
    if (!--v5)
    {
      v8 = sqlite3_errmsg(-[PLDatabaseReader dbConnection](self, "dbConnection"));
      NSLog(CFSTR("Error prepare statement; query =%@, error = %s"), v7, v8);
      v9 = 0;
      goto LABEL_6;
    }
  }
  -[PLDatabaseReader performStatement:](self, "performStatement:", ppStmt);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (id)performStatement:(sqlite3_stmt *)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  PLDatabaseReader *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 || !-[PLDatabaseReader dbConnection](self, "dbConnection"))
  {
    NSLog(CFSTR("Invalid statement/connection!"));
    v20 = 0;
    goto LABEL_32;
  }
  v6 = sqlite3_column_count(a3);
  v7 = (void *)objc_opt_new();
  if (v6 < 1)
    goto LABEL_31;
  v8 = 0;
  v9 = v6;
  v22 = self;
  v23 = v5;
  while (1)
  {
    while (1)
    {
      v10 = sqlite3_step(a3);
      v11 = v10;
      if (!(_DWORD)v10)
      {
LABEL_11:
        v13 = sqlite3_errmsg(-[PLDatabaseReader dbConnection](self, "dbConnection"));
        NSLog(CFSTR("ERROR: sqlite3_step error=%d, %s"), v11, v13);
LABEL_12:
        if (v8 > 4)
          goto LABEL_31;
        ++v8;
        goto LABEL_26;
      }
      if ((_DWORD)v10 != 100)
        break;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != v9; ++i)
      {
        if (objc_msgSend(v7, "count") == v9)
        {
          objc_msgSend(v7, "objectAtIndex:", i);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(a3, i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);
        }
        v17 = sqlite3_column_type(a3, i);
        switch((int)v17)
        {
          case 1:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_column_int64(a3, i));
            v18 = objc_claimAutoreleasedReturnValue();
            break;
          case 2:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(a3, i));
            v18 = objc_claimAutoreleasedReturnValue();
            break;
          case 3:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(a3, i));
            v18 = objc_claimAutoreleasedReturnValue();
            break;
          case 5:
            goto LABEL_23;
          default:
            NSLog(CFSTR("[SQLITE] UNKNOWN DATATYPE colType=%d"), v17);
LABEL_23:
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v18 = objc_claimAutoreleasedReturnValue();
            break;
        }
        v19 = (void *)v18;
        objc_msgSend(v14, "addObject:", v18);

      }
      v5 = v23;
      objc_msgSend(v23, "addObject:", v14);

      v8 = 0;
      self = v22;
LABEL_26:
      if ((_DWORD)v11 != 5 && (_DWORD)v11 != 100)
        goto LABEL_31;
    }
    if ((_DWORD)v10 == 101)
      goto LABEL_12;
    v12 = sqlite3_errmsg(-[PLDatabaseReader dbConnection](self, "dbConnection"));
    NSLog(CFSTR("!!! returnCode=%s"), v12);
    if ((_DWORD)v11 != 5)
      goto LABEL_11;
    if (v8 > 4)
      break;
    ++v8;
    sqlite3_sleep(10);
  }
  NSLog(CFSTR("Database busy!"));
LABEL_31:

  v20 = v5;
LABEL_32:

  return v20;
}

- (id)tableNamesFromDatabase
{
  void *v2;
  void *v3;
  char *v4;
  char *i;
  void *v6;
  void *v7;

  -[PLDatabaseReader prepareStatementAndPerformWithString:](self, "prepareStatementAndPerformWithString:", CFSTR("SELECT name FROM sqlite_master WHERE type = 'table' AND name LIKE \"%PL%\"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (char *)objc_msgSend(v2, "count");
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v7);

      }
      v4 = v3;
    }
    else
    {
      NSLog(CFSTR("No table defined"));
    }

  }
  else
  {
    NSLog(CFSTR("Fail to query tables in database"));
    v4 = 0;
  }

  return v4;
}

- (id)stringValueOfTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v4;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA table_info('%@');"), v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDatabaseReader prepareStatementAndPerformWithString:](self, "prepareStatementAndPerformWithString:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "objectAtIndexedSubscript:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v10);
    }

    v32 = v7;
    v14 = objc_msgSend(v7, "count");
    v15 = v14;
    if (v14)
    {
      v16 = 0;
      v17 = v14 - 1;
      do
      {
        if (!v16)
          objc_msgSend(v5, "appendString:", CFSTR("("));
        objc_msgSend(v32, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v18);

        if (v17 == v16)
          v19 = CFSTR(")");
        else
          v19 = CFSTR(",");
        objc_msgSend(v5, "appendString:", v19);
        ++v16;
      }
      while (v15 != v16);
    }
    v4 = v31;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM '%@';"), v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDatabaseReader prepareStatementAndPerformWithString:](self, "prepareStatementAndPerformWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v28 = v21;
      v29 = v20;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      obj = v21;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v35)
      {
        v34 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v37 != v34)
              objc_enumerationMutation(obj);
            if (v15)
            {
              v23 = 0;
              v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              do
              {
                if (!v23)
                  objc_msgSend(v5, "appendString:", CFSTR("("));
                objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v25);

                if (v15 - 1 == v23)
                  v26 = CFSTR(")");
                else
                  v26 = CFSTR(",");
                objc_msgSend(v5, "appendString:", v26);
                ++v23;
              }
              while (v15 != v23);
            }
          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v35);
      }

      v4 = v31;
      v21 = v28;
      v20 = v29;
    }

  }
  else
  {
    NSLog(CFSTR("Invalid table name/database file"));
    v5 = 0;
  }

  return v5;
}

- (sqlite3)dbConnection
{
  return self->_dbConnection;
}

- (void)setDbConnection:(sqlite3 *)a3
{
  self->_dbConnection = a3;
}

@end
