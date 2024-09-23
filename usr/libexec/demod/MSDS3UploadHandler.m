@implementation MSDS3UploadHandler

+ (id)sharedInstance
{
  if (qword_100175188 != -1)
    dispatch_once(&qword_100175188, &stru_10013D9B8);
  return (id)qword_100175180;
}

- (MSDS3UploadHandler)init
{
  MSDS3UploadHandler *v2;
  MSDS3UploadHandler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDS3UploadHandler;
  v2 = -[MSDS3UploadHandler init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MSDS3UploadHandler setUploadInProgress:](v2, "setUploadInProgress:", 0);
  return v3;
}

- (void)uploadDemoLogsTo:(id)a3 HttpHeaders:(id)a4 andMaxAttempts:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id *v34;
  id obj;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  MSDS3UploadHandler *v40;
  uint64_t *v41;
  int64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_10000B20C;
  v47 = sub_10000B21C;
  v48 = 0;
  if (-[MSDS3UploadHandler uploadInProgress](self, "uploadInProgress"))
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000B7D54(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_13;
  }
  if (!v8)
  {
    v26 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000B7D88(v18, v27, v28, v29, v30, v31, v32, v33);
LABEL_13:

    v34 = (id *)(v44 + 5);
    obj = (id)v44[5];
    sub_1000B63A4(&obj, 3727744742, (uint64_t)CFSTR("Failed to upload MobileStoreDemo logs to S3."));
    objc_storeStrong(v34, obj);
    -[MSDS3UploadHandler demoLogUploadCompleted:](self, "demoLogUploadCompleted:", v44[5]);
    goto LABEL_8;
  }
  -[MSDS3UploadHandler setUploadInProgress:](self, "setUploadInProgress:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3UploadHandler getDefaultLogFolderName](self, "getDefaultLogFolderName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3UploadHandler demoLogUploadRequest](self, "demoLogUploadRequest"));

  if (!v11)
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("s3URL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("maxRetry"));

    objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("folderName"));
    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("httpHeaders"));
    -[MSDS3UploadHandler saveDemoLogUploadRequest:](self, "saveDemoLogUploadRequest:", v12);

  }
  global_queue = dispatch_get_global_queue(9, 0);
  v15 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B224;
  block[3] = &unk_10013D9E0;
  v37 = v10;
  v38 = v8;
  v42 = a5;
  v40 = self;
  v41 = &v43;
  v39 = v9;
  v16 = v10;
  dispatch_async(v15, block);

LABEL_8:
  _Block_object_dispose(&v43, 8);

}

- (void)uploadDemoLogsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3UploadHandler demoLogUploadRequest](self, "demoLogUploadRequest"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("s3URL")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("folderName")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("httpHeaders")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("maxRetry")));
    v9 = objc_msgSend(v8, "integerValue");

    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Demod was interrupted in between demo log upload to S3! Lets try again..", v12, 2u);
    }

    -[MSDS3UploadHandler uploadDemoLogsTo:HttpHeaders:andMaxAttempts:](self, "uploadDemoLogsTo:HttpHeaders:andMaxAttempts:", v5, v7, v9);
  }

}

- (BOOL)uploadInProgress
{
  MSDS3UploadHandler *v2;
  BOOL uploadInProgress;

  v2 = self;
  objc_sync_enter(v2);
  uploadInProgress = v2->_uploadInProgress;
  objc_sync_exit(v2);

  return uploadInProgress;
}

- (void)setUploadInProgress:(BOOL)a3
{
  MSDS3UploadHandler *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_uploadInProgress = a3;
  objc_sync_exit(obj);

}

- (void)saveDemoLogUploadRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DemoLogUploadRequest"));

}

- (void)clearDemoLogUploadRequest
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("DemoLogUploadRequest"));

}

- (id)demoLogUploadRequest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DemoLogUploadRequest")));

  return v3;
}

- (id)getDefaultLogFolderName
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMddhhmmss"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringFromDate:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-log-%@"), v6, v4));
  return v7;
}

- (void)demoLogUploadCompleted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[MSDS3UploadHandler uploadInProgress](self, "uploadInProgress"))
    -[MSDS3UploadHandler clearDemoLogUploadRequest](self, "clearDemoLogUploadRequest");
  v4 = v8;
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v6, "setS3ServerFailureReason:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
    objc_msgSend(v7, "reportS3ServerFailed");

    v4 = v8;
  }

}

@end
