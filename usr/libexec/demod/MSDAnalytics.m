@implementation MSDAnalytics

+ (id)sharedInstance
{
  if (qword_100175198 != -1)
    dispatch_once(&qword_100175198, &stru_10013DC80);
  return (id)qword_100175190;
}

- (MSDAnalytics)init
{
  MSDAnalytics *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDAnalytics;
  v2 = -[MSDAnalytics init](&v8, "init");
  if (v2 && os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log"));

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v5, "createFileAtPath:contents:attributes:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log"), 0, 0);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log")));
    -[MSDAnalytics setTestFileHandle:](v2, "setTestFileHandle:", v6);

  }
  return v2;
}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
  id v6;
  id v7;
  MSDAnalytics *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Event triggered: %@, Payload: %@\n"), v6, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalytics testFileHandle](v8, "testFileHandle"));
    objc_msgSend(v10, "seekToEndOfFile");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalytics testFileHandle](v8, "testFileHandle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
    objc_msgSend(v11, "writeData:", v12);

    objc_sync_exit(v8);
  }
  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001155C;
    v13[3] = &unk_10013DCA8;
    v14 = v7;
    AnalyticsSendEventLazy(v6, v13);

  }
}

- (BOOL)rollOverCoreAnalyticsLogs
{
  char v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v2 = AnalyticsRolloverEvents(self, a2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully rolled over CA logs.", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000B8860(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v2;
}

- (BOOL)uploadCoreAnalyticsLogs
{
  id v2;
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v2 = objc_alloc_init((Class)OSASubmissionClient);
  v3 = objc_msgSend(v2, "submit");
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully uploaded outstanding CA logs to server.", v15, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1000B8890(v6, v8, v9, v10, v11, v12, v13, v14);
  }

  return v3;
}

- (BOOL)disableCoreAnalticsTransformSampling
{
  char v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v2 = AnalyticsDisableAllTransformSampling(self, a2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully disabled sampling for all transforms.", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000B88C0(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v2;
}

- (NSFileHandle)testFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTestFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testFileHandle, 0);
}

@end
