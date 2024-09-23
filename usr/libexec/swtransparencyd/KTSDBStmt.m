@implementation KTSDBStmt

- (KTSDBStmt)initWithStatement:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  KTSDBStmt *v10;
  sqlite3_stmt **p_isa;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  KTSDBStmt *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KTSDBStmt;
  v10 = -[KTSDBStmt init](&v17, "init");
  p_isa = &v10->super.isa;
  if (v10)
  {
    -[KTSDBStmt setDb:](v10, "setDb:", v9);
    v12 = sqlite3_prepare_v3((sqlite3 *)objc_msgSend(v9, "db"), (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0, p_isa + 3, 0);
    if (!(_DWORD)v12)
    {
      v15 = p_isa;
      goto LABEL_10;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "generateError:method:", v12, CFSTR("init")));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "KTSDBStmt prepare: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v13);

  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  if (-[KTSDBStmt needReset](self, "needReset"))
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
  sqlite3_finalize(-[KTSDBStmt stmt](self, "stmt"));
  v3.receiver = self;
  v3.super_class = (Class)KTSDBStmt;
  -[KTSDBStmt dealloc](&v3, "dealloc");
}

- (void)bindString:(id)a3 column:(unint64_t)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];

  v6 = a3;
  if (v6)
  {
    v7 = sqlite3_bind_text(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0);
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_text: %d", (uint8_t *)v11, 8u);
      }

    }
  }
  else
  {
    -[KTSDBStmt bindNullAtColumn:](self, "bindNullAtColumn:", a4);
  }

}

- (void)bindInt:(int)a3 column:(unint64_t)a4
{
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];

  v5 = sqlite3_bind_int(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, a3);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "log"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_int: %d", (uint8_t *)v9, 8u);
    }

  }
}

- (void)bindInt64:(int64_t)a3 column:(unint64_t)a4
{
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];

  v5 = sqlite3_bind_int64(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, a3);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "log"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_int64: %d", (uint8_t *)v9, 8u);
    }

  }
}

- (void)bindDouble:(double)a3 column:(unint64_t)a4
{
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];

  v5 = sqlite3_bind_double(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, a3);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "log"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_double: %d", (uint8_t *)v9, 8u);
    }

  }
}

- (void)bindDate:(id)a3 column:(unint64_t)a4
{
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  -[KTSDBStmt bindDouble:column:](self, "bindDouble:column:", a4);
}

- (void)bindData:(id)a3 column:(unint64_t)a4
{
  id v6;
  sqlite3_stmt *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];

  v6 = a3;
  if (v6)
  {
    v7 = -[KTSDBStmt stmt](self, "stmt");
    v8 = objc_retainAutorelease(v6);
    v9 = sqlite3_bind_blob(v7, a4 + 1, objc_msgSend(v8, "bytes"), (int)objc_msgSend(v8, "length"), 0);
    if (v9)
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "log"));

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109120;
        v13[1] = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_blob: %d", (uint8_t *)v13, 8u);
      }

    }
  }
  else
  {
    -[KTSDBStmt bindNullAtColumn:](self, "bindNullAtColumn:", a4);
  }

}

- (void)bindNullAtColumn:(unint64_t)a3
{
  sqlite3_bind_null(-[KTSDBStmt stmt](self, "stmt"), a3 + 1);
}

- (id)generateError:(int)a3 method:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
  v8 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v7, "db"));

  v14[0] = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), v6, v8));

  v14[1] = CFSTR("sqliteCode");
  v15[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v15[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KTSDBObjcError"), 1, v11));
  return v12;
}

- (id)generateDone
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KTSDBObjcError"), 2, 0);
}

- (BOOL)steps:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, KTSDBStmt *);
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;

  v6 = (uint64_t (**)(id, KTSDBStmt *))a3;
  -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 1);
  while (1)
  {
    v7 = sqlite3_step(-[KTSDBStmt stmt](self, "stmt"));
    if (v7 != 100)
      break;
    if ((v6[2](v6, self) & 1) == 0)
      goto LABEL_7;
  }
  if (v7 == 101)
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0);
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
LABEL_7:
    v8 = 1;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt generateError:method:](self, "generateError:method:", v7, CFSTR("steps")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "log"));

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "steps: %@", (uint8_t *)&v13, 0xCu);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v9);
  -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0);
  sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
  sqlite3_clear_bindings(-[KTSDBStmt stmt](self, "stmt"));

  v8 = 0;
LABEL_13:

  return v8;
}

- (id)stepWithError:(id *)a3
{
  uint64_t v5;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;

  v5 = sqlite3_step(-[KTSDBStmt stmt](self, "stmt"));
  if (v5 == 101)
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0);
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt generateDone](self, "generateDone"));
    if (!a3)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v5 == 100)
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 1);
    return self;
  }
  v8 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt generateError:method:](self, "generateError:method:", v5, CFSTR("step")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v8;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "stepWithError %d error: %@", (uint8_t *)v11, 0x12u);
  }

  if (a3)
LABEL_9:
    *a3 = objc_retainAutorelease(v7);
LABEL_10:

  return 0;
}

- (void)reset
{
  if (-[KTSDBStmt needReset](self, "needReset"))
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0);
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
  }
}

- (void)clearBindings
{
  -[KTSDBStmt reset](self, "reset");
  sqlite3_clear_bindings(-[KTSDBStmt stmt](self, "stmt"));
}

- (unint64_t)columnCount
{
  return sqlite3_column_count(-[KTSDBStmt stmt](self, "stmt"));
}

- (int)columnTypeAtColumn:(unint64_t)a3
{
  return sqlite3_column_type(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (id)columnNameAtColumn:(unint64_t)a3
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_name(-[KTSDBStmt stmt](self, "stmt"), a3));
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4;
  NSDictionary *indexesByColumnName;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  indexesByColumnName = self->_indexesByColumnName;
  if (!indexesByColumnName)
  {
    -[KTSDBStmt enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", 0);
    indexesByColumnName = self->_indexesByColumnName;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](indexesByColumnName, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6)
    v8 = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (int)intAtColumn:(unint64_t)a3
{
  return sqlite3_column_int(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (int64_t)int64AtColumn:(unint64_t)a3
{
  return sqlite3_column_int64(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (double)doubleAtColumn:(unint64_t)a3
{
  return sqlite3_column_double(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (id)blobAtColumn:(unint64_t)a3
{
  int v3;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = a3;
  v5 = (void *)sqlite3_column_blob(-[KTSDBStmt stmt](self, "stmt"), a3);
  if (v5)
  {
    v6 = v5;
    v7 = sqlite3_column_bytes(-[KTSDBStmt stmt](self, "stmt"), v3);
    if ((v7 & 0x80000000) != 0)
      v5 = 0;
    else
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, v7));
  }
  return v5;
}

- (id)dateAtColumn:(unint64_t)a3
{
  -[KTSDBStmt doubleAtColumn:](self, "doubleAtColumn:", a3);
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
}

- (id)textAtColumn:(unint64_t)a3
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)sqlite3_column_text(-[KTSDBStmt stmt](self, "stmt"), a3);
  if (v3)
    v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  return v3;
}

- (id)objectAtColumn:(unint64_t)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id result;
  _DWORD v10[2];

  v5 = -[KTSDBStmt columnTypeAtColumn:](self, "columnTypeAtColumn:") - 1;
  v6 = 0;
  switch(v5)
  {
    case 0u:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[KTSDBStmt int64AtColumn:](self, "int64AtColumn:", a3)));
      goto LABEL_9;
    case 1u:
      -[KTSDBStmt doubleAtColumn:](self, "doubleAtColumn:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      goto LABEL_9;
    case 2u:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt textAtColumn:](self, "textAtColumn:", a3));
      goto LABEL_9;
    case 3u:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt blobAtColumn:](self, "blobAtColumn:", a3));
      goto LABEL_9;
    case 4u:
LABEL_9:
      result = v6;
      break;
    default:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "log"));

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unexpected column type: %d", (uint8_t *)v10, 8u);
      }

      result = 0;
      break;
  }
  return result;
}

- (id)allObjects
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  KTSDBStmt *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001BCB4;
  v6[3] = &unk_100106D50;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[KTSDBStmt columnCount](self, "columnCount")));
  v7 = v3;
  v8 = self;
  -[KTSDBStmt enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", v6);
  v4 = v3;

  return v4;
}

- (id)allObjectsByColumnName
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  KTSDBStmt *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001BDE8;
  v6[3] = &unk_100106D50;
  v7 = self;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[KTSDBStmt columnCount](self, "columnCount")));
  v8 = v2;
  -[KTSDBStmt enumerateColumnsUsingBlock:](v7, "enumerateColumnsUsingBlock:", v6);
  v3 = v8;
  v4 = v2;

  return v4;
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *indexesByColumnName;
  void (**v12)(void);

  v12 = (void (**)(void))a3;
  v4 = -[KTSDBStmt columnCount](self, "columnCount");
  v5 = v4;
  if (self->_indexesByColumnName)
  {
    v6 = 0;
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v4));
    if (!v5)
      goto LABEL_11;
  }
  v7 = 0;
  do
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt columnNameAtColumn:](self, "columnNameAtColumn:", v7));
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

    }
    if (v12)
      v12[2]();

    ++v7;
  }
  while (v5 != v7);
LABEL_11:
  if (v6)
  {
    v10 = (NSDictionary *)objc_msgSend(v6, "copy");
    indexesByColumnName = self->_indexesByColumnName;
    self->_indexesByColumnName = v10;

  }
}

- (KTSDBObjc)db
{
  return (KTSDBObjc *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDb:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (BOOL)needReset
{
  return self->_needReset;
}

- (void)setNeedReset:(BOOL)a3
{
  self->_needReset = a3;
}

- (NSDictionary)indexesByColumnName
{
  return self->_indexesByColumnName;
}

- (void)setIndexesByColumnName:(id)a3
{
  objc_storeStrong((id *)&self->_indexesByColumnName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesByColumnName, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
