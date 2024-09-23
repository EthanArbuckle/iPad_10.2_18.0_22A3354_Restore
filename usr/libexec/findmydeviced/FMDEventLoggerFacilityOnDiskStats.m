@implementation FMDEventLoggerFacilityOnDiskStats

+ (id)facilityName
{
  return CFSTR("FMDEventLoggerFacilityOnDiskStats");
}

- (FMDEventLoggerFacilityOnDiskStats)init
{
  FMDEventLoggerFacilityOnDiskStats *v2;
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  dispatch_queue_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FMDEventLoggerFacilityOnDiskStats;
  v2 = -[FMDEventLoggerFacilityOnDiskStats init](&v16, "init");
  if (v2)
  {
    v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.findmydeviced")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.findmydeviced.eventlogger.stats")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    -[FMDEventLoggerFacilityOnDiskStats setCachedLogFileURL:](v2, "setCachedLogFileURL:", v8);

    v9 = objc_alloc((Class)FMDataArchiver);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats cachedLogFileURL](v2, "cachedLogFileURL"));
    v11 = objc_msgSend(v9, "initWithFileURL:", v10);
    -[FMDEventLoggerFacilityOnDiskStats setArchiver:](v2, "setArchiver:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats archiver](v2, "archiver"));
    objc_msgSend(v12, "setBackedUp:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats archiver](v2, "archiver"));
    objc_msgSend(v13, "setCreateDirectories:", 1);

    v14 = dispatch_queue_create("FMDEventLoggerFacilityOnDisk.serialQueue", 0);
    -[FMDEventLoggerFacilityOnDiskStats setSerialQueue:](v2, "setSerialQueue:", v14);

    -[FMDEventLoggerFacilityOnDiskStats loadLogs](v2, "loadLogs");
  }
  return v2;
}

- (void)logEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038C78;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_logEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  FMDEventLoggerEventStat *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  if (-[FMDEventLoggerFacilityOnDiskStats shouldLog](self, "shouldLog"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats logs](self, "logs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupByKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v12));

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = sub_100038FFC;
    v36 = sub_10003900C;
    v37 = 0;
    if (v13)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100039014;
      v28[3] = &unk_1002C2CA0;
      v31 = v10;
      v29 = v4;
      v30 = &v32;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v28);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v5, "setObject:forKey:", v13, v11);
    }
    v14 = (void *)v33[5];
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "statValue"));
      v16 = (char *)objc_msgSend(v15, "integerValue");

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16 + 1));
      objc_msgSend((id)v33[5], "setStatValue:", v17);

    }
    else
    {
      v18 = -[FMDEventLoggerEventStat initWithEventName:]([FMDEventLoggerEventStat alloc], "initWithEventName:", v11);
      v19 = (void *)v33[5];
      v33[5] = (uint64_t)v18;

      objc_msgSend((id)v33[5], "setStatValue:", &off_1002D80E0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
      objc_msgSend((id)v33[5], "setGroupValue:", v20);

      objc_msgSend(v13, "addObject:", v33[5]);
    }
    v21 = objc_msgSend(v13, "count");
    if ((unint64_t)v21 > qword_100304B50)
      objc_msgSend(v13, "removeObjectAtIndex:", 0);
    v22 = sub_1000031B8();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      sub_100227A68((uint64_t)v5, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats archiver](self, "archiver"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "saveDictionary:", v5));

    if (v25)
    {
      v26 = sub_1000031B8();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1002279F4((uint64_t)v25, v27);

    }
    _Block_object_dispose(&v32, 8);

  }
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats cachedLogFileURL](self, "cachedLogFileURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v9 = 0;
  objc_msgSend(v3, "removeItemAtPath:error:", v5, &v9);
  v6 = v9;

  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100227ADC(self, (uint64_t)v6, v8);

  }
  -[FMDEventLoggerFacilityOnDiskStats loadLogs](self, "loadLogs");

}

- (id)loggedEvents
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100038FFC;
  v11 = sub_10003900C;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003927C;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)loggedEventsForEventName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats logs](self, "logs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = objc_msgSend(v6, "copy");
  return v7;
}

- (BOOL)shouldLog
{
  return 1;
}

- (void)loadLogs
{
  void *v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats archiver](self, "archiver"));
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readDictionaryAndClasses:error:", v6, &v18));
  v8 = v18;

  if (v8)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "FMDEventLoggerFacilityOnDisk read error %@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerGeneral sharedInstance](FMDEventLoggerGeneral, "sharedInstance"));
    objc_msgSend(v11, "sendError:forEventName:", v8, CFSTR("FMDEventLoggerFacilityOnDiskStatsFailedReadEventName"));

    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v7, "mutableCopy");
  }
  objc_initWeak((id *)buf, self);
  v13 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDiskStats serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003955C;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v12;
  v14 = v12;
  dispatch_async(v13, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (NSURL)cachedLogFileURL
{
  return self->_cachedLogFileURL;
}

- (void)setCachedLogFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLogFileURL, a3);
}

- (NSMutableDictionary)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
  objc_storeStrong((id *)&self->_logs, a3);
}

- (FMDataArchiver)archiver
{
  return self->_archiver;
}

- (void)setArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_archiver, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_storeStrong((id *)&self->_cachedLogFileURL, 0);
}

@end
