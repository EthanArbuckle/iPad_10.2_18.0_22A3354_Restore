@implementation CLLocationStreamingConnectionManager

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
  if (qword_102301BA8 != -1)
    dispatch_once(&qword_102301BA8, &stru_1021435A8);
  return (id)qword_102301BA0;
}

+ (BOOL)isSupported
{
  if (qword_102301BB8 != -1)
    dispatch_once(&qword_102301BB8, &stru_1021435C8);
  return byte_102301BB0;
}

- (CLLocationStreamingConnectionManager)init
{
  CLLocationStreamingConnectionManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationStreamingConnectionManager;
  result = -[CLLocationStreamingConnectionManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLocationStreamingConnectionManagerServiceProtocol, &OBJC_PROTOCOL___CLLocationStreamingConnectionManagerClientProtocol);
  if (result)
    result->_rapportLinkActive = 0;
  return result;
}

- (void)updateNearbyStatusWithCompanionLinkDevice:(id)a3 didConnect:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _BOOL4 pairIsNearby;
  _QWORD v8[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;

  v4 = a4;
  if (objc_msgSend(objc_msgSend(a3, "effectiveIdentifier"), "hasPrefix:", CFSTR("BTPipe"))
    && self->_pairIsNearby != v4)
  {
    self->_pairIsNearby = v4;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v6 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      pairIsNearby = self->_pairIsNearby;
      *(_DWORD *)buf = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 1026;
      v14 = pairIsNearby;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Nearby status change\", \"is nearby\":%{public}d}", buf, 0x18u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100565EA0;
    v8[3] = &unk_1021435F0;
    v8[4] = self;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v8);
  }
}

- (void)updateNearbyStatusWithDevices:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 pairIsNearby;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  _BYTE v24[128];

  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isDefaultPairedDevice") && objc_msgSend(v9, "isNearby"))
        {
          v10 = objc_msgSend(v9, "relationship") == (id)1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:
  if (self->_pairIsNearby != v10)
  {
    self->_pairIsNearby = v10;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v11 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      pairIsNearby = self->_pairIsNearby;
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 1026;
      v23 = pairIsNearby;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Nearby status change\", \"is nearby\":%{public}d}", buf, 0x18u);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1005660C4;
    v13[3] = &unk_1021435F0;
    v13[4] = self;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v13);
  }
}

- (void)activateRapportLinkIfNecessary
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  if (!self->_rapportLink)
  {
    self->_rapportLink = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:](self->_rapportLink, "setDispatchQueue:", objc_msgSend(objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo"), "queue"));
    -[RPCompanionLinkClient setControlFlags:](self->_rapportLink, "setControlFlags:", 32);
  }
  if (!-[CLLocationStreamingConnectionManager rapportLinkActive](self, "rapportLinkActive"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10056623C;
    v6[3] = &unk_102143618;
    v6[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](-[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"), "activateWithCompletion:", v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10056633C;
    v5[3] = &unk_102143640;
    v5[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](-[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"), "setDeviceFoundHandler:", v5);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1005664B0;
    v4[3] = &unk_102143640;
    v4[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](-[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"), "setDeviceLostHandler:", v4);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100566624;
    v3[3] = &unk_102143690;
    v3[4] = self;
    -[RPCompanionLinkClient registerEventID:options:handler:](-[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"), "registerEventID:options:handler:", CFSTR("com.apple.locationd.rapport.event"), 0, v3);
  }
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

  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102143778);
  v5 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  objc_msgSend(a3, "suspend");
  v8.receiver = self;
  v8.super_class = (Class)CLLocationStreamingConnectionManager;
  -[CLLocationStreamingConnectionManager setSilo:](&v8, "setSilo:", a3);
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102143778);
  v6 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100566C84;
  v7[3] = &unk_1021436B8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.location.stream"), v7);
}

- (void)beginService
{
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  -[IDSService addDelegate:queue:](-[CLLocationStreamingConnectionManager service](self, "service"), "addDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo"), "queue"));
  -[CLLocationStreamingConnectionManager activateRapportLinkIfNecessary](self, "activateRapportLinkIfNecessary");
  -[CLLocationStreamingConnectionManager setUnacknowledgedMessages:](self, "setUnacknowledgedMessages:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLLocationStreamingConnectionManager setClients:](self, "setClients:", +[NSMutableSet set](NSMutableSet, "set"));
  -[CLLocationStreamingConnectionManager updateNearbyStatusWithDevices:](self, "updateNearbyStatusWithDevices:", -[IDSService devices](-[CLLocationStreamingConnectionManager service](self, "service"), "devices"));
}

- (void)endService
{
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  -[RPCompanionLinkClient invalidate](-[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"), "invalidate");
  self->_rapportLinkActive = 0;
  self->_rapportLink = 0;
  -[CLLocationStreamingConnectionManager setUnacknowledgedMessages:](self, "setUnacknowledgedMessages:", 0);
  -[CLLocationStreamingConnectionManager setClients:](self, "setClients:", 0);
  -[CLLocationStreamingConnectionManager setService:](self, "setService:", 0);
}

- (BOOL)isRemoteWatchStreamingCompatible
{
  id v2;

  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  v2 = -[objc_class getActivePairedDevice](-[objc_class sharedInstance](off_1022A2C60(), "sharedInstance"), "getActivePairedDevice");
  if (v2)
    LOBYTE(v2) = (NRWatchOSVersionForRemoteDevice() & 0xFFFE0000) != 0;
  return (char)v2;
}

- (BOOL)shouldUseIDSForLocationStreaming
{
  id v3;

  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  LODWORD(v3) = -[CLLocationStreamingConnectionManager isRemoteWatchStreamingCompatible](self, "isRemoteWatchStreamingCompatible");
  if ((_DWORD)v3)
  {
    v3 = -[objc_class getActivePairedDevice](-[objc_class sharedInstance](off_1022A2C60(), "sharedInstance"), "getActivePairedDevice");
    if (v3)
      LOBYTE(v3) = (int)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v3, "valueForProperty:", off_1022A2C68()), "componentsSeparatedByString:", CFSTR(".")), "objectAtIndex:", 0), "intValue") < 8;
  }
  return (char)v3;
}

- (void)addClient:(id)a3
{
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  -[NSMutableSet addObject:](self->_clients, "addObject:", a3);
  _objc_msgSend(a3, "pairedDeviceIsNearby:", self->_pairIsNearby);
}

- (void)retireClient:(id)a3
{
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
}

- (id)packageMessage:(id)a3
{
  id v4;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "messageType"), CFSTR("kCLLocationStreamingMessageKeyType"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "protocolVersion")), CFSTR("kCLLocationStreamingMessageKeyVersion"));
  if (objc_msgSend(a3, "payload"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "payload"), CFSTR("kCLLocationStreamingMessageKeyPayload"));
  return v4;
}

- (void)sendMessageIDS:(id)a3
{
  id v5;
  IDSService *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSMutableDictionary *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[6];
  unsigned __int8 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v5 = -[CLLocationStreamingConnectionManager packageMessage:](self, "packageMessage:");
  v22 = 0uLL;
  v6 = -[CLLocationStreamingConnectionManager service](self, "service");
  v7 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v6, "sendMessage:toDestinations:priority:options:identifier:error:", v5, +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice), objc_msgSend(a3, "priority"), objc_msgSend(a3, "idsOptions"), (char *)&v22 + 8, &v22);
  if (v22 == 0)
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v12 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      v13 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"No error, but also no identifier\", \"message type\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102143778);
    }
    v14 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      v15 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No error, but also no identifier", "{\"msg%{public}.0s\":\"No error, but also no identifier\", \"message type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  else if ((_QWORD)v22)
  {
    v8 = v7;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v9 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)v22;
      v11 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289538;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2114;
      v28 = v10;
      v29 = 2082;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Got error from IDS\", \"error\":%{public, location:escape_only}@, \"message type\":%{public, location:escape_only}s}", buf, 0x26u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100567574;
    v20[3] = &unk_1021436E0;
    v20[4] = a3;
    v20[5] = v22;
    v21 = v8;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v20);
  }
  else
  {
    v16 = -[CLLocationStreamingConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", a3, *((_QWORD *)&v22 + 1));
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v17 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      v19 = objc_msgSend(*((id *)&v22 + 1), "UTF8String");
      *(_DWORD *)buf = 68289538;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = v18;
      v29 = 2082;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Handed off message to IDS\", \"message type\":%{public, location:escape_only}s, \"identifier\":%{public, location:escape_only}s}", buf, 0x26u);
    }
  }
}

- (void)sendMessageRapport:(id)a3
{
  id v5;
  RPCompanionLinkClient *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[7];
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[3];
  char v24;
  uint64_t buf;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v5 = -[CLLocationStreamingConnectionManager packageMessage:](self, "packageMessage:");
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_100206C80;
  v21 = sub_100207AB8;
  v22 = 0;
  v6 = -[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100567948;
  v16[3] = &unk_102143730;
  v16[6] = &v17;
  v16[7] = v23;
  v16[4] = a3;
  v16[5] = self;
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](v6, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.locationd.rapport.event"), v5, RPDestinationIdentifierPairedCompanion, 0, v16);
  if (v18[5])
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v7 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)v18[5];
      v9 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      buf = 68289538;
      v26 = 2082;
      v27 = "";
      v28 = 2114;
      v29 = v8;
      v30 = 2082;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#warning Got error from #Rapport\", \"error\":%{public, location:escape_only}@, \"message type\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102143778);
    }
    v10 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      v11 = (void *)v18[5];
      v12 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      buf = 68289538;
      v26 = 2082;
      v27 = "";
      v28 = 2114;
      v29 = v11;
      v30 = 2082;
      v31 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#warning Got error from #Rapport", "{\"msg%{public}.0s\":\"#warning Got error from #Rapport\", \"error\":%{public, location:escape_only}@, \"message type\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100567BC4;
    v15[3] = &unk_102143758;
    v15[4] = a3;
    v15[5] = &v17;
    v15[6] = v23;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v15);
  }
  else
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v13 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      buf = 68289282;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Handed off message to #Rapport\", \"message type\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);
}

- (void)sendMessage:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  if (-[CLLocationStreamingConnectionManager isRemoteWatchStreamingCompatible](self, "isRemoteWatchStreamingCompatible"))
  {
    if (-[CLLocationStreamingConnectionManager shouldUseIDSForLocationStreaming](self, "shouldUseIDSForLocationStreaming"))
    {
      -[CLLocationStreamingConnectionManager sendMessageIDS:](self, "sendMessageIDS:", a3);
    }
    else
    {
      -[CLLocationStreamingConnectionManager sendMessageRapport:](self, "sendMessageRapport:", a3);
    }
  }
  else
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v5 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Dropping message due to incompatible remote device\"}", (uint8_t *)v6, 0x12u);
    }
  }
}

- (void)withClients:(id)a3
{
  NSMutableSet *clients;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  clients = self->_clients;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(clients);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  signed int v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[6];
  uint8_t buf[8];
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  signed int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;

  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  v9 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageKeyPayload"));
  v10 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageKeyType"));
  if (v10)
  {
    v11 = v10;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v12 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = objc_msgSend(v11, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"IDS Got message\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    v13 = objc_msgSend(objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageKeyVersion")), "intValue");
    sub_100566A0C();
    sub_1015A2E04(buf, (char *)objc_msgSend(v11, "UTF8String"));
    v14 = sub_10019C4C0((uint64_t)&qword_102301BC0, (const void **)buf);
    if (SBYTE3(v26) < 0)
      operator delete(*(void **)buf);
    if ((uint64_t *)v14 == &qword_102301BC8)
    {
      v15 = -1;
      v16 = -1;
    }
    else
    {
      v16 = *(_DWORD *)(v14 + 56);
      v15 = *(_DWORD *)(v14 + 60);
      if (v13 >= v16 && v13 <= v15)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100568238;
        v21[3] = &unk_102143668;
        v21[4] = v11;
        v21[5] = v9;
        -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v21);
        return;
      }
    }
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v19 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 68290050;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = v20;
      v27 = 1026;
      v28 = v13;
      v29 = 1026;
      v30 = v16;
      v31 = 1026;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Received message of unsupported version\", \"type\":%{public, location:escape_only}s, \"declared version\":%{public}d, \"minimum version\":%{public}d, \"maximum version\":%{public}d}", buf, 0x2Eu);
    }
  }
  else
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v17 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Missing message type\", \"message\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102143778);
    }
    v18 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Missing message type", "{\"msg%{public}.0s\":\"Missing message type\", \"message\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[6];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BYTE v29[14];
  __int16 v30;
  id v31;

  v8 = a6;
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe", a3, a4), "silo");
  if (a5)
  {
    v11 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLLocationStreamingConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages"), "objectForKeyedSubscript:", a5);
    v12 = v11;
    -[NSMutableDictionary removeObjectForKey:](-[CLLocationStreamingConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages"), "removeObjectForKey:", a5);
    if (a7 && v8)
      sub_1018FFB7C();
    if (!a7 && v8)
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102143778);
      v13 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289538;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2082;
        v27 = objc_msgSend(a5, "UTF8String");
        v28 = 2082;
        *(_QWORD *)v29 = objc_msgSend(objc_msgSend(v11, "messageType"), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"IDS Send success\", \"identifier\":%{public, location:escape_only}s, \"type\":%{public, location:escape_only}s}", buf, 0x26u);
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1005686C8;
      v20[3] = &unk_1021435F0;
      v20[4] = v11;
      v14 = v20;
LABEL_29:
      -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v14);
      return;
    }
    v17 = objc_msgSend(objc_msgSend(a7, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (!v17 || objc_msgSend(v17, "code") != (id)32)
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102143778);
      v19 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290050;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2082;
        v27 = objc_msgSend(a5, "UTF8String");
        v28 = 1026;
        *(_DWORD *)v29 = v8;
        *(_WORD *)&v29[4] = 2114;
        *(_QWORD *)&v29[6] = a7;
        v30 = 2082;
        v31 = objc_msgSend(objc_msgSend(v11, "messageType"), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Send failure\", \"identifier\":%{public, location:escape_only}s, \"success\":%{public}d, \"error\":%{public, location:escape_only}@, \"type\":%{public, location:escape_only}s}", buf, 0x36u);
      }
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1005686B8;
      v21[3] = &unk_102143668;
      v21[4] = v11;
      v21[5] = a7;
      v14 = v21;
      goto LABEL_29;
    }
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v18 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Sync to/from standalone watch is not supported\"}", buf, 0x12u);
    }
  }
  else
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102143778);
    v15 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Missing identifier\"}", buf, 0x12u);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102143778);
    }
    v16 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      *(_DWORD *)buf = 68289026;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Missing identifier", "{\"msg%{public}.0s\":\"Missing identifier\"}", buf, 0x12u);
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe", a3), "silo");
  -[CLLocationStreamingConnectionManager updateNearbyStatusWithDevices:](self, "updateNearbyStatusWithDevices:", a4);
}

- (RPCompanionLinkClient)rapportLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRapportLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)rapportLinkActive
{
  return self->_rapportLinkActive;
}

- (void)setRapportLinkActive:(BOOL)a3
{
  self->_rapportLinkActive = a3;
}

- (NSMutableDictionary)unacknowledgedMessages
{
  return self->_unacknowledgedMessages;
}

- (void)setUnacknowledgedMessages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)pairIsNearby
{
  return self->_pairIsNearby;
}

- (void)setPairIsNearby:(BOOL)a3
{
  self->_pairIsNearby = a3;
}

@end
