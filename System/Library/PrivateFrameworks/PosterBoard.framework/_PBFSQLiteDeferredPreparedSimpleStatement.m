@implementation _PBFSQLiteDeferredPreparedSimpleStatement

- (id)initWithDatabaseConnection:(void *)a3 deferredSql:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithDatabaseConnection_deferredSql_, a1, CFSTR("PBFSQLitePreparedStatement.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sql"));

    }
    a1 = -[_PBFSQLitePreparedSimpleStatement _initWithDatabaseConnection:statement:](a1, v5, 0);
    if (a1)
    {
      v8 = objc_msgSend(v7, "copy");
      v9 = a1[4];
      a1[4] = (id)v8;

    }
  }

  return a1;
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  int v13;
  BOOL v14;
  objc_super v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v9 = a3;
  v10 = a4;
  if (self->_deferredSql)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._dbConnection);
    v12 = WeakRetained;
    if (!WeakRetained)
    {
      v13 = 21;
      *((_DWORD *)v19 + 6) = 21;
      if (!a5)
      {
LABEL_8:

        _Block_object_dispose(&v18, 8);
LABEL_12:
        v14 = 0;
        goto LABEL_13;
      }
LABEL_7:
      -[_PBFSQLitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __88___PBFSQLiteDeferredPreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v17[3] = &unk_1E86F6BE8;
    v17[4] = self;
    v17[5] = &v18;
    v17[6] = a2;
    -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, v17);
    v13 = *((_DWORD *)v19 + 6);
    if (v13)
    {
      if (!a5)
        goto LABEL_8;
      goto LABEL_7;
    }

    _Block_object_dispose(&v18, 8);
  }
  if (!self->super._statement)
    goto LABEL_12;
  v16.receiver = self;
  v16.super_class = (Class)_PBFSQLiteDeferredPreparedSimpleStatement;
  v14 = -[_PBFSQLitePreparedSimpleStatement executeWithBindings:resultRowHandler:error:](&v16, sel_executeWithBindings_resultRowHandler_error_, v9, v10, a5);
LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredSql, 0);
}

@end
