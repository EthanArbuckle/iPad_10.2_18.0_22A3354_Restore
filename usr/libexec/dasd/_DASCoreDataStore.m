@implementation _DASCoreDataStore

- (void)mocSaveAndReset:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "hasChanges"))
  {
    v8 = 0;
    v4 = objc_msgSend(v3, "save:", &v8);
    v5 = v8;
    if ((v4 & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
        *(_DWORD *)buf = 138412546;
        v10 = v5;
        v11 = 2112;
        v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CoreData save error:  : %@, %@", buf, 0x16u);

      }
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "reset");

}

- (void)deleteActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _DASCoreDataStorage *database;
  void *v8;
  void *v9;
  _DASActivityRecorder *v10;
  id v11;
  id v12;
  id v13;
  _DASActivityRecorder *v14;
  _QWORD v15[4];
  id v16;
  _DASActivityRecorder *v17;
  id v18;
  id v19;
  _DASCoreDataStore *v20;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.deleteActivity");
  v6 = objc_autoreleasePoolPush();
  database = self->_database;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v8));

  v10 = objc_opt_new(_DASActivityRecorder);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003EE0;
  v15[3] = &unk_10015DD00;
  v11 = v5;
  v16 = v11;
  v17 = v10;
  v12 = v4;
  v18 = v12;
  v19 = v9;
  v20 = self;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v13, "performWithOptions:andBlock:", 4, v15);

  objc_autoreleasePoolPop(v6);
}

- (void)saveActivity:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _DASCoreDataStore *v13;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008434;
  v10[3] = &unk_10015D530;
  v11 = v4;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v4;
  objc_msgSend(v8, "performWithOptions:andBlock:", 4, v10);

}

+ (id)storageWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithDirectory:readOnly:", v6, v4);

  return v7;
}

- (_DASCoreDataStore)init
{

  return 0;
}

- (_DASCoreDataStore)initWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _DASCoreDataStore *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _DASCoreDataStorage *database;
  _DASCoreDataStore *v13;
  NSObject *v14;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_DASCoreDataStore;
  v7 = -[_DASCoreDataStore init](&v16, "init");
  if (!v7)
    goto LABEL_4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/DuetActivityScheduler/Scheduler/DuetActivitySchedulerDaemon.bundle/")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathForResource:ofType:", CFSTR("DuetActivityScheduler"), CFSTR("momd")));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));
    v11 = objc_claimAutoreleasedReturnValue(+[_DASCoreDataStorage storageWithDirectory:databaseName:modelURL:readOnly:](_DASCoreDataStorage, "storageWithDirectory:databaseName:modelURL:readOnly:", v6, CFSTR("DuetActivityScheduler"), v10, v4));
    database = v7->_database;
    v7->_database = (_DASCoreDataStorage *)v11;

LABEL_4:
    v13 = v7;
    goto LABEL_8;
  }
  v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1000E12EC(v14);

  v13 = 0;
LABEL_8:

  return v13;
}

- (void)createMOInMOC:(id)a3 activity:(id)a4 group:(id)a5 triggers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  _DASTriggerRecord *v20;
  void *v21;
  _DASGroupRecorder *v22;
  void *v23;
  _DASActivityRecorder *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24 = objc_opt_new(_DASActivityRecorder);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder createOrUpdateActivity:context:](v24, "createOrUpdateActivity:context:", v10, v9));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v20 = objc_opt_new(_DASTriggerRecord);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTriggerRecord fetchOrCreateTrigger:managedObjectContext:](v20, "fetchOrCreateTrigger:managedObjectContext:", v19, v9));
        objc_msgSend(v21, "addActivitiesObject:", v13);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  if (v11)
  {
    v22 = objc_opt_new(_DASGroupRecorder);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder createOrUpdateGroup:context:](v22, "createOrUpdateGroup:context:", v11, v9));
    objc_msgSend(v23, "addActivitiesObject:", v13);

  }
}

- (void)saveActivities:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _DASCoreDataStore *v13;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003AF64;
  v10[3] = &unk_10015D530;
  v11 = v4;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v4;
  objc_msgSend(v8, "performWithOptions:andBlock:", 4, v10);

}

- (void)saveActivity:(id)a3 triggers:(id)a4
{
  id v6;
  id v7;
  _DASCoreDataStorage *database;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  database = self->_database;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003B178;
  v14[3] = &unk_10015DC88;
  v14[4] = self;
  v15 = v10;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v13, "performWithOptions:andBlock:", 4, v14);

}

- (void)saveActivities:(id)a3 groups:(id)a4 triggersArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  _DASCoreDataStorage *database;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _DASCoreDataStore *v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  database = self->_database;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v12));

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10003B330;
  v25[4] = sub_10003B340;
  v26 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003B348;
  v18[3] = &unk_10015DCB0;
  v14 = v8;
  v19 = v14;
  v24 = v25;
  v15 = v9;
  v20 = v15;
  v21 = self;
  v16 = v13;
  v22 = v16;
  v17 = v10;
  v23 = v17;
  objc_msgSend(v16, "performWithOptions:andBlock:", 4, v18);

  _Block_object_dispose(v25, 8);
}

- (void)createMOInMOC:(id)a3 group:(id)a4 activities:(id)a5
{
  id v7;
  id v8;
  id v9;
  _DASActivityRecorder *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _DASGroupRecorder *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_new(_DASActivityRecorder);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder createOrUpdateActivity:context:](v10, "createOrUpdateActivity:context:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), v7, (_QWORD)v20));
        objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = objc_opt_new(_DASGroupRecorder);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder createOrUpdateGroup:context:](v18, "createOrUpdateGroup:context:", v8, v7));
  objc_msgSend(v19, "addActivities:", v11);

}

- (void)saveGroup:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _DASCoreDataStore *v13;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003B6DC;
  v10[3] = &unk_10015D530;
  v11 = v4;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v4;
  objc_msgSend(v8, "performWithOptions:andBlock:", 4, v10);

}

- (void)saveGroup:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  _DASCoreDataStorage *database;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  database = self->_database;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003B820;
  v14[3] = &unk_10015DC88;
  v14[4] = self;
  v15 = v10;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v13, "performWithOptions:andBlock:", 4, v14);

}

- (void)saveGroups:(id)a3 activitiesArray:(id)a4
{
  id v6;
  id v7;
  _DASCoreDataStorage *database;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _DASCoreDataStore *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    database = self->_database;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003B9C4;
    v12[3] = &unk_10015DC88;
    v13 = v6;
    v14 = self;
    v15 = v10;
    v16 = v7;
    v11 = v10;
    objc_msgSend(v11, "performWithOptions:andBlock:", 4, v12);

  }
}

- (void)loadAllTasks:(id)a3 startedTasks:(id)a4
{
  id v6;
  id v7;
  _DASCoreDataStorage *database;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _DASActivityRecorder *v14;
  _QWORD v15[4];
  _DASActivityRecorder *v16;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  database = self->_database;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003BB78;
  v15[3] = &unk_10015DC88;
  v16 = objc_opt_new(_DASActivityRecorder);
  v17 = v10;
  v18 = v6;
  v19 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v10;
  v14 = v16;
  objc_msgSend(v13, "performWithOptions:andBlock:", 4, v15);

}

- (void)saveActivity:(id)a3 group:(id)a4 triggers:(id)a5 hasStarted:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  _DASCoreDataStorage *database;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  database = self->_database;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v14));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003BDE4;
  v20[3] = &unk_10015DCD8;
  v20[4] = self;
  v21 = v15;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = a6;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v15;
  objc_msgSend(v19, "performWithOptions:andBlock:", 4, v20);

}

- (void)loadPendingLaunchTasks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _DASActivityRecorder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DASCoreDataStorage *database;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _DASActivityRecorder *v19;
  _QWORD v20[4];
  id v21;
  _DASActivityRecorder *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.loadPendingLaunchTasks");
  v6 = objc_autoreleasePoolPush();
  v7 = objc_opt_new(_DASActivityRecorder);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForPendingActivities](_DASActivityRecorder, "predicateForPendingActivities"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForLaunchActivities](_DASActivityRecorder, "predicateForLaunchActivities"));
  v26[0] = v8;
  v26[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

  database = self->_database;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v13));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003C014;
  v20[3] = &unk_10015DD00;
  v15 = v5;
  v21 = v15;
  v22 = v7;
  v23 = v11;
  v24 = v14;
  v16 = v4;
  v25 = v16;
  v17 = v14;
  v18 = v11;
  v19 = v7;
  objc_msgSend(v17, "performWithOptions:andBlock:", 4, v20);

  objc_autoreleasePoolPop(v6);
}

- (void)loadStartedTasks:(id)a3
{
  id v4;
  _DASActivityRecorder *v5;
  void *v6;
  _DASCoreDataStorage *database;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _DASActivityRecorder *v13;
  _QWORD v14[4];
  _DASActivityRecorder *v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = objc_opt_new(_DASActivityRecorder);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForStartedActivities](_DASActivityRecorder, "predicateForStartedActivities"));
  database = self->_database;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v8));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003C250;
  v14[3] = &unk_10015DC88;
  v15 = v5;
  v16 = v6;
  v17 = v9;
  v18 = v4;
  v10 = v4;
  v11 = v9;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "performWithOptions:andBlock:", 4, v14);

}

- (void)loadAllGroups:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _DASGroupRecorder *v10;
  _QWORD v11[4];
  _DASGroupRecorder *v12;
  id v13;
  id v14;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C460;
  v11[3] = &unk_10015D530;
  v12 = objc_opt_new(_DASGroupRecorder);
  v13 = v7;
  v14 = v4;
  v8 = v4;
  v9 = v7;
  v10 = v12;
  objc_msgSend(v9, "performWithOptions:andBlock:", 4, v11);

}

- (void)updateActivityStarted:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _DASActivityRecorder *v10;
  _QWORD v11[4];
  _DASActivityRecorder *v12;
  id v13;
  id v14;
  _DASCoreDataStore *v15;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C678;
  v11[3] = &unk_10015DC88;
  v12 = objc_opt_new(_DASActivityRecorder);
  v13 = v4;
  v14 = v7;
  v15 = self;
  v8 = v7;
  v9 = v4;
  v10 = v12;
  objc_msgSend(v8, "performWithOptions:andBlock:", 4, v11);

}

- (void)updateActivityCompleted:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _DASActivityRecorder *v10;
  _QWORD v11[4];
  _DASActivityRecorder *v12;
  id v13;
  id v14;
  _DASCoreDataStore *v15;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C798;
  v11[3] = &unk_10015DC88;
  v12 = objc_opt_new(_DASActivityRecorder);
  v13 = v4;
  v14 = v7;
  v15 = self;
  v8 = v7;
  v9 = v4;
  v10 = v12;
  objc_msgSend(v8, "performWithOptions:andBlock:", 4, v11);

}

- (void)updateActivityCanceled:(id)a3
{
  id v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _DASActivityRecorder *v10;
  _QWORD v11[4];
  _DASActivityRecorder *v12;
  id v13;
  id v14;
  _DASCoreDataStore *v15;

  v4 = a3;
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C8B8;
  v11[3] = &unk_10015DC88;
  v12 = objc_opt_new(_DASActivityRecorder);
  v13 = v4;
  v14 = v7;
  v15 = self;
  v8 = v7;
  v9 = v4;
  v10 = v12;
  objc_msgSend(v8, "performWithOptions:andBlock:", 4, v11);

}

- (BOOL)deleteStorageWithObliterationOption:(BOOL)a3
{
  _BOOL8 v3;
  _DASCoreDataStorage *database;
  void *v5;

  v3 = a3;
  database = self->_database;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  LOBYTE(v3) = -[_DASCoreDataStorage deleteStorageFor:obliterate:](database, "deleteStorageFor:obliterate:", v5, v3);

  return v3;
}

- (void)deleteOldActivities
{
  void *v3;
  void *v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  _DASActivityRecorder *v8;
  id v9;
  id v10;
  _DASActivityRecorder *v11;
  _QWORD v12[4];
  id v13;
  _DASActivityRecorder *v14;
  id v15;
  _DASCoreDataStore *v16;

  v3 = (void *)os_transaction_create("com.apple.dasd.deleteOldActivities");
  v4 = objc_autoreleasePoolPush();
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v8 = objc_opt_new(_DASActivityRecorder);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CA50;
  v12[3] = &unk_10015DC88;
  v9 = v3;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  v16 = self;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v10, "performWithOptions:andBlock:", 4, v12);

  objc_autoreleasePoolPop(v4);
}

- (void)deleteActivitiesIfRequired
{
  void *v3;
  void *v4;
  _DASCoreDataStorage *database;
  void *v6;
  void *v7;
  _DASActivityRecorder *v8;
  id v9;
  id v10;
  _DASActivityRecorder *v11;
  _QWORD v12[4];
  id v13;
  _DASActivityRecorder *v14;
  id v15;
  _DASCoreDataStore *v16;

  v3 = (void *)os_transaction_create("com.apple.dasd.deleteActivitiesIfRequired");
  v4 = objc_autoreleasePoolPush();
  database = self->_database;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v8 = objc_opt_new(_DASActivityRecorder);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CB90;
  v12[3] = &unk_10015DC88;
  v9 = v3;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  v16 = self;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v10, "performWithOptions:andBlock:", 4, v12);

  objc_autoreleasePoolPop(v4);
}

- (_DASCoreDataStorage)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
