@implementation PQLStatement

- (BOOL)_prepare:(const char *)a3 withDB:(id)a4 preparationTime:(unint64_t *)a5
{
  _QWORD *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;

  v8 = a4;
  v8[1] = mach_absolute_time();
  v9 = sqlite3_prepare_v2((sqlite3 *)objc_msgSend(v8, "dbHandle"), a3, -1, &self->_stmt, 0);
  if (a5)
    *a5 = mach_absolute_time() - v8[1];
  v8[1] = 0;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = objc_msgSend(v8, "dbHandle");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorForDB:SQL:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastError:", v13);

    objc_msgSend(v8, "sqliteErrorHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "sqliteErrorHandler");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD *, PQLStatement *, void *))v15)[2](v15, v8, self, v16);

    }
  }

  return v9 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliveBinds, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

- (void)unbindForDB:(id)a3 returnedRows:(unint64_t)a4 executionTime:(unint64_t)a5 preparationTime:(unint64_t)a6
{
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  PQLStatementMetricsData *v13;
  sqlite3_stmt *stmt;
  double v15;
  PQLStatementMetricsData *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  sqlite3_stmt *v18;
  NSMutableArray *aliveBinds;
  id v20;

  v20 = a3;
  if (self->_stmt)
  {
    if (self->_inUse)
    {
      objc_msgSend(v20, "profilingHook");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v20, "profilingHook");
        v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, sqlite3_stmt *, unint64_t))v11)[2](v11, v20, self->_stmt, a4);

      }
      if (self->_inUse)
      {
        objc_msgSend(v20, "profilingHookV2");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = [PQLStatementMetricsData alloc];
          stmt = self->_stmt;
          v15 = timeInSeconds(a5);
          v16 = -[PQLStatementMetricsData initWithStmt:returnedRows:executionTime:preparationTime:](v13, "initWithStmt:returnedRows:executionTime:preparationTime:", stmt, a4, v15, timeInSeconds(a6));
          objc_msgSend(v20, "profilingHookV2");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, PQLStatementMetricsData *))v17)[2](v17, v20, v16);

        }
      }
    }
    v18 = self->_stmt;
    sqlite3_reset(v18);
    sqlite3_stmt_status(v18, 1, 1);
    sqlite3_stmt_status(v18, 2, 1);
    sqlite3_stmt_status(v18, 3, 1);
    sqlite3_stmt_status(v18, 4, 1);
    sqlite3_clear_bindings(self->_stmt);
  }
  aliveBinds = self->_aliveBinds;
  self->_aliveBinds = 0;

  self->_inUse = 0;
}

- (PQLStatement)initWithQueryBuilder:(id)a3 db:(id)a4 cache:(cache_s *)a5 preparationTime:(unint64_t *)a6
{
  void (**v10)(id, PQLQueryBuilder *);
  id v11;
  PQLStatement *v12;
  PQLStatement *v13;
  PQLQueryBuilder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PQLStatement *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  PQLStatement *v25;
  NSObject *v26;
  PQLStatement *next;
  PQLStatement *v28;
  PQLStatement *v29;
  void *value_out;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  PQLStatement *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, PQLQueryBuilder *))a3;
  v11 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PQLStatement;
  v12 = -[PQLStatement init](&v32, sel_init);
  if (v12)
  {
    v13 = v12;
    v14 = objc_alloc_init(PQLQueryBuilder);
    v10[2](v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    value_out = 0;
    -[PQLQueryBuilder lastError](v14, "lastError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PQLQueryBuilder lastError](v14, "lastError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastError:", v17);

      v18 = 0;
LABEL_23:
      v19 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v13->_isTraced = objc_msgSend(v11, "isTraced");
    -[PQLStatement translate:withBuilder:](v13, "translate:withBuilder:", v15, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13->_isTraced)
    {
      v20 = (void *)MEMORY[0x1D825FB2C]();
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v21 = (void *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        v22 = v21;
        v23 = objc_msgSend(v18, "bytes");
        *(_DWORD *)buf = 138412546;
        v34 = v15;
        v35 = 2080;
        v36 = (PQLStatement *)v23;
        _os_log_impl(&dword_1D4668000, v22, OS_LOG_TYPE_DEBUG, "translated statement with injections\nsql:   %@\ntrans: %s", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    if (!a5 || cache_get_and_retain(a5, v18, &value_out))
      goto LABEL_13;
    v25 = (PQLStatement *)CFRetain(value_out);
    cache_release_value(a5, value_out);
    if (v13->_isTraced)
    {
      if (pql_pred != -1)
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      v26 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v15;
        v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_1D4668000, v26, OS_LOG_TYPE_DEBUG, "found cached statement with injections\nsql:  %@\nstmt: %@", buf, 0x16u);
      }
    }
    if (!v25)
    {
LABEL_13:
      if (!-[PQLStatement _prepare:withDB:preparationTime:](v13, "_prepare:withDB:preparationTime:", objc_msgSend(v18, "bytes"), v11, a6))goto LABEL_23;
      if (a5 && !cache_set_and_retain(a5, v18, v13, 0))
      {
        if (v13->_isTraced)
        {
          if (pql_pred != -1)
            dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
          v24 = pql_log;
          if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v15;
            v35 = 2112;
            v36 = v13;
            _os_log_impl(&dword_1D4668000, v24, OS_LOG_TYPE_DEBUG, "cached statement with injections\nsql:  %@\nstmt: %@", buf, 0x16u);
          }
        }
        cache_release_value(a5, v13);
      }
      v25 = v13;
    }
    if (v25->_inUse)
    {
      while (1)
      {
        next = v25->_next;
        if (!next)
          break;
        v19 = next;

        v25 = v19;
        if (!v19->_inUse)
          goto LABEL_36;
      }
      v28 = -[PQLStatement initWithStatement:forDB:preparationTime:]([PQLStatement alloc], "initWithStatement:forDB:preparationTime:", v25, v11, a6);
      v29 = v25->_next;
      v25->_next = v28;

      v19 = v28;
    }
    else
    {
      v19 = v25;
    }
LABEL_36:
    -[PQLStatement bindFromArray:db:](v19, "bindFromArray:db:", v14->_parameters, v11);
    goto LABEL_37;
  }
  v19 = 0;
LABEL_38:

  return v19;
}

- (void)bindFromArray:(id)a3 db:(id)a4
{
  id v7;
  id v8;
  $B640FA5AF0A9E956D46B4BA9A7C3BCE7 *p_specUnion;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  sqlite3_stmt *stmt;
  id v15;
  const __CFString *v16;
  sqlite3_stmt *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  sqlite3_stmt *v22;
  const __CFString *v23;
  sqlite3_stmt *v24;
  sqlite3_int64 v25;
  const __CFString *v26;
  const __CFString *v27;
  sqlite3_stmt *v28;
  double v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  PQLStatement *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!self->_stmt)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLStatement.m"), 705, CFSTR("cannot bind a closed statement"));

  }
  if (self->_inUse)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLStatement.m"), 706, CFSTR("cannot bind a statement in use"));

  }
  p_specUnion = &self->_specUnion;
  if (self->_specLength >= 9)
    p_specUnion = ($B640FA5AF0A9E956D46B4BA9A7C3BCE7 *)p_specUnion->ptr;
  self->_inUse = 1;
  if (objc_msgSend(v8, "isTraced"))
    v10 = (void *)objc_opt_new();
  else
    v10 = 0;
  if (self->_specLength >= 1)
  {
    v11 = 0;
    v12 = 1;
    do
    {
      switch(p_specUnion->inlined[v11])
      {
        case 0u:
          if (v10)
          {
            if (objc_msgSend(v10, "length"))
              v13 = CFSTR(", %s");
            else
              v13 = CFSTR("%s");
            objc_msgSend(v10, "appendFormat:", v13, "INT");
          }
          stmt = self->_stmt;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          sqlite3_bind_int(stmt, v12, objc_msgSend(v15, "intValue"));
          goto LABEL_56;
        case 1u:
          if (v10)
          {
            if (objc_msgSend(v10, "length"))
              v23 = CFSTR(", %s");
            else
              v23 = CFSTR("%s");
            objc_msgSend(v10, "appendFormat:", v23, "UINT");
          }
          v24 = self->_stmt;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v15, "unsignedIntValue");
          goto LABEL_43;
        case 2u:
          if (v10)
          {
            if (objc_msgSend(v10, "length"))
              v26 = CFSTR(", %s");
            else
              v26 = CFSTR("%s");
            objc_msgSend(v10, "appendFormat:", v26, "INT64");
          }
          v24 = self->_stmt;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v15, "longLongValue");
LABEL_43:
          sqlite3_bind_int64(v24, v12, v25);
          goto LABEL_56;
        case 3u:
          if (v10)
          {
            if (objc_msgSend(v10, "length"))
              v27 = CFSTR(", %s");
            else
              v27 = CFSTR("%s");
            objc_msgSend(v10, "appendFormat:", v27, "DOUBLE");
          }
          v28 = self->_stmt;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          sqlite3_bind_double(v28, v12, v29);
          goto LABEL_56;
        case 4u:
          if (v10)
          {
            if (objc_msgSend(v10, "length"))
              v16 = CFSTR(", %s");
            else
              v16 = CFSTR("%s");
            objc_msgSend(v10, "appendFormat:", v16, "TEXT");
          }
          v17 = self->_stmt;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          sqlite3_bind_text(v17, v12, (const char *)objc_msgSend(v15, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_56;
        case 5u:
        case 6u:
        case 8u:
          abort();
        case 7u:
          if (v10)
          {
            v18 = objc_msgSend(v10, "length");
            objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            if (v18)
              v21 = CFSTR(", %s(%@)");
            else
              v21 = CFSTR("%s(%@)");
            objc_msgSend(v10, "appendFormat:", v21, "OBJECT", v19);

          }
          v22 = self->_stmt;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          pql_bind_object(v22, v12, v15);
          goto LABEL_56;
        case 9u:
          if (v10)
          {
            if (objc_msgSend(v10, "length"))
              v30 = CFSTR(", %s");
            else
              v30 = CFSTR("%s");
            objc_msgSend(v10, "appendFormat:", v30, "BLOCK");
          }
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (id)objc_msgSend(v31, "copy");

          -[PQLStatement keepBindAlive:](self, "keepBindAlive:", v15);
          pql_sqlite3_bind_pointer(self->_stmt, v12, (sqlite3_int64)v15);
LABEL_56:
          v12 = (v12 + 1);

          break;
        default:
          break;
      }
      ++v11;
    }
    while (v11 < self->_specLength);
  }
  if (v10)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v32 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1D4668000, v32, OS_LOG_TYPE_DEBUG, "binding values to statement\nstmt: %@\nbinding: [%@]", buf, 0x16u);
    }
  }

}

- (id)translate:(id)a3 withBuilder:(id)a4
{
  id v6;
  signed __int16 *v7;
  id v8;
  const char *v9;
  size_t v10;
  void *v11;
  int v12;
  size_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;

  v6 = a3;
  v7 = (signed __int16 *)a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = strlen(v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", strlen(v9) + v7[508] + 1);
  v12 = v7[508];
  v13 = (unsigned __int16)v7[508];
  self->_specLength = v7[508];
  if (v12 < 9)
  {
    memcpy(&self->_specUnion, v7 + 8, (__int16)v13);
  }
  else
  {
    v14 = (unsigned __int8 *)malloc_type_malloc(v13, 0x853F0B0AuLL);
    if (!v14)
      abort();
    v15 = v14;
    memcpy(v14, v7 + 8, v13);
    self->_specUnion.ptr = v15;
  }
  objc_msgSend(v11, "appendBytes:length:", v9, v10 + 1);
  objc_msgSend(v11, "appendBytes:length:", v7 + 8, v7[508]);

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PQLStatement invalidate](self, "invalidate");
  if (self->_specLength >= 9)
    free(self->_specUnion.ptr);
  v3.receiver = self;
  v3.super_class = (Class)PQLStatement;
  -[PQLStatement dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSMutableArray *aliveBinds;

  sqlite3_finalize(self->_stmt);
  self->_stmt = 0;
  aliveBinds = self->_aliveBinds;
  self->_aliveBinds = 0;

}

- (PQLStatement)initWithFormat:(id)a3 arguments:(char *)a4 db:(id)a5 cache:(cache_s *)a6 preparationTime:(unint64_t *)a7
{
  char *v12;
  id v13;
  PQLStatement *v14;
  PQLStatement *v15;
  PQLStatement *v16;
  char *v17;
  void *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  _BYTE *v23;
  NSObject *v24;
  PQLStatement *v25;
  char *v26;
  NSObject *v27;
  const char *v28;
  PQLStatement *next;
  PQLStatement *v30;
  PQLStatement *v31;
  NSObject *v33;
  CFTypeRef cf;
  char *v35;
  char v36;
  objc_super v37;
  char *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  _BYTE *v42;
  __int16 v43;
  PQLStatement *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = (char *)a3;
  v38 = a4;
  v13 = a5;
  v37.receiver = self;
  v37.super_class = (Class)PQLStatement;
  v14 = -[PQLStatement init](&v37, sel_init);
  if (v14)
  {
    v15 = v14;
    v36 = 0;
    cf = 0;
    v35 = 0;
    v14->_isTraced = objc_msgSend(v13, "isTraced");
    if (a6 && !cache_get_and_retain(a6, v12, (void **)&cf))
    {
      v23 = CFRetain(cf);
      cache_release_value(a6, (void *)cf);
      if (v15->_isTraced)
      {
        if (pql_pred != -1)
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        v24 = pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v12;
          v41 = 2112;
          v42 = v23;
          _os_log_impl(&dword_1D4668000, v24, OS_LOG_TYPE_DEBUG, "found cached statement without injections\nsql:  %@\nstmt: %@", buf, 0x16u);
        }
      }
      v17 = 0;
    }
    else
    {
      if (v38)
        v35 = v38;
      v17 = -[PQLStatement translate:hasInjections:arguments:](v15, "translate:hasInjections:arguments:", v12, &v36);
      if (v15->_isTraced)
      {
        v18 = (void *)MEMORY[0x1D825FB2C]();
        if (pql_pred != -1)
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        v19 = (void *)pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          if (v36)
            v20 = "";
          else
            v20 = "out";
          v21 = v19;
          v22 = objc_msgSend(v17, "bytes");
          *(_DWORD *)buf = 136315650;
          v40 = v20;
          v41 = 2112;
          v42 = v12;
          v43 = 2080;
          v44 = (PQLStatement *)v22;
          _os_log_impl(&dword_1D4668000, v21, OS_LOG_TYPE_DEBUG, "translated statement with%s injections\nsql:   %@\ntrans: %s", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
      }
      v23 = 0;
      if (!a6)
        goto LABEL_26;
    }
    if (v36 && !cache_get_and_retain(a6, v17, (void **)&cf))
    {
      v25 = (PQLStatement *)CFRetain(cf);

      cache_release_value(a6, (void *)cf);
      if (v15->_isTraced)
      {
        if (pql_pred != -1)
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        v33 = pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v12;
          v41 = 2112;
          v42 = v25;
          _os_log_impl(&dword_1D4668000, v33, OS_LOG_TYPE_DEBUG, "found cached statement with injections\nsql:  %@\nstmt: %@", buf, 0x16u);
        }
      }
LABEL_27:
      if (!v25)
      {
        if (!-[PQLStatement _prepare:withDB:preparationTime:](v15, "_prepare:withDB:preparationTime:", objc_msgSend(v17, "bytes"), v13, a7))
        {
          v16 = 0;
LABEL_51:

          goto LABEL_52;
        }
        if (a6)
        {
          v26 = v36 ? v17 : v12;
          if (!cache_set_and_retain(a6, v26, v15, 0))
          {
            if (v15->_isTraced)
            {
              if (pql_pred != -1)
                dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
              v27 = pql_log;
              if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                if (v36)
                  v28 = "";
                else
                  v28 = "out";
                v40 = v28;
                v41 = 2112;
                v42 = v12;
                v43 = 2112;
                v44 = v15;
                _os_log_impl(&dword_1D4668000, v27, OS_LOG_TYPE_DEBUG, "cached statement with%s injections\nsql:  %@\nstmt: %@", buf, 0x20u);
              }
            }
            cache_release_value(a6, v15);
          }
        }
        v25 = v15;
      }
      if (v25->_inUse)
      {
        while (1)
        {
          next = v25->_next;
          if (!next)
            break;
          v16 = next;

          v25 = v16;
          if (!v16->_inUse)
            goto LABEL_50;
        }
        v30 = -[PQLStatement initWithStatement:forDB:preparationTime:]([PQLStatement alloc], "initWithStatement:forDB:preparationTime:", v25, v13, a7);
        v31 = v25->_next;
        v25->_next = v30;

        v16 = v30;
      }
      else
      {
        v16 = v25;
      }
LABEL_50:
      -[PQLStatement bindArguments:db:](v16, "bindArguments:db:", v38, v13);
      goto LABEL_51;
    }
LABEL_26:
    v25 = (PQLStatement *)v23;
    goto LABEL_27;
  }
  v16 = 0;
LABEL_52:

  return v16;
}

- (void)bindArguments:(char *)a3 db:(id)a4
{
  id v6;
  int specLength;
  $B640FA5AF0A9E956D46B4BA9A7C3BCE7 *ptr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  id v13;
  sqlite3_stmt *stmt;
  char *v15;
  sqlite3_int64 v16;
  char *v17;
  double *v18;
  char *v19;
  const char *v20;
  sqlite3_stmt *v21;
  int v22;
  int v23;
  char *v24;
  const char *v25;
  char *v26;
  int v27;
  const char *v28;
  const char *v29;
  char *v30;
  char *v31;
  void *v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;

  v6 = a4;
  if (!self->_stmt)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLStatement.m"), 427, CFSTR("cannot bind a closed statement"));

  }
  if (self->_inUse)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLStatement.m"), 428, CFSTR("cannot bind a statement in use"));

  }
  specLength = self->_specLength;
  if (specLength >= 9)
  {
    ptr = ($B640FA5AF0A9E956D46B4BA9A7C3BCE7 *)self->_specUnion.ptr;
    self->_inUse = 1;
LABEL_9:
    v9 = 0;
    v10 = 1;
    while (2)
    {
      switch(ptr->inlined[v9])
      {
        case 0u:
          v11 = (v10 + 1);
          v12 = (int *)a3;
          a3 += 8;
          sqlite3_bind_int(self->_stmt, v10, *v12);
          goto LABEL_33;
        case 1u:
          stmt = self->_stmt;
          v11 = (v10 + 1);
          v15 = a3;
          a3 += 8;
          v16 = *(unsigned int *)v15;
          goto LABEL_15;
        case 2u:
          stmt = self->_stmt;
          v11 = (v10 + 1);
          v17 = a3;
          a3 += 8;
          v16 = *(_QWORD *)v17;
LABEL_15:
          sqlite3_bind_int64(stmt, v10, v16);
          goto LABEL_33;
        case 3u:
          v11 = (v10 + 1);
          v18 = (double *)a3;
          a3 += 8;
          sqlite3_bind_double(self->_stmt, v10, *v18);
          goto LABEL_33;
        case 4u:
          v19 = a3;
          a3 += 8;
          v20 = *(const char **)v19;
          v21 = self->_stmt;
          v11 = (v10 + 1);
          v22 = v10;
          if (*(_QWORD *)v19)
          {
            v23 = -1;
LABEL_23:
            sqlite3_bind_text(v21, v22, v20, v23, 0);
          }
          else
          {
            sqlite3_bind_null(v21, v10);
          }
LABEL_33:
          v13 = 0;
          v10 = v11;
LABEL_34:

          if (++v9 >= self->_specLength)
            goto LABEL_35;
          continue;
        case 5u:
          v24 = a3;
          v23 = *(_DWORD *)a3;
          a3 += 16;
          v25 = (const char *)*((_QWORD *)v24 + 1);
          v21 = self->_stmt;
          v11 = (v10 + 1);
          if (v25)
            v20 = v25;
          else
            v20 = "";
          v22 = v10;
          goto LABEL_23;
        case 6u:
          v26 = a3;
          v27 = *(_DWORD *)a3;
          a3 += 16;
          v28 = (const char *)*((_QWORD *)v26 + 1);
          v11 = (v10 + 1);
          if (v28)
            v29 = v28;
          else
            v29 = "";
          sqlite3_bind_blob(self->_stmt, v10, v29, v27, 0);
          goto LABEL_33;
        case 7u:
          v11 = (v10 + 1);
          v30 = a3;
          a3 += 8;
          pql_bind_object(self->_stmt, v10, *(void **)v30);
          goto LABEL_33;
        case 8u:
          v31 = a3;
          a3 += 8;
          v13 = *(id *)v31;
          v10 = objc_msgSend(v13, "bindWithStatement:startingAtIndex:", self->_stmt, v10)
              + v10;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v13, "bindValuesToKeepAlive");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[PQLStatement keepBindAlive:](self, "keepBindAlive:", v32);

          }
          goto LABEL_34;
        case 9u:
          v33 = a3;
          a3 += 8;
          v34 = (void *)objc_msgSend(*(id *)v33, "copy");
          -[PQLStatement keepBindAlive:](self, "keepBindAlive:", v34);
          v11 = (v10 + 1);
          pql_sqlite3_bind_pointer(self->_stmt, v10, (sqlite3_int64)v34);

          goto LABEL_33;
        default:
          v13 = 0;
          goto LABEL_34;
      }
    }
  }
  self->_inUse = 1;
  if (specLength >= 1)
  {
    ptr = &self->_specUnion;
    goto LABEL_9;
  }
LABEL_35:

}

- (id)translate:(id)a3 hasInjections:(BOOL *)a4 arguments:(char *)a5
{
  id v7;
  const char *v8;
  void *v9;
  size_t v10;
  const char *v11;
  int v12;
  const char *v13;
  void *v14;
  const char *v15;
  id *v16;
  id v17;
  uint64_t specLength;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  size_t v25;
  uint64_t v26;
  char v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  unsigned __int8 *v38;
  unsigned __int8 *v39;
  uint64_t v41;
  _BYTE __src[1000];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", strlen(v8) + 1);
  self->_specLength = 0;
  v10 = strcspn(v8, "%");
  objc_msgSend(v9, "appendBytes:length:", v8, v10);
  v11 = &v8[v10];
  if (*v11)
  {
    v41 = *MEMORY[0x1E0C99778];
    while (1)
    {
      v13 = v11 + 1;
      v12 = *((unsigned __int8 *)v11 + 1);
      if (v12 == 37)
        break;
      if ((unsigned __int16)self->_specLength >= 0x3E8u)
        goto LABEL_61;
      if (v12 == 64)
      {
        v16 = (id *)a5;
        a5 += 8;
        v17 = *v16;
        if (objc_msgSend(*v16, "conformsToProtocol:", &unk_1EFEAAEB0))
        {
          *a4 = 1;
          specLength = self->_specLength;
          self->_specLength = specLength + 1;
          __src[specLength] = 8;
          v13 = v11 + 2;
          objc_msgSend(v17, "sql");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendData:", v19);

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = self->_specLength;
          self->_specLength = v20 + 1;
          __src[v20] = 9;
          v13 = v11 + 2;
          v14 = v9;
          v15 = "?";
          goto LABEL_5;
        }
      }
      objc_msgSend(v9, "appendBytes:length:", "?", 1);
      v21 = *v13;
      if (v21 > 96)
      {
        switch(*v13)
        {
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            goto LABEL_18;
          case 'd':
          case 'i':
            a5 += 8;
            v22 = self->_specLength;
            self->_specLength = v22 + 1;
            __src[v22] = 0;
            goto LABEL_20;
          case 'l':
            v28 = v11[2];
            if (memchr("udi", v28, 4uLL))
            {
              a5 += 8;
              v29 = self->_specLength;
              self->_specLength = v29 + 1;
              __src[v29] = 2;
              goto LABEL_38;
            }
            if (v28 <= 107)
            {
              if (v28 == 100 || v28 == 105)
              {
                a5 += 8;
                v34 = self->_specLength;
                self->_specLength = v34 + 1;
                __src[v34] = 0;
                goto LABEL_38;
              }
              goto LABEL_55;
            }
            if (v28 != 108)
            {
              if (v28 != 117)
                goto LABEL_55;
              a5 += 8;
              v35 = self->_specLength;
              self->_specLength = v35 + 1;
              __src[v35] = 1;
              goto LABEL_38;
            }
            if (!memchr("udi", v11[3], 4uLL))
              goto LABEL_55;
            a5 += 8;
            v36 = self->_specLength;
            self->_specLength = v36 + 1;
            __src[v36] = 2;
            break;
          case 'p':
            a5 += 8;
            v26 = self->_specLength;
            self->_specLength = v26 + 1;
            v27 = 2;
            goto LABEL_30;
          case 's':
            a5 += 8;
            v23 = self->_specLength;
            self->_specLength = v23 + 1;
            v24 = 4;
            goto LABEL_19;
          case 'u':
            a5 += 8;
            v23 = self->_specLength;
            self->_specLength = v23 + 1;
            v24 = 1;
            goto LABEL_19;
          default:
            goto LABEL_55;
        }
LABEL_45:
        v13 = v11 + 4;
        goto LABEL_21;
      }
      if (v21 <= 64)
      {
        if (v21 == 42)
        {
          if (memchr("sp", v11[2], 3uLL))
          {
            a5 += 16;
            v30 = self->_specLength;
            if (v11[2] == 115)
              v31 = 5;
            else
              v31 = 6;
            __src[v30] = v31;
            self->_specLength = v30 + 1;
LABEL_38:
            v13 = v11 + 3;
            goto LABEL_21;
          }
LABEL_55:
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v41, CFSTR("cannot compile statement [%@] around [...%.10s...]"), v7, v11);
          goto LABEL_21;
        }
        if (v21 == 46)
        {
          if (v11[2] != 42 || !memchr("sp", v11[3], 3uLL))
            goto LABEL_55;
          a5 += 16;
          v32 = self->_specLength;
          if (v11[3] == 115)
            v33 = 5;
          else
            v33 = 6;
          __src[v32] = v33;
          self->_specLength = v32 + 1;
          goto LABEL_45;
        }
        if (v21 != 64)
          goto LABEL_55;
        v26 = self->_specLength;
        self->_specLength = v26 + 1;
        v27 = 7;
LABEL_30:
        __src[v26] = v27;
      }
      else
      {
        if ((v21 - 69) >= 3 && v21 != 65)
          goto LABEL_55;
LABEL_18:
        a5 += 8;
        v23 = self->_specLength;
        self->_specLength = v23 + 1;
        v24 = 3;
LABEL_19:
        __src[v23] = v24;
      }
LABEL_20:
      v13 = v11 + 2;
LABEL_21:
      v25 = strcspn(v13, "%");
      objc_msgSend(v9, "appendBytes:length:", v13, v25);
      v11 = &v13[v25];
      if (!v13[v25])
        goto LABEL_56;
    }
    v13 = v11 + 2;
    v14 = v9;
    v15 = "%";
LABEL_5:
    objc_msgSend(v14, "appendBytes:length:", v15, 1);
    goto LABEL_21;
  }
LABEL_56:
  objc_msgSend(v9, "appendBytes:length:", ", 1);
  v37 = (unsigned __int16)self->_specLength;
  if (self->_specLength < 9)
  {
    memcpy(&self->_specUnion, __src, (__int16)v37);
  }
  else
  {
    v38 = (unsigned __int8 *)malloc_type_malloc((unsigned __int16)self->_specLength, 0x853F0B0AuLL);
    if (!v38)
LABEL_61:
      abort();
    v39 = v38;
    memcpy(v38, __src, v37);
    self->_specUnion.ptr = v39;
  }
  objc_msgSend(v9, "appendBytes:length:", __src, self->_specLength);

  return v9;
}

- (void)keepBindAlive:(id)a3
{
  id v4;
  NSMutableArray *aliveBinds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    aliveBinds = self->_aliveBinds;
    v8 = v4;
    if (aliveBinds)
    {
      -[NSMutableArray addObject:](aliveBinds, "addObject:", v4);
    }
    else
    {
      v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
      v7 = self->_aliveBinds;
      self->_aliveBinds = v6;

    }
    v4 = v8;
  }

}

- (BOOL)isTraced
{
  return self->_isTraced;
}

- (PQLStatement)initWithStatement:(id)a3 forDB:(id)a4 preparationTime:(unint64_t *)a5
{
  char *v8;
  id v9;
  PQLStatement *v10;
  PQLStatement *v11;
  size_t specLength;
  const void *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  objc_super v17;

  v8 = (char *)a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PQLStatement;
  v10 = -[PQLStatement init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_specLength = *((_WORD *)v8 + 21);
    v10->_isTraced = objc_msgSend(v9, "isTraced");
    specLength = v11->_specLength;
    if (*((__int16 *)v8 + 21) < 9)
    {
      memcpy(&v11->_specUnion, v8 + 32, v11->_specLength);
    }
    else
    {
      v13 = (const void *)*((_QWORD *)v8 + 4);
      v14 = (unsigned __int8 *)malloc_type_malloc(v11->_specLength, 0x853F0B0AuLL);
      if (!v14)
        abort();
      v15 = v14;
      memcpy(v14, v13, specLength);
      v11->_specUnion.ptr = v15;
    }
    if (!-[PQLStatement _prepare:withDB:preparationTime:](v11, "_prepare:withDB:preparationTime:", sqlite3_sql(*((sqlite3_stmt **)v8 + 1)), v9, a5))
    {

      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  sqlite3_stmt *stmt;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  stmt = self->_stmt;
  if (stmt)
    v6 = sqlite3_sql(stmt);
  else
    v6 = "INVALIDATED";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p {%s}>"), v4, self, v6);
}

@end
