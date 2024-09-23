@implementation PQLConnection

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4
{
  uint64_t v5;

  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:](self, "fetchObjectOfClass:initializer:sql:args:", a3, 0, a4, &v5);
}

- (BOOL)_executeStmt:(id)a3 mustSucceed:(BOOL)a4 preparationTime:(unint64_t)a5
{
  _BOOL4 v6;
  sqlite3_stmt **v8;
  int autocommit;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  NSError *v14;
  NSError *lastError;
  int v16;
  BOOL v17;
  char v18;
  void (**autoRollbackHandler)(id, PQLConnection *, sqlite3_stmt **, NSError *);
  int64_t v20;

  v6 = a4;
  v8 = (sqlite3_stmt **)a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  if (!v8)
  {
    v13 = 0;
    goto LABEL_25;
  }
  self->_changesOverride = 0;
  autocommit = sqlite3_get_autocommit(self->_db);
  self->_currentStmtStart = mach_absolute_time();
  v10 = sqlite3_step(v8[1]);
  v11 = 101;
  if (v10)
  {
    v12 = v10;
    if (v10 != 101)
    {
      if (v10 == 100)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("this isn't an update, you should use -select instead"));
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:stmt:", self->_db, v8[1]);
      v14 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v14;

      v16 = sqlite3_get_autocommit(self->_db);
      if (autocommit)
        v17 = 1;
      else
        v17 = v16 == 0;
      v18 = v17;
      if (v6 || (v18 & 1) == 0)
      {
        autoRollbackHandler = (void (**)(id, PQLConnection *, sqlite3_stmt **, NSError *))self->_autoRollbackHandler;
      }
      else
      {
        autoRollbackHandler = (void (**)(id, PQLConnection *, sqlite3_stmt **, NSError *))self->_sqliteErrorHandler;
        if (!autoRollbackHandler)
          goto LABEL_19;
      }
      autoRollbackHandler[2](autoRollbackHandler, self, v8, self->_lastError);
LABEL_19:
      v11 = v12;
    }
  }
LABEL_20:
  objc_msgSend(v8, "unbindForDB:returnedRows:executionTime:preparationTime:", self, 0, mach_absolute_time() - self->_currentStmtStart, a5);
  self->_currentStmtStart = 0;
  if (!self->_useBatching && !self->_savePointLevel && (self->_vacuumTracker & 0x80000000) == 0)
  {
    v20 = -[PQLConnection changes](self, "changes");
    -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
    self->_changesOverride = v20;
  }
  v13 = v11 == 101;
LABEL_25:

  return v13;
}

- (int64_t)changes
{
  void *v4;
  int64_t result;
  NSError *v6;
  NSError *lastError;

  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v6;

      return 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1414, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  result = self->_changesOverride;
  if (!result)
    return sqlite3_changes(self->_db);
  return result;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6
{
  id v10;
  id v11;
  PQLResultSet *v12;
  PQLResultSet *v13;
  void *v14;
  NSError *v15;
  NSError *lastError;
  uint64_t v18;

  v10 = a5;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v18 = 0;
  v11 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:](self, "_newStatementForFormat:preparationTime:arguments:", v10, &v18, a6);

  v12 = [PQLResultSet alloc];
  v13 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v12, "initWithStatement:usingDatabase:preparationTime:", v11, self, v18);
  -[PQLResultSet onlyObjectOfClass:initializer:](v13, "onlyObjectOfClass:initializer:", a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[PQLResultSet error](v13, "error");
    v15 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v15;

  }
  return v14;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)assertOnQueue
{
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
}

- (id)profilingHook
{
  return self->_profilingHook;
}

- (id)profilingHookV2
{
  return self->_profilingHookV2;
}

- (id)fetchSwift:(id)a3 error:(id *)a4
{
  id v6;
  PQLResultSet *v7;
  PQLResultSet *v8;
  NSError *lastError;
  PQLResultSet *v10;
  uint64_t v12;

  v12 = 0;
  v6 = -[PQLConnection _newStatementForBuilder:preparationTime:](self, "_newStatementForBuilder:preparationTime:", a3, &v12);
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  v7 = [PQLResultSet alloc];
  v8 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v7, "initWithStatement:usingDatabase:preparationTime:", v6, self, v12);
  lastError = self->_lastError;
  if (lastError)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(lastError);
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (sqlite3)dbHandle
{
  return self->_db;
}

- (BOOL)isTraced
{
  return self->_traced;
}

- (id)_newStatementForBuilder:(id)a3 preparationTime:(unint64_t *)a4
{
  id v7;
  void *v8;
  cache_s *preparedStatements;
  NSError *v10;
  PQLStatement *v11;
  NSError *v13;
  NSError *lastError;

  v7 = a3;
  self->_changesOverride = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v13;

      v11 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1692, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if (self->_suspendCaching || !self->_serialQueue)
    preparedStatements = 0;
  else
    preparedStatements = self->_preparedStatements;
  -[PQLConnection _clearCleanupCacheQueueIfNeeded](self, "_clearCleanupCacheQueueIfNeeded");
  v10 = self->_lastError;
  self->_lastError = 0;

  v11 = -[PQLStatement initWithQueryBuilder:db:cache:preparationTime:]([PQLStatement alloc], "initWithQueryBuilder:db:cache:preparationTime:", v7, self, preparedStatements, a4);
LABEL_11:

  return v11;
}

- (void)_clearCleanupCacheQueueIfNeeded
{
  NSMutableArray *obj;

  obj = self->_stmtCacheCleanupQueue;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_stmtCacheCleanupQueue, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)_newStatementForFormat:(id)a3 preparationTime:(unint64_t *)a4 arguments:(char *)a5
{
  id v9;
  void *v10;
  cache_s *preparedStatements;
  NSError *v12;
  PQLStatement *v13;
  NSError *v15;
  NSError *lastError;

  v9 = a3;
  self->_changesOverride = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v15 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v15;

      v13 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1431, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if (self->_suspendCaching || !self->_serialQueue)
    preparedStatements = 0;
  else
    preparedStatements = self->_preparedStatements;
  -[PQLConnection _clearCleanupCacheQueueIfNeeded](self, "_clearCleanupCacheQueueIfNeeded");
  v12 = self->_lastError;
  self->_lastError = 0;

  v13 = -[PQLStatement initWithFormat:arguments:db:cache:preparationTime:]([PQLStatement alloc], "initWithFormat:arguments:db:cache:preparationTime:", v9, a5, self, preparedStatements, a4);
LABEL_11:

  return v13;
}

void __37__PQLConnection__batchStartIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D825FB2C]();
  if (pql_pred != -1)
    dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
  v3 = pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D4668000, v3, OS_LOG_TYPE_DEBUG, "Flushing database batch for timer on %@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "flush");
  objc_autoreleasePoolPop(v2);
}

- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4
{
  uint64_t v4;
  id v7;
  BOOL v8;
  NSObject *serialQueue;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if ((v4 & 1) != 0)
  {
    if (!self->_useQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1016, CFSTR("PerformOnSerialQueue asked with no serial Queue in use"));

    }
    serialQueue = self->_serialQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__PQLConnection_performWithFlags_action___block_invoke;
    v12[3] = &unk_1E97F2FE0;
    v14 = &v16;
    v12[4] = self;
    v15 = v4;
    v13 = v7;
    dispatch_sync(serialQueue, v12);

    v8 = *((_BYTE *)v17 + 24) != 0;
  }
  else
  {
    v8 = -[PQLConnection _performWithFlags:action:whenFlushed:](self, "_performWithFlags:action:whenFlushed:", v4, v7, 0);
    *((_BYTE *)v17 + 24) = v8;
  }
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)flush
{
  void *v4;
  void *v5;
  OS_os_transaction *v6;
  NSObject *batchingTimer;
  OS_dispatch_source *v8;
  void (**batchingPolicyHandler)(id, PQLConnection *, uint64_t);
  void (**preFlushHook)(id, PQLConnection *);
  OS_os_transaction *batchStarted;
  void (**didFinishBatchingHook)(id, PQLConnection *);
  NSObject *v13;
  void (**postFlushHook)(id, PQLConnection *);
  OS_os_transaction *v15;
  void (**v16)(id, PQLConnection *);
  NSMutableArray *flushNotifications;
  void *v18;
  NSError *v19;
  NSError *lastError;
  void *v21;
  int v22;
  PQLConnection *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if (self->_savePointLevel)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 734, CFSTR("-flush is invalid when in a savepoint"));

  }
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v19 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v19;

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 736, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_batchStarted)
  {
    v5 = (void *)MEMORY[0x1D825FB2C]();
    v6 = self->_batchStarted;
    batchingTimer = self->_batchingTimer;
    if (batchingTimer)
    {
      dispatch_source_cancel(batchingTimer);
      v8 = self->_batchingTimer;
      self->_batchingTimer = 0;

    }
    batchingPolicyHandler = (void (**)(id, PQLConnection *, uint64_t))self->_batchingPolicyHandler;
    if (batchingPolicyHandler)
      batchingPolicyHandler[2](batchingPolicyHandler, self, 0xFFFFFFFFLL);
    ++self->_skipBatchStop;
    preFlushHook = (void (**)(id, PQLConnection *))self->_preFlushHook;
    if (preFlushHook)
      preFlushHook[2](preFlushHook, self);
    if (-[PQLConnection _execute:mustSucceed:bindings:](self, "_execute:mustSucceed:bindings:", CFSTR("commit"), 1, 0))
    {
      if (self->_needsFullSync || self->_needsBarrierFSync)
      {
        if (-[PQLConnection synchronousMode](self, "synchronousMode") != 2)
          -[PQLConnection _fullSync](self, "_fullSync");
        *(_WORD *)&self->_needsFullSync = 0;
      }
      batchStarted = self->_batchStarted;
      self->_batchStarted = 0;

      didFinishBatchingHook = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      if (didFinishBatchingHook)
        didFinishBatchingHook[2](didFinishBatchingHook, self);
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v13 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        v22 = 138412290;
        v23 = self;
        _os_log_impl(&dword_1D4668000, v13, OS_LOG_TYPE_DEBUG, "Flushed %@", (uint8_t *)&v22, 0xCu);
      }
      if ((self->_vacuumTracker & 0x80000000) == 0)
        -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
      postFlushHook = (void (**)(id, PQLConnection *))self->_postFlushHook;
      if (postFlushHook)
        postFlushHook[2](postFlushHook, self);
    }
    else
    {
      v15 = self->_batchStarted;
      self->_batchStarted = 0;

      v16 = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      if (v16)
        v16[2](v16, self);
      flushNotifications = self->_flushNotifications;
      self->_flushNotifications = 0;

      if ((self->_vacuumTracker & 0x80000000) == 0)
        -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
    }
    --self->_skipBatchStop;
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {

      v6 = 0;
    }
    self->_batchingChangesCount = sqlite3_total_changes(self->_db);
    if (self->_flushNotifications)
      -[PQLConnection _fireFlushNotifications](self, "_fireFlushNotifications");

    objc_autoreleasePoolPop(v5);
  }
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5
{
  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:](self, "fetchObjectOfClass:initializer:sql:args:", a3, 0, a4, a5);
}

- (id)fetch:(id)a3 args:(char *)a4
{
  id v6;
  id v7;
  PQLResultSet *v8;
  PQLResultSet *v9;
  uint64_t v11;

  v11 = 0;
  v6 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v7 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:](self, "_newStatementForFormat:preparationTime:arguments:", v6, &v11, a4);

  v8 = [PQLResultSet alloc];
  v9 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v8, "initWithStatement:usingDatabase:preparationTime:", v7, self, v11);

  return v9;
}

- (void)_vacuumIfNeeded
{
  __assert_rtn("-[PQLConnection _vacuumIfNeeded]", "PQLConnection.m", 597, "!_batchStarted");
}

- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5
{
  char v6;
  unsigned int (**v9)(id, PQLConnection *);
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  SEL v16;
  PQLConnection *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t savePointLevel;
  unsigned int (**v24)(id, PQLConnection *);
  __CFString *v25;
  PQLConnection *v26;
  id *p_isa;
  __CFString *v28;
  id v29;
  unsigned int (**v30)(id, PQLConnection *);
  char v31;
  id v32;
  char v33;
  id v34;
  int v35;
  NSMutableArray *flushNotifications;
  NSMutableArray *v37;
  NSMutableArray *v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  void (**didFinishBatchingHook)(id, PQLConnection *);
  PQLConnection *v44;
  PQLConnection *v45;
  char v46;
  __CFString *v47;
  NSError *v49;
  NSError *lastError;
  void (**willBeginBatchingHook)(id, PQLConnection *);
  int v52;
  NSObject *serialQueue;
  void *v54;
  int v55;
  uint64_t v56;
  __CFString *v57;
  _QWORD block[5];
  id v59;

  v6 = a3;
  v9 = (unsigned int (**)(id, PQLConnection *))a4;
  v10 = a5;
  v11 = -[NSMutableArray count](self->_flushNotifications, "count");
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v49 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v49;

      v21 = 0;
      v22 = 0;
      v47 = 0;
      v20 = 0;
      v40 = 0;
      goto LABEL_72;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 858, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if ((v6 & 0x20) != 0)
    -[PQLConnection flush](self, "flush");
  if (v10)
  {
    if (self->_useBatching)
      v6 |= 4u;
    if (!self->_useQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 869, CFSTR("completion handler passed and no serial Queue in use"));

    }
    if ((v6 & 0xC) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("flush notification makes no sense without batching or savepoints");
      v16 = a2;
      v17 = self;
      v18 = 871;
LABEL_80:
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("PQLConnection.m"), v18, v15);

    }
  }
  else if ((v6 & 4) != 0 && !self->_useBatching)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("PerformSuspendBatch makes no sense if batching isn't in use");
    v16 = a2;
    v17 = self;
    v18 = 873;
    goto LABEL_80;
  }
  v19 = v6 & 0xC;
  if ((v6 & 0xC) != 0)
  {
    if (self->_useBatching || self->_savePointLevel)
    {
      v20 = 0;
    }
    else
    {
      willBeginBatchingHook = (void (**)(id, PQLConnection *))self->_willBeginBatchingHook;
      if (willBeginBatchingHook)
        willBeginBatchingHook[2](willBeginBatchingHook, self);
      v20 = (void *)os_transaction_create();
    }
    ++self->_skipBatchStop;
    if ((v6 & 2) != 0)
      goto LABEL_22;
  }
  else
  {
    v20 = 0;
    if ((v6 & 2) != 0)
LABEL_22:
      ++self->_suspendCaching;
  }
  if ((v6 & 8) != 0)
  {
    savePointLevel = self->_savePointLevel;
    v24 = v9;
    if (savePointLevel > 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("savepoint savepoint_%d"), self->_savePointLevel);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rollback to savepoint savepoint_%d"), self->_savePointLevel);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = v6 & 0xC;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("release savepoint savepoint_%d"), self->_savePointLevel);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = _performWithFlags_action_whenFlushed__start_list[savePointLevel];
      v22 = _performWithFlags_action_whenFlushed__rollback_list[self->_savePointLevel];
      v25 = _performWithFlags_action_whenFlushed__release_list[self->_savePointLevel];
    }
    v57 = v25;
    v26 = self;
    p_isa = (id *)&v26->super.isa;
    if (v26->_useBatching && !v26->_batchStarted)
      -[PQLConnection _batchStartIfNeeded:](v26, "_batchStartIfNeeded:", v26->_batchTransactionType);

    if (!objc_msgSend(p_isa, "_execute:mustSucceed:bindings:", v21, 1, 0))
    {
      v9 = v24;
      goto LABEL_51;
    }
    v55 = v19;
    v56 = v11;
    v28 = v21;
    v29 = v10;
    ++self->_savePointLevel;
    v30 = v24;
    v31 = v24[2](v24, (PQLConnection *)p_isa);
    v32 = p_isa[31];
    if ((v31 & 1) == 0)
      objc_msgSend(p_isa, "_execute:mustSucceed:bindings:", v22, 1, 0);
    --self->_savePointLevel;
    v33 = objc_msgSend(p_isa, "_execute:mustSucceed:bindings:", v57, 1, 0) & v31;
    v34 = p_isa[31];
    p_isa[31] = v32;

    v9 = v30;
    v10 = v29;
    v21 = v28;
    v11 = v56;
    v19 = v55;
    if ((v33 & 1) == 0)
    {
LABEL_51:
      v41 = -[NSMutableArray count](self->_flushNotifications, "count");
      if (v41 != v11)
        -[NSMutableArray removeObjectsInRange:](self->_flushNotifications, "removeObjectsInRange:", v11, v41 - v11);
      v40 = 0;
      if ((v6 & 2) == 0)
        goto LABEL_55;
      goto LABEL_54;
    }
  }
  else
  {
    v21 = 0;
    v22 = 0;
    v57 = 0;
    if (!v9[2](v9, self))
      goto LABEL_51;
  }
  if (v10)
  {
    if (self->_batchStarted || self->_savePointLevel)
    {
      v35 = v19;
      flushNotifications = self->_flushNotifications;
      if (!flushNotifications)
      {
        v37 = (NSMutableArray *)objc_opt_new();
        v38 = self->_flushNotifications;
        self->_flushNotifications = v37;

        flushNotifications = self->_flushNotifications;
      }
      v39 = (void *)MEMORY[0x1D825FCAC](v10);
      -[NSMutableArray addObject:](flushNotifications, "addObject:", v39);

      v19 = v35;
    }
    else
    {
      if (self->_flushNotifications)
        -[PQLConnection _performWithFlags:action:whenFlushed:].cold.1();
      v52 = v19;
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PQLConnection__performWithFlags_action_whenFlushed___block_invoke;
      block[3] = &unk_1E97F2F68;
      block[4] = self;
      v59 = v10;
      dispatch_async(serialQueue, block);

      v19 = v52;
    }
  }
  if (!self->_useBatching && !self->_savePointLevel && (self->_vacuumTracker & 0x80000000) == 0)
    -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
  v40 = 1;
  if ((v6 & 2) == 0)
    goto LABEL_55;
LABEL_54:
  --self->_suspendCaching;
LABEL_55:
  if (v19)
  {
    objc_opt_self();
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      if (self->_flushNotifications)
        -[PQLConnection _fireFlushNotifications](self, "_fireFlushNotifications");

      didFinishBatchingHook = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      if (didFinishBatchingHook)
        didFinishBatchingHook[2](didFinishBatchingHook, self);
      v20 = 0;
    }
    --self->_skipBatchStop;
  }
  v44 = self;
  v45 = v44;
  if (v44->_useBatching && v44->_batchStarted && !v44->_skipBatchStop)
    -[PQLConnection _batchStopIfNeeded](v44, "_batchStopIfNeeded");

  v46 = !v40;
  if ((v6 & 0x10) == 0)
    v46 = 1;
  if ((v46 & 1) == 0)
  {
    -[PQLConnection flush](v45, "flush");
    v40 = 1;
  }
  v47 = v57;
LABEL_72:

  return v40;
}

- (BOOL)_execute:(id)a3 mustSucceed:(BOOL)a4 bindings:(char *)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v9;

  v5 = a4;
  v9 = 0;
  v7 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:](self, "_newStatementForFormat:preparationTime:arguments:", a3, &v9, a5);
  LOBYTE(v5) = -[PQLConnection _executeStmt:mustSucceed:preparationTime:](self, "_executeStmt:mustSucceed:preparationTime:", v7, v5, v9);

  return v5;
}

- (void)_batchStopIfNeeded
{
  __assert_rtn("-[PQLConnection _batchStopIfNeeded]", "PQLConnection.m", 498, "_useBatching && _batchStarted && !_savePointLevel && !_skipBatchStop");
}

- (void)_batchStartIfNeeded:(int)a3
{
  __CFString *v5;
  void (**willBeginBatchingHook)(id, PQLConnection *);
  OS_os_transaction *v7;
  OS_os_transaction *batchStarted;
  NSObject *v9;
  double batchingPeriod;
  unint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  dispatch_block_t v14;
  OS_dispatch_source *batchingTimer;
  NSObject *v16;
  void (**batchingPolicyHandler)(id, PQLConnection *, uint64_t);
  _QWORD block[5];
  uint8_t buf[4];
  PQLConnection *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if (!self->_useBatching || self->_batchStarted)
    -[PQLConnection _batchStartIfNeeded:].cold.1();
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_1E97F3000[a3];
  if (-[PQLConnection _execute:mustSucceed:bindings:](self, "_execute:mustSucceed:bindings:", v5, 1, 0))
  {
    willBeginBatchingHook = (void (**)(id, PQLConnection *))self->_willBeginBatchingHook;
    if (willBeginBatchingHook)
      willBeginBatchingHook[2](willBeginBatchingHook, self);
    v7 = (OS_os_transaction *)os_transaction_create();
    batchStarted = self->_batchStarted;
    self->_batchStarted = v7;

    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v9 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_1D4668000, v9, OS_LOG_TYPE_DEBUG, "Starting database batch on %@", buf, 0xCu);
    }
    self->_batchingChangesCount = sqlite3_total_changes(self->_db);
    batchingPeriod = self->_batchingPeriod;
    if (batchingPeriod > 0.0)
    {
      v11 = 1000000 * (unint64_t)(batchingPeriod * 1000.0);
      v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_serialQueue);
      v13 = dispatch_time(0, v11);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, v11 / 0xA);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__PQLConnection__batchStartIfNeeded___block_invoke;
      block[3] = &unk_1E97F2EA0;
      block[4] = self;
      v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
      dispatch_source_set_event_handler(v12, v14);

      dispatch_resume(v12);
      batchingTimer = self->_batchingTimer;
      self->_batchingTimer = (OS_dispatch_source *)v12;
      v16 = v12;

    }
    batchingPolicyHandler = (void (**)(id, PQLConnection *, uint64_t))self->_batchingPolicyHandler;
    if (batchingPolicyHandler)
      batchingPolicyHandler[2](batchingPolicyHandler, self, 4294967294);
  }
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 2, 0);
    v3 = (void *)gPQLConnections;
    gPQLConnections = v2;

    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, &__block_literal_global_2);
  }
}

- (PQLConnection)init
{
  PQLConnection *v2;
  PQLConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PQLConnection;
  v2 = -[PQLConnection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PQLConnection setBusyHandler:](v2, "setBusyHandler:", &__block_literal_global_4);
    -[PQLConnection setAutoRollbackHandler:](v3, "setAutoRollbackHandler:", &__block_literal_global_11);
    v3->_shouldUseWALJournalMode = 1;
    pthread_mutex_lock(&gPQLMutex);
    objc_msgSend((id)gPQLConnections, "addObject:", v3);
    pthread_mutex_unlock(&gPQLMutex);
  }
  return v3;
}

uint64_t __21__PQLConnection_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendFormat:", CFSTR("busy handler called (%d) %@"), a3, v4);
  pthread_mutex_lock(&gPQLMutex);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)gPQLConnections;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\n > %@"), v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

  if (pql_pred != -1)
    dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
  v12 = pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1D4668000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  pthread_mutex_unlock(&gPQLMutex);
  sqlite3_sleep(10);

  return 1;
}

uint64_t __21__PQLConnection_init__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Sqlite rollbacked transaction [%@] because of unrecoverable error [%@], aborting."), a3, a4);
}

- (id)_description:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  const __CFString *label;
  BOOL v8;
  const char *v9;
  sqlite3 *db;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v12;
  uint64_t v13;
  uint64_t v14;
  sqlite3_stmt *v15;
  sqlite3_stmt *v16;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = objc_opt_class();
  label = (const __CFString *)self->_label;
  v8 = label == 0;
  if (!label)
    label = &stru_1E97F31C0;
  v9 = " ";
  if (v8)
    v9 = "";
  objc_msgSend(v5, "appendFormat:", CFSTR("<%@:%p %@%s{batch:%d:%d txn:%d"), v6, self, label, v9, self->_batchStarted != 0, self->_skipBatchStop, self->_savePointLevel);
  db = self->_db;
  if (db && v3)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(" auto-commit:%d}>"), sqlite3_get_autocommit(db));
    stmt = sqlite3_next_stmt(self->_db, 0);
    if (stmt)
    {
      v12 = stmt;
      LODWORD(v13) = 0;
      LODWORD(v14) = 0;
      do
      {
        v14 = (v14 + 1);
        if (sqlite3_stmt_busy(v12))
          v13 = (v13 + 1);
        else
          v13 = v13;
        v12 = sqlite3_next_stmt(self->_db, v12);
      }
      while (v12);
      objc_msgSend(v5, "appendFormat:", CFSTR(" %d prepared statements"), v14);
      if ((_DWORD)v13)
      {
        objc_msgSend(v5, "appendFormat:", CFSTR(", %d busy:"), v13);
        v15 = sqlite3_next_stmt(self->_db, 0);
        if (v15)
        {
          v16 = v15;
          do
          {
            if (sqlite3_stmt_busy(v16))
              objc_msgSend(v5, "appendFormat:", CFSTR("\n    %s"), sqlite3_sql(v16));
            v16 = sqlite3_next_stmt(self->_db, v16);
          }
          while (v16);
        }
      }
    }
  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("}>"));
  }
  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[PQLConnection _description:](self, "_description:", 1);
}

- (id)description
{
  return -[PQLConnection _description:](self, "_description:", 0);
}

- (void)_resetState
{
  __assert_rtn("-[PQLConnection _resetState]", "PQLConnection.m", 213, "_db == nil");
}

- (void)dealloc
{
  NSObject *stmtCacheSource;
  OS_dispatch_source *v4;
  cache_s *preparedStatements;
  NSMutableArray *v6;
  NSMutableArray *stmtCacheCleanupQueue;
  OS_dispatch_queue *serialQueue;
  OS_dispatch_queue *targetQueue;
  NSString *label;
  objc_super v11;

  pthread_mutex_lock(&gPQLMutex);
  objc_msgSend((id)gPQLConnections, "removeObject:", self);
  pthread_mutex_unlock(&gPQLMutex);
  stmtCacheSource = self->_stmtCacheSource;
  if (stmtCacheSource)
  {
    dispatch_source_cancel(stmtCacheSource);
    v4 = self->_stmtCacheSource;
    self->_stmtCacheSource = 0;

  }
  preparedStatements = self->_preparedStatements;
  if (preparedStatements)
  {
    while (cache_destroy(preparedStatements) == 35)
    {
      sleep(1u);
      preparedStatements = self->_preparedStatements;
    }
    self->_preparedStatements = 0;
  }
  v6 = self->_stmtCacheCleanupQueue;
  objc_sync_enter(v6);
  -[NSMutableArray removeAllObjects](self->_stmtCacheCleanupQueue, "removeAllObjects");
  stmtCacheCleanupQueue = self->_stmtCacheCleanupQueue;
  self->_stmtCacheCleanupQueue = 0;

  objc_sync_exit(v6);
  if (self->_db)
    -[PQLConnection close:](self, "close:", 0);
  -[PQLConnection _resetState](self, "_resetState");
  serialQueue = self->_serialQueue;
  self->_serialQueue = 0;

  targetQueue = self->_targetQueue;
  self->_targetQueue = 0;

  label = self->_label;
  self->_label = 0;

  v11.receiver = self;
  v11.super_class = (Class)PQLConnection;
  -[PQLConnection dealloc](&v11, sel_dealloc);
}

- (void)_createCacheIfNeeded
{
  cache_s **p_preparedStatements;
  id v3;
  NSObject *v4;
  uint8_t buf[16];
  cache_attributes_t attrs;

  p_preparedStatements = &self->_preparedStatements;
  if (!self->_preparedStatements)
  {
    *(&attrs.version + 1) = 0;
    attrs.key_hash_cb = (cache_key_hash_cb_t)__PQLCacheKeyHash;
    attrs.version = 2;
    attrs.key_is_equal_cb = (cache_key_is_equal_cb_t)__PQLCacheKeyEqual;
    attrs.key_retain_cb = (cache_key_retain_cb_t)__PQLCacheKeyRetain;
    attrs.key_release_cb = (cache_release_cb_t)__PQLCacheKeyRelease;
    attrs.value_release_cb = (cache_release_cb_t)__PQLCacheValueRelease;
    attrs.value_make_nonpurgeable_cb = 0;
    attrs.value_make_purgeable_cb = 0;
    attrs.user_data = self;
    attrs.value_retain_cb = (cache_value_retain_cb_t)__PQLCacheValueRetain;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.sqlite.%@"), self->_label);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (cache_create((const char *)objc_msgSend(v3, "UTF8String"), &attrs, p_preparedStatements))
    {
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v4 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4668000, v4, OS_LOG_TYPE_ERROR, "Unable to create preprared cache for statements", buf, 2u);
      }
    }

  }
}

- (double)currentOperationDuration
{
  uint64_t v2;

  if (!self->_currentStmtStart)
    return 0.0;
  v2 = mach_absolute_time() - self->_currentStmtStart;
  if (timeInSeconds_once != -1)
    dispatch_once(&timeInSeconds_once, &__block_literal_global);
  return *(double *)&timeInSeconds_factor * (double)v2;
}

- (unint64_t)statementCacheMaxCount
{
  -[PQLConnection _createCacheIfNeeded](self, "_createCacheIfNeeded");
  return cache_get_count_hint();
}

- (void)setStatementCacheMaxCount:(unint64_t)a3
{
  -[PQLConnection _createCacheIfNeeded](self, "_createCacheIfNeeded");
  cache_set_count_hint();
}

- (void)useSerialQueueWithTarget:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSMutableArray *v6;
  NSMutableArray *stmtCacheCleanupQueue;
  const char *name;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *serialQueue;
  OS_dispatch_queue *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *stmtCacheSource;
  NSObject *v14;
  dispatch_block_t v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  if (!self->_serialQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    -[PQLConnection _createCacheIfNeeded](self, "_createCacheIfNeeded");
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stmtCacheCleanupQueue = self->_stmtCacheCleanupQueue;
    self->_stmtCacheCleanupQueue = v6;

    name = (const char *)cache_get_name();
    v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(name, v5, v4);
    serialQueue = self->_serialQueue;
    self->_serialQueue = v9;

    v11 = (OS_dispatch_queue *)v4;
    if (!v4)
      v11 = self->_serialQueue;
    objc_storeStrong((id *)&self->_targetQueue, v11);
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)self->_serialQueue);
    stmtCacheSource = self->_stmtCacheSource;
    self->_stmtCacheSource = v12;

    objc_initWeak(&location, self);
    v14 = self->_stmtCacheSource;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__PQLConnection_useSerialQueueWithTarget___block_invoke;
    v16[3] = &unk_1E97F2E78;
    objc_copyWeak(&v17, &location);
    v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, v16);
    dispatch_source_set_event_handler(v14, v15);

    dispatch_resume((dispatch_object_t)self->_stmtCacheSource);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  self->_useQueue = 1;

}

void __42__PQLConnection_useSerialQueueWithTarget___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x1D825FB2C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_clearCleanupCacheQueueIfNeeded");

  objc_autoreleasePoolPop(v2);
}

- (void)useSerialQueue
{
  -[PQLConnection useSerialQueueWithTarget:](self, "useSerialQueueWithTarget:", 0);
}

- (void)useBatchingOnTargetQueue:(id)a3 delay:(double)a4 changeCount:(int)a5
{
  id v9;
  id v10;
  BOOL v11;
  id batchingPolicyHandler;
  void *v13;
  id v14;

  v9 = a3;
  v10 = v9;
  v11 = a4 <= 0.0 && a5 <= 0;
  v14 = v9;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0 || delay > 0"));

    v10 = v14;
  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  else
    -[PQLConnection useSerialQueueWithTarget:](self, "useSerialQueueWithTarget:", v10);
  self->_useBatching = 1;
  self->_batchingChangesLimit = a5;
  self->_batchingPeriod = a4;
  batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_batchingPolicyHandler = 0;

}

- (void)useBatchingWithDelay:(double)a3 changeCount:(int)a4
{
  -[PQLConnection useBatchingOnTargetQueue:delay:changeCount:](self, "useBatchingOnTargetQueue:delay:changeCount:", 0, *(_QWORD *)&a4, a3);
}

- (void)useBatchingOnTargetQueue:(id)a3 withPolicyHandler:(id)a4
{
  NSObject *targetQueue;
  id v7;
  id v9;
  void *v10;
  id batchingPolicyHandler;

  if (self->_useQueue)
  {
    targetQueue = self->_targetQueue;
    v7 = a4;
    dispatch_assert_queue_V2(targetQueue);
  }
  else
  {
    v9 = a4;
    -[PQLConnection useSerialQueueWithTarget:](self, "useSerialQueueWithTarget:", a3);
  }
  self->_useBatching = 1;
  self->_batchingChangesLimit = 0;
  self->_batchingPeriod = 0.0;
  v10 = (void *)objc_msgSend(a4, "copy");

  batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_batchingPolicyHandler = v10;

}

- (void)useBatchingWithPolicyHandler:(id)a3
{
  -[PQLConnection useBatchingOnTargetQueue:withPolicyHandler:](self, "useBatchingOnTargetQueue:withPolicyHandler:", 0, a3);
}

- (void)forceBatchStart
{
  void *v4;
  PQLConnection *v5;
  NSError *lastError;
  NSError *v7;
  NSError *v8;

  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v7 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v7;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 488, CFSTR("Connection has been used after close (or before open)"));

  }
  v5 = self;
  lastError = (NSError *)v5;
  if (v5->_useBatching && !v5->_batchStarted)
  {
    v8 = (NSError *)v5;
    -[PQLConnection _batchStartIfNeeded:](v5, "_batchStartIfNeeded:", v5->_batchTransactionType);
    lastError = v8;
  }
LABEL_8:

}

- (void)_fireFlushNotifications
{
  __assert_rtn("-[PQLConnection _fireFlushNotifications]", "PQLConnection.m", 541, "!_batchStarted && !_savePointLevel && _useQueue");
}

void __40__PQLConnection__fireFlushNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D825FB2C]();
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
          v8 = *(_QWORD *)(a1 + 32);
        else
          v8 = 0;
        (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  objc_autoreleasePoolPop(v2);
}

- (int)_vacuumMode
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;

  v2 = -[PQLConnection fetch:](self, "fetch:", CFSTR("PRAGMA auto_vacuum"));
  if (objc_msgSend(v2, "next"))
  {
    objc_msgSend(v2, "stringAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("incremental")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("full")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("off")) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v6 = objc_msgSend(v4, "intValue");
      if (v6 >= 2)
        v7 = 2;
      else
        v7 = v6;
      v5 = v7 & ~(v7 >> 31);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_incrementalVacuum:(unint64_t)a3
{
  void *v4;
  sqlite3 *db;
  id v6;
  int v7;
  NSObject *v8;
  uint8_t buf[16];

  ++self->_suspendCaching;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA incremental_vacuum(%lld)"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v6 = objc_retainAutorelease(v4);
  v7 = sqlite3_exec(db, (const char *)objc_msgSend(v6, "UTF8String"), 0, 0, 0);
  if (v7)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v8 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4668000, v8, OS_LOG_TYPE_DEFAULT, "warning: Incremental vacuum failed", buf, 2u);
    }
  }
  --self->_suspendCaching;

  return v7 == 0;
}

- (BOOL)_fullSync
{
  int v3;
  NSError *v4;
  NSError *lastError;
  NSObject *v7;
  const char *v8;
  int v9;
  int v10;
  int v11;
  NSError *v12;
  NSError *v13;
  NSObject *v14;
  NSError *v15;
  NSError *v16;
  NSError *v17;
  NSObject *v18;
  const char *v19;
  NSError *v20;
  int v21;
  PQLConnection *v22;
  __int16 v23;
  PQLConnection *v24;
  __int16 v25;
  NSError *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  self->_currentStmtStart = mach_absolute_time();
  v3 = sqlite3_wal_checkpoint_v2(self->_db, "main", 1, 0, 0);
  self->_currentStmtStart = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:", self->_db);
    v4 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v4;

LABEL_3:
    (*((void (**)(void))self->_autoRollbackHandler + 2))();
    return 0;
  }
  if (pql_pred != -1)
    dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
  v7 = pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    v8 = "full";
    if (!self->_needsFullSync)
      v8 = "barrier";
    v21 = 136315394;
    v22 = (PQLConnection *)v8;
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1D4668000, v7, OS_LOG_TYPE_DEBUG, "%s fsyncing %@", (uint8_t *)&v21, 0x16u);
  }
  v9 = open(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), 0);
  if (v9 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = self->_lastError;
    self->_lastError = v12;

    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v14 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_lastError;
      v21 = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = (PQLConnection *)v15;
      _os_log_impl(&dword_1D4668000, v14, OS_LOG_TYPE_ERROR, "Failed to open the db for fsync %@ - %@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_3;
  }
  v10 = v9;
  if (self->_needsFullSync)
    v11 = fcntl(v9, 51);
  else
    v11 = fcntl(v9, 85);
  if (v11 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v16 = (NSError *)objc_claimAutoreleasedReturnValue();
    v17 = self->_lastError;
    self->_lastError = v16;

    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v18 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      v19 = "F_FULLFSYNC";
      v20 = self->_lastError;
      if (!self->_needsFullSync)
        v19 = "F_BARRIERFSYNC";
      v21 = 136315650;
      v22 = (PQLConnection *)v19;
      v23 = 2112;
      v24 = self;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1D4668000, v18, OS_LOG_TYPE_ERROR, "Failed to %s the db for %@ - %@", (uint8_t *)&v21, 0x20u);
    }
    (*((void (**)(void))self->_autoRollbackHandler + 2))();
    close(v10);
    return 0;
  }
  close(v10);
  return 1;
}

- (void)makeNextFlushBarrierFSync
{
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if (!self->_needsFullSync && !self->_needsBarrierFSync)
  {
    -[PQLConnection forceBatchStart](self, "forceBatchStart");
    self->_needsBarrierFSync = 1;
  }
}

- (void)makeNextFlushFullSync
{
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  if (!self->_needsFullSync)
  {
    -[PQLConnection forceBatchStart](self, "forceBatchStart");
    self->_needsFullSync = 1;
  }
}

void __54__PQLConnection__performWithFlags_action_whenFlushed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1D825FB2C]();
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  objc_autoreleasePoolPop(v2);
}

- (BOOL)isBatchSuspended
{
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  return self->_skipBatchStop > 0;
}

- (void)groupInBatch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PQLConnection_groupInBatch___block_invoke;
  v6[3] = &unk_1E97F2F90;
  v7 = v4;
  v5 = v4;
  -[PQLConnection _performWithFlags:action:whenFlushed:](self, "_performWithFlags:action:whenFlushed:", 4, v6, 0);

}

uint64_t __30__PQLConnection_groupInBatch___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (BOOL)groupInTransaction:(id)a3
{
  return -[PQLConnection _performWithFlags:action:whenFlushed:](self, "_performWithFlags:action:whenFlushed:", 8, a3, 0);
}

- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  BOOL v11;
  NSObject *serialQueue;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if ((v6 & 1) != 0)
  {
    if (!self->_useQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1000, CFSTR("PerformOnSerialQueue asked with no serial Queue in use"));

    }
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PQLConnection_performWithFlags_action_whenFlushed___block_invoke;
    block[3] = &unk_1E97F2FB8;
    v18 = &v20;
    block[4] = self;
    v19 = v6;
    v16 = v9;
    v17 = v10;
    dispatch_sync(serialQueue, block);

    v11 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v11 = -[PQLConnection _performWithFlags:action:whenFlushed:](self, "_performWithFlags:action:whenFlushed:", v6, v9, v10);
    *((_BYTE *)v21 + 24) = v11;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __53__PQLConnection_performWithFlags_action_whenFlushed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performWithFlags:action:whenFlushed:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __41__PQLConnection_performWithFlags_action___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performWithFlags:action:whenFlushed:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)setTraced:(BOOL)a3
{
  _BOOL4 v3;
  sqlite3 *db;
  int (__cdecl *v6)(unsigned int, void *, void *, void *);
  unsigned int v7;

  v3 = a3;
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  db = self->_db;
  if (db)
  {
    if (v3)
    {
      v6 = (int (__cdecl *)(unsigned int, void *, void *, void *))db_trace;
      v7 = 1;
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
    sqlite3_trace_v2(db, v7, v6, self);
  }
  self->_traced = v3;
}

- (void)_clearStatementCache
{
  cache_s *preparedStatements;

  if (self->_serialQueue)
  {
    preparedStatements = self->_preparedStatements;
    if (preparedStatements)
      cache_remove_all(preparedStatements);
  }
  -[PQLConnection _clearCleanupCacheQueueIfNeeded](self, "_clearCleanupCacheQueueIfNeeded");
}

- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5
{
  id v10;
  sqlite3 **p_db;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  int v17;
  PQLConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_storeStrong((id *)&self->_url, a3);
  p_db = &self->_db;
  if (self->_db)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1094, CFSTR("-openAtURL called twice"));

  }
  v12 = sqlite3_open_v2(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), &self->_db, a4, 0);
  if (v12)
  {
    if (*p_db)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[PQLConnection close:](self, "close:", 0);
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SqliteErrorDomain"), v12, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[PQLConnection _resetState](self, "_resetState");
  }
  else
  {
    if (sqlite3_busy_handler(*p_db, (int (__cdecl *)(void *, int))__PQLBusyHandlerFunction, self))
    {
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v13 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D4668000, v13, OS_LOG_TYPE_ERROR, "Can't set busy handler", (uint8_t *)&v17, 2u);
      }
    }
    if (self->_traced)
    {
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v14 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        v17 = 138412290;
        v18 = self;
        _os_log_impl(&dword_1D4668000, v14, OS_LOG_TYPE_DEBUG, "opened %@", (uint8_t *)&v17, 0xCu);
      }
      -[PQLConnection setTraced:](self, "setTraced:", self->_traced);
    }
    -[PQLConnection _clearStatementCache](self, "_clearStatementCache");
  }

  return v12 == 0;
}

- (BOOL)openAtURL:(id)a3 sharedCache:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;

  if (a4)
    v5 = 131078;
  else
    v5 = 262150;
  return -[PQLConnection openAtURL:withFlags:error:](self, "openAtURL:withFlags:error:", a3, v5, a5);
}

- (BOOL)destroyDatabaseWithError:(id *)a3
{
  void *v6;
  id v7;
  int v8;
  __int128 v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  NSError *v17;
  NSError *v18;
  NSError *v20;
  NSError *lastError;
  int v22;

  v22 = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v20;

      return 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1132, CFSTR("Connection has been used after close (or before open)"));

  }
  v7 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("PRAGMA page_size"));
  v8 = 0;
  *((_QWORD *)&v9 + 1) = objc_msgSend(v7, "integerValue");
  *(_QWORD *)&v9 = *((_QWORD *)&v9 + 1) - 1024;
  switch((unint64_t)(v9 >> 10))
  {
    case 0uLL:
      v8 = 16;
      goto LABEL_9;
    case 1uLL:
      v8 = 32;
      goto LABEL_9;
    case 3uLL:
      v8 = 48;
      goto LABEL_9;
    case 7uLL:
      v8 = 64;
LABEL_9:
      v22 = v8;
      break;
    default:
      break;
  }
  v10 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("PRAGMA journal_mode"));
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("wal"));

  if (v12)
  {
    v8 |= 1u;
    v22 = v8;
  }
  v13 = -[PQLConnection _vacuumMode](self, "_vacuumMode");
  if (v13 == 2)
  {
    v14 = v8 | 0xC;
  }
  else if (v13 == 1)
  {
    v14 = v8 | 8;
  }
  else
  {
    if (v13)
      goto LABEL_19;
    v14 = v8 | 4;
  }
  v22 = v14;
LABEL_19:
  v15 = sqlite3_file_control(self->_db, 0, 101, &v22);
  v16 = v15 == 0;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:", self->_db);
    v17 = (NSError *)objc_claimAutoreleasedReturnValue();
    v18 = self->_lastError;
    self->_lastError = v17;

    if (a3)
      *a3 = objc_retainAutorelease(self->_lastError);
  }

  return v16;
}

- (BOOL)setupPragmas
{
  void *v4;
  NSError *lastError;
  void *v6;
  char v7;
  id v8;
  NSError *v9;
  BOOL v10;
  NSError *v12;
  NSError *v13;

  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      lastError = self->_lastError;
      self->_lastError = v12;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1169, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  ++self->_suspendCaching;
  if (-[PQLConnection execute:](self, "execute:", CFSTR("PRAGMA auto_vacuum = incremental"))
    && -[PQLConnection execute:](self, "execute:", CFSTR("PRAGMA page_size = 4096")))
  {
    if (self->_shouldUseWALJournalMode)
    {
      lastError = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("PRAGMA journal_mode = WAL"));
      -[NSError lowercaseString](lastError, "lowercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("wal"));

      if ((v7 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 2, CFSTR("cannot set journal_mode to WAL"));
        v9 = (NSError *)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_19;
      }
      v8 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("PRAGMA wal_autocheckpoint = 4000"));
      if ((objc_msgSend(v8, "isEqualToNumber:", &unk_1E97F70F8) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 2, CFSTR("cannot set wal_autocheckpoint to 4000"));
        v9 = (NSError *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v13 = self->_lastError;
        self->_lastError = v9;

        v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      lastError = 0;
      v8 = 0;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
    lastError = 0;
    v8 = 0;
  }
LABEL_13:
  --self->_suspendCaching;

LABEL_14:
  return v10;
}

- (BOOL)registerFunction:(id)a3 nArgs:(int)a4 handler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  sqlite3 *db;
  const char *v13;
  id v14;
  int function_v2;
  NSError *v16;
  NSError *v17;
  void (**sqliteErrorHandler)(id, PQLConnection *, _QWORD, NSError *);
  BOOL v19;
  NSError *v20;
  NSError *lastError;

  v9 = a3;
  v10 = a5;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v20;

LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1226, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  db = self->_db;
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  v14 = (id)objc_msgSend(v10, "copy");
  function_v2 = sqlite3_create_function_v2(db, v13, a4, 5, v14, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))pql_invoke_xfunc, 0, 0, (void (__cdecl *)(void *))pql_destroy_xfunc);

  if (function_v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:", self->_db);
    v16 = (NSError *)objc_claimAutoreleasedReturnValue();
    v17 = self->_lastError;
    self->_lastError = v16;

    sqliteErrorHandler = (void (**)(id, PQLConnection *, _QWORD, NSError *))self->_sqliteErrorHandler;
    if (sqliteErrorHandler)
      sqliteErrorHandler[2](sqliteErrorHandler, self, 0, self->_lastError);
    goto LABEL_11;
  }
  v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)close:(id *)a3
{
  id batchingPolicyHandler;
  sqlite3 *db;
  NSObject *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSURL *url;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v13;
  void *v14;
  NSURL *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  void *v20;
  uint8_t buf[4];
  PQLConnection *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  -[PQLConnection flush](self, "flush");
  -[PQLConnection _clearStatementCache](self, "_clearStatementCache");
  batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_batchingPolicyHandler = 0;

  db = self->_db;
  self->_db = 0;
  if (sqlite3_busy_handler(db, 0, 0))
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v7 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4668000, v7, OS_LOG_TYPE_ERROR, "can't clear busy handler", buf, 2u);
    }
  }
  v8 = sqlite3_close(db);
  if (v8)
  {
    self->_db = db;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:", db);
    v9 = objc_claimAutoreleasedReturnValue();
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v10 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412546;
      v22 = (PQLConnection *)url;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1D4668000, v10, OS_LOG_TYPE_ERROR, "sqlite3_close(%@) failed: %@", buf, 0x16u);
    }
    v20 = (void *)v9;
    if (v8 == 5)
    {
      stmt = sqlite3_next_stmt(self->_db, 0);
      if (stmt)
      {
        v13 = stmt;
        do
        {
          if (pql_pred != -1)
            dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
          v14 = (void *)pql_log;
          if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
          {
            v15 = self->_url;
            v16 = v14;
            v17 = sqlite3_sql(v13);
            *(_DWORD *)buf = 138412546;
            v22 = (PQLConnection *)v15;
            v23 = 2080;
            v24 = (uint64_t)v17;
            _os_log_impl(&dword_1D4668000, v16, OS_LOG_TYPE_ERROR, "sqlite3_close(%@) fails: [%s] isn't finalized", buf, 0x16u);

          }
          v13 = sqlite3_next_stmt(self->_db, v13);
        }
        while (v13);
      }
    }
    if (a3)
      *a3 = objc_retainAutorelease(v20);

  }
  else
  {
    if (self->_traced)
    {
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v18 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = self;
        _os_log_impl(&dword_1D4668000, v18, OS_LOG_TYPE_DEBUG, "closed %@", buf, 0xCu);
      }
    }
    -[PQLConnection _resetState](self, "_resetState");
  }
  return v8 == 0;
}

- (BOOL)backupToURL:(id)a3 progress:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSURL *url;
  BOOL v16;
  NSError *v17;
  NSError *v18;
  NSError *v20;
  NSError *lastError;
  sqlite3 *ppDb;
  uint8_t buf[4];
  NSURL *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v20;

      v16 = 0;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1285, CFSTR("Connection has been used after close (or before open)"));

  }
  if (!self->_savePointLevel)
    -[PQLConnection flush](self, "flush");
  ppDb = 0;
  while (1)
  {
    objc_msgSend(v7, "path");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    v11 = _sqlite3_db_clone();

    if (v11 != 5)
      break;
    usleep(0x186A0u);
  }
  objc_msgSend(v7, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = sqlite3_open_v2((const char *)objc_msgSend(v12, "fileSystemRepresentation"), &ppDb, 2, 0);

  if (!(_DWORD)v13)
  {
    v13 = sqlite3_wal_checkpoint_v2(ppDb, 0, 2, 0, 0);
    if (!(_DWORD)v13)
    {
      v13 = sqlite3_close(ppDb);
      ppDb = 0;
    }
  }
  if (self->_traced)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v14 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412802;
      v24 = url;
      v25 = 2112;
      v26 = v7;
      v27 = 1024;
      v28 = v13;
      _os_log_impl(&dword_1D4668000, v14, OS_LOG_TYPE_DEBUG, "finished backup from %@ to %@, rc: %d", buf, 0x1Cu);
    }
  }
  if (ppDb)
    sqlite3_close(ppDb);
  v16 = (_DWORD)v13 == 0;
  if ((_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", v13, CFSTR("backup failed"));
    v17 = (NSError *)objc_claimAutoreleasedReturnValue();
    v18 = self->_lastError;
    self->_lastError = v17;
  }
  else
  {
    v18 = self->_lastError;
    self->_lastError = 0;
  }

LABEL_23:
  return v16;
}

- (BOOL)isInBatch
{
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  return self->_batchStarted != 0;
}

- (BOOL)isInTransaction
{
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  return self->_savePointLevel > 0;
}

- (int64_t)lastInsertedRowID
{
  void *v4;
  NSError *v6;
  NSError *lastError;

  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 21, CFSTR("connection is closed"));
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      lastError = self->_lastError;
      self->_lastError = v6;

      return 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection.m"), 1359, CFSTR("Connection has been used after close (or before open)"));

  }
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  return sqlite3_last_insert_rowid(self->_db);
}

- (void)setBatchTransactionType:(int)a3
{
  if (a3 >= 3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("invalid transactionType passed: %ld"), a3);
  self->_batchTransactionType = a3;
}

- (unint64_t)synchronousMode
{
  id v2;
  unint64_t v3;

  v2 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("PRAGMA synchronous"));
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setSynchronousMode:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  uint8_t buf[16];

  if (self->_useBatching && self->_batchStarted)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v5 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4668000, v5, OS_LOG_TYPE_FAULT, "Safety level change from within a transaction", buf, 2u);
    }
  }
  switch(a3)
  {
    case 2uLL:
      v6 = CFSTR("PRAGMA synchronous = 2");
      goto LABEL_13;
    case 1uLL:
      v6 = CFSTR("PRAGMA synchronous = 1");
      goto LABEL_13;
    case 0uLL:
      v6 = CFSTR("PRAGMA synchronous = 0");
LABEL_13:
      -[PQLConnection _execute:mustSucceed:bindings:](self, "_execute:mustSucceed:bindings:", v6, 1, 0);
      return;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("invalid synchronousMode passed: %ld"), a3);
}

- (void)setAutoRollbackHandler:(id)a3
{
  id v4;
  void *v5;
  id autoRollbackHandler;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("autoRollbackHandler should not be nil"));
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x1D825FCAC](v4);
  autoRollbackHandler = self->_autoRollbackHandler;
  self->_autoRollbackHandler = v5;

}

- (BOOL)execute:(id)a3
{
  id v4;
  PQLConnection *v5;
  PQLConnection *v6;
  BOOL v7;
  PQLConnection *v8;
  PQLConnection *v9;
  uint64_t v11;

  v4 = a3;
  v5 = self;
  v6 = v5;
  if (v5->_useBatching && !v5->_batchStarted)
    -[PQLConnection _batchStartIfNeeded:](v5, "_batchStartIfNeeded:", v5->_batchTransactionType);

  v7 = -[PQLConnection _execute:mustSucceed:bindings:](v6, "_execute:mustSucceed:bindings:", v4, 0, &v11);
  v8 = v6;
  v9 = v8;
  if (v6->_useBatching && v8->_batchStarted && !v8->_skipBatchStop)
    -[PQLConnection _batchStopIfNeeded](v8, "_batchStopIfNeeded");

  return v7;
}

- (BOOL)execute:(id)a3 args:(char *)a4
{
  id v6;
  PQLConnection *v7;
  PQLConnection *v8;
  BOOL v9;
  PQLConnection *v10;
  PQLConnection *v11;

  v6 = a3;
  v7 = self;
  v8 = v7;
  if (v7->_useBatching && !v7->_batchStarted)
    -[PQLConnection _batchStartIfNeeded:](v7, "_batchStartIfNeeded:", v7->_batchTransactionType);

  v9 = -[PQLConnection _execute:mustSucceed:bindings:](v8, "_execute:mustSucceed:bindings:", v6, 0, a4);
  v10 = v8;
  v11 = v10;
  if (v8->_useBatching && v10->_batchStarted && !v10->_skipBatchStop)
    -[PQLConnection _batchStopIfNeeded](v10, "_batchStopIfNeeded");

  return v9;
}

- (BOOL)executeRaw:(id)a3
{
  id v4;
  PQLConnection *v5;
  PQLConnection *v6;
  BOOL v7;
  PQLConnection *v8;
  PQLConnection *v9;

  v4 = a3;
  v5 = self;
  v6 = v5;
  if (v5->_useBatching && !v5->_batchStarted)
    -[PQLConnection _batchStartIfNeeded:](v5, "_batchStartIfNeeded:", v5->_batchTransactionType);

  v7 = -[PQLConnection _execute:mustSucceed:bindings:](v6, "_execute:mustSucceed:bindings:", v4, 0, 0);
  v8 = v6;
  v9 = v8;
  if (v6->_useBatching && v8->_batchStarted && !v8->_skipBatchStop)
    -[PQLConnection _batchStopIfNeeded](v8, "_batchStopIfNeeded");

  return v7;
}

- (id)fetch:(id)a3
{
  id v4;
  id v5;
  PQLResultSet *v6;
  PQLResultSet *v7;
  _QWORD v9[2];
  uint64_t v10;

  v9[0] = 0;
  v4 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v9[1] = &v10;
  v5 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:](self, "_newStatementForFormat:preparationTime:arguments:", v4, v9, &v10);

  v6 = [PQLResultSet alloc];
  v7 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v6, "initWithStatement:usingDatabase:preparationTime:", v5, self, v9[0]);

  return v7;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  uint64_t v6;

  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:](self, "fetchObjectOfClass:initializer:sql:args:", a3, a4, a5, &v6);
}

- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5
{
  id v8;
  id v9;
  id v10;
  PQLResultSet *v11;
  PQLResultSet *v12;
  void *v13;
  NSError *v14;
  NSError *lastError;
  uint64_t v17;

  v8 = a4;
  v9 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v17 = 0;
  v10 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:](self, "_newStatementForFormat:preparationTime:arguments:", v8, &v17, a5);

  v11 = [PQLResultSet alloc];
  v12 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v11, "initWithStatement:usingDatabase:preparationTime:", v10, self, v17);
  -[PQLResultSet onlyObject:](v12, "onlyObject:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[PQLResultSet error](v12, "error");
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v14;

  }
  return v13;
}

- (id)fetchObject:(id)a3 sql:(id)a4
{
  id v6;
  id v7;
  id v8;
  PQLResultSet *v9;
  PQLResultSet *v10;
  void *v11;
  NSError *v12;
  NSError *lastError;
  _QWORD v15[2];
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  -[PQLConnection assertOnQueue](self, "assertOnQueue");
  v15[0] = 0;
  v15[1] = &v16;
  v8 = -[PQLConnection _newStatementForFormat:preparationTime:arguments:](self, "_newStatementForFormat:preparationTime:arguments:", v6, v15, &v16);

  v9 = [PQLResultSet alloc];
  v10 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v9, "initWithStatement:usingDatabase:preparationTime:", v8, self, v15[0]);
  -[PQLResultSet onlyObject:](v10, "onlyObject:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[PQLResultSet error](v10, "error");
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v12;

  }
  return v11;
}

- (id)userVersion
{
  return -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("PRAGMA user_version"));
}

- (BOOL)setUserVersion:(int64_t)a3
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA user_version = %ld"), a3);
  ++self->_suspendCaching;
  v5 = -[PQLConnection executeRaw:](self, "executeRaw:", v4);
  --self->_suspendCaching;

  return v5;
}

- (int64_t)autovacuumableSpaceInBytes
{
  id v3;
  id v4;
  uint64_t v5;
  int64_t v6;

  v3 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("pragma freelist_count"));
  v4 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("pragma page_size"));
  v5 = objc_msgSend(v3, "integerValue");
  v6 = objc_msgSend(v4, "integerValue") * v5;

  return v6;
}

- (BOOL)incrementalVacuum:(int64_t)a3
{
  id v5;
  BOOL v6;

  v5 = -[PQLConnection fetchObjectOfClass:sql:](self, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("pragma page_size"));
  if (objc_msgSend(v5, "integerValue"))
    v6 = -[PQLConnection _incrementalVacuum:](self, "_incrementalVacuum:", a3 / objc_msgSend(v5, "integerValue"));
  else
    v6 = 0;

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)url
{
  return self->_url;
}

- (id)lockedHandler
{
  return self->_lockedHandler;
}

- (void)setLockedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)busyHandler
{
  return self->_busyHandler;
}

- (void)setBusyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)autoRollbackHandler
{
  return self->_autoRollbackHandler;
}

- (id)sqliteErrorHandler
{
  return self->_sqliteErrorHandler;
}

- (void)setSqliteErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)preFlushHook
{
  return self->_preFlushHook;
}

- (void)setPreFlushHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)postFlushHook
{
  return self->_postFlushHook;
}

- (void)setPostFlushHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setProfilingHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setProfilingHookV2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)willBeginBatchingHook
{
  return self->_willBeginBatchingHook;
}

- (void)setWillBeginBatchingHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)didFinishBatchingHook
{
  return self->_didFinishBatchingHook;
}

- (void)setDidFinishBatchingHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (BOOL)crashIfUsedAfterClose
{
  return self->_crashIfUsedAfterClose;
}

- (void)setCrashIfUsedAfterClose:(BOOL)a3
{
  self->_crashIfUsedAfterClose = a3;
}

- (int)batchTransactionType
{
  return self->_batchTransactionType;
}

- (BOOL)shouldUseWALJournalMode
{
  return self->_shouldUseWALJournalMode;
}

- (void)setShouldUseWALJournalMode:(BOOL)a3
{
  self->_shouldUseWALJournalMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_didFinishBatchingHook, 0);
  objc_storeStrong(&self->_willBeginBatchingHook, 0);
  objc_storeStrong(&self->_profilingHookV2, 0);
  objc_storeStrong(&self->_profilingHook, 0);
  objc_storeStrong(&self->_postFlushHook, 0);
  objc_storeStrong(&self->_preFlushHook, 0);
  objc_storeStrong(&self->_sqliteErrorHandler, 0);
  objc_storeStrong(&self->_autoRollbackHandler, 0);
  objc_storeStrong(&self->_busyHandler, 0);
  objc_storeStrong(&self->_lockedHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_stmtCacheCleanupQueue, 0);
  objc_storeStrong((id *)&self->_stmtCacheSource, 0);
  objc_storeStrong((id *)&self->_batchingTimer, 0);
  objc_storeStrong(&self->_batchingPolicyHandler, 0);
  objc_storeStrong((id *)&self->_flushNotifications, 0);
  objc_storeStrong((id *)&self->_batchStarted, 0);
}

- (BOOL)executeSwift:(id)a3 error:(id *)a4
{
  id v6;
  PQLConnection *v7;
  PQLConnection *v8;
  BOOL v9;
  PQLConnection *v10;
  PQLConnection *v11;
  uint64_t v13;

  v13 = 0;
  v6 = -[PQLConnection _newStatementForBuilder:preparationTime:](self, "_newStatementForBuilder:preparationTime:", a3, &v13);
  if (!v6)
  {
    v9 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  v7 = self;
  v8 = v7;
  if (v7->_useBatching && !v7->_batchStarted)
    -[PQLConnection _batchStartIfNeeded:](v7, "_batchStartIfNeeded:", v7->_batchTransactionType);

  v9 = -[PQLConnection _executeStmt:mustSucceed:preparationTime:](v8, "_executeStmt:mustSucceed:preparationTime:", v6, 0, v13);
  v10 = v8;
  v11 = v10;
  if (v8->_useBatching && v10->_batchStarted && !v10->_skipBatchStop)
    -[PQLConnection _batchStopIfNeeded](v10, "_batchStopIfNeeded");

  if (a4)
  {
LABEL_12:
    if (!v9)
      *a4 = objc_retainAutorelease(self->_lastError);
  }
LABEL_14:

  return v9;
}

- (id)fetchObjectOfClassSwift:(Class)a3 query:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PQLResultSet *v10;
  PQLResultSet *v11;
  void *v12;
  NSError *v13;
  NSError *lastError;
  NSError *v15;
  uint64_t v17;

  v8 = a4;
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  v17 = 0;
  v9 = -[PQLConnection _newStatementForBuilder:preparationTime:](self, "_newStatementForBuilder:preparationTime:", v8, &v17);
  v10 = [PQLResultSet alloc];
  v11 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v10, "initWithStatement:usingDatabase:preparationTime:", v9, self, v17);
  -[PQLResultSet onlyObjectOfClass:initializer:](v11, "onlyObjectOfClass:initializer:", a3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[PQLResultSet error](v11, "error");
    v13 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v13;

    v15 = self->_lastError;
    if (!v15)
      -[PQLConnection(Swift) fetchObjectOfClassSwift:query:error:].cold.1();
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }

  return v12;
}

- (id)fetchObjectSwift:(id)a3 query:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  PQLResultSet *v11;
  PQLResultSet *v12;
  void *v13;
  NSError *v14;
  NSError *lastError;
  NSError *v16;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  if (self->_useQueue)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  v18 = 0;
  v10 = -[PQLConnection _newStatementForBuilder:preparationTime:](self, "_newStatementForBuilder:preparationTime:", v9, &v18);
  v11 = [PQLResultSet alloc];
  v12 = -[PQLResultSet initWithStatement:usingDatabase:preparationTime:](v11, "initWithStatement:usingDatabase:preparationTime:", v10, self, v18);
  -[PQLResultSet onlyObject:](v12, "onlyObject:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[PQLResultSet error](v12, "error");
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v14;

    v16 = self->_lastError;
    if (!v16)
      -[PQLConnection(Swift) fetchObjectSwift:query:error:].cold.1();
    if (a5)
      *a5 = objc_retainAutorelease(v16);
  }

  return v13;
}

- (void)_batchStartIfNeeded:.cold.1()
{
  __assert_rtn("-[PQLConnection _batchStartIfNeeded:]", "PQLConnection.m", 445, "_useBatching && !_batchStarted");
}

- (void)_performWithFlags:action:whenFlushed:.cold.1()
{
  __assert_rtn("-[PQLConnection _performWithFlags:action:whenFlushed:]", "PQLConnection.m", 927, "_flushNotifications == nil");
}

@end
