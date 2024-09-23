@implementation CKNCloudKitManager

- (CKNCloudKitManager)init
{
  CKNCloudKitManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSString *applicationIdentifier;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *serialQueue;
  uint64_t v26;
  CKContainer *container;
  NSObject *v28;
  CKNCloudKitManager *v29;
  void *v30;
  __CFNotificationCenter *DarwinNotifyCenter;
  void **v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  CKNCloudKitManager *v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const __CFString *v43;

  v39.receiver = self;
  v39.super_class = (Class)CKNCloudKitManager;
  v2 = -[CKNCloudKitManager init](&v39, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKnowledgeStore userDefaultsKnowledgeStore](CKKnowledgeStore, "userDefaultsKnowledgeStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("ServerChangeToken")));
    v5 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    if (v7)
    {
      v38 = 0;
      v8 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v7, &v38);
      v9 = v38;
      if (v9)
      {
        v10 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[CKNCloudKitManager init]";
          v42 = 2112;
          v43 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s error unarchiving server change token %@", buf, 0x16u);
        }
        v11 = 0;
      }
      else
      {
        v12 = objc_opt_self(CKServerChangeToken);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decodeObjectOfClass:forKey:", v13, NSKeyedArchiveRootObjectKey));

        objc_msgSend(v8, "finishDecoding");
        v14 = objc_opt_class(CKServerChangeToken);
        if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
          objc_storeStrong((id *)&v2->_serverChangeToken, v11);
      }

    }
    else
    {
      v11 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("HasSetUpRecordZoneSubscription")));
    v16 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      v17 = v15;
    else
      v17 = 0;
    v2->_hasSetUpRecordZoneSubscription = objc_msgSend(v17, "BOOLValue");
    -[CKAccountInfo setAccountStatus:](v2->_accountInfo, "setAccountStatus:", 0);
    -[CKAccountInfo setSupportsDeviceToDeviceEncryption:](v2->_accountInfo, "setSupportsDeviceToDeviceEncryption:", 0);
    -[CKAccountInfo setAccountPartition:](v2->_accountInfo, "setAccountPartition:", 1);
    v18 = objc_msgSend((id)objc_opt_class(v2), "getApplicationIdentifierFromEntitlements");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v2->_supportedRecordType, CFSTR("SiriKnowledgeKeyValueRecord"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v2->_cloudSyncEnabled = objc_msgSend(v21, "cloudSyncEnabled");

    v22 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v23 = CFSTR("enabled");
      if (!v2->_cloudSyncEnabled)
        v23 = CFSTR("disabled");
      *(_DWORD *)buf = 136315394;
      v41 = "-[CKNCloudKitManager init]";
      v42 = 2112;
      v43 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Cloud sync is %@", buf, 0x16u);
    }
    v24 = dispatch_queue_create("CKNCloudKitManager.Serial", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v24;

    v26 = objc_claimAutoreleasedReturnValue(-[CKNCloudKitManager _createCloudKitContainer](v2, "_createCloudKitContainer"));
    container = v2->_container;
    v2->_container = (CKContainer *)v26;

    v28 = v2->_serialQueue;
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_10000A294;
    v36 = &unk_100018AA8;
    v29 = v2;
    v37 = v29;
    dispatch_async(v28, &v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v33, v34, v35, v36));
    objc_msgSend(v30, "addObserver:selector:name:object:", v29, "_cloudKitAccountStatusChanged:", CKAccountChangedNotification, 0);
    objc_msgSend(v30, "addObserver:selector:name:object:", v29, "_cloudKitAccountStatusChanged:", CKIdentityUpdateNotification, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v29, (CFNotificationCallback)sub_10000A2D8, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CKAccountChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CKIdentityUpdateNotification, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)CKNCloudKitManager;
  -[CKNCloudKitManager dealloc](&v5, "dealloc");
}

- (void)enablePushNotifications
{
  OS_dispatch_queue *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A28C;
  block[3] = &unk_100018AA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)disablePushNotifications
{
  OS_dispatch_queue *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A284;
  block[3] = &unk_100018AA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_enablePush
{
  NSString *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = self->_applicationIdentifier;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v3));

  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = sub_10000A178(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "_setEnabledTopics:", v5);

}

- (void)_disablePush
{
  _QWORD *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = sub_10000A178(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "_setEnabledTopics:", 0);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[CKNCloudKitManager connection:didReceivePublicToken:]";
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received public token (%@) on connection %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = 136316162;
    v15 = "-[CKNCloudKitManager connection:didReceiveToken:forTopic:identifier:]";
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Received per-topic push token (%@) for topic (%@) identifier (%@) on connection (%@)", (uint8_t *)&v14, 0x34u);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *applicationIdentifier;
  void *v14;
  unsigned int v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topic"));
    v17 = 136315650;
    v18 = "-[CKNCloudKitManager connection:didReceiveIncomingMessage:]";
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s APS message received for topic (%@) on connection (%@)", (uint8_t *)&v17, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topic"));
  if (self)
    applicationIdentifier = self->_applicationIdentifier;
  else
    applicationIdentifier = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", applicationIdentifier));
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKNotification notificationFromRemoteNotificationDictionary:](CKNotification, "notificationFromRemoteNotificationDictionary:", v8));
    -[CKNCloudKitManager _handleCloudKitNotification:](self, "_handleCloudKitNotification:", v16);

  }
}

- (void)_handleCloudKitNotification:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    v5 = objc_opt_class(CKRecordZoneNotification);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v14 = 136315394;
        v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
        v16 = 2112;
        v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received record zone notification: (%@)", (uint8_t *)&v14, 0x16u);
      }
      if (objc_msgSend(v6, "databaseScope") == (id)2)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordZoneID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
        if (v9)
        {
          v10 = v9;
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siri.knowledge")))
          {
            -[CKNCloudKitManager _fetchChanges](self, "_fetchChanges");
          }
          else
          {
            v13 = CKLogContextDaemon;
            if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              v14 = 136315394;
              v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
              v16 = 2112;
              v17 = v8;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Unrecognized record zone notification zone name: (%@)", (uint8_t *)&v14, 0x16u);
            }
          }

        }
        else
        {
          v12 = CKLogContextDaemon;
          if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            v14 = 136315138;
            v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Record zone notification contains no zone name", (uint8_t *)&v14, 0xCu);
          }
        }

      }
    }
  }
  else
  {
    v11 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Ignoring notification", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  NSObject *v4;
  OS_dispatch_queue *serialQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;

  v4 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CKNCloudKitManager _cloudKitAccountStatusChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A170;
  block[3] = &unk_100018AA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_cloudSyncPreferenceDidChange
{
  NSObject *v3;
  OS_dispatch_queue *serialQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;

  v3 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CKNCloudKitManager _cloudSyncPreferenceDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CloudKit preferences changed", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A040;
  block[3] = &unk_100018AA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_setupAccount
{
  CKContainer *container;
  CKContainer *v4;
  CKContainer *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  container = self->_container;
  if (!container)
  {
    v4 = (CKContainer *)objc_claimAutoreleasedReturnValue(-[CKNCloudKitManager _createCloudKitContainer](self, "_createCloudKitContainer"));
    v5 = self->_container;
    self->_container = v4;

    container = self->_container;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009DCC;
  v6[3] = &unk_1000186D0;
  v6[4] = self;
  -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v6);
}

- (void)_handleAccountStatusChange:(id)a3
{
  id v5;
  unsigned int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v6 = -[CKAccountInfo isEqual:](self->_accountInfo, "isEqual:", v5);
  v7 = CKLogContextDaemon;
  v8 = os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v14 = 136315138;
      v15 = "-[CKNCloudKitManager _handleAccountStatusChange:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s CloudKit account status is unchanged", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v9 = v7;
      v10 = CKStringFromAccountStatus(objc_msgSend(v5, "accountStatus"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
      v13 = CFSTR("Disabled");
      v15 = "-[CKNCloudKitManager _handleAccountStatusChange:]";
      v14 = 136315650;
      v16 = 2112;
      v17 = v11;
      if (v12)
        v13 = CFSTR("Enabled");
      v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s CloudKit account status: (%@) encryption is: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_storeStrong((id *)&self->_accountInfo, a3);
    -[CKNCloudKitManager _setupAccountState](self, "_setupAccountState");
  }

}

- (void)_setupAccountState
{
  if (-[CKAccountInfo supportsDeviceToDeviceEncryption](self->_accountInfo, "supportsDeviceToDeviceEncryption")&& -[CKAccountInfo accountStatus](self->_accountInfo, "accountStatus") == (id)1)
  {
    -[CKNCloudKitManager _cleanUpRecordZoneSubscriptionsTimers](self, "_cleanUpRecordZoneSubscriptionsTimers");
    if (self->_cloudSyncEnabled)
      -[CKNCloudKitManager _setupRecordZone](self, "_setupRecordZone");
  }
  else
  {
    -[CKNCloudKitManager _cleanUpRecordZonesAndSubscriptions](self, "_cleanUpRecordZonesAndSubscriptions");
  }
}

- (BOOL)_shouldSync
{
  unsigned int v2;

  if (self->_cloudSyncEnabled)
  {
    v2 = -[CKAccountInfo supportsDeviceToDeviceEncryption](self->_accountInfo, "supportsDeviceToDeviceEncryption");
    if (v2)
      LOBYTE(v2) = AFIsHorseman() ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (id)_underlyingErrorForError:(id)a3 zoneID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "code") == (id)2)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CKPartialErrorsByItemIDKey));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", NSUnderlyingErrorKey));

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSUnderlyingErrorKey));

    if (!v11)
      v11 = v5;
  }

  return v11;
}

- (void)_fetchChangesFrom:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CKRecordZone *recordZone;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  CKNCloudKitManager *v36;
  id v37;
  id v38;
  _BYTE *v39;
  BOOL v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  void *v51;
  id v52;
  void *v53;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));

      if (v9)
      {
        v10 = (void *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          recordZone = self->_recordZone;
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](recordZone, "zoneID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
          v15 = CKDatabaseScopeString(objc_msgSend(v8, "databaseScope"));
          v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[CKNCloudKitManager _fetchChangesFrom:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          v48 = v16;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Fetching changes in record zone (%@) in database (%@)", buf, 0x20u);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
        v53 = v17;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v20 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
        objc_msgSend(v20, "setPreviousServerChangeToken:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
        v51 = v21;
        v52 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v48 = sub_1000097A4;
        v49 = sub_1000097B4;
        v50 = 0;
        v22 = objc_msgSend(objc_alloc((Class)CKFetchRecordZoneChangesOperation), "initWithRecordZoneIDs:configurationsByRecordZoneID:", v32, v31);
        objc_msgSend(v22, "setFetchAllChanges:", 1);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1000097BC;
        v45[3] = &unk_1000186F8;
        v23 = v18;
        v46 = v23;
        objc_msgSend(v22, "setRecordChangedBlock:", v45);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1000097C8;
        v43[3] = &unk_100018720;
        v24 = v19;
        v44 = v24;
        objc_msgSend(v22, "setRecordWithIDWasDeletedBlock:", v43);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1000097D4;
        v42[3] = &unk_100018748;
        v42[4] = buf;
        objc_msgSend(v22, "setRecordZoneChangeTokensUpdatedBlock:", v42);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1000097E8;
        v41[3] = &unk_100018770;
        v41[4] = buf;
        objc_msgSend(v22, "setRecordZoneFetchCompletionBlock:", v41);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100009A90;
        v33[3] = &unk_1000187E8;
        v25 = v8;
        v34 = v25;
        v26 = v23;
        v35 = v26;
        v36 = self;
        v38 = v7;
        v27 = v24;
        v40 = v6 == 0;
        v37 = v27;
        v39 = buf;
        objc_msgSend(v22, "setFetchRecordZoneChangesCompletionBlock:", v33);
        objc_msgSend(v22, "setQualityOfService:", 17);
        objc_msgSend(v25, "addOperation:", v22);

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }
      if (v7)
      {
        v29 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 26, 0));
        goto LABEL_12;
      }
    }
    else if (v7)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 24, 0));
LABEL_12:
      v30 = (void *)v29;
      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, v29, 0, 0, 0, 0);

    }
LABEL_13:

    goto LABEL_14;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 6, 0));
  (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, v28, 0, 0, 0, 0);

LABEL_14:
}

- (void)_fetchChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[CKNCloudKitManager _fetchChangesWithRetryCount:](self, "_fetchChangesWithRetryCount:", 0);
}

- (void)_fetchChangesWithRetryCount:(unint64_t)a3
{
  NSObject *v5;
  CKServerChangeToken *serverChangeToken;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a3 < 2)
  {
    serverChangeToken = self->_serverChangeToken;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009178;
    v7[3] = &unk_100018860;
    v7[4] = self;
    v7[5] = a3;
    -[CKNCloudKitManager _fetchChangesFrom:completion:](self, "_fetchChangesFrom:completion:", serverChangeToken, v7);
  }
  else
  {
    v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CKNCloudKitManager _fetchChangesWithRetryCount:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Exceeded fetch retry attempts for zone", buf, 0xCu);
    }
  }
}

- (void)fetchChangesWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008F24;
  v7[3] = &unk_1000188B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);

}

- (void)fetchAllChangesWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008DA4;
  v7[3] = &unk_1000188B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);

}

- (id)_createCloudKitContainer
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.siri.knowledge")));
  v3 = (void *)objc_opt_new(CKContainerOptions);
  objc_msgSend(v3, "setUseZoneWidePCS:", 1);
  v4 = objc_alloc((Class)CKContainer);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerID"));
  v6 = objc_msgSend(v4, "initWithContainerID:options:", v5, v3);

  return v6;
}

- (void)_initializeZone
{
  CKRecordZone *v3;
  CKRecordZone *recordZone;
  CKRecordZone **p_recordZone;
  CKRecordZoneSubscription *v6;
  id v7;
  void *v8;
  CKRecordZoneSubscription *v9;
  CKRecordZoneSubscription *subscription;
  id v11;

  v11 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("com.apple.siri.knowledge"), CKCurrentUserDefaultName);
  if (v11)
  {
    v3 = (CKRecordZone *)objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", v11);
    p_recordZone = &self->_recordZone;
    recordZone = self->_recordZone;
    self->_recordZone = v3;
  }
  else
  {
    p_recordZone = &self->_recordZone;
    recordZone = self->_recordZone;
    self->_recordZone = 0;
  }

  if (*p_recordZone)
  {
    v6 = (CKRecordZoneSubscription *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.siri.knowledge.subscription"), self->_supportedRecordType));
    v7 = objc_alloc((Class)CKRecordZoneSubscription);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
    v9 = (CKRecordZoneSubscription *)objc_msgSend(v7, "initWithZoneID:subscriptionID:", v8, v6);

    -[CKRecordZoneSubscription setRecordType:](v9, "setRecordType:", self->_supportedRecordType);
    subscription = self->_subscription;
    self->_subscription = v9;

  }
  else
  {
    v6 = self->_subscription;
    self->_subscription = 0;
  }

}

- (void)_resetZone
{
  CKRecordZone *recordZone;
  CKRecordZoneSubscription *subscription;

  recordZone = self->_recordZone;
  self->_recordZone = 0;

  subscription = self->_subscription;
  self->_subscription = 0;

  sub_1000074AC((uint64_t)self, 0);
  sub_1000089CC((uint64_t)self, 0);
  -[CKNCloudKitManager _setupRecordZone](self, "_setupRecordZone");
}

- (void)_setupRecordZone
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    if (self->_recordZone)
    {
      if (self->_subscription && self->_hasSetUpRecordZoneSubscription)
        -[CKNCloudKitManager _fetchChanges](self, "_fetchChanges");
      else
        -[CKNCloudKitManager _setupRecordZoneSubscription](self, "_setupRecordZoneSubscription");
    }
    else
    {
      -[CKNCloudKitManager _setupRecordZoneWithRetryInterval:](self, "_setupRecordZoneWithRetryInterval:", 120.0);
    }
  }
}

- (void)_setupRecordZoneWithRetryInterval:(double)a3
{
  id v5;
  _QWORD v6[5];
  id v7;
  double v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000085C8;
  v6[3] = &unk_1000189A0;
  v6[4] = self;
  v7 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("com.apple.siri.knowledge"), CKCurrentUserDefaultName);
  v8 = a3;
  v5 = v7;
  -[CKNCloudKitManager _createRecordZoneWithID:completion:](self, "_createRecordZoneWithID:completion:", v5, v6);

}

- (void)_cancelRecordZoneSetupTimer
{
  NSObject *v3;
  OS_dispatch_source **p_recordZoneSetupTimer;
  OS_dispatch_source *recordZoneSetupTimer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  recordZoneSetupTimer = self->_recordZoneSetupTimer;
  p_recordZoneSetupTimer = &self->_recordZoneSetupTimer;
  v3 = recordZoneSetupTimer;
  if (recordZoneSetupTimer)
  {
    dispatch_source_cancel(v3);
    objc_storeStrong((id *)p_recordZoneSetupTimer, 0);
  }
}

- (void)_createRecordZoneWithID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSString *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, id, _QWORD);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v8 = -[CKNCloudKitManager _shouldSync](self, "_shouldSync");
  v9 = (void *)CKLogContextDaemon;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
      *(_DWORD *)buf = 136315394;
      v26 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]";
      v27 = 2112;
      v28 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s iCloud sync is disabled. Unable to create zone: (%@)", buf, 0x16u);

      if (!v7)
        goto LABEL_13;
    }
    else if (!v7)
    {
      goto LABEL_13;
    }
    v17 = CKErrorDomain;
    v18 = 6;
LABEL_11:
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, v18, 0));
    v7[2](v7, v12, 0);
    goto LABEL_12;
  }
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
    *(_DWORD *)buf = 136315394;
    v26 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]";
    v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Creating zone: (%@)", buf, 0x16u);

  }
  if (self->_container)
  {
    v12 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", v6);
    objc_msgSend(v12, "setCapabilities:", 3);
    v13 = objc_alloc((Class)CKModifyRecordZonesOperation);
    v24 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v15 = objc_msgSend(v13, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v14, 0);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100008474;
    v21[3] = &unk_1000189C8;
    v22 = v6;
    v23 = v7;
    objc_msgSend(v15, "setModifyRecordZonesCompletionBlock:", v21);
    objc_msgSend(v15, "setQualityOfService:", 17);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    objc_msgSend(v16, "addOperation:", v15);

LABEL_12:
    goto LABEL_13;
  }
  if (v7)
  {
    v17 = CKErrorDomain;
    v18 = 5;
    goto LABEL_11;
  }
LABEL_13:

}

- (void)_deleteRecordZoneWithID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
    *(_DWORD *)buf = 136315394;
    v22 = "-[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]";
    v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Deleting zone: (%@)", buf, 0x16u);

  }
  if (self->_container)
  {
    v13 = objc_alloc((Class)CKModifyRecordZonesOperation);
    v20 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v15 = objc_msgSend(v13, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v14);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000833C;
    v17[3] = &unk_1000189C8;
    v18 = v8;
    v19 = v9;
    objc_msgSend(v15, "setModifyRecordZonesCompletionBlock:", v17);
    objc_msgSend(v15, "setQualityOfService:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    objc_msgSend(v16, "addOperation:", v15);

LABEL_7:
    goto LABEL_8;
  }
  if (v9)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 5, 0));
    (*((void (**)(id, id))v9 + 2))(v9, v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_cleanUpRecordZoneSubscriptionsTimers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[CKNCloudKitManager _cancelRecordZoneSetupTimer](self, "_cancelRecordZoneSetupTimer");
  -[CKNCloudKitManager _cancelSubscriptionSetupTimer](self, "_cancelSubscriptionSetupTimer");
}

- (void)_cleanUpRecordZonesAndSubscriptions
{
  CKRecordZone *recordZone;
  CKRecordZoneSubscription *subscription;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[CKNCloudKitManager _cleanUpRecordZoneSubscriptionsTimers](self, "_cleanUpRecordZoneSubscriptionsTimers");
  recordZone = self->_recordZone;
  self->_recordZone = 0;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (id)_createRecordsWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (objc_msgSend(v4, "count")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID")),
        v5,
        v5))
  {
    v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v23 = *(_QWORD *)v26;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v9);
          v11 = objc_alloc((Class)CKRecordID);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
          v13 = objc_msgSend(v11, "initWithRecordName:zoneID:", v10, v12);

          v14 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", self->_supportedRecordType, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v10));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {

            v15 = 0;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "encryptedValuesByKey"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
          objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("version"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "encryptedValuesByKey"));
          objc_msgSend(v20, "setObject:forKey:", v10, CFSTR("key"));

          objc_msgSend(v14, "setData:", v15);
          objc_msgSend(v24, "addObject:", v14);

          v9 = (char *)v9 + 1;
        }
        while (v8 != v9);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    v4 = v22;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_createDictionaryFromRecords:(id)a3
{
  void *v3;
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableDictionary);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
          v13 = v12;
          if (!v12)
          {
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v13 = v3;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordName"));
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v15);

          if (!v12)
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v4 = v17;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_createRecordsIDsForKeys:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));

    if (v5)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v16 = v4;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
            v12 = objc_alloc((Class)CKRecordID);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
            v14 = objc_msgSend(v12, "initWithRecordName:zoneID:", v11, v13);

            objc_msgSend(v5, "addObject:", v14);
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

      v4 = v16;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_createKeysForRecordsIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "recordName", (_QWORD)v12));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_saveRecords:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  CKNCloudKitManager *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
    {
      v13 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v10, v11);
      objc_msgSend(v13, "setAtomic:", 1);
      objc_msgSend(v13, "setSavePolicy:", a5);
      v20 = _NSConcreteStackBlock;
      v21 = 3221225472;
      v22 = sub_100007E5C;
      v23 = &unk_1000189C8;
      v24 = self;
      v25 = v12;
      objc_msgSend(v13, "setModifyRecordsCompletionBlock:", &v20);
      objc_msgSend(v13, "setQualityOfService:", 17, v20, v21, v22, v23, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
      objc_msgSend(v14, "addOperation:", v13);

    }
    else if (v12)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 0, 0, 0);
    }
  }
  else
  {
    v15 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v17 = AFIsHorseman();
      v18 = "NO";
      if (v17)
        v18 = "YES";
      *(_DWORD *)buf = 136315394;
      v27 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]";
      v28 = 2080;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to modify records. On HomePod: %s", buf, 0x16u);

    }
    if (v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 6, 0));
      (*((void (**)(id, void *, _QWORD, _QWORD))v12 + 2))(v12, v19, 0, 0);

    }
  }

}

- (void)saveRecords:(id)a3 deleteRecordIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007E48;
  v15[3] = &unk_100018B58;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);

}

- (void)saveRecordsWithDictionary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007CB0;
  block[3] = &unk_100018B30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);

}

- (void)removeValuesForKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007B18;
  block[3] = &unk_100018B30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);

}

- (void)_setupRecordZoneSubscription
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:](self, "_setupRecordZoneSubscriptionWithRetryInterval:", 120.0);
}

- (void)_setupRecordZoneSubscriptionWithRetryInterval:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  double v20;
  id v21;
  uint8_t buf[4];
  const char *v23;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.siri.knowledge.subscription"), self->_supportedRecordType));
      v7 = objc_alloc((Class)CKRecordZoneSubscription);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
      v9 = objc_msgSend(v7, "initWithZoneID:subscriptionID:", v8, v6);

      objc_msgSend(v9, "setRecordType:", self->_supportedRecordType);
      v10 = objc_alloc_init((Class)CKNotificationInfo);
      objc_msgSend(v10, "setShouldSendContentAvailable:", 1);
      objc_msgSend(v9, "setNotificationInfo:", v10);
      v11 = objc_alloc((Class)CKModifySubscriptionsOperation);
      v21 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v13 = objc_msgSend(v11, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v12, 0);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000755C;
      v18[3] = &unk_100018A18;
      v18[4] = self;
      v19 = v9;
      v20 = a3;
      v14 = v9;
      objc_msgSend(v13, "setModifySubscriptionsCompletionBlock:", v18);
      objc_msgSend(v13, "setQualityOfService:", 17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
      objc_msgSend(v15, "addOperation:", v13);

      return;
    }
    v17 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unable to create zone subscription without a record zone", buf, 0xCu);
    }
  }
  else
  {
    v16 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Unable to create zone subscription", buf, 0xCu);
    }
  }
  -[CKNCloudKitManager _cancelSubscriptionSetupTimer](self, "_cancelSubscriptionSetupTimer");
}

- (void)_cancelSubscriptionSetupTimer
{
  OS_dispatch_source *subscriptionSetupTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  subscriptionSetupTimer = self->_subscriptionSetupTimer;
  if (subscriptionSetupTimer)
  {
    dispatch_source_cancel((dispatch_source_t)subscriptionSetupTimer);
    v4 = self->_subscriptionSetupTimer;
    self->_subscriptionSetupTimer = 0;

  }
}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007550;
  v7[3] = &unk_1000188B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);

}

- (void)_disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_cloudSyncEnabled)
  {
    self->_cloudSyncEnabled = 0;
    -[CKNCloudKitManager _cleanUpRecordZonesAndSubscriptions](self, "_cleanUpRecordZonesAndSubscriptions");
  }
  sub_1000074AC((uint64_t)self, 0);
  v5 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("com.apple.siri.knowledge"), CKCurrentUserDefaultName);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000753C;
  v7[3] = &unk_100018A40;
  v8 = v4;
  v6 = v4;
  -[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:](self, "_deleteRecordZoneWithID:qualityOfService:completion:", v5, 33, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_subscriptionSetupTimer, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_recordZoneSetupTimer, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_accountInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_supportedRecordType, 0);
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A478;
  block[3] = &unk_100018680;
  block[4] = a1;
  if (qword_10001DEB0 != -1)
    dispatch_once(&qword_10001DEB0, block);
  return (id)qword_10001DEB8;
}

+ (id)getApplicationIdentifierFromEntitlements
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  v2 = (void *)xpc_copy_entitlement_for_self(objc_msgSend(CFSTR("application-identifier"), "UTF8String"));
  v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_string)
  {
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
