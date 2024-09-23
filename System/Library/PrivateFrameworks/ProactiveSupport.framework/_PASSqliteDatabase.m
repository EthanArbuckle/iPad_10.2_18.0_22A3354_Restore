@implementation _PASSqliteDatabase

- (BOOL)prepAndRunQuery:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v14 = (void *)MEMORY[0x1A1AFDC98]();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59___PASSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke;
  v20[3] = &unk_1E44308D0;
  v15 = v11;
  v24 = &v25;
  v20[4] = self;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v17 = v13;
  v23 = v17;
  v18 = -[_PASSqliteDatabase prepQuery:onPrep:onError:](self, "prepQuery:onPrep:onError:", v10, v20, v17);

  objc_autoreleasePoolPop(v14);
  if (v18)
    LOBYTE(v18) = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  return v18;
}

- (BOOL)runQuery:(id)a3 onRow:(id)a4 onError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _PASSqliteDatabase *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45___PASSqliteDatabase_runQuery_onRow_onError___block_invoke;
  v15[3] = &unk_1E4430858;
  v11 = v8;
  v20 = &v21;
  v16 = v11;
  v17 = self;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v15);
  LOBYTE(self) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

- (BOOL)prepQuery:(id)a3 onPrep:(id)a4 onError:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  SEL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("onPrep"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47___PASSqliteDatabase_prepQuery_onPrep_onError___block_invoke;
  v19[3] = &unk_1E44308A8;
  v19[4] = self;
  v12 = v9;
  v23 = &v25;
  v24 = a2;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v14 = v10;
  v22 = v14;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v19);
  v15 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (void)withDbLockExecuteBlock:(id)a3
{
  void (**v4)(_QWORD);
  _PASSqliteStatementCache *statementCache;
  _PASSqliteStatementCache *v6;
  _PASSqliteStatementCache *v7;
  void *v8;
  _PASSqliteStatementCache *v9;
  uint64_t i;
  const void *v11;
  _PASSqliteStatementCache *v12;

  v4 = (void (**)(_QWORD))a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  pthread_mutex_lock(&self->_lock);
  dispatch_group_leave((dispatch_group_t)self->_waitingForLock);
  statementCache = self->_statementCache;
  if (!statementCache)
  {
    v6 = (_PASSqliteStatementCache *)objc_opt_new();
    v7 = self->_statementCache;
    self->_statementCache = v6;

  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  v4[2](v4);
  objc_autoreleasePoolPop(v8);
  if (!statementCache)
  {
    v9 = self->_statementCache;
    if (v9)
    {
      for (i = 0; i != 8; ++i)
      {
        sqlite3_finalize(v9->_cached[i]);
        v11 = v9->_associatedObjects[i];
        if (v11)
          CFRelease(v11);
      }
      v12 = self->_statementCache;
    }
    else
    {
      v12 = 0;
    }
    self->_statementCache = 0;

  }
  pthread_mutex_unlock(&self->_lock);

}

- (void)_prepareForFirstQuery
{
  if (!self->_preparedForFirstQuery)
  {
    self->_preparedForFirstQuery = 1;
    if (self->_isInMemory)
      -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA temp_store=MEMORY"), 0, 0, &__block_literal_global_65);
    sqlite3_create_function(self->_db, "_pas_block", -1, 526337, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sqliteBlockFunction, 0, 0);
  }
}

- (void)_logQueryPlanForQuery:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44___PASSqliteDatabase__logQueryPlanForQuery___block_invoke;
  v6[3] = &unk_1E4430880;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v6);

}

- (BOOL)_isLikelySQLStatementContainedInString:(const char *)a3
{
  char v3;
  const char *v4;
  uint64_t v5;
  int v6;

  v3 = *a3;
  if (!*a3)
    return 0;
  v4 = a3 + 1;
  v5 = MEMORY[0x1E0C80978];
  while (1)
  {
    if (v3 == 59)
      goto LABEL_8;
    if (v3 < 0)
      break;
    if ((*(_DWORD *)(v5 + 4 * v3 + 60) & 0x4000) == 0)
      return 1;
LABEL_8:
    v6 = *(unsigned __int8 *)v4++;
    v3 = v6;
    if (!v6)
      return 0;
  }
  if (__maskrune(v3, 0x4000uLL))
    goto LABEL_8;
  return 1;
}

- (void)_txnBegin
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("BEGIN TRANSACTION"), 0, 0, 0);
}

- (void)_txnBeginExclusive
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("BEGIN EXCLUSIVE"), 0, 0, 0);
}

- (void)_txnEnd
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("END TRANSACTION"), 0, 0, 0);
}

- (void)readTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38___PASSqliteDatabase_readTransaction___block_invoke;
  v6[3] = &unk_1E4430948;
  v7 = v4;
  v5 = v4;
  -[_PASSqliteDatabase frailReadTransaction:](self, "frailReadTransaction:", v6);

}

- (void)writeTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39___PASSqliteDatabase_writeTransaction___block_invoke;
  v6[3] = &unk_1E4430948;
  v7 = v4;
  v5 = v4;
  -[_PASSqliteDatabase frailWriteTransaction:](self, "frailWriteTransaction:", v6);

}

- (BOOL)frailReadTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43___PASSqliteDatabase_frailReadTransaction___block_invoke;
  v7[3] = &unk_1E4430970;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = (-[_PASSqliteDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v7) & 1) == 0;

  return (char)self;
}

- (BOOL)frailWriteTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___PASSqliteDatabase_frailWriteTransaction___block_invoke;
  v7[3] = &unk_1E4430970;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = (-[_PASSqliteDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v7) & 1) == 0;

  return (char)self;
}

- (_PASDBTransactionCompletion_)_transactionWithExclusivity:(BOOL)a3 transaction:(id)a4
{
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  SEL v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  char v19;

  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2810000000;
  v18 = &unk_1A09C8ECB;
  v19 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke;
  v10[3] = &unk_1E4430998;
  v14 = a3;
  v12 = &v15;
  v13 = a2;
  v10[4] = self;
  v8 = v7;
  v11 = v8;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v10);
  LOBYTE(a2) = *((_BYTE *)v16 + 32);

  _Block_object_dispose(&v15, 8);
  return (_PASDBTransactionCompletion_)a2;
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[_PASSqliteDatabase _transactionWithExclusivity:transaction:](self, "_transactionWithExclusivity:transaction:", 1, a3);
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[_PASSqliteDatabase _transactionWithExclusivity:transaction:](self, "_transactionWithExclusivity:transaction:", 0, a3);
}

- (id)freeSpace
{
  id v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v13;
  __int16 v14;
  uint8_t buf[8];
  uint64_t v16;

  if (!self->_transactionRolledback && !-[_PASSqliteDatabase isInMemory](self, "isInMemory"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASSqliteDatabase filename](self, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "attributesOfFileSystemForPath:error:", v6, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot calculate free space", buf, 2u);
      }
      v3 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = v9;
LABEL_16:

LABEL_17:
        return v3;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_15:
        v3 = 0;
        goto LABEL_16;
      }
      v13 = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Free space attribute is not an NSNumber";
      v12 = (uint8_t *)&v13;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v14 = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Free space attribute is missing";
      v12 = (uint8_t *)&v14;
    }
    _os_log_error_impl(&dword_1A0957000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_15;
  }
  v3 = 0;
  return v3;
}

- (id)dbErrorWithCode:(unint64_t)a3 sqliteReturnValue:(int)a4 lastErrno:(int)a5 query:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  if ((unint64_t)objc_msgSend(v10, "length") >= 0x65)
  {
    objc_msgSend(v10, "substringToIndex:", 100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("..."));
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v12;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = sqlite3_errstr(v7);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_errmsg(self->_db));
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Error(%d %s): %@"), v7, v14, v15);

  if (v10)
  {
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" (SQL: %@)"), v10);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  if (a3 != 1 && !a5)
  {
    v29 = 0;
    if (sqlite3_file_control(self->_db, 0, 4, &v29))
      goto LABEL_11;
    a5 = v29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(". May be due to previous POSIX error %@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
    goto LABEL_12;
  }
LABEL_11:
  v18 = 0;
LABEL_12:
  -[_PASSqliteDatabase freeSpace](self, "freeSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setNumberStyle:", 1);
    objc_msgSend(v21, "setUsesGroupingSeparator:", 1);
    objc_msgSend(v21, "setGroupingSeparator:", CFSTR(","));
    objc_msgSend(v21, "setUsesSignificantDigits:", 1);
    objc_msgSend(v21, "setMinimumSignificantDigits:", 1);
    objc_msgSend(v21, "setMaximumSignificantDigits:", 1);
    objc_msgSend(v21, "stringFromNumber:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(". Free space (rounded to 1 significant digit): %@ bytes"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v23;
  }
  v24 = (void *)objc_opt_new();
  v25 = v24;
  if (v10)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, CFSTR("sql"));
  if (v18)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB3388]);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v16, CFSTR("reason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("sqliteCode"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_PASSqliteDatabaseError"), a3, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  -[_PASSqliteDatabase dbErrorWithCode:sqliteReturnValue:lastErrno:query:](self, "dbErrorWithCode:sqliteReturnValue:lastErrno:query:", a3, v7, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = -[_PASSqliteErrorHandlerProtocol handleSqliteError:error:onError:db:](self->_errorHandler, "handleSqliteError:error:onError:db:", v7, v11, v10, self);

  return v7;
}

- (void)placeCorruptionMarker
{
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (!-[_PASSqliteDatabase isInMemory](self, "isInMemory"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "db corruption detected, leaving behind marker so we recover", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "db corruption detected, leaving behind marker so we recover", v6, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASSqliteDatabase filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PASSqliteDatabase corruptionMarkerPathForPath:](_PASSqliteDatabase, "corruptionMarkerPathForPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createFileAtPath:contents:attributes:", v5, 0, 0);

  }
}

- (_PASSqliteDatabase)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 errorHandler:(id)a6
{
  id v12;
  id v13;
  _PASSqliteDatabase *v14;
  _PASSqliteErrorHandlerProtocol *v15;
  _PASSqliteErrorHandlerProtocol *errorHandler;
  int v17;
  uint64_t v18;
  dispatch_group_t v19;
  OS_dispatch_group *waitingForLock;
  id v21;
  sqlite3 **p_db;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void (**v27)(_QWORD);
  uint64_t busy;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _PASSqliteDatabase *v33;
  int v34;
  int v35;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  _PASSqliteDatabase *v43;
  objc_super v44;
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  _QWORD v48[2];
  pthread_mutexattr_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

  }
  v44.receiver = self;
  v44.super_class = (Class)_PASSqliteDatabase;
  v14 = -[_PASSqliteDatabase init](&v44, sel_init);
  if (!v14)
    goto LABEL_32;
  if (v13)
    v15 = (_PASSqliteErrorHandlerProtocol *)v13;
  else
    v15 = (_PASSqliteErrorHandlerProtocol *)objc_opt_new();
  errorHandler = v14->_errorHandler;
  v14->_errorHandler = v15;

  v14->_isInMemory = +[_PASSqliteDatabase isInMemoryPath:](_PASSqliteDatabase, "isInMemoryPath:", v12);
  objc_storeStrong((id *)&v14->_filename, a3);
  v17 = a4 & 0x700000;
  if ((a4 & 0x700000) == 0x300000)
  {
    v18 = 3;
  }
  else if (v17 == 0x200000)
  {
    v18 = 2;
  }
  else
  {
    v18 = v17 == 0x100000;
  }
  v14->_contentProtectionType = v18;
  v49.__sig = 0;
  *(_QWORD *)v49.__opaque = 0;
  pthread_mutexattr_init(&v49);
  pthread_mutexattr_settype(&v49, 2);
  pthread_mutex_init(&v14->_lock, &v49);
  pthread_mutexattr_destroy(&v49);
  v19 = dispatch_group_create();
  waitingForLock = v14->_waitingForLock;
  v14->_waitingForLock = (OS_dispatch_group *)v19;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v48[0] = v12;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "opening %@", buf, 0xCu);
  }
  v21 = objc_retainAutorelease(v12);
  p_db = &v14->_db;
  v23 = sqlite3_open_v2((const char *)objc_msgSend(v21, "UTF8String"), &v14->_db, a4, 0);
  if (!(_DWORD)v23)
  {
    getpid();
    if (sandbox_check())
    {
      v26 = objc_retainAutorelease(v21);
      if (access((const char *)objc_msgSend(v26, "UTF8String"), 2))
        chmod((const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"), 0x180u);
    }
    ITSRegisterSQLiteICUTokenizer();
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __64___PASSqliteDatabase_initWithFilename_flags_error_errorHandler___block_invoke;
    v42 = &unk_1E44311E8;
    v43 = v14;
    v27 = (void (**)(_QWORD))MEMORY[0x1A1AFDE78](&v39);
    busy = sqlite3_busy_timeout(v14->_db, 300000);
    if ((_DWORD)busy)
    {
      v29 = busy;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v48[0]) = v29;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Sqlite could not install busy timeout. (rc = %i)", buf, 8u);
        if (!a5)
          goto LABEL_25;
      }
      else if (!a5)
      {
LABEL_25:
        v27[2](v27);

        goto LABEL_26;
      }
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v45 = CFSTR("sqliteCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("_PASSqliteDatabaseError"), 2, v32);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    sqlite3_extended_result_codes(*p_db, 1);
    v34 = sqlite3_db_config(*p_db, 1001, 0, 96, 64, v39, v40, v41, v42);
    if (v34)
    {
      v35 = v34;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v48[0]) = v35;
        _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Error setting lookaside size. (rc = %i)", buf, 8u);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }
    _pas_registerSqliteCollections(*p_db);

LABEL_32:
    v33 = v14;
    goto LABEL_33;
  }
  v24 = v23;
  v25 = *__error();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v37 = sqlite3_extended_errcode(*p_db);
    *(_DWORD *)buf = 67109376;
    LODWORD(v48[0]) = v24;
    WORD2(v48[0]) = 1024;
    *(_DWORD *)((char *)v48 + 6) = v37;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Sqlite didn't open (rc = %d, extended result code = %d)", buf, 0xEu);
    if (!a5)
      goto LABEL_26;
    goto LABEL_17;
  }
  if (a5)
  {
LABEL_17:
    -[_PASSqliteDatabase dbErrorWithCode:sqliteReturnValue:lastErrno:query:](v14, "dbErrorWithCode:sqliteReturnValue:lastErrno:query:", 1, v24, v25, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:
  v33 = 0;
LABEL_33:

  return v33;
}

- (_PASSqliteDatabase)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  _PASSqliteDatabase *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = -[_PASSqliteDatabase initWithFilename:flags:error:errorHandler:](self, "initWithFilename:flags:error:errorHandler:", v8, v6, a5, v9);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_PASSqliteDatabase closePermanently](self, "closePermanently");
  v3.receiver = self;
  v3.super_class = (Class)_PASSqliteDatabase;
  -[_PASSqliteDatabase dealloc](&v3, sel_dealloc);
}

- (void)closePermanently
{
  atomic_flag *p_isClosed;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  FILE *explainedQueriesLogFile;
  uint8_t buf[4];
  _PASSqliteDatabase *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_isClosed = &self->_isClosed;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isClosed);
  while (__stlxr(1u, (unsigned __int8 *)p_isClosed));
  if ((v4 & 1) == 0)
  {
    pthread_mutex_destroy(&self->_lock);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "closing %@", buf, 0xCu);
    }
    v5 = sqlite3_close(self->_db);
    if ((_DWORD)v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v9) = v6;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sqlite3_close returned %d", buf, 8u);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("sqlite3_close returned %d"), v6);
    }
    ITSCollationContextFreeContextForDatabaseHandle();
    self->_db = 0;
    explainedQueriesLogFile = self->_explainedQueriesLogFile;
    if (explainedQueriesLogFile)
    {
      fclose(explainedQueriesLogFile);
      self->_explainedQueriesLogFile = 0;
    }
  }
}

- (void)simulateOnDiskDatabase
{
  self->_isInMemory = 0;
}

- (int64_t)lastInsertRowId
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37___PASSqliteDatabase_lastInsertRowId__block_invoke;
  v4[3] = &unk_1E44307E0;
  v4[4] = self;
  v4[5] = &v5;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)valueForPragmaName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA %@"), v4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41___PASSqliteDatabase_valueForPragmaName___block_invoke;
  v12[3] = &unk_1E4430808;
  v12[4] = &v13;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41___PASSqliteDatabase_valueForPragmaName___block_invoke_2;
  v9[3] = &unk_1E4430830;
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, v12, v9);

  v7 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (unint64_t)_pagesToVacuum
{
  unint64_t v3;
  unint64_t v4;
  unint64_t result;
  int v6;
  unint64_t v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[_PASSqliteDatabase valueForPragmaName:](self, "valueForPragmaName:", CFSTR("page_count"));
  v4 = -[_PASSqliteDatabase valueForPragmaName:](self, "valueForPragmaName:", CFSTR("freelist_count"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: calculating pages to vacuum -- pageCount %tu freeCount %tu", (uint8_t *)&v6, 0x16u);
  }
  result = 0;
  if (v4)
  {
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      result = 0;
      if (v3)
      {
        if (v3 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((double)(v3 - v4) / (double)v3 <= 0.85 || v4 > 0x3FF)
          {
            return (unint64_t)((double)v4 * 0.8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v6 = 134218240;
              v7 = v3;
              v8 = 2048;
              v9 = v4;
              _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
                (uint8_t *)&v6,
                0x16u);
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)vacuumWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v5)(_QWORD);
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t v24[4];
  uint64_t v25;
  _BYTE buf[32];
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(_QWORD))a3;
  v6 = -[_PASSqliteDatabase _pagesToVacuum](self, "_pagesToVacuum");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: called to vacuum %tu pages.", buf, 0xCu);
  }
  if (v5)
  {
    if ((v5[2](v5) & 1) == 0)
      goto LABEL_51;
    v7 = -[_PASSqliteDatabase valueForPragmaName:](self, "valueForPragmaName:", CFSTR("auto_vacuum"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || !v5[2](v5))
      goto LABEL_51;
  }
  else
  {
    v7 = -[_PASSqliteDatabase valueForPragmaName:](self, "valueForPragmaName:", CFSTR("auto_vacuum"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_51;
  }
  if (v7 != 2)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__3236;
    v27 = __Block_byref_object_dispose__3237;
    v28 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke;
    v23[3] = &unk_1E4430768;
    v23[4] = buf;
    if (!-[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self, "prepAndRunNonDataQueries:onError:", &unk_1E443F818, v23))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v24 = 138412290;
        v25 = v18;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: failed to set auto_vacuum to INCREMENTAL for db: %@", v24, 0xCu);
      }
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);

      goto LABEL_51;
    }
    _Block_object_dispose(buf, 8);

  }
  if (v5 && !v5[2](v5))
  {
LABEL_51:
    v15 = 0;
    goto LABEL_52;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v6 + 499) / 0x1F4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = self;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: performing INCREMENTAL VACUUM to free %lu pages with %@ iterations for db: %@", buf, 0x20u);

    }
    if (v6 + 499 >= 0x1F4)
    {
      v9 = 0;
      if ((v6 + 499) / 0x1F4 <= 1)
        v10 = 1;
      else
        v10 = (v6 + 499) / 0x1F4;
      v11 = MEMORY[0x1E0C81028];
      v12 = v6;
      while (!v5 || v5[2](v5))
      {
        if (v12 >= 0x1F4)
          v13 = 500;
        else
          v13 = v12;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v9;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v6;
          _os_log_impl(&dword_1A0957000, v11, OS_LOG_TYPE_INFO, "Performing incremental vacuum for %tu pages on iteration %d for total pages to free %tu", buf, 0x1Cu);
        }
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA incremental_vacuum(%lu)"), v13);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__3236;
        v27 = __Block_byref_object_dispose__3237;
        v28 = 0;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_94;
        v21[3] = &unk_1E4430768;
        v21[4] = buf;
        if (!-[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", v14, 0, 0, v21))
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v24 = 138412290;
            v25 = v16;
            _os_log_error_impl(&dword_1A0957000, v11, OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: failed to incrementally vacuum: %@", v24, 0xCu);
          }
          if (a4)
            *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        }
        _Block_object_dispose(buf, 8);

        v12 -= v13;
        ++v9;
        v15 = 1;
        if (v10 == v9)
          goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASSqliteDatabase: performing FULL VACUUM to make INCREMENTAL effected.", buf, 2u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__3236;
    v27 = __Block_byref_object_dispose__3237;
    v28 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_91;
    v22[3] = &unk_1E4430768;
    v22[4] = buf;
    if (!-[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self, "prepAndRunNonDataQueries:onError:", &unk_1E443F830, v22))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v24 = 138412290;
        v25 = v19;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: failed to set auto_vacuum to INCREMENTAL for db: %@", v24, 0xCu);
      }
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);

      goto LABEL_51;
    }
    _Block_object_dispose(buf, 8);

  }
  v15 = 1;
LABEL_52:

  return v15;
}

- (sqlite3)handle
{
  return self->_db;
}

- (BOOL)runQuery:(id)a3 onRow:(id)a4
{
  return -[_PASSqliteDatabase runQuery:onRow:onError:](self, "runQuery:onRow:onError:", a3, a4, 0);
}

- (void)_prepAndRunQuery:(id)a3 columns:(id)a4 dictionary:(id)a5 onError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a4;
  v11 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66___PASSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke;
  v14[3] = &unk_1E44308F8;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", a3, v14, 0, a6);

}

- (BOOL)prepAndRunNonDataQueries:(id)a3 onError:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!-[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 0, 0, v7, (_QWORD)v15))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)updateTable:(id)a3 dictionary:(id)a4 whereClause:(id)a5 onError:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(v11, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v14);
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1328, CFSTR("updateTable:dictionary:whereClause: requires nonempty dictionary"));

  }
  v16 = (void *)MEMORY[0x1A1AFDC98]();
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v15, "_pas_componentsJoinedByString:", CFSTR("=?,"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", CFSTR("=?"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v12)
  {
    objc_msgSend(CFSTR(" WHERE "), "stringByAppendingString:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("UPDATE %@ SET %@%@"), v24, v20, v21);

  }
  else
  {
    v22 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("UPDATE %@ SET %@%@"), v24, v19, &stru_1E4431528);
  }

  objc_autoreleasePoolPop(v16);
  -[_PASSqliteDatabase _prepAndRunQuery:columns:dictionary:onError:](self, "_prepAndRunQuery:columns:dictionary:onError:", v22, v15, v11, v13);

}

- (void)insertOrReplaceIntoTable:(id)a3 dictionary:(id)a4 onError:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(v9, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1340, CFSTR("insertOrReplaceIntoTable:dictionary: requires nonempty dictionary"));

  }
  v13 = (void *)MEMORY[0x1A1AFDC98]();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _PASQMarksSeparatedByCommas(objc_msgSend(v12, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@) VALUES (%@)"), v19, v15, v16);

  objc_autoreleasePoolPop(v13);
  -[_PASSqliteDatabase _prepAndRunQuery:columns:dictionary:onError:](self, "_prepAndRunQuery:columns:dictionary:onError:", v17, v12, v9, v10);

}

- (void)insertIntoTable:(id)a3 dictionary:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1350, CFSTR("insertIntoTable:dictionary: requires nonempty dictionary"));

  }
  v10 = (void *)MEMORY[0x1A1AFDC98]();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v9, "_pas_componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _PASQMarksSeparatedByCommas(objc_msgSend(v9, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), v16, v12, v13);

  objc_autoreleasePoolPop(v10);
  -[_PASSqliteDatabase _prepAndRunQuery:columns:dictionary:onError:](self, "_prepAndRunQuery:columns:dictionary:onError:", v14, v9, v7, 0);

}

- (id)selectColumns:(id)a3 fromTable:(id)a4 whereClause:(id)a5 onPrep:(id)a6 onError:(id)a7
{
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;

  v12 = a3;
  v13 = a5;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = [v14 alloc];
  objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("SELECT %@ FROM %@"), v19, v17);

  if (v13)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %@"), v13);
    objc_msgSend(v20, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  v23 = (void *)objc_opt_new();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __73___PASSqliteDatabase_selectColumns_fromTable_whereClause_onPrep_onError___block_invoke;
  v29[3] = &unk_1E4430920;
  v30 = v12;
  v24 = v23;
  v31 = v24;
  v25 = v12;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", v20, v16, v29, v15);

  v26 = v31;
  v27 = v24;

  return v27;
}

- (void)_txnRollback
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("ROLLBACK"), 0, 0, 0);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@: %@ <%p>]"), v5, self->_filename, self->_db);

  return v6;
}

- (BOOL)createSnapshot:(id)a3
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  id v12;
  __int128 *p_buf;
  __int128 *v14;
  sqlite3 *v15;
  sqlite3 *ppDb;
  __int128 buf;
  uint64_t v18;
  char v19;
  __int128 v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

  }
  ppDb = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v20) = 138412290;
    *(_QWORD *)((char *)&v20 + 4) = v5;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "opening to backup: %@", (uint8_t *)&v20, 0xCu);
  }
  *(_QWORD *)&v20 = 0;
  *((_QWORD *)&v20 + 1) = &v20;
  v21 = 0x2020000000;
  v22 = 0;
  v6 = objc_retainAutorelease(v5);
  v22 = sqlite3_open_v2((const char *)objc_msgSend(v6, "UTF8String"), &ppDb, 327686, 0);
  if (*(_DWORD *)(*((_QWORD *)&v20 + 1) + 24))
  {
    v7 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to open sqlite3 backup file \"%@\".", (uint8_t *)&buf, 0xCu);
      v7 = 0;
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37___PASSqliteDatabase_createSnapshot___block_invoke;
    v11[3] = &unk_1E44309C0;
    v11[4] = self;
    p_buf = &buf;
    v14 = &v20;
    v15 = ppDb;
    v8 = v6;
    v12 = v8;
    -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v11);
    v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "closing backup db: %@", (uint8_t *)&buf, 0xCu);
    }
    sqlite3_close(ppDb);
  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (unsigned)userVersion
{
  unsigned int v2;
  int v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___PASSqliteDatabase_userVersion__block_invoke;
  v5[3] = &unk_1E4430808;
  v5[4] = &v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA user_version"), 0, v5, &__block_literal_global_174);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = *((_DWORD *)v7 + 6);
    *(_DWORD *)buf = 67109120;
    v11 = v4;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Returning user_version of: %u", buf, 8u);
  }
  v2 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)setUserVersion:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint8_t v6;
  _QWORD v8[5];
  int v9;
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Setting user_version to: %u", buf, 8u);
  }
  *(_QWORD *)buf = 0;
  v11 = buf;
  v12 = 0x2020000000;
  v13 = 1;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA user_version = %u"), v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37___PASSqliteDatabase_setUserVersion___block_invoke;
  v8[3] = &unk_1E4430A08;
  v9 = v3;
  v8[4] = buf;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, 0, v8);

  v6 = v11[24];
  _Block_object_dispose(buf, 8);
  return v6;
}

- (BOOL)hasTableNamed:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36___PASSqliteDatabase_hasTableNamed___block_invoke;
  v9[3] = &unk_1E4430A30;
  v6 = v4;
  v10 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __36___PASSqliteDatabase_hasTableNamed___block_invoke_2;
  v8[3] = &unk_1E4430808;
  v8[4] = &v11;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name=?"), v9, v8, 0);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (id)tablesWithColumnNamed:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3236;
  v18 = __Block_byref_object_dispose__3237;
  v19 = (id)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke;
  v12[3] = &unk_1E4430A30;
  v13 = v4;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke_2;
  v9[3] = &unk_1E4430A58;
  v11 = &v14;
  v6 = v13;
  v10 = v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND (sql LIKE ? OR sql LIKE ?)"), v12, v9, 0);
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (BOOL)hasColumnOnTable:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("pragma table_info(%@)"), v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45___PASSqliteDatabase_hasColumnOnTable_named___block_invoke;
  v11[3] = &unk_1E4430A58;
  v9 = v7;
  v12 = v9;
  v13 = &v14;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, v11, 0);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

- (BOOL)hasIndexNamed:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36___PASSqliteDatabase_hasIndexNamed___block_invoke;
  v9[3] = &unk_1E4430A30;
  v6 = v4;
  v10 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __36___PASSqliteDatabase_hasIndexNamed___block_invoke_2;
  v8[3] = &unk_1E4430808;
  v8[4] = &v11;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_master WHERE type='index' AND name=?"), v9, v8, 0);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (unint64_t)numberOfRowsInTable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(CFSTR("SELECT count(*) FROM "), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke;
  v11[3] = &unk_1E4430808;
  v11[4] = &v12;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke_2;
  v9[3] = &unk_1E4430A80;
  v6 = v4;
  v10 = v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, v11, v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)hasLockContention
{
  return dispatch_group_wait((dispatch_group_t)self->_waitingForLock, 0) != 0;
}

- (id)languageForFTSTable:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3236;
  v16 = __Block_byref_object_dispose__3237;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42___PASSqliteDatabase_languageForFTSTable___block_invoke;
  v10[3] = &unk_1E4430A30;
  v6 = v4;
  v11 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __42___PASSqliteDatabase_languageForFTSTable___block_invoke_2;
  v9[3] = &unk_1E4430808;
  v9[4] = &v12;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT sql FROM sqlite_master WHERE type='table' AND name=:table"), v10, v9, &__block_literal_global_200);
  if ((objc_msgSend((id)v13[5], "isEqualToString:", &stru_1E4431528) & 1) != 0)
    v7 = 0;
  else
    v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)enableQueryPlanLoggingWithPath:(id)a3
{
  id v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteDatabase.m"), 1790, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___PASSqliteDatabase_enableQueryPlanLoggingWithPath___block_invoke;
  v10[3] = &unk_1E4430AC8;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  v12 = &v13;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v10);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)disableQueryPlanLogging
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45___PASSqliteDatabase_disableQueryPlanLogging__block_invoke;
  v2[3] = &unk_1E44311E8;
  v2[4] = self;
  -[_PASSqliteDatabase withDbLockExecuteBlock:](self, "withDbLockExecuteBlock:", v2);
}

- (NSString)filename
{
  return self->_filename;
}

- (BOOL)isInMemory
{
  return self->_isInMemory;
}

- (int64_t)contentProtectionType
{
  return self->_contentProtectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementCache, 0);
  objc_storeStrong((id *)&self->_explainedQueriesLogged, 0);
  objc_storeStrong((id *)&self->_explainedQueryForPlan, 0);
  objc_storeStrong((id *)&self->_waitingForLock, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_errorHandler, 0);
}

+ (BOOL)contentProtectionTypeRequiresDeviceToBeUnlocked:(int64_t)a3
{
  return a3 != 3 && a3 != 0;
}

+ (BOOL)contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:(int64_t)a3
{
  return a3 != 0;
}

+ (id)initializeDatabase:(id)a3 withContentProtection:(int64_t)a4 newDatabaseCreated:(BOOL *)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  id obj;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  pthread_mutex_lock(&initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler__initDatabaseLock);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3236;
  v30 = __Block_byref_object_dispose__3237;
  v31 = 0;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v10);

    *a5 = v13 ^ 1;
    v15 = (id *)(v27 + 5);
    v14 = (void *)v27[5];
  }
  else
  {
    v14 = 0;
    v15 = &v31;
  }
  obj = v14;
  +[_PASSqliteDatabase sqliteDatabaseWithFilename:contentProtection:errorHandler:error:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", v10, a4, v11, &obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v15, obj);
  v17 = v27[5];
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v10;
      v34 = 2112;
      v35 = v17;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize database at path %@: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  if (objc_msgSend(a1, "contentProtectionTypeRequiresDeviceToBeUnlocked:", a4)
    && !+[_PASDeviceState isUnlocked](_PASDeviceState, "isUnlocked"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Device locked during db initialization of protected database.", buf, 2u);
    }
    goto LABEL_19;
  }
  if (objc_msgSend(a1, "contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:", a4)
    && +[_PASDeviceState isClassCLocked](_PASDeviceState, "isClassCLocked"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Device has never been unlocked prior to db initialization.", buf, 2u);
    }
LABEL_19:
    objc_msgSend(v16, "closePermanently");

LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v20 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke;
  v24[3] = &unk_1E4430768;
  v24[4] = &v26;
  objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE IF NOT EXISTS integrityCheck (inconsequential STRING)"), 0, 0, v24);
  if (v27[5])
    goto LABEL_33;
  v23[0] = v20;
  v23[1] = 3221225472;
  v23[2] = __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_2;
  v23[3] = &unk_1E4430768;
  v23[4] = &v26;
  objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA journal_mode=WAL"), 0, 0, v23);
  if (v27[5]
    || (v22[0] = v20,
        v22[1] = 3221225472,
        v22[2] = __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_3,
        v22[3] = &unk_1E4430768,
        v22[4] = &v26,
        objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA synchronous=NORMAL"), 0, 0, v22),
        v27[5]))
  {
LABEL_33:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Integrity check detected corrupt database, attempting to reinitialize.", buf, 2u);
    }
    objc_msgSend(v16, "closePermanently");
    objc_msgSend(v16, "filename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recreateCorruptDatabase:withContentProtection:", v21, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = 1;
  }
  else
  {
    v18 = v16;
  }
LABEL_9:
  pthread_mutex_unlock(&initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler__initDatabaseLock);
  if (a5 && !v18)
    *a5 = 0;
  _Block_object_dispose(&v26, 8);

  return v18;
}

+ (id)initializeDatabase:(id)a3 withContentProtection:(int64_t)a4 newDatabaseCreated:(BOOL *)a5
{
  return +[_PASSqliteDatabase initializeDatabase:withContentProtection:newDatabaseCreated:errorHandler:](_PASSqliteDatabase, "initializeDatabase:withContentProtection:newDatabaseCreated:errorHandler:", a3, a4, a5, 0);
}

+ (id)initializeDatabase:(id)a3 withProtection:(BOOL)a4 newDatabaseCreated:(BOOL *)a5
{
  uint64_t v5;

  if (a4)
    v5 = 1;
  else
    v5 = 3;
  return (id)objc_msgSend(a1, "initializeDatabase:withContentProtection:newDatabaseCreated:", a3, v5, a5);
}

+ (id)recreateCorruptDatabase:(id)a3 withContentProtection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a1, "contentProtectionTypeRequiresDeviceToBeUnlocked:", a4))
  {
    +[_PASDatabaseJournal journalWithDbPath:](_PASDatabaseJournal, "journalWithDbPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteAllJournaledQueries");

  }
  if (+[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@.corrupted.%ld"), v6, (uint64_t)v10);

    moveOrRemoveDbFile(v6, v11);
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("-shm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("-shm"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    moveOrRemoveDbFile(v12, v13);

    objc_msgSend(v6, "stringByAppendingString:", CFSTR("-wal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("-wal"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    moveOrRemoveDbFile(v14, v15);

  }
  else
  {
    +[_PASSqliteDatabase truncateDatabaseAtPath:](_PASSqliteDatabase, "truncateDatabaseAtPath:", v6);
  }
  v20 = 0;
  +[_PASSqliteDatabase sqliteDatabaseWithFilename:contentProtection:error:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:contentProtection:error:", v6, a4, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromClass((Class)a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v19;
    v23 = 2112;
    v24 = v17;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ failed to recreate database during corruption recovery: %@", buf, 0x16u);

  }
  return v16;
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 errorHandler:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  _PASSqliteDatabase *v11;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a3;
  v11 = -[_PASSqliteDatabase initWithFilename:flags:error:errorHandler:]([_PASSqliteDatabase alloc], "initWithFilename:flags:error:errorHandler:", v10, v7, a5, v9);

  return v11;
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 flags:(int)a4 error:(id *)a5
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:flags:error:errorHandler:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:flags:error:errorHandler:", a3, *(_QWORD *)&a4, a5, 0);
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4 errorHandler:(id)a5
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:contentProtection:errorHandler:error:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", a3, 3, a5, a4);
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:error:errorHandler:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:error:errorHandler:", a3, a4, 0);
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 contentProtection:(int64_t)a4 errorHandler:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  _PASSqliteDatabase *v11;
  uint64_t v12;
  _PASSqliteDatabase *v13;

  v9 = a5;
  v10 = a3;
  v11 = [_PASSqliteDatabase alloc];
  if ((unint64_t)(a4 - 1) >= 3)
    v12 = 327686;
  else
    v12 = ((((_DWORD)a4 - 1) << 20) | 0x50006u) + 0x100000;
  v13 = -[_PASSqliteDatabase initWithFilename:flags:error:errorHandler:](v11, "initWithFilename:flags:error:errorHandler:", v10, v12, a6, v9);

  return v13;
}

+ (_PASSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 contentProtection:(int64_t)a4 error:(id *)a5
{
  return +[_PASSqliteDatabase sqliteDatabaseWithFilename:contentProtection:errorHandler:error:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", a3, a4, 0, a5);
}

+ (id)sqliteDatabaseInMemoryWithError:(id *)a3 errorHandler:(id)a4
{
  id v5;
  _PASSqliteDatabase *v6;

  v5 = a4;
  v6 = -[_PASSqliteDatabase initWithFilename:flags:error:errorHandler:]([_PASSqliteDatabase alloc], "initWithFilename:flags:error:errorHandler:", CFSTR(":memory:"), 327686, a3, v5);

  return v6;
}

+ (id)sqliteDatabaseInMemoryWithError:(id *)a3
{
  return +[_PASSqliteDatabase sqliteDatabaseInMemoryWithError:errorHandler:](_PASSqliteDatabase, "sqliteDatabaseInMemoryWithError:errorHandler:", a3, 0);
}

+ (id)protectedDatabaseWithFilename:(id)a3 error:(id *)a4 errorHandler:(id)a5
{
  return (id)objc_msgSend(a1, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", a3, 1, a5, a4);
}

+ (id)protectedDatabaseWithFilename:(id)a3 error:(id *)a4
{
  return +[_PASSqliteDatabase protectedDatabaseWithFilename:error:errorHandler:](_PASSqliteDatabase, "protectedDatabaseWithFilename:error:errorHandler:", a3, a4, 0);
}

+ (BOOL)isInMemoryPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR(":memory:")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "containsString:", CFSTR("mode=memory"));

  return v4;
}

+ (id)inMemoryPath
{
  return CFSTR(":memory:");
}

+ (id)randomlyNamedInMemoryPathWithBaseName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("file:"), "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("?mode=memory&cache=shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)truncateDatabaseAtPath:(id)a3
{
  id v3;
  id v4;
  int v5;
  int v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  int v14;
  sqlite3 *ppDb;
  uint8_t buf[4];
  _BYTE v17[14];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ppDb = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v17 = v3;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "opening to truncate: %@", buf, 0xCu);
  }
  v4 = objc_retainAutorelease(v3);
  v5 = sqlite3_open_v2((const char *)objc_msgSend(v4, "UTF8String"), &ppDb, 65538, 0);
  if (v5)
    goto LABEL_7;
  v14 = 141;
  v6 = sqlite3_file_control(ppDb, 0, 101, &v14);
  if (v6)
  {
    v5 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = sqlite3_errmsg(ppDb);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v17 = v4;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = v5;
      v18 = 2080;
      v19 = v13;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not truncate sqlite file at %@: rc=%i: %s", buf, 0x1Cu);
    }
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = sqlite3_errmsg(ppDb);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v17 = v5;
      *(_WORD *)&v17[4] = 2080;
      *(_QWORD *)&v17[6] = v7;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Truncating database failed (rc=%i). Doing unsafe deletion via filesystem: %s", buf, 0x12u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v17 = v4;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "closing db after failed truncation: %@", buf, 0xCu);
    }
    sqlite3_close(ppDb);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v4, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-shm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtPath:error:", v12, 0);

    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v17 = v4;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Sqlite file truncated: %@", buf, 0xCu);
  }
  sqlite3_close(ppDb);
LABEL_12:

}

+ (void)runDebugCommand:(const char *)a3 onDbWithHandle:(id)a4
{
  sqlite3 *v5;
  char v6;
  char *errmsg;

  v5 = (sqlite3 *)objc_msgSend(objc_retainAutorelease(a4), "handle");
  if (v5)
  {
    errmsg = 0;
    v6 = 0;
    if (sqlite3_exec(v5, a3, (int (__cdecl *)(void *, int, char **, char **))runDebugCommandCallback, &v6, &errmsg))
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "error running SQL: %s\n", errmsg);
  }
  else
  {
    fwrite("error: no handle found\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
}

+ (id)corruptionMarkerPathForPath:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("._PAS_db_corruption_marker"));
}

@end
