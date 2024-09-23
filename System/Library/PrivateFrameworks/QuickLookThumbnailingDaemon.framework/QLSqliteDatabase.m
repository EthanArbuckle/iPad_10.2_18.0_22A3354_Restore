@implementation QLSqliteDatabase

- (void)bindInt:(int)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  sqlite3 *db;
  uint8_t buf[4];
  sqlite3 *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = sqlite3_bind_int(a5, v6, v7);
  if ((_DWORD)v9)
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v9, CFSTR("can't bind %d at index %d"), v7, v6);
  if (pLogSql)
  {
    v10 = MEMORY[0x1E0CD3398];
    v11 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v11)
    {
      QLTInitLogging();
      v11 = *(NSObject **)(v10 + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      db = self->_db;
      *(_DWORD *)buf = 134218496;
      v14 = db;
      v15 = 1024;
      v16 = v6;
      v17 = 1024;
      v18 = v7;
      _os_log_debug_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_DEBUG, "bindInt %p %d %d", buf, 0x18u);
    }
  }
}

- (void)finalizeStatement:(sqlite3_stmt *)a3
{
  void *v5;
  NSMutableDictionary *statementCache;
  void *v7;
  void *v8;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    NSMapGet(self->_statementsInUseTable, *a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setInUse:", 0);
      -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self, "resetStatement:unbindValuesThroughIndex:", *a3, 0);
      statementCache = self->_statementCache;
      objc_msgSend(v9, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](statementCache, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[QLSqliteDatabase _finalizeStatement:](self, "_finalizeStatement:", a3);
        objc_msgSend(v9, "setStmt:", 0);
      }
    }
    else
    {
      -[QLSqliteDatabase _finalizeStatement:](self, "_finalizeStatement:", a3);
    }
    *a3 = 0;

  }
}

- (void)resetStatement:(sqlite3_stmt *)a3 unbindValuesThroughIndex:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    v7 = sqlite3_reset(a3);
    if ((_DWORD)v7)
    {
      if ((_DWORD)v7 != 26 && (_DWORD)v7 != 11)
      {
        -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v7, CFSTR("can't reset statement"));
        return;
      }
      -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted", v7);
    }
    if (!self->_isCorrupted && (int)v4 >= 1)
    {
      do
      {
        v8 = sqlite3_bind_null(a3, v4);
        if ((_DWORD)v8)
        {
          if ((_DWORD)v8 != 26 && (_DWORD)v8 != 11)
          {
            -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v8, CFSTR("can't unbind value at index %d"), v4);
            return;
          }
          -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted", v8);
        }
        v9 = self->_isCorrupted || (int)v4 <= 1;
        v4 = (v4 - 1);
      }
      while (!v9);
    }
  }
}

- (sqlite3_stmt)prepareStatement:(const char *)a3
{
  sqlite3_stmt *v5;
  void *v6;
  void *v7;
  void *v8;
  int i;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  sqlite3_stmt *ppStmt;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    ppStmt = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLSqliteDatabase _cachedStatementForKey:](self, "_cachedStatementForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      ppStmt = (sqlite3_stmt *)objc_msgSend(v7, "stmt");
      if (ppStmt)
      {
LABEL_32:
        objc_msgSend(v8, "setInUse:", 1);
        v5 = ppStmt;
LABEL_33:

        return v5;
      }
    }
    for (i = -599; ; ++i)
    {
      v10 = sqlite3_prepare_v2(self->_db, a3, -1, &ppStmt, 0);
      if ((_DWORD)v10 != 5)
        break;
      if (!i)
        goto LABEL_36;
      v11 = (void *)MEMORY[0x1E0CB3978];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v10, 0.1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sleepUntilDate:", v12);

    }
    if ((int)v10 <= 10)
    {
      if ((_DWORD)v10)
        v14 = (_DWORD)v10 == 4;
      else
        v14 = 1;
      if (!v14)
        goto LABEL_36;
    }
    else
    {
      if ((_DWORD)v10 == 11 || (_DWORD)v10 == 26)
      {
        -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted", v10);
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
        goto LABEL_26;
      }
      if ((_DWORD)v10 != 101)
      {
LABEL_36:
        -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v10, CFSTR("error while preparing '%s'"), a3);
        v5 = 0;
        goto LABEL_33;
      }
    }
    if (!pLogSql)
    {
LABEL_31:
      -[QLSqliteDatabase _cacheStatement:forKey:](self, "_cacheStatement:forKey:", ppStmt, v6);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v19;
      goto LABEL_32;
    }
    v15 = MEMORY[0x1E0CD3398];
    v16 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v16)
    {
      QLTInitLogging();
      v16 = *(NSObject **)(v15 + 8);
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[QLSqliteDatabase(SqliteHelpers) prepareStatement:].cold.2();
LABEL_26:
    if (pLogSql)
    {
      v17 = MEMORY[0x1E0CD3398];
      v18 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
      if (!v18)
      {
        QLTInitLogging();
        v18 = *(NSObject **)(v17 + 8);
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[QLSqliteDatabase(SqliteHelpers) prepareStatement:].cold.1();
    }
    goto LABEL_31;
  }
  return 0;
}

- (id)_cachedStatementForKey:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  -[NSMutableDictionary objectForKey:](self->_statementCache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stmt");
    if (pLogSql)
    {
      v5 = MEMORY[0x1E0CD3398];
      v6 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
      if (!v6)
      {
        QLTInitLogging();
        v6 = *(NSObject **)(v5 + 8);
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[QLSqliteDatabase(SqliteHelpers) _cachedStatementForKey:].cold.1();
    }
  }
  return v4;
}

- (void)bindUnsignedLongLong:(unint64_t)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  sqlite3 *db;
  uint8_t buf[4];
  sqlite3 *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = sqlite3_bind_int64(a5, v6, a3);
  if ((_DWORD)v9)
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v9, CFSTR("can't bind %llu at index %d"), a3, v6);
  if (pLogSql)
  {
    v10 = MEMORY[0x1E0CD3398];
    v11 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v11)
    {
      QLTInitLogging();
      v11 = *(NSObject **)(v10 + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      db = self->_db;
      *(_DWORD *)buf = 134218496;
      v14 = db;
      v15 = 1024;
      v16 = v6;
      v17 = 2048;
      v18 = a3;
      _os_log_debug_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_DEBUG, "bindUnsignedLongLong %p %d %llu", buf, 0x1Cu);
    }
  }
}

- (unint64_t)unsignedLongLongFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_int64(a4, a3);
}

- (int)intFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_int(a4, a3);
}

- (BOOL)stepStatement:(sqlite3_stmt *)a3 didReturnData:(BOOL *)a4
{
  _BOOL4 v7;
  uint64_t v8;
  int i;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  sqlite3_stmt *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isCorrupted)
    goto LABEL_2;
  if (a4)
    *a4 = 0;
  v8 = MEMORY[0x1E0CD3398];
  for (i = 599; ; --i)
  {
    v10 = sqlite3_step(a3);
    v11 = v10;
    if ((_DWORD)v10 != 5)
      break;
    if (!i)
      goto LABEL_37;
    v12 = *(NSObject **)(v8 + 8);
    if (!v12)
    {
      QLTInitLogging();
      v12 = *(NSObject **)(v8 + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v20 = a3;
      v21 = 1024;
      v22 = i;
      _os_log_debug_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_DEBUG, "failed to step %p because sql was busy, retry count %d", buf, 0x12u);
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 0.1);
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", v13);

  }
  if ((int)v10 > 25)
  {
    if ((_DWORD)v10 == 26)
      goto LABEL_29;
    if ((_DWORD)v10 != 101)
    {
      if ((_DWORD)v10 != 100)
      {
LABEL_37:
        v16 = *(NSObject **)(v8 + 8);
        if (!v16)
        {
          QLTInitLogging();
          v16 = *(NSObject **)(v8 + 8);
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:].cold.1(v16, v11);
        sqlite3_reset(a3);
        -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v11, CFSTR("can't execute statement (%s) retval %d"), sqlite3_sql(a3), v11);
        goto LABEL_2;
      }
      if (pLogSql)
      {
        v14 = *(NSObject **)(v8 + 8);
        if (!v14)
        {
          QLTInitLogging();
          v14 = *(NSObject **)(v8 + 8);
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:].cold.2();
      }
      LOBYTE(v7) = 1;
      if (a4)
        *a4 = 1;
      return v7;
    }
    if (!pLogSql)
      goto LABEL_34;
LABEL_30:
    v15 = *(NSObject **)(v8 + 8);
    if (!v15)
    {
      QLTInitLogging();
      v15 = *(NSObject **)(v8 + 8);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:].cold.2();
      if (!a4)
        goto LABEL_36;
    }
    else
    {
LABEL_34:
      if (!a4)
      {
LABEL_36:
        LOBYTE(v7) = 1;
        return v7;
      }
    }
    *a4 = 0;
    goto LABEL_36;
  }
  if (!(_DWORD)v10)
    goto LABEL_30;
  if ((_DWORD)v10 != 4)
  {
    if ((_DWORD)v10 != 11)
      goto LABEL_37;
LABEL_29:
    -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted");
    goto LABEL_2;
  }
  if (!pLogSql)
  {
LABEL_2:
    LOBYTE(v7) = 0;
    return v7;
  }
  v17 = *(NSObject **)(v8 + 8);
  if (!v17)
  {
    QLTInitLogging();
    v17 = *(NSObject **)(v8 + 8);
  }
  v7 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    -[QLSqliteDatabase(SqliteHelpers) stepStatement:didReturnData:].cold.4(v17);
    goto LABEL_2;
  }
  return v7;
}

- (id)newDataFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 copyBytes:(BOOL)a5
{
  const void *v8;
  int v9;
  uint64_t v10;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = sqlite3_column_blob(a4, a3);
  v9 = sqlite3_column_bytes(a4, a3);
  if (!v8 || !v9)
    return 0;
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0C99D50]);
  if (a5)
    return (id)objc_msgSend(v11, "initWithBytes:length:", v8, v10);
  else
    return (id)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v8, v10, 0);
}

- (float)floatFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_double(a4, a3);
}

- (double)doubleFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_double(a4, a3);
}

- (void)bindDouble:(double)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  sqlite3 *db;
  uint8_t buf[4];
  sqlite3 *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = sqlite3_bind_double(a5, v6, a3);
  if ((_DWORD)v9)
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v9, CFSTR("can't bind %g at index %d"), *(_QWORD *)&a3, v6);
  if (pLogSql)
  {
    v10 = MEMORY[0x1E0CD3398];
    v11 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v11)
    {
      QLTInitLogging();
      v11 = *(NSObject **)(v10 + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      db = self->_db;
      *(_DWORD *)buf = 134218496;
      v14 = db;
      v15 = 1024;
      v16 = v6;
      v17 = 2048;
      v18 = a3;
      _os_log_debug_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_DEBUG, "bindInt %p %d %g", buf, 0x1Cu);
    }
  }
}

- (BOOL)stepStatement:(sqlite3_stmt *)a3
{
  return -[QLSqliteDatabase stepStatement:didReturnData:](self, "stepStatement:didReturnData:", a3, 0);
}

- (id)newStringFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  id v8;
  unsigned __int8 *v9;
  void *v10;
  void *v11;
  unsigned __int8 *v12;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = (unsigned __int8 *)sqlite3_column_text(a4, a3);
  if (v9)
  {
    v9 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v9);
    if (v8)
    {
      objc_msgSend(v8, "member:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;

        v9 = v12;
      }
      else
      {
        objc_msgSend(v8, "addObject:", v9);
      }

    }
  }

  return v9;
}

- (void)bindObject:(id)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  sqlite3 *db;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  sqlite3 *v25;
  __int16 v26;
  sqlite3_stmt *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!pLogSql)
    goto LABEL_5;
  v9 = MEMORY[0x1E0CD3398];
  v10 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
  if (!v10)
  {
    QLTInitLogging();
    v10 = *(NSObject **)(v9 + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    db = self->_db;
    v19 = v10;
    objc_msgSend(v8, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v25 = db;
    v26 = 2048;
    v27 = a5;
    v28 = 1024;
    v29 = v6;
    v30 = 2112;
    v31 = v20;
    _os_log_debug_impl(&dword_1D54AE000, v19, OS_LOG_TYPE_DEBUG, "bindObject db %p stmt %p %d %@", buf, 0x26u);

    if (!v8)
      goto LABEL_16;
  }
  else
  {
LABEL_5:
    if (!v8)
    {
LABEL_16:
      v13 = sqlite3_bind_null(a5, v6);
      goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[QLSqliteDatabase bindCFURL:atIndex:inStatement:](self, "bindCFURL:atIndex:inStatement:", v8, v6, a5);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_retainAutorelease(v8);
    v13 = sqlite3_bind_blob(a5, v6, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = objc_opt_class();
      objc_msgSend(v8, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", 0, CFSTR("can't bind objects of class %@ (= '%@') at index %d"), v16, v17, v6);

      goto LABEL_19;
    }
    v14 = objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4);
    v15 = malloc_type_malloc(v14 + 1, 0x100004077774924uLL);
    if (!objc_msgSend(v8, "getCString:maxLength:encoding:", v15, v14 + 1, 4))
    {
      free(v15);
      -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", 0, CFSTR("can't get UTF8 encoding for '%@' (length %ld)"), v8, v14);
      goto LABEL_19;
    }
    v13 = sqlite3_bind_text(a5, v6, (const char *)v15, v14, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  }
LABEL_17:
  v21 = v13;
  if ((_DWORD)v13)
  {
    v22 = objc_opt_class();
    objc_msgSend(v8, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v21, CFSTR("can't bind %@ (= '%@') at index %d"), v22, v23, v6);

  }
LABEL_19:

}

void __23__QLSqliteDatabase_do___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D82731C0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)endTransaction
{
  int64_t v3;
  NSObject *v4;
  uint64_t v5;
  char *errmsg;

  if (self->transactionCount >= 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v3 = self->transactionCount - 1;
    self->transactionCount = v3;
    if (!v3)
    {
      errmsg = 0;
      if (sqlite3_exec(self->_db, "END;", 0, 0, &errmsg))
      {
        v4 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
        if (!v4)
        {
          v5 = MEMORY[0x1E0CD3398];
          QLTInitLogging();
          v4 = *(NSObject **)(v5 + 8);
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          -[QLSqliteDatabase(SqliteHelpers) endTransaction].cold.1();
      }
    }
  }
}

- (BOOL)beginTransaction
{
  int64_t transactionCount;
  BOOL v4;
  int v5;
  NSObject *v6;
  uint64_t v8;
  char *errmsg;

  transactionCount = self->transactionCount;
  if (transactionCount < 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_isCorrupted)
    {
      return 0;
    }
    else
    {
      errmsg = 0;
      v5 = sqlite3_exec(self->_db, "BEGIN;", 0, 0, &errmsg);
      v4 = v5 == 0;
      if (v5)
      {
        v6 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
        if (!v6)
        {
          v8 = MEMORY[0x1E0CD3398];
          QLTInitLogging();
          v6 = *(NSObject **)(v8 + 8);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[QLSqliteDatabase(SqliteHelpers) beginTransaction].cold.1();
      }
      else
      {
        self->transactionCount = 1;
      }
    }
  }
  else
  {
    self->transactionCount = transactionCount + 1;
    return 1;
  }
  return v4;
}

- (BOOL)isOpened
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_db != 0;
}

- (void)do:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__QLSqliteDatabase_do___block_invoke;
  block[3] = &unk_1E99D2A68;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)runStatement:(sqlite3_stmt *)a3 stepHandler:(id)a4
{
  unsigned int (**v6)(_QWORD);
  char v7;

  v6 = (unsigned int (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  while (-[QLSqliteDatabase stepStatement:didReturnData:](self, "stepStatement:didReturnData:", a3, &v7)
       && v7
       && (!v6 || v6[2](v6)))
    ;
  -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self, "resetStatement:unbindValuesThroughIndex:", a3, 0);

}

- (id)_cacheStatement:(sqlite3_stmt *)a3 forKey:(id)a4
{
  id v6;
  QLSqliteDatabaseStatementWrapper *v7;
  uint64_t v8;
  NSObject *v9;
  NSMutableDictionary *statementCache;
  NSObject *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  NSMutableDictionary *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[QLSqliteDatabaseStatementWrapper initWithStatement:key:inUseTable:]([QLSqliteDatabaseStatementWrapper alloc], "initWithStatement:key:inUseTable:", a3, v6, self->_statementsInUseTable);
  -[NSMutableDictionary setObject:forKey:](self->_statementCache, "setObject:forKey:", v7, v6);
  if ((unint64_t)-[NSMutableDictionary count](self->_statementCache, "count") >= 0x33)
  {
    v8 = MEMORY[0x1E0CD3398];
    v9 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v9)
    {
      QLTInitLogging();
      v9 = *(NSObject **)(v8 + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      statementCache = self->_statementCache;
      v11 = v9;
      v12 = -[NSMutableDictionary count](statementCache, "count");
      v13 = self->_statementCache;
      v15 = 134218498;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "[Warning] We are caching too many statements (%lu), we are expecting to cache only a few (50 max). Cached statements: %@. Last statement cached: %@.", (uint8_t *)&v15, 0x20u);

    }
  }

  return v7;
}

- (void)_finalizeStatement:(sqlite3_stmt *)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  sqlite3 **p_db;
  sqlite3 *db;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;

  v5 = sqlite3_finalize(*a3);
  if (!pLogSql)
    goto LABEL_5;
  v6 = MEMORY[0x1E0CD3398];
  v7 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
  if (!v7)
  {
    QLTInitLogging();
    v7 = *(NSObject **)(v6 + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[QLSqliteDatabase(SqliteHelpers_Internal) _finalizeStatement:].cold.3();
    if (!v5)
      goto LABEL_20;
  }
  else
  {
LABEL_5:
    if (!v5)
      goto LABEL_20;
  }
  if (v5 == 26 || v5 == 11)
  {
    -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted");
  }
  else
  {
    db = self->_db;
    p_db = &self->_db;
    sqlite3_errmsg(db);
    v11 = MEMORY[0x1E0CD3398];
    v12 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v12)
    {
      QLTInitLogging();
      v12 = *(NSObject **)(v11 + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[QLSqliteDatabase(SqliteHelpers_Internal) _finalizeStatement:].cold.2((uint64_t)p_db, v12);
    v13 = *(NSObject **)(v11 + 8);
    if (!v13)
    {
      QLTInitLogging();
      v13 = *(NSObject **)(v11 + 8);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[QLSqliteDatabase(SqliteHelpers_Internal) _finalizeStatement:].cold.1((uint64_t)p_db, v13);
  }
LABEL_20:
  *a3 = 0;
}

- (void)_databaseCorrupted
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[QLSqliteDatabase setIsCorrupted:](self, "setIsCorrupted:", 1);
  v3 = MEMORY[0x1E0CD3398];
  v4 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
  if (!v4)
  {
    QLTInitLogging();
    v4 = *(NSObject **)(v3 + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[QLSqliteDatabase(SqliteHelpers_Internal) _databaseCorrupted].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (QLSqliteDatabase)init
{
  QLSqliteDatabase *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *statementCache;
  uint64_t v8;
  NSMapTable *statementsInUseTable;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLSqliteDatabase;
  v2 = -[QLSqliteDatabase init](&v11, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("quicklookd.cachedb", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = objc_opt_new();
  statementCache = v2->_statementCache;
  v2->_statementCache = (NSMutableDictionary *)v6;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 256, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  statementsInUseTable = v2->_statementsInUseTable;
  v2->_statementsInUseTable = (NSMapTable *)v8;

  return v2;
}

- (id)queue
{
  return self->_queue;
}

- (void)openDatabaseAtPath:(id)a3
{
  id v5;
  id v6;
  sqlite3 **p_db;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_path, a3);
  v6 = objc_retainAutorelease(v5);
  p_db = &self->_db;
  if (sqlite3_open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &self->_db))
  {
    sqlite3_close(*p_db);
    *p_db = 0;
  }
  else
  {
    -[QLSqliteDatabase setIsCorrupted:](self, "setIsCorrupted:", 0);
    if (sqlite3_exec(self->_db, "pragma journal_mode=WAL;", 0, 0, 0))
    {
      v8 = MEMORY[0x1E0CD3398];
      v9 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
      if (!v9)
      {
        QLTInitLogging();
        v9 = *(NSObject **)(v8 + 8);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[QLSqliteDatabase openDatabaseAtPath:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLSqliteDatabase;
  -[QLSqliteDatabase dealloc](&v2, sel_dealloc);
}

- (void)closeDatabase
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_1D54AE000, v0, v1, "End transaction error at close time: %s (%i)", v2, v3);
  OUTLINED_FUNCTION_5();
}

- (void)_dropStatementCache
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_statementCache, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isInUse") & 1) == 0)
        {
          v9 = 0;
          v9 = objc_msgSend(v8, "stmt");
          if (v9)
            -[QLSqliteDatabase _finalizeStatement:](self, "_finalizeStatement:", &v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_statementCache, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_statementsInUseTable, "removeAllObjects");
}

- (BOOL)isCorrupted
{
  return self->_isCorrupted;
}

- (void)setIsCorrupted:(BOOL)a3
{
  self->_isCorrupted = a3;
}

- (NSString)tracingPrefix
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTracingPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracingPrefix, 0);
  objc_storeStrong((id *)&self->_statementsInUseTable, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (void)toggleSqlLogging
{
  pLogSql = pLogSql == 0;
}

- (void)enableSqliteTracing:(id)a3
{
  NSString *v4;
  NSString *tracingPrefix;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    v4 = (NSString *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <db=%p> : "), 0, self->_db);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  tracingPrefix = self->_tracingPrefix;
  self->_tracingPrefix = v4;

  sqlite3_trace_v2(self->_db, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))traceSQL, self);
}

- (void)disableSqliteTracing
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sqlite3_trace_v2(self->_db, 0, 0, 0);
}

- (void)executeWithCallback:(void *)a3 context:(void *)a4 rollbackOnError:(BOOL)a5 sql:(const char *)a6 arguments:(char *)a7
{
  char *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  char *errmsg;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    v12 = sqlite3_vmprintf(a6, a7);
    if (pLogSql)
    {
      v13 = MEMORY[0x1E0CD3398];
      v14 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
      if (!v14)
      {
        QLTInitLogging();
        v14 = *(NSObject **)(v13 + 8);
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[QLSqliteDatabase(SqliteHelpers) executeWithCallback:context:rollbackOnError:sql:arguments:].cold.1();
    }
    errmsg = 0;
    v15 = sqlite3_exec(self->_db, v12, (int (__cdecl *)(void *, int, char **, char **))a3, a4, &errmsg);
    if ((v15 & 0xFFFFFFFB) != 0)
    {
      v16 = v15;
      v17 = 600;
      while (v16 == 5)
      {
        if (!--v17)
          goto LABEL_15;
        v18 = (void *)MEMORY[0x1E0CB3978];
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sleepUntilDate:", v19);

LABEL_16:
        errmsg = 0;
        v16 = sqlite3_exec(self->_db, v12, (int (__cdecl *)(void *, int, char **, char **))a3, a4, &errmsg);
        if ((v16 & 0xFFFFFFFB) == 0)
          goto LABEL_19;
      }
      if (v16 == 11 || v16 == 26)
      {
        -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted");
        goto LABEL_19;
      }
LABEL_15:
      -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v12);
      goto LABEL_16;
    }
LABEL_19:
    sqlite3_free(v12);
  }
}

- (void)executeWithBlob:(const void *)a3 length:(int)a4 format:(const char *)a5
{
  char *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  sqlite3_stmt *v16;
  int v17;
  uint64_t v18;
  void *v20;
  void *v21;
  uint64_t v22;
  sqlite3_stmt *ppStmt[2];
  char v24;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isCorrupted)
  {
    ppStmt[1] = (sqlite3_stmt *)&v24;
    v9 = sqlite3_vmprintf(a5, &v24);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLSqliteDatabase _cachedStatementForKey:](self, "_cachedStatementForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ppStmt[0] = (sqlite3_stmt *)objc_msgSend(v11, "stmt");
    if (ppStmt[0])
    {
LABEL_13:
      sqlite3_free(v9);
      objc_msgSend(v11, "setInUse:", 1);
      v16 = ppStmt[0];
      if (ppStmt[0])
      {
        v17 = -600;
        while (1)
        {
          if (self->_isCorrupted)
            goto LABEL_29;
          v18 = sqlite3_step(v16);
          if ((_DWORD)v18 != 5)
            break;
          if (__CFADD__(v17++, 1))
            goto LABEL_27;
          v20 = (void *)MEMORY[0x1E0CB3978];
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v18, 0.1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sleepUntilDate:", v21);

          v16 = ppStmt[0];
          if (!ppStmt[0])
            goto LABEL_29;
        }
        if ((int)v18 <= 10)
        {
          if ((_DWORD)v18 && (_DWORD)v18 != 4)
LABEL_27:
            -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v18, CFSTR("error while executing '%s'"), v9);
        }
        else
        {
          if ((_DWORD)v18 != 11 && (_DWORD)v18 != 26)
          {
            if ((_DWORD)v18 == 101)
              goto LABEL_29;
            goto LABEL_27;
          }
          -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted", v18);
        }
      }
LABEL_29:
      -[QLSqliteDatabase finalizeStatement:](self, "finalizeStatement:", ppStmt);
      goto LABEL_30;
    }
    v12 = strlen(v9);
    v13 = sqlite3_prepare_v2(self->_db, v9, v12, ppStmt, 0);
    if ((_DWORD)v13)
    {
      if ((_DWORD)v13 != 26 && (_DWORD)v13 != 11)
      {
        -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v13, CFSTR("preparing '%s'"), v9);
        goto LABEL_30;
      }
      -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted", v13);
    }
    if (!ppStmt[0])
      goto LABEL_12;
    v14 = sqlite3_bind_blob(ppStmt[0], 1, a3, a4, 0);
    if (!(_DWORD)v14)
      goto LABEL_12;
    if ((_DWORD)v14 == 26 || (_DWORD)v14 == 11)
    {
      -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted", v14);
LABEL_12:
      -[QLSqliteDatabase _cacheStatement:forKey:](self, "_cacheStatement:forKey:", ppStmt[0], v10);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
      goto LABEL_13;
    }
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v14, CFSTR("error while binding blog"), v22);
LABEL_30:

  }
}

- (void)execute:(const char *)a3
{
  uint64_t v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[QLSqliteDatabase executeWithCallback:context:rollbackOnError:sql:arguments:](self, "executeWithCallback:context:rollbackOnError:sql:arguments:", 0, 0, 0, a3, &v5);
}

- (void)executeWithRollbackOnError:(const char *)a3
{
  uint64_t v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[QLSqliteDatabase executeWithCallback:context:rollbackOnError:sql:arguments:](self, "executeWithCallback:context:rollbackOnError:sql:arguments:", 0, 0, 1, a3, &v5);
}

- (void)executeWithCallback:(void *)a3 context:(void *)a4 sql:(const char *)a5
{
  uint64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[QLSqliteDatabase executeWithCallback:context:rollbackOnError:sql:arguments:](self, "executeWithCallback:context:rollbackOnError:sql:arguments:", a3, a4, 0, a5, &v9);
}

- (void)executeSql:(const char *)a3 withCallback:(void *)a4 context:(void *)a5
{
  -[QLSqliteDatabase executeWithCallback:context:rollbackOnError:sql:arguments:](self, "executeWithCallback:context:rollbackOnError:sql:arguments:", a4, a5, 0, a3, 0);
}

- (id)_crapPath
{
  return -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("lasterror"));
}

- (void)sqliteCrappedOut:(int)a3 message:(id)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  sqlite3 *db;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  NSString *path;
  id v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;

  v35 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v7 = a4;
  dispatch_assert_queue_V2(queue);
  v26[1] = &v36;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v7, &v36);

  v26[0] = 0;
  -[QLSqliteDatabase lastCrapWithDate:](self, "lastCrapWithDate:", v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26[0];
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = sqlite3_errcode(self->_db);
  objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected behavior of sqllite bridge: (triggered by %ld - database errcode: %ld - %s)"), a3, v12, sqlite3_errmsg(self->_db));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  if ((objc_msgSend(v13, "isEqual:", v15) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v9, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLSqliteDatabase _crapPath](self, "_crapPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v17, 1, 4, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v13, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLSqliteDatabase _crapPath](self, "_crapPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v18, 1, 4, 0);

    if (a3 == 14)
      sqlite3_errcode(self->_db);
  }

  v19 = MEMORY[0x1E0CD3398];
  v20 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
  if (!v20)
  {
    QLTInitLogging();
    v20 = *(NSObject **)(v19 + 8);
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    db = self->_db;
    v22 = v20;
    v23 = sqlite3_errcode(db);
    v24 = sqlite3_errmsg(self->_db);
    path = self->_path;
    *(_DWORD *)buf = 138413058;
    v28 = v8;
    v29 = 2048;
    v30 = v23;
    v31 = 2080;
    v32 = v24;
    v33 = 2112;
    v34 = path;
    _os_log_error_impl(&dword_1D54AE000, v22, OS_LOG_TYPE_ERROR, "%@: %ld (%s) (database path: %@)", buf, 0x2Au);

  }
  -[QLSqliteDatabase _databaseCorrupted](self, "_databaseCorrupted");

}

- (id)lastCrapWithDate:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[QLSqliteDatabase _crapPath](self, "_crapPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "getResourceValue:forKey:error:", a3, *MEMORY[0x1E0C998D8], 0))
  {

LABEL_5:
    v6 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v4, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v6;
}

- (int64_t)lastInsertRowId
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_last_insert_rowid(self->_db);
}

- (void)checkpoint
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  int pnCkpt[2];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  *(_QWORD *)pnCkpt = 0;
  v3 = sqlite3_wal_checkpoint_v2(self->_db, 0, 0, &pnCkpt[1], pnCkpt);
  v4 = MEMORY[0x1E0CD3398];
  v5 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
  if (!v5)
  {
    QLTInitLogging();
    v5 = *(NSObject **)(v4 + 8);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v7 = sqlite3_errstr(v3);
    *(_DWORD *)buf = 67109890;
    v10 = v3;
    v11 = 2080;
    v12 = v7;
    v13 = 1024;
    v14 = pnCkpt[1];
    v15 = 1024;
    v16 = pnCkpt[0];
    _os_log_debug_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_DEBUG, "called sqlite3_wal_checkpoint_v2(SQLITE_CHECKPOINT_PASSIVE) with result %d, %s, walframes=%d framesCheckpointed=%d", buf, 0x1Eu);

  }
}

- (void)bindBytes:(void *)a3 length:(unsigned int)a4 atIndex:(int)a5 inStatement:(sqlite3_stmt *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = sqlite3_bind_blob(a6, v7, a3, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((_DWORD)v11)
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v11, CFSTR("can't bind bytes (%d) at index %d"), v8, v7);
}

- (void)bindCFURL:(__CFURL *)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UInt8 buffer[1024];
  uint64_t v14;

  v6 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CFURLGetFileSystemRepresentation(a3, 1u, buffer, 1024))
  {
    v9 = strlen((const char *)buffer);
    v10 = sqlite3_bind_text(a5, v6, (const char *)buffer, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((_DWORD)v10)
      -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v10, CFSTR("can't bind %@ (= '%@') at index %d"), objc_opt_class(), a3, v6);
  }
  else
  {
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", 0, CFSTR("can't get FS representation for '%@'"), a3, v11, v12);
  }
}

- (void)bindPath:(id)a3 atIndex:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  uint64_t v6;
  __CFString *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char buffer[1024];
  uint64_t v15;

  v6 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  if (CFStringGetFileSystemRepresentation(v8, buffer, 1024))
  {
    v9 = strlen(buffer);
    v10 = sqlite3_bind_text(a5, v6, buffer, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((_DWORD)v10)
    {
      v11 = v10;
      v12 = objc_opt_class();
      -[__CFString description](v8, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", v11, CFSTR("can't bind %@ (= '%@') at index %d"), v12, v13, v6);

    }
  }
  else
  {
    -[QLSqliteDatabase sqliteCrappedOut:message:](self, "sqliteCrappedOut:message:", 0, CFSTR("can't get FS representation for '%@'"), v8);
  }

}

- (int64_t)columnCount:(sqlite3_stmt *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return sqlite3_column_count(a3);
}

- (id)newColumnName:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  id v8;
  char *v9;
  void *v10;
  void *v11;
  char *v12;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = (char *)sqlite3_column_name(a4, a3);
  if (v9)
  {
    v9 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v9);
    if (v8)
    {
      objc_msgSend(v8, "member:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;

        v9 = v12;
      }
      else
      {
        objc_msgSend(v8, "addObject:", v9);
      }

    }
  }

  return v9;
}

- (__CFURL)newCFURLFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4
{
  __CFURL *result;
  __CFURL *v7;
  size_t v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = (__CFURL *)sqlite3_column_text(a4, a3);
  if (result)
  {
    v7 = result;
    v8 = strlen((const char *)result);
    return CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)v7, v8, 0);
  }
  return result;
}

- (__CFString)newCFStringFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  uint64_t v6;
  NSObject *queue;
  id v9;
  id v10;
  __CFString *v11;

  v6 = *(_QWORD *)&a3;
  queue = self->_queue;
  v9 = a5;
  dispatch_assert_queue_V2(queue);
  v10 = -[QLSqliteDatabase newStringFromColumn:inStatement:uniqueInStringTable:](self, "newStringFromColumn:inStatement:uniqueInStringTable:", v6, a4, v9);

  v11 = (__CFString *)v10;
  return v11;
}

- (id)newPathFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 uniqueInStringTable:(id)a5
{
  id v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = (char *)sqlite3_column_text(a4, a3);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFileSystemRepresentation:length:", v9, strlen(v9));
    v9 = (char *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v9)
      {
        objc_msgSend(v8, "member:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;

          v9 = v13;
        }
        else
        {
          objc_msgSend(v8, "addObject:", v9);
        }

      }
    }
  }

  return v9;
}

- (void)newBufferFromColumn:(int)a3 inStatement:(sqlite3_stmt *)a4 length:(unsigned int *)a5
{
  const void *v8;
  signed int v9;
  size_t v10;
  void *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = sqlite3_column_blob(a4, a3);
  v9 = sqlite3_column_bytes(a4, a3);
  if (a5)
    *a5 = v9;
  v10 = v9;
  v11 = malloc_type_malloc(v9, 0x7F551EEuLL);
  return memcpy(v11, v8, v10);
}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundObjects:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6
{
  uint64_t v7;
  id v10;
  uint64_t (**v11)(_QWORD);
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  unsigned int v24;
  unint64_t v25;
  void *v26;
  char v27;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = (uint64_t (**)(_QWORD))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = objc_msgSend(v10, "count");
  v26 = v10;
  if (v10)
  {
    v13 = v7 + 20;
    v14 = v12;
    if (v12)
    {
      v15 = 0;
      v25 = v12;
      v16 = v7;
      v24 = v7;
      v23 = v12;
      do
      {
        if (v7 > 0xFFFFFFEB)
        {
          v21 = v7;
        }
        else
        {
          v17 = 0;
          do
          {
            v18 = v15 + v17;
            v19 = v16 + v17;
            objc_msgSend(v26, "objectAtIndex:", v15 + v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[QLSqliteDatabase bindObject:atIndex:inStatement:](self, "bindObject:atIndex:inStatement:", v20, (v16 + v17), a3);

            ++v17;
          }
          while (v19 + 1 < v13 && v18 + 1 < v25);
          v15 = (v15 + v17);
          v21 = (v16 + v17);
          v7 = v24;
          v14 = v23;
        }
        if (v21 < v13)
        {
          do
          {
            -[QLSqliteDatabase bindObject:atIndex:inStatement:](self, "bindObject:atIndex:inStatement:", 0, v21, a3);
            v21 = (v21 + 1);
          }
          while (v13 != (_DWORD)v21);
        }
        v27 = 0;
        while (-[QLSqliteDatabase stepStatement:didReturnData:](self, "stepStatement:didReturnData:", a3, &v27) && v27)
        {
          if (v11 && (v11[2](v11) & 1) == 0)
          {
            -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self, "resetStatement:unbindValuesThroughIndex:", a3, 0);
            goto LABEL_21;
          }
        }
        -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self, "resetStatement:unbindValuesThroughIndex:", a3, 0);
      }
      while (v15 < v14);
    }
LABEL_21:
    if (v13 >= 2)
    {
      v22 = -19;
      do
      {
        -[QLSqliteDatabase bindObject:atIndex:inStatement:](self, "bindObject:atIndex:inStatement:", 0, (v22 + 20), a3);
        ++v22;
      }
      while ((_DWORD)v7 != v22);
    }
  }
  else
  {
    -[QLSqliteDatabase runStatement:stepHandler:](self, "runStatement:stepHandler:", a3, v11);
  }

}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundRowIds:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  id v12;

  v7 = *(_QWORD *)&a5;
  v12 = a4;
  v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v12, "count"))
  {
    v11 = malloc_type_calloc(objc_msgSend(v12, "count"), 8uLL, 0x100004000313F17uLL);
    objc_msgSend(v12, "getIndexes:maxCount:inIndexRange:", v11, objc_msgSend(v12, "count"), 0);
    -[QLSqliteDatabase runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:](self, "runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:", a3, v11, objc_msgSend(v12, "count"), v7, v10);
    free(v11);
  }
  else
  {
    -[QLSqliteDatabase runStatement:stepHandler:](self, "runStatement:stepHandler:", a3, v10);
  }

}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundNumbers:(id)a4 startingAtIndex:(int)a5 stepHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[3];
  int v15;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v10, "count"))
  {
    v12 = malloc_type_calloc(objc_msgSend(v10, "count"), 8uLL, 0x100004000313F17uLL);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__QLSqliteDatabase_SqliteHelpers__runStatement_withBoundNumbers_startingAtIndex_stepHandler___block_invoke;
    v13[3] = &unk_1E99D2A90;
    v13[4] = v14;
    v13[5] = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
    -[QLSqliteDatabase runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:](self, "runStatement:withBoundRowIds:count:startingAtIndex:stepHandler:", a3, v12, objc_msgSend(v10, "count"), v7, v11);
    free(v12);
    _Block_object_dispose(v14, 8);
  }
  else
  {
    -[QLSqliteDatabase runStatement:stepHandler:](self, "runStatement:stepHandler:", a3, v11);
  }

}

uint64_t __93__QLSqliteDatabase_SqliteHelpers__runStatement_withBoundNumbers_startingAtIndex_stepHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "unsignedLongLongValue");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  *(_QWORD *)(v4 + 8 * v6) = result;
  return result;
}

- (void)runStatement:(sqlite3_stmt *)a3 withBoundRowIds:(unint64_t *)a4 count:(unint64_t)a5 startingAtIndex:(int)a6 stepHandler:(id)a7
{
  uint64_t v7;
  uint64_t (**v12)(_QWORD);
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  char v17;

  v7 = *(_QWORD *)&a6;
  v12 = (uint64_t (**)(_QWORD))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    v13 = v7 + 20;
    if (a5)
    {
      v14 = 0;
      do
      {
        v15 = v7;
        if (v7 <= 0xFFFFFFEB)
        {
          do
          {
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self, "bindUnsignedLongLong:atIndex:inStatement:", a4[v14], v15, a3);
            v15 = (v15 + 1);
            ++v14;
          }
          while (v15 < v13 && v14 < a5);
        }
        if (v15 < v13)
        {
          do
          {
            sqlite3_bind_null(a3, v15);
            LODWORD(v15) = v15 + 1;
          }
          while (v13 != (_DWORD)v15);
        }
        v17 = 0;
        while (-[QLSqliteDatabase stepStatement:didReturnData:](self, "stepStatement:didReturnData:", a3, &v17) && v17)
        {
          if (v12 && (v12[2](v12) & 1) == 0)
          {
            -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self, "resetStatement:unbindValuesThroughIndex:", a3, 0);
            goto LABEL_18;
          }
        }
        -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self, "resetStatement:unbindValuesThroughIndex:", a3, 0);
      }
      while (v14 < a5);
    }
LABEL_18:
    if (v13 >= 2)
    {
      v16 = -19;
      do
      {
        sqlite3_bind_null(a3, v16 + 20);
        ++v16;
      }
      while ((_DWORD)v7 != v16);
    }
  }
  else
  {
    -[QLSqliteDatabase runStatement:stepHandler:](self, "runStatement:stepHandler:", a3, v12);
  }

}

- (void)setSqliteCacheSize:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 >= 1 && !self->_isCorrupted)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma cache_size=%ld"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0CD3398];
    v7 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
    if (!v7)
    {
      QLTInitLogging();
      v7 = *(NSObject **)(v6 + 8);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[QLSqliteDatabase(SqliteHelpers) setSqliteCacheSize:].cold.1();
    v8 = objc_retainAutorelease(v5);
    -[QLSqliteDatabase execute:](self, "execute:", objc_msgSend(v8, "UTF8String"));

  }
}

- (void)vacuum
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[QLSqliteDatabase execute:](self, "execute:", "vacuum");
}

void __23__QLSqliteDatabase_do___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_ERROR, "Exception executing database block: %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)openDatabaseAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D54AE000, a1, a3, "failed to set journal mode to wal", a5, a6, a7, a8, 0);
}

@end
