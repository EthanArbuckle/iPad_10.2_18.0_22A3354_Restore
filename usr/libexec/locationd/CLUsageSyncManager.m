@implementation CLUsageSyncManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102305678 != -1)
    dispatch_once(&qword_102305678, &stru_10215AB08);
  return (id)qword_102305670;
}

+ (BOOL)isSupported
{
  if (qword_102305688 != -1)
    dispatch_once(&qword_102305688, &stru_10215AB28);
  return byte_102305680;
}

- (CLUsageSyncManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLUsageSyncManager;
  return -[CLUsageSyncManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLUsageSyncManagerProtocol, &OBJC_PROTOCOL___CLUsageSyncManagerClientProtocol);
}

- (void)setSilo:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  objc_msgSend(a3, "suspend");
  v8.receiver = self;
  v8.super_class = (Class)CLUsageSyncManager;
  -[CLUsageSyncManager setSilo:](&v8, "setSilo:", a3);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008BE5CC;
  v7[3] = &unk_1021436B8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.location.usage"), v7);
}

- (void)beginService
{
  -[CLUsageSyncManager setErrorQueue:](self, "setErrorQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLUsageSyncManager setMessagesWaitingForAck:](self, "setMessagesWaitingForAck:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLUsageSyncManager universe](self, "universe");
  sub_1001B6A0C();
}

- (void)endService
{
  NSNotificationCenter *v3;
  NSNotificationCenter *v4;
  NSNotificationCenter *v5;
  NSNotificationCenter *v6;

  -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);

  self->_service = 0;
  self->_pairedDeviceID = 0;
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, off_1022A5460(), self->_pairedDeviceRegistry);
  v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v4, "removeObserver:name:object:", self, off_1022A5468(), self->_pairedDeviceRegistry);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v5, "removeObserver:name:object:", self, off_1022A5470(), self->_pairedDeviceRegistry);
  v6 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v6, "removeObserver:name:object:", self, off_1022A5478(), self->_pairedDeviceRegistry);

  self->_pairedDeviceRegistry = 0;
  -[CLTimer setHandler:](self->_retryTimer, "setHandler:", 0);

  self->_retryTimer = 0;
  self->_errorQueue = 0;

  self->_messagesWaitingForAck = 0;
}

- (void)onClientManagerNotification:(int)a3 data:(const void *)a4
{
  -[CLUsageSyncManager requestFullResync](self, "requestFullResync", *(_QWORD *)&a3, a4);
  -[CLUsageSyncManager sendAllUsageSyncData](self, "sendAllUsageSyncData");
}

- (void)handleUnpairNotification_bounce:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BF074;
  v3[3] = &unk_10212BB58;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (void)handlePairNotification_bounce:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BF0E0;
  v3[3] = &unk_10212BB58;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (void)handleUnpair
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  v3 = -[objc_class getActivePairedDevice](-[objc_class sharedInstance](off_1022A5458(), "sharedInstance"), "getActivePairedDevice");
  v4 = objc_msgSend(v3, "valueForProperty:", off_1022A5480());
  if (objc_msgSend(v4, "isEqual:", -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID")))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289282;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = (const char *)objc_msgSend(objc_msgSend(v4, "UUIDString"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Non-active device unpaired\", \"current id\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289538;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = -[NSString UTF8String](-[NSUUID UUIDString](-[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID"), "UUIDString"), "UTF8String");
      v14 = 2082;
      v15 = objc_msgSend(objc_msgSend(v4, "UUIDString"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Unpair\", \"current id\":%{public, location:escape_only}s, \"active id\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x26u);
    }
    -[CLClientManagerPublicProtocol syncgetDoSync:](-[CLUsageSyncManager manager](self, "manager"), "syncgetDoSync:", &stru_10215AB48);
    -[CLUsageSyncManager setPairedDeviceID:](self, "setPairedDeviceID:", 0);
    -[CLUsageSyncManager setErrorQueue:](self, "setErrorQueue:", +[NSMutableArray array](NSMutableArray, "array"));
    -[CLTimer setNextFireDelay:](self->_retryTimer, "setNextFireDelay:", 1.79769313e308);
    self->_retryTimerSet = 0;
    -[CLUsageSyncManager setMessagesWaitingForAck:](self, "setMessagesWaitingForAck:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v7 = sub_1001FD94C();
    sub_1005254E4(v7);
    -[CLUsageSyncManager service:nearbyDevicesChanged:](self, "service:nearbyDevicesChanged:", -[CLUsageSyncManager service](self, "service"), -[IDSService devices](-[CLUsageSyncManager service](self, "service"), "devices"));
  }
}

- (void)handlePair
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const char *v14;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  v3 = -[objc_class getActivePairedDevice](-[objc_class sharedInstance](off_1022A5458(), "sharedInstance"), "getActivePairedDevice");
  v4 = objc_msgSend(v3, "valueForProperty:", off_1022A5480());
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289538;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2082;
    v12 = objc_msgSend(objc_msgSend(v4, "UUIDString"), "UTF8String");
    v13 = 2082;
    v14 = -[NSString UTF8String](-[NSUUID UUIDString](-[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID"), "UUIDString"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Pairing\", \"new id\":%{public, location:escape_only}s, \"old id\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x26u);
  }
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqual:", -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID")) & 1) == 0)
    {
      -[CLUsageSyncManager setPairedDeviceID:](self, "setPairedDeviceID:", v4);
      v6 = sub_1001FD94C();
      sub_10052861C(v6, CFSTR("kCLUsageSyncPairedDeviceID"), (char *)-[NSString UTF8String](-[NSUUID UUIDString](self->_pairedDeviceID, "UUIDString"), "UTF8String"));
      v7 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 944))(v7);
      -[CLUsageSyncManager service:nearbyDevicesChanged:](self, "service:nearbyDevicesChanged:", -[CLUsageSyncManager service](self, "service"), -[IDSService devices](-[CLUsageSyncManager service](self, "service"), "devices"));
    }
  }
}

- (void)handleActiveNotification_bounce:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BF5D8;
  v3[3] = &unk_10212BB58;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (void)handleInactiveNotification_bounce:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BF644;
  v3[3] = &unk_10212BB58;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (id)currentlyActiveDevice
{
  NSUUID *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  id result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t buf;
  __int16 v31;
  const char *v32;
  _BYTE v33[128];

  v3 = -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = -[objc_class getPairedDevices](-[objc_class sharedInstance](off_1022A5458(), "sharedInstance"), "getPairedDevices");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
      if ((objc_msgSend(objc_msgSend(v9, "valueForProperty:", off_1022A5480()), "isEqual:", v3) & 1) != 0)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_20;
      }
    }
    v10 = v9;
    if (!v10)
      goto LABEL_20;
    v11 = objc_msgSend(v10, "valueForProperty:", off_1022A5490());
    v12 = -[IDSService linkedDevicesWithRelationship:](-[CLUsageSyncManager service](self, "service"), "linkedDevicesWithRelationship:", 1);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
LABEL_13:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
        if ((objc_msgSend(objc_msgSend(v17, "nsuuid"), "isEqual:", v11) & 1) != 0)
          break;
        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
            goto LABEL_13;
          goto LABEL_25;
        }
      }
      result = v17;
      if (result)
        return result;
    }
LABEL_25:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v18 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v31 = 2082;
      v32 = "";
      v19 = "{\"msg%{public}.0s\":\"#usesync #warning Couldn't find a matching IDS device\"}";
      goto LABEL_29;
    }
  }
  else
  {
LABEL_20:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v18 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v31 = 2082;
      v32 = "";
      v19 = "{\"msg%{public}.0s\":\"#usesync #warning Couldn't find an active device\"}";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&buf, 0x12u);
    }
  }
  return 0;
}

- (BOOL)isPaired
{
  return -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID") != 0;
}

- (BOOL)_sendMessage:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v20;
  uint8_t buf[8];
  __int16 v22;
  const char *v23;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (-[CLUsageSyncManager isPaired](self, "isPaired"))
  {
    v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(a3, "messageType"), CFSTR("kCLUsageSyncMessageTypeKey"));
    if (objc_msgSend(a3, "dataPayload"))
      objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(a3, "dataPayload"), CFSTR("kCLUsageSyncMessageDataKey"));
    sub_100197040();
    if (sub_10019DF90())
    {
      v10 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
      if (!v10 || (objc_msgSend(v10, "operatingSystemVersion"), *(uint64_t *)buf <= 4))
      {
        *(_QWORD *)buf = 0;
        v11 = sub_1001FD94C();
        sub_100526324(v11, (uint64_t)CFSTR("kCLUsageSyncNextSequenceNumberKey"), buf);
        v12 = sub_1001FD94C();
        v20 = *(_QWORD *)buf + 1;
        sub_100528084(v12, CFSTR("kCLUsageSyncNextSequenceNumberKey"), &v20);
        v13 = sub_1001FD94C();
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 944))(v13);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(_QWORD *)buf), CFSTR("kCLUsageSyncMessageSequenceNumberKey"));
      }
    }
    v14 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(v14, "relationship") == (id)2)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10215AC50);
        v16 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          *(_DWORD *)&buf[4] = 0;
          v22 = 2082;
          v23 = "";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync device is standalone watch. Spoof it is sent\"}", buf, 0x12u);
        }
        LOBYTE(v14) = 1;
      }
      else
      {
        LOBYTE(v14) = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](self->_service, "sendMessage:toDestinations:priority:options:identifier:error:", v9, +[NSSet setWithObject:](NSSet, "setWithObject:", (id)IDSCopyIDForDevice(v15)), objc_msgSend(a3, "priority"), objc_msgSend(a3, "idsOptions"), a4, a5);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v17 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v22 = 2082;
      v23 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Attempted to send when unpaired\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v18 = qword_1022A01D8;
    LODWORD(v14) = os_signpost_enabled((os_log_t)qword_1022A01D8);
    if ((_DWORD)v14)
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v22 = 2082;
      v23 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Attempted to send when unpaired", "{\"msg%{public}.0s\":\"#usesync Attempted to send when unpaired\"}", buf, 0x12u);
      LOBYTE(v14) = 0;
    }
  }
  return (char)v14;
}

- (void)addMessageToErrorQueue:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (!self->_retryTimerSet)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Setting 5 minute error retry timer\"}", (uint8_t *)&v8, 0x12u);
    }
    -[CLTimer setNextFireDelay:](self->_retryTimer, "setNextFireDelay:", 300.0);
    self->_retryTimerSet = 1;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "message"), "messageType"), "UTF8String");
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Adding a message to the error queue\", \"type\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
  }
  -[NSMutableArray addObject:](self->_errorQueue, "addObject:", a3);
}

- (void)drainErrorQueue
{
  NSObject *v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t buf;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableArray count](self->_errorQueue, "count");
    buf = 68289282;
    v17 = 2082;
    v18 = "";
    v19 = 2050;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Draining the error queue\", \"count\":%{public}lu}", (uint8_t *)&buf, 0x1Cu);
  }
  v5 = self->_errorQueue;
  -[CLUsageSyncManager setErrorQueue:](self, "setErrorQueue:", +[NSMutableArray array](NSMutableArray, "array"));
  -[CLTimer setNextFireDelay:](self->_retryTimer, "setNextFireDelay:", 1.79769313e308);
  self->_retryTimerSet = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[CLUsageSyncManager handleMessageError:](self, "handleMessageError:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v10 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v17 = 2082;
    v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Error queue drained\"}", (uint8_t *)&buf, 0x12u);
  }
}

- (void)messageFailedToSend:(id)a3 withError:(id)a4 recoverable:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v9;
  CLClientManagerUsageSyncMessageError *v10;
  NSObject *v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;

  v5 = a5;
  if (objc_msgSend(a4, "code") == (id)24)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 68289026;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message was replaced\"}", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    v10 = objc_alloc_init(CLClientManagerUsageSyncMessageError);
    -[CLClientManagerUsageSyncMessageError setMessage:](v10, "setMessage:", a3);
    -[CLClientManagerUsageSyncMessageError setError:](v10, "setError:", a4);
    -[CLClientManagerUsageSyncMessageError setRecoverable:](v10, "setRecoverable:", v5);
    if (objc_msgSend(a4, "code") == (id)23 && v5)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v11 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 68289026;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message timed out.  Retrying\"}", (uint8_t *)&v12, 0x12u);
      }
      -[CLUsageSyncManager handleMessageError:](self, "handleMessageError:", v10);
    }
    else
    {
      -[CLUsageSyncManager addMessageToErrorQueue:](self, "addMessageToErrorQueue:", v10);
    }
  }
}

- (void)handleMessageError:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[7];
  _QWORD v14[6];
  uint8_t buf[8];
  _BYTE v16[24];
  void (*v17)(uint64_t);
  uint64_t v18;

  v5 = objc_msgSend(a3, "message");
  v6 = objc_msgSend(a3, "error");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    *(_WORD *)&v16[10] = 2114;
    *(_QWORD *)&v16[12] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync #warning Got error from IDS, attempting to recover\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  if (objc_msgSend(v5, "isMessageOfType:", CFSTR("kCLUsageSyncMessageUsageUpdateKey")))
  {
    v8 = sub_1008C06E4((uint64_t)objc_msgSend(objc_msgSend(v5, "dataPayload"), "objectForKeyedSubscript:", CFSTR("kCLUsageSyncClientKey")));
    *(_QWORD *)buf = 0;
    *(_QWORD *)v16 = buf;
    *(_QWORD *)&v16[8] = 0x3052000000;
    *(_QWORD *)&v16[16] = sub_100206E90;
    v17 = sub_100207BC4;
    v18 = 0;
    v13[6] = buf;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008C0750;
    v14[3] = &unk_10215AB70;
    v14[4] = v8;
    v14[5] = buf;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008C07E0;
    v13[3] = &unk_10215AB98;
    v13[4] = self;
    v13[5] = v8;
    -[CLClientManagerPublicProtocol doAsync:withReply:](-[CLUsageSyncManager manager](self, "manager"), "doAsync:withReply:", v14, v13);
    _Block_object_dispose(buf, 8);
  }
  else if (objc_msgSend(v5, "isMessageOfType:", CFSTR("kCLUsageSyncMessageResyncResponseKey")))
  {
    -[CLUsageSyncManager sendAllUsageSyncData](self, "sendAllUsageSyncData");
  }
  else if (objc_msgSend(v5, "isMessageOfType:", CFSTR("kCLUsageSyncMessageResyncRequestKey")))
  {
    -[CLUsageSyncManager requestFullResync](self, "requestFullResync");
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v10 = objc_msgSend(objc_msgSend(v5, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v16 = 2082;
      *(_QWORD *)&v16[2] = "";
      *(_WORD *)&v16[10] = 2082;
      *(_QWORD *)&v16[12] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Unrecognized type message failed to send.  Cannot recover.\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v11 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v12 = objc_msgSend(objc_msgSend(v5, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v16 = 2082;
      *(_QWORD *)&v16[2] = "";
      *(_WORD *)&v16[10] = 2082;
      *(_QWORD *)&v16[12] = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Unrecognized type message failed to send.  Cannot recover.", "{\"msg%{public}.0s\":\"#usesync Unrecognized type message failed to send.  Cannot recover.\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (void)sendMessage:(id)a3
{
  _BOOL8 v5;
  NSMutableDictionary *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (self->_pairedDeviceID)
  {
    v12 = 0;
    v13 = 0;
    v5 = -[CLUsageSyncManager _sendMessage:identifier:error:](self, "_sendMessage:identifier:error:", a3, &v13, &v12);
    if (!v5 || v12)
    {
      -[CLUsageSyncManager messageFailedToSend:withError:recoverable:](self, "messageFailedToSend:withError:recoverable:", a3, v12, v5);
    }
    else if (v13)
    {
      v6 = -[CLUsageSyncManager messagesWaitingForAck](self, "messagesWaitingForAck");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", a3, v13);
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        v9 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
        *(_DWORD *)buf = 68289282;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2082;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Didn't get an identifier for message\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      }
      v10 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v11 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
        *(_DWORD *)buf = 68289282;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v18 = 2082;
        v19 = v11;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Didn't get an identifier for message", "{\"msg%{public}.0s\":\"#usesync Didn't get an identifier for message\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2082;
      v19 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Dropping a message because we aren't paired\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (void)sendMessageWithMessageType:(id)a3 dataPayload:(id)a4 priority:(int64_t)a5 idsOptions:(id)a6
{
  CLClientManagerUsageSyncMessage *v11;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  v11 = objc_alloc_init(CLClientManagerUsageSyncMessage);
  -[CLClientManagerUsageSyncMessage setMessageType:](v11, "setMessageType:", a3);
  -[CLClientManagerUsageSyncMessage setDataPayload:](v11, "setDataPayload:", a4);
  -[CLClientManagerUsageSyncMessage setPriority:](v11, "setPriority:", a5);
  -[CLClientManagerUsageSyncMessage setIdsOptions:](v11, "setIdsOptions:", a6);
  -[CLUsageSyncManager sendMessage:](self, "sendMessage:", v11);
}

- (void)requestFullResync
{
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD v8[4];
  _QWORD v9[4];
  uint64_t buf;
  __int16 v11;
  const char *v12;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (-[CLUsageSyncManager isPaired](self, "isPaired"))
  {
    v8[0] = IDSSendMessageOptionTimeoutKey;
    v8[1] = IDSSendMessageOptionEncryptPayloadKey;
    v9[0] = &off_10221B780;
    v9[1] = &__kCFBooleanTrue;
    v8[2] = IDSSendMessageOptionForceLocalDeliveryKey;
    v8[3] = IDSSendMessageOptionQueueOneIdentifierKey;
    v9[2] = &__kCFBooleanTrue;
    v9[3] = CFSTR("kCLUsageSyncResyncRequestQueueIdentifierKey");
    -[CLUsageSyncManager sendMessageWithMessageType:dataPayload:priority:idsOptions:](self, "sendMessageWithMessageType:dataPayload:priority:idsOptions:", CFSTR("kCLUsageSyncMessageResyncRequestKey"), 0, 300, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v11 = 2082;
      v12 = "";
      v4 = "{\"msg%{public}.0s\":\"#usesync Full resync requested\"}";
      v5 = v3;
      v6 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, v6, v4, (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      buf = 68289026;
      v11 = 2082;
      v12 = "";
      v4 = "{\"msg%{public}.0s\":\"#usesync Not performing full sync due to being unpaired\"}";
      v5 = v7;
      v6 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
  }
}

- (void)client:(id)a3 didChangeUsageData:(id)a4
{
  char v7;
  NSObject *v8;
  const char *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;

  v7 = _os_feature_enabled_impl("CoreLocation", "CLUnfederatedUsageSync");
  sub_100197040();
  if ((v7 & 1) != 0)
  {
    if (sub_100195F08())
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        v9 = "{\"msg%{public}.0s\":\"#usesync dropping watch usage data change\"}";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x12u);
        return;
      }
      return;
    }
LABEL_14:
    -[CLUsageSyncManager client:didChangeUsageDataInternal:](self, "client:didChangeUsageDataInternal:", a3, a4);
    return;
  }
  if (!sub_10019DF90())
    goto LABEL_14;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v9 = "{\"msg%{public}.0s\":\"#didChangeUsageData dropping companion usage data change\"}";
    goto LABEL_12;
  }
}

- (void)client:(id)a3 didChangeUsageDataInternal:(id)a4
{
  NSDictionary *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[2];

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (a4)
  {
    if (-[CLUsageSyncManager isPaired](self, "isPaired"))
    {
      v27[0] = CFSTR("kCLUsageSyncClientKey");
      v27[1] = CFSTR("kCLUsageSyncUsageKey");
      v28[0] = a3;
      v28[1] = a4;
      v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v25[0] = IDSSendMessageOptionTimeoutKey;
      v25[1] = IDSSendMessageOptionEncryptPayloadKey;
      v26[0] = &off_10221B780;
      v26[1] = &__kCFBooleanTrue;
      v25[2] = IDSSendMessageOptionForceLocalDeliveryKey;
      v25[3] = IDSSendMessageOptionNonWakingKey;
      v26[2] = &__kCFBooleanTrue;
      v26[3] = &__kCFBooleanTrue;
      v25[4] = IDSSendMessageOptionQueueOneIdentifierKey;
      v26[4] = objc_msgSend(CFSTR("usage-"), "stringByAppendingString:", a3);
      -[CLUsageSyncManager sendMessageWithMessageType:dataPayload:priority:idsOptions:](self, "sendMessageWithMessageType:dataPayload:priority:idsOptions:", CFSTR("kCLUsageSyncMessageUsageUpdateKey"), v7, 300, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 68289538;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2082;
        v22 = objc_msgSend(a3, "UTF8String");
        v23 = 2114;
        v24 = a4;
        v9 = "{\"msg%{public}.0s\":\"#usesync Enqueued usage update message\", \"client\":%{public, location:escape_only}"
             "s, \"usage\":%{public, location:escape_only}@}";
        v10 = v8;
        v11 = OS_LOG_TYPE_DEFAULT;
        v12 = 38;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v17, v12);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v16 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        v17 = 68289026;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v9 = "{\"msg%{public}.0s\":\"#usesync Not performing sync due to being unpaired\"}";
        v10 = v16;
        v11 = OS_LOG_TYPE_INFO;
        v12 = 18;
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v13 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = objc_msgSend(a3, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Got empty usage dictionary\", \"client\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v14 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v15 = objc_msgSend(a3, "UTF8String");
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Got empty usage dictionary", "{\"msg%{public}.0s\":\"#usesync Got empty usage dictionary\", \"client\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
    }
  }
}

- (void)onStatusBarIconChange:(int)a3
{
  NSObject *v5;
  const char *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;

  sub_100197040();
  if (sub_100195F08())
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v6 = "{\"msg%{public}.0s\":\"#onStatusBarIconChange on watch, dropping iconState change\"}";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x12u);
    }
  }
  else
  {
    dword_102305690 = a3;
    if (self->_coalescingUpdates)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v5 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        v6 = "{\"msg%{public}.0s\":\"#onStatusBarIconChange dropping iconState change, coalescing updates\"}";
        goto LABEL_11;
      }
    }
    else
    {
      self->_coalescingUpdates = 1;
      v7 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1008C14CC;
      block[3] = &unk_10212BB58;
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo"), "queue"), block);
    }
  }
}

- (void)onStatusBarIconChangeInternal:(int)a3
{
  NSObject *v4;
  NSObject *v6;
  char v7;
  uint64_t v8;
  id v9;
  NSNumber *v10;
  NSObject *v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;

  if (self->_lastStatusBarIconState == a3)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 1026;
      LODWORD(v20) = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal dropping duplicate iconState\", \"iconState\":%{public}d}", buf, 0x18u);
    }
  }
  else
  {
    self->_lastStatusBarIconState = a3;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 1025;
      LODWORD(v20) = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal processing iconState\", \"iconState\":%{private}d}", buf, 0x18u);
    }
    if (a3 == 1)
    {
      v7 = 0;
      v8 = 2;
    }
    else if (a3 == 2)
    {
      v7 = 0;
      v8 = 10;
    }
    else
    {
      v7 = 1;
      v8 = 21;
    }
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    if ((v7 & 1) == 0)
    {
      v13 = 0;
      v14 = 0;
      sub_100195BD4(v8, &v14, &v13);
      if (v14)
      {
        v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
        objc_msgSend(v9, "setValue:forKey:", v10, v14);
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10215AC50);
        v11 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289282;
          v16 = 0;
          v17 = 2082;
          v18 = "";
          v19 = 2050;
          v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal lacks start key\", \"clientServiceType\":%{public}lu}", buf, 0x1Cu);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_10215AC50);
        }
        v12 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          *(_DWORD *)buf = 68289282;
          v16 = 0;
          v17 = 2082;
          v18 = "";
          v19 = 2050;
          v20 = v8;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#onStatusBarIconChangeInternal lacks start key", "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal lacks start key\", \"clientServiceType\":%{public}lu}", buf, 0x1Cu);
        }
      }
    }
    -[CLUsageSyncManager client:didChangeUsageDataInternal:](self, "client:didChangeUsageDataInternal:", CFSTR("com.apple.location.AggregateLocationIconApp"), v9);
  }
}

- (void)sendAllUsageSyncData
{
  _QWORD v3[6];
  _QWORD v4[5];
  _QWORD v5[6];

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_100206E90;
  v5[4] = sub_100207BC4;
  v5[5] = 0;
  v3[5] = v5;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008C1954;
  v4[3] = &unk_10214C4C0;
  v4[4] = v5;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008C1990;
  v3[3] = &unk_10215ABC0;
  v3[4] = self;
  -[CLClientManagerPublicProtocol doAsync:withReply:](-[CLUsageSyncManager manager](self, "manager"), "doAsync:withReply:", v4, v3);
  _Block_object_dispose(v5, 8);
}

- (id)mungedUsageDataForPotentiallyOldUsageData:(id)a3
{
  id v5;
  __int128 v6;
  uint64_t v7;
  NSNumber *v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  NSNumber *v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __CFString *v29;
  double v30;
  __int128 v32;
  __CFString *v33;
  __CFString *v34;
  uint8_t buf[8];
  __int16 v36;
  const char *v37;
  __int16 v38;
  uint64_t v39;

  sub_100197040();
  if (!sub_10019DF90())
    return a3;
  v5 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
  if (v5)
  {
    objc_msgSend(v5, "operatingSystemVersion");
    if (*(uint64_t *)buf > 3)
      return a3;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  *(_QWORD *)&v6 = 68289282;
  v32 = v6;
  do
  {
    v10 = qword_101BE5B28[v7];
    v33 = 0;
    v34 = 0;
    sub_100195BD4(v10, &v34, &v33);
    if (v34)
      v11 = v33 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      v14 = (NSNumber *)objc_msgSend(a3, "objectForKeyedSubscript:");
      v15 = objc_msgSend(a3, "objectForKeyedSubscript:", v33);
      v16 = v15;
      if (v14)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (v17)
      {
        if (!v14)
        {
LABEL_36:
          v14 = v8;
          goto LABEL_37;
        }
        if (v8)
        {
LABEL_35:
          -[NSNumber doubleValue](v8, "doubleValue", v32);
          v24 = v23;
          -[NSNumber doubleValue](v14, "doubleValue");
          if (v24 > v25)
            goto LABEL_37;
          goto LABEL_36;
        }
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10215AC50);
        v18 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v32;
          *(_DWORD *)&buf[4] = 0;
          v36 = 2082;
          v37 = "";
          v38 = 2114;
          v39 = (uint64_t)a3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Found start time AND stop time for a service\", \"usageData\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_10215AC50);
        }
        v19 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          *(_DWORD *)buf = v32;
          *(_DWORD *)&buf[4] = 0;
          v36 = 2082;
          v37 = "";
          v38 = 2114;
          v39 = (uint64_t)a3;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Found start time AND stop time for a service", "{\"msg%{public}.0s\":\"#usesync Found start time AND stop time for a service\", \"usageData\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        objc_msgSend(v16, "doubleValue", v32);
        v21 = v20;
        -[NSNumber doubleValue](v14, "doubleValue");
        if (v21 > v22)
        {
          v14 = v8;
          goto LABEL_38;
        }
        v16 = 0;
        if (v8)
          goto LABEL_35;
      }
LABEL_37:
      if (!v16)
      {
LABEL_41:
        v8 = v14;
        goto LABEL_42;
      }
LABEL_38:
      if (!v9 || (objc_msgSend((id)v9, "doubleValue"), v27 = v26, objc_msgSend(v16, "doubleValue"), v27 < v28))
        v9 = (unint64_t)v16;
      goto LABEL_41;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = v32;
      *(_DWORD *)&buf[4] = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2050;
      v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Insanity!  A service lacks start/stop keys\", \"service\":%{public}lu}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v13 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = v32;
      *(_DWORD *)&buf[4] = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2050;
      v39 = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Insanity!  A service lacks start/stop keys", "{\"msg%{public}.0s\":\"#usesync Insanity!  A service lacks start/stop keys\", \"service\":%{public}lu}", buf, 0x1Cu);
    }
LABEL_42:
    ++v7;
  }
  while (v7 != 7);
  if ((unint64_t)v8 | v9)
  {
    a3 = objc_msgSend(a3, "mutableCopy");
    v34 = 0;
    *(_QWORD *)buf = 0;
    sub_100195BD4(10, buf, &v34);
    if (v8)
    {
      v29 = *(__CFString **)buf;
    }
    else
    {
      v29 = v34;
      objc_msgSend((id)v9, "doubleValue");
      v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30 + 10.0);
    }
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v8, v29, v32);
  }
  return a3;
}

- (CLClientManagerPublicProtocol)manager
{
  return (CLClientManagerPublicProtocol *)*((_QWORD *)self->_clientManagerClient.__ptr_.__value_ + 2);
}

- (void)handleMessageSendError:(id)a3 identifier:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  if (a4)
  {
    v7 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLUsageSyncManager messagesWaitingForAck](self, "messagesWaitingForAck"), "objectForKeyedSubscript:", a4);
    if (v7)
    {
      -[CLUsageSyncManager messageFailedToSend:withError:recoverable:](self, "messageFailedToSend:withError:recoverable:", v7, a3, 1);
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v10 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 68289538;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2082;
        v16 = objc_msgSend(a4, "UTF8String");
        v17 = 2114;
        v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message from past life failed\", \"identifier\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v11 = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Unknown message failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v9 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v11 = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Unknown message failed", "{\"msg%{public}.0s\":\"#usesync Unknown message failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)handleMessageSendSuccessForIdentifier:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v4 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = objc_msgSend(a3, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message sent\", \"identifier\":%{public, location:escape_only}s}", (uint8_t *)v5, 0x1Cu);
  }
}

- (void)handleMessageUsageUpdateWithMessageData:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[7];
  uint8_t buf[8];
  __int128 v16;
  __int16 v17;
  _BOOL4 v18;

  if (!_os_feature_enabled_impl("CoreLocation", "CLUnfederatedUsageSync")
    || (sub_100197040(), !sub_10019DF90()))
  {
    objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v16) = 2082;
      *(_QWORD *)((char *)&v16 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Got usage update\"}", buf, 0x12u);
    }
    v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCLUsageSyncClientKey"));
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCLUsageSyncUsageKey"));
    v8 = v7;
    if (v6 && v7)
    {
      v9 = sub_1008C06E4((uint64_t)v6);
      v10 = -[CLUsageSyncManager mungedUsageDataForPotentiallyOldUsageData:](self, "mungedUsageDataForPotentiallyOldUsageData:", v8);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&v16 = buf;
      *((_QWORD *)&v16 + 1) = 0x2020000000;
      LOBYTE(v17) = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1008C27D4;
      v14[3] = &unk_10215ABE8;
      v14[4] = v9;
      v14[5] = v10;
      v14[6] = buf;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1008C2864;
      v13[3] = &unk_10215ABC0;
      v13[4] = self;
      v13[5] = buf;
      -[CLClientManagerPublicProtocol doAsync:withReply:](-[CLUsageSyncManager manager](self, "manager"), "doAsync:withReply:", v14, v13);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v11 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        LOWORD(v16) = 2082;
        *(_QWORD *)((char *)&v16 + 2) = "";
        WORD5(v16) = 1026;
        HIDWORD(v16) = v6 != 0;
        v17 = 1026;
        v18 = v8 != 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Didn't get an expected parameter\", \"client key\":%{public}hhd, \"usage data\":%{public}hhd}", buf, 0x1Eu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      }
      v12 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        LOWORD(v16) = 2082;
        *(_QWORD *)((char *)&v16 + 2) = "";
        WORD5(v16) = 1026;
        HIDWORD(v16) = v6 != 0;
        v17 = 1026;
        v18 = v8 != 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Didn't get an expected parameter", "{\"msg%{public}.0s\":\"#usesync Didn't get an expected parameter\", \"client key\":%{public}hhd, \"usage data\":%{public}hhd}", buf, 0x1Eu);
      }
    }
  }
}

- (void)handleMessageResyncRequestWithMessageData:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v4 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Got request for full resync of data\"}", (uint8_t *)v5, 0x12u);
  }
  -[CLUsageSyncManager sendAllUsageSyncData](self, "sendAllUsageSyncData");
}

- (void)handleMessageResyncResponseWithMessageData:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  _QWORD v10[6];
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  __int128 v17;
  char v18;
  _BYTE v19[128];

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v17) = 2082;
    *(_QWORD *)((char *)&v17 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Got full resync data\"}", buf, 0x12u);
  }
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", -[CLUsageSyncManager mungedUsageDataForPotentiallyOldUsageData:](self, "mungedUsageDataForPotentiallyOldUsageData:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i))), sub_1008C06E4(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i)));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v7);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v17 = buf;
  *((_QWORD *)&v17 + 1) = 0x2020000000;
  v18 = 0;
  v10[5] = buf;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008C2BE0;
  v11[3] = &unk_10215AC10;
  v11[4] = v6;
  v11[5] = buf;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008C2CF8;
  v10[3] = &unk_10215ABC0;
  v10[4] = self;
  -[CLClientManagerPublicProtocol doAsync:withReply:](-[CLUsageSyncManager manager](self, "manager"), "doAsync:withReply:", v11, v10);
  _Block_object_dispose(buf, 8);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  id v24;

  v8 = a6;
  objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3, a4), "silo");
  if (!a7 && v8)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = objc_msgSend(a5, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync sent\", \"identifier\":%{public, location:escape_only}s}", (uint8_t *)&v15, 0x1Cu);
    }
    -[CLUsageSyncManager handleMessageSendSuccessForIdentifier:](self, "handleMessageSendSuccessForIdentifier:", a5);
LABEL_19:
    -[NSMutableDictionary removeObjectForKey:](-[CLUsageSyncManager messagesWaitingForAck](self, "messagesWaitingForAck"), "removeObjectForKey:", a5);
    return;
  }
  v12 = objc_msgSend(objc_msgSend(a7, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (!v12 || objc_msgSend(v12, "code") != (id)32)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289794;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = objc_msgSend(a5, "UTF8String");
      v21 = 1026;
      v22 = v8;
      v23 = 2114;
      v24 = a7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync #warning Failure\", \"identifier\":%{public, location:escape_only}s, \"succeeded\":%{public}hhd, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x2Cu);
    }
    -[CLUsageSyncManager handleMessageSendError:identifier:](self, "handleMessageSendError:identifier:", a7, a5);
    goto LABEL_19;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v13 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Sync to/from standalone watch is not supported\"}", (uint8_t *)&v15, 0x12u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  int v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  sub_100197040();
  if (!sub_100195F08())
    return;
  v9 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLUsageSyncMessageTypeKey"));
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLUsageSyncMessageDataKey"));
    if (objc_msgSend(CFSTR("kCLUsageSyncMessageUsageUpdateKey"), "isEqualToString:", v10))
    {
      -[CLUsageSyncManager handleMessageUsageUpdateWithMessageData:](self, "handleMessageUsageUpdateWithMessageData:", v11);
      return;
    }
    if (objc_msgSend(CFSTR("kCLUsageSyncMessageResyncRequestKey"), "isEqualToString:", v10))
    {
      -[CLUsageSyncManager handleMessageResyncRequestWithMessageData:](self, "handleMessageResyncRequestWithMessageData:", v11);
      return;
    }
    if (objc_msgSend(CFSTR("kCLUsageSyncMessageResyncResponseKey"), "isEqualToString:", v10))
    {
      -[CLUsageSyncManager handleMessageResyncResponseWithMessageData:](self, "handleMessageResyncResponseWithMessageData:", v11);
      return;
    }
    if (objc_msgSend(CFSTR("kCLUsageSyncMessagePromptKey"), "isEqualToString:", v10))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
      v18 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 68289283;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2113;
        v27 = a5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync #warning received legacy kCLUsageSyncMessagePromptKey message, ignoring\", \"payload\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
      }
      return;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v19 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v22 = 68289539;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2082;
      v27 = objc_msgSend(v10, "UTF8String");
      v28 = 2113;
      v29 = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Unrecognized message\", \"type\":%{public, location:escape_only}s, \"payload\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v20 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v21 = objc_msgSend(v10, "UTF8String");
      v22 = 68289539;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2082;
      v27 = v21;
      v28 = 2113;
      v29 = a5;
      v14 = "#usesync Unrecognized message";
      v15 = "{\"msg%{public}.0s\":\"#usesync Unrecognized message\", \"type\":%{public, location:escape_only}s, \"payload"
            "\":%{private, location:escape_only}@}";
      v16 = v20;
      v17 = 38;
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v22 = 68289282;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2114;
      v27 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Got invalid message from IDS\", \"message\":%{public, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10215AC50);
    }
    v13 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v22 = 68289282;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2114;
      v27 = a5;
      v14 = "#usesync Got invalid message from IDS";
      v15 = "{\"msg%{public}.0s\":\"#usesync Got invalid message from IDS\", \"message\":%{public, location:escape_only}@}";
      v16 = v13;
      v17 = 28;
LABEL_12:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v14, v15, (uint8_t *)&v22, v17);
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t buf;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3, a4), "silo");
  v5 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
  if (v5 && objc_msgSend(v5, "isNearby"))
  {
    if (-[CLUsageSyncManager activeDeviceNearbyStatus](self, "activeDeviceNearbyStatus") == 1)
      return;
    v6 = 1;
    v7 = 1;
  }
  else
  {
    if (-[CLUsageSyncManager activeDeviceNearbyStatus](self, "activeDeviceNearbyStatus") == 2)
      return;
    v6 = 0;
    v7 = 2;
  }
  -[CLUsageSyncManager setActiveDeviceNearbyStatus:](self, "setActiveDeviceNearbyStatus:", v7);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10215AC50);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289282;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Paired device nearby change\", \"is nearby\":%{public}hhd}", (uint8_t *)&buf, 0x18u);
  }
  if ((v6 & 1) != 0)
  {
    if (self->_needFullResync)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1008C3774;
      v9[3] = &unk_10212BB58;
      v9[4] = self;
      objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo"), "async:", v9);
    }
  }
  else if (self->_dirtyUsageSyncState)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008C374C;
    v10[3] = &unk_10212BB58;
    v10[4] = self;
    -[CLClientManagerPublicProtocol doAsync:withReply:](-[CLUsageSyncManager manager](self, "manager"), "doAsync:withReply:", &stru_10215AC30, v10);
  }
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 32, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)dirtyUsageSyncState
{
  return self->_dirtyUsageSyncState;
}

- (void)setDirtyUsageSyncState:(BOOL)a3
{
  self->_dirtyUsageSyncState = a3;
}

- (BOOL)needFullResync
{
  return self->_needFullResync;
}

- (void)setNeedFullResync:(BOOL)a3
{
  self->_needFullResync = a3;
}

- (NSUUID)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (id)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)retryTimerSet
{
  return self->_retryTimerSet;
}

- (void)setRetryTimerSet:(BOOL)a3
{
  self->_retryTimerSet = a3;
}

- (CLTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)errorQueue
{
  return self->_errorQueue;
}

- (void)setErrorQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableDictionary)messagesWaitingForAck
{
  return self->_messagesWaitingForAck;
}

- (void)setMessagesWaitingForAck:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (int)activeDeviceNearbyStatus
{
  return self->_activeDeviceNearbyStatus;
}

- (void)setActiveDeviceNearbyStatus:(int)a3
{
  self->_activeDeviceNearbyStatus = a3;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
