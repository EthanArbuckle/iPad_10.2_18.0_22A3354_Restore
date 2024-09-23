@implementation MSDAirPlayAssistedSender

+ (id)sharedInstance
{
  if (qword_100175250 != -1)
    dispatch_once(&qword_100175250, &stru_10013E4E8);
  return (id)qword_100175258;
}

- (MSDAirPlayAssistedSender)init
{
  MSDAirPlayAssistedSender *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;

  v13.receiver = self;
  v13.super_class = (Class)MSDAirPlayAssistedSender;
  v2 = -[MSDAirPlayAssistedSender init](&v13, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.MobileStoreDemo.AirPlayAsssitedSender", v4);
    -[MSDAirPlayAssistedSender setQueue:](v2, "setQueue:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemScreenContext](AVOutputContext, "sharedSystemScreenContext"));
    -[MSDAirPlayAssistedSender setAvOutputContext:](v2, "setAvOutputContext:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_handleAVOutputDeviceDidChangeNotification:", AVOutputContextOutputDeviceDidChangeNotification, 0);

    if (-[MSDAirPlayAssistedSender _isAirPlayStreaming](v2, "_isAirPlayStreaming"))
      v8 = 3;
    else
      v8 = 1;
    -[MSDAirPlayAssistedSender setState:](v2, "setState:", v8);
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender _NSStringFromSenderState:](v2, "_NSStringFromSenderState:", -[MSDAirPlayAssistedSender state](v2, "state")));
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Sender initialized to state: %{public}@", buf, 0xCu);

    }
  }
  return v2;
}

- (BOOL)isSenderReady
{
  MSDAirPlayAssistedSender *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039990;
  v5[3] = &unk_10013E510;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)activateSenderUsingParametersData:(id)a3 discoveryMode:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  unint64_t v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Activating sender in discovery mode: %lu", buf, 0xCu);
  }

  v23 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 0, 0, &v23));
  v11 = v23;
  if (v9 && (v12 = objc_opt_class(NSDictionary, v10), (objc_opt_isKindOfClass(v9, v12) & 1) != 0))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039C00;
    block[3] = &unk_10013E538;
    v21 = &v24;
    block[4] = self;
    v20 = v9;
    v22 = a4;
    dispatch_sync(v13, block);

    v14 = *((_BYTE *)v25 + 24) != 0;
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      sub_1000BCD24(v17, (uint64_t)buf, v16);
    }

    v14 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (BOOL)_isAirPlayStreaming
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  int v15;
  _BYTE v16[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender avOutputContext](self, "avOutputContext", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "outputDevices"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "deviceType"))
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = (int)v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Sender has AirPlay streaming=%{BOOL}d", buf, 8u);
  }

  return (char)v4;
}

- (BOOL)_activateSenderUsingParameters:(id)a3 discoveryMode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if ((id)-[MSDAirPlayAssistedSender state](self, "state") != (id)1)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BCE40(self, v9);

    goto LABEL_17;
  }
  -[MSDAirPlayAssistedSender setState:](self, "setState:", 2);
  if (a4)
  {
    if (a4 == 2)
    {
      if (!-[MSDAirPlayAssistedSender _startAWDLDiscoveryUsingBonjour:](self, "_startAWDLDiscoveryUsingBonjour:", 0))
      {
LABEL_16:
        -[MSDAirPlayAssistedSender _stopActivation](self, "_stopActivation");
        -[MSDAirPlayAssistedSender setState:](self, "setState:", 1);
LABEL_17:
        v11 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      if (a4 != 1)
      {
        v12 = sub_1000604F0();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1000BCD70(a4, v13, v14);
        goto LABEL_15;
      }
      if (!-[MSDAirPlayAssistedSender _startAWDLDiscoveryUsingBonjour:](self, "_startAWDLDiscoveryUsingBonjour:", 1))
        goto LABEL_16;
    }
  }
  -[MSDAirPlayAssistedSender _startTimeoutTimer](self, "_startTimeoutTimer");
  v10 = APSXPCClientSendCommandCreatingReply(CFSTR("com.apple.airplay.receiver.services"), CFSTR("activateEndpointForAddress"), v6, 0);
  if ((_DWORD)v10)
  {
    v16 = v10;
    v17 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BCDDC(v16, v13, v18, v19, v20, v21, v22, v23);
LABEL_15:

    goto LABEL_16;
  }
  v11 = 1;
LABEL_18:

  return v11;
}

- (BOOL)_startAWDLDiscoveryUsingBonjour:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  BonjourBrowser *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _DWORD v42[2];

  v3 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v42[0] = 67109120;
    v42[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Starting AWDL discovery using bonjour service: %{BOOL}d", (uint8_t *)v42, 8u);
  }

  if (!v3)
  {
    v12 = objc_msgSend(objc_alloc((Class)AVOutputDeviceDiscoverySession), "initWithDeviceFeatures:", 2);
    -[MSDAirPlayAssistedSender setAvDiscoverySession:](self, "setAvDiscoverySession:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender avDiscoverySession](self, "avDiscoverySession"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender avDiscoverySession](self, "avDiscoverySession"));
      objc_msgSend(v14, "setDiscoveryMode:", 2);

      return 1;
    }
    v25 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000BCFA4(v18, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_14;
  }
  v7 = BonjourBrowser_CreateEx(&self->_bonjourBrowser, "MobileStoreDemoAWDLStarter", 2);
  if ((_DWORD)v7)
  {
    v16 = v7;
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000BCF40(v16, v18, v19, v20, v21, v22, v23, v24);
LABEL_14:

    return 0;
  }
  v8 = -[MSDAirPlayAssistedSender bonjourBrowser](self, "bonjourBrowser");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  BonjourBrowser_SetDispatchQueue(v8, v9);

  v10 = BonjourBrowser_Start(-[MSDAirPlayAssistedSender bonjourBrowser](self, "bonjourBrowser"), "_airplay._tcp.", "local.", &unk_1000F0008, 0x462000000000000);
  if ((_DWORD)v10)
  {
    v33 = v10;
    v34 = sub_1000604F0();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_1000BCEDC(v33, v35, v36, v37, v38, v39, v40, v41);

    return 0;
  }
  v11 = 1;
  sleep(1u);
  return v11;
}

- (void)_startTimeoutTimer
{
  NSObject *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  -[MSDAirPlayAssistedSender setTimeoutTimer:](self, "setTimeoutTimer:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender timeoutTimer](self, "timeoutTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003A250;
  handler[3] = &unk_10013D868;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);

  v7 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender timeoutTimer](self, "timeoutTimer"));
  v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  v9 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender timeoutTimer](self, "timeoutTimer"));
  dispatch_resume(v9);

}

- (void)_stopActivation
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[MSDAirPlayAssistedSender _stopAWDLDiscovery](self, "_stopAWDLDiscovery");
  -[MSDAirPlayAssistedSender _stopTimoutTimer](self, "_stopTimoutTimer");
}

- (void)_stopAWDLDiscovery
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Stopping AWDL discovery.", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender avDiscoverySession](self, "avDiscoverySession"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender avDiscoverySession](self, "avDiscoverySession"));
    objc_msgSend(v7, "setDiscoveryMode:", 0);

    -[MSDAirPlayAssistedSender setAvDiscoverySession:](self, "setAvDiscoverySession:", 0);
  }
  if (-[MSDAirPlayAssistedSender bonjourBrowser](self, "bonjourBrowser"))
  {
    BonjourBrowser_Stop(-[MSDAirPlayAssistedSender bonjourBrowser](self, "bonjourBrowser"));
    CFRelease(-[MSDAirPlayAssistedSender bonjourBrowser](self, "bonjourBrowser"));
    -[MSDAirPlayAssistedSender setBonjourBrowser:](self, "setBonjourBrowser:", 0);
  }
}

- (void)_stopTimoutTimer
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Stopping timeout timer.", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender timeoutTimer](self, "timeoutTimer"));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender timeoutTimer](self, "timeoutTimer"));
    dispatch_source_cancel(v7);

    -[MSDAirPlayAssistedSender setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
}

- (void)_handleTimeoutTimerFired
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Timed out waiting for sender to start streaming!", v6, 2u);
  }

  -[MSDAirPlayAssistedSender _stopActivation](self, "_stopActivation");
  -[MSDAirPlayAssistedSender setState:](self, "setState:", 1);
}

- (id)_NSStringFromSenderState:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_10013E558 + a3);
}

- (void)_handleAVOutputDeviceDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[MSDAirPlayAssistedSender queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A558;
  block[3] = &unk_10013D868;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (AVOutputContext)avOutputContext
{
  return self->_avOutputContext;
}

- (void)setAvOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_avOutputContext, a3);
}

- (AVOutputDeviceDiscoverySession)avDiscoverySession
{
  return self->_avDiscoverySession;
}

- (void)setAvDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->_avDiscoverySession, a3);
}

- (BonjourBrowser)bonjourBrowser
{
  return self->_bonjourBrowser;
}

- (void)setBonjourBrowser:(BonjourBrowser *)a3
{
  self->_bonjourBrowser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
  objc_storeStrong((id *)&self->_avOutputContext, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
