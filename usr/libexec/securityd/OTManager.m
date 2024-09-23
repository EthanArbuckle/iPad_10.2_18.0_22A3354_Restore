@implementation OTManager

- (NSMutableDictionary)contexts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

+ (id)manager
{
  void *v3;
  const void *v4;
  NSObject *v5;
  uint8_t v7[16];

  if (objc_opt_class(CKDatabase))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "resetManager:to:", 0, 0));
  }
  else
  {
    v4 = sub_10000EF14("SecError");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Octagon: CloudKit.framework appears to not be linked. Cannot create an Octagon manager (on pain of crash).", v7, 2u);
    }

    v3 = 0;
  }
  return v3;
}

+ (id)resetManager:(BOOL)a3 to:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  OTManager *v11;
  void *v12;
  id v13;

  v4 = a3;
  v6 = a4;
  if (v6 || ((v7 = (void *)qword_100340F00) != 0 ? (v8 = !v4) : (v8 = 0), !v8))
  {
    v9 = objc_opt_class(a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_sync_enter(v10);
    if (v6)
    {
      v11 = (OTManager *)v6;
    }
    else
    {
      v12 = (void *)qword_100340F00;
      if (v4)
      {
        v11 = 0;
        goto LABEL_11;
      }
      if (qword_100340F00)
        goto LABEL_12;
      v11 = objc_alloc_init(OTManager);
    }
    v12 = (void *)qword_100340F00;
LABEL_11:
    qword_100340F00 = (uint64_t)v11;

LABEL_12:
    objc_sync_exit(v10);

    v7 = (void *)qword_100340F00;
  }
  v13 = v7;

  return v13;
}

- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4 possibleAccount:(id)a5
{
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForContainerName:contextID:possibleAccount:](self, "contextForContainerName:contextID:possibleAccount:", a3, a4, a5));
  if (!v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No context for container/contextID", v10, 2u);
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ckks"));

  return v8;
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager sosAdapter](self, "sosAdapter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager authKitAdapter](self, "authKitAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tapToRadarAdapter](self, "tapToRadarAdapter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager lockStateTracker](self, "lockStateTracker"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:](self, "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:", v10, v9, v8, 1, v19, v18, v11, v12, v13, v14, v15));

  return v16;
}

- (OTTooManyPeersAdapter)tooManyPeersAdapter
{
  return (OTTooManyPeersAdapter *)objc_getProperty(self, a2, 152, 1);
}

- (OTTapToRadarAdapter)tapToRadarAdapter
{
  return (OTTapToRadarAdapter *)objc_getProperty(self, a2, 160, 1);
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 24, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (OTDeviceInformationAdapter)deviceInformationAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 40, 1);
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5 createIfMissing:(BOOL)a6 sosAdapter:(id)a7 accountsAdapter:(id)a8 authKitAdapter:(id)a9 tooManyPeersAdapter:(id)a10 tapToRadarAdapter:(id)a11 lockStateTracker:(id)a12 deviceInformationAdapter:(id)a13
{
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  NSObject *queue;
  _QWORD block[4];
  __CFString *v44;
  id v45;
  OTManager *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  BOOL v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v18 = (__CFString *)a3;
  v41 = a4;
  v40 = a5;
  v39 = a7;
  v19 = a8;
  v35 = a9;
  v33 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_100068D10;
  v61 = sub_100068D20;
  v62 = 0;
  if (!v18)
  {
    v18 = CFSTR("com.apple.security.keychain");
    v23 = CFSTR("com.apple.security.keychain");
  }
  queue = objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000071F4;
  block[3] = &unk_1002DC0C8;
  v44 = v18;
  v45 = v41;
  v56 = a6;
  v46 = self;
  v47 = v40;
  v48 = v19;
  v49 = v39;
  v50 = v35;
  v51 = v33;
  v52 = v20;
  v53 = v21;
  v54 = v22;
  v55 = &v57;
  v38 = v22;
  v32 = v21;
  v31 = v20;
  v34 = v33;
  v36 = v35;
  v24 = v39;
  v25 = v19;
  v26 = v40;
  v27 = v41;
  v28 = v18;
  dispatch_sync(queue, block);

  v29 = (id)v58[5];
  _Block_object_dispose(&v57, 8);

  return v29;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 32, 1);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 144, 1);
}

- (CKKSViewManager)viewManager
{
  return (CKKSViewManager *)objc_getProperty(self, a2, 80, 1);
}

- (OTManager)init
{
  OTSOSMissingAdapter *v2;
  OTAuthKitActualAdapter *v3;
  OTPersonaActualAdapter *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKKSReachabilityTracker *v9;
  void *v10;
  id v11;
  void *v13;
  OTAccountsActualAdapter *v14;
  OTDeviceInformationActualAdapter *v15;
  OTTapToRadarActualAdapter *v16;
  OTTooManyPeersActualAdapter *v17;
  OTManager *v19;
  OTSOSMissingAdapter *v20;

  if (qword_1003412B8 != -1)
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
  if (byte_10033FE20)
    v2 = -[OTSOSActualAdapter initAsEssential:]([OTSOSActualAdapter alloc], "initAsEssential:", 0);
  else
    v2 = objc_alloc_init(OTSOSMissingAdapter);
  v20 = v2;
  v14 = objc_alloc_init(OTAccountsActualAdapter);
  v3 = objc_alloc_init(OTAuthKitActualAdapter);
  v17 = objc_alloc_init(OTTooManyPeersActualAdapter);
  v16 = objc_alloc_init(OTTapToRadarActualAdapter);
  v15 = objc_alloc_init(OTDeviceInformationActualAdapter);
  v4 = objc_alloc_init(OTPersonaActualAdapter);
  v5 = objc_opt_class(APSConnection);
  v6 = objc_opt_class(EscrowRequestServer);
  v7 = objc_opt_class(CKKSNotifyPostNotifier);
  v8 = objc_opt_class(CKKSAnalytics);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](CKKSLockStateTracker, "globalTracker"));
  v9 = objc_alloc_init(CKKSReachabilityTracker);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCloudKitClassDependencies forLiveCloudKit](CKKSCloudKitClassDependencies, "forLiveCloudKit"));
  v11 = objc_alloc_init((Class)CDPFollowUpController);
  v19 = -[OTManager initWithSOSAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:deviceInformationAdapter:personaAdapter:apsConnectionClass:escrowRequestClass:notifierClass:loggerClass:lockStateTracker:reachabilityTracker:cloudKitClassDependencies:cuttlefishXPCConnection:cdpd:](self, "initWithSOSAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:deviceInformationAdapter:personaAdapter:apsConnectionClass:escrowRequestClass:notifierClass:loggerClass:lockStateTracker:reachabilityTracker:cloudKitClassDependencies:cuttlefishXPCConnection:cdpd:", v20, v14, v3, v17, v16, v15, v4, v5, v6, v7, v8, v13, v9, v10, 0,
          v11);

  return v19;
}

- (OTManager)initWithSOSAdapter:(id)a3 accountsAdapter:(id)a4 authKitAdapter:(id)a5 tooManyPeersAdapter:(id)a6 tapToRadarAdapter:(id)a7 deviceInformationAdapter:(id)a8 personaAdapter:(id)a9 apsConnectionClass:(Class)a10 escrowRequestClass:(Class)a11 notifierClass:(Class)a12 loggerClass:(Class)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 cloudKitClassDependencies:(id)a16 cuttlefishXPCConnection:(id)a17 cdpd:(id)a18
{
  id v23;
  OTManager *v24;
  OTManager *v25;
  uint64_t v26;
  CKContainer *cloudKitContainer;
  CKKSAccountStateTracker *v28;
  CKKSAccountStateTracker *accountStateTracker;
  uint64_t v30;
  NSMutableDictionary *contexts;
  dispatch_queue_t v32;
  OS_dispatch_queue *queue;
  CKKSViewManager *v34;
  CKKSViewManager *viewManager;
  CKKSNearFutureScheduler *v36;
  CKKSNearFutureScheduler *v37;
  CKKSNearFutureScheduler *savedTLKNotifier;
  id v39;
  const void *v40;
  NSObject *v41;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  uint8_t buf[8];
  _QWORD v58[4];
  id v59;
  id location;
  objc_super v61;

  v56 = a3;
  v55 = a4;
  v44 = a5;
  v52 = a5;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v54 = a14;
  v47 = a15;
  v23 = a16;
  v46 = a17;
  v45 = a18;
  v61.receiver = self;
  v61.super_class = (Class)OTManager;
  v24 = -[OTManager init](&v61, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_sosAdapter, a3);
    objc_storeStrong((id *)&v25->_accountsAdapter, a4);
    objc_storeStrong((id *)&v25->_authKitAdapter, v44);
    objc_storeStrong((id *)&v25->_tooManyPeersAdapter, a6);
    objc_storeStrong((id *)&v25->_tapToRadarAdapter, a7);
    objc_storeStrong((id *)&v25->_deviceInformationAdapter, a8);
    objc_storeStrong((id *)&v25->_personaAdapter, a9);
    objc_storeStrong((id *)&v25->_loggerClass, a13);
    objc_storeStrong((id *)&v25->_lockStateTracker, a14);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a15);
    objc_storeStrong((id *)&v25->_cuttlefishXPCConnection, a17);
    v26 = objc_claimAutoreleasedReturnValue(+[OTManager makeCKContainer:](OTManager, "makeCKContainer:", CFSTR("com.apple.security.keychain")));
    cloudKitContainer = v25->_cloudKitContainer;
    v25->_cloudKitContainer = (CKContainer *)v26;

    v28 = -[CKKSAccountStateTracker init:nsnotificationCenterClass:]([CKKSAccountStateTracker alloc], "init:nsnotificationCenterClass:", v25->_cloudKitContainer, objc_msgSend(v23, "nsnotificationCenterClass"));
    accountStateTracker = v25->_accountStateTracker;
    v25->_accountStateTracker = v28;

    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, a16);
    v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    contexts = v25->_contexts;
    v25->_contexts = (NSMutableDictionary *)v30;

    v32 = dispatch_queue_create("otmanager", 0);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v32;

    objc_storeStrong((id *)&v25->_apsConnectionClass, a10);
    objc_storeStrong((id *)&v25->_escrowRequestClass, a11);
    objc_storeStrong((id *)&v25->_notifierClass, a12);
    objc_storeStrong((id *)&v25->_cdpd, a18);
    v34 = -[CKKSViewManager initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKitClassDependencies:accountsAdapter:]([CKKSViewManager alloc], "initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKitClassDependencies:accountsAdapter:", v25->_cloudKitContainer, v56, v25->_accountStateTracker, v54, v25->_reachabilityTracker, v25->_personaAdapter, v23, v55);
    viewManager = v25->_viewManager;
    v25->_viewManager = v34;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v25);
    v36 = [CKKSNearFutureScheduler alloc];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100069148;
    v58[3] = &unk_1002EB598;
    objc_copyWeak(&v59, &location);
    v37 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v36, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("newtlks"), 5000000000, 1, 0, v58);
    savedTLKNotifier = v25->_savedTLKNotifier;
    v25->_savedTLKNotifier = v37;

    v39 = -[OTManager contextForContainerName:contextID:](v25, "contextForContainerName:contextID:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext"));
    v40 = sub_10000EF14("octagon");
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "otmanager init", buf, 2u);
    }

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
  }

  return v25;
}

- (OTManager)initWithSOSAdapter:(id)a3 lockStateTracker:(id)a4 personaAdapter:(id)a5 cloudKitClassDependencies:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTManager *v15;
  OTManager *v16;
  uint64_t v17;
  NSMutableDictionary *contexts;
  uint64_t v19;
  CKContainer *cloudKitContainer;
  CKKSAccountStateTracker *v21;
  CKKSAccountStateTracker *accountStateTracker;
  CKKSReachabilityTracker *v23;
  CKKSReachabilityTracker *reachabilityTracker;
  uint64_t v25;
  Class notifierClass;
  CKKSViewManager *v27;
  CKContainer *v28;
  CKKSReachabilityTracker *v29;
  CKKSAccountStateTracker *v30;
  OTPersonaAdapter *personaAdapter;
  void *v32;
  CKKSViewManager *v33;
  CKKSViewManager *viewManager;
  dispatch_queue_t v35;
  OS_dispatch_queue *queue;
  CKKSNearFutureScheduler *v37;
  CKKSNearFutureScheduler *v38;
  CKKSNearFutureScheduler *savedTLKNotifier;
  id v41;
  _QWORD v42[4];
  id v43;
  id location;
  objc_super v45;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v45.receiver = self;
  v45.super_class = (Class)OTManager;
  v15 = -[OTManager init](&v45, "init");
  v16 = v15;
  if (v15)
  {
    v41 = v13;
    objc_storeStrong((id *)&v15->_sosAdapter, a3);
    objc_storeStrong((id *)&v16->_lockStateTracker, a4);
    objc_storeStrong((id *)&v16->_personaAdapter, a5);
    objc_storeStrong((id *)&v16->_cloudKitClassDependencies, a6);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    contexts = v16->_contexts;
    v16->_contexts = (NSMutableDictionary *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[OTManager makeCKContainer:](OTManager, "makeCKContainer:", CFSTR("com.apple.security.keychain")));
    cloudKitContainer = v16->_cloudKitContainer;
    v16->_cloudKitContainer = (CKContainer *)v19;

    v21 = -[CKKSAccountStateTracker init:nsnotificationCenterClass:]([CKKSAccountStateTracker alloc], "init:nsnotificationCenterClass:", v16->_cloudKitContainer, objc_msgSend(v14, "nsnotificationCenterClass"));
    accountStateTracker = v16->_accountStateTracker;
    v16->_accountStateTracker = v21;

    v23 = objc_alloc_init(CKKSReachabilityTracker);
    reachabilityTracker = v16->_reachabilityTracker;
    v16->_reachabilityTracker = v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "notifierClass"));
    notifierClass = v16->_notifierClass;
    v16->_notifierClass = (Class)v25;

    v27 = [CKKSViewManager alloc];
    v29 = v16->_reachabilityTracker;
    v28 = v16->_cloudKitContainer;
    v30 = v16->_accountStateTracker;
    personaAdapter = v16->_personaAdapter;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](v16, "accountsAdapter"));
    v33 = -[CKKSViewManager initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKitClassDependencies:accountsAdapter:](v27, "initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKitClassDependencies:accountsAdapter:", v28, v11, v30, v12, v29, personaAdapter, v14, v32);
    viewManager = v16->_viewManager;
    v16->_viewManager = v33;

    v35 = dispatch_queue_create("otmanager", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v35;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    v37 = [CKKSNearFutureScheduler alloc];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100069104;
    v42[3] = &unk_1002EB598;
    objc_copyWeak(&v43, &location);
    v38 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v37, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("newtlks"), 5000000000, 1, 0, v42);
    savedTLKNotifier = v16->_savedTLKNotifier;
    v16->_savedTLKNotifier = v38;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    v13 = v41;
  }

  return v16;
}

- (void)initializeOctagon
{
  const void *v3;
  NSObject *v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  id v17;
  const void *v18;
  NSObject *v19;
  _BOOL4 v20;
  BOOL v21;
  void *v22;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing Octagon...", buf, 2u);
  }

  v5 = sub_10000EF14("octagon");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting default state machine...", buf, 2u);
  }

  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inflateAllTPSpecificUsers:octagonContextID:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v26;
      *(_QWORD *)&v11 = 138412290;
      v23 = v11;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v24 = 0;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:](self, "contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:", v15, 1, 1, &v24, v23));
          v17 = v24;
          v18 = sub_10000EF14("octagon");
          v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v16)
            v21 = v17 == 0;
          else
            v21 = 0;
          if (v21)
          {
            if (v20)
            {
              *(_DWORD *)buf = v23;
              v30 = v15;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "kicking off state machine for active account: %@", buf, 0xCu);
            }

            objc_msgSend(v16, "startOctagonStateMachine");
          }
          else
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412546;
              v30 = v15;
              v31 = 2112;
              v32 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "failed to get context for active account: %@, error:%@", buf, 0x16u);
            }

          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v12);
    }

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForContainerName:contextID:](self, "contextForContainerName:contextID:", CFSTR("com.apple.security.keychain"), CFSTR("defaultContext")));
  objc_msgSend(v22, "startOctagonStateMachine");
  -[OTManager registerForCircleChangedNotifications](self, "registerForCircleChangedNotifications");

}

- (BOOL)waitForReady:(id)a3 wait:(int64_t)a4
{
  void *v5;
  id v6;
  unsigned __int8 v7;
  const void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;

  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:createIfMissing:error:](self, "contextForClientRPC:createIfMissing:error:", a3, 0, &v11));
  v6 = v11;
  if (v5)
  {
    v7 = objc_msgSend(v5, "waitForReady:", a4);
  }
  else
  {
    v8 = sub_10000EF14("octagon");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot wait for ready: %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (void)moveToCheckTrustedStateForArguments:(id)a3
{
  void *v3;
  id v4;
  const void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;

  v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:createIfMissing:error:](self, "contextForClientRPC:createIfMissing:error:", a3, 0, &v7));
  v4 = v7;
  if (v4)
  {
    v5 = sub_10000EF14("octagon");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cannot move to check trusted state: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v3, "startOctagonStateMachine");
  objc_msgSend(v3, "moveToCheckTrustedState");

}

- (void)registerForCircleChangedNotifications
{
  const char *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD handler[4];
  id v7;
  int out_token;
  id location;

  if (-[OTSOSActualAdapter sosEnabled]_0())
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    out_token = -1;
    v3 = (const char *)kSOSCCCircleChangedNotification;
    global_queue = dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100069064;
    handler[3] = &unk_1002EAD30;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch(v3, &out_token, v5, handler);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)ensureRampsInitialized
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OTRamp *v13;
  void *v14;
  OTRamp *v15;
  void *v16;
  OTRamp *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "container"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "privateCloudDatabase"));
  v5 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("metadata_zone"), CKCurrentUserDefaultName);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountTracker"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reachabilityTracker"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lockStateTracker"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbmidRamp](self, "gbmidRamp"));
  if (!v12)
  {
    v13 = -[OTRamp initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:]([OTRamp alloc], "initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:", CFSTR("metadata_rampstate_ghostBustMID"), CFSTR("ghostBustMID"), v18, v4, v5, v7, v11, v9, objc_opt_class(CKFetchRecordsOperation));
    -[OTManager setGbmidRamp:](self, "setGbmidRamp:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbserialRamp](self, "gbserialRamp"));

  if (!v14)
  {
    v15 = -[OTRamp initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:]([OTRamp alloc], "initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:", CFSTR("metadata_rampstate_ghostBustSerial"), CFSTR("ghostBustSerial"), v18, v4, v5, v7, v11, v9, objc_opt_class(CKFetchRecordsOperation));
    -[OTManager setGbserialRamp:](self, "setGbserialRamp:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbAgeRamp](self, "gbAgeRamp"));

  if (!v16)
  {
    v17 = -[OTRamp initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:]([OTRamp alloc], "initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:", CFSTR("metadata_rampstate_ghostBustAge"), CFSTR("ghostBustAge"), v18, v4, v5, v7, v11, v9, objc_opt_class(CKFetchRecordsOperation));
    -[OTManager setGbAgeRamp:](self, "setGbAgeRamp:", v17);

  }
}

- (void)appleAccountSignedIn:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  const void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v21 = 0;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v21));
  v9 = v21;
  v10 = v9;
  if (!v8 || v9)
  {
    v18 = sub_10000EF14("octagon");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a signin RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityAccountAvailable")));

    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "signing in %@ for altDSID: %@", buf, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));
    v20 = 0;
    objc_msgSend(v8, "accountAvailable:error:", v16, &v20);
    v17 = v20;

    objc_msgSend(v12, "stopWithEvent:result:", CFSTR("OctagonEventSignIn"), v17);
    v7[2](v7, v17);

    v7 = (void (**)(id, void *))v12;
  }

}

- (void)appleAccountSignedOut:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  const void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  const void *v27;
  NSObject *v28;
  void *v29;
  void (**v30)(id, _QWORD);
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[6];
  uint8_t v38[4];
  void *v39;
  uint8_t v40[128];
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v5 = a3;
  v30 = (void (**)(id, _QWORD))a4;
  v32 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "altDSID"));

  if (v6)
  {
    v7 = sub_10000EF14("octagon");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "signing out of octagon trust: %@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x3032000000;
    v43 = sub_100068D10;
    v44 = sub_100068D20;
    v45 = 0;
    v9 = objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069010;
    block[3] = &unk_1002EB140;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync(v9, block);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "altDSID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeAccount"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "altDSID"));
          v19 = objc_msgSend(v16, "isEqualToString:", v18);

          if (v19)
          {
            v20 = sub_10000EF14("octagon");
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v38 = 138412290;
              v39 = v15;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "signing out of octagon trust for context: %@", v38, 0xCu);
            }

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityAccountNotAvailable")));

            objc_msgSend(v15, "accountNoLongerAvailable");
            objc_msgSend(v23, "stopWithEvent:result:", CFSTR("OctagonEventSignOut"), 0);

            v12 = 1;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v11);

      if ((v12 & 1) != 0)
      {
        v30[2](v30, 0);
LABEL_24:
        _Block_object_dispose(&buf, 8);

        goto LABEL_25;
      }
    }
    else
    {

    }
    v27 = sub_10000EF14("octagon");
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to find a context to sign out.", v38, 2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 31, CFSTR("Couldn't find a context with this altDSID")));
    ((void (**)(id, void *))v30)[2](v30, v29);

    goto LABEL_24;
  }
  v24 = sub_10000EF14("octagon-account");
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "rejecting a signout RPC due to missing altDSID: %@", (uint8_t *)&buf, 0xCu);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 29, CFSTR("Must provide an altDSID to sign out")));
  ((void (**)(id, void *))v30)[2](v30, v26);

LABEL_25:
}

- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v15 = 0;
  v7 = (void (**)(id, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  v9 = v15;
  v10 = sub_10000EF14("octagon");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a IDMS trust level change RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v9);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received a notification of IDMS trust level change in %@", buf, 0xCu);
    }

    v14 = 0;
    objc_msgSend(v8, "idmsTrustLevelChanged:", &v14);
    v13 = v14;
    v7[2](v7, v13);

    v7 = (void (**)(id, id))v13;
  }

}

- (void)setCuttlefishXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_cuttlefishXPCConnection, a3);
}

- (NSXPCProxyCreating)cuttlefishXPCConnection
{
  NSXPCProxyCreating *cuttlefishXPCConnection;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *v10;
  NSSet *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSXPCProxyCreating *v18;
  id v20;
  OTManager *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];

  cuttlefishXPCConnection = self->_cuttlefishXPCConnection;
  if (!cuttlefishXPCConnection)
  {
    v21 = self;
    v20 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.TrustedPeersHelper"));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___TrustedPeersHelperProtocol));
    if (qword_1003414C8 != -1)
      dispatch_once(&qword_1003414C8, &stru_1002EABF0);
    v41[0] = objc_opt_class(NSArray);
    v41[1] = objc_opt_class(CKKSKeychainBackedKeySet);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

    v40[0] = objc_opt_class(NSArray);
    v40[1] = objc_opt_class(CKKSTLKShare);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

    v39[0] = objc_opt_class(NSArray);
    v39[1] = objc_opt_class(CKRecord);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

    v9 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(TrustedPeersHelperPeerState));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(TrustedPeersHelperCustodianRecoveryKey));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v11 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(TrustedPeersHelperHealthCheckResult));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v38[0] = objc_opt_class(NSArray);
    v38[1] = objc_opt_class(TrustedPeersHelperPeer);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

    v37[0] = objc_opt_class(NSArray);
    v37[1] = objc_opt_class(NSDictionary);
    v37[2] = objc_opt_class(NSString);
    v37[3] = objc_opt_class(TPPBPeerStableInfoSetting);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 4));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

    v36[0] = objc_opt_class(NSArray);
    v36[1] = objc_opt_class(CuttlefishPCSServiceIdentifier);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    v35[0] = objc_opt_class(NSArray);
    v35[1] = objc_opt_class(CuttlefishPCSIdentity);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

    v34[0] = objc_opt_class(NSArray);
    v34[1] = objc_opt_class(CuttlefishCurrentItemSpecifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));

    v33[0] = objc_opt_class(NSArray);
    v33[1] = objc_opt_class(CuttlefishCurrentItem);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v17));

    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "dumpWithSpecificUser:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "departByDistrustingSelfWithSpecificUser:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "distrustPeerIDsWithSpecificUser:peerIDs:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "dropPeerIDsWithSpecificUser:peerIDs:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "trustStatusWithSpecificUser:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "localResetWithSpecificUser:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "setAllowedMachineIDsWithSpecificUser:allowedMachineIDs:userInitiatedRemovals:evictedRemovals:unknownReasonRemovals:honorIDMSListChanges:version:flowID:deviceSessionID:canSendMetrics:altDSID:trustedDeviceHash:deletedDeviceHash:trustedDevicesUpdateTimestamp:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "markTrustedDeviceListFetchFailed:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchAllowedMachineIDsWithSpecificUser:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchEgoEpochWithSpecificUser:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", 6, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 3, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "preflightVouchWithBottleWithSpecificUser:bottleID:reply:", 3, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "preflightVouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:", 3, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "preflightPreapprovedJoinWithSpecificUser:preapprovedKeys:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 3, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "setPreapprovedKeysWithSpecificUser:preapprovedKeys:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchViableBottlesWithSpecificUser:source:flowID:deviceSessionID:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchViableEscrowRecordsWithSpecificUser:source:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchEscrowContentsWithSpecificUser:reply:", 3, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchPolicyDocumentsWithSpecificUser:versions:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "removeCustodianRecoveryKeyWithSpecificUser:uuid:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "getSupportAppInfoWithSpecificUser:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "resetAccountCDPContentsWithSpecificUser:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "removeEscrowCacheWithSpecificUser:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "fetchAccountSettingsWithSpecificUser:forceFetch:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "isRecoveryKeySet:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", qword_1003414C0, "testSemaphoreWithSpecificUser:arg:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v28, "fetchAccountSettingsWithSpecificUser:forceFetch:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:", 3, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:", 4, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "vouchWithSpecificUser:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:ckksKeys:flowID:deviceSessionID:canSendMetrics:reply:", 6, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:", 4, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:", 3, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", 3, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:", 3, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:", 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithRerollWithSpecificUser:oldPeerID:tlkShares:reply:", 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:crk:reply:", 7, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:", 2, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:", 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, "preflightVouchWithCustodianRecoveryKeyWithSpecificUser:crk:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, "vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, "findCustodianRecoveryKeyWithSpecificUser:uuid:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v27, "requestHealthCheckWithSpecificUser:requiresEscrowCheck:repair:knownFederations:flowID:deviceSessionID:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v29, "updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v29, "fetchTrustStateWithSpecificUser:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v26, "fetchTrustStateWithSpecificUser:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v31, "updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, "updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:", 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v23, "fetchCurrentItemWithSpecificUser:items:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v22, "fetchCurrentItemWithSpecificUser:items:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "fetchCurrentItemWithSpecificUser:items:reply:", 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v25, "fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:", 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, "fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:", 0, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, "fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:", 1, 1);

    objc_msgSend(v20, "setRemoteObjectInterface:", v4);
    objc_msgSend(v20, "resume");
    v18 = v21->_cuttlefishXPCConnection;
    v21->_cuttlefishXPCConnection = (NSXPCProxyCreating *)v20;

    cuttlefishXPCConnection = v21->_cuttlefishXPCConnection;
  }
  return cuttlefishXPCConnection;
}

- (void)removeContextForContainerName:(id)a3 contextID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  OTManager *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068F40;
  block[3] = &unk_1002E94C8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (id)restartOctagonContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ckks"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewAllowList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextID"));

  v21 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationDependencies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));

  -[OTManager removeContextForContainerName:contextID:](self, "removeContextForContainerName:contextID:", v6, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager sosAdapter](self, "sosAdapter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager authKitAdapter](self, "authKitAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tapToRadarAdapter](self, "tapToRadarAdapter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager lockStateTracker](self, "lockStateTracker"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:](self, "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:", v6, v19, v8, 1, v9, v10, v11, v12, v13, v14, v15));

  if (v20)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ckks"));
    objc_msgSend(v17, "setSyncingViewsAllowList:", v20);

  }
  return v16;
}

- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100068D10;
  v18 = sub_100068D20;
  v19 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068D28;
  block[3] = &unk_1002EAC48;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  dispatch_sync(v5, block);

  if (v15[5])
  {
    v7 = objc_claimAutoreleasedReturnValue(-[OTManager restartOctagonContext:](self, "restartOctagonContext:"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ckks](v7, "ckks"));
  }
  else
  {
    v9 = sub_10000BDF4(CFSTR("ckkstests"), 0);
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not find a parent OTCuttlefishContext for view: %@", buf, 0xCu);
    }
    v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)haltAll
{
  -[OTManager allContextsHalt](self, "allContextsHalt");
}

- (void)dropAllActors
{
  -[OTManager clearAllContexts](self, "clearAllContexts");
}

- (void)cancelPendingOperations
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OTManager savedTLKNotifier](self, "savedTLKNotifier"));
  objc_msgSend(v2, "cancel");

}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 sosAdapter:(id)a5 accountsAdapter:(id)a6 authKitAdapter:(id)a7 tooManyPeersAdapter:(id)a8 tapToRadarAdapter:(id)a9 lockStateTracker:(id)a10 deviceInformationAdapter:(id)a11
{
  return -[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:](self, "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:", a3, a4, 0, 1, a5, a6, a7, a8, a9, a10, a11);
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4
{
  return -[OTManager contextForContainerName:contextID:possibleAccount:](self, "contextForContainerName:contextID:possibleAccount:", a3, a4, 0);
}

- (id)contextForClientRPC:(id)a3 error:(id *)a4
{
  return -[OTManager contextForClientRPC:createIfMissing:error:](self, "contextForClientRPC:createIfMissing:error:", a3, 1, a4);
}

- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  const void *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  v10 = objc_msgSend(v9, "currentThreadIsForPrimaryiCloudAccount");

  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  v11 = byte_1003412C0;
  if (byte_1003412C0)
  {
    v12 = sub_10000EF14("SecWarning");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "octagon-account: Supporting non-primary accounts on possibly-unsupported platform", buf, 2u);
    }

    goto LABEL_8;
  }
  if ((v10 & 1) != 0)
  {
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:](self, "contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v8, v6, v11 != 0, a5));
    goto LABEL_9;
  }
  v16 = sub_10000EF14("octagon");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting client RPC for non-primary persona", v18, 2u);
  }

  v14 = 0;
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 29, CFSTR("Octagon APIs do not support non-primary users")));
LABEL_9:

  return v14;
}

- (id)contextForClientRPCWithActiveAccount:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  id v7;
  const void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  _BOOL4 v29;
  void *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;

  v29 = a4;
  v7 = a3;
  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0 || (objc_msgSend(v7, "isPrimaryAccount") & 1) == 0)
  {
    v8 = sub_10000EF14("octagon-account");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finding a context for user: %@", buf, 0xCu);
    }

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudkitContainerName"));
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "octagonContextID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager sosAdapter](self, "sosAdapter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager authKitAdapter](self, "authKitAdapter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tapToRadarAdapter](self, "tapToRadarAdapter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager lockStateTracker](self, "lockStateTracker"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  v31 = v10;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:](self, "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:", v28, v11, v10, v29, v12, v13, v14, v15, v16, v17, v18));

  if (a6 && !v19)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 31, CFSTR("Context does not exist")));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeAccount"));
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeAccount"));
    v23 = objc_msgSend(v22, "isEqual:", v31);

    if ((v23 & 1) == 0)
    {
      v24 = sub_10000EF14("octagon-account");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeAccount"));
        *(_DWORD *)buf = 138412546;
        v33 = v31;
        v34 = 2112;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Context for user(%@) is for user(%@) instead", buf, 0x16u);

      }
    }
  }

  return v19;
}

- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  const void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const void *v27;
  NSObject *v28;
  id v29;
  const void *v30;
  NSObject *v31;
  id v32;
  _BOOL4 v34;
  _BOOL4 v35;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;

  v34 = a4;
  v35 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  v9 = objc_msgSend(v8, "currentThreadIsForPrimaryiCloudAccount");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerName"));
  v14 = v7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextID"));
  v37 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "findAccountForCurrentThread:optionalAltDSID:cloudkitContainerName:octagonContextID:error:", v11, v12, v13, v15, &v37));
  v17 = v37;

  if (v16 && !v17)
  {
    if (v35 || (objc_msgSend(v16, "isPrimaryAccount") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:](self, "contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:", v16, v34, v35, a6));
      v19 = v14;
      goto LABEL_26;
    }
    v27 = sub_10000EF14("octagon-account");
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v19 = v14;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Rejecting finding a OTCuttlefishContext for non-primary account (on primary persona)", buf, 2u);
    }

    if (a6)
    {
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 29, CFSTR("Octagon APIs do not support non-primary accounts")));
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v19 = v14;
  if (!v9)
  {
LABEL_14:
    if (a6)
    {
      if (v17)
      {
        *a6 = objc_retainAutorelease(v17);
      }
      else
      {
        v29 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
        *a6 = v29;
        if (!v29)
          goto LABEL_25;
      }
      v30 = sub_10000EF14("octagon-account");
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *a6;
        *(_DWORD *)buf = 138412546;
        v39 = v19;
        v40 = 2112;
        v41 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Cannot find an account matching: %@ %@", buf, 0x16u);
      }

    }
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "altDSID"));
  if (v20
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "containerName")),
        !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.security.keychain"))))
  {

    goto LABEL_14;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contextID"));
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("defaultContext"));

  if (!v22)
    goto LABEL_14;
  v23 = sub_10000EF14("octagon-account");
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v19;
    v40 = 2112;
    v41 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Cannot find an account matching primary persona/altDSID, allowing default context return: %@ %@", buf, 0x16u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "containerName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contextID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForContainerName:contextID:](self, "contextForContainerName:contextID:", v25, v26));

LABEL_26:
  return v18;
}

- (id)ckksForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  const void *v20;
  NSObject *v21;
  const char *v22;
  const void *v23;
  int v25;
  void *v26;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentThreadPersonaUniqueString"));

  v13 = sub_10000EF14("ckkspersona");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v25 = 138412290;
    v26 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "ckksForClientRPC: thread persona is %@", (uint8_t *)&v25, 0xCu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:](self, "contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:", v10, v8, v7, a6));
  if (!v15)
  {
    if (a6)
    {
      v18 = CFSTR("Context does not exist");
      v19 = 31;
LABEL_10:
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), v19, v18));
      goto LABEL_17;
    }
    v20 = sub_10000EF14("ckkspersona");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v12;
      v22 = "ckksForClientRPC: no OTCuttlefishContext found for persona %@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0xCu);
    }
LABEL_16:

    v17 = 0;
    goto LABEL_17;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ckks"));

  if (!v16)
  {
    if (a6)
    {
      v18 = CFSTR("ckks does not exist");
      v19 = 61;
      goto LABEL_10;
    }
    v23 = sub_10000EF14("ckkspersona");
    v21 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v12;
      v22 = "ckksForClientRPC: no CKKSKeychainView found for persona %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ckks"));
LABEL_17:

  return v17;
}

- (void)clearAllContexts
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068CE0;
    block[3] = &unk_1002EC350;
    block[4] = self;
    dispatch_sync(v4, block);

  }
}

- (void)fetchEgoPeerID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  _BOOL4 v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD, id);
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  v9 = v15;
  v10 = sub_10000EF14("octagon");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchEgoPeerID RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v9);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received a fetch peer ID for arguments (%@)", buf, 0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100068C7C;
    v13[3] = &unk_1002DEF88;
    v14 = v7;
    objc_msgSend(v8, "rpcFetchEgoPeerID:", v13);

  }
}

- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  const void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v18));
  v12 = v18;
  v13 = sub_10000EF14("octagon");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (!v11 || v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchTrustStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, id))v10 + 2))(v10, -1, 0, 0, 0, v12);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Received a trust status for arguments (%@)", buf, 0xCu);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100068B00;
    v16[3] = &unk_1002DC0F0;
    v17 = v10;
    objc_msgSend(v11, "rpcTrustStatus:reply:", v9, v16);

  }
}

- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(id, uint64_t, void *);
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  v18 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:createIfMissing:error:](self, "contextForClientRPC:createIfMissing:error:", v8, 0, &v18));
  v12 = v18;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchCliqueStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, -1, v13);
  }
  else
  {
    if (!v9)
      v9 = objc_alloc_init((Class)OTOperationConfiguration);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100068AF0;
    v16[3] = &unk_1002DC0F0;
    v17 = v10;
    objc_msgSend(v11, "rpcTrustStatus:reply:", v9, v16);

  }
}

- (void)status:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v13 = 0;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:createIfMissing:error:](self, "contextForClientRPC:createIfMissing:error:", v6, 0, &v13));
  v9 = v13;
  v10 = sub_10000EF14("octagon");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a status RPC for arguments(%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Received a status RPC for arguments (%@): %@", buf, 0x16u);
    }

    objc_msgSend(v8, "rpcStatus:", v7);
  }

}

- (void)startOctagonStateMachine:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v14 = 0;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v14));
  v9 = v14;
  v10 = sub_10000EF14("octagon");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a startOctagonStateMachine RPC for arguments (%@): %@", buf, 0x16u);
    }

    v13 = v9;
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received a start-state-machine RPC for arguments (%@)", buf, 0xCu);
    }

    objc_msgSend(v8, "startOctagonStateMachine");
    v13 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v13);

}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 reply:(id)a5
{
  -[OTManager resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:](self, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", a3, a4, 0, 0, 0, 0, a5);
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 reply:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  const void *v26;
  NSObject *v27;
  _BOOL4 v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, void *);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;

  v10 = a7;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = (void (**)(id, void *))a9;
  v32 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v15, &v32));
  v21 = v32;
  v22 = v21;
  if (!v20 || v21)
  {
    v26 = sub_10000EF14("octagon");
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v15;
      v35 = 2112;
      v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Rejecting a resetAndEstablish RPC for arguments (%@): %@", buf, 0x16u);
    }

    v19[2](v19, v22);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v28 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityResetAndEstablish")));

    objc_msgSend(v20, "startOctagonStateMachine");
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100068A98;
    v29[3] = &unk_1002DE4E0;
    v30 = v24;
    v31 = v19;
    v25 = v24;
    objc_msgSend(v20, "rpcResetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", a4, v16, v17, v28, v18, v29);

  }
}

- (void)resetAcountData:(id)a3 resetReason:(int64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  id v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v8 = a3;
  v15 = 0;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v15));
  v11 = v15;
  v12 = v11;
  if (!v10 || v11)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a resetAndEstablish RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, v12);
  }
  else
  {
    objc_msgSend(v10, "startOctagonStateMachine");
    objc_msgSend(v10, "rpcReset:reply:", a4, v9);
  }

}

- (void)establish:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, void *);
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v20));
  v9 = v20;
  v10 = v9;
  if (!v8 || v9)
  {
    v15 = sub_10000EF14("octagon");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a establish RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityEstablish")));

    objc_msgSend(v8, "startOctagonStateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100068A40;
    v17[3] = &unk_1002DE4E0;
    v18 = v12;
    v19 = v7;
    v14 = v12;
    objc_msgSend(v8, "rpcEstablish:reply:", v13, v17);

  }
}

- (void)leaveClique:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, void *);
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v19));
  v9 = v19;
  v10 = v9;
  if (!v8 || v9)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a leaveClique RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityLeaveClique")));

    objc_msgSend(v8, "startOctagonStateMachine");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000689E8;
    v16[3] = &unk_1002DE4E0;
    v17 = v12;
    v18 = v7;
    v13 = v12;
    objc_msgSend(v8, "rpcLeaveClique:", v16);

  }
}

- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, void *);
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v22 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v22));
  v12 = v22;
  v13 = v12;
  if (!v11 || v12)
  {
    v17 = sub_10000EF14("octagon");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a removeFriendsInClique RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityRemoveFriendsInClique")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100068990;
    v19[3] = &unk_1002DE4E0;
    v20 = v15;
    v21 = v10;
    v16 = v15;
    objc_msgSend(v11, "rpcRemoveFriendsInClique:reply:", v9, v19);

  }
}

- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a peerDeviceNamesByPeerID RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "rpcFetchDeviceNamesByPeerID:", v7);
  }

}

- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v21));
  v11 = v21;
  v12 = v11;
  if (!v10 || v11)
  {
    v16 = sub_10000EF14("octagon");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2112;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchAllViableBottles RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v12);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityFetchAllViableBottles")));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100068900;
    v18[3] = &unk_1002E9658;
    v19 = v14;
    v20 = v9;
    v15 = v14;
    objc_msgSend(v10, "rpcFetchAllViableBottlesFromSource:reply:", a4, v18);

  }
}

- (void)fetchEscrowContents:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v19));
  v9 = v19;
  v10 = v9;
  if (!v8 || v9)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchEscrowContents RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityFetchEscrowContents")));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006885C;
    v16[3] = &unk_1002DC118;
    v17 = v12;
    v18 = v7;
    v13 = v12;
    objc_msgSend(v8, "fetchEscrowContents:", v16);

  }
}

- (void)totalTrustedPeers:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a totalTrustedPeers RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "rpcFetchTotalCountOfTrustedPeers:", v7);
  }

}

- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  OTMetricsSessionData *v26;
  void *v27;
  void *v28;
  OTMetricsSessionData *v29;
  id v30;
  const void *v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _BYTE *v36;
  os_signpost_id_t v37;
  uint64_t v38;
  id v39;
  _BYTE buf[24];
  char v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v39));
  v12 = v39;
  v13 = v12;
  if (!v11 || v12)
  {
    v31 = sub_10000EF14("octagon");
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcPrepareIdentityAsApplicant RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, 0, 0, 0, v13);
  }
  else
  {
    objc_msgSend(v11, "handlePairingRestart:", v9);
    v14 = _OctagonSignpostLogSystem(objc_msgSend(v11, "startOctagonStateMachine"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = _OctagonSignpostCreate();
    v18 = v17;

    v20 = _OctagonSignpostLogSystem(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PairingChannelInitiatorPrepare", " enableTelemetry=YES ", buf, 2u);
    }

    v24 = _OctagonSignpostLogSystem(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorPrepare  enableTelemetry=YES ", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v41 = 0;
    v26 = [OTMetricsSessionData alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flowID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceSessionID"));
    v29 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v26, "initWithFlowID:deviceSessionID:", v27, v28);
    objc_msgSend(v11, "setSessionMetrics:", v29);

    objc_msgSend(v11, "setShouldSendMetricsForOctagon:", 1);
    v30 = objc_msgSend(v9, "epoch");
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100068640;
    v33[3] = &unk_1002DC140;
    v36 = buf;
    v34 = v11;
    v37 = v16;
    v38 = v18;
    v35 = v10;
    objc_msgSend(v34, "rpcPrepareIdentityAsApplicantWithConfiguration:epoch:reply:", v9, v30, v33);

    _Block_object_dispose(buf, 8);
  }

}

- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  id v18;
  void *v19;
  OTMetricsSessionData *v20;
  void *v21;
  void *v22;
  OTMetricsSessionData *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  os_signpost_id_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const void *v36;
  NSObject *v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  void (**v41)(id, void *);
  _BYTE *v42;
  os_signpost_id_t v43;
  uint64_t v44;
  id v45;
  _BYTE buf[24];
  char v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  v45 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v12, &v45));
  v18 = v45;
  v19 = v18;
  if (!v17 || v18)
  {
    v36 = sub_10000EF14("octagon");
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcJoinWithArguments RPC for arguments (%@): %@", buf, 0x16u);
    }

    v16[2](v16, v19);
  }
  else
  {
    objc_msgSend(v17, "handlePairingRestart:", v13);
    objc_msgSend(v17, "startOctagonStateMachine");
    v20 = [OTMetricsSessionData alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flowID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceSessionID"));
    v23 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v20, "initWithFlowID:deviceSessionID:", v21, v22);
    objc_msgSend(v17, "setSessionMetrics:", v23);

    v24 = _OctagonSignpostLogSystem(objc_msgSend(v17, "setShouldSendMetricsForOctagon:", 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = _OctagonSignpostCreate();
    v38 = v27;
    v28 = v26;

    v30 = _OctagonSignpostLogSystem(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = v31;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, v28, "PairingChannelInitiatorJoinOctagon", " enableTelemetry=YES ", buf, 2u);
    }

    v34 = _OctagonSignpostLogSystem(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorJoinOctagon  enableTelemetry=YES ", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100068494;
    v39[3] = &unk_1002DC168;
    v40 = v17;
    v42 = buf;
    v43 = v28;
    v44 = v38;
    v41 = v16;
    objc_msgSend(v40, "rpcJoin:vouchSig:reply:", v14, v15, v39);

    _Block_object_dispose(buf, 8);
  }

}

- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  OTMetricsSessionData *v14;
  void *v15;
  void *v16;
  OTMetricsSessionData *v17;
  uint64_t v18;
  void *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const void *v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(id, _QWORD, void *);
  _BYTE *v35;
  os_signpost_id_t v36;
  uint64_t v37;
  id v38;
  _BYTE buf[24];
  char v40;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v38 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v38));
  v12 = v38;
  v13 = v12;
  if (!v11 || v12)
  {
    v30 = sub_10000EF14("octagon");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcEpoch RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    objc_msgSend(v11, "startOctagonStateMachine");
    v14 = [OTMetricsSessionData alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flowID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceSessionID"));
    v17 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v14, "initWithFlowID:deviceSessionID:", v15, v16);
    objc_msgSend(v11, "setSessionMetrics:", v17);

    v18 = _OctagonSignpostLogSystem(objc_msgSend(v11, "setShouldSendMetricsForOctagon:", 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = _OctagonSignpostCreate();
    v22 = v21;

    v24 = _OctagonSignpostLogSystem(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PairingChannelAcceptorEpoch", " enableTelemetry=YES ", buf, 2u);
    }

    v28 = _OctagonSignpostLogSystem(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorEpoch  enableTelemetry=YES ", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v40 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000682E4;
    v32[3] = &unk_1002DC190;
    v35 = buf;
    v33 = v11;
    v36 = v20;
    v37 = v22;
    v34 = v10;
    objc_msgSend(v33, "rpcEpoch:", v32);

    _Block_object_dispose(buf, 8);
  }

}

- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  const void *v33;
  NSObject *v34;
  const void *v35;
  NSObject *v36;
  OTMetricsSessionData *v37;
  void *v38;
  void *v39;
  OTMetricsSessionData *v40;
  uint64_t v41;
  void *v42;
  os_signpost_id_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _BYTE *v66;
  os_signpost_id_t v67;
  uint64_t v68;
  id v69;
  _BYTE buf[24];
  uint64_t v71;

  v17 = a3;
  v60 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v61 = a8;
  v62 = a9;
  v21 = a10;
  v22 = a11;
  v69 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v17, &v69));
  v24 = v69;
  v25 = v24;
  if (v23 && !v24)
  {
    v26 = objc_alloc_init((Class)TPECPublicKeyFactory);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[TPPeerPermanentInfo permanentInfoWithPeerID:data:sig:keyFactory:](TPPeerPermanentInfo, "permanentInfoWithPeerID:data:sig:keyFactory:", v18, v19, v20, v26));

    if (!v59)
    {
      v53 = sub_10000EF14("SecError");
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "octagon-rpc-voucher: aborting pairing: unable to validate provided permanentInfo with peerID!", buf, 2u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 74, CFSTR("Unable to validate peerID with provided permanentInfo")));
      (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v25);
      goto LABEL_32;
    }
    if (!qword_100340F18)
    {
      *(_OWORD *)buf = off_1002DC300;
      *(_QWORD *)&buf[16] = 0;
      qword_100340F18 = _sl_dlopen(buf, 0);
    }
    if (!qword_100340F18)
      goto LABEL_23;
    if (!v21)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v27 = (id *)qword_100340F20;
      v71 = qword_100340F20;
      if (!qword_100340F20)
      {
        v28 = sub_100068008();
        v27 = (id *)dlsym(v28, "KCPairingIntent_Capability_FullPeer");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v27;
        qword_100340F20 = (uint64_t)v27;
      }
      _Block_object_dispose(buf, 8);
      if (!v27)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getKCPairingIntent_Capability_FullPeer(void)"));
        objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("OTManager.m"), 111, CFSTR("%s"), dlerror());

        goto LABEL_36;
      }
      v21 = *v27;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v29 = (_QWORD *)qword_100340F28;
    v71 = qword_100340F28;
    if (!qword_100340F28)
    {
      v30 = sub_100068008();
      v29 = dlsym(v30, "KCPairingIntent_Capability_LimitedPeer");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v29;
      qword_100340F28 = (uint64_t)v29;
    }
    _Block_object_dispose(buf, 8);
    if (v29)
    {
      if (objc_msgSend(v21, "isEqualToString:", *v29))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "modelID"));
        v32 = +[OTDeviceInformation isFullPeer:](OTDeviceInformation, "isFullPeer:", v31);

        if (v32)
        {
          v33 = sub_10000EF14("SecError");
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "octagon-rpc-voucher: aborting pairing: full peer is attempting to get a voucher on a limited capability pairing context!", buf, 2u);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 75, CFSTR("full peer attempting to join limited capability pairing context")));
          (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v25);
LABEL_32:

          goto LABEL_33;
        }
      }
LABEL_23:
      objc_msgSend(v23, "startOctagonStateMachine");
      v37 = [OTMetricsSessionData alloc];
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flowID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceSessionID"));
      v40 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v37, "initWithFlowID:deviceSessionID:", v38, v39);
      objc_msgSend(v23, "setSessionMetrics:", v40);

      v41 = _OctagonSignpostLogSystem(objc_msgSend(v23, "setShouldSendMetricsForOctagon:", 1));
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = _OctagonSignpostCreate();
      v45 = v44;

      v47 = _OctagonSignpostLogSystem(v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      v49 = v48;
      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_BEGIN, v43, "PairingChannelAcceptorVoucher", " enableTelemetry=YES ", buf, 2u);
      }

      v51 = _OctagonSignpostLogSystem(v50);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v43;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorVoucher  enableTelemetry=YES ", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v71) = 0;
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10006810C;
      v63[3] = &unk_1002DC1B8;
      v66 = buf;
      v64 = v23;
      v67 = v43;
      v68 = v45;
      v65 = v22;
      objc_msgSend(v64, "rpcVoucherWithConfiguration:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:reply:", v18, v19, v20, v61, v62, v63);

      _Block_object_dispose(buf, 8);
      v25 = 0;
      goto LABEL_32;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getKCPairingIntent_Capability_LimitedPeer(void)"));
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("OTManager.m"), 112, CFSTR("%s"), dlerror());

LABEL_36:
    __break(1u);
  }
  v35 = sub_10000EF14("octagon");
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcVoucher RPC for arguments (%@): %@", buf, 0x16u);
  }

  (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v25);
LABEL_33:

}

- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  const void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(id, void *);
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v28 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v28));
  v15 = v28;
  v16 = v15;
  if (!v14 || v15)
  {
    v23 = sub_10000EF14("octagon");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rejecting a restoreFromBottle RPC for arguments (%@): %@", buf, 0x16u);
    }

    v13[2](v13, v16);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityBottledPeerRestore")));

    v19 = sub_10000EF14("octagon");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "restore via bottle invoked for arguments (%@)", buf, 0xCu);
    }

    objc_msgSend(v14, "startOctagonStateMachine");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altDSID"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100067FB0;
    v25[3] = &unk_1002DE4E0;
    v26 = v18;
    v27 = v13;
    v22 = v18;
    objc_msgSend(v14, "joinWithBottle:entropy:bottleSalt:reply:", v12, v11, v21, v25);

  }
}

- (BOOL)ghostbustByMidEnabled
{
  void *v3;
  unsigned __int8 v4;

  -[OTManager ensureRampsInitialized](self, "ensureRampsInitialized");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbmidRamp](self, "gbmidRamp"));
  v4 = objc_msgSend(v3, "checkRampStateWithError:", 0);

  return v4;
}

- (BOOL)ghostbustBySerialEnabled
{
  void *v3;
  unsigned __int8 v4;

  -[OTManager ensureRampsInitialized](self, "ensureRampsInitialized");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbserialRamp](self, "gbserialRamp"));
  v4 = objc_msgSend(v3, "checkRampStateWithError:", 0);

  return v4;
}

- (BOOL)ghostbustByAgeEnabled
{
  void *v3;
  unsigned __int8 v4;

  -[OTManager ensureRampsInitialized](self, "ensureRampsInitialized");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbAgeRamp](self, "gbAgeRamp"));
  v4 = objc_msgSend(v3, "checkRampStateWithError:", 0);

  return v4;
}

- (BOOL)fetchSendingMetricsPermitted:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  const void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v6 = a3;
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v14));
  v8 = v14;
  v9 = v8;
  if (!v7 || v8)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchSendingMetricsPermitted for arguments (%@): %@", buf, 0x16u);
    }

    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v10 = objc_msgSend(v7, "fetchSendingMetricsPermitted:", a4);
  }

  return v10;
}

- (BOOL)persistSendingMetricsPermitted:(id)a3 sendingMetricsPermitted:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  const void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v6 = a4;
  v8 = a3;
  v16 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  v10 = v16;
  v11 = v10;
  if (!v9 || v10)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchSendingMetricsPermitted for arguments (%@): %@", buf, 0x16u);
    }

    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    v12 = objc_msgSend(v9, "persistSendingMetricsPermitted:error:", v6, a5);
  }

  return v12;
}

- (void)setupAnalytics
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
  v4 = SFAnalyticsSamplerIntervalOncePerReport;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100066B38;
  v9[3] = &unk_1002DE408;
  objc_copyWeak(&v10, &location);
  v5 = objc_msgSend(v3, "AddMultiSamplerForName:withTimeInterval:block:", CFSTR("Octagon-healthSummary"), v9, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100067DB0;
  v8[3] = &unk_1002DC1E0;
  v8[4] = self;
  v7 = objc_msgSend(v6, "AddMultiSamplerForName:withTimeInterval:block:", CFSTR("CFU-healthSummary"), v8, v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)cdpContextTypes
{
  if (qword_100340F10 != -1)
    dispatch_once(&qword_100340F10, &stru_1002DC200);
  return (id)qword_100340F08;
}

- (BOOL)isFullPeer
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modelID"));
  v4 = +[OTDeviceInformation isFullPeer:](OTDeviceInformation, "isFullPeer:", v3);

  return v4;
}

- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  id v12;
  const void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, id);
  void *v30;
  id v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v31 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v31));
  v12 = v31;
  v13 = sub_10000EF14("octagon");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v35 = v8;
      v36 = 2112;
      v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a createRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting recovery key for arguments (%@)", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivitySetRecoveryKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      v30 = 0;
      if ((SecPasswordValidatePasswordFormat(4, v9, &v30) & 1) != 0)
      {
        objc_msgSend(v11, "startOctagonStateMachine");
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100066A04;
        v27[3] = &unk_1002DE4E0;
        v28 = v17;
        v29 = v10;
        objc_msgSend(v11, "rpcSetRecoveryKey:reply:", v9, v27);

        v18 = v28;
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("malformed recovery key"), NSLocalizedDescriptionKey);
        v24 = v30;
        if (v30)
        {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, NSUnderlyingErrorKey);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 41, v23));
        v25 = sub_10000EF14("SecError");
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v18;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "recovery failed validation with error:%@", buf, 0xCu);
        }

        objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventSetRecoveryKeyValidationFailed"), v18);
        v10[2](v10, v18);

      }
    }
    else
    {
      v19 = sub_10000EF14("octagon-recovery");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v32 = NSLocalizedDescriptionKey;
      v33 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v21));

      objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventRecoveryKey"), v22);
      v10[2](v10, v22);

    }
  }

}

- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  id v12;
  const void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(id, id);
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v30 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v30));
  v12 = v30;
  v13 = sub_10000EF14("octagon");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v32 = v8;
      v33 = 2112;
      v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a joinWithRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "join with recovery key invoked for arguments (%@)", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityJoinWithRecoveryKey")));

    v29 = 0;
    if ((SecPasswordValidatePasswordFormat(4, v9, &v29) & 1) != 0)
    {
      objc_msgSend(v11, "startOctagonStateMachine");
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100066434;
      v23[3] = &unk_1002DC228;
      v23[4] = self;
      v24 = v17;
      v28 = v10;
      v25 = v11;
      v26 = v8;
      v27 = v9;
      objc_msgSend(v25, "joinWithRecoveryKey:reply:", v27, v23);

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("malformed recovery key"), NSLocalizedDescriptionKey);
      v19 = v29;
      if (v29)
      {
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v29, NSUnderlyingErrorKey);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 41, v18));
      v21 = sub_10000EF14("SecError");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v29;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "recovery failed validation with error:%@", buf, 0xCu);
      }

      objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventJoinRecoveryKeyValidationFailed"), v20);
      v10[2](v10, v20);

    }
  }

}

- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  id v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    v19 = sub_10000EF14("octagon");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a createCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-custodian-recovery");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating Custodian Recovery Key for arguments (%@)", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityCreateCustodianRecoveryKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      objc_msgSend(v11, "startOctagonStateMachine");
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000663C0;
      v24[3] = &unk_1002DC250;
      v25 = v17;
      v26 = v10;
      objc_msgSend(v11, "rpcCreateCustodianRecoveryKeyWithUUID:reply:", v9, v24);

      v18 = v25;
    }
    else
    {
      v21 = sub_10000EF14("octagon-custodian-recovery");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v28 = NSLocalizedDescriptionKey;
      v29 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v23));

      objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventCreateCustodianRecoveryKey2"), v18);
      v10[2](v10, 0, v18);
    }

  }
}

- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  id v12;
  const void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(id, id);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v25 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v25));
  v12 = v25;
  v13 = sub_10000EF14("octagon");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v27 = v8;
      v28 = 2112;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a joinWithCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "join with custodian recovery key %@ invoked for container: %@, context: %@", buf, 0x20u);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityJoinWithCustodianRecoveryKey")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100066294;
    v22[3] = &unk_1002DE4E0;
    v23 = v20;
    v24 = v10;
    v21 = v20;
    objc_msgSend(v11, "joinWithCustodianRecoveryKey:reply:", v9, v22);

  }
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  id v12;
  const void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(id, id);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v25 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v25));
  v12 = v25;
  v13 = sub_10000EF14("octagon");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v27 = v8;
      v28 = 2112;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a preflightJoinWithCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "preflight join with custodian recovery key %@ invoked for container: %@, context: %@", buf, 0x20u);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityPreflightJoinWithCustodianRecoveryKey")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100066168;
    v22[3] = &unk_1002DE4E0;
    v23 = v20;
    v24 = v10;
    v21 = v20;
    objc_msgSend(v11, "preflightJoinWithCustodianRecoveryKey:reply:", v9, v22);

  }
}

- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, void *);
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v30 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v30));
  v12 = v30;
  v13 = v12;
  if (!v11 || v12)
  {
    v22 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v8;
      v35 = 2112;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Rejecting a removeCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-custodian-recovery");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Remove Custodian Recovery Key %@ for container: %@, context: %@", buf, 0x20u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityRemoveCustodianRecoveryKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      if (_os_feature_enabled_impl("Security", "TTROnCRKRemoval"))
      {
        v20 = objc_msgSend(objc_alloc((Class)SecTapToRadar), "initTapToRadar:description:radar:", CFSTR("Custodian key removal"), CFSTR("Please TTR unless you were just removing a recovery contact"), CFSTR("114829039"));
        objc_msgSend(v20, "trigger");

      }
      objc_msgSend(v11, "startOctagonStateMachine");
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100066110;
      v27[3] = &unk_1002DE4E0;
      v28 = v19;
      v29 = v10;
      objc_msgSend(v11, "rpcRemoveCustodianRecoveryKeyWithUUID:reply:", v9, v27);

      v21 = v28;
    }
    else
    {
      v24 = sub_10000EF14("octagon-custodian-recovery");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot remove recovery key in Octagon",
          buf,
          2u);
      }

      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Device is considered a limited peer, cannot remove recovery key in Octagon");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v26));

      objc_msgSend(v19, "stopWithEvent:result:", CFSTR("OctagonEventRemoveCustodianRecoveryKey"), v21);
      v10[2](v10, v21);
    }

  }
}

- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, _QWORD, void *);
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v26 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v26));
  v12 = v26;
  v13 = v12;
  if (!v11 || v12)
  {
    v21 = sub_10000EF14("octagon");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting a checkCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-custodian-recovery");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v28 = v9;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Check Custodian Recovery Key %@ for container: %@, context: %@", buf, 0x20u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityCheckCustodianRecoveryKey")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000660A8;
    v23[3] = &unk_1002DC278;
    v24 = v19;
    v25 = v10;
    v20 = v19;
    objc_msgSend(v11, "rpcCheckCustodianRecoveryKeyWithUUID:reply:", v9, v23);

  }
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  id v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    v19 = sub_10000EF14("octagon");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a createInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-inheritance");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityCreateInheritanceKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      objc_msgSend(v11, "startOctagonStateMachine");
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100066034;
      v24[3] = &unk_1002DC2A0;
      v25 = v17;
      v26 = v10;
      objc_msgSend(v11, "rpcCreateInheritanceKeyWithUUID:reply:", v9, v24);

      v18 = v25;
    }
    else
    {
      v21 = sub_10000EF14("octagon-inheritance");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v28 = NSLocalizedDescriptionKey;
      v29 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v23));

      objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventCreateInheritanceKey"), v18);
      v10[2](v10, 0, v18);
    }

  }
}

- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  id v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    v19 = sub_10000EF14("octagon");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a generateInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-inheritance");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Generating Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityGenerateInheritanceKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      objc_msgSend(v11, "startOctagonStateMachine");
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100065FC0;
      v24[3] = &unk_1002DC2A0;
      v25 = v17;
      v26 = v10;
      objc_msgSend(v11, "rpcGenerateInheritanceKeyWithUUID:reply:", v9, v24);

      v18 = v25;
    }
    else
    {
      v21 = sub_10000EF14("octagon-inheritance");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v28 = NSLocalizedDescriptionKey;
      v29 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v23));

      objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventGenerateInheritanceKey"), v18);
      v10[2](v10, 0, v18);
    }

  }
}

- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, void *);
  id v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    v19 = sub_10000EF14("octagon");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a storeInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-inheritance");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Storing Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityStoreInheritanceKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      objc_msgSend(v11, "startOctagonStateMachine");
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100065F68;
      v24[3] = &unk_1002DE4E0;
      v25 = v17;
      v26 = v10;
      objc_msgSend(v11, "rpcStoreInheritanceKeyWithIK:reply:", v9, v24);

      v18 = v25;
    }
    else
    {
      v21 = sub_10000EF14("octagon-inheritance");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v28 = NSLocalizedDescriptionKey;
      v29 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v23));

      objc_msgSend(v17, "stopWithEvent:result:", CFSTR("OctagonEventStoreInheritanceKey"), v18);
      v10[2](v10, v18);
    }

  }
}

- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, void *);
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    v22 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v8;
      v30 = 2112;
      v31 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Rejecting a joinWithInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-inheritance");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "join with inheritance key %@ invoked for container: %@, context: %@", buf, 0x20u);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityJoinWithInheritanceKey")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100065E3C;
    v24[3] = &unk_1002DE4E0;
    v25 = v20;
    v26 = v10;
    v21 = v20;
    objc_msgSend(v11, "joinWithInheritanceKey:reply:", v9, v24);

  }
}

- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, void *);
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v27 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    v22 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v8;
      v30 = 2112;
      v31 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Rejecting a preflightJoinWithInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-inheritance");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "preflight join with inheritance key %@ invoked for container: %@, context: %@", buf, 0x20u);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityPreflightJoinWithInheritanceKey")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100065D10;
    v24[3] = &unk_1002DE4E0;
    v25 = v20;
    v26 = v10;
    v21 = v20;
    objc_msgSend(v11, "preflightJoinWithInheritanceKey:reply:", v9, v24);

  }
}

- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, void *);
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v30 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v30));
  v12 = v30;
  v13 = v12;
  if (!v11 || v12)
  {
    v22 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v8;
      v35 = 2112;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Rejecting a removeInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-inheritance");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Remove Inheritance Key %@ for container: %@, context: %@", buf, 0x20u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityRemoveInheritanceKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      if (_os_feature_enabled_impl("Security", "TTROnCRKRemoval"))
      {
        v20 = objc_msgSend(objc_alloc((Class)SecTapToRadar), "initTapToRadar:description:radar:", CFSTR("Inheritance key removal"), CFSTR("Please TTR unless you were just removing a legacy contact"), CFSTR("114829039"));
        objc_msgSend(v20, "trigger");

      }
      objc_msgSend(v11, "startOctagonStateMachine");
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100065CB8;
      v27[3] = &unk_1002DE4E0;
      v28 = v19;
      v29 = v10;
      objc_msgSend(v11, "rpcRemoveInheritanceKeyWithUUID:reply:", v9, v27);

      v21 = v28;
    }
    else
    {
      v24 = sub_10000EF14("octagon-custodian-recovery");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot remove inheritance key in Octagon",
          buf,
          2u);
      }

      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Device is considered a limited peer, cannot remove inheritance key in Octagon");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v26));

      objc_msgSend(v19, "stopWithEvent:result:", CFSTR("OctagonEventRemoveInheritanceKey"), v21);
      v10[2](v10, v21);
    }

  }
}

- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, _QWORD, void *);
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v26 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v26));
  v12 = v26;
  v13 = v12;
  if (!v11 || v12)
  {
    v21 = sub_10000EF14("octagon");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting a checkInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    v14 = sub_10000EF14("octagon-custodian-recovery");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
      *(_DWORD *)buf = 138412802;
      v28 = v9;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Check Custodian Recovery Key %@ for container: %@, context: %@", buf, 0x20u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityCheckInheritanceKey")));

    objc_msgSend(v11, "startOctagonStateMachine");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100065C50;
    v23[3] = &unk_1002DC278;
    v24 = v19;
    v25 = v10;
    v20 = v19;
    objc_msgSend(v11, "rpcCheckInheritanceKeyWithUUID:reply:", v9, v23);

  }
}

- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  id v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, _QWORD, void *);
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v30 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v30));
  v15 = v30;
  v16 = v15;
  if (!v14 || v15)
  {
    v22 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v10;
      v35 = 2112;
      v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Rejecting a recreateInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v13[2](v13, 0, v16);
  }
  else
  {
    v17 = sub_10000EF14("octagon-inheritance");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Recreating Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityRecreateInheritanceKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      objc_msgSend(v14, "startOctagonStateMachine");
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100065BDC;
      v27[3] = &unk_1002DC2A0;
      v28 = v20;
      v29 = v13;
      objc_msgSend(v14, "rpcRecreateInheritanceKeyWithUUID:oldIK:reply:", v11, v12, v27);

      v21 = v28;
    }
    else
    {
      v24 = sub_10000EF14("octagon-inheritance");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v26));

      objc_msgSend(v20, "stopWithEvent:result:", CFSTR("OctagonEventRecreateInheritanceKey"), v21);
      v13[2](v13, 0, v21);
    }

  }
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  id v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  const void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  void (**v32)(id, _QWORD, void *);
  id v33;
  NSErrorUserInfoKey v34;
  const __CFString *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  v33 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v12, &v33));
  v18 = v33;
  v19 = v18;
  if (!v17 || v18)
  {
    v25 = sub_10000EF14("octagon");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v12;
      v38 = 2112;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Rejecting a createInheritanceKey (w/claimToken+wrappingKey) RPC for arguments (%@): %@", buf, 0x16u);
    }

    v16[2](v16, 0, v19);
  }
  else
  {
    v20 = sub_10000EF14("octagon-inheritance");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Creating Inheritance Key given claimToken+wrappingKey for arguments (%@)", buf, 0xCu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonEventCreateInheritanceKeyWithClaimTokenAndWrappingKey")));

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      objc_msgSend(v17, "startOctagonStateMachine");
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100065B68;
      v30[3] = &unk_1002DC2A0;
      v31 = v23;
      v32 = v16;
      objc_msgSend(v17, "rpcCreateInheritanceKeyWithUUID:claimTokenData:wrappingKeyData:reply:", v13, v14, v15, v30);

      v24 = v31;
    }
    else
    {
      v27 = sub_10000EF14("octagon-inheritance");
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      v34 = NSLocalizedDescriptionKey;
      v35 = CFSTR("Device is considered a limited peer, cannot enroll recovery key in Octagon");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 35, v29));

      objc_msgSend(v23, "stopWithEvent:result:", CFSTR("OctagonActivityRecreateInheritanceKey"), v24);
      v16[2](v16, 0, v24);
    }

  }
}

- (void)xpc24HrNotification
{
  const void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  v3 = sub_10000EF14("octagon-health");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received 24hr xpc notification", v6, 2u);
  }

  v5 = objc_alloc_init((Class)OTControlArguments);
  -[OTManager healthCheck:skipRateLimitingCheck:repair:reply:](self, "healthCheck:skipRateLimitingCheck:repair:reply:", v5, 0, 0, &stru_1002DC2E0);

}

- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  OTMetricsSessionData *v22;
  const void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v25 = 0;
  v11 = (void (**)(id, _QWORD, void *))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v25));
  v13 = v25;
  v14 = v13;
  if (!v12 || v13)
  {
    v18 = sub_10000EF14("octagon");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v10;
      v28 = 2112;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a healthCheck RPC for arguments (%@): %@", buf, 0x16u);
    }

    v11[2](v11, 0, v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flowID"));

    if (v15)
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flowID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceSessionID"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceSessionID"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altDSID"));
      v21 = +[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:](AAFAnalyticsEventSecurity, "fetchDeviceSessionIDFromAuthKit:", v20);

      v17 = 0;
    }
    v22 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:]([OTMetricsSessionData alloc], "initWithFlowID:deviceSessionID:", v15, v17);
    objc_msgSend(v12, "setSessionMetrics:", v22);

    v23 = sub_10000EF14("octagon");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "notifying container of change", buf, 2u);
    }

    objc_msgSend(v12, "notifyContainerChange:", 0);
    objc_msgSend(v12, "checkOctagonHealth:repair:reply:", v8, v7, v11);

    v11 = (void (**)(id, _QWORD, void *))v15;
  }

}

- (void)simulateReceivePush:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v16 = 0;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v16));
  v9 = v16;
  v10 = v9;
  if (!v8 || v9)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting updateOctagon for arguments (%@): %@", buf, 0x16u);
    }

    v13 = v10;
  }
  else
  {
    v11 = sub_10000EF14("octagon-push");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "notifying container of change (simulated)", buf, 2u);
    }

    objc_msgSend(v8, "notifyContainerChange:", 0);
    v13 = 0;
  }
  ((void (**)(id, void *))v7)[2](v7, v13);

}

- (void)setSOSEnabledForPlatformFlag:(BOOL)a3
{
  -[OTManager setSosEnabledForPlatform:](self, "setSosEnabledForPlatform:", a3);
}

- (void)allContextsHalt
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stateMachine"));
        objc_msgSend(v9, "haltOperation");

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ckks"));
        objc_msgSend(v10, "halt");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)allContextsDisablePendingFlags
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

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
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "stateMachine"));
        objc_msgSend(v8, "disablePendingFlags");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)allContextsPause:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateMachine"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentState"));

        if (v12 != CFSTR("not_started"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateMachine"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "paused"));
          v15 = objc_msgSend(v14, "wait:", a3);

          if (v15)
            goto LABEL_14;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pendingEscrowCacheWarmup"));
        v17 = v16;
        if (v16 && objc_msgSend(v16, "wait:", a3))
        {

LABEL_14:
          v18 = 0;
          goto LABEL_15;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_15:

  return v18;
}

- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  v9 = v17;
  v10 = v9;
  if (!v8 || v9)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a waitForOctagonUpgrade RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = sub_10000EF14("octagon-sos");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting wait for octagon upgrade", buf, 2u);
    }

    objc_msgSend(v8, "startOctagonStateMachine");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100065A60;
    v15[3] = &unk_1002DEF60;
    v16 = v7;
    objc_msgSend(v8, "waitForOctagonUpgrade:", v15);

  }
}

- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  v9 = v17;
  v10 = v9;
  if (!v8 || v9)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a waitForPriorityViewKeychainDataRecovery RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = sub_10000EF14("octagon-ckks");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting wait for priority view processing", buf, 2u);
    }

    objc_msgSend(v8, "startOctagonStateMachine");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100065A54;
    v15[3] = &unk_1002DEF60;
    v16 = v7;
    objc_msgSend(v8, "rpcWaitForPriorityViewKeychainDataRecovery:", v15);

  }
}

- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7
{
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v9 = (void (**)(id, _QWORD))a7;
  v10 = a6;
  v11 = a5;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("OACDPStateRun"), v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@Tries"), CFSTR("OACDPStateRun"), v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
  objc_msgSend(v13, "logResultForEvent:hardFailure:result:", v18, 0, v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
  v15 = v14;
  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v15, "setDateProperty:forKey:", v16, v18);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    objc_msgSend(v17, "incrementIntegerPropertyForKey:", v12);
  }
  else
  {
    objc_msgSend(v14, "setDateProperty:forKey:", 0, v18);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    objc_msgSend(v17, "setNumberProperty:forKey:", 0, v12);
  }

  v9[2](v9, 0);
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6
{
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)SecTapToRadar), "initTapToRadar:description:radar:", v12, v11, v10);

  objc_msgSend(v13, "trigger");
  v9[2](v9, 0);

}

- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  v9 = v17;
  v10 = v9;
  if (!v8 || v9)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a refetchCKKSPolicy RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = sub_10000EF14("octagon-ckks");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "refetch-ckks-policy", buf, 2u);
    }

    objc_msgSend(v8, "startOctagonStateMachine");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100065978;
    v15[3] = &unk_1002DEF60;
    v16 = v7;
    objc_msgSend(v8, "rpcRefetchCKKSPolicy:", v15);

  }
}

- (void)getCDPStatus:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  id v14;
  const void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v6 = a3;
  v18 = 0;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v18));
  v9 = v18;
  v10 = v9;
  if (!v8 || v9)
  {
    v15 = sub_10000EF14("octagon");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a getCDPStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    v11 = sub_10000EF14("octagon-cdp");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "get-cdp-status", buf, 2u);
    }

    v17 = 0;
    v13 = objc_msgSend(v8, "getCDPStatus:", &v17);
    v14 = v17;
    ((void (**)(id, id, void *))v7)[2](v7, v13, v14);

    v7 = (void (**)(id, _QWORD, void *))v14;
  }

}

- (void)setCDPEnabled:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v17 = 0;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  v9 = v17;
  v10 = v9;
  if (!v8 || v9)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a setCDPEnabled RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = sub_10000EF14("octagon-cdp");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "set-cdp-enabled", buf, 2u);
    }

    v16 = 0;
    objc_msgSend(v8, "setCDPEnabled:", &v16);
    v13 = v16;
    v7[2](v7, v13);

    v7 = (void (**)(id, void *))v13;
  }

}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  id v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  const void *v15;
  NSObject *v16;
  _QWORD v17[4];
  void (**v18)(id, _QWORD, void *);
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v19));
  v11 = v19;
  v12 = v11;
  if (!v10 || v11)
  {
    v15 = sub_10000EF14("octagon");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchEscrowRecords RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, 0, v12);
  }
  else
  {
    v13 = sub_10000EF14("octagon-fetch-escrow-records");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "fetching records", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100065834;
    v17[3] = &unk_1002DEFD8;
    v18 = v9;
    objc_msgSend(v10, "rpcFetchAllViableEscrowRecordsFromSource:reply:", a4, v17);

  }
}

- (void)invalidateEscrowCache:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  v9 = v17;
  v10 = v9;
  if (!v8 || v9)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a invalidateEscrowCache RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v11 = sub_10000EF14("octagon-remove-escrow-cache");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "beginning removing escrow cache!", buf, 2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100065708;
    v15[3] = &unk_1002DEF60;
    v16 = v7;
    objc_msgSend(v8, "rpcInvalidateEscrowCache:", v15);

  }
}

- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  id v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(id, _QWORD, void *);
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v17 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v17));
  v11 = v17;
  v12 = v11;
  if (!v10 || v11)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a setUserControllableViewsSyncStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, 0, v12);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000655AC;
    v15[3] = &unk_1002DF000;
    v16 = v9;
    objc_msgSend(v10, "rpcSetUserControllableViewsSyncingStatus:reply:", v6, v15);

  }
}

- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD, void *);
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  v9 = v15;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchUserControllableViewsSyncStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100065450;
    v13[3] = &unk_1002DF000;
    v14 = v7;
    objc_msgSend(v8, "rpcFetchUserControllableViewsSyncingStatus:", v13);

  }
}

- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  id v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  _QWORD v21[4];
  void (**v22)(id, void *);
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  v23 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v12, &v23));
  v17 = v23;
  v18 = v17;
  if (!v16 || v17)
  {
    v19 = sub_10000EF14("octagon");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v12;
      v26 = 2112;
      v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a resetAccountCDPContents RPC for arguments (%@): %@", buf, 0x16u);
    }

    v15[2](v15, v18);
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100065324;
    v21[3] = &unk_1002DEF60;
    v22 = v15;
    objc_msgSend(v16, "rpcResetAccountCDPContentsWithIdmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:", v13, v14, v8, v21);

  }
}

- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  v12 = v16;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a setLocalSecureElementIdentity RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    objc_msgSend(v11, "rpcSetLocalSecureElementIdentity:reply:", v9, v10);
  }

}

- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  v12 = v16;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a removeLocalSecureElementIdentityPeerID RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    objc_msgSend(v11, "rpcRemoveLocalSecureElementIdentityPeerID:reply:", v9, v10);
  }

}

- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchTrustedSecureElementIdentities RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "rpcFetchTrustedSecureElementIdentities:", v7);
  }

}

- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  v12 = v16;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a setAccountSetting RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    objc_msgSend(v11, "rpcSetAccountSetting:reply:", v9, v10);
  }

}

- (void)fetchAccountSettings:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchAccountSettings RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "rpcFetchAccountSettings:", v7);
  }

}

- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  id v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v15 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v15));
  v11 = v15;
  v12 = v11;
  if (!v10 || v11)
  {
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchAccountWideSettings RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, 0, v12);
  }
  else
  {
    objc_msgSend(v10, "rpcAccountWideSettingsWithForceFetch:reply:", v6, v9);
  }

}

- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  id v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v18 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v18));
  v14 = v18;
  v15 = v14;
  if (!v13 || v14)
  {
    v16 = sub_10000EF14("octagon");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a tlkRecoverabilityForEscrowRecordData RPC for arguments (%@): %@", buf, 0x16u);
    }

    v12[2](v12, 0, v15);
  }
  else
  {
    objc_msgSend(v13, "rpcTlkRecoverabilityForEscrowRecordData:source:reply:", v11, a5, v12);
  }

}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a isRecoveryKeySet RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "rpcIsRecoveryKeySet:", v7);
  }

}

- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(id, void *);
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v18 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v18));
  v12 = v18;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = sub_10000EF14("octagon-recover-with-recovery-key");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a recoverWithRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000651F8;
    v16[3] = &unk_1002DEF60;
    v17 = v10;
    objc_msgSend(v11, "joinWithRecoveryKey:reply:", v9, v16);

  }
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, void *);
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  v9 = v15;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon-remove-recovery-key");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a removeRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000650D8;
    v13[3] = &unk_1002DF000;
    v14 = v7;
    objc_msgSend(v8, "rpcRemoveRecoveryKey:", v13);

  }
}

- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v17));
  v12 = v17;
  v13 = v12;
  if (!v11 || v12)
  {
    v15 = sub_10000EF14("octagon");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a setMachineIDOverride RPC for arguments (%@): %@", buf, 0x16u);
    }

    v14 = v13;
  }
  else
  {
    objc_msgSend(v11, "setMachineIDOverride:", v9);
    v14 = 0;
  }
  ((void (**)(id, void *))v10)[2](v10, v14);

}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  v12 = v16;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a preflightRecoverOctagonUsingRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    objc_msgSend(v11, "preflightRecoverOctagonUsingRecoveryKey:reply:", v9, v10);
  }

}

- (void)getAccountMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a getAccountMetadata RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "getAccountMetadataWithReply:", v7);
  }

}

- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  v9 = v13;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a areRecoveryKeysDistrusted RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    objc_msgSend(v8, "areRecoveryKeysDistrusted:", v7);
  }

}

- (void)reroll:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, id);
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v19));
  v9 = v19;
  v10 = sub_10000EF14("octagon");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a reroll RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v9);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "reroll invoked for arguments (%@)", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonActivityReroll")));

    objc_msgSend(v8, "startOctagonStateMachine");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100065080;
    v16[3] = &unk_1002DE4E0;
    v17 = v14;
    v18 = v7;
    v15 = v14;
    objc_msgSend(v8, "rerollWithReply:", v16);

  }
}

- (void)setLockStateTracker:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateTracker, a3);
}

- (CKKSAccountStateTracker)accountStateTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAccountStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReachabilityTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKContainer)cloudKitContainer
{
  return (CKContainer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setViewManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 88, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OTRamp)gbmidRamp
{
  return self->_gbmidRamp;
}

- (void)setGbmidRamp:(id)a3
{
  objc_storeStrong((id *)&self->_gbmidRamp, a3);
}

- (OTRamp)gbserialRamp
{
  return self->_gbserialRamp;
}

- (void)setGbserialRamp:(id)a3
{
  objc_storeStrong((id *)&self->_gbserialRamp, a3);
}

- (OTRamp)gbAgeRamp
{
  return self->_gbAgeRamp;
}

- (void)setGbAgeRamp:(id)a3
{
  objc_storeStrong((id *)&self->_gbAgeRamp, a3);
}

- (OctagonFollowUpControllerProtocol)cdpd
{
  return self->_cdpd;
}

- (void)setCdpd:(id)a3
{
  objc_storeStrong((id *)&self->_cdpd, a3);
}

- (void)setContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 168, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 176, 1);
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 184, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 192, 1);
}

- (Class)loggerClass
{
  return (Class)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)sosEnabledForPlatform
{
  return self->_sosEnabledForPlatform;
}

- (void)setSosEnabledForPlatform:(BOOL)a3
{
  self->_sosEnabledForPlatform = a3;
}

- (CKKSNearFutureScheduler)savedTLKNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSavedTLKNotifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 216, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_savedTLKNotifier, 0);
  objc_storeStrong((id *)&self->_loggerClass, 0);
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_escrowRequestClass, 0);
  objc_storeStrong((id *)&self->_apsConnectionClass, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_tapToRadarAdapter, 0);
  objc_storeStrong((id *)&self->_tooManyPeersAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_cdpd, 0);
  objc_storeStrong((id *)&self->_gbAgeRamp, 0);
  objc_storeStrong((id *)&self->_gbserialRamp, 0);
  objc_storeStrong((id *)&self->_gbmidRamp, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_viewManager, 0);
  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_accountStateTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_deviceInformationAdapter, 0);
  objc_storeStrong((id *)&self->_authKitAdapter, 0);
  objc_storeStrong((id *)&self->_sosAdapter, 0);
  objc_storeStrong((id *)&self->_cuttlefishXPCConnection, 0);
}

+ (id)makeCKContainer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)CKContainerOptions);
  objc_msgSend(v4, "setBypassPCSEncryption:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerIDForContainerIdentifier:](CKContainer, "containerIDForContainerIdentifier:", v3));

  v6 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v5, v4);
  return v6;
}

@end
