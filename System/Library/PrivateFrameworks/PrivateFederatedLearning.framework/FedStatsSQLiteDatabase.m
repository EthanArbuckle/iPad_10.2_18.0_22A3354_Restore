@implementation FedStatsSQLiteDatabase

- (FedStatsSQLiteDatabase)initWithDatabase:(sqlite3 *)a3
{
  FedStatsSQLiteDatabase *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsSQLiteDatabase;
  result = -[FedStatsSQLiteDatabase init](&v5, sel_init);
  if (result)
    result->_database = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_close_v2(-[FedStatsSQLiteDatabase database](self, "database"));
  v3.receiver = self;
  v3.super_class = (Class)FedStatsSQLiteDatabase;
  -[FedStatsSQLiteDatabase dealloc](&v3, sel_dealloc);
}

+ (FedStatsSQLiteDatabase)databaseWithURL:(id)a3 mode:(char)a4 error:(id *)a5
{
  int v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  __CFString *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  const __CFString *v28;
  char v29;
  void *v30;
  id v31;
  int v32;
  id v34;
  sqlite3 *ppDb;
  id v36;
  unsigned __int8 v37;
  _QWORD v38[2];

  v6 = a4;
  v38[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    if (v6 == 97)
    {
      objc_msgSend(v8, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v19, &v37);

      if ((v20 & 1) == 0)
      {
        if (a5)
        {
          goto LABEL_30;
        }
        goto LABEL_40;
      }
      if (!v37)
      {
        v17 = 33554498;
LABEL_35:
        ppDb = 0;
        objc_msgSend(v10, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "absoluteString");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = sqlite3_open_v2((const char *)objc_msgSend(v31, "UTF8String"), &ppDb, v17, 0);

        if (!v32)
        {
          v34 = objc_alloc((Class)a1);
          v18 = (void *)objc_msgSend(v34, "initWithDatabase:", ppDb);
          goto LABEL_41;
        }
        if (!a5)
          goto LABEL_40;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot load database: %s"), sqlite3_errmsg(ppDb));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v15;
        goto LABEL_38;
      }
      goto LABEL_14;
    }
    if (v6 != 119)
    {
      if (v6 != 114)
      {
        if (a5)
        {
          v21 = CFSTR("Mode can be one of 'r', 'w', 'a'");
          goto LABEL_30;
        }
        goto LABEL_40;
      }
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v11, &v37);

      if ((v12 & 1) == 0)
      {
        if (a5)
        {
          goto LABEL_30;
        }
        goto LABEL_40;
      }
      if (!v37)
      {
        objc_msgSend(v8, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "isReadableFileAtPath:", v13);

        if ((v14 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("nolock"), CFSTR("1"));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v38[0] = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setQueryItems:", v16);
          v17 = 33554497;
LABEL_33:

          goto LABEL_34;
        }
        if (!a5)
          goto LABEL_40;
LABEL_30:
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v21);
        v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

        goto LABEL_42;
      }
LABEL_14:
      if (a5)
      {
        goto LABEL_30;
      }
LABEL_40:
      v18 = 0;
      goto LABEL_41;
    }
    objc_msgSend(v8, "URLByResolvingSymlinksInPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByDeletingLastPathComponent");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[__CFString path](v15, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v23, &v37);
    v25 = v37;

    if (v24 && v25)
    {
      v17 = 33554502;
      objc_msgSend(v8, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v26, &v37);

      if (!v27)
      {
LABEL_34:

        goto LABEL_35;
      }
      if (!v37)
      {
        v36 = 0;
        v29 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v36);
        v16 = v36;
        if ((v29 & 1) == 0)
        {
          if (a5)
          {
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_39;
        }
        goto LABEL_33;
      }
      if (a5)
      {
LABEL_38:
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v28);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5)
    {
      v28 = CFSTR("The directory for the URL does not exist");
      goto LABEL_38;
    }
LABEL_39:

    goto LABEL_40;
  }
  if (a5)
  {
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_42:

  return (FedStatsSQLiteDatabase *)v18;
}

- (id)runQuery:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  FedStatSQLiteDatabaseQueryResult *v9;
  FedStatSQLiteDatabaseQueryResult *v10;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  ppStmt = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = sqlite3_prepare_v2(-[FedStatsSQLiteDatabase database](self, "database"), (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, &ppStmt, 0);
    if (!v7)
    {
      v10 = [FedStatSQLiteDatabaseQueryResult alloc];
      v9 = -[FedStatSQLiteDatabaseQueryResult initWithQueryStatement:](v10, "initWithQueryStatement:", ppStmt);
      goto LABEL_9;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot prepare query: %s"), sqlite3_errstr(v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (BOOL)execute:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  id v8;
  const char *v9;
  int v10;
  int v11;
  void *v12;
  char *errmsg;

  errmsg = 0;
  v6 = a3;
  v7 = -[FedStatsSQLiteDatabase database](self, "database");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = sqlite3_exec(v7, v9, 0, 0, &errmsg);
  v11 = v10;
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database execute error: %s"), errmsg);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11 == 0;
}

- (sqlite3)database
{
  return self->_database;
}

@end
