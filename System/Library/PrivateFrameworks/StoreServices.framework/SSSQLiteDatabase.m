@implementation SSSQLiteDatabase

- (void)performTransactionWithBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__SSSQLiteDatabase_performTransactionWithBlock___block_invoke;
  v3[3] = &unk_1E47BBC58;
  v3[4] = self;
  v3[5] = a3;
  -[SSSQLiteDatabase _accessDatabaseUsingBlock:](self, "_accessDatabaseUsingBlock:", v3);
}

- (void)_accessDatabaseUsingBlock:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SSSQLiteDatabase__accessDatabaseUsingBlock___block_invoke;
  v4[3] = &unk_1E47BBC58;
  v4[4] = self;
  v4[5] = a3;
  if (dispatch_get_specific("_ISSQLiteDispatchQueueTag") == (void *)1)
    __46__SSSQLiteDatabase__accessDatabaseUsingBlock___block_invoke((uint64_t)v4);
  else
    dispatch_sync((dispatch_queue_t)self->_dispatchQueue, v4);
}

uint64_t __46__SSSQLiteDatabase__accessDatabaseUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_beginTaskCompletionAssertion");
  if (!objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNotOpen"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_endTaskCompletionAssertion");
}

- (id)_openDatabaseIfNotOpen
{
  sqlite3 **p_db;
  NSString *protectionType;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  int v23;
  uint64_t v24;
  NSString *databasePath;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *v37;
  const __CFString **v38;
  id v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL4 readOnly;
  id v53;
  id v54;
  int v55;
  int v56;
  uint64_t v57;
  NSString *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  NSString *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  id v83;
  int v84;
  int v85;
  uint64_t v86;
  NSString *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  sqlite3 *db;
  int *v98;
  int *v99;
  uint64_t v100;
  void *v101;
  const __CFString *v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  __int16 v106;
  _QWORD v107[3];
  const __CFString *v108;
  _QWORD v109[2];

  v109[1] = *MEMORY[0x1E0C80C00];
  p_db = &self->_db;
  if (self->_db)
    return 0;
  protectionType = self->_protectionType;
  if ((!protectionType || !-[NSString isEqualToString:](protectionType, "isEqualToString:", *MEMORY[0x1E0CB2AE0]))
    && !MKBDeviceUnlockedSinceBoot())
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v108 = CFSTR("sqlite_result");
    v109[0] = &unk_1E481E7F8;
    v36 = (void *)MEMORY[0x1E0C99D80];
    v37 = v109;
    v38 = &v108;
    return (id)objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 112, objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
  }
  v101 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent"), 1, 0, &v101) & 1) != 0|| !v101)
  {
    v19 = sqlite3_open_v2(-[NSString fileSystemRepresentation](self->_databasePath, "fileSystemRepresentation"), p_db, -[SSSQLiteDatabase _openFlags](self, "_openFlags"), 0);
    if ((_DWORD)v19)
    {
      v20 = v19;
      if (*p_db)
      {
        sqlite3_close(*p_db);
        *p_db = 0;
      }
      if ((_DWORD)v20 == 23)
      {
        v21 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v21)
          v21 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v22 = objc_msgSend(v21, "shouldLog");
        if (objc_msgSend(v21, "shouldLogToDisk"))
          v22 |= 2u;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v23 = v22;
        else
          v23 = v22 & 2;
        v20 = 23;
        if (v23)
        {
          v24 = objc_opt_class();
          databasePath = self->_databasePath;
          v104 = 138412802;
          v105 = v24;
          v106 = 1024;
          LODWORD(v107[0]) = 23;
          WORD2(v107[0]) = 2112;
          *(_QWORD *)((char *)v107 + 6) = databasePath;
          LODWORD(v100) = 28;
          v98 = &v104;
          v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v104, v100);
            free(v27);
            SSFileLog(v21, CFSTR("%@"), v29, v30, v31, v32, v33, v34, v28);
            v20 = 23;
          }
        }
        goto LABEL_89;
      }
      readOnly = self->_readOnly;
      v53 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v54 = v53;
      if (readOnly)
      {
        if (!v53)
          v54 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v55 = objc_msgSend(v54, "shouldLog");
        if (objc_msgSend(v54, "shouldLogToDisk"))
          v56 = v55 | 2;
        else
          v56 = v55;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v54, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v56 &= 2u;
        if (v56)
        {
          v57 = objc_opt_class();
          v58 = self->_databasePath;
          v104 = 138412802;
          v105 = v57;
          v106 = 1024;
          LODWORD(v107[0]) = v20;
          WORD2(v107[0]) = 2112;
          *(_QWORD *)((char *)v107 + 6) = v58;
          LODWORD(v100) = 28;
          v98 = &v104;
          v59 = _os_log_send_and_compose_impl();
          if (v59)
          {
            v60 = (void *)v59;
            v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v59, 4, &v104, v100);
            free(v60);
            SSFileLog(v54, CFSTR("%@"), v62, v63, v64, v65, v66, v67, v61);
          }
        }
        goto LABEL_89;
      }
      if (!v53)
        v54 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v68 = objc_msgSend(v54, "shouldLog");
      if (objc_msgSend(v54, "shouldLogToDisk"))
        v69 = v68 | 2;
      else
        v69 = v68;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v54, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v69 &= 2u;
      if (v69)
      {
        v70 = objc_opt_class();
        v71 = self->_databasePath;
        v104 = 138412802;
        v105 = v70;
        v106 = 1024;
        LODWORD(v107[0]) = v20;
        WORD2(v107[0]) = 2112;
        *(_QWORD *)((char *)v107 + 6) = v71;
        LODWORD(v100) = 28;
        v98 = &v104;
        v72 = _os_log_send_and_compose_impl();
        if (v72)
        {
          v73 = (void *)v72;
          v74 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v72, 4, &v104, v100);
          free(v73);
          SSFileLog(v54, CFSTR("%@"), v75, v76, v77, v78, v79, v80, v74);
        }
      }
      v20 = -[SSSQLiteDatabase _resetAndReopenDatabaseWithPath:](self, "_resetAndReopenDatabaseWithPath:", self->_databasePath, v98);
    }
    else
    {
      if (!self->_readOnly && self->_setupBlock)
      {
        v39 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v39)
          v39 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v40 = objc_msgSend(v39, "shouldLog");
        if (objc_msgSend(v39, "shouldLogToDisk"))
          v41 = v40 | 2;
        else
          v41 = v40;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v39, "OSLogObject"), OS_LOG_TYPE_DEBUG))
          v42 = v41;
        else
          v42 = v41 & 2;
        if (v42)
        {
          LOWORD(v104) = 0;
          LODWORD(v100) = 2;
          v98 = &v104;
          v43 = _os_log_send_and_compose_impl();
          if (v43)
          {
            v44 = (void *)v43;
            v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, &v104, v100);
            free(v44);
            SSFileLog(v39, CFSTR("%@"), v46, v47, v48, v49, v50, v51, v45);
          }
        }
        (*((void (**)(void))self->_setupBlock + 2))();
      }
      v20 = 0;
    }
    if (self->_readOnly || (_DWORD)v20)
    {
      if ((_DWORD)v20)
      {
LABEL_89:
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v102 = CFSTR("sqlite_result");
        v103 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20, v98);
        v36 = (void *)MEMORY[0x1E0C99D80];
        v37 = &v103;
        v38 = &v102;
        return (id)objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 112, objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
      }
    }
    else
    {
      v81 = sqlite3_exec(*p_db, "PRAGMA cache_size=512;", 0, 0, 0);
      v82 = v81;
      if (v81 == 26 || v81 == 11)
      {
        v83 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v98);
        if (!v83)
          v83 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v84 = objc_msgSend(v83, "shouldLog");
        if (objc_msgSend(v83, "shouldLogToDisk"))
          v85 = v84 | 2;
        else
          v85 = v84;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v83, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v85 &= 2u;
        if (v85)
        {
          v86 = objc_opt_class();
          v87 = self->_databasePath;
          v104 = 138412802;
          v105 = v86;
          v106 = 1024;
          LODWORD(v107[0]) = v82;
          WORD2(v107[0]) = 2112;
          *(_QWORD *)((char *)v107 + 6) = v87;
          LODWORD(v100) = 28;
          v99 = &v104;
          v88 = _os_log_send_and_compose_impl();
          if (v88)
          {
            v89 = (void *)v88;
            v90 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v88, 4, &v104, v100);
            free(v89);
            SSFileLog(v83, CFSTR("%@"), v91, v92, v93, v94, v95, v96, v90);
          }
        }
        v20 = -[SSSQLiteDatabase _resetAndReopenDatabaseWithPath:](self, "_resetAndReopenDatabaseWithPath:", self->_databasePath, v99);
        db = self->_db;
        if ((_DWORD)v20)
        {
          if (db)
          {
            sqlite3_close(db);
            *p_db = 0;
          }
          goto LABEL_89;
        }
        sqlite3_exec(db, "PRAGMA cache_size=512;", 0, 0, 0);
      }
    }
    sqlite3_busy_timeout(*p_db, 3600000);
    return 0;
  }
  v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v6)
    v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v8 &= 2u;
  if (v8)
  {
    v9 = objc_opt_class();
    v104 = 138412546;
    v105 = v9;
    v106 = 2112;
    v107[0] = v101;
    LODWORD(v100) = 22;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v104, v100);
      free(v11);
      SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
    }
  }
  return v101;
}

- (void)_endTaskCompletionAssertion
{
  dispatch_time_t v3;
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (self->_takesTaskCompletionAssertions)
  {
    v3 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SSSQLiteDatabase__endTaskCompletionAssertion__block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = self;
    dispatch_after(v3, dispatchQueue, block);
  }
}

- (void)_beginTaskCompletionAssertion
{
  int64_t taskAssertionCount;
  int64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_takesTaskCompletionAssertions)
  {
    taskAssertionCount = self->_taskAssertionCount;
    if (taskAssertionCount < 1)
    {
      v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v5)
        v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v7 = v6 | 2;
      else
        v7 = v6;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_INFO))
        v7 &= 2u;
      if (v7)
      {
        v20 = 138412290;
        v21 = objc_opt_class();
        LODWORD(v19) = 12;
        v18 = &v20;
        v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          v9 = (void *)v8;
          v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v20, v19);
          free(v9);
          SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
        }
      }
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.StoreServices.SSSQLiteDatabase.%@"), -[NSString lastPathComponent](self->_databasePath, "lastPathComponent", v18));
      v4 = 1;
      self->_taskAssertion = (BKSProcessAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:withHandler:", getpid(), 1, 4, v17, 0);
    }
    else
    {
      v4 = taskAssertionCount + 1;
    }
    self->_taskAssertionCount = v4;
  }
}

_BYTE *__48__SSSQLiteDatabase_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  _BYTE *result;
  int v3;
  const __CFString *v4;

  result = *(_BYTE **)(a1 + 32);
  v3 = result[34];
  if (!result[34])
  {
    if (result[32])
      v4 = CFSTR("BEGIN DEFERRED TRANSACTION;");
    else
      v4 = CFSTR("BEGIN IMMEDIATE TRANSACTION;");
    result = (_BYTE *)objc_msgSend(result, "executeSQL:", v4);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = (_BYTE)result;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34))
  {
    result = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (!v3)
    {
      if ((_DWORD)result)
        result = (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "executeSQL:", CFSTR("COMMIT;"));
      else
        result = (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "executeSQL:", CFSTR("ROLLBACK;"));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 0;
    }
  }
  return result;
}

uint64_t __60__SSSQLiteDatabase_prepareStatementForSQL_cache_usingBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  sqlite3_stmt *v4;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[1];
  v4 = (sqlite3_stmt *)objc_msgSend(v2, "_statementForSQL:cache:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v3 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    sqlite3_clear_bindings(v4);
    result = sqlite3_reset(v4);
    if (!*(_BYTE *)(a1 + 56))
      return sqlite3_finalize(v4);
  }
  return result;
}

- (sqlite3_stmt)_statementForSQL:(id)a3 cache:(BOOL)a4
{
  _BOOL4 v4;
  __CFDictionary *v7;
  int v8;
  int v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  const char *v14;
  NSString *databasePath;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFDictionary *statementCache;
  int *v27;
  uint64_t v28;
  sqlite3_stmt *ppStmt;
  int v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  if (!a4 || (v7 = self->_statementCache) == 0 || (ppStmt = (sqlite3_stmt *)CFDictionaryGetValue(v7, a3)) == 0)
  {
    do
      v8 = sqlite3_prepare_v2(self->_db, (const char *)objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"), &ppStmt, 0);
    while ((v8 - 5) < 2);
    v9 = v8;
    if (v8)
    {
      v10 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v10)
        v10 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v12 &= 2u;
      if (v12)
      {
        v13 = objc_opt_class();
        v14 = sqlite3_errmsg(self->_db);
        databasePath = self->_databasePath;
        v30 = 138413314;
        v31 = v13;
        v32 = 2112;
        v33 = a3;
        v34 = 1024;
        v35 = v9;
        v36 = 2080;
        v37 = v14;
        v38 = 2112;
        v39 = databasePath;
        LODWORD(v28) = 48;
        v27 = &v30;
        v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v30, v28);
          free(v17);
          SSFileLog(v10, CFSTR("%@"), v19, v20, v21, v22, v23, v24, v18);
        }
      }
      if (v9 == 26 || v9 == 11)
        -[SSSQLiteDatabase _resetCorruptDatabase](self, "_resetCorruptDatabase", v27);
    }
    else if (v4)
    {
      statementCache = self->_statementCache;
      if (!statementCache)
      {
        statementCache = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], &kSqlite3StatementDictionaryValueCallbacks);
        self->_statementCache = statementCache;
      }
      CFDictionarySetValue(statementCache, a3, ppStmt);
    }
  }
  return ppStmt;
}

void __31__SSSQLiteDatabase_executeSQL___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int *v36;
  int *v37;
  uint64_t v38;
  char *errmsg;
  int v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String");
  v3 = 0;
  do
  {
    errmsg = 0;
    v4 = sqlite3_exec(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8), v2, 0, 0, &errmsg);
    if (v4)
    {
      v5 = v4;
      v6 = errmsg;
      if (v4 - 5 > 1)
      {
        if (!errmsg)
          v6 = (void *)sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
        v21 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v36);
        if (!v21)
          v21 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v22 = objc_msgSend(v21, "shouldLog");
        if (objc_msgSend(v21, "shouldLogToDisk"))
          v22 |= 2u;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v22 &= 2u;
        if (v22)
        {
          v23 = objc_opt_class();
          v24 = *(_QWORD *)(a1 + 32);
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
          v40 = 138413314;
          v41 = v23;
          v42 = 2112;
          v43 = v24;
          v44 = 2048;
          v45 = v5;
          v46 = 2080;
          v47 = v6;
          v48 = 2112;
          v49 = v25;
          LODWORD(v38) = 52;
          v36 = &v40;
          v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v40, v38);
            free(v27);
            SSFileLog(v21, CFSTR("%@"), v29, v30, v31, v32, v33, v34, v28);
          }
        }
        if (v5 == 26 || v5 == 11)
          objc_msgSend(*(id *)(a1 + 40), "_resetCorruptDatabase");
        v20 = 0;
      }
      else
      {
        if (!errmsg)
          v6 = (void *)sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
        v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v36);
        if (!v7)
          v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v8 = objc_msgSend(v7, "shouldLog");
        if (objc_msgSend(v7, "shouldLogToDisk"))
          v8 |= 2u;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
          v8 &= 2u;
        if (v8)
        {
          v9 = objc_opt_class();
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
          v40 = 138413314;
          v41 = v9;
          v42 = 2048;
          v43 = v5;
          v44 = 2048;
          v45 = v3;
          v46 = 2080;
          v47 = v6;
          v48 = 2112;
          v49 = v10;
          LODWORD(v38) = 52;
          v37 = &v40;
          v11 = _os_log_send_and_compose_impl();
          if (v11)
          {
            v12 = (void *)v11;
            v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v40, v38);
            free(v12);
            SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
          }
        }
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.5, v37);
        ++v3;
        v20 = 1;
      }
    }
    else
    {
      v20 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    if (errmsg)
      sqlite3_free(errmsg);
  }
  while ((v20 & 1) != 0);
}

- (BOOL)executeSQL:(id)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SSSQLiteDatabase_executeSQL___block_invoke;
  v5[3] = &unk_1E47B8F30;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = &v6;
  -[SSSQLiteDatabase _accessDatabaseUsingBlock:](self, "_accessDatabaseUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)statementHasRowAfterStepping:(sqlite3_stmt *)a3
{
  __int16 v5;

  v5 = 0;
  objc_msgSend((id)objc_opt_class(), "_stepStatement:hasRow:didFinish:isCorrupt:", a3, (char *)&v5 + 1, 0, &v5);
  if (!(_BYTE)v5)
    return HIBYTE(v5) != 0;
  -[SSSQLiteDatabase _resetCorruptDatabase](self, "_resetCorruptDatabase");
  return 0;
}

- (BOOL)statementDidFinishAfterStepping:(sqlite3_stmt *)a3
{
  __int16 v5;

  v5 = 0;
  objc_msgSend((id)objc_opt_class(), "_stepStatement:hasRow:didFinish:isCorrupt:", a3, 0, (char *)&v5 + 1, &v5);
  if (!(_BYTE)v5)
    return HIBYTE(v5) != 0;
  -[SSSQLiteDatabase _resetCorruptDatabase](self, "_resetCorruptDatabase");
  return 0;
}

+ (void)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 didFinish:(BOOL *)a5 isCorrupt:(BOOL *)a6
{
  int v10;
  int v11;
  id v12;
  int v13;
  int v14;
  uint64_t v15;
  const char *v16;
  sqlite3 *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    while (1)
    {
      v10 = sqlite3_step(a3);
      if (v10 == 9)
        break;
      if (v10 == 101)
      {
        if (a5)
          *a5 = 1;
        return;
      }
      if (v10 == 100)
      {
        if (a4)
          *a4 = 1;
        return;
      }
      v11 = v10;
      if (v10 - 7 <= 0xFFFFFFFD)
      {
        v12 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v12)
          v12 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v13 = objc_msgSend(v12, "shouldLog");
        if (objc_msgSend(v12, "shouldLogToDisk"))
          v14 = v13 | 2;
        else
          v14 = v13;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v14 &= 2u;
        if (v14)
        {
          v15 = objc_opt_class();
          v16 = sqlite3_sql(a3);
          v17 = sqlite3_db_handle(a3);
          v30 = 138413058;
          v31 = v15;
          v32 = 2080;
          v33 = v16;
          v34 = 1024;
          v35 = v11;
          v36 = 2080;
          v37 = sqlite3_errmsg(v17);
          LODWORD(v29) = 38;
          v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            v19 = (void *)v18;
            v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v30, v29);
            free(v19);
            SSFileLog(v12, CFSTR("%@"), v21, v22, v23, v24, v25, v26, v20);
          }
        }
        if (a6)
        {
          v28 = v11 == 11 || v11 == 26;
          *a6 = v28;
        }
        return;
      }
      if (v10 == 6)
        sqlite3_reset(a3);
    }
  }
}

- (void)prepareStatementForSQL:(id)a3 cache:(BOOL)a4 usingBlock:(id)a5
{
  _QWORD v5[7];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SSSQLiteDatabase_prepareStatementForSQL_cache_usingBlock___block_invoke;
  v5[3] = &unk_1E47BE9A8;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  v5[6] = a5;
  -[SSSQLiteDatabase _accessDatabaseUsingBlock:](self, "_accessDatabaseUsingBlock:", v5);
}

- (void)dispatchBlockSync:(id)a3
{
  if (dispatch_get_specific("_ISSQLiteDispatchQueueTag") == (void *)1)
    (*((void (**)(id))a3 + 2))(a3);
  else
    dispatch_sync((dispatch_queue_t)self->_dispatchQueue, a3);
}

+ (BOOL)statementHasRowAfterStepping:(sqlite3_stmt *)a3
{
  BOOL v4;

  v4 = 0;
  objc_msgSend(a1, "_stepStatement:hasRow:didFinish:isCorrupt:", a3, &v4, 0, 0);
  return v4;
}

- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  return -[SSSQLiteDatabase initWithDatabaseURL:readOnly:](self, "initWithDatabaseURL:readOnly:", a3, 0);
}

- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  return -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:](self, "initWithDatabaseURL:readOnly:protectionType:", a3, a4, *MEMORY[0x1E0CB2AC0]);
}

- (SSSQLiteDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4 protectionType:(id)a5
{
  _BOOL4 v6;
  id v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SSSQLiteDatabase *v21;
  Class v22;
  void *v23;
  NSObject *v24;
  int *v26;
  uint64_t v27;
  objc_super v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v9)
    v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v11 &= 2u;
  if (v11)
  {
    v29 = 138413058;
    v30 = objc_opt_class();
    v31 = 2114;
    v32 = objc_msgSend(a3, "path");
    v33 = 1024;
    v34 = v6;
    v35 = 2112;
    v36 = a5;
    LODWORD(v27) = 38;
    v26 = &v29;
    v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v29, v27);
      free(v13);
      SSFileLog(v9, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
    }
  }
  if ((objc_msgSend(a3, "isFileURL", v26) & 1) == 0)
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid database URL"));
    self = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)SSSQLiteDatabase;
  v21 = -[SSSQLiteDatabase init](&v28, sel_init);
  if (v21)
  {
    v22 = NSClassFromString(CFSTR("UIApplication"));
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.iTunesStore.SSSQLiteDatabase.%p"), v21);
    v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), 0);
    v21->_dispatchQueue = (OS_dispatch_queue *)v24;
    dispatch_queue_set_specific(v24, "_ISSQLiteDispatchQueueTag", (void *)1, 0);

    v21->_databasePath = (NSString *)(id)objc_msgSend(a3, "path");
    v21->_readOnly = v6;
    v21->_protectionType = (NSString *)a5;
    if (__TakesTaskCompletionAssertions)
    {
      if (!v22)
      {
        v21->_takesTaskCompletionAssertions = 0;
        return v21;
      }
      v21->_takesTaskCompletionAssertions = 1;
      goto LABEL_18;
    }
    if (v21->_takesTaskCompletionAssertions)
LABEL_18:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v21, sel_expireBackgroundTask, CFSTR("UIApplicationBackgroundTaskWillExpireNotification"), -[objc_class sharedApplication](v22, "sharedApplication"));
  }
  return v21;
}

- (void)dealloc
{
  int v3;
  int v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *dispatchQueue;
  BKSProcessAssertion *taskAssertion;
  int *v19;
  uint64_t v20;
  objc_super v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[SSSQLiteDatabase _closeDatabaseIfOpen](self, "_closeDatabaseIfOpen");
  if (v3)
  {
    v4 = v3;
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v7 &= 2u;
    if (v7)
    {
      v22 = 138412802;
      v23 = objc_opt_class();
      v24 = 1024;
      v25 = v4;
      v26 = 2080;
      v27 = sqlite3_errstr(v4);
      LODWORD(v20) = 28;
      v19 = &v22;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v22, v20);
        free(v9);
        SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_set_specific(dispatchQueue, "_ISSQLiteDispatchQueueTag", 0, 0);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
    self->_dispatchQueue = 0;
  }
  taskAssertion = self->_taskAssertion;
  if (taskAssertion)
  {
    -[BKSProcessAssertion invalidate](taskAssertion, "invalidate");

  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v19), "removeObserver:", self);

  v21.receiver = self;
  v21.super_class = (Class)SSSQLiteDatabase;
  -[SSSQLiteDatabase dealloc](&v21, sel_dealloc);
}

+ (BOOL)statementDidFinishAfterStepping:(sqlite3_stmt *)a3
{
  BOOL v4;

  v4 = 0;
  objc_msgSend(a1, "_stepStatement:hasRow:didFinish:isCorrupt:", a3, 0, &v4, 0);
  return v4;
}

- (void)accessDatabaseUsingBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__SSSQLiteDatabase_accessDatabaseUsingBlock___block_invoke;
  v3[3] = &unk_1E47B8EB8;
  v3[4] = self;
  v3[5] = a3;
  -[SSSQLiteDatabase _accessDatabaseUsingBlock:](self, "_accessDatabaseUsingBlock:", v3);
}

uint64_t __45__SSSQLiteDatabase_accessDatabaseUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)columnName:(id)a3 existsInTable:(id)a4
{
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA table_info(%@);"), a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SSSQLiteDatabase_columnName_existsInTable___block_invoke;
  v8[3] = &unk_1E47BE980;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = &v9;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](self, "prepareStatementForSQL:cache:usingBlock:", v6, 0, v8);
  LOBYTE(self) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __45__SSSQLiteDatabase_columnName_existsInTable___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  const unsigned __int8 *v5;

  v4 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2))
  {
    while (1)
    {
      if (sqlite3_column_type(a2, 1) == 3)
      {
        v5 = sqlite3_column_text(a2, 1);
        if (v5)
        {
          if (*v5
            && objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, 4), "isEqualToString:", *(_QWORD *)(a1 + 40)))
          {
            break;
          }
        }
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2) & 1) == 0)
        goto LABEL_7;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_7:
  objc_autoreleasePoolPop(v4);
}

- (int64_t)countChanges
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SSSQLiteDatabase_countChanges__block_invoke;
  v4[3] = &unk_1E47B8DF8;
  v4[4] = self;
  v4[5] = &v5;
  -[SSSQLiteDatabase _accessDatabaseUsingBlock:](self, "_accessDatabaseUsingBlock:", v4);
  v2 = *((int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__SSSQLiteDatabase_countChanges__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = sqlite3_changes(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  dispatch_after(a3, (dispatch_queue_t)self->_dispatchQueue, a4);
}

- (void)dispatchBlockAsync:(id)a3
{
  if (dispatch_get_specific("_ISSQLiteDispatchQueueTag") == (void *)1)
    (*((void (**)(id))a3 + 2))(a3);
  else
    dispatch_async((dispatch_queue_t)self->_dispatchQueue, a3);
}

- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3
{
  return dispatch_source_create(a3, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
}

- (BOOL)setUserVersion:(int64_t)a3
{
  return -[SSSQLiteDatabase setUserVersion:forDatabase:](self, "setUserVersion:forDatabase:", a3, CFSTR("main"));
}

- (BOOL)setUserVersion:(int64_t)a3 forDatabase:(id)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA %@.user_version=%ld;"),
                 a4,
                 a3);
  v6 = -[SSSQLiteDatabase executeSQL:](self, "executeSQL:", v5);

  return v6;
}

- (int64_t)userVersion
{
  return -[SSSQLiteDatabase userVersionForDatabase:](self, "userVersionForDatabase:", CFSTR("main"));
}

- (int64_t)userVersionForDatabase:(id)a3
{
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA %@.user_version;"), a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SSSQLiteDatabase_userVersionForDatabase___block_invoke;
  v7[3] = &unk_1E47BE9D0;
  v7[4] = self;
  v7[5] = &v8;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](self, "prepareStatementForSQL:cache:usingBlock:", v4, 0, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __43__SSSQLiteDatabase_userVersionForDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2))
  {
    v4 = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "integerValue");

  }
}

+ (void)_setTakesTaskCompletionAssertions:(BOOL)a3
{
  __TakesTaskCompletionAssertions = a3;
}

- (void)beginTaskCompletionAssertion
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSSQLiteDatabase_beginTaskCompletionAssertion__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __48__SSSQLiteDatabase_beginTaskCompletionAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginTaskCompletionAssertion");
}

- (void)endTaskCompletionAssertion
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSSQLiteDatabase_endTaskCompletionAssertion__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__SSSQLiteDatabase_endTaskCompletionAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endTaskCompletionAssertion");
}

- (void)expireBackgroundTask
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSSQLiteDatabase_expireBackgroundTask__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SSSQLiteDatabase_expireBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expireBackgroundTask");
}

- (void)setTakesTaskCompletionAssertions:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SSSQLiteDatabase_setTakesTaskCompletionAssertions___block_invoke;
  v4[3] = &unk_1E47B9C78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __53__SSSQLiteDatabase_setTakesTaskCompletionAssertions___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)takesTaskCompletionAssertions
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SSSQLiteDatabase_takesTaskCompletionAssertions__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__SSSQLiteDatabase_takesTaskCompletionAssertions__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (int)_closeDatabaseIfOpen
{
  sqlite3 *db;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v5;

  db = self->_db;
  if (db)
  {
    if (self->_statementCache)
    {
      CFRelease(self->_statementCache);
      self->_statementCache = 0;
      db = self->_db;
    }
    stmt = sqlite3_next_stmt(db, 0);
    if (stmt)
    {
      v5 = stmt;
      do
      {
        sqlite3_finalize(v5);
        v5 = sqlite3_next_stmt(self->_db, v5);
      }
      while (v5);
    }
    LODWORD(db) = sqlite3_close(self->_db);
    if (!(_DWORD)db)
      self->_db = 0;
  }
  return (int)db;
}

void __47__SSSQLiteDatabase__endTaskCompletionAssertion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 80);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 80) = v4;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_INFO))
        v8 &= 2u;
      if (v8)
      {
        v20 = 138412290;
        v21 = objc_opt_class();
        LODWORD(v19) = 12;
        v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v20, v19);
          free(v10);
          SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
        }
      }
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      if (v18)
      {
        objc_msgSend(v18, "invalidate");

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
      }
    }
  }
}

- (void)_expireBackgroundTask
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_takesTaskCompletionAssertions && self->_taskAssertion)
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_INFO))
      v5 &= 2u;
    if (v5)
    {
      v17 = 138412290;
      v18 = objc_opt_class();
      LODWORD(v16) = 12;
      v15 = &v17;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4, &v17, v16);
        free(v7);
        SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, v8);
      }
    }
    self->_taskAssertionCount = 0;
    -[BKSProcessAssertion invalidate](self->_taskAssertion, "invalidate", v15);

    self->_taskAssertion = 0;
  }
}

- (int)_openFlags
{
  int v2;
  NSString *protectionType;
  int v4;

  if (self->_readOnly)
    v2 = 1;
  else
    v2 = 6;
  protectionType = self->_protectionType;
  if (protectionType)
  {
    if (-[NSString isEqualToString:](self->_protectionType, "isEqualToString:", *MEMORY[0x1E0CB2AE0]))
    {
      v4 = 0x400000;
    }
    else if (-[NSString isEqualToString:](protectionType, "isEqualToString:", *MEMORY[0x1E0CB2AB0]))
    {
      v4 = 0x100000;
    }
    else if (-[NSString isEqualToString:](protectionType, "isEqualToString:", *MEMORY[0x1E0CB2AB8]))
    {
      v4 = 0x200000;
    }
    else if (-[NSString isEqualToString:](protectionType, "isEqualToString:", *MEMORY[0x1E0CB2AC0]))
    {
      v4 = 3145728;
    }
    else
    {
      v4 = 0;
    }
    return v4 | v2;
  }
  return v2;
}

- (int)_resetAndReopenDatabaseWithPath:(id)a3
{
  int v5;
  int v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[SSSQLiteDatabase _closeDatabaseIfOpen](self, "_closeDatabaseIfOpen");
  if (v5)
  {
    v6 = v5;
    v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v7)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v21 = 138412802;
      v22 = objc_opt_class();
      v23 = 1024;
      v24 = v6;
      v25 = 2080;
      v26 = sqlite3_errstr(v6);
      LODWORD(v20) = 28;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v20);
        free(v11);
        SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
      }
    }
  }
  if (self->_readOnly)
    return 1;
  -[SSSQLiteDatabase _resetDatabaseWithPath:](self, "_resetDatabaseWithPath:", a3);
  return sqlite3_open_v2((const char *)objc_msgSend(a3, "fileSystemRepresentation"), &self->_db, -[SSSQLiteDatabase _openFlags](self, "_openFlags"), 0);
}

- (void)_resetCorruptDatabase
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  NSString *databasePath;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_readOnly)
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v5 &= 2u;
    if (v5)
    {
      v6 = objc_opt_class();
      databasePath = self->_databasePath;
      v32 = 138412546;
      v33 = v6;
      v34 = 2112;
      v35 = databasePath;
      LODWORD(v31) = 22;
      v30 = &v32;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v32, v31);
        free(v9);
        SSFileLog(v3, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
    -[SSSQLiteDatabase _resetDatabaseWithPath:](self, "_resetDatabaseWithPath:", self->_databasePath, v30);
    -[SSSQLiteDatabase _openDatabaseIfNotOpen](self, "_openDatabaseIfNotOpen");
    if (self->_setupBlock)
    {
      v17 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v17)
        v17 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v18 = objc_msgSend(v17, "shouldLog");
      if (objc_msgSend(v17, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v17, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v20 = v19;
      else
        v20 = v19 & 2;
      if (v20)
      {
        LOWORD(v32) = 0;
        LODWORD(v31) = 2;
        v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v32, v31);
          free(v22);
          SSFileLog(v17, CFSTR("%@"), v24, v25, v26, v27, v28, v29, v23);
        }
      }
      (*((void (**)(void))self->_setupBlock + 2))();
    }
  }
}

- (void)_resetDatabaseWithPath:(id)a3
{
  char v5;
  int v6;
  int v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  int *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  int v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!self->_db)
    goto LABEL_14;
  v5 = CPSqliteDatabaseDelete();
  v6 = -[SSSQLiteDatabase _closeDatabaseIfOpen](self, "_closeDatabaseIfOpen");
  if (v6)
  {
    v7 = v6;
    v8 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v8)
      v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      v32 = 138412802;
      v33 = objc_opt_class();
      v34 = 1024;
      v35 = v7;
      v36 = 2080;
      v37 = sqlite3_errstr(v7);
      LODWORD(v26) = 28;
      v25 = &v32;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v32, v26);
        free(v12);
        SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  if ((v5 & 1) == 0)
  {
LABEL_14:
    v20 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = objc_msgSend(&unk_1E481E918, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(&unk_1E481E918);
          objc_msgSend(v20, "removeItemAtPath:error:", objc_msgSend(a3, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v25), 0);
        }
        v22 = objc_msgSend(&unk_1E481E918, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v22);
    }

  }
}

- (id)setupBlock
{
  return self->_setupBlock;
}

- (void)setSetupBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
