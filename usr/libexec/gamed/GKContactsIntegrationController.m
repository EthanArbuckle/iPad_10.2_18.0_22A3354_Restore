@implementation GKContactsIntegrationController

+ (id)sharedController
{
  if (qword_100318110 != -1)
    dispatch_once(&qword_100318110, &stru_1002C4630);
  return (id)qword_100318108;
}

- (GKContactsIntegrationController)init
{
  void *v3;
  void *v4;
  GKPlayerInternalProvider *v5;
  GKContactsIntegrationEligibilityChecker *v6;
  GKContactsIntegrationMetricsHandler *v7;
  id v8;
  GKContactsIntegrationMigrator *v9;
  void *v10;
  GKContactsIntegrationMigrator *v11;
  GKContactsIntegrationController *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKIDSConnectionManager sharedManager](GKIDSConnectionManager, "sharedManager"));
  v5 = objc_alloc_init(GKPlayerInternalProvider);
  v6 = objc_alloc_init(GKContactsIntegrationEligibilityChecker);
  v7 = objc_alloc_init(GKContactsIntegrationMetricsHandler);
  v8 = objc_alloc_init((Class)CNContactStore);
  v9 = [GKContactsIntegrationMigrator alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = -[GKContactsIntegrationMigrator initWithUserDefaults:](v9, "initWithUserDefaults:", v10);
  v12 = -[GKContactsIntegrationController initWithNotificationCenter:connectionManager:playerProvider:eligibilityChecker:metricsHandler:contactStore:migrator:](self, "initWithNotificationCenter:connectionManager:playerProvider:eligibilityChecker:metricsHandler:contactStore:migrator:", v3, v4, v5, v6, v7, v8, v11);

  return v12;
}

- (GKContactsIntegrationController)initWithNotificationCenter:(id)a3 connectionManager:(id)a4 playerProvider:(id)a5 eligibilityChecker:(id)a6 metricsHandler:(id)a7 contactStore:(id)a8 migrator:(id)a9
{
  id v15;
  id v16;
  id v17;
  GKContactsIntegrationController *v18;
  GKContactsIntegrationController *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v22;
  OS_dispatch_queue *idsBatchQueue;
  dispatch_queue_t v24;
  OS_dispatch_queue *contactsBatchQueue;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v15 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v16 = a8;
  v17 = a9;
  v31.receiver = self;
  v31.super_class = (Class)GKContactsIntegrationController;
  v18 = -[GKContactsIntegrationController init](&v31, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_migrator, a9);
    objc_storeStrong((id *)&v19->_metricsHandler, a7);
    objc_storeStrong((id *)&v19->_eligibilityChecker, a6);
    objc_storeStrong((id *)&v19->_playerProvider, a5);
    objc_storeStrong((id *)&v19->_contactStore, a8);
    v20 = dispatch_queue_create("com.apple.GameKit.contactsIntegration.serialQueue", 0);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_create("com.apple.GameKit.contactsIntegration.idsBatchQueue", 0);
    idsBatchQueue = v19->_idsBatchQueue;
    v19->_idsBatchQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_queue_create("com.apple.GameKit.contactsIntegration.contactsBatchQueue", 0);
    contactsBatchQueue = v19->_contactsBatchQueue;
    v19->_contactsBatchQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v19->_connectionManager, a4);
    -[GKIDSConnectionManager setDelegate:](v19->_connectionManager, "setDelegate:", v19, v27, v28, v29, v30);
    objc_msgSend(v15, "addObserver:selector:name:object:", v19, "playerAuthenticated:", GKPrimaryCredentialDidChangeNotification, 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v19, "storeBagUpdated:", CFSTR("GKStoreBagUpdatedNotification"), 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v19, "contactsChanged:", CNContactStoreDidChangeNotification, 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v19, "reachabilityChanged:", CFSTR("GKNetworkReachabilityChangedNotification"), 0);
  }

  return v19;
}

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController eligibilityChecker](self, "eligibilityChecker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localPlayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController connectionManager](self, "connectionManager"));
  LOBYTE(a3) = objc_msgSend(v10, "isEligibleAllowingIneligibility:usingSettings:localPlayerInternal:isConnectionManagerReady:withContext:", a3, v9, v12, objc_msgSend(v13, "isReady"), v8);

  return a3;
}

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localPlayerCacheGroup"));

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001259D0;
  v13[3] = &unk_1002C4658;
  v16 = &v18;
  v17 = a3;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  objc_msgSend(v9, "performBlockAndWait:", v13);

  LOBYTE(v6) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v6;
}

- (void)startWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m", 173, "-[GKContactsIntegrationController startWithOptions:completion:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7));

  if ((v4 & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100125B74;
    v11[3] = &unk_1002BBB70;
    v11[4] = self;
    objc_msgSend(v8, "perform:", v11);
  }
  if ((v4 & 2) != 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100125C20;
    v10[3] = &unk_1002BBB70;
    v10[4] = self;
    objc_msgSend(v8, "perform:", v10);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  objc_msgSend(v8, "notifyOnQueue:block:", v9, v6);

}

- (void)startContactsSyncAllowingChangeHistory:(BOOL)a3 completion:(id)a4
{
  id v5;
  dispatch_queue_t current_queue;
  NSObject *v7;
  NSObject *v8;
  const char *label;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v39[4];
  _QWORD *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  _QWORD *v45;
  id v46;
  id location;
  _QWORD v48[5];
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD v53[4];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  _QWORD v64[4];
  id v65;

  v5 = a4;
  current_queue = dispatch_get_current_queue();
  v7 = objc_claimAutoreleasedReturnValue(current_queue);
  v8 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v7 != v8)
  {
    label = dispatch_queue_get_label(v7);
    v10 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v11 = dispatch_queue_get_label(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController startContactsSyncAllowingChangeHistory:completion:]", label, v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v13, "-[GKContactsIntegrationController startContactsSyncAllowingChangeHistory:completion:]", objc_msgSend(v15, "UTF8String"), 193));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100126278;
  v64[3] = &unk_1002BB540;
  v17 = v5;
  v65 = v17;
  v18 = objc_retainBlock(v64);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController contactsUpdateGroup](self, "contactsUpdateGroup"));

  if (!v19)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController settings](self, "settings"));
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = sub_10012628C;
    v58 = sub_10012629C;
    v59 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v53[3] = 0;
    v23 = objc_autoreleasePoolPush();
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localPlayerCacheGroup"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "context"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1001262A4;
    v48[3] = &unk_1002C4680;
    v51 = &v60;
    v48[4] = self;
    v27 = v22;
    v49 = v27;
    v28 = v25;
    v50 = v28;
    v52 = &v54;
    objc_msgSend(v26, "performBlockAndWait:", v48);

    objc_autoreleasePoolPop(v23);
    if (*((_BYTE *)v61 + 24))
    {
      if (a3 || !v55[5])
      {
        if (!os_log_GKGeneral)
          v31 = (id)GKOSLoggers(v29);
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
          sub_10012E734();
        objc_initWeak(&location, self);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m", 248, "-[GKContactsIntegrationController startContactsSyncAllowingChangeHistory:completion:]"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v32));
        -[GKContactsIntegrationController setContactsUpdateGroup:](self, "setContactsUpdateGroup:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController contactsUpdateGroup](self, "contactsUpdateGroup"));
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1001263B8;
        v42[3] = &unk_1002C46D0;
        objc_copyWeak(&v46, &location);
        v44 = &v54;
        v43 = v27;
        v45 = v53;
        objc_msgSend(v34, "perform:", v42);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController contactsUpdateGroup](self, "contactsUpdateGroup"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100126558;
        v39[3] = &unk_1002C2BE8;
        objc_copyWeak(&v41, &location);
        v40 = v18;
        objc_msgSend(v35, "notifyOnQueue:block:", v36, v39);

        objc_destroyWeak(&v41);
        objc_destroyWeak(&v46);
        objc_destroyWeak(&location);
        goto LABEL_26;
      }
      if (!os_log_GKGeneral)
        v30 = (id)GKOSLoggers(v29);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012E760();
    }
    else
    {
      if (!os_log_GKGeneral)
        v37 = (id)GKOSLoggers(v29);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012E708();
    }
    ((void (*)(_QWORD *))v18[2])(v18);
LABEL_26:
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(&v54, 8);

    _Block_object_dispose(&v60, 8);
    goto LABEL_27;
  }
  if (!os_log_GKGeneral)
    v21 = (id)GKOSLoggers(v20);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012E78C();
  ((void (*)(_QWORD *))v18[2])(v18);
LABEL_27:

}

- (unint64_t)calculateRemainingIDSHandleQueryCountUsingSettings:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  signed int v11;
  id v12;
  unint64_t v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfoList _gkPrimaryListWithContext:](GKCDIDSInfoList, "_gkPrimaryListWithContext:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updateIntervalStartTimeStamp"));
  objc_msgSend(v5, "idsUpdateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (!v8 || objc_msgSend(v8, "compare:", v9) == (id)-1)
    objc_msgSend(v6, "_gkReset");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updateIntervalHandlesCount"));
  v11 = objc_msgSend(v10, "intValue");

  v12 = objc_msgSend(v5, "idsV2FetchSize");
  v13 = ((uint64_t)v12 - v11) & ~(((uint64_t)v12 - v11) >> 63);

  return v13;
}

- (void)refetchIDSHandlesInPriorityOrderWithCompletion:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  NSObject *v7;
  const char *label;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  GKContactsIntegrationController *v27;
  id v28;
  id v29;
  uint64_t v30;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v6 != v7)
  {
    label = dispatch_queue_get_label(v6);
    v9 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v10 = dispatch_queue_get_label(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController refetchIDSHandlesInPriorityOrderWithCompletion:]", label, v10, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v12, "-[GKContactsIntegrationController refetchIDSHandlesInPriorityOrderWithCompletion:]", objc_msgSend(v14, "UTF8String"), 297));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v16);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012E7B8();
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController settings](self, "settings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localPlayerCacheGroup"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "context"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001268F8;
  v25[3] = &unk_1002BE6A0;
  v26 = v20;
  v27 = self;
  v29 = v4;
  v30 = 0;
  v28 = v18;
  v22 = v4;
  v23 = v18;
  v24 = v20;
  objc_msgSend(v21, "performBlock:", v25);

}

- (void)updateIntervalHasFinishedExceedingIDSLimit:(BOOL)a3 allowingIneligibility:(unint64_t)a4 usingSettings:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKContactsIntegrationController *v18;
  _QWORD v19[4];
  id v20;
  GKContactsIntegrationController *v21;
  id v22;
  unint64_t v23;

  v8 = a5;
  v9 = v8;
  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localPlayerCacheGroup"));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100126E64;
    v19[3] = &unk_1002BCB70;
    v12 = v11;
    v20 = v12;
    v21 = self;
    v23 = a4;
    v22 = v9;
    objc_msgSend(v12, "performOnManagedObjectContext:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100126F54;
    v16[3] = &unk_1002BB658;
    v17 = v12;
    v18 = self;
    v14 = v12;
    objc_msgSend(v14, "notifyOnQueue:block:", v13, v16);

  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v8);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012E810();
    -[GKContactsIntegrationController stop](self, "stop");
  }

}

- (id)handlesExcludingNoneExpiredFromHandles:(id)a3 isAlreadyWaitingOnLimitTimer:(BOOL)a4 settings:(id)a5 moc:(id)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  const __CFString *v57;
  void *v58;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v12, "mutableCopy");
  v16 = -[GKContactsIntegrationController calculateRemainingIDSHandleQueryCountUsingSettings:withContext:](self, "calculateRemainingIDSHandleQueryCountUsingSettings:withContext:", v13, v14);
  v17 = v16;
  v50 = v14;
  v51 = v12;
  if (!v16 || v10)
  {
    if (!os_log_GKGeneral)
      v45 = (id)GKOSLoggers(v16);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012E894();
    v46 = GKContactsIntegrationErrorDomain;
    v57 = CFSTR("reason");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("remainingHandlesToUpdate: %@, isAlreadyWaitingOnLimitTimer: %@"), v18, v24));
    v58 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v46, 4, v48));

    v44 = 0;
    v37 = v50;
    v36 = v12;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkFetchRequest](GKCDIDSInfo, "_gkFetchRequest"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@"), v12));
    objc_msgSend(v18, "setPredicate:", v19);

    v20 = objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsFromFetchRequest:withContext:](GKCDIDSInfo, "_gkObjectsFromFetchRequest:withContext:", v18, v14));
    v21 = (void *)v20;
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(v20);
    v23 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012E9FC(v23);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v24 = v21;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v29, "isExpiredForSettings:", v13) & 1) == 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "handle"));

            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "handle"));
              objc_msgSend(v15, "removeObject:", v31);

            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v26);
    }

    if (!os_log_GKGeneral)
      v33 = (id)GKOSLoggers(v32);
    v34 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012E960(v34);
    v35 = objc_msgSend(v15, "count");
    v37 = v50;
    v36 = v51;
    if (v17 < (unint64_t)v35)
    {
      if (!os_log_GKGeneral)
        v38 = (id)GKOSLoggers(v35);
      v39 = (void *)os_log_GKContacts;
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012E8C0(v39, v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "subarrayWithRange:", 0, v17));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v41));
      v43 = objc_msgSend(v42, "mutableCopy");

      v15 = v43;
    }
    v15 = v15;
    v44 = v15;
  }

  return v44;
}

- (void)syncIDSDataForHandles:(id)a3 forcefully:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001275D8;
  v13[3] = &unk_1002BCB20;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)fetchIDSDataAndUpdateCacheForHandles:(id)a3 allowingIneligibility:(unint64_t)a4 usingSettings:(id)a5 withDelay:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  BOOL v34;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (void (**)(_QWORD, _QWORD))v14;
  if (!os_log_GKGeneral)
    v16 = (id)GKOSLoggers(v14);
  v17 = (void *)os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012EAF0(v17);
  v18 = objc_msgSend(v13, "idsV2BatchFetchSize");
  if (v18)
  {
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    v21 = objc_msgSend(v20, "count");
    v22 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsBatchQueue](self, "idsBatchQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100127D94;
    v25[3] = &unk_1002C4748;
    v25[4] = self;
    v26 = v20;
    v29 = 0;
    v30 = v19;
    v31 = v19;
    v32 = v21;
    v33 = a4;
    v27 = v13;
    v34 = a6;
    v28 = v15;
    v23 = v20;
    dispatch_async(v22, v25);

  }
  else
  {
    if (!os_log_GKGeneral)
      v24 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012EAC4();
    v15[2](v15, 0);
  }

}

- (void)fetchIDSDataAndUpdateCacheForHandles:(id)a3 rangeToFetch:(_NSRange)a4 maxBatchSize:(unint64_t)a5 numberOfHandlesLeft:(int64_t)a6 allowingIneligibility:(unint64_t)a7 settings:(id)a8 withDelay:(BOOL)a9 completion:(id)a10
{
  char *length;
  dispatch_queue_t current_queue;
  NSObject *v13;
  NSObject *v14;
  const char *label;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v35;
  NSUInteger v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44[6];
  BOOL v45;
  _BYTE location[12];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;

  v37 = a4.location;
  length = (char *)a4.length;
  v39 = a3;
  v35 = a8;
  v38 = a10;
  current_queue = dispatch_get_current_queue();
  v13 = objc_claimAutoreleasedReturnValue(current_queue);
  v14 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsBatchQueue](self, "idsBatchQueue"));

  if (v13 != v14)
  {
    label = dispatch_queue_get_label(v13);
    v16 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsBatchQueue](self, "idsBatchQueue"));
    v17 = dispatch_queue_get_label(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController fetchIDSDataAndUpdateCacheForHandles:rangeToFetch:maxBatchSize:numberOfHandlesLeft:allowingIneligibility:settings:withDelay:completion:]", label, v17, v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.idsBatchQueue)\n[%s (%s:%d)]"), v19, "-[GKContactsIntegrationController fetchIDSDataAndUpdateCacheForHandles:rangeToFetch:maxBatchSize:numberOfHandlesLeft:allowingIneligibility:settings:withDelay:completion:]", objc_msgSend(v21, "UTF8String"), 620));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v22);
  }

  v23 = (char *)objc_msgSend(v39, "count");
  if (a6 >= 1 && length)
  {
    if (&length[v37] > v23)
      length = &v23[-v37];
    if (!os_log_GKGeneral)
      v24 = (id)GKOSLoggers(v23);
    v25 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    {
      v29 = v25;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", length));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v39, "count")));
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v30;
      v47 = 2112;
      v48 = v31;
      v49 = 2112;
      v50 = v32;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Fetching range: (%@, %@) of total count: %@", location, 0x20u);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subarrayWithRange:", v37, length));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController connectionManager](self, "connectionManager"));
    objc_initWeak((id *)location, self);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100128248;
    v40[3] = &unk_1002C4770;
    objc_copyWeak(v44, (id *)location);
    v43 = v38;
    v41 = v39;
    v44[1] = (id)v37;
    v44[2] = length;
    v44[3] = (id)a5;
    v44[4] = (id)a6;
    v44[5] = (id)a7;
    v42 = v35;
    v45 = a9;
    objc_msgSend(v27, "fetchIDSDataForHandles:service:infoTypes:performingBlockPerBatch:", v26, CFSTR("com.apple.private.alloy.arcade"), 5, v40);

    objc_destroyWeak(v44);
    objc_destroyWeak((id *)location);

  }
  else
  {
    if (!os_log_GKGeneral)
      v28 = (id)GKOSLoggers(v23);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012EB8C();
    (*((void (**)(id, _QWORD))v38 + 2))(v38, 0);
  }

}

- (void)handleIDSFetchResult:(id)a3 handlesToQuery:(id)a4 rangeToFetch:(_NSRange)a5 maxBatchSize:(unint64_t)a6 numberOfHandlesLeft:(int64_t)a7 allowingIneligibility:(unint64_t)a8 settings:(id)a9 withDelay:(BOOL)a10 completion:(id)a11
{
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSUInteger length;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  GKContactsIntegrationController *v34;
  id v35;
  id v36;
  NSUInteger v37;
  NSUInteger v38;
  unint64_t v39;
  int64_t v40;
  unint64_t v41;
  BOOL v42;
  _QWORD v43[4];
  id v44;
  id v45;
  GKContactsIntegrationController *v46;
  id v47;
  unint64_t v48;

  length = a5.length;
  location = a5.location;
  v14 = a3;
  v15 = a4;
  v16 = a9;
  v17 = a11;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localPlayerCacheGroup"));

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100128620;
  v43[3] = &unk_1002BEBA0;
  v20 = v19;
  v44 = v20;
  v45 = v14;
  v46 = self;
  v48 = a8;
  v21 = v16;
  v47 = v21;
  v30 = v14;
  objc_msgSend(v20, "performOnManagedObjectContext:", v43);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsBatchQueue](self, "idsBatchQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100128B4C;
  v31[3] = &unk_1002C47E8;
  v32 = v20;
  v33 = v21;
  v36 = v17;
  v37 = location;
  v38 = length;
  v39 = a6;
  v34 = self;
  v35 = v15;
  v40 = a7;
  v41 = a8;
  v42 = a10;
  v23 = v15;
  v24 = v21;
  v25 = v17;
  v26 = v20;
  objc_msgSend(v26, "notifyOnQueue:block:", v22, v31);

}

- (BOOL)isAlreadyWaitingOnLimitTimer
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  const char *label;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v8 = dispatch_queue_get_label(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController isAlreadyWaitingOnLimitTimer]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v10, "-[GKContactsIntegrationController isAlreadyWaitingOnLimitTimer]", objc_msgSend(v12, "UTF8String"), 822));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsCacheUpdateTimer](self, "idsCacheUpdateTimer"));
  v15 = v14 != 0;

  return v15;
}

- (void)getRelationshipsForContacts:(id)a3 updateExistingContactEntries:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t v25;
  BOOL v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012EE7C(v6, v12, v13, v14, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100129288;
  block[3] = &unk_1002C4860;
  v24 = v10;
  v25 = 8;
  block[4] = self;
  v23 = v8;
  v26 = v6;
  v20 = v8;
  v21 = v10;
  dispatch_async(v19, block);

}

- (id)relationshipForMeContact
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012EEE4();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localPlayerCacheGroup"));

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10012628C;
  v24 = sub_10012629C;
  v25 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1001298D4;
  v17 = &unk_1002BC800;
  v7 = v5;
  v18 = v7;
  v19 = &v20;
  objc_msgSend(v6, "performBlockAndWait:", &v14);

  if (v21[5])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider", v14, v15, v16, v17));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localPlayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountName"));

    v11 = (void *)objc_opt_new(GKContactRelationshipResult);
    objc_msgSend(v11, "setRelationship:", 2);
    objc_msgSend(v11, "setRelatedPlayer:", v21[5]);
    if (objc_msgSend(v10, "length"))
      v12 = v10;
    else
      v12 = 0;
    objc_msgSend(v11, "setHandle:", v12);

  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void)relationshipsForContacts:(id)a3 updateExistingContactEntries:(BOOL)a4 allowingIneligibility:(unint64_t)a5 usingSettings:(id)a6 meContactID:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  dispatch_queue_t current_queue;
  NSObject *v17;
  NSObject *v18;
  const char *label;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  unint64_t v46;
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  BOOL v56;
  unsigned __int8 v57;

  v12 = a4;
  v48 = a3;
  v14 = a6;
  v15 = a7;
  v47 = a8;
  current_queue = dispatch_get_current_queue();
  v17 = objc_claimAutoreleasedReturnValue(current_queue);
  v18 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v17 != v18)
  {
    v45 = v15;
    v46 = a5;
    label = dispatch_queue_get_label(v17);
    v20 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v21 = dispatch_queue_get_label(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController relationshipsForContacts:updateExistingContactEntries:allowingIneligibility:usingSettings:meContactID:completionHandler:]", label, v21, v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPathComponent")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v23, "-[GKContactsIntegrationController relationshipsForContacts:updateExistingContactEntries:allowingIneligibility:usingSettings:meContactID:completionHandler:]", objc_msgSend(v25, "UTF8String"), 921));

    v15 = v45;
    a5 = v46;

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v26);
  }

  v27 = -[GKContactsIntegrationController isAlreadyWaitingOnLimitTimer](self, "isAlreadyWaitingOnLimitTimer");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localPlayerCacheGroup"));

  if (!os_log_GKGeneral)
    v31 = (id)GKOSLoggers(v30);
  v32 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012EF10(v12, v32, v33, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "context"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100129C74;
  v49[3] = &unk_1002C48B0;
  v49[4] = self;
  v50 = v48;
  v56 = v12;
  v51 = v15;
  v52 = v29;
  v57 = v27;
  v53 = v14;
  v54 = v47;
  v55 = a5;
  v40 = v47;
  v41 = v14;
  v42 = v29;
  v43 = v15;
  v44 = v48;
  objc_msgSend(v39, "performBlock:", v49);

}

- (void)playerAuthenticated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012F150();
  v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012A2E0;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)contactsChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012A35C;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)reachabilityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012A5E4;
  v7[3] = &unk_1002BB658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleReachabilityChanged
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012F1D4();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localPlayerCacheGroup"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012A90C;
  v8[3] = &unk_1002BBBD8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)storeBagUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKContactsIntegrationControllerSettings allBagKeys](GKContactsIntegrationControllerSettings, "allBagKeys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10012AB74;
    v8[3] = &unk_1002C4920;
    v8[4] = self;
    objc_msgSend(v4, "getValuesForKeys:queue:completion:", v5, v6, v8);

  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10012F264();
  }

}

- (BOOL)canSyncWithIDS
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  const char *label;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  id v20;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v8 = dispatch_queue_get_label(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController canSyncWithIDS]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v10, "-[GKContactsIntegrationController canSyncWithIDS]", objc_msgSend(v12, "UTF8String"), 1121));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsUpdateGroup](self, "idsUpdateGroup"));
  if (v14)
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(v15);
    v17 = os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      sub_10012F378();
LABEL_13:
      LOBYTE(v17) = 0;
    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsCacheUpdateTimer](self, "idsCacheUpdateTimer"));

    if (!v18)
    {
      LOBYTE(v17) = 1;
      return v17;
    }
    if (!os_log_GKGeneral)
      v20 = (id)GKOSLoggers(v19);
    v17 = os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      sub_10012F34C();
      goto LABEL_13;
    }
  }
  return v17;
}

- (void)startIDSSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012F3A4();
  v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012B060;
  v9[3] = &unk_1002BB758;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (void)stop
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012F3D0();
  v4 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012B608;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)setupIDSCacheUpdateTimerWithStartTime:(double)a3
{
  dispatch_queue_t current_queue;
  NSObject *v6;
  NSObject *v7;
  const char *label;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  GKContactsIntegrationTimer *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id location;

  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v6 != v7)
  {
    label = dispatch_queue_get_label(v6);
    v9 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v10 = dispatch_queue_get_label(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController setupIDSCacheUpdateTimerWithStartTime:]", label, v10, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v12, "-[GKContactsIntegrationController setupIDSCacheUpdateTimerWithStartTime:]", objc_msgSend(v14, "UTF8String"), 1185));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v16);
  v18 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012F3FC(v18, a3, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsCacheUpdateTimer](self, "idsCacheUpdateTimer"));
  objc_msgSend(v21, "cancel");

  v22 = objc_alloc_init(GKContactsIntegrationTimer);
  -[GKContactsIntegrationController setIdsCacheUpdateTimer:](self, "setIdsCacheUpdateTimer:", v22);

  objc_initWeak(&location, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsCacheUpdateTimer](self, "idsCacheUpdateTimer"));
  v24 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10012B8E8;
  v26[3] = &unk_1002C3A30;
  objc_copyWeak(&v27, &location);
  v26[4] = self;
  objc_msgSend(v23, "startWithStartTime:updateInterval:queue:updateBlock:cancelBlock:", v24, v25, v26, &stru_1002C4990, 1.84467441e19);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)stopCacheUpdates
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  const char *label;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
    v8 = dispatch_queue_get_label(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKContactsIntegrationController stopCacheUpdates]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v10, "-[GKContactsIntegrationController stopCacheUpdates]", objc_msgSend(v12, "UTF8String"), 1226));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsCacheUpdateTimer](self, "idsCacheUpdateTimer"));
  objc_msgSend(v14, "cancel");

  -[GKContactsIntegrationController setIdsCacheUpdateTimer:](self, "setIdsCacheUpdateTimer:", 0);
  v15 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController idsBatchQueue](self, "idsBatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012BDB8;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v15, block);

}

- (void)clearCachesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localPlayerCacheGroup"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012BF18;
  v12[3] = &unk_1002BBB70;
  v12[4] = self;
  objc_msgSend(v6, "performOnQueue:block:", v7, v12);

  objc_msgSend(v6, "performOnManagedObjectContext:", &stru_1002C49B0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012BFE0;
  v10[3] = &unk_1002BB540;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "notifyOnQueue:block:", v8, v10);

}

- (id)contactAssociationIDMapForHandles:(id)a3 withContext:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsMatchingHandles:withContext:](GKCDIDSInfo, "_gkObjectsMatchingHandles:withContext:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkMapDictionaryWithKeyPath:valueKeyPath:", CFSTR("handle"), CFSTR("contactAssociationID")));

  return v5;
}

- (id)contactAssociationIDMapForContactAssociationIDs:(id)a3 withContext:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsMatchingContactAssociationIDs:withContext:](GKCDIDSInfo, "_gkObjectsMatchingContactAssociationIDs:withContext:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkMapDictionaryWithKeyPath:valueKeyPath:", CFSTR("handle"), CFSTR("contactAssociationID")));

  return v5;
}

- (id)handleMapForContactAssociationIDs:(id)a3 withContext:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsMatchingContactAssociationIDs:withContext:](GKCDIDSInfo, "_gkObjectsMatchingContactAssociationIDs:withContext:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkMapDictionaryWithKeyPath:valueKeyPath:", CFSTR("contactAssociationID"), CFSTR("handle")));

  return v5;
}

- (id)relationshipsForHandles:(id)a3 contactAssociationIDMap:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v7 = a3;
  v8 = a4;
  v28 = a5;
  if (objc_msgSend(v7, "count"))
  {
    if (!objc_msgSend(v8, "count"))
    {
      if (!os_log_GKGeneral)
        v9 = (id)GKOSLoggers(0);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012F4C0();
    }
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

    v25 = (void *)v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController createFriendAssociationIDMapWithIDs:withContext:](self, "createFriendAssociationIDMapWithIDs:withContext:", v12, v28));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v7;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v19));
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController createRelationshipWithHandle:contactAssociationID:usingFriendMap:withContext:](self, "createRelationshipWithHandle:contactAssociationID:usingFriendMap:withContext:", v19, v20, v13, v28));
          }
          else
          {
            v21 = (void *)objc_opt_new(GKContactRelationshipResult);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_stripFZIDPrefix"));
            objc_msgSend(v21, "setHandle:", v22);

            objc_msgSend(v21, "setRelationship:", 0);
          }
          objc_msgSend(v10, "addObject:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }

    v23 = objc_msgSend(v10, "copy");
    v7 = v26;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)createRelationshipWithHandle:(id)a3 contactAssociationID:(id)a4 usingFriendMap:(id)a5 withContext:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_opt_new(GKContactRelationshipResult);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_stripFZIDPrefix"));

  objc_msgSend(v11, "setHandle:", v12);
  if (objc_msgSend(v8, "length"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
    if (v13)
    {
      v14 = objc_msgSend(objc_alloc((Class)GKPlayerInternal), "initWithCacheObject:", v13);
      objc_msgSend(v11, "setRelatedPlayer:", v14);

      v15 = 2;
    }
    else
    {
      v15 = 1;
    }
    objc_msgSend(v11, "setRelationship:", v15);

  }
  else
  {
    objc_msgSend(v11, "setRelationship:", 0);
  }

  return v11;
}

- (id)createFriendAssociationIDMapWithIDs:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerID != nil && friendBiDirectional == YES && contactAssociationID != nil && contactAssociationID IN %@"), v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendListEntryCacheObject _gkObjectsMatchingPredicate:withContext:](GKFriendListEntryCacheObject, "_gkObjectsMatchingPredicate:withContext:", v7, v6));
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_gkDistinctValuesForKeyPath:", CFSTR("playerID")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerID != nil && playerID IN %@"), v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject _gkObjectsMatchingPredicate:withContext:](GKPlayerProfileCacheObject, "_gkObjectsMatchingPredicate:withContext:", v10, v6));
      if (objc_msgSend(v11, "count"))
      {
        v28 = v10;
        v29 = v9;
        v31 = v7;
        v32 = v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
        v27 = v11;
        v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v11, "count"));
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v30 = v8;
        v14 = v8;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "playerID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v20));

              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contactAssociationID"));
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v22);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v16);
        }

        v23 = objc_msgSend(v13, "copy");
        v7 = v31;
        v6 = v32;
        v9 = v29;
        v8 = v30;
        v11 = v27;
        v10 = v28;
      }
      else
      {
        if (!os_log_GKGeneral)
          v25 = (id)GKOSLoggers(0);
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
          sub_10012F518();
        v23 = 0;
      }

    }
    else
    {
      if (!os_log_GKGeneral)
        v24 = (id)GKOSLoggers(0);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012F4EC();
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)populateContactInfoForProfiles:(id)a3 replyOnQueue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController playerProvider](self, "playerProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localPlayerCacheGroup"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012C8A8;
  v16[3] = &unk_1002BD8F0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "performOnManagedObjectContext:", v16);

}

- (void)populateContactInfoForProfiles:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id obj;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  void *v78;
  _BYTE v79[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController settings](self, "settings"));
  v9 = -[GKContactsIntegrationController isEligibleAllowingIneligibility:usingSettings:withContext:](self, "isEligibleAllowingIneligibility:usingSettings:withContext:", 0, v8, v7);

  if ((v9 & 1) != 0)
  {
    if (objc_msgSend(v6, "count"))
    {
      v11 = objc_msgSend(v6, "count");
      if (v11 == (id)1
        && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject")),
            v13 = objc_msgSend(v12, "isLocalPlayer"),
            v12,
            v13))
      {
        if (!os_log_GKGeneral)
          v14 = (id)GKOSLoggers(v11);
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
          sub_10012F570();
      }
      else
      {
        if (!os_log_GKGeneral)
          v16 = (id)GKOSLoggers(v11);
        v17 = (void *)os_log_GKContacts;
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
          sub_10012F59C(v17);
        v59 = v6;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkDistinctValuesForKeyPath:", CFSTR("playerID")));
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("friendBiDirectional == YES && playerID != nil && playerID IN %@"), v57));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendListEntryCacheObject _gkObjectsMatchingPredicate:withContext:](GKFriendListEntryCacheObject, "_gkObjectsMatchingPredicate:withContext:"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v18, "count")));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v18, "count")));
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        obj = v18;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v73 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contactAssociationID"));
              if (objc_msgSend(v25, "length"))
              {
                objc_msgSend(v19, "addObject:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "playerID"));
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v25, v26);

              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
          }
          while (v21);
        }

        v55 = v19;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController contactAssociationIDMapForContactAssociationIDs:withContext:](self, "contactAssociationIDMapForContactAssociationIDs:withContext:", v19, v7));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkFetchRequest](GKCDContactInfo, "_gkFetchRequest"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allKeys"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@"), v29));
        objc_msgSend(v28, "setPredicate:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("givenName"), 1));
        v78 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
        objc_msgSend(v28, "setSortDescriptors:", v32);

        v54 = v28;
        v58 = v7;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkObjectsFromFetchRequest:withContext:](GKCDContactInfo, "_gkObjectsFromFetchRequest:withContext:", v28, v7));
        v34 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v33, "count"));
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v61 = v33;
        v35 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v69;
          do
          {
            for (j = 0; j != v36; j = (char *)j + 1)
            {
              if (*(_QWORD *)v69 != v37)
                objc_enumerationMutation(v61);
              v39 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "handle"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v40));
              if (objc_msgSend(v41, "length"))
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v41));

                if (!v42)
                  objc_msgSend(v34, "setObject:forKeyedSubscript:", v39, v41);
              }

            }
            v36 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
          }
          while (v36);
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController metricsHandler](self, "metricsHandler"));
        objc_msgSend(v43, "recordContactInfoMatchCount:", objc_msgSend(v34, "count"));

        if (objc_msgSend(v34, "count"))
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v60 = v59;
          v44 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v65;
            do
            {
              for (k = 0; k != v45; k = (char *)k + 1)
              {
                if (*(_QWORD *)v65 != v46)
                  objc_enumerationMutation(v60);
                v48 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k);
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "playerID"));
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", v49));
                if (objc_msgSend(v50, "length"))
                {
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v50));
                  if (v51)
                  {
                    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact _gkContactFromCacheObject:](CNContact, "_gkContactFromCacheObject:", v51));
                    objc_msgSend(v48, "setContact:", v52);

                  }
                }

              }
              v45 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
            }
            while (v45);
          }

        }
        v7 = v58;
        v6 = v59;
      }
    }
    else
    {
      if (!os_log_GKGeneral)
        v53 = (id)GKOSLoggers(0);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012F544();
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v10);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012F638();
  }

}

- (id)filterForContactIDsSupportingFriendingViaPushFromContactIDs:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController settings](self, "settings"));
  LOBYTE(self) = -[GKContactsIntegrationController isEligibleAllowingIneligibility:usingSettings:withContext:](self, "isEligibleAllowingIneligibility:usingSettings:withContext:", 8, v8, v7);

  if ((self & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkFetchRequest](GKCDContactInfo, "_gkFetchRequest"));
    if (objc_msgSend(v6, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contactID IN %@"), v6));
      objc_msgSend(v10, "setPredicate:", v11);

    }
    else
    {
      objc_msgSend(v10, "setPredicate:", 0);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkObjectsFromFetchRequest:withContext:](GKCDContactInfo, "_gkObjectsFromFetchRequest:withContext:", v10, v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkMapDictionaryWithKeyPath:valueKeyPath:", CFSTR("handle"), CFSTR("contactID")));
    if (objc_msgSend(v15, "count"))
    {
      v33 = v14;
      v34 = v10;
      v35 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
      v17 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@"), v16));

      v32 = (void *)v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsMatchingPredicate:withContext:](GKCDIDSInfo, "_gkObjectsMatchingPredicate:withContext:", v17, v7));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v18, "count")));
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "supportsFriendingViaPush"));
            v27 = objc_msgSend(v26, "BOOLValue");

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "handle"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v28));

              if (objc_msgSend(v29, "length"))
                objc_msgSend(v19, "addObject:", v29);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v22);
      }

      v13 = objc_msgSend(v19, "copy");
      v10 = v34;
      v6 = v35;
      v14 = v33;
    }
    else
    {
      if (!os_log_GKGeneral)
        v30 = (id)GKOSLoggers(0);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012F664();
      v13 = 0;
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v9);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012F690();
    v13 = 0;
  }

  return v13;
}

- (void)connectionManagerReady:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012F6BC();
  v7 = objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012D454;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)updateIDSEntriesFromOldFriendEntries:(id)a3 againstServerRepresentation:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _BOOL8 v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _BYTE v50[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v38 = v9;
    v40 = v7;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v8, "count")));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v39 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v45;
      v14 = GKPlayerIDKey;
      v15 = GKContactsAssociationIDKey;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v14));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v18));
          v21 = v20;
          if (v20)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contactAssociationID"));
            if (objc_msgSend(v22, "length") && !objc_msgSend(v19, "length"))
              objc_msgSend(v41, "addObject:", v22);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v12);
    }

    v23 = objc_msgSend(v41, "count");
    if (v23)
    {
      v9 = v38;
      if (!os_log_GKGeneral)
        v24 = (id)GKOSLoggers(v23);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012F808();
      v25 = objc_msgSend(objc_alloc((Class)NSBatchUpdateRequest), "initWithEntityName:", CFSTR("IDSInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contactAssociationID != nil && contactAssociationID in %@"), v41));
      objc_msgSend(v25, "setPredicate:", v26);

      v48[0] = CFSTR("contactAssociationID");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", 0));
      v49[0] = v27;
      v49[1] = &off_1002DB9D0;
      v48[1] = CFSTR("cohort");
      v48[2] = CFSTR("timeStamp");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v49[2] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 3));
      objc_msgSend(v25, "setPropertiesToUpdate:", v29);

      v43 = 0;
      v30 = objc_msgSend(v38, "executeRequest:error:", v25, &v43);
      v31 = v43;
      v32 = v31;
      v8 = v39;
      v7 = v40;
      if (v31)
      {
        if (!os_log_GKGeneral)
          v33 = (id)GKOSLoggers(v31);
        v34 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
        if (v34)
          sub_10012F7DC();
        if (!os_log_GKGeneral)
          v35 = (id)GKOSLoggers(v34);
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
          sub_10012F778();
      }

    }
    else
    {
      v8 = v39;
      v7 = v40;
      if (!os_log_GKGeneral)
        v37 = (id)GKOSLoggers(0);
      v9 = v38;
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_10012F74C();
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v36 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_10012F720();
  }

}

- (id)expirationPredicateForCohort:(int)a3 matchingHandles:(id)a4 usingSettings:(id)a5
{
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSPredicate *v12;
  void *v13;
  uint64_t v15;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  objc_msgSend(a5, "expirationTimeForCohort:", v6);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", -v9));

  if (objc_msgSend(v7, "count"))
    v12 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@ AND cohort == %ld AND timeStamp < %@"), v7, (int)v6, v11);
  else
    v12 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("cohort == %ld AND timeStamp < %@"), (int)v6, v11, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)expiredIDSEntriesWithFetchLimit:(int64_t)a3 matchingHandles:(id)a4 usingSettings:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSPredicate *v14;
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
  void *v25;
  uint64_t v27;
  int64_t v28;
  void *v29;
  _QWORD v30[4];

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkFetchRequest](GKCDIDSInfo, "_gkFetchRequest"));
  if (objc_msgSend(v10, "count"))
    v14 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@ AND cohort == %ld"), v10, -1);
  else
    v14 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("cohort == %ld"), -1, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "setPredicate:", v15);

  objc_msgSend(v13, "setFetchLimit:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsFromFetchRequest:withContext:](GKCDIDSInfo, "_gkObjectsFromFetchRequest:withContext:", v13, v11));
  v28 = a3;
  v29 = v11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkFetchRequest](GKCDIDSInfo, "_gkFetchRequest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController expirationPredicateForCohort:matchingHandles:usingSettings:](self, "expirationPredicateForCohort:matchingHandles:usingSettings:", 0, v10, v12));
  v30[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController expirationPredicateForCohort:matchingHandles:usingSettings:](self, "expirationPredicateForCohort:matchingHandles:usingSettings:", 1, v10, v12));
  v30[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController expirationPredicateForCohort:matchingHandles:usingSettings:](self, "expirationPredicateForCohort:matchingHandles:usingSettings:", 2, v10, v12));
  v30[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationController expirationPredicateForCohort:matchingHandles:usingSettings:](self, "expirationPredicateForCohort:matchingHandles:usingSettings:", 3, v10, v12));

  v30[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v22));
  objc_msgSend(v17, "setPredicate:", v23);

  objc_msgSend(v17, "setFetchLimit:", v28 - (_QWORD)objc_msgSend(v16, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsFromFetchRequest:withContext:](GKCDIDSInfo, "_gkObjectsFromFetchRequest:withContext:", v17, v29));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v24));
  return v25;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (GKContactsIntegrationControllerSettings)settings
{
  return (GKContactsIntegrationControllerSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)idsBatchQueue
{
  return self->_idsBatchQueue;
}

- (void)setIdsBatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idsBatchQueue, a3);
}

- (OS_dispatch_queue)contactsBatchQueue
{
  return self->_contactsBatchQueue;
}

- (void)setContactsBatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contactsBatchQueue, a3);
}

- (GKContactsIntegrationTimer)idsCacheUpdateTimer
{
  return self->_idsCacheUpdateTimer;
}

- (void)setIdsCacheUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idsCacheUpdateTimer, a3);
}

- (GKContactsIntegrationTimer)idsFetchDelayTimer
{
  return self->_idsFetchDelayTimer;
}

- (void)setIdsFetchDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idsFetchDelayTimer, a3);
}

- (GKPlayerInternalProvider)playerProvider
{
  return self->_playerProvider;
}

- (void)setPlayerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_playerProvider, a3);
}

- (GKContactsIntegrationEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (void)setEligibilityChecker:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityChecker, a3);
}

- (GKIDSConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_connectionManager, a3);
}

- (GKContactsIntegrationMetricsHandler)metricsHandler
{
  return self->_metricsHandler;
}

- (void)setMetricsHandler:(id)a3
{
  objc_storeStrong((id *)&self->_metricsHandler, a3);
}

- (GKDispatchGroup)contactsUpdateGroup
{
  return self->_contactsUpdateGroup;
}

- (void)setContactsUpdateGroup:(id)a3
{
  objc_storeStrong((id *)&self->_contactsUpdateGroup, a3);
}

- (GKDispatchGroup)idsUpdateGroup
{
  return self->_idsUpdateGroup;
}

- (void)setIdsUpdateGroup:(id)a3
{
  objc_storeStrong((id *)&self->_idsUpdateGroup, a3);
}

- (GKContactsIntegrationMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (GKContactsIntegrationTimer)contactsChangedCoalescingTimer
{
  return self->_contactsChangedCoalescingTimer;
}

- (void)setContactsChangedCoalescingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_contactsChangedCoalescingTimer, a3);
}

- (GKContactsIntegrationTimer)reachabilityChangedCoalescingTimer
{
  return self->_reachabilityChangedCoalescingTimer;
}

- (void)setReachabilityChangedCoalescingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityChangedCoalescingTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityChangedCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_contactsChangedCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_idsUpdateGroup, 0);
  objc_storeStrong((id *)&self->_contactsUpdateGroup, 0);
  objc_storeStrong((id *)&self->_metricsHandler, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_playerProvider, 0);
  objc_storeStrong((id *)&self->_idsFetchDelayTimer, 0);
  objc_storeStrong((id *)&self->_idsCacheUpdateTimer, 0);
  objc_storeStrong((id *)&self->_contactsBatchQueue, 0);
  objc_storeStrong((id *)&self->_idsBatchQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)fetchMessageTransportV2AvailabilityForUnprefixedHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[32];
  _BYTE v43[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v39;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "length"))
        break;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithUnprefixedURI:](IDSURI, "URIWithUnprefixedURI:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "prefixedURI"));

      if (!v15)
        break;
      objc_msgSend(v8, "addObject:", v15);

      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKContactsIntegrationController.m", 1670, "-[GKContactsIntegrationController(Multiplayer) fetchMessageTransportV2AvailabilityForUnprefixedHandles:completion:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v16));

  v18 = objc_msgSend(v9, "count");
  v19 = objc_msgSend(v8, "count");
  if (v18 == v19 && (v19 = objc_msgSend(v8, "count")) != 0)
  {
    objc_msgSend(v17, "enter");
    objc_initWeak(&location, self);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10012E340;
    v33[3] = &unk_1002C49D8;
    v34 = v8;
    v20 = v17;
    v35 = v20;
    objc_copyWeak(&v36, &location);
    -[GKContactsIntegrationController syncIDSDataForHandles:forcefully:completion:](self, "syncIDSDataForHandles:forcefully:completion:", v34, 0, v33);
    v21 = objc_msgSend(v20, "waitWithTimeout:", 60.0);
    if (v21)
    {
      if (!os_log_GKGeneral)
        v22 = (id)GKOSLoggers(v21);
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
        sub_10012F9CC();
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", GKContactsIntegrationErrorDomain, 9, &off_1002DC4C8));
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v23);
    }
    else
    {
      if (!os_log_GKGeneral)
        v27 = (id)GKOSLoggers(0);
      v28 = os_log_GKMatch;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("availablePlayerHandles")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("unavailablePlayerHandles")));
        sub_10012F960(v29, v30, buf, v28);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));
      if (v31)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));
        (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v23);
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("availablePlayerHandles")));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("unavailablePlayerHandles")));
        (*((void (**)(id, void *, void *, _QWORD))v7 + 2))(v7, v23, v32, 0);

      }
    }

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!os_log_GKGeneral)
      v24 = (id)GKOSLoggers(v19);
    v25 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR))
      sub_10012F86C(v25, v9, v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", GKContactsIntegrationErrorDomain, 10, 0));
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v26);

  }
}

@end
