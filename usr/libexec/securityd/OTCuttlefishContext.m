@implementation OTCuttlefishContext

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_getProperty(self, a2, 184, 1);
}

- (OTCuttlefishContext)initWithContainerName:(id)a3 contextID:(id)a4 activeAccount:(id)a5 cuttlefish:(id)a6 ckksAccountSync:(id)a7 sosAdapter:(id)a8 accountsAdapter:(id)a9 authKitAdapter:(id)a10 personaAdapter:(id)a11 tooManyPeersAdapter:(id)a12 tapToRadarAdapter:(id)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 accountStateTracker:(id)a16 deviceInformationAdapter:(id)a17 apsConnectionClass:(Class)a18 escrowRequestClass:(Class)a19 notifierClass:(Class)a20 cdpd:(id)a21
{
  id v26;
  id v27;
  OTCuttlefishContext *v28;
  uint64_t v29;
  OctagonAPSReceiver *apsReceiver;
  OctagonAPSReceiver *v31;
  void *v32;
  id v33;
  SecLaunchSequence *v34;
  SecLaunchSequence *launchSequence;
  dispatch_queue_t v36;
  OS_dispatch_queue *queue;
  NSOperationQueue *v38;
  NSOperationQueue *operationQueue;
  CKKSCondition *v40;
  CKKSCondition *cloudKitAccountStateKnown;
  OTCuttlefishAccountStateHolder *v42;
  OTCuttlefishAccountStateHolder *accountMetadataStore;
  OctagonStateMachine *v44;
  unsigned __int8 v45;
  __CFString *v46;
  void *v47;
  void *v48;
  OctagonStateMachine *v49;
  OctagonStateMachine *stateMachine;
  CuttlefishXPCWrapper *v51;
  CuttlefishXPCWrapper *cuttlefishXPCWrapper;
  OTFollowup *v53;
  OTFollowup *followupHandler;
  id v55;
  CKKSNearFutureScheduler *v56;
  CKKSNearFutureScheduler *v57;
  CKKSNearFutureScheduler *suggestTLKUploadNotifier;
  CKKSNearFutureScheduler *v59;
  CKKSNearFutureScheduler *v60;
  CKKSNearFutureScheduler *requestPolicyCheckNotifier;
  CKKSNearFutureScheduler *v62;
  CKKSNearFutureScheduler *v63;
  CKKSNearFutureScheduler *upgradeUserControllableViewsRateLimiter;
  CKKSNearFutureScheduler *v65;
  CKKSNearFutureScheduler *fixupRetryScheduler;
  CKKSNearFutureScheduler *v67;
  CKKSNearFutureScheduler *v68;
  CKKSNearFutureScheduler *checkMetricsTrigger;
  id v71;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  id location;
  objc_super v97;

  v80 = a3;
  v87 = a4;
  v86 = a5;
  v26 = a6;
  v79 = a7;
  v71 = a8;
  v78 = a8;
  v77 = a9;
  v76 = a10;
  v85 = a11;
  v75 = a12;
  v74 = a13;
  v84 = a14;
  v83 = a15;
  v82 = a16;
  v73 = a17;
  v27 = a21;
  v97.receiver = self;
  v97.super_class = (Class)OTCuttlefishContext;
  v28 = -[OTCuttlefishContext init](&v97, "init");
  if (v28)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v28);
    objc_storeStrong((id *)&v28->_containerName, a3);
    objc_storeStrong((id *)&v28->_contextID, a4);
    objc_storeStrong((id *)&v28->_activeAccount, a5);
    objc_storeStrong((id *)&v28->_reachabilityTracker, a15);
    v29 = objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:](OctagonAPSReceiver, "receiverForNamedDelegatePort:apsConnectionClass:", CFSTR("com.apple.securityd.aps"), a18));
    apsReceiver = v28->_apsReceiver;
    v28->_apsReceiver = (OctagonAPSReceiver *)v29;

    v31 = v28->_apsReceiver;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](v28, "containerName"));
    v33 = -[OctagonAPSReceiver registerCuttlefishReceiver:forContainerName:contextID:](v31, "registerCuttlefishReceiver:forContainerName:contextID:", v28, v32, v87);

    objc_storeStrong((id *)&v28->_ckks, a7);
    v28->_initialBecomeUntrustedPosted = 0;
    objc_storeStrong((id *)&v28->_tooManyPeersAdapter, a12);
    objc_storeStrong((id *)&v28->_tapToRadarAdapter, a13);
    v34 = (SecLaunchSequence *)objc_msgSend(objc_alloc((Class)SecLaunchSequence), "initWithRocketName:", CFSTR("com.apple.octagon.launch"));
    launchSequence = v28->_launchSequence;
    v28->_launchSequence = v34;

    v36 = dispatch_queue_create("com.apple.security.otcuttlefishcontext", 0);
    queue = v28->_queue;
    v28->_queue = (OS_dispatch_queue *)v36;

    v38 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v28->_operationQueue;
    v28->_operationQueue = v38;

    v40 = objc_alloc_init(CKKSCondition);
    cloudKitAccountStateKnown = v28->_cloudKitAccountStateKnown;
    v28->_cloudKitAccountStateKnown = v40;

    v42 = -[OTCuttlefishAccountStateHolder initWithQueue:container:context:personaAdapter:activeAccount:]([OTCuttlefishAccountStateHolder alloc], "initWithQueue:container:context:personaAdapter:activeAccount:", v28->_queue, v28->_containerName, v28->_contextID, v85, v86);
    accountMetadataStore = v28->_accountMetadataStore;
    v28->_accountMetadataStore = v42;

    -[OTCuttlefishAccountStateHolder registerNotification:](v28->_accountMetadataStore, "registerNotification:", v28);
    v44 = [OctagonStateMachine alloc];
    v45 = objc_msgSend(v87, "isEqualToString:", CFSTR("defaultContext"));
    if ((v45 & 1) != 0)
      v46 = CFSTR("octagon");
    else
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("octagon-%@"), v87));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonStateMap](OTStates, "OctagonStateMap"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates AllOctagonFlags](OTStates, "AllOctagonFlags"));
    v49 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:](v44, "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:", v46, v47, v48, CFSTR("Initializing"), v28->_queue, v28, CFSTR("com.apple.security.octagon.state"), v84, v83);
    stateMachine = v28->_stateMachine;
    v28->_stateMachine = v49;

    if ((v45 & 1) == 0)
    objc_storeStrong((id *)&v28->_sosAdapter, v71);
    -[OTSOSAdapter registerForPeerChangeUpdates:](v28->_sosAdapter, "registerForPeerChangeUpdates:", v28);
    objc_storeStrong((id *)&v28->_accountsAdapter, a9);
    objc_storeStrong((id *)&v28->_authKitAdapter, a10);
    objc_storeStrong((id *)&v28->_personaAdapter, a11);
    objc_storeStrong((id *)&v28->_deviceAdapter, a17);
    -[OTDeviceInformationAdapter registerForDeviceNameUpdates:](v28->_deviceAdapter, "registerForDeviceNameUpdates:", v28);
    v51 = -[CuttlefishXPCWrapper initWithCuttlefishXPCConnection:]([CuttlefishXPCWrapper alloc], "initWithCuttlefishXPCConnection:", v26);
    cuttlefishXPCWrapper = v28->_cuttlefishXPCWrapper;
    v28->_cuttlefishXPCWrapper = v51;

    objc_storeStrong((id *)&v28->_lockStateTracker, a14);
    objc_storeStrong((id *)&v28->_accountStateTracker, a16);
    v53 = -[OTFollowup initWithFollowupController:]([OTFollowup alloc], "initWithFollowupController:", v27);
    followupHandler = v28->_followupHandler;
    v28->_followupHandler = v53;

    v55 = objc_msgSend(v82, "registerForNotificationsOfCloudKitAccountStatusChange:", v28);
    -[OTAuthKitAdapter registerNotification:](v28->_authKitAdapter, "registerNotification:", v28);
    objc_storeStrong((id *)&v28->_notifierClass, a20);
    objc_storeStrong((id *)&v28->_escrowRequestClass, a19);
    v56 = [CKKSNearFutureScheduler alloc];
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_1000F7474;
    v94[3] = &unk_1002EB598;
    objc_copyWeak(&v95, &location);
    v57 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v56, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("octagon-tlk-request"), 500000000, 0, 0, v94);
    suggestTLKUploadNotifier = v28->_suggestTLKUploadNotifier;
    v28->_suggestTLKUploadNotifier = v57;

    v59 = [CKKSNearFutureScheduler alloc];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_1000F7510;
    v92[3] = &unk_1002EB598;
    objc_copyWeak(&v93, &location);
    v60 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v59, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("octagon-policy-check"), 500000000, 0, 0, v92);
    requestPolicyCheckNotifier = v28->_requestPolicyCheckNotifier;
    v28->_requestPolicyCheckNotifier = v60;

    v62 = [CKKSNearFutureScheduler alloc];
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_1000F75AC;
    v90[3] = &unk_1002EB598;
    objc_copyWeak(&v91, &location);
    v63 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v62, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("octagon-upgrade-ucv"), 0, 10000000000, 0, 0, v90);
    upgradeUserControllableViewsRateLimiter = v28->_upgradeUserControllableViewsRateLimiter;
    v28->_upgradeUserControllableViewsRateLimiter = v63;

    v65 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]([CKKSNearFutureScheduler alloc], "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("octagon-retry-fixup"), 10000000000, 600000000000, 0, 0, &stru_1002DD770, 2.0);
    fixupRetryScheduler = v28->_fixupRetryScheduler;
    v28->_fixupRetryScheduler = v65;

    v28->_shouldSendMetricsForOctagon = 0;
    v67 = [CKKSNearFutureScheduler alloc];
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_1000F761C;
    v88[3] = &unk_1002EB598;
    objc_copyWeak(&v89, &location);
    v68 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v67, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("ensure-metrics-off"), 3600000000000, 0, 1, 0, v88);
    checkMetricsTrigger = v28->_checkMetricsTrigger;
    v28->_checkMetricsTrigger = v68;

    objc_destroyWeak(&v89);
    objc_destroyWeak(&v91);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v95);
    objc_destroyWeak(&location);
  }

  return v28;
}

- (void)clearCKKS
{
  -[OTCuttlefishContext setCkks:](self, "setCkks:", 0);
}

- (void)resetCKKS:(id)a3
{
  -[OTCuttlefishContext setCkks:](self, "setCkks:", a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)OTCuttlefishContext;
  -[OTCuttlefishContext dealloc](&v2, "dealloc");
}

- (void)notifyTrustChanged:(int)a3
{
  const void *v5;
  NSObject *v6;
  const __CFString *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  const __CFString *v13;

  v5 = sub_10000EF14("octagon");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Untrusted");
    if (a3 == 2)
      v7 = CFSTR("Trusted");
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Changing trust status to: %@", (uint8_t *)&v12, 0xCu);
  }

  if (!-[OTSOSActualAdapter sosEnabled]_0())
  {
    v8 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", kSOSCCCircleChangedNotification));
    -[objc_class post:](v8, "post:", v9);

  }
  v10 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.security.octagon.trust-status-change"));
  -[objc_class post:](v10, "post:", v11);

}

- (void)accountStateUpdated:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  void *v39;
  unsigned int v40;
  const void *v41;
  NSObject *v42;
  objc_class *v43;
  uint8_t v44[16];
  uint8_t v45[8];
  id v46;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "icloudAccountState") == 2
    && objc_msgSend(v7, "icloudAccountState") != 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    objc_msgSend(v8, "addEvent:", CFSTR("iCloudAccount"));

  }
  if (objc_msgSend(v6, "trustState") == 2 && objc_msgSend(v7, "trustState") != 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    objc_msgSend(v9, "addEvent:", CFSTR("Trusted"));

  }
  if (objc_msgSend(v6, "trustState") != 2 && objc_msgSend(v7, "trustState") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    objc_msgSend(v10, "addEvent:", CFSTR("Untrusted"));

    -[OTCuttlefishContext notifyTrustChanged:](self, "notifyTrustChanged:", objc_msgSend(v6, "trustState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceInformationAdapter"));
    v13 = objc_msgSend(v12, "isHomePod");

    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Trust transition from TRUSTED to some other state, posting TTR", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deviceInformationAdapter"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "serialNumber"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("serial"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceInformationAdapter"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "deviceName"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("name"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceInformationAdapter"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "osVersion"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("os_version"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceInformationAdapter"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "modelID"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("model_id"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerID"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("peer_id"));

      v46 = 0;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v17, 2, &v46));
      v15 = v46;
      if (v31)
        v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v31, 4);
      else
        v32 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error while serializing identifiers: %@"), v15));
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tapToRadarAdapter](self, "tapToRadarAdapter"));
      objc_msgSend(v34, "postHomePodLostTrustTTR:", v33);

    }
    else if (v16)
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Trust transition from TRUSTED to UNTRUSTED on a non-homepod", v45, 2u);
    }

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syncingPolicy"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "syncingPolicy"));
  v37 = objc_msgSend(v35, "isEqualToData:", v36);

  if ((v37 & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getTPSyncingPolicy"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getTPSyncingPolicy"));
    v40 = objc_msgSend(v38, "syncUserControllableViews");
    if (v40 != objc_msgSend(v39, "syncUserControllableViews"))
    {
      v41 = sub_10000EF14("octagon-ucv");
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "User controllable view state changed; posting notification",
          v44,
          2u);
      }

      v43 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
      -[objc_class post:](v43, "post:", OTUserControllableViewStatusChanged);
    }

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OTCuttlefishContext: %@, %@>"), v3, v4));

  return (NSString *)v5;
}

- (void)notificationOfMachineIDListChange
{
  const void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "machine ID list notification -- refreshing device list", v5, 2u);
  }

  -[OTCuttlefishContext requestTrustedDeviceListRefresh](self, "requestTrustedDeviceListRefresh");
}

- (BOOL)canSendMetricsUsingAccountState:(int)a3
{
  return a3 != 2;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  AAFAnalyticsEventSecurity *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AAFAnalyticsEventSecurity *v16;
  void *v17;
  void *v18;
  void *v19;
  AAFAnalyticsEventSecurity *v20;
  uint64_t v21;
  _QWORD v22[4];
  AAFAnalyticsEventSecurity *v23;
  _QWORD block[4];
  id v25;
  OTCuttlefishContext *v26;
  uint8_t buf[4];
  id v28;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7000;
  block[3] = &unk_1002E9728;
  v7 = v5;
  v25 = v7;
  v26 = self;
  dispatch_sync(v6, block);

  if (objc_msgSend(v7, "accountStatus") != (id)1)
  {
    v8 = sub_10000EF14("octagon");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Informed that the CK account is now unavailable: %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
    v11 = [AAFAnalyticsEventSecurity alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "altDSID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flowID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceSessionID"));
    LOBYTE(v21) = -[OTCuttlefishContext canSendMetricsUsingAccountState:](self, "canSendMetricsUsingAccountState:", -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon"));
    v16 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v11, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v13, v14, v15, CFSTR("com.apple.security.cloudKitAccountAvailability"), 0, v21, &off_10030AF70);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("cloudkit-account-gone"), CFSTR("WaitingForCloudKitAccount")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000F7454;
    v22[3] = &unk_1002DD798;
    v23 = v16;
    v20 = v16;
    objc_msgSend(v17, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("cloudkit-account-gone"), v18, v19, v22);

  }
}

- (BOOL)accountAvailable:(id)a3 error:(id *)a4
{
  id v6;
  const void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  OTCuttlefishContext *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  OTCuttlefishContext *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  const void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  OTCuttlefishContext *v38;
  void *v39;
  void *v40;
  const void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  const void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v51;
  OTCuttlefishContext *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  OTCuttlefishContext *v60;

  v6 = a3;
  v7 = sub_10000EF14("octagon");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v58 = v6;
    v59 = 2112;
    v60 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Account available with altDSID: %@ %@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
  objc_msgSend(v9, "setFirstLaunch:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountsAdapter](self, "accountsAdapter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext personaAdapter](self, "personaAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  v56 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "findAccountForCurrentThread:optionalAltDSID:cloudkitContainerName:octagonContextID:error:", v11, v6, v12, v13, &v56));
  v15 = (OTCuttlefishContext *)v56;
  -[OTCuttlefishContext setActiveAccount:](self, "setActiveAccount:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v52 = v15;
  if (!v16 || v15)
  {
    v41 = sub_10000EF14("SecError");
    v23 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
      *(_DWORD *)buf = 138412546;
      v58 = v42;
      v59 = 2112;
      v60 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon-account: unable to determine active account for context(%@). Issues ahead: %@", buf, 0x16u);

    }
  }
  else
  {
    v51 = v6;
    v17 = sub_10000EF14("octagon-account");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
      v20 = (OTCuttlefishContext *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      *(_DWORD *)buf = 138412546;
      v58 = v19;
      v59 = 2112;
      v60 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found a new account (%@): %@", buf, 0x16u);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    objc_msgSend(v21, "changeActiveAccount:", v22);

    v23 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject operationDependencies](v23, "operationDependencies"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "activeAccount"));
    if (v25)
    {
      v26 = (void *)v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "operationDependencies"));
      v29 = a4;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "activeAccount"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v32 = objc_msgSend(v30, "isEqual:", v31);

      a4 = v29;
      v6 = v51;
      if ((v32 & 1) != 0)
        goto LABEL_16;
      v33 = sub_10000EF14("ckks-account");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "operationDependencies"));
        v38 = (OTCuttlefishContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activeAccount"));
        *(_DWORD *)buf = 138412546;
        v58 = v35;
        v59 = 2112;
        v60 = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Updating CKKS's idea of account to %@; old: %@",
          buf,
          0x16u);

      }
      v23 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "operationDependencies"));
      objc_msgSend(v40, "setActiveAccount:", v23);

    }
    else
    {

    }
  }

LABEL_16:
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000F6FD0;
  v54[3] = &unk_1002EAF10;
  v44 = v6;
  v55 = v44;
  v53 = 0;
  objc_msgSend(v43, "persistAccountChanges:error:", v54, &v53);
  v45 = v53;

  if (v45)
  {
    v46 = sub_10000EF14("SecError");
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v45;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "octagon: unable to persist new account availability: %@", buf, 0xCu);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    objc_msgSend(v48, "handleFlag:", CFSTR("account_available"));

    if (a4)
      *a4 = objc_retainAutorelease(v45);
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    objc_msgSend(v49, "handleFlag:", CFSTR("account_available"));

  }
  return v45 == 0;
}

- (void)moveToCheckTrustedState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v4, "recheck");

  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v5, "handleFlag:", CFSTR("check_trust_state"));

}

- (BOOL)idmsTrustLevelChanged:(id *)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine", a3));
  objc_msgSend(v3, "handleFlag:", CFSTR("idms_level"));

  return 1;
}

- (BOOL)accountNoLongerAvailable
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v4, "recheck");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v5, "handleFlag:", CFSTR("apple_account_signed_out"));

  return 1;
}

- (int64_t)getCDPStatus:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  const void *v7;
  NSObject *v8;
  int64_t v9;
  unsigned int v10;
  const void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v16 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loadOrCreateAccountMetadata:", &v16));
  v6 = v16;

  if (v6)
  {
    v7 = sub_10000EF14("octagon-cdp-status");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "error fetching account metadata: %@", buf, 0xCu);
    }

    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    v10 = objc_msgSend(v5, "cdpState");
    if (v10 == 2)
      v9 = 2;
    else
      v9 = v10 == 1;
    v11 = sub_10000EF14("octagon-cdp-status");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = OTCDPStatusToString(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "current cdp status is: %@", buf, 0xCu);

    }
  }

  return v9;
}

- (BOOL)setCDPEnabled:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v13 = 0;
  objc_msgSend(v5, "persistAccountChanges:error:", &stru_1002DD7B8, &v13);
  v6 = v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v7, "handleFlag:", CFSTR("cdp_enabled"));

  if (v6)
  {
    v8 = sub_10000EF14("SecError");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "octagon-cdp-status: unable to persist CDP enablement: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    v10 = sub_10000EF14("octagon-cdp-status");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully set CDP status bit to 'enabled''", buf, 2u);
    }

  }
  return v6 == 0;
}

- (void)localReset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v4 = a3;
  v17 = CFSTR("LocalReset");
  v15 = CFSTR("LocalResetClearLocalContextState");
  v13 = CFSTR("Initializing");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v14 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v16 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonAllStates](OTStates, "OctagonAllStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v12 = objc_msgSend(v11, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("local-reset-watcher"), v10, v9, v4);

}

- (id)establishStatePathDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;

  v39 = CFSTR("EstablishEnableCDPBit");
  v37 = CFSTR("ReEnactDeviceList");
  v35 = CFSTR("ReEnactPrepare");
  v33 = CFSTR("ResetAndEstablishClearLocalContextState");
  v31 = CFSTR("ReEnactReadyToEstablish");
  v29[0] = CFSTR("EscrowTriggerUpdate");
  v27 = CFSTR("BecomeReady");
  v25 = CFSTR("Ready");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v26 = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v28 = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v29[1] = CFSTR("EstablishCKKSReset");
  v30[0] = v14;
  v23 = CFSTR("EstablishAfterCKKSReset");
  v21 = CFSTR("EscrowTriggerUpdate");
  v19 = CFSTR("BecomeReady");
  v17 = CFSTR("Ready");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v18 = v13;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v20 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v22 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v24 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v30[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v32 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v34 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v36 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  v38 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v40 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));

  return v11;
}

- (void)rpcEstablish:(id)a3 reply:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext establishStatePathDictionary](self, "establishStatePathDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
  v9 = objc_msgSend(v7, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("establish"), v8, v6, v10);

}

- (void)rpcReset:(int64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;

  v6 = a4;
  self->_resetReason = a3;
  v25 = CFSTR("CuttlefishReset");
  v23 = CFSTR("CKKSResetAfterOctagonReset");
  v21 = CFSTR("LocalReset");
  v19 = CFSTR("LocalResetClearLocalContextState");
  v17 = CFSTR("Initializing");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v20 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v24 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v26 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
  v16 = objc_msgSend(v14, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-reset"), v15, v13, v6);

}

- (void)rpcResetAndEstablish:(int64_t)a3 reply:(id)a4
{
  -[OTCuttlefishContext rpcResetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:](self, "rpcResetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", a3, 0, 0, 0, 0, a4);
}

- (id)mergedAccountSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
  v6 = objc_alloc_init((Class)OTAccountSettings);
  if (objc_msgSend(v4, "hasWalrus"))
    v7 = v4;
  else
    v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "walrus"));
  objc_msgSend(v6, "setWalrus:", v8);

  if (objc_msgSend(v4, "hasWebAccess"))
    v9 = v4;
  else
    v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "webAccess"));
  objc_msgSend(v6, "setWebAccess:", v10);

  return v6;
}

- (void)rpcResetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 reply:(id)a8
{
  NSString *v14;
  NSString *v15;
  id v16;
  NSString *idmsTargetContext;
  NSString *v18;
  id v19;
  NSString *idmsCuttlefishPassword;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;

  v14 = (NSString *)a4;
  v15 = (NSString *)a5;
  v16 = a8;
  idmsTargetContext = self->_idmsTargetContext;
  self->_resetReason = a3;
  self->_idmsTargetContext = v14;
  v18 = v14;
  v19 = a7;

  idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
  self->_idmsCuttlefishPassword = v15;
  v21 = v15;

  self->_notifyIdMS = a6;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext mergedAccountSettings:](self, "mergedAccountSettings:", v19));

  -[OTCuttlefishContext setAccountSettings:](self, "setAccountSettings:", v22);
  v35 = CFSTR("ResetBecomeUntrusted");
  v33 = CFSTR("ResetAnyMissingTLKCKKSViews");
  v31 = CFSTR("ResetAndEstablish");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext establishStatePathDictionary](self, "establishStatePathDictionary"));
  v32 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v34 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v36 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));

  v30 = objc_msgSend(v28, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-reset-and-establish"), v29, v27, v16);
}

- (void)rpcLeaveClique:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const void *v12;
  NSObject *v13;
  OTLeaveCliqueOperation *v14;
  void *v15;
  OTLeaveCliqueOperation *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v6 = objc_msgSend(v5, "isPaused");

  if (!v6)
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonNotInCliqueStates](OTStates, "OctagonNotInCliqueStates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
  v11 = objc_msgSend(v7, "intersectsSet:", v10);

  if (v11)
  {
    v12 = sub_10000EF14("octagon-leave-clique");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "device is not in clique to begin with - returning", v19, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
LABEL_6:
    v14 = [OTLeaveCliqueOperation alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLeaveCliqueOperation initWithDependencies:intendedState:errorState:](v14, "initWithDependencies:intendedState:errorState:", v15, CFSTR("BecomeUntrusted"), CFSTR("CheckTrustState"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
    objc_msgSend(v17, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("leave-clique"), v16, v18, v4);

  }
}

- (void)rpcRemoveFriendsInClique:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTRemovePeersOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  OTRemovePeersOperation *v12;

  v6 = a4;
  v7 = a3;
  v8 = [OTRemovePeersOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v12 = -[OTRemovePeersOperation initWithDependencies:intendedState:errorState:peerIDs:](v8, "initWithDependencies:intendedState:errorState:peerIDs:", v9, CFSTR("BecomeReady"), CFSTR("BecomeReady"), v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v11, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("remove-friends"), v12, v10, v6);

}

- (id)prepareInformation
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  OTDeviceInformation *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v4 = objc_msgSend(v3, "isMachineIDOverridden");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getOverriddenMachineID"));

    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altDSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flowID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceSessionID"));
    v31 = 0;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "machineID:flowID:deviceSessionID:canSendMetrics:error:", v11, v12, v13, -[OTCuttlefishContext canSendMetricsUsingAccountState:](self, "canSendMetricsUsingAccountState:", -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon")), &v31));
    v7 = v31;

  }
  v30 = (void *)v6;
  if (!v6 || v7)
  {
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon: Unable to fetch machine ID; expect signin to fail: %@",
        buf,
        0xCu);
    }

  }
  v26 = [OTDeviceInformation alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "modelID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceName"));
  v28 = v7;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serialNumber"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "osVersion"));
  v27 = -[OTDeviceInformation initForContainerName:contextID:epoch:machineID:modelID:deviceName:serialNumber:osVersion:](v26, "initForContainerName:contextID:epoch:machineID:modelID:deviceName:serialNumber:osVersion:", v16, v17, 0, v30, v18, v20, v22, v24);

  return v27;
}

- (id)operationDependencies
{
  void *v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OTOperationDependencies *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
  v22 = [OTOperationDependencies alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext octagonAdapter](self, "octagonAdapter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountsAdapter](self, "accountsAdapter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext personaAdapter](self, "personaAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v5 = -[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass");
  v6 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
  v21 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "flowID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceSessionID"));
  LOBYTE(v3) = -[OTCuttlefishContext canSendMetricsUsingAccountState:](self, "canSendMetricsUsingAccountState:", -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext reachabilityTracker](self, "reachabilityTracker"));
  LOBYTE(v11) = (_BYTE)v3;
  v23 = -[OTOperationDependencies initForContainer:contextID:activeAccount:stateHolder:flagHandler:sosAdapter:octagonAdapter:accountsAdapter:authKitAdapter:personaAdapter:deviceInfoAdapter:ckksAccountSync:lockStateTracker:cuttlefishXPCWrapper:escrowRequestClass:notifierClass:flowID:deviceSessionID:permittedToSendMetrics:reachabilityTracker:](v22, "initForContainer:contextID:activeAccount:stateHolder:flagHandler:sosAdapter:octagonAdapter:accountsAdapter:authKitAdapter:personaAdapter:deviceInfoAdapter:ckksAccountSync:lockStateTracker:cuttlefishXPCWrapper:escrowRequestClass:notifierClass:flowID:deviceSessionID:permittedToSendMetrics:reachabilityTracker:", v27, v26, v25, v20, v19, v18, v24, v14, v13, v17, v12, v16, v15, v4, v5,
          v6,
          v7,
          v8,
          v11,
          v9);

  return v23;
}

- (void)startOctagonStateMachine
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "startOperation");

}

- (void)handlePairingRestart:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  const void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  NSObject *v18;
  dispatch_time_t v19;
  const void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext pairingUUID](self, "pairingUUID"));

  if (!v5)
  {
    v6 = sub_10000EF14("octagon-pairing");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingUUID"));
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received new pairing UUID (%@)", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingUUID"));
    -[OTCuttlefishContext setPairingUUID:](self, "setPairingUUID:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext pairingUUID](self, "pairingUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingUUID"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = sub_10000EF14("octagon-pairing");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext pairingUUID](self, "pairingUUID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingUUID"));
      *(_DWORD *)buf = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "current pairing UUID (%@) does not match config UUID (%@)", buf, 0x16u);

    }
    v17 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000F6E70;
    v22[3] = &unk_1002DD7E0;
    v22[4] = self;
    v23 = v4;
    v18 = v17;
    v24 = v18;
    -[OTCuttlefishContext localReset:](self, "localReset:", v22);
    v19 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v18, v19))
    {
      v20 = sub_10000EF14("SecError");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "octagon: Timed out waiting for local reset to complete", buf, 2u);
      }

    }
  }

}

- (void)clearPairingUUID
{
  -[OTCuttlefishContext setPairingUUID:](self, "setPairingUUID:", 0);
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  uint64_t v15;
  OTPrepareOperation *v16;
  void *v18;
  void *v19;
  id v20;
  const void *v21;
  NSObject *v22;
  const void *v23;
  NSObject *v24;
  const void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _BOOL4 v31;
  const void *v32;
  NSObject *v33;
  void *v34;
  OTDetermineCDPBitStatusOperation *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  OTUpdateTPHOperation *v41;
  const void *v42;
  NSObject *v43;
  OTUpdateTPHOperation *v44;
  OctagonCheckTrustStateOperation *v45;
  OTModifyUserControllableViewStatusOperation *v46;
  OTModifyUserControllableViewStatusOperation *v47;
  void *v48;
  uint64_t v49;
  OTModifyUserControllableViewStatusOperation *v50;
  OTModifyUserControllableViewStatusOperation *v51;
  OTSetAccountSettingsOperation *v52;
  void *v53;
  const void *v54;
  NSObject *v55;
  void *v56;
  unsigned int v57;
  const void *v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  unsigned int v62;
  const void *v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  unsigned int v67;
  const void *v68;
  _BOOL4 v69;
  const void *v70;
  NSObject *v71;
  const void *v72;
  NSObject *v73;
  const void *v74;
  NSObject *v75;
  OTUpdateTPHOperation *v76;
  void *v77;
  const void *v78;
  NSObject *v79;
  OTDetermineCDPCapableAccountStatusOperation *v80;
  void *v81;
  const void *v82;
  NSObject *v83;
  OTResetOperation *v84;
  void *v85;
  void *v86;
  int64_t resetReason;
  void *v88;
  void *v89;
  OTLocalCKKSResetOperation *v90;
  void *v91;
  const void *v92;
  NSObject *v93;
  OTLocalResetOperation *v94;
  void *v95;
  const void *v96;
  NSObject *v97;
  OTLocalResetOperation *v98;
  void *v99;
  OTLocalResetOperation *v100;
  void *v101;
  const void *v102;
  NSObject *v103;
  void *v104;
  unsigned int v105;
  OTEnsureOctagonKeyConsistency *v106;
  void *v107;
  const void *v108;
  NSObject *v109;
  void *v110;
  unsigned int v111;
  void *v112;
  __CFString *v113;
  __CFString *v114;
  const void *v115;
  NSObject *v116;
  OTSOSUpdatePreapprovalsOperation *v117;
  void *v118;
  OTDetermineCDPBitStatusOperation *v119;
  void *v120;
  const void *v121;
  NSObject *v122;
  OTSOSUpgradeOperation *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  __CFString *v128;
  OTPreloadOctagonKeysOperation *v129;
  void *v130;
  OTLocalCKKSResetOperation *v131;
  void *v132;
  OTSOSUpgradeOperation *v133;
  void *v134;
  void *v135;
  void *v136;
  OTStashAccountSettingsOperation *v137;
  void *v138;
  OTPrepareOperation *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  OTPrepareOperation *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  OTPrepareOperation *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  OTVouchWithBottleOperation *v154;
  void *v155;
  OTVouchWithRecoveryKeyOperation *v156;
  void *v157;
  void *v158;
  OTVouchWithCustodianRecoveryKeyOperation *v159;
  void *v160;
  void *v161;
  OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  OTJoinSOSAfterCKKSFetchOperation *v167;
  void *v168;
  OTSetCDPBitOperation *v169;
  void *v170;
  OTUpdateTrustedDeviceListOperation *v171;
  void *v172;
  OTJoinWithVoucherOperation *v173;
  void *v174;
  OTLocalCKKSResetOperation *v175;
  void *v176;
  OTJoinWithVoucherOperation *v177;
  void *v178;
  void *v179;
  int64_t v180;
  NSString *idmsTargetContext;
  _BOOL8 notifyIdMS;
  void *v183;
  void *v184;
  OTResetCKKSZonesLackingTLKsOperation *v185;
  void *v186;
  OTSetCDPBitOperation *v187;
  void *v188;
  OTUpdateTrustedDeviceListOperation *v189;
  void *v190;
  OTPrepareOperation *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  const void *v196;
  NSObject *v197;
  OTEstablishOperation *v198;
  void *v199;
  OTLocalCKKSResetOperation *v200;
  void *v201;
  OTEstablishOperation *v202;
  void *v203;
  OTTriggerEscrowUpdateOperation *v204;
  void *v205;
  OTLeaveCliqueOperation *v206;
  void *v207;
  void *v208;
  void *v209;
  OctagonPendingFlag *v210;
  const void *v211;
  NSObject *v212;
  OTSOSUpdatePreapprovalsOperation *v213;
  void *v214;
  OTUploadNewCKKSTLKsOperation *v215;
  void *v216;
  OTLocalCKKSResetOperation *v217;
  void *v218;
  OTUploadNewCKKSTLKsOperation *v219;
  void *v220;
  OTStashAccountSettingsOperation *v221;
  void *v222;
  OTPrepareOperation *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  OTVouchWithRerollOperation *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  const void *v235;
  NSObject *v236;
  OTUpdateTPHOperation *v237;
  void *v238;
  const void *v239;
  NSObject *v240;
  OTUpdateTrustedDeviceListOperation *v241;
  void *v242;
  void *v243;
  unsigned int v244;
  const void *v245;
  NSObject *v246;
  _BOOL4 v247;
  void *v248;
  unsigned int v249;
  const void *v250;
  NSObject *v251;
  _BOOL4 v252;
  const void *v253;
  NSObject *v254;
  const void *v255;
  NSObject *v256;
  const void *v257;
  NSObject *v258;
  const void *v259;
  NSObject *v260;
  const void *v261;
  NSObject *v262;
  const void *v263;
  NSObject *v264;
  uint64_t v265;
  NSString *idmsCuttlefishPassword;
  OTResetOperation *v267;
  void *v268;
  _QWORD v269[4];
  id v270;
  _BYTE buf[24];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
  objc_msgSend(v12, "addEvent:", v8);

  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("apple_account_signed_out")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("apple_account_signed_out"));
    v13 = sub_10000EF14("octagon");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "handling apple account signed out flag", buf, 2u);
    }

    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext appleAccountSignOutOperation](self, "appleAccountSignOutOperation"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Initializing")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext initializingOperation](self, "initializingOperation"));
LABEL_7:
    v16 = (OTPrepareOperation *)v15;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WaitForCDPCapableSecurityLevel")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("idms_level")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("idms_level"));
      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("cdp-capable-check"), CFSTR("DetermineiCloudAccountState")));
      goto LABEL_7;
    }
    v23 = sub_10000EF14("octagon");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting for an CDP Capable account", buf, 2u);
    }

LABEL_31:
    v16 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WaitingForCloudKitAccount")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
      v20 = objc_msgSend(v19, "accountStatus");

      if (v20 == (id)1)
      {
        v21 = sub_10000EF14("octagon");
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CloudKit reports an account is available!", buf, 2u);
        }

        v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ck-available"), CFSTR("CloudKitNewlyAvailable")));
        goto LABEL_7;
      }
    }
    v25 = sub_10000EF14("octagon");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
      v28 = (void *)v27;
      v29 = CFSTR("uninitialized");
      if (v27)
        v29 = (const __CFString *)v27;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Waiting for a CloudKit account; current state is %@",
        buf,
        0xCu);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
    v31 = v30 == 0;

    if (v31)
    {
      v32 = sub_10000EF14("octagon");
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Asking for a real CK account state", buf, 2u);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountStateTracker](self, "accountStateTracker"));
      objc_msgSend(v34, "recheckCKAccountStatus");

    }
    goto LABEL_31;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CloudKitNewlyAvailable")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountNewlyAvailableOperation:](self, "cloudKitAccountNewlyAvailableOperation:", CFSTR("DetermineCDPState")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("DetermineCDPState")))
  {
    v35 = [OTDetermineCDPBitStatusOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v37 = CFSTR("CheckForAccountFixups");
LABEL_34:
    v38 = CFSTR("WaitForCDP");
LABEL_35:
    v39 = v35;
    v40 = v36;
LABEL_36:
    v41 = (OTUpdateTPHOperation *)objc_msgSend(v39, "initWithDependencies:intendedState:errorState:", v40, v37, v38);
LABEL_37:
    v16 = (OTPrepareOperation *)v41;
LABEL_38:

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WaitForCDP")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("cdp_enabled")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("cdp_enabled"));
      v42 = sub_10000EF14("octagon");
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "CDP is newly available!", buf, 2u);
      }

      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("cdp_enabled"), CFSTR("DetermineiCloudAccountState")));
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("recd_push")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("recd_push"));
      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("cdp_enabled_push_received"), CFSTR("WaitForCDPUpdated")));
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("pending_network_availablility")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("pending_network_availablility"));
      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("check_cdp_status_upon_network_availability"), CFSTR("WaitForCDPUpdated")));
      goto LABEL_7;
    }
    goto LABEL_31;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WaitForCDPUpdated")))
  {
    v44 = [OTUpdateTPHOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v41 = -[OTUpdateTPHOperation initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:](v44, "initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:", v36, CFSTR("DetermineCDPState"), 0, CFSTR("DetermineCDPState"), CFSTR("DetermineCDPState"), 0, CFSTR("recd_push"));
    goto LABEL_37;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CheckForAccountFixups")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext checkForAccountFixupsOperation:](self, "checkForAccountFixupsOperation:", CFSTR("PerformAccountFixups")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PerformAccountFixups")))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("fixups-complete"), CFSTR("CheckTrustState")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CheckTrustState")))
  {
    v45 = [OctagonCheckTrustStateOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v37 = CFSTR("BecomeUntrusted");
    v39 = v45;
    v40 = v36;
    v38 = CFSTR("BecomeUntrusted");
    goto LABEL_36;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CDPHealthCheck")))
  {
    v35 = [OTDetermineCDPBitStatusOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v37 = CFSTR("SecurityTrustCheck");
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SecurityTrustCheck")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext evaluateSecdOctagonTrust](self, "evaluateSecdOctagonTrust"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TPHTrustCheck")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext evaluateTPHOctagonTrust](self, "evaluateTPHOctagonTrust"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CuttlefishTrustCheck")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishTrustEvaluation](self, "cuttlefishTrustEvaluation"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PostRepairCFU")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext postRepairCFUAndBecomeUntrusted](self, "postRepairCFUAndBecomeUntrusted"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HealthCheckReset")))
  {
    self->_resetReason = 2;
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("begin-reset"), CFSTR("ResetBecomeUntrusted")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("BecomeUntrusted")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext becomeUntrustedOperation:](self, "becomeUntrustedOperation:", CFSTR("Untrusted")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("BecomeReady")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext becomeReadyOperation](self, "becomeReadyOperation"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("RefetchCKKSPolicy")))
  {
    v35 = [OTFetchViewsOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v37 = CFSTR("BecomeReady");
    v38 = CFSTR("Error");
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EnableUserControllableViews")))
  {
    v46 = [OTModifyUserControllableViewStatusOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v47 = v46;
    v48 = v36;
    v49 = 2;
LABEL_80:
    v41 = -[OTModifyUserControllableViewStatusOperation initWithDependencies:intendedViewStatus:intendedState:peerMissingState:errorState:](v47, "initWithDependencies:intendedViewStatus:intendedState:peerMissingState:errorState:", v48, v49, CFSTR("BecomeReady"), CFSTR("ReadyUpdated"), CFSTR("BecomeReady"));
    goto LABEL_37;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("DisableUserControllableViews")))
  {
    v50 = [OTModifyUserControllableViewStatusOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v47 = v50;
    v48 = v36;
    v49 = 1;
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SetUserControllableViewsToPeerConsensus")))
  {
    v51 = [OTModifyUserControllableViewStatusOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v47 = v51;
    v48 = v36;
    v49 = 3;
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SetAccountSettings")))
  {
    v52 = [OTSetAccountSettingsOperation alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v16 = -[OTSetAccountSettingsOperation initWithDependencies:intendedState:errorState:settings:](v52, "initWithDependencies:intendedState:errorState:settings:", v36, CFSTR("BecomeReady"), CFSTR("CheckTrustState"), v53);

    goto LABEL_38;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("NoAccount"))
    && objc_msgSend(v9, "_onqueueContains:", CFSTR("account_available")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("account_available"));
    v54 = sub_10000EF14("octagon");
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Account is available!  Attempting initializing op!", buf, 2u);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("account-probably-present"), CFSTR("Initializing")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Untrusted")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("preapproved")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("preapproved"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
      v57 = objc_msgSend(v56, "sosEnabled");

      v58 = sub_10000EF14("octagon");
      v59 = objc_claimAutoreleasedReturnValue(v58);
      v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if (v57)
      {
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Preapproved flag is high. Attempt SOS upgrade again!", buf, 2u);
        }

        v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ck-available"), CFSTR("AttemptSOSUpgrade")));
        goto LABEL_7;
      }
      if (v60)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "We are untrusted, but it seems someone preapproves us now. Unfortunately, this platform doesn't support SOS.", buf, 2u);
      }

    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("attempt_sos_upgrade")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("attempt_sos_upgrade"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
      v62 = objc_msgSend(v61, "sosEnabled");

      v63 = sub_10000EF14("octagon");
      v64 = objc_claimAutoreleasedReturnValue(v63);
      v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      if (v62)
      {
        if (v65)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Attempt SOS upgrade again!", buf, 2u);
        }
LABEL_101:

        v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("attempt-sos-upgrade"), CFSTR("AttemptSOSUpgrade")));
        goto LABEL_7;
      }
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "We are untrusted, but this platform doesn't support SOS.", buf, 2u);
      }

    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("attempt_sos_consistency")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("attempt_sos_consistency"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
      v67 = objc_msgSend(v66, "sosEnabled");

      v68 = sub_10000EF14("octagon");
      v64 = objc_claimAutoreleasedReturnValue(v68);
      v69 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      if (v67)
      {
        if (v69)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Attempting SOS upgrade again (due to a consistency notification)", buf, 2u);
        }
        goto LABEL_101;
      }
      if (v69)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Someone would like us to check SOS consistency, but this platform doesn't support SOS.", buf, 2u);
      }

    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("recd_push")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("recd_push"));
      v70 = sub_10000EF14("octagon");
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Updating TPH (while untrusted) due to push", buf, 2u);
      }

      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("untrusted-update"), CFSTR("UntrustedUpdated")));
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("idms_level")))
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("idms_level"));
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("cdp_enabled")))
    {
      v72 = sub_10000EF14("octagon");
      v73 = objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Removing 'CDP enabled' flag", buf, 2u);
      }

      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("cdp_enabled"));
    }
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("check_trust_state")))
    {
      v74 = sub_10000EF14("octagon");
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Checking trust state", buf, 2u);
      }

      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("check_trust_state"));
      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("check-trust-state"), CFSTR("CheckTrustState")));
      goto LABEL_7;
    }
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("UntrustedUpdated")))
  {
    v76 = [OTUpdateTPHOperation alloc];
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTUpdateTPHOperation initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:](v76, "initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:", v77, CFSTR("Untrusted"), CFSTR("PeerMissingFromServer"), 0, CFSTR("Untrusted"), 0, CFSTR("recd_push"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("DetermineiCloudAccountState")))
  {
    v78 = sub_10000EF14("octagon");
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Determine iCloud account status", buf, 2u);
    }

    v80 = [OTDetermineCDPCapableAccountStatusOperation alloc];
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTDetermineCDPCapableAccountStatusOperation initWithDependencies:stateIfCDPCapable:stateIfNotCDPCapable:stateIfNoAccount:errorState:](v80, "initWithDependencies:stateIfCDPCapable:stateIfNotCDPCapable:stateIfNoAccount:errorState:", v81, CFSTR("Initializing"), CFSTR("WaitForCDPCapableSecurityLevel"), CFSTR("NoAccount"), CFSTR("Error"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CuttlefishReset")))
  {
    v82 = sub_10000EF14("octagon");
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Resetting cuttlefish", buf, 2u);
    }

    v84 = [OTResetOperation alloc];
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    resetReason = self->_resetReason;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v16 = -[OTResetOperation init:contextID:reason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:intendedState:dependencies:errorState:cuttlefishXPCWrapper:](v84, "init:contextID:reason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:intendedState:dependencies:errorState:cuttlefishXPCWrapper:", v85, v86, resetReason, 0, 0, 0, CFSTR("CKKSResetAfterOctagonReset"), v88, CFSTR("Error"), v89);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CKKSResetAfterOctagonReset")))
  {
    v90 = [OTLocalCKKSResetOperation alloc];
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalCKKSResetOperation initWithDependencies:intendedState:errorState:](v90, "initWithDependencies:intendedState:errorState:", v91, CFSTR("LocalReset"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("LocalReset")))
  {
    v92 = sub_10000EF14("octagon");
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Attempting local-reset", buf, 2u);
    }

    v94 = [OTLocalResetOperation alloc];
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalResetOperation initWithDependencies:intendedState:errorState:](v94, "initWithDependencies:intendedState:errorState:", v95, CFSTR("LocalResetClearLocalContextState"), CFSTR("Initializing"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("LocalResetClearLocalContextState")))
  {
    -[OTCuttlefishContext clearContextState](self, "clearContextState");
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("move-to-initializing"), CFSTR("Initializing")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("NoAccountDoReset")))
  {
    v96 = sub_10000EF14("octagon");
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Attempting local-reset as part of signout", buf, 2u);
    }

    -[OTCuttlefishContext clearContextState](self, "clearContextState");
    v98 = [OTLocalResetOperation alloc];
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalResetOperation initWithDependencies:intendedState:errorState:](v98, "initWithDependencies:intendedState:errorState:", v99, CFSTR("NoAccount"), CFSTR("NoAccount"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PeerMissingFromServer")))
  {
    -[OTCuttlefishContext clearContextState](self, "clearContextState");
    v100 = [OTLocalResetOperation alloc];
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalResetOperation initWithDependencies:intendedState:errorState:](v100, "initWithDependencies:intendedState:errorState:", v101, CFSTR("BecomeUntrusted"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EnsureConsistency")))
  {
    v102 = sub_10000EF14("octagon");
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Ensuring consistency of things that might've changed", buf, 2u);
    }

    v104 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v105 = objc_msgSend(v104, "sosEnabled");

    if (v105)
    {
      v106 = [OTEnsureOctagonKeyConsistency alloc];
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v16 = -[OTEnsureOctagonKeyConsistency initWithDependencies:intendedState:errorState:](v106, "initWithDependencies:intendedState:errorState:", v107, CFSTR("EnsureUpdatePreapprovals"), CFSTR("BecomeReady"));

      goto LABEL_8;
    }
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("no-consistency-checks"), CFSTR("BecomeReady")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("BottlePreloadOctagonKeysInSOS")))
  {
    v108 = sub_10000EF14("octagon");
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Preloading Octagon Keys on the SOS Account", buf, 2u);
    }

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v111 = objc_msgSend(v110, "sosEnabled");

    if (!v111)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("no-preload-octagon-key"), CFSTR("SetAccountSettings")));
      goto LABEL_7;
    }
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext custodianRecoveryKey](self, "custodianRecoveryKey"));
    if (v112)
    {
      v113 = CFSTR("JoinSOSAfterCKKSFetch");
      v114 = CFSTR("JoinSOSAfterCKKSFetch");
    }
    else
    {
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext recoveryKey](self, "recoveryKey"));
      v128 = CFSTR("JoinSOSAfterCKKSFetch");
      if (!v127)
        v128 = CFSTR("SetAccountSettings");
      v113 = v128;

    }
    v129 = [OTPreloadOctagonKeysOperation alloc];
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTPreloadOctagonKeysOperation initWithDependencies:intendedState:errorState:](v129, "initWithDependencies:intendedState:errorState:", v130, v113, v113);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EnsureUpdatePreapprovals")))
  {
    v115 = sub_10000EF14("octagon");
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "SOS is enabled; ensuring preapprovals are correct",
        buf,
        2u);
    }

    v117 = [OTSOSUpdatePreapprovalsOperation alloc];
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTSOSUpdatePreapprovalsOperation initWithDependencies:intendedState:sosNotPresentState:errorState:](v117, "initWithDependencies:intendedState:sosNotPresentState:errorState:", v118, CFSTR("BecomeReady"), CFSTR("BecomeReady"), CFSTR("BecomeReady"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AttemptSOSUpgradeDetermineCDPState")))
  {
    v119 = [OTDetermineCDPBitStatusOperation alloc];
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTDetermineCDPBitStatusOperation initWithDependencies:intendedState:errorState:](v119, "initWithDependencies:intendedState:errorState:", v120, CFSTR("AttemptSOSUpgrade"), CFSTR("WaitForCDP"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AttemptSOSUpgrade")))
  {
    v121 = sub_10000EF14("octagon");
    v122 = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Investigating SOS status", buf, 2u);
    }

    v123 = [OTSOSUpgradeOperation alloc];
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v16 = -[OTSOSUpgradeOperation initWithDependencies:intendedState:ckksConflictState:errorState:deviceInfo:policyOverride:](v123, "initWithDependencies:intendedState:ckksConflictState:errorState:deviceInfo:policyOverride:", v124, CFSTR("BecomeReady"), CFSTR("SOSUpgradeCKKSReset"), CFSTR("BecomeUntrusted"), v125, v126);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SOSUpgradeCKKSReset")))
  {
    v131 = [OTLocalCKKSResetOperation alloc];
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalCKKSResetOperation initWithDependencies:intendedState:errorState:](v131, "initWithDependencies:intendedState:errorState:", v132, CFSTR("SOSUpgradeAfterCKKSReset"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SOSUpgradeAfterCKKSReset")))
  {
    v133 = [OTSOSUpgradeOperation alloc];
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v16 = -[OTSOSUpgradeOperation initWithDependencies:intendedState:ckksConflictState:errorState:deviceInfo:policyOverride:](v133, "initWithDependencies:intendedState:ckksConflictState:errorState:deviceInfo:policyOverride:", v134, CFSTR("BecomeReady"), CFSTR("BecomeUntrusted"), CFSTR("BecomeUntrusted"), v135, v136);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("OctagonStateStashAccountSettingsForRecoveryKey")))
  {
    v137 = [OTStashAccountSettingsOperation alloc];
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTStashAccountSettingsOperation initWithDependencies:intendedState:errorState:accountSettings:accountWide:forceFetch:](v137, "initWithDependencies:intendedState:errorState:accountSettings:accountWide:forceFetch:", v138, CFSTR("CreateIdentityForRecoveryKey"), CFSTR("CreateIdentityForRecoveryKey"), self, 1, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateIdentityForRecoveryKey")))
  {
    v139 = [OTPrepareOperation alloc];
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v16 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:](v139, "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:", v140, CFSTR("VouchWithRecoveryKey"), CFSTR("BecomeUntrusted"), v141, v142, v143, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateIdentityForCustodianRecoveryKey")))
  {
    v144 = [OTPrepareOperation alloc];
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v16 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:](v144, "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:", v145, CFSTR("VouchWithCustodianRecoveryKey"), CFSTR("BecomeUntrusted"), v146, v147, v148, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("BottleJoinCreateIdentity")))
  {
    v149 = [OTPrepareOperation alloc];
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v16 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:](v149, "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:", v150, CFSTR("BottleJoinVouchWithBottle"), CFSTR("BecomeUntrusted"), v151, v152, v153, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("BottleJoinVouchWithBottle")))
  {
    v154 = [OTVouchWithBottleOperation alloc];
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    LOBYTE(v265) = 1;
    v16 = -[OTVouchWithBottleOperation initWithDependencies:intendedState:errorState:bottleID:entropy:bottleSalt:saveVoucher:](v154, "initWithDependencies:intendedState:errorState:bottleID:entropy:bottleSalt:saveVoucher:", v155, CFSTR("InitiatorSetCDPBit"), CFSTR("BecomeUntrusted"), self->_bottleID, self->_entropy, self->_bottleSalt, v265);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("VouchWithRecoveryKey")))
  {
    v156 = [OTVouchWithRecoveryKeyOperation alloc];
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext recoveryKey](self, "recoveryKey"));
    v16 = -[OTVouchWithRecoveryKeyOperation initWithDependencies:intendedState:errorState:recoveryKey:saveVoucher:](v156, "initWithDependencies:intendedState:errorState:recoveryKey:saveVoucher:", v157, CFSTR("InitiatorSetCDPBit"), CFSTR("BecomeUntrusted"), v158, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("VouchWithCustodianRecoveryKey")))
  {
    v159 = [OTVouchWithCustodianRecoveryKeyOperation alloc];
    v160 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext custodianRecoveryKey](self, "custodianRecoveryKey"));
    v16 = -[OTVouchWithCustodianRecoveryKeyOperation initWithDependencies:intendedState:errorState:custodianRecoveryKey:saveVoucher:](v159, "initWithDependencies:intendedState:errorState:custodianRecoveryKey:saveVoucher:", v160, CFSTR("InitiatorSetCDPBit"), CFSTR("BecomeUntrusted"), v161, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PrepareAndRecoverTLKSharesForInheritancePeer")))
  {
    v162 = [OTPrepareAndRecoverTLKSharesForInheritancePeerOperation alloc];
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext inheritanceKey](self, "inheritanceKey"));
    v165 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    LOBYTE(v265) = 1;
    v16 = -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation initWithDependencies:intendedState:errorState:ik:deviceInfo:policyOverride:isInheritedAccount:epoch:](v162, "initWithDependencies:intendedState:errorState:ik:deviceInfo:policyOverride:isInheritedAccount:epoch:", v163, CFSTR("BecomeInherited"), CFSTR("Error"), v164, v165, v166, v265, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("JoinSOSAfterCKKSFetch")))
  {
    v167 = [OTJoinSOSAfterCKKSFetchOperation alloc];
    v168 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTJoinSOSAfterCKKSFetchOperation initWithDependencies:intendedState:errorState:](v167, "initWithDependencies:intendedState:errorState:", v168, CFSTR("SetAccountSettings"), CFSTR("SetAccountSettings"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitiatorSetCDPBit")))
  {
    v169 = [OTSetCDPBitOperation alloc];
    v170 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTSetCDPBitOperation initWithDependencies:intendedState:errorState:](v169, "initWithDependencies:intendedState:errorState:", v170, CFSTR("InitiatorUpdateDeviceList"), CFSTR("DetermineCDPState"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitiatorUpdateDeviceList")))
  {
    v171 = [OTUpdateTrustedDeviceListOperation alloc];
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:](v171, "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:", v172, CFSTR("InitiatorJoin"), CFSTR("InitiatorJoin"), CFSTR("BecomeUntrusted"), 0);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitiatorJoin")))
  {
    v173 = [OTJoinWithVoucherOperation alloc];
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTJoinWithVoucherOperation initWithDependencies:intendedState:ckksConflictState:errorState:](v173, "initWithDependencies:intendedState:ckksConflictState:errorState:", v174, CFSTR("BottlePreloadOctagonKeysInSOS"), CFSTR("InitiatorJoinCKKSReset"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitiatorJoinCKKSReset")))
  {
    v175 = [OTLocalCKKSResetOperation alloc];
    v176 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalCKKSResetOperation initWithDependencies:intendedState:errorState:](v175, "initWithDependencies:intendedState:errorState:", v176, CFSTR("InitiatorJoinAfterCKKSReset"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("InitiatorJoinAfterCKKSReset")))
  {
    v177 = [OTJoinWithVoucherOperation alloc];
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTJoinWithVoucherOperation initWithDependencies:intendedState:ckksConflictState:errorState:](v177, "initWithDependencies:intendedState:ckksConflictState:errorState:", v178, CFSTR("BottlePreloadOctagonKeysInSOS"), CFSTR("BecomeUntrusted"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ResetBecomeUntrusted")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext becomeUntrustedOperation:](self, "becomeUntrustedOperation:", CFSTR("ResetAnyMissingTLKCKKSViews")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ResetAndEstablish")))
  {
    v267 = [OTResetOperation alloc];
    v268 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    v180 = self->_resetReason;
    idmsTargetContext = self->_idmsTargetContext;
    idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
    notifyIdMS = self->_notifyIdMS;
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v16 = -[OTResetOperation init:contextID:reason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:intendedState:dependencies:errorState:cuttlefishXPCWrapper:](v267, "init:contextID:reason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:intendedState:dependencies:errorState:cuttlefishXPCWrapper:", v268, v179, v180, idmsTargetContext, idmsCuttlefishPassword, notifyIdMS, CFSTR("EstablishEnableCDPBit"), v183, CFSTR("Error"), v184);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ResetAnyMissingTLKCKKSViews")))
  {
    v185 = [OTResetCKKSZonesLackingTLKsOperation alloc];
    v186 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTResetCKKSZonesLackingTLKsOperation initWithDependencies:intendedState:errorState:](v185, "initWithDependencies:intendedState:errorState:", v186, CFSTR("ResetAndEstablish"), CFSTR("Error"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EstablishEnableCDPBit")))
  {
    v187 = [OTSetCDPBitOperation alloc];
    v188 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTSetCDPBitOperation initWithDependencies:intendedState:errorState:](v187, "initWithDependencies:intendedState:errorState:", v188, CFSTR("ReEnactDeviceList"), CFSTR("Error"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ReEnactDeviceList")))
  {
    v189 = [OTUpdateTrustedDeviceListOperation alloc];
    v190 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:](v189, "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:", v190, CFSTR("ReEnactPrepare"), CFSTR("ReEnactPrepare"), CFSTR("BecomeUntrusted"), 0);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ReEnactPrepare")))
  {
    v191 = [OTPrepareOperation alloc];
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v193 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v194 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v16 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:](v191, "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:", v192, CFSTR("ResetAndEstablishClearLocalContextState"), CFSTR("Error"), v193, v194, v195, 0);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ResetAndEstablishClearLocalContextState")))
  {
    v196 = sub_10000EF14("octagon");
    v197 = objc_claimAutoreleasedReturnValue(v196);
    if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_DEFAULT, "clear cuttlefish context state", buf, 2u);
    }

    -[OTCuttlefishContext clearContextState](self, "clearContextState");
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("moving-to-re-enact-ready-to-establish"), CFSTR("ReEnactReadyToEstablish")));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ReEnactReadyToEstablish")))
  {
    v198 = [OTEstablishOperation alloc];
    v199 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTEstablishOperation initWithDependencies:intendedState:ckksConflictState:errorState:](v198, "initWithDependencies:intendedState:ckksConflictState:errorState:", v199, CFSTR("EscrowTriggerUpdate"), CFSTR("EstablishCKKSReset"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EstablishCKKSReset")))
  {
    v200 = [OTLocalCKKSResetOperation alloc];
    v201 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalCKKSResetOperation initWithDependencies:intendedState:errorState:](v200, "initWithDependencies:intendedState:errorState:", v201, CFSTR("EstablishAfterCKKSReset"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EstablishAfterCKKSReset")))
  {
    v202 = [OTEstablishOperation alloc];
    v203 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTEstablishOperation initWithDependencies:intendedState:ckksConflictState:errorState:](v202, "initWithDependencies:intendedState:ckksConflictState:errorState:", v203, CFSTR("EscrowTriggerUpdate"), CFSTR("BecomeUntrusted"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("EscrowTriggerUpdate")))
  {
    v204 = [OTTriggerEscrowUpdateOperation alloc];
    v205 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTTriggerEscrowUpdateOperation initWithDependencies:intendedState:errorState:](v204, "initWithDependencies:intendedState:errorState:", v205, CFSTR("BecomeReady"), CFSTR("Error"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HealthCheckLeaveClique")))
  {
    v206 = [OTLeaveCliqueOperation alloc];
    v207 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLeaveCliqueOperation initWithDependencies:intendedState:errorState:](v206, "initWithDependencies:intendedState:errorState:", v207, CFSTR("BecomeUntrusted"), CFSTR("BecomeUntrusted"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WaitForClassCUnlock")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("unlocked")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("unlocked"));
      v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("initializing-after-initial-unlock")));
      v16 = (OTPrepareOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", v208, CFSTR("Initializing")));

      goto LABEL_8;
    }
    goto LABEL_242;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("WaitForUnlock")))
  {
    if (objc_msgSend(v9, "_onqueueContains:", CFSTR("unlocked")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("unlocked"));
      v209 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("initializing-after-unlock")));
      v16 = (OTPrepareOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", v209, CFSTR("Initializing")));

      goto LABEL_8;
    }
LABEL_242:
    v210 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("unlocked"), 1);
    objc_msgSend(v10, "_onqueueHandlePendingFlagLater:", v210);

    goto LABEL_31;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("UpdateSOSPreapprovals")))
  {
    v211 = sub_10000EF14("octagon");
    v212 = objc_claimAutoreleasedReturnValue(v211);
    if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_DEFAULT, "Updating SOS preapprovals", buf, 2u);
    }

    v213 = [OTSOSUpdatePreapprovalsOperation alloc];
    v214 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTSOSUpdatePreapprovalsOperation initWithDependencies:intendedState:sosNotPresentState:errorState:](v213, "initWithDependencies:intendedState:sosNotPresentState:errorState:", v214, CFSTR("Ready"), CFSTR("Ready"), CFSTR("Ready"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AssistCKKSTLKUpload")))
  {
    v215 = [OTUploadNewCKKSTLKsOperation alloc];
    v216 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTUploadNewCKKSTLKsOperation initWithDependencies:intendedState:ckksConflictState:peerMissingState:errorState:](v215, "initWithDependencies:intendedState:ckksConflictState:peerMissingState:errorState:", v216, CFSTR("Ready"), CFSTR("AssistCKKSTLKUploadCKKSReset"), CFSTR("ReadyUpdated"), CFSTR("Ready"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AssistCKKSTLKUploadCKKSReset")))
  {
    v217 = [OTLocalCKKSResetOperation alloc];
    v218 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTLocalCKKSResetOperation initWithDependencies:intendedState:errorState:](v217, "initWithDependencies:intendedState:errorState:", v218, CFSTR("AssistCKKSTLKUploadAfterCKKSReset"), CFSTR("BecomeReady"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AssistCKKSTLKUploadAfterCKKSReset")))
  {
    v219 = [OTUploadNewCKKSTLKsOperation alloc];
    v220 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTUploadNewCKKSTLKsOperation initWithDependencies:intendedState:ckksConflictState:peerMissingState:errorState:](v219, "initWithDependencies:intendedState:ckksConflictState:peerMissingState:errorState:", v220, CFSTR("Ready"), CFSTR("Ready"), CFSTR("ReadyUpdated"), CFSTR("Ready"));

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("OctagonStateStashAccountSettingsForReroll")))
  {
    v221 = [OTStashAccountSettingsOperation alloc];
    v222 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTStashAccountSettingsOperation initWithDependencies:intendedState:errorState:accountSettings:accountWide:forceFetch:](v221, "initWithDependencies:intendedState:errorState:accountSettings:accountWide:forceFetch:", v222, CFSTR("OctagonStateCreateIdentityForReroll"), CFSTR("OctagonStateCreateIdentityForReroll"), self, 1, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("OctagonStateCreateIdentityForReroll")))
  {
    v223 = [OTPrepareOperation alloc];
    v224 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v225 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v226 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v227 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v16 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:](v223, "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:", v224, CFSTR("OctagonStateVouchWithReroll"), CFSTR("BecomeUntrusted"), v225, v226, v227, 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("OctagonStateVouchWithReroll")))
  {
    v228 = [OTVouchWithRerollOperation alloc];
    v229 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTVouchWithRerollOperation initWithDependencies:intendedState:errorState:saveVoucher:](v228, "initWithDependencies:intendedState:errorState:saveVoucher:", v229, CFSTR("InitiatorSetCDPBit"), CFSTR("BecomeUntrusted"), 1);

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("BecomeInherited")))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext becomeInheritedOperation](self, "becomeInheritedOperation"));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Inherited")))
    goto LABEL_263;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Ready")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("ReadyUpdated")))
    {
      v237 = [OTUpdateTPHOperation alloc];
      v238 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v16 = -[OTUpdateTPHOperation initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:](v237, "initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:", v238, CFSTR("Ready"), CFSTR("PeerMissingFromServer"), 0, CFSTR("Ready"), 0, CFSTR("recd_push"));

      goto LABEL_8;
    }
    objc_msgSend(v8, "isEqualToString:", CFSTR("Error"));
    goto LABEL_31;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("recd_push")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("recd_push"));
    v235 = sub_10000EF14("octagon");
    v236 = objc_claimAutoreleasedReturnValue(v235);
    if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v236, OS_LOG_TYPE_DEFAULT, "Updating TPH (while ready) due to push", buf, 2u);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("octagon-update"), CFSTR("ReadyUpdated")));
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("tlk_upload_needed")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("tlk_upload_needed"));
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ckks-assist"), CFSTR("AssistCKKSTLKUpload")));
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("attempt_machine_id_list")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("attempt_machine_id_list"));
    v239 = sub_10000EF14("octagon");
    v240 = objc_claimAutoreleasedReturnValue(v239);
    if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEFAULT, "Received an suggestion to update the machine ID list (while ready); updating trusted device list",
        buf,
        2u);
    }

    v241 = [OTUpdateTrustedDeviceListOperation alloc];
    v242 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:](v241, "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:", v242, CFSTR("Ready"), CFSTR("ReadyUpdated"), CFSTR("Ready"), CFSTR("attempt_machine_id_list"));

    goto LABEL_8;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("attempt_sos_update_preapprovals")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("attempt_sos_update_preapprovals"));
    v243 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v244 = objc_msgSend(v243, "sosEnabled");

    v245 = sub_10000EF14("octagon");
    v246 = objc_claimAutoreleasedReturnValue(v245);
    v247 = os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT);
    if (v244)
    {
      if (v247)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "Attempt SOS Update preapprovals again!", buf, 2u);
      }

      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("attempt-sos-update-preapproval"), CFSTR("UpdateSOSPreapprovals")));
      goto LABEL_7;
    }
    if (v247)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "We are untrusted, but this platform doesn't support SOS.", buf, 2u);
    }

  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("attempt_sos_consistency")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("attempt_sos_consistency"));
    v248 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v249 = objc_msgSend(v248, "sosEnabled");

    v250 = sub_10000EF14("octagon");
    v251 = objc_claimAutoreleasedReturnValue(v250);
    v252 = os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT);
    if (v249)
    {
      if (v252)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "Attempting SOS consistency checks", buf, 2u);
      }

      v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("attempt-sos-update-preapproval"), CFSTR("EnsureConsistency")));
      goto LABEL_7;
    }
    if (v252)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "Someone would like us to check SOS consistency, but this platform doesn't support SOS.", buf, 2u);
    }

  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("attempt_ucv_upgrade")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("attempt_ucv_upgrade"));
    v253 = sub_10000EF14("octagon");
    v254 = objc_claimAutoreleasedReturnValue(v253);
    if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_DEFAULT, "Attempting user-view control upgrade", buf, 2u);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("attempt-user-view-upgrade"), CFSTR("SetUserControllableViewsToPeerConsensus")));
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("policy_check_needed")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("policy_check_needed"));
    v255 = sub_10000EF14("octagon");
    v256 = objc_claimAutoreleasedReturnValue(v255);
    if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_DEFAULT, "Updating CKKS policy", buf, 2u);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ckks-policy-update"), CFSTR("ReadyUpdated")));
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ckks_views_changed")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ckks_views_changed"));
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("ckks-update-trust"), CFSTR("BecomeReady")));
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("se_id_changed")))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("se_id_changed"));
    v15 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("octagon-set-secureelement"), CFSTR("ReadyUpdated")));
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("account_available")))
  {
    v257 = sub_10000EF14("octagon");
    v258 = objc_claimAutoreleasedReturnValue(v257);
    if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v258, OS_LOG_TYPE_DEFAULT, "Removing 'account is available' flag", buf, 2u);
    }

    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("account_available"));
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("idms_level")))
  {
    v259 = sub_10000EF14("octagon");
    v260 = objc_claimAutoreleasedReturnValue(v259);
    if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_DEFAULT, "Removing 'IDMS level changed' flag", buf, 2u);
    }

    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("idms_level"));
  }
  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("cdp_enabled")))
  {
    v261 = sub_10000EF14("octagon");
    v262 = objc_claimAutoreleasedReturnValue(v261);
    if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v262, OS_LOG_TYPE_DEFAULT, "Removing 'CDP enabled' flag", buf, 2u);
    }

    objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("cdp_enabled"));
  }
  if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("check_on_rtc_metrics")))
  {
LABEL_263:
    v230 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v230, "setDateProperty:forKey:", v231, CFSTR("OALastKSR"));

    v232 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    objc_msgSend(v232, "launch");

    v233 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v234 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    objc_msgSend(v233, "noteLaunchSequence:", v234);

    goto LABEL_31;
  }
  v263 = sub_10000EF14("octagon-metrics");
  v264 = objc_claimAutoreleasedReturnValue(v263);
  if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_DEFAULT, "Checking metrics", buf, 2u);
  }

  objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("check_on_rtc_metrics"));
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v269[0] = _NSConcreteStackBlock;
  v269[1] = 3221225472;
  v269[2] = sub_1000F6C0C;
  v269[3] = &unk_1002EB5E8;
  objc_copyWeak(&v270, (id *)buf);
  v16 = (OTPrepareOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("check-on-metrics"), CFSTR("Ready"), CFSTR("Ready"), v269));
  objc_destroyWeak(&v270);
  objc_destroyWeak((id *)buf);
LABEL_8:

  return v16;
}

- (void)setMetricsStateToActive
{
  const void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = sub_10000EF14("octagon-metrics");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Metrics now switching to ON", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationDependencies"));
  objc_msgSend(v6, "setSendMetric:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneChangeFetcher"));
  objc_msgSend(v8, "setSendMetric:", 1);

  -[OTCuttlefishContext setShouldSendMetricsForOctagon:](self, "setShouldSendMetricsForOctagon:", 1);
}

- (void)setMetricsStateToInactive
{
  const void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = sub_10000EF14("octagon-metrics");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Metrics now switching to OFF", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationDependencies"));
  objc_msgSend(v6, "setSendMetric:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneChangeFetcher"));
  objc_msgSend(v8, "setSendMetric:", 0);

  -[OTCuttlefishContext setShouldSendMetricsForOctagon:](self, "setShouldSendMetricsForOctagon:", 2);
}

- (void)setMetricsToState:(int)a3
{
  if (a3 == 2)
    -[OTCuttlefishContext setMetricsStateToInactive](self, "setMetricsStateToInactive");
  else
    -[OTCuttlefishContext setMetricsStateToActive](self, "setMetricsStateToActive");
}

- (id)initializingOperation
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F62B8;
  v4[3] = &unk_1002EB5E8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-initializing"), CFSTR("NoAccount"), CFSTR("Error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)appleAccountSignOutOperation
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F6054;
  v3[3] = &unk_1002DD850;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-account-gone"), CFSTR("NoAccountDoReset"), CFSTR("NoAccountDoReset"), v3));
}

- (id)checkForAccountFixupsOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F5EA8;
  v8[3] = &unk_1002E9440;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-fixup_check"), v5, CFSTR("Error"), v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)evaluateSecdOctagonTrust
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F5CB4;
  v3[3] = &unk_1002DD850;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-health-securityd-trust-check"), CFSTR("TPHTrustCheck"), CFSTR("PostRepairCFU"), v3));
}

- (id)evaluateTPHOctagonTrust
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F59EC;
  v3[3] = &unk_1002DD850;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-health-tph-trust-check"), CFSTR("CuttlefishTrustCheck"), CFSTR("PostRepairCFU"), v3));
}

- (id)cuttlefishTrustEvaluation
{
  OTCheckHealthOperation *v3;
  void *v4;
  void *v5;
  OTCheckHealthOperation *v6;
  OTCheckHealthOperation *v7;
  void *v8;
  void *v9;
  OTCheckHealthOperation *v10;
  uint64_t v12;
  _QWORD v13[4];
  OTCheckHealthOperation *v14;
  id v15;
  id location;

  v3 = [OTCheckHealthOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
  LOBYTE(v12) = self->_repair;
  v6 = -[OTCheckHealthOperation initWithDependencies:intendedState:errorState:deviceInfo:skipRateLimitedCheck:reportRateLimitingError:repair:](v3, "initWithDependencies:intendedState:errorState:deviceInfo:skipRateLimitedCheck:reportRateLimitingError:repair:", v4, CFSTR("BecomeReady"), CFSTR("BecomeReady"), v5, self->_skipRateLimitingCheck, self->_reportRateLimitingError, v12);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F51A0;
  v13[3] = &unk_1002EA8C8;
  objc_copyWeak(&v15, &location);
  v7 = v6;
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("rpcHealthCheck"), v13));
  objc_msgSend(v8, "addDependency:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v9, "addOperation:", v8);

  v10 = v7;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

- (id)postRepairCFUAndBecomeUntrusted
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F4F7C;
  v3[3] = &unk_1002DD850;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-health-post-repair-cfu"), CFSTR("Untrusted"), CFSTR("Error"), v3));
}

- (id)cloudKitAccountNewlyAvailableOperation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F46D4;
  v7[3] = &unk_1002EB5E8;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-icloud-account-available"), v4, CFSTR("Error"), v7));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)repairAccountIfTrustedByTPHWithIntendedState:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint8_t buf[16];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000EE108;
  v19 = sub_1000EE118;
  v4 = a3;
  v20 = v4;
  v5 = sub_10000EF14("octagon-health");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "repairAccountIfTrustedByTPHWithIntendedState: calling into TPH for trust status", buf, 2u);
  }

  v7 = objc_alloc_init((Class)OTOperationConfiguration);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F428C;
  v11[3] = &unk_1002DD938;
  v13 = &v15;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  -[OTCuttlefishContext rpcTrustStatus:reply:](self, "rpcTrustStatus:reply:", v7, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)checkForPhonePeerPresence:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  void *v12;
  int v13;
  BOOL v14;
  const void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("iPhone"));
        v11 = objc_msgSend(v9, "hasPrefix:", CFSTR("iPad"));
        if ((v10 & 1) != 0 || v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
          v13 = objc_msgSend(v12, "intValue");

          if (v13 >= 1)
          {
            v15 = sub_10000EF14("octagon");
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              v23 = v13;
              v24 = 2112;
              v25 = v9;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Have %d peers with model %@", buf, 0x12u);
            }

            v14 = 1;
            goto LABEL_15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)checkTrustStatusAndPostRepairCFUIfNecessary:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)OTOperationConfiguration);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F3BC8;
  v7[3] = &unk_1002DD960;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[OTCuttlefishContext rpcTrustStatus:reply:](self, "rpcTrustStatus:reply:", v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (id)becomeUntrustedOperation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F35B0;
  v7[3] = &unk_1002EB5E8;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-become-untrusted"), v4, CFSTR("Error"), v7));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)becomeInheritedOperation
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F2E80;
  v4[3] = &unk_1002EB5E8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-inherited"), CFSTR("Inherited"), CFSTR("Error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)becomeReadyOperation
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F24E4;
  v4[3] = &unk_1002EB5E8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("octagon-ready"), CFSTR("Ready"), CFSTR("Error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)extractStringKey:(id)a3 fromDictionary:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", a3));
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)handleTTRRequest:(id)a3
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
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  void *v27;
  const void *v28;
  NSObject *v29;
  const void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("s"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("D"), v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("a"), v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("d"), v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("R"), v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("n"), v4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("v"), v4));
  v33 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("I"), v4));
  if (v5)
  {
    v31 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
    v32 = v4;
    v13 = v10;
    v14 = v9;
    v15 = v8;
    v16 = v7;
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serialNumber"));
    v19 = objc_msgSend(v18, "isEqualToString:", v5);

    v6 = v17;
    v7 = v16;
    v8 = v15;
    v9 = v14;
    v10 = v13;
    v4 = v32;

    v11 = v31;
    if ((v19 & 1) == 0)
    {
      v25 = sub_10000EF14("octagon");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "TTR request not for me (sn)", buf, 2u);
      }

      goto LABEL_21;
    }
  }
  if (!v6)
    goto LABEL_7;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountStateTracker](self, "accountStateTracker"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ckdeviceID"));

  if (!v5 || (objc_msgSend(v21, "isEqualToString:", v5) & 1) == 0)
  {
    v27 = v11;
    v28 = sub_10000EF14("octagon");
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "TTR request not for me (deviceId)", buf, 2u);
    }

    v11 = v27;
LABEL_21:
    v24 = (void *)v33;
    goto LABEL_25;
  }

LABEL_7:
  if (v7 && v8 && v9)
  {
    v22 = objc_msgSend(objc_alloc((Class)SecTapToRadar), "initTapToRadar:description:radar:", v7, v8, v9);
    v23 = v22;
    v24 = (void *)v33;
    if (v10 && v11 && v33)
    {
      -[NSObject setComponentName:](v22, "setComponentName:", v10);
      -[NSObject setComponentVersion:](v23, "setComponentVersion:", v11);
      -[NSObject setComponentID:](v23, "setComponentID:", v33);
    }
    -[NSObject trigger](v23, "trigger");
  }
  else
  {
    v30 = sub_10000EF14("SecError");
    v23 = objc_claimAutoreleasedReturnValue(v30);
    v24 = (void *)v33;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon: invalid type of TTR requeat: %@", buf, 0xCu);
    }
  }

LABEL_25:
}

- (void)notifyContainerChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[OTCuttlefishContext notifyContainerChangeWithUserInfo:](self, "notifyContainerChangeWithUserInfo:", v4);

}

- (void)notifyContainerChangeWithUserInfo:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  const void *v23;
  NSObject *v24;
  uint32_t v25;
  const void *v26;
  NSObject *v27;
  int v28;
  int v29;
  CKKSNearFutureScheduler *v30;
  uint64_t v31;
  CKKSNearFutureScheduler *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t v42[4];
  unsigned int v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v5 = sub_10000EF14("octagonpush");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received a cuttlefish push notification (%@): %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cf")));
  v9 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext extractStringKey:fromDictionary:](self, "extractStringKey:fromDictionary:", CFSTR("k"), v8)), (v11 = v10) != 0))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("r")))
    {
      -[OTCuttlefishContext handleTTRRequest:](self, "handleTTRRequest:", v8);
    }
    else
    {
      v20 = sub_10000EF14("SecError");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "octagon: unknown command: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext apsRateLimiter](self, "apsRateLimiter"));
    v13 = v12 == 0;

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelID"));
      v16 = +[OTDeviceInformation isFullPeer:](OTDeviceInformation, "isFullPeer:", v15);

      v17 = 2000000000;
      v18 = 2000000000;
      if ((v16 & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v45 = sub_1000EE108;
        v46 = sub_1000EE118;
        v47 = 0;
        v36 = 0;
        v37 = &v36;
        v38 = 0x3032000000;
        v39 = sub_1000EE108;
        v40 = sub_1000EE118;
        v41 = 0;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000F2298;
        v35[3] = &unk_1002DD9D0;
        v35[4] = buf;
        v35[5] = &v36;
        -[OTCuttlefishContext rpcFetchTotalCountOfTrustedPeers:](self, "rpcFetchTotalCountOfTrustedPeers:", v35);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) || (v22 = (void *)v37[5]) == 0)
          v19 = 300;
        else
          v19 = 3 * objc_msgSend(v22, "unsignedIntValue");
        v23 = sub_10000EF14("octagon");
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v42 = 67109120;
          v43 = v19;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "max splay window seconds for limiter %d", v42, 8u);
        }

        v25 = arc4random_uniform(1000 * v19);
        _Block_object_dispose(&v36, 8);

        _Block_object_dispose(buf, 8);
        v18 = 1000000 * v25 + 2000000000;
      }
      v26 = sub_10000EF14("octagon");
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "creating aps rate limiter with min initial delay of %llu", buf, 0xCu);
      }

      if (qword_100341048 != -1)
        dispatch_once(&qword_100341048, &stru_1002DCC20);
      v28 = byte_100341050;
      v29 = byte_100341050;
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v30 = [CKKSNearFutureScheduler alloc];
      if (!v29)
        v17 = 30000000000;
      if (v28)
        v31 = 200000000;
      else
        v31 = v18;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000F23D0;
      v33[3] = &unk_1002EB598;
      objc_copyWeak(&v34, (id *)buf);
      v32 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v30, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("aps-push-ratelimiter"), v31, v17, 1, 0, v33);
      -[OTCuttlefishContext setApsRateLimiter:](self, "setApsRateLimiter:", v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext apsRateLimiter](self, "apsRateLimiter"));
    objc_msgSend(v11, "trigger");
  }

}

- (BOOL)waitForReady:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waitForState:wait:", CFSTR("Ready"), a3));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("Ready"));
  return (char)v4;
}

- (void)popTooManyPeersDialogWithEgoPeerStatus:(id)a3 accountMeta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  const void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  void *i;
  const void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  const void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  NSObject *v45;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  v9 = objc_msgSend(v8, "shouldPopDialog");

  if (v9)
  {
    if (objc_msgSend(v7, "warnedTooManyPeers"))
    {
      v10 = sub_10000EF14("octagon");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
      *(_DWORD *)buf = 138412290;
      v43 = v12;
      v13 = "popdialog: Already checked this altDSID: %@";
      v14 = v11;
      v15 = 12;
      goto LABEL_25;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v40 = 0;
    objc_msgSend(v16, "persistAccountChanges:error:", &stru_1002DD9F0, &v40);
    v11 = v40;

    if (v11)
    {
      v17 = sub_10000EF14("SecError");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
        *(_DWORD *)buf = 138412546;
        v43 = v19;
        v44 = 2112;
        v45 = v11;
        v20 = "octagon: popdialog: Failed to persist warned-too-many-peers state for %@: %@";
        v21 = v18;
        v22 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);

      }
    }
    else
    {
      v23 = sub_10000EF14("octagon");
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
        *(_DWORD *)buf = 138412290;
        v43 = v19;
        v20 = "popdialog: Successfully persisted warned-too-many-peers state for %@";
        v21 = v18;
        v22 = 12;
        goto LABEL_10;
      }
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerCountsByMachineID", 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues"));

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v25);
          v28 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "longValue");
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v27);
    }
    else
    {
      v28 = 0;
    }

    v31 = sub_10000EF14("octagon");
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = v28;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "popdialog: ego peer status says peer count is: %lu", buf, 0xCu);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tooManyPeersAdapter](self, "tooManyPeersAdapter"));
    v34 = objc_msgSend(v33, "getLimit");

    if (v28 >= (unint64_t)v34)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tooManyPeersAdapter](self, "tooManyPeersAdapter"));
      -[NSObject popDialogWithCount:limit:](v12, "popDialogWithCount:limit:", v28, v34);
      goto LABEL_27;
    }
    v35 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_27:

      goto LABEL_28;
    }
    *(_DWORD *)buf = 134218240;
    v43 = v28;
    v44 = 2048;
    v45 = v34;
    v13 = "popdialog: not popping dialog, number of peers ok: %lu < %lu";
    v14 = v12;
    v15 = 22;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_27;
  }
LABEL_29:

}

- (void)setMachineIDOverride:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  objc_msgSend(v5, "setOverriddenMachineID:", v4);

}

- (int)currentMemoizedTrustState
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  const void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loadOrCreateAccountMetadata:", &v9));
  v4 = v9;

  if (v3)
  {
    v5 = objc_msgSend(v3, "trustState");
  }
  else
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to fetch account metadata: %@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (int)currentMemoizedAccountState
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  const void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loadOrCreateAccountMetadata:", &v9));
  v4 = v9;

  if (v3)
  {
    v5 = objc_msgSend(v3, "icloudAccountState");
  }
  else
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to fetch account metadata: %@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (id)currentMemoizedLastHealthCheck
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  const void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loadOrCreateAccountMetadata:", &v9));
  v4 = v9;

  if (!v3)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to fetch account metadata: %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "lastHealthCheckup"))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v3, "lastHealthCheckup") / 1000.0);
LABEL_8:

  return v5;
}

- (void)requestTrustedDeviceListRefresh
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "handleFlag:", CFSTR("attempt_machine_id_list"));

}

- (void)deviceNameUpdated
{
  const void *v3;
  NSObject *v4;
  void *v5;
  OctagonPendingFlag *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = sub_10000EF14("octagon-devicename");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device name updated: %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("recd_push"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  objc_msgSend(v7, "handlePendingFlag:", v6);

}

- (void)trustedPeerSetChanged:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  int v14;
  int v15;
  _QWORD *v16;
  CKKSNearFutureScheduler *v17;
  uint64_t v18;
  uint64_t v19;
  CKKSNearFutureScheduler *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[8];

  v4 = a3;
  v5 = sub_10000EF14("octagon-sos");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received an update of an SOS trust set change", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v8 = objc_msgSend(v7, "sosEnabled");

  if ((v8 & 1) == 0)
  {
    v9 = sub_10000EF14("octagon-sos");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "This platform doesn't support SOS. This is probably a bug?", buf, 2u);
    }

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosConsistencyRateLimiter](self, "sosConsistencyRateLimiter"));

  if (!v11)
  {
    v12 = sub_10000EF14("octagon");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "creating SOS consistency rate limiter", buf, 2u);
    }

    if (qword_100341048 != -1)
      dispatch_once(&qword_100341048, &stru_1002DCC20);
    v14 = byte_100341050;
    v15 = byte_100341050;
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000F2220;
    v22[3] = &unk_1002EB598;
    objc_copyWeak(&v23, (id *)buf);
    v16 = objc_retainBlock(v22);
    v17 = [CKKSNearFutureScheduler alloc];
    if (v15)
      v18 = 10000000000;
    else
      v18 = 30000000000;
    if (v14)
      v19 = 200000000;
    else
      v19 = 2000000000;
    v20 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v17, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("sos-consistency-ratelimiter"), v19, v18, 0, 1000, v16, 2.0);
    -[OTCuttlefishContext setSosConsistencyRateLimiter:](self, "setSosConsistencyRateLimiter:", v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosConsistencyRateLimiter](self, "sosConsistencyRateLimiter"));
  objc_msgSend(v21, "trigger");

}

- (int64_t)checkForCKAccount:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  const void *v18;
  NSObject *v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  int64_t v26;
  _QWORD v28[7];
  _QWORD block[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  char v37;
  uint8_t v38[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;

  v4 = a3;
  if (objc_msgSend(v4, "timeoutWaitForCKAccount"))
  {
    v5 = (unint64_t)objc_msgSend(v4, "timeoutWaitForCKAccount");
    if (v5 < 2)
    {
      v6 = 0;
      goto LABEL_10;
    }
    v6 = v5 >> 1;
  }
  else
  {
    v6 = 5000000000;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountStateKnown](self, "cloudKitAccountStateKnown"));
  v8 = objc_msgSend(v7, "wait:", v6);

  if (v8)
  {
    v9 = sub_10000EF14("octagon-ck");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to determine CloudKit account state?", buf, 2u);
    }

  }
LABEL_10:
  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v11 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F20E8;
  block[3] = &unk_1002EAEE8;
  block[4] = self;
  block[5] = &v30;
  block[6] = buf;
  dispatch_sync(v11, block);

  if (!*((_BYTE *)v31 + 24) || (v12 = v35[24]) == 0)
  {
    v13 = sub_10000EF14("octagon-ck");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
      *(_DWORD *)v38 = 138412290;
      v39 = (uint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No CK account present(%@). Attempting to refetch CK account status...", v38, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountStateTracker](self, "accountStateTracker"));
    v17 = objc_msgSend(v16, "notifyCKAccountStatusChangeAndWait:", v6);

    if ((v17 & 1) == 0)
    {
      v18 = sub_10000EF14("octagon-ck");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetching new CK account status did not complete in time", v38, 2u);
      }

    }
    v20 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000F2184;
    v28[3] = &unk_1002EAEE8;
    v28[4] = self;
    v28[5] = &v30;
    v28[6] = buf;
    dispatch_sync(v20, v28);

    v21 = sub_10000EF14("octagon-ck");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
      v24 = (void *)v23;
      if (v35[24])
        v25 = CFSTR("present");
      else
        v25 = CFSTR("missing");
      *(_DWORD *)v38 = 138412546;
      v39 = v23;
      v40 = 2112;
      v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "After refetch, CK account status(%@) is %@", v38, 0x16u);

    }
    if (!*((_BYTE *)v31 + 24))
    {
      v26 = 0;
      goto LABEL_29;
    }
    v12 = v35[24];
  }
  if (v12)
    v26 = 1;
  else
    v26 = 3;
LABEL_29:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v26;
}

- (id)errorIfNoCKAccount:(id)a3
{
  int64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;

  v3 = -[OTCuttlefishContext checkForCKAccount:](self, "checkForCKAccount:", a3);
  if (v3 == 3)
  {
    v4 = CFSTR("User is not signed into iCloud.");
    v5 = 25;
  }
  else
  {
    if (v3)
    {
      v6 = 0;
      return v6;
    }
    v4 = CFSTR("Cannot determine iCloud Account state; try again later");
    v5 = 56;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), v5, v4));
  return v6;
}

- (void)rpcEpoch:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v16;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  v6 = sub_10000EF14("rpc-epoch");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching epoch", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
      objc_msgSend(v10, "recheck");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000F1FC8;
    v13[3] = &unk_1002DDA18;
    v14 = v4;
    objc_msgSend(v11, "fetchEgoEpochWithSpecificUser:reply:", v12, v13);

  }
}

- (void)rpcVoucherWithConfiguration:(id)a3 permanentInfo:(id)a4 permanentInfoSig:(id)a5 stableInfo:(id)a6 stableInfoSig:(id)a7 reply:(id)a8
{
  void *v14;
  const void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  OTUpdateTrustedDeviceListOperation *v20;
  void *v21;
  OctagonStateTransitionRequest *v22;
  void *v23;
  void *v24;
  OTPairingVoucherOperation *v25;
  void *v26;
  void *v27;
  OTPairingVoucherOperation *v28;
  OctagonStateTransitionRequest *v29;
  void *v30;
  void *v31;
  id v32;
  OTPairingVoucherOperation *v33;
  id v34;
  void *v35;
  OTUpdateTrustedDeviceListOperation *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  OTUpdateTrustedDeviceListOperation *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  OTUpdateTrustedDeviceListOperation *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  OTPairingVoucherOperation *v57;
  id v58;
  _BYTE buf[12];

  v44 = a3;
  v45 = a4;
  v46 = a5;
  v47 = a6;
  v48 = a7;
  v49 = a8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  v15 = sub_10000EF14("rpc-vouch");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, void *))v49 + 2))(v49, 0, 0, v14);
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating voucher", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
      objc_msgSend(v19, "recheck");

    }
    v20 = [OTUpdateTrustedDeviceListOperation alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v43 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:](v20, "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:", v21, CFSTR("BecomeReady"), CFSTR("BecomeReady"), CFSTR("BecomeReady"), 0);

    v22 = [OctagonStateTransitionRequest alloc];
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    v42 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:](v22, "init:sourceStates:serialQueue:transitionOp:", CFSTR("updateTDL"), v23, v24, v43);

    v25 = [OTPairingVoucherOperation alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v28 = -[OTPairingVoucherOperation initWithDependencies:intendedState:errorState:deviceInfo:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:](v25, "initWithDependencies:intendedState:errorState:deviceInfo:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:", v26, CFSTR("BecomeReady"), CFSTR("BecomeReady"), v27, v44, v45, v46, v47, v48);

    v29 = [OctagonStateTransitionRequest alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    v32 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:](v29, "init:sourceStates:serialQueue:transitionOp:", CFSTR("rpcVoucher"), v30, v31, v28);

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000F1D0C;
    v56[3] = &unk_1002EB078;
    v33 = v28;
    v57 = v33;
    v34 = v49;
    v58 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("rpcVoucher-callback"), v56));
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000F1E68;
    v50[3] = &unk_1002DDA40;
    objc_copyWeak(&v55, (id *)buf);
    v36 = v43;
    v51 = v36;
    v54 = v34;
    v37 = v35;
    v52 = v37;
    v38 = v32;
    v53 = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("updateTDL-callback"), v50));
    objc_msgSend(v39, "addDependency:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    objc_msgSend(v40, "addOperation:", v39);

    -[CKKSGroupOperation addDependency:](v33, "addDependency:", v39);
    objc_msgSend(v37, "addDependency:", v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    objc_msgSend(v41, "handleExternalRequest:startTimeout:", v42, 120000000000);

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);

  }
}

- (void)rpcPrepareIdentityAsApplicantWithConfiguration:(id)a3 epoch:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  OTPrepareOperation *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OTPrepareOperation *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  OctagonStateTransitionRequest *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  OTPrepareOperation *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  OTPrepareOperation *v38;
  id v39;
  _QWORD v40[6];
  uint8_t buf[4];
  void *v42;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v10)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, 0, 0, v10);
  }
  else
  {
    v13 = sub_10000EF14("otrpc");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preparing identity as applicant", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
      objc_msgSend(v16, "recheck");

    }
    v17 = [OTPrepareOperation alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    v22 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:](v17, "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:", v18, CFSTR("InitiatorAwaitingVoucher"), CFSTR("BecomeUntrusted"), v19, v20, v21, a4);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
    if ((objc_msgSend(v23, "isWatch") & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
      if ((objc_msgSend(v25, "isAppleTV") & 1) != 0)
      {
        v24 = 1;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
        v24 = objc_msgSend(v26, "isHomePod");

      }
    }

    if (objc_msgSend(v8, "timeout"))
    {
      v27 = (uint64_t)objc_msgSend(v8, "timeout");
    }
    else if (v24)
    {
      v27 = 60000000000;
    }
    else
    {
      v27 = 10000000000;
    }
    v28 = [OctagonStateTransitionRequest alloc];
    v40[0] = CFSTR("Untrusted");
    v40[1] = CFSTR("WaitForCDP");
    v40[2] = CFSTR("WaitingForCloudKitAccount");
    v40[3] = CFSTR("DetermineiCloudAccountState");
    v40[4] = CFSTR("NoAccount");
    v40[5] = CFSTR("not_started");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 6));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v29));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    v32 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:](v28, "init:sourceStates:serialQueue:transitionOp:", CFSTR("prepareForApplicant"), v30, v31, v22);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000F1B7C;
    v37[3] = &unk_1002EB078;
    v38 = v22;
    v39 = v9;
    v33 = v22;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("rpcPrepare-callback"), v37));
    objc_msgSend(v34, "addDependency:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    objc_msgSend(v35, "addOperation:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    objc_msgSend(v36, "handleExternalRequest:startTimeout:", v32, v27);

  }
}

- (void)joinWithBottle:(id)a3 entropy:(id)a4 bottleSalt:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *);
  id v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  void (**v28)(id, void *);
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  objc_storeStrong((id *)&self->_bottleID, a3);
  objc_storeStrong((id *)&self->_entropy, a4);
  objc_storeStrong((id *)&self->_bottleSalt, a5);
  v15 = objc_alloc_init((Class)OTOperationConfiguration);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v15));
  if (v16)
  {
    v17 = sub_10000EF14("octagon");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v14[2](v14, v16);
  }
  else
  {
    v31 = CFSTR("BottleJoinCreateIdentity");
    v29 = CFSTR("BottleJoinVouchWithBottle");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary"));
    v30 = v19;
    v26 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v32 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v21));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000F1B1C;
    v27[3] = &unk_1002DE4E0;
    v27[4] = self;
    v28 = v14;
    v25 = objc_msgSend(v23, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-join-with-bottle"), v24, v22, v27);

    v11 = v26;
  }

}

- (void)joinWithRecoveryKey:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;

  v6 = (void (**)(id, void *))a4;
  -[OTCuttlefishContext setRecoveryKey:](self, "setRecoveryKey:", a3);
  v7 = objc_alloc_init((Class)OTOperationConfiguration);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v7));
  if (v8)
  {
    v9 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }
  else
  {
    v23 = CFSTR("OctagonStateStashAccountSettingsForRecoveryKey");
    v21 = CFSTR("CreateIdentityForRecoveryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary", CFSTR("VouchWithRecoveryKey")));
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
    v18 = objc_msgSend(v16, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-join-with-recovery-key"), v17, v15, v6);

  }
}

- (void)joinWithCustodianRecoveryKey:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;

  v6 = (void (**)(id, void *))a4;
  -[OTCuttlefishContext setCustodianRecoveryKey:](self, "setCustodianRecoveryKey:", a3);
  v7 = objc_alloc_init((Class)OTOperationConfiguration);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v7));
  if (v8)
  {
    v9 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }
  else
  {
    v20 = CFSTR("CreateIdentityForCustodianRecoveryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary", CFSTR("VouchWithCustodianRecoveryKey")));
    v19 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v21 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
    v17 = objc_msgSend(v15, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-join-with-custodian-recovery-key"), v16, v14, v6);

  }
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  TrustedPeersHelperCustodianRecoveryKey *v15;
  void *v16;
  void *v17;
  void *v18;
  TrustedPeersHelperCustodianRecoveryKey *v19;
  OTPreflightVouchWithCustodianRecoveryKeyOperation *v20;
  void *v21;
  OTPreflightVouchWithCustodianRecoveryKeyOperation *v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_alloc_init((Class)OTOperationConfiguration);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v8));
  if (v9)
  {
    v10 = sub_10000EF14("octagon");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "altDSID"));

    if (v13)
    {
      v14 = v13;
      v15 = [TrustedPeersHelperCustodianRecoveryKey alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
      v29 = v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recoveryString"));
      v19 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:](v15, "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:", v17, 0, 0, v18, v14, 1);

      v20 = [OTPreflightVouchWithCustodianRecoveryKeyOperation alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v22 = -[OTPreflightVouchWithCustodianRecoveryKeyOperation initWithDependencies:intendedState:errorState:tphcrk:](v20, "initWithDependencies:intendedState:errorState:tphcrk:", v21, CFSTR("BecomeReady"), CFSTR("BecomeReady"), v19);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      objc_msgSend(v24, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("preflight-custodian-recovery-key"), v22, v23, v7);

      v13 = v29;
    }
    else
    {
      v25 = sub_10000EF14("authkit");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
      v7[2](v7, v28);

    }
  }

}

- (void)joinWithInheritanceKey:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;

  v6 = (void (**)(id, void *))a4;
  -[OTCuttlefishContext setInheritanceKey:](self, "setInheritanceKey:", a3);
  v7 = objc_alloc_init((Class)OTOperationConfiguration);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v7));
  if (v8)
  {
    v9 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }
  else
  {
    v23 = CFSTR("PrepareAndRecoverTLKSharesForInheritancePeer");
    v21 = CFSTR("BecomeInherited");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success", CFSTR("Inherited")));
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](OTStates, "OctagonInAccountStates"));
    v18 = objc_msgSend(v16, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-join-with-inheritance-key"), v17, v15, v6);

  }
}

- (void)preflightJoinWithInheritanceKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  TrustedPeersHelperCustodianRecoveryKey *v18;
  void *v19;
  void *v20;
  void *v21;
  TrustedPeersHelperCustodianRecoveryKey *v22;
  OTPreflightVouchWithCustodianRecoveryKeyOperation *v23;
  void *v24;
  OTPreflightVouchWithCustodianRecoveryKeyOperation *v25;
  void *v26;
  void *v27;
  const void *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_alloc_init((Class)OTOperationConfiguration);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v8));
  if (v9)
  {
    v10 = sub_10000EF14("octagon");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
  else
  {
    v12 = objc_alloc((Class)OTCustodianRecoveryKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recoveryKeyData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "base64EncodedStringWithOptions:", 0));
    v31 = 0;
    v16 = objc_msgSend(v12, "initWithUUID:recoveryString:error:", v13, v15, &v31);
    v17 = v31;

    if (v16)
    {
      v18 = [TrustedPeersHelperCustodianRecoveryKey alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
      v30 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recoveryString"));
      v22 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:](v18, "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:", v20, 0, 0, v21, &stru_1002EE888, 2);

      v23 = [OTPreflightVouchWithCustodianRecoveryKeyOperation alloc];
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v25 = -[OTPreflightVouchWithCustodianRecoveryKeyOperation initWithDependencies:intendedState:errorState:tphcrk:](v23, "initWithDependencies:intendedState:errorState:tphcrk:", v24, CFSTR("BecomeReady"), CFSTR("BecomeReady"), v22);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      objc_msgSend(v27, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("preflight-inheritance-recovery-key"), v25, v26, v7);

      v17 = v30;
    }
    else
    {
      v28 = sub_10000EF14("SecError");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "octagon-inheritance: failed to create CRK: %@", buf, 0xCu);
      }

      v7[2](v7, v17);
    }

  }
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v8)
  {
    v9 = sub_10000EF14("octagon-preflight-rk");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v8);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "altDSID"));

    if (v12)
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000F19C0;
      v20[3] = &unk_1002DF000;
      v21 = v7;
      objc_msgSend(v14, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:salt:reply:", v15, v6, v13, v20);

      v16 = v21;
    }
    else
    {
      v17 = sub_10000EF14("octagon-preflight-rk");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
      v7[2](v7, 0, v16);
    }

  }
}

- (id)joinStatePathDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;

  v59 = CFSTR("InitiatorSetCDPBit");
  v57 = CFSTR("InitiatorUpdateDeviceList");
  v55 = CFSTR("InitiatorJoin");
  v53[0] = CFSTR("BottlePreloadOctagonKeysInSOS");
  v51[0] = CFSTR("JoinSOSAfterCKKSFetch");
  v49 = CFSTR("SetAccountSettings");
  v47 = CFSTR("BecomeReady");
  v45 = CFSTR("Ready");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v46 = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
  v48 = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
  v50 = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
  v51[1] = CFSTR("SetAccountSettings");
  v52[0] = v21;
  v43 = CFSTR("BecomeReady");
  v41 = CFSTR("Ready");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v42 = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v44 = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
  v52[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
  v53[1] = CFSTR("InitiatorJoinCKKSReset");
  v54[0] = v17;
  v39 = CFSTR("InitiatorJoinAfterCKKSReset");
  v37 = CFSTR("BottlePreloadOctagonKeysInSOS");
  v35[0] = CFSTR("JoinSOSAfterCKKSFetch");
  v33 = CFSTR("SetAccountSettings");
  v31 = CFSTR("BecomeReady");
  v29 = CFSTR("Ready");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v30 = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v32 = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v34 = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v35[1] = CFSTR("SetAccountSettings");
  v36[0] = v13;
  v27 = CFSTR("BecomeReady");
  v25 = CFSTR("Ready");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v26 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v28 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v36[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v38 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v40 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  v54[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
  v56 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
  v58 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v60 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));

  return v11;
}

- (void)rpcJoin:(id)a3 vouchSig:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  void (**v24)(id, void *);
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v11)
  {
    v12 = sub_10000EF14("octagon");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v10[2](v10, v11);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000F188C;
    v26[3] = &unk_1002DEC60;
    v27 = v8;
    v28 = v9;
    v25 = 0;
    objc_msgSend(v14, "persistAccountChanges:error:", v26, &v25);
    v15 = v25;

    if (v15)
    {
      v16 = sub_10000EF14("octagon");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to save voucher for joining: %@", buf, 0xCu);
      }

      v10[2](v10, v15);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("InitiatorAwaitingVoucher"), CFSTR("Untrusted"), 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000F18C8;
      v23[3] = &unk_1002DE4E0;
      v23[4] = self;
      v24 = v10;
      v22 = objc_msgSend(v21, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-join"), v18, v20, v23);

    }
  }

}

- (id)ckksPeerStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peerID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peerID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("peerID"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicSigningKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encodeSubjectPublicKeyInfo"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("signingSPKI"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", 1, v8));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("signingSPKIHash"));

  }
  return v4;
}

- (id)sosTrustedPeersStatus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  const void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v19 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchTrustedPeers:", &v19));
  v5 = v19;

  if (!v4 || v5)
  {
    v13 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No SOS peers present: %@, skipping in status", buf, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckksPeerStatus:](self, "ckksPeerStatus:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15));
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }
  }

  return v6;
}

- (id)sosSelvesStatus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v24 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchSelfPeers:", &v24));
  v5 = v24;

  if (!v4 || v5)
  {
    v18 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No SOS selves present: %@, skipping in status", buf, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSelf"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckksPeerStatus:](self, "ckksPeerStatus:", v7));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("currentSelf"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSelves"));
    v10 = objc_msgSend(v9, "mutableCopy");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSelf"));
    -[NSObject removeObject:](v10, "removeObject:", v11);

    if (-[NSObject count](v10, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v10;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckksPeerStatus:](self, "ckksPeerStatus:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), (_QWORD)v20));
            if (v17)
              objc_msgSend(v12, "addObject:", v17);

            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v14);
      }

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("pastSelves"));
    }
  }

  return v6;
}

- (void)rpcStatus:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  _QWORD v59[4];
  void (**v60)(id, _QWORD, void *);
  uint64_t *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1000EE108;
  v69 = sub_1000EE118;
  v70 = (id)0xAAAAAAAAAAAAAAAALL;
  v70 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v5, CFSTR("containerName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v6, CFSTR("contextID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
  objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v8, CFSTR("activeAccount"));

  v9 = objc_alloc_init((Class)OTOperationConfiguration);
  objc_msgSend(v9, "setTimeoutWaitForCKAccount:", 2000000000);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v9));
  if (v10)
  {
    v11 = sub_10000EF14("octagon");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v10);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "paused"));
    v15 = objc_msgSend(v14, "wait:", 3000000000) == 0;

    if (!v15)
    {
      v16 = sub_10000EF14("octagon");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
        *(_DWORD *)buf = 138412546;
        v72 = v18;
        v73 = 2112;
        v74 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Returning status of unpaused state machine for container (%@) and context (%@)", buf, 0x16u);

      }
      objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", &off_10030A6E8, CFSTR("stateUnpaused"));
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentState"));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v21, CFSTR("state"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dumpPendingFlags"));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v23, CFSTR("statePendingFlags"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "flags"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dumpFlags"));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v26, CFSTR("stateFlags"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v64 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "loadOrCreateAccountMetadata:", &v64));
    v57 = v64;

    if (v57)
    {
      v29 = sub_10000EF14("octagon");
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
        *(_DWORD *)buf = 138412802;
        v72 = v31;
        v73 = 2112;
        v74 = v32;
        v75 = 2112;
        v76 = v57;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Failed to load account metaada for container (%@) and context (%@): %@", buf, 0x20u);

      }
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "trustState", v57)));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v33, CFSTR("memoizedTrustState"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "icloudAccountState")));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v34, CFSTR("memoizedAccountState"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "cdpState")));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v35, CFSTR("memoizedCDPStatus"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "eventsByTime"));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v37, CFSTR("octagonLaunchSeqence"));

    v38 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext currentMemoizedLastHealthCheck](self, "currentMemoizedLastHealthCheck"));
    v39 = (void *)v38;
    if (v38)
      v40 = (const __CFString *)v38;
    else
      v40 = CFSTR("Never checked");
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v40, CFSTR("memoizedlastHealthCheck"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v42 = objc_msgSend(v41, "sosEnabled");

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosTrustedPeersStatus](self, "sosTrustedPeersStatus"));
      objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v43, CFSTR("sosTrustedPeersStatus"));

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosSelvesStatus](self, "sosSelvesStatus"));
      objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v44, CFSTR("sosSelvesStatus"));

    }
    v63 = 0;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class request:](-[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass"), "request:", &v63));
    v46 = v63;
    v62 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "fetchStatuses:", &v62));
    v48 = v62;

    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v47, CFSTR("escrowRequest"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "sysdiagnoseStatus"));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v50, CFSTR("CoreFollowUp"));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "datePropertyForKey:", CFSTR("lastOctagonPush")));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v52, CFSTR("lastOctagonPush"));

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext apsReceiver](self, "apsReceiver"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "registeredPushEnvironments"));
    objc_msgSend((id)v66[5], "setObject:forKeyedSubscript:", v54, CFSTR("pushEnvironments"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1000F1784;
    v59[3] = &unk_1002DDA68;
    v61 = &v65;
    v60 = v4;
    objc_msgSend(v55, "dumpWithSpecificUser:reply:", v56, v59);

  }
  _Block_object_dispose(&v65, 8);

}

- (void)rpcFetchEgoPeerID:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = (void (**)(id, void *, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getEgoPeerID:", &v12));
  v7 = v12;

  v8 = sub_10000EF14("octagon");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      v11 = "Returning peer ID: %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    v11 = "Unable to fetch peer ID: %@";
    goto LABEL_6;
  }

  v4[2](v4, v6, v7);
}

- (void)rpcFetchPeerAttributes:(id)a3 includeSelf:(BOOL)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v18;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v9)
  {
    v10 = sub_10000EF14("octagon");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v8[2](v8, 0, v9);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000F129C;
    v14[3] = &unk_1002DEF10;
    v16 = v8;
    v15 = v7;
    objc_msgSend(v12, "dumpWithSpecificUser:reply:", v13, v14);

  }
}

- (void)rpcFetchDeviceNamesByPeerID:(id)a3
{
  -[OTCuttlefishContext rpcFetchPeerAttributes:includeSelf:reply:](self, "rpcFetchPeerAttributes:includeSelf:reply:", CFSTR("device_name"), 0, a3);
}

- (void)rpcFetchPeerIDByBottleID:(id)a3
{
  -[OTCuttlefishContext rpcFetchPeerAttributes:includeSelf:reply:](self, "rpcFetchPeerAttributes:includeSelf:reply:", CFSTR("bottleID"), 1, a3);
}

- (void)rpcSetRecoveryKey:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OTSetRecoveryKeyOperation *v10;
  void *v11;
  OTSetRecoveryKeyOperation *v12;
  id v13;
  OTSetRecoveryKeyOperation *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  OTSetRecoveryKeyOperation *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v9, "recheck");

  }
  v10 = [OTSetRecoveryKeyOperation alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v12 = -[OTSetRecoveryKeyOperation initWithDependencies:recoveryKey:](v10, "initWithDependencies:recoveryKey:", v11, v7);

  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000F11B4;
  v21 = &unk_1002EB078;
  v22 = v12;
  v23 = v6;
  v13 = v6;
  v14 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("setRecoveryKey-callback"), &v18));
  objc_msgSend(v15, "addDependency:", v14, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v16, "addOperation:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v17, "addOperation:", v14);

}

- (void)rpcIsRecoveryKeySet:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000F11A8;
    v10[3] = &unk_1002DF000;
    v11 = v4;
    objc_msgSend(v8, "isRecoveryKeySet:reply:", v9, v10);

  }
}

- (void)rpcRemoveRecoveryKey:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000F119C;
    v10[3] = &unk_1002DF000;
    v11 = v4;
    objc_msgSend(v8, "removeRecoveryKey:reply:", v9, v10);

  }
}

- (void)areRecoveryKeysDistrusted:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000F1190;
    v10[3] = &unk_1002DF000;
    v11 = v4;
    objc_msgSend(v8, "octagonContainsDistrustedRecoveryKeysWithSpecificUser:reply:", v9, v10);

  }
}

- (void)rpcCreateCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTCreateCustodianRecoveryKeyOperation *v8;
  void *v9;
  OTCreateCustodianRecoveryKeyOperation *v10;
  id v11;
  OTCreateCustodianRecoveryKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTCreateCustodianRecoveryKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTCreateCustodianRecoveryKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTCreateCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F1090;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("createCustodianRecoveryKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcRemoveCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTRemoveCustodianRecoveryKeyOperation *v8;
  void *v9;
  OTRemoveCustodianRecoveryKeyOperation *v10;
  id v11;
  OTRemoveCustodianRecoveryKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTRemoveCustodianRecoveryKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTRemoveCustodianRecoveryKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTRemoveCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F0FA8;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("removeCustodianRecoveryKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcCheckCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTFindCustodianRecoveryKeyOperation *v8;
  void *v9;
  OTFindCustodianRecoveryKeyOperation *v10;
  id v11;
  OTFindCustodianRecoveryKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTFindCustodianRecoveryKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTFindCustodianRecoveryKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTFindCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F0E50;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("checkCustodianRecoveryKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTCreateInheritanceKeyOperation *v8;
  void *v9;
  OTCreateInheritanceKeyOperation *v10;
  id v11;
  OTCreateInheritanceKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTCreateInheritanceKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTCreateInheritanceKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTCreateInheritanceKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F0D50;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("createInheritanceKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcGenerateInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  id v7;
  id v8;
  const void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  if (!v5)
    v5 = objc_alloc_init((Class)NSUUID);
  v11 = 0;
  v7 = objc_msgSend(objc_alloc((Class)OTInheritanceKey), "initWithUUID:error:", v5, &v11);
  v8 = v11;
  if (v7)
  {
    v6[2](v6, v7, 0);
  }
  else
  {
    v9 = sub_10000EF14("SecError");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "octagon: failed to generate inheritance key: %@", buf, 0xCu);
    }

    ((void (**)(id, id, id))v6)[2](v6, 0, v8);
  }

}

- (void)rpcStoreInheritanceKeyWithIK:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTStoreInheritanceKeyOperation *v8;
  void *v9;
  OTStoreInheritanceKeyOperation *v10;
  id v11;
  OTStoreInheritanceKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTStoreInheritanceKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTStoreInheritanceKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTStoreInheritanceKeyOperation initWithIK:dependencies:](v8, "initWithIK:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F0C68;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("storeInheritanceKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcRemoveInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTRemoveCustodianRecoveryKeyOperation *v8;
  void *v9;
  OTRemoveCustodianRecoveryKeyOperation *v10;
  id v11;
  OTRemoveCustodianRecoveryKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTRemoveCustodianRecoveryKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTRemoveCustodianRecoveryKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTRemoveCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F0B80;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("removeInheritanceKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcCheckInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  OTFindCustodianRecoveryKeyOperation *v8;
  void *v9;
  OTFindCustodianRecoveryKeyOperation *v10;
  id v11;
  OTFindCustodianRecoveryKeyOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  OTFindCustodianRecoveryKeyOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [OTFindCustodianRecoveryKeyOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  v10 = -[OTFindCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F0A28;
  v19 = &unk_1002EB078;
  v20 = v10;
  v21 = v6;
  v11 = v6;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("checkInheritanceKey-callback"), &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)rpcRecreateInheritanceKeyWithUUID:(id)a3 oldIK:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  const void *v12;
  NSObject *v13;
  OTRecreateInheritanceKeyOperation *v14;
  void *v15;
  OTRecreateInheritanceKeyOperation *v16;
  OTRecreateInheritanceKeyOperation *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  OTRecreateInheritanceKeyOperation *v25;
  void (**v26)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v11)
  {
    v12 = sub_10000EF14("octagon");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v10[2](v10, 0, v11);
  }
  else
  {
    v14 = [OTRecreateInheritanceKeyOperation alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v16 = -[OTRecreateInheritanceKeyOperation initWithUUID:oldIK:dependencies:](v14, "initWithUUID:oldIK:dependencies:", v8, v9, v15);

    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1000F0928;
    v24 = &unk_1002EB078;
    v25 = v16;
    v26 = v10;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("recreateInheritanceKey-callback"), &v21));
    objc_msgSend(v18, "addDependency:", v17, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    objc_msgSend(v19, "addOperation:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    objc_msgSend(v20, "addOperation:", v17);

  }
}

- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  const void *v15;
  NSObject *v16;
  OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *v17;
  void *v18;
  OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *v19;
  OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *v28;
  void (**v29)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v14)
  {
    v15 = sub_10000EF14("octagon");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v13[2](v13, 0, v14);
  }
  else
  {
    v17 = [OTCreateInheritanceKeyWithClaimTokenAndWrappingKey alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v19 = -[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey initWithUUID:claimTokenData:wrappingKeyData:dependencies:](v17, "initWithUUID:claimTokenData:wrappingKeyData:dependencies:", v10, v11, v12, v18);

    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_1000F0828;
    v27 = &unk_1002EB078;
    v28 = v19;
    v29 = v13;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("createInheritanceKeyWithClaimTokenAndWrappingKey-callback"), &v24));
    objc_msgSend(v21, "addDependency:", v20, v24, v25, v26, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    objc_msgSend(v22, "addOperation:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    objc_msgSend(v23, "addOperation:", v20);

  }
}

- (void)rpcTrustStatusCachedStatus:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isInheritedAccount") & 1) != 0
    || objc_msgSend(v5, "trustState") == 2)
  {
    v7 = 0;
  }
  else if (objc_msgSend(v5, "trustState") == 1)
  {
    v7 = 1;
  }
  else
  {
    v7 = 3;
  }
  v8 = sub_10000EF14("octagon");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = OTCliqueStatusToString(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412290;
    v14 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "returning cached clique status: %@", (uint8_t *)&v13, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
  (*((void (**)(id, uint64_t, void *, _QWORD, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, v7, v10, 0, 0, 0, 0);

}

- (void)rpcTrustStatus:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  const void *v17;
  NSObject *v18;
  int64_t v19;
  const void *v20;
  NSObject *v21;
  const void *v22;
  NSObject *v23;
  const char *v24;
  const void *v25;
  void *v26;
  const void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  __int128 *p_buf;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  id v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  __int128 buf;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v6 = a3;
  v7 = a4;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = sub_1000EE108;
  v62 = sub_1000EE118;
  v63 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v9 = v59;
  v57 = v59[5];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadOrCreateAccountMetadata:", &v57));
  objc_storeStrong(v9 + 5, v57);

  if (v59[5])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    v12 = objc_msgSend(v11, "isLockedError:", v59[5]);

    if (v12)
    {
      v13 = sub_10000EF14("octagon");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device is locked! pending initialization on unlock", (uint8_t *)&buf, 2u);
      }

      v15 = v59[5];
      v16 = -1;
LABEL_10:
      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, v16, 0, 0, 0, 0, v15);
      goto LABEL_31;
    }
  }
  if (objc_msgSend(v10, "icloudAccountState") == 1)
  {
    v17 = sub_10000EF14("octagon");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "no account! returning clique status 'no account'", (uint8_t *)&buf, 2u);
    }

    v15 = 0;
    v16 = 4;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "useCachedAccountStatus"))
  {
    -[OTCuttlefishContext rpcTrustStatusCachedStatus:reply:](self, "rpcTrustStatusCachedStatus:reply:", v10, v7);
    goto LABEL_31;
  }
  v19 = -[OTCuttlefishContext checkForCKAccount:](self, "checkForCKAccount:", v6);
  if (!v19)
  {
    v22 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v24 = "Unknown cloudkit account status, returning cached trust value";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
    }
LABEL_24:

    -[OTCuttlefishContext rpcTrustStatusCachedStatus:reply:](self, "rpcTrustStatusCachedStatus:reply:", v10, v7);
    goto LABEL_31;
  }
  if (v19 == 3)
  {
    v20 = sub_10000EF14("octagon");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No cloudkit account present", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 4, 0, 0, 0, 0, 0);
    goto LABEL_31;
  }
  if (objc_msgSend(v10, "isInheritedAccount"))
  {
    v25 = sub_10000EF14("octagon");
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v24 = "Inherited account -- should circuit to cached trust value";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v26)
  {
    v27 = sub_10000EF14("octagon");
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 4, 0, 0, 0, 0, v26);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v65 = 0x3032000000;
    v66 = sub_1000EE108;
    v67 = sub_1000EE118;
    v68 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = sub_1000EE108;
    v55 = sub_1000EE118;
    v56 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = -1;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000F04C8;
    v31[3] = &unk_1002DDA90;
    v34 = &v47;
    v35 = &v51;
    v36 = &v39;
    v37 = &v58;
    p_buf = &buf;
    v31[4] = self;
    v32 = v10;
    v38 = &v43;
    objc_msgSend(v29, "trustStatusWithSpecificUser:reply:", v30, v31);

    (*((void (**)(id, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, id))v7 + 2))(v7, v44[3], *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v52[5], *((unsigned __int8 *)v48 + 24), *((unsigned __int8 *)v40 + 24), v59[5]);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(&buf, 8);
  }

LABEL_31:
  _Block_object_dispose(&v58, 8);

}

- (void)rpcFetchAllViableBottlesFromSource:(int64_t)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;

  v6 = a4;
  if (a3 == 1
    || (v7 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0))) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flowID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceSessionID"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F0300;
    v15[3] = &unk_1002DDAB8;
    v16 = v6;
    objc_msgSend(v11, "fetchViableBottlesWithSpecificUser:source:flowID:deviceSessionID:reply:", v12, a3, v13, v14, v15);

  }
  else
  {
    v8 = (void *)v7;
    v9 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v8);
  }

}

- (void)rpcFetchAllViableEscrowRecordsFromSource:(int64_t)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;

  v6 = a4;
  if (a3 == 1
    || (v7 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0))) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000F01B0;
    v13[3] = &unk_1002DEFD8;
    v14 = v6;
    objc_msgSend(v11, "fetchViableEscrowRecordsWithSpecificUser:source:reply:", v12, a3, v13);

    v8 = v14;
  }
  else
  {
    v8 = (void *)v7;
    v9 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v8);
  }

}

- (void)rpcInvalidateEscrowCache:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, void *);
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000F0084;
    v10[3] = &unk_1002DEF60;
    v11 = v4;
    objc_msgSend(v8, "removeEscrowCacheWithSpecificUser:reply:", v9, v10);

  }
}

- (void)fetchEscrowContents:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EFEFC;
    v10[3] = &unk_1002DDAE0;
    v11 = v4;
    objc_msgSend(v8, "fetchEscrowContentsWithSpecificUser:reply:", v9, v10);

  }
}

- (void)rpcRefetchCKKSPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
  v17 = CFSTR("RefetchCKKSPolicy");
  v15 = CFSTR("BecomeReady");
  v13 = CFSTR("Ready");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v10));
  v12 = objc_msgSend(v5, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("octagon-refetch-ckks-policy"), v6, v11, v4);

}

- (void)rpcFetchUserControllableViewsSyncingStatus:(id)a3
{
  _QWORD *v4;
  __CFString *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const void *v21;
  void (*v22)(_QWORD *, id, _QWORD);
  _QWORD *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  const void *v30;
  NSObject *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  _QWORD v37[5];
  _QWORD *v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  __CFString *v42;

  v4 = a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v9 = objc_msgSend(v8, "isPaused");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonNotInCliqueStates](OTStates, "OctagonNotInCliqueStates"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
      v14 = objc_msgSend(v10, "intersectsSet:", v13);

      if (v14)
      {
        v15 = sub_10000EF14("octagon-ckks");
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v17 = "device is not in clique, returning not syncing";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentState"));
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Error"));

      if (v20)
      {
        v21 = sub_10000EF14("octagon-ckks");
        v16 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v17 = "state machine in the error state, cannot service request";
          goto LABEL_12;
        }
LABEL_13:

        v22 = (void (*)(_QWORD *, id, _QWORD))v4[2];
        v23 = v4;
        v24 = 0;
        goto LABEL_25;
      }
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "syncingPolicy"));

    if (!v26)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000EFC38;
      v37[3] = &unk_1002DE4E0;
      v37[4] = self;
      v38 = v4;
      -[OTCuttlefishContext rpcRefetchCKKSPolicy:](self, "rpcRefetchCKKSPolicy:", v37);

      goto LABEL_26;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "syncingPolicy"));
    v29 = objc_msgSend(v28, "syncUserControllableViewsAsBoolean");

    v30 = sub_10000EF14("octagon-ckks");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v29)
        v32 = CFSTR("enabled");
      else
        v32 = CFSTR("disabled");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "syncingPolicy"));
      v35 = objc_msgSend(v34, "syncUserControllableViews");
      if (v35 >= 4)
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v35));
      else
        v36 = off_1002DDD18[v35];
      *(_DWORD *)buf = 138412546;
      v40 = v32;
      v41 = 2112;
      v42 = v36;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Returning user-controllable status as %@ (%@)", buf, 0x16u);

    }
    v22 = (void (*)(_QWORD *, id, _QWORD))v4[2];
    v23 = v4;
    v24 = v29;
LABEL_25:
    v22(v23, v24, 0);
    goto LABEL_26;
  }
  v6 = sub_10000EF14("octagon");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
  }

  ((void (*)(_QWORD *, _QWORD, __CFString *))v4[2])(v4, 0, v5);
LABEL_26:

}

- (void)rpcSetUserControllableViewsSyncingStatus:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD, void *);
  __CFString *v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const void *v13;
  NSObject *v14;
  const void *v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  const void *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  _QWORD v32[5];
  void (**v33)(id, _QWORD, void *);
  BOOL v34;
  id v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  uint8_t buf[4];
  const __CFString *v43;

  v4 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v7)
  {
    v8 = sub_10000EF14("octagon");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, 0, v7);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v35 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadOrCreateAccountMetadata:", &v35));
    v12 = (__CFString *)v35;

    if (v12)
    {
      v13 = sub_10000EF14("octagon-ckks");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error fetching acount state: %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v11, "isInheritedAccount"))
    {
      v15 = sub_10000EF14("octagon-ckks");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Account is inherited, user controllable views cannot be set", buf, 2u);
      }

      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 55, CFSTR("Cannot set user controllable views")));
      v6[2](v6, 0, v17);
    }
    else
    {
      v30 = v12;
      v31 = v11;
      v18 = CFSTR("DisableUserControllableViews");
      if (v4)
        v18 = CFSTR("EnableUserControllableViews");
      v17 = v18;
      v19 = sub_10000EF14("octagon-ckks");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = CFSTR("disabled");
        if (v4)
          v21 = CFSTR("enabled");
        *(_DWORD *)buf = 138412290;
        v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Settting user-controllable sync status as '%@'", buf, 0xCu);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
      v40 = v17;
      v38 = CFSTR("BecomeReady");
      v36 = CFSTR("Ready");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v37 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      v39 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      v41 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v25));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000EF9A8;
      v32[3] = &unk_1002DDB08;
      v34 = v4;
      v32[4] = self;
      v33 = v6;
      v27 = objc_msgSend(v29, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("octagon-set-policy"), v28, v26, v32);

      v12 = v30;
      v11 = v31;
    }

  }
}

- (void)rpcSetAccountSetting:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  const void *v18;
  NSObject *v19;
  const char *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  id v40;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v12 = objc_msgSend(v11, "isPaused");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
      v17 = objc_msgSend(v13, "intersectsSet:", v16);

      if ((v17 & 1) == 0)
      {
        v18 = sub_10000EF14("octagon-settings");
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = "device is not in a ready state to set account settings, returning";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (!-[OTCuttlefishContext waitForReady:](self, "waitForReady:", 10000000000))
    {
      v32 = sub_10000EF14("octagon-settings");
      v19 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v20 = "rpcSetAccountSetting: failed to reach Ready state";
        goto LABEL_15;
      }
LABEL_16:

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 73, CFSTR("Device is not in Octagon yet to set account settings")));
      v7[2](v7, v24);
LABEL_17:

      goto LABEL_18;
    }
    v21 = sub_10000EF14("octagon-settings");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting account settings %@", buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext mergedAccountSettings:](self, "mergedAccountSettings:", v6));
    -[OTCuttlefishContext setAccountSettings:](self, "setAccountSettings:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
    v37 = CFSTR("SetAccountSettings");
    v35 = CFSTR("BecomeReady");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success", CFSTR("Ready")));
    v34 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v36 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v38 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v29));
    v31 = objc_msgSend(v24, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("octagon-set-account-settings"), v25, v30, v7);

    goto LABEL_17;
  }
  v9 = sub_10000EF14("octagon");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
  }

  v7[2](v7, v8);
LABEL_18:

}

- (void)rpcSetLocalSecureElementIdentity:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  id v10;
  const void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000EF978;
  v16[3] = &unk_1002EAF10;
  v9 = v6;
  v17 = v9;
  v15 = 0;
  objc_msgSend(v8, "persistAccountChanges:error:", v16, &v15);
  v10 = v15;

  v11 = sub_10000EF14("octagon-se");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to persist identity: %@", buf, 0xCu);
    }

    v7[2](v7, v10);
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully persisted new SE identity: %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    objc_msgSend(v14, "handleFlag:", CFSTR("se_id_changed"));

    v7[2](v7, 0);
  }

}

- (void)rpcRemoveLocalSecureElementIdentityPeerID:(id)a3 reply:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  id v7;
  const void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v5 = (void (**)(id, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v12 = 0;
  objc_msgSend(v6, "persistAccountChanges:error:", &stru_1002DDB28, &v12);
  v7 = v12;

  v8 = sub_10000EF14("octagon-se");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to persist removal of identity: %@", buf, 0xCu);
    }

    v5[2](v5, v7);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully persisted removal of SE identity", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    objc_msgSend(v11, "handleFlag:", CFSTR("se_id_changed"));

    v5[2](v5, 0);
  }

}

- (void)rpcFetchTrustedSecureElementIdentities:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, _QWORD, void *);
  id v22;
  id v23;
  _BYTE buf[12];
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v23 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadOrCreateAccountMetadata:", &v23));
    v10 = v23;

    if (!v9 || v10)
    {
      v12 = sub_10000EF14("octagon");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v14;
        v25 = 2112;
        v26 = v15;
        v27 = 2112;
        v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to load account metadata for (%@,%@): %@", buf, 0x20u);

      }
      v11 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parsedSecureElementIdentity"));
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000EF4F0;
    v19[3] = &unk_1002DDB50;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v4;
    v18 = v11;
    v20 = v18;
    objc_msgSend(v16, "fetchTrustStateWithSpecificUser:reply:", v17, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
}

- (void)rpcFetchAccountSettings:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    v8 = sub_10000EF14("octagon-settings");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Fetching account settings", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000EF3BC;
    v14[3] = &unk_1002DDB78;
    v15 = v4;
    +[OTStashAccountSettingsOperation performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:](OTStashAccountSettingsOperation, "performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:", 0, 0, v10, v11, v12, v13, v14);

  }
}

- (void)rpcAccountWideSettingsWithForceFetch:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  const void *v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v7)
  {
    v8 = sub_10000EF14("octagon");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, 0, v7);
  }
  else
  {
    v10 = sub_10000EF14("octagon-settings");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Fetching account-wide settings with force: %{BOOL}d", buf, 8u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000EF26C;
    v16[3] = &unk_1002DDB78;
    v17 = v6;
    +[OTStashAccountSettingsOperation performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:](OTStashAccountSettingsOperation, "performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:", 1, v4, v12, v13, v14, v15, v16);

  }
}

- (void)rpcWaitForPriorityViewKeychainDataRecovery:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  OTCuttlefishContext *v23;
  void (**v24)(id, void *);
  uint8_t buf[4];
  void *v26;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    v8 = sub_10000EF14("octagon-ckks");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning to wait for CKKS Priority view download", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waitForState:wait:", CFSTR("Ready"), 120000000000));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Ready"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rpcWaitForPriorityViewProcessing"));

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000EEDC0;
      v21[3] = &unk_1002DDBA0;
      v22 = v14;
      v23 = self;
      v24 = v4;
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("wait-for-sync-reply"), v21));
      objc_msgSend(v16, "addDependency:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
      objc_msgSend(v17, "addOperation:", v16);

    }
    else
    {
      v18 = sub_10000EF14("SecError");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "octagon-ckks: rpcWaitForPriorityViewKeychainDataRecovery: failed to get to ready after timeout", buf, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 76, CFSTR("Octagon has not reached a ready state yet")));
      v4[2](v4, v20);

    }
  }

}

- (void)octagonPeerIDGivenBottleID:(id)a3 reply:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EEC60;
  v6[3] = &unk_1002EB208;
  v7 = a4;
  v5 = v7;
  -[OTCuttlefishContext rpcFetchPeerIDByBottleID:](self, "rpcFetchPeerIDByBottleID:", v6);

}

- (void)tlkRecoverabilityInOctagon:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  OTCuttlefishContext *v13;
  id v14;

  v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EE808;
  v11[3] = &unk_1002DDC18;
  v13 = self;
  v14 = a5;
  v12 = v8;
  v9 = v8;
  v10 = v14;
  -[OTCuttlefishContext rpcFetchAllViableBottlesFromSource:reply:](self, "rpcFetchAllViableBottlesFromSource:reply:", a4, v11);

}

- (void)rpcTlkRecoverabilityForEscrowRecordData:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;

  v8 = a3;
  v9 = a5;
  if (a4 == 1
    || (v10 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0))) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000EE5D0;
    v14[3] = &unk_1002DEFD8;
    v15 = v9;
    -[OTCuttlefishContext tlkRecoverabilityInOctagon:source:reply:](self, "tlkRecoverabilityInOctagon:source:reply:", v8, a4, v14);
    v11 = v15;
  }
  else
  {
    v11 = (void *)v10;
    v12 = sub_10000EF14("octagon-tlk-recoverability");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v11);
  }

}

- (void)rpcFetchTotalCountOfTrustedPeers:(id)a3
{
  void (**v4)(id, _UNKNOWN **, void *);
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _UNKNOWN **, void *);
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, _UNKNOWN **, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, &off_10030A700, v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EE5C4;
    v10[3] = &unk_1002DDC40;
    v11 = v4;
    objc_msgSend(v8, "fetchTrustedPeerCountWithSpecificUser:reply:", v9, v10);

  }
}

- (void)rerollWithReply:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  void *v6;
  const void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;

  v4 = (void (**)(id, void *))a3;
  v5 = objc_alloc_init((Class)OTOperationConfiguration);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v5));
  if (v6)
  {
    v7 = sub_10000EF14("octagon");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v6);
  }
  else
  {
    v21 = CFSTR("OctagonStateStashAccountSettingsForReroll");
    v19 = CFSTR("OctagonStateCreateIdentityForReroll");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary", CFSTR("OctagonStateVouchWithReroll")));
    v18 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](OTStates, "OctagonReadyStates"));
    v16 = objc_msgSend(v14, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("reroll"), v15, v13, v4);

  }
}

- (BOOL)postRepairCFU:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v13 = 0;
  objc_msgSend(v5, "postFollowUp:activeAccount:error:", 2, v6, &v13);
  v7 = v13;

  if (v7)
  {
    v8 = sub_10000EF14("SecError");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "octagon-health: CoreCDP repair failed: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v10 = sub_10000EF14("octagon-health");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CoreCDP post repair success", buf, 2u);
    }

  }
  return v7 == 0;
}

- (BOOL)shouldPostConfirmPasscodeCFU:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  unsigned int v7;
  const void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  const void *v12;
  BOOL v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class request:](-[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass"), "request:", &v16));
  v5 = v16;
  v6 = v5;
  if (!v4 || v5)
  {
    v12 = sub_10000EF14("octagon-health");
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    v11 = "Unable to acquire a EscrowRequest object: %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
LABEL_9:

    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      *a3 = v6;
    }
LABEL_11:
    v13 = 1;
    goto LABEL_12;
  }
  v15 = 0;
  v7 = objc_msgSend(v4, "pendingEscrowUpload:", &v15);
  v6 = v15;
  v8 = sub_10000EF14("octagon-health");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v10)
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    v11 = "Failed to check escrow prerecord status: %@";
    goto LABEL_8;
  }
  if (!v7)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "no pending prerecords, posting CFU", buf, 2u);
    }

    v6 = 0;
    goto LABEL_11;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "prerecord is pending, NOT posting CFU", buf, 2u);
  }

  v13 = 0;
  v6 = 0;
LABEL_12:

  return v13;
}

- (BOOL)recheckCKKSTrustStatus:(id *)a3
{
  void *v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  v6 = sub_10000EF14("octagon");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    if (a3)
    {
      v9 = objc_retainAutorelease(v5);
LABEL_17:
      v24 = 0;
      *a3 = v9;
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to re-check CKKS's trust status", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waitForState:wait:", CFSTR("Ready"), 10000000000));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Ready"));

  if (!v12)
  {
    v22 = sub_10000EF14("SecError");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon-ckks: recheckCKKSTrustStatus: failed to get to ready after timeout", buf, 2u);
    }

    if (a3)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 76, CFSTR("Octagon has not reached a ready state yet")));
      goto LABEL_17;
    }
LABEL_18:
    v24 = 0;
    goto LABEL_21;
  }
  v13 = sub_10000EF14("octagon-ckks");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
    *(_DWORD *)buf = 138412290;
    v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resetting CKKS(%@) peer providers", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v17 = objc_msgSend(v16, "sosEnabled");

  v18 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext octagonAdapter](self, "octagonAdapter"));
  v19 = (void *)v18;
  if (v17)
  {
    v30[0] = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v30[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));

  }
  else
  {
    v29 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext suggestTLKUploadNotifier](self, "suggestTLKUploadNotifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext requestPolicyCheckNotifier](self, "requestPolicyCheckNotifier"));
  objc_msgSend(v25, "beginTrustedOperation:suggestTLKUpload:requestPolicyCheck:", v21, v26, v27);

  v24 = 1;
LABEL_21:

  return v24;
}

- (BOOL)leaveTrust:(id *)a3
{
  const void *v4;
  NSObject *v5;
  const void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (-[OTSOSActualAdapter sosEnabled]_0() && ((v10 = 0, !sub_100207B48((CFTypeRef *)&v10)) || v10))
  {
    v7 = sub_10000EF14("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "failed to leave SOS circle: %@", buf, 0xCu);
    }

    v9 = v10;
    if (a3)
    {
      *a3 = v10;
    }
    else if (v10)
    {
      v10 = 0;
      CFRelease(v9);
    }
    return 0;
  }
  else
  {
    v4 = sub_10000EF14("octagon-health");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully left SOS", buf, 2u);
    }

    return 1;
  }
}

- (BOOL)postConfirmPasscodeCFU:(id *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  const void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v12 = 0;
  v7 = objc_msgSend(v5, "postFollowUp:activeAccount:error:", 3, v6, &v12);
  v8 = v12;

  if (v8)
  {
    v9 = sub_10000EF14("SecError");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "octagon-health: CoreCDP confirm existing secret failed: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (BOOL)processMoveRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  unsigned int v17;
  const void *v18;
  NSObject *v19;
  __CFString **v20;
  const void *v21;
  NSObject *v22;
  const void *v23;
  NSObject *v24;
  const void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  NSObject *v31;
  const void *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  void *v38;
  unsigned int v39;
  const void *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  const void *v45;
  const void *v46;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint8_t buf[4];
  NSObject *v56;

  v6 = a3;
  v52 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class request:](-[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass"), "request:", &v52));
  v8 = v52;
  v9 = v8;
  if (v7 && !v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v51 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadOrCreateAccountMetadata:", &v51));
    v12 = v51;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "altDSID"));
    if (v13)
      v14 = v12 == 0;
    else
      v14 = 0;
    v15 = v14;
    if (!v14)
    {
      v23 = sub_10000EF14("octagon-health");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to get altDSID: %@", buf, 0xCu);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v12);
      goto LABEL_44;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intendedFederation"));
    v17 = +[SecureBackup moveToFederationAllowed:altDSID:error:](SecureBackup, "moveToFederationAllowed:altDSID:error:", v16, v13, 0);

    if (!v17)
    {
      v48 = v11;
      v26 = sub_10000EF14("octagon-health");
      v19 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Secure terms not accepted, posting followup", buf, 2u);
      }
      v20 = &off_1002E8C70;
LABEL_29:

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
      objc_msgSend(v27, "logSuccessForEventNamed:", *v20);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v49 = 0;
      v30 = objc_msgSend(v28, "postFollowUp:activeAccount:error:", 4, v29, &v49);
      v31 = v49;

      if (v30)
      {
        v32 = sub_10000EF14("octagon-health");
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v34 = "Posted secure terms followup";
          v35 = v33;
          v36 = 2;
LABEL_37:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
        }
      }
      else
      {
        v45 = sub_10000EF14("SecError");
        v33 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v31;
          v34 = "octagon-health: Failed to post secure terms followup: %@";
          v35 = v33;
          v36 = 12;
          goto LABEL_37;
        }
      }
      v11 = v48;
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }
    if ((_os_feature_enabled_impl("Security", "OctagonEscrowMoveUnthrottled") & 1) == 0
      && objc_msgSend(v7, "escrowCompletedWithinLastSeconds:", 15552000.0))
    {
      v48 = v11;
      v18 = sub_10000EF14("octagon-health");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping escrow move request (rate limited), posting follow up", buf, 2u);
      }
      v20 = &off_1002E8C68;
      goto LABEL_29;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    objc_msgSend(v37, "logSuccessForEventNamed:", CFSTR("OctagonEventEscrowMoveTriggered"));

    v53 = SecEscrowRequestOptionFederationMove;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intendedFederation"));
    v54 = v38;
    v31 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));

    v50 = 0;
    v39 = objc_msgSend(v7, "triggerEscrowUpdate:options:error:", CFSTR("octagon-health"), v31, &v50);
    v33 = v50;
    if (v39)
    {
      v40 = sub_10000EF14("octagon-health");
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v42 = "Triggered escrow move";
        v43 = v41;
        v44 = 2;
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
      }
    }
    else
    {
      v46 = sub_10000EF14("SecError");
      v41 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v33;
        v42 = "octagon-health: Unable to trigger escrow move: %@";
        v43 = v41;
        v44 = 12;
        goto LABEL_41;
      }
    }

    goto LABEL_43;
  }
  v21 = sub_10000EF14("octagon-health");
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unable to acquire EscrowRequest object: %@", buf, 0xCu);
  }

  v15 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v9);
LABEL_45:

  return v15;
}

- (void)checkOctagonHealth:(BOOL)a3 repair:(BOOL)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  const void *v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  const void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  void (**v48)(id, _QWORD, void *);
  id v49;
  uint8_t buf[8];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  const __CFString *v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  const __CFString *v61;
  void *v62;

  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = sub_10000EF14("octagon-health");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Beginning checking overall Octagon Trust", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v12 = objc_msgSend(v11, "isPaused");

  if (!v12)
    goto LABEL_12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentState"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("WaitForClassCUnlock"));

  if (v15)
  {
    v16 = sub_10000EF14("octagon-health");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "currently waiting for class C unlock", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 57, CFSTR("Not performing health check, waiting for Class C Unlock")));
    v8[2](v8, 0, v18);

    goto LABEL_16;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentState"));
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("NoAccount"));

  if (!v21)
  {
LABEL_12:
    self->_skipRateLimitingCheck = a3;
    self->_repair = a4;
    self->_reportRateLimitingError = 1;
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentState"));
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("WaitForCDPCapableSecurityLevel"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      objc_msgSend(v28, "handleFlag:", CFSTR("idms_level"));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 69, CFSTR("Unable to perform health check on this account type")));
      v8[2](v8, 0, v29);

    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonHealthSourceStates](OTStates, "OctagonHealthSourceStates"));
      v61 = CFSTR("CDPHealthCheck");
      v59[0] = CFSTR("SecurityTrustCheck");
      v57 = CFSTR("TPHTrustCheck");
      v55[0] = CFSTR("CuttlefishTrustCheck");
      v53[0] = CFSTR("BecomeReady");
      v51[0] = CFSTR("Ready");
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v51[1] = CFSTR("WaitForUnlock");
      v52[0] = v46;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v52[1] = v45;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
      v54[0] = v44;
      v53[1] = CFSTR("HealthCheckReset");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v54[1] = v43;
      v53[2] = CFSTR("HealthCheckLeaveClique");
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v54[2] = v42;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 3));
      v56[0] = v41;
      v55[1] = CFSTR("WaitForUnlock");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v56[1] = v30;
      v55[2] = CFSTR("Untrusted");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v56[2] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 3));
      v58 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      v59[1] = CFSTR("WaitForCDP");
      v60[0] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
      v60[1] = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 2));
      v62 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v36));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000EE4AC;
      v47[3] = &unk_1002DDC68;
      objc_copyWeak(&v49, (id *)buf);
      v48 = v8;
      v38 = objc_msgSend(v39, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("octagon-trust-health-check"), v40, v37, v47);

      objc_destroyWeak(&v49);
    }
    objc_destroyWeak((id *)buf);
    goto LABEL_16;
  }
  v22 = sub_10000EF14("octagon-health");
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not performing health check, not currently signed in", buf, 2u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("Not performing health check, not currently signed in")));
  v8[2](v8, 0, v24);

LABEL_16:
}

- (void)waitForOctagonUpgrade:(id)a3
{
  void (**v4)(id, id);
  const void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  id v11;
  const void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  unsigned int v16;
  id v17;
  const void *v18;
  NSObject *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  const void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  const void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[2];
  uint8_t buf[4];
  id v58;
  NSErrorUserInfoKey v59;
  const __CFString *v60;

  v4 = (void (**)(id, id))a3;
  v5 = sub_10000EF14("octagon-sos");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v8 = objc_msgSend(v7, "sosEnabled");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    v47 = 0;
    v10 = objc_msgSend(v9, "circleStatus:", &v47);
    v11 = v47;

    v12 = sub_10000EF14("octagon-sos");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
        v46 = v11;
        v16 = objc_msgSend(v15, "circleStatus:", &v46);
        v17 = v46;

        *(_DWORD *)buf = 67109120;
        LODWORD(v58) = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SOS circle status: %d, cannot perform sos upgrade", buf, 8u);

        v11 = v17;
      }

      if (v11)
      {
        v18 = sub_10000EF14("SecError");
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v11;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "octagon-sos: error retrieving circle status: %@", buf, 0xCu);
        }
      }
      else
      {
        v30 = kSOSErrorDomain;
        v59 = NSLocalizedDescriptionKey;
        v60 = CFSTR("Not in circle");
        v19 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
        v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, 1037, v19));
      }

      v4[2](v4, v11);
      goto LABEL_27;
    }
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "in sos circle!, attempting upgrade", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v23 = objc_msgSend(v22, "isPaused");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v25 = v24;
    if (v23)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentState"));
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Ready"));

      if (v27)
      {
        v28 = sub_10000EF14("octagon-sos");
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade: already ready, returning", buf, 2u);
        }

LABEL_26:
        v4[2](v4, 0);
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "waitForState:wait:", CFSTR("Ready"), 10000000000));
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("Ready"));

      v33 = sub_10000EF14("octagon-sos");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade: in ready (after waiting), returning", buf, 2u);
        }

        goto LABEL_26;
      }
      if (v35)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade: fail to get to ready after timeout, attempting upgrade", buf, 2u);
      }

    }
    v56[0] = CFSTR("WaitForCDP");
    v56[1] = CFSTR("Untrusted");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v36));

    v54 = CFSTR("AttemptSOSUpgradeDetermineCDPState");
    v52 = CFSTR("AttemptSOSUpgrade");
    v50 = CFSTR("BecomeReady");
    v48 = CFSTR("Ready");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
    v49 = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    v51 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    v53 = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
    v55 = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v42));

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v45 = objc_msgSend(v44, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("sos-upgrade-to-ready"), v37, v43, v4);

    goto LABEL_27;
  }
  v20 = sub_10000EF14("octagon-sos");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "sos not enabled, nothing to do for waitForOctagonUpgrade", buf, 2u);
  }

  v4[2](v4, 0);
LABEL_28:

}

- (BOOL)machineIDOnMemoizedList:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  __int128 *p_buf;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v7)
  {
    v8 = sub_10000EF14("octagon");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", (uint8_t *)&buf, 0xCu);
    }

    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = sub_1000EE108;
    v26 = sub_1000EE118;
    v27 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000EE33C;
    v15[3] = &unk_1002DDC90;
    p_buf = &buf;
    v16 = v6;
    v18 = &v19;
    objc_msgSend(v11, "fetchAllowedMachineIDsWithSpecificUser:reply:", v12, v15);

    if (a4)
    {
      v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v13)
        *a4 = objc_retainAutorelease(v13);
    }
    v10 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

- (id)currentlyEnforcingIDMSTDL:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000EE108;
  v15 = sub_1000EE118;
  v16 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000EE220;
  v10[3] = &unk_1002DDCB8;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v5, "dumpWithSpecificUser:reply:", v6, v10);

  v7 = (void *)v12[5];
  if (v7)
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else if (*((_BYTE *)v18 + 24))
  {
    v8 = &__kCFBooleanTrue;
  }
  else
  {
    v8 = &__kCFBooleanFalse;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)egoPeerStatus:(id *)a3
{
  void *v5;
  const void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v5)
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", (uint8_t *)&buf, 0xCu);
    }

    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = sub_1000EE108;
    v23 = sub_1000EE118;
    v24 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_1000EE108;
    v18 = sub_1000EE118;
    v19 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000EE120;
    v13[3] = &unk_1002DDCE0;
    v13[4] = &v14;
    v13[5] = &buf;
    objc_msgSend(v9, "trustStatusWithSpecificUser:reply:", v10, v13);

    if (a3)
    {
      v11 = (void *)v15[5];
      if (v11)
        *a3 = objc_retainAutorelease(v11);
    }
    v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&buf, 8);
  }

  return v8;
}

- (void)rpcResetAccountCDPContentsWithIdmsTargetContext:(id)a3 idmsCuttlefishPassword:(id)a4 notifyIdMS:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  NSObject *v23;
  uint64_t IsInternalRelease;
  void *v25;
  void *v26;
  const void *v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  _QWORD v31[4];
  void (**v32)(id, void *);
  id v33;
  uint8_t buf[4];
  id v35;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0));
  if (v13)
  {
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v12[2](v12, v13);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "altDSID"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
      v33 = 0;
      v30 = objc_msgSend(v18, "accountIsDemoAccountByAltDSID:error:", v17, &v33);
      v19 = v33;

      if (v19)
      {
        v22 = sub_10000EF14("SecError");
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v19;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon-authkit: failed to fetch demo account flag: %@", buf, 0xCu);
        }

      }
      IsInternalRelease = SecIsInternalRelease(v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000EDFDC;
      v31[3] = &unk_1002DEF60;
      v32 = v12;
      objc_msgSend(v25, "resetAccountCDPContentsWithSpecificUser:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:", v26, v10, v11, v7, IsInternalRelease, v30, v31);

    }
    else
    {
      v27 = sub_10000EF14("authkit");
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        *(_DWORD *)buf = 138412290;
        v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

      }
      v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
      v12[2](v12, v19);
    }

  }
}

- (void)getAccountMetadataWithReply:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v10 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadOrCreateAccountMetadata:", &v10));
  v7 = v10;

  if (!v6 || v7)
  {
    v8 = sub_10000EF14("octagon-account-metadata");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "error fetching account metadata: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v7);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, v6, 0);
  }

}

- (void)clearContextState
{
  NSString *bottleID;
  NSString *bottleSalt;
  NSData *entropy;
  NSString *idmsTargetContext;
  NSString *idmsCuttlefishPassword;
  TrustedPeersHelperHealthCheckResult *healthCheckResults;

  bottleID = self->_bottleID;
  self->_bottleID = 0;

  bottleSalt = self->_bottleSalt;
  self->_bottleSalt = 0;

  entropy = self->_entropy;
  self->_entropy = 0;

  idmsTargetContext = self->_idmsTargetContext;
  self->_resetReason = 0;
  self->_idmsTargetContext = 0;

  idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
  self->_idmsCuttlefishPassword = 0;

  self->_notifyIdMS = 0;
  -[OTCuttlefishContext setAccountSettings:](self, "setAccountSettings:", 0);
  *(_WORD *)&self->_skipRateLimitingCheck = 0;
  self->_reportRateLimitingError = 0;
  -[OTCuttlefishContext setRecoveryKey:](self, "setRecoveryKey:", 0);
  -[OTCuttlefishContext setInheritanceKey:](self, "setInheritanceKey:", 0);
  -[OTCuttlefishContext setCustodianRecoveryKey:](self, "setCustodianRecoveryKey:", 0);
  healthCheckResults = self->_healthCheckResults;
  self->_healthCheckResults = 0;

}

- (BOOL)checkAllStateCleared
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext inheritanceKey](self, "inheritanceKey"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext custodianRecoveryKey](self, "custodianRecoveryKey"));
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext recoveryKey](self, "recoveryKey"));
      if (v6
        || self->_bottleID
        || self->_bottleSalt
        || self->_entropy
        || self->_resetReason
        || self->_idmsTargetContext
        || self->_idmsCuttlefishPassword
        || self->_notifyIdMS)
      {
        v4 = 0;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
        v4 = !v8
          && !self->_skipRateLimitingCheck
          && !self->_repair
          && !self->_reportRateLimitingError
          && self->_healthCheckResults == 0;

        v6 = 0;
      }

    }
  }

  return v4;
}

- (BOOL)fetchSendingMetricsPermitted:(id *)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  LOBYTE(a3) = -[OTCuttlefishContext canSendMetricsUsingAccountState:](self, "canSendMetricsUsingAccountState:", objc_msgSend(v5, "fetchSendingMetricsPermitted:", a3));

  return (char)a3;
}

- (BOOL)persistSendingMetricsPermitted:(BOOL)a3 error:(id *)a4
{
  void *v6;
  unsigned __int8 v7;

  if (a3)
    -[OTCuttlefishContext setMetricsStateToActive](self, "setMetricsStateToActive");
  else
    -[OTCuttlefishContext setMetricsStateToInactive](self, "setMetricsStateToInactive");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v7 = objc_msgSend(v6, "persistSendingMetricsPermitted:error:", -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon"), a4);

  return v7;
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 80, 1);
}

- (OTFollowup)followupHandler
{
  return (OTFollowup *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFollowupHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 112, 1);
}

- (void)setActiveAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)pairingUUID
{
  return self->_pairingUUID;
}

- (void)setPairingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingUUID, a3);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (OTCuttlefishAccountStateHolder)accountMetadataStore
{
  return self->_accountMetadataStore;
}

- (void)setAccountMetadataStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountMetadataStore, a3);
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 144, 1);
}

- (CKKSNearFutureScheduler)apsRateLimiter
{
  return self->_apsRateLimiter;
}

- (void)setApsRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_apsRateLimiter, a3);
}

- (CKKSNearFutureScheduler)sosConsistencyRateLimiter
{
  return self->_sosConsistencyRateLimiter;
}

- (void)setSosConsistencyRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_sosConsistencyRateLimiter, a3);
}

- (CKKSNearFutureScheduler)checkMetricsTrigger
{
  return self->_checkMetricsTrigger;
}

- (void)setCheckMetricsTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_checkMetricsTrigger, a3);
}

- (OTMetricsSessionData)sessionMetrics
{
  return (OTMetricsSessionData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSessionMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (int)shouldSendMetricsForOctagon
{
  return self->_shouldSendMetricsForOctagon;
}

- (void)setShouldSendMetricsForOctagon:(int)a3
{
  self->_shouldSendMetricsForOctagon = a3;
}

- (void)setCkks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CKKSCloudKitAccountStateTrackingProvider)accountStateTracker
{
  return (CKKSCloudKitAccountStateTrackingProvider *)objc_getProperty(self, a2, 192, 1);
}

- (OTDeviceInformationAdapter)deviceAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 200, 1);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 208, 1);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 216, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 224, 1);
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 232, 1);
}

- (OTTooManyPeersAdapter)tooManyPeersAdapter
{
  return (OTTooManyPeersAdapter *)objc_getProperty(self, a2, 240, 1);
}

- (OTTapToRadarAdapter)tapToRadarAdapter
{
  return (OTTapToRadarAdapter *)objc_getProperty(self, a2, 248, 1);
}

- (CKKSCondition)pendingEscrowCacheWarmup
{
  return (CKKSCondition *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPendingEscrowCacheWarmup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 272, 1);
}

- (void)setPolicyOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (SecLaunchSequence)launchSequence
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 280, 1);
}

- (void)setLaunchSequence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 288, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (CKAccountInfo)cloudKitAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCloudKitAccountInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (CKKSCondition)cloudKitAccountStateKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 304, 1);
}

- (void)setCloudKitAccountStateKnown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (CKKSNearFutureScheduler)suggestTLKUploadNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSuggestTLKUploadNotifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (CKKSNearFutureScheduler)requestPolicyCheckNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRequestPolicyCheckNotifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (CKKSNearFutureScheduler)upgradeUserControllableViewsRateLimiter
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 328, 1);
}

- (void)setUpgradeUserControllableViewsRateLimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (CKKSNearFutureScheduler)fixupRetryScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 336, 1);
}

- (void)setFixupRetryScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 344, 1);
}

- (void)setReachabilityTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryKey, a3);
}

- (OTCustodianRecoveryKey)custodianRecoveryKey
{
  return self->_custodianRecoveryKey;
}

- (void)setCustodianRecoveryKey:(id)a3
{
  objc_storeStrong((id *)&self->_custodianRecoveryKey, a3);
}

- (OTInheritanceKey)inheritanceKey
{
  return self->_inheritanceKey;
}

- (void)setInheritanceKey:(id)a3
{
  objc_storeStrong((id *)&self->_inheritanceKey, a3);
}

- (OctagonAPSReceiver)apsReceiver
{
  return (OctagonAPSReceiver *)objc_getProperty(self, a2, 376, 1);
}

- (void)setApsReceiver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (CKKSPeerProvider)octagonAdapter
{
  return (CKKSPeerProvider *)objc_getProperty(self, a2, 384, 1);
}

- (void)setOctagonAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 392, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 400, 1);
}

- (BOOL)initialBecomeUntrustedPosted
{
  return self->_initialBecomeUntrustedPosted;
}

- (void)setInitialBecomeUntrustedPosted:(BOOL)a3
{
  self->_initialBecomeUntrustedPosted = a3;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (void)setMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_machineID, a3);
}

- (OTAccountSettings)accountSettings
{
  return (OTAccountSettings *)objc_getProperty(self, a2, 416, 1);
}

- (void)setAccountSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSettings, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_escrowRequestClass, 0);
  objc_storeStrong((id *)&self->_octagonAdapter, 0);
  objc_storeStrong((id *)&self->_apsReceiver, 0);
  objc_storeStrong((id *)&self->_inheritanceKey, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryKey, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_fixupRetryScheduler, 0);
  objc_storeStrong((id *)&self->_upgradeUserControllableViewsRateLimiter, 0);
  objc_storeStrong((id *)&self->_requestPolicyCheckNotifier, 0);
  objc_storeStrong((id *)&self->_suggestTLKUploadNotifier, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountStateKnown, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountInfo, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_launchSequence, 0);
  objc_storeStrong((id *)&self->_policyOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingEscrowCacheWarmup, 0);
  objc_storeStrong((id *)&self->_tapToRadarAdapter, 0);
  objc_storeStrong((id *)&self->_tooManyPeersAdapter, 0);
  objc_storeStrong((id *)&self->_sosAdapter, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_authKitAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_deviceAdapter, 0);
  objc_storeStrong((id *)&self->_accountStateTracker, 0);
  objc_storeStrong((id *)&self->_ckks, 0);
  objc_storeStrong((id *)&self->_sessionMetrics, 0);
  objc_storeStrong((id *)&self->_checkMetricsTrigger, 0);
  objc_storeStrong((id *)&self->_sosConsistencyRateLimiter, 0);
  objc_storeStrong((id *)&self->_apsRateLimiter, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_accountMetadataStore, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_pairingUUID, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_followupHandler, 0);
  objc_storeStrong((id *)&self->_cuttlefishXPCWrapper, 0);
  objc_storeStrong((id *)&self->_healthCheckResults, 0);
  objc_storeStrong((id *)&self->_idmsCuttlefishPassword, 0);
  objc_storeStrong((id *)&self->_idmsTargetContext, 0);
  objc_storeStrong((id *)&self->_entropy, 0);
  objc_storeStrong((id *)&self->_bottleSalt, 0);
  objc_storeStrong((id *)&self->_bottleID, 0);
}

@end
