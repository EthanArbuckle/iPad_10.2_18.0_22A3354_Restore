@implementation MSDS3Server

- (MSDS3Server)initWithCellularAccess:(BOOL)a3
{
  _BOOL8 v3;
  MSDS3Server *v4;
  MSDSession *v5;
  MSDS3Server *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDS3Server;
  v4 = -[MSDS3Server init](&v8, "init");
  if (v4)
  {
    v5 = -[MSDSession initWithCellularAccess:]([MSDSession alloc], "initWithCellularAccess:", v3);
    -[MSDServer setSession:](v4, "setSession:", v5);

    v6 = v4;
  }

  return v4;
}

- (void)uploadMobileStoreDemoLogs:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MSDServerResponse *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "About to send request to S3 server to upload logs.", buf, 2u);
  }

  v7 = objc_alloc_init(MSDServerResponse);
  if ((objc_msgSend(v4, "isValid") & 1) != 0)
  {
    -[MSDS3Server launchTaskWithRequest:](self, "launchTaskWithRequest:", v4);
    v8 = 0;
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C0FF4(v4, v10);

    v13 = 0;
    sub_1000B63A4(&v13, 3727744769, (uint64_t)CFSTR("Input is invalid"));
    v8 = v13;
    -[MSDServerResponse setError:](v7, "setError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));

    if (v11)
    {
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
      ((void (**)(_QWORD, MSDServerResponse *))v12)[2](v12, v7);

    }
  }

}

- (void)launchTaskWithRequest:(id)a3
{
  id v4;
  MSDS3SessionTaskInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MSDS3SessionTaskInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "s3url"));
  -[MSDS3SessionTaskInfo setS3url:](v5, "setS3url:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "httpHeaders"));
  -[MSDS3SessionTaskInfo setHttpHeaders:](v5, "setHttpHeaders:", v7);

  -[MSDSessionTaskInfo setMaxRetry:](v5, "setMaxRetry:", objc_msgSend(v4, "retryAttempts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logFilePath"));
  -[MSDSessionTaskInfo setPostFile:](v5, "setPostFile:", v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B7168;
  v12[3] = &unk_10013F228;
  v13 = v4;
  v9 = v4;
  v10 = objc_retainBlock(v12);
  -[MSDSessionTaskInfo setHandler:](v5, "setHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
  objc_msgSend(v11, "launchTaskWithInfo:", v5);

}

@end
