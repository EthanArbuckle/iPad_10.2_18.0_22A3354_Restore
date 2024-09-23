@implementation PQLConnection

- (BOOL)executeWithError:(id *)a3 sql:(id)a4
{
  unsigned __int8 v6;
  BOOL v7;
  uint64_t v9;

  v6 = -[PQLConnection execute:args:](self, "execute:args:", a4, &v9);
  v7 = v6;
  if (a3 && (v6 & 1) == 0)
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self, "lastError"));
  return v7;
}

- (BOOL)executeStatements:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  if (!a4)
    sub_100088A80();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
      v13 = objc_autoreleasePoolPush();
      if (!-[PQLConnection executeRaw:](self, "executeRaw:", v12, (_QWORD)v18))
        break;
      objc_autoreleasePoolPop(v13);
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self, "lastError"));
    objc_autoreleasePoolPop(v13);

    if (v16)
    {
      v15 = objc_retainAutorelease(v16);
      v14 = 0;
      *a4 = v15;
      goto LABEL_13;
    }
    v14 = 1;
  }
  else
  {
LABEL_10:
    v14 = 1;
    v15 = v7;
LABEL_13:

  }
  return v14;
}

- (id)fetchObjectOfClass:(Class)a3 error:(id *)a4 sql:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v7 = -[PQLConnection fetchObjectOfClass:sql:args:](self, "fetchObjectOfClass:sql:args:", a3, a5, &v11);
  v8 = v7;
  if (a4 && !v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self, "lastError"));
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "excludingNotFound"));

  }
  return v8;
}

- (unint64_t)fetchCountWithError:(id *)a3 sql:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v9;

  v5 = a4;
  v6 = -[PQLConnection fetchObjectOfClass:sql:args:](self, "fetchObjectOfClass:sql:args:", objc_opt_class(NSNumber), v5, &v9);

  if (v6)
    v7 = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (BOOL)performSchemaUpgrades:(id)a3 isReadOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  id v11;
  id v12;
  unsigned int v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v6 = a4;
  v9 = a3;
  if (!v9)
    sub_100088AA8();
  if (!a5)
    sub_100088AD0();
  v10 = v9;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "version") <= v13)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PQLConnection+MBAdditions.m"), 109, CFSTR("Database versions are not ordered correctly!"));

        }
        v13 = objc_msgSend(v16, "version");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection userVersion](self, "userVersion"));
  v19 = objc_msgSend(v18, "unsignedIntValue");

  if (v19 >= v13)
  {
LABEL_26:
    v20 = 1;
    goto LABEL_28;
  }
  if (!v6)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v10;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      while (2)
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          if (!-[PQLConnection _performSchemaUpgrade:fromDatabaseVersion:error:](self, "_performSchemaUpgrade:fromDatabaseVersion:error:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), v19, a5, (_QWORD)v28))
          {
            -[PQLConnection close:](self, "close:", 0);

            v20 = 0;
            goto LABEL_28;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection userVersion](self, "userVersion"));
          v19 = objc_msgSend(v26, "unsignedIntValue");

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v23)
          continue;
        break;
      }
    }

    goto LABEL_26;
  }
  -[PQLConnection close:](self, "close:", 0);
  v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Can't migrate RO database")));
LABEL_28:

  return v20;
}

- (BOOL)_performSchemaUpgrade:(id)a3 fromDatabaseVersion:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void **v35;
  uint64_t v36;
  id (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  uint8_t *v40;
  int v41;
  int v42;
  uint8_t v43[4];
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint8_t buf[8];
  uint8_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (!a5)
    sub_100088AF8();
  v9 = v8;
  v10 = objc_msgSend(v8, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "upgradeBlock"));

  if (v11)
  {
    if (v10 > v6)
    {
      v14 = MBGetDefaultLog(v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v6;
        LOWORD(v50) = 1024;
        *(_DWORD *)((char *)&v50 + 2) = (_DWORD)v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=pqldb= Migrating database from version %d to %d", buf, 0xEu);
        _MBLog(CFSTR("DEFAULT"), "=pqldb= Migrating database from version %d to %d", v6, (_DWORD)v10);
      }

      *(_QWORD *)buf = 0;
      v50 = buf;
      v51 = 0x3032000000;
      v52 = sub_10006B2E8;
      v53 = sub_10006B2F8;
      v54 = 0;
      v35 = _NSConcreteStackBlock;
      v36 = 3221225472;
      v37 = sub_10006B300;
      v38 = &unk_1000D9FA0;
      v16 = v9;
      v41 = v6;
      v42 = (int)v10;
      v39 = v16;
      v40 = buf;
      v17 = -[PQLConnection performWithFlags:action:](self, "performWithFlags:action:", 10, &v35);
      if ((v17 & 1) != 0)
      {

        if (!objc_msgSend(v16, "shouldVacuum"))
        {
LABEL_12:
          -[PQLConnection setUserVersion:](self, "setUserVersion:", v10);
          v23 = 1;
LABEL_22:
          _Block_object_dispose(buf, 8);

          goto LABEL_23;
        }
        v19 = -[PQLConnection execute:](self, "execute:", CFSTR("vacuum;"));
        if ((v19 & 1) != 0)
        {
          v21 = MBGetDefaultLog(v19, v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v43 = 67109376;
            v44 = v6;
            v45 = 1024;
            v46 = (int)v10;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=pqldb= Vacuumed after migrating database from version %d to %d", v43, 0xEu);
            _MBLog(CFSTR("DEFAULT"), "=pqldb= Vacuumed after migrating database from version %d to %d", v6, (_DWORD)v10);
          }

          goto LABEL_12;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self, "lastError"));
        v33 = MBGetDefaultLog(v31, v32);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v43 = 67109634;
          v44 = v6;
          v45 = 1024;
          v46 = (int)v10;
          v47 = 2112;
          v48 = v31;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "=pqldb= Vacuum after migration from version %d to %d failed: %@", v43, 0x18u);
          _MBLog(CFSTR("ERROR"), "=pqldb= Vacuum after migration from version %d to %d failed: %@", v6, v10, v31, v35, v36, v37, v38);
        }

        v29 = objc_retainAutorelease(v31);
        *a5 = v29;
      }
      else
      {
        v27 = MBGetDefaultLog(v17, v18);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v43 = 67109376;
          v44 = v6;
          v45 = 1024;
          v46 = (int)v10;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "=pqldb= Migration from version %d to %d failed", v43, 0xEu);
          _MBLog(CFSTR("ERROR"), "=pqldb= Migration from version %d to %d failed", v6, (_DWORD)v10);
        }

        *a5 = objc_retainAutorelease(*((id *)v50 + 5));
        v29 = v39;
      }

      v23 = 0;
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  if ((_DWORD)v10 != (_DWORD)v6)
  {
LABEL_17:
    v23 = 1;
    goto LABEL_23;
  }
  v24 = MBGetDefaultLog(v12, v13);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=pqldb= Found invalid database version %d", buf, 8u);
    _MBLog(CFSTR("DEFAULT"), "=pqldb= Found invalid database version %d", v6);
  }

  v26 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Found invalid database version %d"), v6));
  v23 = 0;
  *a5 = v26;
LABEL_23:

  return v23;
}

- (BOOL)groupInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10006B2E8;
  v16 = sub_10006B2F8;
  v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006B578;
  v9[3] = &unk_1000D9FC8;
  v6 = a3;
  v10 = v6;
  v11 = &v12;
  v7 = -[PQLConnection groupInTransaction:](self, "groupInTransaction:", v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
