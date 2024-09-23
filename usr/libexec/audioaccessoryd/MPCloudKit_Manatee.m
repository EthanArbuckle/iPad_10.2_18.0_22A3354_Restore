@implementation MPCloudKit_Manatee

+ (id)sharedInstance
{
  if (qword_100212620 != -1)
    dispatch_once(&qword_100212620, &stru_1001E4EF0);
  return (id)qword_100212618;
}

- (MPCloudKit_Manatee)init
{
  return -[MPCloudKit_Manatee initWithRecordZoneName](self, "initWithRecordZoneName");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPCloudKit_Manatee;
  -[MPCloudKit_Manatee dealloc](&v4, "dealloc");
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudContainerIdentifier](self, "cloudContainerIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MPCloudKit_Manatee: Container - %@"), v2));

  return (NSString *)v3;
}

- (MPCloudKit_Manatee)initWithRecordZoneName
{
  MPCloudKit_Manatee *v2;
  MPCloudKit_Manatee *v3;
  NSTimer *countdownTimer;
  NSTimer *v5;
  NSOperationQueue *v6;
  NSOperationQueue *modifyOperationQueue;
  unsigned int v8;
  os_log_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id buf[2];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MPCloudKit_Manatee;
  v2 = -[MPCloudKit_Manatee init](&v18, "init");
  v3 = v2;
  if (!v2)
    return v3;
  countdownTimer = v2->_countdownTimer;
  if (countdownTimer)
  {
    -[NSTimer invalidate](countdownTimer, "invalidate");
    v5 = v3->_countdownTimer;
    v3->_countdownTimer = 0;

  }
  v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  modifyOperationQueue = v3->_modifyOperationQueue;
  v3->_modifyOperationQueue = v6;

  -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_modifyOperationQueue, "setMaxConcurrentOperationCount:", 1);
  v8 = +[BTSystemConfiguration isBuddyComplete](BTSystemConfiguration, "isBuddyComplete");
  v9 = sub_1000681B8("MagicPairing");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v11)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee BYSetupAssistantNeedsToRun : true ", (uint8_t *)buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v12, "beginTransaction:", CFSTR("com.apple.bluetooth.user.services.mpcloudkitmanatee.buddysetup"));

    v3->_reinitAfterBuddy = 1;
    objc_initWeak(buf, v3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008228C;
    v15[3] = &unk_1001E3F50;
    objc_copyWeak(&v16, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BTStateWatcher monitorBuddyStateWithAction:](BTStateWatcher, "monitorBuddyStateWithAction:", v15));
    -[MPCloudKit_Manatee setBuddyStateWatcher:](v3, "setBuddyStateWatcher:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
    goto LABEL_12;
  }
  if (v11)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee BYSetupAssistantNeedsToRun : false ", (uint8_t *)buf, 2u);
  }

  v3->_reinitAfterBuddy = 0;
  if (!-[MPCloudKit_Manatee initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot"))
LABEL_12:
    -[MPCloudKit_Manatee initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot");
  return v3;
}

- (BOOL)initializedCKAfterFirstUnlockedSinceBoot
{
  int v3;
  os_log_t v4;
  NSObject *v5;
  const __CFString *v6;
  os_log_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v12;

  v3 = MKBDeviceUnlockedSinceBoot(self, a2);
  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("YES");
    if (!v3)
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: Unlocked since boot = %{public}@", buf, 0xCu);
  }

  if (v3 == 1)
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: device is already unlocked after boot ", buf, 2u);
    }

    -[MPCloudKit_Manatee initializeCloudKit](self, "initializeCloudKit");
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000824E8;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    if (qword_100212628 != -1)
      dispatch_once(&qword_100212628, block);
  }
  return v3 == 1;
}

- (void)getAccountStatus
{
  -[MPCloudKit_Manatee accountStatusDidChange:](self, "accountStatusDidChange:", 0);
}

- (void)forceAccountStatus
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: Forcing account update to bluetoothd", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
  objc_msgSend(v5, "accountStatusWithCompletionHandler:", &stru_1001E4F10);

}

- (void)buddySetupDone
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: buddySetupDone : reset timer now ", buf, 2u);
  }

  if (self->_reinitAfterBuddy)
  {
    -[MPCloudKit_Manatee initializeCloudKit](self, "initializeCloudKit");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "accountStatusDidChange:", CKAccountChangedNotification, 0);

    v6 = sub_1000681B8("MagicPairing");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: buddySetupDone : re-intt cloud kit not needed", v9, 2u);
    }

  }
  self->_reinitAfterBuddy = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v8, "endTransaction:", CFSTR("com.apple.bluetooth.user.services.mpcloudkitmanatee.buddysetup"));

}

- (void)initializeCloudKit
{
  os_log_t v3;
  NSObject *v4;
  CKContainer *v5;
  CKContainer *cloudKitContainer;
  CKDatabase *v7;
  CKDatabase *cloudKitDatabase;
  CKRecordZone *v9;
  CKRecordZone *recordZoneBlob;
  CKRecordZone *v11;
  CKRecordZone *recordZoneAccessoryDatabase;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: initializeCloudKit : start ", v16, 2u);
  }

  v5 = (CKContainer *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.securedBluetooth")));
  cloudKitContainer = self->_cloudKitContainer;
  self->_cloudKitContainer = v5;

  v7 = (CKDatabase *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_cloudKitContainer, "privateCloudDatabase"));
  cloudKitDatabase = self->_cloudKitDatabase;
  self->_cloudKitDatabase = v7;

  v9 = (CKRecordZone *)objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", CFSTR("MagicCloudPairingCustomKeyBlobZone"));
  recordZoneBlob = self->_recordZoneBlob;
  self->_recordZoneBlob = v9;

  v11 = (CKRecordZone *)objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", CFSTR("MagicCloudPairingCustomAccessoryZone"));
  recordZoneAccessoryDatabase = self->_recordZoneAccessoryDatabase;
  self->_recordZoneAccessoryDatabase = v11;

  self->_isWriteMasterKeysInProgress = 0;
  -[MPCloudKit_Manatee pushEnable](self, "pushEnable");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "accountStatusDidChange:", CKAccountChangedNotification, 0);

  -[MPCloudKit_Manatee accountStatusDidChange:](self, "accountStatusDidChange:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    objc_msgSend(v15, "invalidate");

    -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", 0);
  }
}

- (void)fetchAccountStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  CKContainer *cloudKitContainer;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));

  if (v5)
  {
    cloudKitContainer = self->_cloudKitContainer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100082BB4;
    v10[3] = &unk_1001E4548;
    v11 = v4;
    -[CKContainer accountInfoWithCompletionHandler:](cloudKitContainer, "accountInfoWithCompletionHandler:", v10);
    v7 = v11;
LABEL_7:

    goto LABEL_8;
  }
  v8 = sub_1000681B8("MagicPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee fetchAccountStatusWithCompletion cloudKitContainer is nil", buf, 2u);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CloudKit Account Not Active"), 0, 0));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)manateeZoneAvailable
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  os_log_t v11;
  __int16 v12;
  __int16 v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "networkMonitor"));
  v5 = objc_msgSend(v4, "isNetworkUp");

  if ((v5 & 1) == 0)
  {
    v11 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    v13 = 0;
    v9 = "Manatee Upgrade Check: Network is not up";
    v10 = (uint8_t *)&v13;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

  if (v6)
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return;
    }
    v12 = 0;
    v9 = "Manatee Upgrade Check: Master zone has been already upgraded successfully";
    v10 = (uint8_t *)&v12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    goto LABEL_6;
  }
  -[CKContainer accountInfoWithCompletionHandler:](self->_cloudKitContainer, "accountInfoWithCompletionHandler:", &stru_1001E4F50);
}

- (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v7;
  id v8;
  os_log_t v9;
  NSObject *v10;
  os_log_t v11;
  NSObject *v12;
  int v13;
  __CFString *v14;

  v5 = a5;
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = sub_1000681B8("MagicPairing");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] prefName %@\n", (uint8_t *)&v13, 0xCu);
  }

  CFPreferencesSetValue(v7, v8, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && !CFPreferencesSynchronize(CFSTR("com.apple.cloudpaird"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v11 = sub_1000681B8("MagicPairing");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", (uint8_t *)&v13, 2u);
    }

  }
}

- (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  _BOOL4 v4;
  os_log_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a4;
  CFPreferencesSetValue((CFStringRef)a3, 0, CFSTR("com.apple.cloudpaird"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4 && !CFPreferencesSynchronize(CFSTR("com.apple.cloudpaird"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v5 = sub_1000681B8("MagicPairing");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", v7, 2u);
    }

  }
}

- (void)accountStatusDidChange:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id buf[2];

  v4 = a3;
  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee accountStatusDidChange calling accountStatusWithCompletionHandler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000831D8;
  v8[3] = &unk_1001E4F98;
  objc_copyWeak(&v9, buf);
  v8[4] = self;
  objc_msgSend(v7, "accountStatusWithCompletionHandler:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);

}

- (void)setupSubscriptions
{
  -[MPCloudKit_Manatee createSubscritionForRecordType:](self, "createSubscritionForRecordType:", CFSTR("EncryptedMasterKeyBlob"));
  -[MPCloudKit_Manatee createSubscritionForRecordType:](self, "createSubscritionForRecordType:", CFSTR("EncryptedAccessoryBlob"));
}

- (void)resetPushTimer
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: resetPushTimer called %@", (uint8_t *)&v9, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    objc_msgSend(v7, "invalidate");

    -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_pushTimerFired:", 0, 0, 5.0));
  -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", v8);

}

- (void)_pushTimerFired:(id)a3
{
  os_log_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: Push Fetch", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    objc_msgSend(v7, "invalidate");

    -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000838D8;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)fetchKeyBlob:(unint64_t)a3
{
  CKContainer *cloudKitContainer;
  _QWORD v4[6];

  cloudKitContainer = self->_cloudKitContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008396C;
  v4[3] = &unk_1001E4FC0;
  v4[4] = self;
  v4[5] = a3;
  -[CKContainer accountInfoWithCompletionHandler:](cloudKitContainer, "accountInfoWithCompletionHandler:", v4);
}

- (void)_fetchKeyBlob:(unint64_t)a3
{
  os_log_t v5;
  NSObject *v6;
  os_log_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  os_log_t v12;
  void *v13;
  _BOOL4 v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  os_log_t v26;
  os_log_t v27;
  os_log_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35[2];
  uint8_t buf[4];
  unint64_t v37;

  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: fetchKeyBlob: retry count -  %lu", buf, 0xCu);
  }

  if (a3 >= 5)
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v37 = a3;
      v9 = "Manatee: Exhausted all retries...: %lu";
      v10 = v8;
      v11 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (-[MPCloudKit_Manatee isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress"))
  {
    v12 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v9 = "Manatee: already writing new key";
LABEL_9:
    v10 = v8;
    v11 = 2;
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee masterBlob](self, "masterBlob"));
  v14 = objc_msgSend(v13, "length") == (id)33;

  if (v14)
  {
    v15 = sub_1000681B8("MagicPairing");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee masterBlob](self, "masterBlob"));
      *(_DWORD *)buf = 138412290;
      v37 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Manatee: fetchKeyBlob: already have master blob read  %@", buf, 0xCu);

    }
    v8 = objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee masterBlob](self, "masterBlob"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v18, CFSTR("kMasterKeyBlob"), 0));
    -[NSObject sendCloudKitMsg:args:](v8, "sendCloudKitMsg:args:", CFSTR("MasterKeysAvailable"), v19);

    goto LABEL_15;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  v21 = v20 == 0;

  if (v21)
  {
    v27 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v9 = "Manatee recordZoneBlob is nil";
    goto LABEL_9;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "deviceManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cloudAccountInfo"));
  v25 = objc_msgSend(v24, "manateeAvailable");

  if ((v25 & 1) == 0)
  {
    v28 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10016E86C();
    goto LABEL_15;
  }
  if (!-[MPCloudKit_Manatee isFetchMasterKeyInProgress](self, "isFetchMasterKeyInProgress"))
  {
    -[MPCloudKit_Manatee setIsFetchMasterKeyInProgress:](self, "setIsFetchMasterKeyInProgress:", 1);
    v29 = objc_alloc((Class)CKRecordID);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneID"));
    v8 = objc_msgSend(v29, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v32, "beginTransaction:", CFSTR("ManateefetchKeyBlob"));

    objc_initWeak((id *)buf, self);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100083F74;
    v34[3] = &unk_1001E5008;
    v34[4] = self;
    v35[1] = (id)a3;
    objc_copyWeak(v35, (id *)buf);
    objc_msgSend(v33, "fetchRecordWithID:completionHandler:", v8, v34);

    objc_destroyWeak(v35);
    objc_destroyWeak((id *)buf);
    goto LABEL_15;
  }
  v26 = sub_1000681B8("MagicPairing");
  v8 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v9 = "Manatee fetchKeyBlob already fetching defer";
    goto LABEL_9;
  }
LABEL_15:

}

- (void)checkAccountStatusWithCompletionHandler:(id)a3
{
  -[MPCloudKit_Manatee checkAccountStatusWithCompletionHandler:withRetryCount:](self, "checkAccountStatusWithCompletionHandler:withRetryCount:", a3, 0);
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  unint64_t v16;

  v6 = a3;
  v7 = sub_1000681B8("MagicPairing");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4 <= 4)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: checkAccountStatus: %lu", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v10, "beginTransaction:", CFSTR("ManateeCheckAccountStatusWithCompletionHandler"));

    objc_initWeak((id *)buf, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100084CA0;
    v12[3] = &unk_1001E5030;
    objc_copyWeak(v14, (id *)buf);
    v13 = v6;
    v14[1] = (id)a4;
    objc_msgSend(v11, "accountStatusWithCompletionHandler:", v12);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: Exhausted all retries for: %lu", buf, 0xCu);
    }

  }
}

- (void)fetchAccessoryKeyBlob:(unint64_t)a3
{
  CKContainer *cloudKitContainer;
  _QWORD v4[6];

  cloudKitContainer = self->_cloudKitContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084F14;
  v4[3] = &unk_1001E4FC0;
  v4[4] = self;
  v4[5] = a3;
  -[CKContainer accountInfoWithCompletionHandler:](cloudKitContainer, "accountInfoWithCompletionHandler:", v4);
}

- (void)_fetchAccessoryKeyBlob:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  os_log_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  os_log_t v15;
  os_log_t v16;
  unsigned int v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  os_log_t v25;
  _QWORD v26[5];
  id v27[2];
  uint8_t buf[4];
  const char *v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudAccountInfo"));
  v8 = objc_msgSend(v7, "manateeAvailable");

  if ((v8 & 1) != 0)
  {
    v9 = sub_1000681B8("MagicPairing");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (a3 <= 4)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        v29 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee: fetchAccessoryKeyBlob: %lu", buf, 0xCu);
      }

      if (-[MPCloudKit_Manatee isFetchInProgress](self, "isFetchInProgress"))
      {
        v16 = sub_1000681B8("MagicPairing");
        v10 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v17 = -[MPCloudKit_Manatee isFetchInProgress](self, "isFetchInProgress");
          *(_DWORD *)buf = 67109120;
          LODWORD(v29) = v17;
          v12 = "Manatee: fetchAccessoryKeyBlob already in-progress: %i";
          v13 = v10;
          v14 = 8;
          goto LABEL_16;
        }
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
        v19 = v18 == 0;

        if (v19)
        {
          v25 = sub_1000681B8("MagicPairing");
          v10 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v12 = "Manatee: recordZoneAccessoryDatabase is nil";
            v13 = v10;
            v14 = 2;
            goto LABEL_16;
          }
        }
        else
        {
          -[MPCloudKit_Manatee setIsFetchInProgress:](self, "setIsFetchInProgress:", 1);
          v20 = objc_alloc((Class)CKRecordID);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneID"));
          v10 = objc_msgSend(v20, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
          objc_msgSend(v23, "beginTransaction:", CFSTR("ManateeFetchAccessoryKeyBlob"));

          objc_initWeak((id *)buf, self);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1000853F0;
          v26[3] = &unk_1001E5008;
          v26[4] = self;
          v27[1] = (id)a3;
          objc_copyWeak(v27, (id *)buf);
          objc_msgSend(v24, "fetchRecordWithID:completionHandler:", v10, v26);

          objc_destroyWeak(v27);
          objc_destroyWeak((id *)buf);
        }
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[MPCloudKit_Manatee _fetchAccessoryKeyBlob:]";
      v12 = "Manatee: Exhausted all retries...: %s";
      v13 = v10;
      v14 = 12;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    v15 = sub_1000681B8("MagicPairing");
    v10 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10016E8F0();
  }

}

- (void)updateCloudKitBlobZone:(id)a3
{
  id v4;
  unsigned int v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v5 = -[MPCloudKit_Manatee isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress");
    v6 = sub_1000681B8("MagicPairing");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: updateCloudKitBlobZone already in the process...", buf, 2u);
      }

    }
    else
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: updating CloudKit Blob", v9, 2u);
      }

      -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 1);
      -[MPCloudKit_Manatee modifyKeyBlob:withRetryCount:](self, "modifyKeyBlob:withRetryCount:", v4, 0);
    }
  }

}

- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  unint64_t v20;

  v6 = a3;
  v7 = sub_1000681B8("MagicPairing");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: modifyKeyBlob with retry count: %lu", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v9, "beginTransaction:", CFSTR("ManateeModifyKeyBlob"));

  v10 = objc_alloc((Class)CKRecordID);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
  v13 = objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008609C;
  v16[3] = &unk_1001E4628;
  v17 = v6;
  v18 = a4;
  v16[4] = self;
  v15 = v6;
  objc_msgSend(v14, "fetchRecordWithID:completionHandler:", v13, v16);

}

- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  os_log_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v22;
  void *v23;
  id v24;
  os_log_t v25;
  NSObject *v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  os_log_t v44;
  NSObject *v45;
  os_log_t v46;
  NSObject *v47;
  os_log_t v49;
  NSObject *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[5];
  id v58;
  unint64_t v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  unint64_t v66;

  v8 = a3;
  v9 = a4;
  if (!v8 || a5 > 3)
    goto LABEL_48;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v10, "isEqualToString:", CKErrorDomain))
  {
    if (objc_msgSend(v8, "code") == (id)3
      || objc_msgSend(v8, "code") == (id)7
      || objc_msgSend(v8, "code") == (id)4
      || objc_msgSend(v8, "code") == (id)9)
    {

      goto LABEL_9;
    }
    v51 = objc_msgSend(v8, "code");

    if (v51 == (id)6)
    {
LABEL_9:
      v11 = sub_1000681B8("MagicPairing");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10016EAAC();

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CKErrorRetryAfterKey));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CKErrorRetryAfterKey));
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        v19 = sub_1000681B8("MagicPairing");
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v62 = v8;
          v63 = 2048;
          v64 = a5;
          v65 = 2048;
          v66 = (unint64_t)v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Manatee: Updating master key failed with error %@, retry count = %lu with time: %lu", buf, 0x20u);
        }

        v21 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000869E4;
        block[3] = &unk_1001E3460;
        block[4] = self;
        v58 = v9;
        v59 = a5;
        dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }
  else
  {

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v22, "isEqualToString:", CKErrorDomain))
  {
    if (objc_msgSend(v8, "code") == (id)26)
    {

LABEL_44:
      v44 = sub_1000681B8("MagicPairing");
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_10016EB18();

      -[MPCloudKit_Manatee writeKeyBlob:withRetryCount:](self, "writeKeyBlob:withRetryCount:", v9, 0);
      goto LABEL_49;
    }
    v43 = objc_msgSend(v8, "code");

    if (v43 == (id)11)
      goto LABEL_44;
  }
  else
  {

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v23, "isEqualToString:", CKErrorDomain))
  {
    v24 = objc_msgSend(v8, "code");

    if (v24 == (id)112)
    {
      v25 = sub_1000681B8("MagicPairing");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError lost access to manatee data. Reset and recreate zone.", buf, 2u);
      }

      v27 = sub_1000681B8("MagicPairing");
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError Reset and recreate zone DONE!", buf, 2u);
      }

      -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost](self, "resetCloudContainerManateeIdentityLost");
      goto LABEL_49;
    }
  }
  else
  {

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if ((objc_msgSend(v29, "isEqualToString:", CKErrorDomain) & 1) == 0)
  {

    goto LABEL_48;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  if (!v31)
  {
LABEL_48:
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0);
    goto LABEL_49;
  }
  v52 = v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i)));
        v40 = objc_opt_class(NSError);
        if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "domain"));
          if ((objc_msgSend(v41, "isEqualToString:", CKErrorDomain) & 1) != 0)
          {
            v42 = objc_msgSend(v39, "code");

            if (v42 == (id)112)
            {
              v46 = sub_1000681B8("MagicPairing");
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v39;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError lost access to manatee data. Reset and recreate zone due to - %@", buf, 0xCu);
              }

              v49 = sub_1000681B8("MagicPairing");
              v50 = objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Manatee: handleModifyMasterKeyError. Reset and recreate zone DONE!", buf, 2u);
              }

              -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost](self, "resetCloudContainerManateeIdentityLost");
              goto LABEL_55;
            }
          }
          else
          {

          }
        }

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      if (v36)
        continue;
      break;
    }
  }
LABEL_55:

  v9 = v52;
LABEL_49:

}

- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  dispatch_semaphore_t v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  dispatch_time_t v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, void *);
  void *v37;
  MPCloudKit_Manatee *v38;
  id v39;
  id v40;
  NSObject *v41;
  __int128 *p_buf;
  id v43[2];
  id location;
  uint8_t v45[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v6 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@", (uint8_t *)&buf, 0xCu);

    }
    v12 = objc_alloc((Class)CKRecordID);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v15 = objc_msgSend(v12, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v14);

    v16 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("MasterKey"), v15);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x3032000000;
    v51 = sub_100086EC8;
    v52 = sub_100086ED8;
    v53 = 0;
    v17 = dispatch_semaphore_create(0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encryptedValues"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v6, CFSTR("EncryptedMasterKeyBlob"));

    v19 = sub_1000681B8("MagicPairing");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v45 = 138412290;
      v46 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "writeKeyBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@", v45, 0xCu);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v21, "beginTransaction:", CFSTR("ManateeWriteKeyBlob"));

    objc_initWeak(&location, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v34 = _NSConcreteStackBlock;
    v35 = 3221225472;
    v36 = sub_100086EE0;
    v37 = &unk_1001E50C0;
    v43[1] = (id)a4;
    p_buf = &buf;
    v38 = self;
    v39 = v6;
    objc_copyWeak(v43, &location);
    v24 = v16;
    v40 = v24;
    v25 = v17;
    v41 = v25;
    objc_msgSend(v22, "saveRecordZone:completionHandler:", v23, &v34);

    v26 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v25, v26);
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0, v34, v35, v36, v37, v38);
    -[MPCloudKit_Manatee setMasterBlob:](self, "setMasterBlob:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v27, "endTransaction:", CFSTR("ManateeWriteKeyBlob"));

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v28 = sub_1000681B8("MagicPairing");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneID"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "zoneName"));
        v33 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v45 = 138412546;
        v46 = v32;
        v47 = 2112;
        v48 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@ failed with error %@", v45, 0x16u);

      }
    }

    objc_destroyWeak(v43);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0);
  }

}

- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4
{
  id v6;
  NSObject *v7;
  os_log_t v8;
  _QWORD block[4];
  NSObject *v10;
  MPCloudKit_Manatee *v11;
  BOOL v12;

  v6 = a3;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100087A1C;
    block[3] = &unk_1001E46F0;
    v12 = a4;
    v10 = v6;
    v11 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v7 = v10;
  }
  else
  {
    v8 = sub_1000681B8("MagicPairing");
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10016EB78();
  }

}

- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  id v21[2];
  uint8_t buf[4];
  unint64_t v23;

  v6 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, ">>> Manatee: modifyAccessoryBlob - %lu", buf, 0xCu);
    }

    v9 = dispatch_semaphore_create(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v10, "beginTransaction:", CFSTR("ManateeModifyAccessoryBlob"));

    v11 = objc_alloc((Class)CKRecordID);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
    v14 = objc_msgSend(v11, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v13);

    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100087FB8;
    v18[3] = &unk_1001E50E8;
    objc_copyWeak(v21, (id *)buf);
    v19 = v6;
    v21[1] = (id)a4;
    v16 = v9;
    v20 = v16;
    objc_msgSend(v15, "fetchRecordWithID:completionHandler:", v14, v18);

    v17 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v16, v17);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);

  }
}

- (void)handleAccessoryModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v7;
  id v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  int IsCode;
  void *v21;
  void *v22;
  double v23;
  double v24;
  os_log_t v25;
  NSObject *v26;
  double v27;
  dispatch_time_t v28;
  void *v29;
  id v30;
  id v31;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  os_log_t v37;
  NSObject *v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  uint64_t v51;
  void *v52;
  _BOOL4 v53;
  os_log_t v54;
  os_log_t v55;
  NSObject *v56;
  os_log_t v58;
  NSObject *v59;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD block[5];
  id v70;
  unint64_t v71;
  uint8_t v72[128];
  uint8_t buf[4];
  id v74;
  __int16 v75;
  unint64_t v76;
  __int16 v77;
  unint64_t v78;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v61 = v8;
    if (a5 >= 5)
    {
      v9 = sub_1000681B8("MagicPairing");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10016ECF8();

      goto LABEL_24;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if (objc_msgSend(v11, "isEqualToString:", CKErrorDomain))
    {
      if (objc_msgSend(v7, "code") == (id)3 || objc_msgSend(v7, "code") == (id)4 || objc_msgSend(v7, "code") == (id)9)
      {

        goto LABEL_11;
      }
      v30 = objc_msgSend(v7, "code");

      if (v30 == (id)6)
      {
LABEL_11:
        v12 = sub_1000681B8("MagicPairing");
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10016ED58();
LABEL_13:

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v15, CFSTR("kUploadStatus"), 0));
        objc_msgSend(v14, "sendCloudKitMsg:args:", CFSTR("DeviceInfoUploadStatus"), v16);

LABEL_24:
        v8 = v61;
        goto LABEL_25;
      }
    }
    else
    {

    }
    if (objc_msgSend(v7, "code") == (id)7)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
      v18 = CKErrorRetryAfterKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CKErrorRetryAfterKey));
      if (v19)
      {

LABEL_21:
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v18));
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        v25 = sub_1000681B8("MagicPairing");
        v26 = objc_claimAutoreleasedReturnValue(v25);
        v27 = v24 + 10.0;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v74 = v7;
          v75 = 2048;
          v76 = a5;
          v77 = 2048;
          v78 = (unint64_t)v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Manatee: modify AccessoryBlob failed with error %@, retry count = %lu, retry time: %lu", buf, 0x20u);
        }

        v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100088E20;
        block[3] = &unk_1001E3460;
        block[4] = self;
        v70 = v61;
        v71 = a5;
        dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_24;
      }
      IsCode = CKErrorIsCode(v7, 15);

      if (IsCode)
        goto LABEL_21;
    }
    else if (CKErrorIsCode(v7, 15))
    {
      v18 = CKErrorRetryAfterKey;
      goto LABEL_21;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if (objc_msgSend(v29, "isEqualToString:", CKErrorDomain))
    {
      if (objc_msgSend(v7, "code") == (id)26)
      {

LABEL_33:
        v32 = sub_1000681B8("MagicPairing");
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_10016EDB8();

        objc_initWeak((id *)buf, self);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee modifyOperationQueue](self, "modifyOperationQueue"));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_100088F4C;
        v66[3] = &unk_1001E4768;
        objc_copyWeak(&v68, (id *)buf);
        v67 = v61;
        objc_msgSend(v34, "addOperationWithBlock:", v66);

        objc_destroyWeak(&v68);
        objc_destroyWeak((id *)buf);
        goto LABEL_24;
      }
      v31 = objc_msgSend(v7, "code");

      if (v31 == (id)11)
        goto LABEL_33;
    }
    else
    {

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if (objc_msgSend(v35, "isEqualToString:", CKErrorDomain))
    {
      v36 = objc_msgSend(v7, "code");

      if (v36 == (id)112)
      {
        v37 = sub_1000681B8("MagicPairing");
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError lost access to manatee data. Reset and recreate zone.", buf, 2u);
        }

        v39 = sub_1000681B8("MagicPairing");
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError Reset and recreate zone DONE!", buf, 2u);
        }

        -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost](self, "resetCloudContainerManateeIdentityLost");
        goto LABEL_24;
      }
    }
    else
    {

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if ((objc_msgSend(v41, "isEqualToString:", CKErrorDomain) & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

      if (v43)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v46 = v45;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v47)
        {
          v48 = *(_QWORD *)v63;
          while (2)
          {
            for (i = 0; i != v47; i = (char *)i + 1)
            {
              if (*(_QWORD *)v63 != v48)
                objc_enumerationMutation(v46);
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i)));
              v51 = objc_opt_class(NSError);
              if ((objc_opt_isKindOfClass(v50, v51) & 1) != 0)
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "domain"));
                if ((objc_msgSend(v52, "isEqualToString:", CKErrorDomain) & 1) != 0)
                {
                  v53 = objc_msgSend(v50, "code") == (id)112;

                  if (v53)
                  {
                    v55 = sub_1000681B8("MagicPairing");
                    v56 = objc_claimAutoreleasedReturnValue(v55);
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v74 = v50;
                      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError lost access to manatee data. Reset and recreate zone due to - %@", buf, 0xCu);
                    }

                    v58 = sub_1000681B8("MagicPairing");
                    v59 = objc_claimAutoreleasedReturnValue(v58);
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Manatee: handleAccessoryModifyError. Reset and recreate zone DONE!", buf, 2u);
                    }

                    -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost](self, "resetCloudContainerManateeIdentityLost");
                    goto LABEL_68;
                  }
                }
                else
                {

                }
              }

            }
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
            if (v47)
              continue;
            break;
          }
        }
LABEL_68:

        goto LABEL_24;
      }
    }
    else
    {

    }
    v54 = sub_1000681B8("MagicPairing");
    v13 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10016EE18();
    goto LABEL_13;
  }
LABEL_25:

}

- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  dispatch_semaphore_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  dispatch_time_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  NSObject *v30;
  id v31[2];
  uint8_t buf[4];
  id v33;

  v6 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: >>> writeAccessoryBlob Record Zone %@", buf, 0xCu);

    }
    v12 = objc_alloc((Class)CKRecordID);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v15 = objc_msgSend(v12, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v14);

    v16 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("AccessoryDatabase"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encryptedValues"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, CFSTR("EncryptedAccessoryBlob"));

    v18 = sub_1000681B8("MagicPairing");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Manatee: writeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch: encryptedBlob %@", buf, 0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v20, "beginTransaction:", CFSTR("ManateeWriteAccessoryBlob"));

    v21 = dispatch_semaphore_create(0);
    objc_initWeak((id *)buf, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000892EC;
    v27[3] = &unk_1001E5110;
    objc_copyWeak(v31, (id *)buf);
    v27[4] = self;
    v24 = v16;
    v28 = v24;
    v31[1] = (id)a4;
    v29 = v6;
    v25 = v21;
    v30 = v25;
    objc_msgSend(v22, "saveRecordZone:completionHandler:", v23, v27);

    v26 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v25, v26);

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);

  }
}

- (void)deleteCloudKitAccessoryZone
{
  dispatch_semaphore_t v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  dispatch_semaphore_t v21;
  uint8_t buf[4];
  void *v23;

  v3 = dispatch_semaphore_create(0);
  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: >>> deleteCloudKitAccessoryZone %@", buf, 0xCu);

  }
  v9 = objc_alloc((Class)CKRecordID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v12 = objc_msgSend(v9, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v13, "beginTransaction:", CFSTR("ManateeDeleteCloudKitAccessoryZone"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008A114;
  v20[3] = &unk_1001E47E0;
  v21 = v3;
  v15 = v3;
  objc_msgSend(v14, "deleteRecordWithID:completionHandler:", v12, v20);

  v16 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceManager"));
  objc_msgSend(v18, "deleteLegacyMagicPairingRecordsWithUserInitiated:completion:", 1, &stru_1001E5130);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v19, "endTransaction:", CFSTR("ManateeDeleteCloudKitAccessoryZone"));

}

- (void)createSubscritionForRecordType:(id)a3
{
  NSObject *v4;
  unsigned __int8 v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  os_log_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  os_log_t v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  os_log_t v26;
  _QWORD v27[4];
  __CFString *v28;
  MPCloudKit_Manatee *v29;
  uint8_t buf[4];
  NSObject *v31;

  v4 = a3;
  v5 = -[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded");
  v6 = sub_1000681B8("MagicPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (!v8)
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v13 = "Manatee zone not upgraded.";
    v14 = v7;
    v15 = 2;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_25;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: createSubscritionForRecordType: %@", buf, 0xCu);
  }

  if (-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("EncryptedMasterKeyBlob")))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingMasterSubscriptionManateeID")));
    if (v9)
    {
      v7 = v9;
      v10 = sub_1000681B8("MagicPairing");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        v12 = "Manatee: master subscription already exists: %@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v18 = objc_alloc((Class)CKRecordZoneSubscription);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
    v7 = objc_msgSend(v18, "initWithZoneID:", v20);
    v21 = CFSTR("MagicCloudPairingMasterSubscriptionManateeID");
  }
  else
  {
    if (!-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("EncryptedAccessoryBlob")))
    {
LABEL_22:
      v26 = sub_1000681B8("MagicPairing");
      v7 = objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      v13 = "Manatee: Unable to create zone subscription key: %@";
      v14 = v7;
      v15 = 12;
      goto LABEL_24;
    }
    v16 = objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingAccessorySubscriptionManateeID")));
    if (v16)
    {
      v7 = v16;
      v17 = sub_1000681B8("MagicPairing");
      v11 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        v12 = "Manatee: accessory subscription already exists: %@";
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_25;
    }
    v22 = objc_alloc((Class)CKRecordZoneSubscription);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
    v7 = objc_msgSend(v22, "initWithZoneID:", v20);
    v21 = CFSTR("MagicCloudPairingAccessorySubscriptionManateeID");
  }

  if (!v7)
    goto LABEL_22;
  v23 = sub_1000681B8("MagicPairing");
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Manatee: Attempting to save subscription for recordType: %@", buf, 0xCu);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10008A698;
  v27[3] = &unk_1001E4828;
  v28 = (__CFString *)v21;
  v29 = self;
  objc_msgSend(v25, "saveSubscription:completionHandler:", v7, v27);

LABEL_25:
}

- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  os_log_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  MPCloudKit_Manatee *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", v7));
  v9 = sub_1000681B8("MagicPairing");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee: Verify Fetch cached Subscription ID - %@ for record - %@", buf, 0x16u);
  }

  v11 = sub_1000681B8("MagicPairing");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Manatee: Found cached Subscription ID - %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", v7));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008AB50;
    v16[3] = &unk_1001E4850;
    v17 = v8;
    v18 = self;
    v19 = v7;
    v20 = v6;
    objc_msgSend(v14, "fetchSubscriptionWithID:completionHandler:", v15, v16);

  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Manatee: Subscription cannot be Fetched, create it...", buf, 2u);
    }

    -[MPCloudKit_Manatee createSubscritionForRecordType:](self, "createSubscritionForRecordType:", v6);
  }

}

- (void)verifyAndCacheSubscriptionID:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MPCloudKit_Manatee *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: verifyAndCacheSubscriptionID - %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008AEA4;
  v9[3] = &unk_1001E4828;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "fetchSubscriptionWithID:completionHandler:", v8, v9);

}

- (void)removeSubscritionForRecordType:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[3];
  char v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee: Attempting to delete Subscription for record type - %@ ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008B1DC;
  v9[3] = &unk_1001E48C8;
  objc_copyWeak(&v12, (id *)buf);
  v8 = v4;
  v10 = v8;
  v11 = v13;
  objc_msgSend(v7, "fetchAllSubscriptionsWithCompletionHandler:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(v13, 8);

}

- (id)apsEnvironmentString
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  os_log_t v16;
  NSObject *v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;

  v3 = xpc_copy_entitlement_for_token("aps-environment", 0);
  v4 = (void *)v3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100086EC8;
  v26 = sub_100086ED8;
  v27 = 0;
  if (v3)
  {
    v5 = _CFXPCCreateCFObjectFromXPCObject(v3);
    v6 = (void *)v23[5];
    v23[5] = v5;

    v7 = (void *)v23[5];
    if (v7)
    {
      if (!objc_msgSend(v7, "compare:options:", CKPushEnvironmentServerPreferred, 1))
      {
        v8 = dispatch_semaphore_create(0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10008B904;
        v19[3] = &unk_1001E48F0;
        v21 = &v22;
        v10 = v8;
        v20 = v10;
        objc_msgSend(v9, "serverPreferredPushEnvironmentWithCompletionHandler:", v19);

        v11 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v10, v11))
        {
          v12 = sub_1000681B8("MagicPairing");
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Timeout getting server preferred push environment", buf, 2u);
          }

        }
      }
    }
  }
  v14 = (void *)v23[5];
  if (!v14)
    v14 = (void *)APSEnvironmentProduction;
  v15 = v14;
  v16 = sub_1000681B8("MagicPairing");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Using push environment %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (void)pushEnable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executablePath"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));

    v4 = (void *)v7;
  }
  v8 = sub_1000681B8("MagicPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee: Enable Push Notification Updated for bundle ID: %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudPushService shared](_TtC15audioaccessoryd16CloudPushService, "shared"));
  objc_msgSend(v10, "addWithDelegate:", self);

}

- (void)pushDisable
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CloudPushService shared](_TtC15audioaccessoryd16CloudPushService, "shared"));
  objc_msgSend(v3, "removeWithDelegate:", self);

}

- (BOOL)manateeZoneUpgraded
{
  void *v2;
  os_log_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

  if (v2)
  {
    v3 = sub_1000681B8("MagicPairing");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: Master zone has been upgraded. Dont generate keys", v6, 2u);
    }

  }
  return v2 != 0;
}

- (void)resetCloudContainerManateeIdentityLost
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BC68;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)resetMasterZone:(id)a3 accessoryblob:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  os_log_t v24;
  NSObject *v25;
  dispatch_time_t v26;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  dispatch_semaphore_t v31;
  _QWORD block[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;

  v6 = a3;
  v7 = a4;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v8, "beginTransaction:", CFSTR("resetMasterZone"));

    v9 = sub_1000681B8("MagicPairing");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
      *(_DWORD *)buf = 138412290;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " >>> resetMasterZone Record Zone %@", buf, 0xCu);

    }
    v14 = dispatch_time(0, 10000000000);
    v15 = dispatch_semaphore_create(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_10008C6F0;
    v30 = &unk_1001E5158;
    v31 = v15;
    v19 = v15;
    objc_msgSend(v16, "deleteRecordZoneWithID:completionHandler:", v18, &v27);

    dispatch_semaphore_wait(v19, v14);
    -[MPCloudKit_Manatee _updateMasterZoneBlob:accessoryblob:](self, "_updateMasterZoneBlob:accessoryblob:", v6, v7, v27, v28, v29, v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v20, "endTransaction:", CFSTR("resetMasterZone"));

  }
  else
  {
    v21 = sub_1000681B8("MagicPairing");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "resetMasterZone account not active upgrade pref and reload account status", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));
    if (!v23)
    {
      -[MPCloudKit_Manatee setuserPreference:value:sync:](self, "setuserPreference:value:sync:", CFSTR("MagicCloudPairingManateeUpgradedAccount"), &__kCFBooleanTrue, 1);
      v24 = sub_1000681B8("MagicPairing");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "resetMasterZone Master zone has been upgraded successfully", buf, 2u);
      }

      -[MPCloudKit_Manatee accountStatusDidChange:](self, "accountStatusDidChange:", 0);
      v26 = dispatch_time(0, 10000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008C6E0;
      block[3] = &unk_1001E2570;
      block[4] = self;
      v33 = v6;
      v34 = v7;
      dispatch_after(v26, (dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)_updateMasterZoneBlob:(id)a3 accessoryblob:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v8, "beginTransaction:", CFSTR("updateMasterZoneBlob"));

  v9 = sub_1000681B8("MagicPairing");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
    *(_DWORD *)buf = 138412290;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " >>>updateMasterZoneBlob  Record Zone %@", buf, 0xCu);

  }
  v14 = objc_alloc((Class)CKRecordID);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
  v17 = objc_msgSend(v14, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v16);

  v18 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("MasterKey"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "encryptedValues"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, CFSTR("EncryptedMasterKeyBlob"));

  v20 = sub_1000681B8("MagicPairing");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "updateMasterZoneBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@", buf, 0xCu);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10008CA88;
  v26[3] = &unk_1001E5218;
  v26[4] = self;
  v27 = v18;
  v28 = v6;
  v24 = v6;
  v25 = v18;
  objc_msgSend(v22, "saveRecordZone:completionHandler:", v23, v26);

}

- (void)resetAccessoryZone:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  NSObject *v17;

  v4 = a3;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v5, "beginTransaction:", CFSTR("resetAccessoryZone"));

    v6 = dispatch_semaphore_create(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008D03C;
    v16[3] = &unk_1001E5158;
    v10 = v6;
    v17 = v10;
    objc_msgSend(v7, "deleteRecordZoneWithID:completionHandler:", v9, v16);

    v11 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v10, v11);
    v12 = sub_1000681B8("MagicPairing");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "resetAccessoryZone record", v15, 2u);
    }

    -[MPCloudKit_Manatee upgradeAccessoryBlob:withRetryCount:](self, "upgradeAccessoryBlob:withRetryCount:", v4, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v14, "endTransaction:", CFSTR("resetAccessoryZone"));

  }
}

- (void)upgradeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  id v29;

  v6 = a3;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v7, "beginTransaction:", CFSTR("upgradeAccessoryBlob"));

    v8 = sub_1000681B8("MagicPairing");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manatee: upgradeAccessoryBlob:  Creating Record Zone %@", buf, 0xCu);

    }
    v13 = objc_alloc((Class)CKRecordID);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID"));
    v16 = objc_msgSend(v13, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v15);

    v17 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("AccessoryDatabase"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "encryptedValues"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v6, CFSTR("EncryptedAccessoryBlob"));

    v19 = sub_1000681B8("MagicPairing");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Manatee: upgradeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch: encryptedBlob %@", buf, 0xCu);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10008D3CC;
    v24[3] = &unk_1001E5240;
    v27 = a4;
    v24[4] = self;
    v25 = v6;
    v26 = v17;
    v23 = v17;
    objc_msgSend(v21, "saveRecordZone:completionHandler:", v22, v24);

  }
}

- (NSString)cloudContainerIdentifier
{
  return (NSString *)CFSTR("com.apple.securedBluetooth");
}

- (OS_dispatch_queue)pushDelegateQueue
{
  void *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushQueue](self, "pushQueue"));

  if (!v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.bluetooth.mpcloudkit.push", v5);
    -[MPCloudKit_Manatee setPushQueue:](self, "setPushQueue:", v6);

  }
  return -[MPCloudKit_Manatee pushQueue](self, "pushQueue");
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _QWORD v12[4];
  id v13;
  MPCloudKit_Manatee *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKNotification notificationFromRemoteNotificationDictionary:](CKNotification, "notificationFromRemoteNotificationDictionary:", v5));
  v7 = sub_1000681B8("MagicPairing");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topic"));
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: ***** APS Push received: %@ \n %@ \n", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerIdentifier"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.securedBluetooth"));

  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008DDA8;
    v12[3] = &unk_1001E23E8;
    v13 = v6;
    v14 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  }
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  if (IsAppleInternalBuild(v3))
  {
    v4 = sub_1000681B8("MagicPairing");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: Received public token \"%@\" on connection", (uint8_t *)&v7, 0xCu);

    }
  }

}

- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IsAppleInternalBuild(v9))
  {
    v10 = sub_1000681B8("MagicPairing");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64EncodedStringWithOptions:", 0));
      v13 = 138412802;
      v14 = v12;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Manatee: Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection", (uint8_t *)&v13, 0x20u);

    }
  }

}

- (BOOL)isAccountActive
{
  return self->_isAccountActive;
}

- (void)setIsAccountActive:(BOOL)a3
{
  self->_isAccountActive = a3;
}

- (BOOL)isWriteMasterKeysInProgress
{
  return self->_isWriteMasterKeysInProgress;
}

- (void)setIsWriteMasterKeysInProgress:(BOOL)a3
{
  self->_isWriteMasterKeysInProgress = a3;
}

- (BOOL)reinitAfterBuddy
{
  return self->_reinitAfterBuddy;
}

- (void)setReinitAfterBuddy:(BOOL)a3
{
  self->_reinitAfterBuddy = a3;
}

- (CKContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitContainer, a3);
}

- (CKDatabase)cloudKitDatabase
{
  return self->_cloudKitDatabase;
}

- (void)setCloudKitDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitDatabase, a3);
}

- (CKRecordZone)recordZoneBlob
{
  return self->_recordZoneBlob;
}

- (void)setRecordZoneBlob:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneBlob, a3);
}

- (CKRecordZone)recordZoneAccessoryDatabase
{
  return self->_recordZoneAccessoryDatabase;
}

- (void)setRecordZoneAccessoryDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneAccessoryDatabase, a3);
}

- (CKSubscription)cloudSubscription
{
  return self->_cloudSubscription;
}

- (void)setCloudSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSubscription, a3);
}

- (NSTimer)countdownTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCountdownTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSTimer)pushTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPushTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableData)masterBlob
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMasterBlob:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSError)pauseErrorReason
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPauseErrorReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)shouldPauseFetch
{
  return self->_shouldPauseFetch;
}

- (void)setShouldPauseFetch:(BOOL)a3
{
  self->_shouldPauseFetch = a3;
}

- (BTStateWatcher)buddyStateWatcher
{
  return self->_buddyStateWatcher;
}

- (void)setBuddyStateWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_buddyStateWatcher, a3);
}

- (BOOL)isFetchInProgress
{
  return self->_isFetchInProgress;
}

- (void)setIsFetchInProgress:(BOOL)a3
{
  self->_isFetchInProgress = a3;
}

- (BOOL)isFetchMasterKeyInProgress
{
  return self->_isFetchMasterKeyInProgress;
}

- (void)setIsFetchMasterKeyInProgress:(BOOL)a3
{
  self->_isFetchMasterKeyInProgress = a3;
}

- (OS_dispatch_queue)pushQueue
{
  return self->_pushQueue;
}

- (void)setPushQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pushQueue, a3);
}

- (NSOperationQueue)modifyOperationQueue
{
  return self->_modifyOperationQueue;
}

- (void)setModifyOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modifyOperationQueue, a3);
}

- (NSTimer)modifyOperationTimer
{
  return self->_modifyOperationTimer;
}

- (void)setModifyOperationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_modifyOperationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifyOperationTimer, 0);
  objc_storeStrong((id *)&self->_modifyOperationQueue, 0);
  objc_storeStrong((id *)&self->_pushQueue, 0);
  objc_storeStrong((id *)&self->_buddyStateWatcher, 0);
  objc_storeStrong((id *)&self->_pauseErrorReason, 0);
  objc_storeStrong((id *)&self->_masterBlob, 0);
  objc_storeStrong((id *)&self->_pushTimer, 0);
  objc_storeStrong((id *)&self->_countdownTimer, 0);
  objc_storeStrong((id *)&self->_cloudSubscription, 0);
  objc_storeStrong((id *)&self->_recordZoneAccessoryDatabase, 0);
  objc_storeStrong((id *)&self->_recordZoneBlob, 0);
  objc_storeStrong((id *)&self->_cloudKitDatabase, 0);
  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
}

@end
