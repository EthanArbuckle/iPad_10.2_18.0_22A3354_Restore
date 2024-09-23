@implementation TSUDatabase

- (TSUDatabase)initWithPath:(id)a3 error:(id *)a4
{
  return (TSUDatabase *)-[TSUDatabase _initWithPath:readonly:error:](self, "_initWithPath:readonly:error:", a3, 0, a4);
}

- (id)initReadonlyWithPath:(id)a3 error:(id *)a4
{
  return -[TSUDatabase _initWithPath:readonly:error:](self, "_initWithPath:readonly:error:", a3, 1, a4);
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  objc_super v5;

  if (self->_db)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 72, CFSTR("Database wasn't closed"));
    -[TSUDatabase closeWithError:](self, "closeWithError:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSUDatabase;
  -[TSUDatabase dealloc](&v5, sel_dealloc);
}

- (BOOL)compactWithError:(id *)a3
{
  return -[TSUDatabase executeUpdateWithSql:error:](self, "executeUpdateWithSql:error:", "vacuum", a3);
}

- (BOOL)closeWithError:(id *)a3
{
  sqlite3_stmt *stmt;
  sqlite3_stmt *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL result;
  uint64_t v15;

  if (!self->_db)
    return 1;
  do
  {
    stmt = sqlite3_next_stmt(self->_db, 0);
    v7 = stmt;
    if (!stmt)
      break;
    v8 = sqlite3_finalize(stmt);
  }
  while (TSUHandleSqlite(v8, a3, self, a2, 98, (uint64_t)CFSTR("Finalizing statement"), v9, v10, v15));
  v11 = sqlite3_close(self->_db);
  result = TSUHandleSqlite(v11, a3, self, a2, 101, (uint64_t)CFSTR("Closing database"), v12, v13, v15);
  if (v7)
    result = 0;
  self->_db = 0;
  return result;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &self->_beginTransactionStatement, "begin exclusive", a3);
  if (v5)
    LOBYTE(v5) = -[TSUDatabase executeUpdate:shouldFinalize:error:](self, "executeUpdate:shouldFinalize:error:", self->_beginTransactionStatement, 0, a3);
  return v5;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &self->_commitTransactionStatement, "commit", a3);
  if (v5)
    LOBYTE(v5) = -[TSUDatabase executeUpdate:shouldFinalize:error:](self, "executeUpdate:shouldFinalize:error:", self->_commitTransactionStatement, 0, a3);
  return v5;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &self->_rollbackTransactionStatement, "rollback", a3);
  if (v5)
    LOBYTE(v5) = -[TSUDatabase executeUpdate:shouldFinalize:error:](self, "executeUpdate:shouldFinalize:error:", self->_rollbackTransactionStatement, 0, a3);
  return v5;
}

- (BOOL)needsUpgradeFromSchemaVersion:(int)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", *(_QWORD *)&a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase needsUpgradeFromSchemaVersion:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 137, CFSTR("Abstract method"));
  return 0;
}

- (BOOL)upgradeFromSchemaVersion:(int)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;

  v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", *(_QWORD *)&a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase upgradeFromSchemaVersion:error:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 143, CFSTR("Abstract method"));
  return 0;
}

- (BOOL)setSchemaVersion:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id v7;
  uint64_t v8;

  v5 = *(_QWORD *)&a3;
  if (a3 <= 0)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase setSchemaVersion:error:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 149, CFSTR("Use a positive version"));
  }
  return -[TSUDatabase executeUpdateWithSql:error:](self, "executeUpdateWithSql:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pragma user_version = %d"), v5), "UTF8String"), a4);
}

- (BOOL)prepareStatement:(sqlite3_stmt *)a3 sql:(const char *)a4 error:(id *)a5
{
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  BOOL result;

  if (!self->_db)
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase prepareStatement:sql:error:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 158, CFSTR("Trying to use a closed database"));
  }
  if (*a3)
    return 1;
  v12 = sqlite3_prepare_v2(self->_db, a4, -1, a3, 0);
  if (TSUHandleSqlite(v12, a5, self, a2, 164, (uint64_t)CFSTR("Preparing SQL \"%s\"), v13, v14, (uint64_t)a4))
    return 1;
  sqlite3_finalize(*a3);
  result = 0;
  *a3 = 0;
  return result;
}

- (BOOL)executeUpdate:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v10;
  uint64_t v11;
  int v12;
  char v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  id *v21;
  TSUDatabase *v22;
  const char *v23;
  uint64_t v24;
  const char *v26;

  v6 = a4;
  if (!a3)
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase executeUpdate:shouldFinalize:error:]");
    v26 = "statement != NULL";
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 182, CFSTR("Invalid parameter not satisfying: %s"));
  }
  if (self->_readonly)
  {
    v12 = 8;
  }
  else
  {
    v12 = sqlite3_step(a3);
    if (v12 == 101)
    {
      v13 = 1;
      goto LABEL_8;
    }
  }
  v14 = sqlite3_sql(a3);
  TSUHandleSqlite(v12, a5, self, a2, 198, (uint64_t)CFSTR("Executing statement \"%s\"), v15, v16, (uint64_t)v14);
  v13 = 0;
LABEL_8:
  if (v6)
  {
    v17 = sqlite3_finalize(a3);
    v20 = CFSTR("Finalizing statement");
    v21 = a5;
    v22 = self;
    v23 = a2;
    v24 = 203;
  }
  else
  {
    v17 = sqlite3_reset(a3);
    v20 = CFSTR("Resetting statement");
    v21 = a5;
    v22 = self;
    v23 = a2;
    v24 = 207;
  }
  return v13 & TSUHandleSqlite(v17, v21, v22, v23, v24, (uint64_t)v20, v18, v19, (uint64_t)v26);
}

- (BOOL)executeUpdateWithSql:(const char *)a3 error:(id *)a4
{
  _BOOL4 v6;
  uint64_t v8;

  v8 = 0;
  v6 = -[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &v8, a3, a4);
  if (v6)
    LOBYTE(v6) = -[TSUDatabase executeUpdate:shouldFinalize:error:](self, "executeUpdate:shouldFinalize:error:", v8, 1, a4);
  return v6;
}

- (BOOL)startSingleResultQuery:(sqlite3_stmt *)a3 error:(id *)a4
{
  id v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  if (!a3)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase startSingleResultQuery:error:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 225, CFSTR("Invalid parameter not satisfying: %s"), "statement != NULL");
  }
  v10 = sqlite3_step(a3);
  if (v10 != 100)
  {
    v11 = sqlite3_sql(a3);
    TSUHandleSqlite(v10, a4, self, a2, 233, (uint64_t)CFSTR("Executing query and expecting exactly one row: \"%s\"), v12, v13, (uint64_t)v11);
  }
  return v10 == 100;
}

- (BOOL)endSingleResultQuery:(sqlite3_stmt *)a3 shouldFinalize:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  id *v20;
  TSUDatabase *v21;
  const char *v22;
  uint64_t v23;
  BOOL result;
  const char *v25;

  v6 = a4;
  if (!a3)
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase endSingleResultQuery:shouldFinalize:error:]");
    v25 = "statement != NULL";
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 241, CFSTR("Invalid parameter not satisfying: %s"));
  }
  v12 = sqlite3_step(a3);
  if (v12 != 101)
  {
    v13 = sqlite3_sql(a3);
    TSUHandleSqlite(v12, a5, self, a2, 248, (uint64_t)CFSTR("Executing statement \"%s\"), v14, v15, (uint64_t)v13);
  }
  if (v6)
  {
    v16 = sqlite3_finalize(a3);
    v19 = CFSTR("Finalizing statement");
    v20 = a5;
    v21 = self;
    v22 = a2;
    v23 = 253;
  }
  else
  {
    v16 = sqlite3_reset(a3);
    v19 = CFSTR("Resetting statement");
    v20 = a5;
    v21 = self;
    v22 = a2;
    v23 = 257;
  }
  result = TSUHandleSqlite(v16, v20, v21, v22, v23, (uint64_t)v19, v17, v18, (uint64_t)v25);
  if (v12 != 101)
    return 0;
  return result;
}

- (id)_initWithPath:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  TSUDatabase *v5;
  _BOOL4 v7;
  TSUDatabase *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  objc_super v22;

  v5 = self;
  if (!a3)
  {
    v19 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a4, a5);
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase _initWithPath:readonly:error:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 285, CFSTR("No path"));
    goto LABEL_15;
  }
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TSUDatabase;
  v10 = -[TSUDatabase init](&v22, sel_init);
  v5 = v10;
  if (v10)
  {
    v10->_readonly = v7;
    if (v7)
      v11 = 1;
    else
      v11 = 6;
    v12 = sqlite3_open_v2((const char *)objc_msgSend(a3, "fileSystemRepresentation"), &v10->_db, v11, 0);
    v15 = TSUHandleSqlite(v12, a5, v5, a2, 295, (uint64_t)CFSTR("Opening database"), v13, v14, (uint64_t)v22.receiver);
    if (v15)
    {
      v16 = sqlite3_extended_result_codes(v5->_db, 1);
      v15 = TSUHandleSqlite(v16, a5, v5, a2, 297, 0, v17, v18, (uint64_t)v22.receiver);
      if (v15)
        v15 = -[TSUDatabase _upgradeSchemaWithError:](v5, "_upgradeSchemaWithError:", a5);
    }
    if (v7)
    {
LABEL_12:
      if (v15)
        return v5;
      goto LABEL_15;
    }
    if (v15)
    {
      LOBYTE(v15) = -[TSUDatabase executeUpdateWithSql:error:](v5, "executeUpdateWithSql:error:", "pragma fullfsync = true", a5);
      goto LABEL_12;
    }
LABEL_15:

    return 0;
  }
  return v5;
}

- (BOOL)_upgradeSchemaWithError:(id *)a3
{
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  sqlite3_stmt *v14;

  v14 = 0;
  v6 = -[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &v14, "pragma user_version", a3);
  if (v6)
  {
    v6 = -[TSUDatabase startSingleResultQuery:error:](self, "startSingleResultQuery:error:", v14, a3);
    if (v6)
    {
      v7 = sqlite3_column_int(v14, 0);
      if (-[TSUDatabase needsUpgradeFromSchemaVersion:](self, "needsUpgradeFromSchemaVersion:", v7) && self->_readonly)
      {
        v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDatabase _upgradeSchemaWithError:]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 338, CFSTR("Readonly database needs schema upgrade."));
        TSUHandleSqlite(8, a3, self, a2, 339, (uint64_t)CFSTR("Readonly database needs schema upgrade."), v10, v11, v13);
        LOBYTE(v6) = 0;
      }
      else
      {
        v6 = -[TSUDatabase endSingleResultQuery:shouldFinalize:error:](self, "endSingleResultQuery:shouldFinalize:error:", v14, 1, a3);
        if (v6)
          LOBYTE(v6) = -[TSUDatabase upgradeFromSchemaVersion:error:](self, "upgradeFromSchemaVersion:error:", v7, a3);
      }
    }
  }
  return v6;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (sqlite3)_sqliteDatabase
{
  return self->_db;
}

@end
