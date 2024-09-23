@implementation MBSCacheStmt

- (MBSCacheStmt)initWithCache:(id)a3 SQL:(id)a4 stmt:(sqlite3_stmt *)a5
{
  MBSCacheStmt *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MBSCacheStmt;
  result = -[MBSCacheStmt init](&v9, "init");
  if (result)
  {
    result->_cache = (MBSCacheLikeObject *)a3;
    result->_SQL = (NSString *)a4;
    result->_stmt = a5;
    result->_reset = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 33, CFSTR("Statement not reset after last use: \"%@\"), self->_SQL);
  if (sqlite3_finalize(self->_stmt))
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error finalizing prepared statement: \"%@\"), self->_SQL);
  v3.receiver = self;
  v3.super_class = (Class)MBSCacheStmt;
  -[MBSCacheStmt dealloc](&v3, "dealloc");
}

- (BOOL)step
{
  double v3;
  uint64_t v4;

  if (self->_reset)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_startTime = v3;
    self->_reset = 0;
  }
  v4 = sqlite3_step(self->_stmt);
  if ((v4 & 0xFFFFFFFE) != 0x64)
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Failed to step (%d): \"%@\"), v4, self->_SQL);
  return (_DWORD)v4 == 100;
}

- (void)reset
{
  MBSCacheLikeObject *cache;
  NSString *SQL;
  double v5;

  if (!self->_reset)
  {
    if (sqlite3_reset(self->_stmt))
      -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error resetting prepared statement: \"%@\"), self->_SQL);
    if (sqlite3_clear_bindings(self->_stmt))
      -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error clearing prepared statement bindings: \"%@\"), self->_SQL);
    cache = self->_cache;
    SQL = self->_SQL;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    -[MBSCacheLikeObject _profile:time:](cache, "_profile:time:", SQL, v5 - self->_startTime);
    self->_startTime = 0.0;
    self->_reset = 1;
  }
}

- (void)bindInt:(int)a3 atIndex:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (!self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 77, CFSTR("Statement is not reset: \"%@\"), self->_SQL);
  if (sqlite3_bind_int(self->_stmt, v4, a3))
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error binding int at %d: \"%@\"), v4, self->_SQL);
}

- (void)bindInt64:(int64_t)a3 atIndex:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (!self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 85, CFSTR("Statement is not reset: \"%@\"), self->_SQL);
  if (sqlite3_bind_int64(self->_stmt, v4, a3))
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error binding int64 at %d: \"%@\"), v4, self->_SQL);
}

- (void)bindInteger:(int64_t)a3 atIndex:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (!self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 93, CFSTR("Statement is not reset: \"%@\"), self->_SQL);
  if (sqlite3_bind_int64(self->_stmt, v4, a3))
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error binding integer at %d: \"%@\"), v4, self->_SQL);
}

- (void)bindBlob:(id)a3 atIndex:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (!self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 101, CFSTR("Statement is not reset: \"%@\"), self->_SQL);
  if (sqlite3_bind_blob(self->_stmt, v4, objc_msgSend(a3, "bytes"), (int)objc_msgSend(a3, "length"), 0))
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error binding blob at %d: \"%@\"), v4, self->_SQL);
}

- (void)bindText:(id)a3 atIndex:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (!self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 109, CFSTR("Statement is not reset: \"%@\"), self->_SQL);
  if (sqlite3_bind_text(self->_stmt, v4, (const char *)objc_msgSend(a3, "UTF8String"), -1, 0))
    -[MBSCacheLikeObject _raise:](self->_cache, "_raise:", CFSTR("Error binding text at %d: \"%@\"), v4, self->_SQL);
}

- (int)columnCount
{
  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 117, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  return sqlite3_column_count(self->_stmt);
}

- (int)typeOfColumn:(int)a3
{
  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 123, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  return sqlite3_column_type(self->_stmt, a3);
}

- (id)valueOfColumn:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  id result;

  v3 = *(_QWORD *)&a3;
  v5 = -[MBSCacheStmt typeOfColumn:](self, "typeOfColumn:");
  switch((int)v5)
  {
    case 1:
      result = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MBSCacheStmt int64Column:](self, "int64Column:", v3));
      break;
    case 2:
      -[MBSCacheStmt doubleColumn:](self, "doubleColumn:", v3);
      result = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      break;
    case 3:
      result = -[MBSCacheStmt textColumn:](self, "textColumn:", v3);
      break;
    case 4:
      result = -[MBSCacheStmt blobColumn:](self, "blobColumn:", v3);
      break;
    case 5:
      goto LABEL_4;
    default:
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unexpected column type: %d"), v5);
LABEL_4:
      result = 0;
      break;
  }
  return result;
}

- (int)intColumn:(int)a3
{
  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 153, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  return sqlite3_column_int(self->_stmt, a3);
}

- (int64_t)int64Column:(int)a3
{
  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 159, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  return sqlite3_column_int64(self->_stmt, a3);
}

- (double)doubleColumn:(int)a3
{
  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 165, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  return sqlite3_column_double(self->_stmt, a3);
}

- (id)blobColumn:(int)a3
{
  id result;

  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 171, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  result = (id)sqlite3_column_blob(self->_stmt, a3);
  if (result)
    return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", result, sqlite3_column_bytes(self->_stmt, a3));
  return result;
}

- (id)textColumn:(int)a3
{
  id result;

  if (self->_reset)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 183, CFSTR("Statement is reset: \"%@\"), self->_SQL);
  result = (id)sqlite3_column_text(self->_stmt, a3);
  if (result)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", result);
  return result;
}

- (void)verifyEqualToStmt:(id)a3 exceptColumnNumbers:(id)a4
{
  void *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSAssertionHandler *v15;
  uint64_t v16;
  const __CFString *v17;
  char v18;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;

  do
  {
    v6 = objc_autoreleasePoolPush();
    if (!-[MBSCacheStmt step](self, "step"))
    {
      if (!objc_msgSend(a3, "step"))
      {
LABEL_20:
        v18 = 0;
        goto LABEL_22;
      }
      v15 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      v16 = 219;
      v17 = CFSTR("Fewer results on left-hand side");
LABEL_19:
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), v16, v17);
      goto LABEL_20;
    }
    if (!objc_msgSend(a3, "step"))
    {
      v15 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      v16 = 215;
      v17 = CFSTR("Fewer results on right-hand side");
      goto LABEL_19;
    }
    v7 = -[MBSCacheStmt columnCount](self, "columnCount");
    if (v7 != objc_msgSend(a3, "columnCount"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 199, CFSTR("Column count doesn't match (%d != %d)"), -[MBSCacheStmt columnCount](self, "columnCount"), objc_msgSend(a3, "columnCount"));
    v8 = -[MBSCacheStmt columnCount](self, "columnCount");
    if (v8 >= 1)
    {
      v9 = 0;
      do
      {
        if ((objc_msgSend(a4, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9)) & 1) == 0)
        {
          v10 = (unint64_t)objc_msgSend(a3, "valueOfColumn:", v9);
          v11 = -[MBSCacheStmt valueOfColumn:](self, "valueOfColumn:", v9);
          if (v10 | v11)
          {
            if ((objc_msgSend((id)v10, "isEqual:", v11) & 1) == 0)
            {
              v12 = sqlite3_column_name(self->_stmt, v9);
              v14 = MBGetDefaultLog(v12, v13);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v22 = v12;
                v23 = 2112;
                v24 = v10;
                v25 = 2112;
                v26 = v11;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Column %s values don't match (%@ != %@)", buf, 0x20u);
                _MBLog(CFSTR("ERROR"), "Column %s values don't match (%@ != %@)", v12, v10, v11);
              }
            }
            if ((objc_msgSend((id)v10, "isEqual:", v11) & 1) == 0)
              -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheStmt.m"), 211, CFSTR("Column %d values don't match (%@ != %@)"), v9, v10, v11);
          }
        }
        v9 = (v9 + 1);
      }
      while (v8 != (_DWORD)v9);
    }
    v18 = 1;
LABEL_22:
    objc_autoreleasePoolPop(v6);
  }
  while ((v18 & 1) != 0);
  -[MBSCacheStmt reset](self, "reset");
  objc_msgSend(a3, "reset");
}

- (BOOL)isReset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

@end
