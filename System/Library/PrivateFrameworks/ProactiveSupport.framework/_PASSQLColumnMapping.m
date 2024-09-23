@implementation _PASSQLColumnMapping

- (void)invalidateIfNeeded
{
  if (self->_tableColumnNamesFromSchema)
  {
    if (sqlite3_stmt_status(self->_stmt, 5, 0) != self->_stmtReprepareCounter)
      -[_PASSQLColumnMapping invalidate](self, "invalidate");
  }
}

- (_PASSQLColumnMapping)initWithStatementPtr:(sqlite3_stmt *)a3
{
  _PASSQLColumnMapping *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PASSQLColumnMapping;
  result = -[_PASSQLColumnMapping init](&v5, sel_init);
  if (result)
    result->_stmt = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_PASSQLColumnMapping _deallocState](self, "_deallocState");
  v3.receiver = self;
  v3.super_class = (Class)_PASSQLColumnMapping;
  -[_PASSQLColumnMapping dealloc](&v3, sel_dealloc);
}

- (void)_deallocState
{
  _PASCompactStringArrayDestroy((void **)self->_columnAliases);
  _PASCompactStringArrayDestroy((void **)self->_tableColumnNamesFromSchema);
  free((void *)self->_uniqueTableName);
}

- (void)resetSearchHint
{
  const _PASCompactStringArray *tableColumnNamesFromSchema;
  int v3;
  int v4;

  tableColumnNamesFromSchema = self->_tableColumnNamesFromSchema;
  if (tableColumnNamesFromSchema)
  {
    v3 = *((_DWORD *)tableColumnNamesFromSchema + 8);
    if (v3 != -1)
    {
      v4 = *((_DWORD *)tableColumnNamesFromSchema + 9);
      *((_DWORD *)tableColumnNamesFromSchema + 6) = v3;
      *((_DWORD *)tableColumnNamesFromSchema + 7) = v4;
      *((_QWORD *)tableColumnNamesFromSchema + 4) = -1;
    }
    _PASCompactStringArrayResetSearchHint(self->_columnAliases);
  }
}

- (void)invalidate
{
  -[_PASSQLColumnMapping _deallocState](self, "_deallocState");
  self->_tableColumnNamesFromSchema = 0;
  self->_columnAliases = 0;
  self->_uniqueTableName = 0;
}

- (void)_ensureColumnMappingExists
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  size_t v16;
  char *v17;
  char v18;
  char *uniqueTableName;
  char *v20;
  void *v21;
  int v22;
  const _PASCompactStringArray *v23;
  const _PASCompactStringArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  SEL v28;
  int v29;
  _PASCompactStringArray *v30;
  _PASCompactStringArray *v31;
  void *memptr;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_tableColumnNamesFromSchema)
  {
    v28 = a2;
    self->_stmtReprepareCounter = sqlite3_stmt_status(self->_stmt, 5, 0);
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    v30 = (_PASCompactStringArray *)v3;
    *(_QWORD *)(v3 + 32) = -1;
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    v31 = (_PASCompactStringArray *)v4;
    *(_QWORD *)(v4 + 32) = -1;
    v29 = sqlite3_column_count(self->_stmt);
    if (v29 >= 1)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = (void *)MEMORY[0x1A1AFDC98]();
        v8 = (char *)sqlite3_column_name(self->_stmt, v6);
        if (v8)
        {
          _PASCompactStringArrayAppendString((uint64_t)v31, v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v28, self, CFSTR("_PASSqliteStatement.m"), 141, CFSTR("sqlite3_column_name() failed on column index %d"), v6);

          _PASCompactStringArrayAppendString((uint64_t)v31, 0);
        }
        v9 = sqlite3_column_table_name(self->_stmt, v6);
        v10 = sqlite3_column_origin_name(self->_stmt, v6);
        if (v9 && (v11 = v10) != 0)
        {
          v12 = strlen(v10);
          v13 = strlen(v9);
          v14 = v13;
          v15 = v12 + v13 + 2;
          memptr = 0;
          v33 = 0;
          if (v15 > 0x200)
          {
            v22 = malloc_type_posix_memalign(&memptr, 8uLL, v15, 0x96A9FB46uLL);
            LOBYTE(v33) = 0;
            if (v22)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
              v26 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v26);
            }
            v17 = (char *)memptr;
          }
          else
          {
            MEMORY[0x1E0C80A78](v13);
            v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v17, v16);
            memptr = v17;
            LOBYTE(v33) = 1;
          }
          v18 = v33;
          memcpy(v17, v11, v12);
          v17[v12] = 46;
          memcpy(&v17[v12 + 1], v9, v14);
          v17[v12 + 1 + v14] = 0;
          _PASCompactStringArrayAppendString((uint64_t)v30, v17);
          if ((v18 & 1) == 0)
            free(v17);
        }
        else
        {
          _PASCompactStringArrayAppendString((uint64_t)v30, "");
        }
        if (v9 == 0 || v5)
          goto LABEL_20;
        uniqueTableName = (char *)self->_uniqueTableName;
        v5 = uniqueTableName != 0;
        if (uniqueTableName)
        {
          if (!strcmp(self->_uniqueTableName, v9))
          {
            v5 = 0;
            goto LABEL_20;
          }
          free(uniqueTableName);
          v20 = 0;
        }
        else
        {
          v20 = strdup(v9);
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v25);
          }
        }
        self->_uniqueTableName = v20;
LABEL_20:
        objc_autoreleasePoolPop(v7);
        v6 = (v6 + 1);
      }
      while (v29 != (_DWORD)v6);
    }
    v23 = v30;
    std::vector<unsigned char>::shrink_to_fit((unint64_t *)v30);
    v24 = v31;
    std::vector<unsigned char>::shrink_to_fit((unint64_t *)v31);
    self->_tableColumnNamesFromSchema = v23;
    self->_columnAliases = v24;
  }
}

- (int)indexForColumnName:(const char *)a3 table:(const char *)uniqueTableName
{
  size_t v8;
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  char *v13;
  char v14;
  uint64_t StringWithSize;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *memptr;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3 || !*a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName && columnName[0]"));

  }
  -[_PASSQLColumnMapping _ensureColumnMappingExists](self, "_ensureColumnMappingExists");
  if (!uniqueTableName)
  {
    uniqueTableName = self->_uniqueTableName;
    if (!uniqueTableName)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 188, CFSTR("nil table name provided for query which references multiple tables"));

      uniqueTableName = self->_uniqueTableName;
    }
  }
  v8 = strlen(a3);
  v9 = strlen(uniqueTableName);
  v10 = v9;
  v11 = v8 + v9;
  v12 = v8 + v9 + 2;
  memptr = 0;
  v24 = 0;
  if (v12 > 0x200)
  {
    v18 = malloc_type_posix_memalign(&memptr, 8uLL, v12, 0x1221BAC7uLL);
    LOBYTE(v24) = 0;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v21);
    }
    v13 = (char *)memptr;
  }
  else
  {
    v13 = (char *)&v22 - ((v8 + v9 + 17) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, v12);
    memptr = v13;
    LOBYTE(v24) = 1;
  }
  v14 = v24;
  memcpy(v13, a3, v8);
  v13[v8] = 46;
  memcpy(&v13[v8 + 1], uniqueTableName, v10);
  v13[v8 + 1 + v10] = 0;
  StringWithSize = _PASCompactStringArrayFindStringWithSize((uint64_t *)self->_tableColumnNamesFromSchema, v13, v11 + 1);
  if (StringWithSize == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 194, CFSTR("Query does not reference table-qualified column name: \"%s\"), v13);

    if ((v14 & 1) != 0)
      return StringWithSize;
LABEL_15:
    free(v13);
    return StringWithSize;
  }
  if ((v14 & 1) == 0)
    goto LABEL_15;
  return StringWithSize;
}

- (int)indexForColumnAlias:(const char *)a3
{
  size_t v6;
  uint64_t StringWithSize;
  void *v9;
  void *v10;

  if (!a3 || !*a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alias && alias[0]"));

  }
  -[_PASSQLColumnMapping _ensureColumnMappingExists](self, "_ensureColumnMappingExists");
  v6 = strlen(a3);
  StringWithSize = _PASCompactStringArrayFindStringWithSize((uint64_t *)self->_columnAliases, (void *)a3, v6);
  if (StringWithSize == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteStatement.m"), 205, CFSTR("Query does not reference column alias: \"%s\"), a3);

  }
  return StringWithSize;
}

@end
