@implementation CLFenceHandoffConnectionManager

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
  if (qword_10230E200 != -1)
    dispatch_once(&qword_10230E200, &stru_1021AE100);
  return (id)qword_10230E1F8;
}

+ (id)CLFenceHandoffTypetoString:(int64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;

  if (a3)
  {
    if (a3 == 1)
      return CFSTR("CLFenceHandoffTypeBeacon");
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff Please update CLFenceHandoffTypetoString\"}", (uint8_t *)&v6, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v5 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff Please update CLFenceHandoffTypetoString", "{\"msg%{public}.0s\":\"#FenceHandoff Please update CLFenceHandoffTypetoString\"}", (uint8_t *)&v6, 0x12u);
    }
  }
  return CFSTR("CLFenceHandoffTypeGeo");
}

+ (id)getHandoffRegionTypeString:(int)a3
{
  uint64_t v3;

  if (!a3)
  {
    v3 = 1;
    return +[CLFenceHandoffConnectionManager CLFenceHandoffTypetoString:](CLFenceHandoffConnectionManager, "CLFenceHandoffTypetoString:", v3);
  }
  if (a3 == 1)
  {
    v3 = 0;
    return +[CLFenceHandoffConnectionManager CLFenceHandoffTypetoString:](CLFenceHandoffConnectionManager, "CLFenceHandoffTypetoString:", v3);
  }
  return 0;
}

- (id)getRegionFromMessage:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;

  v3 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffDictionaryMessagePayload"));
  v10 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CLCircularRegion, v4), v3, &v10);
  if (v5)
    v6 = v10 == 0;
  else
    v6 = 0;
  if (v6)
    return v5;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff message has no region!\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  }
  v8 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff message has no region!", "{\"msg%{public}.0s\":\"#FenceHandoff message has no region!\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return 0;
}

- (id)getIdentifierFromMessage:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;

  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffDictionaryMessageType")), "intValue") == 6)return 0;
  v11 = 0;
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffDictionaryMessagePayload"));
  v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSString, v6), v5, &v11);
  v8 = v7;
  if (v11 || !v7)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v10 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get primary key", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  return v8;
}

- (id)getDictionaryFromMessage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;

  v14 = 0;
  v3 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffDictionaryMessagePayload"));
  v5 = objc_opt_class(NSDictionary, v4);
  v7 = objc_opt_class(NSString, v6);
  v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v7, objc_opt_class(NSNumber, v8), 0), v3, &v14);
  v10 = v9;
  if (v14 || !v9)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2114;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get handoff tag dictionary\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v12 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2114;
      v20 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get handoff tag dictionary", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get handoff tag dictionary\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  return v10;
}

- (id)getPrimaryKeyFromIdentifier:(id)a3 type:(int64_t)a4
{
  id v5;
  id v6;

  v5 = +[CLFenceHandoffConnectionManager CLFenceHandoffTypetoString:](CLFenceHandoffConnectionManager, "CLFenceHandoffTypetoString:", a4);
  v6 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v5, &stru_1021D8FB8, 0, 0, objc_msgSend(a3, "length"));
  return v6;
}

+ (BOOL)isSupported
{
  if (qword_10230E210 != -1)
    dispatch_once(&qword_10230E210, &stru_1021AE120);
  return byte_10230E208;
}

- (CLFenceHandoffConnectionManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceHandoffConnectionManager;
  return -[CLFenceHandoffConnectionManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLFenceHandoffConnectionManagerServiceProtocol, &OBJC_PROTOCOL___CLFenceHandoffConnectionManagerClientProtocol);
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
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  objc_msgSend(a3, "suspend");
  v8.receiver = self;
  v8.super_class = (Class)CLFenceHandoffConnectionManager;
  -[CLFenceHandoffConnectionManager setSilo:](&v8, "setSilo:", a3);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1012FD228;
  v7[3] = &unk_1021436B8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.location.fencehandoff"), v7);
}

- (void)beginService
{
  objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo");
  -[CLFenceHandoffConnectionManager setLocationManager:](self, "setLocationManager:", objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/LocationFenceSync.bundle"), self, objc_msgSend(objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo"), "queue")));
  -[CLFenceHandoffConnectionManager setReceivingEndUnacknowledgedMessages:](self, "setReceivingEndUnacknowledgedMessages:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[IDSService addDelegate:queue:](-[CLFenceHandoffConnectionManager service](self, "service"), "addDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo"), "queue"));
  -[CLFenceHandoffConnectionManager setUnacknowledgedMessages:](self, "setUnacknowledgedMessages:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLFenceHandoffConnectionManager updateActiveDeviceId:](self, "updateActiveDeviceId:", -[IDSService devices](-[CLFenceHandoffConnectionManager service](self, "service"), "devices"));
}

- (void)endService
{
  _QWORD v3[5];

  objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo");
  -[CLFenceHandoffConnectionManager setService:](self, "setService:", 0);
  -[CLFenceHandoffConnectionManager setUnacknowledgedMessages:](self, "setUnacknowledgedMessages:", 0);
  -[CLFenceHandoffConnectionManager setReceivingEndUnacknowledgedMessages:](self, "setReceivingEndUnacknowledgedMessages:", 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1012FD5E8;
  v3[3] = &unk_10212BB58;
  v3[4] = -[CLFenceHandoffConnectionManager locationManager](self, "locationManager");
  objc_msgSend(objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo"), "async:", v3);
  -[CLFenceHandoffConnectionManager setLocationManager:](self, "setLocationManager:", 0);
  -[CLFenceHandoffConnectionManager setActiveDeviceId:](self, "setActiveDeviceId:", 0);
}

- (BOOL)isActiveDeviceNearby
{
  return self->_activeDeviceId != 0;
}

- (id)defaultIDSOptions
{
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = IDSSendMessageOptionTimeoutKey;
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout);
  v4[1] = &__kCFBooleanTrue;
  v3[1] = IDSSendMessageOptionEncryptPayloadKey;
  v3[2] = IDSSendMessageOptionRequireBluetoothKey;
  v4[2] = &__kCFBooleanTrue;
  return -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3), "mutableCopy");
}

- (id)getResponseDictionary:(id)a3 forMessage:(id)a4
{
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("kCLFenceHandoffResponseDictionaryIDSIdentifierKey");
  v5[1] = CFSTR("kCLFenceHandoffResponseDictionaryMessageKey");
  v6[0] = a3;
  v6[1] = a4;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
}

- (int)covertRegionStateToFenceStatus:(int64_t)a3
{
  int v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = -1;
  if (a3 == 1)
    return 0;
  else
    return v3;
}

- (void)sendMessage:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSData *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  IDSService *v23;
  NSMutableDictionary *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo");
  if (!-[CLFenceHandoffConnectionManager isActiveDeviceNearby](self, "isActiveDeviceNearby"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v7 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
      return;
    *(_DWORD *)buf = 68289026;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v8 = "{\"msg%{public}.0s\":\"#FenceHandoff there is no active device nearby\"}";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEBUG;
    v11 = 18;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
    return;
  }
  if (!objc_msgSend(a3, "messageType"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff message has no messageType!\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v13 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v14 = "#FenceHandoff message has no messageType!";
      v15 = "{\"msg%{public}.0s\":\"#FenceHandoff message has no messageType!\"}";
      v16 = v13;
      v17 = 18;
LABEL_31:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v14, v15, buf, v17);
      return;
    }
    return;
  }
  if (!objc_msgSend(a3, "payload")
    && objc_msgSend(a3, "messageType") != (id)3
    && objc_msgSend(a3, "messageType") != (id)9)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v31 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v32 = objc_msgSend(a3, "payload");
      objc_msgSend(a3, "messageType");
      *(_DWORD *)buf = 68289539;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2113;
      v44 = v32;
      v45 = 2050;
      v46 = objc_msgSend(a3, "messageType");
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff message has no payload!\", \"payload\":%{private, location:escape_only}@, \"message type\":%{public, location:CLGeoFenceHandoffMessageType}lld}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v33 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v34 = objc_msgSend(a3, "payload");
      objc_msgSend(a3, "messageType");
      v35 = objc_msgSend(a3, "messageType");
      *(_DWORD *)buf = 68289539;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2113;
      v44 = v34;
      v45 = 2050;
      v46 = v35;
      v14 = "#FenceHandoff message has no payload!";
      v15 = "{\"msg%{public}.0s\":\"#FenceHandoff message has no payload!\", \"payload\":%{private, location:escape_only}"
            "@, \"message type\":%{public, location:CLGeoFenceHandoffMessageType}lld}";
      v16 = v33;
      v17 = 38;
      goto LABEL_31;
    }
    return;
  }
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "messageType")), CFSTR("kCLFenceHandoffDictionaryMessageType"));
  if (objc_msgSend(a3, "messageType") == (id)3 || objc_msgSend(a3, "messageType") == (id)9)
    v6 = objc_msgSend(a3, "primaryKey");
  else
    v6 = objc_msgSend(a3, "payload");
  v38 = 0;
  v18 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v38);
  if (v38)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v19 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2114;
      v44 = v38;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v20 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289282;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v43 = 2114;
      v44 = v38;
      v14 = "#FenceHandoff unable to archive to send";
      v15 = "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}";
LABEL_30:
      v16 = v20;
      v17 = 28;
      goto LABEL_31;
    }
    return;
  }
  objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("kCLFenceHandoffDictionaryMessagePayload"));
  v21 = -[CLFenceHandoffConnectionManager defaultIDSOptions](self, "defaultIDSOptions");
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionExpectsPeerResponseKey);
  v22 = objc_msgSend(a3, "primaryKey");
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, IDSSendMessageOptionQueueOneIdentifierKey);
  v37 = 0;
  v23 = -[CLFenceHandoffConnectionManager service](self, "service");
  if (!-[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v23, "sendMessage:toDestinations:priority:options:identifier:error:", v5, +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice), 200, v21, &v37, &v38))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v25 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return;
    v29 = objc_msgSend(v37, "UTF8String");
    objc_msgSend(a3, "messageType");
    v30 = objc_msgSend(a3, "messageType");
    *(_DWORD *)buf = 68289794;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v43 = 2082;
    v44 = v29;
    v45 = 2050;
    v46 = v30;
    v47 = 2114;
    v48 = v38;
    v8 = "{\"msg%{public}.0s\":\"#Warn #FenceHandoff failed to send message to IDS\", \"identifier\":%{public, location:e"
         "scape_only}s, \"action\":%{public, location:CLGeoFenceHandoffMessageType}lld, \"Error\":%{public, location:escape_only}@}";
    goto LABEL_43;
  }
  if (v37)
  {
    v24 = -[CLFenceHandoffConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", a3, v37);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v25 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return;
    v26 = objc_msgSend(v37, "UTF8String");
    objc_msgSend(a3, "messageType");
    v27 = objc_msgSend(a3, "messageType");
    v28 = objc_msgSend(a3, "primaryKey");
    *(_DWORD *)buf = 68289794;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v43 = 2082;
    v44 = v26;
    v45 = 2050;
    v46 = v27;
    v47 = 2114;
    v48 = v28;
    v8 = "{\"msg%{public}.0s\":\"#FenceHandoff successfully requested to IDS to send a message\", \"identifier\":%{public"
         ", location:escape_only}s, \"action\":%{public, location:CLGeoFenceHandoffMessageType}lld, \"message\":%{public,"
         " location:escape_only}@}";
LABEL_43:
    v9 = v25;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 48;
    goto LABEL_13;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v36 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289282;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v43 = 2114;
    v44 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff sent message to IDS successfully but we received no identifier!\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  }
  v20 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    *(_DWORD *)buf = 68289282;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v43 = 2114;
    v44 = v38;
    v14 = "#FenceHandoff sent message to IDS successfully but we received no identifier!";
    v15 = "{\"msg%{public}.0s\":\"#FenceHandoff sent message to IDS successfully but we received no identifier!\", \"erro"
          "r\":%{public, location:escape_only}@}";
    goto LABEL_30;
  }
}

- (void)responseWithAck:(id)a3 forMessage:(id)a4
{
  id v7;
  signed int v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSData *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  NSData *v20;
  const __CFString *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;

  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffDictionaryMessagePayload")), CFSTR("kCLFenceHandoffDictionaryMessagePayload"));
  v8 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffDictionaryMessageType")), "intValue");
  v9 = (void *)v8;
  switch(v8)
  {
    case 1:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10221D268, CFSTR("kCLFenceHandoffDictionaryMessageType"));
      v10 = -[CLFenceHandoffConnectionManager getRegionFromMessage:](self, "getRegionFromMessage:", a4);
      if (v10)
      {
        v26 = 0;
        v11 = objc_msgSend(objc_msgSend(v10, "identifier"), "copy");
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021AE160);
        v12 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2082;
          v32 = objc_msgSend(v11, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff sending ack with primary key\", \"primaryKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
        v13 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v26);
        if (!v26)
        {
          v20 = v13;
          v21 = CFSTR("kCLFenceHandoffDictionaryMessagePayload");
          goto LABEL_32;
        }
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021AE160);
        v14 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289282;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2114;
          v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021AE160);
        }
        v15 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          *(_DWORD *)buf = 68289282;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2114;
          v32 = v26;
          v16 = "#FenceHandoff unable to archive to send";
          v17 = "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}";
          goto LABEL_22;
        }
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021AE160);
        v23 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289282;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2082;
          v32 = objc_msgSend(a3, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to send ack\", \"idsIdentifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021AE160);
        }
        v24 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          v25 = objc_msgSend(a3, "UTF8String");
          *(_DWORD *)buf = 68289282;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2082;
          v32 = v25;
          v16 = "#FenceHandoff unable to send ack";
          v17 = "{\"msg%{public}.0s\":\"#FenceHandoff unable to send ack\", \"idsIdentifier\":%{public, location:escape_only}s}";
          v19 = v24;
          goto LABEL_41;
        }
      }
      return;
    case 3:
      v20 = (NSData *)&off_10221D280;
      goto LABEL_31;
    case 5:
      v20 = (NSData *)&off_10221D2B0;
      goto LABEL_31;
    case 7:
      v20 = (NSData *)&off_10221D298;
      goto LABEL_31;
    case 9:
      v20 = (NSData *)&off_10221D2C8;
      goto LABEL_31;
    case 11:
      v20 = (NSData *)&off_10221D2E0;
      goto LABEL_31;
    case 13:
      v20 = (NSData *)&off_10221D2F8;
      goto LABEL_31;
    case 15:
      v20 = (NSData *)&off_10221D310;
      goto LABEL_31;
    case 17:
      v20 = (NSData *)&off_10221D328;
LABEL_31:
      v21 = CFSTR("kCLFenceHandoffDictionaryMessageType");
LABEL_32:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v21);
      v22 = -[CLFenceHandoffConnectionManager defaultIDSOptions](self, "defaultIDSOptions");
      objc_msgSend(v22, "setObject:forKeyedSubscript:", a3, IDSSendMessageOptionPeerResponseIdentifierKey);
      -[CLFenceHandoffConnectionManager sendDictionaryMessage:withOptions:](self, "sendDictionaryMessage:withOptions:", v7, v22);
      break;
    default:
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      v18 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v28 = 0;
        v29 = 2082;
        v30 = "";
        v31 = 2050;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff unknown message type ack!\", \"messageType\":%{public, location:CLGeoFenceHandoffMessageType}lld}", buf, 0x1Cu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      }
      v15 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289282;
        v28 = 0;
        v29 = 2082;
        v30 = "";
        v31 = 2050;
        v32 = v9;
        v16 = "#FenceHandoff unknown message type ack!";
        v17 = "{\"msg%{public}.0s\":\"#FenceHandoff unknown message type ack!\", \"messageType\":%{public, location:CLGeo"
              "FenceHandoffMessageType}lld}";
LABEL_22:
        v19 = v15;
LABEL_41:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x1Cu);
      }
      break;
  }
}

- (void)sendDictionaryMessage:(id)a3 withOptions:(id)a4
{
  IDSService *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;

  if (-[CLFenceHandoffConnectionManager isActiveDeviceNearby](self, "isActiveDeviceNearby"))
  {
    v15 = 0;
    v16 = 0;
    v7 = -[CLFenceHandoffConnectionManager service](self, "service");
    if ((-[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v7, "sendMessage:toDestinations:priority:options:identifier:error:", a3, +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice), 200, a4, &v15, &v16) & 1) == 0)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(v15, "UTF8String");
        *(_DWORD *)buf = 68289538;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2082;
        v22 = v9;
        v23 = 2114;
        v24 = v16;
        v10 = "{\"msg%{public}.0s\":\"#Warn #FenceHandoff failed to send message IDS\", \"identifier\":%{public, location"
              ":escape_only}s, \"Error\":%{public, location:escape_only}@}";
        v11 = v8;
        v12 = OS_LOG_TYPE_DEFAULT;
        v13 = 38;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v10 = "{\"msg%{public}.0s\":\"#FenceHandoff there is no active device nearby\"}";
      v11 = v14;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 18;
      goto LABEL_11;
    }
  }
}

- (void)updateActiveDeviceId:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  _BYTE v29[128];

  v5 = -[NSString copy](-[NSUUID UUIDString](-[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId"), "UUIDString"), "copy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(a3);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      if (objc_msgSend(v10, "isNearby"))
      {
        if (objc_msgSend(v10, "isConnected"))
          break;
      }
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v11 = objc_msgSend(v10, "nsuuid");
    if (!v5)
      goto LABEL_19;
  }
  else
  {
LABEL_10:
    v11 = 0;
    if (!v5)
      goto LABEL_19;
  }
  if ((objc_msgSend(objc_msgSend(v11, "UUIDString"), "isEqualToString:", v5) & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (const char *)objc_msgSend(v5, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff device disconnected\", \"inactive\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    -[CLFenceHandoffConnectionManager setActiveDeviceId:](self, "setActiveDeviceId:", 0);
    -[CLFenceHandoffConnectionManager disableHandoffDictionaryForDeviceId:](self, "disableHandoffDictionaryForDeviceId:", v5);
  }
LABEL_19:
  if (v11)
  {
    -[CLFenceHandoffConnectionManager setActiveDeviceId:](self, "setActiveDeviceId:", v11);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      v15 = -[NSString UTF8String](-[NSUUID UUIDString](-[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId"), "UUIDString"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff nearby devices changed\", \"activeId\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    if (-[CLFenceHandoffConnectionManager isActiveDeviceNearby](self, "isActiveDeviceNearby"))
    {
      v16 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1012FEBF0;
      block[3] = &unk_10212BB58;
      block[4] = self;
      dispatch_after(v16, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo"), "queue"), block);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v17 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff no devices found nearby\"}", buf, 0x12u);
    }
  }
}

- (void)handleAddingFenceOnCompanion:(id)a3 withContext:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  NSUUID *v10;
  NSUUID *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  id v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  unsigned int v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  unsigned int v33;
  id v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  id v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  unint64_t v46;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff handleAddingFenceOnCompanion\"}", buf, 0x12u);
  }
  v8 = -[CLFenceHandoffConnectionManager getRegionFromMessage:](self, "getRegionFromMessage:", a3);
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v8, "type") == 1)
    {
      v10 = -[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId");
      if (v10)
      {
        v11 = v10;
        v12 = objc_alloc_init((Class)NSMutableString);
        objc_msgSend(v12, "appendFormat:", CFSTR("%@"), -[NSUUID UUIDString](v11, "UUIDString"));
        objc_msgSend(v12, "appendFormat:", CFSTR("%@"), objc_msgSend(v9, "identifier"));
        if (objc_msgSend(v9, "type") == 1)
        {
          v32 = a4;
          v38 = objc_alloc((Class)CLCircularRegion);
          objc_msgSend(v9, "geoCenter");
          v14 = v13;
          v16 = v15;
          objc_msgSend(v9, "geoRadius");
          v18 = v17;
          v37 = objc_msgSend(v9, "geoReferenceFrame");
          v36 = objc_msgSend(v9, "allowMonitoringWhileNearby");
          v35 = objc_msgSend(v9, "isLowPower");
          v34 = objc_msgSend(v9, "onBehalfOfBundleId");
          v33 = objc_msgSend(v9, "notifyOnEntry");
          v19 = objc_msgSend(v9, "notifyOnExit");
          v20 = objc_msgSend(v9, "conservativeEntry");
          BYTE2(v31) = objc_msgSend(v9, "emergency");
          BYTE1(v31) = v20;
          LOBYTE(v31) = v19;
          v21 = objc_msgSend(v38, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:", v37, v36, v35, v12, v34, v33, v14, v16, v18, v31, v11, objc_msgSend(v9, "handoffTag"));
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021AE160);
          v22 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
          {
            v23 = -[NSString UTF8String](-[NSUUID UUIDString](v11, "UUIDString"), "UTF8String");
            *(_DWORD *)buf = 68289538;
            v40 = 0;
            v41 = 2082;
            v42 = "";
            v43 = 2114;
            v44 = v21;
            v45 = 2082;
            v46 = (unint64_t)v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff Adding region from watch\", \"region\":%{public, location:escape_only}@, \"deviceId\":%{public, location:escape_only}s}", buf, 0x26u);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "setObject:forKeyedSubscript:", -[CLFenceHandoffConnectionManager getResponseDictionary:forMessage:](self, "getResponseDictionary:forMessage:", objc_msgSend(v32, "outgoingResponseIdentifier"), a3), v12);
          -[CLLocationManager startMonitoringForRegion:](-[CLFenceHandoffConnectionManager locationManager](self, "locationManager"), "startMonitoringForRegion:", v21);

        }
        return;
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      v30 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        v40 = 0;
        v41 = 2082;
        v42 = "";
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff handleAddingFenceOnCompanion: deviceId is nil\"}", buf, 0x12u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      }
      v25 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289026;
        v40 = 0;
        v41 = 2082;
        v42 = "";
        v26 = "#FenceHandoff handleAddingFenceOnCompanion: deviceId is nil";
        v27 = "{\"msg%{public}.0s\":\"#FenceHandoff handleAddingFenceOnCompanion: deviceId is nil\"}";
        goto LABEL_32;
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      v28 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "type");
        v29 = objc_msgSend(v9, "type");
        *(_DWORD *)buf = 68289539;
        v40 = 0;
        v41 = 2082;
        v42 = "";
        v43 = 2113;
        v44 = v9;
        v45 = 2050;
        v46 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff Not a Geographic region\", \"region\":%{private, location:escape_only}@, \"type\":%{public, location:CLClientRegionType}lld}", buf, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v24 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff companion got a nil region for monitoring\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v25 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v26 = "#FenceHandoff companion got a nil region for monitoring";
      v27 = "{\"msg%{public}.0s\":\"#FenceHandoff companion got a nil region for monitoring\"}";
LABEL_32:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v26, v27, buf, 0x12u);
    }
  }
}

- (void)handleRemovingFenceOnCompanion:(id)a3 withContext:(id)a4
{
  NSUUID *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  dispatch_time_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[6];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  v7 = -[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId");
  v8 = -[CLFenceHandoffConnectionManager getIdentifierFromMessage:](self, "getIdentifierFromMessage:", a3);
  if (v8)
  {
    v9 = v8;
    v10 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), -[NSUUID UUIDString](v7, "UUIDString"));
    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v9);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = objc_msgSend(v10, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff remove fence\", \"primaryKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    v12 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", 0.0, 0.0);
    v13 = objc_alloc((Class)CLCircularRegion);
    objc_msgSend(v12, "coordinate");
    v14 = objc_msgSend(v13, "initNearbyAllowedWithCenter:radius:identifier:", v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "setObject:forKeyedSubscript:", -[CLFenceHandoffConnectionManager getResponseDictionary:forMessage:](self, "getResponseDictionary:forMessage:", objc_msgSend(a4, "outgoingResponseIdentifier"), a3), v10);
    -[CLLocationManager stopMonitoringForRegion:](-[CLFenceHandoffConnectionManager locationManager](self, "locationManager"), "stopMonitoringForRegion:", v14);
    v15 = dispatch_time(0, 30000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1012FF578;
    block[3] = &unk_10212BB30;
    block[4] = self;
    block[5] = v10;
    dispatch_after(v15, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo"), "queue"), block);

  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v16 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary for deletion\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v17 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get primary for deletion", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary for deletion\"}", buf, 0x12u);
    }
  }
}

- (void)handleGetRegionStateOnCompanion:(id)a3
{
  NSUUID *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  v5 = -[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId");
  v6 = -[CLFenceHandoffConnectionManager getIdentifierFromMessage:](self, "getIdentifierFromMessage:", a3);
  if (v6)
  {
    v7 = v6;
    v8 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v8, "appendFormat:", CFSTR("%@"), -[NSUUID UUIDString](v5, "UUIDString"));
    objc_msgSend(v8, "appendFormat:", CFSTR("%@"), v7);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = objc_msgSend(v8, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff get Region state\", \"primaryKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    v10 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", 0.0, 0.0);
    v11 = objc_alloc((Class)CLCircularRegion);
    objc_msgSend(v10, "coordinate");
    v12 = objc_msgSend(v11, "initNearbyAllowedWithCenter:radius:identifier:", v8);
    -[CLLocationManager requestStateForRegion:](-[CLFenceHandoffConnectionManager locationManager](self, "locationManager"), "requestStateForRegion:", v12);

  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v13 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key for Region state\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v14 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get primary key for Region state", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key for Region state\"}", buf, 0x12u);
    }
  }
}

- (void)handleHandoffTagsOnCompanion:(id)a3 forDeviceID:(id)a4
{
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = objc_msgSend(a4, "UUIDString");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff handleHandoffTagsOnCompanion\", \"deviceID\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  if (a4)
    -[CLLocationManager changeFencesStateMatchingHandoffTags:forDeviceID:completion:](-[CLFenceHandoffConnectionManager locationManager](self, "locationManager"), "changeFencesStateMatchingHandoffTags:forDeviceID:completion:", -[CLFenceHandoffConnectionManager getDictionaryFromMessage:](self, "getDictionaryFromMessage:", a3), a4, &stru_1021AE140);
}

- (void)disableHandoffDictionaryForDeviceId:(id)a3
{
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = objc_msgSend(a3, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff sending dummy handoff dictionary\", \"inactiveDeviceId\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("inactive"), a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1012FFF1C;
  v7[3] = &unk_102143618;
  v7[4] = a3;
  -[CLLocationManager changeFencesStateMatchingHandoffTags:forDeviceID:completion:](-[CLFenceHandoffConnectionManager locationManager](self, "locationManager"), "changeFencesStateMatchingHandoffTags:forDeviceID:completion:", v6, objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", a3), v7);
}

- (void)getHandoffTags
{
  NSObject *v3;
  CLFenceHandoffMessage *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff getHandoffTags\"}", (uint8_t *)v5, 0x12u);
  }
  v4 = objc_alloc_init(CLFenceHandoffMessage);
  -[CLFenceHandoffMessage setMessageType:](v4, "setMessageType:", 7);
  -[CLFenceHandoffMessage setPayload:](v4, "setPayload:", &off_10221D340);
  -[CLFenceHandoffConnectionManager sendMessage:](self, "sendMessage:", v4);
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 68289539;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = a4;
    v16 = 2082;
    v17 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff region monitoring started\", \"region\":%{private, location:escape_only}@, \"regionIdentifier\":%{public, location:escape_only}s}", (uint8_t *)&v10, 0x26u);
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "objectForKeyedSubscript:", objc_msgSend(a4, "identifier")))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
      v10 = 68289282;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff didStartMonitoringForRegion found key in unacknowledged messages\", \"primaryKey\":%{public, location:escape_only}s}", (uint8_t *)&v10, 0x1Cu);
    }
    v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "objectForKeyedSubscript:", objc_msgSend(a4, "identifier"));
    -[CLFenceHandoffConnectionManager responseWithAck:forMessage:](self, "responseWithAck:forMessage:", objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffResponseDictionaryIDSIdentifierKey")), objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCLFenceHandoffResponseDictionaryMessageKey")));
    -[NSMutableDictionary removeObjectForKey:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "removeObjectForKey:", objc_msgSend(a4, "identifier"));
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
  {
    v11 = 68289795;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    v17 = 2113;
    v18 = a4;
    v19 = 2082;
    v20 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff region monitoring failed to start\", \"regionIdentifier\":%{public, location:escape_only}s, \"region\":%{private, location:escape_only}@, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x30u);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  }
  v8 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    v9 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    v10 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    v11 = 68289795;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = v9;
    v17 = 2113;
    v18 = a4;
    v19 = 2082;
    v20 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff region monitoring failed to start", "{\"msg%{public}.0s\":\"#FenceHandoff region monitoring failed to start\", \"regionIdentifier\":%{public, location:escape_only}s, \"region\":%{private, location:escape_only}@, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x30u);
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 68289283;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff didEnterRegion\", \"Region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
  }
  if (-[CLFenceHandoffConnectionManager isCurrentActiveDevice:](self, "isCurrentActiveDevice:", objc_msgSend(a4, "deviceId")))
  {
    -[CLFenceHandoffConnectionManager sendRegionEvent:forRegion:](self, "sendRegionEvent:forRegion:", 11, a4);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff ignoring entry notification\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 68289283;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff didExitRegion\", \"Region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
  }
  if (-[CLFenceHandoffConnectionManager isCurrentActiveDevice:](self, "isCurrentActiveDevice:", objc_msgSend(a4, "deviceId")))
  {
    -[CLFenceHandoffConnectionManager sendRegionEvent:forRegion:](self, "sendRegionEvent:forRegion:", 13, a4);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff ignoring exit notification\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  NSObject *v8;
  CLFenceHandoffConnectionManager *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 68289283;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2113;
    v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff didDetermineState:forRegion:\", \"Region\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
  }
  if (-[CLFenceHandoffConnectionManager isCurrentActiveDevice:](self, "isCurrentActiveDevice:", objc_msgSend(a5, "deviceId")))
  {
    if (a4 == 2)
    {
      v9 = self;
      v10 = 17;
      goto LABEL_14;
    }
    if (a4 == 1)
    {
      v9 = self;
      v10 = 15;
LABEL_14:
      -[CLFenceHandoffConnectionManager sendRegionEvent:forRegion:](v9, "sendRegionEvent:forRegion:", v10, a5);
      return;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v13 = objc_msgSend(objc_msgSend(a5, "identifier"), "UTF8String");
      v16 = 68289538;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = v13;
      v22 = 2050;
      v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff unknown region state\", \"region\":%{public, location:escape_only}s, \"state\":%{public, location:CLRegionState}lld}", (uint8_t *)&v16, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v14 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v15 = objc_msgSend(objc_msgSend(a5, "identifier"), "UTF8String");
      v16 = 68289538;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = v15;
      v22 = 2050;
      v23 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unknown region state", "{\"msg%{public}.0s\":\"#FenceHandoff unknown region state\", \"region\":%{public, location:escape_only}s, \"state\":%{public, location:CLRegionState}lld}", (uint8_t *)&v16, 0x26u);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 68289283;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff ignoring did determine state notification\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if ((a4 - 3) <= 1)
    -[CLFenceHandoffConnectionManager getHandoffTags](self, "getHandoffTags", a3);
}

- (BOOL)isCurrentActiveDevice:(id)a3
{
  unsigned int v5;

  v5 = -[CLFenceHandoffConnectionManager isActiveDeviceNearby](self, "isActiveDeviceNearby");
  if (v5)
    LOBYTE(v5) = -[NSUUID isEqual:](-[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId"), "isEqual:", a3);
  return v5;
}

- (void)sendRegionEvent:(int64_t)a3 forRegion:(id)a4
{
  CLFenceHandoffMessage *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;

  if (objc_msgSend(a4, "type") == 1)
  {
    v7 = objc_alloc_init(CLFenceHandoffMessage);
    v27 = objc_msgSend(objc_msgSend(a4, "identifier"), "stringByReplacingOccurrencesOfString:withString:", -[NSUUID UUIDString](-[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId"), "UUIDString"), &stru_1021D8FB8);
    v26 = objc_alloc((Class)CLCircularRegion);
    objc_msgSend(a4, "center");
    v9 = v8;
    v11 = v10;
    objc_msgSend(a4, "radius");
    v13 = v12;
    v14 = objc_msgSend(a4, "geoReferenceFrame");
    v15 = objc_msgSend(a4, "allowMonitoringWhileNearby");
    v16 = objc_msgSend(a4, "isLowPower");
    v17 = objc_msgSend(a4, "notifyOnEntry");
    v18 = objc_msgSend(a4, "notifyOnExit");
    v19 = objc_msgSend(a4, "conservativeEntry");
    BYTE2(v25) = objc_msgSend(a4, "emergency");
    BYTE1(v25) = v19;
    LOBYTE(v25) = v18;
    v20 = objc_msgSend(v26, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:", v14, v15, v16, v27, 0, v17, v9, v11, v13, v25);
    -[CLFenceHandoffMessage setMessageType:](v7, "setMessageType:", a3);
    -[CLFenceHandoffMessage setPayload:](v7, "setPayload:", v20);
    -[CLFenceHandoffConnectionManager sendMessage:](self, "sendMessage:", v7);
    v21 = v20;
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(a4, "type");
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2050;
      v33 = objc_msgSend(a4, "type");
      v34 = 2113;
      v35 = a4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff Only Circular Region are supported\", \"type\":%{public, location:CLClientRegionType}lld, \"region\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    }
    v23 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      objc_msgSend(a4, "type");
      v24 = objc_msgSend(a4, "type");
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2050;
      v33 = v24;
      v34 = 2113;
      v35 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff Only Circular Region are supported", "{\"msg%{public}.0s\":\"#FenceHandoff Only Circular Region are supported\", \"type\":%{public, location:CLClientRegionType}lld, \"region\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  dispatch_time_t v11;
  _QWORD v12[8];

  objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe", a3, a4), "silo");
  if (-[CLFenceHandoffConnectionManager isActiveDeviceNearby](self, "isActiveDeviceNearby"))
    v11 = 0;
  else
    v11 = 3000000000;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_101301040;
  v12[3] = &unk_102150F38;
  v12[4] = self;
  v12[5] = a5;
  v12[6] = a7;
  v12[7] = a6;
  dispatch_after(v11, (dispatch_queue_t)objc_msgSend(-[CLFenceHandoffConnectionManager silo](self, "silo"), "queue"), v12);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  NSObject *v13;
  const char *v14;
  id v15;
  id v16;
  NSObject *v17;
  dispatch_time_t v18;
  _QWORD v19[6];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v10 = a6;
  objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe", a3, a4), "silo");
  if (v10)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021AE160);
    v13 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290050;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = objc_msgSend(a5, "UTF8String");
      v26 = 1026;
      v27 = 1;
      v28 = 2114;
      v29 = a7;
      v30 = 2114;
      v31 = a8;
      v14 = "{\"msg%{public}.0s\":\"#FenceHandoff did send message to IDS to be delivered\", \"identifier\":%{public, loc"
            "ation:escape_only}s, \"success\":%{public}hhd, \"error\":%{public, location:escape_only}@, \"context\":%{pub"
            "lic, location:escape_only}@}";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x36u);
    }
  }
  else
  {
    v15 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLFenceHandoffConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages"), "objectForKeyedSubscript:", a5);
    if (v15)
    {
      v16 = v15;
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      v17 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68290050;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2082;
        v25 = objc_msgSend(a5, "UTF8String");
        v26 = 1026;
        v27 = 0;
        v28 = 2114;
        v29 = a7;
        v30 = 2114;
        v31 = a8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff resending message again\", \"identifier\":%{public, location:escape_only}s, \"success\":%{public}hhd, \"error\":%{public, location:escape_only}@, \"context\":%{public, location:escape_only}@}", buf, 0x36u);
      }
      v18 = dispatch_time(0, 300000000000);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_101301D48;
      v19[3] = &unk_10212BB30;
      v19[4] = self;
      v19[5] = v16;
      dispatch_after(v18, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo"), "queue"), v19);
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021AE160);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290050;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2082;
        v25 = objc_msgSend(a5, "UTF8String");
        v26 = 1026;
        v27 = 0;
        v28 = 2114;
        v29 = a7;
        v30 = 2114;
        v31 = a8;
        v14 = "{\"msg%{public}.0s\":\"#FenceHandoff old message queued by IDS failed\", \"identifier\":%{public, location"
              ":escape_only}s, \"success\":%{public}hhd, \"error\":%{public, location:escape_only}@, \"context\":%{public"
              ", location:escape_only}@}";
        goto LABEL_16;
      }
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021AE160);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff nearby devices changed\"}", (uint8_t *)v7, 0x12u);
  }
  -[CLFenceHandoffConnectionManager updateActiveDeviceId:](self, "updateActiveDeviceId:", a4);
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)unacknowledgedMessages
{
  return self->_unacknowledgedMessages;
}

- (void)setUnacknowledgedMessages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSUUID)activeDeviceId
{
  return self->_activeDeviceId;
}

- (void)setActiveDeviceId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableDictionary)receivingEndUnacknowledgedMessages
{
  return self->_receivingEndUnacknowledgedMessages;
}

- (void)setReceivingEndUnacknowledgedMessages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
