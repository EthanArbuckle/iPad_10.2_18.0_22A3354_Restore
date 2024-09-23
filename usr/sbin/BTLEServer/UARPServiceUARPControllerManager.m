@implementation UARPServiceUARPControllerManager

+ (id)instance
{
  if (qword_1000C9150 != -1)
    dispatch_once(&qword_1000C9150, &stru_1000AE1E0);
  return (id)qword_1000C9148;
}

- (UARPServiceUARPControllerManager)init
{
  UARPServiceUARPControllerManager *v2;
  uint64_t v3;
  NSMutableDictionary *uarpAccessoryUARPServiceMap;
  UARPController *v5;
  UARPController *uarpController;
  uint64_t v7;
  NSString *uarpLogPath;
  NSMutableDictionary *v9;
  NSMutableDictionary *uarpAACPTransportAvailability;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UARPServiceUARPControllerManager;
  v2 = -[UARPServiceUARPControllerManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    uarpAccessoryUARPServiceMap = v2->uarpAccessoryUARPServiceMap;
    v2->uarpAccessoryUARPServiceMap = (NSMutableDictionary *)v3;

    v5 = objc_opt_new(UARPController);
    uarpController = v2->_uarpController;
    v2->_uarpController = v5;

    -[UARPController setDelegate:](v2->_uarpController, "setDelegate:", v2);
    -[UARPController startPersonalizationHelperService:entitlement:](v2->_uarpController, "startPersonalizationHelperService:entitlement:", CFSTR("com.apple.uarppersonalization.btleserver"), CFSTR("com.apple.uarppersonalization.btleserver"));
    v7 = objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager _getUARPLogPath](v2, "_getUARPLogPath"));
    uarpLogPath = v2->_uarpLogPath;
    v2->_uarpLogPath = (NSString *)v7;

    -[UARPServiceUARPControllerManager _createUARPLogPath](v2, "_createUARPLogPath");
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uarpAACPTransportAvailability = v2->_uarpAACPTransportAvailability;
    v2->_uarpAACPTransportAvailability = v9;

    v2->_tapToRadarIsOngoing = 0;
  }
  return v2;
}

- (BOOL)registerUARPService:(id)a3 withUARPAccessory:(id)a4 withUARPAssetID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  NSMutableDictionary *uarpAccessoryUARPServiceMap;
  void *v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
  v12 = objc_msgSend(v11, "addAccessory:assetID:", v9, v10);

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070BE8();
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
  v14 = objc_msgSend(v13, "accessoryReachable:", v9);

  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070B88();
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  uarpAccessoryUARPServiceMap = self->uarpAccessoryUARPServiceMap;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
  -[NSMutableDictionary setObject:forKey:](uarpAccessoryUARPServiceMap, "setObject:forKey:", v8, v16);

  v17 = 1;
LABEL_9:

  return v17;
}

- (BOOL)unregisterUARPService:(id)a3 withUARPAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  NSMutableDictionary *uarpAccessoryUARPServiceMap;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    v9 = objc_msgSend(v8, "accessoryUnreachable:", v7);

    if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070CF4();
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    v11 = objc_msgSend(v10, "removeAccessory:", v7);

    if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070C94();
    uarpAccessoryUARPServiceMap = self->uarpAccessoryUARPServiceMap;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    -[NSMutableDictionary removeObjectForKey:](uarpAccessoryUARPServiceMap, "removeObjectForKey:", v13);

  }
  else
  {
    v14 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070C64(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  return 1;
}

- (id)uarpServiceForAccessoryUuid:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->uarpAccessoryUARPServiceMap, "objectForKey:", a3);
}

- (id)_getUARPLogPath
{
  NSArray *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_alloc((Class)NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@/Logs/Bluetooth/UARPLogs"), v5);

  return v6;
}

- (BOOL)_createUARPLogPath
{
  void *v3;
  NSString *uarpLogPath;
  id v5;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  uarpLogPath = self->_uarpLogPath;
  v7 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", uarpLogPath, 1, 0, &v7);
  v5 = v7;

  if (v5 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100070D54();

  return v5 == 0;
}

- (void)addUARPTransportDict:(id)a3 UARPAACPSupported:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100070DB4(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpAACPTransportAvailability](self, "uarpAACPTransportAvailability"));
  objc_msgSend(v9, "setObject:forKey:", v7, v6);

}

- (BOOL)getAndRemoveFromUARPTransportDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uarpAACPTransportAvailability, "objectForKey:", v4));

  v6 = (void *)qword_1000C9178;
  v7 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      sub_100070EC4(v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpAACPTransportAvailability](self, "uarpAACPTransportAvailability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
    v10 = v9 != 0;

    -[NSMutableDictionary removeObjectForKey:](self->_uarpAACPTransportAvailability, "removeObjectForKey:", v4);
  }
  else
  {
    if (v7)
      sub_100070E3C(v6, v4);
    v10 = 0;
  }

  return v10;
}

- (BOOL)relayAACPUARP:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100070F4C(v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v7));
  objc_msgSend(v10, "recvDataOverAACP:", v8);

  return 1;
}

- (void)setOpportunisticConnection:(BOOL)a3 forAccessoryUUID:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;

  v4 = a3;
  v6 = a4;
  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setOpportunisticConnection - isOpportunistic %u, uuid %@", (uint8_t *)v10, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v6));
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "decOpportunisticConnection");
  else
    objc_msgSend(v8, "incOpportunisticConnection");

}

- (BOOL)startTapToRadar
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  void *v12;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpLogPath](self, "uarpLogPath"));
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "startTapToRadar - URL %@", (uint8_t *)&v11, 0xCu);

  }
  self->_tapToRadarIsOngoing = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpLogPath](self, "uarpLogPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 1));
  v9 = objc_msgSend(v6, "startTapToRadar:", v8);

  return v9;
}

- (void)stopTapToRadar
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopTapToRadar", v5, 2u);
  }
  self->_tapToRadarIsOngoing = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
  objc_msgSend(v4, "stopTapToRadar");

}

- (BOOL)tapToRadarIsOngoing
{
  return self->_tapToRadarIsOngoing;
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100070FFC((uint64_t)v7, v9, v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000532B8;
  block[3] = &unk_1000AD718;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2112;
    v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "assetAvailablityUpdateForAccessoryID - accessory:%@ assetID:%@", buf, 0x16u);
  }
  if (objc_msgSend(v7, "updateAvailabilityStatus") == (id)4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    v10 = objc_msgSend(v9, "downloadAvailableFirmwareUpdate:assetID:withUserIntent:", v6, v7, 1);

    if ((v10 & 1) == 0)
    {
      v11 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071090(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else if (objc_msgSend(v7, "updateAvailabilityStatus") == (id)3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    v32 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v21 = objc_msgSend(v19, "stageFirmwareUpdateOnAccessoryList:withUserIntent:", v20, 1);

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v22));
      objc_msgSend(v23, "incOpportunisticConnection");

    }
    else
    {
      v24 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_1000710C0(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;

  v9 = a3;
  v10 = a4;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138413058;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2048;
    v17 = a5;
    v18 = 2048;
    v19 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "firmwareStagingProgress - accessory:%@ assetID:%@ %lu/%lu", (uint8_t *)&v12, 0x2Au);
  }

}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2080;
    v20 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "firmwareStagingComplete - accessory:%@ assetID:%@ status:%s", buf, 0x20u);

  }
  if (!a5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    v14 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v12, "applyStagedFirmwareOnAccessoryList:withUserIntent:", v13, 1);

  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;

  v6 = a3;
  v7 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v11 = 138412546;
    v12 = v6;
    v13 = 2080;
    v14 = UARPFirmwareApplicationStatusToString(a4);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stagedFirmwareApplicationComplete - accessory:%@ status:%s", (uint8_t *)&v11, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v9));
  objc_msgSend(v10, "decOpportunisticConnection");

}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;

  v8 = a3;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = a4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tag"));

    v16 = 138413058;
    v17 = v12;
    v18 = 1024;
    v19 = objc_msgSend(v13, "tag");
    v20 = 2080;
    v21 = UARPFirmwareStagingCompletionStatusToString(a5);
    v22 = 2048;
    v23 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Accessory %@ returning asset tag 0x%08x status %s (%lu)", (uint8_t *)&v16, 0x26u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v14));
  objc_msgSend(v15, "assetSolicitationComplete");

}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "queryCompleteForAccessory: HW Fusing type updated for accessory %@", (uint8_t *)&v17, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v12));
  v14 = objc_opt_respondsToSelector(v13, "queryCompleteForAccessory:hwFusingType:error:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:](self, "uarpServiceForAccessoryUuid:", v15));
    objc_msgSend(v16, "queryCompleteForAccessory:hwFusingType:error:", v8, v9, v10);

  }
}

- (UARPController)uarpController
{
  return self->_uarpController;
}

- (NSString)uarpLogPath
{
  return self->_uarpLogPath;
}

- (NSMutableDictionary)uarpAACPTransportAvailability
{
  return self->_uarpAACPTransportAvailability;
}

- (void)setUarpAACPTransportAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_uarpAACPTransportAvailability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uarpAACPTransportAvailability, 0);
  objc_storeStrong((id *)&self->_uarpLogPath, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
  objc_storeStrong((id *)&self->uarpAccessoryUARPServiceMap, 0);
}

@end
