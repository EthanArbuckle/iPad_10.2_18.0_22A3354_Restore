@implementation MSDLogModel

+ (id)sharedInstance
{
  if (qword_10000C738 != -1)
    dispatch_once(&qword_10000C738, &stru_100008348);
  return (id)qword_10000C730;
}

- (MSDLogModel)init
{
  MSDLogModel *v2;
  MSDLogModel *v3;
  NSString *logFolderPath;
  const char *v5;
  os_log_t v6;
  OS_os_log *osLog;
  MSDLogModel *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDLogModel;
  v2 = -[MSDLogModel init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_logFP = 0;
    logFolderPath = v2->_logFolderPath;
    v2->_logFolderPath = 0;

    *(_QWORD *)&v3->_loggingLevelToFile = 0x300000001;
    v5 = getprogname();
    v6 = os_log_create("com.apple.MobileDemo", v5);
    osLog = v3->_osLog;
    v3->_osLog = (OS_os_log *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)setLoggingLevelToFile:(int)a3
{
  self->_loggingLevelToFile = a3;
}

- (void)setLoggingLevelToStdout:(int)a3
{
  self->_loggingLevelToStdout = a3;
}

- (void)logMessage:(int)a3 prefix:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  MSDLogModel *v10;
  id v11;
  id v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  FILE *logFP;
  const char *v18;
  id v19;
  NSObject *osLog;
  const char *v21;
  FILE *v22;
  void *context;
  void *v24;
  __uint64_t v25[2];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_loggingLevelToFile <= a3)
  {
    context = objc_autoreleasePoolPush();
    v25[1] = (__uint64_t)&v30;
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &v30);
    v25[0] = 0;
    pthread_threadid_np(0, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v12, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", v24));
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx %d [%@] %@ %@\n"), v25[0], getpid(), v13, v8, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    logFP = v10->_logFP;
    if (logFP)
    {
      fputs((const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), logFP);
      fflush(v10->_logFP);
    }
    if (v10->_loggingLevelToStdout <= a3)
    {
      v22 = __stdoutp;
      v21 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      v18 = getprogname();
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringToIndex:", 5)));
      fprintf(v22, "%s %s %s %s\n", v21, v18, (const char *)objc_msgSend(v19, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));

      fflush(__stdoutp);
    }
    osLog = v10->_osLog;
    if (os_log_type_enabled(osLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v8;
      v28 = 2114;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, osLog, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }

    objc_autoreleasePoolPop(context);
  }
  objc_sync_exit(v10);

}

- (BOOL)enableLogToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FILE *v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByExpandingTildeInPath"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
  v9 = 0;
  if ((objc_msgSend(v5, "fileExistsAtPath:", v7) & 1) != 0
    || objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0))
  {
    objc_storeStrong((id *)&self->_logFolderPath, v7);
    v8 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), "a");
    self->_logFP = v8;
    if (v8)
      v9 = 1;
  }

  return v9;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  char v28;
  _QWORD v29[5];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_1000024F8;
  v29[4] = sub_100002508;
  v30 = 0;
  v28 = 97;
  if ((objc_msgSend(v10, "fileExistsAtPath:", v8) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    if ((v12 & 1) == 0)
    {
      v17 = 0;
      v19 = 0;
      v13 = 0;
      goto LABEL_10;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("testWritability.log")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v28, 1));
  v15 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v13, v14, 0);

  if (!v15)
  {
    v17 = 0;
    v19 = 0;
LABEL_10:
    v21 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v10, "removeItemAtPath:error:", v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v16, (double)a5 * -86400.0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v8, 0));

  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100002510;
    v23[3] = &unk_100008370;
    v24 = v8;
    v25 = v17;
    v27 = v29;
    v26 = v10;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v23);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLogModel fileNameForTodayUnder:prefix:](self, "fileNameForTodayUnder:prefix:", v8, v9));
  v21 = -[MSDLogModel enableLogToFile:](self, "enableLogToFile:", v20);

LABEL_7:
  _Block_object_dispose(v29, 8);

  return v21;
}

- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v7, "setLocale:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 28, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@-%4ld%02ld%02ld.log"), v6, v5, objc_msgSend(v10, "year"), objc_msgSend(v10, "month"), objc_msgSend(v10, "day")));

  return v11;
}

- (NSString)logFolderPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFolderPath, 0);
  objc_storeStrong((id *)&self->_osLog, 0);
}

@end
