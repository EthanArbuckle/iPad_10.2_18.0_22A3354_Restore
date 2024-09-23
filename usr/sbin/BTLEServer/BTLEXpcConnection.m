@implementation BTLEXpcConnection

- (BTLEXpcConnection)initWithConnection:(id)a3
{
  id v5;
  BTLEXpcConnection *v6;
  BTLEXpcConnection *v7;
  _xpc_connection_s *connection;
  BTLEXpcConnection *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD handler[4];
  BTLEXpcConnection *v16;
  objc_super v17;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006C748();
  v17.receiver = self;
  v17.super_class = (Class)BTLEXpcConnection;
  v6 = -[BTLEXpcConnection init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)&_dispatch_main_q);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100029840;
    handler[3] = &unk_1000AD928;
    v9 = v7;
    v16 = v9;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, "authenticationDidSucceed:", CFSTR("AuthenticationServiceAuthDidSucceedNotification"), 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, "authenticationDidFail:", CFSTR("AuthenticationServiceAuthDidFailNotification"), 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, "peerIsUsingBuiltinService:", CFSTR("PeerIsUsingBuiltinServiceNotification"), 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, "peerIsNotUsingBuiltinService:", CFSTR("PeerIsNotUsingBuiltinServiceNotification"), 0);

  }
  return v7;
}

- (id)bundleIdentifier
{
  __SecTask *v2;
  __SecTask *v3;
  CFStringRef v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  uint64_t v9;
  NSObject *v11;
  uint8_t buf[16];
  audit_token_t token;
  audit_token_t v14;

  memset(&v14, 0, sizeof(v14));
  xpc_connection_get_audit_token(self->_connection, &v14);
  token = v14;
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)token.val = 0;
    v4 = SecTaskCopySigningIdentifier(v2, (CFErrorRef *)&token);
    v5 = (void *)v4;
    if (*(_QWORD *)token.val)
    {
      v6 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to copy signing ID - using framework-provided bundle identifier!", buf, 2u);
      }
      CFRelease(*(CFTypeRef *)token.val);
      if (!v5)
        goto LABEL_12;
      CFRelease(v5);
    }
    else
    {
      if (v4)
        goto LABEL_12;
      v11 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to retrieve signing ID - using framework-provided bundle identifier!", buf, 2u);
      }
    }
    v5 = 0;
LABEL_12:
    CFRelease(v3);
    goto LABEL_13;
  }
  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to allocate security task - using framework-provided bundle identifier!", (uint8_t *)&token, 2u);
  }
  v5 = 0;
LABEL_13:
  if (!objc_msgSend(v5, "length"))
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN-%0000x"), arc4random_uniform(0xFFFFu));
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v5 = (void *)v9;
  }
  return v5;
}

- (void)handleEvent:(id)a3
{
  id v4;
  xpc_type_t type;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[BTLEXpcConnection handleMsg:](self, "handleMsg:", v4);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      -[BTLEXpcConnection handleDisconnection](self, "handleDisconnection");
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006C7AC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006C80C();
  }

}

- (void)handleDisconnection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006C86C(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](BTLEXpcServer, "instance"));
  objc_msgSend(v5, "handleXpcDisconnection:", self);

}

- (void)handleMsg:(id)a3
{
  id v4;
  void *v5;
  const char *string;
  xpc_object_t value;
  void *v8;
  NSString *v9;
  const char *v10;
  id v11;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006C8F8(v5, v4);
  string = xpc_dictionary_get_string(v4, "kMsgId");
  value = xpc_dictionary_get_value(v4, "kMsgArgs");
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("handle%sMsg:"), string));
  v10 = NSSelectorFromString(v9);

  if (xpc_dictionary_expects_reply(v4))
    v11 = v4;
  else
    v11 = v8;
  objc_msgSend(self, v10, v11);

}

- (void)handleConnectOnceMsg:(id)a3
{
  xpc_object_t value;
  id v4;
  void *v5;
  xpc_object_t xuuid;

  value = xpc_dictionary_get_value(a3, "kPeerIdentifier");
  xuuid = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(xuuid));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
  objc_msgSend(v5, "connectOnce:", v4);

}

- (void)handleConnectAlwaysMsg:(id)a3
{
  xpc_object_t value;
  id v4;
  void *v5;
  xpc_object_t xarray;
  _QWORD applier[4];
  id v8;

  value = xpc_dictionary_get_value(a3, "kPeerIdentifiers");
  xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100029D7C;
  applier[3] = &unk_1000AD950;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v8;
  xpc_array_apply(xarray, applier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
  objc_msgSend(v5, "connectAlways:", v4);

}

- (void)handlePersistServerServicesMsg:(id)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = xpc_dictionary_get_BOOL(a3, "kPersist");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ServerServiceManager instance](ServerServiceManager, "instance"));
  objc_msgSend(v4, "setPersist:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  objc_msgSend(v5, "setPersist:", v3);

}

- (void)handleNotifyPiconetClockMsg:(id)a3
{
  id v3;
  uint64_t uint64;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = a3;
  uint64 = xpc_dictionary_get_uint64(v3, "kPiconetClock");
  v5 = xpc_dictionary_get_uint64(v3, "kPiconetPhaseClock");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10[0] = CFSTR("PiconetClockUserInfoKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
  v11[0] = v7;
  v10[1] = CFSTR("PiconetPhaseClockUserInfoKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PiconetClockNotification"), 0, v9);

}

- (void)handleConnectClassicDeviceMsg:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  uint64_t uint64;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kDeviceAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64 = xpc_dictionary_get_uint64(v3, "kQuickDisconnectEnabled");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
  objc_msgSend(v8, "connectDevice:quickDisconnectEnabled:", v5, v7);

}

- (void)handleDisconnectClassicDeviceMsg:(id)a3
{
  id v3;
  const char *string;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v6, "disconnectDevice:", v5);

}

- (void)handleClassicDeviceUnexpectedDisconnectionMsg:(id)a3
{
  id v3;
  const char *string;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v6, "unexpectedDisconnection:", v5);

}

- (void)handleVersionInfoRequestMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  const char *string;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kEasyPairingVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kCloudAccount");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v8, "requestVersionInfo:cloudAccount:", v5, v7);

}

- (void)handleVersionInfoResponseMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t uint64;
  void *v9;
  id v10;

  v3 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kEasyPairingVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kCloudAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64 = xpc_dictionary_get_uint64(v3, "kEasyPairingStatus");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
  objc_msgSend(v10, "respondVersionInfo:cloudAccount:easyPairingStatus:", v5, v7, v9);

}

- (void)handleClassicPairStateRequestMsg:(id)a3
{
  id v3;
  const char *string;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v6, "requestPairStateForDevice:", v5);

}

- (void)handleClassicPairStateResponseMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  const char *string;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kDevicePairState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v8, "respondToPairState:device:", v5, v7);

}

- (void)handleStoreClassicLinkKeyRequestMsg:(id)a3
{
  id v3;
  unsigned __int8 *data;
  unsigned __int8 *v5;
  uint64_t v6;
  void *v7;
  size_t i;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  size_t length;

  v3 = a3;
  length = 0;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kDeviceLinkKey", &length);
  if (length)
  {
    v5 = data;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v7 = (void *)v6;
    if (length)
    {
      for (i = 0; i < length; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5[i]));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v9));

        v7 = v10;
      }
    }
    else
    {
      v10 = (void *)v6;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kDeviceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kDeviceAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v11, "requestStoreLinkKey:name:device:", v10, v13, v15);

  }
}

- (void)handleStoreClassicLinkKeyRequestExtendedMsg:(id)a3
{
  id v3;
  unsigned __int8 *data;
  unsigned __int8 *v5;
  uint64_t v6;
  void *v7;
  size_t i;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  NSNumber *v18;
  void *v19;
  size_t length;

  v3 = a3;
  length = 0;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kDeviceLinkKey", &length);
  if (length)
  {
    v5 = data;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v7 = (void *)v6;
    if (length)
    {
      for (i = 0; i < length; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5[i]));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v9));

        v7 = v10;
      }
    }
    else
    {
      v10 = (void *)v6;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kDeviceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kDeviceAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kDeviceServiceMask"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kClassOfDevice"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v11, "requestStoreLinkKeyExtended:name:device:deviceServiceMask:classOfDevice:", v10, v13, v15, v17, v19);

  }
}

- (void)handleStoreClassicLinkKeyResponseMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  const char *string;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kStoreClassicLinkKeyResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v8, "respondToStoreLinkKey:device:", v5, v7);

}

- (void)handleStoreClassicDeviceSettingsMsg:(id)a3
{
  id v3;
  xpc_object_t value;
  void *v5;
  _UNKNOWN **v6;
  xpc_object_t v7;
  void *v8;
  int64_t v9;
  id v10;
  xpc_object_t v11;
  void *v12;
  int64_t v13;
  xpc_object_t v14;
  void *v15;
  int64_t v16;
  xpc_object_t v17;
  void *v18;
  int64_t v19;
  xpc_object_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  NSString *v41;
  void *v42;
  const char *string;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  xpc_object_t xdict;

  v3 = a3;
  value = xpc_dictionary_get_value(v3, "kClassicDeviceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  v6 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  xdict = v5;
  if (v5)
  {
    v7 = xpc_dictionary_get_value(v5, "kCfgDoubleClickInt");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v48 = v8;
    if (v8)
      v9 = xpc_int64_get_value(v8);
    else
      v9 = 0xFFFFFFFFLL;
    v11 = xpc_dictionary_get_value(xdict, "kCfgClickHold");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v47 = v12;
    if (v12)
      v13 = xpc_int64_get_value(v12);
    else
      v13 = 0xFFFFFFFFLL;
    v14 = xpc_dictionary_get_value(xdict, "kCfgClickHoldInt");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v46 = v15;
    if (v15)
      v16 = xpc_int64_get_value(v15);
    else
      v16 = 0xFFFFFFFFLL;
    v17 = xpc_dictionary_get_value(xdict, "kCfgListenModeCfgs");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v45 = v18;
    if (v18)
      v19 = xpc_int64_get_value(v18);
    else
      v19 = 0xFFFFFFFFLL;
    v20 = xpc_dictionary_get_value(xdict, "kCfgOneBudANCMode");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (v21)
      v23 = xpc_int64_get_value(v21);
    else
      v23 = 0xFFFFFFFFLL;
    v24 = xpc_dictionary_get_value(xdict, "kCfgListenMode");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v25)
      v27 = xpc_int64_get_value(v25);
    else
      v27 = 0xFFFFFFFFLL;
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    if ((_DWORD)v9 != -1)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      objc_msgSend(v10, "setObject:forKey:", v28, CFSTR("kCfgDoubleClickInt"));

    }
    if ((_DWORD)v13 != -1)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
      objc_msgSend(v10, "setObject:forKey:", v29, CFSTR("kCfgClickHold"));

    }
    v6 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
    if ((_DWORD)v16 != -1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
      objc_msgSend(v10, "setObject:forKey:", v30, CFSTR("kCfgClickHoldInt"));

    }
    if ((_DWORD)v19 != -1)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
      objc_msgSend(v10, "setObject:forKey:", v31, CFSTR("kCfgListenModeCfgs"));

    }
    if ((_DWORD)v23 != -1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23));
      objc_msgSend(v10, "setObject:forKey:", v32, CFSTR("kCfgOneBudANCMode"));

    }
    if ((_DWORD)v27 != -1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27));
      objc_msgSend(v10, "setObject:forKey:", v33, CFSTR("kCfgListenMode"));

    }
  }
  else
  {
    v10 = 0;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v35 = objc_msgSend(v6[262], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kClassicDeviceMicMode"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = objc_msgSend(v6[262], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kClassicDeviceInEarEnable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = objc_msgSend(v6[262], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kClassicDeviceDoubleTapMode"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kDeviceName"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v34, "storeDeviceSettings:inEarEnable:doubleTapMode:deviceSettings:deviceName:device:", v36, v38, v40, v10, v42, v44);

}

- (void)handleNotifyPrimaryBudSideMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  const char *string;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kPrimaryBudSide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v8, "notifyPrimaryBudSide:device:", v5, v7);

}

- (void)handleMFiAccessoryAuthMsg:(id)a3
{
  xpc_object_t value;
  id v4;
  void *v5;
  xpc_object_t xuuid;

  value = xpc_dictionary_get_value(a3, "kPeerIdentifier");
  xuuid = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(xuuid));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
  objc_msgSend(v5, "performMFiAuth:", v4);

}

- (void)handlePreWarmMFiAccessoryAuthMsg:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PreWarmMFiAuth : Launch accessoryd", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  objc_msgSend(v4, "launchServer");

}

- (void)handleDOAPDeviceConnectedMsg:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance", a3));
  objc_msgSend(v3, "registerServices");

}

- (void)handleUARPDeviceConnectedMsg:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "UARP device connected", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance"));
  objc_msgSend(v4, "registerServices");

}

- (void)handleUARPAACPTransportChangeMsg:(id)a3
{
  xpc_object_t value;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  value = xpc_dictionary_get_value(a3, "kUARPDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v4));
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006C984(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v7, "addUARPTransportDict:UARPAACPSupported:", v5, v8);

}

- (void)handleUARPDataOverAACPMsg:(id)a3
{
  id v3;
  xpc_object_t value;
  void *v5;
  id v6;
  const void *data;
  void *v8;
  void *v9;
  void *v10;
  size_t length;

  length = 0;
  v3 = a3;
  value = xpc_dictionary_get_value(v3, "kUARPDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
  data = xpc_dictionary_get_data(v3, "kUARPData", &length);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length));
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006CA18(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  objc_msgSend(v10, "relayAACPUARP:uarpMsg:error:", v6, v8, 0);

}

- (void)handleHRMDeviceConnectedMsg:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HRM Classic device connected", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CattManager instance](CattManager, "instance"));
  objc_msgSend(v4, "registerServices");

}

- (void)handleLeaEasyPairRequestMsg:(id)a3
{
  xpc_object_t value;
  void *v4;
  void *v5;
  size_t v6;
  xpc_object_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  xpc_object_t xdict;

  xdict = a3;
  value = xpc_dictionary_get_value(xdict, "kLeaDeviceTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (xpc_array_get_count(v4))
    {
      v6 = 0;
      do
      {
        v7 = xpc_array_get_value(v4, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", xpc_string_get_string_ptr(v8), 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v5, "addObject:", v10);

        ++v6;
      }
      while (v6 < xpc_array_get_count(v4));
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, "kLeaDeviceAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, "kLeaDeviceIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v11, "requestLeaEasyPair:deviceIdentifier:deviceTags:", v13, v15, v5);

  }
}

- (void)handleLeaEasyPairResponseMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  const char *string;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kLeaDevicePairState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kLeaDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v8, "respondToLeaEasyPair:device:", v5, v7);

}

- (void)handleLeaStoreBondingInfoRequestMsg:(id)a3
{
  id v3;
  unsigned __int8 *data;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  void *v8;
  size_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  size_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  size_t k;
  void *v20;
  void *v21;
  void *v22;
  NSNumber *v23;
  void *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  void *v28;
  size_t v29;
  size_t v30;
  size_t length;

  v3 = a3;
  v30 = 0;
  length = 0;
  v29 = 0;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceRand", &length);
  v5 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceLtk", &v30);
  v6 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceIrk", &v29);
  v7 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v8 = (void *)v7;
  if (length)
  {
    for (i = 0; i < length; ++i)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", data[i]));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", v10));

      v8 = v11;
    }
  }
  else
  {
    v11 = (void *)v7;
  }
  v12 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v13 = (void *)v12;
  if (v30)
  {
    for (j = 0; j < v30; ++j)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5[j]));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObject:", v15));

      v13 = v16;
    }
  }
  else
  {
    v16 = (void *)v12;
  }
  v17 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v18 = (void *)v17;
  if (v29)
  {
    for (k = 0; k < v29; ++k)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6[k]));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObject:", v20));

      v18 = v21;
    }
  }
  else
  {
    v21 = (void *)v17;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kLeaDeviceEdiv"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kLeaDeviceName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "kLeaDeviceAddress"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v22, "requestLeaStoreBondingInfo:rand:ltk:irk:name:device:", v24, v11, v16, v21, v26, v28);

}

- (void)handleLeaStoreBondingInfoResponseMsg:(id)a3
{
  id v3;
  NSNumber *v4;
  void *v5;
  const char *string;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](EndpointManager, "instance"));
  v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v3, "kLeaStoreBondingInfoResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kLeaDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v8, "respondToLeaStoreBondingInfo:device:", v5, v7);

}

+ (id)createNSDictionaryFromXpcDictionary:(id)a3
{
  id v3;
  size_t count;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  char *v9;
  _QWORD applier[7];
  _QWORD v12[4];

  v3 = a3;
  count = xpc_dictionary_get_count(v3);
  v5 = 8 * count;
  v6 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v6, 8 * count);
  bzero(v6, 8 * count);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10002B8A8;
  applier[3] = &unk_1000AD978;
  applier[4] = v12;
  applier[5] = v6;
  applier[6] = v6;
  xpc_dictionary_apply(v3, applier);
  v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:count:", v6, v6, count);
  _Block_object_dispose(v12, 8);
  if (count)
  {
    v8 = 8 * count;
    do
    {

      v8 -= 8;
    }
    while (v8);
    v9 = v6 - 8;
    do
    {

      v5 -= 8;
    }
    while (v5);
  }

  return v7;
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  const char *v10;
  void *v11;
  _xpc_connection_s *v12;

  v6 = a4;
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  xpc_dictionary_set_string(v8, "kMsgId", v10);
  if (v6)
  {
    v11 = (void *)_CFXPCCreateXPCObjectFromCFObject(v6);
    xpc_dictionary_set_value(v8, "kMsgArgs", v11);

  }
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006CAD8();
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTLEXpcConnection connection](self, "connection"));
  xpc_connection_send_message(v12, v8);

}

- (void)authenticationDidSucceed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AuthenticationServiceCertClassUserInfoKey")));

    v13[0] = CFSTR("kPeerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msgIdentifier"));
    v13[1] = CFSTR("kCertClass");
    v14[0] = v9;
    v14[1] = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", CFSTR("AuthenticationDidSucceed"), v10);

  }
  else
  {
    v11 = CFSTR("kPeerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msgIdentifier"));
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", CFSTR("AuthenticationDidSucceed"), v9);
  }

}

- (void)authenticationDidFail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v7 = CFSTR("kPeerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgIdentifier"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", CFSTR("AuthenticationDidFail"), v6);

}

- (void)peerIsUsingBuiltinService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v7 = CFSTR("kPeerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgIdentifier"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", CFSTR("PeerIsUsingBuiltinService"), v6);

}

- (void)peerIsNotUsingBuiltinService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v7 = CFSTR("kPeerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgIdentifier"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", CFSTR("PeerIsNotUsingBuiltinService"), v6);

}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
