@implementation ICSQLiteConnection

- (ICSQLiteConnection)initWithOptions:(id)a3
{
  id v4;
  ICSQLiteConnection *v5;
  uint64_t v6;
  ICSQLiteConnectionOptions *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteConnection;
  v5 = -[ICSQLiteConnection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ICSQLiteConnectionOptions *)v6;

  }
  return v5;
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *afterTransactionBlocks;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;

    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_afterTransactionBlocks;
    v9 = (void *)MEMORY[0x1A1AFA8D0]();
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6;
  void (**v7)(id, ICSQLiteQueryResults *, id);
  void *v8;
  id v9;
  ICSQLiteQueryResults *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, ICSQLiteQueryResults *, id))a4;
  v11 = 0;
  -[ICSQLiteConnection _verifiedStatementForPreparedStatement:error:](self, "_verifiedStatementForPreparedStatement:error:", v6, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
    v10 = -[ICSQLiteQueryResults initWithStatement:]([ICSQLiteQueryResults alloc], "initWithStatement:", v8);
  else
    v10 = 0;
  v7[2](v7, v10, v9);
  objc_msgSend(v8, "clearBindings");
  objc_msgSend(v8, "reset");

}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return -[ICSQLiteConnection executePreparedStatement:error:bindings:](self, "executePreparedStatement:error:bindings:", a3, a4, 0);
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  id v14;
  id v15;

  v8 = (void (**)(id, void *))a5;
  v15 = 0;
  -[ICSQLiteConnection _verifiedStatementForPreparedStatement:error:](self, "_verifiedStatementForPreparedStatement:error:", a3, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    if (v8)
      v8[2](v8, v9);
    v14 = v10;
    v11 = -[ICSQLiteConnection _executeStatement:error:](self, "_executeStatement:error:", v9, &v14);
    v12 = v14;

    if (v8)
      objc_msgSend(v9, "clearBindings");
    v10 = v12;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v9, "reset");
  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v10);

  return v11;
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6;
  void (**v7)(id, ICSQLiteQueryResults *, id);
  void *v8;
  id v9;
  ICSQLiteQueryResults *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, ICSQLiteQueryResults *, id))a4;
  v11 = 0;
  -[ICSQLiteConnection _verifiedStatementForSQL:error:](self, "_verifiedStatementForSQL:error:", v6, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
    v10 = -[ICSQLiteQueryResults initWithStatement:]([ICSQLiteQueryResults alloc], "initWithStatement:", v8);
  else
    v10 = 0;
  v7[2](v7, v10, v9);
  objc_msgSend(v8, "finalizeStatement");

}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return -[ICSQLiteConnection executeStatement:error:bindings:](self, "executeStatement:error:bindings:", a3, a4, 0);
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  id v14;
  id v15;

  v8 = (void (**)(id, void *))a5;
  v15 = 0;
  -[ICSQLiteConnection _verifiedStatementForSQL:error:](self, "_verifiedStatementForSQL:error:", a3, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (!v9)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (v8)
    v8[2](v8, v9);
  v14 = v10;
  v11 = -[ICSQLiteConnection _executeStatement:error:](self, "_executeStatement:error:", v9, &v14);
  v12 = v14;

  objc_msgSend(v9, "finalizeStatement");
  v10 = v12;
  if (a4)
  {
LABEL_7:
    if (!v11)
      *a4 = objc_retainAutorelease(v10);
  }
LABEL_9:

  return v11;
}

- (int64_t)lastChangeCount
{
  if (-[ICSQLiteConnection _open](self, "_open"))
    return sqlite3_changes(self->_database);
  else
    return 0;
}

- (NSNumber)userVersion
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__34360;
  v9 = __Block_byref_object_dispose__34361;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ICSQLiteConnection_userVersion__block_invoke;
  v4[3] = &unk_1E4390D40;
  v4[4] = &v5;
  -[ICSQLiteConnection executeQuery:withResults:](self, "executeQuery:withResults:", CFSTR("PRAGMA user_version"), v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (BOOL)setUserVersion:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version=%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = -[ICSQLiteConnection executeStatement:error:](self, "executeStatement:error:", v4, &v9);
  v6 = v9;

  if (!v5)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Failed to update user version. err=%{public}@", buf, 0xCu);
    }

  }
  return v5;
}

- (void)performTransaction:(id)a3
{
  int64_t transactionDepth;
  int v5;
  int64_t v6;
  int64_t v7;
  const __CFString *v8;
  uint64_t (**v9)(void);

  v9 = (uint64_t (**)(void))a3;
  transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (!-[ICSQLiteConnection executeStatement:error:](self, "executeStatement:error:", CFSTR("BEGIN DEFERRED TRANSACTION"), 0))goto LABEL_12;
    self->_transactionDepth = 1;
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_transactionDepth = transactionDepth + 1;
  }
  v5 = v9[2]() ^ 1;
  v6 = self->_transactionDepth;
  if (self->_transactionWantsRollback)
    v5 = 1;
  self->_transactionWantsRollback = v5;
  v7 = v6 - 1;
  self->_transactionDepth = v7;
  if (!v7)
  {
    if (v5)
      v8 = CFSTR("ROLLBACK TRANSACTION");
    else
      v8 = CFSTR("COMMIT TRANSACTION");
    -[ICSQLiteConnection executeStatement:error:](self, "executeStatement:error:", v8, 0);
    -[ICSQLiteConnection _flushAfterTransactionBlocks](self, "_flushAfterTransactionBlocks");
  }
LABEL_12:

}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSMapTable *v9;
  NSMapTable *preparedStatements;
  ICSQLitePreparedStatement *v11;
  id v13;

  v6 = a3;
  if (!-[ICSQLiteConnection _open](self, "_open"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7700, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a4)
      goto LABEL_12;
    goto LABEL_10;
  }
  v13 = 0;
  -[ICSQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    if (!self->_preparedStatements)
    {
      v9 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      preparedStatements = self->_preparedStatements;
      self->_preparedStatements = v9;

    }
    v11 = -[ICSQLitePreparedStatement initWithConnection:SQL:]([ICSQLitePreparedStatement alloc], "initWithConnection:SQL:", self, v6);
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v7, v11);
  }
  else
  {
    v11 = 0;
  }

  if (a4)
  {
LABEL_10:
    if (!v11)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_12:

  return v11;
}

- (BOOL)truncate
{
  int v3;
  BOOL v4;
  int v6;

  if (-[ICSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
    || !-[ICSQLiteConnection _open](self, "_open"))
  {
    return 0;
  }
  -[ICSQLiteConnection _finalizeAllStatements](self, "_finalizeAllStatements");
  v6 = 129;
  v3 = sqlite3_file_control(self->_database, 0, 101, &v6);
  v4 = v3 == 0;
  if (!v3)
  {
    sqlite3_close(self->_database);
    self->_database = 0;
  }
  return v4;
}

- (NSError)currentError
{
  sqlite3 *database;

  database = self->_database;
  if (database)
  {
    ICSQLiteGetCurrentError(database);
    database = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  }
  return (NSError *)database;
}

- (BOOL)resetAfterCorruptionError
{
  if (self->_didResetForCorruption)
  {
    -[ICSQLiteConnection _close](self, "_close");
    return -[ICSQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError");
  }
  else
  {
    self->_didResetForCorruption = 1;
    return -[ICSQLiteConnection resetAfterIOError](self, "resetAfterIOError");
  }
}

- (BOOL)resetAfterIOError
{
  NSMutableArray **p_afterTransactionBlocks;
  NSMutableArray *afterTransactionBlocks;
  NSMutableArray *v5;
  int64_t transactionDepth;
  BOOL v7;

  p_afterTransactionBlocks = &self->_afterTransactionBlocks;
  afterTransactionBlocks = self->_afterTransactionBlocks;
  v5 = afterTransactionBlocks;
  transactionDepth = self->_transactionDepth;
  if (-[ICSQLiteConnection _close](self, "_close") && -[ICSQLiteConnection _open](self, "_open"))
  {
    if (!transactionDepth)
    {
      v7 = 1;
      goto LABEL_6;
    }
    if (!sqlite3_exec(self->_database, "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
    {
      objc_storeStrong((id *)p_afterTransactionBlocks, afterTransactionBlocks);
      self->_transactionDepth = transactionDepth;
      v7 = 1;
      self->_transactionWantsRollback = 1;
      goto LABEL_6;
    }
  }
  -[ICSQLiteConnection _close](self, "_close");
  v7 = -[ICSQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError");
LABEL_6:

  return v7;
}

- (BOOL)_close
{
  BOOL result;
  NSMutableArray *afterTransactionBlocks;

  if (!self->_database)
    return 1;
  -[ICSQLiteConnection _finalizeAllStatements](self, "_finalizeAllStatements");
  if (sqlite3_close(self->_database))
    return 0;
  afterTransactionBlocks = self->_afterTransactionBlocks;
  self->_afterTransactionBlocks = 0;

  self->_database = 0;
  self->_transactionDepth = 0;
  result = 1;
  self->_transactionWantsRollback = 0;
  return result;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t i;
  int v8;
  id v9;
  BOOL v10;
  uint64_t v11;

  v6 = a3;
  for (i = 10; ; --i)
  {
    v8 = objc_msgSend(v6, "step");
    if ((v8 - 5) >= 2)
      break;
    objc_msgSend(v6, "reset");
    if (!i)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7003, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    usleep(0xF4240u);
  }
  if (v8 <= 99)
  {
    if (v8 == 10)
    {
      ICSQLiteGetCurrentError(self->_database);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ICSQLiteConnection resetAfterIOError](self, "resetAfterIOError");
      if (!a4)
        goto LABEL_10;
LABEL_18:
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a4 = v9;
      goto LABEL_19;
    }
    if (v8 == 11 || v8 == 26)
    {
      ICSQLiteGetCurrentError(self->_database);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ICSQLiteConnection resetAfterCorruptionError](self, "resetAfterCorruptionError");
      if (!a4)
        goto LABEL_10;
      goto LABEL_18;
    }
LABEL_16:
    ICSQLiteGetCurrentError(self->_database);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v9 = (id)v11;
    if (!a4)
    {
LABEL_10:
      v10 = 0;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ((v8 - 100) >= 2)
    goto LABEL_16;
  v9 = 0;
  v10 = 1;
LABEL_19:

  return v10;
}

- (void)_finalizeAllStatements
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMapTable *preparedStatements;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_preparedStatements;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "finalizeStatement");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  preparedStatements = self->_preparedStatements;
  self->_preparedStatements = 0;

  stmt = sqlite3_next_stmt(self->_database, 0);
  if (stmt)
  {
    v11 = stmt;
    do
    {
      sqlite3_finalize(v11);
      v11 = sqlite3_next_stmt(self->_database, v11);
    }
    while (v11);
  }
}

- (void)_flushAfterTransactionBlocks
{
  NSMutableArray *afterTransactionBlocks;
  void *v4;
  NSMutableArray *v5;
  NSObject *v6;
  _QWORD block[5];

  afterTransactionBlocks = self->_afterTransactionBlocks;
  if (afterTransactionBlocks)
  {
    v4 = (void *)-[NSMutableArray copy](afterTransactionBlocks, "copy");
    v5 = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__ICSQLiteConnection__flushAfterTransactionBlocks__block_invoke;
    block[3] = &unk_1E43913D8;
    block[4] = v4;
    dispatch_async(v6, block);

  }
}

- (BOOL)_open
{
  BOOL v2;
  char v4;
  ICSQLiteConnectionOptions *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  char v13;
  sqlite3 *v14;
  sqlite3 *ppDb;

  v2 = 1;
  if (!self->_database)
  {
    v4 = 1;
    while (1)
    {
      v5 = self->_options;
      ppDb = 0;
      -[ICSQLiteConnectionOptions databasePath](v5, "databasePath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICSQLiteConnectionOptions isReadOnly](v5, "isReadOnly"))
      {
        v7 = 2;
      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        objc_msgSend(v6, "stringByDeletingLastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

        v7 = 6;
      }
      v10 = objc_retainAutorelease(v6);
      v11 = sqlite3_open_v2((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &ppDb, v7, 0);
      if (!v11)
      {
        v11 = -[ICSQLiteConnectionOptions applyToDatabase:](v5, "applyToDatabase:", ppDb);
        if (!v11)
          break;
      }
      if (ppDb)
        sqlite3_close(ppDb);

      if (v11 <= 0x1Au && ((1 << v11) & 0x4000C00) != 0)
      {
        v13 = -[ICSQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError") & v4;
        v4 = 0;
        if ((v13 & 1) != 0)
          continue;
      }
      return v11 == 0;
    }
    v14 = ppDb;

    self->_database = v14;
    self->_didResetForCorruption = 0;
    return 1;
  }
  return v2;
}

- (BOOL)_performResetAfterCorruptionError
{
  id WeakRetained;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(WeakRetained, "connectionNeedsResetForCorruption:", self);
  }
  else if (-[ICSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly"))
  {
    v4 = 0;
  }
  else
  {
    -[ICSQLiteConnectionOptions databasePath](self->_options, "databasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ICSQLiteTruncateDatabase(v5);

  }
  return v4;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  BOOL v17;
  BOOL v18;
  ICSQLiteStatement *v19;
  ICSQLiteStatement *v20;
  ICSQLiteStatement *v21;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = v6;
  if (self->_database)
  {
    v8 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v9 = 0;
    v10 = 0;
    while (2)
    {
      if (v10 <= 10)
        v11 = 10;
      else
        v11 = v10;
      while (1)
      {
        ppStmt = 0;
        v12 = sqlite3_prepare_v2(self->_database, v8, -1, &ppStmt, 0);
        if ((v12 - 5) >= 2)
          break;
        if (ppStmt)
          sqlite3_finalize(ppStmt);
        if (v11 == v10)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7003, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
        ++v10;
        usleep(0xF4240u);
      }
      if (v12 > 10)
      {
        if (v12 == 11 || v12 == 26)
        {
          ICSQLiteGetCurrentError(self->_database);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (ppStmt)
            sqlite3_finalize(ppStmt);
          v17 = -[ICSQLiteConnection resetAfterCorruptionError](self, "resetAfterCorruptionError");
          if (v9 < 3)
          {
            v18 = v17;

            if (!v18)
            {
LABEL_43:
              v21 = 0;
LABEL_33:
              v13 = 0;
              if (!a4)
                goto LABEL_40;
              goto LABEL_38;
            }
LABEL_28:
            ++v9;
            continue;
          }
LABEL_37:
          v21 = 0;
          if (!a4)
          {
LABEL_40:
            v19 = v21;

            goto LABEL_41;
          }
LABEL_38:
          if (!v21)
            *a4 = objc_retainAutorelease(v13);
          goto LABEL_40;
        }
      }
      else
      {
        if (!v12)
        {
          v20 = [ICSQLiteStatement alloc];
          v21 = -[ICSQLiteStatement initWithStatement:connection:](v20, "initWithStatement:connection:", ppStmt, self);
          goto LABEL_33;
        }
        if (v12 == 10)
        {
          ICSQLiteGetCurrentError(self->_database);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (ppStmt)
            sqlite3_finalize(ppStmt);
          v14 = -[ICSQLiteConnection resetAfterIOError](self, "resetAfterIOError");
          if (v9 < 3)
          {
            v15 = v14;

            if (!v15)
              goto LABEL_43;
            goto LABEL_28;
          }
          goto LABEL_37;
        }
      }
      break;
    }
    ICSQLiteGetCurrentError(self->_database);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (ppStmt)
      sqlite3_finalize(ppStmt);
    goto LABEL_37;
  }
  if (*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICSQLiteError"), -1, CFSTR("Cannot prepare statement without a database."));
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_41:

  return v19;
}

- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSMapTable *preparedStatements;
  NSMapTable *v12;
  NSMapTable *v13;
  id v15;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "SQL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    -[ICSQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v10, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (v8)
    {
      preparedStatements = self->_preparedStatements;
      if (!preparedStatements)
      {
        v12 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
        v13 = self->_preparedStatements;
        self->_preparedStatements = v12;

        preparedStatements = self->_preparedStatements;
      }
      -[NSMapTable setObject:forKey:](preparedStatements, "setObject:forKey:", v8, v6);
    }
    else if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v8 = 0;
      *a4 = v9;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;

  v6 = a3;
  if ((ICSQLiteConnection *)objc_msgSend(v6, "connectionPointer") != self)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Statement from a different connection"));
    v7 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_14;
  }
  if (!-[ICSQLiteConnection _open](self, "_open"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7700, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_14;
  }
  v12 = 0;
  -[ICSQLiteConnection _statementForPreparedStatement:error:](self, "_statementForPreparedStatement:error:", v6, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v9)
  {
    if (-[ICSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
      && (objc_msgSend(v9, "isReadOnly") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7701, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v8 = (id)v10;
    }
    else
    {
      v7 = v9;
    }
  }
  else
  {
    v7 = 0;
  }

  if (a4)
  {
LABEL_14:
    if (!v7)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_16:

  return v7;
}

- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v12;

  v6 = a3;
  if (!-[ICSQLiteConnection _open](self, "_open"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7700, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v12 = 0;
  -[ICSQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    if (-[ICSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
      && (objc_msgSend(v7, "isReadOnly") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7701, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "finalizeStatement");
      v9 = 0;
      v8 = (id)v10;
    }
    else
    {
      v9 = v7;
    }
  }
  else
  {
    v9 = 0;
  }

  if (a4)
  {
LABEL_11:
    if (!v9)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_13:

  return v9;
}

- (ICSQLiteConnectionDelegate)delegate
{
  return (ICSQLiteConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICSQLiteConnectionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

void __50__ICSQLiteConnection__flushAfterTransactionBlocks__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __33__ICSQLiteConnection_userVersion__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "firstInt64Value"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

@end
