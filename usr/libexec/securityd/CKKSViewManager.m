@implementation CKKSViewManager

- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6
{
  const void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  unsigned int v15;
  const void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  unsigned int v21;
  BOOL v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  id v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  NSObject *v55;
  id v56;
  __OpaqueSecDbConnection *v57;
  unint64_t v58;
  NSObject *v59;
  NSObject *v60;
  CKKSViewManager *v61;
  CKKSViewManager *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  _BYTE v69[10];
  NSObject *v70;

  if ((unint64_t)a5 | (unint64_t)a6)
  {
    if (a5)
    {
      v11 = sub_100019204(a5, (uint64_t)&off_1002E7D78, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (objc_msgSend(v12, "length"))
      {
        if (v12)
          v13 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v12), "bytes"));
        else
          v13 = 0;
        v15 = 0;
      }
      else
      {
        if (qword_100341188 != -1)
          dispatch_once(&qword_100341188, &stru_1002DED08);
        v15 = objc_msgSend(v12, "isEqualToData:", qword_100341190);
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
    if (a6)
    {
      v16 = sub_100019204(a6, (uint64_t)&off_1002E7D78, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (objc_msgSend(v17, "length"))
      {
        if (v17)
        {
          v18 = objc_alloc((Class)NSUUID);
          v19 = objc_retainAutorelease(v17);
          v20 = objc_msgSend(v18, "initWithUUIDBytes:", objc_msgSend(v19, "bytes"));

          v21 = 0;
          v22 = v13 != 0;
          v23 = v20 != 0;
          if (v13 && v20)
          {
            v61 = self;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v13, "UUIDString"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v20, "UUIDString"));
            v26 = objc_msgSend(v24, "isEqualToString:", v25);

            if ((v26 & 1) == 0)
            {
              v56 = sub_10000BDF4(CFSTR("handleKeychainEventDbConnection"), 0);
              v42 = objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v69 = v13;
                *(_WORD *)&v69[8] = 2112;
                v70 = v20;
                v43 = "musr for added and deleted are different. added's musr:%@, deleted's musr: %@";
                v44 = v42;
                v45 = 22;
                goto LABEL_66;
              }
LABEL_67:

              goto LABEL_68;
            }
            v21 = 0;
            v23 = 1;
            v22 = 1;
            self = v61;
          }
          if (!a5)
            goto LABEL_31;
LABEL_30:
          if (v21 == v15)
            goto LABEL_31;
          v41 = sub_10000BDF4(CFSTR("handleKeychainEventDbConnection"), 0);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v69 = v15;
            *(_WORD *)&v69[4] = 1024;
            *(_DWORD *)&v69[6] = v21;
            v43 = "added's SingleUserKeychainUUID is different from deleted's. added's musr:%d, deleted's musr: %d";
            v44 = v42;
            v45 = 14;
LABEL_66:
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
            goto LABEL_67;
          }
          goto LABEL_67;
        }
        v21 = 0;
      }
      else
      {
        if (qword_100341188 != -1)
          dispatch_once(&qword_100341188, &stru_1002DED08);
        v21 = objc_msgSend(v17, "isEqualToData:", qword_100341190);
      }

      v23 = 0;
      v20 = 0;
      v22 = v13 != 0;
      if (a5)
        goto LABEL_30;
    }
    else
    {
      v20 = 0;
      v23 = 0;
      v22 = v13 != 0;
    }
LABEL_31:
    if (v22 || v23)
    {
      if (v22)
        v28 = v13;
      else
        v28 = v20;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v28, "UUIDString"));
      if (((v27 != 0) & ~v15) != 0)
      {
        if (qword_1003412C8 != -1)
          dispatch_once(&qword_1003412C8, &stru_1002E7860);
        if (byte_1003412C0)
        {
          v57 = a3;
          v58 = a4;
          v59 = v20;
          v60 = v13;
          v62 = self;
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager accountsAdapter](self, "accountsAdapter"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "inflateAllTPSpecificUsers:octagonContextID:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));

          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v30 = v33;
          v34 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          if (!v34)
          {
LABEL_51:

LABEL_60:
            v54 = sub_10000BDF4(CFSTR("handleKeychainEventDbConnection"), 0);
            v55 = objc_claimAutoreleasedReturnValue(v54);
            v20 = v59;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "did not find an active account for the persona", buf, 2u);
            }

            v13 = v60;
            goto LABEL_63;
          }
          v35 = v34;
          v36 = *(_QWORD *)v64;
LABEL_45:
          v37 = 0;
          while (1)
          {
            if (*(_QWORD *)v64 != v36)
              objc_enumerationMutation(v30);
            v38 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "personaUniqueString"));
            v40 = objc_msgSend(v39, "isEqualToString:", v27);

            if ((v40 & 1) != 0)
              break;
            if (v35 == (id)++v37)
            {
              v35 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
              if (v35)
                goto LABEL_45;
              goto LABEL_51;
            }
          }
          v46 = v38;

          if (!v46)
            goto LABEL_60;
          v47 = sub_10000BDF4(CFSTR("handleKeychainEventDbConnection"), 0);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          v20 = v59;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v69 = v46;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "using tpspecific user: %@", buf, 0xCu);
          }

          v49 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "cloudkitContainerName"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "octagonContextID"));
          v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "ckksAccountSyncForContainer:contextID:possibleAccount:", v50, v51, v46));

          v30 = v52;
          v13 = v60;
          self = v62;
          a3 = v57;
          a4 = v58;
          if (v30)
            goto LABEL_39;
        }
        goto LABEL_58;
      }
    }
    else
    {
      v27 = 0;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ckksAccountSyncForContainer:contextID:possibleAccount:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext"), 0));

    if (v30)
    {
LABEL_39:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager globalRateLimiter](self, "globalRateLimiter"));
      -[NSObject handleKeychainEventDbConnection:source:added:deleted:rateLimiter:](v30, "handleKeychainEventDbConnection:source:added:deleted:rateLimiter:", a3, a4, a5, a6, v31);

LABEL_63:
LABEL_68:

      goto LABEL_69;
    }
LABEL_58:
    v53 = sub_10000BDF4(CFSTR("handleKeychainEventDbConnection"), 0);
    v30 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "ckks view is nil! returning.", buf, 2u);
    }
    goto LABEL_63;
  }
  v14 = sub_10000BDF4(CFSTR("handleKeychainEventDbConnection"), 0);
  v13 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "both added and deleted SecDbItemRefs are nil, returning", buf, 2u);
  }
LABEL_69:

}

- (CKKSRateLimiter)globalRateLimiter
{
  return (CKKSRateLimiter *)objc_getProperty(self, a2, 56, 1);
}

+ (id)manager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewManager"));

  return v3;
}

- (CKKSViewManager)initWithContainer:(id)a3 sosAdapter:(id)a4 accountStateTracker:(id)a5 lockStateTracker:(id)a6 reachabilityTracker:(id)a7 personaAdapter:(id)a8 cloudKitClassDependencies:(id)a9 accountsAdapter:(id)a10
{
  id v17;
  CKKSViewManager *v18;
  CKKSViewManager *v19;
  NSSet *viewAllowList;
  id v21;
  NSOperationQueue *v22;
  NSOperationQueue *operationQueue;
  NSMutableDictionary *v24;
  NSMutableDictionary *pendingSyncCallbacks;
  CKKSCondition *v26;
  CKKSCondition *completedSecCKKSInitialize;
  uint64_t v28;
  NSXPCListener *listener;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v17 = a9;
  v32 = a10;
  v39.receiver = self;
  v39.super_class = (Class)CKKSViewManager;
  v18 = -[CKKSViewManager init](&v39, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cloudKitClassDependencies, a9);
    objc_storeStrong((id *)&v19->_sosPeerAdapter, a4);
    viewAllowList = v19->_viewAllowList;
    v19->_viewAllowList = 0;

    objc_storeStrong((id *)&v19->_container, a3);
    objc_storeStrong((id *)&v19->_accountTracker, a5);
    objc_storeStrong((id *)&v19->_lockStateTracker, a6);
    -[CKKSLockStateTracker addLockStateObserver:](v19->_lockStateTracker, "addLockStateObserver:", v19);
    objc_storeStrong((id *)&v19->_reachabilityTracker, a7);
    objc_storeStrong((id *)&v19->_personaAdapter, a8);
    objc_storeStrong((id *)&v19->_accountsAdapter, a10);
    v21 = +[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:](OctagonAPSReceiver, "receiverForNamedDelegatePort:apsConnectionClass:", CFSTR("com.apple.securityd.aps"), objc_msgSend(v17, "apsConnectionClass"));
    v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingSyncCallbacks = v19->_pendingSyncCallbacks;
    v19->_pendingSyncCallbacks = v24;

    v26 = objc_alloc_init(CKKSCondition);
    completedSecCKKSInitialize = v19->_completedSecCKKSInitialize;
    v19->_completedSecCKKSInitialize = v26;

    v28 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    listener = v19->_listener;
    v19->_listener = (NSXPCListener *)v28;

    -[NSXPCListener setDelegate:](v19->_listener, "setDelegate:", v19);
    -[NSXPCListener resume](v19->_listener, "resume");
    v30 = -[CKKSAccountStateTracker registerForNotificationsOfCloudKitAccountStatusChange:](v19->_accountTracker, "registerForNotificationsOfCloudKitAccountStatusChange:", v19);
  }

  return v19;
}

- (BOOL)allowClientRPC:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  BOOL result;
  const void *v8;
  NSObject *v9;
  id v10;
  uint8_t v11[16];

  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager personaAdapter](self, "personaAdapter"));
  v6 = objc_msgSend(v5, "currentThreadIsForPrimaryiCloudAccount");

  if ((v6 & 1) != 0)
    return 1;
  v8 = sub_10000EF14("ckks");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rejecting client RPC for non-primary persona", v11, 2u);
  }

  if (!a3)
    return 0;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 65, CFSTR("CKKS APIs do not support non-primary users")));
  result = 0;
  *a3 = v10;
  return result;
}

- (BOOL)waitForTrustReady
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110E80;
  block[3] = &unk_1002EBE60;
  block[4] = &v5;
  if (qword_1003410E8 != -1)
    dispatch_once(&qword_1003410E8, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setupAnalytics
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  id location;
  _BYTE v27[128];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100110078;
  v24[3] = &unk_1002DE408;
  objc_copyWeak(&v25, &location);
  v4 = SFAnalyticsSamplerIntervalOncePerReport;
  v5 = objc_msgSend(v3, "AddMultiSamplerForName:withTimeInterval:block:", CFSTR("CKKS-healthSummary"), v24, SFAnalyticsSamplerIntervalOncePerReport);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager ckksAccountSyncForContainer:contextID:](self, "ckksAccountSyncForContainer:contextID:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
  v7 = v6;
  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewList"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKKS-%@-healthSummary"), v12));
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1001103A8;
          v16[3] = &unk_1002DE430;
          objc_copyWeak(&v19, &location);
          v17 = v7;
          v18 = v12;
          v15 = objc_msgSend(v13, "AddMultiSamplerForName:withTimeInterval:block:", v14, v16, v4);

          objc_destroyWeak(&v19);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v9);
    }

  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (id)getGlobalRateLimiter
{
  CKKSRateLimiter *v3;
  CKKSRateLimiter **p_globalRateLimiter;
  CKKSRateLimiter *globalRateLimiter;
  CKKSRateLimiter *v7;
  _QWORD block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (qword_1003410F8 != -1)
    dispatch_once(&qword_1003410F8, &stru_1002DE450);
  globalRateLimiter = self->_globalRateLimiter;
  p_globalRateLimiter = &self->_globalRateLimiter;
  v3 = globalRateLimiter;
  if (globalRateLimiter)
    return v3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10010FED0;
  v13 = sub_10010FEE0;
  v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010FEE8;
  block[3] = &unk_1002EBE60;
  block[4] = &v9;
  dispatch_sync((dispatch_queue_t)qword_1003410F0, block);
  objc_storeStrong((id *)p_globalRateLimiter, (id)v10[5]);
  v7 = *p_globalRateLimiter;
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (void)lockStateChangeNotification:(BOOL)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "setDateProperty:forKey:", v3, CFSTR("lastUnlock"));

  }
}

- (id)restartCKKSAccountSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncingPolicy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager restartCKKSAccountSyncWithoutSettingPolicy:](self, "restartCKKSAccountSyncWithoutSettingPolicy:", v4));

  objc_msgSend(v6, "setCurrentSyncingPolicy:policyIsFresh:", v5, 0);
  return v6;
}

- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckksAccountSyncForContainer:contextID:possibleAccount:", v6, v5, 0));

  if (!v8)
  {
    v9 = sub_10000BDF4(CFSTR("ckksAccountSyncForContainer"), 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to get CKKSKeychainView", v12, 2u);
    }

  }
  return v8;
}

- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restartCKKSAccountSyncWithoutSettingPolicy:", v3));

  return v5;
}

- (void)registerSyncStatusCallback:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  objc_sync_enter(v8);
  v9 = sub_10000BDF4(CFSTR("ckkscallback"), 0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "registered callback for UUID: %@", (uint8_t *)&v13, 0xCu);
  }

  v11 = objc_retainBlock(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v6);

  objc_sync_exit(v8);
}

- (id)claimCallbackForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

    if (v7)
    {
      v8 = sub_10000BDF4(CFSTR("ckkscallback"), 0);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "fetched UUID: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v4);

    v11 = objc_retainBlock(v7);
    objc_sync_exit(v5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)peekCallbackForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v8 = objc_msgSend(v7, "containsObject:", v4);

    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pendingCallbackUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "copy");

  objc_sync_exit(v3);
  return v6;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];

  v20 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "accountStatus") != (id)1
    || (objc_msgSend(v6, "hasValidCredentials", v20) & 1) == 0)
  {
    obj = (id)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks", v20));
    objc_sync_enter(obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = sub_10000BDF4(CFSTR("ckkscallback"), 0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No CK account; failing all pending sync callbacks",
          buf,
          2u);
      }

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v16));
            +[CKKSViewManager callSyncCallbackWithErrorNoAccount:](CKKSViewManager, "callSyncCallbackWithErrorNoAccount:", v18);

            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
      objc_msgSend(v19, "removeAllObjects");

    }
    objc_sync_exit(obj);

  }
}

- (id)defaultViewError
{
  void *v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v6;
  void *v7;

  v6 = NSLocalizedDescriptionKey;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No syncing view for %@, %@"), CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v3));

  return v4;
}

- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, id);
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;

  v32 = a3;
  v31 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = (void (**)(id, id))a10;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v22 = objc_alloc_init((Class)OTControlArguments);
  v33 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v22, 1, 1, &v33));
  v24 = v33;

  if (!v23 || v24)
  {
    v27 = sub_10000BDF4(CFSTR("ckks"), 0);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v35 = CFSTR("com.apple.security.keychain");
      v36 = 2112;
      v37 = CFSTR("defaultContext");
      v38 = 2112;
      v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    v26 = v31;
    if (v24)
    {
      v20[2](v20, v24);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v20[2](v20, v29);

    }
    v25 = v32;
  }
  else
  {
    v26 = v31;
    v25 = v32;
    objc_msgSend(v23, "setCurrentItemForAccessGroup:hash:accessGroup:identifier:viewHint:replacing:hash:complete:", v32, v31, v15, v16, v17, v18, v19, v20);
  }

}

- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id);
  void *v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v15 = objc_alloc_init((Class)OTControlArguments);
  v22 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v15, 1, 1, &v22));
  v17 = v22;

  if (v16)
    v18 = v17 == 0;
  else
    v18 = 0;
  if (v18)
  {
    objc_msgSend(v16, "unsetCurrentItemsForAccessGroup:identifiers:viewHint:complete:", v10, v11, v12, v13);
  }
  else
  {
    v19 = sub_10000BDF4(CFSTR("ckks"), 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v24 = CFSTR("com.apple.security.keychain");
      v25 = 2112;
      v26 = CFSTR("defaultContext");
      v27 = 2112;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v17)
    {
      v13[2](v13, v17);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v13[2](v13, v21);

    }
  }

}

- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  void *v16;
  id v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, id))a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v17 = objc_alloc_init((Class)OTControlArguments);
  v24 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v17, 1, 1, &v24));
  v19 = v24;

  if (v18)
    v20 = v19 == 0;
  else
    v20 = 0;
  if (v20)
  {
    objc_msgSend(v18, "getCurrentItemForAccessGroup:identifier:viewHint:fetchCloudValue:complete:", v12, v13, v14, v8, v15);
  }
  else
  {
    v21 = sub_10000BDF4(CFSTR("ckks"), 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v26 = CFSTR("com.apple.security.keychain");
      v27 = 2112;
      v28 = CFSTR("defaultContext");
      v29 = 2112;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v19)
    {
      v15[2](v15, 0, v19);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v15[2](v15, 0, v23);

    }
  }

}

- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v11 = objc_alloc_init((Class)OTControlArguments);
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v18));
  v13 = v18;

  if (v12)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (v14)
  {
    objc_msgSend(v12, "getCurrentItemOutOfBand:forceFetch:complete:", v8, v6, v9);
  }
  else
  {
    v15 = sub_10000BDF4(CFSTR("ckks"), 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v20 = CFSTR("com.apple.security.keychain");
      v21 = 2112;
      v22 = CFSTR("defaultContext");
      v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v13)
    {
      v9[2](v9, 0, v13);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v9[2](v9, 0, v17);

    }
  }

}

- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v11 = objc_alloc_init((Class)OTControlArguments);
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v18));
  v13 = v18;

  if (v12)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (v14)
  {
    objc_msgSend(v12, "fetchPCSIdentityOutOfBand:forceFetch:complete:", v8, v6, v9);
  }
  else
  {
    v15 = sub_10000BDF4(CFSTR("ckks"), 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v20 = CFSTR("com.apple.security.keychain");
      v21 = 2112;
      v22 = CFSTR("defaultContext");
      v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v13)
    {
      v9[2](v9, 0, v13);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v9[2](v9, 0, v17);

    }
  }

}

- (void)notifyNewTLKsInKeychain
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10000BDF4(CFSTR("ckksbackup"), 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "New TLKs have arrived", v5, 2u);
  }

  -[CKKSViewManager syncBackupAndNotifyAboutSync](self, "syncBackupAndNotifyAboutSync");
}

- (void)syncBackupAndNotifyAboutSync
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = sub_1002025E0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "performTransaction:", &stru_1002DE470);
  }
  else
  {
    v5 = sub_10000BDF4(CFSTR("ckks"), 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to get account object", v7, 2u);
    }

  }
}

- (id)currentTLKsFilteredByPolicy:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  BOOL v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  const char *v41;
  id v42;
  id v43;
  id v45;
  id v46;
  id *v47;
  void *v48;
  id obj;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const __CFString *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  id v62;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v8 = objc_alloc_init((Class)OTControlArguments);
  v55 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v8, 1, 1, &v55));
  v10 = v55;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (!v11)
  {
    v12 = sub_10000BDF4(CFSTR("ckks"), 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v58 = CFSTR("com.apple.security.keychain");
      v59 = 2112;
      v60 = CFSTR("defaultContext");
      v61 = 2112;
      v62 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (a4)
    {
      if (v10)
        v14 = objc_retainAutorelease(v10);
      else
        v14 = (id)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v46 = 0;
      *a4 = v14;
    }
    else
    {
      v46 = 0;
    }
    goto LABEL_47;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "findKeySets:", 0));
  v16 = objc_msgSend(v15, "timeout:", 10000000000);
  objc_msgSend(v15, "waitUntilFinished");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));

  if (!v17)
  {
    v47 = a4;
    v45 = v10;
    v48 = v9;
    v46 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "intendedZoneIDs"));
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (!v21)
      goto LABEL_43;
    v22 = v21;
    v23 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        if (v5)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "syncingPolicy"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "viewsToPiggybackTLKs"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneName"));
          v29 = objc_msgSend(v27, "containsObject:", v28);

          if (!v29)
            continue;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keysets"));
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v25));

        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tlk](v31, "tlk"));

          if (v32)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tlk](v31, "tlk"));
            v50 = 0;
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ensureKeyLoadedForContextID:error:", &stru_1002EE888, &v50));
            v35 = v50;

            if (v34)
              v36 = v35 == 0;
            else
              v36 = 0;
            if (v36)
            {
              v43 = objc_msgSend(v34, "copy");
              objc_msgSend(v46, "addObject:", v43);

            }
            else
            {
              v37 = sub_10000BDF4(CFSTR("ckks"), 0);
              v38 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v58 = (const __CFString *)v35;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error loading key: %@", buf, 0xCu);
              }

              if (v47)
                *v47 = objc_retainAutorelease(v35);
            }

            goto LABEL_40;
          }
          v42 = sub_10000BDF4(CFSTR("ckks"), 0);
          v35 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v31;
            v40 = v35;
            v41 = "Do not have TLK: %@";
LABEL_37:
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
          }
        }
        else
        {
          v39 = sub_10000BDF4(CFSTR("ckks"), 0);
          v35 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v58 = 0;
            v40 = v35;
            v41 = "Do not have keyset: %@";
            goto LABEL_37;
          }
        }
LABEL_40:

        continue;
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (!v22)
      {
LABEL_43:

        v9 = v48;
        v10 = v45;
        goto LABEL_46;
      }
    }
  }
  v18 = sub_10000BDF4(CFSTR("ckks"), 0);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
    *(_DWORD *)buf = 138412290;
    v58 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error getting keyset: %@", buf, 0xCu);

  }
  v46 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
LABEL_46:

LABEL_47:
  return v46;
}

- (void)performanceCounters:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, &__NSDictionary0__struct);
}

- (void)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v21 = 0;
  v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v21);
  v9 = (__CFString *)v21;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v11 = objc_alloc_init((Class)OTControlArguments);
    v20 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v20));
    v13 = v20;

    if (!v12 || v13)
    {
      v17 = sub_10000BDF4(CFSTR("ckks"), 0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v23 = CFSTR("com.apple.security.keychain");
        v24 = 2112;
        v25 = CFSTR("defaultContext");
        v26 = 2112;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
LABEL_17:

        goto LABEL_18;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v7[2](v7, v14);
    }
    else
    {
      if (v6)
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
      else
        v14 = 0;
      v19 = objc_msgSend(v12, "rpcResetLocal:reply:", v14, v7);
    }

    goto LABEL_17;
  }
  v15 = sub_10000EF14("ckks");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a resetLocal RPC: %@", buf, 0xCu);
  }

  v7[2](v7, v9);
LABEL_18:

}

- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, id);
  unsigned __int8 v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;

  v7 = a3;
  v8 = (void (**)(id, id))a5;
  v22 = 0;
  v9 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v22);
  v10 = (__CFString *)v22;
  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v12 = objc_alloc_init((Class)OTControlArguments);
    v21 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v12, 1, 1, &v21));
    v14 = v21;

    if (!v13 || v14)
    {
      v18 = sub_10000BDF4(CFSTR("ckks"), 0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v24 = CFSTR("com.apple.security.keychain");
        v25 = 2112;
        v26 = CFSTR("defaultContext");
        v27 = 2112;
        v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v14)
      {
        v8[2](v8, v14);
LABEL_17:

        goto LABEL_18;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v8[2](v8, v15);
    }
    else
    {
      if (v7)
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      else
        v15 = 0;
      v20 = objc_msgSend(v13, "rpcResetCloudKit:reply:", v15, v8);
    }

    goto LABEL_17;
  }
  v16 = sub_10000EF14("ckks");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a resetCloudKit RPC: %@", buf, 0xCu);
  }

  v8[2](v8, v10);
LABEL_18:

}

- (void)rpcResync:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  __CFString *v9;
  void *v10;
  id v11;
  __CFString *v12;
  id v13;
  CKKSResultOperation *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  const void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(id, id);
  id v28;
  id location;
  id v30;
  id v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  id v37;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v31 = 0;
  v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v31);
  v9 = (__CFString *)v31;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v11 = objc_alloc_init((Class)OTControlArguments);
    v30 = 0;
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v30));
    v13 = v30;

    if (!v12 || v13)
    {
      v23 = sub_10000BDF4(CFSTR("ckks"), 0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v33 = CFSTR("com.apple.security.keychain");
        v34 = 2112;
        v35 = CFSTR("defaultContext");
        v36 = 2112;
        v37 = v13;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v7[2](v7, v25);

      }
    }
    else
    {
      v14 = objc_alloc_init(CKKSResultOperation);
      -[CKKSResultOperation setName:](v14, "setName:", CFSTR("rpc-resync-cloudkit"));
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v14);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10010FC84;
      v26[3] = &unk_1002EA830;
      objc_copyWeak(&v28, &location);
      v27 = v7;
      -[CKKSResultOperation setCompletionBlock:](v14, "setCompletionBlock:", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v12, "zoneName"));
      v16 = sub_10000BDF4(CFSTR("ckksresync"), v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Beginning resync (CloudKit) for %@", buf, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString resyncWithCloud](v12, "resyncWithCloud"));
      -[CKKSResultOperation addSuccessDependency:](v14, "addSuccessDependency:", v18);
      v19 = -[CKKSResultOperation timeout:](v14, "timeout:", 240000000000);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager operationQueue](self, "operationQueue"));
      objc_msgSend(v20, "addOperation:", v14);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v21 = sub_10000EF14("ckks");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting a resync RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }

}

- (void)rpcResyncLocal:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  __CFString *v9;
  void *v10;
  id v11;
  __CFString *v12;
  id v13;
  CKKSResultOperation *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  const void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(id, id);
  id v27;
  id location;
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v30 = 0;
  v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v30);
  v9 = (__CFString *)v30;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v11 = objc_alloc_init((Class)OTControlArguments);
    v29 = 0;
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v29));
    v13 = v29;

    if (!v12 || v13)
    {
      v22 = sub_10000BDF4(CFSTR("ckks"), 0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v32 = CFSTR("com.apple.security.keychain");
        v33 = 2112;
        v34 = CFSTR("defaultContext");
        v35 = 2112;
        v36 = v13;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v7[2](v7, v24);

      }
    }
    else
    {
      v14 = objc_alloc_init(CKKSResultOperation);
      -[CKKSResultOperation setName:](v14, "setName:", CFSTR("rpc-resync-local"));
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v14);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10010FB74;
      v25[3] = &unk_1002EA830;
      objc_copyWeak(&v27, &location);
      v26 = v7;
      -[CKKSResultOperation setCompletionBlock:](v14, "setCompletionBlock:", v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v12, "zoneName"));
      v16 = sub_10000BDF4(CFSTR("ckksresync"), v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Beginning resync (local) for %@", buf, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString resyncLocal](v12, "resyncLocal"));
      -[CKKSResultOperation addSuccessDependency:](v14, "addSuccessDependency:", v18);
      v19 = -[CKKSResultOperation timeout:](v14, "timeout:", 240000000000);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v20 = sub_10000EF14("ckks");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a resync-local RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }

}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD, id);
  unsigned __int8 v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  const void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;

  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, _QWORD, id))a6;
  v24 = 0;
  v12 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v24);
  v13 = (__CFString *)v24;
  if ((v12 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v15 = objc_alloc_init((Class)OTControlArguments);
    v23 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v15, 1, 1, &v23));
    v17 = v23;

    if (!v16 || v17)
    {
      v20 = sub_10000BDF4(CFSTR("ckks"), 0);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v26 = CFSTR("com.apple.security.keychain");
        v27 = 2112;
        v28 = CFSTR("defaultContext");
        v29 = 2112;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v17)
      {
        v11[2](v11, 0, v17);
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v11[2](v11, 0, v22);

      }
    }
    else
    {
      objc_msgSend(v16, "rpcStatus:fast:waitForNonTransientState:reply:", v10, v8, a5, v11);
    }

  }
  else
  {
    v18 = sub_10000EF14("ckks");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a status RPC: %@", buf, 0xCu);
    }

    v11[2](v11, 0, v13);
  }

}

- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, id);
  unsigned __int8 v12;
  __CFString *v13;
  void *v14;
  id v15;
  __CFString *v16;
  id v17;
  void *v18;
  double v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  const void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  _QWORD v38[4];
  void (**v39)(id, id);
  id v40;
  id location;
  id v42;
  id v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, id))a6;
  if ((sub_10000BD64() & 1) != 0)
  {
    v43 = 0;
    v12 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v43);
    v13 = (__CFString *)v43;
    if ((v12 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
      v15 = objc_alloc_init((Class)OTControlArguments);
      v42 = 0;
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v15, 1, 1, &v42));
      v17 = v42;

      if (!v16 || v17)
      {
        v26 = sub_10000BDF4(CFSTR("ckks"), 0);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v45 = CFSTR("com.apple.security.keychain");
          v46 = 2112;
          v47 = CFSTR("defaultContext");
          v48 = 2112;
          v49 = v17;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
        }

        if (v17)
        {
          v11[2](v11, v17);
        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
          v11[2](v11, v36);

        }
      }
      else
      {
        if (v7)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString earliestFetchTime](v16, "earliestFetchTime"));
          objc_msgSend(v18, "timeIntervalSinceNow");
          v37 = v19 > -600.0;
          if (v19 > -600.0)
          {
            v20 = sub_10000BDF4(CFSTR("ckks"), 0);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipping fetch because a recent fetch was performed", buf, 2u);
            }

          }
        }
        else
        {
          v37 = 0;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("rpc-fetch-and-process-result"), &stru_1002DE490));
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, v28);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10010FAF8;
        v38[3] = &unk_1002EA830;
        objc_copyWeak(&v40, &location);
        v39 = v11;
        objc_msgSend(v28, "setCompletionBlock:", v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v16, "zoneName"));
        v30 = sub_10000BDF4(CFSTR("ckks"), v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v16;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Beginning fetch for %@", buf, 0xCu);
        }

        if (v37)
          v32 = objc_claimAutoreleasedReturnValue(-[__CFString rpcProcessIncomingQueue:errorOnClassAFailure:](v16, "rpcProcessIncomingQueue:errorOnClassAFailure:", 0, v8));
        else
          v32 = objc_claimAutoreleasedReturnValue(-[__CFString rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:](v16, "rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:", 0, CFSTR("api"), v8));
        v33 = (void *)v32;
        objc_msgSend(v28, "addSuccessDependency:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager operationQueue](self, "operationQueue"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "timeout:", 300000000000));
        objc_msgSend(v34, "addOperation:", v35);

        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      v24 = sub_10000EF14("ckks");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v13;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Rejecting a fetch-and-process RPC: %@", buf, 0xCu);
      }

      v11[2](v11, v13);
    }
  }
  else
  {
    v22 = sub_10000BDF4(CFSTR("ckks"), 0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Skipping fetchAndProcessCKChanges due to disabled CKKS", buf, 2u);
    }

    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, CFSTR("CKKS disabled")));
    v11[2](v11, v13);
  }

}

- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  __CFString *v9;
  void *v10;
  id v11;
  __CFString *v12;
  CKKSResultOperation *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  void (**v29)(id, id);
  id v30;
  id location;
  id v32;
  id v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v33 = 0;
  v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v33);
  v9 = (__CFString *)v33;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v11 = objc_alloc_init((Class)OTControlArguments);
    v32 = 0;
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v32));
    v27 = v32;

    if (!v12 || v27)
    {
      v20 = sub_10000BDF4(CFSTR("ckks"), 0);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v35 = CFSTR("com.apple.security.keychain");
        v36 = 2112;
        v37 = CFSTR("defaultContext");
        v38 = 2112;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v27)
      {
        v7[2](v7, v27);
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v7[2](v7, v22);

      }
    }
    else
    {
      v13 = objc_alloc_init(CKKSResultOperation);
      -[CKKSResultOperation setName:](v13, "setName:", CFSTR("rpc-push"));
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v13);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10010FA80;
      v28[3] = &unk_1002EA830;
      objc_copyWeak(&v30, &location);
      v29 = v7;
      -[CKKSResultOperation setCompletionBlock:](v13, "setCompletionBlock:", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v12, "zoneName"));
      v15 = sub_10000BDF4(CFSTR("ckks-rpc"), v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning push for %@", buf, 0xCu);
      }

      if (v6)
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
      else
        v17 = 0;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("rpc-push")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString rpcProcessOutgoingQueue:operationGroup:](v12, "rpcProcessOutgoingQueue:operationGroup:", v17, v23));

      if (v6)
      -[CKKSResultOperation addSuccessDependency:](v13, "addSuccessDependency:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager operationQueue](self, "operationQueue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeout:](v13, "timeout:", 300000000000));
      objc_msgSend(v25, "addOperation:", v26);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v18 = sub_10000EF14("ckks");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a push RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }

}

- (void)rpcGetCKDeviceIDWithReply:(id)a3
{
  void (**v4)(id, void *);
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v11 = 0;
  v4 = (void (**)(id, void *))a3;
  v5 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v11);
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager accountTracker](self, "accountTracker"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckdeviceID"));
    v4[2](v4, v8);

    v4 = (void (**)(id, void *))v7;
  }
  else
  {
    v9 = sub_10000EF14("ckks");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rejecting a push RPC: %@", buf, 0xCu);
    }

    v4[2](v4, CFSTR("error"));
  }

}

- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  unsigned __int8 v11;
  id v12;
  SecEventMetric *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  SecEventMetric *v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v22 = 0;
  v11 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v22);
  v12 = v22;
  if ((v11 & 1) != 0)
  {
    if (v8)
    {
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = sub_10010FA74;
      v20 = &unk_1002DE4B8;
      v21 = -[SecEventMetric initWithEventName:]([SecEventMetric alloc], "initWithEventName:", v8);
      v13 = v21;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SecMetrics managerObject](SecMetrics, "managerObject", v17, v18, v19, v20));
      objc_msgSend(v14, "submitEvent:", v13);

      v10[2](v10, 0);
    }
    else
    {
      v13 = (SecEventMetric *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 51, CFSTR("No metric name")));
      ((void (**)(id, SecEventMetric *))v10)[2](v10, v13);
    }

  }
  else
  {
    v15 = sub_10000EF14("ckks");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a ckmetric RPC: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v10)[2](v10, v12);
  }

}

- (id)sanitizeErrorDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("securityd"));

    if (v6)
    {
      v7 = objc_msgSend(v4, "code");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v7, v8));
      v10 = CKXPCSuitableError(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    }
    else
    {
      v12 = CKXPCSuitableError(v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  unsigned __int8 v17;
  __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  const void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  void (**v32)(id, id);
  id v33;
  id v34;
  NSErrorUserInfoKey v35;
  void *v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id))a7;
  v34 = 0;
  v17 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v34);
  v18 = (__CFString *)v34;
  if ((v17 & 1) != 0)
  {
    v30 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v20 = objc_alloc_init((Class)OTControlArguments);
    v33 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v20, 1, 1, &v33));
    v22 = v33;

    if (!v21 || v22)
    {
      v25 = sub_10000BDF4(CFSTR("ckks"), 0);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v12 = v30;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v38 = CFSTR("com.apple.security.keychain");
        v39 = 2112;
        v40 = CFSTR("defaultContext");
        v41 = 2112;
        v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v22)
      {
        v16[2](v16, v22);
      }
      else
      {
        v35 = NSLocalizedDescriptionKey;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No CKKS for %@, %@"), CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
        v36 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v28));
        v16[2](v16, v29);

        v12 = v30;
      }
    }
    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10010FA2C;
      v31[3] = &unk_1002DE4E0;
      v31[4] = self;
      v32 = v16;
      v12 = v30;
      objc_msgSend(v21, "proposeTLKForExternallyManagedView:proposedTLK:wrappedOldTLK:tlkShares:reply:", v30, v13, v14, v15, v31);

    }
  }
  else
  {
    v23 = sub_10000EF14("ckks");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rejecting a proposeTLK RPC: %@", buf, 0xCu);
    }

    v16[2](v16, v18);
  }

}

- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  unsigned __int8 v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  NSErrorUserInfoKey v27;
  void *v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v26 = 0;
  v10 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v26);
  v11 = (__CFString *)v26;
  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v13 = objc_alloc_init((Class)OTControlArguments);
    v25 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v13, 1, 1, &v25));
    v15 = v25;

    if (!v14 || v15)
    {
      v18 = sub_10000BDF4(CFSTR("ckks"), 0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v30 = CFSTR("com.apple.security.keychain");
        v31 = 2112;
        v32 = CFSTR("defaultContext");
        v33 = 2112;
        v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v15)
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, v15);
      }
      else
      {
        v27 = NSLocalizedDescriptionKey;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No CKKS for %@, %@"), CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
        v28 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v21));
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, v22);

      }
    }
    else
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10010F994;
      v23[3] = &unk_1002DE508;
      v23[4] = self;
      v24 = v9;
      objc_msgSend(v14, "fetchExternallyManagedViewKeyHierarchy:forceFetch:reply:", v8, v6, v23);

    }
  }
  else
  {
    v16 = sub_10000EF14("ckks");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchSEViewHierarchy RPC: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, __CFString *))v9 + 2))(v9, 0, 0, 0, v11);
  }

}

- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id);
  unsigned __int8 v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  const void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  void (**v28)(id, id);
  id v29;
  id v30;
  NSErrorUserInfoKey v31;
  void *v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  v30 = 0;
  v14 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v30);
  v15 = (__CFString *)v30;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v17 = objc_alloc_init((Class)OTControlArguments);
    v29 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v17, 1, 1, &v29));
    v19 = v29;

    if (!v18 || v19)
    {
      v22 = sub_10000BDF4(CFSTR("ckks"), 0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v34 = CFSTR("com.apple.security.keychain");
        v35 = 2112;
        v36 = CFSTR("defaultContext");
        v37 = 2112;
        v38 = v19;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v19)
      {
        v13[2](v13, v19);
      }
      else
      {
        v31 = NSLocalizedDescriptionKey;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No CKKS for %@, %@"), CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
        v32 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v25));
        v13[2](v13, v26);

      }
    }
    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10010F94C;
      v27[3] = &unk_1002DE4E0;
      v27[4] = self;
      v28 = v13;
      objc_msgSend(v18, "modifyTLKSharesForExternallyManagedView:adding:deleting:reply:", v10, v11, v12, v27);

    }
  }
  else
  {
    v20 = sub_10000EF14("ckks");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a modifyTLKShares RPC: %@", buf, 0xCu);
    }

    v13[2](v13, v15);
  }

}

- (void)deleteSEView:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, id);
  id v23;
  id v24;
  NSErrorUserInfoKey v25;
  void *v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v24 = 0;
  v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v24);
  v9 = (__CFString *)v24;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v11 = objc_alloc_init((Class)OTControlArguments);
    v23 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v11, 1, 1, &v23));
    v13 = v23;

    if (!v12 || v13)
    {
      v16 = sub_10000BDF4(CFSTR("ckks"), 0);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v28 = CFSTR("com.apple.security.keychain");
        v29 = 2112;
        v30 = CFSTR("defaultContext");
        v31 = 2112;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        v25 = NSLocalizedDescriptionKey;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No CKKS for %@, %@"), CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
        v26 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 11, v19));
        v7[2](v7, v20);

      }
    }
    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10010F904;
      v21[3] = &unk_1002DE4E0;
      v21[4] = self;
      v22 = v7;
      objc_msgSend(v12, "resetExternallyManagedCloudKitView:reply:", v6, v21);

    }
  }
  else
  {
    v14 = sub_10000EF14("ckks");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a deleteSEView RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }

}

- (void)toggleHavoc:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;

  v4 = (void (**)(id, _QWORD, id))a3;
  v17 = 0;
  v5 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v17);
  v6 = (__CFString *)v17;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v8 = objc_alloc_init((Class)OTControlArguments);
    v16 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v8, 1, 1, &v16));
    v10 = v16;

    if (!v9 || v10)
    {
      v13 = sub_10000BDF4(CFSTR("ckks"), 0);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v19 = CFSTR("com.apple.security.keychain");
        v20 = 2112;
        v21 = CFSTR("defaultContext");
        v22 = 2112;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v10)
      {
        v4[2](v4, 0, v10);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v4[2](v4, 0, v15);

      }
    }
    else
    {
      objc_msgSend(v9, "toggleHavoc:", v4);
    }

  }
  else
  {
    v11 = sub_10000EF14("ckks");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a toggleHavoc RPC: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v6);
  }

}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v9 = objc_alloc_init((Class)OTControlArguments);
  v16 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ckksForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v9, 1, 1, &v16));
  v11 = v16;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (v12)
  {
    objc_msgSend(v10, "pcsMirrorKeysForServices:reply:", v6, v7);
  }
  else
  {
    v13 = sub_10000BDF4(CFSTR("ckks"), 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v18 = CFSTR("com.apple.security.keychain");
      v19 = 2112;
      v20 = CFSTR("defaultContext");
      v21 = 2112;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v11)
    {
      v7[2](v7, 0, v11);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v7[2](v7, 0, v15);

    }
  }

}

- (void)xpc24HrNotification
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = sub_10000BDF4(CFSTR("ckks"), 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received a 24hr notification from XPC", buf, 2u);
  }

  if (!-[CKKSViewManager waitForTrustReady](self, "waitForTrustReady"))
  {
    v5 = sub_10000BDF4(CFSTR("ckks"), 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trust not ready, still going ahead", v10, 2u);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager ckksAccountSyncForContainer:contextID:](self, "ckksAccountSyncForContainer:contextID:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("periodic-device-state-update")));
  v9 = objc_msgSend(v7, "updateDeviceState:waitForKeyHierarchyInitialization:ckoperationGroup:", 1, 30000000000, v8);
  objc_msgSend(v7, "xpc24HrNotification");

}

- (void)haltAll
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  objc_msgSend(v2, "haltAll");

}

- (void)dropAllActors
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  objc_msgSend(v2, "dropAllActors");

}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CKKSAccountStateTracker)accountTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReachabilityTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersonaAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CKKSCondition)completedSecCKKSInitialize
{
  return (CKKSCondition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletedSecCKKSInitialize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setGlobalRateLimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OTSOSAdapter)sosPeerAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSosPeerAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountsAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)viewAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setViewAllowList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudKitClassDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)pendingSyncCallbacks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPendingSyncCallbacks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_pendingSyncCallbacks, 0);
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_viewAllowList, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_sosPeerAdapter, 0);
  objc_storeStrong((id *)&self->_globalRateLimiter, 0);
  objc_storeStrong((id *)&self->_completedSecCKKSInitialize, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountTracker, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

+ (void)callSyncCallbackWithErrorNoAccount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("securityd"), -67729, CFSTR("No iCloud account available; item is not expected to sync")));
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

@end
