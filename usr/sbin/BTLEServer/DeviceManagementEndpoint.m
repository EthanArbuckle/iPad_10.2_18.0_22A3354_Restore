@implementation DeviceManagementEndpoint

- (DeviceManagementEndpoint)init
{
  void *v3;
  DeviceManagementEndpoint *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("ConnectClassicDevice"), CFSTR("DisconnectClassicDevice"), CFSTR("ClassicDeviceUnexpectedDisconnection"), CFSTR("VersionInfoRequest"), CFSTR("VersionInfoResponse"), CFSTR("ClassicPairStateRequest"), CFSTR("ClassicPairStateResponse"), CFSTR("StoreClassicLinkKeyRequest"), CFSTR("StoreClassicLinkKeyRequestExtended"), CFSTR("StoreClassicLinkKeyResponse"), CFSTR("StoreClassicDeviceSettings"), CFSTR("NotifyPrimaryBudSide"), CFSTR("LeaEasyPairRequest"), CFSTR("LeaEasyPairResponse"), CFSTR("LeaStoreBondingInfoRequest"), CFSTR("LeaStoreBondingInfoResponse"),
                   0));
  v6.receiver = self;
  v6.super_class = (Class)DeviceManagementEndpoint;
  v4 = -[Endpoint initWithIdentifier:supportedCommands:](&v6, "initWithIdentifier:supportedCommands:", CFSTR("com.apple.BTLEServer.classic"), v3);

  if (v4)
    -[Endpoint setType:](v4, "setType:", 1);
  return v4;
}

- (void)addPipe:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceManagementEndpoint;
  v3 = a3;
  -[Endpoint addPipe:](&v7, "addPipe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peer", v7.receiver, v7.super_class));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006AFBC();
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v5)
  {
LABEL_3:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    objc_msgSend(v6, "sendDevMgmtPipeConnectedMsg:", v5);

  }
LABEL_4:

}

- (void)removePipe:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceManagementEndpoint;
  v3 = a3;
  -[Endpoint removePipe:](&v7, "removePipe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peer", v7.receiver, v7.super_class));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006AFE8();
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v5)
  {
LABEL_3:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    objc_msgSend(v6, "sendDevMgmtPipeDisconnectedMsg:", v5);

  }
LABEL_4:

}

- (void)connectDevice:(id)a3 quickDisconnectEnabled:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'connect classic device' message for device \"%@\", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v22[1] = v7;
        v23 = CFSTR("ConnectClassicDevice");
        v21[0] = CFSTR("kDeviceAddress");
        v21[1] = CFSTR("kQuickDisconnectEnabled");
        v22[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v24 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)disconnectDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending 'disconnect classic device' message for device \"%@\", buf, 0xCu);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v19 = v4;
        v20 = CFSTR("DisconnectClassicDevice");
        v18 = CFSTR("kDeviceAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v21 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
        objc_msgSend(v10, "sendMessage:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

}

- (void)unexpectedDisconnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending 'unexpected disconnection' message for device \"%@\", buf, 0xCu);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v19 = v4;
        v20 = CFSTR("ClassicDeviceUnexpectedDisconnection");
        v18 = CFSTR("kDeviceAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v21 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
        objc_msgSend(v10, "sendMessage:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

}

- (void)requestVersionInfo:(id)a3 cloudAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  void *v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'version info request' message", buf, 2u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v23[1] = v7;
        v24 = CFSTR("VersionInfoRequest");
        v22[0] = CFSTR("kEasyPairingVersion");
        v22[1] = CFSTR("kCloudAccount");
        v23[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
        v25 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v10);
  }

}

- (void)respondVersionInfo:(id)a3 cloudAccount:(id)a4 easyPairingStatus:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _QWORD v25[3];
  _QWORD v26[3];
  const __CFString *v27;
  void *v28;
  _BYTE v29[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending 'version info response' message", buf, 2u);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v26[2] = v10;
        v27 = CFSTR("VersionInfoResponse");
        v25[0] = CFSTR("kEasyPairingVersion");
        v25[1] = CFSTR("kCloudAccount");
        v26[0] = v8;
        v26[1] = v9;
        v25[2] = CFSTR("kEasyPairingStatus");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
        v28 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
        objc_msgSend(v16, "sendMessage:", v18);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v13);
  }

}

- (void)requestPairStateForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending 'classic pair state request' message for device \"%@\", buf, 0xCu);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v19 = v4;
        v20 = CFSTR("ClassicPairStateRequest");
        v18 = CFSTR("kDeviceAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v21 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
        objc_msgSend(v10, "sendMessage:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

}

- (void)respondToPairState:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'classic pair state response' message for device \"%@\", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v22[1] = v7;
        v23 = CFSTR("ClassicPairStateResponse");
        v21[0] = CFSTR("kDevicePairState");
        v21[1] = CFSTR("kDeviceAddress");
        v22[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v24 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)requestStoreLinkKey:(id)a3 name:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _QWORD v25[3];
  const __CFString *v26;
  void *v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending 'store classic link key request' message for device \"%@\", buf, 0xCu);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v25[2] = v8;
        v26 = CFSTR("StoreClassicLinkKeyRequest");
        v24[0] = CFSTR("kDeviceAddress");
        v24[1] = CFSTR("kDeviceName");
        v25[0] = v10;
        v25[1] = v9;
        v24[2] = CFSTR("kDeviceLinkKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
        v27 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        objc_msgSend(v16, "sendMessage:", v18);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

}

- (void)requestStoreLinkKeyExtended:(id)a3 name:(id)a4 device:(id)a5 deviceServiceMask:(id)a6 classOfDevice:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  const __CFString *v32;
  void *v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;

  v25 = a3;
  v24 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending 'store classic link key request extended' message for device \"%@\", buf, 0xCu);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v19);
        v32 = CFSTR("StoreClassicLinkKeyRequestExtended");
        v30[0] = CFSTR("kDeviceAddress");
        v30[1] = CFSTR("kDeviceName");
        v31[0] = v12;
        v31[1] = v24;
        v30[2] = CFSTR("kDeviceLinkKey");
        v30[3] = CFSTR("kDeviceServiceMask");
        v31[2] = v25;
        v31[3] = v13;
        v30[4] = CFSTR("kClassOfDeviceMask");
        v31[4] = v14;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 5));
        v33 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
        objc_msgSend(v20, "sendMessage:", v22);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

}

- (void)respondToStoreLinkKey:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'store classic link key response' message for device \"%@\", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v22[1] = v7;
        v23 = CFSTR("StoreClassicLinkKeyResponse");
        v21[0] = CFSTR("kStoreClassicLinkKeyResult");
        v21[1] = CFSTR("kDeviceAddress");
        v22[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v24 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)storeDeviceSettings:(id)a3 inEarEnable:(id)a4 doubleTapMode:(id)a5 deviceSettings:(id)a6 deviceName:(id)a7 device:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  _QWORD v34[6];
  const __CFString *v35;
  void *v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;

  v27 = a3;
  v26 = a4;
  v28 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v39 = v16;
    v40 = 2112;
    v41 = v15;
    v42 = 2112;
    v43 = v28;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending 'store classic device settings' message for device \"%@\", devName = \"%@\", doubleTap = %@", buf, 0x20u);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v21);
        v35 = CFSTR("StoreClassicDeviceSettings");
        v33[0] = CFSTR("kClassicDeviceMicMode");
        v33[1] = CFSTR("kClassicDeviceInEarEnable");
        v34[0] = v27;
        v34[1] = v26;
        v33[2] = CFSTR("kClassicDeviceDoubleTapMode");
        v33[3] = CFSTR("kClassicDeviceSettings");
        v34[2] = v28;
        v34[3] = v14;
        v33[4] = CFSTR("kDeviceName");
        v33[5] = CFSTR("kDeviceAddress");
        v34[4] = v15;
        v34[5] = v16;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 6));
        v36 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
        objc_msgSend(v22, "sendMessage:", v24);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }

}

- (void)notifyPrimaryBudSide:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'notifiy primary bud side' message for device \"%@\", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v22[1] = v7;
        v23 = CFSTR("NotifyPrimaryBudSide");
        v21[0] = CFSTR("kPrimaryBudSide");
        v21[1] = CFSTR("kDeviceAddress");
        v22[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v24 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)requestLeaEasyPair:(id)a3 deviceIdentifier:(id)a4 deviceTags:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _QWORD v25[3];
  const __CFString *v26;
  void *v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending 'LEA easy pair request' message for device \"%@\", buf, 0xCu);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v25[2] = v10;
        v26 = CFSTR("LeaEasyPairRequest");
        v24[0] = CFSTR("kLeaDeviceAddress");
        v24[1] = CFSTR("kLeaDeviceIdentifier");
        v25[0] = v8;
        v25[1] = v9;
        v24[2] = CFSTR("kLeaDeviceTags");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
        v27 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        objc_msgSend(v16, "sendMessage:", v18);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

}

- (void)respondToLeaEasyPair:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'LEA easy pair response' message for device \"%@\", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v22[1] = v7;
        v23 = CFSTR("LeaEasyPairResponse");
        v21[0] = CFSTR("kLeaDevicePairState");
        v21[1] = CFSTR("kLeaDeviceAddress");
        v22[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v24 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)requestLeaStoreBondingInfo:(id)a3 rand:(id)a4 ltk:(id)a5 irk:(id)a6 name:(id)a7 device:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  _QWORD v34[6];
  const __CFString *v35;
  void *v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending 'LEA store bonding info request' message for device \"%@\", buf, 0xCu);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v21);
        v35 = CFSTR("LeaStoreBondingInfoRequest");
        v33[0] = CFSTR("kLeaDeviceAddress");
        v33[1] = CFSTR("kLeaDeviceName");
        v34[0] = v16;
        v34[1] = v15;
        v33[2] = CFSTR("kLeaDeviceEdiv");
        v33[3] = CFSTR("kLeaDeviceRand");
        v34[2] = v28;
        v34[3] = v27;
        v33[4] = CFSTR("kLeaDeviceLtk");
        v33[5] = CFSTR("kLeaDeviceIrk");
        v34[4] = v26;
        v34[5] = v14;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 6));
        v36 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
        objc_msgSend(v22, "sendMessage:", v24);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }

}

- (void)respondToLeaStoreBondingInfo:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending 'LEA store bonding info response' message for device \"%@\", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[Endpoint pipes](self, "pipes"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v22[1] = v7;
        v23 = CFSTR("LeaStoreBondingInfoResponse");
        v21[0] = CFSTR("kLeaStoreBondingInfoResult");
        v21[1] = CFSTR("kLeaDeviceAddress");
        v22[0] = v6;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v24 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v13, "sendMessage:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)handleConnectClassicDeviceCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kQuickDisconnectEnabled")));

  v7 = qword_1000C9178;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'connect classic device' message for device \"%@\", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v10[0] = CFSTR("kDeviceAddress");
    v10[1] = CFSTR("kQuickDisconnectEnabled");
    v11[0] = v5;
    v11[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("ConnectClassicDevice"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B014();
  }

}

- (void)handleDisconnectClassicDeviceCommand:(id)a3 message:(id)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v5 = qword_1000C9178;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received 'disconnect classic device' message for device \"%@\", buf, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v8 = CFSTR("kDeviceAddress");
    v9 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    objc_msgSend(v6, "sendMsg:args:", CFSTR("DisconnectClassicDevice"), v7);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B040();
  }

}

- (void)handleClassicDeviceUnexpectedDisconnectionCommand:(id)a3 message:(id)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v5 = qword_1000C9178;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received 'classic device unexpected disconnection' message for device \"%@\", buf, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v8 = CFSTR("kDeviceAddress");
    v9 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    objc_msgSend(v6, "sendMsg:args:", CFSTR("ClassicDeviceUnexpectedDisconnection"), v7);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B06C();
  }

}

- (void)handleVersionInfoRequestCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[2];
  _QWORD v12[2];

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kEasyPairingVersion")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCloudAccount")));

  v7 = qword_1000C9178;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'version info request' message", v10, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v11[0] = CFSTR("kEasyPairingVersion");
    v11[1] = CFSTR("kCloudAccount");
    v12[0] = v5;
    v12[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("VersionInfoRequest"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B098();
  }

}

- (void)handleVersionInfoResponseCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[3];
  _QWORD v14[3];

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kEasyPairingVersion")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCloudAccount")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kEasyPairingStatus")));

  v9 = qword_1000C9178;
  if (v6 && v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received 'version info response' message", v12, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v13[0] = CFSTR("kEasyPairingVersion");
    v13[1] = CFSTR("kCloudAccount");
    v14[0] = v6;
    v14[1] = v7;
    v13[2] = CFSTR("kEasyPairingStatus");
    v14[2] = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
    objc_msgSend(v10, "sendMsg:args:", CFSTR("VersionInfoResponse"), v11);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B0C4();
  }

}

- (void)handleClassicPairStateRequestCommand:(id)a3 message:(id)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v5 = qword_1000C9178;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received 'classic pair state request' message for device \"%@\", buf, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v8 = CFSTR("kDeviceAddress");
    v9 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    objc_msgSend(v6, "sendMsg:args:", CFSTR("ClassicPairStateRequest"), v7);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B0F0();
  }

}

- (void)handleClassicPairStateResponseCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePairState")));

  v7 = qword_1000C9178;
  if (v5 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'classic pair state response' message for device \"%@\", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v10[0] = CFSTR("kDeviceAddress");
    v10[1] = CFSTR("kDevicePairState");
    v11[0] = v5;
    v11[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("ClassicPairStateResponse"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B11C();
  }

}

- (void)handleStoreClassicLinkKeyRequestCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  uint8_t buf[4];
  void *v14;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceLinkKey")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceName")));

  v8 = qword_1000C9178;
  if (v5 && v6 && v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received 'store classic link key request' message for device \"%@\", buf, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v11[0] = CFSTR("kDeviceAddress");
    v11[1] = CFSTR("kDeviceName");
    v12[0] = v5;
    v12[1] = v7;
    v11[2] = CFSTR("kDeviceLinkKey");
    v12[2] = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    objc_msgSend(v9, "sendMsg:args:", CFSTR("StoreClassicLinkKeyRequest"), v10);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B148();
  }

}

- (void)handleStoreClassicLinkKeyRequestExtendedCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceLinkKey")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceName")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceServiceMask")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kClassOfDeviceMask")));

  v10 = qword_1000C9178;
  if (v5 && v6 && v7 && v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received 'store classic link key request extended' message for device \"%@\", buf, 0xCu);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v13[0] = CFSTR("kDeviceAddress");
    v13[1] = CFSTR("kDeviceName");
    v14[0] = v5;
    v14[1] = v7;
    v13[2] = CFSTR("kDeviceLinkKey");
    v13[3] = CFSTR("kDeviceServiceMask");
    v14[2] = v6;
    v14[3] = v8;
    v13[4] = CFSTR("kClassOfDeviceMask");
    v14[4] = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
    objc_msgSend(v11, "sendMsg:args:", CFSTR("StoreClassicLinkKeyRequestExtended"), v12);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B148();
  }

}

- (void)handleStoreClassicLinkKeyResponseCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kStoreClassicLinkKeyResult")));

  v7 = qword_1000C9178;
  if (v5 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'store classic link key response' message for device \"%@\", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v10[0] = CFSTR("kDeviceAddress");
    v10[1] = CFSTR("kStoreClassicLinkKeyResult");
    v11[0] = v5;
    v11[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("StoreClassicLinkKeyResponse"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B174();
  }

}

- (void)handleStoreClassicDeviceSettingsCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void **v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceName")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kClassicDeviceMicMode")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kClassicDeviceInEarEnable")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kClassicDeviceDoubleTapMode")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kClassicDeviceSettings")));

  v11 = qword_1000C9178;
  if (v5 && v7 && v8 && v9 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v5;
      v41 = 2112;
      v42 = v6;
      v43 = 2112;
      v44 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received 'store classic device settings' message for device \"%@\", devName = \"%@\", doubleTap = %@", buf, 0x20u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    if (v10)
    {
      v27 = CFSTR("kDeviceAddress");
      v28 = CFSTR("kClassicDeviceMicMode");
      v29 = CFSTR("kClassicDeviceInEarEnable");
      v33 = v5;
      v34 = v7;
      v30 = CFSTR("kClassicDeviceDoubleTapMode");
      v31 = CFSTR("kClassicDeviceSettings");
      v35 = v8;
      v36 = v9;
      v32 = CFSTR("kDeviceName");
      v37 = v10;
      v38 = v6;
      v13 = &v33;
      v14 = &v27;
      v15 = 6;
    }
    else
    {
      v17 = CFSTR("kDeviceAddress");
      v18 = CFSTR("kClassicDeviceMicMode");
      v19 = CFSTR("kClassicDeviceInEarEnable");
      v22 = v5;
      v23 = v7;
      v24 = v8;
      v25 = v9;
      v20 = CFSTR("kClassicDeviceDoubleTapMode");
      v21 = CFSTR("kDeviceName");
      v26 = v6;
      v13 = &v22;
      v14 = &v17;
      v15 = 5;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, v15, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
                      v30,
                      v31,
                      v32,
                      v33,
                      v34,
                      v35,
                      v36,
                      v37,
                      v38));
    objc_msgSend(v12, "sendMsg:args:", CFSTR("StoreClassicDeviceSettings"), v16);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B1A0();
  }

}

- (void)handleNotifyPrimaryBudSideCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPrimaryBudSide")));

  v7 = qword_1000C9178;
  if (v5 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'notifiy primary bud side' message for device \"%@\", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v10[0] = CFSTR("kDeviceAddress");
    v10[1] = CFSTR("kPrimaryBudSide");
    v11[0] = v5;
    v11[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("NotifyPrimaryBudSide"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B1CC();
  }

}

- (void)handleLeaEasyPairRequestCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  uint8_t buf[4];
  void *v14;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceAddress")));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceIdentifier")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceTags")));
    v8 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received 'LEA easy pair request' message for device \"%@\", buf, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v11[0] = CFSTR("kLeaDeviceAddress");
    v11[1] = CFSTR("kLeaDeviceIdentifier");
    v12[0] = v5;
    v12[1] = v6;
    v11[2] = CFSTR("kLeaDeviceTags");
    v12[2] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    objc_msgSend(v9, "sendMsg:args:", CFSTR("LeaEasyPairRequest"), v10);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B1F8();
  }

}

- (void)handleLeaEasyPairResponseCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDevicePairState")));

  v7 = qword_1000C9178;
  if (v5 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'LEA easypair response' message for device \"%@\", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v10[0] = CFSTR("kLeaDeviceAddress");
    v10[1] = CFSTR("kLeaDevicePairState");
    v11[0] = v5;
    v11[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("LeaEasyPairResponse"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B224();
  }

}

- (void)handleLeaStoreBondingInfoRequestCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[6];
  uint8_t buf[4];
  void *v17;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceEdiv")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceRand")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceLtk")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceIrk")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceName")));

  v11 = qword_1000C9178;
  if (v5 && v6 && v7 && v8 && v9 && v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received 'LEA store bonding info request' message for device \"%@\", buf, 0xCu);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v14[0] = CFSTR("kLeaDeviceAddress");
    v14[1] = CFSTR("kLeaDeviceName");
    v15[0] = v5;
    v15[1] = v10;
    v14[2] = CFSTR("kLeaDeviceEdiv");
    v14[3] = CFSTR("kLeaDeviceRand");
    v15[2] = v6;
    v15[3] = v7;
    v14[4] = CFSTR("kLeaDeviceLtk");
    v14[5] = CFSTR("kLeaDeviceIrk");
    v15[4] = v8;
    v15[5] = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 6));
    objc_msgSend(v12, "sendMsg:args:", CFSTR("LeaStoreBondingInfoRequest"), v13);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B250();
  }

}

- (void)handleLeaStoreBondingInfoResponseCommand:(id)a3 message:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaDeviceAddress")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLeaStoreBondingInfoResult")));

  v7 = qword_1000C9178;
  if (v5 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'LEA store bonding info response' message for device \"%@\", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
    v10[0] = CFSTR("kLeaDeviceAddress");
    v10[1] = CFSTR("kLeaStoreBondingInfoResult");
    v11[0] = v5;
    v11[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    objc_msgSend(v8, "sendMsg:args:", CFSTR("LeaStoreBondingInfoResponse"), v9);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006B27C();
  }

}

@end
