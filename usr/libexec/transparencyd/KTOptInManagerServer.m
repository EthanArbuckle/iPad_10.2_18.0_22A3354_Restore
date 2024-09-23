@implementation KTOptInManagerServer

+ (id)optInKeyForApplication:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.optIn"), a3);
}

+ (id)notificationKeyForApplication:(id)a3
{
  return +[KTOptInManager notificationKeyForApplication:](KTOptInManager, "notificationKeyForApplication:", a3);
}

- (KTOptInManagerServer)initWithApplication:(id)a3
{
  return -[KTOptInManagerServer initWithApplication:context:](self, "initWithApplication:context:", a3, 0);
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4
{
  return -[KTOptInManagerServer initWithApplication:context:stateMachine:](self, "initWithApplication:context:stateMachine:", a3, a4, 0);
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  KTOptInManagerServer *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[KTOptInManagerServer initWithApplication:context:stateMachine:account:store:](self, "initWithApplication:context:stateMachine:account:store:", v10, v9, v8, objc_opt_class(TransparencyAccount, v11), 0);

  return v12;
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5 account:(Class)a6 store:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  KTOptInManagerServer *v17;
  KTOptInManagerServer *v18;
  NSObject *v19;
  KTOptInManagerServer *v20;
  void *v21;
  dispatch_group_t v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v12));

  if (v16)
  {
    v30.receiver = self;
    v30.super_class = (Class)KTOptInManagerServer;
    v17 = -[KTOptInManagerServer init](&v30, "init");
    v18 = v17;
    if (v17)
    {
      -[KTOptInManagerServer setApplicationId:](v17, "setApplicationId:", v12);
      -[KTOptInManagerServer setContext:](v18, "setContext:", v13);
      -[KTOptInManagerServer setStateMachine:](v18, "setStateMachine:", v14);
      if (v15)
      {
        -[KTOptInManagerServer setStore:](v18, "setStore:", v15);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[KTKVSSoftStore sharedStore](KTKVSSoftStore, "sharedStore"));
        -[KTOptInManagerServer setStore:](v18, "setStore:", v21);

      }
      -[KTOptInManagerServer setAccount:](v18, "setAccount:", a6);
      v22 = dispatch_group_create();
      -[KTOptInManagerServer setSetGroup:](v18, "setSetGroup:", v22);

      v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = dispatch_queue_create("KTOptInManagerSet", v24);
      -[KTOptInManagerServer setSetQueue:](v18, "setSetQueue:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyDistributedReadNotificationCenter defaultCenter](TransparencyDistributedReadNotificationCenter, "defaultCenter"));
      objc_msgSend(v26, "addObserver:selector:name:", v18, "handleCDPReset:", CFSTR("com.apple.security.resetprotecteddata.complete"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyDistributedReadNotificationCenter defaultCenter](TransparencyDistributedReadNotificationCenter, "defaultCenter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer notificationKey](v18, "notificationKey"));
      objc_msgSend(v27, "addObserver:selector:name:", v18, "handleOptInStateChange:", v28);

    }
    self = v18;
    v20 = self;
  }
  else
  {
    if (qword_1002A7928 != -1)
      dispatch_once(&qword_1002A7928, &stru_100249428);
    v19 = qword_1002A7930;
    if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  int *notifyToken;
  int *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyDistributedReadNotificationCenter defaultCenter](TransparencyDistributedReadNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:", self, CFSTR("com.apple.security.resetprotecteddata.complete"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyDistributedReadNotificationCenter defaultCenter](TransparencyDistributedReadNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer notificationKey](self, "notificationKey"));
  objc_msgSend(v4, "removeObserver:name:", self, v5);

  notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(*notifyToken);
    v7 = self->_notifyToken;
  }
  else
  {
    v7 = 0;
  }
  free(v7);
  v8.receiver = self;
  v8.super_class = (Class)KTOptInManagerServer;
  -[KTOptInManagerServer dealloc](&v8, "dealloc");
}

+ (void)optInManagerOptInState:(id)a3 sync:(BOOL)a4 store:(id)a5 complete:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11 && (objc_msgSend(v11, "storeReady") & 1) != 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100163814;
    v19[3] = &unk_100249450;
    v23 = a1;
    v20 = v10;
    v13 = v11;
    v21 = v13;
    v22 = v12;
    v14 = objc_retainBlock(v19);
    v15 = v14;
    if (v8)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100163920;
      v17[3] = &unk_10023D268;
      v18 = v14;
      objc_msgSend(v13, "forceSync:", v17);

    }
    else
    {
      ((void (*)(_QWORD *))v14[2])(v14);
    }

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -308, CFSTR("KVS store not yet loaded")));
    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v16);

  }
}

- (id)optInKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManagerServer optInKeyForApplication:](KTOptInManagerServer, "optInKeyForApplication:", v2));

  return v3;
}

- (id)notificationKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManager notificationKeyForApplication:](KTOptInManager, "notificationKeyForApplication:", v2));

  return v3;
}

- (id)getOptInHistory:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer store](self, "store"));
  v6 = objc_msgSend(v5, "storeReady");

  if ((v6 & 1) != 0)
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer store](self, "store"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getOptInHistory:store:error:", v9, v10, a3));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -308, CFSTR("KVS store not yet loaded")));
    v9 = v12;
    v11 = 0;
    if (a3 && v12)
    {
      v9 = objc_retainAutorelease(v12);
      v11 = 0;
      *a3 = v9;
    }
  }

  return v11;
}

+ (id)getOptInHistory:(id)a3 store:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManagerServer optInKeyForApplication:](KTOptInManagerServer, "optInKeyForApplication:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("OptInServerGet"), v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));
  if (v12)
  {
    v13 = objc_opt_class(NSArray, v11);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v40 = v8;
      v41 = v10;
      v39 = v9;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v15)
      {
        v17 = v15;
        v18 = *(_QWORD *)v44;
        obj = v14;
LABEL_5:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v19);
          v21 = objc_opt_class(NSArray, v16);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
            break;
          v22 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));
          v25 = objc_opt_class(NSDate, v24);
          if ((objc_opt_isKindOfClass(v23, v25) & 1) == 0)
          {

LABEL_24:
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -283, CFSTR("Opt-in entry has wrong value types")));
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
            objc_msgSend(v37, "logResultForEvent:hardFailure:result:", v41, 1, v36);

            if (a5 && v36)
              *a5 = objc_retainAutorelease(v36);

LABEL_28:
            v9 = v39;
            v8 = v40;
            v10 = v41;
            v14 = obj;
            goto LABEL_29;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 1));
          v28 = objc_opt_class(NSNumber, v27);
          isKindOfClass = objc_opt_isKindOfClass(v26, v28);

          if ((isKindOfClass & 1) == 0)
            goto LABEL_24;

          if (v17 == (id)++v19)
          {
            v14 = obj;
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            if (v17)
              goto LABEL_5;
            goto LABEL_13;
          }
        }
        v22 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -282, CFSTR("Latest opt-in entry is not an array")));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
        objc_msgSend(v35, "logResultForEvent:hardFailure:result:", v41, 1, v22);

        if (!a5)
          goto LABEL_28;
        v9 = v39;
        v8 = v40;
        v14 = obj;
        if (v22)
        {
          v22 = objc_retainAutorelease(v22);
          *a5 = v22;
        }
        v10 = v41;
LABEL_29:

        v31 = 0;
        goto LABEL_30;
      }
LABEL_13:

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
      v10 = v41;
      objc_msgSend(v30, "logSuccessForEventNamed:", v41);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortedArrayUsingComparator:", &stru_100249490));
      v9 = v39;
      v8 = v40;
LABEL_30:

    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -281, CFSTR("Top-level opt-in value is not a array")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
      objc_msgSend(v34, "logResultForEvent:hardFailure:result:", v10, 1, v33);

      if (a5 && v33)
        *a5 = objc_retainAutorelease(v33);

      v31 = 0;
    }
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v32, "logSuccessForEventNamed:", v10);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }

  return v31;
}

+ (id)getOptInHistoryDiagnostic:(id)a3 store:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE v31[128];

  v28 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getOptInHistory:store:error:", a3, a4, &v28));
  v5 = v28;
  v6 = v5;
  if (v4)
  {
    v22 = v5;
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if ((unint64_t)objc_msgSend(v12, "count") >= 2)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
            v16 = objc_opt_class(NSDate, v15);
            if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
            {
              v18 = objc_opt_class(NSNumber, v17);
              if ((objc_opt_isKindOfClass(v14, v18) & 1) != 0)
              {
                v29[0] = CFSTR("date");
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_toISO_8601_UTCString"));
                v29[1] = CFSTR("state");
                v30[0] = v19;
                v30[1] = v14;
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
                objc_msgSend(v23, "addObject:", v20);

              }
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      }
      while (v9);
    }

    v6 = v22;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)getCurrentOptInEntry:(id *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getOptInHistory:](self, "getOptInHistory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

- (void)getOptInState:(id)a3
{
  void (**v4)(id, id, void *, _QWORD);
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = (void (**)(id, id, void *, _QWORD))a3;
  v10 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getCurrentOptInEntry:](self, "getCurrentOptInEntry:", &v10));
  v6 = (unint64_t)v10;
  if (v5 | v6)
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "objectAtIndexedSubscript:", 1));
      v8 = objc_msgSend(v7, "BOOLValue");

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "objectAtIndexedSubscript:", 0));
      v4[2](v4, v8, v9, 0);

    }
    else
    {
      v4[2](v4, 0, 0, v6);
    }
  }
  else
  {
    v4[2](v4, 0, 0, 0);
  }

}

- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, _QWORD, id);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  KTOptInManagerServer *v21;
  void (**v22)(id, uint64_t, _QWORD, id);
  id v23;

  v4 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer stateMachine](self, "stateMachine"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudRecords"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
    v23 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getAggregateOptInStateForApplication:error:", v10, &v23));
    v12 = v23;

    if (v11 && objc_msgSend(v11, "state"))
      v6[2](v6, 1, 0, v12);
    else
      v6[2](v6, 0, 0, 0);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer store](self, "store"));
    v14 = objc_msgSend(v13, "storeReady");

    if ((v14 & 1) != 0)
    {
      if (!v4)
      {
        -[KTOptInManagerServer getOptInState:](self, "getOptInState:", v6);
        goto LABEL_13;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("OptInServerGet"), v15));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer store](self, "store"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001644C8;
      v19[3] = &unk_1002494B8;
      v20 = v16;
      v21 = self;
      v22 = v6;
      v18 = v16;
      objc_msgSend(v17, "forceSync:", v19);

    }
    else
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -308, CFSTR("KVS store not yet loaded")));
      v6[2](v6, 0, 0, v18);
    }

  }
LABEL_13:

}

- (BOOL)optInState
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getCurrentOptInEntry:](self, "getCurrentOptInEntry:", 0));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", 1));
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)changeOptInState:(unint64_t)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer setQueue](self, "setQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016464C;
  block[3] = &unk_1002494E0;
  block[4] = self;
  v11 = v7;
  v12 = a3;
  v9 = v7;
  dispatch_async(v8, block);

}

- (id)emailPrefix
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  if ((objc_msgSend(v3, "isEqualToString:", kKTApplicationIdentifierIDS) & 1) != 0)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  if (objc_msgSend(v4, "isEqualToString:", kKTApplicationIdentifierIDSFaceTime))
  {

LABEL_4:
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v9 = objc_msgSend(v8, "isEqualToString:", kKTApplicationIdentifierIDSMultiplex);

  if ((v9 & 1) == 0)
  {
    v6 = 0;
    return v6;
  }
LABEL_5:
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationPrefixForIdentifier:](TransparencyApplication, "applicationPrefixForIdentifier:", v5));

  return v6;
}

- (void)handleCDPReset:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _BYTE buf[12];
  __int16 v32;
  void *v33;

  v23 = a3;
  if (qword_1002A7928 != -1)
    dispatch_once(&qword_1002A7928, &stru_100249500);
  v4 = qword_1002A7930;
  if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "received CDP Reset notification", buf, 2u);
  }
  v30 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](TransparencyAccount, "primaryAccount:", &v30));
  v6 = v30;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryEmail"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer emailPrefix](self, "emailPrefix"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://mailto:%@"), v8, v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
      v29 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildQueryRequest:application:error:", v9, v10, &v29));
      v22 = v29;

      if (v11)
      {
        if (qword_1002A7928 != -1)
          dispatch_once(&qword_1002A7928, &stru_100249580);
        v12 = qword_1002A7930;
        if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 141558274;
          *(_QWORD *)&buf[4] = 1752392040;
          v32 = 2112;
          v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "querying KT server opt-in state for %{mask.hash}@", buf, 0x16u);
        }
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer context](self, "context"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logClient"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100164E1C;
        v24[3] = &unk_100249650;
        objc_copyWeak(&v28, (id *)buf);
        v25 = v11;
        v16 = v13;
        v26 = v16;
        v27 = v7;
        objc_msgSend(v15, "fetchQuery:uuid:userInitiated:completionHandler:", v25, v16, 0, v24);

        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (qword_1002A7928 != -1)
          dispatch_once(&qword_1002A7928, &stru_100249560);
        v21 = qword_1002A7930;
        if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to check opt-in after CDP reset, no query request: %@", buf, 0xCu);
        }
      }

      v6 = v22;
    }
    else
    {
      if (qword_1002A7928 != -1)
        dispatch_once(&qword_1002A7928, &stru_100249540);
      v18 = (void *)qword_1002A7930;
      if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "skipping opt in check after CDP reset for %{public}@", buf, 0xCu);

      }
    }

  }
  else
  {
    if (qword_1002A7928 != -1)
      dispatch_once(&qword_1002A7928, &stru_100249520);
    v17 = qword_1002A7930;
    if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to check opt-in after CDP reset, no account: %@", buf, 0xCu);
    }
  }

}

- (void)handleOptInStateChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  if (qword_1002A7928 != -1)
    dispatch_once(&qword_1002A7928, &stru_100249670);
  v5 = qword_1002A7930;
  if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got opt-in change notification", buf, 2u);
  }
  v19 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getCurrentOptInEntry:](self, "getCurrentOptInEntry:", &v19));
  v7 = v19;
  if (v7 || !v6)
  {
    if (qword_1002A7928 != -1)
      dispatch_once(&qword_1002A7928, &stru_100249690);
    v10 = qword_1002A7930;
    if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      v11 = "failed to get current opt-in state: %@";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0xCu);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      v7 = 0;
      goto LABEL_19;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer context](self, "context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "followUp"));
    v18 = 0;
    v16 = objc_msgSend(v15, "clearAllFollowups:", &v18);
    v7 = v18;

    if ((v16 & 1) == 0)
    {
      if (qword_1002A7928 != -1)
        dispatch_once(&qword_1002A7928, &stru_1002496B0);
      v17 = qword_1002A7930;
      if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        v11 = "failed to clear existing follow ups on optOut notification: %@";
        v12 = v17;
        v13 = OS_LOG_TYPE_INFO;
        goto LABEL_13;
      }
    }
  }
LABEL_19:

}

- (id)getAggregateOptInState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer stateMachine](self, "stateMachine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudRecords"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getAggregateOptInStateForApplication:error:", v8, a3));

  }
  else
  {
    if (qword_1002A7928 != -1)
      dispatch_once(&qword_1002A7928, &stru_1002496D0);
    v10 = qword_1002A7930;
    if (os_log_type_enabled((os_log_t)qword_1002A7930, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "no state machine or cloudrecords", v12, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (KTKVSProtocol)store
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KTContext)context
{
  return (KTContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (NSString)applicationId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (Class)account
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccount:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int *)a3
{
  self->_notifyToken = a3;
}

- (BOOL)outstandingSetSignal
{
  return self->_outstandingSetSignal;
}

- (void)setOutstandingSetSignal:(BOOL)a3
{
  self->_outstandingSetSignal = a3;
}

- (OS_dispatch_queue)setQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSetQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_group)setGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSetGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setGroup, 0);
  objc_storeStrong((id *)&self->_setQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_applicationId, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
