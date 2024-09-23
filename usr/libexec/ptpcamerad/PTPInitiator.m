@implementation PTPInitiator

- (PTPInitiator)initWithHostLocationID:(unsigned int)a3
{
  uint64_t v3;
  PTPInitiator *v4;
  PTPHostUSBTransport *v5;
  PTPHostUSBTransport *transport;
  NSMutableArray *v7;
  NSMutableArray *storages;
  NSMutableArray *v9;
  NSMutableArray *eventQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *mobdevProperties;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *timerQueue;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *mobdevPropertiesQueue;
  objc_super v20;

  v3 = *(_QWORD *)&a3;
  v20.receiver = self;
  v20.super_class = (Class)PTPInitiator;
  v4 = -[PTPInitiator init](&v20, "init");
  if (v4)
  {
    v5 = -[PTPHostUSBTransport initWithLocationID:delegate:]([PTPHostUSBTransport alloc], "initWithLocationID:delegate:", v3, v4);
    transport = v4->_transport;
    v4->_transport = v5;

    v4->_transactionID = 0;
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    storages = v4->_storages;
    v4->_storages = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    eventQueue = v4->_eventQueue;
    v4->_eventQueue = v9;

    *(_OWORD *)&v4->_icplState = xmmword_100037AA0;
    v4->_enumerationOrder = -1;
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mobdevProperties = v4->_mobdevProperties;
    v4->_mobdevProperties = v11;

    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP-Enumeration-Timer-Queue:0x%08X"), v3)));
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    timerQueue = v4->_timerQueue;
    v4->_timerQueue = (OS_dispatch_queue *)v14;

    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP-MobdevProperties-Queue:0x%08X"), v3)));
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    mobdevPropertiesQueue = v4->_mobdevPropertiesQueue;
    v4->_mobdevPropertiesQueue = (OS_dispatch_queue *)v17;

    v4->_mobdevPropertiesLock._os_unfair_lock_opaque = 0;
    if (!v4->_transport)
    {

      return 0;
    }
  }
  return v4;
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
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  PTPHostUSBTransport *transport;
  OS_remote_device_browser *mobdevPropertiesBrowser;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  __ICOSLogCreate();
  v3 = CFSTR("PTPInitiator");
  if ((unint64_t)objc_msgSend(CFSTR("PTPInitiator"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPInitiator"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator transport](self, "transport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "dealloc locID", objc_msgSend(v5, "locationID")));

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v3);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v24 = -[__CFString UTF8String](v8, "UTF8String");
    v25 = 2114;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(self->_transport), "cancelPreviousPerformRequestsWithTarget:", self->_transport);
  -[PTPHostUSBTransport setDelegate:](self->_transport, "setDelegate:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_storages;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend((id)objc_opt_class(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14)), "cancelPreviousPerformRequestsWithTarget:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  -[PTPHostUSBTransport abortPendingIO](self->_transport, "abortPendingIO");
  transport = self->_transport;
  self->_transport = 0;

  if (self->_mobdevPropertiesBrowser)
  {
    remote_device_browser_cancel();
    mobdevPropertiesBrowser = self->_mobdevPropertiesBrowser;
    self->_mobdevPropertiesBrowser = 0;

  }
  v17.receiver = self;
  v17.super_class = (Class)PTPInitiator;
  -[PTPInitiator dealloc](&v17, "dealloc");
}

- (BOOL)start
{
  _BOOL4 v3;
  PTPHostUSBTransport *transport;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[PTPHostUSBTransport startInitiator](self->_transport, "startInitiator");
  if (v3)
  {
    transport = self->_transport;
    v5 = objc_opt_class(PTPHostUSBTransport);
    if ((objc_opt_isKindOfClass(transport, v5) & 1) != 0)
    {
      -[PTPInitiator setDeviceVendorID:](self, "setDeviceVendorID:", -[PTPHostUSBTransport vendorID](self->_transport, "vendorID"));
      -[PTPInitiator setDeviceProductID:](self, "setDeviceProductID:", -[PTPHostUSBTransport productID](self->_transport, "productID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport usbSerialNumberString](self->_transport, "usbSerialNumberString"));
      -[PTPInitiator setDeviceSerialNumberString:](self, "setDeviceSerialNumberString:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceSerialNumberString](self, "deviceSerialNumberString"));
    if (objc_msgSend(v7, "length") == (id)24 && -[PTPInitiator deviceVendorID](self, "deviceVendorID") == 1452)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 9));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v8, v9));
      -[PTPInitiator setDeviceSerialNumberString:](self, "setDeviceSerialNumberString:", v10);

    }
  }
  return v3;
}

- (void)stop
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;

  __ICOSLogCreate();
  v3 = CFSTR("PTPInitiator");
  if ((unint64_t)objc_msgSend(CFSTR("PTPInitiator"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPInitiator"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator transport](self, "transport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "stopping locID", objc_msgSend(v5, "locationID")));

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v3);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v11 = -[__CFString UTF8String](v8, "UTF8String");
    v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (-[PTPInitiator sessionOpen](self, "sessionOpen"))
    -[PTPInitiator closeSession](self, "closeSession");
  -[PTPHostUSBTransport stop](self->_transport, "stop");
}

- (void)cancel
{
  PTPCancelPacket *v3;

  v3 = -[PTPCancelPacket initWithTransactionID:]([PTPCancelPacket alloc], "initWithTransactionID:", self->_transactionID);
  -[PTPHostUSBTransport performSelector:withObject:](self->_transport, "performSelector:withObject:", "sendCancel:", v3);

}

- (int)transportConnectionStatus
{
  return -[PTPHostUSBTransport connectionStatus](self->_transport, "connectionStatus");
}

- (id)refreshAssignedDeviceName
{
  PTPOperationRequestPacket *v3;
  PTPOperationRequestPacket *v4;
  PTPTransaction *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  if (self->_deviceVendorID != 1452)
    return 0;
  v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:", 36867);
  v5 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v4, 0, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v5, 60.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v5, "rxDataBuffer"));
  if (v6 && objc_msgSend(v6, "responseCode") == 8193)
  {
    if (objc_msgSend(v7, "length"))
    {
      v12 = objc_msgSend(v7, "headerOffsetBytes");
      v8 = sub_100027434((const void **)&v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[PTPInitiator setUserAssignedDeviceName:](self, "setUserAssignedDeviceName:", v9);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator userAssignedDeviceName](self, "userAssignedDeviceName"));

  return v10;
}

- (void)handleEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  PTPInitiator *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10000CD30;
  v11 = &unk_1000489E8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v8));
  objc_msgSend(v5, "addInteractiveOperation:", v7, v8, v9, v10, v11, v12);

}

- (id)cameraItemWithObjectID:(unint64_t)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_storages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cameraFileWithObjectID:", a3, (_QWORD)v13));
        if (!v10)
        {
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cameraFolderWithObjectID:", a3));
          if (!v10)
            continue;
        }
        v11 = (void *)v10;
        goto LABEL_13;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)processUnhandledEvents
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPInitiator transport](self, "transport"));
  if (objc_msgSend(v5, "connected"))
  {
    v3 = -[NSMutableArray count](self->_eventQueue, "count");

    if (!v3)
      return;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_eventQueue, "objectAtIndex:", 0));
    -[NSMutableArray removeObject:](self->_eventQueue, "removeObject:", v5);
    v4 = objc_opt_class(PTPEventPacket);
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      -[PTPInitiator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "handleEvent:", v5, 0.0);
  }

}

- (void)issueCancelRequest:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if ((objc_opt_respondsToSelector(self->_transport, "cancelRequest:") & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    -[PTPHostUSBTransport performSelector:withObject:](self->_transport, "performSelector:withObject:", "cancelRequest:", v5);

  }
}

- (id)executeTransaction:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v17;

  v6 = a3;
  -[PTPInitiator setRequestPending:](self, "setRequestPending:", 1);
  -[PTPInitiator setCancelOp:](self, "setCancelOp:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestPacket"));
  v8 = objc_msgSend(v7, "operationCode");

  v10 = v8 - 4097 < 2 || v8 == 36875 || v8 == 36880;
  if (v10 || self->_sessionOpen)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport sendTransaction:timeout:](self->_transport, "sendTransaction:timeout:", v6, a4));
  else
    v11 = 0;
  -[PTPInitiator setRequestPending:](self, "setRequestPending:", 0);
  -[PTPInitiator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "processUnhandledEvents", 0, 0.0);
  __ICOSLogCreate();
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[PTPInitiator executeTransaction] response: %@\n"), v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v12));

  if (__ICLogTypeEnabled(4))
  {
    v14 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  return v11;
}

- (void)sentData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  void *v7;

  v3 = a3;
  __ICOSLogCreate();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sentData: <PTPDataPacket %p> called\n"), v3));

  if (__ICLogTypeEnabled(4))
  {
    v5 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

}

- (void)sentData:(id)a3 responseCode:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;

  v5 = a4;
  v6 = a3;
  __ICOSLogCreate();
  v7 = objc_msgSend(v5, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sentData: <PTPDataPacket %p><ResponseCode %d> called\n"), v6, v7));
  if (__ICLogTypeEnabled(4))
  {
    v9 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

}

- (PTPDeviceInfoDataset)deviceInfo
{
  PTPDeviceInfoDataset *deviceInfo;
  uint64_t transactionID;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  PTPDeviceInfoDataset *v11;
  void *v12;
  PTPDeviceInfoDataset *v13;
  PTPDeviceInfoDataset *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  NSString *appleSerialNumberString;
  void *v32;
  PTPTransaction *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
    return deviceInfo;
  if (self->_sessionOpen)
  {
    transactionID = self->_transactionID;
    self->_transactionID = transactionID + 1;
  }
  else
  {
    transactionID = 0;
  }
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:]([PTPOperationRequestPacket alloc], "initWithOperationCode:transactionID:dataPhaseInfo:", 4097, transactionID, 1);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 1);
  v7 = 0;
  v8 = 4;
  while (1)
  {
    v9 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 5.0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v6, "rxDataBuffer"));
    if (v7)
    {
      if (objc_msgSend(v7, "responseCode") == 8193 && objc_msgSend(v10, "length"))
        break;
    }
    -[PTPInitiator closeSession](self, "closeSession");
LABEL_12:
    objc_msgSend(v10, "setLength:", 0);

    if (!--v8 || self->_deviceInfo)
      goto LABEL_14;
  }
  v11 = [PTPDeviceInfoDataset alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", objc_msgSend(v10, "headerOffsetBytes"), objc_msgSend(v10, "length")));
  v13 = -[PTPDeviceInfoDataset initWithMutableData:](v11, "initWithMutableData:", v12);
  v14 = self->_deviceInfo;
  self->_deviceInfo = v13;

  if (!self->_deviceInfo)
    goto LABEL_12;

LABEL_14:
  if (-[PTPInitiator deviceVendorID](self, "deviceVendorID") == 1452
    && -[PTPHostUSBTransport type](self->_transport, "type") == 2)
  {
    -[PTPInitiator updateMobdevProps](self, "updateMobdevProps");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceInfoDataset vendorExtensionDescription](self->_deviceInfo, "vendorExtensionDescription"));
  v16 = objc_msgSend(v15, "isEqualToString:", &stru_10004A300);

  if ((v16 & 1) == 0)
  {
    v33 = v6;
    v17 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("&^")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceInfoDataset vendorExtensionDescription](self->_deviceInfo, "vendorExtensionDescription"));
    v32 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v17));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = 0;
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        v27 = v24;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v20);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v26);
          if (v23)
          {
            v24 = v28;

            if (objc_msgSend(v23, "isEqualToString:", CFSTR("ICPE")))
            {
              self->_icplState = (int)objc_msgSend(v24, "intValue");
            }
            else if (objc_msgSend(v23, "isEqualToString:", CFSTR("CPLS")))
            {
              self->_icplOptimizeStorageState = (int)objc_msgSend(v24, "intValue");
            }
            else if (objc_msgSend(v23, "isEqualToString:", CFSTR("ASN")))
            {
              v29 = (NSString *)objc_msgSend(v24, "copy");
              appleSerialNumberString = self->_appleSerialNumberString;
              self->_appleSerialNumberString = v29;

            }
            v23 = 0;
            v27 = v24;
          }
          else
          {
            v23 = objc_msgSend(v28, "copy");
            v24 = v27;
          }
          v26 = (char *)v26 + 1;
        }
        while (v22 != v26);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }

    v6 = v33;
  }

  deviceInfo = self->_deviceInfo;
  return deviceInfo;
}

- (id)mobdevProps
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  os_unfair_lock_lock(&self->_mobdevPropertiesLock);
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_mobdevProperties);
  os_unfair_lock_unlock(&self->_mobdevPropertiesLock);
  return v3;
}

- (void)addMobdevProperties:(id)a3
{
  os_unfair_lock_s *p_mobdevPropertiesLock;
  id v5;

  if (a3)
  {
    p_mobdevPropertiesLock = &self->_mobdevPropertiesLock;
    v5 = a3;
    os_unfair_lock_lock(p_mobdevPropertiesLock);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_mobdevProperties, "addEntriesFromDictionary:", v5);

    os_unfair_lock_unlock(p_mobdevPropertiesLock);
  }
}

- (void)updateMobdevProps
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator mobdevProps](self, "mobdevProps"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPInitiator transport](self, "transport"));
    -[PTPInitiator updatePropertiesOfMobileDeviceWithLocationID:](self, "updatePropertiesOfMobileDeviceWithLocationID:", objc_msgSend(v5, "locationID"));

  }
}

- (void)updatePropertiesOfMobileDeviceWithLocationID:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  dispatch_semaphore_t v18;
  void *v19;
  void *started;
  dispatch_time_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  NSObject *v25;
  int v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  NSObject *v30;

  v3 = *(_QWORD *)&a3;
  __ICOSLogCreate();
  v5 = CFSTR("RemoteServices");
  if ((unint64_t)objc_msgSend(CFSTR("RemoteServices"), "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RemoteServices"), "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: 0x%08X"), CFSTR("Monitoring"), v3));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v28 = -[__CFString UTF8String](v9, "UTF8String");
    v29 = 2114;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator mobdevPropertiesBrowser](self, "mobdevPropertiesBrowser"));

  if (v11)
  {
    __ICOSLogCreate();
    v12 = CFSTR("RemoteServices");
    if ((unint64_t)objc_msgSend(CFSTR("RemoteServices"), "length") >= 0x15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RemoteServices"), "substringWithRange:", 0, 18));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

    }
    v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Already Browsing: 0x%08X"), v3));
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v12);
      v16 = v15;
      v17 = -[__CFString UTF8String](v12, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v28 = v17;
      v29 = 2114;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v12 = (__CFString *)xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "DeviceType", "ncm-device");
    v18 = dispatch_semaphore_create(0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator mobdevPropertiesQueue](self, "mobdevPropertiesQueue"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000E5C4;
    v24[3] = &unk_100048A10;
    v26 = v3;
    v24[4] = self;
    v14 = v18;
    v25 = v14;
    started = (void *)remote_device_start_browsing_matching(v12, v19, v24);
    -[PTPInitiator setMobdevPropertiesBrowser:](self, "setMobdevPropertiesBrowser:", started);

    v21 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v14, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator mobdevPropertiesBrowser](self, "mobdevPropertiesBrowser"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator mobdevPropertiesBrowser](self, "mobdevPropertiesBrowser"));
      remote_device_browser_cancel();

      -[PTPInitiator setMobdevPropertiesBrowser:](self, "setMobdevPropertiesBrowser:", 0);
    }

  }
}

- (BOOL)iCloudPhotosEnabled
{
  void *v3;

  if (self->_icplState == 2 && -[NSMutableArray count](self->_storages, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_storages, "objectAtIndex:", 0));
    self->_icplState = objc_msgSend(v3, "locked");

  }
  return self->_icplState == 1;
}

- (unint64_t)iCloudPhotosOptimizeStorageState
{
  return self->_icplOptimizeStorageState;
}

- (NSString)appleSerialNumberString
{
  return self->_appleSerialNumberString;
}

- (id)devicePropertyDescDatasetForProperty:(unsigned __int16)a3
{
  PTPOperationRequestPacket *v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;
  PTPDevicePropDescDataset *v9;
  void *v10;
  PTPDevicePropDescDataset *v11;

  v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4116);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 60.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v6, "rxDataBuffer"));
  if (v7 && objc_msgSend(v7, "responseCode") == 8193 && objc_msgSend(v8, "length"))
  {
    v9 = [PTPDevicePropDescDataset alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", objc_msgSend(v8, "headerOffsetBytes"), objc_msgSend(v8, "length")));
    v11 = -[PTPDevicePropDescDataset initWithMutableData:](v9, "initWithMutableData:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)devicePropertyValueForProperty:(unsigned __int16)a3
{
  PTPOperationRequestPacket *v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4117);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 60.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v6, "rxDataBuffer"));
  if (v7 && objc_msgSend(v7, "responseCode") == 8193 && objc_msgSend(v8, "length"))
    v9 = objc_msgSend(v8, "copy");
  else
    v9 = 0;

  return v9;
}

- (BOOL)setDevicePropertyValue:(id)a3 forProperty:(unsigned __int16)a4
{
  id v5;
  PTPOperationRequestPacket *v6;
  PTPOperationRequestPacket *v7;
  PTPDataPacket *v8;
  PTPTransaction *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4118);
  v8 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", 4118, self->_transactionID, v5);

  v9 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v7, v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v9, 60.0));
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "responseCode") == 8193;
  else
    v12 = 0;

  return v12;
}

- (BOOL)resetDevicePropertyValueForProperty:(unsigned __int16)a3
{
  PTPOperationRequestPacket *v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4119);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 60.0));
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "responseCode") == 8193;
  else
    v9 = 0;

  return v9;
}

- (BOOL)resetDevice
{
  PTPOperationRequestPacket *v3;
  PTPTransaction *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:]([PTPOperationRequestPacket alloc], "initWithOperationCode:transactionID:dataPhaseInfo:", 4112, 0, 1);
  v4 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v3, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v4, 60.0));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "responseCode") == 8193)
  {
    self->_sessionOpen = 0;
    self->_transactionID = 0;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startTimerWithInterval:(double)a3 andFireBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[PTPInitiator timerQueue](self, "timerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F2C0;
  block[3] = &unk_100048A60;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)cancelTimerAndFireBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PTPInitiator timerQueue](self, "timerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F53C;
  block[3] = &unk_100048958;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setDeviceIsEnumerating
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000F5E4;
  v2[3] = &unk_100048A38;
  v2[4] = self;
  -[PTPInitiator startTimerWithInterval:andFireBlock:](self, "startTimerWithInterval:andFireBlock:", v2, 0.25);
}

- (void)setDeviceFinishedEnumerating
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000F750;
  v2[3] = &unk_100048A38;
  v2[4] = self;
  -[PTPInitiator cancelTimerAndFireBlock:](self, "cancelTimerAndFireBlock:", v2);
}

- (BOOL)openSession
{
  BOOL sessionOpen;
  PTPOperationRequestPacket *v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;

  if (self->_sessionOpen)
    return 1;
  -[PTPInitiator sendHostSupportsGroupNotifications](self, "sendHostSupportsGroupNotifications");
  -[PTPInitiator sendHostMediaCapabilities](self, "sendHostMediaCapabilities");
  self->_transactionID = 0;
  v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4098);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 1800.0));
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "responseCode") == 8193 || objc_msgSend(v8, "responseCode") == 8222))
  {
    self->_sessionOpen = 1;
    if (self->_deviceVendorID == 1452)
      -[PTPInitiator allowKeepAwake](self, "allowKeepAwake");
  }
  sessionOpen = self->_sessionOpen;

  return sessionOpen;
}

- (BOOL)closeSession
{
  PTPOperationRequestPacket *v3;
  PTPOperationRequestPacket *v4;
  PTPTransaction *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:", 4099);
  v5 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v4, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v5, 60.0));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "responseCode") == 8193)
  {
    self->_sessionOpen = 0;
    self->_transactionID = 0;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)storageIDs
{
  PTPOperationRequestPacket *v3;
  PTPOperationRequestPacket *v4;
  PTPTransaction *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int *v11;

  v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:", 4100);
  v5 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v4, 0, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v5, 60.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v5, "rxDataBuffer"));
  if (v6 && objc_msgSend(v6, "responseCode") == 8193 && objc_msgSend(v7, "length"))
  {
    v11 = (unsigned int *)objc_msgSend(v7, "headerOffsetBytes");
    v8 = sub_1000278B0(&v11, (unint64_t)objc_msgSend(v7, "length") + (_QWORD)v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)storageInfo:(unsigned int)a3
{
  PTPOperationRequestPacket *v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;
  PTPStorageInfoDataset *v9;
  void *v10;
  PTPStorageInfoDataset *v11;

  v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4101);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 60.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v6, "rxDataBuffer"));
  if (v7 && objc_msgSend(v7, "responseCode") == 8193 && objc_msgSend(v8, "length"))
  {
    v9 = [PTPStorageInfoDataset alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", objc_msgSend(v8, "headerOffsetBytes"), objc_msgSend(v8, "length")));
    v11 = -[PTPStorageInfoDataset initWithMutableData:](v9, "initWithMutableData:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)readStorages
{
  PTPInitiator *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *j;
  id v23;
  PTPCameraStorage *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  unint64_t v34;
  PTPInitiator *v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  NSObject *v39;
  __CFString *v40;
  id v41;
  BOOL v42;
  id v44;
  void *v45;
  id v46;
  __CFString *v47;
  id obj;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];

  v2 = self;
  -[PTPInitiator setCatalogingDone:](self, "setCatalogingDone:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[PTPInitiator storageIDs](v2, "storageIDs"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        if ((unsigned __int16)objc_msgSend(v8, "longValue"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator storageForStorageID:](v2, "storageForStorageID:"));

          if (!v9)
            objc_msgSend(v3, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v5);
  }
  v10 = objc_msgSend(v3, "count");
  if (v10)
  {
    v44 = v10;
    __ICOSLogCreate();
    v11 = CFSTR("storages");
    if ((unint64_t)objc_msgSend(CFSTR("storages"), "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("storages"), "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v45 = v3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[PTPInitiator readStorages] storageIDs: %@\n"), v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v14));

    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v11);
      v18 = v16;
      v19 = -[__CFString UTF8String](v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v60 = v19;
      v61 = 2114;
      v62 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v46 = v3;
    v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    v20 = 0;
    if (v49)
    {
      v21 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(v46);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j), "longValue");
          if ((_WORD)v23)
          {
            v24 = -[PTPCameraStorage initWithStorageID:initiator:]([PTPCameraStorage alloc], "initWithStorageID:initiator:", v23, v2);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator storageInfo:](v2, "storageInfo:", v23));
            -[PTPCameraItem setInfo:](v24, "setInfo:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraStorage prime](v24, "prime"));
            -[NSMutableArray addObject:](v2->_storages, "addObject:", v24);
            v27 = -[PTPCameraStorage enumerateContent:withOrder:](v24, "enumerateContent:withOrder:", v26, v2->_enumerationOrder);
            __ICOSLogCreate();
            v28 = CFSTR("(prime)ptpObjectCount");
            if ((unint64_t)objc_msgSend(CFSTR("(prime)ptpObjectCount"), "length") >= 0x15)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("(prime)ptpObjectCount"), "substringWithRange:", 0, 18));
              v28 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X:%lu"), v23, -[PTPCameraStorage ptpObjectCount](v24, "ptpObjectCount")));
            v31 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_retainAutorelease(v28);
              v47 = v28;
              v33 = v26;
              v34 = v27;
              v35 = v2;
              v36 = v20;
              v37 = v21;
              v38 = v32;
              v39 = v31;
              v40 = v38;
              v21 = v37;
              v20 = v36;
              v2 = v35;
              v27 = v34;
              v26 = v33;
              v28 = v47;
              v41 = -[__CFString UTF8String](v40, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v60 = v41;
              v61 = 2114;
              v62 = v30;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            v20 += v27;

          }
        }
        v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v49);
    }

    -[PTPInitiator notifyDeviceReady:](v2, "notifyDeviceReady:", v20);
    -[PTPInitiator updateCatalogingDone](v2, "updateCatalogingDone");
    v10 = v44;
    v3 = v45;
  }
  v42 = v10 != 0;

  return v42;
}

- (id)storageForStorageID:(unsigned int)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_storages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "storageID", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)numObjectsInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5
{
  PTPOperationRequestPacket *v6;
  PTPOperationRequestPacket *v7;
  PTPTransaction *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4102);
  v8 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v7, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v8, 60.0));
  v10 = v9;
  if (v9 && objc_msgSend(v9, "responseCode") == 8193)
    v11 = objc_msgSend(v10, "parameter1");
  else
    v11 = 0;

  return v11;
}

- (id)objectHandlesInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5
{
  PTPOperationRequestPacket *v6;
  PTPOperationRequestPacket *v7;
  PTPTransaction *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int *v15;

  v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4103);
  v8 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v7, 0, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v8, 60.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v8, "rxDataBuffer"));
  v11 = v10;
  if (v9
    && objc_msgSend(v10, "length")
    && (objc_msgSend(v9, "responseCode") == 8193 || objc_msgSend(v9, "responseCode") == 8201))
  {
    v15 = (unsigned int *)objc_msgSend(v11, "headerOffsetBytes");
    v12 = sub_1000278B0(&v15, (unint64_t)objc_msgSend(v11, "length") + (_QWORD)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)objectInfo:(unsigned int)a3
{
  uint64_t v3;
  PTPOperationRequestPacket *v5;
  PTPOperationRequestPacket *v6;
  PTPTransaction *v7;
  void *v8;
  void *v9;
  PTPObjectInfoDataset *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v3 = *(_QWORD *)&a3;
  v5 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v6 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v5, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4104);
  v7 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v6, 0, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v7, 60.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v7, "rxDataBuffer"));
  if (v8 && objc_msgSend(v8, "responseCode") == 8193 && objc_msgSend(v9, "length"))
  {
    v10 = -[PTPObjectInfoDataset initWithBytes:length:]([PTPObjectInfoDataset alloc], "initWithBytes:length:", objc_msgSend(v9, "headerOffsetBytes"), objc_msgSend(v9, "length"));
    -[PTPObjectInfoDataset setObjectHandle:](v10, "setObjectHandle:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator initiator](self, "initiator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceInfo"));

    if (objc_msgSend(v12, "standardVersion") >= 0x6E)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator initiator](self, "initiator"));
      v14 = objc_msgSend(v13, "deviceVendorID");

      if (v14 == 1452)
      {
        if (v10)
          -[PTPObjectInfoDataset setObjectCompressedSize:](v10, "setObjectCompressedSize:", -[PTPInitiator objectCompressedSize64:](self, "objectCompressedSize64:", -[PTPObjectInfoDataset objectHandle](v10, "objectHandle")));
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)objectCompressedSize64:(unsigned int)a3
{
  PTPOperationRequestPacket *v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD *v11;

  v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 36870);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v6, 60.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v6, "rxDataBuffer"));
  if (v7 && objc_msgSend(v7, "responseCode") == 8193 && objc_msgSend(v8, "length"))
  {
    v11 = objc_msgSend(v8, "headerOffsetBytes");
    v9 = sub_100027420(&v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)objectInfoDatasetForObjectsInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5 contentType:(int)a6
{
  uint64_t v6;
  id v8;
  __int16 v9;
  unsigned __int16 v10;
  PTPOperationRequestPacket *v11;
  PTPTransaction *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  unsigned int *v17;
  unsigned int *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  PTPObjectInfoDataset *v22;
  PTPObjectInfoDataset *v23;
  PTPOperationRequestPacket *v25;

  v6 = *(_QWORD *)&a6;
  v8 = objc_alloc_init((Class)NSMutableArray);
  if ((_DWORD)v6 == 2)
    v9 = -28667;
  else
    v9 = 0;
  if ((_DWORD)v6 == 1)
    v10 = -28670;
  else
    v10 = v9;
  v11 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v25 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v11, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", v10);
  v12 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v25, 0, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v12, 60.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v12, "rxDataBuffer"));
  if (v13)
  {
    if (objc_msgSend(v13, "responseCode") == 8193)
    {
      v15 = objc_msgSend(v14, "length");
      if (v15)
      {
        v16 = (unint64_t)v15;
        v17 = (unsigned int *)objc_msgSend(v14, "headerOffsetBytes");
        if (v16 >= 9)
        {
          v18 = v17;
          do
          {
            v19 = v18[1];
            v20 = v16 - 8 >= v19;
            v16 = v16 - 8 - v19;
            if (!v20)
              break;
            v21 = *v18;
            v22 = -[PTPObjectInfoDataset initWithBytes:length:contentType:]([PTPObjectInfoDataset alloc], "initWithBytes:length:contentType:", v18, (v19 + 8), v6);
            v23 = v22;
            if (v22)
            {
              -[PTPObjectInfoDataset setObjectHandle:](v22, "setObjectHandle:", v21);
              objc_msgSend(v8, "addObject:", v23);
            }
            v18 = (unsigned int *)((char *)v18 + v19 + 8);

          }
          while (v16 > 8);
        }
      }
    }
  }
  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }

  return v8;
}

- (id)fileSystemManifestForStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5
{
  id v6;
  PTPOperationRequestPacket *v7;
  PTPOperationRequestPacket *v8;
  PTPTransaction *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *(__cdecl **v18)(CFAllocatorRef, void *, CFIndex, CFOptionFlags);
  void *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  __CFString *v26;
  id v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *(__cdecl *v31)(CFAllocatorRef, void *, CFIndex, CFOptionFlags);
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  __CFString *v40;
  void *v41;
  void *(__cdecl *v42)(CFAllocatorRef, void *, CFIndex, CFOptionFlags);
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  const __CFString *v48;
  const __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  NSObject *v52;
  __CFString *v53;
  id v54;
  void *v56;
  void *v57;
  PTPTransaction *v58;
  PTPOperationRequestPacket *v59;
  id v60;
  id v61;
  id v62;
  _QWORD *v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;

  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v8 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v7, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4131);
  v9 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v8, 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v9, 60.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v9, "rxDataBuffer"));
  if (v10)
  {
    if (objc_msgSend(v10, "responseCode") == 8193)
    {
      v12 = (uint64_t)objc_msgSend(v11, "length");
      if (v12 >= 1)
      {
        v13 = v12;
        v58 = v9;
        v59 = v8;
        v60 = v6;
        v56 = v11;
        v14 = (unsigned int *)objc_msgSend(v11, "mutableBytes");
        v15 = *v14;
        v63 = v14 + 2;
        __ICOSLogCreate();
        v16 = CFSTR("FilesystemMaifest");
        if ((unint64_t)objc_msgSend(CFSTR("FilesystemMaifest"), "length") >= 0x15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FilesystemMaifest"), "substringWithRange:", 0, 18));
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

        }
        v57 = v10;
        v18 = &CFAllocatorReallocate_ptr;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Num Objects: %X"), v15));
        v20 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_retainAutorelease(v16);
          v22 = v20;
          *(_DWORD *)buf = 136446466;
          v65 = -[__CFString UTF8String](v21, "UTF8String");
          v66 = 2114;
          v67 = v19;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        if (v13 >= 0x11)
        {
          v23 = v13 - 8;
          v24 = CFSTR("..");
          v25 = CFSTR("Name: %s");
          v26 = &stru_10004A300;
          do
          {
            sub_1000273CC(&v63);
            sub_1000273CC(&v63);
            sub_100027350(&v63);
            sub_100027350(&v63);
            sub_100027420(&v63);
            sub_1000273CC(&v63);
            sub_100027350(&v63);
            sub_1000273CC(&v63);
            sub_1000273CC(&v63);
            v27 = sub_1000275F0((const void **)&v63);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            v62 = objc_msgSend(v28, "length");
            __ICOSLogCreate();
            v29 = v26;
            if ((unint64_t)-[__CFString length](v26, "length") >= 0x15)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v26, "substringWithRange:", 0, 18));
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", v24));

            }
            v31 = v18[85];
            v61 = objc_retainAutorelease(v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringWithFormat:", v25, objc_msgSend(v61, "UTF8String")));
            v33 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v34 = objc_retainAutorelease(v29);
              v35 = v33;
              v36 = -[__CFString UTF8String](v34, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v65 = v36;
              v66 = 2114;
              v67 = v32;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            v37 = sub_1000275F0((const void **)&v63);
            v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            v39 = objc_msgSend(v38, "length");
            __ICOSLogCreate();
            v40 = v26;
            if ((unint64_t)-[__CFString length](v26, "length") >= 0x15)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v26, "substringWithRange:", 0, 18));
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingString:", v24));

            }
            v42 = v18[85];
            v43 = objc_retainAutorelease(v38);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringWithFormat:", CFSTR("Mod: %s"), objc_msgSend(v43, "UTF8String")));
            v45 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v46 = v39;
              v47 = v23;
              v48 = v25;
              v49 = v24;
              v50 = v26;
              v51 = objc_retainAutorelease(v40);
              v52 = v45;
              v53 = v51;
              v26 = v50;
              v24 = v49;
              v25 = v48;
              v23 = v47;
              v39 = v46;
              v54 = -[__CFString UTF8String](v53, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v65 = v54;
              v66 = 2114;
              v67 = v44;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            v23 = v23 - 2 * ((uint64_t)v62 + (_QWORD)v39) - 38;

            v18 = &CFAllocatorReallocate_ptr;
          }
          while (v23 > 8);
        }
        v8 = v59;
        v6 = v60;
        v10 = v57;
        v9 = v58;
        v11 = v56;
      }
    }
  }
  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }

  return v6;
}

- (id)objectInfoDatasetForNextObjectGroupInStorage:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  PTPOperationRequestPacket *v6;
  PTPOperationRequestPacket *v7;
  PTPTransaction *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int *v14;
  __CFString *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  PTPObjectInfoDataset *v26;
  PTPObjectInfoDataset *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  NSObject *v33;
  id v34;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 36879);
  v8 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v7, 0, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v8, 60.0));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v8, "rxDataBuffer"));
  if (v9)
  {
    if (objc_msgSend(v9, "responseCode") == 8193)
    {
      v10 = objc_msgSend(v36, "length");
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(v36, "headerOffsetBytes");
        v14 = (unsigned int *)(v12 + 1);
        v13 = *v12;
        __ICOSLogCreate();
        v15 = CFSTR("AssetGroup");
        if ((unint64_t)objc_msgSend(CFSTR("AssetGroup"), "length") >= 0x15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("AssetGroup"), "substringWithRange:", 0, 18));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("..")));

        }
        v17 = (unint64_t)v11 - 8;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received: %llu on 0x%08X"), v13, v3));
        v19 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_retainAutorelease(v15);
          v21 = v19;
          *(_DWORD *)buf = 136446466;
          v38 = -[__CFString UTF8String](v20, "UTF8String");
          v39 = 2114;
          v40 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        if (v17 >= 9)
        {
          while (1)
          {
            v22 = v14[1];
            v23 = v17 - 8;
            v24 = v17 - 8 >= v22;
            v17 = v17 - 8 - v22;
            if (!v24)
              break;
            v25 = *v14;
            v26 = -[PTPObjectInfoDataset initWithBytes:length:contentType:]([PTPObjectInfoDataset alloc], "initWithBytes:length:contentType:", v14, (v22 + 8), 2);
            v27 = v26;
            if (v26)
            {
              -[PTPObjectInfoDataset setObjectHandle:](v26, "setObjectHandle:", v25);
              objc_msgSend(v5, "addObject:", v27);
            }
            v14 = (unsigned int *)((char *)v14 + v22 + 8);

            if (v17 <= 8)
              goto LABEL_20;
          }
          __ICOSLogCreate();
          v28 = CFSTR("objInfoFail");
          if ((unint64_t)objc_msgSend(CFSTR("objInfoFail"), "length") >= 0x15)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("objInfoFail"), "substringWithRange:", 0, 18));
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu:%u"), v23, v22));
          v31 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_retainAutorelease(v28);
            v33 = v31;
            v34 = -[__CFString UTF8String](v32, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v38 = v34;
            v39 = 2114;
            v40 = v30;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
        }
      }
    }
  }
LABEL_20:
  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }

  return v5;
}

- (id)partialDataFromFile:(id)a3 fromOffset:(unint64_t)a4 maxSize:(unint64_t)a5 actualSize:(unint64_t *)a6 useBuffer:(char *)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  PTPWrappedBytes *v19;
  PTPWrappedBytes *v20;
  unsigned int v21;
  PTPOperationRequestPacket *v22;
  uint64_t transactionID;
  PTPOperationRequestPacket *v24;
  PTPTransaction *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "operationsSupported"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 36871));
  if (objc_msgSend(v12, "containsObject:", v13)
    && -[PTPInitiator deviceVendorID](self, "deviceVendorID") == 1452)
  {
    v14 = v10;

LABEL_5:
    v18 = sub_10001E788(a5);
    v19 = [PTPWrappedBytes alloc];
    if (a7)
      v20 = -[PTPWrappedBytes initWithBytes:capacity:](v19, "initWithBytes:capacity:", a7, v18);
    else
      v20 = -[PTPWrappedBytes initWithCapacity:](v19, "initWithCapacity:", 0);
    v24 = (PTPOperationRequestPacket *)v20;
    v29 = v14;
    if (-[PTPInitiator copyPartialFile:fromOffset:size:to:](self, "copyPartialFile:fromOffset:size:to:", v9, a4, a5, v20) == 8193)
    {
      v30 = -[PTPOperationRequestPacket length](v24, "length");
      *a6 = (unint64_t)v30;
      if (v30)
      {
        v31 = -[PTPOperationRequestPacket headerOffsetBytes](v24, "headerOffsetBytes");
        if (a7)
          v32 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v31, *(unsigned int *)a6, 0));
        else
          v32 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v31, -[PTPOperationRequestPacket length](v24, "length")));
        v28 = (void *)v32;
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
      *a6 = 0;
    }
    goto LABEL_21;
  }
  v14 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "operationsSupported"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 4123));
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if (v17)
    goto LABEL_5;
  v21 = objc_msgSend(v9, "size");
  v22 = [PTPOperationRequestPacket alloc];
  transactionID = self->_transactionID;
  self->_transactionID = transactionID + 1;
  v24 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v22, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4105, transactionID, 1, objc_msgSend(v9, "objHandle"));
  v25 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v24, 0, 0, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v25, 60.0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v25, "rxDataBuffer"));
  if (v26 && objc_msgSend(v26, "responseCode") == 8193 && objc_msgSend(v27, "length") == (id)v21)
  {
    memcpy(a7 + 12, (char *)objc_msgSend(v27, "headerOffsetBytes") + a4, a5);
    *a6 = a5;
  }

  v28 = 0;
  v29 = v14;
LABEL_21:

  return v28;
}

- (unsigned)copyPartialFile:(id)a3 fromOffset:(unint64_t)a4 size:(unint64_t)a5 to:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  PTPOperationRequestPacket *v14;
  uint64_t transactionID;
  PTPOperationRequestPacket *v16;
  PTPOperationRequestPacket *v17;
  uint64_t v18;
  PTPOperationRequestPacket *v19;
  PTPTransaction *v20;
  void *v21;
  void *v22;
  unsigned __int16 v23;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  if (objc_msgSend(v12, "standardVersion") < 0x6E)
  {

  }
  else
  {
    v13 = -[PTPInitiator deviceVendorID](self, "deviceVendorID");

    if (v13 == 1452)
    {
      v14 = [PTPOperationRequestPacket alloc];
      transactionID = self->_transactionID;
      self->_transactionID = transactionID + 1;
      v16 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:parameter4:parameter5:](v14, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:parameter4:parameter5:", 36871, transactionID, 1, objc_msgSend(v10, "objHandle"), a4, HIDWORD(a4), a5);
      goto LABEL_6;
    }
  }
  v17 = [PTPOperationRequestPacket alloc];
  v18 = self->_transactionID;
  self->_transactionID = v18 + 1;
  v16 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v17, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4123, v18, 1, objc_msgSend(v10, "objHandle"), a4, a5);
LABEL_6:
  v19 = v16;
  v20 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v16, 0, v11, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v20, 60.0));
  v22 = v21;
  if (v21)
    v23 = (unsigned __int16)objc_msgSend(v21, "responseCode");
  else
    v23 = 8194;

  return v23;
}

- (id)thumbDataFromFile:(id)a3 maxSize:(unsigned int)a4 actualSize:(unsigned int *)a5 useBuffer:(char *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  PTPOperationRequestPacket *v11;
  uint64_t transactionID;
  PTPOperationRequestPacket *v13;
  PTPTransaction *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
  v10 = objc_opt_class(PTPObjectInfoDataset);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && objc_msgSend(v9, "thumbCompressedSize"))
  {
    v11 = [PTPOperationRequestPacket alloc];
    transactionID = self->_transactionID;
    self->_transactionID = transactionID + 1;
    v13 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v11, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4106, transactionID, 1, objc_msgSend(v8, "objHandle"));
    v14 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v13, 0, 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v14, 60.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v14, "rxDataBuffer"));
    if (v15 && objc_msgSend(v15, "responseCode") == 8193)
    {
      v17 = objc_msgSend(v16, "length");
      *a5 = v17;
      if (v17)
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v16, "headerOffsetBytes"), objc_msgSend(v16, "length")));
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
      *a5 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)thumbDataFromFile:(id)a3 maxPixelSize:(unsigned int)a4 actualSize:(unsigned int *)a5 useBuffer:(char *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int deviceVendorID;
  PTPOperationRequestPacket *v16;
  uint64_t transactionID;
  PTPOperationRequestPacket *v18;
  PTPTransaction *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "operationsSupported"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 36876));
  if (!objc_msgSend(v13, "containsObject:", v14))
  {

    goto LABEL_8;
  }
  deviceVendorID = self->_deviceVendorID;

  if (deviceVendorID != 1452)
  {
LABEL_8:
    v24 = objc_opt_class(PTPObjectInfoDataset);
    if ((objc_opt_isKindOfClass(v11, v24) & 1) != 0 && objc_msgSend(v11, "thumbCompressedSize"))
    {
      if (v8 > 0xA0)
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altThumbnaillForMaxPixelSize:", v8));
      else
        v25 = objc_claimAutoreleasedReturnValue(-[PTPInitiator thumbDataFromFile:maxSize:actualSize:useBuffer:](self, "thumbDataFromFile:maxSize:actualSize:useBuffer:", v10, 5242880, a5, a6));
      v23 = (void *)v25;
      v18 = 0;
      v20 = 0;
      v21 = 0;
    }
    else
    {
      v18 = 0;
      v20 = 0;
      v21 = 0;
      v23 = 0;
    }
    goto LABEL_17;
  }
  v16 = [PTPOperationRequestPacket alloc];
  transactionID = self->_transactionID;
  self->_transactionID = transactionID + 1;
  v18 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:](v16, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:", 36876, transactionID, 1, objc_msgSend(v10, "objHandle"), v8);
  v19 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v18, 0, 0, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v19, 60.0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v19, "rxDataBuffer"));
  if (v20 && objc_msgSend(v20, "responseCode") == 8193)
  {
    v22 = objc_msgSend(v21, "length");
    *a5 = v22;
    if (v22)
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v21, "headerOffsetBytes"), objc_msgSend(v21, "length")));
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
    *a5 = 0;
  }

LABEL_17:
  v26 = v23;

  return v26;
}

- (id)metadataFromFile:(id)a3
{
  id v4;
  PTPOperationRequestPacket *v5;
  uint64_t transactionID;
  id v7;
  PTPOperationRequestPacket *v8;
  PTPTransaction *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = [PTPOperationRequestPacket alloc];
  transactionID = self->_transactionID;
  self->_transactionID = transactionID + 1;
  v7 = objc_msgSend(v4, "objHandle");

  v8 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v5, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 36873, transactionID, 1, v7);
  v9 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v8, 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v9, 60.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v9, "rxDataBuffer"));
  if (v10 && objc_msgSend(v10, "responseCode") == 8193 && objc_msgSend(v11, "length"))
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v11, "headerOffsetBytes"), objc_msgSend(v11, "length")));
  else
    v12 = 0;

  return v12;
}

- (BOOL)initiateCapture
{
  PTPOperationRequestPacket *v3;
  PTPOperationRequestPacket *v4;
  PTPTransaction *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:", 4110);
  v5 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v4, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v5, 60.0));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "responseCode") == 8193;
  else
    v8 = 0;

  return v8;
}

- (BOOL)deleteFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  PTPOperationRequestPacket *v9;
  uint64_t transactionID;
  PTPOperationRequestPacket *v11;
  PTPTransaction *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationsSupported"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 4107));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v9 = [PTPOperationRequestPacket alloc];
    transactionID = self->_transactionID;
    self->_transactionID = transactionID + 1;
    v11 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v9, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4107, transactionID, 1, objc_msgSend(v4, "objHandle"));
    v12 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v11, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v12, 60.0));
    v14 = v13;
    if (v13 && objc_msgSend(v13, "responseCode") == 8193)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator storageForStorageID:](self, "storageForStorageID:", objc_msgSend(v4, "storageID")));
      if (v15)
        objc_msgSend(v15, "removeCameraFileFromIndex:", objc_msgSend(v4, "objHandle"));

      v16 = 1;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)deviceDateTime
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  PTPOperationRequestPacket *v7;
  PTPOperationRequestPacket *v8;
  PTPTransaction *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicePropertiesSupported"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 20497));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (!v6)
    return 0;
  v7 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v8 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v7, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4117);
  v9 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v8, 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v9, 60.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v9, "rxDataBuffer"));
  if (v10 && objc_msgSend(v10, "responseCode") == 8193 && objc_msgSend(v11, "length"))
  {
    v22 = objc_msgSend(v11, "headerOffsetBytes");
    v12 = sub_100027434((const void **)&v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v13)
    {
      v14 = objc_alloc_init((Class)NSDateFormatter);
      objc_msgSend(v14, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss"));
      v20 = 0;
      v21 = 0;
      v19 = 0;
      v15 = objc_retainAutorelease(v13);
      sscanf((const char *)objc_msgSend(v15, "UTF8String"), "%04d%02d%02dT%02d%02d%02d", (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19);
      if ((unint64_t)objc_msgSend(v15, "length") < 0x10)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateFromString:", v15));
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringToIndex:", 15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateFromString:", v16));

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (double)timeOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceDateTime](self, "deviceDateTime"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (BOOL)setDeviceDateTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  BOOL v10;
  void *v11;
  _BYTE *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _BYTE *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devicePropertiesSupported"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 20497));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    if (v4)
      v9 = v4;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = v9;
    v12 = malloc_type_malloc(0x40uLL, 0xF293BE13uLL);
    v18 = v12;
    v13 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v13, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromDate:", v11));
    sub_100027514(&v18, v14);
    v15 = objc_alloc((Class)NSData);
    v16 = objc_msgSend(v15, "initWithBytesNoCopy:length:freeWhenDone:", v12, v18 - v12, 0);
    v10 = -[PTPInitiator setDevicePropertyValue:forProperty:](self, "setDevicePropertyValue:forProperty:", v16, 20497);
    free(v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sendPTPCommand:(id)a3 andPayload:(id)a4 withReply:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  void *v10;
  void *v11;
  PTPOperationRequestPacket *v12;
  id v13;
  id v14;
  PTPOperationRequestPacket *v15;
  id v16;
  uint64_t transactionID;
  PTPDataPacket *v18;
  PTPTransaction *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v8 = (void (**)(id, void *))a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
  objc_msgSend(v10, "holdPowerAssertion");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v12 = [PTPOperationRequestPacket alloc];
  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "bytes");

  v15 = -[PTPOperationRequestPacket initWithUSBBuffer:](v12, "initWithUSBBuffer:", v14);
  v16 = objc_msgSend(v25, "length");
  transactionID = self->_transactionID;
  if (v16)
  {
    -[PTPOperationRequestPacket setTransactionID:](v15, "setTransactionID:", transactionID);
    -[PTPOperationRequestPacket setDataPhaseInfo:](v15, "setDataPhaseInfo:", 2);
    v18 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", -[PTPOperationRequestPacket operationCode](v15, "operationCode"), self->_transactionID, v25);
    v19 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v15, v18, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v19, 60.0));
    ++self->_transactionID;
  }
  else
  {
    self->_transactionID = transactionID + 1;
    -[PTPOperationRequestPacket setTransactionID:](v15, "setTransactionID:");
    -[PTPOperationRequestPacket setDataPhaseInfo:](v15, "setDataPhaseInfo:", 1);
    v19 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v15, 0, 0, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v19, 60.0));
    v18 = (PTPDataPacket *)objc_claimAutoreleasedReturnValue(-[PTPTransaction rxDataBuffer](v19, "rxDataBuffer"));
    if (v20 && objc_msgSend(v20, "responseCode") == 8193 && -[PTPDataPacket length](v18, "length"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", -[PTPDataPacket headerOffsetBytes](v18, "headerOffsetBytes"), -[PTPDataPacket length](v18, "length")));
      objc_msgSend(v11, "setObject:forKey:", v24, CFSTR("ICPTPDataInBuffer"));

    }
  }

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contentForUSB"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length")));
    objc_msgSend(v11, "setObject:forKey:", v22, CFSTR("ICPTPResponseBuffer"));

  }
  v8[2](v8, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
  objc_msgSend(v23, "releasePowerAssertion");

}

- (unsigned)deviceStatus
{
  return -[PTPHostUSBTransport deviceStatus](self->_transport, "deviceStatus");
}

- (void)deviceReset
{
  -[PTPHostUSBTransport deviceReset](self->_transport, "deviceReset");
}

- (BOOL)isAccessRestrictedAppleDevice
{
  BOOL v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  uint64_t *v9;
  char v10;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (-[PTPInitiator deviceVendorID](self, "deviceVendorID") != 1452)
    goto LABEL_6;
  if (!self->_sessionOpen)
  {
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000127C8;
    v12[3] = &unk_100048A88;
    v12[4] = self;
    v14 = &v15;
    v6 = v4;
    v13 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v12));
    objc_msgSend(v5, "addInteractiveOperation:", v7);

    v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v8);

LABEL_6:
    v9 = v16;
    goto LABEL_9;
  }
  v3 = self->_deviceIsPasscodeLocked || !self->_deviceIsPairedWithThisHost;
  v9 = v16;
  *((_BYTE *)v16 + 24) = v3;
LABEL_9:
  v10 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)containsAccessRestrictedAppleDeviceStorage
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator storageForStorageID:](self, "storageForStorageID:", 4277009102));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isAppleDevice
{
  return -[PTPInitiator deviceVendorID](self, "deviceVendorID") == 1452;
}

- (BOOL)prioritizeSpeed
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "prioritizeSpeed");

  return v3;
}

- (void)updateCatalogingDone
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_storages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "catalogingDone", (_QWORD)v9))
        {
          v8 = 0;
          goto LABEL_11;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  -[PTPInitiator setCatalogingDone:](self, "setCatalogingDone:", v8);
}

- (void)notifyDeviceReady:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[PTPInitiator preflightCount](self, "preflightCount")));
  v5 = (void *)v4;
  v20[0] = CFSTR("ICDeviceStatus");
  v20[1] = CFSTR("ICANumberOfPreflightObjectsKey");
  v21[0] = CFSTR("ICDeviceIsReady");
  v21[1] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allConnections"));
  objc_msgSend(v7, "sendStatusNotification:toConnections:", v6, v9);

  __ICOSLogCreate();
  v10 = CFSTR("notifyDeviceReady");
  if ((unint64_t)objc_msgSend(CFSTR("notifyDeviceReady"), "length") >= 0x15)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("notifyDeviceReady"), "substringWithRange:", 0, 18));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d Preflighted"), objc_msgSend(v5, "intValue")));
  v13 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v10);
    v15 = v13;
    *(_DWORD *)buf = 136446466;
    v17 = -[__CFString UTF8String](v14, "UTF8String");
    v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (void)sendContentsNotificationWithOrder:(int64_t)a3 toConnections:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator delegate](self, "delegate"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000133B4;
  v10[3] = &unk_100048AB0;
  v10[4] = self;
  v11 = v6;
  v12 = a3;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v10));
  objc_msgSend(v7, "addInteractiveOperation:", v9);

}

- (unsigned)ptpObjectCount
{
  id v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = -[NSMutableArray copy](self->_storages, "copy");
  LODWORD(v3) = objc_msgSend(v2, "count");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 = (char *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "ptpObjectCount", (_QWORD)v10)
           + v3;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (unsigned)preflightCount
{
  id v2;
  id v3;
  id v4;
  id v5;
  char *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = -[NSMutableArray copy](self->_storages, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    LODWORD(v6) = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 = (char *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "ptpObjectCount", (_QWORD)v10)
           + v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LODWORD(v6) = 0;
  }

  return v6;
}

- (BOOL)sendHostSupportsGroupNotifications
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t transactionID;
  BOOL v8;
  PTPOperationRequestPacket *v9;
  PTPTransaction *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "operationsSupported"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 36880));
  if (!objc_msgSend(v4, "containsObject:", v5))
  {

    return 0;
  }
  v6 = -[PTPInitiator deviceVendorID](self, "deviceVendorID");

  if (v6 != 1452)
    return 0;
  if (self->_sessionOpen)
  {
    transactionID = self->_transactionID;
    self->_transactionID = transactionID + 1;
  }
  else
  {
    transactionID = 0;
  }
  v9 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:]([PTPOperationRequestPacket alloc], "initWithOperationCode:transactionID:dataPhaseInfo:", 36880, transactionID, 1);
  v10 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v9, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v10, 60.0));
  v12 = v11;
  if (v11 && objc_msgSend(v11, "responseCode") == 8193)
  {
    __ICOSLogCreate();
    v13 = CFSTR("PTPCaps");
    if ((unint64_t)objc_msgSend(CFSTR("PTPCaps"), "length") >= 0x15)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPCaps"), "substringWithRange:", 0, 18));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Host Requested Groups Sent")));
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v13);
      v18 = v16;
      v20 = 136446466;
      v21 = -[__CFString UTF8String](v17, "UTF8String");
      v22 = 2114;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v20, 0x16u);

    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)sendHostMediaCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t transactionID;
  BOOL v12;
  PTPOperationRequestPacket *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  PTPDataPacket *v20;
  PTPTransaction *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  void *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator deviceInfo](self, "deviceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "operationsSupported"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 36875));
  if (!objc_msgSend(v4, "containsObject:", v5))
  {

    return 0;
  }
  v6 = -[PTPInitiator deviceVendorID](self, "deviceVendorID");

  if (v6 != 1452)
    return 0;
  v36 = PFMediaCapabilitiesOptionsSortSourceEnumerationAscending;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PTPInitiator orderAscending](self, "orderAscending")));
  v37 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PFMediaCapabilities capabilitiesForCurrentDeviceWithOptions:](PFMediaCapabilities, "capabilitiesForCurrentDeviceWithOptions:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "opaqueRepresentation"));
  if (v10)
  {
    if (self->_sessionOpen)
    {
      transactionID = self->_transactionID;
      self->_transactionID = transactionID + 1;
    }
    else
    {
      transactionID = 0;
    }
    v13 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:]([PTPOperationRequestPacket alloc], "initWithOperationCode:transactionID:dataPhaseInfo:", 36875, transactionID, 2);
    __ICOSLogCreate();
    v14 = CFSTR("Capabilities");
    if ((unint64_t)objc_msgSend(CFSTR("Capabilities"), "length") >= 0x15)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Capabilities"), "substringWithRange:", 0, 18));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sending Host Capabilities: [%lu]"), (int)objc_msgSend(v10, "length")));
    v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_retainAutorelease(v14);
      v19 = v17;
      *(_DWORD *)buf = 136446466;
      v33 = -[__CFString UTF8String](v18, "UTF8String");
      v34 = 2114;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v20 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", 36875, transactionID, v10);
    v21 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v13, v20, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v21, 60.0));
    v23 = v22;
    if (v22 && objc_msgSend(v22, "responseCode") == 8193)
    {
      __ICOSLogCreate();
      v24 = CFSTR("Capabilities");
      if ((unint64_t)objc_msgSend(CFSTR("Capabilities"), "length") >= 0x15)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Capabilities"), "substringWithRange:", 0, 18));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Capabilities Sent")));
      v27 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_retainAutorelease(v24);
        v29 = v27;
        v30 = -[__CFString UTF8String](v28, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v33 = v30;
        v34 = 2114;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)allowKeepAwake
{
  PTPOperationRequestPacket *v3;
  PTPOperationRequestPacket *v4;
  PTPTransaction *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (self->_deviceVendorID != 1452)
    return 0;
  v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 36868);
  v5 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v4, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPInitiator executeTransaction:timeout:](self, "executeTransaction:timeout:", v5, 60.0));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "responseCode") == 8193;
  else
    v8 = 0;

  return v8;
}

- (ICCameraDeviceNotificationProtocol)delegate
{
  return (ICCameraDeviceNotificationProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PTPHostUSBTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (unint64_t)icplState
{
  return self->_icplState;
}

- (void)setIcplState:(unint64_t)a3
{
  self->_icplState = a3;
}

- (unint64_t)icplOptimizeStorageState
{
  return self->_icplOptimizeStorageState;
}

- (void)setIcplOptimizeStorageState:(unint64_t)a3
{
  self->_icplOptimizeStorageState = a3;
}

- (unsigned)deviceVendorID
{
  return self->_deviceVendorID;
}

- (void)setDeviceVendorID:(unsigned __int16)a3
{
  self->_deviceVendorID = a3;
}

- (unsigned)deviceProductID
{
  return self->_deviceProductID;
}

- (void)setDeviceProductID:(unsigned __int16)a3
{
  self->_deviceProductID = a3;
}

- (void)setAppleSerialNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)deviceSerialNumberString
{
  return self->_deviceSerialNumberString;
}

- (void)setDeviceSerialNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)userAssignedDeviceName
{
  return self->_userAssignedDeviceName;
}

- (void)setUserAssignedDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)deviceIsEnumerating
{
  return self->_deviceIsEnumerating;
}

- (void)setDeviceIsEnumerating:(BOOL)a3
{
  self->_deviceIsEnumerating = a3;
}

- (BOOL)requestPending
{
  return self->_requestPending;
}

- (void)setRequestPending:(BOOL)a3
{
  self->_requestPending = a3;
}

- (BOOL)deviceIsPairedWithThisHost
{
  return self->_deviceIsPairedWithThisHost;
}

- (void)setDeviceIsPairedWithThisHost:(BOOL)a3
{
  self->_deviceIsPairedWithThisHost = a3;
}

- (BOOL)deviceIsPasscodeLocked
{
  return self->_deviceIsPasscodeLocked;
}

- (void)setDeviceIsPasscodeLocked:(BOOL)a3
{
  self->_deviceIsPasscodeLocked = a3;
}

- (BOOL)orderAscending
{
  return self->_orderAscending;
}

- (void)setOrderAscending:(BOOL)a3
{
  self->_orderAscending = a3;
}

- (BOOL)sessionOpen
{
  return self->_sessionOpen;
}

- (void)setSessionOpen:(BOOL)a3
{
  self->_sessionOpen = a3;
}

- (BOOL)needToReopenSession
{
  return self->_needToReopenSession;
}

- (void)setNeedToReopenSession:(BOOL)a3
{
  self->_needToReopenSession = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (BOOL)cancelOp
{
  return self->_cancelOp;
}

- (void)setCancelOp:(BOOL)a3
{
  self->_cancelOp = a3;
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (NSMutableArray)storages
{
  return self->_storages;
}

- (void)setStorages:(id)a3
{
  objc_storeStrong((id *)&self->_storages, a3);
}

- (int64_t)enumerationOrder
{
  return self->_enumerationOrder;
}

- (void)setEnumerationOrder:(int64_t)a3
{
  self->_enumerationOrder = a3;
}

- (unsigned)enumeratedCount
{
  return self->_enumeratedCount;
}

- (void)setEnumeratedCount:(unsigned int)a3
{
  self->_enumeratedCount = a3;
}

- (BOOL)catalogingDone
{
  return self->_catalogingDone;
}

- (void)setCatalogingDone:(BOOL)a3
{
  self->_catalogingDone = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_timerQueue, a3);
}

- (NSMutableDictionary)mobdevProperties
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMobdevProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OS_dispatch_queue)mobdevPropertiesQueue
{
  return self->_mobdevPropertiesQueue;
}

- (void)setMobdevPropertiesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mobdevPropertiesQueue, a3);
}

- (os_unfair_lock_s)mobdevPropertiesLock
{
  return self->_mobdevPropertiesLock;
}

- (void)setMobdevPropertiesLock:(os_unfair_lock_s)a3
{
  self->_mobdevPropertiesLock = a3;
}

- (OS_remote_device_browser)mobdevPropertiesBrowser
{
  return self->_mobdevPropertiesBrowser;
}

- (void)setMobdevPropertiesBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_mobdevPropertiesBrowser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobdevPropertiesBrowser, 0);
  objc_storeStrong((id *)&self->_mobdevPropertiesQueue, 0);
  objc_storeStrong((id *)&self->_mobdevProperties, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_storages, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_userAssignedDeviceName, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumberString, 0);
  objc_storeStrong((id *)&self->_appleSerialNumberString, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
