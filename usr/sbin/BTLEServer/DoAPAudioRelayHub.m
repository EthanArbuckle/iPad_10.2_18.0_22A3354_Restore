@implementation DoAPAudioRelayHub

- (DoAPAudioRelayHub)init
{
  DoAPAudioRelayHub *v2;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcServer;
  OS_xpc_object *siriXpcConnection;
  OS_xpc_object *soundSensorXpcConnection;
  uint64_t v7;
  NSHashTable *doapAudioRelays;
  _xpc_connection_s *v9;
  DoAPAudioRelayHub *v10;
  _xpc_connection_s *v11;
  _QWORD handler[4];
  DoAPAudioRelayHub *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DoAPAudioRelayHub;
  v2 = -[DoAPAudioRelayHub init](&v15, "init");
  if (v2)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.BTLEAudioController.xpc", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = mach_service;

    siriXpcConnection = v2->_siriXpcConnection;
    v2->_siriXpcConnection = 0;

    soundSensorXpcConnection = v2->_soundSensorXpcConnection;
    v2->_soundSensorXpcConnection = 0;

    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    doapAudioRelays = v2->_doapAudioRelays;
    v2->_doapAudioRelays = (NSHashTable *)v7;

    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub xpcServer](v2, "xpcServer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002C64C;
    handler[3] = &unk_1000AD928;
    v10 = v2;
    v14 = v10;
    xpc_connection_set_event_handler(v9, handler);

    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub xpcServer](v10, "xpcServer"));
    xpc_connection_resume(v11);

  }
  return v2;
}

+ (id)instance
{
  if (qword_1000C9080 != -1)
    dispatch_once(&qword_1000C9080, &stru_1000AD9B8);
  return (id)qword_1000C9078;
}

- (id)relayWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  uint64_t v12;
  DoAPAudioRelay *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v18;
  DoAPAudioRelay *v19;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub relayForIdentifier:](self, "relayForIdentifier:", v10));
  if (v12)
  {
    v13 = (DoAPAudioRelay *)v12;
    v14 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Publishing DoAPAudioRelay %@ already done", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v13 = -[DoAPAudioRelay initWithIdentifier:deviceType:properties:codecType:hub:]([DoAPAudioRelay alloc], "initWithIdentifier:deviceType:properties:codecType:hub:", v10, a4, v11, v6, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
    objc_msgSend(v15, "addObject:", v13);

    v16 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Publishing DoAPAudioRelay %@", (uint8_t *)&v18, 0xCu);
    }
    -[DoAPAudioRelay publish](v13, "publish");
  }

  return v13;
}

- (BOOL)isXpcConnectedForDeviceType:(int64_t)a3
{
  void *v4;
  void *v5;
  int v7;
  BOOL v8;

  if ((unint64_t)(a3 - 1) <= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
LABEL_6:
    v8 = v5 != 0;

    objc_sync_exit(v4);
    return v8;
  }
  v7 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP");
  v8 = 0;
  if (a3 == 4 && v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    goto LABEL_6;
  }
  return v8;
}

- (void)handleServerEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection)
  {
    -[DoAPAudioRelayHub handleConnection:](self, "handleConnection:", v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006CB3C();
  }

}

- (void)handleConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *string;
  int v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _xpc_connection_s *v15;
  _xpc_connection_s *v16;
  _xpc_connection_s *v17;
  _xpc_connection_s *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _xpc_connection_s *v23;
  _xpc_connection_s *v24;
  _xpc_connection_s *v25;
  _xpc_connection_s *v26;
  _QWORD v27[5];
  _QWORD handler[5];
  uint8_t v29[16];
  uint8_t buf[16];
  __int128 v31;

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub XPC connection: %p", buf, 0xCu);
  }
  *(_OWORD *)buf = 0u;
  v31 = 0u;
  xpc_connection_get_audit_token(v4, buf);
  v6 = (void *)xpc_copy_entitlement_for_token(0, buf);
  v7 = v6;
  if (!v6)
  {
    string = 0;
LABEL_12:
    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP")
      && !+[DoAPAudioRelayHub applicationIDIsSiri:](DoAPAudioRelayHub, "applicationIDIsSiri:", string))
    {
      if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP")
        && +[DoAPAudioRelayHub applicationIDIsSoundSensor:](DoAPAudioRelayHub, "applicationIDIsSoundSensor:", string))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
        objc_sync_enter(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));

        if (v20)
        {
          v21 = (id)qword_1000C9178;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
            sub_10006CBEC(v22, (uint64_t)v29, v21);
          }

          v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
          xpc_connection_set_event_handler(v23, &stru_1000AD9F8);

          v24 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
          xpc_connection_cancel(v24);

        }
        -[DoAPAudioRelayHub setSoundSensorXpcConnection:](self, "setSoundSensorXpcConnection:", v4);
        v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10002CEAC;
        v27[3] = &unk_1000AD928;
        v27[4] = self;
        xpc_connection_set_event_handler(v25, v27);

        v26 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
        xpc_connection_resume(v26);

        objc_sync_exit(v19);
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006CC38();
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      objc_sync_enter(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

      if (v12)
      {
        v13 = (id)qword_1000C9178;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
          sub_10006CBA0(v14, (uint64_t)v29, v13);
        }

        v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        xpc_connection_set_event_handler(v15, &stru_1000AD9D8);

        v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        xpc_connection_cancel(v16);

      }
      -[DoAPAudioRelayHub setSiriXpcConnection:](self, "setSiriXpcConnection:", v4);
      v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10002CE3C;
      handler[3] = &unk_1000AD928;
      handler[4] = self;
      xpc_connection_set_event_handler(v17, handler);

      v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      xpc_connection_resume(v18);

      objc_sync_exit(v11);
    }
    goto LABEL_30;
  }
  if (xpc_dictionary_get_BOOL(v6, "com.apple.bluetooth.doap"))
  {
    string = xpc_dictionary_get_string(v7, "application-identifier");
    v9 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP");
    if (string)
      v10 = 0;
    else
      v10 = v9;
    if (v10 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006CC9C();
      goto LABEL_30;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006CCC8();
LABEL_30:

}

- (void)handleDisconnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    *(_DWORD *)buf = 134218240;
    v33 = v7;
    v34 = 2048;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub XPC disconnection - siri: %p, soundSensor: %p", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    objc_sync_enter(v10);
    -[DoAPAudioRelayHub setSiriXpcConnection:](self, "setSiriXpcConnection:", 0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((char *)objc_msgSend(v15, "deviceType") - 1 <= (char *)2)
            objc_msgSend(v15, "handleResetStream");
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }
LABEL_13:

    objc_sync_exit(v10);
    goto LABEL_26;
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    v17 = v16 == 0;

    if (!v17)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
      objc_sync_enter(v10);
      -[DoAPAudioRelayHub setSoundSensorXpcConnection:](self, "setSoundSensorXpcConnection:", 0);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays", 0));
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v11);
            v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v21, "deviceType") == (id)4)
              objc_msgSend(v21, "handleResetStream");
          }
          v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v18);
      }
      goto LABEL_13;
    }
  }
LABEL_26:

}

- (void)handleConnectionEvent:(id)a3
{
  id v4;
  xpc_type_t type;
  _BOOL4 v6;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[DoAPAudioRelayHub handleMsg:](self, "handleMsg:", v4);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      -[DoAPAudioRelayHub handleDisconnection:](self, "handleDisconnection:", &_xpc_error_connection_invalid);
    }
    else if (v4 == &_xpc_error_connection_interrupted)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006CCF4();
    }
    else if (v4 == &_xpc_error_termination_imminent)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006CD20();
    }
    else
    {
      v6 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
      if (v4 == &_xpc_error_peer_code_signing_requirement)
      {
        if (v6)
          sub_10006CD4C();
      }
      else if (v6)
      {
        sub_10006CD78();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006CDDC();
  }

}

- (void)handleMsg:(id)a3
{
  id v4;
  xpc_connection_t remote_connection;
  char *v6;
  const char *string;
  xpc_object_t value;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  const char *v16;
  NSString *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _OWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v4 = a3;
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (char *)objc_claimAutoreleasedReturnValue(remote_connection);
  string = xpc_dictionary_get_string(v4, "kMsgId");
  value = xpc_dictionary_get_value(v4, "kMsgArgs");
  v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  memset(v22, 0, sizeof(v22));
  xpc_connection_get_audit_token(v6, v22);
  v10 = (void *)xpc_copy_entitlement_for_token(0, v22);
  v11 = v10;
  if (v10)
  {
    v12 = xpc_dictionary_get_string(v10, "application-identifier");
    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP") && !v12)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006CE6C();
      goto LABEL_25;
    }
    if (!_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP")
      || +[DoAPAudioRelayHub applicationIDIsSiri:](DoAPAudioRelayHub, "applicationIDIsSiri:", v12))
    {
      v13 = (void *)qword_1000C9178;
      if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v14 = v13;
      v15 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      *(_DWORD *)buf = 134218242;
      v24 = v15;
      v25 = 2080;
      v26 = string;
      v16 = "Received Siri XPC message from %p: %s";
      goto LABEL_12;
    }
    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP")
      && +[DoAPAudioRelayHub applicationIDIsSoundSensor:](DoAPAudioRelayHub, "applicationIDIsSoundSensor:", v12))
    {
      v20 = (void *)qword_1000C9178;
      if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:
        if (!strcmp(string, "CheckIn"))
        {
          -[DoAPAudioRelayHub handleCheckInMsg:applicationID:](self, "handleCheckInMsg:applicationID:", v4, v12);
        }
        else
        {
          v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("handle%sMsg:"), string));
          v18 = NSSelectorFromString(v17);

          if (v9)
            v19 = (void *)_CFXPCCreateCFObjectFromXPCObject(v9);
          else
            v19 = 0;
          objc_msgSend(self, v18, v19);

        }
        goto LABEL_25;
      }
      v14 = v20;
      v15 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
      *(_DWORD *)buf = 134218242;
      v24 = v15;
      v25 = 2080;
      v26 = string;
      v16 = "Received Sound Sensor XPC message from %p: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

      goto LABEL_13;
    }
    v21 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = v12;
      v25 = 2048;
      v26 = v6;
      v27 = 2080;
      v28 = string;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Received XPC message from unexpected applicationID %s, connection %p, msg ID: %s", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10006CE40();
  }
LABEL_25:

}

- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4 forClient:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  __CFString *v15;
  uint8_t buf[4];
  __CFString *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
  objc_sync_enter(v10);
  if ((unint64_t)(a5 - 1) <= 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

    if (v11)
    {
      -[DoAPAudioRelayHub sendMsg:args:forClient:](self, "sendMsg:args:forClient:", v8, v9, a5);
LABEL_9:
      objc_sync_exit(v10);

      goto LABEL_16;
    }
  }
  objc_sync_exit(v10);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
  objc_sync_enter(v10);
  v12 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP") ^ 1;
  if (a5 != 4)
    LOBYTE(v12) = 1;
  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));

    if (v13)
    {
      -[DoAPAudioRelayHub sendMsg:args:forClient:](self, "sendMsg:args:forClient:", v8, v9, 4);
      goto LABEL_9;
    }
  }
  objc_sync_exit(v10);

  v14 = (id)qword_1000C9178;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a5 >= 5)
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid (%ld)"), a5));
    else
      v15 = off_1000ADA18[a5];
    *(_DWORD *)buf = 138412290;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - No XPC client is checked in yet for %@", buf, 0xCu);

  }
LABEL_16:

}

- (void)sendMsg:(id)a3 args:(id)a4 forClient:(int64_t)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _xpc_connection_s *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _xpc_connection_s *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = objc_retainAutorelease(v8);
  xpc_dictionary_set_string(v10, "kMsgId", (const char *)objc_msgSend(v11, "UTF8String"));
  if (v9)
  {
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
    xpc_dictionary_set_value(v10, "kMsgArgs", v12);

  }
  if ((unint64_t)(a5 - 1) <= 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    objc_sync_enter(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

    if (v14)
    {
      v15 = (id)qword_1000C9178;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        v23 = 134218242;
        v24 = v16;
        v25 = 2112;
        v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending Siri XPC message to %p: %@", (uint8_t *)&v23, 0x16u);

      }
      v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      xpc_connection_send_message(v17, v10);

    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006CE98();
    }
LABEL_18:
    objc_sync_exit(v13);

    goto LABEL_19;
  }
  v18 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP");
  if (a5 == 4 && v18)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    objc_sync_enter(v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));

    if (v19)
    {
      v20 = (id)qword_1000C9178;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
        v23 = 134218242;
        v24 = v21;
        v25 = 2112;
        v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending Sound Sensor XPC message to %p: %@", (uint8_t *)&v23, 0x16u);

      }
      v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
      xpc_connection_send_message(v22, v10);

    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006CEC4();
    }
    goto LABEL_18;
  }
LABEL_19:

}

- (void)handleCheckInMsg:(id)a3 applicationID:(const char *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __CFString *v25;
  id v26;
  __CFString *reply;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char *v32;
  void *v33;
  char *v34;
  _xpc_connection_s *v35;
  void *v36;
  NSObject *v37;
  char *v38;
  _xpc_connection_s *v39;
  xpc_object_t original;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  __CFString *v50;
  _BYTE v51[128];

  original = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
    *(_DWORD *)buf = 136315394;
    v48 = a4;
    v49 = 1024;
    LODWORD(v50) = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - %s checked in. Number of DoAP Audio Relays: %u", buf, 0x12u);

  }
  v8 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP");
  if (a4)
    v9 = 0;
  else
    v9 = v8;
  if ((v9 & 1) != 0)
    goto LABEL_45;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (!v11)
    goto LABEL_33;
  v12 = *(_QWORD *)v44;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v13);
      if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP"))
      {
        if (+[DoAPAudioRelayHub applicationIDIsSiri:](DoAPAudioRelayHub, "applicationIDIsSiri:", a4)
          && (char *)objc_msgSend(v14, "deviceType") - 1 > (char *)2)
        {
          goto LABEL_26;
        }
        if (+[DoAPAudioRelayHub applicationIDIsSoundSensor:](DoAPAudioRelayHub, "applicationIDIsSoundSensor:", a4))
        {
          objc_msgSend(v14, "deviceType");
        }
        v15 = (id)qword_1000C9178;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v24 = (unint64_t)objc_msgSend(v14, "deviceType");
          if (v24 >= 5)
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid (%ld)"), v24));
          else
            v25 = off_1000ADA18[v24];
          *(_DWORD *)buf = 136315394;
          v48 = a4;
          v49 = 2112;
          v50 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "DoAPAudioRelayHub - skipping relay. applicationID %s, deviceType %@", buf, 0x16u);

        }
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "deviceType")));
      objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("kMsgDeviceType"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hidProperties"));
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hidProperties"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ProductID")));
        objc_msgSend(v16, "setValue:forKey:", v20, CFSTR("kMsgPidNum"));

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        objc_msgSend(v16, "setValue:forKey:", v22, CFSTR("kMsgArgIdentifier"));

      }
      if (objc_msgSend(v14, "codec"))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v14, "codec")));
        objc_msgSend(v16, "setValue:forKey:", v23, CFSTR("kMsgCodecType"));

      }
      objc_msgSend(v42, "addObject:", v16);

LABEL_26:
      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    v11 = v26;
  }
  while (v26);
LABEL_33:

  reply = (__CFString *)xpc_dictionary_create_reply(original);
  v28 = (void *)_CFXPCCreateXPCObjectFromCFObject(v42);
  xpc_dictionary_set_value(reply, "kMsgArgs", v28);
  if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP"))
  {
    if (+[DoAPAudioRelayHub applicationIDIsSiri:](DoAPAudioRelayHub, "applicationIDIsSiri:", a4))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      objc_sync_enter(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

      if (v30)
      {
        v31 = (id)qword_1000C9178;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
          *(_DWORD *)buf = 134218242;
          v48 = v32;
          v49 = 2112;
          v50 = reply;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Sending Siri CheckIn reply to %p: %@", buf, 0x16u);

        }
        goto LABEL_42;
      }
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006CE98();
      goto LABEL_43;
    }
    if (+[DoAPAudioRelayHub applicationIDIsSoundSensor:](DoAPAudioRelayHub, "applicationIDIsSoundSensor:", a4))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
      objc_sync_enter(v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));

      if (v36)
      {
        v37 = (id)qword_1000C9178;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
          *(_DWORD *)buf = 134218242;
          v48 = v38;
          v49 = 2112;
          v50 = reply;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Sending Sound Sensor CheckIn reply to %p: %@", buf, 0x16u);

        }
        v39 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
        xpc_connection_send_message(v39, reply);

      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006CEC4();
      }
      goto LABEL_43;
    }
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    objc_sync_enter(v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

    if (v33)
    {
      v31 = (id)qword_1000C9178;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        *(_DWORD *)buf = 134218242;
        v48 = v34;
        v49 = 2112;
        v50 = reply;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Sending Siri CheckIn reply to %p: %@", buf, 0x16u);

      }
LABEL_42:

      v35 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      xpc_connection_send_message(v35, reply);

    }
LABEL_43:
    objc_sync_exit(v29);

  }
LABEL_45:

}

- (void)handleStartStreamMsg:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kMsgArgIdentifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub relayForIdentifier:](self, "relayForIdentifier:", v4));
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006CEF0();
  objc_msgSend(v5, "handleStartStream");

}

- (void)handleStopStreamMsg:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kMsgArgIdentifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub relayForIdentifier:](self, "relayForIdentifier:", v4));
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006CF1C();
  objc_msgSend(v5, "handleStopStream");

}

- (id)relayForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeDoAPAudioRelayObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006CF48();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
  objc_msgSend(v5, "removeObject:", v4);

}

+ (BOOL)applicationIDIsSiri:(const char *)a3
{
  if (!a3)
    return 0;
  if (!strcmp(a3, "com.apple.corespeechd"))
    return 1;
  return strcmp(a3, "com.apple.MobileSMS") == 0;
}

+ (BOOL)applicationIDIsSoundSensor:(const char *)a3
{
  return a3 && strcmp(a3, "com.apple.SensingPredictXPCService") == 0;
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (OS_xpc_object)siriXpcConnection
{
  return self->_siriXpcConnection;
}

- (void)setSiriXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_siriXpcConnection, a3);
}

- (OS_xpc_object)soundSensorXpcConnection
{
  return self->_soundSensorXpcConnection;
}

- (void)setSoundSensorXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_soundSensorXpcConnection, a3);
}

- (NSHashTable)doapAudioRelays
{
  return self->_doapAudioRelays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doapAudioRelays, 0);
  objc_storeStrong((id *)&self->_soundSensorXpcConnection, 0);
  objc_storeStrong((id *)&self->_siriXpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end
