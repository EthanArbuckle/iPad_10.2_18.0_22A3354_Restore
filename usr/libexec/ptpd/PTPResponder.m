@implementation PTPResponder

- (void)runRunLoop
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  self->_keepRunningRunLoop = 1;
  while (self->_keepRunningRunLoop)
  {
    if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5.0, 0) - 1) <= 1)
    {
      __ICOSLogCreate();
      v3 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ptpResponder->runRunLoop has stopped\n")));
      v6 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_retainAutorelease(v3);
        v8 = v6;
        v9 = 136446466;
        v10 = -[__CFString UTF8String](v7, "UTF8String");
        v11 = 2114;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

      }
      return;
    }
  }
}

- (PTPResponder)init
{
  return -[PTPResponder initWithName:path:andTransportType:](self, "initWithName:path:andTransportType:", CFSTR("<undefined>"), CFSTR("<undefined>"), 0);
}

- (PTPResponder)initWithName:(id)a3 path:(id)a4 andTransportType:(unsigned __int16)a5
{
  int v5;
  id v8;
  id v9;
  PTPResponder *v10;
  const __CFUUID *v11;
  CFStringRef v12;
  NSString *guid;
  NSString *v14;
  NSString *name;
  NSString *v16;
  NSString *path;
  PTPDeviceUSBTransport *v18;
  PTPDeviceUSBTransport *transport;
  dispatch_queue_t v20;
  void *photoLibraryMediaQueryQueue;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  id v28;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PTPResponder;
  v10 = -[PTPResponder init](&v30, "init");
  if (v10)
  {
    v11 = CFUUIDCreate(kCFAllocatorDefault);
    v12 = CFUUIDCreateString(kCFAllocatorDefault, v11);
    guid = v10->_guid;
    v10->_guid = &v12->isa;

    CFRelease(v11);
    v14 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v8);
    name = v10->_name;
    v10->_name = v14;

    v16 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v9);
    path = v10->_path;
    v10->_path = v16;

    v10->_allowKeepAwake = 0;
    v10->_powerAssertionReleaseDelay = 1200.0;
    if (v5 == 1)
    {
      v18 = -[PTPDeviceUSBTransport initWithDelegate:]([PTPDeviceUSBTransport alloc], "initWithDelegate:", v10);
      transport = v10->_transport;
      v10->_transport = v18;

    }
    if (v10->_transport)
    {
      v20 = dispatch_queue_create("APTP Operation Queue", 0);
      photoLibraryMediaQueryQueue = v10->_photoLibraryMediaQueryQueue;
      v10->_photoLibraryMediaQueryQueue = (OS_dispatch_queue *)v20;
    }
    else
    {
      photoLibraryMediaQueryQueue = v10;
      v10 = 0;
    }

  }
  __ICOSLogCreate();
  v22 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", CFSTR("..")));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("USB Transport %p\n"), v10));
  v25 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_retainAutorelease(v22);
    v27 = v25;
    v28 = -[__CFString UTF8String](v26, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v32 = v28;
    v33 = 2114;
    v34 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(self->_transport), "cancelPreviousPerformRequestsWithTarget:", self->_transport);
  -[PTPResponder removeVirtualCamera](self, "removeVirtualCamera");
  -[PTPResponder releasePowerAssertion](self, "releasePowerAssertion");
  -[PTPDeviceUSBTransport setDelegate:](self->_transport, "setDelegate:", 0);
  -[PTPDeviceUSBTransport abortPendingIO](self->_transport, "abortPendingIO");
  v3.receiver = self;
  v3.super_class = (Class)PTPResponder;
  -[PTPResponder dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)openSession:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  PTPOperationResponsePacket *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = objc_msgSend(v4, "parameter1");

  if ((_DWORD)v5 || !v6)
  {
    v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8221, v5);
  }
  else
  {
    if (self->_sessionID)
    {
      v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:parameter1:", 8222, 0, self->_sessionID);
    }
    else
    {
      self->_sessionID = v6;
      v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8193, 0);
      -[PTPVirtualCamera openSession](self->_virtualCamera, "openSession");
    }
    self->_lastTransactionID = 0;
  }
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v7);
  if (!-[PTPResponder usingPeerMediaCapabilities](self, "usingPeerMediaCapabilities"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPResponder usingMTP](self, "usingMTP"));

    if (!v8)
    {
      v9 = sub_10000D990();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12[0] = PLPTPHostCharacteristicsKeyMake;
      v12[1] = PLPTPHostCharacteristicsKeyOS;
      v13[0] = PLPTPHostCharacteristicMake_Microsoft;
      v13[1] = PLPTPHostCharacteristicOS_Windows;
      v12[2] = PLPTPHostCharacteristicsKeyTransport;
      v13[2] = PLPTPHostCharacteristicTransport_PTP;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
      objc_msgSend(v10, "setHostCharacteristics:", v11);

    }
  }

}

- (void)closeSession:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  PTPOperationResponsePacket *v7;

  v4 = objc_msgSend(a3, "transactionID");
  v5 = v4;
  if (self->_sessionID)
  {
    if (v4 <= self->_lastTransactionID)
    {
      v6 = 8196;
      goto LABEL_6;
    }
    -[PTPVirtualCamera closeSession](self->_virtualCamera, "closeSession");
    self->_lastTransactionID = 0;
    self->_sessionID = 0;
  }
  v6 = 8193;
LABEL_6:
  v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v6, v5);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v7);

}

- (void)getDeviceInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  PTPDataPacket *v8;
  id v9;
  void *v10;
  PTPDataPacket *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  PTPOperationResponsePacket *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  if (self->_sessionID && v5 <= self->_lastTransactionID)
  {
    __ICOSLogCreate();
    v13 = CFSTR("getDeviceInfo");
    if ((unint64_t)objc_msgSend(CFSTR("getDeviceInfo"), "length") >= 0x15)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("getDeviceInfo"), "substringWithRange:", 0, 18));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("responder[session: %d, : transaction: %d], request[transaction: %d]"), self->_sessionID, self->_lastTransactionID, v6));
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v13);
      v18 = v16;
      *(_DWORD *)buf = 136446466;
      v21 = -[__CFString UTF8String](v17, "UTF8String");
      v22 = 2114;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[PTPResponder resetResponderSession](self, "resetResponderSession");
    v12 = 8196;
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera deviceInfoDataset](self->_virtualCamera, "deviceInfoDataset"));
  if (v7)
  {
    v8 = [PTPDataPacket alloc];
    v9 = objc_msgSend(v4, "operationCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
    v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:](v8, "initWithOperationCode:transactionID:andData:", v9, v6, v10);

    -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v11);
  }
  if (self->_sessionID)
    self->_lastTransactionID = v6;

  if (!v7)
  {
    v12 = 8198;
LABEL_14:
    v19 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v12, v6);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v19);

  }
}

- (void)getStorageIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  PTPDataPacket *v9;
  uint64_t v10;
  PTPOperationResponsePacket *v11;
  unsigned int *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  if (!self->_sessionID)
  {
    v10 = 8195;
LABEL_6:
    v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v10, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v11);

    goto LABEL_7;
  }
  if (v5 <= self->_lastTransactionID)
  {
    v10 = 8196;
    goto LABEL_6;
  }
  self->_lastTransactionID = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera allStorageIDs](self->_virtualCamera, "allStorageIDs"));
  v8 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 4 * (_QWORD)objc_msgSend(v7, "count") + 4));
  v12 = (unsigned int *)objc_msgSend(v8, "mutableBytes");
  sub_100020958(&v12, v7);
  v9 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v6, v8);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v9);

LABEL_7:
}

- (void)getStorageInfo:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  PTPOperationResponsePacket *v7;
  PTPDataPacket *v8;
  id v9;
  void *v10;
  PTPDataPacket *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "transactionID");
  v5 = v4;
  if (!self->_sessionID)
  {
    v12 = 8195;
LABEL_8:
    v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v12, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v7);
    goto LABEL_9;
  }
  if (v4 <= self->_lastTransactionID)
  {
    v12 = 8196;
    goto LABEL_8;
  }
  self->_lastTransactionID = v4;
  v6 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageInfoDatasetForStorageID:](self->_virtualCamera, "storageInfoDatasetForStorageID:", objc_msgSend(v13, "parameter1")));
  if (!v6)
  {
    v12 = 8200;
    goto LABEL_8;
  }
  v7 = (PTPOperationResponsePacket *)v6;
  v8 = [PTPDataPacket alloc];
  v9 = objc_msgSend(v13, "operationCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPOperationResponsePacket content](v7, "content"));
  v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:](v8, "initWithOperationCode:transactionID:andData:", v9, v5, v10);

  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v11);
LABEL_9:

}

- (void)getNumObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned __int16 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PTPOperationResponsePacket *v13;
  PTPOperationResponsePacket *v14;
  PTPOperationResponsePacket *v15;
  uint64_t v16;
  unsigned __int16 v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  if (!self->_sessionID)
  {
    v15 = [PTPOperationResponsePacket alloc];
    v16 = 8195;
LABEL_8:
    v14 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v15, "initWithResponseCode:transactionID:", v16, v6);
    goto LABEL_9;
  }
  if (v5 <= self->_lastTransactionID)
  {
    v15 = [PTPOperationResponsePacket alloc];
    v16 = 8196;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v4, "parameter1");
  v8 = (unsigned __int16)objc_msgSend(v4, "parameter2");
  v9 = objc_msgSend(v4, "parameter3");
  v17 = 0;
  self->_lastTransactionID = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectHandlesInStorage:forObjectFormatCode:inAssociation:responseCode:](self->_virtualCamera, "objectHandlesInStorage:forObjectFormatCode:inAssociation:responseCode:", v7, v8, v9, &v17));
  v11 = v10;
  v12 = 0;
  if (v17 == 8193)
    v12 = objc_msgSend(v10, "count");
  v13 = [PTPOperationResponsePacket alloc];
  v14 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:](v13, "initWithResponseCode:transactionID:parameter1:", v17, v6, v12);

LABEL_9:
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v14);

}

+ (void)getFilesystemMediaCountForDirectories:(int *)a3 media:(int *)a4 nonMedia:(int *)a5
{
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;

  v38 = 0;
  v37 = 0;
  objc_msgSend(a1, "catalogPath:dirs:media:nonMedia:", "/var/mobile/Media/DCIM/", (char *)&v38 + 4, &v38, &v37);
  objc_msgSend(a1, "catalogPath:dirs:media:nonMedia:", "/var/mobile/Media/PhotoData/CPLAssets/", (char *)&v38 + 4, &v38, &v37);
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("------- [%9s] --------"), "File System"));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    v15 = -[__CFString UTF8String](v13, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v40 = v15;
    v41 = 2114;
    v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v16 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%9d] Directories"), HIDWORD(v38)));
  v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v16);
    v21 = v19;
    v22 = -[__CFString UTF8String](v20, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v40 = v22;
    v41 = 2114;
    v42 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v23 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("..")));

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%9d] Asset(s)"), v38));
  v26 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_retainAutorelease(v23);
    v28 = v26;
    v29 = -[__CFString UTF8String](v27, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v40 = v29;
    v41 = 2114;
    v42 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v30 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingString:", CFSTR("..")));

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%9d] Non-Media"), v37));
  v33 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_retainAutorelease(v30);
    v35 = v33;
    v36 = -[__CFString UTF8String](v34, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v40 = v36;
    v41 = 2114;
    v42 = v32;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (a3)
    *a3 = HIDWORD(v38);
  if (a4)
    *a4 = v38;
  if (a5)
    *a5 = v37;
}

- (void)getNumDownloadableObjects:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  PTPOperationResponsePacket *v12;
  PTPOperationResponsePacket *v13;
  PTPOperationResponsePacket *v14;
  uint64_t v15;
  PTPOperationResponsePacket *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = 0;
  HIDWORD(v17) = 0;
  v4 = a3;
  +[PTPResponder getFilesystemMediaCountForDirectories:media:nonMedia:](PTPResponder, "getFilesystemMediaCountForDirectories:media:nonMedia:", (char *)&v18 + 4, &v18, (char *)&v17 + 4);
  -[PTPResponder setUsingLegacyOS:](self, "setUsingLegacyOS:", 1);
  v5 = objc_msgSend(v4, "transactionID");

  if (!self->_sessionID)
  {
    v14 = [PTPOperationResponsePacket alloc];
    v15 = 8195;
LABEL_6:
    v13 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v14, "initWithResponseCode:transactionID:", v15, v5);
    goto LABEL_7;
  }
  if (v5 <= self->_lastTransactionID)
  {
    v14 = [PTPOperationResponsePacket alloc];
    v15 = 8196;
    goto LABEL_6;
  }
  v6 = v18;
  v7 = HIDWORD(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera ptpSecurityModel](self->_virtualCamera, "ptpSecurityModel"));
  v9 = objc_msgSend(v8, "shouldRemovePlaceholderStorage") ^ 1;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera ptpSecurityModel](self->_virtualCamera, "ptpSecurityModel"));
  v11 = objc_msgSend(v10, "hostIsTrusted");

  self->_lastTransactionID = v5;
  v12 = [PTPOperationResponsePacket alloc];
  LODWORD(v17) = 0;
  v13 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:parameter2:parameter3:parameter4:parameter5:](v12, "initWithResponseCode:transactionID:parameter1:parameter2:parameter3:parameter4:parameter5:", 8193, v5, v6, v7, v9, v11, v17);
LABEL_7:
  v16 = v13;
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v13);

}

- (void)getObjectHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned __int16 v8;
  id v9;
  PTPOperationResponsePacket *v10;
  PTPOperationResponsePacket *v11;
  id v12;
  PTPDataPacket *v13;
  PTPOperationResponsePacket *v14;
  unsigned int *v15;
  unsigned __int16 v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v16 = 8195;
  if (!self->_sessionID)
    goto LABEL_7;
  if (v5 <= self->_lastTransactionID)
  {
    v16 = 8196;
LABEL_7:
    v14 = [PTPOperationResponsePacket alloc];
    v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v14, "initWithResponseCode:transactionID:", v16, v6);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v11);
    goto LABEL_8;
  }
  v7 = objc_msgSend(v4, "parameter1");
  v8 = (unsigned __int16)objc_msgSend(v4, "parameter2");
  v9 = objc_msgSend(v4, "parameter3");
  self->_lastTransactionID = v6;
  v10 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectHandlesInStorage:forObjectFormatCode:inAssociation:responseCode:](self->_virtualCamera, "objectHandlesInStorage:forObjectFormatCode:inAssociation:responseCode:", v7, v8, v9, &v16));
  v11 = v10;
  if (v16 != 8193)
  {

    goto LABEL_7;
  }
  v12 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 4 * (_QWORD)-[PTPOperationResponsePacket count](v10, "count") + 4));
  v15 = (unsigned int *)objc_msgSend(v12, "mutableBytes");
  sub_100020958(&v15, v11);
  v13 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v6, v12);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v13);

LABEL_8:
}

- (void)getObjectInfo:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  PTPOperationResponsePacket *v7;
  PTPDataPacket *v8;
  id v9;
  void *v10;
  PTPDataPacket *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "transactionID");
  v5 = v4;
  if (!self->_sessionID)
  {
    v12 = 8195;
LABEL_8:
    v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v12, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v7);
    goto LABEL_9;
  }
  if (v4 <= self->_lastTransactionID)
  {
    v12 = 8196;
    goto LABEL_8;
  }
  self->_lastTransactionID = v4;
  v6 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", objc_msgSend(v13, "parameter1")));
  if (!v6)
  {
    v12 = 8201;
    goto LABEL_8;
  }
  v7 = (PTPOperationResponsePacket *)v6;
  v8 = [PTPDataPacket alloc];
  v9 = objc_msgSend(v13, "operationCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPOperationResponsePacket content](v7, "content"));
  v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:](v8, "initWithOperationCode:transactionID:andData:", v9, v5, v10);

  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v11);
LABEL_9:

}

- (void)getObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  PTPOperationResponsePacket *v16;
  PTPDataPacket *v17;
  PTPDataPacket *v18;
  __int16 v19;
  PTPOperationResponsePacket *v20;
  int v21;
  unsigned __int16 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v22 = 8195;
  if (!self->_sessionID)
    goto LABEL_15;
  if (v5 <= self->_lastTransactionID)
  {
    v22 = 8196;
LABEL_15:
    v20 = [PTPOperationResponsePacket alloc];
    v16 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v20, "initWithResponseCode:transactionID:", v22, v6);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v16);
    goto LABEL_16;
  }
  v21 = 0;
  self->_lastTransactionID = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", objc_msgSend(v4, "parameter1")));
  __ICOSLogCreate();
  v8 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filename"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--- >getObject: %@"), v10));

  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v8);
    v14 = v12;
    *(_DWORD *)buf = 136446466;
    v24 = -[__CFString UTF8String](v13, "UTF8String");
    v25 = 2114;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v15 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera dataSourceForObjectHandle:responseCode:size:](self->_virtualCamera, "dataSourceForObjectHandle:responseCode:size:", objc_msgSend(v4, "parameter1"), &v22, &v21));
  v16 = (PTPOperationResponsePacket *)v15;
  if (v22 != 8193 || !v15)
  {
    v19 = 8199;
LABEL_14:
    v22 = v19;

    goto LABEL_15;
  }
  v17 = -[PTPDataPacket initWithOperationCode:transactionID:andDataSource:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andDataSource:", objc_msgSend(v4, "operationCode"), v6, v15);
  if (!v17)
  {
    v19 = 8221;
    goto LABEL_14;
  }
  v18 = v17;
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v17);

LABEL_16:
}

- (void)getThumb:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  unsigned int v12;
  __int16 v13;
  _QWORD block[4];
  id v15;
  id v16;
  PTPResponder *v17;
  unsigned int v18;
  __int16 v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v19 = 8195;
  if (!self->_sessionID)
    goto LABEL_11;
  if (v5 <= self->_lastTransactionID)
  {
    v19 = 8196;
LABEL_11:
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100023FEC;
    v11[3] = &unk_100048D20;
    v13 = v19;
    v12 = v6;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "numParameters") == 2)
    v7 = objc_msgSend(v4, "parameter2");
  else
    v7 = 0;
  self->_lastTransactionID = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera thumbnailForObjectHandle:maxPixelSize:responseCode:](self->_virtualCamera, "thumbnailForObjectHandle:maxPixelSize:responseCode:", objc_msgSend(v4, "parameter1"), v7, &v19));
  v9 = v8;
  if (v19 != 8193 || !v8)
  {
    v19 = 8208;

    goto LABEL_11;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023F78;
  block[3] = &unk_100048CF8;
  v18 = v6;
  v15 = v4;
  v16 = v9;
  v17 = self;
  v10 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_12:
}

- (void)getObjectMetadata:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  unsigned int v11;
  __int16 v12;
  _QWORD block[4];
  id v14;
  id v15;
  PTPResponder *v16;
  unsigned int v17;
  __int16 v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v18 = 8195;
  if (!self->_sessionID)
    goto LABEL_8;
  if (v5 <= self->_lastTransactionID)
  {
    v18 = 8196;
LABEL_8:
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100024228;
    v10[3] = &unk_100048D20;
    v12 = v18;
    v11 = v6;
    v10[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    goto LABEL_9;
  }
  self->_lastTransactionID = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera embeddedMetadataForObjectHandle:responseCode:](self->_virtualCamera, "embeddedMetadataForObjectHandle:responseCode:", objc_msgSend(v4, "parameter1"), &v18));
  v8 = v7;
  if (v18 != 8193 || !v7)
  {
    v18 = 8208;

    goto LABEL_8;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000241B4;
  block[3] = &unk_100048CF8;
  v17 = v6;
  v14 = v4;
  v15 = v8;
  v16 = self;
  v9 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_9:
}

- (void)getPartialObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  PTPOperationResponsePacket *v8;
  PTPDataPacket *v9;
  unsigned int v10;
  void *v11;
  PTPOperationResponsePacket *v12;
  int v13;
  unsigned __int16 v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v14 = 8195;
  if (!self->_sessionID)
    goto LABEL_15;
  if (v5 <= self->_lastTransactionID)
  {
    v14 = 8196;
LABEL_15:
    v12 = [PTPOperationResponsePacket alloc];
    v8 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:](v12, "initWithResponseCode:transactionID:parameter1:", v14, v6, 0);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v8);
    goto LABEL_16;
  }
  v13 = 0;
  self->_lastTransactionID = v5;
  v7 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera dataSourceForObjectHandle:responseCode:size:](self->_virtualCamera, "dataSourceForObjectHandle:responseCode:size:", objc_msgSend(v4, "parameter1"), &v14, &v13));
  v8 = (PTPOperationResponsePacket *)v7;
  if (v14 != 8193 || !v7)
  {
    v14 = 8199;
LABEL_14:

    goto LABEL_15;
  }
  v9 = -[PTPDataPacket initWithOperationCode:transactionID:andDataSource:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andDataSource:", objc_msgSend(v4, "operationCode"), v6, v7);
  if (objc_msgSend(v4, "parameter3") == -1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", objc_msgSend(v4, "parameter1")));
    v10 = -[PTPDataPacket setRange:](v9, "setRange:", objc_msgSend(v4, "parameter2"), objc_msgSend(v11, "objectCompressedSize64") - objc_msgSend(v4, "parameter2"));

    if (!v9)
    {
LABEL_13:
      v14 = 8221;

      goto LABEL_14;
    }
  }
  else
  {
    v10 = -[PTPDataPacket setRange:](v9, "setRange:", objc_msgSend(v4, "parameter2"), objc_msgSend(v4, "parameter3"));
    if (!v9)
      goto LABEL_13;
  }
  if (v10)
    goto LABEL_13;
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v9);

LABEL_16:
}

- (void)getObjectInfoForObjectsInStorage:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  unsigned __int16 v8;
  id v9;
  uint64_t v10;
  PTPOperationResponsePacket *v11;
  PTPDataPacket *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  unsigned __int16 v23;
  mach_timebase_info info;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  info = 0;
  mach_timebase_info(&info);
  dword_10005E46C = 0;
  *(float *)&dword_10005E46C = (float)mach_absolute_time();
  v5 = objc_msgSend(v4, "transactionID");
  v23 = 8195;
  v6 = objc_msgSend(v4, "parameter1");
  if (!self->_sessionID)
    goto LABEL_6;
  v7 = dword_10005E280;
  sub_100004C04(1);
  if (v5 <= self->_lastTransactionID)
  {
    v23 = 8196;
LABEL_6:
    v11 = [PTPOperationResponsePacket alloc];
    v12 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v11, "initWithResponseCode:transactionID:", v23, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v12);
    goto LABEL_22;
  }
  v8 = (unsigned __int16)objc_msgSend(v4, "parameter2");
  v9 = objc_msgSend(v4, "parameter3");
  if (objc_msgSend(v4, "operationCode") == 36866)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v4, "operationCode") == 36869)
  {
    v10 = 2;
  }
  else if (objc_msgSend(v4, "operationCode") == 4131)
  {
    v10 = 3;
  }
  else
  {
    v10 = 0xFFFFFFFFLL;
  }
  self->_lastTransactionID = v5;
  if ((_DWORD)v6 == v7)
  {
    v23 = 8193;
    *(_DWORD *)buf = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 4));
    goto LABEL_14;
  }
  v14 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera pathObjectInfoForObjectsInStorage:forObjectFormatCode:inAssociation:withContentType:responseCode:](self->_virtualCamera, "pathObjectInfoForObjectsInStorage:forObjectFormatCode:inAssociation:withContentType:responseCode:", v6, v14, v9, v10, &v23));
  if (v15)
  {
    if (v23 == 8193)
    {
LABEL_20:
      v12 = -[PTPDataPacket initWithOperationCode:transactionID:andFilepath:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andFilepath:", objc_msgSend(v4, "operationCode"), v5, v15);
      -[PTPDataPacket setUnlinkWhenDone:](v12, "setUnlinkWhenDone:", 1);
      v13 = v15;
      goto LABEL_21;
    }
    v13 = 0;
    goto LABEL_28;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoForObjectsInStorage:forObjectFormatCode:inAssociation:withContentType:responseCode:](self->_virtualCamera, "objectInfoForObjectsInStorage:forObjectFormatCode:inAssociation:withContentType:responseCode:", v6, v14, v9, v10, &v23));
  if (v23 != 8193)
  {
LABEL_28:
    v23 = 8199;

    goto LABEL_6;
  }
LABEL_14:
  if (!v13)
  {
    v15 = 0;
    goto LABEL_20;
  }
  v12 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v13);
LABEL_21:

  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v12);
LABEL_22:

  *(float *)&dword_10005E468 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005E46C)
                                             * (float)info.numer)
                                     / (float)info.denom)
                             / 1000000.0;
  __ICOSLogCreate();
  v16 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[PTPResponder getObjectInfoForObjectsInStorage] spent %5.2fms building assets for ptpd storageID: 0x%x"), *(float *)&dword_10005E468, v6));
  v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v16);
    v21 = v19;
    v22 = -[__CFString UTF8String](v20, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v26 = v22;
    v27 = 2114;
    v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (void)getObjectCompressedSize64:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  PTPDataPacket *v9;
  uint64_t v10;
  PTPOperationResponsePacket *v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = objc_alloc_init((Class)NSMutableData);
  if (!self->_sessionID)
    goto LABEL_5;
  if (v5 <= self->_lastTransactionID)
  {
    v10 = 8196;
    goto LABEL_7;
  }
  self->_lastTransactionID = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", objc_msgSend(v4, "parameter1")));
  if (!v7)
  {
LABEL_5:
    v10 = 8195;
LABEL_7:
    v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v10, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v11);

    goto LABEL_8;
  }
  v8 = v7;
  v12 = objc_msgSend(v7, "objectCompressedSize64");
  objc_msgSend(v6, "appendBytes:length:", &v12, 8);
  v9 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v6);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v9);

LABEL_8:
}

- (void)getPartialObject64:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  PTPOperationResponsePacket *v17;
  PTPDataPacket *v18;
  PTPDataPacket *v19;
  PTPOperationResponsePacket *v20;
  int v21;
  unsigned __int16 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v22 = 8195;
  if (self->_sessionID)
  {
    if (v5 <= self->_lastTransactionID)
    {
      v22 = 8196;
    }
    else
    {
      v21 = 0;
      v7 = objc_msgSend(v4, "parameter3");
      v8 = objc_msgSend(v4, "parameter2") | ((_QWORD)v7 << 32);
      v9 = objc_msgSend(v4, "parameter5");
      v10 = objc_msgSend(v4, "parameter4") | ((_QWORD)v9 << 32);
      __ICOSLogCreate();
      v11 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Get Partial Object: Length:[%llu] Offset:[%llu] \n"), v10, v8));
      v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease(v11);
        v16 = v14;
        *(_DWORD *)buf = 136446466;
        v24 = -[__CFString UTF8String](v15, "UTF8String");
        v25 = 2114;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      self->_lastTransactionID = v6;
      v17 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera dataSourceForObjectHandle:responseCode:size:](self->_virtualCamera, "dataSourceForObjectHandle:responseCode:size:", objc_msgSend(v4, "parameter1"), &v22, &v21));
      -[PTPOperationResponsePacket setToggleHeaderOffset:](v17, "setToggleHeaderOffset:", 1);
      if (v22 == 8193 && v17)
      {
        v18 = -[PTPDataPacket initWithOperationCode:transactionID:andDataSource:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andDataSource:", objc_msgSend(v4, "operationCode"), v6, v17);
        v19 = v18;
        if (v18 && !-[PTPDataPacket setRange:](v18, "setRange:", v8, v10))
        {
          -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v19);

          goto LABEL_16;
        }
        v22 = 8221;

      }
      else
      {
        v22 = 8199;
      }

    }
  }
  v20 = [PTPOperationResponsePacket alloc];
  v17 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:](v20, "initWithResponseCode:transactionID:parameter1:", v22, v6, 0);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v17);
LABEL_16:

}

- (void)getObjectInfoForNextObjectGroupInStorage:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  PTPOperationResponsePacket *v9;
  PTPOperationResponsePacket *v10;
  PTPDataPacket *v11;
  PTPOperationResponsePacket *v12;
  uint64_t v13;
  unsigned __int16 v14;
  mach_timebase_info info;

  v4 = a3;
  info = 0;
  mach_timebase_info(&info);
  dword_10005E46C = 0;
  *(float *)&dword_10005E46C = (float)mach_absolute_time();
  v5 = objc_msgSend(v4, "transactionID");
  v14 = 8195;
  v6 = objc_msgSend(v4, "parameter1");
  if (!self->_sessionID)
    goto LABEL_9;
  v7 = v6;
  v8 = dword_10005E280;
  sub_100004C04(1);
  if (v5 <= self->_lastTransactionID)
  {
    v14 = 8196;
    goto LABEL_9;
  }
  self->_lastTransactionID = v5;
  if ((_DWORD)v7 != v8)
  {
    v10 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoForNextObjectGroupInStorage:responseCode:](self->_virtualCamera, "objectInfoForNextObjectGroupInStorage:responseCode:", v7, &v14));
    v9 = v10;
    if (v14 == 8193)
      goto LABEL_7;
    v14 = 8199;

LABEL_9:
    v12 = [PTPOperationResponsePacket alloc];
    v9 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v12, "initWithResponseCode:transactionID:", v14, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v9);
    goto LABEL_10;
  }
  v14 = 8193;
  v13 = 0;
  v9 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13, 8));
LABEL_7:
  v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v9);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v11);

LABEL_10:
  *(float *)&dword_10005E468 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005E46C)
                                             * (float)info.numer)
                                     / (float)info.denom)
                             / 1000000.0;

}

- (void)getUserAssignedDeviceName:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  PTPDataPacket *v11;
  uint64_t v12;
  PTPOperationResponsePacket *v13;
  _BYTE *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  if (!self->_sessionID)
  {
    v12 = 8195;
LABEL_9:
    v13 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v12, v6);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v13);

    goto LABEL_10;
  }
  if (v5 <= self->_lastTransactionID)
  {
    v12 = 8196;
    goto LABEL_9;
  }
  self->_lastTransactionID = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera userAssignedName](self->_virtualCamera, "userAssignedName"));
  v8 = objc_msgSend(v7, "length");
  if (!v8
    || (v9 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 2 * (_QWORD)v8 + 3)) == 0)
  {

    v12 = 8194;
    goto LABEL_9;
  }
  v10 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v10, "mutableBytes");
  sub_10002071C(&v14, v7);
  v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v6, v10);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v11);

LABEL_10:
}

- (void)deleteObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  __int16 v8;
  PTPOperationResponsePacket *v9;
  PTPOperationResponsePacket *v10;
  unsigned __int16 v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  v11 = 8195;
  if (self->_sessionID)
  {
    if (v5 <= self->_lastTransactionID)
    {
      v8 = 8196;
    }
    else
    {
      v7 = objc_msgSend(v4, "parameter1");
      self->_lastTransactionID = v6;
      if ((_DWORD)v7 != -1)
      {
        -[PTPVirtualCamera deleteObjectWithObjectHandle:responseCode:](self->_virtualCamera, "deleteObjectWithObjectHandle:responseCode:", v7, &v11);
        goto LABEL_8;
      }
      v8 = 8198;
    }
    v11 = v8;
  }
LABEL_8:
  v9 = [PTPOperationResponsePacket alloc];
  v10 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v9, "initWithResponseCode:transactionID:", v11, v6);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v10);

}

+ (void)catalogPath:(char *)a3 dirs:(int *)a4 media:(int *)a5 nonMedia:(int *)a6
{
  DIR *v11;
  DIR *v12;
  dirent *i;
  const char *d_name;
  char *v15;
  const char *v16;
  char __str[1024];

  v11 = opendir(a3);
  if (v11)
  {
    v12 = v11;
    for (i = readdir(v11); i; i = readdir(v12))
    {
      if (i->d_type == 4)
      {
        d_name = i->d_name;
        if (strcmp(i->d_name, "."))
        {
          if (strcmp(d_name, ".."))
          {
            ++*a4;
            snprintf(__str, 0x400uLL, "%s/%s", a3, d_name);
            objc_msgSend(a1, "catalogPath:dirs:media:nonMedia:", __str, a4, a5, a6);
          }
        }
      }
      else
      {
        v15 = strrchr(i->d_name, 46);
        if (v15 && ((v16 = v15, !strcmp(v15, ".AAE")) || !strcmp(v16, ".DBG")))
          ++*a6;
        else
          ++*a5;
      }
    }
    closedir(v12);
  }
}

- (BOOL)handleSetHostMediaCapabilities:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  PTPOperationResponsePacket *v8;

  v4 = a3;
  -[PTPResponder setUsingMacOS:](self, "setUsingMacOS:", 1);
  v5 = objc_msgSend(v4, "transactionID");

  if (self->_sessionID && v5 <= self->_lastTransactionID)
  {
    v7 = 8196;
    goto LABEL_7;
  }
  v6 = -[PTPDeviceUSBTransport readBulkData](self->_transport, "readBulkData");
  if (self->_sessionID)
  {
    self->_lastTransactionID = v5;
    if (v6)
    {
LABEL_5:
      v7 = 8194;
LABEL_7:
      v8 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v7, v5);
      -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v8);

      return 0;
    }
  }
  else if (v6)
  {
    goto LABEL_5;
  }
  return 1;
}

- (BOOL)handleSetHostSupportsGroups:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  PTPOperationResponsePacket *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("Group");
  if ((unint64_t)objc_msgSend(CFSTR("Group"), "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Group"), "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Group")));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    v15 = 136446466;
    v16 = -[__CFString UTF8String](v9, "UTF8String");
    v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v15, 0x16u);

  }
  v11 = objc_msgSend(v4, "transactionID");

  if (self->_sessionID && v11 <= self->_lastTransactionID)
  {
    v12 = 8196;
  }
  else
  {
    -[PTPVirtualCamera setHostSupportsGroups:](self->_virtualCamera, "setHostSupportsGroups:", 1);
    if (self->_sessionID)
      self->_lastTransactionID = v11;
    v12 = 8193;
  }
  v13 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v12, v11);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v13);

  return 0;
}

- (BOOL)handleSetHostSupportedFormats:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  PTPOperationResponsePacket *v8;

  v4 = a3;
  -[PTPResponder setUsingWindows](self, "setUsingWindows");
  v5 = objc_msgSend(v4, "transactionID");

  if (self->_sessionID && v5 <= self->_lastTransactionID)
  {
    v7 = 8196;
    goto LABEL_7;
  }
  v6 = -[PTPDeviceUSBTransport readBulkData](self->_transport, "readBulkData");
  if (self->_sessionID)
  {
    self->_lastTransactionID = v5;
    if (v6)
    {
LABEL_5:
      v7 = 8194;
LABEL_7:
      v8 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v7, v5);
      -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v8);

      return 0;
    }
  }
  else if (v6)
  {
    goto LABEL_5;
  }
  return 1;
}

- (void)handleUnsupportedRequest:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  PTPOperationResponsePacket *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  __ICOSLogCreate();
  v5 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%x] -> Unsupported PTP Command Received"), objc_msgSend(v4, "operationCode")));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v13 = -[__CFString UTF8String](v9, "UTF8String");
    v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8197, objc_msgSend(v4, "transactionID"));
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v11);

}

- (id)handleRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  unsigned int v15;
  OS_dispatch_queue *photoLibraryMediaQueryQueue;
  void *v17;
  PTPOperationResponsePacket *v18;
  OS_dispatch_queue *v19;
  _BOOL8 v20;
  _BOOL8 v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  _QWORD block[5];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%x]"), objc_msgSend(v4, "operationCode")));
  __ICOSLogCreate();
  v6 = v5;
  v7 = v6;
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 0, 18));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

  }
  v9 = sub_1000209EC((uint64_t)objc_msgSend(v4, "operationCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<op> %@"), v10));

  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v7);
    v14 = v12;
    *(_DWORD *)buf = 136446466;
    v29 = objc_msgSend(v13, "UTF8String");
    v30 = 2114;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v15 = objc_msgSend(v4, "operationCode");
  switch(v15)
  {
    case 0x1001u:
      -[PTPResponder getDeviceInfo:](self, "getDeviceInfo:", v4);
      goto LABEL_45;
    case 0x1002u:
      -[PTPResponder openSession:](self, "openSession:", v4);
      goto LABEL_45;
    case 0x1003u:
      -[PTPResponder closeSession:](self, "closeSession:", v4);
      if (-[PTPDeviceUSBTransport type](self->_transport, "type") == 3)
      {
        -[PTPResponder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "stop", 0, 0);
        -[PTPResponder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "stopRunLoop", 0, 0);
      }
      goto LABEL_45;
    case 0x1004u:
      -[PTPResponder getStorageIDs:](self, "getStorageIDs:", v4);
      goto LABEL_45;
    case 0x1005u:
      -[PTPResponder getStorageInfo:](self, "getStorageInfo:", v4);
      goto LABEL_45;
    case 0x1006u:
      -[PTPResponder getNumObjects:](self, "getNumObjects:", v4);
      goto LABEL_45;
    case 0x1007u:
      -[PTPResponder getObjectHandles:](self, "getObjectHandles:", v4);
      goto LABEL_45;
    case 0x1008u:
      -[PTPResponder getObjectInfo:](self, "getObjectInfo:", v4);
      goto LABEL_45;
    case 0x1009u:
      -[PTPResponder getObject:](self, "getObject:", v4);
      goto LABEL_45;
    case 0x100Au:
LABEL_13:
      photoLibraryMediaQueryQueue = self->_photoLibraryMediaQueryQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100025C14;
      block[3] = &unk_100048778;
      block[4] = self;
      v27 = v4;
      dispatch_async((dispatch_queue_t)photoLibraryMediaQueryQueue, block);
      v17 = v27;
LABEL_35:

      goto LABEL_45;
    case 0x100Bu:
      -[PTPResponder deleteObject:](self, "deleteObject:", v4);
      goto LABEL_45;
    case 0x100Cu:
    case 0x100Du:
    case 0x100Eu:
    case 0x100Fu:
    case 0x1011u:
    case 0x1012u:
    case 0x1013u:
    case 0x1017u:
    case 0x1018u:
    case 0x1019u:
    case 0x101Au:
    case 0x101Cu:
    case 0x101Du:
    case 0x101Eu:
    case 0x101Fu:
    case 0x1020u:
    case 0x1021u:
    case 0x1022u:
LABEL_44:
      -[PTPResponder handleUnsupportedRequest:](self, "handleUnsupportedRequest:", v4);
      goto LABEL_45;
    case 0x1010u:
      -[PTPResponder handleResetDevice:](self, "handleResetDevice:", v4);
      goto LABEL_45;
    case 0x1014u:
      -[PTPResponder getDevicePropDesc:](self, "getDevicePropDesc:", v4);
      goto LABEL_45;
    case 0x1015u:
      -[PTPResponder getDevicePropValue:](self, "getDevicePropValue:", v4);
      goto LABEL_45;
    case 0x1016u:
      v18 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8193, objc_msgSend(v4, "transactionID"));
      -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v18);

      goto LABEL_45;
    case 0x101Bu:
      -[PTPResponder getPartialObject:](self, "getPartialObject:", v4);
      goto LABEL_45;
    case 0x1023u:
LABEL_12:
      -[PTPResponder getObjectInfoForObjectsInStorage:](self, "getObjectInfoForObjectsInStorage:", v4);
LABEL_45:
      v21 = 0;
      break;
    default:
      switch(v15)
      {
        case 0x9001u:
          -[PTPResponder getNumDownloadableObjects:](self, "getNumDownloadableObjects:", v4);
          goto LABEL_45;
        case 0x9002u:
        case 0x9005u:
          goto LABEL_12;
        case 0x9003u:
          -[PTPResponder getUserAssignedDeviceName:](self, "getUserAssignedDeviceName:", v4);
          goto LABEL_45;
        case 0x9004u:
          -[PTPResponder allowKeepAwake:](self, "allowKeepAwake:", v4);
          goto LABEL_45;
        case 0x9006u:
          -[PTPResponder getObjectCompressedSize64:](self, "getObjectCompressedSize64:", v4);
          goto LABEL_45;
        case 0x9007u:
          -[PTPResponder getPartialObject64:](self, "getPartialObject64:", v4);
          goto LABEL_45;
        case 0x9008u:
          -[PTPResponder setUsingMTP:](self, "setUsingMTP:", v4);
          goto LABEL_45;
        case 0x9009u:
          v19 = self->_photoLibraryMediaQueryQueue;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100025C20;
          v24[3] = &unk_100048778;
          v24[4] = self;
          v25 = v4;
          dispatch_async((dispatch_queue_t)v19, v24);
          v17 = v25;
          goto LABEL_35;
        case 0x900Au:
        case 0x900Du:
          goto LABEL_44;
        case 0x900Bu:
          v20 = -[PTPResponder handleSetHostMediaCapabilities:](self, "handleSetHostMediaCapabilities:", v4);
          break;
        case 0x900Cu:
          goto LABEL_13;
        case 0x900Eu:
          v20 = -[PTPResponder handleSetHostSupportedFormats:](self, "handleSetHostSupportedFormats:", v4);
          break;
        case 0x900Fu:
          -[PTPResponder getObjectInfoForNextObjectGroupInStorage:](self, "getObjectInfoForNextObjectGroupInStorage:", v4);
          goto LABEL_45;
        case 0x9010u:
          -[PTPResponder handleSetHostSupportsGroups:](self, "handleSetHostSupportsGroups:", v4);
          goto LABEL_45;
        default:
          switch(v15)
          {
            case 0x9801u:
              -[PTPResponder getObjectPropsSupported:](self, "getObjectPropsSupported:", v4);
              break;
            case 0x9802u:
              -[PTPResponder getObjectPropDesc:](self, "getObjectPropDesc:", v4);
              break;
            case 0x9803u:
              -[PTPResponder getObjectPropValue:](self, "getObjectPropValue:", v4);
              break;
            case 0x9805u:
              -[PTPResponder getObjectPropList:](self, "getObjectPropList:", v4);
              break;
            default:
              goto LABEL_44;
          }
          goto LABEL_45;
      }
      v21 = v20;
      break;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21));

  return v22;
}

- (void)handleData:(id)a3
{
  unsigned int v4;
  PTPVirtualCamera *v5;
  void *v6;
  PTPOperationResponsePacket *v7;
  PTPVirtualCamera *virtualCamera;
  void *v9;
  PTPOperationResponsePacket *v10;
  uint64_t lastTransactionID;
  uint64_t v12;
  PTPOperationResponsePacket *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "operationCode");
  if (v4 == 36878)
  {
    virtualCamera = self->_virtualCamera;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
    -[PTPVirtualCamera assignHostSupportedFormats:](virtualCamera, "assignHostSupportedFormats:", v9);

    v10 = [PTPOperationResponsePacket alloc];
    lastTransactionID = self->_lastTransactionID;
    v12 = 8193;
LABEL_6:
    v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v10, "initWithResponseCode:transactionID:", v12, lastTransactionID);
    goto LABEL_7;
  }
  if (v4 != 36875)
  {
    v10 = [PTPOperationResponsePacket alloc];
    lastTransactionID = self->_lastTransactionID;
    v12 = 8217;
    goto LABEL_6;
  }
  -[PTPResponder setUsingPeerMediaCapabilities:](self, "setUsingPeerMediaCapabilities:", 1);
  v5 = self->_virtualCamera;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
  -[PTPVirtualCamera assignHostMediaCapabilities:](v5, "assignHostMediaCapabilities:", v6);

  v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:parameter1:", 8193, self->_lastTransactionID, MGGetBoolAnswer(CFSTR("g/MkWm2Ac6+TLNBgtBGxsg")));
LABEL_7:
  v13 = v7;
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v7);

}

- (void)handleCancel:(id)a3
{
  self->_canceledTransactionID = objc_msgSend(a3, "transactionID");
}

- (void)resetResponderSession
{
  self->_lastTransactionID = 0;
  self->_sessionID = 0;
}

- (void)handleResetDevice:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  PTPOperationResponsePacket *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;

  v4 = objc_msgSend(a3, "transactionID");
  __ICOSLogCreate();
  v5 = CFSTR("Device Reset");
  if ((unint64_t)objc_msgSend(CFSTR("Device Reset"), "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Device Reset"), "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("responder[session: %d, : transaction: %d], request[transaction: %d]"), self->_sessionID, self->_lastTransactionID, v4));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v13 = -[__CFString UTF8String](v9, "UTF8String");
    v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[PTPResponder resetResponderSession](self, "resetResponderSession");
  v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8193, v4);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v11);

}

- (void)handleDeviceRemoval
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--> Device Removed | Stopping RunLoop")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v7, "UTF8String");
    v11 = 2114;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[PTPResponder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "stop", 0, 0);
  -[PTPResponder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "stopRunLoop", 0, 0);
}

- (void)sentData:(id)a3 responseCode:(id)a4
{
  id v6;
  unsigned int v7;
  id v8;
  PTPOperationResponsePacket *v9;
  id v10;
  PTPOperationResponsePacket *v11;
  PTPOperationResponsePacket *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(v13, "operationCode");
  v8 = objc_msgSend(v13, "transactionID");
  v9 = [PTPOperationResponsePacket alloc];
  v10 = objc_msgSend(v6, "unsignedShortValue");

  if (v7 == 4123)
    v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:](v9, "initWithResponseCode:transactionID:parameter1:", v10, v8, objc_msgSend(v13, "bytesTransferred"));
  else
    v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v9, "initWithResponseCode:transactionID:", v10, v8);
  v12 = v11;
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v11);

}

- (void)sendEvent:(id)a3
{
  -[PTPDeviceUSBTransport sendEvent:](self->_transport, "sendEvent:", a3);
}

- (void)reportObjectAdded:(id)a3
{
  id v4;
  PTPEventPacket *v5;
  id v6;
  PTPEventPacket *v7;

  v4 = a3;
  v5 = [PTPEventPacket alloc];
  v6 = objc_msgSend(v4, "unsignedIntValue");

  v7 = -[PTPEventPacket initWithEventCode:transactionID:parameter1:](v5, "initWithEventCode:transactionID:parameter1:", 16386, 0xFFFFFFFFLL, v6);
  -[PTPResponder sendEvent:](self, "sendEvent:", v7);

}

- (void)reportObjectDeleted:(id)a3
{
  id v4;
  PTPEventPacket *v5;
  id v6;
  PTPEventPacket *v7;

  v4 = a3;
  v5 = [PTPEventPacket alloc];
  v6 = objc_msgSend(v4, "unsignedIntValue");

  v7 = -[PTPEventPacket initWithEventCode:transactionID:parameter1:](v5, "initWithEventCode:transactionID:parameter1:", 16387, 0xFFFFFFFFLL, v6);
  -[PTPResponder sendEvent:](self, "sendEvent:", v7);

}

- (void)reportStorageAdded:(id)a3
{
  id v4;
  PTPEventPacket *v5;
  id v6;
  PTPEventPacket *v7;

  v4 = a3;
  v5 = [PTPEventPacket alloc];
  v6 = objc_msgSend(v4, "unsignedIntValue");

  v7 = -[PTPEventPacket initWithEventCode:transactionID:parameter1:](v5, "initWithEventCode:transactionID:parameter1:", 16388, 0xFFFFFFFFLL, v6);
  -[PTPResponder sendEvent:](self, "sendEvent:", v7);

}

- (void)reportStorageDeleted:(id)a3
{
  id v4;
  PTPEventPacket *v5;
  id v6;
  PTPEventPacket *v7;

  v4 = a3;
  v5 = [PTPEventPacket alloc];
  v6 = objc_msgSend(v4, "unsignedIntValue");

  v7 = -[PTPEventPacket initWithEventCode:transactionID:parameter1:](v5, "initWithEventCode:transactionID:parameter1:", 16389, 0xFFFFFFFFLL, v6);
  -[PTPResponder sendEvent:](self, "sendEvent:", v7);

}

- (void)reportGroupAddedInStorage:(id)a3
{
  id v4;
  PTPEventPacket *v5;
  id v6;
  PTPEventPacket *v7;

  v4 = a3;
  v5 = [PTPEventPacket alloc];
  v6 = objc_msgSend(v4, "unsignedIntValue");

  v7 = -[PTPEventPacket initWithEventCode:transactionID:parameter1:](v5, "initWithEventCode:transactionID:parameter1:", 49156, 0xFFFFFFFFLL, v6);
  -[PTPResponder sendEvent:](self, "sendEvent:", v7);

}

- (void)reportUserAssignedNameChange
{
  PTPEventPacket *v3;

  v3 = -[PTPEventPacket initWithEventCode:transactionID:]([PTPEventPacket alloc], "initWithEventCode:transactionID:", 49154, 0xFFFFFFFFLL);
  -[PTPResponder sendEvent:](self, "sendEvent:", v3);

}

- (BOOL)start
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Starting Responder\n")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v18 = -[__CFString UTF8String](v7, "UTF8String");
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Built: %s %s\n"), aAug32024, a105846));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    v15 = -[__CFString UTF8String](v13, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v18 = v15;
    v19 = 2114;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return -[PTPDeviceUSBTransport startResponder](self->_transport, "startResponder");
}

- (void)stop
{
  -[PTPDeviceUSBTransport stop](self->_transport, "stop");
}

- (void)stopRunLoop
{
  __CFRunLoop *Current;

  self->_keepRunningRunLoop = 0;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)transportActivated
{
  PTPVirtualCamera *v3;
  PTPVirtualCamera *virtualCamera;

  v3 = -[PTPVirtualCamera initWithName:andPath:]([PTPVirtualCamera alloc], "initWithName:andPath:", self->_name, self->_path);
  virtualCamera = self->_virtualCamera;
  self->_virtualCamera = v3;

  self->_usingMTP = 0;
  -[PTPVirtualCamera setDelegate:](self->_virtualCamera, "setDelegate:", self);
}

- (void)removeVirtualCamera
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026760;
  block[3] = &unk_100048750;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sendEventDeviceUnlocked
{
  PTPEventPacket *v3;

  v3 = -[PTPEventPacket initWithEventCode:transactionID:]([PTPEventPacket alloc], "initWithEventCode:transactionID:", 49153, 0xFFFFFFFFLL);
  -[PTPResponder sendEvent:](self, "sendEvent:", v3);

}

- (void)sendRestartSessionEvent
{
  PTPEventPacket *v3;

  v3 = -[PTPEventPacket initWithEventCode:transactionID:]([PTPEventPacket alloc], "initWithEventCode:transactionID:", 49155, 0xFFFFFFFFLL);
  -[PTPResponder sendEvent:](self, "sendEvent:", v3);

}

- (void)getDevicePropDesc:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  PTPDataPacket *v9;
  id v10;
  void *v11;
  PTPDataPacket *v12;
  uint64_t v13;
  PTPOperationResponsePacket *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = v5;
  if (self->_sessionID)
  {
    if (v5 <= self->_lastTransactionID)
    {
      v13 = 8196;
    }
    else
    {
      self->_lastTransactionID = v5;
      v7 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera devicePropDescDatasetForProperty:](self->_virtualCamera, "devicePropDescDatasetForProperty:", (unsigned __int16)objc_msgSend(v4, "parameter1")));
      if (v7)
      {
        v8 = (void *)v7;
        v9 = [PTPDataPacket alloc];
        v10 = objc_msgSend(v4, "operationCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
        v12 = -[PTPDataPacket initWithOperationCode:transactionID:andData:](v9, "initWithOperationCode:transactionID:andData:", v10, v6, v11);

        -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v12);
        goto LABEL_13;
      }
      v13 = 8202;
    }
  }
  else
  {
    v13 = 8195;
  }
  v14 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v13, v6);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v14);
  __ICOSLogCreate();
  v15 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("..")));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MTP* getDevicePropDesc - response:\n%@\n"), v14));
  v18 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_retainAutorelease(v15);
    v20 = v18;
    *(_DWORD *)buf = 136446466;
    v22 = -[__CFString UTF8String](v19, "UTF8String");
    v23 = 2114;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_13:

}

- (void)getDevicePropValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  PTPOperationResponsePacket *v7;
  PTPDataPacket *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "transactionID");
  v5 = v4;
  if (!self->_sessionID)
  {
    v9 = 8195;
LABEL_8:
    v7 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v9, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v7);
    goto LABEL_9;
  }
  if (v4 <= self->_lastTransactionID)
  {
    v9 = 8196;
    goto LABEL_8;
  }
  self->_lastTransactionID = v4;
  v6 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera devicePropValueForProperty:](self->_virtualCamera, "devicePropValueForProperty:", (unsigned __int16)objc_msgSend(v10, "parameter1")));
  if (!v6)
  {
    v9 = 8202;
    goto LABEL_8;
  }
  v7 = (PTPOperationResponsePacket *)v6;
  v8 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v10, "operationCode"), v5, v6);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v8);

LABEL_9:
}

- (void)getObjectPropsSupported:(id)a3
{
  id v4;
  id v5;
  unsigned __int16 v6;
  PTPOperationResponsePacket *v7;
  PTPOperationResponsePacket *v8;
  __CFString *v9;
  PTPDataPacket *v10;
  PTPOperationResponsePacket *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  unsigned __int16 v18;
  _BYTE buf[12];
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v18 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    v18 = 8196;
  }
  else
  {
    v6 = (unsigned __int16)objc_msgSend(v4, "parameter1");
    self->_lastTransactionID = v5;
    v7 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectPropertiesSupportedForObjectFormatCode:responseCode:](self->_virtualCamera, "objectPropertiesSupportedForObjectFormatCode:responseCode:", v6, &v18));
    v8 = v7;
    if (v18 == 8193)
    {
      v9 = (__CFString *)objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 2 * (_QWORD)-[PTPOperationResponsePacket count](v7, "count") + 4));
      *(_QWORD *)buf = -[__CFString mutableBytes](v9, "mutableBytes");
      sub_1000208C4((unsigned __int16 **)buf, v8);
      v10 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v9);
      -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v10);

      goto LABEL_11;
    }

  }
  v11 = [PTPOperationResponsePacket alloc];
  v8 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v11, "initWithResponseCode:transactionID:", v18, v5);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v8);
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getObjectPropsSupported - response:\n%@\n"), v8));
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v9);
    v16 = v14;
    v17 = -[__CFString UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v17;
    v20 = 2114;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_11:

}

- (void)getObjectPropValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  unsigned __int16 v7;
  PTPOperationResponsePacket *v8;
  PTPOperationResponsePacket *v9;
  PTPDataPacket *v10;
  PTPOperationResponsePacket *v11;
  void *v12;
  void *v13;
  void *v14;
  PTPDataPacket *v15;
  NSObject *v16;
  id v17;
  unsigned __int16 v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v18 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    v18 = 8196;
  }
  else
  {
    v6 = objc_msgSend(v4, "parameter1");
    v7 = (unsigned __int16)objc_msgSend(v4, "parameter2");
    self->_lastTransactionID = v5;
    v8 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectPropValueForHandle:withObjectPropertyCode:responseCode:](self->_virtualCamera, "objectPropValueForHandle:withObjectPropertyCode:responseCode:", v6, v7, &v18));
    v9 = v8;
    if (v18 == 8193)
    {
      v10 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v8);
      -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v10);
      goto LABEL_11;
    }

  }
  v11 = [PTPOperationResponsePacket alloc];
  v9 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v11, "initWithResponseCode:transactionID:", v18, v5);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v9);
  __ICOSLogCreate();
  v10 = (PTPDataPacket *)&stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v10 = (PTPDataPacket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getObjectPropValue - response:\n%@\n"), v9));
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v10);
    v16 = v14;
    v17 = -[PTPDataPacket UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v20 = v17;
    v21 = 2114;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_11:

}

- (void)getObjectPropList:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  PTPOperationResponsePacket *v11;
  PTPOperationResponsePacket *v12;
  PTPDataPacket *v13;
  PTPOperationResponsePacket *v14;
  void *v15;
  void *v16;
  void *v17;
  PTPDataPacket *v18;
  NSObject *v19;
  id v20;
  unsigned __int16 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v21 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    v21 = 8196;
  }
  else
  {
    v6 = objc_msgSend(v4, "parameter1");
    v7 = objc_msgSend(v4, "parameter2");
    v8 = objc_msgSend(v4, "parameter3");
    v9 = objc_msgSend(v4, "parameter4");
    v10 = objc_msgSend(v4, "parameter5");
    self->_lastTransactionID = v5;
    v11 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectPropListForHandle:withObjectFormatCode:andPropertyCode:andPropertyGroup:andDepth:responseCode:](self->_virtualCamera, "objectPropListForHandle:withObjectFormatCode:andPropertyCode:andPropertyGroup:andDepth:responseCode:", v6, v7, v8, v9, v10, &v21));
    v12 = v11;
    if (v21 == 8193)
    {
      v13 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v11);
      -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v13);
      goto LABEL_11;
    }

  }
  v14 = [PTPOperationResponsePacket alloc];
  v12 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v14, "initWithResponseCode:transactionID:", v21, v5);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v12);
  __ICOSLogCreate();
  v13 = (PTPDataPacket *)&stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v13 = (PTPDataPacket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getObjectPropList - response:\n%@\n"), v12));
  v17 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_retainAutorelease(v13);
    v19 = v17;
    v20 = -[PTPDataPacket UTF8String](v18, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v23 = v20;
    v24 = 2114;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_11:

}

- (void)getObjectPropDesc:(id)a3
{
  id v4;
  id v5;
  unsigned __int16 v6;
  PTPOperationResponsePacket *v7;
  PTPOperationResponsePacket *v8;
  PTPDataPacket *v9;
  PTPOperationResponsePacket *v10;
  unsigned __int16 v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v11 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    v11 = 8196;
LABEL_6:
    v10 = [PTPOperationResponsePacket alloc];
    v8 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v10, "initWithResponseCode:transactionID:", v11, v5);
    -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v8);
    goto LABEL_7;
  }
  v6 = (unsigned __int16)objc_msgSend(v4, "parameter1");
  self->_lastTransactionID = v5;
  v7 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectPropDescForObjectPropertyCode:responseCode:](self->_virtualCamera, "objectPropDescForObjectPropertyCode:responseCode:", v6, &v11));
  v8 = v7;
  if (v11 != 8193)
  {

    goto LABEL_6;
  }
  v9 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(v4, "operationCode"), v5, v7);
  -[PTPDeviceUSBTransport sendData:](self->_transport, "sendData:", v9);

LABEL_7:
}

- (id)usingMacOS
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_usingMacOS);
}

- (void)setUsingMacOS:(BOOL)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[3];

  self->_usingMacOS = a3;
  v3 = sub_10000D990();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6[0] = PLPTPHostCharacteristicsKeyMake;
  v6[1] = PLPTPHostCharacteristicsKeyOS;
  v7[0] = PLPTPHostCharacteristicMake_Apple;
  v7[1] = PLPTPHostCharacteristicOS_macOS;
  v6[2] = PLPTPHostCharacteristicsKeyTransport;
  v7[2] = PLPTPHostCharacteristicTransport_PTP;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  objc_msgSend(v4, "setHostCharacteristics:", v5);

}

- (void)setUsingLegacyOS:(BOOL)a3
{
  if (!self->_usingMacOS)
    self->_usingLegacyOS = a3;
}

- (id)usingLegacyOS
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_usingLegacyOS);
}

- (id)usingMTP
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_usingMTP);
}

- (void)resetUsingMTP
{
  self->_usingMTP = 0;
}

- (void)setUsingMTP:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  PTPOperationResponsePacket *v11;
  id v12;
  PTPOperationResponsePacket *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  sub_100004C04(1);
  __ICOSLogCreate();
  v5 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MTP Split Packet Transfer\n")));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v20 = -[__CFString UTF8String](v9, "UTF8String");
    v21 = 2114;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  self->_usingMTP = objc_msgSend(v4, "parameter1") != 0;
  v11 = [PTPOperationResponsePacket alloc];
  v12 = objc_msgSend(v4, "transactionID");

  v13 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:](v11, "initWithResponseCode:transactionID:", 8193, v12);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v13);
  v14 = sub_10000D990();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v17[0] = PLPTPHostCharacteristicsKeyMake;
  v17[1] = PLPTPHostCharacteristicsKeyOS;
  v18[0] = PLPTPHostCharacteristicMake_Microsoft;
  v18[1] = PLPTPHostCharacteristicOS_Windows;
  v17[2] = PLPTPHostCharacteristicsKeyTransport;
  v18[2] = PLPTPHostCharacteristicTransport_MTP;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
  objc_msgSend(v15, "setHostCharacteristics:", v16);

}

- (void)setUsingWindows
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[3];

  sub_100004C04(1);
  self->_usingMTP = 1;
  v3 = sub_10000D990();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6[0] = PLPTPHostCharacteristicsKeyMake;
  v6[1] = PLPTPHostCharacteristicsKeyOS;
  v7[0] = PLPTPHostCharacteristicMake_Microsoft;
  v7[1] = PLPTPHostCharacteristicOS_Windows;
  v6[2] = PLPTPHostCharacteristicsKeyTransport;
  v7[2] = PLPTPHostCharacteristicTransport_MTP;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  objc_msgSend(v4, "setHostCharacteristics:", v5);

}

- (void)allowKeepAwake:(id)a3
{
  id v4;
  uint64_t v5;
  PTPOperationResponsePacket *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v4 = objc_msgSend(a3, "transactionID");
  if (self->_sessionID)
  {
    if (v4 <= self->_lastTransactionID)
    {
      v5 = 8196;
    }
    else
    {
      self->_allowKeepAwake = 1;
      v5 = 8193;
    }
  }
  else
  {
    v5 = 8195;
  }
  v6 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", v5, v4);
  -[PTPDeviceUSBTransport sendResponse:](self->_transport, "sendResponse:", v6);
  __ICOSLogCreate();
  v7 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("allowKeepAwake - response:\n%@\n"), v6));
  v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v7);
    v12 = v10;
    *(_DWORD *)buf = 136446466;
    v14 = -[__CFString UTF8String](v11, "UTF8String");
    v15 = 2114;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (void)holdPowerAssertion
{
  if (self->_allowKeepAwake)
  {
    -[PTPResponder releasePowerAssertion](self, "releasePowerAssertion");
    self->_cpPowerAssertion = (void *)CPPowerAssertionCreate(CFSTR("com.apple.ptpd"), self->_powerAssertionReleaseDelay);
  }
}

- (void)releasePowerAssertion
{
  void *cpPowerAssertion;

  cpPowerAssertion = self->_cpPowerAssertion;
  if (cpPowerAssertion)
  {
    CFRelease(cpPowerAssertion);
    self->_cpPowerAssertion = 0;
  }
}

- (PTPDeviceUSBTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (PTPVirtualCamera)virtualCamera
{
  return self->_virtualCamera;
}

- (void)setVirtualCamera:(id)a3
{
  objc_storeStrong((id *)&self->_virtualCamera, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (unsigned)lastTransactionID
{
  return self->_lastTransactionID;
}

- (void)setLastTransactionID:(unsigned int)a3
{
  self->_lastTransactionID = a3;
}

- (unsigned)canceledTransactionID
{
  return self->_canceledTransactionID;
}

- (void)setCanceledTransactionID:(unsigned int)a3
{
  self->_canceledTransactionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (PTPOperationRequestPacket)operationRequest
{
  return self->_operationRequest;
}

- (void)setOperationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_operationRequest, a3);
}

- (PTPOperationResponsePacket)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (PTPEventPacket)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)hostSupportsGroups
{
  return self->_hostSupportsGroups;
}

- (void)setHostSupportsGroups:(BOOL)a3
{
  self->_hostSupportsGroups = a3;
}

- (BOOL)usingPeerMediaCapabilities
{
  return self->_usingPeerMediaCapabilities;
}

- (void)setUsingPeerMediaCapabilities:(BOOL)a3
{
  self->_usingPeerMediaCapabilities = a3;
}

- (OS_dispatch_queue)photoLibraryMediaQueryQueue
{
  return self->_photoLibraryMediaQueryQueue;
}

- (void)setPhotoLibraryMediaQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryMediaQueryQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryMediaQueryQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_operationRequest, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_virtualCamera, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
