@implementation ANCAlertSource

- (ANCAlertSource)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  ANCAlertSource *v8;
  ANCAlertSource *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *alerts;
  NSDictionary *firstPartyAppIdentifierToCategoryMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *appIdentifierToCategoryCache;
  NSMutableDictionary *v15;
  NSMutableDictionary *bbBulletinAlerts;
  BBObserver *v17;
  BBObserver *bbObserver;
  BBObserver *v19;
  ANCAlertSource *v20;
  uint64_t v21;
  DNDEventBehaviorResolutionService *behaviorResolutionService;
  NSMutableArray *v23;
  NSMutableArray *tuIncomingCalls;
  uint64_t v25;
  NSMapTable *tuIncomingCallAlerts;
  NSMutableArray *v27;
  NSMutableArray *tuActiveCalls;
  uint64_t v29;
  NSMapTable *tuActiveCallAlerts;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  TUCallCenter *tuCallCenter;
  NSObject *queue;
  ANCAlertSource *v37;
  NSMutableArray *v38;
  NSMutableArray *chUnreadMissedCalls;
  NSMutableDictionary *v40;
  NSMutableDictionary *chMissedCallAlerts;
  void *v42;
  CHManager *v43;
  CHManager *chManager;
  NSObject *v45;
  ANCAlertSource *v46;
  NSMutableArray *v47;
  NSMutableArray *vvUnreadVoicemails;
  uint64_t v49;
  NSMapTable *vvVoicemailAlerts;
  VMVoicemailManager *v51;
  VMVoicemailManager *vvManager;
  void *v53;
  NSObject *v54;
  _QWORD v56[4];
  ANCAlertSource *v57;
  _QWORD v58[4];
  ANCAlertSource *v59;
  _QWORD block[4];
  ANCAlertSource *v61;
  _QWORD v62[4];
  ANCAlertSource *v63;
  objc_super v64;

  v6 = a3;
  v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)ANCAlertSource;
  v8 = -[ANCAlertSource init](&v64, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    alerts = v9->_alerts;
    v9->_alerts = v10;

    firstPartyAppIdentifierToCategoryMap = v9->_firstPartyAppIdentifierToCategoryMap;
    v9->_firstPartyAppIdentifierToCategoryMap = (NSDictionary *)&off_1000B3CF8;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    appIdentifierToCategoryCache = v9->_appIdentifierToCategoryCache;
    v9->_appIdentifierToCategoryCache = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bbBulletinAlerts = v9->_bbBulletinAlerts;
    v9->_bbBulletinAlerts = v15;

    v17 = (BBObserver *)objc_msgSend(objc_alloc((Class)BBObserver), "initWithQueue:", v9->_queue);
    bbObserver = v9->_bbObserver;
    v9->_bbObserver = v17;

    -[BBObserver setDelegate:](v9->_bbObserver, "setDelegate:", v9);
    -[BBObserver setObserverFeed:](v9->_bbObserver, "setObserverFeed:", 1);
    v19 = v9->_bbObserver;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000597E0;
    v62[3] = &unk_1000AE358;
    v20 = v9;
    v63 = v20;
    -[BBObserver getSectionInfoWithCompletion:](v19, "getSectionInfoWithCompletion:", v62);
    v21 = objc_claimAutoreleasedReturnValue(+[DNDEventBehaviorResolutionService serviceForClientIdentifier:](DNDEventBehaviorResolutionService, "serviceForClientIdentifier:", CFSTR("com.apple.BTLEServer.ANCS")));
    behaviorResolutionService = v20->_behaviorResolutionService;
    v20->_behaviorResolutionService = (DNDEventBehaviorResolutionService *)v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tuIncomingCalls = v20->_tuIncomingCalls;
    v20->_tuIncomingCalls = v23;

    v25 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    tuIncomingCallAlerts = v20->_tuIncomingCallAlerts;
    v20->_tuIncomingCallAlerts = (NSMapTable *)v25;

    v27 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tuActiveCalls = v20->_tuActiveCalls;
    v20->_tuActiveCalls = v27;

    v29 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    tuActiveCallAlerts = v20->_tuActiveCallAlerts;
    v20->_tuActiveCallAlerts = (NSMapTable *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v31, "addObserver:selector:name:object:", v20, "callStatusChanged", TUCallCenterCallStatusChangedNotification, 0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v32, "addObserver:selector:name:object:", v20, "callStatusChanged", TUCallCenterVideoCallStatusChangedNotification, 0);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "addObserver:selector:name:object:", v20, "callIdentificationChanged:", TUCallCenterCallerIDChangedNotification, 0);

    v34 = objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", v9->_queue));
    tuCallCenter = v20->_tuCallCenter;
    v20->_tuCallCenter = (TUCallCenter *)v34;

    queue = v9->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059900;
    block[3] = &unk_1000AD230;
    v37 = v20;
    v61 = v37;
    dispatch_async(queue, block);
    v38 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    chUnreadMissedCalls = v37->_chUnreadMissedCalls;
    v37->_chUnreadMissedCalls = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    chMissedCallAlerts = v37->_chMissedCallAlerts;
    v37->_chMissedCallAlerts = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v42, "addObserver:selector:name:object:", v37, "callHistoryChangedNotification", kCallHistoryDatabaseChangedNotification, 0);

    v43 = (CHManager *)objc_alloc_init((Class)CHManager);
    chManager = v37->_chManager;
    v37->_chManager = v43;

    v45 = v9->_queue;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100059908;
    v58[3] = &unk_1000AD230;
    v46 = v37;
    v59 = v46;
    dispatch_async(v45, v58);
    v47 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    vvUnreadVoicemails = v46->_vvUnreadVoicemails;
    v46->_vvUnreadVoicemails = v47;

    v49 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    vvVoicemailAlerts = v46->_vvVoicemailAlerts;
    v46->_vvVoicemailAlerts = (NSMapTable *)v49;

    v51 = (VMVoicemailManager *)objc_alloc_init((Class)VMVoicemailManager);
    vvManager = v46->_vvManager;
    v46->_vvManager = v51;

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v53, "addObserver:selector:name:object:", v46, "voicemailsChangedNotification", VMVoicemailVoicemailsChangedNotification, 0);

    v54 = v9->_queue;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100059914;
    v56[3] = &unk_1000AD230;
    v57 = v46;
    dispatch_async(v54, v56);

  }
  return v9;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = objc_claimAutoreleasedReturnValue(-[ANCAlertSource queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000599F4;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_sync(v4, block);

  v5 = objc_claimAutoreleasedReturnValue(-[ANCAlertSource queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100059A24;
  v6[3] = &unk_1000AD230;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

- (id)alertsForCategoryID:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource alerts](self, "alerts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (id)displayNameForAppIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));

  return v4;
}

- (BOOL)isAlertSilent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;

  v4 = a3;
  v5 = objc_alloc_init((Class)DNDMutableClientEventDetails);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appIdentifier"));
  objc_msgSend(v5, "setBundleIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updateDNDEventDetails:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource behaviorResolutionService](self, "behaviorResolutionService"));
  v23 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolveBehaviorForEventDetails:error:", v7, &v23));
  v10 = v23;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v14 = objc_msgSend(v9, "interruptionSuppression");
    v13 = v14 != 0;
    v15 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appIdentifier"));
      v18 = DNDStringFromInterruptionSuppression(objc_msgSend(v9, "interruptionSuppression"));
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)v19;
      v21 = "N";
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      if (v14)
        v21 = "Y";
      v26 = 2112;
      v27 = v19;
      v28 = 2080;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "appIdentifier %@ DNDSuppress=%@ isSilent=%s", buf, 0x20u);

    }
  }
  else
  {
    v12 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071EA4((uint64_t)v10, v12);
    v13 = 0;
  }

  return v13;
}

- (void)addAlert:(id)a3 isPreExisting:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource alerts](self, "alerts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v15, "categoryID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v10;

  objc_msgSend(v11, "addObject:", v15);
  if (objc_msgSend(v11, "count") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource alerts](self, "alerts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v15, "categoryID")));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  objc_msgSend(v15, "setSilent:", -[ANCAlertSource isAlertSilent:](self, "isAlertSilent:", v15));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource delegate](self, "delegate"));
  objc_msgSend(v14, "alertAdded:isPreExisting:", v15, v4);

}

- (void)modifyAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource alerts](self, "alerts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v4, "categoryID")));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v8, "indexOfObject:", v4), (char *)objc_msgSend(v8, "count") - 1);
  objc_msgSend(v4, "setSilent:", -[ANCAlertSource isAlertSilent:](self, "isAlertSilent:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource delegate](self, "delegate"));
  objc_msgSend(v7, "alertModified:", v4);

}

- (void)removeAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource alerts](self, "alerts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v10, "categoryID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  objc_msgSend(v6, "removeObject:", v10);
  if (!objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource alerts](self, "alerts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v10, "categoryID")));
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  objc_msgSend(v10, "setSilent:", -[ANCAlertSource isAlertSilent:](self, "isAlertSilent:", v10));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource delegate](self, "delegate"));
  objc_msgSend(v9, "alertRemoved:", v10);

}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  ANCBulletinAlert *v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bulletinID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  if (!v11)
  {
    if (objc_msgSend(v8, "contentPreviewSetting") == (id)3)
    {
      v12 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134217984;
        v25 = 3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dropping notification setting type (%ld)", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionID"));
      v14 = -[ANCAlertSource isSpecialSectionID:](self, "isSpecialSectionID:", v13);

      if ((v14 & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionID"));
        v16 = -[ANCAlertSource categoryIDForAppIdentifier:](self, "categoryIDForAppIdentifier:", v15);

        v17 = -[ANCBulletinAlert initWithBulletin:observer:categoryID:]([ANCBulletinAlert alloc], "initWithBulletin:observer:categoryID:", v8, v7, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicationDate"));
        objc_msgSend(v18, "timeIntervalSinceDate:", v19);
        v21 = v20 > 30.0;

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bulletinID"));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, v23);

        -[ANCAlertSource addAlert:isPreExisting:](self, "addAlert:isPreExisting:", v17, v21);
      }
    }
  }

}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bulletinID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    objc_msgSend(v8, "setBulletin:", v9);
    -[ANCAlertSource modifyAlert:](self, "modifyAlert:", v8);
  }

}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bulletinID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    -[ANCAlertSource removeAlert:](self, "removeAlert:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bulletinID"));
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

        if (v12)
        {
          -[ANCAlertSource removeAlert:](self, "removeAlert:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource bbBulletinAlerts](self, "bbBulletinAlerts"));
          objc_msgSend(v13, "removeObjectForKey:", v10);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (BOOL)isSpecialSectionID:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.facetime"));

  return v4;
}

- (unsigned)categoryIDForAppIdentifier:(id)a3
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource appIdentifierToCategoryCache](self, "appIdentifierToCategoryCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    goto LABEL_16;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource firstPartyAppIdentifierToCategoryMap](self, "firstPartyAppIdentifierToCategoryMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

  if (v6)
  {
LABEL_15:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource appIdentifierToCategoryCache](self, "appIdentifierToCategoryCache"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v6, v4);

    goto LABEL_16;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleContainerURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("Info.plist")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SBMatchingApplicationGenres")));
  if (v14)
  {
    v15 = objc_opt_class(NSArray, v13);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0 || !objc_msgSend(v14, "count"))
      goto LABEL_13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v17 = -[ANCAlertSource genreIDForGenre:](self, "genreIDForGenre:", v16);
  }
  else
  {
    v25 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("genreId")));
    v21 = objc_opt_class(NSNumber, v20);
    if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
      v17 = objc_msgSend(v19, "unsignedIntegerValue");
    else
      v17 = 0;

    v8 = v25;
  }

  if (v17)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[ANCAlertSource categoryIDForGenreID:](self, "categoryIDForGenreID:", v17)));
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
LABEL_14:

  if (v6)
    goto LABEL_15;
LABEL_16:
  v23 = objc_msgSend(v6, "unsignedCharValue");

  return v23;
}

- (void)callStatusChanged
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuCallCenter](self, "tuCallCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioAndVideoCallsWithStatus:", 4));

  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "# incoming calls: %lu", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuIncomingCalls](self, "tuIncomingCalls"));
  v16[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005AA40;
  v17[3] = &unk_1000AE380;
  v17[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005AACC;
  v16[3] = &unk_1000AE380;
  -[ANCAlertSource combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:](self, "combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:", v7, v4, -1, v17, v16);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuCallCenter](self, "tuCallCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioAndVideoCallsWithStatus:", 1));

  v10 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "# active calls: %lu", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuActiveCalls](self, "tuActiveCalls"));
  v14[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005AB74;
  v15[3] = &unk_1000AE380;
  v15[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005AC00;
  v14[3] = &unk_1000AE380;
  -[ANCAlertSource combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:](self, "combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:", v13, v9, -1, v15, v14);

}

- (void)callIdentificationChanged:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuIncomingCalls](self, "tuIncomingCalls"));
  v5 = objc_msgSend(v4, "containsObject:", v12);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuIncomingCallAlerts](self, "tuIncomingCallAlerts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuIncomingCalls](self, "tuIncomingCalls"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuIncomingCalls](self, "tuIncomingCalls"));
    v10 = objc_msgSend(v9, "indexOfObject:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource tuIncomingCalls](self, "tuIncomingCalls"));
    objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", v10, (char *)objc_msgSend(v11, "count") - 1);

    -[ANCAlertSource modifyAlert:](self, "modifyAlert:", v7);
  }

}

- (void)callHistoryChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ANCAlertSource queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AE10;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)callHistoryChanged:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  _QWORD v15[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatus:](CHRecentCall, "predicateForCallsWithStatus:", kCHCallStatusMissed));
  v15[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatusRead:](CHRecentCall, "predicateForCallsWithStatusRead:", 0));
  v15[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource chManager](self, "chManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callsWithPredicate:limit:offset:batchSize:", v8, 0, 0, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource chUnreadMissedCalls](self, "chUnreadMissedCalls"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005AFBC;
  v14[3] = &unk_1000AE3A8;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005B078;
  v12[3] = &unk_1000AE3D0;
  v12[4] = self;
  v13 = a3;
  -[ANCAlertSource combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:](self, "combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:", v11, v10, 5, v14, v12);

}

- (void)voicemailsChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ANCAlertSource queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B1C4;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)voicemailsChanged:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource vvManager](self, "vvManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voicemailsPassingTest:", &stru_1000AE410));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource vvUnreadVoicemails](self, "vvUnreadVoicemails"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005B308;
  v10[3] = &unk_1000AE438;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005B394;
  v8[3] = &unk_1000AE460;
  v8[4] = self;
  v9 = a3;
  -[ANCAlertSource combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:](self, "combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:", v7, v6, 5, v10, v8);

}

- (id)lazyContactStore
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlertSource contactStore](self, "contactStore"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)CNContactStore);
    -[ANCAlertSource setContactStore:](self, "setContactStore:", v4);

  }
  return -[ANCAlertSource contactStore](self, "contactStore");
}

- (void)combineCurrentArray:(id)a3 withNewArray:(id)a4 maxCount:(unint64_t)a5 objectRemoved:(id)a6 objectAdded:(id)a7
{
  id v11;
  void (**v12)(id, void *);
  void (**v13)(id, void *);
  id v14;
  void *v15;
  char *v16;
  void *v17;
  char *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void (**)(id, void *))a7;
  v14 = objc_msgSend(v23, "count");
  v15 = v23;
  if (v14)
  {
    v16 = 0;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v16));
      if (objc_msgSend(v11, "containsObject:", v17)
        && (unint64_t)objc_msgSend(v11, "indexOfObject:", v17) < a5)
      {
        ++v16;
      }
      else
      {
        v12[2](v12, v17);
        objc_msgSend(v23, "removeObjectAtIndex:", v16);
      }

      v18 = (char *)objc_msgSend(v23, "count");
      v15 = v23;
    }
    while (v16 != v18);
  }
  v19 = objc_msgSend(v11, "count");
  if ((unint64_t)v19 >= a5)
    v20 = a5;
  else
    v20 = (unint64_t)v19;
  if (v20)
  {
    v21 = v20 - 1;
    do
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v21));
      if ((objc_msgSend(v23, "containsObject:", v22) & 1) == 0)
      {
        objc_msgSend(v23, "addObject:", v22);
        v13[2](v13, v22);
      }

      --v21;
    }
    while (v21 != -1);
  }

}

- (unint64_t)genreIDForGenre:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Business")) & 1) != 0)
  {
    v4 = 6000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Weather")) & 1) != 0)
  {
    v4 = 6001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Utilities")) & 1) != 0)
  {
    v4 = 6002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Travel")) & 1) != 0)
  {
    v4 = 6003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sports")) & 1) != 0)
  {
    v4 = 6004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Social Networking")) & 1) != 0)
  {
    v4 = 6005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reference")) & 1) != 0)
  {
    v4 = 6006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Productivity")) & 1) != 0)
  {
    v4 = 6007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Photo & Video")) & 1) != 0)
  {
    v4 = 6008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("News")) & 1) != 0)
  {
    v4 = 6009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Navigation")) & 1) != 0)
  {
    v4 = 6010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
  {
    v4 = 6011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Lifestyle")) & 1) != 0)
  {
    v4 = 6012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Health & Fitness")) & 1) != 0)
  {
    v4 = 6013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Games")) & 1) != 0)
  {
    v4 = 6014;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Finance")) & 1) != 0)
  {
    v4 = 6015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Entertainment")) & 1) != 0)
  {
    v4 = 6016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Education")) & 1) != 0)
  {
    v4 = 6017;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Books")) & 1) != 0)
  {
    v4 = 6018;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Medical")) & 1) != 0)
  {
    v4 = 6020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Newsstand")) & 1) != 0)
  {
    v4 = 6021;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Catalogs")))
  {
    v4 = 6022;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)categoryIDForGenreID:(unint64_t)a3
{
  if (a3 - 6000 > 0x15)
    return 0;
  else
    return byte_100086678[a3 - 6000];
}

- (ANCAlertSourceDelegate)delegate
{
  return (ANCAlertSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSMutableDictionary)alerts
{
  return self->_alerts;
}

- (void)setAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_alerts, a3);
}

- (NSDictionary)firstPartyAppIdentifierToCategoryMap
{
  return self->_firstPartyAppIdentifierToCategoryMap;
}

- (void)setFirstPartyAppIdentifierToCategoryMap:(id)a3
{
  objc_storeStrong((id *)&self->_firstPartyAppIdentifierToCategoryMap, a3);
}

- (NSMutableDictionary)appIdentifierToCategoryCache
{
  return self->_appIdentifierToCategoryCache;
}

- (void)setAppIdentifierToCategoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifierToCategoryCache, a3);
}

- (NSMutableDictionary)bbBulletinAlerts
{
  return self->_bbBulletinAlerts;
}

- (void)setBbBulletinAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_bbBulletinAlerts, a3);
}

- (BBObserver)bbObserver
{
  return self->_bbObserver;
}

- (void)setBbObserver:(id)a3
{
  objc_storeStrong((id *)&self->_bbObserver, a3);
}

- (DNDEventBehaviorResolutionService)behaviorResolutionService
{
  return self->_behaviorResolutionService;
}

- (void)setBehaviorResolutionService:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorResolutionService, a3);
}

- (NSMutableArray)tuIncomingCalls
{
  return self->_tuIncomingCalls;
}

- (void)setTuIncomingCalls:(id)a3
{
  objc_storeStrong((id *)&self->_tuIncomingCalls, a3);
}

- (NSMapTable)tuIncomingCallAlerts
{
  return self->_tuIncomingCallAlerts;
}

- (void)setTuIncomingCallAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_tuIncomingCallAlerts, a3);
}

- (NSMutableArray)tuActiveCalls
{
  return self->_tuActiveCalls;
}

- (void)setTuActiveCalls:(id)a3
{
  objc_storeStrong((id *)&self->_tuActiveCalls, a3);
}

- (NSMapTable)tuActiveCallAlerts
{
  return self->_tuActiveCallAlerts;
}

- (void)setTuActiveCallAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_tuActiveCallAlerts, a3);
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (void)setTuCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_tuCallCenter, a3);
}

- (NSMutableArray)chUnreadMissedCalls
{
  return self->_chUnreadMissedCalls;
}

- (void)setChUnreadMissedCalls:(id)a3
{
  objc_storeStrong((id *)&self->_chUnreadMissedCalls, a3);
}

- (NSMutableDictionary)chMissedCallAlerts
{
  return self->_chMissedCallAlerts;
}

- (void)setChMissedCallAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_chMissedCallAlerts, a3);
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
  objc_storeStrong((id *)&self->_chManager, a3);
}

- (NSMutableArray)vvUnreadVoicemails
{
  return self->_vvUnreadVoicemails;
}

- (void)setVvUnreadVoicemails:(id)a3
{
  objc_storeStrong((id *)&self->_vvUnreadVoicemails, a3);
}

- (NSMapTable)vvVoicemailAlerts
{
  return self->_vvVoicemailAlerts;
}

- (void)setVvVoicemailAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_vvVoicemailAlerts, a3);
}

- (VMVoicemailManager)vvManager
{
  return self->_vvManager;
}

- (void)setVvManager:(id)a3
{
  objc_storeStrong((id *)&self->_vvManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vvManager, 0);
  objc_storeStrong((id *)&self->_vvVoicemailAlerts, 0);
  objc_storeStrong((id *)&self->_vvUnreadVoicemails, 0);
  objc_storeStrong((id *)&self->_chManager, 0);
  objc_storeStrong((id *)&self->_chMissedCallAlerts, 0);
  objc_storeStrong((id *)&self->_chUnreadMissedCalls, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
  objc_storeStrong((id *)&self->_tuActiveCallAlerts, 0);
  objc_storeStrong((id *)&self->_tuActiveCalls, 0);
  objc_storeStrong((id *)&self->_tuIncomingCallAlerts, 0);
  objc_storeStrong((id *)&self->_tuIncomingCalls, 0);
  objc_storeStrong((id *)&self->_behaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
  objc_storeStrong((id *)&self->_bbBulletinAlerts, 0);
  objc_storeStrong((id *)&self->_appIdentifierToCategoryCache, 0);
  objc_storeStrong((id *)&self->_firstPartyAppIdentifierToCategoryMap, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
