@implementation CLDurianFirmwareUpdater

- (CLDurianFirmwareUpdater)initWithDelegate:(id)a3 peripheral:(id)a4
{
  CLDurianFirmwareUpdater *v6;
  CLDurianFirmwareUpdater *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLDurianFirmwareUpdater;
  v6 = -[CLDurianFirmwareUpdater init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLDurianFirmwareUpdater setPeripheral:](v6, "setPeripheral:", a4);
    -[CBPeripheral setDelegate:](-[CLDurianFirmwareUpdater peripheral](v7, "peripheral"), "setDelegate:", v7);
    -[CLDurianFirmwareUpdater setDelegate:](v7, "setDelegate:", a3);
    v7->_personalizationInformation = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->_assetPacketizerQueue = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianFirmwareUpdater;
  -[CLDurianFirmwareUpdater dealloc](&v3, "dealloc");
}

- (void)getPersonalizationInformation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - getting personalization information\"}", (uint8_t *)v4, 0x12u);
  }
  -[CBPeripheral discoverServices:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "discoverServices:", 0);
}

- (void)startFirmwareUpdate:(id)a3
{
  -[CLDurianFirmwareUpdater _sendLocalImageAssets:](self, "_sendLocalImageAssets:", a3);
}

- (void)abortFirmwareUpdate
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289282;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    v7 = 1026;
    v8 = -[CLDurianFirmwareUpdater hasPreparedForFirmwareDownload](self, "hasPreparedForFirmwareDownload");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - aborting firmware transfer\", \"has prepared firmware download\":%{public}d}", (uint8_t *)v4, 0x18u);
  }
  -[CLDurianFirmwareUpdater _cleanup](self, "_cleanup");
  if (-[CLDurianFirmwareUpdater hasPreparedForFirmwareDownload](self, "hasPreparedForFirmwareDownload"))
    -[CLDurianFirmwareUpdater _sendCommandToDevice:](self, "_sendCommandToDevice:", 2);
  else
    -[CLDurianFirmwareUpdaterDelegate didAbortFirmwareUpdate](-[CLDurianFirmwareUpdater delegate](self, "delegate"), "didAbortFirmwareUpdate");
}

- (void)_sendFirmwareAsset:(int)a3 assetData:(id)a4
{
  uint64_t v4;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;

  v4 = *(_QWORD *)&a3;
  -[NSMutableArray addObject:](-[CLDurianFirmwareUpdater assetPacketizerQueue](self, "assetPacketizerQueue"), "addObject:", -[CLDurianFirmwareAssetPacketizer initWithAssetType:assetData:maxPacketSize:]([CLDurianFirmwareAssetPacketizer alloc], "initWithAssetType:assetData:maxPacketSize:", *(_QWORD *)&a3, a4, -[CBPeripheral maximumWriteValueLengthForType:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "maximumWriteValueLengthForType:", 1)));
  if (-[CLDurianFirmwareUpdater currentAssetPacketizer](self, "currentAssetPacketizer"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289538;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = -[CLDurianFirmwareUpdater _firmwareAssetTypeToString:](self, "_firmwareAssetTypeToString:", v4);
      v12 = 2082;
      v13 = -[CLDurianFirmwareUpdater _firmwareAssetTypeToString:](self, "_firmwareAssetTypeToString:", -[CLDurianFirmwareAssetPacketizer assetType](-[CLDurianFirmwareUpdater currentAssetPacketizer](self, "currentAssetPacketizer"), "assetType"));
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - queueing transfer request as transfer is in progress\", \"requested asset\":%{public, location:escape_only}s, \"current asset\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x26u);
    }
  }
  else
  {
    -[CLDurianFirmwareUpdater _sendNextAsset](self, "_sendNextAsset");
  }
}

- (void)_prepareForFirmwareDownload
{
  -[CBPeripheral setNotifyValue:forCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "setNotifyValue:forCharacteristic:", 1, -[CLDurianFirmwareUpdater firwmareDownloadStatusCharacteristic](self, "firwmareDownloadStatusCharacteristic"));
  -[CBPeripheral setNotifyValue:forCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "setNotifyValue:forCharacteristic:", 1, -[CLDurianFirmwareUpdater firmwareDownloadAssetsReadyCharacteristic](self, "firmwareDownloadAssetsReadyCharacteristic"));
  -[CLDurianFirmwareUpdater _sendCommandToDevice:](self, "_sendCommandToDevice:", 0);
}

- (void)_readPersonalizationInformation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - reading personalization information\"}", (uint8_t *)v4, 0x12u);
  }
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationChipIDCharacteristic](self, "personalizationChipIDCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationBoardIDCharacteristic](self, "personalizationBoardIDCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationECIDCharacteristic](self, "personalizationECIDCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationSecDomainCharacteristic](self, "personalizationSecDomainCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationSecModeCharacteristic](self, "personalizationSecModeCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationProdModeCharacteristic](self, "personalizationProdModeCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationBootNonceHashCharacteristic](self, "personalizationBootNonceHashCharacteristic"));
  -[CBPeripheral readValueForCharacteristic:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "readValueForCharacteristic:", -[CLDurianFirmwareUpdater personalizationBVERCharacteristic](self, "personalizationBVERCharacteristic"));
}

- (void)_handlePersonalizationDataFromDevice:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = objc_msgSend(a3, "UUID");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - obtained personalization data\", \"personalizationCharacteristic\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
  }
  -[NSMutableDictionary setObject:forKey:](-[CLDurianFirmwareUpdater personalizationInformation](self, "personalizationInformation"), "setObject:forKey:", objc_msgSend(a3, "value"), objc_msgSend(objc_msgSend(a3, "UUID"), "UUIDString"));
  if (-[NSMutableDictionary count](-[CLDurianFirmwareUpdater personalizationInformation](self, "personalizationInformation"), "count") == (id)8)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - obtained complete personalization information!\"}", (uint8_t *)&v7, 0x12u);
    }
    -[CLDurianFirmwareUpdaterDelegate didGetPersonalizationInformation:](-[CLDurianFirmwareUpdater delegate](self, "delegate"), "didGetPersonalizationInformation:", -[CLDurianFirmwareUpdater personalizationInformation](self, "personalizationInformation"));
  }
}

- (void)_handleDownloadStatusFromDevice:(id)a3
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  CLDurianFirmwareUpdaterDelegate *v8;
  unsigned int v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;

  v9 = 0;
  objc_msgSend(a3, "getBytes:length:", &v9, 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianFirmwareUpdater _firmwareDownloadStatusToString:](self, "_firmwareDownloadStatusToString:", v9);
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - received download status from device\", \"download status\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  switch(v9)
  {
    case 0u:
      -[CLDurianFirmwareUpdater _sendNextAsset](self, "_sendNextAsset");
      break;
    case 1u:
      -[CLDurianFirmwareUpdater _readPersonalizationInformation](self, "_readPersonalizationInformation");
      break;
    case 2u:
      goto LABEL_16;
    case 3u:
      -[CLDurianFirmwareUpdater _cleanup](self, "_cleanup");
LABEL_16:
      v8 = -[CLDurianFirmwareUpdater delegate](self, "delegate");
      -[CLDurianFirmwareUpdaterDelegate didCompleteFirmwareUpdate:](v8, "didCompleteFirmwareUpdate:", -[CLDurianFirmwareUpdater _createErrorForDownloadStatus:](self, "_createErrorForDownloadStatus:", v9));
      break;
    case 4u:
      -[CLDurianFirmwareUpdater _cleanup](self, "_cleanup");
      -[CLDurianFirmwareUpdaterDelegate didAbortFirmwareUpdate](-[CLDurianFirmwareUpdater delegate](self, "delegate"), "didAbortFirmwareUpdate");
      break;
    default:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289283;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        v14 = 2049;
        v15 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian FWUpdate - received invalid status command\", \"status\":%{private}lu}", buf, 0x1Cu);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
      }
      v7 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        *(_DWORD *)buf = 68289283;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        v14 = 2049;
        v15 = (const char *)v9;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian FWUpdate - received invalid status command", "{\"msg%{public}.0s\":\"#durian FWUpdate - received invalid status command\", \"status\":%{private}lu}", buf, 0x1Cu);
      }
      break;
  }
}

- (void)_sendCommandToDevice:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  v3 = *(_QWORD *)&a3;
  v6 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2082;
    v12 = -[CLDurianFirmwareUpdater _firmwareDownloadCommandToString:](self, "_firmwareDownloadCommandToString:", v3);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - sending command to device\", \"command\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  -[CBPeripheral writeValue:forCharacteristic:type:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "writeValue:forCharacteristic:type:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 1), -[CLDurianFirmwareUpdater firmwareDownloadCommandCharacteristic](self, "firmwareDownloadCommandCharacteristic"), 0);
}

- (void)_sendNextAsset
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;

  if (-[NSMutableArray count](-[CLDurianFirmwareUpdater assetPacketizerQueue](self, "assetPacketizerQueue"), "count"))
  {
    -[CLDurianFirmwareUpdater setCurrentAssetPacketizer:](self, "setCurrentAssetPacketizer:", -[NSMutableArray objectAtIndex:](-[CLDurianFirmwareUpdater assetPacketizerQueue](self, "assetPacketizerQueue"), "objectAtIndex:", 0));
    -[NSMutableArray removeObjectAtIndex:](-[CLDurianFirmwareUpdater assetPacketizerQueue](self, "assetPacketizerQueue"), "removeObjectAtIndex:", 0);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289282;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = -[CLDurianFirmwareUpdater _firmwareAssetTypeToString:](self, "_firmwareAssetTypeToString:", -[CLDurianFirmwareAssetPacketizer assetType](-[CLDurianFirmwareUpdater currentAssetPacketizer](self, "currentAssetPacketizer"), "assetType"));
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - sending asset\", \"assetType\":%{public, location:escape_only}s}", (uint8_t *)&v5, 0x1Cu);
    }
    -[CLDurianFirmwareUpdater _sendNextPacketToDevice:](self, "_sendNextPacketToDevice:", -[CLDurianFirmwareUpdater currentAssetPacketizer](self, "currentAssetPacketizer"));
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - completed sending all assets! Committing\"}", (uint8_t *)&v5, 0x12u);
    }
    -[CLDurianFirmwareUpdater _sendCommandToDevice:](self, "_sendCommandToDevice:", 1);
  }
}

- (void)_sendNextPacketToDevice:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v4 = objc_msgSend(a3, "getNextPacket");
  if (v4)
  {
    -[CBPeripheral writeValue:forCharacteristic:type:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral"), "writeValue:forCharacteristic:type:", v4, -[CLDurianFirmwareUpdater firmwareDownloadAssetsCharacteristic](self, "firmwareDownloadAssetsCharacteristic"), 1);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - finished sending all packets\"}", (uint8_t *)v6, 0x12u);
    }
  }
}

- (void)_cleanup
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - cleaning up firmware transfer!\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLDurianFirmwareUpdater setCurrentAssetPacketizer:](self, "setCurrentAssetPacketizer:", 0);
  -[CLDurianFirmwareUpdater setAssetPacketizerQueue:](self, "setAssetPacketizerQueue:", 0);
}

- (id)_createErrorForDownloadStatus:(int)a3
{
  if (a3 == 2)
    return 0;
  else
    return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FirmwareUpdate"), 0, 0);
}

- (void)_sendLocalImageAssets:(id)a3
{
  _QWORD v5[5];
  _UNKNOWN **v6;
  NSURL *v7;
  _UNKNOWN **v8;
  NSURL *v9;
  _UNKNOWN **v10;
  NSURL *v11;
  _UNKNOWN **v12;
  NSURL *v13;
  _UNKNOWN **v14;
  NSURL *v15;
  _UNKNOWN **v16;
  NSURL *v17;
  _UNKNOWN **v18;
  NSURL *v19;
  _UNKNOWN **v20;
  NSURL *v21;
  _UNKNOWN **v22;
  NSURL *v23;
  _UNKNOWN **v24;
  NSURL *v25;
  _QWORD v26[10];

  v24 = &off_10221DDA8;
  v25 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("bldr.bin"), 0, a3);
  v26[0] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v22 = &off_10221DDC0;
  v23 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("blsg.bin"), 0, a3);
  v26[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v20 = &off_10221DDD8;
  v21 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("sftd.bin"), 0, a3);
  v26[2] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v18 = &off_10221DDF0;
  v19 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("sdsg.bin"), 0, a3);
  v26[3] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v16 = &off_10221DE08;
  v17 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("blap.bin"), 0, a3);
  v26[4] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v14 = &off_10221DE20;
  v15 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("basg.bin"), 0, a3);
  v26[5] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = &off_10221DE38;
  v13 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("man.bin"), 0, a3);
  v26[6] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v10 = &off_10221DE50;
  v11 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("diag.bin"), 0, a3);
  v26[7] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = &off_10221DE68;
  v9 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("dgsg.bin"), 0, a3);
  v26[8] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v6 = &off_10221DE80;
  v7 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("r1md.bin"), 0, a3);
  v26[9] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1014F1154;
  v5[3] = &unk_1021BC2D0;
  v5[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 10), "enumerateObjectsUsingBlock:", v5);
}

- (const)_firmwareDownloadCommandToString:(int)a3
{
  if (a3 > 2)
    return "UNKNOWN COMMAND";
  else
    return (&off_1021BC310)[a3];
}

- (const)_firmwareDownloadStatusToString:(int)a3
{
  if (a3 > 4)
    return "UNKNOWN STATUS";
  else
    return (&off_1021BC328)[a3];
}

- (const)_firmwareAssetTypeToString:(int)a3
{
  if ((a3 - 1) > 9)
    return "UNKNOWN ASSET TYPE";
  else
    return (&off_1021BC350)[a3 - 1];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "services");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    *(_QWORD *)&v7 = 68289283;
    v13 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
        v12 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = 0;
          v20 = 2082;
          v21 = "";
          v22 = 2113;
          v23 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - didDiscoverServices\", \"service\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        -[CBPeripheral discoverCharacteristics:forService:](-[CLDurianFirmwareUpdater peripheral](self, "peripheral", v13), "discoverCharacteristics:forService:", 0, v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v8);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "characteristics", a3, 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
        if (-[CLDurianFirmwareUpdater firmwareDownloadAssetsCharacteristic](self, "firmwareDownloadAssetsCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6001-7D1C-4951-86AA-8D9728F8D66C"))))
        {
          if (-[CLDurianFirmwareUpdater firwmareDownloadStatusCharacteristic](self, "firwmareDownloadStatusCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6002-7D1C-4951-86AA-8D9728F8D66C"))))
          {
            if (-[CLDurianFirmwareUpdater firmwareDownloadCommandCharacteristic](self, "firmwareDownloadCommandCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6003-7D1C-4951-86AA-8D9728F8D66C"))))
            {
              if (-[CLDurianFirmwareUpdater firmwareDownloadAssetsReadyCharacteristic](self, "firmwareDownloadAssetsReadyCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6004-7D1C-4951-86AA-8D9728F8D66C"))))
              {
                if (-[CLDurianFirmwareUpdater personalizationChipIDCharacteristic](self, "personalizationChipIDCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6101-7D1C-4951-86AA-8D9728F8D66C"))))
                {
                  if (-[CLDurianFirmwareUpdater personalizationBoardIDCharacteristic](self, "personalizationBoardIDCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6102-7D1C-4951-86AA-8D9728F8D66C"))))
                  {
                    if (-[CLDurianFirmwareUpdater personalizationECIDCharacteristic](self, "personalizationECIDCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6103-7D1C-4951-86AA-8D9728F8D66C"))))
                    {
                      if (-[CLDurianFirmwareUpdater personalizationSecDomainCharacteristic](self, "personalizationSecDomainCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6104-7D1C-4951-86AA-8D9728F8D66C"))))
                      {
                        if (-[CLDurianFirmwareUpdater personalizationSecModeCharacteristic](self, "personalizationSecModeCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6105-7D1C-4951-86AA-8D9728F8D66C"))))
                        {
                          if (-[CLDurianFirmwareUpdater personalizationProdModeCharacteristic](self, "personalizationProdModeCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6106-7D1C-4951-86AA-8D9728F8D66C"))))
                          {
                            if (-[CLDurianFirmwareUpdater personalizationBootNonceHashCharacteristic](self, "personalizationBootNonceHashCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6107-7D1C-4951-86AA-8D9728F8D66C"))))
                            {
                              if (!-[CLDurianFirmwareUpdater personalizationBVERCharacteristic](self, "personalizationBVERCharacteristic")&& objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("7DFC6108-7D1C-4951-86AA-8D9728F8D66C"))))
                              {
                                -[CLDurianFirmwareUpdater setPersonalizationBVERCharacteristic:](self, "setPersonalizationBVERCharacteristic:", v11);
                              }
                            }
                            else
                            {
                              -[CLDurianFirmwareUpdater setPersonalizationBootNonceHashCharacteristic:](self, "setPersonalizationBootNonceHashCharacteristic:", v11);
                            }
                          }
                          else
                          {
                            -[CLDurianFirmwareUpdater setPersonalizationProdModeCharacteristic:](self, "setPersonalizationProdModeCharacteristic:", v11);
                          }
                        }
                        else
                        {
                          -[CLDurianFirmwareUpdater setPersonalizationSecModeCharacteristic:](self, "setPersonalizationSecModeCharacteristic:", v11);
                        }
                      }
                      else
                      {
                        -[CLDurianFirmwareUpdater setPersonalizationSecDomainCharacteristic:](self, "setPersonalizationSecDomainCharacteristic:", v11);
                      }
                    }
                    else
                    {
                      -[CLDurianFirmwareUpdater setPersonalizationECIDCharacteristic:](self, "setPersonalizationECIDCharacteristic:", v11);
                    }
                  }
                  else
                  {
                    -[CLDurianFirmwareUpdater setPersonalizationBoardIDCharacteristic:](self, "setPersonalizationBoardIDCharacteristic:", v11);
                  }
                }
                else
                {
                  -[CLDurianFirmwareUpdater setPersonalizationChipIDCharacteristic:](self, "setPersonalizationChipIDCharacteristic:", v11);
                }
              }
              else
              {
                -[CLDurianFirmwareUpdater setFirmwareDownloadAssetsReadyCharacteristic:](self, "setFirmwareDownloadAssetsReadyCharacteristic:", v11);
              }
            }
            else
            {
              -[CLDurianFirmwareUpdater setFirmwareDownloadCommandCharacteristic:](self, "setFirmwareDownloadCommandCharacteristic:", v11);
            }
          }
          else
          {
            -[CLDurianFirmwareUpdater setFirwmareDownloadStatusCharacteristic:](self, "setFirwmareDownloadStatusCharacteristic:", v11);
          }
        }
        else
        {
          -[CLDurianFirmwareUpdater setFirmwareDownloadAssetsCharacteristic:](self, "setFirmwareDownloadAssetsCharacteristic:", v11);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  if (-[CLDurianFirmwareUpdater firwmareDownloadStatusCharacteristic](self, "firwmareDownloadStatusCharacteristic")
    && -[CLDurianFirmwareUpdater firmwareDownloadCommandCharacteristic](self, "firmwareDownloadCommandCharacteristic")
    && -[CLDurianFirmwareUpdater firmwareDownloadAssetsReadyCharacteristic](self, "firmwareDownloadAssetsReadyCharacteristic")&& !-[CLDurianFirmwareUpdater hasPreparedForFirmwareDownload](self, "hasPreparedForFirmwareDownload"))
  {
    -[CLDurianFirmwareUpdater _prepareForFirmwareDownload](self, "_prepareForFirmwareDownload");
    -[CLDurianFirmwareUpdater setHasPreparedForFirmwareDownload:](self, "setHasPreparedForFirmwareDownload:", 1);
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  if (-[CLDurianFirmwareUpdater firwmareDownloadStatusCharacteristic](self, "firwmareDownloadStatusCharacteristic") == a4)
  {
    -[CLDurianFirmwareUpdater _handleDownloadStatusFromDevice:](self, "_handleDownloadStatusFromDevice:", objc_msgSend(a4, "value"));
  }
  else if (-[CLDurianFirmwareUpdater firmwareDownloadAssetsReadyCharacteristic](self, "firmwareDownloadAssetsReadyCharacteristic") == a4)
  {
    -[CLDurianFirmwareUpdater _sendNextPacketToDevice:](self, "_sendNextPacketToDevice:", -[CLDurianFirmwareUpdater currentAssetPacketizer](self, "currentAssetPacketizer"));
  }
  else if (-[CLDurianFirmwareUpdater personalizationChipIDCharacteristic](self, "personalizationChipIDCharacteristic") == a4
         || -[CLDurianFirmwareUpdater personalizationBoardIDCharacteristic](self, "personalizationBoardIDCharacteristic") == a4|| -[CLDurianFirmwareUpdater personalizationECIDCharacteristic](self, "personalizationECIDCharacteristic") == a4|| -[CLDurianFirmwareUpdater personalizationSecDomainCharacteristic](self, "personalizationSecDomainCharacteristic") == a4|| -[CLDurianFirmwareUpdater personalizationSecModeCharacteristic](self, "personalizationSecModeCharacteristic") == a4|| -[CLDurianFirmwareUpdater personalizationProdModeCharacteristic](self, "personalizationProdModeCharacteristic") == a4|| -[CLDurianFirmwareUpdater personalizationBootNonceHashCharacteristic](self, "personalizationBootNonceHashCharacteristic") == a4|| -[CLDurianFirmwareUpdater personalizationBVERCharacteristic](self, "personalizationBVERCharacteristic") == a4)
  {
    -[CLDurianFirmwareUpdater _handlePersonalizationDataFromDevice:](self, "_handlePersonalizationDataFromDevice:", a4);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v12 = 68289538;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = objc_msgSend(a3, "identifier");
      v18 = 2114;
      v19 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian FWUpdate - Received unexpected update value\", \"peripheralUUID\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC2F0);
    }
    v10 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v11 = objc_msgSend(a3, "identifier");
      v12 = 68289538;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = a5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian FWUpdate - Received unexpected update value", "{\"msg%{public}.0s\":\"#durian FWUpdate - Received unexpected update value\", \"peripheralUUID\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (CLDurianFirmwareUpdaterDelegate)delegate
{
  return (CLDurianFirmwareUpdaterDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CBCharacteristic)firmwareDownloadAssetsCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirmwareDownloadAssetsCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CBCharacteristic)firmwareDownloadCommandCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFirmwareDownloadCommandCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CBCharacteristic)firwmareDownloadStatusCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirwmareDownloadStatusCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CBCharacteristic)firmwareDownloadAssetsReadyCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFirmwareDownloadAssetsReadyCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CBCharacteristic)personalizationChipIDCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPersonalizationChipIDCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CBCharacteristic)personalizationBoardIDCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPersonalizationBoardIDCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CBCharacteristic)personalizationECIDCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPersonalizationECIDCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CBCharacteristic)personalizationSecDomainCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPersonalizationSecDomainCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CBCharacteristic)personalizationSecModeCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPersonalizationSecModeCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CBCharacteristic)personalizationProdModeCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersonalizationProdModeCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CBCharacteristic)personalizationBootNonceHashCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersonalizationBootNonceHashCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CBCharacteristic)personalizationBVERCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPersonalizationBVERCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)hasPreparedForFirmwareDownload
{
  return self->_hasPreparedForFirmwareDownload;
}

- (void)setHasPreparedForFirmwareDownload:(BOOL)a3
{
  self->_hasPreparedForFirmwareDownload = a3;
}

- (NSMutableDictionary)personalizationInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPersonalizationInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableArray)assetPacketizerQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAssetPacketizerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CLDurianFirmwareAssetPacketizer)currentAssetPacketizer
{
  return (CLDurianFirmwareAssetPacketizer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentAssetPacketizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
