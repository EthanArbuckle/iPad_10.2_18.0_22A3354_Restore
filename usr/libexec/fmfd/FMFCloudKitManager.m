@implementation FMFCloudKitManager

- (NSString)cloudKitPushTopic
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.icloud-container.%@"), v3));
  return (NSString *)v4;
}

+ (id)sharedInstance
{
  if (qword_1000B36B8 != -1)
    dispatch_once(&qword_1000B36B8, &stru_100099478);
  return (id)qword_1000B36B0;
}

- (FMFCloudKitManager)init
{
  char *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  FMFCloudKitCache *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMFCloudKitManager;
  v2 = -[FMFCloudKitManager init](&v13, "init");
  if (v2)
  {
    v3 = (void *)objc_opt_new(CKContainerOptions);
    objc_msgSend(v3, "setUseZoneWidePCS:", 1);
    v4 = objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", CFSTR("com.apple.findmy.container"), 1);
    v5 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v4, v3);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = dispatch_queue_create("com.apple.icloud.fmfd.cloudkitManager.retryOperationQueue", 0);
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "handleAccountChangedNotification", CKAccountChangedNotification, 0);

    v10 = objc_alloc_init(FMFCloudKitCache);
    v11 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v10;

    v2[8] = 0;
    *(_OWORD *)(v2 + 40) = xmmword_100076610;
    if ((objc_msgSend(v2, "isAccountBootstrapped") & 1) == 0)
      objc_msgSend(v2, "bootstrapAccountWithReason:", 0);
    objc_msgSend(v2, "retryInviteUnacceptedCKShares");

  }
  return (FMFCloudKitManager *)v2;
}

- (BOOL)isAccountBootstrapped
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;

  v3 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("Fence-DUMMY-BOOT-STRAP"), CKCurrentUserDefaultName);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverChangeTokenForZoneWithID:inDatabaseWithScope:", v3, 2));

  if (v5)
  {
    v6 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[FMFCloudKitManager isAccountBootstrapped]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: no-op, bootstrap zone already exists in privateCloudDatabase", (uint8_t *)&v9, 0xCu);
    }

  }
  return v5 != 0;
}

- (void)bootstrapAccountWithReason:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  dispatch_time_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[6];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;

  if (!-[FMFCloudKitManager boostrapScheduled](self, "boostrapScheduled"))
  {
    -[FMFCloudKitManager bootstrapRetryInterval](self, "bootstrapRetryInterval");
    -[FMFCloudKitManager setBootstrapRetryInterval:](self, "setBootstrapRetryInterval:", v5 + v5);
    -[FMFCloudKitManager bootstrapRetryInterval](self, "bootstrapRetryInterval");
    v7 = v6;
    -[FMFCloudKitManager maxBootstrapInterval](self, "maxBootstrapInterval");
    if (v7 >= v8)
    {
      -[FMFCloudKitManager setBoostrapScheduled:](self, "setBoostrapScheduled:", 0);
      v14 = sub_100011D0C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[FMFCloudKitManager bootstrapRetryInterval](self, "bootstrapRetryInterval");
        *(_DWORD *)buf = 136315394;
        v19 = "-[FMFCloudKitManager bootstrapAccountWithReason:]";
        v20 = 2048;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Not retrying bootstrapping after: %f", buf, 0x16u);
      }

    }
    else
    {
      -[FMFCloudKitManager setBoostrapScheduled:](self, "setBoostrapScheduled:", 1);
      v9 = sub_100011D0C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[FMFCloudKitManager bootstrapRetryInterval](self, "bootstrapRetryInterval");
        *(_DWORD *)buf = 136315394;
        v19 = "-[FMFCloudKitManager bootstrapAccountWithReason:]";
        v20 = 2048;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Retry bootstrap after: %f", buf, 0x16u);
      }

      -[FMFCloudKitManager bootstrapRetryInterval](self, "bootstrapRetryInterval");
      v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100018398;
      v17[3] = &unk_1000994A0;
      v17[4] = self;
      v17[5] = a3;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v17);
    }
  }
}

- (void)bootstrap
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("Fence-DUMMY-BOOT-STRAP"), CKCurrentUserDefaultName);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_initWeak(&location, v4);
  v5 = off_1000B2FD8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100018708;
  v19[3] = &unk_1000994C8;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  v7 = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v19);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v9 = CKIdentityUpdateNotification;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001882C;
  v17[3] = &unk_1000994C8;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  v10 = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v17);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateCloudDatabase"));
  -[FMFCloudKitManager subscribeToChangesInDatabase:](self, "subscribeToChangesInDatabase:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateCloudDatabase"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018914;
  v15[3] = &unk_100099558;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  -[FMFCloudKitManager updateZoneWithID:inDatabase:withCompletion:](self, "updateZoneWithID:inDatabase:withCompletion:", v3, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)handleAccountChangedNotification
{
  if (!-[FMFCloudKitManager isAccountBootstrapped](self, "isAccountBootstrapped"))
    -[FMFCloudKitManager bootstrapAccountWithReason:](self, "bootstrapAccountWithReason:", 1);
}

- (void)createIDForRecordWithName:(id)a3 inZoneWithName:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018DF8;
  v15[3] = &unk_100099580;
  v17 = v8;
  v18 = v10;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v11, "fetchUserRecordIDWithCompletionHandler:", v15);

}

- (id)recordWithID:(id)a3 inScope:(int64_t)a4
{
  id v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  if ((unint64_t)(a4 - 1) < 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordWithID:inDatabaseWithScope:", v7, a4));
    v10 = v9;
    if (v9)
    {
      v4 = v9;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fmf_withCurrentUserDefaultName"));
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordWithID:inDatabaseWithScope:", v12, a4));

    }
    goto LABEL_8;
  }
  if (a4 == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordWithID:inDatabaseWithScope:", v7, 3));
LABEL_8:

  }
  return v4;
}

- (void)subscribeToChangesInDatabase:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager createDatabaseSubscriptionOperationWithSubscriptionId:database:](self, "createDatabaseSubscriptionOperationWithSubscriptionId:database:", CFSTR("private-changes"), a3));
  objc_msgSend(v4, "setModifySubscriptionsCompletionBlock:", &stru_1000995C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v3, "addOperation:", v4);

}

- (id)createDatabaseSubscriptionOperationWithSubscriptionId:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  id v7;
  CKNotificationInfo *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)CKDatabaseSubscription), "initWithSubscriptionID:", v6);

  v8 = objc_opt_new(CKNotificationInfo);
  -[CKNotificationInfo setShouldSendContentAvailable:](v8, "setShouldSendContentAvailable:", 1);
  objc_msgSend(v7, "setNotificationInfo:", v8);
  v9 = objc_alloc((Class)CKModifySubscriptionsOperation);
  v15 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v11 = objc_msgSend(v9, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v10, &__NSArray0__struct);

  objc_msgSend(v11, "setDatabase:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
  objc_msgSend(v12, "setAutomaticallyRetryNetworkFailures:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
  objc_msgSend(v13, "setDiscretionaryNetworkBehavior:", 0);

  return v11;
}

+ (BOOL)isIdentityLossError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
    v5 = objc_msgSend(v3, "code") == (id)112;
  else
    v5 = 0;

  return v5;
}

- (void)processCKError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  __CFString *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  if (+[FMFCloudKitManager isIdentityLossError:](FMFCloudKitManager, "isIdentityLossError:", v4))
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = objc_msgSend(v4, "code");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetch record zones missing indentity operation error %lu", buf, 0xCu);
    }

    v7 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("Fence-DUMMY-BOOT-STRAP"), CKCurrentUserDefaultName);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    objc_msgSend(v8, "beginTransaction:", CFSTR("processCKErrorDeleteZone"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateCloudDatabase"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000194C8;
    v13[3] = &unk_1000995E8;
    v14 = CFSTR("processCKErrorDeleteZone");
    -[FMFCloudKitManager deleteZoneWithID:inDatabase:withCompletion:](self, "deleteZoneWithID:inDatabase:withCompletion:", v7, v10, v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fenceSequencer"));
    objc_msgSend(v12, "handleIdentityLossWithCompletion:", &stru_100099608);

  }
}

- (void)removeAllFenceRecordZonesWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 2;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100018B30;
  v14[4] = sub_100018B40;
  v15 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001977C;
  v10[3] = &unk_100099630;
  v12 = v14;
  v13 = v16;
  v4 = a3;
  v11 = v4;
  v5 = objc_retainBlock(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateCloudDatabase"));
  -[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:](self, "removeAllFenceRecordsZonesInDatabase:withCompletion:", v7, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedCloudDatabase"));
  -[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:](self, "removeAllFenceRecordsZonesInDatabase:withCompletion:", v9, v5);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

}

- (void)removeAllFenceRecordsZonesInDatabase:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](CKFetchRecordZonesOperation, "fetchAllRecordZonesOperation"));
  objc_msgSend(v8, "setDatabase:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  objc_msgSend(v9, "setDiscretionaryNetworkBehavior:", 0);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019984;
  v15[3] = &unk_100099678;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "setFetchRecordZonesCompletionBlock:", v15);
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Begin fetch all records operation in order to delete all records.", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v14, "addOperation:", v8);

}

- (void)fetchChangesWithCompletion:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  FMFCloudKitManager *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100018B30;
  v18[4] = sub_100018B40;
  v19 = 0;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100019D44;
  v13 = &unk_1000996A0;
  v14 = self;
  v16 = v18;
  v17 = v20;
  v4 = a3;
  v15 = v4;
  v5 = objc_retainBlock(&v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container", v10, v11, v12, v13, v14));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateCloudDatabase"));
  -[FMFCloudKitManager fetchChangesFromDatabase:withCompletion:](self, "fetchChangesFromDatabase:withCompletion:", v7, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedCloudDatabase"));
  -[FMFCloudKitManager fetchChangesFromDatabase:withCompletion:](self, "fetchChangesFromDatabase:withCompletion:", v9, v5);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

- (void)fetchChangesFromDatabase:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  _QWORD *v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[7];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  _QWORD v37[5];
  _QWORD v38[6];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverChangeTokenForDatabaseWithScope:", objc_msgSend(v6, "scope")));

  v10 = objc_msgSend(objc_alloc((Class)CKFetchDatabaseChangesOperation), "initWithPreviousServerChangeToken:", v9);
  v11 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v11, "setName:", CFSTR("UserActionImplicit"));
  objc_msgSend(v10, "setDatabase:", v6);
  objc_msgSend(v10, "setGroup:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
  objc_msgSend(v12, "setDiscretionaryNetworkBehavior:", 0);

  v13 = objc_opt_new(NSMutableArray);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001A114;
  v38[3] = &unk_1000996C8;
  v38[4] = v13;
  objc_msgSend(v10, "setRecordZoneWithIDChangedBlock:", v38);
  v14 = objc_opt_new(NSMutableArray);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001A120;
  v37[3] = &unk_1000996C8;
  v37[4] = v14;
  objc_msgSend(v10, "setRecordZoneWithIDWasDeletedBlock:", v37);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 1;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100018B30;
  v34[4] = sub_100018B40;
  v35 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001A12C;
  v30[3] = &unk_100099630;
  v32 = v34;
  v33 = v36;
  v15 = v7;
  v31 = v15;
  v16 = objc_retainBlock(v30);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001A1A4;
  v26[3] = &unk_100099718;
  v26[4] = self;
  v26[5] = v13;
  v29 = v36;
  v26[6] = v14;
  v17 = v6;
  v27 = v17;
  v18 = v16;
  v28 = v18;
  v19 = objc_retainBlock(v26);
  objc_msgSend(v10, "setChangeTokenUpdatedBlock:", v19);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001A31C;
  v23[3] = &unk_100099740;
  v20 = v19;
  v24 = v20;
  v21 = v18;
  v25 = v21;
  objc_msgSend(v10, "setFetchDatabaseChangesCompletionBlock:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v22, "addOperation:", v10);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

- (void)fetchChangedRecordZonesWithID:(id)a3 andDeleteRecordZonesWithID:(id)a4 fromDatabase:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100018B30;
  v19[4] = sub_100018B40;
  v20 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A5F4;
  v15[3] = &unk_100099630;
  v17 = v19;
  v18 = v21;
  v13 = a6;
  v16 = v13;
  v14 = objc_retainBlock(v15);
  -[FMFCloudKitManager deleteRecordZonesWithID:fromDatabase:withCompletion:](self, "deleteRecordZonesWithID:fromDatabase:withCompletion:", v11, v12, v14);
  if (v10 && objc_msgSend(v10, "count"))
    -[FMFCloudKitManager fetchChangedRecordZonesWithID:fromDatabase:withCompletion:](self, "fetchChangedRecordZonesWithID:fromDatabase:withCompletion:", v10, v12, v14);
  else
    ((void (*)(_QWORD *, _QWORD))v14[2])(v14, 0);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

- (void)deleteRecordZonesWithID:(id)a3 fromDatabase:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void (**v23)(id, id);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];

  v8 = a3;
  v9 = a4;
  v23 = (void (**)(id, id))a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v8);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v14);
        v17 = sub_100011D0C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[FMFCloudKitManager deleteRecordZonesWithID:fromDatabase:withCompletion:]";
          v31 = 2112;
          v32 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Delete record zone: %@", buf, 0x16u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
        v20 = objc_msgSend(v9, "scope");
        v24 = 0;
        objc_msgSend(v19, "removeServerChangeTokenForZoneWithID:inDatabaseWithScope:error:", v16, v20, &v24);
        v21 = v24;

        if (v15)
          v22 = v15;
        else
          v22 = v21;
        v12 = v22;

        v14 = (char *)v14 + 1;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v23[2](v23, v12);

}

- (void)fetchChangedRecordZonesWithID:(id)a3 fromDatabase:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[6];
  id v31;
  NSMutableArray *v32;
  _QWORD *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_100018B30;
  v36[4] = sub_100018B40;
  v37 = 0;
  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[FMFCloudKitManager fetchChangedRecordZonesWithID:fromDatabase:withCompletion:]";
    v40 = 2112;
    v41 = v23;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Record zones with IDs changed: %@", buf, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager fetchChangeConfigurationsForZonesWithIDs:inScope:](self, "fetchChangeConfigurationsForZonesWithIDs:inScope:", v23, objc_msgSend(v8, "scope")));
  v13 = objc_msgSend(objc_alloc((Class)CKFetchRecordZoneChangesOperation), "initWithRecordZoneIDs:configurationsByRecordZoneID:", v23, v12);
  v14 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v14, "setName:", CFSTR("UserActionImplicit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
  objc_msgSend(v15, "setDiscretionaryNetworkBehavior:", 0);

  objc_msgSend(v13, "setDatabase:", v8);
  objc_msgSend(v13, "setGroup:", v14);
  v16 = objc_opt_new(NSMutableArray);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10001AC1C;
  v35[3] = &unk_100099768;
  v35[4] = v16;
  objc_msgSend(v13, "setRecordChangedBlock:", v35);
  v17 = objc_opt_new(NSMutableArray);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10001AC28;
  v34[3] = &unk_100099790;
  v34[4] = v17;
  objc_msgSend(v13, "setRecordWithIDWasDeletedBlock:", v34);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001AC34;
  v30[3] = &unk_1000997B8;
  v30[4] = v16;
  v30[5] = self;
  v18 = v8;
  v32 = v17;
  v33 = v36;
  v31 = v18;
  v19 = objc_retainBlock(v30);
  objc_msgSend(v13, "setRecordZoneChangeTokensUpdatedBlock:", v19);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001AF08;
  v27[3] = &unk_1000997E0;
  v20 = v19;
  v28 = v20;
  v29 = v36;
  objc_msgSend(v13, "setRecordZoneFetchCompletionBlock:", v27);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001B070;
  v24[3] = &unk_100099808;
  v21 = v9;
  v25 = v21;
  v26 = v36;
  objc_msgSend(v13, "setFetchRecordZoneChangesCompletionBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v22, "addOperation:", v13);

  _Block_object_dispose(v36, 8);
}

- (id)fetchChangeConfigurationsForZonesWithIDs:(id)a3 inScope:(int64_t)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v13 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serverChangeTokenForZoneWithID:inDatabaseWithScope:", v12, a4));
        objc_msgSend(v13, "setPreviousServerChangeToken:", v15);

        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)deleteRecordWithRecordID:(id)a3 inDatabaseWithScope:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "databaseWithDatabaseScope:", a4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B330;
  v14[3] = &unk_100099830;
  v15 = v8;
  v13 = v8;
  -[FMFCloudKitManager deleteZoneWithID:inDatabase:withCompletion:](self, "deleteZoneWithID:inDatabase:withCompletion:", v12, v11, v14);

}

- (void)updateRecord:(id)a3 inZoneSharedWith:(id)a4 inDatabaseWithScope:(int64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  void *v21;
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "databaseWithDatabaseScope:", a5));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001B468;
  v19[3] = &unk_100099880;
  v19[4] = self;
  v20 = v10;
  v21 = v14;
  v22 = v11;
  v17 = v10;
  v18 = v11;
  -[FMFCloudKitManager updateZoneWithID:withShareRecipients:inDatabase:withCompletion:](self, "updateZoneWithID:withShareRecipients:inDatabase:withCompletion:", v16, v12, v14, v19);

}

- (void)updateZoneWithID:(id)a3 withShareRecipients:(id)a4 inDatabase:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001B75C;
  v16[3] = &unk_1000998D0;
  v19 = a5;
  v20 = a6;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v12 = v19;
  v13 = v10;
  v14 = v11;
  v15 = v20;
  -[FMFCloudKitManager updateZoneWithID:inDatabase:withCompletion:](self, "updateZoneWithID:inDatabase:withCompletion:", v13, v12, v16);

}

- (void)updateZoneWithID:(id)a3 inDatabase:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", v9);

  v11 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v20 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v13 = objc_msgSend(v11, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v12, 0);

  v14 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v14, "setName:", CFSTR("UserActionExplicit"));
  objc_msgSend(v13, "setDatabase:", v8);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
  objc_msgSend(v15, "setDiscretionaryNetworkBehavior:", 0);

  objc_msgSend(v13, "setGroup:", v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001BAD0;
  v18[3] = &unk_1000998F8;
  v19 = v7;
  v16 = v7;
  objc_msgSend(v13, "setModifyRecordZonesCompletionBlock:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v17, "addOperation:", v13);

}

- (void)deleteZoneWithID:(id)a3 inDatabase:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v18 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v12 = objc_msgSend(v10, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v11);

  objc_msgSend(v12, "setDatabase:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
  objc_msgSend(v13, "setDiscretionaryNetworkBehavior:", 0);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001BC4C;
  v16[3] = &unk_1000998F8;
  v17 = v7;
  v14 = v7;
  objc_msgSend(v12, "setModifyRecordZonesCompletionBlock:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v15, "addOperation:", v12);

}

- (void)fetchShareParticipantsForHandles:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_opt_class(self);
  if (v7)
    v10 = v7;
  else
    v10 = &__NSArray0__struct;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lookupInfosForHandles:", v10));

  v12 = objc_msgSend(objc_alloc((Class)CKFetchShareParticipantsOperation), "initWithUserIdentityLookupInfos:", v11);
  v13 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v13, "setName:", CFSTR("SharingSetup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
  objc_msgSend(v15, "setContainer:", v14);

  objc_msgSend(v12, "setGroup:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
  objc_msgSend(v16, "setDiscretionaryNetworkBehavior:", 0);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001BE28;
  v21[3] = &unk_100099920;
  v21[4] = v8;
  objc_msgSend(v12, "setShareParticipantFetchedBlock:", v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001BE34;
  v19[3] = &unk_100099948;
  v19[4] = v8;
  v20 = v6;
  v17 = v6;
  objc_msgSend(v12, "setFetchShareParticipantsCompletionBlock:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v18, "addOperation:", v12);

}

- (void)updateRecord:(id)a3 andShare:(id)a4 inDatabase:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v27[0] = v10;
    v27[1] = v11;
    v14 = (id *)v27;
    v15 = 2;
  }
  else
  {
    v26 = v10;
    v14 = &v26;
    v15 = 1;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, v15));
  v17 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v17, "setName:", CFSTR("SharingSetup"));
  v18 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v16, &__NSArray0__struct);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
  objc_msgSend(v19, "setDiscretionaryNetworkBehavior:", 0);

  objc_msgSend(v18, "setDatabase:", v12);
  objc_msgSend(v18, "setGroup:", v17);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001C028;
  v23[3] = &unk_1000999D0;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v20 = v13;
  v21 = v12;
  objc_msgSend(v18, "setModifyRecordsCompletionBlock:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v22, "addOperation:", v18);

}

+ (id)lookupInfosForHandles:(id)a3
{
  return objc_msgSend(a3, "fm_map:", &stru_100099A10);
}

+ (BOOL)sendShareURL:(id)a3 andInvitationToken:(id)a4 recordName:(id)a5 toDestinationID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  id v25;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13)
  {
    v27 = 0;
    v16 = objc_msgSend((id)objc_opt_class(a1), "stringFromShareInvitationToken:error:", v13, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v27;
    v19 = v18;
    if (v18 || !v17)
    {
      v23 = 0;
      *a7 = objc_retainAutorelease(v18);
    }
    else
    {
      v28[0] = CFSTR("kFMFServicePayloadKey");
      v28[1] = CFSTR("p0");
      v29[0] = CFSTR("CKDeviceToDeviceShareInvitationToken");
      v29[1] = v17;
      v28[2] = CFSTR("p1");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
      v29[2] = v20;
      v29[3] = CFSTR("1");
      v28[3] = CFSTR("v");
      v28[4] = CFSTR("ckRecordName");
      v29[4] = v14;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 5));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance"));
      v23 = objc_msgSend(v22, "sendMessage:toIdentifier:error:", v21, v15, a7);

    }
  }
  else
  {
    if (!a7)
    {
      v23 = 0;
      goto LABEL_10;
    }
    v24 = FMFErrorDomain;
    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("no participant token");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, 1018, v19));
    v23 = 0;
    *a7 = v25;
  }

LABEL_10:
  return v23;
}

- (void)handleReceiveCKShareWithURLString:(id)a3 invitationTokenBase64String:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
  v11 = 0;
  objc_msgSend(v8, "updateUnacceptedShareInvitationsWithShareURLString:invitationTokenBase64String:InDatabaseWithScope:error:", v6, v7, 3, &v11);

  v9 = sub_100011D0C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[FMFCloudKitManager handleReceiveCKShareWithURLString:invitationTokenBase64String:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Received share invitation", buf, 0xCu);
  }

  -[FMFCloudKitManager acceptCKShareWithURLString:invitationTokenBase64String:](self, "acceptCKShareWithURLString:invitationTokenBase64String:", v6, v7);
}

- (void)acceptCKShareWithURLString:(id)a3 invitationTokenBase64String:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[7];
  id v17;
  uint64_t v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v8 = objc_msgSend((id)objc_opt_class(self), "shareInvitationTokenFromString:error:", v7, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = v19;
  if (v6)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v12 = (void *)v11;
    if (!v10 && v9 && v11)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001C7C8;
      v16[3] = &unk_100099A38;
      v16[4] = v11;
      v16[5] = v9;
      v16[6] = self;
      v17 = v6;
      -[FMFCloudKitManager acceptCKShareWithURL:invitationToken:completion:](self, "acceptCKShareWithURL:invitationToken:completion:", v12, v9, v16);

      goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = sub_100011D0C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1000635C8();

  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1140);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
  v18 = 0;
  objc_msgSend(v15, "removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:", v6, 3, &v18);

LABEL_10:
}

- (void)acceptCKShareWithURL:(id)a3 invitationToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  FMFCloudKitManager *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[6];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100018B30;
  v34[4] = sub_100018B40;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100018B30;
  v32[4] = sub_100018B40;
  v33 = 0;
  v37 = v8;
  v38 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v12 = objc_alloc((Class)CKFetchShareMetadataOperation);
  v36 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  v14 = objc_msgSend(v12, "initWithShareURLs:invitationTokensByShareURL:", v13, v11);

  v15 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v15, "setName:", CFSTR("SharingSetup"));
  objc_msgSend(v14, "setGroup:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager container](self, "container"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));
  objc_msgSend(v17, "setContainer:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));
  objc_msgSend(v18, "setDiscretionaryNetworkBehavior:", 0);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001CE98;
  v31[3] = &unk_100099A60;
  v31[4] = v34;
  v31[5] = v32;
  objc_msgSend(v14, "setPerShareMetadataBlock:", v31);
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_10001CF08;
  v25 = &unk_100099AD8;
  v29 = v34;
  v19 = v10;
  v30 = v32;
  v28 = v19;
  v26 = self;
  v20 = v15;
  v27 = v20;
  objc_msgSend(v14, "setFetchShareMetadataCompletionBlock:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", v22, v23, v24, v25, v26));
  objc_msgSend(v21, "addOperation:", v14);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

}

- (void)retryAcceptShareWithURLString:(id)a3 invitationToken:(id)a4 forError:(id)a5 retryCount:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _UNKNOWN **v17;
  double v18;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  int64_t v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6 + 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CKErrorRetryAfterKey));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
    v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CKErrorRetryAfterKey));

  }
  else
  {
    v17 = &off_1000A0EE8;
  }

  if (a6 > 4)
  {
    v21 = sub_100011D0C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[FMFCloudKitManager retryAcceptShareWithURLString:invitationToken:forError:retryCount:]";
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v10;
      v40 = 2112;
      v41 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: error: %@, NOT RETRYING, shareURL: %@ invitationToken: %@", buf, 0x2Au);
    }

    v32[0] = CFSTR("acceptCKShareOperationSuccessful");
    v32[1] = CFSTR("ckShareRetryAvailable");
    v33[0] = &off_1000A0F00;
    v33[1] = &off_1000A0F00;
    v32[2] = CFSTR("ckShareRetryCount");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6 + 1));
    v33[2] = v23;
    v32[3] = CFSTR("acceptCKShareError");
    v24 = stringForCKErrorCode(objc_msgSend(v12, "code"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v33[3] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v26);

  }
  else
  {
    objc_msgSend(v17, "doubleValue");
    v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
    v20 = objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager retryOperationQueue](self, "retryOperationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D470;
    block[3] = &unk_100099B28;
    block[4] = self;
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = v13;
    dispatch_after(v19, v20, block);

  }
}

- (void)retryInviteUnacceptedCKShares
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitManager cache](self, "cache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unacceptedShareInvitationsInDatabaseWithScope:", 3));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = sub_100011D0C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v4, "count");
          *(_DWORD *)buf = 136315394;
          v20 = "-[FMFCloudKitManager retryInviteUnacceptedCKShares]";
          v21 = 2048;
          v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Number of unaccepted shares: %lu ", buf, 0x16u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v10));
        -[FMFCloudKitManager acceptCKShareWithURLString:invitationTokenBase64String:](self, "acceptCKShareWithURLString:invitationTokenBase64String:", v10, v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

}

+ (id)stringFromShareInvitationToken:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v21));
  v6 = v21;
  if (v6)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100063840((uint64_t)v6, v8, v9);

    v10 = 0;
    *a4 = objc_retainAutorelease(v6);
  }
  else if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
  }
  else
  {
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100063810(v12, v13, v14, v15, v16, v17, v18, v19);

    v10 = 0;
  }

  return v10;
}

+ (id)shareInvitationTokenFromString:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  uint64_t v34;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v5, 1);

  if (v6)
  {
    v34 = objc_opt_class(CKDeviceToDeviceShareInvitationToken);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

    v33 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v8, v6, &v33));
    v10 = v33;
    if (v10)
    {
      v11 = sub_100011D0C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000638D8((uint64_t)v10, v12, v13);

      v14 = 0;
      *a4 = objc_retainAutorelease(v10);
    }
    else if (v9)
    {
      v14 = v9;
    }
    else
    {
      v23 = sub_100011D0C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1000638A8(v24, v25, v26, v27, v28, v29, v30, v31);

      v14 = 0;
    }

  }
  else
  {
    v15 = sub_100011D0C();
    v10 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000638A8(v10, v16, v17, v18, v19, v20, v21, v22);
    v14 = 0;
  }

  return v14;
}

- (id)stringFromBootstrapReason:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return *(&off_100099B48 + a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (FMFCloudKitCache)cache
{
  return self->_cache;
}

- (OS_dispatch_queue)retryOperationQueue
{
  return self->_retryOperationQueue;
}

- (void)setRetryOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_retryOperationQueue, a3);
}

- (double)bootstrapRetryInterval
{
  return self->_bootstrapRetryInterval;
}

- (void)setBootstrapRetryInterval:(double)a3
{
  self->_bootstrapRetryInterval = a3;
}

- (double)maxBootstrapInterval
{
  return self->_maxBootstrapInterval;
}

- (void)setMaxBootstrapInterval:(double)a3
{
  self->_maxBootstrapInterval = a3;
}

- (BOOL)boostrapScheduled
{
  return self->_boostrapScheduled;
}

- (void)setBoostrapScheduled:(BOOL)a3
{
  self->_boostrapScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryOperationQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
