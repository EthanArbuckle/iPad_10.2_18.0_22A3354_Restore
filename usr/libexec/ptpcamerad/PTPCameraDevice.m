@implementation PTPCameraDevice

- (PTPCameraDevice)initWithDeviceContext:(id)a3
{
  id v4;
  PTPCameraDevice *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *controlBundles;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PTPCameraDevice;
  v5 = -[ICRemoteCameraDevice initWithDeviceContext:](&v16, "initWithDeviceContext:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier")));
    v5->_locationID = (unint64_t)objc_msgSend(v6, "integerValue");

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    controlBundles = v5->_controlBundles;
    v5->_controlBundles = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](v5, "cameraDictionary"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("camera"), CFSTR("ICDeviceSystemSymbolName"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](v5, "cameraDictionary"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("ICDeviceName"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](v5, "cameraDictionary"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("ICTransportTypeUSB"), CFSTR("ICDeviceTransportType"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](v5, "cameraDictionary"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Camera"), CFSTR("ICDeviceType"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](v5, "cameraDictionary"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Camera"), CFSTR("ICDeviceProductKind"));

  }
  return v5;
}

- (void)dealloc
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  PTPInitiator *initiator;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  __ICOSLogCreate();
  v3 = CFSTR("PTPCamera");
  if ((unint64_t)objc_msgSend(CFSTR("PTPCamera"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPCamera"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator transport](self->_initiator, "transport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "dealloc locID", objc_msgSend(v5, "locationID")));

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v3);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v14 = -[__CFString UTF8String](v8, "UTF8String");
    v15 = 2114;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[PTPInitiator setDelegate:](self->_initiator, "setDelegate:", 0);
  initiator = self->_initiator;
  self->_initiator = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deviceOperationQueue](self, "deviceOperationQueue"));
  objc_msgSend(v11, "waitUntilAllOperationsAreFinished");

  self->_locationID = 0;
  v12.receiver = self;
  v12.super_class = (Class)PTPCameraDevice;
  -[ICRemoteCameraDevice dealloc](&v12, "dealloc");
}

- (NSXPCListenerEndpoint)endpoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice listener](self, "listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "endpoint"));

  return (NSXPCListenerEndpoint *)v3;
}

- (NSString)internalUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](self, "cameraDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID")));

  return (NSString *)v3;
}

- (void)requestEndUsingDevice
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  __ICOSLogCreate();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestEndUsingDevice")));
  v4 = __ICLogTypeEnabled(2);
  v5 = _gICOSLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
  {
    sub_10002FB90((uint64_t)v3, v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier")));
  objc_msgSend(v6, "removeSessionsWithProcessIdentifier:", v8);

}

- (void)requestStartUsingDeviceWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __SecTask *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  unsigned int v12;
  const char *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  CFErrorRef error[5];
  audit_token_t token;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = v5;
  memset(&error[1], 0, 32);
  if (v5)
    objc_msgSend(v5, "auditToken");
  token = *(audit_token_t *)&error[1];
  v7 = SecTaskCreateWithAuditToken(0, &token);
  error[0] = 0;
  v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, error);
  CFRelease(v7);
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.Photos")) & 1) != 0
    || -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.MobileSlideShow")))
  {
    v9 = &__kCFBooleanTrue;
  }
  else
  {
    v9 = &__kCFBooleanFalse;
  }
  __ICOSLogCreate();
  v10 = CFSTR("requestStart");
  if ((unint64_t)objc_msgSend(CFSTR("requestStart"), "length") >= 0x15)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("requestStart"), "substringWithRange:", 0, 18));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

  }
  v12 = objc_msgSend(v9, "BOOLValue");
  v13 = "NO";
  if (v12)
    v13 = "YES";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Process: %@, Request Order Ascending: %s"), v8, v13));
  v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v10);
    v17 = v15;
    v18 = -[__CFString UTF8String](v16, "UTF8String");
    token.val[0] = 136446466;
    *(_QWORD *)&token.val[1] = v18;
    LOWORD(token.val[3]) = 2114;
    *(_QWORD *)((char *)&token.val[3] + 2) = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);

  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100008D0C;
  v21[3] = &unk_1000488E0;
  v21[4] = self;
  v22 = v9;
  v23 = v4;
  v19 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v21));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v20);

}

- (void)registerInterestedEventNotifications:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009C8C;
  v7[3] = &unk_100048908;
  v7[4] = self;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = v9;
  v5 = v8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v7));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v6);

}

- (void)unregisterInterestedEventNotifications:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009D98;
  v7[3] = &unk_100048908;
  v7[4] = self;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = v9;
  v5 = v8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v7));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v6);

}

- (void)requestMetadataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  PTPCameraDevice *v16;
  id v17;
  id v18;
  id v19;

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100009EC4;
  v15 = &unk_100048930;
  v16 = self;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v8 = v19;
  v9 = v18;
  v10 = v17;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v12));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);

}

- (void)requestThumbnailDataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  PTPCameraDevice *v16;
  id v17;
  id v18;
  id v19;

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10000A068;
  v15 = &unk_100048930;
  v16 = self;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v8 = v19;
  v9 = v18;
  v10 = v17;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v12));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);

}

- (void)requestDownloadObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10000A1E0;
  v13 = &unk_100048958;
  v14 = a4;
  v15 = a5;
  v7 = v15;
  v8 = v14;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v10));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v9, v10, v11, v12, v13);

}

- (void)requestReadDataFromObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PTPCameraDevice *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ICReadBufferStreamOpen")));
  if (v11)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ICReadBufferStreamClose")));

    if (!v12)
    {
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_10000A3DC;
      v18 = &unk_100048930;
      v19 = self;
      v20 = v8;
      v21 = v9;
      v22 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v15));
      -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v14, v15, v16, v17, v18, v19);

      goto LABEL_5;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v13, "addEntriesFromDictionary:", v9);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1000508C0, CFSTR("errCode"));
  (*((void (**)(id, void *))v10 + 2))(v10, v13);

LABEL_5:
}

- (void)requestDeleteObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A7A4;
  v16[3] = &unk_100048980;
  v16[4] = self;
  v17 = v8;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v20 = v10;
  v18 = v9;
  v11 = v19;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v16));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v15);

}

- (void)requestFingerprintForObjectHandle:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AADC;
  v9[3] = &unk_1000488E0;
  v9[4] = self;
  v10 = a3;
  v11 = a4;
  v6 = v11;
  v7 = v10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v8);

}

- (void)sendPTPCommand:(id)a3 andPayload:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PTPCameraDevice *v19;
  id v20;
  id v21;
  id v22;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = v11;
  v24 = 0u;
  v25 = 0u;
  if (v11)
    objc_msgSend(v11, "auditToken");
  v23[0] = v24;
  v23[1] = v25;
  if (TCCAccessCheckAuditToken(kTCCServiceCamera, v23, 0))
  {
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10000AD84;
    v18 = &unk_100048930;
    v19 = self;
    v20 = v8;
    v21 = v9;
    v22 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v15));
    -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v13, v15, v16, v17, v18, v19);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_1000508F0, CFSTR("errCode"));
    (*((void (**)(id, void *))v10 + 2))(v10, v14);

  }
}

- (void)enumerateContentWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[PTPCameraDevice setPrioritizeSpeed:](self, "setPrioritizeSpeed:", 0);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICEnumerationPrioritizeSpeed")));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICEnumerationPrioritizeSpeed"))),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        v7,
        v9))
  {
    __ICOSLogCreate();
    v10 = CFSTR("Enum-Priority");
    if ((unint64_t)objc_msgSend(CFSTR("Enum-Priority"), "length") >= 0x15)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Enum-Priority"), "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(">>> Set Prioritize Speed")));
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v10);
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      v29 = -[__CFString UTF8String](v14, "UTF8String");
      v30 = 2114;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[PTPCameraDevice setPrioritizeSpeed:](self, "setPrioritizeSpeed:", 1);
  }
  else
  {
    __ICOSLogCreate();
    v16 = CFSTR("Enum-Priority");
    if ((unint64_t)objc_msgSend(CFSTR("Enum-Priority"), "length") >= 0x15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Enum-Priority"), "substringWithRange:", 0, 18));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(">>> Set Prioritize Fidelity")));
    v19 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_retainAutorelease(v16);
      v21 = v19;
      *(_DWORD *)buf = 136446466;
      v29 = -[__CFString UTF8String](v20, "UTF8String");
      v30 = 2114;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000B118;
  v25[3] = &unk_100048908;
  v25[4] = self;
  v26 = v4;
  v27 = v5;
  v22 = v5;
  v23 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v25));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v24);

}

- (id)additionalProperties
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("ICDeviceAccessRestrictedAppleDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraDevice initiator](self, "initiator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v2, "isAccessRestrictedAppleDevice")));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  return v4;
}

- (BOOL)eject
{
  return 1;
}

- (id)itemForObjectHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraDevice initiator](self, "initiator"));
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cameraItemWithObjectID:", v6));
  return v7;
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  SEL v10;
  id v11;

  v5 = a5;
  v7 = qword_10005F480;
  v8 = (NSString *)a4;
  v11 = a3;
  if (v7 != -1)
    dispatch_once(&qword_10005F480, &stru_1000489C0);
  v9 = qword_10005F478;
  v10 = NSSelectorFromString(v8);

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, v10, 0, v5);
}

- (BOOL)acceptConnection:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  objc_super v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTPCameraDevice;
  if (!-[ICRemoteCameraDevice acceptConnection:](&v15, "acceptConnection:", v4))
  {
    v14.receiver = self;
    v14.super_class = (Class)PTPCameraDevice;
    if (!-[ICRemoteCameraDevice evaulateCommonTCC:](&v14, "evaulateCommonTCC:", v4))
    {
      v12 = 0;
      goto LABEL_10;
    }
    __ICOSLogCreate();
    v5 = CFSTR("TCC Access");
    if ((unint64_t)objc_msgSend(CFSTR("TCC Access"), "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("TCC Access"), "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Access has been granted")));
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v5);
      v10 = v8;
      v11 = -[__CFString UTF8String](v9, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v17 = v11;
      v18 = 2114;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  v12 = 1;
LABEL_10:

  return v12;
}

- (void)closeDevice
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  intptr_t v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[5];
  NSObject *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deviceOperationQueue](self, "deviceOperationQueue"));
  objc_msgSend(v4, "cancelAllOperations");

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000BCA8;
  v21[3] = &unk_1000489E8;
  v21[4] = self;
  v5 = v3;
  v22 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v21));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v6);

  v7 = dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  __ICOSLogCreate();
  v8 = objc_msgSend(CFSTR("closeDevice"), "length");
  if (v7)
  {
    if ((unint64_t)v8 >= 0x15)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("closeDevice"), "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    else
    {
      v11 = CFSTR("closeDevice");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](self, "cameraDictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(">>> Close Timed Out: %@"), v13));

    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FC04(v11, v15, (uint64_t)v14);
  }
  else
  {
    if ((unint64_t)v8 >= 0x15)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("closeDevice"), "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

    }
    else
    {
      v11 = CFSTR("closeDevice");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](self, "cameraDictionary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(">>> Device Closed: %@"), v17));

    v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v11);
      v19 = v18;
      v20 = -[__CFString UTF8String](v11, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v24 = v20;
      v25 = 2114;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

}

- (PTPInitiator)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (unint64_t)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_locationID = a3;
}

- (NSMutableArray)controlBundles
{
  return self->_controlBundles;
}

- (void)setControlBundles:(id)a3
{
  objc_storeStrong((id *)&self->_controlBundles, a3);
}

- (BOOL)prioritizeSpeed
{
  return self->_prioritizeSpeed;
}

- (void)setPrioritizeSpeed:(BOOL)a3
{
  self->_prioritizeSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlBundles, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
}

@end
