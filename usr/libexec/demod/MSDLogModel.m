@implementation MSDLogModel

+ (id)sharedInstance
{
  if (qword_1001753C0 != -1)
    dispatch_once(&qword_1001753C0, &stru_10013EE20);
  return (id)qword_1001753B8;
}

- (void)logWithFormat:(id)a3 andArgs:(char *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, a4);

  -[MSDLogModel logMessage:](self, "logMessage:", v7);
}

- (void)logMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MSDLogModel *v8;
  id v9;

  v9 = a3;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setDateFormat:", CFSTR("dd-MM-yyyy HH:mm:ss:SSS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@\n"), v6, v9));
  if (-[MSDLogModel logFP](self, "logFP"))
  {
    v8 = self;
    objc_sync_enter(v8);
    fputs((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -[MSDLogModel logFP](v8, "logFP"));
    fflush(-[MSDLogModel logFP](v8, "logFP"));
    objc_sync_exit(v8);

  }
}

- (BOOL)enableLogToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByExpandingTildeInPath"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
  v8 = 0;
  if ((objc_msgSend(v5, "fileExistsAtPath:", v7) & 1) != 0
    || objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0))
  {
    -[MSDLogModel setLogFP:](self, "setLogFP:", fopen((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), "a"));
    if (-[MSDLogModel logFP](self, "logFP"))
      v8 = 1;
  }

  return v8;
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
  v29[3] = sub_100060CBC;
  v29[4] = sub_100060CCC;
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
    v23[2] = sub_100060CD4;
    v23[3] = &unk_10013EE48;
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

- (__sFILE)logFP
{
  return self->_logFP;
}

- (void)setLogFP:(__sFILE *)a3
{
  self->_logFP = a3;
}

@end
