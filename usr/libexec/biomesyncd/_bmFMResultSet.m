@implementation _bmFMResultSet

- (void)enumerateWithBlock:(id)a3
{
  void (**v4)(id, _bmFMResultSet *, _BYTE *);
  void *v5;
  uint64_t v6;
  char v7;

  v4 = (void (**)(id, _bmFMResultSet *, _BYTE *))a3;
LABEL_2:
  v5 = objc_autoreleasePoolPush();
  v6 = 10;
  while (-[_bmFMResultSet next](self, "next"))
  {
    v7 = 0;
    v4[2](v4, self, &v7);
    if (v7)
      break;
    if (!--v6)
    {
      objc_autoreleasePoolPop(v5);
      goto LABEL_2;
    }
  }
  objc_autoreleasePoolPop(v5);

}

+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  _bmFMResultSet *v11;
  void *v13;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(_bmFMResultSet);
  -[_bmFMResultSet setStatement:](v11, "setStatement:", v9);
  -[_bmFMResultSet setParentDB:](v11, "setParentDB:", v10);

  -[_bmFMResultSet setShouldAutoClose:](v11, "setShouldAutoClose:", v5);
  if (objc_msgSend(v9, "inUse"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FMResultSet.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![statement inUse]"));

  }
  objc_msgSend(v9, "setInUse:", 1);

  return v11;
}

- (void)dealloc
{
  NSString *query;
  NSMutableDictionary *columnNameToIndexMap;
  objc_super v5;

  -[_bmFMResultSet close](self, "close");
  query = self->_query;
  self->_query = 0;

  columnNameToIndexMap = self->_columnNameToIndexMap;
  self->_columnNameToIndexMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)_bmFMResultSet;
  -[_bmFMResultSet dealloc](&v5, "dealloc");
}

- (void)close
{
  _bmFMStatement *statement;

  -[_bmFMStatement reset](self->_statement, "reset");
  statement = self->_statement;
  self->_statement = 0;

  -[_bmFMDatabase resultSetDidClose:](self->_parentDB, "resultSetDidClose:", self);
  -[_bmFMResultSet setParentDB:](self, "setParentDB:", 0);
}

- (int)columnCount
{
  return sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
}

- (NSMutableDictionary)columnNameToIndexMap
{
  int v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *columnNameToIndexMap;
  uint64_t v6;
  NSMutableDictionary *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;

  if (!self->_columnNameToIndexMap)
  {
    v3 = sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
    v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v3);
    columnNameToIndexMap = self->_columnNameToIndexMap;
    self->_columnNameToIndexMap = v4;

    if (v3 >= 1)
    {
      v6 = 0;
      do
      {
        v7 = self->_columnNameToIndexMap;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
        v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v6));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, v11);

        v6 = (v6 + 1);
      }
      while (v3 != (_DWORD)v6);
    }
  }
  return self->_columnNameToIndexMap;
}

- (void)kvcMagic:(id)a3
{
  int v4;
  int v5;
  int i;
  const unsigned __int8 *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  if (v4 >= 1)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = sqlite3_column_text((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), i);
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
        v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), i));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v11, "setValue:forKey:", v8, v10);

      }
    }
  }

}

- (id)resultDict
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = sqlite3_data_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet columnNameToIndexMap](self, "columnNameToIndexMap"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyEnumerator"));

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet objectForColumnName:](self, "objectForColumnName:", v8));
        objc_msgSend(v4, "setObject:forKey:", v9, v8);

        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
        v8 = (void *)v10;
      }
      while (v10);
    }
    v11 = objc_msgSend(v4, "copy");

  }
  else
  {
    NSLog(CFSTR("Warning: There seem to be no columns in this set."));
    v11 = 0;
  }
  return v11;
}

- (NSDictionary)resultDictionary
{
  int v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;

  v3 = sqlite3_data_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v3));
    v5 = sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
    if (v5 >= 1)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet objectForColumnIndex:](self, "objectForColumnIndex:", v7));
        objc_msgSend(v4, "setObject:forKey:", v10, v9);

        v7 = (v7 + 1);
      }
      while (v6 != (_DWORD)v7);
    }
  }
  else
  {
    NSLog(CFSTR("Warning: There seem to be no columns in this set."));
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (BOOL)next
{
  return -[_bmFMResultSet nextWithError:](self, "nextWithError:", 0);
}

- (BOOL)nextWithError:(id *)a3
{
  return -[_bmFMResultSet internalStepWithError:](self, "internalStepWithError:", a3) == 100;
}

- (BOOL)step
{
  return -[_bmFMResultSet stepWithError:](self, "stepWithError:", 0);
}

- (BOOL)stepWithError:(id *)a3
{
  return -[_bmFMResultSet internalStepWithError:](self, "internalStepWithError:", a3) == 101;
}

- (int)internalStepWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _bmFMDatabase *parentDB;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v5 = sqlite3_step((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  v6 = v5;
  if ((v5 - 5) <= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_parentDB, "databasePath"));
    NSLog(CFSTR("%s:%d Database busy (%@)"), "-[_bmFMResultSet internalStepWithError:]", 186, v7);

    NSLog(CFSTR("Database busy"), v13, v14);
LABEL_3:
    if (!a3)
      goto LABEL_8;
    parentDB = self->_parentDB;
    goto LABEL_5;
  }
  if ((v5 & 0xFFFFFFFE) == 0x64)
  {
LABEL_7:
    if ((_DWORD)v6 == 100)
      return v6;
    goto LABEL_8;
  }
  if ((_DWORD)v5 != 21)
  {
    if ((_DWORD)v5 == 1)
    {
      v15 = sqlite3_errmsg((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle"));
      NSLog(CFSTR("Error calling sqlite3_step (%d: %s) rs"), 1, v15);
      goto LABEL_3;
    }
    v12 = sqlite3_errmsg((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle"));
    NSLog(CFSTR("Unknown error calling sqlite3_step (%d: %s) rs"), v6, v12);
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self->_parentDB, "lastError"));
    goto LABEL_7;
  }
  v10 = sqlite3_errmsg((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle"));
  NSLog(CFSTR("Error calling sqlite3_step (%d: %s) rs"), 21, v10);
  if (a3)
  {
    parentDB = self->_parentDB;
    if (parentDB)
    {
LABEL_5:
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](parentDB, "lastError"));
      goto LABEL_8;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CFSTR("parentDB does not exist"), NSLocalizedDescriptionKey));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("_bmFMDatabase"), 21, v11));

  }
LABEL_8:
  if (self->_shouldAutoClose)
    -[_bmFMResultSet close](self, "close");
  return v6;
}

- (BOOL)hasAnotherRow
{
  return sqlite3_errcode((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle")) == 100;
}

- (int)columnIndexForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet columnNameToIndexMap](self, "columnNameToIndexMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = objc_msgSend(v6, "intValue");
  }
  else
  {
    NSLog(CFSTR("Warning: I could not find the column named '%@'."), v4);
    v7 = -1;
  }

  return v7;
}

- (int)intForColumn:(id)a3
{
  return -[_bmFMResultSet intForColumnIndex:](self, "intForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (int64_t)longForColumn:(id)a3
{
  return -[_bmFMResultSet longForColumnIndex:](self, "longForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (int64_t)longForColumnIndex:(int)a3
{
  return sqlite3_column_int64((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (int64_t)longLongIntForColumn:(id)a3
{
  return -[_bmFMResultSet longLongIntForColumnIndex:](self, "longLongIntForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (int64_t)longLongIntForColumnIndex:(int)a3
{
  return sqlite3_column_int64((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (unint64_t)unsignedLongLongIntForColumn:(id)a3
{
  return -[_bmFMResultSet unsignedLongLongIntForColumnIndex:](self, "unsignedLongLongIntForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (BOOL)BOOLForColumn:(id)a3
{
  return -[_bmFMResultSet BOOLForColumnIndex:](self, "BOOLForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (BOOL)BOOLForColumnIndex:(int)a3
{
  return -[_bmFMResultSet intForColumnIndex:](self, "intForColumnIndex:", *(_QWORD *)&a3) != 0;
}

- (double)doubleForColumn:(id)a3
{
  double result;

  -[_bmFMResultSet doubleForColumnIndex:](self, "doubleForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
  return result;
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (id)stringForColumnIndex:(int)a3
{
  int v5;
  unsigned __int8 *v6;

  v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  v6 = 0;
  if ((a3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= a3)
    {
      v6 = 0;
    }
    else
    {
      v6 = (unsigned __int8 *)sqlite3_column_text((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
      if (v6)
        v6 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    }
  }
  return v6;
}

- (id)stringForColumn:(id)a3
{
  return -[_bmFMResultSet stringForColumnIndex:](self, "stringForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dateForColumn:(id)a3
{
  return -[_bmFMResultSet dateForColumnIndex:](self, "dateForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dateForColumnIndex:(int)a3
{
  uint64_t v3;
  int v5;
  void *v6;
  _bmFMDatabase *parentDB;
  void *v8;

  v3 = *(_QWORD *)&a3;
  v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= (int)v3)
    {
      v6 = 0;
    }
    else if (-[_bmFMDatabase hasDateFormatter](self->_parentDB, "hasDateFormatter"))
    {
      parentDB = self->_parentDB;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet stringForColumnIndex:](self, "stringForColumnIndex:", v3));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase dateFromString:](parentDB, "dateFromString:", v8));

    }
    else
    {
      -[_bmFMResultSet doubleForColumnIndex:](self, "doubleForColumnIndex:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
    }
  }
  return v6;
}

- (id)dataForColumn:(id)a3
{
  return -[_bmFMResultSet dataForColumnIndex:](self, "dataForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dataForColumnIndex:(int)a3
{
  int v5;
  void *v6;
  const void *v7;
  int v8;

  v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  v6 = 0;
  if ((a3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) > a3
      && (v7 = sqlite3_column_blob((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3),
          v8 = sqlite3_column_bytes((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3),
          v7))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7, v8));
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)dataNoCopyForColumn:(id)a3
{
  return -[_bmFMResultSet dataNoCopyForColumnIndex:](self, "dataNoCopyForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dataNoCopyForColumnIndex:(int)a3
{
  int v5;
  void *v6;
  const void *v7;
  NSData *v8;

  v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  v6 = 0;
  if ((a3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= a3)
    {
      v6 = 0;
    }
    else
    {
      v7 = sqlite3_column_blob((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
      v8 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v7, sqlite3_column_bytes((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    }
  }
  return v6;
}

- (BOOL)columnIndexIsNull:(int)a3
{
  return sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3) == 5;
}

- (BOOL)columnIsNull:(id)a3
{
  return -[_bmFMResultSet columnIndexIsNull:](self, "columnIndexIsNull:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (const)UTF8StringForColumnIndex:(int)a3
{
  int v5;

  v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  if (a3 < 0
    || v5 == 5
    || sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= a3)
  {
    return 0;
  }
  else
  {
    return (const char *)sqlite3_column_text((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  }
}

- (const)UTF8StringForColumn:(id)a3
{
  return -[_bmFMResultSet UTF8StringForColumnIndex:](self, "UTF8StringForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (const)UTF8StringForColumnName:(id)a3
{
  return -[_bmFMResultSet UTF8StringForColumn:](self, "UTF8StringForColumn:", a3);
}

- (id)objectForColumnIndex:(int)a3
{
  uint64_t v3;
  int v5;
  void *v6;

  if (a3 < 0)
  {
    v6 = 0;
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= a3)
    {
      v6 = 0;
    }
    else
    {
      v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      switch(v5)
      {
        case 4:
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet dataForColumnIndex:](self, "dataForColumnIndex:", v3));
          if (!v6)
            goto LABEL_16;
          break;
        case 2:
          -[_bmFMResultSet doubleForColumnIndex:](self, "doubleForColumnIndex:", v3);
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          if (!v6)
            goto LABEL_16;
          break;
        case 1:
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[_bmFMResultSet longLongIntForColumnIndex:](self, "longLongIntForColumnIndex:", v3)));
          if (!v6)
            goto LABEL_16;
          break;
        default:
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet stringForColumnIndex:](self, "stringForColumnIndex:", v3));
          if (!v6)
LABEL_16:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          break;
      }
    }
  }
  return v6;
}

- (id)objectForColumnName:(id)a3
{
  return -[_bmFMResultSet objectForColumn:](self, "objectForColumn:", a3);
}

- (id)objectForColumn:(id)a3
{
  return -[_bmFMResultSet objectForColumnIndex:](self, "objectForColumnIndex:", -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)columnNameForIndex:(int)a3
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3));
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[_bmFMResultSet objectForColumn:](self, "objectForColumn:", a3);
}

- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5
{
  _bmFMStatement *statement;
  id v9;
  id v10;

  statement = self->_statement;
  v9 = a4;
  v10 = a3;
  -[_bmFMStatement reset](statement, "reset");
  LOBYTE(a5) = -[_bmFMDatabase bindStatement:WithArgumentsInArray:orDictionary:orVAList:](self->_parentDB, "bindStatement:WithArgumentsInArray:orDictionary:orVAList:", -[_bmFMStatement statement](self->_statement, "statement"), v10, v9, a5);

  return (char)a5;
}

- (BOOL)bindWithArray:(id)a3
{
  return -[_bmFMResultSet bindWithArray:orDictionary:orVAList:](self, "bindWithArray:orDictionary:orVAList:", a3, 0, 0);
}

- (BOOL)bindWithDictionary:(id)a3
{
  return -[_bmFMResultSet bindWithArray:orDictionary:orVAList:](self, "bindWithArray:orDictionary:orVAList:", 0, a3, 0);
}

- (_bmFMDatabase)parentDB
{
  return self->_parentDB;
}

- (void)setParentDB:(id)a3
{
  objc_storeStrong((id *)&self->_parentDB, a3);
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (_bmFMStatement)statement
{
  return (_bmFMStatement *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStatement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)shouldAutoClose
{
  return self->_shouldAutoClose;
}

- (void)setShouldAutoClose:(BOOL)a3
{
  self->_shouldAutoClose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_parentDB, 0);
  objc_storeStrong((id *)&self->_columnNameToIndexMap, 0);
}

@end
