@implementation MPCloudKit

+ (id)sharedInstance
{
  if (qword_1002125E0 != -1)
    dispatch_once(&qword_1002125E0, &stru_1001E4490);
  return (id)qword_1002125D8;
}

- (MPCloudKit)init
{
  return -[MPCloudKit initWithRecordZoneName](self, "initWithRecordZoneName");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPCloudKit;
  -[MPCloudKit dealloc](&v4, "dealloc");
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudContainerIdentifier](self, "cloudContainerIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MPCloudKit: Container - %@"), v2));

  return (NSString *)v3;
}

- (MPCloudKit)initWithRecordZoneName
{
  MPCloudKit *v2;
  MPCloudKit *v3;
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
  v18.super_class = (Class)MPCloudKit;
  v2 = -[MPCloudKit init](&v18, "init");
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
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MP BYSetupAssistantNeedsToRun : true ", (uint8_t *)buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v12, "beginTransaction:", CFSTR("com.apple.bluetooth.user.services.mpcloudkit.buddysetup"));

    v3->_reinitAfterBuddy = 1;
    objc_initWeak(buf, v3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000685D8;
    v15[3] = &unk_1001E3F50;
    objc_copyWeak(&v16, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BTStateWatcher monitorBuddyStateWithAction:](BTStateWatcher, "monitorBuddyStateWithAction:", v15));
    -[MPCloudKit setBuddyStateWatcher:](v3, "setBuddyStateWatcher:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
    goto LABEL_12;
  }
  if (v11)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MP BYSetupAssistantNeedsToRun : false ", (uint8_t *)buf, 2u);
  }

  v3->_reinitAfterBuddy = 0;
  if (!-[MPCloudKit initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot"))
LABEL_12:
    -[MPCloudKit initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot");
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unlocked since boot = %{public}@", buf, 0xCu);
  }

  if (v3 == 1)
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device is already unlocked after boot ", buf, 2u);
    }

    -[MPCloudKit initializeCloudKit](self, "initializeCloudKit");
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068790;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    if (qword_1002125E8 != -1)
      dispatch_once(&qword_1002125E8, block);
  }
  return v3 == 1;
}

- (void)getAccountStatus
{
  -[MPCloudKit accountStatusDidChange:](self, "accountStatusDidChange:", 0);
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing account update to bluetoothd", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
  objc_msgSend(v5, "accountStatusWithCompletionHandler:", &stru_1001E44F8);

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "buddySetupDone : reset timer now ", buf, 2u);
  }

  if (self->_reinitAfterBuddy)
  {
    -[MPCloudKit initializedCKAfterFirstUnlockedSinceBoot](self, "initializedCKAfterFirstUnlockedSinceBoot");
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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "buddySetupDone : re-intt cloud kit not needed", v9, 2u);
    }

  }
  self->_reinitAfterBuddy = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v8, "endTransaction:", CFSTR("com.apple.bluetooth.user.services.mpcloudkit.buddysetup"));

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
  uint8_t v14[16];

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "non manatee initializeCloudKit : start ", v14, 2u);
  }

  v5 = (CKContainer *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.bluetooth")));
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
  -[MPCloudKit pushEnable](self, "pushEnable");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "accountStatusDidChange:", CKAccountChangedNotification, 0);

  -[MPCloudKit accountStatusDidChange:](self, "accountStatusDidChange:", 0);
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
  unsigned int v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf[2];

  v4 = a3;
  v5 = -[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded");
  v6 = sub_1000681B8("MagicPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "accountStatusDidChange check on manatee side", (uint8_t *)buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    objc_msgSend(v9, "getAccountStatus");

  }
  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "accountStatusDidChange calling accountStatusWithCompletionHandler", (uint8_t *)buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
    if (!v10)
    {
      v11 = sub_1000681B8("MagicPairing");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "non-Manatee accountStatusDidChange cloudKitContainer is nil", (uint8_t *)buf, 2u);
      }

      -[MPCloudKit initializeCloudKit](self, "initializeCloudKit");
    }
    objc_initWeak(buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100069158;
    v14[3] = &unk_1001E4520;
    objc_copyWeak(&v15, buf);
    objc_msgSend(v13, "accountStatusWithCompletionHandler:", v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }

}

- (void)setupSubscriptions
{
  -[MPCloudKit createSubscritionForRecordType:](self, "createSubscritionForRecordType:", CFSTR("EncryptedMasterKeyBlob"));
  -[MPCloudKit createSubscritionForRecordType:](self, "createSubscritionForRecordType:", CFSTR("EncryptedAccessoryBlob"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));

  if (v5)
  {
    cloudKitContainer = self->_cloudKitContainer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100069790;
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "non-Manatee fetchAccountStatusWithCompletion cloudKitContainer is nil", buf, 2u);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CloudKit Account Not Active"), 0, 0));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_pushTimerFired:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MP Push Timer Fired: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pushTimer](self, "pushTimer"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pushTimer](self, "pushTimer"));
    objc_msgSend(v8, "invalidate");

    -[MPCloudKit setPushTimer:](self, "setPushTimer:", 0);
  }
  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v9 = sub_1000681B8("MagicPairing");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MP Push Timer fired but we are now upgraded to manatee", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    objc_msgSend(v11, "fetchAccessoryKeyBlob:", 0);

  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069958;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)fetchKeyBlob:(unint64_t)a3
{
  os_log_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  os_log_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_log_t v27;
  _QWORD v28[6];
  uint8_t buf[4];
  unint64_t v30;

  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MP fetchKeyBlob: %lu", buf, 0xCu);
  }

  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    -[NSObject fetchKeyBlob:](v7, "fetchKeyBlob:", 0);
    goto LABEL_24;
  }
  if (-[MPCloudKit isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress"))
  {
    v8 = sub_1000681B8("MagicPairing");
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v9 = "MP already writing new key";
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit masterBlob](self, "masterBlob"));
  v13 = objc_msgSend(v12, "length");

  if (v13 != (id)33)
  {
    if (a3 >= 5)
    {
      v19 = sub_1000681B8("MagicPairing");
      v7 = objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 134217984;
      v30 = a3;
      v9 = "MP Exhausted all retries...: %lu";
      v10 = v7;
      v11 = 12;
      goto LABEL_9;
    }
    if (-[MPCloudKit isFetchMasterKeyInProgress](self, "isFetchMasterKeyInProgress"))
    {
      v20 = sub_1000681B8("MagicPairing");
      v7 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v9 = "MP fetchKeyBlob already fetching defer";
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));

      if (v21)
      {
        -[MPCloudKit setIsFetchMasterKeyInProgress:](self, "setIsFetchMasterKeyInProgress:", 1);
        -[MPCloudKit setMasterBlob:](self, "setMasterBlob:", 0);
        v22 = objc_alloc((Class)CKRecordID);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
        v7 = objc_msgSend(v22, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
        objc_msgSend(v25, "beginTransaction:", CFSTR("fetchKeyBlob"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100069DA0;
        v28[3] = &unk_1001E4590;
        v28[4] = self;
        v28[5] = a3;
        objc_msgSend(v26, "fetchRecordWithID:completionHandler:", v7, v28);

        goto LABEL_24;
      }
      v27 = sub_1000681B8("MagicPairing");
      v7 = objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v9 = "non-Manatee recordZoneBlob is nil";
    }
LABEL_8:
    v10 = v7;
    v11 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    goto LABEL_24;
  }
  v14 = sub_1000681B8("MagicPairing");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit masterBlob](self, "masterBlob"));
    *(_DWORD *)buf = 138412290;
    v30 = (unint64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MP fetchKeyBlob: already have master blob read  %@", buf, 0xCu);

  }
  v7 = objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit masterBlob](self, "masterBlob"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v17, CFSTR("kMasterKeyBlob"), 0));
  -[NSObject sendCloudKitMsg:args:](v7, "sendCloudKitMsg:args:", CFSTR("MasterKeysAvailable"), v18);

LABEL_24:
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3
{
  -[MPCloudKit checkAccountStatusWithCompletionHandler:withRetryCount:](self, "checkAccountStatusWithCompletionHandler:withRetryCount:", a3, 0);
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12[2];
  uint8_t buf[4];
  const char *v14;

  v6 = a3;
  if (a4 < 5)
  {
    objc_initWeak((id *)buf, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006A7B4;
    v10[3] = &unk_1001E45E0;
    objc_copyWeak(v12, (id *)buf);
    v10[4] = self;
    v11 = v6;
    v12[1] = (id)a4;
    objc_msgSend(v9, "accountStatusWithCompletionHandler:", v10);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v7 = sub_1000681B8("MagicPairing");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[MPCloudKit checkAccountStatusWithCompletionHandler:withRetryCount:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MP Exhausted all account retries: %s", buf, 0xCu);
    }

  }
}

- (void)fetchAccessoryKeyBlob:(unint64_t)a3
{
  os_log_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  os_log_t v10;
  NSObject *v11;
  char *v12;
  os_log_t v13;
  NSObject *v14;
  _BOOL4 v15;
  os_log_t v16;
  unsigned int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  os_log_t v25;
  _QWORD v26[6];
  uint8_t buf[4];
  const char *v28;

  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v5 = sub_1000681B8("MagicPairing");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", buf, 2u);
    }

    v7 = objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    -[NSObject fetchAccessoryKeyBlob:](v7, "fetchAccessoryKeyBlob:", a3);
LABEL_5:

    return;
  }
  if (-[MPCloudKit shouldPauseFetch](self, "shouldPauseFetch"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v9 = objc_msgSend(v8, "shouldPauseFetch");

    if (v9)
    {
      v10 = sub_1000681B8("MagicPairing");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pauseErrorReason](self, "pauseErrorReason"));
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetch is currently paused due to: %@", buf, 0xCu);

      }
LABEL_19:

      return;
    }
  }
  v13 = sub_1000681B8("MagicPairing");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (a3 < 5)
  {
    if (v15)
    {
      *(_DWORD *)buf = 134217984;
      v28 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MP fetchAccessoryKeyBlob: %lu", buf, 0xCu);
    }

    if (-[MPCloudKit isFetchInProgress](self, "isFetchInProgress"))
    {
      v16 = sub_1000681B8("MagicPairing");
      v11 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = -[MPCloudKit isFetchInProgress](self, "isFetchInProgress");
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MP fetchAccessoryKeyBlob already in-progress: %i", buf, 8u);
      }
      goto LABEL_19;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));

    if (!v18)
    {
      v25 = sub_1000681B8("MagicPairing");
      v7 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "non-Manatee recordZoneAccessoryDatabase is nil", buf, 2u);
      }
      goto LABEL_5;
    }
    -[MPCloudKit setIsFetchInProgress:](self, "setIsFetchInProgress:", 1);
    v19 = objc_alloc((Class)CKRecordID);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneID"));
    v22 = objc_msgSend(v19, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    objc_msgSend(v23, "beginTransaction:", CFSTR("fetchAccessoryKeyBlob"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10006AD84;
    v26[3] = &unk_1001E4590;
    v26[4] = self;
    v26[5] = a3;
    objc_msgSend(v24, "fetchRecordWithID:completionHandler:", v22, v26);

  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[MPCloudKit fetchAccessoryKeyBlob:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MP Exhausted all retries...: %s", buf, 0xCu);
    }

    -[MPCloudKit setIsFetchInProgress:](self, "setIsFetchInProgress:", 0);
  }
}

- (void)updateCloudKitBlobZone:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  unsigned int v8;
  os_log_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

    if (v5)
    {
      v6 = sub_1000681B8("MagicPairing");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", buf, 2u);
      }

    }
    else
    {
      v8 = -[MPCloudKit isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress");
      v9 = sub_1000681B8("MagicPairing");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v11)
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "updateCloudKitBlobZone already in the process...", v13, 2u);
        }

      }
      else
      {
        if (v11)
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "updating CloudKit Blob", v12, 2u);
        }

        -[MPCloudKit setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 1);
        -[MPCloudKit modifyKeyBlob:withRetryCount:](self, "modifyKeyBlob:withRetryCount:", v4, 0);
      }
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
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "modifyKeyBlob with retry count: %lu", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v9, "beginTransaction:", CFSTR("modifyKeyBlob"));

  v10 = objc_alloc((Class)CKRecordID);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
  v13 = objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10006B70C;
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
  dispatch_time_t v19;
  void *v20;
  id v21;
  os_log_t v22;
  NSObject *v23;
  _QWORD block[5];
  id v25;
  unint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;

  v8 = a3;
  v9 = a4;
  if (!v8 || a5 > 3)
    goto LABEL_17;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v10, "isEqualToString:", CKErrorDomain)
    && (objc_msgSend(v8, "code") == (id)3
     || objc_msgSend(v8, "code") == (id)7
     || objc_msgSend(v8, "code") == (id)4
     || objc_msgSend(v8, "code") == (id)9
     || objc_msgSend(v8, "code") == (id)6))
  {

    v11 = sub_1000681B8("MagicPairing");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2048;
      v30 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating master key failed with error %@, retry count = %lu", buf, 0x16u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CKErrorRetryAfterKey));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CKErrorRetryAfterKey));
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006BDC4;
      block[3] = &unk_1001E3460;
      block[4] = self;
      v25 = v9;
      v26 = a5;
      dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_18;
    }
LABEL_17:
    -[MPCloudKit setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0);
    goto LABEL_18;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (!objc_msgSend(v20, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_17;
  }
  if (objc_msgSend(v8, "code") == (id)26)
  {

  }
  else
  {
    v21 = objc_msgSend(v8, "code");

    if (v21 != (id)11)
      goto LABEL_17;
  }
  v22 = sub_1000681B8("MagicPairing");
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_10016CF40();

  -[MPCloudKit writeKeyBlob:withRetryCount:](self, "writeKeyBlob:withRetryCount:", v9, 0);
LABEL_18:

}

- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  void *v7;
  BOOL v8;
  os_log_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  dispatch_semaphore_t v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  void *v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  NSObject *v39;
  __int128 *p_buf;
  _QWORD *v41;
  unint64_t v42;
  _QWORD v43[3];
  char v44;
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
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

    v8 = v7 == 0;
    v9 = sub_1000681B8("MagicPairing");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@", (uint8_t *)&buf, 0xCu);

      }
      v15 = objc_alloc((Class)CKRecordID);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v10 = objc_msgSend(v15, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v17);

      v18 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("MasterKey"), v10);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v50 = 0x3032000000;
      v51 = sub_10006C2BC;
      v52 = sub_10006C2CC;
      v53 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v44 = 0;
      v19 = dispatch_semaphore_create(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "encryptedValues"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, CFSTR("EncryptedMasterKeyBlob"));

      v21 = sub_1000681B8("MagicPairing");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 138412290;
        v46 = v6;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "writeKeyBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@", v45, 0xCu);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      objc_msgSend(v23, "beginTransaction:", CFSTR("writeKeyBlob"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10006C2D4;
      v36[3] = &unk_1001E4678;
      v41 = v43;
      v42 = a4;
      p_buf = &buf;
      v36[4] = self;
      v37 = v6;
      v26 = v18;
      v38 = v26;
      v27 = v19;
      v39 = v27;
      objc_msgSend(v24, "saveRecordZone:completionHandler:", v25, v36);

      v28 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v27, v28);
      -[MPCloudKit setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      objc_msgSend(v29, "endTransaction:", CFSTR("writeKeyBlob"));

      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v30 = sub_1000681B8("MagicPairing");
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneName"));
          v35 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v45 = 138412546;
          v46 = v34;
          v47 = 2112;
          v48 = v35;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " >>>writeKeyBlob  Record Zone %@ failed with error %@", v45, 0x16u);

        }
      }

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(&buf, 8);

    }
    else if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", (uint8_t *)&buf, 2u);
    }

  }
}

- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4
{
  id v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  os_log_t v10;
  _QWORD block[4];
  NSObject *v12;
  MPCloudKit *v13;
  BOOL v14;
  uint8_t buf[16];

  v6 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

    if (v7)
    {
      v8 = sub_1000681B8("MagicPairing");
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont update keys to this container", buf, 2u);
      }
    }
    else if (-[MPCloudKit isAccountActive](self, "isAccountActive"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006CB54;
      block[3] = &unk_1001E46F0;
      v14 = a4;
      v12 = v6;
      v13 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v9 = v12;
    }
    else
    {
      v10 = sub_1000681B8("MagicPairing");
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10016CFA0();
    }

  }
}

- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21[2];
  uint8_t buf[4];
  unint64_t v23;

  v6 = a3;
  v7 = sub_1000681B8("MagicPairing");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " >>> modifyAccessoryBlob - %lu", buf, 0xCu);
  }

  v9 = dispatch_semaphore_create(0);
  v10 = objc_alloc((Class)CKRecordID);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
  v13 = objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v12);

  objc_initWeak((id *)buf, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006D0C0;
  v18[3] = &unk_1001E4718;
  v15 = v9;
  v19 = v15;
  objc_copyWeak(v21, (id *)buf);
  v16 = v6;
  v20 = v16;
  v21[1] = (id)a4;
  objc_msgSend(v14, "fetchRecordWithID:completionHandler:", v13, v18);

  v17 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v15, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

}

- (void)handleAccessoryKeyModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  int IsCode;
  void *v19;
  void *v20;
  double v21;
  double v22;
  os_log_t v23;
  NSObject *v24;
  double v25;
  dispatch_time_t v26;
  void *v27;
  id v28;
  id v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  os_log_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD block[5];
  id v41;
  unint64_t v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;

  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_37;
  if (a5 >= 5)
  {
    v10 = sub_1000681B8("MagicPairing");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10016D120();

    goto LABEL_37;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v12, "isEqualToString:", CKErrorDomain))
  {
    if (objc_msgSend(v8, "code") == (id)3 || objc_msgSend(v8, "code") == (id)4 || objc_msgSend(v8, "code") == (id)9)
    {

      goto LABEL_11;
    }
    v28 = objc_msgSend(v8, "code");

    if (v28 == (id)6)
    {
LABEL_11:
      v13 = sub_1000681B8("MagicPairing");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10016D180();
LABEL_36:

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v35, CFSTR("kUploadStatus"), 0));
      objc_msgSend(v34, "sendCloudKitMsg:args:", CFSTR("DeviceInfoUploadStatus"), v36);

      goto LABEL_37;
    }
  }
  else
  {

  }
  if (objc_msgSend(v8, "code") == (id)7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v16 = CKErrorRetryAfterKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CKErrorRetryAfterKey));
    if (v17)
    {

LABEL_21:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v16));
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      v23 = sub_1000681B8("MagicPairing");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = v22 + 10.0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v44 = v8;
        v45 = 2048;
        v46 = a5;
        v47 = 2048;
        v48 = (unint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "modify AccessoryBlob failed with error %@, retry count = %lu, retry time: %lu", buf, 0x20u);
      }

      v26 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006DCB4;
      block[3] = &unk_1001E3460;
      block[4] = self;
      v41 = v9;
      v42 = a5;
      dispatch_after(v26, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_37;
    }
    IsCode = CKErrorIsCode(v8, 15);

    if (IsCode)
      goto LABEL_21;
  }
  else if (CKErrorIsCode(v8, 15))
  {
    v16 = CKErrorRetryAfterKey;
    goto LABEL_21;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (!objc_msgSend(v27, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_34;
  }
  if (objc_msgSend(v8, "code") != (id)26)
  {
    v29 = objc_msgSend(v8, "code");

    if (v29 == (id)11)
      goto LABEL_31;
LABEL_34:
    v33 = sub_1000681B8("MagicPairing");
    v14 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10016D240();
    goto LABEL_36;
  }

LABEL_31:
  v30 = sub_1000681B8("MagicPairing");
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_10016D1E0();

  objc_initWeak((id *)buf, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit modifyOperationQueue](self, "modifyOperationQueue"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10006DDE0;
  v37[3] = &unk_1001E4768;
  objc_copyWeak(&v39, (id *)buf);
  v38 = v9;
  objc_msgSend(v32, "addOperationWithBlock:", v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
LABEL_37:

}

- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  dispatch_time_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  dispatch_semaphore_t v31;
  unint64_t v32;
  uint8_t buf[4];
  id v34;

  v6 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

    v8 = sub_1000681B8("MagicPairing");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accessory zone has been upgraded. Dont generate keys", buf, 2u);
      }
    }
    else
    {
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
        *(_DWORD *)buf = 138412290;
        v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " >>> writeAccessoryBlob Record Zone %@", buf, 0xCu);

      }
      v14 = objc_alloc((Class)CKRecordID);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
      v9 = objc_msgSend(v14, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v16);

      v17 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("AccessoryDatabase"), v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "encryptedValues"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v6, CFSTR("EncryptedAccessoryBlob"));

      v19 = sub_1000681B8("MagicPairing");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "writeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch:  encryptedBlob %@", buf, 0xCu);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      objc_msgSend(v21, "beginTransaction:", CFSTR("WriteAccessoryBlob"));

      v22 = dispatch_semaphore_create(0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006E15C;
      v28[3] = &unk_1001E47B8;
      v28[4] = self;
      v29 = v17;
      v32 = a4;
      v30 = v6;
      v31 = v22;
      v25 = v22;
      v26 = v17;
      objc_msgSend(v23, "saveRecordZone:completionHandler:", v24, v28);

      v27 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v25, v27);

    }
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
  NSObject *v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  dispatch_semaphore_t v19;
  uint8_t buf[4];
  void *v21;

  v3 = dispatch_semaphore_create(0);
  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " >>> deleteCloudKitAccessoryZone %@", buf, 0xCu);

  }
  v9 = objc_alloc((Class)CKRecordID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v12 = objc_msgSend(v9, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006EC0C;
  v18[3] = &unk_1001E47E0;
  v19 = v3;
  v14 = v3;
  objc_msgSend(v13, "deleteRecordWithID:completionHandler:", v12, v18);

  v15 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceManager"));
  objc_msgSend(v17, "deleteLegacyMagicPairingRecordsWithUserInitiated:completion:", 1, &stru_1001E4800);

}

- (void)createSubscritionForRecordType:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  os_log_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  __CFString *v31;
  MPCloudKit *v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = -[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded");
  v6 = sub_1000681B8("MagicPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setup manatee zone for push notifications", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "createSubscritionForRecordType: %@", buf, 0xCu);
  }

  if (-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("EncryptedMasterKeyBlob")))
  {
    v9 = objc_alloc((Class)CKRecordZoneSubscription);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v7 = objc_msgSend(v9, "initWithZoneID:", v11);

    v12 = objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingMasterSubscriptionID")));
    if (v12)
    {
      v13 = v12;
      v14 = sub_1000681B8("MagicPairing");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Master subscription already exists: %@", buf, 0xCu);
      }

      goto LABEL_22;
    }
    v19 = objc_alloc((Class)CKRecordZoneSubscription);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneID"));
    v22 = objc_msgSend(v19, "initWithZoneID:", v21);

    v23 = CFSTR("MagicCloudPairingMasterSubscriptionID");
    v7 = v22;
    goto LABEL_18;
  }
  if (!-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("EncryptedAccessoryBlob")))
  {
LABEL_20:
    v26 = sub_1000681B8("MagicPairing");
    v7 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v13 = objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    v27 = objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v13, "zoneID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneID"));
    *(_DWORD *)buf = 138412546;
    v34 = v27;
    v35 = 2112;
    v36 = v29;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to create zone subscription key %@ or Accessory %@", buf, 0x16u);

LABEL_22:
    goto LABEL_23;
  }
  v16 = objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingAccessorySubscriptionID")));
  if (!v16)
  {
    v24 = objc_alloc((Class)CKRecordZoneSubscription);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneID"));
    v7 = objc_msgSend(v24, "initWithZoneID:", v21);
    v23 = CFSTR("MagicCloudPairingAccessorySubscriptionID");
LABEL_18:

    if (v7)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10006F1F0;
      v30[3] = &unk_1001E4828;
      v31 = (__CFString *)v23;
      v32 = self;
      objc_msgSend(v25, "saveSubscription:completionHandler:", v7, v30);

      goto LABEL_23;
    }
    goto LABEL_20;
  }
  v7 = v16;
  v17 = sub_1000681B8("MagicPairing");
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Accessory subscription already exists: %@", buf, 0xCu);
  }

LABEL_23:
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
  MPCloudKit *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", v7));
  v9 = sub_1000681B8("MagicPairing");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Verify Fetch cached Subscription ID - %@ for record - %@", buf, 0x16u);
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
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found cached Subscription ID - %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", v7));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006F694;
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
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Subscription cannot be Fetched, create it...", buf, 2u);
    }

    -[MPCloudKit createSubscritionForRecordType:](self, "createSubscritionForRecordType:", v6);
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
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_1000681B8("MagicPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "verifyAndCacheSubscriptionID - %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006FA44;
  v9[3] = &unk_1001E4878;
  objc_copyWeak(&v11, (id *)buf);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "fetchSubscriptionWithID:completionHandler:", v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to delete Subscription for record type - %@ ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006FDC0;
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
  v25 = sub_10006C2BC;
  v26 = sub_10006C2CC;
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
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000704E8;
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
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, ">>>>> Using push environment %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)hexStringForData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned int v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v5 = (uint64_t)objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v3);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
  if (v5 >= 1)
  {
    v8 = v7;
    do
    {
      v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02X"), v9);
      --v5;
    }
    while (v5);
  }
  v10 = objc_msgSend(v4, "copy");

  return v10;
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enable Push Notification Updated for bundle ID: %@", (uint8_t *)&v11, 0xCu);
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

  if (v2)
  {
    v3 = sub_1000681B8("MagicPairing");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Master zone has been upgraded. Dont generate keys", v6, 2u);
    }

  }
  return v2 != 0;
}

- (void)markLegacyNonManateeContainerMigrated
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  CKDatabase *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  CKDatabase *v31;
  __int128 *v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 *p_buf;
  uint64_t *v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[2];
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " >>>markLegacyNonManateeContainerMigrated  Record Zone %@", (uint8_t *)&buf, 0xCu);

  }
  v8 = self->_cloudKitDatabase;
  v9 = objc_alloc((Class)CKRecordID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v12 = objc_msgSend(v9, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v11);

  v13 = objc_alloc((Class)CKRecordID);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID"));
  v16 = objc_msgSend(v13, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v15);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v49 = 0x3032000000;
  v50 = sub_10006C2BC;
  v51 = sub_10006C2CC;
  v52 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("MasterKey"), v12);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_10006C2BC;
  v45 = sub_10006C2CC;
  v46 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("AccessoryDatabase"), v16);
  v40 = -1;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v40, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "encryptedValues"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("EncryptedMasterKeyBlob"));

  v39 = -1;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v39, 4));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v42[5], "encryptedValues"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("EncryptedAccessoryBlob"));

  v21 = objc_alloc((Class)CKFetchRecordsOperation);
  v47[0] = v12;
  v47[1] = v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
  v23 = objc_msgSend(v21, "initWithRecordIDs:", v22);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100070CF0;
  v34[3] = &unk_1001E4918;
  v24 = v12;
  v35 = v24;
  p_buf = &buf;
  v25 = v16;
  v36 = v25;
  v38 = &v41;
  objc_msgSend(v23, "setPerRecordCompletionBlock:", v34);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100070F58;
  v28[3] = &unk_1001E4990;
  v32 = &buf;
  v28[4] = self;
  v26 = v24;
  v29 = v26;
  v33 = &v41;
  v27 = v25;
  v30 = v27;
  v31 = v8;
  objc_msgSend(v23, "setCompletionBlock:", v28);
  -[CKDatabase addOperation:](v8, "addOperation:", v23);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&buf, 8);

}

- (void)upgradeLegacyNonManateeContainerToManatee
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  os_log_t v6;
  NSObject *v7;
  CKDatabase *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  os_log_t v29;
  os_log_t v30;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  NSObject *v35;
  id v36;
  MPCloudKit *v37;
  void *v38;
  __int128 *v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 *p_buf;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[2];
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v29 = sub_1000681B8("MagicPairing");
    v8 = (CKDatabase *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
      sub_10016D7C0();
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "networkMonitor"));
    v5 = objc_msgSend(v4, "isNetworkUp");

    v6 = sub_1000681B8("MagicPairing");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (CKDatabase *)v7;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_DEFAULT, " >>>upgradeLegacyNonManateeContainerToManatee Record Zone %@", (uint8_t *)&buf, 0xCu);

      }
      v8 = self->_cloudKitDatabase;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cloudKitDatabase"));

      if (v13)
      {
        v14 = objc_alloc((Class)CKRecordID);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
        v17 = objc_msgSend(v14, "initWithRecordName:zoneID:", CFSTR("EncryptedMasterKeyBlob"), v16);

        v18 = objc_alloc((Class)CKRecordID);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
        v21 = objc_msgSend(v18, "initWithRecordName:zoneID:", CFSTR("EncryptedAccessoryBlob"), v20);

        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v50 = 0x3032000000;
        v51 = sub_10006C2BC;
        v52 = sub_10006C2CC;
        v53 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("MasterKey"), v17);
        v46[0] = 0;
        v46[1] = v46;
        v46[2] = 0x3032000000;
        v46[3] = sub_10006C2BC;
        v46[4] = sub_10006C2CC;
        v47 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("AccessoryDatabase"), v21);
        v22 = objc_alloc((Class)CKFetchRecordsOperation);
        v48[0] = v17;
        v48[1] = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
        v24 = objc_msgSend(v22, "initWithRecordIDs:", v23);

        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100071B48;
        v41[3] = &unk_1001E4918;
        v25 = v17;
        v42 = v25;
        p_buf = &buf;
        v26 = v21;
        v43 = v26;
        v45 = v46;
        objc_msgSend(v24, "setPerRecordCompletionBlock:", v41);
        v31 = _NSConcreteStackBlock;
        v32 = 3221225472;
        v33 = sub_100071DB0;
        v34 = &unk_1001E4A08;
        v39 = &buf;
        v40 = v46;
        v27 = v25;
        v35 = v27;
        v28 = v26;
        v36 = v28;
        v37 = self;
        v38 = v13;
        objc_msgSend(v24, "setCompletionBlock:", &v31);
        -[CKDatabase addOperation:](v8, "addOperation:", v24, v31, v32, v33, v34);

        _Block_object_dispose(v46, 8);
        _Block_object_dispose(&buf, 8);

      }
      else
      {
        v30 = sub_1000681B8("MagicPairing");
        v27 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_10016D7EC();
      }

    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_10016D818();
    }
  }

}

- (void)deleteLegacyMasterKey
{
  unsigned __int8 v3;
  os_log_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;

  v3 = -[MPCloudKit isAccountActive](self, "isAccountActive");
  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " >>>deleteLegacyMasterKey  Record Zone %@", buf, 0xCu);

    }
    v10 = objc_alloc((Class)CKRecordID);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
    v5 = objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("KeyBlob"), v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100072BA8;
    v14[3] = &unk_1001E47E0;
    v14[4] = self;
    objc_msgSend(v13, "deleteRecordWithID:completionHandler:", v5, v14);

  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No Active Account", buf, 2u);
  }

}

- (void)resetOldZones
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  os_log_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
    v42 = 138412290;
    v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, ">>> resetOldZones Key Record Zone %@", (uint8_t *)&v42, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  objc_msgSend(v8, "deleteRecordZoneWithID:completionHandler:", v10, &stru_1001E4A48);

  v11 = sub_1000681B8("MagicPairing");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
    v42 = 138412290;
    v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, ">>> resetOldZones Accessory Record Zone %@", (uint8_t *)&v42, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
  objc_msgSend(v16, "deleteRecordZoneWithID:completionHandler:", v18, &stru_1001E4A68);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
  if (v19)
  {
    v20 = sub_1000681B8("MagicPairing");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recordZoneBlob"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
      v42 = 138412290;
      v43 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, ">>> resetOldZones Key Record Zone %@", (uint8_t *)&v42, 0xCu);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cloudKitDatabase"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "recordZoneBlob"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneID"));
    objc_msgSend(v27, "deleteRecordZoneWithID:completionHandler:", v30, &stru_1001E4A88);

    v31 = sub_1000681B8("MagicPairing");
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "recordZoneBlob"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneName"));
      v42 = 138412290;
      v43 = v36;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, " >>> resetOldZones Accessory Record Zone %@", (uint8_t *)&v42, 0xCu);

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "cloudKitDatabase"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "recordZoneAccessoryDatabase"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "zoneID"));
    objc_msgSend(v38, "deleteRecordZoneWithID:completionHandler:", v41, &stru_1001E4AA8);

  }
}

- (NSString)cloudContainerIdentifier
{
  return (NSString *)CFSTR("com.apple.bluetooth");
}

- (OS_dispatch_queue)pushDelegateQueue
{
  void *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pushQueue](self, "pushQueue"));

  if (!v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.bluetooth.mpcloudkit.push", v5);
    -[MPCloudKit setPushQueue:](self, "setPushQueue:", v6);

  }
  return -[MPCloudKit pushQueue](self, "pushQueue");
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _QWORD v14[4];
  id v15;
  MPCloudKit *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    v5 = sub_1000681B8("MagicPairing");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "*****>>>> Push received for non-manatee but we have upgraded reset this container...", buf, 2u);
    }

    -[MPCloudKit markLegacyNonManateeContainerMigrated](self, "markLegacyNonManateeContainerMigrated");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKNotification notificationFromRemoteNotificationDictionary:](CKNotification, "notificationFromRemoteNotificationDictionary:", v7));
    v9 = sub_1000681B8("MagicPairing");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topic"));
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "***** APS Push received: %@ \n %@ \n", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerIdentifier"));
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.bluetooth"));

    if (v13)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100073640;
      v14[3] = &unk_1001E23E8;
      v15 = v8;
      v16 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    }
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
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received public token \"%@\" on connection", (uint8_t *)&v7, 0xCu);

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
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection", (uint8_t *)&v13, 0x20u);

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

- (BOOL)isOldContainerResetInProcess
{
  return self->_isOldContainerResetInProcess;
}

- (void)setIsOldContainerResetInProcess:(BOOL)a3
{
  self->_isOldContainerResetInProcess = a3;
}

- (BOOL)isWriteMasterKeysInProgress
{
  return self->_isWriteMasterKeysInProgress;
}

- (void)setIsWriteMasterKeysInProgress:(BOOL)a3
{
  self->_isWriteMasterKeysInProgress = a3;
}

- (BOOL)pushReceived
{
  return self->_pushReceived;
}

- (void)setPushReceived:(BOOL)a3
{
  self->_pushReceived = a3;
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
