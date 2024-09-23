@implementation MSDServerRequestHandler

+ (id)sharedInstance
{
  if (qword_100175588 != -1)
    dispatch_once(&qword_100175588, &stru_10013FA10);
  return (id)qword_100175580;
}

- (MSDServerRequestHandler)init
{
  MSDServerRequestHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  MSDDemoUnitServer *v6;
  void *v7;
  void *v8;
  void *v9;
  MSDServerRequestHandler *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MSDServerRequestHandler;
  v2 = -[MSDServerRequestHandler init](&v12, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[MSDServerRequestHandler setDevice:](v2, "setDevice:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "udid"));
    -[MSDServerRequestHandler setDeviceUDID:](v2, "setDeviceUDID:", v5);

    -[MSDServerRequestHandler setHubServer:](v2, "setHubServer:", 0);
    -[MSDServerRequestHandler setDownloadManager:](v2, "setDownloadManager:", 0);
    v6 = objc_alloc_init(MSDDemoUnitServer);
    -[MSDServerRequestHandler setDuServer:](v2, "setDuServer:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler getDispatchTable](v2, "getDispatchTable"));
    -[MSDServerRequestHandler setDispatchTable:](v2, "setDispatchTable:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v2, CFSTR("hubHostName"), 1, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v2, CFSTR("hubPort"), 1, 0);

    -[MSDServerRequestHandler updateHubHostNameAndPort](v2, "updateHubHostNameAndPort");
    v10 = v2;
  }

  return v2;
}

- (void)handleRequestAsync:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[MSDServerRequestHandler setupRequest:](self, "setupRequest:", v5);
  v4 = -[MSDServerRequestHandler handleRequest:synchronous:](self, "handleRequest:synchronous:", v5, 0);

}

- (id)handleRequestSync:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MSDServerRequestHandler setupRequest:](self, "setupRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler handleRequest:synchronous:](self, "handleRequest:synchronous:", v4, 1));

  return v5;
}

- (id)getHmacKey
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID")));

  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  return v4;
}

- (void)autoFillRequest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = objc_opt_class(MSDCommandServerRequest, v4);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    -[MSDServerRequestHandler autoFillCommandRequest:](self, "autoFillCommandRequest:", v8);
  }
  else
  {
    v7 = objc_opt_class(MSDCDNServerRequest, v6);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      -[MSDServerRequestHandler autoFillCDNRequest:](self, "autoFillCDNRequest:", v8);
  }

}

- (void)autoFillCommandRequest:(id)a3
{
  MSDServerRequestHandler *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "server"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubHostName](v4, "hubHostName"));
    objc_msgSend(v14, "setServer:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "port"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubPort](v4, "hubPort"));
    objc_msgSend(v14, "setPort:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hubVersion"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v4, "device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hubProtocolVersion"));
    objc_msgSend(v14, "setHubVersion:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceUDID"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler deviceUDID](v4, "deviceUDID"));
    objc_msgSend(v14, "setDeviceUDID:", v13);

  }
  objc_sync_exit(v4);

}

- (void)autoFillCDNRequest:(id)a3
{
  MSDServerRequestHandler *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadCredentials"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](MSDFileDownloadCredentials, "sharedInstance"));
    objc_msgSend(v7, "setDownloadCredentials:", v6);

  }
  objc_sync_exit(v4);

}

- (void)setupRequest:(id)a3
{
  MSDServerRequestHandler *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MSDHubServer *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  MSDDownloadRequestManager *v21;
  uint64_t v22;
  void *v23;
  MSDS3Server *v24;
  id v25;

  v25 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v6 = objc_opt_class(MSDHubServerRequest, v5);
  if ((objc_opt_isKindOfClass(v25, v6) & 1) != 0
    || (v8 = objc_opt_class(MSDDownloadFileRequest, v7), (objc_opt_isKindOfClass(v25, v8) & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](v4, "hubServer"));

    if (!v10)
    {
      v11 = -[MSDHubServer initWithCellularAccess:]([MSDHubServer alloc], "initWithCellularAccess:", 1);
      -[MSDServerRequestHandler setHubServer:](v4, "setHubServer:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](v4, "hubServer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler getHmacKey](v4, "getHmacKey"));
      objc_msgSend(v12, "overrideHmacKey:", v13);

    }
  }
  v14 = objc_opt_class(MSDCDNServerRequest, v9);
  if ((objc_opt_isKindOfClass(v25, v14) & 1) != 0
    || (v16 = objc_opt_class(MSDDownloadManifestRequest, v15), (objc_opt_isKindOfClass(v25, v16) & 1) != 0)
    || (v18 = objc_opt_class(MSDDownloadIPARequest, v17), (objc_opt_isKindOfClass(v25, v18) & 1) != 0))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler downloadManager](v4, "downloadManager"));

    if (!v20)
    {
      v21 = -[MSDDownloadRequestManager initWithCellularAccess:andFDCUpdateDelegate:]([MSDDownloadRequestManager alloc], "initWithCellularAccess:andFDCUpdateDelegate:", 1, v4);
      -[MSDServerRequestHandler setDownloadManager:](v4, "setDownloadManager:", v21);

    }
  }
  v22 = objc_opt_class(MSDS3UploadRequest, v19);
  if ((objc_opt_isKindOfClass(v25, v22) & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler s3Server](v4, "s3Server"));

    if (!v23)
    {
      v24 = -[MSDS3Server initWithCellularAccess:]([MSDS3Server alloc], "initWithCellularAccess:", 1);
      -[MSDServerRequestHandler setS3Server:](v4, "setS3Server:", v24);

    }
  }
  objc_sync_exit(v4);

  -[MSDServerRequestHandler autoFillRequest:](v4, "autoFillRequest:", v25);
}

- (id)handleRequest:(id)a3 synchronous:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  NSString *v16;
  SEL v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;

  v4 = a4;
  v7 = a3;
  v8 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10009EE0C;
  v29 = sub_10009EE1C;
  v30 = 0;
  if (v4)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10009EE24;
    v22[3] = &unk_10013FA38;
    v24 = &v25;
    v8 = dispatch_semaphore_create(0);
    v23 = v8;
    objc_msgSend(v7, "setCompletion:", v22);

  }
  v9 = (objc_class *)objc_opt_class(v7, v6);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler dispatchTable](self, "dispatchTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
  v14 = objc_msgSend(v13, "containsObject:", v11);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler dispatchTable](self, "dispatchTable"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v11));
    v17 = NSSelectorFromString(v16);

    ((void (*)(MSDServerRequestHandler *, SEL, id))-[MSDServerRequestHandler methodForSelector:](self, "methodForSelector:", v17))(self, v17, v7);
  }
  else
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unrecognized request: %{public}@, ignoring...", buf, 0xCu);
    }

  }
  if (v4)
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v20;
}

- (void)handleIsEnrolled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "isEnrolled:", v4);

}

- (void)handleEnroll:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  MSDServerRequestHandler *v11;
  id v12;

  v4 = a3;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10009EF68;
  v10 = &unk_10013FA60;
  v11 = self;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
  v5 = v12;
  objc_msgSend(v4, "setCompletion:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer", v7, v8, v9, v10, v11));
  objc_msgSend(v6, "enroll:", v4);

}

- (void)handleUnenroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "unenroll:", v4);

}

- (void)handleDownloadIPA:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t, uint64_t);
  void *v17;
  MSDServerRequestHandler *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009F4A0;
  v20[3] = &unk_10013FA88;
  v20[4] = self;
  v6 = v4;
  v21 = v6;
  objc_msgSend(v5, "setCompletion:", v20);
  v7 = objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setSavePath:", 0);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10009F4B0;
  v17 = &unk_10013FA88;
  v18 = self;
  v19 = v6;
  v8 = v6;
  objc_msgSend(v7, "setCompletion:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](self, "device", v14, v15, v16, v17, v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hubProtocolVersion"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("2"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "downloadIPAPreCachingHub:", v5);
  else
    objc_msgSend(v12, "downloadIPACachingHub:", v7);

}

- (void)handleManifestDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](self, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hubProtocolVersion"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("3"));

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009F5E8;
    v11[3] = &unk_10013FAB0;
    v11[4] = self;
    v12 = v6;
    v13 = v5;
    objc_msgSend(v4, "setCompletion:", v11);
    objc_msgSend(v4, "setSavePath:", 0);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v10, "downloadManifest:", v4);

}

- (void)handleReportError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "reportError:", v4);

}

- (void)handleReportDone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "reportDone:", v4);

}

- (void)handleFMH:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler duServer](self, "duServer"));
  objc_msgSend(v5, "findMyHub:", v4);

}

- (void)handleCheckIn:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler duServer](self, "duServer"));
  objc_msgSend(v5, "checkIn:", v4);

}

- (void)handleMarkNotDemo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler duServer](self, "duServer"));
  objc_msgSend(v5, "markAsNotDemo:", v4);

}

- (void)handleStoreSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler duServer](self, "duServer"));
  objc_msgSend(v5, "storeSearch:", v4);

}

- (void)handleGetAccountSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "getAccountSettings:", v4);

}

- (void)handleDownloadFile:(id)a3
{
  id v4;
  MSDServerRequestHandler *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  MSDServerResponse *v14;
  id v15;
  uint8_t buf[24];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubHostName](v5, "hubHostName"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubPort](v5, "hubPort"));

    if (v7)
    {
      objc_sync_exit(v5);

      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler downloadManager](v5, "downloadManager"));
      objc_msgSend(v8, "downloadFileForRequest:", v4);
      v9 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getName"));
    sub_1000CA6FC(v12, buf, v11);
  }

  v15 = 0;
  sub_1000B63A4(&v15, 3727744769, (uint64_t)CFSTR("Input is invalid"));
  v9 = v15;
  objc_sync_exit(v5);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
  if (v13)
  {
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
    v14 = -[MSDServerResponse initWithError:]([MSDServerResponse alloc], "initWithError:", v9);
    ((void (**)(_QWORD, MSDServerResponse *))v8)[2](v8, v14);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)handlePing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "ping:", v4);

}

- (void)handleAck:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "ack:", v4);

}

- (void)handleS3Upload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler s3Server](self, "s3Server"));
  objc_msgSend(v5, "uploadMobileStoreDemoLogs:", v4);

}

- (void)handleKVStore:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  objc_msgSend(v5, "handleKVStore:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("hubHostName")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("hubPort")))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](self, "device"));

    if (v12 == v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", NSKeyValueChangeKindKey));
      v14 = objc_msgSend(v13, "intValue");

      if (v14 == 1)
      {
        v15 = sub_1000604F0();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138543618;
          v20 = (id)objc_opt_class(self, v17);
          v21 = 2114;
          v22 = v9;
          v18 = v20;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Observed %{public}@ change!", (uint8_t *)&v19, 0x16u);

        }
        -[MSDServerRequestHandler updateHubHostNameAndPort](self, "updateHubHostNameAndPort");
      }
    }
  }

}

- (id)updateFileDownloadCredentialFromManifestInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  MSDFileDownloadCredentialRequest *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating file download credential...", buf, 2u);
  }

  v7 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = sub_10009EE0C;
  v23 = sub_10009EE1C;
  v24 = 0;
  v8 = objc_alloc_init(MSDFileDownloadCredentialRequest);
  -[MSDServerRequestHandler autoFillCommandRequest:](self, "autoFillCommandRequest:", v8);
  -[MSDFileDownloadCredentialRequest setManifestInfo:](v8, "setManifestInfo:", v4);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10009FEE0;
  v16 = &unk_10013FA38;
  v18 = buf;
  v9 = v7;
  v17 = v9;
  -[MSDServerRequest setCompletion:](v8, "setCompletion:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer", v13, v14, v15, v16));
  objc_msgSend(v10, "getFileDownloadCredential:", v8);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v11 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (void)downloadIPAForResponse:(id)a3 withRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  MSDServerRequestHandler *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A022C;
  v19[3] = &unk_10013FAD8;
  v8 = v6;
  v20 = v8;
  v21 = self;
  v9 = v7;
  v22 = v9;
  v10 = objc_retainBlock(v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

  if (v11)
  {
    v14 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "savePath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v13));

    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler getDownloadFileRequestFromResponse:forFilePath:](self, "getDownloadFileRequestFromResponse:forFilePath:", v8, v14));
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "setCompletion:", v10);
      -[MSDServerRequestHandler handleDownloadFile:](self, "handleDownloadFile:", v16);
      goto LABEL_4;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744512, CFSTR("Unexpected server response.")));
    objc_msgSend(v8, "setError:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completion"));

  if (!v18)
    goto LABEL_5;
  v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completion"));
  ((void (**)(_QWORD, id))v16)[2](v16, v8);
LABEL_4:

LABEL_5:
}

- (void)checkIPAForResponse:(id)a3 withRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appID"));
      v22 = 138543362;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking IPA File for %{public}@", (uint8_t *)&v22, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
    v13 = objc_msgSend(v8, "fileExistsAtPath:", v12);

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v14, 0));

      if (objc_msgSend(v15, "fileSize"))
      {
LABEL_6:

        goto LABEL_7;
      }
      v20 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000CA7B8(v6);
    }
    else
    {
      v18 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000CA834(v6);
      v15 = 0;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744512, CFSTR("Unexpected server response.")));
    objc_msgSend(v5, "setError:", v21);

    goto LABEL_6;
  }
LABEL_7:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completion"));

  if (v16)
  {
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completion"));
    ((void (**)(_QWORD, id))v17)[2](v17, v5);

  }
}

- (id)getDownloadFileRequestFromResponse:(id)a3 forFilePath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  MSDDownloadFileRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originServer"));
  v9 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MSDDownloadFileDetailsProtocol);
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Details to download file are: FileName = %{public}@, OriginServer = %{public}@", (uint8_t *)&v18, 0x16u);
    }

    v13 = objc_alloc_init(MSDDownloadFileRequest);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](MSDFileDownloadCredentials, "sharedInstance"));
    -[MSDCDNServerRequest setDownloadCredentials:](v13, "setDownloadCredentials:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
    objc_msgSend(v15, "setFile:", v7);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
    objc_msgSend(v16, "setFileHash:", v7);

    -[MSDServerRequest setSavePath:](v13, "setSavePath:", v6);
    -[MSDCDNServerRequest setOriginServer:](v13, "setOriginServer:", v8);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CA8B0(v5);

    v13 = 0;
  }

  return v13;
}

- (id)getDispatchTable
{
  return &off_10014E7E0;
}

- (void)updateHubHostNameAndPort
{
  MSDServerRequestHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hubHostName"));
  -[MSDServerRequestHandler setHubHostName:](v2, "setHubHostName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hubPort"));
  -[MSDServerRequestHandler setHubPort:](v2, "setHubPort:", v6);

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubHostName](v2, "hubHostName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubPort](v2, "hubPort"));
    v11 = 136315650;
    v12 = "-[MSDServerRequestHandler updateHubHostNameAndPort]";
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - updated hub host name: %{public}@ port: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_sync_exit(v2);

}

- (NSString)hubHostName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHubHostName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)hubPort
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHubPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MSDHubServer)hubServer
{
  return (MSDHubServer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MSDDemoUnitServer)duServer
{
  return (MSDDemoUnitServer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDuServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MSDS3Server)s3Server
{
  return (MSDS3Server *)objc_getProperty(self, a2, 56, 1);
}

- (void)setS3Server:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (MSDDownloadRequestManager)downloadManager
{
  return (MSDDownloadRequestManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDownloadManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)dispatchTable
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDispatchTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTable, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_s3Server, 0);
  objc_storeStrong((id *)&self->_duServer, 0);
  objc_storeStrong((id *)&self->_hubServer, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_hubPort, 0);
  objc_storeStrong((id *)&self->_hubHostName, 0);
}

@end
