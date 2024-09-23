@implementation _OSInactivityPredictionBackupManager

- (_OSInactivityPredictionBackupManager)init
{
  _OSInactivityPredictionBackupManager *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSInactivityPredictionBackupManager;
  v2 = -[_OSInactivityPredictionBackupManager init](&v6, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "inactivity.backupmanager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

+ (BOOL)hasBackup
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.osintelligence.inactivitybackup"));
  v3 = 2;
  do
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("backup.v%d"), v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", v4));

    if (v3 < 2)
      break;
    v3 = (v3 - 1);
  }
  while (!v5);

  return v5 != 0;
}

- (void)backupData
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *log;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _OSInactivityPredictionBackupManager *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _OSInactivityPredictionBackupManager *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.osintelligence.inactivitybackup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  if (objc_msgSend(v4, "hasEnoughHistoryForInactivityPrediction"))
  {
    v36 = self;
    v38 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v37 = v4;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allIntervalsSortByStartAsc"));
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v6)
    {
      v7 = v6;
      v41 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v41)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "components:fromDate:", 32, v10));
          v12 = objc_msgSend(v11, "hour");

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
          objc_msgSend(v13, "timeIntervalSinceDate:", v14);
          v16 = v15;

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v17));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v18, "intValue") + 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v20);

          if (v16 > 10800.0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v21));

            if (!v22)
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v22, "addObject:", v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v22, v23);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v7);
    }

    log = v36->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v25 = log;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "allKeys"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count")));
      *(_DWORD *)buf = 138412290;
      v52 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Found %@ events", buf, 0xCu);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000040E0;
    v43[3] = &unk_100060748;
    v29 = v5;
    v44 = v29;
    v30 = v28;
    v45 = v30;
    v46 = v36;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, 0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("backup.v%d"), 2));
    v3 = v38;
    objc_msgSend(v38, "setObject:forKey:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v33, "timeIntervalSinceReferenceDate");
    objc_msgSend(v38, "setDouble:forKey:", CFSTR("lastUpdate"));

    v34 = objc_autoreleasePoolPush();
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("backup.v%d"), 1));
    objc_msgSend(v38, "removeObjectForKey:", v35);

    objc_autoreleasePoolPop(v34);
    v4 = v37;
  }

}

- (id)hydrateBackup
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  int v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = 2;
  while (1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("backup.v%d"), v3));
    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.osintelligence.inactivitybackup"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
    if (v6)
      break;

    v7 = (_DWORD)v3 != 0;
    v3 = (v3 - 1);
    if ((_DWORD)v3 == 0 || !v7)
      goto LABEL_6;
  }
  v8 = (void *)v6;
  v9 = objc_opt_class(NSArray);
  v10 = v2;
  v11 = objc_opt_class(NSDictionary);
  v12 = objc_opt_class(NSNumber);
  v18 = v11;
  v2 = v10;
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v18, v12, objc_opt_class(NSString), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v8, 0));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000045AC;
  v19[3] = &unk_100060770;
  v21 = v3;
  v20 = v2;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v19);

LABEL_6:
  v16 = objc_msgSend(v2, "copy");

  return v16;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
