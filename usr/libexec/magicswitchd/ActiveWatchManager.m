@implementation ActiveWatchManager

- (ActiveWatchManager)initWithDelegate:(id)a3 activeDevice:(id)a4
{
  id v6;
  id v7;
  ActiveWatchManager *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  CBCentralManager *v15;
  CBCentralManager *centralManager;
  BTPipeManager *v17;
  BTPipeManager *pipeManager;
  objc_super v20;
  uint8_t buf[4];
  ActiveWatchManager *v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ActiveWatchManager;
  v8 = -[ActiveWatchManager init](&v20, "init");
  if (v8)
  {
    v9 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      *(_DWORD *)buf = 134218242;
      v22 = v8;
      v23 = 2112;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Initializing (%p); Active device: (%@)",
        buf,
        0x16u);

    }
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_deviceID, a4);
    v12 = objc_alloc((Class)CBCentralManager);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workQueue"));
    v15 = (CBCentralManager *)objc_msgSend(v12, "initWithDelegate:queue:", v8, v14);
    centralManager = v8->_centralManager;
    v8->_centralManager = v15;

    v17 = -[BTPipeManager initWithDelegate:isServer:]([BTPipeManager alloc], "initWithDelegate:isServer:", v8, 0);
    pipeManager = v8->_pipeManager;
    v8->_pipeManager = v17;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[ActiveWatchManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ActiveWatchManager;
  -[ActiveWatchManager dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  MessageManager *messageManager;
  BTPipeManager *pipeManager;
  CBCentralManager *centralManager;
  int v7;
  ActiveWatchManager *v8;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Invalidating (%p)", (uint8_t *)&v7, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (-[ActiveWatchManager isConnecting](self, "isConnecting")
      || -[ActiveWatchManager isConnected](self, "isConnected"))
    {
      -[ActiveWatchManager disconnect](self, "disconnect");
    }
    -[MessageManager invalidate](self->_messageManager, "invalidate");
    messageManager = self->_messageManager;
    self->_messageManager = 0;

    -[BTPipeManager invalidate](self->_pipeManager, "invalidate");
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0;

    -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
    centralManager = self->_centralManager;
    self->_centralManager = 0;

  }
}

- (BOOL)isConnected
{
  CBPeripheral *peripheral;

  peripheral = self->_peripheral;
  if (peripheral)
    LOBYTE(peripheral) = (id)-[CBPeripheral state](peripheral, "state") == (id)2;
  return (char)peripheral;
}

- (unsigned)wristState
{
  unsigned int v3;

  v3 = -[ActiveWatchManager isConnected](self, "isConnected");
  if (v3)
    LOBYTE(v3) = self->_wristState;
  return v3;
}

- (BOOL)isConnecting
{
  CBPeripheral *peripheral;

  peripheral = self->_peripheral;
  if (peripheral)
    LOBYTE(peripheral) = (id)-[CBPeripheral state](peripheral, "state") == (id)1;
  return (char)peripheral;
}

- (void)connect
{
  NSObject *v3;
  NSObject *v4;
  CBCentralManager *centralManager;
  void *v6;
  void *v7;
  CBPeripheral *v8;
  CBPeripheral *peripheral;
  void *v10;
  NSUUID *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSUUID *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSUUID *deviceID;

  if (-[ActiveWatchManager isConnecting](self, "isConnecting"))
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already connecting", (uint8_t *)&v19, 2u);
    }
  }
  if (-[ActiveWatchManager isConnected](self, "isConnected"))
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already connected", (uint8_t *)&v19, 2u);
    }
  }
  if (-[CBCentralManager state](self->_centralManager, "state") == (id)5)
  {
    if (self->_peripheral)
      goto LABEL_13;
    centralManager = self->_centralManager;
    deviceID = self->_deviceID;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &deviceID, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v6));

    v8 = (CBPeripheral *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    peripheral = self->_peripheral;
    self->_peripheral = v8;

    if (self->_peripheral)
    {
      v10 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_deviceID;
        v12 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v11, "UUIDString"));
        v19 = 138412290;
        v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Successfully resolved active peripheral with identifier: (%@)", (uint8_t *)&v19, 0xCu);

      }
    }

    if (self->_peripheral)
    {
LABEL_13:
      v14 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_deviceID;
        v16 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v15, "UUIDString"));
        v19 = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Telling CoreBluetooth to connect to peripheral: (%@)", (uint8_t *)&v19, 0xCu);

      }
      -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", self->_peripheral, 0);
    }
    else
    {
      v18 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Failed connecting for now: could not lookup peripheral", (uint8_t *)&v19, 2u);
      }
    }
  }
}

- (void)disconnect
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSUUID *deviceID;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  CBPeripheral *peripheral;
  NSObject *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  int v16;
  void *v17;

  if (!-[ActiveWatchManager isConnecting](self, "isConnecting")
    && !-[ActiveWatchManager isConnected](self, "isConnected"))
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not connected or connecting", (uint8_t *)&v16, 2u);
    }
  }
  if (!self->_peripheral)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No peripheral", (uint8_t *)&v16, 2u);
    }
  }
  v5 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    deviceID = self->_deviceID;
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](deviceID, "UUIDString"));
    v16 = 138412290;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Disconnecting from %@", (uint8_t *)&v16, 0xCu);

  }
  v9 = -[ActiveWatchManager isConnected](self, "isConnected");
  if (self->_peripheral)
  {
    v10 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      peripheral = self->_peripheral;
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](peripheral, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
      v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Telling CoreBluetooth to cancel connection to peripheral %@", (uint8_t *)&v16, 0xCu);

    }
    -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:", self->_peripheral);
  }
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "activeWatchDidChangeConnectionState");

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  CBCentralManager *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  CBPeripheral *peripheral;
  id WeakRetained;
  int v13;
  void *v14;

  v4 = (CBCentralManager *)a3;
  if (self->_centralManager != v4)
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v13, 2u);
    }
  }
  v6 = (int64_t)-[CBCentralManager state](v4, "state");
  v7 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = sub_100004370(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v13 = 138412290;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central state changed (%@)", (uint8_t *)&v13, 0xCu);

  }
  if (v6 == 5)
  {
    if (!-[ActiveWatchManager isConnecting](self, "isConnecting")
      && !-[ActiveWatchManager isConnected](self, "isConnected"))
    {
      -[ActiveWatchManager connect](self, "connect");
    }
  }
  else
  {
    if (v6 <= 3)
    {
      peripheral = self->_peripheral;
      self->_peripheral = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "activeWatchDidChangeConnectionState");

  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  CBCentralManager *v6;
  CBPeripheral *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  void *v16;

  v6 = (CBCentralManager *)a3;
  v7 = (CBPeripheral *)a4;
  if (self->_centralManager != v6)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v15, 2u);
    }
  }
  if (self->_peripheral != v7)
  {
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unknown peripheral", (uint8_t *)&v15, 2u);
    }
  }
  v10 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](v7, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v15 = 138412290;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central did connect peripheral (%@)", (uint8_t *)&v15, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "activeWatchDidChangeConnectionState");

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  CBCentralManager *v8;
  CBPeripheral *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v8 = (CBCentralManager *)a3;
  v9 = (CBPeripheral *)a4;
  v10 = a5;
  if (self->_centralManager != v8)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v18, 2u);
    }
  }
  if (self->_peripheral != v9)
  {
    v12 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown peripheral", (uint8_t *)&v18, 2u);
    }
  }
  v13 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](v9, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
    v18 = 138412546;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central did fail to connect peripheral (%@) with error (%@)", (uint8_t *)&v18, 0x16u);

  }
  if (!-[ActiveWatchManager isConnecting](self, "isConnecting")
    && !-[ActiveWatchManager isConnected](self, "isConnected"))
  {
    -[ActiveWatchManager connect](self, "connect");
  }

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  CBCentralManager *v8;
  CBPeripheral *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v8 = (CBCentralManager *)a3;
  v9 = (CBPeripheral *)a4;
  v10 = a5;
  if (self->_centralManager != v8)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown central", (uint8_t *)&v19, 2u);
    }
  }
  if (self->_peripheral != v9)
  {
    v12 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown peripheral", (uint8_t *)&v19, 2u);
    }
  }
  v13 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](v9, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
    v19 = 138412546;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Central manager did disconnect peripheral (%@) error (%@)", (uint8_t *)&v19, 0x16u);

  }
  if (!-[ActiveWatchManager isConnecting](self, "isConnecting")
    && !-[ActiveWatchManager isConnected](self, "isConnected"))
  {
    -[ActiveWatchManager connect](self, "connect");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "activeWatchDidChangeConnectionState");

}

- (void)pipe:(id)a3 didConnectToPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MessageManager *v12;
  MessageManager *messageManager;
  int v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqual:", self->_deviceID))
  {
    if (self->_messageManager)
    {
      v8 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Already has a message manager", (uint8_t *)&v14, 2u);
      }
    }
    v9 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      v14 = 138412290;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Pipe did connect active Watch: (%@)", (uint8_t *)&v14, 0xCu);

    }
    v12 = -[MessageManager initWithDelegate:pipe:]([MessageManager alloc], "initWithDelegate:pipe:", self, v6);
    messageManager = self->_messageManager;
    self->_messageManager = v12;

  }
}

- (void)pipe:(id)a3 didDisconnectFromPeer:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  MessageManager *messageManager;
  int v10;
  void *v11;

  v5 = a4;
  if (objc_msgSend(v5, "isEqual:", self->_deviceID))
  {
    v6 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Pipe did disconnect peer: (%@)", (uint8_t *)&v10, 0xCu);

    }
    -[MessageManager invalidate](self->_messageManager, "invalidate");
    messageManager = self->_messageManager;
    self->_messageManager = 0;

  }
}

- (void)watchDidChangeWristState:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  uint64_t wristState;
  id WeakRetained;
  _DWORD v9[2];

  v3 = a3;
  v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ActiveWatchManager --- Active device has new wrist state: (%d)", (uint8_t *)v9, 8u);
  }
  wristState = self->_wristState;
  if (!self->_hasReceivedWristState || (_DWORD)wristState != v3)
  {
    self->_wristState = v3;
    self->_hasReceivedWristState = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "activeWatchDidChangeWristStateWithPreviousWristState:", wristState);

  }
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (void)setWristState:(unsigned __int8)a3
{
  self->_wristState = a3;
}

- (ActiveWatchManagerDelegate)delegate
{
  return (ActiveWatchManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasReceivedWristState
{
  return self->_hasReceivedWristState;
}

- (void)setHasReceivedWristState:(BOOL)a3
{
  self->_hasReceivedWristState = a3;
}

- (BTPipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pipeManager, a3);
}

- (MessageManager)messageManager
{
  return self->_messageManager;
}

- (void)setMessageManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageManager, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_messageManager, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
