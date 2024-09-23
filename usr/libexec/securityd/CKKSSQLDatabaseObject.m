@implementation CKKSSQLDatabaseObject

- (BOOL)saveToDatabase:(id *)a3
{
  return -[CKKSSQLDatabaseObject saveToDatabaseWithConnection:error:](self, "saveToDatabaseWithConnection:error:", 0, a3);
}

- (BOOL)saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  BOOL v8;
  id v9;
  id v11;

  v7 = objc_autoreleasePoolPush();
  v11 = 0;
  v8 = -[CKKSSQLDatabaseObject _saveToDatabaseWithConnection:error:](self, "_saveToDatabaseWithConnection:error:", a3, &v11);
  v9 = v11;
  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (BOOL)_saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject whereClauseToFindSelf](self, "whereClauseToFindSelf"));
  v8 = objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject originalSelfWhereClause](self, "originalSelfWhereClause"));
  if (!v8)
    goto LABEL_4;
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject originalSelfWhereClause](self, "originalSelfWhereClause"));
  v11 = objc_msgSend(v10, "isEqualToDictionary:", v7);

  if ((v11 & 1) != 0
    || (v12 = objc_msgSend((id)objc_opt_class(self), "sqlTable"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12),
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject originalSelfWhereClause](self, "originalSelfWhereClause")),
        v15 = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v13, v14, a3, a4), v14, v13, v15))
  {
LABEL_4:
    v16 = objc_msgSend((id)objc_opt_class(self), "sqlTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject sqlValues](self, "sqlValues"));
    v19 = +[CKKSSQLDatabaseObject saveToDatabaseTable:row:connection:error:](CKKSSQLDatabaseObject, "saveToDatabaseTable:row:connection:error:", v17, v18, a3, a4);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)deleteFromDatabase:(id *)a3
{
  void *v5;
  BOOL v6;
  id v7;
  id v9;

  v5 = objc_autoreleasePoolPush();
  v9 = 0;
  v6 = -[CKKSSQLDatabaseObject _deleteFromDatabase:](self, "_deleteFromDatabase:", &v9);
  v7 = v9;
  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

- (BOOL)_deleteFromDatabase:(id *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend((id)objc_opt_class(self), "sqlTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject whereClauseToFindSelf](self, "whereClauseToFindSelf"));
  LOBYTE(a3) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v6, v7, 0, a3);

  return (char)a3;
}

- (id)memoizeOriginalSelfWhereClause
{
  NSDictionary *v3;
  NSDictionary *originalSelfWhereClause;

  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject whereClauseToFindSelf](self, "whereClauseToFindSelf"));
  originalSelfWhereClause = self->_originalSelfWhereClause;
  self->_originalSelfWhereClause = v3;

  return self;
}

- (id)sqlValues
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A subclass must override %@"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (id)whereClauseToFindSelf
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A subclass must override %@"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_originalSelfWhereClause);
  return v4;
}

- (NSDictionary)originalSelfWhereClause
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOriginalSelfWhereClause:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSelfWhereClause, 0);
}

+ (BOOL)saveToDatabaseTable:(id)a3 row:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v9 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004B930;
  v16[3] = &unk_1002DBC08;
  v10 = a4;
  v17 = v10;
  v11 = v9;
  v18 = v11;
  v19 = &v20;
  v12 = objc_retainBlock(v16);
  v13 = v12;
  if (a5)
    ((void (*)(_QWORD *, __OpaqueSecDbConnection *))v12[2])(v12, a5);
  else
    sub_100011A30(1, 1, 0, (uint64_t)(v21 + 3), (uint64_t)v12);
  v14 = (void *)v21[3];
  if (a6)
  {
    *a6 = v14;
  }
  else if (v14)
  {
    v21[3] = 0;
    CFRelease(v14);
  }

  _Block_object_dispose(&v20, 8);
  return v14 == 0;
}

+ (id)makeWhereClause:(id)a3
{
  id v3;
  __CFString *v4;
  _QWORD v6[4];
  __CFString *v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v3 = a3;
  if (v3)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004B5B0;
    v6[3] = &unk_1002DBC30;
    v8 = v9;
    v4 = (__CFString *)objc_alloc_init((Class)NSMutableString);
    v7 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

    _Block_object_dispose(v9, 8);
  }
  else
  {
    v4 = &stru_1002EE888;
  }

  return v4;
}

+ (id)groupByClause:(id)a3
{
  id v3;
  __CFString *v4;
  _QWORD v6[4];
  __CFString *v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v3 = a3;
  if (v3)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004B528;
    v6[3] = &unk_1002DBC58;
    v8 = v9;
    v4 = (__CFString *)objc_alloc_init((Class)NSMutableString);
    v7 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

    _Block_object_dispose(v9, 8);
  }
  else
  {
    v4 = &stru_1002EE888;
  }

  return v4;
}

+ (id)orderByClause:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  _QWORD v7[4];
  __CFString *v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004B4A0;
    v7[3] = &unk_1002DBC58;
    v9 = v10;
    v5 = (__CFString *)objc_alloc_init((Class)NSMutableString);
    v8 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

    _Block_object_dispose(v10, 8);
  }
  else
  {
    v5 = &stru_1002EE888;
  }

  return v5;
}

+ (void)bindWhereClause:(sqlite3_stmt *)a3 whereDict:(id)a4 cferror:(__CFError *)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  sqlite3_stmt *v13;
  __CFError **v14;
  _QWORD v15[3];
  int v16;

  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004B1A0;
  v10[3] = &unk_1002DBC80;
  v9 = v7;
  v11 = v9;
  v12 = v15;
  v13 = a3;
  v14 = a5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v15, 8);
}

+ (BOOL)deleteFromTable:(id)a3 where:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004B05C;
  v17[3] = &unk_1002DBCF0;
  v11 = a4;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  v20 = &v22;
  v21 = a1;
  v13 = objc_retainBlock(v17);
  v14 = v13;
  if (a5)
    ((void (*)(_QWORD *, __OpaqueSecDbConnection *))v13[2])(v13, a5);
  else
    sub_100011A30(1, 1, 0, (uint64_t)(v23 + 3), (uint64_t)v13);
  v15 = (void *)v23[3];
  if (a6)
  {
    *a6 = v15;
  }
  else if (v15)
  {
    v23[3] = 0;
    CFRelease(v15);
  }

  _Block_object_dispose(&v22, 8);
  return v15 == 0;
}

+ (BOOL)queryDatabaseTable:(id)a3 where:(id)a4 columns:(id)a5 groupBy:(id)a6 orderBy:(id)a7 limit:(int64_t)a8 processRow:(id)a9 error:(id *)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v27;
  void *context;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  int64_t v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v27 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  context = objc_autoreleasePoolPush();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004AC28;
  v31[3] = &unk_1002DBD90;
  v19 = v15;
  v32 = v19;
  v20 = v14;
  v33 = v20;
  v21 = v16;
  v34 = v21;
  v22 = v17;
  v35 = v22;
  v39 = a8;
  v23 = v27;
  v36 = v23;
  v38 = &v41;
  v40 = a1;
  v24 = v18;
  v37 = v24;
  sub_100011A30(1, 1, 0, (uint64_t)&v44, (uint64_t)v31);
  v25 = (void *)v42[3];

  _Block_object_dispose(&v41, 8);
  objc_autoreleasePoolPop(context);
  if (a10)
    *a10 = objc_retainAutorelease(v25);

  return v25 == 0;
}

+ (id)quotedString:(id)a3
{
  id v3;
  char *v4;
  char *v5;
  void *v6;

  v3 = objc_retainAutorelease(a3);
  v4 = sqlite3_mprintf("%q", objc_msgSend(v3, "UTF8String"));
  if (!v4)
    abort();
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  sqlite3_free(v5);

  return v6;
}

+ (BOOL)queryMaxValueForField:(id)a3 inTable:(id)a4 where:(id)a5 columns:(id)a6 processRow:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004A730;
  v24[3] = &unk_1002DBDB8;
  v31 = a1;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v19 = v15;
  v27 = v19;
  v20 = v14;
  v28 = v20;
  v30 = &v32;
  v21 = v16;
  v29 = v21;
  sub_100011A30(0, 1, 0, (uint64_t)&v35, (uint64_t)v24);
  v22 = (const void *)v33[3];
  if (v22)
  {
    v33[3] = 0;
    CFRelease(v22);
  }

  _Block_object_dispose(&v32, 8);
  return v22 == 0;
}

+ (BOOL)performCKKSTransaction:(id)a3
{
  id v3;
  char v4;
  id v5;
  NSObject *v6;
  CFTypeRef v7;
  _QWORD v9[4];
  id v10;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v13;

  cf = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004A59C;
  v9[3] = &unk_1002DBE08;
  v3 = a3;
  v10 = v3;
  v4 = sub_100011A30(1, 1, 0, (uint64_t)&cf, (uint64_t)v9);
  if (cf)
  {
    v5 = sub_10000BDF4(CFSTR("ckkssql"), 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "error performing database operation, major problems ahead: %@", buf, 0xCu);
    }

    v7 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v7);
    }
  }

  return v4;
}

+ (BOOL)deleteAll:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v9;

  v5 = objc_autoreleasePoolPush();
  v9 = 0;
  v6 = objc_msgSend(a1, "_deleteAll:", &v9);
  v7 = v9;
  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

+ (BOOL)_deleteAll:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  LOBYTE(a3) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v4, 0, 0, a3);

  return (char)a3;
}

+ (id)fromDatabaseWhere:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSErrorUserInfoKey v13;
  void *v14;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v6, a4));
  v8 = (void *)v7;
  if (a4 && !v7)
  {
    v13 = NSLocalizedDescriptionKey;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ does not exist in database where %@"), objc_opt_class(a1), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -25300, v11));

  }
  return v8;
}

+ (id)tryFromDatabaseWhere:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004A474;
  v16 = sub_10004A484;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlColumns"));
  v11[1] = 3221225472;
  v11[2] = sub_10004A544;
  v11[3] = &unk_1002DBE30;
  v11[4] = &v12;
  v11[5] = a1;
  v11[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v7, v6, v8, 0, 0, -1, v11, a4);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)all:(id *)a3
{
  return objc_msgSend(a1, "allWhere:error:", 0, a3);
}

+ (id)allWhere:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004A474;
  v16 = sub_10004A484;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlColumns"));
  v11[1] = 3221225472;
  v11[2] = sub_10004A4E8;
  v11[3] = &unk_1002DBE30;
  v11[4] = &v12;
  v11[5] = a1;
  v11[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v7, v6, v8, 0, 0, -1, v11, a4);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)fetch:(unint64_t)a3 error:(id *)a4
{
  return objc_msgSend(a1, "fetch:where:orderBy:error:", a3, 0, 0, a4);
}

+ (id)fetch:(unint64_t)a3 where:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "fetch:where:orderBy:error:", a3, a4, 0, a5);
}

+ (id)fetch:(unint64_t)a3 where:(id)a4 orderBy:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v10 = a4;
  v11 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004A474;
  v21 = sub_10004A484;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  v22 = objc_alloc_init((Class)NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlColumns"));
  v16[1] = 3221225472;
  v16[2] = sub_10004A48C;
  v16[3] = &unk_1002DBE30;
  v16[4] = &v17;
  v16[5] = a1;
  v16[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v12, v10, v13, 0, v11, a3, v16, a6);

  v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A subclass must override %@"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

+ (id)sqlTable
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A subclass must override %@"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

+ (id)sqlColumns
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A subclass must override %@"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

+ (id)allUUIDsWithContextID:(id)a3 inZones:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  CKKSSQLWhereIn *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10006F188;
  v34 = sub_10006F198;
  v35 = (id)0xAAAAAAAAAAAAAAAALL;
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "zoneName"));
        objc_msgSend(v10, "addObject:", v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v36[0] = CFSTR("contextID");
  v17 = v8;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v36[1] = CFSTR("ckzone");
  v37[0] = v20;
  v21 = -[CKKSSQLWhereIn initWithValues:]([CKKSSQLWhereIn alloc], "initWithValues:", v10);
  v37[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10006F268;
  v25[3] = &unk_1002E9DF8;
  v25[4] = &v30;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v16, v22, &off_10030B4E0, 0, 0, -1, v25, a5);

  v23 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v23;
}

+ (id)allUUIDsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10006F188;
  v27 = sub_10006F198;
  v28 = (id)0xAAAAAAAAAAAAAAAALL;
  v28 = objc_alloc_init((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v29[0] = CFSTR("contextID");
  v11 = v8;
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14 = v13;

  v30[0] = v14;
  v29[1] = CFSTR("ckzone");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v17;

  v30[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v22[1] = 3221225472;
  v22[2] = sub_10006F204;
  v22[3] = &unk_1002E9DF8;
  v22[4] = &v23;
  v22[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v10, v19, &off_10030B4F8, 0, 0, -1, v22, a5);

  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

+ (id)allParentKeyUUIDsInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10006F188;
  v27 = sub_10006F198;
  v28 = (id)0xAAAAAAAAAAAAAAAALL;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v29[0] = CFSTR("contextID");
  v11 = v8;
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14 = v13;

  v30[0] = v14;
  v29[1] = CFSTR("ckzone");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v17;

  v30[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v22[1] = 3221225472;
  v22[2] = sub_10006F1A0;
  v22[3] = &unk_1002E9DF8;
  v22[4] = &v23;
  v22[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v10, v19, &off_10030B510, 0, 0, -1, v22, a5);

  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

+ (id)allWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v8 = a3;
  v9 = a4;
  v21[0] = CFSTR("contextID");
  v10 = v8;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v21[1] = CFSTR("ckzone");
  v22[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v22[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v18, a5));

  return v19;
}

+ (BOOL)deleteAllWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sqlTable"));
  v21[0] = CFSTR("contextID");
  v11 = v8;
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14 = v13;

  v21[1] = CFSTR("ckzone");
  v22[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  if (v15)
    v16 = v15;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v22[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v19 = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:](CKKSSQLDatabaseObject, "deleteFromTable:where:connection:error:", v10, v18, 0, a5);

  return v19;
}

@end
