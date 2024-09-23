@implementation SDAirDropReceiveManager

- (SDAirDropReceiveManager)init
{
  SDAirDropReceiveManager *v2;
  SDAirDropReceiveManager *v3;
  SDAirDropListener *listener;
  NSMutableDictionary *v5;
  NSMutableDictionary *transferIdentifierToNetworkOperation;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAirDropReceiveManager;
  v2 = -[SDAirDropReceiveManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0;

    v5 = objc_opt_new(NSMutableDictionary);
    transferIdentifierToNetworkOperation = v3->_transferIdentifierToNetworkOperation;
    v3->_transferIdentifierToNetworkOperation = v5;

  }
  return v3;
}

- (void)start
{
  SDAirDropListener *v3;
  SDAirDropListener *listener;
  int v5;
  void *v6;
  id v7;

  if (!self->_listener)
  {
    v3 = objc_alloc_init(SDAirDropListener);
    listener = self->_listener;
    self->_listener = v3;

    -[SDAirDropListener setDelegate:](self->_listener, "setDelegate:", self);
    -[SDAirDropListener start](self->_listener, "start");
    v7 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    if (objc_msgSend(v7, "enableDebugMode"))
    {
      v5 = IsAppleInternalBuild();

      if (!v5)
        return;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropFakeTransfer sharedFakeTransfer](SDAirDropFakeTransfer, "sharedFakeTransfer"));
      objc_msgSend(v6, "setTransferManager:", self->_alertManager);

      v7 = (id)objc_claimAutoreleasedReturnValue(+[SDAirDropFakeTransfer sharedFakeTransfer](SDAirDropFakeTransfer, "sharedFakeTransfer"));
      objc_msgSend(v7, "setDebugModeEnabled:", 1);
    }

  }
}

- (void)stop
{
  SDAirDropListener *listener;
  SDAirDropListener *v4;
  int v5;
  id v6;

  listener = self->_listener;
  if (listener)
  {
    -[SDAirDropListener setDelegate:](listener, "setDelegate:", 0);
    -[SDAirDropListener stop](self->_listener, "stop");
    v4 = self->_listener;
    self->_listener = 0;

    v6 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    if (objc_msgSend(v6, "enableDebugMode"))
    {
      v5 = IsAppleInternalBuild();

      if (!v5)
        return;
      v6 = (id)objc_claimAutoreleasedReturnValue(+[SDAirDropFakeTransfer sharedFakeTransfer](SDAirDropFakeTransfer, "sharedFakeTransfer"));
      objc_msgSend(v6, "setDebugModeEnabled:", 0);
    }

  }
}

- (void)listener:(id)a3 didReceiveNewRequest:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectKey"));
  v7 = airdrop_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000C4E5C();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transferIdentifierToNetworkOperation, "setObject:forKeyedSubscript:", v5, v6);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "resume");

}

- (void)listener:(id)a3 didReceiveError:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;

  v4 = a4;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000C4ED8((uint64_t)v4, v6);

}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectKey"));
  v11 = (void *)v10;
  if (a4 == 7)
  {
LABEL_2:
    v12 = airdrop_log(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1000C4F4C((uint64_t)v11, v9, v13);

    -[SDAirDropAlertManagerProtocol progressEventForRecordID:withResults:](self->_alertManager, "progressEventForRecordID:withResults:", v11, v9);
  }
  else
  {
    v14 = airdrop_log(v10);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a4 - 1) > 0xE)
        v16 = CFSTR("?");
      else
        v16 = *(&off_100716BD0 + a4 - 1);
      v25 = 138412546;
      v26 = v16;
      v27 = 2112;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SDAirDropReceiveManager: Received event %@ for transfer %@", (uint8_t *)&v25, 0x16u);
    }

    switch(a4)
    {
      case 2:
        -[SDAirDropAlertManagerProtocol askEventForRecordID:withResults:](self->_alertManager, "askEventForRecordID:withResults:", v11, v9);
        break;
      case 4:
        -[SDAirDropAlertManagerProtocol cancelEventForRecordID:withResults:](self->_alertManager, "cancelEventForRecordID:withResults:", v11, v9);
        -[NSMutableDictionary removeObjectForKey:](self->_transferIdentifierToNetworkOperation, "removeObjectForKey:", v11);
        objc_msgSend(v8, "invalidate");
        break;
      case 5:
      case 6:
      case 8:
      case 13:
        break;
      case 7:
        goto LABEL_2;
      case 9:
        -[SDAirDropAlertManagerProtocol finishedEventForRecordID:withResults:](self->_alertManager, "finishedEventForRecordID:withResults:", v11, v9);
        -[NSMutableDictionary removeObjectForKey:](self->_transferIdentifierToNetworkOperation, "removeObjectForKey:", v11);
        break;
      case 10:
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFOperationErrorKey));
        v20 = objc_msgSend(v19, "code");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domain"));
        if (!objc_msgSend(v21, "isEqual:", NSPOSIXErrorDomain) || v20 != (id)89)
        {
          v22 = objc_msgSend(v21, "isEqual:", NSOSStatusErrorDomain);
          if (!(_DWORD)v22 || v20 != (id)-128)
          {
            v23 = airdrop_log(v22);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              sub_1000C5100();

            -[SDAirDropAlertManagerProtocol errorEventForRecordID:withResults:](self->_alertManager, "errorEventForRecordID:withResults:", v11, v9);
          }
        }
        -[NSMutableDictionary removeObjectForKey:](self->_transferIdentifierToNetworkOperation, "removeObjectForKey:", v11);
        objc_msgSend(v8, "invalidate");

        break;
      default:
        v17 = airdrop_log(v10);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1000C5050(a4, (uint64_t)v9, v18);

        break;
    }
  }

}

- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v6 = a6;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferIdentifierToNetworkOperation, "objectForKeyedSubscript:", a4));
  if (v10)
  {
    if (v9)
    {
      v11 = kSFOperationDestinationURLKey;
      v16[0] = kSFOperationDestinationURLKey;
      v17[0] = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
      v16[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v17[1] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));

      objc_msgSend(v10, "setProperty:forKey:", v14, v11);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    objc_msgSend(v10, "setProperty:forKey:", v15, kSFOperationExtractPhotosBundleMediaKey);

    objc_msgSend(v10, "resume");
  }

}

- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferIdentifierToNetworkOperation, "objectForKeyedSubscript:"));
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_transferIdentifierToNetworkOperation, "removeObjectForKey:", v7);
    objc_msgSend(v6, "invalidate");
  }

}

- (NSString)description
{
  SDAirDropListener *listener;
  void *v3;
  id v4;
  id v6;

  listener = self->_listener;
  if (!listener)
    return (NSString *)0;
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropListener description](listener, "description"));
  NSAppendPrintF(&v6, "%@\n", v3);
  v4 = v6;

  return (NSString *)v4;
}

- (SDAirDropAlertManagerProtocol)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
  objc_storeStrong((id *)&self->_alertManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_transferIdentifierToNetworkOperation, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
