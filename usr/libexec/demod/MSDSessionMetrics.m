@implementation MSDSessionMetrics

+ (id)sharedInstance
{
  if (qword_1001751B8 != -1)
    dispatch_once(&qword_1001751B8, &stru_10013DE00);
  return (id)qword_1001751B0;
}

- (MSDSessionMetrics)init
{
  MSDSessionMetrics *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDSessionMetrics;
  v2 = -[MSDSessionMetrics init](&v5, "init");
  if (v2)
  {
    -[MSDSessionMetrics setIsInternalBuild:](v2, "setIsInternalBuild:", os_variant_has_internal_content("com.apple.mobilestoredemod"));
    -[MSDSessionMetrics setFileHandle:](v2, "setFileHandle:", 0);
    v3 = dispatch_queue_create("com.apple.msdconnectionmetricswork", 0);
    -[MSDSessionMetrics setWorkQueue:](v2, "setWorkQueue:", v3);

  }
  return v2;
}

- (void)extractAndUploadTimingData:(id)a3 forServerType:(id)a4
{
  id v5;
  id v6;
  MSDSessionTimingData *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MSDSessionTimingData initWithData:forServerType:]([MSDSessionTimingData alloc], "initWithData:forServerType:", v6, v5);

  -[MSDSessionTimingData uploadTimingData](v7, "uploadTimingData");
}

- (void)saveTransactionMetric:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  MSDSessionMetrics *v8;

  v4 = a3;
  if (-[MSDSessionMetrics isInternalBuild](self, "isInternalBuild"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics workQueue](self, "workQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002037C;
    v6[3] = &unk_10013DE28;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)saveToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](self, "fileHandle"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v6, "setDateFormat:", CFSTR("dd-MM-yyyy_HH:mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@_%@%@"), CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), CFSTR("MSDNetworkData"), v8, CFSTR(".csv")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v12, "removeItemAtPath:error:", v9, 0);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v13, "createFileAtPath:contents:attributes:", v9, 0, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v9));
    -[MSDSessionMetrics setFileHandle:](self, "setFileHandle:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](self, "fileHandle"));
  objc_msgSend(v15, "seekToEndOfFile");

  v16 = (id)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](self, "fileHandle"));
  objc_msgSend(v4, "saveToFile:", v16);

}

- (void)synchronizeFile
{
  void *v2;
  void *v3;
  void *v4;
  MSDSessionMetrics *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](obj, "fileHandle"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](obj, "fileHandle"));
    objc_msgSend(v3, "synchronizeFile");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](obj, "fileHandle"));
    objc_msgSend(v4, "closeFile");

    -[MSDSessionMetrics setFileHandle:](obj, "setFileHandle:", 0);
  }
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  -[MSDSessionMetrics synchronizeFile](self, "synchronizeFile");
  v3.receiver = self;
  v3.super_class = (Class)MSDSessionMetrics;
  -[MSDSessionMetrics dealloc](&v3, "dealloc");
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
