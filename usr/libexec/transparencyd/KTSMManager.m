@implementation KTSMManager

- (KTSMManager)initWithDependencies:(id)a3
{
  id v4;
  KTSMManager *v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  KTOptInStateHolder *v8;
  id v9;
  KTCondition *v10;
  KTCondition *v11;
  KTCondition *v12;
  dispatch_queue_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _TtC13transparencyd10KTWatchdog *v18;
  KTManagerWatchdogControl *v19;
  void *v20;
  KTManagerWatchdogControl *v21;
  _TtC13transparencyd10KTWatchdog *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  KTStateMachine *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  KTStateMachine *v37;
  void *v38;
  KTStateMachine *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  KTNearFutureScheduler *v51;
  KTNearFutureScheduler *v52;
  KTNearFutureScheduler *v53;
  KTNearFutureScheduler *v54;
  KTNearFutureScheduler *v55;
  KTNearFutureScheduler *v56;
  KTNearFutureScheduler *v57;
  KTNearFutureScheduler *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  KTNearFutureScheduler *v64;
  KTNearFutureScheduler *v65;
  KTNearFutureScheduler *v66;
  KTNearFutureScheduler *v67;
  KTNearFutureScheduler *v68;
  KTNearFutureScheduler *v69;
  KTNearFutureScheduler *v70;
  int *v71;
  KTNearFutureScheduler *v72;
  void *v73;
  void *v74;
  void *v75;
  KTNearFutureScheduler *v76;
  KTNearFutureScheduler *v77;
  KTNearFutureScheduler *v78;
  KTNearFutureScheduler *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  int *v83;
  id v85;
  id *v86;
  id *v87;
  id *v88;
  _QWORD v89[4];
  id v90;
  _QWORD handler[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  int *v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  id location;
  objc_super v120;

  v4 = a3;
  v120.receiver = self;
  v120.super_class = (Class)KTSMManager;
  v5 = -[KTSMManager init](&v120, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("KTSMManager", 0);
    -[KTSMManager setQueue:](v5, "setQueue:", v6);

    v7 = dispatch_queue_create("KT-statemachine", 0);
    -[KTSMManager setStateMachineQueue:](v5, "setStateMachineQueue:", v7);

    -[KTSMManager setDeps:](v5, "setDeps:", v4);
    v8 = objc_alloc_init(KTOptInStateHolder);
    -[KTSMManager setOptInStates:](v5, "setOptInStates:", v8);

    v9 = objc_alloc_init((Class)NSOperationQueue);
    -[KTSMManager setOperationQueue:](v5, "setOperationQueue:", v9);

    v10 = objc_alloc_init(KTCondition);
    -[KTSMManager setInitializedComplete:](v5, "setInitializedComplete:", v10);

    v11 = objc_alloc_init(KTCondition);
    -[KTSMManager setReadyComplete:](v5, "setReadyComplete:", v11);

    v12 = objc_alloc_init(KTCondition);
    -[KTSMManager setSignaturesComplete:](v5, "setSignaturesComplete:", v12);

    -[KTSMManager setShouldPokeIDSUponSigning:](v5, "setShouldPokeIDSUponSigning:", 1);
    v13 = dispatch_queue_create("signatures", 0);
    -[KTSMManager setSignatureQueue:](v5, "setSignatureQueue:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[KTSMManager setCkFetchReasons:](v5, "setCkFetchReasons:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[KTSMManager setInflightCKFetchDependencies:](v5, "setInflightCKFetchDependencies:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager createSuccesfulCKFetchDependency](v5, "createSuccesfulCKFetchDependency"));
    -[KTSMManager setSuccessfulCKFetchDependency:](v5, "setSuccessfulCKFetchDependency:", v16);

    v17 = objc_msgSend(objc_alloc((Class)SecLaunchSequence), "initWithRocketName:", CFSTR("com.apple.sear.KTSMManager"));
    -[KTSMManager setLaunch:](v5, "setLaunch:", v17);

    v18 = [_TtC13transparencyd10KTWatchdog alloc];
    v19 = [KTManagerWatchdogControl alloc];
    v85 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dew"));
    v21 = -[KTManagerWatchdogControl initWithDew:](v19, "initWithDew:", v20);
    v22 = -[KTWatchdog initWithControl:](v18, "initWithControl:", v21);
    -[KTSMManager setWatchdog:](v5, "setWatchdog:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "idsConfigBag"));

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyIDSConfigBag sharedInstance](TransparencyIDSConfigBag, "sharedInstance"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
      objc_msgSend(v26, "setIdsConfigBag:", v25);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v5, "idsServerBagUpdate", IDSServerBagFinishedLoadingNotification, 0);

    v28 = [KTStateMachine alloc];
    v88 = (id *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](KTStates, "KTStateMap"));
    v87 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "allKeys"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v87));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates AllKTFlags](KTStates, "AllKTFlags"));
    v31 = objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](v5, "stateMachineQueue"));
    v86 = (id *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "lockStateTracker"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "reachabilityTracker"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "idsConfigBag"));
    v37 = v28;
    v38 = (void *)v31;
    v39 = -[KTStateMachine initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:](v37, "initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:", CFSTR("KTStateMachine"), v29, v30, CFSTR("PublicKeysInitialFetch"), v31, v5, v32, v34, v36);
    -[KTSMManager setStateMachine:](v5, "setStateMachine:", v39);

    -[KTSMManager setManateeViewToken:](v5, "setManateeViewToken:", 0xFFFFFFFFLL);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](v5, "stateMachine"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    objc_msgSend(v41, "setFlagHandler:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "cloudKitAccountTracker"));
    v44 = objc_msgSend(v43, "registerForNotificationsOfCloudKitAccountStatusChange:", v5);

    location = 0;
    objc_initWeak(&location, v5);
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_100034A24;
    v117[3] = &unk_10023D0B8;
    objc_copyWeak(&v118, &location);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "octagonOperations"));
    objc_msgSend(v46, "setOctagonObserver:", v117);

    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_100034B54;
    v115[3] = &unk_10023D100;
    objc_copyWeak(&v116, &location);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "octagonOperations"));
    objc_msgSend(v48, "setCkksViewObserver:", v115);

    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_100034CE8;
    v113[3] = &unk_10023D148;
    objc_copyWeak(&v114, &location);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "idsAccountTracker"));
    objc_msgSend(v50, "setIdsObserver:", v113);

    v51 = [KTNearFutureScheduler alloc];
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_100034E34;
    v111[3] = &unk_10023A970;
    objc_copyWeak(&v112, &location);
    v52 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v51, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("publicKeyFetch"), 5000000000, 7200000000000, 0, 0, v111, 2.0);
    -[KTSMManager setPublicKeyFetcher:](v5, "setPublicKeyFetcher:", v52);

    v53 = [KTNearFutureScheduler alloc];
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_100034E60;
    v109[3] = &unk_10023A970;
    objc_copyWeak(&v110, &location);
    v54 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v53, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("retryEnsureIdentity"), 5000000000, 3600000000000, 0, 0, v109, 1.2);
    -[KTSMManager setRetryEnsureIdentity:](v5, "setRetryEnsureIdentity:", v54);

    v55 = [KTNearFutureScheduler alloc];
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_100034E8C;
    v107[3] = &unk_10023A970;
    objc_copyWeak(&v108, &location);
    v56 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v55, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("retryGetPrimaryAccount"), 5000000000, 7200000000000, 0, 0, v107, 2.0);
    -[KTSMManager setRetryGetPrimaryAccount:](v5, "setRetryGetPrimaryAccount:", v56);

    v57 = [KTNearFutureScheduler alloc];
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_100034EB8;
    v105[3] = &unk_10023A970;
    objc_copyWeak(&v106, &location);
    v58 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v57, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("ck-zone-fetcher"), 2000000000, 3600000000000, 0, 0, v105, 1.2);
    -[KTSMManager setCkFetchScheduler:](v5, "setCkFetchScheduler:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "logger"));
    v61 = objc_opt_self(v5);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "ckFetchScheduler"));
    objc_msgSend(v60, "addNFSReporting:", v63);

    v64 = [KTNearFutureScheduler alloc];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_100034EE4;
    v103[3] = &unk_10023A970;
    objc_copyWeak(&v104, &location);
    v65 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v64, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("checkKTAccountKey"), 1000000000, 86400000000000, 0, 0, v103, 2.0);
    -[KTSMManager setCheckKTAccountKeyScheduler:](v5, "setCheckKTAccountKeyScheduler:", v65);

    v66 = [KTNearFutureScheduler alloc];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_100034F10;
    v101[3] = &unk_10023A970;
    objc_copyWeak(&v102, &location);
    v67 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v66, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("checkIDSRegistration"), 1200000000000, 43200000000000, 0, 0, v101, 2.0);
    -[KTSMManager setCheckIDSRegistration:](v5, "setCheckIDSRegistration:", v67);

    v68 = [KTNearFutureScheduler alloc];
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_100034F3C;
    v99[3] = &unk_10023A970;
    objc_copyWeak(&v100, &location);
    v69 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v68, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("checkKTSignatures"), 2000000000, 43200000000000, 0, 0, v99, 2.0);
    -[KTSMManager setCheckKTSignatureScheduler:](v5, "setCheckKTSignatureScheduler:", v69);

    v70 = [KTNearFutureScheduler alloc];
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472;
    v97[2] = sub_100034F6C;
    v97[3] = &unk_10023A390;
    v71 = v5;
    v98 = v71;
    v72 = -[KTNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v70, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("manateeViewChanged"), 5000000000, 90000000000, 0, 0, v97);
    objc_msgSend(v71, "setManateeViewChangedScheduler:", v72);

    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "deps"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "logger"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "manateeViewChangedScheduler"));
    objc_msgSend(v74, "addNFSReporting:", v75);

    v76 = [KTNearFutureScheduler alloc];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100034F74;
    v95[3] = &unk_10023A970;
    objc_copyWeak(&v96, &location);
    v77 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v76, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("fillServerOptInStatus"), 2000000000, 3600000000000, 0, 0, v95, 1.5);
    objc_msgSend(v71, "setServerOptInScheduler:", v77);

    v78 = [KTNearFutureScheduler alloc];
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_100034FA0;
    v93[3] = &unk_10023A970;
    objc_copyWeak(&v94, &location);
    v79 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v78, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("retryPendingValidations"), 10000000, 300000000000, 0, 0, v93, 2.0);
    objc_msgSend(v71, "setRetryPendingValidations:", v79);

    v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "queue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100034FCC;
    handler[3] = &unk_10023D170;
    objc_copyWeak(&v92, &location);
    notify_register_dispatch("com.apple.security.view-change.Manatee", v71 + 3, v80, handler);

    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "watchdog"));
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_100035010;
    v89[3] = &unk_10023D1B8;
    objc_copyWeak(&v90, &location);
    objc_msgSend(v81, "addWithNamed:watcher:", CFSTR("stateMachineQueue"), v89);

    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "watchdog"));
    objc_msgSend(v82, "resume");

    objc_msgSend(v71, "startMetrics");
    v83 = v71;
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v96);

    objc_destroyWeak(&v100);
    objc_destroyWeak(&v102);
    objc_destroyWeak(&v104);
    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);
    objc_destroyWeak(&v110);
    objc_destroyWeak(&v112);
    objc_destroyWeak(&v114);
    objc_destroyWeak(&v116);
    objc_destroyWeak(&v118);
    objc_destroyWeak(&location);
    v4 = v85;
  }

  return v5;
}

- (void)dealloc
{
  int manateeViewToken;
  objc_super v4;

  manateeViewToken = self->_manateeViewToken;
  if (manateeViewToken != -1)
    notify_cancel(manateeViewToken);
  v4.receiver = self;
  v4.super_class = (Class)KTSMManager;
  -[KTSMManager dealloc](&v4, "dealloc");
}

- (NSNumber)smState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](KTStates, "KTStateMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));

  return (NSNumber *)v6;
}

- (void)startStateMachine
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "startOperation");

}

- (void)haltStateMachine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager publicKeyFetcher](self, "publicKeyFetcher"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager retryEnsureIdentity](self, "retryEnsureIdentity"));
  objc_msgSend(v4, "cancel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager retryGetPrimaryAccount](self, "retryGetPrimaryAccount"));
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkKTAccountKeyScheduler](self, "checkKTAccountKeyScheduler"));
  objc_msgSend(v6, "cancel");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkKTSignatureScheduler](self, "checkKTSignatureScheduler"));
  objc_msgSend(v7, "cancel");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInScheduler](self, "serverOptInScheduler"));
  objc_msgSend(v8, "cancel");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager ckFetchScheduler](self, "ckFetchScheduler"));
  objc_msgSend(v9, "cancel");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSRegistration](self, "checkIDSRegistration"));
  objc_msgSend(v10, "cancel");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager manateeViewChangedScheduler](self, "manateeViewChangedScheduler"));
  objc_msgSend(v11, "cancel");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager retryPendingValidations](self, "retryPendingValidations"));
  objc_msgSend(v12, "cancel");

  v13 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v13, "haltOperation");

}

- (void)startMetrics
{
  void *v3;
  void *v4;
  double v5;
  _QWORD v6[4];
  id v7;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "logger"));
  v5 = SFAnalyticsSamplerIntervalOncePerReport;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100035380;
  v6[3] = &unk_10023B918;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "addMultiSamplerForName:withTimeInterval:block:", CFSTR("transparencydMultiSampler"), v6, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035C54;
  v8[3] = &unk_10023B3A8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)accountChanged:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  KTPendingFlag *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D1F8);
  v8 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "account %@ state changed to: %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("AccountChanged"), 0, 0.1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v10, "handlePendingFlag:", v9);

}

- (void)triggerPublicKeyFetch
{
  void *v3;
  KTPendingFlag *v4;

  v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("FetchPublicKeys"), 2, 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)triggerEnsureIdentity
{
  void *v3;
  KTPendingFlag *v4;

  v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("EnsureIdentity"), 3, 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)triggerGetPrimaryAccount
{
  void *v3;
  KTPendingFlag *v4;

  v4 = -[KTPendingFlag initWithFlag:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:delayInSeconds:", CFSTR("AccountChanged"), 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)storeNeedsUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D218);
  v5 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "public key store request update: %@", (uint8_t *)&v6, 0xCu);
  }
  -[KTSMManager triggerPublicKeyFetch](self, "triggerPublicKeyFetch");

}

- (void)triggerCheckIDSRegistration
{
  void *v3;
  KTPendingFlag *v4;

  v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("CheckIDSRegistration"), 2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)triggerCheckAccountIdentityChanged
{
  void *v3;
  KTPendingFlag *v4;

  v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("CheckKTAccountKeyChanged"), 2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)triggerOptInStateChange
{
  void *v3;
  KTPendingFlag *v4;

  v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("ChangeOptInState"), 2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)triggerConfigBagFetch:(double)a3
{
  void *v4;
  KTPendingFlag *v5;

  v5 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("ConfigBagFetch"), 2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v4, "handlePendingFlag:", v5);

}

- (void)triggerKTAccountKeySignature:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003637C;
  v6[3] = &unk_10023D240;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)performRegistrationSignatures:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  v17 = 0;
  v5 = -[KTSMManager waitUntilReadyForRPCForOperation:fast:error:](self, "waitUntilReadyForRPCForOperation:fast:error:", CFSTR("performRegistrationSignatures"), 0, &v17);
  v6 = v17;
  if ((v5 & 1) != 0)
  {
    v21 = CFSTR("SignRegistrationData");
    v19 = CFSTR("Ready");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep success](KTStateTransitionPathStep, "success"));
    v20 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPath pathFromDictionary:](KTStateTransitionPath, "pathFromDictionary:", v9));

    v18 = CFSTR("Ready");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036600;
    v15[3] = &unk_10023D268;
    v16 = v4;
    v14 = objc_msgSend(v13, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("sign-registration-data"), v12, v10, v15);

  }
  else
  {
    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }

}

- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  BOOL v33;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager initializedComplete](self, "initializedComplete"));
  v10 = objc_msgSend(v9, "wait:", 5000000000);

  if (v10)
  {
    v11 = kTransparencyErrorInternal;
    v39[0] = CFSTR("state");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentState"));
    v14 = (void *)v13;
    v15 = CFSTR("-");
    if (v13)
      v15 = (const __CFString *)v13;
    v39[1] = CFSTR("opName");
    v40[0] = v15;
    v40[1] = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", v11, -367, 0, v16, CFSTR("not ready yet")));

    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023D288);
    v18 = qword_1002A4588;
    if (!os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v38 = v17;
    v19 = "Haven't yet initialized State machine; expect failure: %@";
    goto LABEL_23;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lockStateTracker"));
  v22 = objc_msgSend(v21, "hasBeenUnlocked");

  if ((v22 & 1) == 0)
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -345, CFSTR("not unlocked yet")));
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023D2A8);
    v18 = qword_1002A4588;
    if (!os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v38 = v17;
    v19 = "Haven't yet unlocked: %@";
    goto LABEL_23;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
  v24 = v23;
  if (v6)
    v25 = 500000000;
  else
    v25 = 2000000000;
  v26 = objc_msgSend(v23, "wait:", v25);

  if (!v26)
  {
    v17 = 0;
    v33 = 1;
    goto LABEL_27;
  }
  v27 = kTransparencyErrorInternal;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine", CFSTR("state")));
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentState"));
  v30 = (void *)v29;
  v31 = CFSTR("-");
  if (v29)
    v31 = (const __CFString *)v29;
  v35[1] = CFSTR("opName");
  v36[0] = v31;
  v36[1] = v8;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v17 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", v27, -368, 0, v32, CFSTR("not ready yet")));

  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D2C8);
  v18 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v17;
    v19 = "Haven't yet reached ready: %@";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
  }
LABEL_24:
  if (a5)
  {
    v17 = objc_retainAutorelease(v17);
    v33 = 0;
    *a5 = v17;
  }
  else
  {
    v33 = 0;
  }
LABEL_27:

  return v33;
}

- (void)triggerIDSRepair:(double)a3 selfValidationResult:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036B94;
  block[3] = &unk_10023D2F0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

- (BOOL)maybeUpdateMonitorState:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateMonitor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ktStatus"));
  v8 = objc_msgSend(v7, "selfStatus");

  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D310);
  v9 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = (_DWORD)v8;
    v12 = 1024;
    v13 = v8 != 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Maybe update monitor selfStatus: %d: %d", (uint8_t *)v11, 0xEu);
  }
  if (v8)
    -[KTSMManager triggerSelfValidate:](self, "triggerSelfValidate:", a3);
  return v8 != 0;
}

- (id)createSuccesfulCKFetchDependency
{
  KTZoneFetchDependencyOperation *v2;

  v2 = objc_alloc_init(KTZoneFetchDependencyOperation);
  -[KTZoneFetchDependencyOperation setName:](v2, "setName:", CFSTR("successful-fetch-dependency"));
  return v2;
}

- (void)maybeCreateNewCKFetch
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036E9C;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)maybeCreateNewCKFetchOnQueue
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTSMManager newCKRequests](self, "newCKRequests"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
    if (!v4
      || (v5 = (void *)v4,
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch")),
          v7 = objc_msgSend(v6, "isFinished"),
          v6,
          v5,
          v7))
    {
      if (qword_1002A4580 != -1)
        dispatch_once(&qword_1002A4580, &stru_10023D330);
      v8 = qword_1002A4588;
      if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating a new CK fetch", v9, 2u);
      }
      -[KTSMManager _onqueueCreateNewCKFetch](self, "_onqueueCreateNewCKFetch");
    }
  }
}

- (void)_onqueueCreateNewCKFetch
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[KTSMManager successfulCKFetchDependency](self, "successfulCKFetchDependency"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager createSuccesfulCKFetchDependency](self, "createSuccesfulCKFetchDependency"));
  -[KTSMManager setSuccessfulCKFetchDependency:](self, "setSuccessfulCKFetchDependency:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager inflightCKFetchDependencies](self, "inflightCKFetchDependencies"));
  v36 = (void *)v4;
  objc_msgSend(v6, "addObject:", v4);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager ckFetchReasons](self, "ckFetchReasons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[KTSMManager setCkFetchReasons:](self, "setCkFetchReasons:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "allObjects"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchCloudStorage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "controller"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "backgroundContext"));
  v35 = (void *)v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudFetchOperationWithDeps:initialFetch:userInteractive:reason:context:", v12, 0, 0, v9, v16));

  -[KTSMManager setCurrentCKFetch:](self, "setCurrentCKFetch:", v17);
  -[KTSMManager setNewCKRequests:](self, "setNewCKRequests:", 0);
  if (objc_msgSend(v34, "containsObject:", off_10029E5A0))
  {
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023D350);
    v18 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "blocking fetch on network reachability/network timeout", buf, 2u);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "reachabilityTracker"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "reachabilityDependency"));
    objc_msgSend(v19, "addNullableDependency:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "networkTimeout"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "networkTimeoutOperation"));
    objc_msgSend(v23, "addNullableDependency:", v26);

  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000373E0;
  v37[3] = &unk_10023D398;
  v37[4] = self;
  v38 = v17;
  v39 = v34;
  v27 = v34;
  v28 = v17;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v37));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
  objc_msgSend(v29, "addNullableDependency:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
  objc_msgSend(v31, "addOperation:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  objc_msgSend(v33, "addOperation:", v29);

}

- (id)requestSuccessfulCKFetchForManyReasons:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D3B8);
  v5 = (void *)qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "triggering a new CK fetch because of reason: %@", (uint8_t *)&buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cloudRecords"));
  v11 = v10 == 0;

  if (v11
    || !-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable")
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser")),
        v13 = v12 == 0,
        v12,
        v13))
  {
    v15 = 0;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = sub_100037A80;
    v23 = sub_100037A90;
    v24 = 0;
    v14 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037A98;
    block[3] = &unk_10023CDE8;
    p_buf = &buf;
    block[4] = self;
    v18 = v4;
    dispatch_sync(v14, block);

    v15 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

  }
  return v15;
}

- (id)newCKFetch:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager requestSuccessfulCKFetchForManyReasons:](self, "requestSuccessfulCKFetchForManyReasons:", v4));

  return v5;
}

- (void)notifyPushChange:(id)a3 userInfo:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3, a4));
  -[KTSMManager setLastPush:](self, "setLastPush:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkTimeout"));
  objc_msgSend(v7, "networkWithFeedback:", 2);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("apns")));
    -[KTSMManager requestServerOptInFetchForManyReasons:delayInSeconds:](self, "requestServerOptInFetchForManyReasons:delayInSeconds:", v9, 10.0);

    if (-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable"))
  }
}

- (BOOL)triggerCKFetchCLI:(id *)a3
{
  void *v5;
  void *v6;
  KTPendingFlag *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("cli")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager requestSuccessfulCKFetchForManyReasons:](self, "requestSuccessfulCKFetchForManyReasons:", v5));

  if (v6)
  {
    v7 = -[KTPendingFlag initWithFlag:after:]([KTPendingFlag alloc], "initWithFlag:after:", CFSTR("CloudKitOutgoing"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flagHandler"));
    objc_msgSend(v9, "handlePendingFlag:", v7);

    objc_msgSend(v6, "waitUntilFinishedOrTimeout:", 20.0);
    if ((objc_msgSend(v6, "isFinished") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kTransparencyErrorInternal, -380, 0));
      if (v10)
      {
        if (qword_1002A4580 != -1)
          dispatch_once(&qword_1002A4580, &stru_10023D3D8);
        v12 = qword_1002A4588;
        if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
        {
          v14 = 138412290;
          v15 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "triggerCKFetchCLI failed: %@", (uint8_t *)&v14, 0xCu);
        }
        if (a3)
        {
          v10 = objc_retainAutorelease(v10);
          v11 = 0;
          *a3 = v10;
        }
        else
        {
          v11 = 0;
        }
        goto LABEL_13;
      }
    }
    v11 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (void)triggerCKFetch24h
{
  void *v3;

  if (-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));

    if (v3)
  }
}

- (void)triggerCheckKTAccountKey
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037F30;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)triggerIDMSFetchBackstop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logClient"));
  objc_msgSend(v6, "idmsFetchTime");
  v8 = v7;

  if (v8 >= 604800.0)
    v9 = v8;
  else
    v9 = 604800.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "smDataStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003811C;
  v15[3] = &unk_10023D400;
  v18 = v9;
  v12 = v4;
  v16 = v12;
  v17 = &v19;
  objc_msgSend(v11, "fetchIDMSDeviceList:", v15);

  if (*((_BYTE *)v20 + 24))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100038180;
    v14[3] = &unk_10023A390;
    v14[4] = self;
    dispatch_async(v13, v14);

  }
  _Block_object_dispose(&v19, 8);

}

- (void)triggerIDMSFetch:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003826C;
  v6[3] = &unk_10023D240;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)triggerSelfValidate:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100038354;
  v6[3] = &unk_10023D240;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)triggerSelfValidateFromEnrollment
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  float v11;
  NSObject *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  double v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dew"));
  objc_msgSend(v4, "selfValidationEnrollment");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateMonitor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ktStatus"));

  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D440);
  v10 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v6;
    *(_DWORD *)buf = 134218242;
    v15 = v11;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "triggerSelfValidateFromEnrollment: delay: %f current state: %@", buf, 0x16u);
  }
  if (objc_msgSend(v9, "selfStatus") == (id)2)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003862C;
    v13[3] = &unk_10023D240;
    *(double *)&v13[5] = v6;
    v13[4] = self;
    dispatch_async(v12, v13);

  }
}

- (void)triggerFetchSelf:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100038714;
  v6[3] = &unk_10023D240;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)triggerCheckExpiredPublicKeyStores
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicKeyStore"));
  v5 = objc_msgSend(v4, "anyStoreExpired");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager publicKeyFetcher](self, "publicKeyFetcher"));
    objc_msgSend(v6, "trigger");

  }
}

- (void)triggerBackgroundSystemValidate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100037A80;
  v20 = sub_100037A90;
  v21 = 0;
  v8 = v6;
  v21 = v8;
  if (!v17[5])
  {
    v9 = os_transaction_create("com.apple.transparencyd.background-validation");
    v10 = (void *)v17[5];
    v17[5] = v9;

  }
  v11 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038940;
  block[3] = &unk_10023D4D8;
  block[4] = self;
  v14 = v7;
  v15 = &v16;
  v12 = v7;
  dispatch_async(v11, block);

  _Block_object_dispose(&v16, 8);
}

- (void)notifyBackgroundValidationFailure:(id)a3 data:(id)a4 type:(id)a5 serverHint:(id)a6 failure:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "smDataStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));

  +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:](KTBackgroundSystemValidationOperation, "addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:", v16, v18, v19, v14, v13, v12);
  -[KTSMManager triggerStatusUpdate:](self, "triggerStatusUpdate:", kKTApplicationIdentifierIDS);
}

- (void)triggerStatusUpdate:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateMonitor"));
  objc_msgSend(v5, "setPendingChanges:", 1);

  v6 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038F54;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v6, block);

}

- (id)optInStateForKeyStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudRecords"));

  if (v8)
  {
    v14 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getAggregateOptInStateForApplication:error:", v6, &v14));
    v10 = v14;
    if (!v9)
    {
      if (qword_1002A4580 != -1)
        dispatch_once(&qword_1002A4580, &stru_10023D518);
      v11 = qword_1002A4588;
      if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "getAggregateOptInStateForApplication failed for %@: %@", buf, 0x16u);
      }
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }

  }
  else
  {
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023D4F8);
    v12 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "no cloud records", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)validatePendingURIsAndRequests
{
  NSObject *v3;
  _QWORD v4[6];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = sub_100037A80;
  v5[4] = sub_100037A90;
  v6 = 0;
  v6 = (id)os_transaction_create("com.apple.transparencyd.retry-pending");
  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000392C8;
  v4[3] = &unk_10023D540;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
}

- (void)retryPendingValidations:(id)a3
{
  KTCondition *v4;
  id v5;

  if (objc_msgSend(a3, "isEqual:", kKTApplicationIdentifierIDS))
  {
    v4 = objc_alloc_init(KTCondition);
    -[KTSMManager setPendingValidationsComplete:](self, "setPendingValidationsComplete:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager retryPendingValidations](self, "retryPendingValidations"));
    objc_msgSend(v5, "trigger");

  }
}

- (void)triggerRegistrationDataNeedsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[KTSMManager addEvent:](self, "addEvent:", CFSTR("PokeIDSWithUpdatedRegData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateMonitor"));
  objc_msgSend(v6, "setSystemStatus:", 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsOperations"));
  objc_msgSend(v8, "registrationDataNeedsUpdate:", v4);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logger"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "setDateProperty:forKey:", v10, off_10029E518);

}

- (void)notifyIDSRegistrationCorrect
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039834;
  v4[3] = &unk_10023A970;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isKTKeyDifferent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;

  v4 = a3;
  if (!-[KTSMManager idsServerReportedWrong](self, "idsServerReportedWrong")
    || (v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager idsServerReportedWrongPublicKey](self, "idsServerReportedWrongPublicKey"))) != 0
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager idsServerReportedWrongPublicKey](self, "idsServerReportedWrongPublicKey")),
        v8 = objc_msgSend(v7, "isEqual:", v4),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    -[KTSMManager setIdsServerReportedWrong:](self, "setIdsServerReportedWrong:", 0);
    -[KTSMManager setIdsServerReportedWrongPublicKey:](self, "setIdsServerReportedWrongPublicKey:", 0);
    v9 = 1;
  }

  return v9;
}

- (void)idsServerReportKTKeyWrong:(id)a3
{
  id v4;

  v4 = a3;
  -[KTSMManager setIdsServerReportedWrong:](self, "setIdsServerReportedWrong:", 1);
  -[KTSMManager setIdsServerReportedWrongPublicKey:](self, "setIdsServerReportedWrongPublicKey:", v4);

}

- (void)resetLastAccountOperations
{
  -[KTSMManager setLastFetchIDMS:](self, "setLastFetchIDMS:", 0);
  -[KTSMManager setLastSignalIDS:](self, "setLastSignalIDS:", 0);
  -[KTSMManager setLastFetchIDSSelf:](self, "setLastFetchIDSSelf:", 0);
  -[KTSMManager setLastFetchKTSelf:](self, "setLastFetchKTSelf:", 0);
  -[KTSMManager setLastValidateSelf:](self, "setLastValidateSelf:", 0);
  -[KTSMManager setLastValidateSelfOptIn:](self, "setLastValidateSelfOptIn:", 0);
  -[KTSMManager setLastRegistration:](self, "setLastRegistration:", 0);
  -[KTSMManager setLastForceSyncKVS:](self, "setLastForceSyncKVS:", 0);
  -[KTSMManager setLastPublicKeyRefresh:](self, "setLastPublicKeyRefresh:", 0);
  -[KTSMManager setLastCheckIDSRegistration:](self, "setLastCheckIDSRegistration:", 0);
  -[KTSMManager setLastDutyCycle:](self, "setLastDutyCycle:", 0);
}

- (void)clearAllFollowups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followup"));
  v10 = 0;
  v7 = objc_msgSend(v6, "clearAllFollowups:", &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023D560);
    v9 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      v13 = 2114;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "clearAllFollowups failed: %{public}@ %{public}@", buf, 0x16u);
    }
  }

}

- (void)performAndWaitForSelfValidate:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  v17 = 0;
  v5 = -[KTSMManager waitUntilReadyForRPCForOperation:fast:error:](self, "waitUntilReadyForRPCForOperation:fast:error:", CFSTR("performAndWaitForSelfValidate"), 0, &v17);
  v6 = v17;
  if ((v5 & 1) != 0)
  {
    v21 = CFSTR("ValidateSelf");
    v19 = CFSTR("Ready");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep success](KTStateTransitionPathStep, "success"));
    v20 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPath pathFromDictionary:](KTStateTransitionPath, "pathFromDictionary:", v9));

    v18 = CFSTR("Ready");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100039E04;
    v15[3] = &unk_10023D588;
    v15[4] = self;
    v16 = v4;
    v14 = objc_msgSend(v13, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("validate-self"), v12, v10, v15);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, id))v4 + 2))(v4, 2, 0, 0, v6);
  }

}

- (id)validateSelfDiagnostics:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100039F84;
  v6[3] = &unk_10023D5B0;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = v4;
  objc_msgSend(v3, "handleOperationResults:", v6);

  return v4;
}

- (id)missingValidateSelfFallbackDiagnostics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "smDataStore"));
  v6 = kKTApplicationIdentifierIDS;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A118;
  v9[3] = &unk_10023D620;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v5, "fetchSelfVerificationInfoForApplication:complete:", v6, v9);

  return v7;
}

- (id)idsKTData:(id)a3
{
  id v3;
  void *v4;
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
  void *v19;
  void *v20;
  id v21;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktDataForRegistration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("tbs"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktPublicAccountKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("pub"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktDataSignature"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("sig"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "uploadedToKVS")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("kvs"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "ktOptInStatus")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("optin"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "registeredTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("regTS"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktAccountKeyTimestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("accTS"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktOptInTimestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("optTS"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktAccountKeyErrorCode"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("accErr"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ktOptInErrorCode"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("optErr"));

    if (objc_msgSend(v4, "count"))
      v21 = v4;
    else
      v21 = 0;

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (void)sysdiagnoseInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dumpPendingFlags"));

  v7 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A91C;
  block[3] = &unk_10023D6C0;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(v7, block);

}

- (void)getStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C144;
  v7[3] = &unk_10023D708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)mapHeadUpdated:(id)a3 populating:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateMonitor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ktStatus"));
  v10 = objc_msgSend(v9, "systemStatus");

  if (v10 == (id)3 && !a4)
  {
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023D728);
    v11 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Detected tree reset populating->non-populating edge for %{public}@", buf, 0xCu);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "followup"));
    v16 = 0;
    objc_msgSend(v13, "clearFollowupsByType:type:error:", v6, 3, &v16);
    v14 = v16;

    if (v14)
    {
      if (qword_1002A4580 != -1)
        dispatch_once(&qword_1002A4580, &stru_10023D748);
      v15 = qword_1002A4588;
      if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error clearing tree reset followups for %@: %@", buf, 0x16u);
      }
    }
    -[KTSMManager triggerStatusUpdate:](self, "triggerStatusUpdate:", v6);

  }
}

- (id)metricsRegistration_ktView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "smDataStore"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C660;
  v8[3] = &unk_10023D770;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "fetchDeviceSignature:complete:", 0, v8);

  return v6;
}

- (id)metricsRegistration_idsView
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _UNKNOWN **v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UNKNOWN **v20;
  void *v21;
  BOOL v22;
  _UNKNOWN **v23;
  void *v24;
  _UNKNOWN **v25;
  NSObject *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  KTSMManager *v36;
  NSObject *v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsOperations"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10003CACC;
  v34[3] = &unk_10023D670;
  v8 = v4;
  v35 = v8;
  v36 = self;
  v9 = v5;
  v37 = v9;
  objc_msgSend(v7, "fetchKTRegistrationStatus:", v34);

  v10 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v9, v10))
  {
    v27 = v9;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics analyticsApplications](TransparencyAnalytics, "analyticsApplications"));
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v11)
    {
      v12 = v11;
      v29 = *(_QWORD *)v31;
      v13 = &off_10025BEA8;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v29)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reg-%@"), v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unreg-%@"), v15));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
            v20 = v13;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("sig")));

            v22 = v21 == 0;
            v13 = v20;
            if (v22)
              v23 = v20;
            else
              v23 = &off_10025BE90;
          }
          else
          {
            v23 = &off_10025BEC0;
          }
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v17));

          if (v24)
            v25 = v13;
          else
            v25 = &off_10025BE90;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, v17);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v12);
    }

    v9 = v27;
  }

  return v3;
}

- (int)checkAccountKeyChanged
{
  void *v3;
  void *v4;
  uint64_t PublicKey;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager pcsOperation](self, "pcsOperation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getCurrentKTPCSIdentity:error:", off_1002A39A8, 0));

  if (v4)
  {
    PublicKey = PCSIdentityGetPublicKey(objc_msgSend(v4, "identity"));
    v6 = objc_claimAutoreleasedReturnValue(PublicKey);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stateMonitor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ktStatus"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountKey"));

      if (v11 && (objc_msgSend(v11, "isEqual:", v7) & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateMonitor"));
        objc_msgSend(v14, "setKTAccountKey:", v7);

        v12 = 3;
      }

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 2;
  }

  return v12;
}

- (void)addEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager launch](self, "launch"));
  objc_msgSend(v5, "addEvent:", v4);

}

- (BOOL)isCloudKitManateeAcountAvailable
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager cloudKitAccountInfo](self, "cloudKitAccountInfo"));
  v3 = ((unint64_t)objc_msgSend(v2, "deviceToDeviceEncryptionAvailability") >> 1) & 1;

  return v3;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8;
  id v9;
  id v10;
  KTPublicKeyStoreRefresh *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  KTPublicKeyStoreRefresh *v15;
  void *v16;
  uint64_t v17;
  KTSetOptInStateOperation *v18;
  uint64_t v19;
  KTPendingFlag *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  KTSetOptInStateOperation *v26;
  void *v27;
  void *v28;
  void *v29;
  KTConfigBagFetchOperation *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  KTFillStatusOperation *v36;
  void *v37;
  uint64_t v38;
  KTFillStatusOperation *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  KTFixupOperation *v44;
  const __CFString *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  KTEnrollmentRegistrationSignature *v49;
  void *v50;
  void *v51;
  KTFixupOperation *v52;
  KTEnsureAccountIdentityOperation *v53;
  void *v54;
  void *v55;
  KTEnsureAccountIdentityOperation *v56;
  KTEnsureAccountIdentityOperation *v57;
  void *v58;
  KTSignalIDSOperation *v59;
  void *v60;
  void *v61;
  void *v62;
  KTConfigBagFetchOperation *v63;
  KTFetchIDSSelfOperation *v64;
  void *v65;
  uint64_t v66;
  __CFString **v67;
  KTFetchKTSelfOperation *v68;
  void *v69;
  KTFetchIDMSOperation *v70;
  void *v71;
  void *v72;
  KTCheckInitialCache *v73;
  void *v74;
  KTCheckInitialCache *v75;
  void *v76;
  __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  KTEnrollmentRegistrationSignature *v85;
  void *v86;
  KTEnrollmentRegistrationSignature *v87;
  void *v88;
  id v89;
  id v90;
  KTEnrollmentRegistrationSignature *v91;
  KTForceSyncKVSOperation *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  KTChangeOptInStateOperation *v98;
  const __CFString *v99;
  void *v100;
  void *v101;
  KTSetOptInStateOperation *v102;
  _TtC13transparencyd29KTUpdateCloudStorageOperation *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _TtC13transparencyd29KTUpdateCloudStorageOperation *v109;
  void *v110;
  KTPublicKeyStoreRefresh *v111;
  KTFillStatusOperation *v112;
  KTFillStatusOperation *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[4];
  id v133;
  _QWORD v134[4];
  id v135;
  KTSMManager *v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[5];
  _QWORD v140[5];
  KTEnsureAccountIdentityOperation *v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[5];
  id v145;
  _BYTE buf[12];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[KTSMManager addEvent:](self, "addEvent:", v8);
  if (!objc_msgSend(v8, "isEqual:", CFSTR("PublicKeysInitialFetch")))
  {
    if (objc_msgSend(v8, "isEqual:", CFSTR("PublicKeysWait")))
    {
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("FetchPublicKeys")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchPublicKeys"));
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("need-to-fetch-public-keys"), CFSTR("PublicKeysInitialFetch")));
LABEL_9:
        v18 = (KTSetOptInStateOperation *)v19;
        goto LABEL_24;
      }
      v20 = (KTPendingFlag *)objc_claimAutoreleasedReturnValue(-[KTSMManager publicKeyFetcher](self, "publicKeyFetcher"));
      -[KTPendingFlag trigger](v20, "trigger");
      goto LABEL_11;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("Initializing")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CKAccountChanged"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("AccountChanged"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("OctagonTrustChanged"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ManateeViewChanged"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("EnsureIdentity"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchSelf"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CloudKitOutgoing"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckAccountSignatures"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CloudKitZoneRecreate"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckKTAccountKey"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckKTAccountKeyChanged"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("IDSStatusChanged"));
      v19 = objc_claimAutoreleasedReturnValue(-[KTSMManager initializingOperation](self, "initializingOperation"));
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("KTDisabled")))
    {
      if (-[KTSMManager isKTDisabled](self, "isKTDisabled"))
      {
        if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ChangeOptInState")))
        {
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ChangeOptInState"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "targetOptInStates"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          objc_msgSend(v25, "setCurrentTarget:", v24);

          v26 = [KTSetOptInStateOperation alloc];
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          v18 = -[KTSetOptInStateOperation initWithDependenics:intendedState:errorState:optinStates:](v26, "initWithDependenics:intendedState:errorState:optinStates:", v27, CFSTR("KTDisabled"), CFSTR("KTDisabled"), v28);

LABEL_17:
          goto LABEL_24;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stateMonitor"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ktStatus"));
        v35 = objc_msgSend(v34, "optIn");

        if (v35 != (id)2)
          goto LABEL_12;
        v36 = [KTFillStatusOperation alloc];
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        v38 = kKTApplicationIdentifierIDS;
        v39 = v36;
        v40 = 1;
        v41 = v37;
        v42 = CFSTR("KTDisabled");
        v43 = CFSTR("KTDisabled");
        goto LABEL_30;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("initializing-after-disable")));
      v30 = (KTConfigBagFetchOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", v29, CFSTR("Initializing")));
      goto LABEL_22;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("WaitForUnlock")))
    {
      if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("Unlocked")))
      {
        v20 = -[KTPendingFlag initWithFlag:conditions:]([KTPendingFlag alloc], "initWithFlag:conditions:", CFSTR("Unlocked"), 1);
        objc_msgSend(v10, "_onqueueHandlePendingFlagLater:", v20);
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("Unlocked"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("initializing-after-unlock")));
      v30 = (KTConfigBagFetchOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", v29, CFSTR("Initializing")));
      goto LABEL_22;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("NoAccount")))
    {
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("AccountChanged")))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("account-probably-changed"), CFSTR("Initializing")));
        goto LABEL_9;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CKAccountChanged")))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("account-probably-changed-ck"), CFSTR("Initializing")));
        goto LABEL_9;
      }
LABEL_12:
      v18 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("KTStateCheckCloudKitAccount")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CKAccountChanged"));
      if (!-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable"))
      {
        if (qword_1002A4580 != -1)
          dispatch_once(&qword_1002A4580, &stru_10023D790);
        v46 = (void *)qword_1002A4588;
        if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
        {
          v47 = v46;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager cloudKitAccountInfo](self, "cloudKitAccountInfo"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "CloudKit not available for device2device encryption, holding start up: %@", buf, 0xCu);

        }
        goto LABEL_12;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("initializing-ck-show-up")));
      v30 = (KTConfigBagFetchOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", v29, CFSTR("GetStatusInitial")));
      goto LABEL_22;
    }
    v45 = CFSTR("WaitForManatee");
    if (objc_msgSend(v8, "isEqual:", CFSTR("WaitForManatee")))
    {
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("OctagonTrustChanged")))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("ckaccount-probably-changed"), CFSTR("Initializing")));
        goto LABEL_9;
      }
      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ManateeViewChanged")))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("retry-manatee-check"), CFSTR("Initializing")));
        goto LABEL_9;
      }
      if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckAccountSignatures")))
        goto LABEL_12;
LABEL_55:
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckAccountSignatures"));
      v49 = [KTEnrollmentRegistrationSignature alloc];
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v18 = -[KTEnrollmentRegistrationSignature initWithDependencies:forceUpdate:intendedState:errorState:idsRegistrationInterface:signatureTracker:](v49, "initWithDependencies:forceUpdate:intendedState:errorState:idsRegistrationInterface:signatureTracker:", v27, 0, v45, v45, self, self);
      goto LABEL_17;
    }
    v45 = CFSTR("WaitForCKKS");
    if (objc_msgSend(v8, "isEqual:", CFSTR("WaitForCKKS")))
    {
      if ((objc_msgSend(v9, "_onqueueContains:", CFSTR("CKAccountChanged")) & 1) != 0
        || (objc_msgSend(v9, "_onqueueContains:", CFSTR("OctagonTrustChanged")) & 1) != 0
        || objc_msgSend(v9, "_onqueueContains:", CFSTR("ManateeViewChanged")))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("retry-ckks-check"), CFSTR("Initializing")));
        goto LABEL_9;
      }
      if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckAccountSignatures")))
        goto LABEL_12;
      goto LABEL_55;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("CheckKTAccountKeyChanged")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckKTAccountKeyChanged"));
      v144[0] = _NSConcreteStackBlock;
      v144[1] = 3221225472;
      v144[2] = sub_10003F11C;
      v144[3] = &unk_10023D818;
      v144[4] = self;
      v145 = v9;
      v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("check-kt-account-key-changed"), CFSTR("Ready"), CFSTR("Ready"), v144));

      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("ForceSyncKTAccountKey")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckKTAccountKey"));
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "octagonOperations"));
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472;
      v142[2] = sub_10003F44C;
      v142[3] = &unk_10023D860;
      objc_copyWeak(&v143, (id *)buf);
      objc_msgSend(v51, "ckksRequestViewSync:complete:", CFSTR("Manatee"), v142);

      v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("force-sync-kt-account-key-done"), CFSTR("Ready")));
      objc_destroyWeak(&v143);
      objc_destroyWeak((id *)buf);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("KTStateFixups")))
    {
      v52 = [KTFixupOperation alloc];
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v44 = -[KTFixupOperation initWithDependenics:intendedState:errorState:](v52, "initWithDependenics:intendedState:errorState:", v37, CFSTR("EnsureAccountIdentity"), CFSTR("EnsureAccountIdentity"));
      goto LABEL_31;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("RetryEnsureAccountIdentity")))
    {
      if ((objc_msgSend(v9, "_onqueueContains:", CFSTR("CKAccountChanged")) & 1) != 0
        || objc_msgSend(v9, "_onqueueContains:", CFSTR("OctagonTrustChanged")))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("recheck-accountstate"), CFSTR("Initializing")));
        goto LABEL_9;
      }
      if ((objc_msgSend(v9, "_onqueueContains:", CFSTR("EnsureIdentity")) & 1) == 0
        && !objc_msgSend(v9, "_onqueueContains:", CFSTR("ManateeViewChanged")))
      {
        goto LABEL_12;
      }
LABEL_153:
      v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("retry-ensure-identity"), CFSTR("EnsureAccountIdentity")));
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("EnsureAccountIdentity")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("EnsureIdentity"));
      v53 = [KTEnsureAccountIdentityOperation alloc];
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager pcsOperation](self, "pcsOperation"));
      v56 = -[KTEnsureAccountIdentityOperation initWithDependencies:pcsOperation:](v53, "initWithDependencies:pcsOperation:", v54, v55);

      v140[0] = _NSConcreteStackBlock;
      v140[1] = 3221225472;
      v140[2] = sub_10003F620;
      v140[3] = &unk_10023D818;
      v140[4] = self;
      v141 = v56;
      v57 = v56;
      v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("ensure-identity"), CFSTR("KTStateCheckCloudKitAccount"), CFSTR("Error"), v140));
      -[KTSetOptInStateOperation addNullableDependency:](v18, "addNullableDependency:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
      objc_msgSend(v58, "addOperation:", v57);

      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("SignalIDS")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("RepairIDSFlag"));
      v59 = [KTSignalIDSOperation alloc];
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager selfValidationResult](self, "selfValidationResult"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
      v18 = -[KTSignalIDSOperation initWithDependencies:intendedState:errorState:selfValidationResult:stateMachine:](v59, "initWithDependencies:intendedState:errorState:selfValidationResult:stateMachine:", v60, CFSTR("InitialIDMSCheck"), CFSTR("Ready"), v61, v62);

      -[KTSMManager setLastSignalIDS:](self, "setLastSignalIDS:", v18);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("FetchConfigBag")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ConfigBagFetch"));
      v63 = [KTConfigBagFetchOperation alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v30 = -[KTConfigBagFetchOperation initWithDependencies:intendedState:errorState:triggerInterface:](v63, "initWithDependencies:intendedState:errorState:triggerInterface:", v29, CFSTR("Ready"), CFSTR("Ready"), self);
LABEL_22:
      v18 = (KTSetOptInStateOperation *)v30;
LABEL_23:

      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchSelf"));
      v64 = [KTFetchIDSSelfOperation alloc];
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v66 = kKTApplicationIdentifierIDS;
      v67 = off_10024D1A0;
LABEL_77:
      v18 = -[KTFetchIDSSelfOperation initWithApplication:dependencies:intendedState:errorState:](v64, "initWithApplication:dependencies:intendedState:errorState:", v66, v65, *v67, CFSTR("Ready"));

      -[KTSMManager setLastFetchIDSSelf:](self, "setLastFetchIDSSelf:", v18);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("FetchKTSelf")))
    {
LABEL_79:
      v68 = [KTFetchKTSelfOperation alloc];
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v18 = -[KTFetchKTSelfOperation initWithApplication:dependencies:intendedState:errorState:](v68, "initWithApplication:dependencies:intendedState:errorState:", kKTApplicationIdentifierIDS, v69, CFSTR("Ready"), CFSTR("Ready"));

      -[KTSMManager setLastFetchKTSelf:](self, "setLastFetchKTSelf:", v18);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("ValidateFetchIDSSelf")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ValidateSelf"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchSelf"));
      v64 = [KTFetchIDSSelfOperation alloc];
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v66 = kKTApplicationIdentifierIDS;
      v67 = off_10024D1C0;
      goto LABEL_77;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchIDMS"));
      v70 = [KTFetchIDMSOperation alloc];
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));
      v18 = -[KTFetchIDMSOperation initWithDependencies:specificUser:intendedState:errorState:](v70, "initWithDependencies:specificUser:intendedState:errorState:", v71, v72, CFSTR("Ready"), CFSTR("Ready"));

      -[KTSMManager setLastFetchIDMS:](self, "setLastFetchIDMS:", v18);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckIDSRegistration"));
      v139[0] = _NSConcreteStackBlock;
      v139[1] = 3221225472;
      v139[2] = sub_10003FCD8;
      v139[3] = &unk_10023D948;
      v139[4] = self;
      v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("check-ids-registration"), CFSTR("Ready"), CFSTR("Ready"), v139));
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      v73 = [KTCheckInitialCache alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
      v75 = -[KTCheckInitialCache initWithDependencies:intendedState:errorState:stateMachine:](v73, "initWithDependencies:intendedState:errorState:stateMachine:", v29, CFSTR("ZoneSetup"), CFSTR("ZoneSetup"), v74);
      goto LABEL_88;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CloudKitZoneRecreate"));
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_10003FFCC;
      v137[3] = &unk_10023D9D8;
      objc_copyWeak(&v138, (id *)buf);
      v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("zone-setup"), CFSTR("ProcessIncomingInitial"), CFSTR("InitialSignRegistrationData"), v137));
      objc_destroyWeak(&v138);
      objc_destroyWeak((id *)buf);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("ProcessIncomingInitial")))
    {
      v124 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "fetchCloudStorage"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v77 = off_10029E5B0;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "dataStore"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "controller"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "backgroundContext"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "cloudFetchOperationWithDeps:initialFetch:userInteractive:reason:context:", v76, 0, 1, v77, v81));

      v134[0] = _NSConcreteStackBlock;
      v134[1] = 3221225472;
      v134[2] = sub_1000405B8;
      v134[3] = &unk_10023D818;
      v135 = v82;
      v136 = self;
      v83 = v82;
      v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("initial-fetch"), CFSTR("InitialSignRegistrationData"), CFSTR("InitialSignRegistrationData"), v134));
      -[KTSetOptInStateOperation addNullableDependency:](v18, "addNullableDependency:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
      objc_msgSend(v84, "addOperation:", v83);

      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CloudKitIncoming"));

      v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("fetch-triggered"), CFSTR("Ready")));
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("InitialSignRegistrationData")))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckAccountSignatures"));
      v85 = [KTEnrollmentRegistrationSignature alloc];
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v87 = v85;
      v88 = v86;
      v89 = 0;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqual:"))
      {
        if (objc_msgSend(v8, "isEqual:", CFSTR("ValidateFetchKTSelf")))
          goto LABEL_79;
        if (objc_msgSend(v8, "isEqual:", CFSTR("ForceSyncKVS")))
        {
          v92 = [KTForceSyncKVSOperation alloc];
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
          v18 = -[KTForceSyncKVSOperation initWithDependencies:timeout:intendedState:errorState:](v92, "initWithDependencies:timeout:intendedState:errorState:", v93, 30000000000, CFSTR("Ready"), CFSTR("Ready"));

          -[KTSMManager setLastForceSyncKVS:](self, "setLastForceSyncKVS:", v18);
          goto LABEL_24;
        }
        if (objc_msgSend(v8, "isEqual:"))
        {
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ValidateSelf"));
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchSelf"));
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ValidateSelfOptIn"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          -[KTSMManager setLastSelfValidate:](self, "setLastSelfValidate:", v94);

          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          v132[0] = _NSConcreteStackBlock;
          v132[1] = 3221225472;
          v132[2] = sub_100040660;
          v132[3] = &unk_10023D9D8;
          objc_copyWeak(&v133, (id *)buf);
          v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("validate-self"), CFSTR("Ready"), CFSTR("Ready"), v132));
          objc_destroyWeak(&v133);
          objc_destroyWeak((id *)buf);
          goto LABEL_24;
        }
        if (objc_msgSend(v8, "isEqual:"))
        {
          objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("ChangeOptInState"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "targetOptInStates"));
          v97 = objc_msgSend(v96, "count");

          if (!v97)
          {
            v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("Done with all opt-in changes"), CFSTR("Ready")));
            goto LABEL_9;
          }
          v98 = [KTChangeOptInStateOperation alloc];
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          v99 = CFSTR("SetOptIO");
          v100 = v98;
          v101 = v29;
        }
        else
        {
          if (!objc_msgSend(v8, "isEqual:"))
          {
            if (objc_msgSend(v8, "isEqual:", CFSTR("ValidateSelfOptIn")))
            {
              *(_QWORD *)buf = 0;
              objc_initWeak((id *)buf, self);
              v130[0] = _NSConcreteStackBlock;
              v130[1] = 3221225472;
              v130[2] = sub_100040C4C;
              v130[3] = &unk_10023D9D8;
              objc_copyWeak(&v131, (id *)buf);
              v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("validate-self-opt-in"), CFSTR("SetOptIO"), CFSTR("Ready"), v130));
              objc_destroyWeak(&v131);
              objc_destroyWeak((id *)buf);
              goto LABEL_24;
            }
            if (objc_msgSend(v8, "isEqual:"))
            {
              objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CloudKitOutgoing"));
              v103 = [_TtC13transparencyd29KTUpdateCloudStorageOperation alloc];
              v104 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
              v125 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
              v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "cloudRecords"));
              v123 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
              v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "dataStore"));
              v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "controller"));
              v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "backgroundContext"));
              v109 = -[KTUpdateCloudStorageOperation initWithDeps:source:context:](v103, "initWithDeps:source:context:", v104, v105, v108);

              v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("processOutgoing"), CFSTR("Ready"), CFSTR("Ready"), &stru_10023DAA0));
              -[KTResultOperation addSuccessDependency:](v18, "addSuccessDependency:", v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
              objc_msgSend(v110, "addOperation:", v109);

              goto LABEL_24;
            }
            if (objc_msgSend(v8, "isEqual:"))
            {
              objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("FetchPublicKeys"));
              v111 = [KTPublicKeyStoreRefresh alloc];
              v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
              v13 = CFSTR("Ready");
              v15 = v111;
              v16 = v12;
              v17 = 0;
              v14 = CFSTR("Ready");
              goto LABEL_3;
            }
            if (objc_msgSend(v8, "isEqual:"))
            {
              objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("AccountChanged"));
              v19 = objc_claimAutoreleasedReturnValue(-[KTSMManager recheckAccount](self, "recheckAccount"));
              goto LABEL_9;
            }
            if (objc_msgSend(v8, "isEqual:", CFSTR("EnvironmentSwitch")))
            {
              *(_QWORD *)buf = 0;
              objc_initWeak((id *)buf, self);
              v128[0] = _NSConcreteStackBlock;
              v128[1] = 3221225472;
              v128[2] = sub_10004156C;
              v128[3] = &unk_10023D9D8;
              objc_copyWeak(&v129, (id *)buf);
              v18 = (KTSetOptInStateOperation *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("transparency-environment-switch"), CFSTR("ResetLocalState"), CFSTR("ResetLocalState"), v128));
              objc_destroyWeak(&v129);
              objc_destroyWeak((id *)buf);
              goto LABEL_24;
            }
            if (objc_msgSend(v8, "isEqual:", CFSTR("ResetLocalState")))
            {
              v127[0] = _NSConcreteStackBlock;
              v127[1] = 3221225472;
              v127[2] = sub_10004184C;
              v127[3] = &unk_10023DB90;
              v127[4] = self;
              v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("transparency-reset-local"), CFSTR("Initializing"), CFSTR("Error"), v127));
              goto LABEL_9;
            }
            if (objc_msgSend(v8, "isEqual:", CFSTR("ResetLocalCloudState")))
            {
              v126[0] = _NSConcreteStackBlock;
              v126[1] = 3221225472;
              v126[2] = sub_100041BC4;
              v126[3] = &unk_10023DB90;
              v126[4] = self;
              v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("transparency-reset-local-cloud-state"), CFSTR("Initializing"), CFSTR("Initializing"), v126));
              goto LABEL_9;
            }
            if (objc_msgSend(v8, "isEqual:", CFSTR("GetStatusInitial")))
            {
              objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("StatusUpdate"));
              v112 = [KTFillStatusOperation alloc];
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
              v38 = kKTApplicationIdentifierIDS;
              v39 = v112;
              v40 = 1;
              v41 = v37;
              v42 = CFSTR("InitialIDMSCheck");
            }
            else
            {
              if (!objc_msgSend(v8, "isEqual:"))
              {
                if (!objc_msgSend(v8, "isEqual:", CFSTR("Ready")))
                  goto LABEL_12;
                v119 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
                objc_msgSend(v119, "_onqueueCancelPendingFlag:", CFSTR("CheckServerOptIn"));

                v120 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
                objc_msgSend(v120, "fulfill");

                v121 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
                v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "stateMonitor"));
                objc_msgSend(v118, "setAccountStatus:", 4);

                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("AccountChanged")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("account-probably-changed"), CFSTR("RecheckAccount")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckAccountSignatures")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("make-signatures"), CFSTR("SignRegistrationData")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("OctagonTrustChanged")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("recheck-after-octagon-change"), CFSTR("Initializing")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("RepairIDSFlag")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("repair-ids"), CFSTR("SignalIDS")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ConfigBagFetch")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("fetch-config-bag"), CFSTR("FetchConfigBag")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("FetchSelf")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("fetch-ids-self"), CFSTR("FetchIDSSelf")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("FetchIDMS")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("fetch-idms"), CFSTR("FetchIDMS")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("FetchPublicKeys")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("public-keys-fetch"), CFSTR("PublicKeysFetch")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckIDSRegistration")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("check-ids-registration"), CFSTR("CheckIDSRegistration")));
                  goto LABEL_9;
                }
                if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ChangeOptInState")))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("process-opt-in-out"), CFSTR("ChangeOptIn")));
                  goto LABEL_9;
                }
                if (!objc_msgSend(v9, "_onqueueContains:", CFSTR("EnsureIdentity")))
                {
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CloudKitZoneRecreate")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("zone-needs-resetup"), CFSTR("ZoneSetup")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CloudKitOutgoing")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("upload-to-ck"), CFSTR("ProcessOutgoing")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CloudKitIncoming")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("fetch-from-ck"), CFSTR("ProcessIncoming")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("ValidateSelf")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("validate-self"), CFSTR("ValidateSelf")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckKTAccountKey")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("check-kt-account-key"), CFSTR("ForceSyncKTAccountKey")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("StatusUpdate")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("fill-status"), CFSTR("GetStatus")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckKTAccountKeyChanged")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("check-account-key-changed"), CFSTR("CheckKTAccountKeyChanged")));
                    goto LABEL_9;
                  }
                  if (objc_msgSend(v9, "_onqueueContains:", CFSTR("IDSStatusChanged")))
                  {
                    v19 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("check-ids-account"), CFSTR("Initializing")));
                    goto LABEL_9;
                  }
                  v114 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager launch](self, "launch"));
                  objc_msgSend(v114, "launch");

                  v115 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
                  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "logger"));
                  v117 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager launch](self, "launch"));
                  objc_msgSend(v116, "noteLaunchSequence:", v117);

                  goto LABEL_12;
                }
                goto LABEL_153;
              }
              objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("StatusUpdate"));
              v113 = [KTFillStatusOperation alloc];
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
              v38 = kKTApplicationIdentifierIDS;
              v42 = CFSTR("Ready");
              v39 = v113;
              v40 = 0;
              v41 = v37;
            }
            v43 = v42;
LABEL_30:
            v44 = -[KTFillStatusOperation initWithApplication:initialFill:dependencies:intendedState:errorState:](v39, "initWithApplication:initialFill:dependencies:intendedState:errorState:", v38, v40, v41, v42, v43);
LABEL_31:
            v18 = (KTSetOptInStateOperation *)v44;

            goto LABEL_24;
          }
          v102 = [KTSetOptInStateOperation alloc];
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          v99 = CFSTR("Ready");
          v100 = v102;
          v101 = v29;
        }
        v75 = (KTCheckInitialCache *)objc_msgSend(v100, "initWithDependenics:intendedState:errorState:optinStates:", v101, v99, CFSTR("Ready"), v74);
LABEL_88:
        v18 = (KTSetOptInStateOperation *)v75;

        goto LABEL_23;
      }
      v90 = objc_msgSend(v9, "_onqueueContains:", CFSTR("CheckAccountSignatures"));
      objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("CheckAccountSignatures"));
      v91 = [KTEnrollmentRegistrationSignature alloc];
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v87 = v91;
      v88 = v86;
      v89 = v90;
    }
    v18 = -[KTEnrollmentRegistrationSignature initWithDependencies:forceUpdate:intendedState:errorState:idsRegistrationInterface:signatureTracker:](v87, "initWithDependencies:forceUpdate:intendedState:errorState:idsRegistrationInterface:signatureTracker:", v88, v89, CFSTR("Ready"), CFSTR("Ready"), self, self);

    -[KTSMManager setLastRegistration:](self, "setLastRegistration:", v18);
    goto LABEL_24;
  }
  v11 = [KTPublicKeyStoreRefresh alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v13 = CFSTR("Initializing");
  v14 = CFSTR("PublicKeysWait");
  v15 = v11;
  v16 = v12;
  v17 = 1;
LABEL_3:
  v18 = -[KTPublicKeyStoreRefresh initWithDependencies:initialFetch:intendedState:errorState:](v15, "initWithDependencies:initialFetch:intendedState:errorState:", v16, v17, v13, v14);

  -[KTSMManager setLastPublicKeyRefresh:](self, "setLastPublicKeyRefresh:", v18);
LABEL_24:

  return v18;
}

- (void)maybeCreateServerOptInFetch
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041CE0;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_onQueueMaybeCreateNewServerOptInFetch
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateMonitor"));
  if ((objc_msgSend(v4, "newServerOptInRequests") & 1) == 0)
  {

    return;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
    v8 = objc_msgSend(v7, "isFinished");

    if (!v8)
      return;
  }
  else
  {

  }
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023DBB0);
  v9 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating new ServerOptIn fetch", buf, 2u);
  }
  v10 = -[KTSMManager _onqueueCreateNewServerOptInFetch](self, "_onqueueCreateNewServerOptInFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  objc_msgSend(v11, "cancelPendingFlag:", CFSTR("CheckServerOptIn"));

}

- (id)_onqueueCreateNewServerOptInFetch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  KTFetchServerOptInStatus *v8;
  void *v9;
  void *v10;
  KTFetchServerOptInStatus *v11;
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
  void *v22;
  _QWORD v24[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInFetchReasons](self, "serverOptInFetchReasons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[KTSMManager setServerOptInFetchReasons:](self, "setServerOptInFetchReasons:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));

  v8 = [KTFetchServerOptInStatus alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInScheduler](self, "serverOptInScheduler"));
  v11 = -[KTFetchServerOptInStatus initWithDependencies:reason:retryScheduler:](v8, "initWithDependencies:reason:retryScheduler:", v9, v7, v10);

  -[KTSMManager setCurrentServerOptInFetch:](self, "setCurrentServerOptInFetch:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateMonitor"));
  objc_msgSend(v13, "setNewServerOptInRequests:", 0);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000420EC;
  v24[3] = &unk_10023A390;
  v24[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v24));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  objc_msgSend(v14, "addNullableDependency:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reachabilityTracker"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reachabilityDependency"));
  objc_msgSend(v16, "addNullableDependency:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  objc_msgSend(v20, "addOperation:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  objc_msgSend(v22, "addOperation:", v14);

  return v11;
}

- (void)requestServerOptInFetchForManyReasons:(id)a3 delayInSeconds:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  KTPendingFlag *v13;
  void *v14;
  KTPendingFlag *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v21;
  double v22;
  uint8_t buf[4];
  void *v24;

  v6 = a3;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023DBD0);
  v7 = (void *)qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "triggering a new server opt-in state fetch because of reason: %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stateMonitor"));
  objc_msgSend(v12, "setNewServerOptInRequests:", 1);

  v13 = [KTPendingFlag alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInScheduler](self, "serverOptInScheduler"));
  v15 = -[KTPendingFlag initWithFlag:conditions:scheduler:](v13, "initWithFlag:conditions:scheduler:", CFSTR("CheckServerOptIn"), 2, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "flagHandler"));
  objc_msgSend(v17, "handlePendingFlag:", v15);

  v18 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000423C8;
  block[3] = &unk_10023D2F0;
  block[4] = self;
  v21 = v6;
  v22 = a4;
  v19 = v6;
  dispatch_async(v18, block);

}

- (void)newServerOptInFetch:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  -[KTSMManager requestServerOptInFetchForManyReasons:delayInSeconds:](self, "requestServerOptInFetchForManyReasons:delayInSeconds:", v4, 0.0);

}

- (void)triggerServerOptInFetch4h
{
  -[KTSMManager newServerOptInFetch:](self, "newServerOptInFetch:", CFSTR("4h"));
}

- (void)triggerBAACertFetcher
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "certFetcher"));
  objc_msgSend(v2, "getDeviceCertWithForcedFetch:completionHandler:", 1, &stru_10023DC10);

}

- (void)postKTDisabledFollowup
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100042694;
  v2[3] = &unk_10023DC78;
  v2[4] = self;
  -[KTSMManager getOptInStateForApplication:complete:](self, "getOptInStateForApplication:complete:", kKTApplicationIdentifierIDS, v2);
}

- (void)updateKTDisabledForIDS:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000428F4;
  v7[3] = &unk_10023DCA0;
  v8 = a3;
  v7[4] = self;
  objc_msgSend(v6, "peers:", v7);

}

- (id)initializingOperation
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100042BFC;
  v4[3] = &unk_10023DF50;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("transparency-initializing"), CFSTR("NoAccount"), CFSTR("Error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)recheckAccount
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044460;
  v4[3] = &unk_10023DF50;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("transparency-recheck-account"), CFSTR("Ready"), CFSTR("Initializing"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)accountFirstSeenDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "logger"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "datePropertyForKey:", off_10029E530));

  return v4;
}

- (void)clearAccountMetrics
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "logger"));
  objc_msgSend(v4, "setDateProperty:forKey:", 0, off_10029E530);

  -[KTSMManager setLastSelfValidate:](self, "setLastSelfValidate:", 0);
}

- (id)lastSelfValidate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "smDataStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSettingsDate:", off_10029E538));

  return v4;
}

- (void)setLastSelfValidate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "smDataStore"));
  objc_msgSend(v5, "setSettingsDate:date:", off_10029E538, v4);

}

- (BOOL)optOutWhenNotEligble:(id)a3 error:(id *)a4
{
  id v5;
  KTIDSOpsOptInOutData *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v14[5];
  dispatch_semaphore_t v15;
  id v16;
  KTIDSOpsOptInOutData *v17;

  v5 = a3;
  v6 = objc_alloc_init(KTIDSOpsOptInOutData);
  -[KTIDSOpsOptInOutData setOptInStatus:](v6, "setOptInStatus:", &__kCFBooleanFalse);
  v16 = v5;
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v8 = dispatch_semaphore_create(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsOperations"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000449D4;
  v14[3] = &unk_10023DF98;
  v14[4] = self;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "sendOptInUpdateRequest:withCompletion:", v7, v14);

  v12 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v11, v12);

  return 1;
}

- (BOOL)changeOptInState:(unint64_t)a3 application:(id)a4 loggableData:(id *)a5 error:(id *)a6
{
  id v10;
  unsigned __int8 v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  BOOL v29;
  void *v30;
  NSObject *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  KTOptInWatcher *v38;
  NSObject *v39;
  KTOptInWatcher *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  void *v45;
  id v46;
  void *v48;
  id *v49;
  id *v50;
  id v51;
  _QWORD block[5];
  id v53;
  KTOptInWatcher *v54;
  __int128 *p_buf;
  id v56;
  id v57;
  __int128 buf;
  uint64_t v59;
  char v60;

  v10 = a4;
  v11 = -[KTSMManager isKTDisabled](self, "isKTDisabled");
  if (!a3 || (v11 & 1) == 0)
  {
    v49 = a5;
    v50 = a6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountOperations"));
    v57 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "primaryAccount:", &v57));
    v16 = v57;

    if (!v15)
    {
      if (qword_1002A4580 != -1)
        dispatch_once(&qword_1002A4580, &stru_10023DFB8);
      v17 = qword_1002A4588;
      if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "no primary account: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accountOperations"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsAccountTracker"));
    v56 = v16;
    v22 = (char *)objc_msgSend(v19, "ktAccountStatus:idsAccountsTracker:error:", v15, v21, &v56);
    v51 = v56;

    if ((unint64_t)(v22 - 4) >= 2)
    {
      if (v22)
      {
        v29 = 0;
        v28 = 0;
        if (a3)
          goto LABEL_11;
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
        +[TransparencySettings uiBlockingNetworkTimeout](TransparencySettings, "uiBlockingNetworkTimeout");
        objc_msgSend(v32, "wait:", (uint64_t)(v33 * 1000000000.0));

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stateMonitor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "ktStatus"));
        v28 = (unint64_t)objc_msgSend(v36, "accountStatus");

        v29 = (v28 & 0xFFFFFFFFFFFFFFFELL) != 2;
        if ((v28 & 0xFFFFFFFFFFFFFFFELL) == 2 && a3 != 0)
          goto LABEL_11;
      }
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
      +[TransparencySettings uiBlockingNetworkTimeout](TransparencySettings, "uiBlockingNetworkTimeout");
      objc_msgSend(v23, "wait:", (uint64_t)(v24 * 1000000000.0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stateMonitor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ktStatus"));
      v28 = (unint64_t)objc_msgSend(v27, "accountStatus");

      v29 = (v28 & 0xFFFFFFFFFFFFFFFELL) != 2;
      if (a3)
      {
LABEL_11:
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorInternal, -160, v51, CFSTR("Opt-in not allowed, account state: %d cdpState: %d"), v22, v28));
        if (qword_1002A4580 != -1)
          dispatch_once(&qword_1002A4580, &stru_10023DFD8);
        v31 = qword_1002A4588;
        if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Opt-in not allowed: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        if (v50)
          *v50 = objc_retainAutorelease(v30);

        v12 = 0;
        goto LABEL_38;
      }
    }
    if (!v29)
    {
      v12 = -[KTSMManager optOutWhenNotEligble:error:](self, "optOutWhenNotEligble:error:", v10, v50);
LABEL_38:

      goto LABEL_39;
    }
    v38 = -[KTOptInWatcher initWithTargetState:]([KTOptInWatcher alloc], "initWithTargetState:", a3);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v59 = 0x2020000000;
    v60 = 0;
    v39 = objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045044;
    block[3] = &unk_10023E000;
    block[4] = self;
    v53 = v10;
    p_buf = &buf;
    v40 = v38;
    v54 = v40;
    dispatch_sync(v39, block);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v41 = CFSTR("opt-in pending");
      v42 = -342;
    }
    else
    {
      -[KTSMManager triggerOptInStateChange](self, "triggerOptInStateChange");
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher targetResolved](v40, "targetResolved"));
      v44 = objc_msgSend(v43, "wait:", 120000000000) == 0;

      if (v44)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher error](v40, "error"));

        if (!v48)
        {
          v46 = 0;
          v12 = 1;
LABEL_35:
          if (v49)
            *v49 = (id)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher loggableData](v40, "loggableData"));

          _Block_object_dispose(&buf, 8);
          goto LABEL_38;
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher error](v40, "error"));
LABEL_32:
        v46 = v45;
        v12 = 0;
        if (v50 && v45)
        {
          v46 = objc_retainAutorelease(v45);
          v12 = 0;
          *v50 = v46;
        }
        goto LABEL_35;
      }
      v41 = CFSTR("timeout setting opt-in");
      v42 = -343;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorInternal, v42, 0, v41));
    goto LABEL_32;
  }
  v12 = 0;
LABEL_39:

  return v12;
}

- (void)timeout:(unint64_t)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  KTSMManager *v19;
  id v20;
  uint8_t buf[4];
  unint64_t v22;

  v6 = a4;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023E020);
  v7 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting a timer to watch for IDS registration timeouts - timeout %llu", buf, 0xCu);
  }
  v8 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  -[KTSMManager setTimer:](self, "setTimer:", v9);

  v10 = objc_claimAutoreleasedReturnValue(-[KTSMManager timer](self, "timer"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10004530C;
  v18 = &unk_10023D708;
  v19 = self;
  v20 = v6;
  v11 = v6;
  dispatch_source_set_event_handler(v10, &v15);

  v12 = objc_claimAutoreleasedReturnValue(-[KTSMManager timer](self, "timer", v15, v16, v17, v18, v19));
  v13 = dispatch_time(0, a3);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

  v14 = objc_claimAutoreleasedReturnValue(-[KTSMManager timer](self, "timer"));
  dispatch_resume(v14);

}

- (void)waitForIDSRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  KTSMManager *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsAccountTracker"));
  objc_msgSend(v7, "setTimeOfLastUpsell:", v5);

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10004554C;
  v15 = &unk_10023D588;
  v16 = self;
  v17 = v4;
  v8 = v4;
  -[KTSMManager _waitForIDSRegistration:](self, "_waitForIDSRegistration:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps", v12, v13, v14, v15, v16));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsOperations"));
  objc_msgSend(v10, "checkIDSTimeoutSeconds");
  -[KTSMManager timeout:block:](self, "timeout:block:", (unint64_t)(v11 * 1000000000.0), v8);

}

- (void)_waitForIDSRegistration:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  KTSMManager *v18;
  id v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  -[KTSMManager setCheckIDSTimer:](self, "setCheckIDSTimer:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSTimer](self, "checkIDSTimer"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100045718;
  v17 = &unk_10023D708;
  v18 = self;
  v19 = v4;
  v8 = v4;
  dispatch_source_set_event_handler(v7, &v14);

  v9 = objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSTimer](self, "checkIDSTimer", v14, v15, v16, v17, v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsOperations"));
  objc_msgSend(v11, "sleepTimeBetweenIDSCheckups");
  dispatch_source_set_timer(v9, 0, (unint64_t)(v12 * 1000000000.0), 0x2FAF080uLL);

  v13 = objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSTimer](self, "checkIDSTimer"));
  dispatch_resume(v13);

}

- (void)checkIDSHealth:(id)a3
{
  id v4;
  CheckIDSRegistrationMonitor *v5;
  CheckIDSRegistrationMonitor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CheckIDSRegistrationMonitor *v12;
  _QWORD v13[4];
  CheckIDSRegistrationMonitor *v14;
  id v15;
  _QWORD v16[4];
  CheckIDSRegistrationMonitor *v17;
  id v18;
  id location;
  const __CFString *v20;

  v4 = a3;
  v5 = objc_alloc_init(CheckIDSRegistrationMonitor);
  location = 0;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100045B28;
  v16[3] = &unk_10023E0B0;
  objc_copyWeak(&v18, &location);
  v6 = v5;
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionGroupOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("check-ids-health"), CFSTR("Ready"), CFSTR("Ready"), v16));
  v20 = CFSTR("Ready");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100045BEC;
  v13[3] = &unk_10023E0F8;
  v11 = v4;
  v15 = v11;
  v12 = v6;
  v14 = v12;
  objc_msgSend(v10, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("check-ids"), v7, v9, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)checkKTAccountKey:(id)a3 complete:(id)a4
{
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a4;
  -[KTSMManager idsServerReportKTKeyWrong:](self, "idsServerReportKTKeyWrong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkKTAccountKeyScheduler](self, "checkKTAccountKeyScheduler"));
  objc_msgSend(v6, "trigger");

  v7[2](v7, 0);
}

- (void)refreshDeviceList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);

  v10 = (void (**)(id, _QWORD, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "altDSID")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idmsOperations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "altDSID"));
    objc_msgSend(v8, "refreshDeviceList:complete:", v9, v10);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -339, CFSTR("No specific user available yet")));
    v10[2](v10, 0, v7);
  }

}

- (void)clearIDSCacheForUri:(id)a3 application:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication stripApplicationPrefixForIdentifier:uri:](TransparencyApplication, "stripApplicationPrefixForIdentifier:uri:", v6, a3));
  v8 = objc_msgSend(objc_alloc((Class)IDSURI), "initWithPrefixedURI:", v7);
  v9 = objc_alloc_init((Class)IDSCacheClearRequestContext);
  v17 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v9, "setUris:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication idsServiceForIdentifier:](TransparencyApplication, "idsServiceForIdentifier:", v6));
  objc_msgSend(v9, "setService:", v11);

  v12 = objc_alloc_init((Class)IDSCacheClearRequest);
  v16 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v12, "setRequestContexts:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsOperations"));
  objc_msgSend(v15, "cacheClearRequest:", v12);

}

- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD block[5];
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  unsigned int v23;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_100037A80;
  v20[4] = sub_100037A90;
  v21 = 0;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023E118);
  v8 = (id)qword_1002A4588;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requests"));
    v10 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 67109120;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Getting signature request: %d", buf, 8u);

  }
  -[KTSMManager addEvent:](self, "addEvent:", CFSTR("GettingSignatureRequest"));
  v11 = objc_claimAutoreleasedReturnValue(-[KTSMManager signatureQueue](self, "signatureQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000462D0;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_async(v11, block);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000462DC;
  v15[3] = &unk_10023E210;
  v18 = v20;
  v15[4] = self;
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  +[KTEnrollmentSignatureSupport updateClientData:deps:complete:](KTEnrollmentSignatureSupport, "updateClientData:deps:complete:", v13, v12, v15);

  _Block_object_dispose(v20, 8);
}

- (void)transparencyDumpKTRegistrationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smDataStore"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100046A7C;
  v8[3] = &unk_10023E238;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchDeviceSignature:complete:", 0, v8);

}

- (void)transparencyClearKTRegistrationData:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smDataStore"));
  v8 = 0;
  objc_msgSend(v6, "clearDeviceSignatures:", &v8);
  v7 = v8;

  v4[2](v4, v7);
}

- (void)transparencyPerformRegistrationSignature:(id)a3
{
  id v3;
  _QWORD v4[4];
  KTSMManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046BFC;
  v4[3] = &unk_10023E0F8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[KTSMManager performRegistrationSignatures:](v5, "performRegistrationSignatures:", v4);

}

- (void)transparencyCloudDevices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, _QWORD);

  v9 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudRecords"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudRecords"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudDevices"));

    v9[2](v9, v8, 0);
  }
  else
  {
    v9[2](v9, 0, 0);
  }

}

- (void)setCloudKitOutgoingFlag
{
  void *v3;
  void *v4;
  KTPendingFlag *v5;

  v5 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("CloudKitOutgoing"), 2, 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "flagHandler"));
  objc_msgSend(v4, "handlePendingFlag:", v5);

}

- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudRecords"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cloudRecords"));
    v16 = 0;
    objc_msgSend(v14, "addDevice:clientData:error:", v8, v9, &v16);
    v15 = v16;

    -[KTSMManager setCloudKitOutgoingFlag](self, "setCloudKitOutgoingFlag");
    v10[2](v10, v15);

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudRecords"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cloudRecords"));
    v16 = 0;
    objc_msgSend(v14, "removeDevice:clientData:error:", v8, v9, &v16);
    v15 = v16;

    -[KTSMManager setCloudKitOutgoingFlag](self, "setCloudKitOutgoingFlag");
    v10[2](v10, v15);

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (void)getOptInStateForAccount:(id)a3 complete:(id)a4
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _TtC13transparencyd16KTOptIOValidator *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v5 = (void (**)(id, void *, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudRecords"));

  if (v7)
  {
    v14 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getAllOptInStatesAndReturnError:", &v14));
    v9 = v14;
    if (v8)
    {
      v10 = -[KTOptIOValidator initWithOptInRecords:uriToSMT:]([_TtC13transparencyd16KTOptIOValidator alloc], "initWithOptInRecords:uriToSMT:", v8, &__NSDictionary0__struct);
      v13 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptIOValidator evaluateCloudDataAndReturnError:](v10, "evaluateCloudDataAndReturnError:", &v13));
      v12 = v13;

      v5[2](v5, v11, v12);
      v9 = v12;
    }
    else
    {
      v5[2](v5, 0, v9);
    }

  }
  else
  {
    v5[2](v5, 0, 0);
  }

}

- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudRecords"));

  if (v12)
  {
    v15 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getOptInStateWithUri:application:error:", v8, v9, &v15));
    v14 = v15;
    v10[2](v10, v13, v14);

  }
  else
  {
    v10[2](v10, 0, 0);
  }

}

- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cloudRecords"));

  if (v16)
    v17 = objc_msgSend(v16, "addOptInStateWithURI:smtTimestamp:application:state:error:", v12, v13, v14, v8, a7);
  else
    v17 = 0;

  return v17;
}

- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id, id);
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  KTPendingFlag *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void (**v28)(id, id, id);
  id v29;
  uint8_t buf[8];
  id v31;
  id v32;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, id, id))a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cloudRecords"));

  if (v17)
  {
    if (!v14)
    {
      if (qword_1002A4580 != -1)
        dispatch_once(&qword_1002A4580, &stru_10023E258);
      v18 = qword_1002A4588;
      if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "using SMT timestamp now 'now', will lead to sadness", buf, 2u);
      }
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    }
    v31 = v12;
    v32 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v29 = 0;
    v20 = objc_msgSend(v17, "setOptInStateWithURIs:application:state:error:", v19, v13, v9, &v29);
    v21 = v29;
    if ((_DWORD)v20)
    {
      v22 = -[KTPendingFlag initWithFlag:conditions:]([KTPendingFlag alloc], "initWithFlag:conditions:", CFSTR("CloudKitOutgoing"), 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      v28 = v15;
      v24 = v17;
      v25 = v13;
      v26 = v12;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "flagHandler"));
      objc_msgSend(v27, "handlePendingFlag:", v22);

      v12 = v26;
      v13 = v25;
      v17 = v24;
      v15 = v28;

    }
    v15[2](v15, v20, v21);

  }
  else
  {
    v15[2](v15, 0, 0);
  }

}

- (void)getAllOptInStates:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = (void (**)(id, void *, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudRecords"));

  if (v6)
  {
    v9 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getAllOptInStatesAndReturnError:", &v9));
    v8 = v9;
    v4[2](v4, v7, v8);

  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

- (void)getOptInStateForApplication:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudRecords"));

  if (v9)
  {
    v12 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getAggregateOptInStateForApplication:error:", v6, &v12));
    v11 = v12;
    v7[2](v7, v10, v11);

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, id);
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudRecords"));

  if (v12)
  {
    v15 = 0;
    v13 = objc_msgSend(v12, "clearOptInStateForURI:application:error:", v8, v9, &v15);
    v14 = v15;
    v10[2](v10, v13, v14);

  }
  else
  {
    v10[2](v10, 0, 0);
  }

}

- (void)resetLocalCloudDataState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("cloud-data-reset"), CFSTR("ResetLocalCloudState")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](KTStates, "KTStateMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  objc_msgSend(v3, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("cloud-data-reset"), v7, v6, &stru_10023E298);

}

- (void)uriNeedsUpdate:(id)a3 forApplication:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v5 = a3;
  v6 = a4;
  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023E2D8);
  v7 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "uriNeedsUpdate: %@[%@]", (uint8_t *)&v8, 0x16u);
  }

}

- (void)inspectErrorForRetryAfter:(id)a3 trigger:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = CKRetryAfterSecondsForError(v5);
  if (v7 != 0.0)
  {
    v8 = v7;
    v9 = 1000000000 * (unint64_t)v7;
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023E2F8);
    v10 = (void *)qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v13 = 138412802;
      v14 = v12;
      v15 = 2048;
      v16 = v8;
      v17 = 2112;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CK operation failed, scheduling %@ delay for %.1f seconds: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(v6, "waitUntil:", v9);
  }

}

- (BOOL)isKTDisabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "idsConfigBag"));
  v4 = objc_msgSend(v3, "ktDisable");

  return v4;
}

- (void)idsServerBagUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023E318);
  v3 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "IDS server bag update", buf, 2u);
  }
  if (_os_feature_enabled_impl("Transparency", "KTEnableKillSwitch"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("ids-server-bag-update"), CFSTR("Initializing")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](KTStates, "KTStateMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    objc_msgSend(v5, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("ids-server-bag-update"), v4, v8, &stru_10023E338);

  }
  else
  {
    if (qword_1002A4580 != -1)
      dispatch_once(&qword_1002A4580, &stru_10023E378);
    v9 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "An IDS server bag update happened but 'KTEnableKillSwitch' feature flag is not enabled", v10, 2u);
    }
  }
}

- (void)triggerIDSServerBagNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", IDSServerBagFinishedLoadingNotification, self);

}

- (void)triggerCloudKitStaticKeyRemoteUpdateNotification
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "staticKeyStore"));
  objc_msgSend(v5, "postNotificationName:object:", NSPersistentStoreRemoteChangeNotification, v4);

}

- (void)xpc24HrNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  -[KTSMManager triggerIDMSFetchBackstop:](self, "triggerIDMSFetchBackstop:", v4);

  -[KTSMManager triggerKTAccountKeySignature:](self, "triggerKTAccountKeySignature:", 10.0);
  -[KTSMManager triggerCheckIDSRegistration](self, "triggerCheckIDSRegistration");
  -[KTSMManager triggerCheckExpiredPublicKeyStores](self, "triggerCheckExpiredPublicKeyStores");
  -[KTSMManager triggerCKFetch24h](self, "triggerCKFetch24h");
}

- (BOOL)shouldPokeIDSUponSigning
{
  return self->shouldPokeIDSUponSigning;
}

- (void)setShouldPokeIDSUponSigning:(BOOL)a3
{
  self->shouldPokeIDSUponSigning = a3;
}

- (KTCondition)signaturesComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignaturesComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)signatureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignatureQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTSpecificUser)specificUser
{
  return (KTSpecificUser *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSpecificUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateMachineQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPcsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTNearFutureScheduler)checkIDSRegistration
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCheckIDSRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (KTCondition)successfulIDSRegistrationCheck
{
  return (KTCondition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSuccessfulIDSRegistrationCheck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)idsServerReportedWrong
{
  return self->_idsServerReportedWrong;
}

- (void)setIdsServerReportedWrong:(BOOL)a3
{
  self->_idsServerReportedWrong = a3;
}

- (NSData)idsServerReportedWrongPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdsServerReportedWrongPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (KTNearFutureScheduler)manateeViewChangedScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 104, 1);
}

- (void)setManateeViewChangedScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (KTFetchIDMSOperation)lastFetchIDMS
{
  return (KTFetchIDMSOperation *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastFetchIDMS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (KTSignalIDSOperation)lastSignalIDS
{
  return (KTSignalIDSOperation *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastSignalIDS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (KTFetchIDSSelfOperation)lastFetchIDSSelf
{
  return (KTFetchIDSSelfOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastFetchIDSSelf:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTFetchKTSelfOperation)lastFetchKTSelf
{
  return (KTFetchKTSelfOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastFetchKTSelf:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (KTValidateSelfOperation)lastValidateSelf
{
  return (KTValidateSelfOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastValidateSelf:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTValidateSelfOperation)lastValidateSelfOptIn
{
  return (KTValidateSelfOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastValidateSelfOptIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (KTEnrollmentRegistrationSignature)lastRegistration
{
  return (KTEnrollmentRegistrationSignature *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (KTForceSyncKVSOperation)lastForceSyncKVS
{
  return (KTForceSyncKVSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastForceSyncKVS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSOperation)lastCKFetch
{
  return (NSOperation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastCKFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (KTPublicKeyStoreRefresh)lastPublicKeyRefresh
{
  return (KTPublicKeyStoreRefresh *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastPublicKeyRefresh:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (KTCheckIDSRegistrationOperation)lastCheckIDSRegistration
{
  return (KTCheckIDSRegistrationOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastCheckIDSRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (KTBackgroundSystemValidationOperation)lastDutyCycle
{
  return (KTBackgroundSystemValidationOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastDutyCycle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (KTNearFutureScheduler)ckFetchScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCkFetchScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (KTNearFutureScheduler)serverOptInScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 216, 1);
}

- (void)setServerOptInScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (KTCondition)pendingValidationsComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPendingValidationsComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (CKAccountInfo)cloudKitAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCloudKitAccountInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSDate)lastPush
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLastPush:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOptInStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (OS_dispatch_source)checkIDSTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 272, 1);
}

- (void)setCheckIDSTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSMutableDictionary)selfVerificationInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSelfVerificationInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (KTSMSelfValidationResult)selfValidationResult
{
  return (KTSMSelfValidationResult *)objc_getProperty(self, a2, 288, 1);
}

- (void)setSelfValidationResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (KTNearFutureScheduler)publicKeyFetcher
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPublicKeyFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (KTNearFutureScheduler)retryEnsureIdentity
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 304, 1);
}

- (void)setRetryEnsureIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (KTNearFutureScheduler)retryGetPrimaryAccount
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 312, 1);
}

- (void)setRetryGetPrimaryAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (KTNearFutureScheduler)checkKTAccountKeyScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 320, 1);
}

- (void)setCheckKTAccountKeyScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (KTNearFutureScheduler)checkKTSignatureScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 328, 1);
}

- (void)setCheckKTSignatureScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (KTNearFutureScheduler)retryPendingValidations
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRetryPendingValidations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (int)manateeViewToken
{
  return self->_manateeViewToken;
}

- (void)setManateeViewToken:(int)a3
{
  self->_manateeViewToken = a3;
}

- (KTFetchCloudOperation)currentCKFetch
{
  return (KTFetchCloudOperation *)objc_getProperty(self, a2, 344, 1);
}

- (void)setCurrentCKFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (BOOL)newCKRequests
{
  return self->_newCKRequests;
}

- (void)setNewCKRequests:(BOOL)a3
{
  self->_newCKRequests = a3;
}

- (NSMutableSet)ckFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 352, 1);
}

- (void)setCkFetchReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (KTZoneFetchDependencyOperation)successfulCKFetchDependency
{
  return (KTZoneFetchDependencyOperation *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSuccessfulCKFetchDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSMutableSet)inflightCKFetchDependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 368, 1);
}

- (void)setInflightCKFetchDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (KTFetchServerOptInStatus)currentServerOptInFetch
{
  return (KTFetchServerOptInStatus *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCurrentServerOptInFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSMutableSet)serverOptInFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 384, 1);
}

- (void)setServerOptInFetchReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (KTCondition)initializedComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 392, 1);
}

- (void)setInitializedComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (KTCondition)readyComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 400, 1);
}

- (void)setReadyComplete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (SecLaunchSequence)launch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 408, 1);
}

- (void)setLaunch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (_TtC13transparencyd10KTWatchdog)watchdog
{
  return (_TtC13transparencyd10KTWatchdog *)objc_getProperty(self, a2, 416, 1);
}

- (void)setWatchdog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_readyComplete, 0);
  objc_storeStrong((id *)&self->_initializedComplete, 0);
  objc_storeStrong((id *)&self->_serverOptInFetchReasons, 0);
  objc_storeStrong((id *)&self->_currentServerOptInFetch, 0);
  objc_storeStrong((id *)&self->_inflightCKFetchDependencies, 0);
  objc_storeStrong((id *)&self->_successfulCKFetchDependency, 0);
  objc_storeStrong((id *)&self->_ckFetchReasons, 0);
  objc_storeStrong((id *)&self->_currentCKFetch, 0);
  objc_storeStrong((id *)&self->_retryPendingValidations, 0);
  objc_storeStrong((id *)&self->_checkKTSignatureScheduler, 0);
  objc_storeStrong((id *)&self->_checkKTAccountKeyScheduler, 0);
  objc_storeStrong((id *)&self->_retryGetPrimaryAccount, 0);
  objc_storeStrong((id *)&self->_retryEnsureIdentity, 0);
  objc_storeStrong((id *)&self->_publicKeyFetcher, 0);
  objc_storeStrong((id *)&self->_selfValidationResult, 0);
  objc_storeStrong((id *)&self->_selfVerificationInfo, 0);
  objc_storeStrong((id *)&self->_checkIDSTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_optInStates, 0);
  objc_storeStrong((id *)&self->_lastPush, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountInfo, 0);
  objc_storeStrong((id *)&self->_pendingValidationsComplete, 0);
  objc_storeStrong((id *)&self->_serverOptInScheduler, 0);
  objc_storeStrong((id *)&self->_ckFetchScheduler, 0);
  objc_storeStrong((id *)&self->_lastDutyCycle, 0);
  objc_storeStrong((id *)&self->_lastCheckIDSRegistration, 0);
  objc_storeStrong((id *)&self->_lastPublicKeyRefresh, 0);
  objc_storeStrong((id *)&self->_lastCKFetch, 0);
  objc_storeStrong((id *)&self->_lastForceSyncKVS, 0);
  objc_storeStrong((id *)&self->_lastRegistration, 0);
  objc_storeStrong((id *)&self->_lastValidateSelfOptIn, 0);
  objc_storeStrong((id *)&self->_lastValidateSelf, 0);
  objc_storeStrong((id *)&self->_lastFetchKTSelf, 0);
  objc_storeStrong((id *)&self->_lastFetchIDSSelf, 0);
  objc_storeStrong((id *)&self->_lastSignalIDS, 0);
  objc_storeStrong((id *)&self->_lastFetchIDMS, 0);
  objc_storeStrong((id *)&self->_manateeViewChangedScheduler, 0);
  objc_storeStrong((id *)&self->_idsServerReportedWrongPublicKey, 0);
  objc_storeStrong((id *)&self->_successfulIDSRegistrationCheck, 0);
  objc_storeStrong((id *)&self->_checkIDSRegistration, 0);
  objc_storeStrong((id *)&self->_pcsOperation, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_specificUser, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->signatureQueue, 0);
  objc_storeStrong((id *)&self->signaturesComplete, 0);
}

@end
