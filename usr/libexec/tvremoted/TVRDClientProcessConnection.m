@implementation TVRDClientProcessConnection

- (TVRDClientProcessConnection)initWithXPCConnection:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  TVRDClientProcessConnection *v9;
  TVRDClientProcessConnection *v10;
  NSMutableSet *v11;
  NSMutableSet *mutableIdentifiers;
  NSXPCConnection *xpcConnection;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  NSXPCConnection *v17;
  NSXPCConnection *v18;
  uint64_t v19;
  TVRCXPCResponseProtocol *remoteObjectProxy;
  id v21;
  NSObject *v22;
  void *v23;
  uint8_t v25[8];
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TVRDClientProcessConnection;
  v9 = -[TVRDClientProcessConnection init](&v31, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableIdentifiers = v10->_mutableIdentifiers;
    v10->_mutableIdentifiers = v11;

    objc_storeStrong((id *)&v10->_xpcConnection, a3);
    xpcConnection = v10->_xpcConnection;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCXPCProtocolManager requestInterface](TVRCXPCProtocolManager, "requestInterface"));
    -[NSXPCConnection setExportedInterface:](xpcConnection, "setExportedInterface:", v14);

    -[NSXPCConnection setExportedObject:](v10->_xpcConnection, "setExportedObject:", v10);
    v15 = v10->_xpcConnection;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCXPCProtocolManager responseInterface](TVRCXPCProtocolManager, "responseInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v15, "setRemoteObjectInterface:", v16);

    objc_initWeak(&location, v10);
    v17 = v10->_xpcConnection;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke;
    v28[3] = &unk_10001C5D8;
    objc_copyWeak(&v29, &location);
    -[NSXPCConnection setInterruptionHandler:](v17, "setInterruptionHandler:", v28);
    v18 = v10->_xpcConnection;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_2;
    v26[3] = &unk_10001C5D8;
    objc_copyWeak(&v27, &location);
    -[NSXPCConnection setInvalidationHandler:](v18, "setInvalidationHandler:", v26);
    v19 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v10->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1));
    remoteObjectProxy = v10->_remoteObjectProxy;
    v10->_remoteObjectProxy = (TVRCXPCResponseProtocol *)v19;

    if (+[TVRCFeatures isPersistOnLockScreenEnabled](TVRCFeatures, "isPersistOnLockScreenEnabled"))
    {
      v21 = _TVRDXPCLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Persist on Lock Screen Internal Setting is turned on", v25, 2u);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      objc_msgSend(v23, "acquireLockScreenAssertion");

    }
    -[NSXPCConnection resume](v10->_xpcConnection, "resume");
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v5, 2u);
  }

  objc_msgSend(WeakRetained, "_removeAllIdentifiers");
  v4 = objc_loadWeakRetained(WeakRetained + 1);
  objc_msgSend(v4, "clientConnectionSeveredConnection:", WeakRetained);

}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v5, 2u);
  }

  objc_msgSend(WeakRetained, "_removeAllIdentifiers");
  v4 = objc_loadWeakRetained(WeakRetained + 1);
  objc_msgSend(v4, "clientConnectionSeveredConnection:", WeakRetained);

}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_3(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_3_cold_1((uint64_t)v2, v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
  objc_msgSend(v3, "releaseLockScreenAssertion");

  v4.receiver = self;
  v4.super_class = (Class)TVRDClientProcessConnection;
  -[TVRDClientProcessConnection dealloc](&v4, "dealloc");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection xpcConnection](self, "xpcConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection _processNameForPid:](self, "_processNameForPid:", objc_msgSend(v4, "processIdentifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection xpcConnection](self, "xpcConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d"), v5, objc_msgSend(v6, "processIdentifier")));

  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("process"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v8;
}

- (id)_processNameForPid:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  _BYTE buffer[256];

  v3 = *(_QWORD *)&a3;
  if (proc_name(a3, buffer, 0x100u))
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  return v6;
}

- (NSSet)deviceIdentifiers
{
  return +[NSSet setWithSet:](NSSet, "setWithSet:", self->_mutableIdentifiers);
}

- (void)openConnectionToDeviceWithIdentifier:(id)a3 connectionContext:(int64_t)a4
{
  TVRDClientProcessConnection *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  id v13;
  int v14;
  TVRDClientProcessConnection *v15;
  __int16 v16;
  TVRDClientProcessConnection *v17;
  __int16 v18;
  void *v19;

  v6 = (TVRDClientProcessConnection *)a3;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Open connection to device %{public}@", (uint8_t *)&v14, 0xCu);
  }

  if ((-[NSMutableSet containsObject:](self->_mutableIdentifiers, "containsObject:", v6) & 1) != 0)
  {
    v9 = _TVRDXPCLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection deviceIdentifiers](self, "deviceIdentifiers"));
      v14 = 138412802;
      v15 = self;
      v16 = 2114;
      v17 = v6;
      v18 = 2112;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ is already interested in identifier %{public}@. All interested IDs - %@", (uint8_t *)&v14, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientConnection:reiteratedInterestInDeviceIdentifier:connectionContext:", self, v6, a4);

  }
  else
  {
    -[NSMutableSet addObject:](self->_mutableIdentifiers, "addObject:", v6);
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "clientConnection:addedInterestedDeviceIdentifier:connectionContext:", self, v6, a4);

    notify_post("com.apple.TVRemoteCore.connectionRequested");
  }

}

- (void)closeConnectionToDeviceWithIdentifier:(id)a3 withType:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  unsigned int v13;
  id v14;
  _BOOL4 v15;
  dispatch_time_t v16;
  id v17;
  NSObject *v18;
  id WeakRetained;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  unint64_t v25;

  v6 = a3;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v6;
    v24 = 2048;
    v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Close connection to device %{public}@ with type %ld", buf, 0x16u);
  }

  if (-[NSMutableSet containsObject:](self->_mutableIdentifiers, "containsObject:", v6))
  {
    if (a4 == 1
      && (+[TVRCFeatures isWakeToRemoteOnLockScreenDisabled](TVRCFeatures, "isWakeToRemoteOnLockScreenDisabled") & 1) == 0)
    {
      v17 = _TVRDXPCLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Disconnect type for device %@ is unknown. Acquiring lock screen assertion.", buf, 0xCu);
      }

      v10 = objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      -[NSObject acquireLockScreenAssertion](v10, "acquireLockScreenAssertion");
      goto LABEL_19;
    }
    if ((+[TVRCFeatures isPersistOnLockScreenEnabled](TVRCFeatures, "isPersistOnLockScreenEnabled") & 1) != 0)
    {
      v9 = _TVRDXPCLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "Persist on Lock Screen Internal Setting is turned on. Skipping releasing lock screen assertion.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      v13 = objc_msgSend(v12, "isLockScreenAssertionActive");

      v14 = _TVRDXPCLog();
      v10 = objc_claimAutoreleasedReturnValue(v14);
      v15 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Releasing lock screen assertion in 1 second", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v16 = dispatch_time(0, 1000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __78__TVRDClientProcessConnection_closeConnectionToDeviceWithIdentifier_withType___block_invoke;
        block[3] = &unk_10001C5D8;
        objc_copyWeak(&v21, (id *)buf);
        dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
        goto LABEL_20;
      }
      if (v15)
      {
        *(_WORD *)buf = 0;
        v11 = "Lock screen assertion is inactive";
        goto LABEL_18;
      }
    }
LABEL_19:

LABEL_20:
    -[NSMutableSet removeObject:](self->_mutableIdentifiers, "removeObject:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientConnection:removedInterestedDeviceIdentifier:", self, v6);

  }
}

void __78__TVRDClientProcessConnection_closeConnectionToDeviceWithIdentifier_withType___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[4], "count");
    v2 = v5;
    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
      objc_msgSend(v4, "releaseLockScreenAssertion");

      v2 = v5;
    }
  }

}

- (void)fulfillAuthChallengeForDeviceWithIdentifier:(id)a3 withLocallyEnteredCode:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fulfill auth challenge for device %@ with locally-entered code %{public}@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:receivedAuthChallengeLocallyEnteredCode:forDeviceIdentifier:", self, v7, v6);

}

- (void)cancelAuthChallengeForDeviceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cancel auth challenge for device %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:cancelledAuthChallengeForDeviceIdentifier:", self, v4);

}

- (void)sendButtonEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send button event %{public}@ to device %@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingButtonEvent:toDeviceIdentifier:", self, v6, v7);

}

- (void)sendTouchEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  TVRDClientProcessConnectionDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingTouchEvent:toDeviceIdentifier:", self, v8, v7);

}

- (void)sendGameControllerEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send game controller event %{public}@ device %@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingGameControllerEvent:toDeviceIdentifier:", self, v6, v7);

}

- (void)sendInputText:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send input text '%@' to device %@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingInputText:toDeviceIdentifier:", self, v6, v7);

}

- (void)sendInputReturnKeyToDeviceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Send return key to device %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingInputReturnKeyToDeviceIdentifier:", self, v4);

}

- (void)sendInputTextPayload:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = _TVRDXPCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send data payload %@ to device %@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingInputDataPayload:toDeviceIdentifier:", self, v6, v7);

}

- (void)beginDeviceQueryWithResponse:(id)a3
{
  TVRDClientProcessConnectionDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "clientConnectionRequestsStartingDeviceQuery:withResponse:", self, v5);

}

- (void)endDeviceQuery
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnectionRequestsEndingDeviceQuery:", self);

}

- (void)getSuggestedDevicesWithResponse:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  uint8_t v8[16];

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client requests suggested device", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSuggestedDeviceWithResponse:", self, v4);

}

- (void)removeInterestForDeviceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing device identifier: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  -[TVRDClientProcessConnection _removeIdentifier:](self, "_removeIdentifier:", v4);
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection mutableIdentifiers](self, "mutableIdentifiers"));
    v15 = 138412290;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device identifiers interested to connect: %@", (uint8_t *)&v15, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection mutableIdentifiers](self, "mutableIdentifiers"));
  if (objc_msgSend(v10, "count"))
    goto LABEL_10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
  v12 = objc_msgSend(v11, "isLockScreenAssertionActive");

  if (v12)
  {
    v13 = _TVRDXPCLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Releasing lock screen assertion", (uint8_t *)&v15, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDAssertionManager sharedInstance](TVRDAssertionManager, "sharedInstance"));
    objc_msgSend(v10, "releaseLockScreenAssertion");
LABEL_10:

  }
}

- (void)fetchActiveMREndpointUIDWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCMediaRemoteEndpointManager sharedInstance](TVRCMediaRemoteEndpointManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__TVRDClientProcessConnection_fetchActiveMREndpointUIDWithCompletion___block_invoke;
  v6[3] = &unk_10001C620;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchActiveEndpointWithCompletion:", v6);

}

uint64_t __70__TVRDClientProcessConnection_fetchActiveMREndpointUIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendEvent:(id)a3 toDeviceWithIdentifier:(id)a4 options:(id)a5 response:(id)a6
{
  TVRDClientProcessConnectionDelegate **p_delegate;
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsSendingEvent:toDeviceWithIdentifier:options:response:", self, v14, v13, v12, v11);

}

- (void)launchViewServiceForDeviceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = _TVRDXPCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[TVRDClientProcessConnection launchViewServiceForDeviceWithIdentifier:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, deviceIdentifier=%@", (uint8_t *)&v15, 0x16u);
  }

  v7 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.TVRemoteUIService"), CFSTR("TVRemoteAlertViewController"));
  v8 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_10001D210, CFSTR("deviceType"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_10001D228, CFSTR("launchContext"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_10001D210, CFSTR("deviceIdentifierType"));
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("deviceIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
  objc_msgSend(v8, "setUserInfo:", v10);

  v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v7, v8);
  objc_msgSend(v11, "registerObserver:", self);
  v12 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  v13 = _TVRDXPCLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Activating view service context", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(v11, "activateWithContext:", v12);
  -[TVRDClientProcessConnection setAlertHandle:](self, "setAlertHandle:", v11);

}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t v10[16];

  v4 = a3;
  v6 = a4;
  if (+[TVRCFeatures isPersistOnLockScreenEnabled](TVRCFeatures, "isPersistOnLockScreenEnabled"))
  {
    v7 = _TVRDXPCLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping. PersistOnLockScreen Internal Setting is turned on", v10, 2u);
    }

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientConnection:requestsEnablingRemoteOnLockscreen:forDeviceWithIdentifier:", self, v4, v6);

  }
}

- (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 response:(id)a4
{
  TVRDClientProcessConnectionDelegate **p_delegate;
  id v7;
  id WeakRetained;
  id v9;
  void (**v10)(id, id);

  p_delegate = &self->_delegate;
  v10 = (void (**)(id, id))a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_msgSend(WeakRetained, "clientConnection:isConnectedToDeviceWithIdentifier:", self, v7);

  v10[2](v10, v9);
}

- (void)enableFindingSession:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  id WeakRetained;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Disable");
    if (v4)
      v9 = CFSTR("Enable");
    v11 = 138412546;
    v12 = v9;
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ finding session for device %{public}@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:requestsEnablingFindingSession:forDeviceWithIdentifier:", self, v4, v6);

}

- (void)fetchUpNextInfoForDeviceWithIdentifier:(id)a3 paginationToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id WeakRetained;
  uint8_t v14[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = _TVRDXPCLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Returning UpNext info", v14, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:fetchUpNextInfoForDeviceWithIdentifier:paginationToken:completion:", self, v10, v9, v8);

}

- (void)markAsWatchedForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id WeakRetained;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _TVRDXPCLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 2114;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Marking %@ as watched on %{public}@", (uint8_t *)&v14, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:markAsWatchedForDeviceWithIdentifier:mediaIdentifier:completion:", self, v8, v9, v10);

}

- (void)removeItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id WeakRetained;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _TVRDXPCLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 2114;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing %@ from UpNext %{public}@", (uint8_t *)&v14, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:removeItemForDeviceWithIdentifier:mediaIdentifier:completion:", self, v8, v9, v10);

}

- (void)playItem:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id WeakRetained;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _TVRDXPCLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Playing %@ on %{public}@", (uint8_t *)&v14, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnection:playItem:deviceIdentifier:completion:", self, v8, v9, v10);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = _TVRDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TVRDClientProcessConnection remoteAlertHandleDidDeactivate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[TVRDClientProcessConnection _invalidateRemoteAlertHandle](self, "_invalidateRemoteAlertHandle");
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  v6 = _TVRDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[TVRDClientProcessConnection remoteAlertHandle:didInvalidateWithError:].cold.1((uint64_t)v5, v7);

  -[TVRDClientProcessConnection _invalidateRemoteAlertHandle](self, "_invalidateRemoteAlertHandle");
}

- (void)_invalidateRemoteAlertHandle
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TVRDClientProcessConnection _invalidateRemoteAlertHandle]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection alertHandle](self, "alertHandle"));
  objc_msgSend(v5, "unregisterObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection alertHandle](self, "alertHandle"));
  objc_msgSend(v6, "invalidate");

  -[TVRDClientProcessConnection setAlertHandle:](self, "setAlertHandle:", 0);
}

- (void)_removeAllIdentifiers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  unsigned int v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDClientProcessConnection deviceIdentifiers](self, "deviceIdentifiers"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[TVRDClientProcessConnection _removeIdentifier:](self, "_removeIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientConnectionRequestsEndingDeviceQuery:", self);

  v9 = _TVRDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[NSMutableSet count](self->_mutableIdentifiers, "count");
    *(_DWORD *)buf = 67109120;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "After removing all identifiers for connection, counted set now has %d elements.", buf, 8u);
  }

}

- (void)_removeIdentifier:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (-[NSMutableSet containsObject:](self->_mutableIdentifiers, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_mutableIdentifiers, "removeObject:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientConnection:removedInterestedDeviceIdentifier:", self, v5);

  }
}

- (TVRDClientProcessConnectionDelegate)delegate
{
  return (TVRDClientProcessConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRCXPCResponseProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSMutableSet)mutableIdentifiers
{
  return self->_mutableIdentifiers;
}

- (void)setMutableIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mutableIdentifiers, a3);
}

- (SBSRemoteAlertHandle)alertHandle
{
  return self->_alertHandle;
}

- (void)setAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_alertHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_mutableIdentifiers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed getting remote object proxy %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[TVRDClientProcessConnection remoteAlertHandle:didInvalidateWithError:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s, error=%@", (uint8_t *)&v2, 0x16u);
}

@end
