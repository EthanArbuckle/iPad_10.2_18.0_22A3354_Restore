@implementation IMDatabaseCursor

- (IMDatabaseCursor)initWithQuery:(id)a3 databaseHandle:(id)a4
{
  id v6;
  id v7;
  IMDatabaseCursor *v8;
  IMDatabaseCursor *v9;
  IMDatabaseCursor *v10;
  sqlite3_stmt *v12;
  char *pzTail;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDatabaseCursor;
  v8 = -[IMDatabaseCursor init](&v14, "init");
  if (v8)
  {
    v9 = v8;
    v12 = 0;
    pzTail = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    if (sqlite3_prepare_v2((sqlite3 *)objc_msgSend(v7, "_databaseHandle"), pzTail, -1, &v12, (const char **)&pzTail))
    {
      v10 = 0;
    }
    else
    {
      v9 = -[IMDatabaseCursor initWithStatement:](v9, "initWithStatement:", v12);
      v10 = v9;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IMDatabaseCursor)initWithStatement:(sqlite3_stmt *)a3
{
  IMDatabaseCursor *v4;
  IMDatabaseCursor *v5;
  int v6;
  uint64_t v7;
  NSMutableArray *columnNames;
  uint64_t v9;
  NSMutableArray *columnTypes;
  uint64_t v11;
  id v12;
  const char *v13;
  const char *v14;
  int v15;
  NSMutableArray *v16;
  const __CFString *v17;
  IMDatabaseCursor *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IMDatabaseCursor;
  v4 = -[IMDatabaseCursor init](&v20, "init");
  v5 = v4;
  if (v4)
  {
    v4->_statement = a3;
    v6 = sqlite3_column_count(a3);
    v5->_numColumns = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
    columnNames = v5->_columnNames;
    v5->_columnNames = (NSMutableArray *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v5->_numColumns));
    columnTypes = v5->_columnTypes;
    v5->_columnTypes = (NSMutableArray *)v9;

    if (v5->_numColumns >= 1)
    {
      v11 = 0;
      while (1)
      {
        v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", sqlite3_column_name(v5->_statement, v11));
        -[NSMutableArray setObject:atIndexedSubscript:](v5->_columnNames, "setObject:atIndexedSubscript:", v12, v11);

        v13 = sqlite3_column_decltype(v5->_statement, v11);
        if (!v13)
          break;
        v14 = v13;
        if (!strncasecmp(v13, "integer", 7uLL))
        {
          v16 = v5->_columnTypes;
          v17 = CFSTR("integer");
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "float", 5uLL) || !strncasecmp(v14, "decimal", 8uLL) || !strncasecmp(v14, "real", 4uLL))
        {
          v16 = v5->_columnTypes;
          v17 = CFSTR("float");
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "text", 4uLL) || !strncasecmp(v14, "varchar", 7uLL))
        {
          v16 = v5->_columnTypes;
          v17 = CFSTR("text");
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "timestamp", 9uLL) || !strncasecmp(v14, "date", 4uLL))
        {
          v16 = v5->_columnTypes;
          v17 = CFSTR("date");
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "blob", 4uLL))
        {
          v16 = v5->_columnTypes;
          v17 = CFSTR("blob");
          goto LABEL_20;
        }
        v15 = strncasecmp(v14, "null", 4uLL);
        v16 = v5->_columnTypes;
        if (v15)
          goto LABEL_17;
        v17 = CFSTR("null");
LABEL_20:
        -[NSMutableArray setObject:atIndexedSubscript:](v16, "setObject:atIndexedSubscript:", v17, v11++);
        if (v11 >= v5->_numColumns)
          goto LABEL_25;
      }
      v16 = v5->_columnTypes;
LABEL_17:
      v17 = CFSTR("undeclared");
      goto LABEL_20;
    }
LABEL_25:
    v18 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[IMDatabaseCursor close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)IMDatabaseCursor;
  -[IMDatabaseCursor dealloc](&v3, "dealloc");
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (id)nextRowAsDictionary
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[IMDatabaseCursor nextRowAsArray](self, "nextRowAsArray"));
  v4 = (void *)v3;
  if (self->_numColumns)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseCursor columnNames](self, "columnNames"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v4, v6));

  }
  return v7;
}

- (id)nextRowAsArray
{
  int v3;
  void *v4;
  sqlite3 *v5;
  uint64_t v6;
  _UNKNOWN **v7;
  const __CFString *v8;
  const __CFString *v9;
  _UNKNOWN **v10;
  const __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  NSDate *v15;
  const __CFString *v16;
  const __CFString *v17;
  _UNKNOWN **v18;
  const __CFString *v19;
  _UNKNOWN **v20;
  const void *v21;
  int v22;
  const void *v23;
  id v25;

  v3 = sqlite3_step(self->_statement);
  v4 = 0;
  if (!v3)
    return v4;
  if (v3 == 100)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_numColumns));
    if (self->_numColumns < 1)
      return v4;
    v6 = 0;
    v7 = CATransaction_ptr;
    v8 = CFSTR("undeclared");
    v9 = CFSTR("integer");
    v10 = CATransaction_ptr;
    v11 = CFSTR("float");
    while (sqlite3_column_type(self->_statement, v6) == 5)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[87], "null"));
      objc_msgSend(v4, "addObject:", v12);
LABEL_24:

      if (++v6 >= self->_numColumns)
        return v4;
    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_columnTypes, "objectAtIndexedSubscript:", v6));
    if (v13 == v8)
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IMDatabaseCursor _undeclaredTypeForColumnIndex:](self, "_undeclaredTypeForColumnIndex:", v6));
    if (v13 == v9)
    {
      v14 = objc_msgSend(objc_alloc((Class)v10[88]), "initWithLongLong:", sqlite3_column_int64(self->_statement, v6));
    }
    else if (v13 == v11)
    {
      v14 = objc_msgSend(objc_alloc((Class)v10[88]), "initWithDouble:", sqlite3_column_double(self->_statement, v6));
    }
    else if (v13 == CFSTR("text"))
    {
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", sqlite3_column_text(self->_statement, v6));
    }
    else if (v13 == CFSTR("date"))
    {
      v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(self->_statement, v6));
      v14 = (id)objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      if (v13 != CFSTR("blob"))
      {
        v12 = 0;
LABEL_23:
        objc_msgSend(v4, "addObject:", v12);

        goto LABEL_24;
      }
      v25 = objc_alloc((Class)NSData);
      v16 = v9;
      v17 = v8;
      v18 = v7;
      v19 = v11;
      v20 = v10;
      v21 = sqlite3_column_blob(self->_statement, v6);
      v22 = sqlite3_column_bytes(self->_statement, v6);
      v23 = v21;
      v10 = v20;
      v11 = v19;
      v7 = v18;
      v8 = v17;
      v9 = v16;
      v14 = objc_msgSend(v25, "initWithBytes:length:", v23, v22);
    }
    v12 = v14;
    goto LABEL_23;
  }
  if (v3 != 101)
  {
    v5 = sqlite3_db_handle(self->_statement);
    sqlite3_errmsg(v5);
    v4 = 0;
  }
  return v4;
}

- (NSMutableArray)results
{
  NSMutableArray *results;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  results = self->_results;
  if (!results)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = self->_results;
    self->_results = v4;

    v6 = objc_claimAutoreleasedReturnValue(-[IMDatabaseCursor nextRowAsDictionary](self, "nextRowAsDictionary"));
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        -[NSMutableArray addObject:](self->_results, "addObject:", v7);
        v8 = objc_claimAutoreleasedReturnValue(-[IMDatabaseCursor nextRowAsDictionary](self, "nextRowAsDictionary"));

        v7 = (void *)v8;
      }
      while (v8);
    }
    results = self->_results;
  }
  return results;
}

- (BOOL)close
{
  BOOL result;
  int v4;
  id v5;
  NSObject *v6;

  if (self->_closed)
    return 1;
  v4 = sqlite3_finalize(self->_statement);
  if (v4 && v4 != 101)
  {
    v5 = BCIMLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1B74B4();

    return self->_closed;
  }
  else
  {
    result = 1;
    self->_closed = 1;
  }
  return result;
}

- (BOOL)reset
{
  int v3;
  int v4;
  BOOL result;
  id v6;
  NSObject *v7;
  id v8;

  if (self->_closed)
    return 0;
  v3 = sqlite3_reset(self->_statement);
  if (v3 && v3 != 101)
  {
    v8 = BCIMLog();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
LABEL_9:
      sub_1B7520();
LABEL_10:

    return 0;
  }
  v4 = sqlite3_clear_bindings(self->_statement);
  result = 1;
  if (v4 && v4 != 101)
  {
    v6 = BCIMLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_10;
  }
  return result;
}

- (int64_t)columnCount
{
  return self->_numColumns;
}

- (int64_t)rowCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseCursor results](self, "results"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (id)columnNameAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_columnNames, "objectAtIndexedSubscript:", a3);
}

- (id)columnTypeAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_columnTypes, "objectAtIndexedSubscript:", a3);
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (int)numColumns
{
  return self->_numColumns;
}

- (void)setNumColumns:(int)a3
{
  self->_numColumns = a3;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (NSMutableArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
  objc_storeStrong((id *)&self->_columnNames, a3);
}

- (NSMutableArray)columnTypes
{
  return self->_columnTypes;
}

- (void)setColumnTypes:(id)a3
{
  objc_storeStrong((id *)&self->_columnTypes, a3);
}

- (BOOL)closed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnTypes, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (id)_undeclaredTypeForColumnIndex:(int)a3
{
  unint64_t v3;

  v3 = sqlite3_column_type(self->_statement, a3) - 1;
  if (v3 > 4)
    return CFSTR("text");
  else
    return off_291320[v3];
}

@end
