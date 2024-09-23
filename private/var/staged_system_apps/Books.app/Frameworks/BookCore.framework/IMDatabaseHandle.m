@implementation IMDatabaseHandle

- (IMDatabaseHandle)initWithPath:(id)a3
{
  id v4;
  IMDatabaseHandle *v5;
  IMDatabaseHandle *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *statementCache;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMDatabaseHandle;
  v5 = -[IMDatabaseHandle init](&v12, "init");
  if (v5)
  {
    v6 = 0;
    if (!sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), &v5->_databaseHandle, 6, 0))
    {
      v7 = dispatch_queue_create("com.apple.itunesmobile.imdatabasehandle", 0);
      accessQueue = v5->_accessQueue;
      v5->_accessQueue = (OS_dispatch_queue *)v7;

      v9 = objc_opt_new(NSMutableDictionary);
      statementCache = v5->_statementCache;
      v5->_statementCache = v9;

      v6 = v5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_statementCache, "allValues"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "close");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  sqlite3_close(self->_databaseHandle);
  v8.receiver = self;
  v8.super_class = (Class)IMDatabaseHandle;
  -[IMDatabaseHandle dealloc](&v8, "dealloc");
}

- (id)tableNames
{
  return -[IMDatabaseHandle _stringRowsForQuery:](self, "_stringRowsForQuery:", CFSTR("SELECT name FROM sqlite_master where type = 'table'"));
}

- (id)columnInfoForTable:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pragma table_info(%@)"), a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle _stringRowsForQuery:](self, "_stringRowsForQuery:", v4));

  return v5;
}

- (id)version
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", sqlite3_libversion(), 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("sqlite3 library version: "), "stringByAppendingString:", v3));

  return v4;
}

- (BOOL)runStatement:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD block[4];
  id v15;
  IMDatabaseHandle *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10188C;
  v24 = sub_10189C;
  v25 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1018A4;
  block[3] = &unk_291288;
  v9 = v6;
  v15 = v9;
  v16 = self;
  v10 = v7;
  v17 = v10;
  v18 = &v26;
  v19 = &v20;
  dispatch_sync(accessQueue, block);
  v11 = (void *)v21[5];
  if (v11)
    objc_exception_throw(objc_retainAutorelease(v11));
  v12 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (id)arrayForQuery:(id)a3 arguments:(id)a4
{
  return -[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self, "arrayForQuery:arguments:rawRows:", a3, a4, 0);
}

- (id)arrayForQuery:(id)a3 arguments:(id)a4 rawRows:(BOOL)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  _QWORD block[5];
  id v20;
  id v21;
  NSMutableArray *v22;
  _QWORD *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[3];
  char v33;

  v8 = a3;
  v9 = a4;
  v10 = objc_opt_new(NSMutableArray);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10188C;
  v30 = sub_10189C;
  v31 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_101C84;
  block[3] = &unk_2912B0;
  block[4] = self;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v25 = a5;
  v14 = v10;
  v22 = v14;
  v23 = v32;
  v24 = &v26;
  dispatch_sync(accessQueue, block);
  v15 = (void *)v27[5];
  if (v15)
    objc_exception_throw(objc_retainAutorelease(v15));
  v16 = v22;
  v17 = v14;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

  return v17;
}

- (id)stringColumnDataForQuery:(id)a3 withArguments:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  IMDatabaseHandle *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v6 = a3;
  v7 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10188C;
  v38 = sub_10189C;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10188C;
  v32 = sub_10189C;
  v33 = objc_opt_new(NSMutableArray);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = self->_databaseHandle;
  accessQueue = self->_accessQueue;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1020F4;
  v18 = &unk_2912D8;
  v9 = v6;
  v19 = v9;
  v22 = &v44;
  v23 = v27;
  v10 = v7;
  v20 = v10;
  v21 = self;
  v24 = &v40;
  v25 = &v28;
  v26 = &v34;
  dispatch_sync(accessQueue, &v15);
  v11 = (void *)v35[5];
  if (v11)
    objc_exception_throw(objc_retainAutorelease(v11));
  if (!v45[3] && *((_BYTE *)v41 + 24) && objc_msgSend((id)v29[5], "count", v15, v16, v17, v18, v19))
    v12 = (void *)v29[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v13;
}

+ (id)questionMarkListForCollection:(id)a3
{
  char *v3;
  char *v4;
  id v6;
  char *v7;

  v3 = (char *)objc_msgSend(a3, "count");
  if (!v3)
    return 0;
  v4 = v3;
  if (v3 == (_BYTE *)&dword_0 + 1)
    return objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("(?)"));
  v6 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("(?,"));
  v7 = v4 - 2;
  if (v4 != (_BYTE *)&dword_0 + 2)
  {
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("?,"));
      --v7;
    }
    while (v7);
  }
  objc_msgSend(v6, "appendString:", CFSTR("?)"));
  return v6;
}

- (BOOL)passesIntegrityCheck
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self, "arrayForQuery:arguments:rawRows:", CFSTR("pragma quick_check(1)"), 0, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ok"));

  return v5;
}

- (id)_aq_cursorForQuery:(id)a3 withArguments:(id)a4
{
  id v6;
  id v7;
  IMDatabaseCursor *v8;
  IMDatabaseCursor *v9;
  id v10;
  int v11;
  IMDatabaseCursor *v12;
  id v14;
  sqlite3_stmt *v15;
  char *pzTail;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = (IMDatabaseCursor *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_statementCache, "objectForKey:", v6));
  if (v8)
  {
    v9 = v8;
    -[IMDatabaseCursor reset](v8, "reset");
    -[IMDatabaseHandle _aq_bindArguments:inStatement:](self, "_aq_bindArguments:inStatement:", v7, -[IMDatabaseCursor statement](v9, "statement"));
  }
  else
  {
    v10 = objc_retainAutorelease(v6);
    v15 = 0;
    pzTail = (char *)objc_msgSend(v10, "UTF8String");
    v11 = sqlite3_prepare_v2(-[IMDatabaseHandle _databaseHandle](self, "_databaseHandle"), pzTail, -1, &v15, (const char **)&pzTail);
    if (v11)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle _aq_errorInFunction:result:](self, "_aq_errorInFunction:result:", "-[IMDatabaseHandle _aq_cursorForQuery:withArguments:]", v11));
      objc_exception_throw(v14);
    }
    -[IMDatabaseHandle _aq_bindArguments:inStatement:](self, "_aq_bindArguments:inStatement:", v7, v15);
    v12 = [IMDatabaseCursor alloc];
    v9 = -[IMDatabaseCursor initWithStatement:](v12, "initWithStatement:", v15);
    -[NSMutableDictionary setObject:forKey:](self->_statementCache, "setObject:forKey:", v9, v10);
  }

  return v9;
}

- (sqlite3)_databaseHandle
{
  return self->_databaseHandle;
}

- (id)_aq_errorInFunction:(const char *)a3 result:(int64_t)a4
{
  NSString *v7;
  void *v8;
  FILE *v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: Could not run statement %s\n"), a3, sqlite3_errmsg(self->_databaseHandle));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = __stdoutp;
  v10 = objc_retainAutorelease(v8);
  fputs((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 1), v9);
  v11 = (objc_class *)objc_opt_class(self);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@StatementException"), v13));
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s result:%ld"), sqlite3_errmsg(self->_databaseHandle), a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v14, v16, 0));

  return v17;
}

- (id)_stringRowsForQuery:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10188C;
  v22 = sub_10189C;
  v23 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_102920;
  block[3] = &unk_291300;
  v16 = v24;
  block[4] = self;
  v7 = v4;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  v17 = &v18;
  dispatch_sync(accessQueue, block);
  v9 = (void *)v19[5];
  if (v9)
    objc_exception_throw(objc_retainAutorelease(v9));
  v10 = v15;
  v11 = v8;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v11;
}

- (BOOL)_aq_bindArguments:(id)a3 inStatement:(sqlite3_stmt *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  unsigned int v25;
  int v26;
  float v27;
  double v28;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectEnumerator"));
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));

    if (!v8)
      break;
    v11 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      v12 = sqlite3_bind_text(a4, v9, (const char *)objc_msgSend(objc_retainAutorelease(v8), "cStringUsingEncoding:", 4), -1, 0);
    }
    else
    {
      v13 = objc_opt_class(NSDate);
      if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
      {
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        v12 = sqlite3_bind_double(a4, v9, v14);
      }
      else
      {
        v15 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
        {
          v16 = objc_retainAutorelease(v8);
          if (!strcmp((const char *)objc_msgSend(v16, "objCType"), "B"))
          {
            v26 = sqlite3_bind_int(a4, v9, (int)objc_msgSend(v16, "BOOLValue"));
          }
          else
          {
            v17 = objc_retainAutorelease(v16);
            if (!strcmp((const char *)objc_msgSend(v17, "objCType"), "i")
              || (v18 = objc_retainAutorelease(v17), !strcmp((const char *)objc_msgSend(v18, "objCType"), "q")))
            {
              v26 = sqlite3_bind_int64(a4, v9, (sqlite3_int64)objc_msgSend(v17, "longLongValue"));
            }
            else
            {
              v19 = objc_retainAutorelease(v18);
              if (!strcmp((const char *)objc_msgSend(v19, "objCType"), "f"))
              {
                objc_msgSend(v19, "floatValue");
                v28 = v27;
              }
              else
              {
                v20 = objc_retainAutorelease(v19);
                if (strcmp((const char *)objc_msgSend(v20, "objCType"), "d"))
                {
                  v21 = 0;
LABEL_28:

                  goto LABEL_19;
                }
                objc_msgSend(v20, "doubleValue");
              }
              v26 = sqlite3_bind_double(a4, v9, v28);
            }
          }
          v21 = v26;
          goto LABEL_28;
        }
        v22 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v8, v22) & 1) != 0)
        {
          v23 = objc_retainAutorelease(v8);
          v12 = sqlite3_bind_blob(a4, v9, objc_msgSend(v23, "bytes"), (int)objc_msgSend(v23, "length"), 0);
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v25 = objc_msgSend(v8, "isEqual:", v24);

          if (!v25)
          {
            v21 = 0;
            goto LABEL_19;
          }
          v12 = sqlite3_bind_null(a4, v9);
        }
      }
    }
    v21 = v12;
LABEL_19:
    ++v9;
  }
  while (!v21);

  return v8 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);
}

@end
