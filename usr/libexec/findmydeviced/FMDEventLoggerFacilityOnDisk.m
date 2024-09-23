@implementation FMDEventLoggerFacilityOnDisk

+ (id)facilityName
{
  return CFSTR("FMDEventLoggerFacilityOnDisk");
}

- (FMDEventLoggerFacilityOnDisk)init
{
  FMDEventLoggerFacilityOnDisk *v2;
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
  v16.super_class = (Class)FMDEventLoggerFacilityOnDisk;
  v2 = -[FMDEventLoggerFacilityOnDisk init](&v16, "init");
  if (v2)
  {
    v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.findmydeviced")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.findmydeviced.eventlogger")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    -[FMDEventLoggerFacilityOnDisk setCachedLogFileURL:](v2, "setCachedLogFileURL:", v8);

    v9 = objc_alloc((Class)FMDataArchiver);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk cachedLogFileURL](v2, "cachedLogFileURL"));
    v11 = objc_msgSend(v9, "initWithFileURL:", v10);
    -[FMDEventLoggerFacilityOnDisk setArchiver:](v2, "setArchiver:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk archiver](v2, "archiver"));
    objc_msgSend(v12, "setBackedUp:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk archiver](v2, "archiver"));
    objc_msgSend(v13, "setCreateDirectories:", 1);

    v14 = dispatch_queue_create("FMDEventLoggerFacilityOnDisk.serialQueue", 0);
    -[FMDEventLoggerFacilityOnDisk setSerialQueue:](v2, "setSerialQueue:", v14);

    -[FMDEventLoggerFacilityOnDisk loadLogs](v2, "loadLogs");
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
  v5 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084DA4;
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
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;

  v4 = a3;
  if (-[FMDEventLoggerFacilityOnDisk shouldLog](self, "shouldLog"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk logs](self, "logs"));
    objc_msgSend(v5, "addObject:", v4);
    v6 = objc_msgSend(v5, "count");
    if ((unint64_t)v6 > qword_1003053A8)
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10022B674((uint64_t)v5, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk archiver](self, "archiver"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "saveArray:", v5));

    if (v10)
    {
      v11 = sub_1000031B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10022B600((uint64_t)v10, v12);

    }
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk cachedLogFileURL](self, "cachedLogFileURL"));
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
  -[FMDEventLoggerFacilityOnDisk loadLogs](self, "loadLogs");

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
  v10 = sub_100085090;
  v11 = sub_1000850A0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000850A8;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk archiver](self, "archiver"));
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSArray, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readArrayAndClasses:error:", v6, &v18));
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
    objc_msgSend(v11, "sendError:forEventName:", v8, CFSTR("FMDEventLoggerFacilityOnDiskFailedReadEventName"));

    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v7, "mutableCopy");
  }
  objc_initWeak((id *)buf, self);
  v13 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityOnDisk serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085310;
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

- (NSMutableArray)logs
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
