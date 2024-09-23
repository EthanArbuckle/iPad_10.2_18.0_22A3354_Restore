@implementation CDDataMigrator

+ (CDDataMigrator)sharedInstance
{
  if (qword_100040F00 != -1)
    dispatch_once(&qword_100040F00, &stru_1000392D0);
  return (CDDataMigrator *)(id)qword_100040EF8;
}

- (CDDataMigrator)init
{
  CDDataMigrator *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  uint32_t v5;
  CDDataMigrator *v6;
  int out_token;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDDataMigrator;
  v2 = -[CDDataMigrator init](&v9, "init");
  if (v2
    && (out_token = 0,
        global_queue = dispatch_get_global_queue(-32768, 0),
        v4 = objc_claimAutoreleasedReturnValue(global_queue),
        v5 = notify_register_dispatch("com.apple.datamigrator.migrationDidFinish", &out_token, v4, &stru_1000392F0),
        v4,
        v5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000232E4(v5);
    v6 = 0;
  }
  else
  {
    v6 = v2;
  }

  return v6;
}

+ (BOOL)performMigration
{
  NSObject *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  os_activity_scope_state_s v14;

  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator performMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v2, &v14);
  os_activity_scope_leave(&v14);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14.opaque[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Beginning CoreDuet Migration....", (uint8_t *)&v14, 2u);
  }
  v3 = (void *)os_transaction_create("com.apple.coreduet.migrator.perform-migration");
  v4 = objc_autoreleasePoolPush();
  v5 = !+[CDDataMigrator logMigration](CDDataMigrator, "logMigration");
  objc_autoreleasePoolPop(v4);
  v6 = objc_autoreleasePoolPush();
  v7 = !+[CDDataMigrator dkcMigration](CDDataMigrator, "dkcMigration") + v5;
  objc_autoreleasePoolPop(v6);
  v8 = objc_autoreleasePoolPush();
  v9 = !+[CDDataMigrator spotlightViewerEventsMigration](CDDataMigrator, "spotlightViewerEventsMigration");
  objc_autoreleasePoolPop(v8);
  v10 = objc_autoreleasePoolPush();
  v11 = v7 + v9 + !+[CDDataMigrator remoteHistogramMigration](CDDataMigrator, "remoteHistogramMigration");
  objc_autoreleasePoolPop(v10);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
    LODWORD(v14.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v14.opaque + 4) = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Finished CoreDuet migration with %@ errors.", (uint8_t *)&v14, 0xCu);

  }
  return (_DWORD)v11 == 0;
}

+ (BOOL)logMigration
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  os_activity_scope_state_s state;

  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator logMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", CFSTR("/var/log/CoreDuet/coreduetd.log"));
  +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", CFSTR("/var/log/CoreDuet/duetknowledged.log"));
  +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", CFSTR("/var/log/CoreDuet/duetexpertd.log"));
  v3 = 0;
  do
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d.gz"), CFSTR("/var/log/CoreDuet/coreduetd.log"), v3));
    +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d.gz"), CFSTR("/var/log/CoreDuet/duetknowledged.log"), v3));
    +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d.gz"), CFSTR("/var/log/CoreDuet/duetexpertd.log"), v3));
    +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", v6);

    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 15);
  return 1;
}

+ (void)removeFileAtPath:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v3, &v8);
    v7 = v8;

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000233D4();
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_100023360();
    }

  }
}

+ (BOOL)dkcMigration
{
  NSObject *v2;
  void *v3;
  os_activity_scope_state_s v5;

  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator dkcMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  os_activity_scope_leave(&v5);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess](_DKKnowledgeStore, "knowledgeStoreWithDirectReadOnlyAccess"));
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100023454();

  return v3 != 0;
}

+ (void)_migrateSpotlightEvents
{
  void *v2;
  void *v3;
  const char *v4;
  id v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  double v11;
  void *v12;
  id v13;
  sqlite3 *v14;
  sqlite3 *ppDb;
  uint8_t buf[4];
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = 0;
  ppDb = 0;
  sqlite3_open("/var/mobile/Library/CoreDuet/coreduetdClassD.db", &ppDb);
  v4 = (const char *)objc_msgSend(CFSTR("SELECT ZINTEGERID from ZCDDMATTRIBUTENAMEMAPPER where ZNAME==\"com.apple.spotlightviewer.events\";"),
                       "UTF8String");
  sqlite3_exec(ppDb, v4, (int (__cdecl *)(void *, int, char **, char **))sub_10001E94C, 0, 0);
  sqlite3_close(ppDb);
  ppDb = 0;
  if (!qword_100040F08)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find spotlight viewer events", buf, 2u);
    }
    goto LABEL_12;
  }
  sqlite3_open("/var/mobile/Library/CoreDuet/coreduetd.db", &v14);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT ZVALUE,ZCREATIONDATE from ZCDDMSTRINGATTRIBUTE where ZINTEGERID==%lld"), qword_100040F08)));
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  sqlite3_exec(v14, v6, (int (__cdecl *)(void *, int, char **, char **))sub_10001E9C8, v2, 0);
  sqlite3_close(v14);
  v14 = 0;
  if (objc_msgSend(v2, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
    v13 = 0;
    objc_msgSend(v7, "saveObjects:error:", v2, &v13);
    v8 = v13;
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100023498();

    }
    v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "timeIntervalSinceNow");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v11));
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Migration took %@", buf, 0xCu);

    }
LABEL_12:

  }
}

+ (BOOL)spotlightViewerEventsMigration
{
  NSObject *v3;
  NSObject *v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  os_activity_scope_state_s state;

  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator spotlightViewerEventsMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating spotlight events!", (uint8_t *)&state, 2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v15, "fileExistsAtPath:", CFSTR("/var/mobile/Library/CoreDuet/coreduetd.db"));
  v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(state.opaque[0]) = 67109120;
    HIDWORD(state.opaque[0]) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Old DB Exists: %u", (uint8_t *)&state, 8u);
  }

  if (v5)
  {
    v7 = objc_autoreleasePoolPush();
    objc_msgSend(a1, "_migrateSpotlightEvents");
    objc_autoreleasePoolPop(v7);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(&off_10003BBA8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(&off_10003BBA8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/mobile/Library/CoreDuet/%@"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i)));
          v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting file: %@", (uint8_t *)&state, 0xCu);
          }

          +[CDDataMigrator removeFileAtPath:](CDDataMigrator, "removeFileAtPath:", v12);
        }
        v9 = objc_msgSend(&off_10003BBA8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
  }

  return 1;
}

+ (BOOL)remoteHistogramMigration
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v33;
  id v34;
  os_activity_scope_state_s state;

  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: CDDataMigrator remoteHistogramMigration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths knowledgeDatabaseDirectory](CDDPaths, "knowledgeDatabaseDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStorage storageWithDirectory:readOnly:](_DKKnowledgeStorage, "storageWithDirectory:readOnly:", v3, 0));

  v5 = objc_alloc((Class)NSDateInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v8 = objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams pairedDeviceForecastStream](_DKSystemEventStreams, "pairedDeviceForecastStream"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:](_DKHistogramQuery, "histogramQueryForStream:interval:withPredicate:", v9, v8, v10));

  objc_msgSend(v11, "setIncludeLocalResults:", 0);
  objc_msgSend(v11, "setIncludeRemoteResults:", 1);
  objc_msgSend(v11, "setRemoteHistogramLimit:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeQuery:error:", v11, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  if (v13)
  {
    v34 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier != %@"), v15));
    objc_msgSend(v14, "addObject:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stream"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("streamName = %@"), v19));
      objc_msgSend(v14, "addObject:", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceIdentifiers"));
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceIdentifiers"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("deviceIdentifier = %@"), v24));
      objc_msgSend(v14, "addObject:", v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storage"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "managedObjectContextFor:identifier:", NSFileProtectionCompleteUntilFirstUserAuthentication, CFSTR("com.apple.coreduet.datamigrator")));
    LOBYTE(v33) = 1;
    v29 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v28, CFSTR("Histogram"), v26, 0, 0x7FFFFFFFFFFFFFFFLL, 1, v33);

    v30 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29));
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Removed %@ stale PairedDeviceForecast histograms.", (uint8_t *)&state, 0xCu);

    }
    v8 = v34;
  }

  return v13 != 0;
}

@end
