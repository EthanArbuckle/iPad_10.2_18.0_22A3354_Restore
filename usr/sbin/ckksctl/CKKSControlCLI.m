@implementation CKKSControlCLI

- (CKKSControlCLI)initWithCKKSControl:(id)a3
{
  id v5;
  CKKSControlCLI *v6;
  CKKSControlCLI *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSControlCLI;
  v6 = -[CKKSControlCLI init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_control, a3);

  return v7;
}

- (id)fetchPerformanceCounters
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  NSObject *v17;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100008A30;
  v15 = &unk_10000C358;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "rpcPerformanceCounters:", &v12);

  v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("timed out waiting for response"), CFSTR("error"), v12, v13, v14, v15, v16);
  v9 = v17;
  v10 = v6;

  return v10;
}

- (int64_t)resetLocal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  uint8_t buf[16];
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = v4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v4)
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    printf("Beginning local reset for %s...\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    printf("Beginning local reset for %s...\n", "all zones");
  }
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000089BC;
  v16[3] = &unk_10000C380;
  v18 = &v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "rpcResetLocal:reply:", v5, v16);

  v10 = dispatch_time(0, 180000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    v11 = secLogObjForScope("ckkscontrol");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for reset-local response", buf, 2u);
    }

    v13 = -1;
  }
  else
  {
    v13 = v20[3];
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (int64_t)resetCloudKit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  uint8_t buf[16];
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = v4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v4)
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    printf("Beginning CloudKit reset for %s...\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    printf("Beginning CloudKit reset for %s...\n", "all CKKS-managed zones");
  }
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008948;
  v16[3] = &unk_10000C380;
  v18 = &v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "rpcResetCloudKit:reason:reply:", v5, CFSTR("ckksctl"), v16);

  v10 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    v11 = secLogObjForScope("ckkscontrol");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for reset-cloudkit response", buf, 2u);
    }

    v13 = -1;
  }
  else
  {
    v13 = v20[3];
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (int64_t)resync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  uint8_t buf[16];
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = v4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v4)
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    printf("Beginning resync for %s...\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    printf("Beginning resync for %s...\n", "all zones");
  }
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000088D4;
  v16[3] = &unk_10000C380;
  v18 = &v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "rpcResync:reply:", v5, v16);

  v10 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    v11 = secLogObjForScope("ckkscontrol");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for resync response", buf, 2u);
    }

    v13 = -1;
  }
  else
  {
    v13 = v20[3];
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)fetchStatus:(id)a3
{
  id v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  __int16 v16[8];
  _QWORD v17[4];
  id v18;
  NSObject *v19;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008740;
  v17[3] = &unk_10000C3A8;
  v8 = v5;
  v18 = v8;
  v9 = v6;
  v19 = v9;
  objc_msgSend(v7, "rpcStatus:reply:", v4, v17);

  v10 = dispatch_time(0, 45000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("timed out"), CFSTR("error"));
    v11 = secLogObjForScope("ckkscontrol");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for status response", (uint8_t *)v16, 2u);
    }

  }
  v13 = v19;
  v14 = v8;

  return v14;
}

- (void)printHumanReadableStatus:(id)a3 shortenOutput:(BOOL)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  NSObject *v15;
  BOOL v16;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006D44;
  v14[3] = &unk_10000C3D0;
  v16 = a4;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "rpcStatus:reply:", v6, v14);

  v10 = dispatch_time(0, 45000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    v11 = secLogObjForScope("ckkscontrol");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for status response", v13, 2u);
    }

  }
}

- (int64_t)fetch:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  uint8_t v13[16];
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006CA4;
  v14[3] = &unk_10000C380;
  v16 = &v17;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "rpcFetchAndProcessChanges:reply:", v4, v14);

  v8 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    v9 = secLogObjForScope("ckkscontrol");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for fetch response", v13, 2u);
    }

    v11 = -1;
  }
  else
  {
    v11 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int64_t)push:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  uint8_t v13[16];
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006C04;
  v14[3] = &unk_10000C380;
  v16 = &v17;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "rpcPushOutgoingChanges:reply:", v4, v14);

  v8 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    v9 = secLogObjForScope("ckkscontrol");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for push response", v13, 2u);
    }

    v11 = -1;
  }
  else
  {
    v11 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int64_t)ckmetric
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  int64_t v9;
  uint8_t v11[16];
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006B64;
  v12[3] = &unk_10000C380;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "rpcCKMetric:attributes:reply:", CFSTR("testMetric"), &off_10000CD68, v12);

  v6 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    puts("\n\nError: timed out waiting for response");
    v7 = secLogObjForScope("ckkscontrol");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Timed out waiting for ckmetric response", v11, 2u);
    }

    v9 = -1;
  }
  else
  {
    v9 = v16[3];
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)parseJSON:(Class)a3 name:(id)a4 json:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  id v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 0, &v21));
  v11 = v21;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
    printf("Unable to parse %s as JSON: %s\n", v13, (const char *)objc_msgSend(v14, "UTF8String"));
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v20 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class parseFromJSONDict:error:](a3, "parseFromJSONDict:error:", v10, &v20));
  v11 = v20;
  if (!v15)
  {
    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
    printf("Unable to parse %s from JSON: %s\n", v17, (const char *)objc_msgSend(v18, "UTF8String"));

    printf("JSON: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    v14 = 0;
    goto LABEL_9;
  }
  v14 = v15;
  v16 = v14;
LABEL_10:

  return v16;
}

- (int)proposeSETLK:(id)a3 tlkJson:(id)a4 oldTlkJson:(id)a5 tlkShareJsonStrings:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *i;
  id v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  dispatch_time_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[16];
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  _BYTE v44[128];

  v29 = a3;
  v10 = a4;
  v31 = a5;
  v30 = a6;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v11 = -[CKKSControlCLI parseJSON:name:json:](self, "parseJSON:name:json:", objc_opt_class(CKKSExternalKey), CFSTR("TLK"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
    goto LABEL_4;
  if (v31)
  {
    v13 = -[CKKSControlCLI parseJSON:name:json:](self, "parseJSON:name:json:", objc_opt_class(CKKSExternalKey), CFSTR("old TLK"), v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (!v28)
    {
LABEL_4:
      v14 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    v28 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = v30;
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v16);
        v20 = -[CKKSControlCLI parseJSON:name:json:](self, "parseJSON:name:json:", objc_opt_class(CKKSExternalTLKShare), CFSTR("TLKShare"), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (!v21)
        {
          v14 = 1;
          goto LABEL_21;
        }
        objc_msgSend(v15, "addObject:", v21);

      }
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v17)
        continue;
      break;
    }
  }

  v22 = dispatch_semaphore_create(0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100006AF0;
  v33[3] = &unk_10000C380;
  v35 = &v40;
  v16 = v22;
  v34 = v16;
  objc_msgSend(v23, "proposeTLKForSEView:proposedTLK:wrappedOldTLK:tlkShares:reply:", v29, v12, 0, v15, v33);

  v24 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v16, v24))
  {
    puts("\n\nError: timed out waiting for response");
    v25 = secLogObjForScope("ckkscontrol");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Timed out waiting for proposeSETLK response", buf, 2u);
    }

    v14 = -1;
  }
  else
  {
    v14 = *((_DWORD *)v41 + 6);
  }

LABEL_21:
LABEL_22:

  _Block_object_dispose(&v40, 8);
  return v14;
}

- (int)fetchSEView:(id)a3 json:(BOOL)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint8_t v15[8];
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100006028;
  v16[3] = &unk_10000C3F8;
  v19 = a4;
  v18 = &v20;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "fetchSEViewKeyHierarchy:reply:", v6, v16);

  v10 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    v11 = secLogObjForScope("ckkscontrol");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for fetchSEView response", v15, 2u);
    }

    v13 = -1;
  }
  else
  {
    v13 = *((_DWORD *)v21 + 6);
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (int)modifySEZone:(id)a3 tlkShareJsonStrings:(id)a4 deletetlkShareJsonStrings:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *j;
  id v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  dispatch_time_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  id v29;
  id v30;
  NSObject *obj;
  uint8_t buf[16];
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v29 = a3;
  v8 = a4;
  v30 = a5;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v10);
        v14 = -[CKKSControlCLI parseJSON:name:json:](self, "parseJSON:name:json:", objc_opt_class(CKKSExternalTLKShare), CFSTR("TLK Share"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i));
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (!v15)
        {
          v27 = 1;
          v16 = v10;
          goto LABEL_26;
        }
        objc_msgSend(v9, "addObject:", v15);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v11)
        continue;
      break;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v30;
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v37;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(obj);
        v20 = -[CKKSControlCLI parseJSON:name:json:](self, "parseJSON:name:json:", objc_opt_class(CKKSExternalTLKShare), CFSTR("TLK Share"), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (!v21)
        {
          v27 = 1;
          goto LABEL_25;
        }
        objc_msgSend(v16, "addObject:", v21);

      }
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v17)
        continue;
      break;
    }
  }

  v22 = dispatch_semaphore_create(0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100005FB4;
  v33[3] = &unk_10000C380;
  v35 = &v44;
  obj = v22;
  v34 = obj;
  objc_msgSend(v23, "modifyTLKSharesForSEView:adding:deleting:reply:", v29, v9, v16, v33);

  v24 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(obj, v24))
  {
    puts("\n\nError: timed out waiting for response");
    v25 = secLogObjForScope("ckkscontrol");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Timed out waiting for modifySEZone response", buf, 2u);
    }

    v27 = -1;
  }
  else
  {
    v27 = *((_DWORD *)v45 + 6);
  }

LABEL_25:
LABEL_26:

  _Block_object_dispose(&v44, 8);
  return v27;
}

- (int)deleteSEZone:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint8_t v13[16];
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005F40;
  v14[3] = &unk_10000C380;
  v16 = &v17;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "deleteSEView:reply:", v4, v14);

  v8 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    v9 = secLogObjForScope("ckkscontrol");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for deleteSEZone response", v13, 2u);
    }

    v11 = -1;
  }
  else
  {
    v11 = *((_DWORD *)v18 + 6);
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int)toggleHavoc
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  int v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005EA8;
  v9[3] = &unk_10000C420;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "toggleHavoc:", v9);

  v6 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    puts("\n\nError: timed out waiting for response");
    v7 = -1;
  }
  else
  {
    v7 = *((_DWORD *)v13 + 6);
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (CKKSControl)control
{
  return (CKKSControl *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
}

@end
