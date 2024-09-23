@implementation _PASSqliteStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnMapping, 0);
}

- (int64_t)getInt64ForColumn:(int)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (int)bindNamedParam:(const char *)a3 toNonnullNSString:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNonnullNSString:](self, "bindParam:toNonnullNSString:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (_PASSQLColumnMapping)columnMapping
{
  return self->_columnMapping;
}

- (void)prepareToRunQuery
{
  -[_PASSQLColumnMapping invalidateIfNeeded](self->_columnMapping, "invalidateIfNeeded");
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (_PASSqliteStatement)initWithStatementPointer:(sqlite3_stmt *)a3 columnMapping:(id)a4
{
  id v7;
  _PASSqliteStatement *v8;
  _PASSqliteStatement *v9;
  _PASSQLColumnMapping *v10;
  _PASSQLColumnMapping *columnMapping;
  void *v13;
  objc_super v14;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stmt"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_PASSqliteStatement;
  v8 = -[_PASSqliteStatement init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_stmt = a3;
    if (v7)
      v10 = (_PASSQLColumnMapping *)v7;
    else
      v10 = -[_PASSQLColumnMapping initWithStatementPtr:]([_PASSQLColumnMapping alloc], "initWithStatementPtr:", a3);
    columnMapping = v9->_columnMapping;
    v9->_columnMapping = v10;

  }
  return v9;
}

- (int)_checkBindStatus:(int)a3 forIndex:(int)a4
{
  uint64_t v5;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _PASSqliteStatement *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    if (a3 == 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 376, CFSTR("SQLITE_NOMEM when binding to index %i: %@"), v5, self);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109890;
      v11 = a3;
      v12 = 2080;
      v13 = sqlite3_errstr(a3);
      v14 = 1024;
      v15 = v5;
      v16 = 2112;
      v17 = self;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Error %i (%s) binding to index %i (this is typically caused by a bug, and may become a fatal error in the future!): %@", buf, 0x22u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  return a3;
}

- (int)bindParam:(int)a3 toNonnullNSString:(id)a4
{
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", _PAS_sqlite3_bind_nsstring(self->_stmt, a3, a4), *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toNSString:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindParam:toNonnullNSString:](self, "bindParam:toNonnullNSString:", *(_QWORD *)&a3);
  else
    return -[_PASSqliteStatement bindParamToNull:](self, "bindParamToNull:", *(_QWORD *)&a3);
}

- (void)prepareForRowDeserialization
{
  -[_PASSQLColumnMapping resetSearchHint](self->_columnMapping, "resetSearchHint");
}

- (id)getNSDataForColumn:(int)a3
{
  return _PAS_sqlite3_column_nsdata(self->_stmt, a3);
}

- (BOOL)isColumnNull:(int)a3
{
  return sqlite3_column_type(self->_stmt, a3) == 5;
}

- (int)bindNamedParam:(const char *)a3 toDouble:(double)a4
{
  sqlite3_stmt *stmt;
  int v6;

  stmt = self->_stmt;
  v6 = _indexForBindParam(stmt, (char *)a3);
  return sqlite3_bind_double(stmt, v6, a4);
}

- (int)bindNamedParam:(const char *)a3 toNSArray:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSArray:](self, "bindParam:toNSArray:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSIndexSet:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSIndexSet:](self, "bindParam:toNSIndexSet:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)_bindParam:(int)a3 toObjcObject:(id)a4 sqliteMethodName:(const char *)a5
{
  uint64_t v6;
  id v9;
  id v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v14 = a5;
    v15 = 2112;
    v16 = (id)objc_opt_class();
    v17 = 2048;
    v18 = v9;
    v19 = 1024;
    v20 = v6;
    v11 = v16;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitestatement Retaining %s(%@ %p) for param %d", buf, 0x26u);

    if (v9)
      return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_pointer(self->_stmt, v6, v9, a5, (void (__cdecl *)(void *))releaseObjcObject), v6);
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objcObject"));

    return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_pointer(self->_stmt, v6, v9, a5, (void (__cdecl *)(void *))releaseObjcObject), v6);
  }
  if (!v9)
    goto LABEL_5;
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_pointer(self->_stmt, v6, v9, a5, (void (__cdecl *)(void *))releaseObjcObject), v6);
}

- (int)bindNamedParam:(const char *)a3 toInteger:(int64_t)a4
{
  sqlite3_stmt *stmt;
  int v6;

  stmt = self->_stmt;
  v6 = _indexForBindParam(stmt, (char *)a3);
  return sqlite3_bind_int64(stmt, v6, a4);
}

- (int)bindNamedParam:(const char *)a3 toNSData:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSData:](self, "bindParam:toNSData:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSString:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSString:](self, "bindParam:toNSString:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toInt64:(int64_t)a4
{
  sqlite3_stmt *stmt;
  int v6;

  stmt = self->_stmt;
  v6 = _indexForBindParam(stmt, (char *)a3);
  return sqlite3_bind_int64(stmt, v6, a4);
}

- (int)bindParam:(int)a3 toNonnullNSData:(id)a4
{
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", _PAS_sqlite3_bind_nsdata(self->_stmt, a3, a4), *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toNSData:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindParam:toNonnullNSData:](self, "bindParam:toNonnullNSData:", *(_QWORD *)&a3);
  else
    return -[_PASSqliteStatement bindParamToNull:](self, "bindParamToNull:", *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toNSIndexSet:(id)a4
{
  return -[_PASSqliteStatement _bindParam:toObjcObject:sqliteMethodName:](self, "_bindParam:toObjcObject:sqliteMethodName:", *(_QWORD *)&a3, a4, "_pas_nsindexset");
}

- (int)bindParam:(int)a3 toNSArray:(id)a4
{
  return -[_PASSqliteStatement _bindParam:toObjcObject:sqliteMethodName:](self, "_bindParam:toObjcObject:sqliteMethodName:", *(_QWORD *)&a3, a4, "_pas_nsarray");
}

- (id)getNSStringForColumn:(int)a3
{
  return _PAS_sqlite3_column_nsstring(self->_stmt, a3);
}

- (int)bindNamedParam:(const char *)a3 toNSSet:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSSet:](self, "bindParam:toNSSet:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindParam:(int)a3 toNSSet:(id)a4
{
  return -[_PASSqliteStatement _bindParam:toObjcObject:sqliteMethodName:](self, "_bindParam:toObjcObject:sqliteMethodName:", *(_QWORD *)&a3, a4, "_pas_nsset");
}

- (int)bindNamedParam:(const char *)a3 toBlock:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toBlock:](self, "bindParam:toBlock:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindParam:(int)a3 toBlock:(id)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  LODWORD(v4) = -[_PASSqliteStatement _bindParam:toObjcObject:sqliteMethodName:](self, "_bindParam:toObjcObject:sqliteMethodName:", v4, v6, "_pas_block");

  return v4;
}

- (int)bindParamToNull:(int)a3
{
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_null(self->_stmt, a3), *(_QWORD *)&a3);
}

- (_PASSqliteStatement)initWithStatementPointer:(sqlite3_stmt *)a3
{
  return -[_PASSqliteStatement initWithStatementPointer:columnMapping:](self, "initWithStatementPointer:columnMapping:", a3, 0);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", sqlite3_sql(self->_stmt), 4);
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<stmt: '%@'>"), v4);

  return v5;
}

- (int)bindNamedParamToNull:(const char *)a3
{
  sqlite3_stmt *stmt;
  int v4;

  stmt = self->_stmt;
  v4 = _indexForBindParam(stmt, (char *)a3);
  return sqlite3_bind_null(stmt, v4);
}

- (int)bindNamedParam:(const char *)a3 toNonnullNSData:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNonnullNSData:](self, "bindParam:toNonnullNSData:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toInt64AsNSNumber:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindNamedParam:toInt64AsNonnullNSNumber:](self, "bindNamedParam:toInt64AsNonnullNSNumber:", a3);
  else
    return -[_PASSqliteStatement bindNamedParamToNull:](self, "bindNamedParamToNull:", a3);
}

- (int)bindNamedParam:(const char *)a3 toInt64AsNonnullNSNumber:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toInt64AsNonnullNSNumber:](self, "bindParam:toInt64AsNonnullNSNumber:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toDoubleAsNSNumber:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindNamedParam:toDoubleAsNonnullNSNumber:](self, "bindNamedParam:toDoubleAsNonnullNSNumber:", a3);
  else
    return -[_PASSqliteStatement bindNamedParamToNull:](self, "bindNamedParamToNull:", a3);
}

- (int)bindNamedParam:(const char *)a3 toDoubleAsNonnullNSNumber:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toDoubleAsNonnullNSNumber:](self, "bindParam:toDoubleAsNonnullNSNumber:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSNumber:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindNamedParam:toNonnullNSNumber:](self, "bindNamedParam:toNonnullNSNumber:", a3);
  else
    return -[_PASSqliteStatement bindNamedParamToNull:](self, "bindNamedParamToNull:", a3);
}

- (int)bindNamedParam:(const char *)a3 toNonnullNSNumber:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNonnullNSNumber:](self, "bindParam:toNonnullNSNumber:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSOrderedSet:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSOrderedSet:](self, "bindParam:toNSOrderedSet:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSDictionary:(id)a4
{
  sqlite3_stmt *stmt;
  id v7;

  stmt = self->_stmt;
  v7 = a4;
  LODWORD(a3) = -[_PASSqliteStatement bindParam:toNSDictionary:](self, "bindParam:toNSDictionary:", _indexForBindParam(stmt, (char *)a3), v7);

  return (int)a3;
}

- (int)bindParam:(int)a3 toInteger:(int64_t)a4
{
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_int64(self->_stmt, a3, a4), *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toInt64:(int64_t)a4
{
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_int64(self->_stmt, a3, a4), *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toInt64AsNSNumber:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindParam:toInt64AsNonnullNSNumber:](self, "bindParam:toInt64AsNonnullNSNumber:", *(_QWORD *)&a3);
  else
    return -[_PASSqliteStatement bindParamToNull:](self, "bindParamToNull:", *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toInt64AsNonnullNSNumber:(id)a4
{
  uint64_t v4;
  id v7;
  int v8;
  void *v10;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  v8 = -[_PASSqliteStatement bindParam:toInt64:](self, "bindParam:toInt64:", v4, objc_msgSend(v7, "longLongValue"));

  return v8;
}

- (int)bindParam:(int)a3 toDouble:(double)a4
{
  return -[_PASSqliteStatement _checkBindStatus:forIndex:](self, "_checkBindStatus:forIndex:", sqlite3_bind_double(self->_stmt, a3, a4), *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toDoubleAsNSNumber:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindParam:toDoubleAsNonnullNSNumber:](self, "bindParam:toDoubleAsNonnullNSNumber:", *(_QWORD *)&a3);
  else
    return -[_PASSqliteStatement bindParamToNull:](self, "bindParamToNull:", *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toDoubleAsNonnullNSNumber:(id)a4
{
  uint64_t v4;
  id v7;
  int v8;
  void *v10;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  objc_msgSend(v7, "doubleValue");
  v8 = -[_PASSqliteStatement bindParam:toDouble:](self, "bindParam:toDouble:", v4);

  return v8;
}

- (int)bindParam:(int)a3 toNSNumber:(id)a4
{
  if (a4)
    return -[_PASSqliteStatement bindParam:toNonnullNSNumber:](self, "bindParam:toNonnullNSNumber:", *(_QWORD *)&a3);
  else
    return -[_PASSqliteStatement bindParamToNull:](self, "bindParamToNull:", *(_QWORD *)&a3);
}

- (int)bindParam:(int)a3 toNonnullNSNumber:(id)a4
{
  uint64_t v4;
  id v7;
  int v8;
  int v9;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  if (CFNumberIsFloatType((CFNumberRef)v7))
  {
    objc_msgSend(v7, "doubleValue");
    v8 = -[_PASSqliteStatement bindParam:toDouble:](self, "bindParam:toDouble:", v4);
  }
  else
  {
    v8 = -[_PASSqliteStatement bindParam:toInt64:](self, "bindParam:toInt64:", v4, objc_msgSend(v7, "longLongValue"));
  }
  v9 = v8;

  return v9;
}

- (int)bindParam:(int)a3 toNSOrderedSet:(id)a4
{
  return -[_PASSqliteStatement _bindParam:toObjcObject:sqliteMethodName:](self, "_bindParam:toObjcObject:sqliteMethodName:", *(_QWORD *)&a3, a4, "_pas_nsorderedset");
}

- (int)bindParam:(int)a3 toNSDictionary:(id)a4
{
  return -[_PASSqliteStatement _bindParam:toObjcObject:sqliteMethodName:](self, "_bindParam:toObjcObject:sqliteMethodName:", *(_QWORD *)&a3, a4, "_pas_nsdictionary");
}

- (id)nonnullNSStringForColumn:(int)a3
{
  void *v5;
  void *v7;

  -[_PASSqliteStatement getNSStringForColumn:](self, "getNSStringForColumn:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  return v5;
}

- (id)nonnullNSDataForColumn:(int)a3
{
  void *v5;
  void *v7;

  -[_PASSqliteStatement getNSDataForColumn:](self, "getNSDataForColumn:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  return v5;
}

- (void)accessBlobBytesForColumn:(int)a3 usingBlock:(id)a4
{
  _PAS_sqlite3_column_blob_bytes_block(self->_stmt, a3, a4);
}

- (int64_t)getIntegerForColumn:(int)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (id)getInt64AsNSNumberForColumn:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (-[_PASSqliteStatement isColumnNull:](self, "isColumnNull:"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_PASSqliteStatement getInt64ForColumn:](self, "getInt64ForColumn:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)int64AsNonnullNSNumberForColumn:(int)a3
{
  void *v5;
  void *v7;

  -[_PASSqliteStatement getInt64AsNSNumberForColumn:](self, "getInt64AsNSNumberForColumn:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 586, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  return v5;
}

- (double)getDoubleForColumn:(int)a3
{
  return sqlite3_column_double(self->_stmt, a3);
}

- (id)getDoubleAsNSNumberForColumn:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  if (-[_PASSqliteStatement isColumnNull:](self, "isColumnNull:"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_PASSqliteStatement getDoubleForColumn:](self, "getDoubleForColumn:", v3);
    objc_msgSend(v6, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)doubleAsNonnullNSNumberForColumn:(int)a3
{
  void *v5;
  void *v7;

  -[_PASSqliteStatement getDoubleAsNSNumberForColumn:](self, "getDoubleAsNSNumberForColumn:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  return v5;
}

- (id)getNSNumberForColumn:(int)a3
{
  int v5;
  void *v6;

  v5 = sqlite3_column_type(self->_stmt, a3);
  if (v5 == 5)
  {
    v6 = 0;
  }
  else
  {
    if (v5 == 1)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_stmt, a3));
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_stmt, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)nonnullNSNumberForColumn:(int)a3
{
  void *v5;
  void *v7;

  -[_PASSqliteStatement getNSNumberForColumn:](self, "getNSNumberForColumn:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("val != nil"));

  }
  return v5;
}

- (id)getNSStringForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getNSStringForColumn:](self, "getNSStringForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)nonnullNSStringForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement nonnullNSStringForColumn:](self, "nonnullNSStringForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)getNSDataForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getNSDataForColumn:](self, "getNSDataForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)nonnullNSDataForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement nonnullNSDataForColumn:](self, "nonnullNSDataForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (void)accessBlobBytesForColumnName:(const char *)a3 table:(const char *)a4 usingBlock:(id)a5
{
  _PASSQLColumnMapping *columnMapping;
  id v9;

  columnMapping = self->_columnMapping;
  v9 = a5;
  -[_PASSqliteStatement accessBlobBytesForColumn:usingBlock:](self, "accessBlobBytesForColumn:usingBlock:", -[_PASSQLColumnMapping indexForColumnName:table:](columnMapping, "indexForColumnName:table:", a3, a4), v9);

}

- (int64_t)getIntegerForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getIntegerForColumn:](self, "getIntegerForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (int64_t)getInt64ForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getInt64ForColumn:](self, "getInt64ForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)getInt64AsNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getInt64AsNSNumberForColumn:](self, "getInt64AsNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)int64AsNonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement int64AsNonnullNSNumberForColumn:](self, "int64AsNonnullNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (double)getDoubleForColumnName:(const char *)a3 table:(const char *)a4
{
  double result;

  -[_PASSqliteStatement getDoubleForColumn:](self, "getDoubleForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
  return result;
}

- (id)getDoubleAsNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getDoubleAsNSNumberForColumn:](self, "getDoubleAsNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)doubleAsNonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement doubleAsNonnullNSNumberForColumn:](self, "doubleAsNonnullNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)getNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement getNSNumberForColumn:](self, "getNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)nonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement nonnullNSNumberForColumn:](self, "nonnullNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (BOOL)isNullForColumnName:(const char *)a3 table:(const char *)a4
{
  return -[_PASSqliteStatement isColumnNull:](self, "isColumnNull:", -[_PASSQLColumnMapping indexForColumnName:table:](self->_columnMapping, "indexForColumnName:table:", a3, a4));
}

- (id)getNSStringForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getNSStringForColumn:](self, "getNSStringForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)nonnullNSStringForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement nonnullNSStringForColumn:](self, "nonnullNSStringForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)getNSDataForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getNSDataForColumn:](self, "getNSDataForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)nonnullNSDataForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement nonnullNSDataForColumn:](self, "nonnullNSDataForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (void)accessBlobBytesForColumnAlias:(const char *)a3 usingBlock:(id)a4
{
  _PASSQLColumnMapping *columnMapping;
  id v7;

  columnMapping = self->_columnMapping;
  v7 = a4;
  -[_PASSqliteStatement accessBlobBytesForColumn:usingBlock:](self, "accessBlobBytesForColumn:usingBlock:", -[_PASSQLColumnMapping indexForColumnAlias:](columnMapping, "indexForColumnAlias:", a3), v7);

}

- (int64_t)getIntegerForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getIntegerForColumn:](self, "getIntegerForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (int64_t)getInt64ForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getInt64ForColumn:](self, "getInt64ForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)getInt64AsNSNumberForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getInt64AsNSNumberForColumn:](self, "getInt64AsNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)int64AsNonnullNSNumberForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement int64AsNonnullNSNumberForColumn:](self, "int64AsNonnullNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (double)getDoubleForColumnAlias:(const char *)a3
{
  double result;

  -[_PASSqliteStatement getDoubleForColumn:](self, "getDoubleForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
  return result;
}

- (id)getDoubleAsNSNumberForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getDoubleAsNSNumberForColumn:](self, "getDoubleAsNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)doubleAsNonnullNSNumberForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement doubleAsNonnullNSNumberForColumn:](self, "doubleAsNonnullNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)getNSNumberForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement getNSNumberForColumn:](self, "getNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (id)nonnullNSNumberForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement nonnullNSNumberForColumn:](self, "nonnullNSNumberForColumn:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

- (BOOL)isNullForColumnAlias:(const char *)a3
{
  return -[_PASSqliteStatement isColumnNull:](self, "isColumnNull:", -[_PASSQLColumnMapping indexForColumnAlias:](self->_columnMapping, "indexForColumnAlias:", a3));
}

@end
