@implementation AAFAnalyticsEventSecurity

- (BOOL)permittedToSendMetrics
{
  if (-[AAFAnalyticsEventSecurity isAAAFoundationAvailable](self, "isAAAFoundationAvailable")
    && -[AAFAnalyticsEventSecurity isAuthKitAvailable](self, "isAuthKitAvailable")
    && !-[AAFAnalyticsEventSecurity areTestsEnabled](self, "areTestsEnabled"))
  {
    return -[AAFAnalyticsEventSecurity canSendMetrics](self, "canSendMetrics");
  }
  else
  {
    return 0;
  }
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  AAFAnalyticsEventSecurity *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  void *v23;
  objc_class *v24;
  id v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *i;
  uint64_t v36;
  void *v37;
  AAFAnalyticsEvent *event;
  AAFAnalyticsEventSecurity *v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  objc_super v52;
  void **v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];

  v10 = a8;
  v16 = a3;
  v43 = a4;
  v46 = a5;
  v17 = a6;
  v44 = a7;
  v45 = a10;
  if (+[AAFAnalyticsEventSecurity isAAAFoundationAvailable](AAFAnalyticsEventSecurity, "isAAAFoundationAvailable")&& +[AAFAnalyticsEventSecurity isAuthKitAvailable](AAFAnalyticsEventSecurity, "isAuthKitAvailable")&& a9&& !v10)
  {
    v51.receiver = self;
    v51.super_class = (Class)AAFAnalyticsEventSecurity;
    v18 = -[AAFAnalyticsEventSecurity init](&v51, "init");
    if (v18)
    {
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = dispatch_queue_create("com.apple.security.aafanalyticsevent.queue", v20);
      queue = v18->_queue;
      v18->_queue = (OS_dispatch_queue *)v21;

      v18->_areTestsEnabled = 0;
      v18->_canSendMetrics = a9;
      *(_WORD *)&v18->_isAAAFoundationAvailable = 257;
      v58 = 0;
      v59 = &v58;
      v60 = 0x2050000000;
      v23 = (void *)qword_100340FD8;
      v61 = qword_100340FD8;
      if (!qword_100340FD8)
      {
        v53 = _NSConcreteStackBlock;
        v54 = 3221225472;
        v55 = (uint64_t)sub_1000AB268;
        v56 = &unk_1002EBE60;
        v57 = &v58;
        sub_1000AB268((uint64_t)&v53);
        v23 = (void *)v59[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v58, 8);
      v25 = objc_msgSend([v24 alloc], "initWithEventName:eventCategory:initData:", v44, v45, 0);
      if (v46 && (objc_msgSend(v46, "isEqualToString:", &stru_1002EE888) & 1) == 0)
      {
        v53 = 0;
        v54 = (uint64_t)&v53;
        v55 = 0x2020000000;
        v26 = (_QWORD *)qword_100340FE0;
        v56 = (void *)qword_100340FE0;
        if (!qword_100340FE0)
        {
          v27 = sub_1000AB32C();
          v26 = dlsym(v27, "kAAFFlowId");
          *(_QWORD *)(v54 + 24) = v26;
          qword_100340FE0 = (uint64_t)v26;
        }
        _Block_object_dispose(&v53, 8);
        if (!v26)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getkAAFFlowId(void)"));
          objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("AAFAnalyticsEvent+Security.m"), 46, CFSTR("%s"), dlerror());

          __break(1u);
        }
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v46, *v26);
      }
      if (v17 && (objc_msgSend(v17, "isEqualToString:", &stru_1002EE888) & 1) == 0)
      {
        sub_1000AB430();
        v28 = (void *)objc_claimAutoreleasedReturnValue(v31);
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, v28);
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:](AAFAnalyticsEventSecurity, "fetchDeviceSessionIDFromAuthKit:", v43));
        sub_1000AB430();
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, v30);

      }
      if (v16)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v33; i = (char *)i + 1)
            {
              if (*(_QWORD *)v48 != v34)
                objc_enumerationMutation(v32);
              v36 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v36));
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v37, v36);

            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
          }
          while (v33);
        }

      }
      event = v18->_event;
      v18->_event = (AAFAnalyticsEvent *)v25;

    }
  }
  else
  {
    v52.receiver = self;
    v52.super_class = (Class)AAFAnalyticsEventSecurity;
    v18 = -[AAFAnalyticsEventSecurity init](&v52, "init");
    if (v18)
    {
      v18->_isAAAFoundationAvailable = +[AAFAnalyticsEventSecurity isAAAFoundationAvailable](AAFAnalyticsEventSecurity, "isAAAFoundationAvailable");
      v18->_isAuthKitAvailable = +[AAFAnalyticsEventSecurity isAuthKitAvailable](AAFAnalyticsEventSecurity, "isAuthKitAvailable");
      v18->_areTestsEnabled = v10;
      v18->_canSendMetrics = a9;
    }
  }
  v39 = v18;

  return v39;
}

- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](self, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", a3, a4, 0, 0, a5, a6, v9, a7);
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  return -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](self, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", a3, a4, 0, 0, a5, 0, v7, a6);
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (-[AAFAnalyticsEventSecurity permittedToSendMetrics](self, "permittedToSendMetrics"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[AAFAnalyticsEventSecurity queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AB228;
    block[3] = &unk_1002E9728;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

- (void)addMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  AAFAnalyticsEventSecurity *v8;

  v4 = a3;
  if (-[AAFAnalyticsEventSecurity permittedToSendMetrics](self, "permittedToSendMetrics"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[AAFAnalyticsEventSecurity queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AB0F4;
    v6[3] = &unk_1002E9728;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AAFAnalyticsEvent)event
{
  return (AAFAnalyticsEvent *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)areTestsEnabled
{
  return self->_areTestsEnabled;
}

- (void)setAreTestsEnabled:(BOOL)a3
{
  self->_areTestsEnabled = a3;
}

- (BOOL)canSendMetrics
{
  return self->_canSendMetrics;
}

- (void)setCanSendMetrics:(BOOL)a3
{
  self->_canSendMetrics = a3;
}

- (BOOL)isAAAFoundationAvailable
{
  return self->_isAAAFoundationAvailable;
}

- (void)setIsAAAFoundationAvailable:(BOOL)a3
{
  self->_isAAAFoundationAvailable = a3;
}

- (BOOL)isAuthKitAvailable
{
  return self->_isAuthKitAvailable;
}

- (void)setIsAuthKitAvailable:(BOOL)a3
{
  self->_isAuthKitAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (BOOL)isAAAFoundationAvailable
{
  if (qword_100340FA8 != -1)
    dispatch_once(&qword_100340FA8, &stru_1002DCAC0);
  return byte_100340FA0;
}

+ (BOOL)isAuthKitAvailable
{
  if (qword_100340FB8 != -1)
    dispatch_once(&qword_100340FB8, &stru_1002DCAE0);
  return byte_100340FB0;
}

+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 buf;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)qword_100340FD0;
  v18 = qword_100340FD0;
  if (!qword_100340FD0)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v20 = sub_1000AB79C;
    v21 = &unk_1002EBE60;
    v22 = &v15;
    sub_1000AB79C((uint64_t)&buf);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedInstance"));
  v7 = v6;
  if (v3)
  {
    v14 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "authKitAccountWithAltDSID:error:", v3, &v14));
    v9 = v14;
    if (v9)
    {
      v10 = sub_10000EF14("SecError");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "authKitAccountWithAltDSID returned error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryAuthKitAccount"));
  }
  if (objc_msgSend(v7, "accountAccessTelemetryOptInForAccount:", v8))
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "telemetryDeviceSessionIDForAccount:", v8));
  else
    v12 = 0;

  return v12;
}

@end
