@implementation ICMigrationController

+ (id)legacyAccountForPrimaryICloudAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyAccountContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyAccountUtilities legacyAccountForPrimaryICloudAccountWithContext:](ICLegacyAccountUtilities, "legacyAccountForPrimaryICloudAccountWithContext:", v2));

  return v3;
}

+ (id)legacyAccountContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteContext"));

  return v3;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class(ICMigrationController) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = kICDefaultsKeyDidMigrateLocalAccount;
    v5 = &__kCFBooleanFalse;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

+ (void)continueMigrationIfNecessary
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000893D4;
  block[3] = &unk_1005525E8;
  block[4] = a1;
  dispatch_async(v4, block);

}

+ (id)sharedController
{
  if (qword_1005DDE00 != -1)
    dispatch_once(&qword_1005DDE00, &stru_100552608);
  return (id)qword_1005DDDF8;
}

+ (BOOL)sharedControllerExists
{
  return qword_1005DDDF8 != 0;
}

- (ICMigrationController)init
{
  ICMigrationController *v2;
  id v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMigrationController;
  v2 = -[ICMigrationController init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    -[ICMigrationController setOperationQueue:](v2, "setOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController operationQueue](v2, "operationQueue"));
    objc_msgSend(v4, "setName:", CFSTR("com.apple.notes.migration-queue"));

    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[ICMigrationController setCurrentMigrationStateByAccountID:](v2, "setCurrentMigrationStateByAccountID:", v5);

    -[ICMigrationController resetRetryCounts](v2, "resetRetryCounts");
    -[ICMigrationController resetNotificationObservers](v2, "resetNotificationObservers");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  -[ICMigrationController stopRepeatingImportTimer](self, "stopRepeatingImportTimer");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v5.receiver = self;
  v5.super_class = (Class)ICMigrationController;
  -[ICMigrationController dealloc](&v5, "dealloc");
}

+ (BOOL)didMigrateLocalAccount
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", kICDefaultsKeyDidMigrateLocalAccount);

  return v3;
}

+ (void)setDidMigrateLocalAccount:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v3 = a3;
  if (objc_msgSend(a1, "didMigrateLocalAccount") != a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = ICMigrationStateWillChangeNotification;
    v13 = CFSTR("ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey");
    v14 = &__kCFBooleanTrue;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, 0, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "setBool:forKey:", v3, kICDefaultsKeyDidMigrateLocalAccount);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = ICMigrationStateDidChangeNotification;
    v11 = CFSTR("ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey");
    v12 = &__kCFBooleanTrue;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v9, 0, v10);

  }
}

+ (BOOL)didChooseToMigrateLocalAccount
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", kICDefaultsKeyDidChooseToMigrateLocalAccount);

  return v3;
}

+ (void)setDidChooseToMigrateLocalAccount:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  if (objc_msgSend(a1, "didChooseToMigrateLocalAccount") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "setBool:forKey:", v3, kICDefaultsKeyDidChooseToMigrateLocalAccount);

    v14 = ICLocalAccountDidChooseToMigrateKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    v15 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", ICLocalAccountDidChooseToMigrateNotification, a1, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100089C44;
    v12[3] = &unk_100550110;
    v13 = v10;
    v11 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v12);

  }
}

- (void)resetNotificationObservers
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = kReachabilityChangedNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "reachabilityChanged:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "migrationStateDidChange:", ICMigrationStateDidChangeNotification, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "accountsDidChange:", ICAccountsDidChangeNotification, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

}

- (void)migrationStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", ICMigrationStateChangeAccountID));

  v6 = objc_msgSend(v5, "length");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v5, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v8));

    v7 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  }

  if (objc_msgSend(v9, "didChooseToMigrate")
    && objc_msgSend((id)objc_opt_class(self), "currentMigrationStateForAccountID:", v5) <= 1)
  {
    v10 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1004088C4();

    -[ICMigrationController startMigrationForICloudAccountID:](self, "startMigrationForICloudAccountID:", v5);
  }

}

- (void)accountsDidChange:(id)a3
{
  NSObject *v4;

  v4 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1004088F0();

  -[ICMigrationController cancelAllOperationsWithCompletionHandler:](self, "cancelAllOperationsWithCompletionHandler:", 0);
}

+ (signed)currentMigrationStateForAccountID:(id)a3
{
  id v3;
  void *v4;
  signed __int16 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController sharedController](ICMigrationController, "sharedController"));
  v5 = (unsigned __int16)objc_msgSend(v4, "currentMigrationStateForAccountID:", v3);

  return v5;
}

+ (void)setCurrentMigrationState:(signed __int16)a3 forAccountID:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[ICMigrationController sharedController](ICMigrationController, "sharedController"));
  objc_msgSend(v6, "setCurrentMigrationState:forAccountID:", v4, v5);

}

- (signed)currentMigrationStateForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  signed __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceMigrationState deviceMigrationStateWithDeviceIdentifier:context:](ICDeviceMigrationState, "deviceMigrationStateWithDeviceIdentifier:context:", v4, v6));

  if (v7 && objc_msgSend(v7, "state"))
  {
    v8 = (unsigned __int16)objc_msgSend(v7, "state");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController currentMigrationStateByAccountID](self, "currentMigrationStateByAccountID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v4));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController currentMigrationStateByAccountID](self, "currentMigrationStateByAccountID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v4));
      v8 = (unsigned __int16)objc_msgSend(v12, "shortValue");

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)setCurrentMigrationState:(signed __int16)a3 forAccountID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  ICMigrationController *v37;
  ICMigrationController *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  void *v44;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v6, v8));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[ICDeviceMigrationState deviceMigrationStateWithDeviceIdentifier:context:](ICDeviceMigrationState, "deviceMigrationStateWithDeviceIdentifier:context:", v6, v8));
  if (objc_msgSend(v10, "state") == (_DWORD)v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController currentMigrationStateByAccountID](self, "currentMigrationStateByAccountID"));
    objc_msgSend(v11, "removeObjectForKey:", v6);

    goto LABEL_26;
  }
  v12 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "stringFromMigrationState:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138412290;
    v44 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting current migration state: %@", buf, 0xCu);

  }
  if (!v10 && v9)
    v10 = +[ICDeviceMigrationState newDeviceMigrationStateWithDeviceIdentifier:account:](ICDeviceMigrationState, "newDeviceMigrationStateWithDeviceIdentifier:account:", v6, v9);
  if (v10)
  {
    objc_msgSend(v10, "setState:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "setStateModificationDate:", v15);

    objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Set migration state"));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v4));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController currentMigrationStateByAccountID](self, "currentMigrationStateByAccountID"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);

  }
  +[ICNoteContext setLegacyNotesDisabled:](ICNoteContext, "setLegacyNotesDisabled:", 0);
  if ((_DWORD)v4 == 7)
  {
    if ((objc_msgSend(v9, "didFinishMigration") & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      v18 = 1;
      objc_msgSend(v9, "setDidFinishMigration:", 1);
      objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Set migration state"));
    }
  }
  else
  {
    v18 = 0;
    if ((int)v4 < 2)
      goto LABEL_18;
  }
  if ((objc_msgSend(v9, "didChooseToMigrate") & 1) != 0)
  {
LABEL_18:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v19, "addOrDeleteLocalAccountIfNecessary");

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v20, "save");
    goto LABEL_20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v22 = ICMigrationStateWillChangeNotification;
  v37 = self;
  v23 = ICMigrationStateChangeUserInitiated;
  v41 = ICMigrationStateChangeUserInitiated;
  v42 = &__kCFBooleanTrue;
  v18 = 1;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  objc_msgSend(v21, "postNotificationName:object:userInfo:", v22, 0, v24);

  objc_msgSend(v9, "setDidChooseToMigrate:", 1);
  objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Set migration state"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v25, "addOrDeleteLocalAccountIfNecessary");

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v26, "save");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v27 = ICMigrationStateDidChangeNotification;
  v39 = v23;
  self = v37;
  v40 = &__kCFBooleanTrue;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  objc_msgSend(v20, "postNotificationName:object:userInfo:", v27, 0, v28);

LABEL_20:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "primaryICloudACAccount"));

  if (v18 && v30)
  {
    v38 = self;
    v31 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      sub_10040891C();

    v32 = objc_msgSend(v9, "didChooseToMigrate");
    v33 = objc_msgSend(v9, "didFinishMigration");
    v34 = objc_msgSend(v9, "didMigrateOnMac");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "accountStore"));
    +[ICMigrationUtilities saveDidChooseToMigrate:didFinishMigration:didMigrateOnMac:toACAccount:inStore:completionHandler:](ICMigrationUtilities, "saveDidChooseToMigrate:didFinishMigration:didMigrateOnMac:toACAccount:inStore:completionHandler:", v32, v33, v34, v30, v35, 0);

    self = v38;
  }
  objc_msgSend((id)objc_opt_class(self), "pushMigrationStateToCloudForAccountID:", v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v36, "postNotificationName:object:", CFSTR("ICCurrentDeviceMigrationStateDidChange"), v10);

LABEL_26:
}

+ (id)stringFromMigrationState:(signed __int16)a3
{
  return +[ICDeviceMigrationState stringFromMigrationState:](ICDeviceMigrationState, "stringFromMigrationState:", a3);
}

+ (BOOL)shouldHideICloudIMAPAccount
{
  void *v2;
  unsigned __int8 v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", kICInternalSettingsShowICloudIMAPAccountDefaultKey);

  if ((v3 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v6));

    if ((objc_msgSend(v7, "didChooseToMigrate") & 1) == 0)
    {
      if (v7)
      {
        v4 = 0;
LABEL_10:

        return v4;
      }
      v8 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_100408948();

    }
    v4 = 1;
    goto LABEL_10;
  }
  return 0;
}

- (void)startMigrationForICloudAccountID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "currentMigrationStateForAccountID:", v4);
  v6 = os_log_create("com.apple.notes", "Migration");
  v7 = v6;
  if (v5 < 2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100408974();
  }
  else
  {
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend((id)objc_opt_class(self), "stringFromMigrationState:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v16 = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting migration for iCloud account, but the current state is (%@)", (uint8_t *)&v16, 0xCu);

    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v12));

  if (v13)
  {
    v14 = 1;
    if ((objc_msgSend(v13, "hasAnyCustomFoldersIncludingSystem:", 1) & 1) == 0)
      v14 = objc_msgSend(v13, "visibleNotesIncludingTrashCount") != 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
  +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", v15, CFSTR("LocalNotes"));

  objc_msgSend((id)objc_opt_class(self), "setCurrentMigrationState:forAccountID:", 2, v4);
  -[ICMigrationController continueMigrationForICloudAccountID:](self, "continueMigrationForICloudAccountID:", v4);

}

- (void)continueMigrationForICloudAccountID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1004089CC();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iCloudACAccountWithIdentifier:", v4));

  if (v7
    && objc_msgSend(v7, "isEnabledForDataclass:", ACAccountDataclassNotes)
    && (objc_msgSend(v7, "ic_hasICloudEmailAddress") & 1) == 0)
  {
    v11 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trying to continue migration, but there is no iCloud email address. Finishing now.", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(self), "setCurrentMigrationState:forAccountID:", 7, v4);
  }
  else
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (!v9)
    {
      v10 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No legacy account when continuing migration", buf, 2u);
      }

    }
  }
  v12 = objc_msgSend((id)objc_opt_class(self), "currentMigrationStateForAccountID:", v4);
  switch((int)v12)
  {
    case 0:
    case 1:
    case 7:
      v13 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend((id)objc_opt_class(self), "stringFromMigrationState:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No action to perform for migration state (%@)", buf, 0xCu);

      }
      goto LABEL_20;
    case 2:
    case 3:
    case 4:
      v16 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_1004089A0();

      v13 = objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext notesZoneID](ICCloudContext, "notesZoneID"));
      v21 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10008AD0C;
      v19[3] = &unk_100552630;
      v19[4] = self;
      v20 = v4;
      -[NSObject fetchRecordZoneChangesForZoneIDs:accountID:reason:completionHandler:](v13, "fetchRecordZoneChangesForZoneIDs:accountID:reason:completionHandler:", v18, v20, CFSTR("StartingMigration"), v19);

LABEL_20:
      break;
    case 5:
      -[ICMigrationController performFinalImportForICloudAccountID:](self, "performFinalImportForICloudAccountID:", v4);
      break;
    case 6:
      -[ICMigrationController performFinalPushToCloudKitForAccountID:](self, "performFinalPushToCloudKitForAccountID:", v4);
      break;
    default:
      break;
  }

}

+ (void)migrateLocalAccountIfNecessary
{
  NSObject *v3;
  os_log_t v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t v21[16];
  _QWORD v22[5];
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;

  if ((objc_msgSend(a1, "didChooseToMigrateLocalAccount") & 1) != 0)
  {
    if (objc_msgSend(a1, "didMigrateLocalAccount"))
    {
      v3 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        sub_100408A24();
    }
    else
    {
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyLocalAccount"));
      v4 = os_log_create("com.apple.notes", "Migration");
      v5 = v4;
      if (v3)
      {
        v6 = v4;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          sub_100408A7C(a1, v3, v6);

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
        v9 = objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v8));

        if (v9)
          goto LABEL_12;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v11 = ICMigrationStateWillChangeNotification;
        v25 = CFSTR("ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey");
        v26 = &__kCFBooleanTrue;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
        objc_msgSend(v10, "postNotificationName:object:userInfo:", v11, 0, v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "managedObjectContext"));
        v9 = +[ICAccount newLocalAccountInContext:](ICAccount, "newLocalAccountInContext:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        objc_msgSend(v15, "save");

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v17 = ICMigrationStateDidChangeNotification;
        v23 = CFSTR("ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey");
        v24 = &__kCFBooleanTrue;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v16, "postNotificationName:object:userInfo:", v17, 0, v18);

        if (v9)
        {
LABEL_12:
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedController"));
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10008B198;
          v22[3] = &unk_100552650;
          v22[4] = a1;
          v20 = objc_msgSend(v19, "importNotesFromLegacyAccount:toAccount:renameFolders:isPrimaryAccount:withCompletionHandler:", v3, v9, 0, 1, v22);

        }
        else
        {
          v9 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to import the local account because we couldn't create a modern local account", v21, 2u);
          }
        }

      }
      else
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
          sub_100408A50();

        objc_msgSend(a1, "setDidMigrateLocalAccount:", 1);
      }
    }
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_100408B74();
  }

}

+ (void)upgradeEmptyLocalLegacyAccountIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  if ((objc_msgSend(a1, "didChooseToMigrateLocalAccount") & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyAccountContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyLocalAccount"));
    v4 = ICProtocolCast(&OBJC_PROTOCOL___ICLegacyAccount, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (!v5
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectID")),
          v7 = objc_msgSend(v8, "nonEmptyNoteExistsForLegacyAccountWithObjectID:", v6),
          v6,
          (v7 & 1) == 0))
    {
      objc_msgSend(a1, "setDidChooseToMigrateLocalAccount:", 1);
      objc_msgSend(a1, "migrateLocalAccountIfNecessary");
    }

  }
}

- (void)performFinalImportForICloudAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iCloudACAccountWithIdentifier:", v4));

  v7 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_create("com.apple.notes", "Migration");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      sub_100408BF8();

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008B484;
    v12[3] = &unk_100552678;
    v12[4] = self;
    v13 = v4;
    v11 = -[ICMigrationController importLegacyNotesForICloudAccountID:withCompletionHandler:](self, "importLegacyNotesForICloudAccountID:withCompletionHandler:", v13, v12);

  }
  else
  {
    if (v10)
      sub_100408BCC();

    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "continueMigrationForICloudAccountID:", v4);
  }

}

- (id)importLegacyNotesForICloudAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iCloudACAccountWithIdentifier:", v6));

  v10 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_create("com.apple.notes", "Migration");
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
      sub_100408CA8();

    v14 = objc_msgSend((id)objc_opt_class(self), "cloudKitAccountForIdentifier:", v6);
    v12 = objc_claimAutoreleasedReturnValue(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController importNotesFromLegacyAccount:toAccount:renameFolders:isPrimaryAccount:withCompletionHandler:](self, "importNotesFromLegacyAccount:toAccount:renameFolders:isPrimaryAccount:withCompletionHandler:", v11, v12, 0, 1, v7));
  }
  else
  {
    if (v13)
      sub_100408C7C();
    v15 = 0;
  }

  return v15;
}

- (id)importNotesFromLegacyAccount:(id)a3 toAccount:(id)a4 renameFolders:(BOOL)a5 isPrimaryAccount:(BOOL)a6 withCompletionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  ICImportLegacyAccountOperation *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  ICImportLegacyAccountOperation *v26;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id location;
  _BYTE v41[128];

  v8 = a6;
  v9 = a5;
  v11 = a3;
  v12 = a4;
  v29 = a7;
  v30 = v12;
  v13 = 0;
  v31 = v11;
  if (v11 && v12)
  {
    v13 = -[ICImportLegacyAccountOperation initWithLegacyAccount:destinationAccount:renameFolders:]([ICImportLegacyAccountOperation alloc], "initWithLegacyAccount:destinationAccount:renameFolders:", v11, v12, v9);
    -[ICImportLegacyAccountOperation setCopyingPrimaryAccount:](v13, "setCopyingPrimaryAccount:", v8);
    if (v13)
    {
      objc_initWeak(&location, v13);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10008B910;
      v36[3] = &unk_1005526C8;
      objc_copyWeak(&v39, &location);
      v38 = v29;
      v14 = v11;
      v37 = v14;
      -[ICImportLegacyAccountOperation setCompletionBlock:](v13, "setCompletionBlock:", v36);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController operationQueue](self, "operationQueue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "operations"));
      v17 = objc_msgSend(v16, "copy");

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "legacyAccountObjectID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
            v24 = objc_msgSend(v22, "isEqual:", v23);

            if (v24)
            {
              -[ICImportLegacyAccountOperation addDependency:](v13, "addDependency:", v21);
              objc_msgSend(v21, "cancel");
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v18);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController operationQueue](self, "operationQueue"));
      objc_msgSend(v25, "addOperation:", v13);

      v26 = v13;
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }

  }
  return v13;
}

- (void)cancelAllOperationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100408DC4();

  -[ICMigrationController resetNotificationObservers](self, "resetNotificationObservers");
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", objc_opt_class(self));
  -[ICMigrationController stopRepeatingImportTimer](self, "stopRepeatingImportTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController operationQueue](self, "operationQueue"));
  objc_msgSend(v6, "cancelAllOperations");

  global_queue = dispatch_get_global_queue(-2, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008BB68;
  v10[3] = &unk_100550160;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)startRepeatingImportTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BC80;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopRepeatingImportTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController repeatingImportTimer](self, "repeatingImportTimer"));
  objc_msgSend(v3, "invalidate");

  -[ICMigrationController setRepeatingImportTimer:](self, "setRepeatingImportTimer:", 0);
}

- (void)startICloudImportOperationIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  ICMigrationController *v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint8_t v47;
  char v48[15];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceMigrationState deviceMigrationStatesByAccountIDInContext:](ICDeviceMigrationState, "deviceMigrationStatesByAccountIDInContext:", v4));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (!v7)
  {

LABEL_29:
    -[ICMigrationController stopRepeatingImportTimer](self, "stopRepeatingImportTimer");
    goto LABEL_30;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v54;
  v39 = v4;
  v42 = v5;
  v43 = self;
  v40 = *(_QWORD *)v54;
  v41 = v6;
  do
  {
    v11 = 0;
    v44 = v8;
    do
    {
      if (*(_QWORD *)v54 != v10)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v12, v39));
      v14 = objc_msgSend(v13, "shortValue");

      if (v14 - 3 > 1)
      {
        v18 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v12;
          v32 = (void *)objc_opt_class(self);
          v33 = objc_msgSend(v32, "stringFromMigrationState:", objc_msgSend((id)objc_opt_class(self), "currentMigrationStateForAccountID:", v31));
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = 138412290;
          v58 = v34;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The timer fired to start another iCloud import operation, but we're not in the right state (%@)", buf, 0xCu);

        }
        v35 = v18;
      }
      else
      {
        v46 = v11;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "iCloudACAccountWithIdentifier:", v12));

        v45 = v16;
        v17 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController operationQueue](self, "operationQueue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "operations"));
        v21 = objc_msgSend(v20, "copy");

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v50;
LABEL_9:
          v25 = 0;
          while (1)
          {
            v26 = v12;
            if (*(_QWORD *)v50 != v24)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "legacyAccountObjectID"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectID](v18, "objectID"));
            v30 = objc_msgSend(v28, "isEqual:", v29);

            if ((v30 & 1) != 0)
              break;
            v25 = (char *)v25 + 1;
            v12 = v26;
            if (v23 == v25)
            {
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
              if (v23)
                goto LABEL_9;
              goto LABEL_15;
            }
          }
          v36 = v27;

          v5 = v42;
          self = v43;
          v10 = v40;
          v6 = v41;
          v8 = v44;
          v12 = v26;
          v11 = v46;
          if (v36)
            goto LABEL_23;
        }
        else
        {
LABEL_15:

          v5 = v42;
          self = v43;
          v10 = v40;
          v6 = v41;
          v8 = v44;
          v11 = v46;
        }
        v37 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          sub_100408DF0(&v47, v48, v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController importLegacyNotesForICloudAccountID:withCompletionHandler:](self, "importLegacyNotesForICloudAccountID:withCompletionHandler:", v12, 0));
        objc_msgSend(v38, "setRandomizeImportOrder:", 1);

        v36 = 0;
LABEL_23:

        v9 = 1;
        v35 = v45;
      }

      v11 = (char *)v11 + 1;
    }
    while (v11 != v8);
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  }
  while (v8);

  v4 = v39;
  if ((v9 & 1) == 0)
    goto LABEL_29;
LABEL_30:

}

- (void)performFinalPushToCloudKitForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iCloudACAccountWithIdentifier:", v4));

  v7 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_create("com.apple.notes", "Migration");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      sub_100408E50();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008C2DC;
    v12[3] = &unk_100552630;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "syncWithReason:completionHandler:", CFSTR("FinishingMigration"), v12);

  }
  else
  {
    if (v10)
      sub_100408E24();

    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "continueMigrationForICloudAccountID:", v4);
  }

}

+ (void)pushMigrationStateToCloudForAccountID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v3, v5));

  if (!v6)
  {
    v11 = os_log_create("com.apple.notes", "Migration");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = "Trying to push migration state, but we don't have a CloudKit ICAccount";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_14;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[ICDeviceMigrationState currentDeviceMigrationStateForAccount:](ICDeviceMigrationState, "currentDeviceMigrationStateForAccount:", v6));
  if (!v7)
  {
    v11 = os_log_create("com.apple.notes", "Migration");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = "Trying to push migration state, but we don't have a device migration state";
    goto LABEL_9;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008C6CC;
  v21[3] = &unk_100550020;
  v10 = v6;
  v22 = v10;
  v11 = v8;
  v23 = v11;
  v12 = v9;
  v24 = v12;
  v13 = objc_retainBlock(v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userRecordName"));

  if (v14)
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }
  else
  {
    v16 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No user record name when changing migration state. Fetching now.", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008CA8C;
    v18[3] = &unk_100552710;
    v19 = v10;
    v20 = v13;
    objc_msgSend(v12, "fetchUserRecordWithAccountID:completionHandler:", v17, v18);

  }
LABEL_14:

}

+ (id)legacyAccountsBeingCopied
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  if (objc_msgSend(a1, "sharedControllerExists"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyAccountObjectIDsBeingCopied"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v20;
      *(_QWORD *)&v7 = 138412546;
      v17 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyAccountContext", v17));
          v18 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "existingObjectWithID:error:", v11, &v18));
          v14 = v18;

          if (v14)
          {
            v15 = os_log_create("com.apple.notes", "Migration");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v24 = v11;
              v25 = 2112;
              v26 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error fetching account being copied (%@): %@", buf, 0x16u);
            }

          }
          if (v13)
            objc_msgSend(v3, "addObject:", v13);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v8);
    }

  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return v3;
}

- (id)legacyAccountObjectIDsBeingCopied
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForPrimaryICloudAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(self), "legacyLocalAccount");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController operationQueue](self, "operationQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operations"));
  v8 = objc_msgSend(v7, "copy");

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "legacyAccountObjectID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
        if (objc_msgSend(v14, "isEqual:", v15))
        {

        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "legacyAccountObjectID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectID"));
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if ((v18 & 1) != 0)
            continue;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "legacyAccountObjectID"));
          objc_msgSend(v21, "addObject:", v14);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  v19 = objc_msgSend(v21, "copy");
  return v19;
}

- (void)copyNotesFromLegacyAccount:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[24];

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10008D1D4;
  v18 = sub_10008D1E4;
  v8 = objc_msgSend((id)objc_opt_class(self), "ensureLegacyAccountIsValid:", v6);
  v19 = (id)objc_claimAutoreleasedReturnValue(v8);
  v9 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15[5], "objectIdentifier"));
    sub_100408F68(v10, (uint64_t)v20, v9);
  }

  v11 = v15[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008D1EC;
  v13[3] = &unk_100552738;
  v13[4] = self;
  v13[5] = &v14;
  v12 = -[ICMigrationController importNotesFromLegacyAccount:toAccount:renameFolders:isPrimaryAccount:withCompletionHandler:](self, "importNotesFromLegacyAccount:toAccount:renameFolders:isPrimaryAccount:withCompletionHandler:", v11, v7, 1, 0, v13);
  _Block_object_dispose(&v14, 8);

}

+ (id)ensureLegacyAccountIsValid:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectID"));
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  v7 = objc_opt_class(NSManagedObject);
  v8 = ICCheckedDynamicCast(v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "isDeleted");

  if (!v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));

    if (v14)
    {
      v12 = v4;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "noteContext"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectWithID:", v18));

    }
  }
  else
  {
LABEL_4:
    v11 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trying to ensure a legacy account is valid, but it's not", v19, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)reachabilityChanged:(id)a3
{
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = -[ICMigrationController isInternetReachable](self, "isInternetReachable", a3);
  v5 = os_log_create("com.apple.notes", "Migration");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      sub_100409038();

    -[ICMigrationController resetRetryCounts](self, "resetRetryCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshotManagedObjectContext"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceMigrationState deviceMigrationStatesByAccountIDInContext:](ICDeviceMigrationState, "deviceMigrationStatesByAccountIDInContext:", v8));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v15));
          v17 = objc_msgSend(v16, "shortValue");

          if (v17 - 2 <= 4)
            -[ICMigrationController continueMigrationForICloudAccountID:](self, "continueMigrationForICloudAccountID:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    if (v6)
      sub_100409064();

    -[ICMigrationController stopRepeatingImportTimer](self, "stopRepeatingImportTimer");
  }
}

- (BOOL)isInternetReachable
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
  v3 = objc_msgSend(v2, "currentReachabilityStatus");

  return v3 != 0;
}

- (void)retrySelector:(SEL)a3 accountID:(id)a4
{
  id v6;
  unint64_t v7;
  double v8;
  double v9;
  NSObject *v10;

  v6 = a4;
  v7 = -[ICMigrationController numberOfRetriesForSelector:accountID:](self, "numberOfRetriesForSelector:accountID:", a3, v6);
  -[ICMigrationController setNumberOfRetries:forSelector:accountID:](self, "setNumberOfRetries:forSelector:accountID:", v7 + 1, a3, v6);
  v8 = pow(3.0, (double)v7);
  if (v8 <= 300.0)
    v9 = v8;
  else
    v9 = 300.0;
  v10 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_100409090(a3, v10, v9);

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a3, v6);
  -[ICMigrationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a3, v6, v9);

}

- (void)clearRetryCountForSelector:(SEL)a3 accountID:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[ICMigrationController numberOfRetriesBySelector](self, "numberOfRetriesBySelector"));
  v7 = NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));
  objc_msgSend(v9, "removeObjectForKey:", v6);

}

- (void)resetRetryCounts
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  -[ICMigrationController setNumberOfRetriesBySelector:](self, "setNumberOfRetriesBySelector:", v3);

}

- (unint64_t)numberOfRetriesForSelector:(SEL)a3 accountID:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController numberOfRetriesBySelector](self, "numberOfRetriesBySelector"));
  v8 = NSStringFromSelector(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  return (unint64_t)v12;
}

- (void)setNumberOfRetries:(unint64_t)a3 forSelector:(SEL)a4 accountID:(id)a5
{
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController numberOfRetriesBySelector](self, "numberOfRetriesBySelector"));
  v10 = NSStringFromSelector(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v11));

  if (!v16)
  {
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationController numberOfRetriesBySelector](self, "numberOfRetriesBySelector"));
    v13 = NSStringFromSelector(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v8);

}

+ (id)legacyAccountForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyAccountContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyAccountUtilities accountForAccountIdentifier:context:](ICLegacyAccountUtilities, "accountForAccountIdentifier:context:", v4, v5));

  return v6;
}

+ (id)legacyAccountForICloudACAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_10008D1D4;
    v16 = sub_10008D1E4;
    v17 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyAccountContext"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10008DB8C;
    v8[3] = &unk_100552760;
    v10 = &v12;
    v9 = v4;
    v11 = a1;
    objc_msgSend(v5, "performBlockAndWait:", v8);

    v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)legacyAccountNameForPrimaryICloudAccount
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryICloudACAccount"));

  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  if (!-[__CFString length](v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "legacyAccountForPrimaryICloudAccount"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));

    v5 = (__CFString *)v7;
  }
  if (v5)
    v8 = v5;
  else
    v8 = &stru_1005704B8;
  v9 = v8;

  return v9;
}

+ (id)cloudKitAccountForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountStore"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountWithIdentifier:", v3));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentAccountIdentifier"));
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v3;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v10, v12));

  return v13;
}

- (void)disableNotesForACAccount:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100409130(v5);

  objc_msgSend(v5, "setEnabled:forDataclass:", 0, ACAccountDataclassNotes);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008DE88;
  v9[3] = &unk_100551C90;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "saveAccount:withCompletionHandler:", v8, v9);

}

- (void)handleDarwinNotificationName:(id)a3
{
  __CFString *v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  __int16 v36[8];
  uint8_t v37[2];
  uint8_t buf[16];
  __int16 v39;

  v4 = (__CFString *)a3;
  v5 = (char *)-[__CFString rangeOfString:](v4, "rangeOfString:", CFSTR("-"));
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v4, "substringFromIndex:", &v5[v6]));
    v8 = objc_opt_class(NoteAccountObject);
    v9 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForAccountIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = ICCheckedDynamicCast(v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountStore"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountWithIdentifier:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parentAccountIdentifier"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
    if (!v12)
    {
      v23 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        sub_10040932C();

      goto LABEL_34;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountFolderHierarchySyncCompleteNotification-"), "stringByAppendingString:", v7));
    v19 = -[__CFString isEqualToString:](v4, "isEqualToString:", v18);

    if (v19)
    {
      v20 = -[ICMigrationController isInternetReachable](self, "isInternetReachable");
      v21 = os_log_create("com.apple.notes", "Migration");
      v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          sub_100409358();

        -[ICMigrationController clearRetryCountForSelector:accountID:](self, "clearRetryCountForSelector:accountID:", "refreshFolderListForICloudAccountID:", v16);
        objc_msgSend((id)objc_opt_class(self), "setCurrentMigrationState:forAccountID:", 4, v16);
        -[ICMigrationController refreshFolderContentsForICloudAccountID:](self, "refreshFolderContentsForICloudAccountID:", v16);
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      v39 = 0;
      v27 = "Received a legacy folder hierarchy sync complete notification, but we're not connected to the internet.";
      v28 = (uint8_t *)&v39;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountFolderHierarchySyncFailedNotification-"), "stringByAppendingString:", v7));
      v25 = -[__CFString isEqualToString:](v4, "isEqualToString:", v24);

      if (v25)
      {
        v26 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to refresh legacy folder list for iCloud account", buf, 2u);
        }

        if (-[ICMigrationController isInternetReachable](self, "isInternetReachable"))
          -[ICMigrationController retryRefreshFolderListForICloudAccountID:](self, "retryRefreshFolderListForICloudAccountID:", v16);
        goto LABEL_34;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountContentSyncCompleteNotification-"), "stringByAppendingString:", v7));
      v30 = -[__CFString isEqualToString:](v4, "isEqualToString:", v29);

      if (!v30)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountContentSyncFailedNotification-"), "stringByAppendingString:", v7));
        v34 = -[__CFString isEqualToString:](v4, "isEqualToString:", v33);

        if (v34)
        {
          v35 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to refresh legacy content for iCloud account", (uint8_t *)v36, 2u);
          }

          if (-[ICMigrationController isInternetReachable](self, "isInternetReachable"))
            -[ICMigrationController retryRefreshFolderContentsForICloudAccountID:](self, "retryRefreshFolderContentsForICloudAccountID:", v16);
        }
        goto LABEL_34;
      }
      v31 = -[ICMigrationController isInternetReachable](self, "isInternetReachable");
      v32 = os_log_create("com.apple.notes", "Migration");
      v22 = v32;
      if (v31)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          sub_100409384();

        -[ICMigrationController clearRetryCountForSelector:accountID:](self, "clearRetryCountForSelector:accountID:", "refreshFolderContentsForICloudAccountID:", v16);
        objc_msgSend((id)objc_opt_class(self), "setCurrentMigrationState:forAccountID:", 5, v16);
        -[ICMigrationController stopRepeatingImportTimer](self, "stopRepeatingImportTimer");
        -[ICMigrationController performFinalImportForICloudAccountID:](self, "performFinalImportForICloudAccountID:", v16);
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_WORD *)v37 = 0;
      v27 = "Received a legacy content sync complete notification, but we're not connected to the internet. Something is wrong.";
      v28 = v37;
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v27, v28, 2u);
    goto LABEL_33;
  }
  v7 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1004092C8();
LABEL_35:

}

+ (id)legacyLocalAccount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localAccount"));

  return v4;
}

- (void)performFinalRefreshForICloudAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iCloudACAccountWithIdentifier:", v4));

  v7 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = -[ICMigrationController isInternetReachable](self, "isInternetReachable");
    v10 = os_log_create("com.apple.notes", "Migration");
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if ((v9 & 1) != 0)
    {
      if (v11)
        sub_1004093DC();

      v12 = objc_msgSend((id)objc_opt_class(self), "currentMigrationStateForAccountID:", v4);
      switch((int)v12)
      {
        case 0:
        case 1:
        case 5:
        case 6:
        case 7:
          v10 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v13 = objc_msgSend((id)objc_opt_class(self), "stringFromMigrationState:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            v16 = 138412290;
            v17 = v14;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trying to perform the final refresh for the iCloud account, but our migration state is (%@)", (uint8_t *)&v16, 0xCu);

          }
          goto LABEL_14;
        case 2:
          objc_msgSend((id)objc_opt_class(self), "setCurrentMigrationState:forAccountID:", 3, v4);
          goto LABEL_17;
        case 3:
LABEL_17:
          -[ICMigrationController refreshFolderListForICloudAccountID:](self, "refreshFolderListForICloudAccountID:", v4);
          break;
        case 4:
          -[ICMigrationController refreshFolderContentsForICloudAccountID:](self, "refreshFolderContentsForICloudAccountID:", v4);
          break;
        default:
          break;
      }
    }
    else
    {
      if (v11)
        sub_100409408();
LABEL_14:

    }
  }
  else
  {
    v15 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1004093B0();

    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "continueMigrationForICloudAccountID:", v4);
  }

}

- (void)refreshFolderListForICloudAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v14;
  __CFNotificationCenter *v15;
  __CFString *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v22[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iCloudACAccountWithIdentifier:", v4));

  v7 = objc_opt_class(NoteAccountObject);
  v8 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = ICCheckedDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountIdentifier"));
  -[ICMigrationController resetNotificationObservers](self, "resetNotificationObservers");
  if (v12)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountFolderHierarchySyncCompleteNotification-"), "stringByAppendingString:", v12));
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10008E8C8, v14, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountFolderHierarchySyncFailedNotification-"), "stringByAppendingString:", v12));
    CFNotificationCenterAddObserver(v15, self, (CFNotificationCallback)sub_10008E8C8, v16, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v17 = objc_msgSend(sub_10008E8D0(), "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    LOBYTE(v16) = objc_msgSend(v18, "updateFolderListForAccountID:andDataclasses:isUserRequested:", v12, 32, 1);

    v19 = os_log_create("com.apple.notes", "Migration");
    v20 = v19;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_100409460();

    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to refresh folder list from DataAccess iCloud account. DataAccess returned NO.", v22, 2u);
      }

      -[ICMigrationController retryRefreshFolderListForICloudAccountID:](self, "retryRefreshFolderListForICloudAccountID:", v4);
    }
  }
  else
  {
    v21 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_100409434();

    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "continueMigrationForICloudAccountID:", v4);
  }

}

- (void)retryRefreshFolderListForICloudAccountID:(id)a3
{
  -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "refreshFolderListForICloudAccountID:", a3);
}

- (void)refreshFolderContentsForICloudAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v14;
  __CFNotificationCenter *v15;
  __CFString *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v22[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iCloudACAccountWithIdentifier:", v4));

  v7 = objc_opt_class(NoteAccountObject);
  v8 = objc_msgSend((id)objc_opt_class(self), "legacyAccountForICloudACAccount:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = ICCheckedDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountIdentifier"));
  -[ICMigrationController resetNotificationObservers](self, "resetNotificationObservers");
  if (v11)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountContentSyncCompleteNotification-"), "stringByAppendingString:", v12));
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10008E8C8, v14, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IMAPNotesAccountContentSyncFailedNotification-"), "stringByAppendingString:", v12));
    CFNotificationCenterAddObserver(v15, self, (CFNotificationCallback)sub_10008E8C8, v16, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v17 = objc_msgSend(sub_10008E8D0(), "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    LOBYTE(v16) = objc_msgSend(v18, "updateContentsOfAllFoldersForAccountID:andDataclasses:isUserRequested:", v12, 32, 1);

    v19 = os_log_create("com.apple.notes", "Migration");
    v20 = v19;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_1004094B8();

    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to refresh folder contents from DataAccess iCloud account. DataAccess returned NO.", v22, 2u);
      }

      -[ICMigrationController retryRefreshFolderContentsForICloudAccountID:](self, "retryRefreshFolderContentsForICloudAccountID:", v4);
    }
  }
  else
  {
    v21 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_10040948C();

    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "continueMigrationForICloudAccountID:", v4);
  }

}

- (void)retryRefreshFolderContentsForICloudAccountID:(id)a3
{
  -[ICMigrationController retrySelector:accountID:](self, "retrySelector:accountID:", "refreshFolderContentsForICloudAccountID:", a3);
}

- (void)disableLegacyAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountWithIdentifier:", v5));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayAccount"));
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  if (v10)
    -[ICMigrationController disableNotesForACAccount:inStore:](self, "disableNotesForACAccount:inStore:", v10, v11);

}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Cancel Migration"), &stru_100552780);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008EDD0;
  v6[3] = &unk_1005525E8;
  v6[4] = v5;
  -[ICMigrationController cancelAllOperationsWithCompletionHandler:](self, "cancelAllOperationsWithCompletionHandler:", v6);
}

- (void)applicationWillEnterForeground:(id)a3
{
  objc_msgSend((id)objc_opt_class(self), "performSelector:withObject:afterDelay:", "continueMigrationIfNecessary", 0, 3.0);
}

- (NSMutableDictionary)currentMigrationStateByAccountID
{
  return self->_currentMigrationStateByAccountID;
}

- (void)setCurrentMigrationStateByAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_currentMigrationStateByAccountID, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSMutableDictionary)numberOfRetriesBySelector
{
  return self->_numberOfRetriesBySelector;
}

- (void)setNumberOfRetriesBySelector:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfRetriesBySelector, a3);
}

- (NSTimer)repeatingImportTimer
{
  return self->_repeatingImportTimer;
}

- (void)setRepeatingImportTimer:(id)a3
{
  objc_storeStrong((id *)&self->_repeatingImportTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatingImportTimer, 0);
  objc_storeStrong((id *)&self->_numberOfRetriesBySelector, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_currentMigrationStateByAccountID, 0);
}

@end
