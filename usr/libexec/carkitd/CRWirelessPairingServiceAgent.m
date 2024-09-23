@implementation CRWirelessPairingServiceAgent

- (CRWirelessPairingServiceAgent)initWithBluetoothManager:(id)a3 preferences:(id)a4 vehicleStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRWirelessPairingServiceAgent *v12;
  CRWirelessPairingServiceAgent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRWirelessPairingServiceAgent;
  v12 = -[CRWirelessPairingServiceAgent init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bluetoothManager, a3);
    objc_storeStrong((id *)&v13->_carPlayPreferences, a4);
    objc_storeStrong((id *)&v13->_vehicleStore, a5);
  }

  return v13;
}

- (void)setCurrentPairingSession:(id)a3
{
  CRWirelessPairingServiceSession *v4;
  CRWirelessPairingServiceSession *currentPairingSession;
  CRWirelessPairingServiceSession *v6;
  CRWirelessPairingServiceSession *v7;

  v4 = (CRWirelessPairingServiceSession *)a3;
  currentPairingSession = self->_currentPairingSession;
  if (currentPairingSession)
  {
    -[CRWirelessPairingServiceSession invalidate](currentPairingSession, "invalidate");
    v6 = self->_currentPairingSession;
    self->_currentPairingSession = 0;

  }
  v7 = self->_currentPairingSession;
  self->_currentPairingSession = v4;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.carkit.pairing.service"));

  if (v7)
  {
    v8 = -[CRWirelessPairingServiceAgent _shouldAcceptPairingServiceConnection:](self, "_shouldAcceptPairingServiceConnection:", v5);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.carkit.headUnitPairingPrompt.service"));

    if (!v10)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v8 = -[CRWirelessPairingServiceAgent _shouldAcceptHeadUnitPairingPromptServiceConnection:](self, "_shouldAcceptHeadUnitPairingPromptServiceConnection:", v5);
  }
  v11 = v8;
LABEL_7:

  return v11;
}

- (BOOL)_shouldAcceptPairingServiceConnection:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.carkit.pairing")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRWirelessPairingService));
    objc_msgSend(v4, "setExportedInterface:", v8);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_10001CDE4;
    v24 = sub_10001CDF4;
    v25 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CDFC;
    block[3] = &unk_1000B5750;
    block[4] = self;
    block[5] = &v20;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    objc_msgSend(v4, "setExportedObject:", v21[5]);
    objc_initWeak(&location, v4);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001CE98;
    v16[3] = &unk_1000B55B0;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    objc_msgSend(v4, "setInterruptionHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001D038;
    v14[3] = &unk_1000B55B0;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    v9 = CarPairingLogging(objc_msgSend(v4, "setInvalidationHandler:", v14));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier")));
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Receiving pairing service connection from %@", buf, 0xCu);

    }
    objc_msgSend(v4, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v12 = CarPairingLogging(v7);
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006A6EC(v4);
  }

  return v6;
}

- (BOOL)_shouldAcceptHeadUnitPairingPromptServiceConnection:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  CRHeadUnitPairingPromptServiceSession *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.carkit.headUnitPairingPrompt")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRHeadUnitPairingPromptService));
    objc_msgSend(v4, "setExportedInterface:", v8);
    v9 = objc_alloc_init(CRHeadUnitPairingPromptServiceSession);
    -[CRWirelessPairingServiceAgent setCurrentPromptSession:](self, "setCurrentPromptSession:", v9);
    -[CRHeadUnitPairingPromptServiceSession setDelegate:](v9, "setDelegate:", self);
    objc_msgSend(v4, "setExportedObject:", v9);
    objc_initWeak(&location, v4);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001D46C;
    v17[3] = &unk_1000B5728;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v4, "setInterruptionHandler:", v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001D51C;
    v15[3] = &unk_1000B5728;
    objc_copyWeak(&v16, &location);
    v10 = CarPairingLogging(objc_msgSend(v4, "setInvalidationHandler:", v15));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier")));
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Receiving HUP prompt service connection from %@", buf, 0xCu);

    }
    objc_msgSend(v4, "resume");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    v13 = CarPairingLogging(v7);
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006A788(v4);
  }

  return v6;
}

- (BOOL)shouldPresentHeadUnitPairingPromptSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));

  if (!v5)
  {
    v19 = CarPairingLogging(v6);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      v21 = "not presenting head unit pairing prompt, pairing session is not already established";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v29, 2u);
    }
LABEL_13:

    v18 = 0;
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
  v8 = objc_msgSend(v7, "isPairingAvailable");

  if ((v8 & 1) == 0)
  {
    v22 = CarPairingLogging(v9);
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10006A7F8();
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
  v11 = objc_msgSend(v10, "isActive");

  if ((v11 & 1) == 0)
  {
    v23 = CarPairingLogging(v12);
    v20 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      v21 = "not presenting head unit pairing prompt, pairing session is not active / already completed";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyIdentifier"));
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {
    v25 = CarPairingLogging(v17);
    v20 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "keyIdentifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyIdentifier"));
      v29 = 138478083;
      v30 = v27;
      v31 = 2113;
      v32 = v28;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "not presenting head unit pairing prompt, key identifier mismatch: %{private}@ vs %{private}@, ", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_13;
  }
  v18 = 1;
LABEL_14:

  return v18;
}

- (void)presentHeadUnitPairingForPromptSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  if (-[CRWirelessPairingServiceAgent shouldPresentHeadUnitPairingPromptSession:](self, "shouldPresentHeadUnitPairingPromptSession:", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v5));
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent presenter](self, "presenter"));
      v8 = (void *)v7;
      if (v7
        && (objc_opt_respondsToSelector(v7, "presentHeadUnitPairingForBluetoothAddress:showBluetoothOnlyOption:") & 1) != 0)
      {
        objc_msgSend(v8, "presentHeadUnitPairingForBluetoothAddress:showBluetoothOnlyOption:", v6, 0);
      }
      else
      {
        -[CRWirelessPairingServiceAgent _didCompletePairingFlow:error:](self, "_didCompletePairingFlow:error:", 0, 0);
      }

    }
    else
    {
      v9 = CarPairingLogging(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10006A824();

      -[CRWirelessPairingServiceAgent _didCompletePairingFlow:error:](self, "_didCompletePairingFlow:error:", 0, 0);
    }

  }
  else
  {
    -[CRWirelessPairingServiceAgent _didCompletePairingFlow:error:](self, "_didCompletePairingFlow:error:", 0, 0);
  }
}

- (void)handleHeadUnitPairingPromptSession:(id)a3 receivedResponse:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;

  v4 = a4;
  v6 = -[CRWirelessPairingServiceAgent shouldPresentHeadUnitPairingPromptSession:](self, "shouldPresentHeadUnitPairingPromptSession:", a3);
  if (v6)
  {
    v7 = CarPairingLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accepted head unit pairing", (uint8_t *)&v20, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v8));
      v12 = objc_alloc_init((Class)CRVehicle);
      objc_msgSend(v12, "setVehicleName:", v11);
      objc_msgSend(v12, "setBluetoothAddress:", v11);
      objc_msgSend(v12, "setPairingStatus:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent vehicleStore](self, "vehicleStore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "saveVehicle:", v12));

      v16 = CarPairingLogging(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138412290;
          v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "saved vehicle for head unit pairing: %@", (uint8_t *)&v20, 0xCu);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_10006A850(v18);
      }

    }
    else if (v9)
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "declined head unit pairing", (uint8_t *)&v20, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
    objc_msgSend(v19, "handlePairingPromptResponse:", v4);

  }
}

- (void)headUnitPairingPresenter:(id)a3 didReceiveUserConfirmation:(BOOL)a4 forBluetoothAddress:(id)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;

  v5 = a4;
  v7 = a5;
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v18 = 138412290;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "current pairing session approval: %@", (uint8_t *)&v18, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress"));

  v13 = objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v12));
  v14 = (void *)v13;
  if (v13 && (v13 = (uint64_t)objc_msgSend((id)v13, "isEqual:", v7), (v13 & 1) != 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
    objc_msgSend(v15, "handlePairingPromptResponse:", v5);

  }
  else
  {
    v16 = CarPairingLogging(v13);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10006A8C8();

    -[CRWirelessPairingServiceAgent _didCompletePairingFlow:error:](self, "_didCompletePairingFlow:error:", 0, 0);
  }

}

- (void)headUnitPairingPresenter:(id)a3 didCompletePairingFlow:(BOOL)a4 forBluetoothAddress:(id)a5 error:(id)a6
{
  -[CRWirelessPairingServiceAgent _didCompletePairingFlow:error:](self, "_didCompletePairingFlow:error:", a4, a6, a5);
}

- (void)_didCompletePairingFlow:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPromptSession](self, "currentPromptSession"));
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingPromptCompletion"));
    v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t, _BOOL8, id))(v8 + 16))(v8, v4, v10);
      objc_msgSend(v7, "setPairingPromptCompletion:", 0);
    }

  }
}

- (void)pairingServiceSessionDidFinishPairing:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent presenter](self, "presenter", a3));
  v5 = (void *)v4;
  if (v4)
  {
    v10 = (void *)v4;
    v6 = objc_opt_respondsToSelector(v4, "didHeadUnitPairWithBluetoothAddress:");
    v5 = v10;
    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession", v10));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothAddress"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v8));
      objc_msgSend(v10, "didHeadUnitPairWithBluetoothAddress:", v9);

      v5 = v10;
    }
  }

}

- (void)pairingServiceSession:(id)a3 didFailPairingAttemptWithError:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent presenter](self, "presenter"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "didFailToHeadUnitPairWithBluetoothAddress:error:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessPairingServiceAgent currentPairingSession](self, "currentPairingSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothAddress"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v8));
    objc_msgSend(v6, "didFailToHeadUnitPairWithBluetoothAddress:error:", v9, v10);

  }
}

- (CRHeadUnitPairingPresenting)presenter
{
  return (CRHeadUnitPairingPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (CRBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (CRCarPlayPreferences)carPlayPreferences
{
  return self->_carPlayPreferences;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CRWirelessPairingServiceSession)currentPairingSession
{
  return self->_currentPairingSession;
}

- (CRHeadUnitPairingPromptServiceSession)currentPromptSession
{
  return (CRHeadUnitPairingPromptServiceSession *)objc_loadWeakRetained((id *)&self->_currentPromptSession);
}

- (void)setCurrentPromptSession:(id)a3
{
  objc_storeWeak((id *)&self->_currentPromptSession, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentPromptSession);
  objc_storeStrong((id *)&self->_currentPairingSession, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_carPlayPreferences, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end
