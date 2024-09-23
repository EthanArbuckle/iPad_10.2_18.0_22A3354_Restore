@implementation _PBFSQLitePreparedSimpleStatement

- (id)_initWithDatabaseConnection:(void *)a3 statement:
{
  id *v4;
  id *v5;
  id WeakRetained;

  if (!a1)
    return 0;
  v4 = -[PBFSQLitePreparedStatement _initWithDatabaseConnection:](a1, a2);
  v5 = v4;
  if (v4)
  {
    v4[3] = a3;
    WeakRetained = objc_loadWeakRetained(v4 + 1);
    objc_msgSend(WeakRetained, "addObserver:", v5);

  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  sqlite3_stmt *statement;
  objc_super v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  statement = self->_statement;
  if (statement)
  {
    if (WeakRetained)
    {
      self->_statement = 0;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __44___PBFSQLitePreparedSimpleStatement_dealloc__block_invoke;
      v6[3] = &__block_descriptor_40_e18_v16__0__sqlite3__8l;
      v6[4] = statement;
      -[PBFSQLiteDatabaseConnection performWithDatabase:]((uint64_t)WeakRetained, v6);
    }
    else
    {
      sqlite3_finalize(statement);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)_PBFSQLitePreparedSimpleStatement;
  -[PBFSQLitePreparedStatement dealloc](&v5, sel_dealloc);
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  int v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  if (WeakRetained && self->_statement)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80___PBFSQLitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v14[3] = &unk_1E86F6BC0;
    v17 = &v18;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, v14);

    v11 = *((_DWORD *)v19 + 6);
    if (!a5)
      goto LABEL_8;
  }
  else
  {
    v11 = 21;
    *((_DWORD *)v19 + 6) = 21;
    if (!a5)
      goto LABEL_8;
  }
  if (v11)
  {
    -[_PBFSQLitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *((_DWORD *)v19 + 6);
  }
LABEL_8:
  v12 = v11 == 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (uint64_t)_bindKey:(void *)a3 value:
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)(a1 + 24), (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    if (v7)
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 24), v8);
LABEL_12:
        a1 = v9;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 24), v8, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[_PBFSQLitePreparedSimpleStatement _bindParameterIndex:numberValue:]((sqlite3_stmt **)a1, v8, v6);
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[_PBFSQLitePreparedSimpleStatement _bindParameterIndex:dataValue:](a1, v8, v6);
        goto LABEL_12;
      }
      objc_msgSend((id)a1, "loggingCategory");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_PBFSQLitePreparedSimpleStatement _bindKey:value:].cold.1((uint64_t)v6, v11);

      a1 = 20;
    }
    else
    {
      a1 = 0;
    }
  }
LABEL_13:

  return a1;
}

- (id)_sqliteError:(uint64_t)a1
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "lastErrorMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.pbfSQLitePreparedStatementErrorDomain"), a2, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)sqliteDatabaseConnectionWillClose:(id)a3
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
  {
    sqlite3_finalize(statement);
    self->_statement = 0;
  }
  objc_storeWeak((id *)&self->super._dbConnection, 0);
}

- (uint64_t)_bindParameterIndex:(uint64_t)result nullValue:(int)a2
{
  if (result)
    return sqlite3_bind_null(*(sqlite3_stmt **)(result + 24), a2);
  return result;
}

- (uint64_t)_bindParameterIndex:(id)a3 stringValue:
{
  if (result)
    return sqlite3_bind_text(*(sqlite3_stmt **)(result + 24), a2, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return result;
}

- (uint64_t)_bindParameterIndex:(void *)a3 numberValue:
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  sqlite3_stmt *v14;
  double v15;

  v5 = a3;
  v6 = v5;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "objCType");
  if (strlen(v8) != 1)
  {
    objc_msgSend(a1, "loggingCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 20;
      goto LABEL_10;
    }
LABEL_8:
    -[_PBFSQLitePreparedSimpleStatement _bindParameterIndex:numberValue:].cold.1();
    goto LABEL_9;
  }
  v9 = *v8 - 66;
  if (v9 > 0x31)
  {
LABEL_13:
    objc_msgSend(a1, "loggingCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_8;
  }
  if (((1 << v9) & 0x2848200028483) == 0)
  {
    if (((1 << v9) & 0x1400000000) != 0)
    {
      v14 = a1[3];
      objc_msgSend(v7, "doubleValue");
      v10 = sqlite3_bind_double(v14, a2, v15);
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  v10 = sqlite3_bind_int64(a1[3], a2, objc_msgSend(v7, "longLongValue"));
LABEL_6:
  v11 = v10;
LABEL_10:

  return v11;
}

- (uint64_t)_bindParameterIndex:(id)a3 dataValue:
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  sqlite3_uint64 v11;

  if (result)
  {
    v4 = result;
    v5 = objc_retainAutorelease(a3);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v5, "length");

    v8 = v5 != 0;
    v9 = v6 == 0;
    if (v8 && v9)
      v10 = 3735936685;
    else
      v10 = v6;
    if (v8 && v9)
      v11 = 0;
    else
      v11 = v7;
    return sqlite3_bind_blob64(*(sqlite3_stmt **)(v4 + 24), a2, (const void *)v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (void)_bindKey:(uint64_t)a1 value:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 136315650;
  v5 = "-[_PBFSQLitePreparedSimpleStatement _bindKey:value:]";
  v6 = 2112;
  v7 = a1;
  v8 = 2112;
  v9 = (id)objc_opt_class();
  v3 = v9;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "%s: unexpected object %@ of class %@", (uint8_t *)&v4, 0x20u);

}

- (void)_bindParameterIndex:numberValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_14_0(&dword_1CB9FA000, v0, v1, "%s: unexpected value type '%{public}s' for object %@", v2);
}

@end
