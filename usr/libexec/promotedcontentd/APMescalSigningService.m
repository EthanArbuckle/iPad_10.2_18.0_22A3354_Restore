@implementation APMescalSigningService

- (id)signatureForData:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService rawSignatureForData:error:](self, "rawSignatureForData:error:", a3, a4));
  v5 = v4;
  if (v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 32));
  else
    v6 = 0;

  return v6;
}

- (id)rawSignatureForData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService _checkErrorState](self, "_checkErrorState"));
    v8 = v7;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService provider](self, "provider"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rawSignatureForData:error:", v6, a4));

      v11 = APLogForCategory(28);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        if (a4)
          v13 = (const __CFString *)*a4;
        else
          v13 = CFSTR("(null)");
        v15 = 138740227;
        v16 = v9;
        v17 = 2114;
        v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Returning signature %{sensitive}@ with error %{public}@", (uint8_t *)&v15, 0x16u);
      }

    }
    goto LABEL_15;
  }
  if (a4)
  {
    v19 = CFSTR("reason");
    v20 = CFSTR("Passed in data was nil.");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MescalSigning"), 1100, v8));
LABEL_15:

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (APMescalSigningProviderProtocol)provider
{
  return self->_provider;
}

+ (APMescalSigningService)service
{
  return (APMescalSigningService *)(id)qword_1002699F8;
}

- (id)_checkErrorState
{
  id v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v3 = objc_alloc((Class)NSUserDefaults);
    v4 = objc_msgSend(v3, "initWithSuiteName:", APDefaultsBundleID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MescalForceState")));

    if (v5)
    {
      v6 = objc_msgSend(v4, "integerForKey:", CFSTR("MescalForceState"));
      if ((unint64_t)v6 <= 4)
        -[APMescalSigningService setState:](self, "setState:", v6);
    }

  }
  v7 = -[APMescalSigningService state](self, "state");
  if (v7 > 4 || ((0x1Bu >> v7) & 1) == 0)
    return 0;
  v9 = (uint64_t)*(&off_100215780 + v7);
  v10 = qword_1001B85E8[v7];
  v13 = CFSTR("reason");
  v14 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MescalSigning"), v10, v11));

  return v12;
}

- (int64_t)state
{
  void *v3;
  int64_t state;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService stateLock](self, "stateLock"));
  objc_msgSend(v3, "lock");
  state = self->_state;
  objc_msgSend(v3, "unlock");

  return state;
}

- (APUnfairLock)stateLock
{
  return self->_stateLock;
}

+ (void)createServiceWithAMSProvider:(BOOL)a3
{
  APMescalSigningService *v3;
  void *v4;

  v3 = -[APMescalSigningService initWithAMSProvider:]([APMescalSigningService alloc], "initWithAMSProvider:", a3);
  v4 = (void *)qword_1002699F8;
  qword_1002699F8 = (uint64_t)v3;

}

+ (void)removeService
{
  void *v2;

  v2 = (void *)qword_1002699F8;
  qword_1002699F8 = 0;

}

+ (id)initializeMescalProvider:(BOOL)a3 interval:(unint64_t)a4
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  APAMSMescalSigningService *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  APAMSMescalSigningService *v18;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  int v25;
  id v26;
  __int16 v27;
  const __CFString *v28;

  v5 = a3;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v7 = objc_alloc((Class)NSUserDefaults);
    v8 = objc_msgSend(v7, "initWithSuiteName:", APDefaultsBundleID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForKey:", CFSTR("MescalProvider")));
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("AMS")))
      {
        v11 = APLogForCategory(28);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138477827;
          v26 = (id)objc_opt_class(a1);
          v13 = v26;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{private}@ Using AMSMescal due to User Defaults.", (uint8_t *)&v25, 0xCu);

        }
        v14 = objc_alloc_init(APAMSMescalSigningService);
LABEL_11:
        v18 = v14;

        return v18;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("AP")))
      {
        v15 = APLogForCategory(28);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138477827;
          v26 = (id)objc_opt_class(a1);
          v17 = v26;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{private}@ Using FairPlay due to User Defaults.", (uint8_t *)&v25, 0xCu);

        }
        v14 = -[APAPMescalSigningService initWithInterval:]([APAPMescalSigningService alloc], "initWithInterval:", a4);
        goto LABEL_11;
      }
    }

  }
  v20 = APLogForCategory(28);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_opt_class(a1);
    v23 = CFSTR("FairPlay");
    if (v5)
      v23 = CFSTR("AMSMescal");
    v25 = 138478083;
    v26 = v22;
    v27 = 2114;
    v28 = v23;
    v24 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{private}@: Using bag determined %{public}@ provider.", (uint8_t *)&v25, 0x16u);

  }
  if (v5)
    return objc_alloc_init(APAMSMescalSigningService);
  else
    return -[APAPMescalSigningService initWithInterval:]([APAPMescalSigningService alloc], "initWithInterval:", a4);
}

- (APMescalSigningService)initWithAMSProvider:(BOOL)a3
{
  _BOOL8 v3;
  APMescalSigningService *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t intervalId;
  NSMutableDictionary *v11;
  NSMutableDictionary *requestsWhileInitializing;
  APUnfairLock *v13;
  APUnfairLock *syncRequestsLock;
  APUnfairLock *v15;
  APUnfairLock *stateLock;
  dispatch_queue_t v17;
  OS_dispatch_queue *setupQueue;
  NSHashTable *v19;
  NSHashTable *mescalStateDelegates;
  id v21;
  uint64_t v22;
  APMescalSigningProviderProtocol *provider;
  objc_super v25;
  uint8_t buf[4];
  _BOOL4 v27;

  v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)APMescalSigningService;
  v4 = -[APMescalSigningService init](&v25, "init");
  if (v4)
  {
    v5 = APPerfLogForCategory(28);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v4->_intervalId = os_signpost_id_generate(v6);

    v7 = APPerfLogForCategory(28);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    intervalId = v4->_intervalId;
    if (intervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 67240192;
      v27 = v3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, intervalId, "Setup Signing Service", "service=%{public, name=service}d", buf, 8u);
    }

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestsWhileInitializing = v4->_requestsWhileInitializing;
    v4->_requestsWhileInitializing = v11;

    v13 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    syncRequestsLock = v4->_syncRequestsLock;
    v4->_syncRequestsLock = v13;

    v15 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    stateLock = v4->_stateLock;
    v4->_stateLock = v15;

    v4->_state = 0;
    v17 = dispatch_queue_create("com.apple.ap.mescalsigning", 0);
    setupQueue = v4->_setupQueue;
    v4->_setupQueue = (OS_dispatch_queue *)v17;

    v19 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 5, 2);
    mescalStateDelegates = v4->_mescalStateDelegates;
    v4->_mescalStateDelegates = v19;

    -[APMescalSigningService setSetupStartTime:](v4, "setSetupStartTime:", CFAbsoluteTimeGetCurrent());
    v21 = objc_msgSend((id)objc_opt_class(v4), "initializeMescalProvider:interval:", v3, v4->_intervalId);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    provider = v4->_provider;
    v4->_provider = (APMescalSigningProviderProtocol *)v22;

    -[APMescalSigningProviderProtocol setDelegate:](v4->_provider, "setDelegate:", v4);
    -[APMescalSigningService start](v4, "start");
  }
  return v4;
}

- (void)mescalStateChanged:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  double Current;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  double v26;

  -[APMescalSigningService setState:](self, "setState:", a3);
  if ((id)-[APMescalSigningService state](self, "state") == (id)3)
  {
    -[APMescalSigningService retrySetup](self, "retrySetup");
  }
  else if ((id)-[APMescalSigningService state](self, "state") == (id)2)
  {
    v4 = APLogForCategory(28);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[APMescalSigningService setupStartTime](self, "setupStartTime");
      *(_DWORD *)buf = 136643075;
      v24 = "-[APMescalSigningService mescalStateChanged:]";
      v25 = 2048;
      v26 = Current - v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Request signing negotiation complete; signing and verification now available. Setup took %0.2lfs",
        buf,
        0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService syncRequestsLock](self, "syncRequestsLock"));
    objc_msgSend(v8, "lock");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService requestsWhileInitializing](self, "requestsWhileInitializing"));
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    -[APMescalSigningService setRequestsWhileInitializing:](self, "setRequestsWhileInitializing:", v10);

    objc_msgSend(v8, "unlock");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15);
          v17 = objc_claimAutoreleasedReturnValue(-[APMescalSigningService setupQueue](self, "setupQueue"));
          dispatch_async(v17, v16);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

  }
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[APMescalSigningService setupQueue](self, "setupQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122908;
  block[3] = &unk_100212FE0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)registerStateChangeDelegate:(id)a3
{
  APMescalSigningService *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService mescalStateDelegates](v4, "mescalStateDelegates"));
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(v6, "mescalStateChanged:", -[APMescalSigningService state](v4, "state"));
    objc_sync_exit(v4);

  }
}

- (void)setState:(int64_t)a3
{
  void *v5;
  int64_t state;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  int64_t v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService stateLock](self, "stateLock"));
  objc_msgSend(v5, "lock");
  state = self->_state;
  self->_state = a3;
  v7 = APPerfLogForCategory(28);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = -[APMescalSigningService intervalId](self, "intervalId");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134349056;
      v14 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, v10, "Service State", "Service State state=%{public, name=state}ld", buf, 0xCu);
    }
  }

  objc_msgSend(v5, "unlock");
  if (state != a3)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[APMescalSigningService setupQueue](self, "setupQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100122B50;
    v12[3] = &unk_100215718;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(v11, v12);

  }
}

- (void)_handleStateChange:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  APMescalSigningService *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  const __CFString **v20;
  _UNKNOWN ***v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFString *v29;
  _UNKNOWN **v30;
  const __CFString *v31;
  _UNKNOWN **v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;

  v5 = APLogForCategory(28);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10022B338, "objectAtIndexedSubscript:", a3));
    *(_DWORD *)buf = 138543362;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Mescal signing state set to %{public}@.", buf, 0xCu);

  }
  v8 = self;
  objc_sync_enter(v8);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService mescalStateDelegates](v8, "mescalStateDelegates", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (v13)
          objc_msgSend(v13, "mescalStateChanged:", a3);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v10);
  }

  switch(a3)
  {
    case 4:
      goto LABEL_15;
    case 3:
      -[APMescalSigningService retrySetup](v8, "retrySetup");
      if (qword_100269A00 != -1)
        dispatch_once(&qword_100269A00, &stru_100215738);
      v22 = APPerfLogForCategory(28);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = -[APMescalSigningService intervalId](v8, "intervalId");
      if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v24, "Setup Signing Service", ", buf, 2u);
      }
      goto LABEL_29;
    case 2:
LABEL_15:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService backoffTimer](v8, "backoffTimer"));
      v15 = v14 == 0;

      if (!v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService backoffTimer](v8, "backoffTimer"));
        objc_msgSend(v16, "reset");

        -[APMescalSigningService setBackoffTimer:](v8, "setBackoffTimer:", 0);
      }
      v17 = APPerfLogForCategory(28);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = -[APMescalSigningService intervalId](v8, "intervalId");
      if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v19, "Setup Signing Service", ", buf, 2u);
      }

      if (a3 == 2)
      {
        v31 = CFSTR("finalStatus");
        v32 = &off_100229AB0;
        v20 = &v31;
        v21 = &v32;
      }
      else
      {
        v29 = CFSTR("finalStatus");
        v30 = &off_100229AC8;
        v20 = &v29;
        v21 = &v30;
      }
      v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 1));
      AnalyticsSendEvent(CFSTR("com.apple.adplatforms.mescal.finalStatus"), v23);
LABEL_29:

      break;
  }
  objc_sync_exit(v8);

}

- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v19;
  const char *v20;
  const __CFString *v21;
  const __CFString *v22;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService _checkErrorState](self, "_checkErrorState"));
    v12 = v11;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService provider](self, "provider"));
      v13 = objc_msgSend(v17, "signatureIsValid:data:error:", v8, v10, a5);

    }
  }
  else
  {
    if (a5)
    {
      v21 = CFSTR("reason");
      v22 = CFSTR("Signature and data must not be nil.");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MescalSigning"), 1100, v14));

    }
    v15 = APLogForCategory(28);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136642819;
      v20 = "-[APMescalSigningService signatureIsValid:data:error:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: signature and data must not be nil.", (uint8_t *)&v19, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  void *v10;
  id v11;

  v8 = (void (**)(id, void *, id))a5;
  v9 = a3;
  if ((id)-[APMescalSigningService state](self, "state") == (id)2)
  {
    v11 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService signatureForData:error:](self, "signatureForData:error:", v9, &v11));

    v9 = v11;
    v8[2](v8, v10, v9);

  }
  else
  {
    -[APMescalSigningService queueSignatureRequest:waitTime:completion:](self, "queueSignatureRequest:waitTime:completion:", v9, v8, a4);
  }

}

- (void)rawSignatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  void *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  if ((id)-[APMescalSigningService state](self, "state") == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService provider](self, "provider"));
    v13 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rawSignatureForData:error:", v8, &v13));
    v12 = v13;

    v9[2](v9, v11, v12);
  }
  else
  {
    -[APMescalSigningService queueRawSignatureRequest:waitTime:completion:](self, "queueRawSignatureRequest:waitTime:completion:", v8, v9, a4);
  }

}

- (void)queueRawSignatureRequest:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  dispatch_time_t v17;
  NSObject *v18;
  id v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[5];
  id v28;
  id v29;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001234E0;
  v27[3] = &unk_100212FA8;
  v27[4] = self;
  v11 = v8;
  v28 = v11;
  v12 = v9;
  v29 = v12;
  v13 = objc_retainBlock(v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService syncRequestsLock](self, "syncRequestsLock"));
  objc_msgSend(v14, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService requestsWhileInitializing](self, "requestsWhileInitializing"));
  v16 = objc_retainBlock(v13);
  objc_msgSend(v15, "setObject:forKey:", v16, v10);

  objc_msgSend(v14, "unlock");
  objc_initWeak(&location, self);
  v17 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v18 = objc_claimAutoreleasedReturnValue(-[APMescalSigningService setupQueue](self, "setupQueue"));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_100123560;
  v23 = &unk_100213F40;
  objc_copyWeak(&v25, &location);
  v19 = v10;
  v24 = v19;
  dispatch_after(v17, v18, &v20);

  -[APMescalSigningService retrySetup](self, "retrySetup", v20, v21, v22, v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)queueSignatureRequest:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001236D8;
  v9[3] = &unk_100215760;
  v10 = a5;
  v8 = v10;
  -[APMescalSigningService queueRawSignatureRequest:waitTime:completion:](self, "queueRawSignatureRequest:waitTime:completion:", a3, v9, a4);

}

- (void)retrySetup
{
  uint64_t v3;
  APMescalSigningService *v4;
  int64_t state;
  void *v6;
  APBackoffTimer *v7;
  APBackoffTimer *backoffTimer;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int64_t v18;

  if ((id)-[APMescalSigningService state](self, "state") == (id)1
    || (id)-[APMescalSigningService state](self, "state") == (id)2)
  {
    v3 = APLogForCategory(28);
    v4 = (APMescalSigningService *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      state = self->_state;
      v15 = 136643075;
      v16 = "-[APMescalSigningService retrySetup]";
      v17 = 2048;
      v18 = state;
      _os_log_impl((void *)&_mh_execute_header, &v4->super, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Unexpected state %ld attempting to set up request signing.", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if ((id)-[APMescalSigningService state](self, "state") != (id)3)
      return;
    v4 = self;
    objc_sync_enter(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService backoffTimer](v4, "backoffTimer"));

    if (!v6)
    {
      v7 = (APBackoffTimer *)objc_msgSend(objc_alloc((Class)APBackoffTimer), "initWithSchedule:name:", &off_10022B350, CFSTR("APMescalSigningService"));
      backoffTimer = v4->_backoffTimer;
      v4->_backoffTimer = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService backoffTimer](v4, "backoffTimer"));
      objc_msgSend(v9, "setDelegate:", v4);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService backoffTimer](v4, "backoffTimer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningService setupQueue](v4, "setupQueue"));
    v12 = objc_msgSend(v10, "scheduleNextLevelWithQueue:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = APLogForCategory(28);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error: Couldn't schedule Backoff Timer for Mescal Signing Service.", (uint8_t *)&v15, 2u);
      }

    }
    objc_sync_exit(v4);
  }

}

- (void)backoffTimerFired
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = APPerfLogForCategory(28);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = -[APMescalSigningService intervalId](self, "intervalId");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Setup Signing Service", ", buf, 2u);
    }
  }

  v7 = APLogForCategory(28);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting request signing session recovery after previous failure.", buf, 2u);
  }

  -[APMescalSigningService setState:](self, "setState:", 1);
  -[APMescalSigningService setSetupStartTime:](self, "setSetupStartTime:", CFAbsoluteTimeGetCurrent());
  v9 = objc_claimAutoreleasedReturnValue(-[APMescalSigningService setupQueue](self, "setupQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100123AB8;
  block[3] = &unk_100212FE0;
  block[4] = self;
  dispatch_async(v9, block);

}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (double)setupStartTime
{
  return self->_setupStartTime;
}

- (void)setSetupStartTime:(double)a3
{
  self->_setupStartTime = a3;
}

- (NSMutableData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_storeStrong((id *)&self->_certificateData, a3);
}

- (NSMutableDictionary)requestsWhileInitializing
{
  return self->_requestsWhileInitializing;
}

- (void)setRequestsWhileInitializing:(id)a3
{
  objc_storeStrong((id *)&self->_requestsWhileInitializing, a3);
}

- (APUnfairLock)syncRequestsLock
{
  return self->_syncRequestsLock;
}

- (OS_dispatch_queue)setupQueue
{
  return self->_setupQueue;
}

- (void)setSetupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_setupQueue, a3);
}

- (NSHashTable)mescalStateDelegates
{
  return self->_mescalStateDelegates;
}

- (void)setMescalStateDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_mescalStateDelegates, a3);
}

- (APBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_mescalStateDelegates, 0);
  objc_storeStrong((id *)&self->_setupQueue, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_syncRequestsLock, 0);
  objc_storeStrong((id *)&self->_requestsWhileInitializing, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
