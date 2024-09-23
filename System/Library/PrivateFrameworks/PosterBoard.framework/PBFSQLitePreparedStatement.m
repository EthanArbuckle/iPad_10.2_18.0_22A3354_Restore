@implementation PBFSQLitePreparedStatement

- (id)_initWithDatabaseConnection:(id *)a1
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v8;
  objc_super v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithDatabaseConnection_, a1, CFSTR("PBFSQLitePreparedStatement.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    }
    v9.receiver = a1;
    v9.super_class = (Class)PBFSQLitePreparedStatement;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak(v5 + 1, v4);
      BSLogCommon();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setLoggingCategory:", v6);

    }
  }

  return a1;
}

- (PBFSQLitePreparedStatement)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLitePreparedStatement.m"), 79, CFSTR("init is not allowed"));

  return (PBFSQLitePreparedStatement *)-[PBFSQLitePreparedStatement _initWithDatabaseConnection:]((id *)&self->super.isa, 0);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_dbConnection, 0);
  v3.receiver = self;
  v3.super_class = (Class)PBFSQLitePreparedStatement;
  -[PBFSQLitePreparedStatement dealloc](&v3, sel_dealloc);
}

+ (id)_newPreparedStatementForDatabaseConnection:(void *)a3 withSQLQuery:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, CFSTR("PBFSQLitePreparedStatement.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, CFSTR("PBFSQLitePreparedStatement.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sqlQuery"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__PBFSQLitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke;
  v13[3] = &unk_1E86F6B78;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  v16 = &v17;
  -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)v8, v13);
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __86__PBFSQLitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke(uint64_t a1, sqlite3 *a2)
{
  const char *v4;
  id v5;
  int v6;
  id v7;
  id *v8;
  id *v9;
  _PBFSQLitePreparedSimpleStatement *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  sqlite3_stmt *ppStmt;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v14 = 0;
  ppStmt = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v4)
    goto LABEL_15;
  if (!*v4)
  {
    v4 = 0;
LABEL_11:
    if (v4)
      goto LABEL_12;
    goto LABEL_15;
  }
  while (1)
  {
    v6 = strlen(v4);
    if (!sqlite3_prepare_v2(a2, v4, v6, &ppStmt, &v14))
    {
      v10 = [_PBFSQLitePreparedSimpleStatement alloc];
      v8 = -[_PBFSQLitePreparedSimpleStatement _initWithDatabaseConnection:statement:]((id *)&v10->super.super.isa, *(void **)(a1 + 40), ppStmt);
      objc_msgSend(v5, "addObject:", v8);
      goto LABEL_7;
    }
    if (v14 <= v4)
      break;
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (id *)objc_msgSend(v7, "initWithBytes:length:encoding:", v4, v14 - v4, 4);
    v9 = -[_PBFSQLiteDeferredPreparedSimpleStatement initWithDatabaseConnection:deferredSql:]((id *)[_PBFSQLiteDeferredPreparedSimpleStatement alloc], *(void **)(a1 + 40), v8);
    objc_msgSend(v5, "addObject:", v9);

LABEL_7:
    v4 = v14;
    if (!v14)
      goto LABEL_15;
    if (!*v14)
      goto LABEL_11;
  }
  v4 = v14;
  if (!v14)
    goto LABEL_15;
LABEL_12:
  if (!*v4)
  {
LABEL_15:
    if (objc_msgSend(v5, "count", v14) == 1)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (uint64_t)-[_PBFSQLitePreparedCompoundStatement initWithDatabaseConnection:statements:]((id *)[_PBFSQLitePreparedCompoundStatement alloc], *(void **)(a1 + 40), v5);
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLitePreparedStatement.m"), 139, CFSTR("Abstract class implementation should never be called"));

  return 0;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (void)setLoggingCategory:(id)a3
{
  self->_loggingCategory = (OS_os_log *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dbConnection);
}

@end
