@implementation NRBluetoothPairingManager

- (NRBluetoothPairingManager)init
{
  NRBluetoothPairingManager *v2;
  NRBluetoothPairingManager *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSMutableArray *v6;
  NSMutableArray *enqueuedPairers;
  NRBluetoothPairingManager *v8;
  id v10;
  int IsLevelEnabled;
  id v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NRBluetoothPairingManager;
  v2 = -[NRBluetoothPairingManager init](&v19, "init");
  if (!v2)
  {
    v10 = sub_100018DE8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v10, 16);

    if (IsLevelEnabled)
    {
      v12 = sub_100018DE8();
      _NRLogWithArgs(v12, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBluetoothPairingManager init]", 140);

    }
    v13 = _os_log_pack_size(12);
    v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = __error();
    v16 = _os_log_pack_fill(v14, v13, *v15, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "-[NRBluetoothPairingManager init]";
    v17 = sub_100018DE8();
    _NRLogAbortWithPack(v17, v14);
  }
  v3 = v2;
  if (_NRIsAppleInternal(v2))
  {
    v4 = (OS_dispatch_queue *)sub_10014CFBC();
    queue = v3->_queue;
    v3->_queue = v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    enqueuedPairers = v3->_enqueuedPairers;
    v3->_enqueuedPairers = v6;

    v8 = v3;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasPairerForNRUUID:(id)a3
{
  id v4;
  NRBluetoothPairer *activePairer;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  activePairer = self->_activePairer;
  if (activePairer
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairer nrUUID](activePairer, "nrUUID")),
        v7 = objc_msgSend(v6, "isEqual:", v4),
        v6,
        (v7 & 1) != 0))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers", 0));
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "nrUUID"));
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if ((v13 & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return (char)v8;
}

- (void)removePairerForNRUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NRBluetoothPairer *activePairer;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nrUUID"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  if (objc_msgSend(v6, "isUnpairRequest"))
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d not removing pairer as it is unpairing", ", "-[NRBluetoothPairingManager removePairerForNRUUID:]", 184);
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
    objc_msgSend(v12, "removeObject:", v6);

    activePairer = self->_activePairer;
    if (activePairer)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairer nrUUID](activePairer, "nrUUID"));
      v15 = objc_msgSend(v14, "isEqual:", v4);

      if (v15)
        -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");
    }
  }

}

- (void)resumeUnpairing
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));

  if (v3)
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      v4 = (id)qword_1001E4540;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));
      _NRLogWithArgs(v4, 1, "%s%.30s:%-4d checking if device %@ is already paired", ", "-[NRBluetoothPairingManager resumeUnpairing]", 199, v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedPairingAgent"));

    objc_msgSend(v7, "setDelegate:", self);
    v19 = v7;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "retrievePairedPeers"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
LABEL_10:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d checking peer %@", ", "-[NRBluetoothPairingManager resumeUnpairing]", 207, v13);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v16 = objc_msgSend(v14, "compare:", v15);

        if (!v16)
          break;
        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_10;
          goto LABEL_22;
        }
      }
      v17 = v13;

      if (!v17)
        goto LABEL_25;
      v18 = v19;
      objc_msgSend(v19, "unpairPeer:", v17);

    }
    else
    {
LABEL_22:

LABEL_25:
      -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1);
      v18 = v19;
    }

  }
}

- (BOOL)unpair
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  id v11;

  -[NRBluetoothPairingManager setIsUnpairing:](self, "setIsUnpairing:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

  if (!v3)
  {
    v4 = objc_alloc((Class)CBCentralManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager queue](self, "queue"));
    v6 = objc_msgSend(v4, "initWithDelegate:queue:options:", self, v5, 0);
    -[NRBluetoothPairingManager setCentralManager:](self, "setCentralManager:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nrUUID"));
  v9 = sub_10012FFF4((uint64_t)NRDLocalDevice, v8);

  if (v9)
    v10 = (void *)*((_QWORD *)v9 + 5);
  else
    v10 = 0;
  v11 = v10;
  -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v11);

  if (v3)
    -[NRBluetoothPairingManager resumeUnpairing](self, "resumeUnpairing");

  return 1;
}

- (BOOL)pair
{
  void *v3;
  void *v4;
  char *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  id v30;

  -[NRBluetoothPairingManager setIsPairing:](self, "setIsPairing:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nrUUID"));
  v5 = sub_10012FFF4((uint64_t)NRDLocalDevice, v4);

  if (v5)
  {
    if (v5[10])
    {
      v6 = *((id *)v5 + 5);
      -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v6);

      v7 = 1;
      -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1);
      goto LABEL_44;
    }
    v8 = (void *)*((_QWORD *)v5 + 16);
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  if (objc_msgSend(v9, "bluetoothRole") == (id)1)
  {
    v10 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (v5)
    v11 = (void *)*((_QWORD *)v5 + 16);
  else
    v11 = 0;
  v12 = v11;
  v13 = objc_msgSend(v12, "proxyCapability");
  v10 = v13 != (id)1;
  if (v13 == (id)1)
    goto LABEL_21;
  if (v5)
    v14 = (void *)*((_QWORD *)v5 + 16);
  else
    v14 = 0;
  v15 = v14;
  v16 = objc_msgSend(v15, "bluetoothEndpointType");

  if (v16 == (id)2)
  {
    v10 = 0;
LABEL_23:
    -[NRBluetoothPairingManager setIsPeripheralRole:](self, "setIsPeripheralRole:", v10);
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d starting central manager", ", "-[NRBluetoothPairingManager pair]", 272);
    }
    v19 = objc_alloc((Class)CBCentralManager);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager queue](self, "queue"));
    v21 = objc_msgSend(v19, "initWithDelegate:queue:options:", self, v20, 0);
    -[NRBluetoothPairingManager setCentralManager:](self, "setCentralManager:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sharedPairingAgent"));

    objc_msgSend(v23, "setDelegate:", self);
    if (v10)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d starting peripheral manager", ", "-[NRBluetoothPairingManager pair]", 281);
      }
      v24 = objc_alloc((Class)CBPeripheralManager);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager queue](self, "queue"));
      v26 = objc_msgSend(v24, "initWithDelegate:queue:options:", self, v25, 0);
      -[NRBluetoothPairingManager setPeripheralManager:](self, "setPeripheralManager:", v26);

    }
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d starting pairer for %@", ", "-[NRBluetoothPairingManager pair]", 287, v5);
    }

    v7 = 1;
    goto LABEL_44;
  }
  if (v5)
    v17 = (void *)*((_QWORD *)v5 + 16);
  else
    v17 = 0;
  v9 = v17;
  if (objc_msgSend(v9, "bluetoothRole") == (id)2)
  {
    v10 = 1;
    goto LABEL_22;
  }
  v18 = v5 ? (void *)*((_QWORD *)v5 + 16) : 0;
  v12 = v18;
  if (objc_msgSend(v12, "proxyCapability") == (id)2)
  {
LABEL_21:

    goto LABEL_22;
  }
  if (v5)
    v28 = (void *)*((_QWORD *)v5 + 16);
  else
    v28 = 0;
  v29 = v28;
  v30 = objc_msgSend(v29, "bluetoothEndpointType");

  if (v30 == (id)1)
  {
    v10 = 1;
    goto LABEL_23;
  }
  if (qword_1001E4548 != -1)
    dispatch_once(&qword_1001E4548, &stru_1001B62D0);
  if (_NRLogIsLevelEnabled(qword_1001E4540, 16))
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    _NRLogWithArgs(qword_1001E4540, 16, "%s%.30s:%-4d not enough information to pair device %@", ", "-[NRBluetoothPairingManager pair]", 265, v5);
  }
  v7 = 0;
LABEL_44:

  return v7;
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[NRBluetoothPairingManager disconnectFromPeripherals](self, "disconnectFromPeripherals");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedPairingAgent"));

  objc_msgSend(v7, "setDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
  objc_msgSend(v4, "stopAdvertising");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  objc_msgSend(v5, "stopScan");

  -[NRBluetoothPairingManager setPeripheralManager:](self, "setPeripheralManager:", 0);
  -[NRBluetoothPairingManager setCentralManager:](self, "setCentralManager:", 0);
  -[NRBluetoothPairingManager setBusy:](self, "setBusy:", 0);
  -[NRBluetoothPairingManager setIsPeripheralRole:](self, "setIsPeripheralRole:", 0);
  -[NRBluetoothPairingManager setIsUnpairing:](self, "setIsUnpairing:", 0);
  -[NRBluetoothPairingManager setIsPairing:](self, "setIsPairing:", 0);
  v6 = objc_alloc_init((Class)NSMutableSet);
  -[NRBluetoothPairingManager setPeripherals:](self, "setPeripherals:", v6);

  -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", 0);
  -[NRBluetoothPairingManager setActivePairer:](self, "setActivePairer:", 0);
  -[NRBluetoothPairingManager setPeripheralReconnectCounter:](self, "setPeripheralReconnectCounter:", 0);

}

- (void)handlePairingCompletionWithSuccess:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  BOOL v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completionBlock"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager pairedPeerBluetoothUUID](self, "pairedPeerBluetoothUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B82C;
    block[3] = &unk_1001B62B0;
    v14 = a3;
    v12 = v7;
    v13 = v6;
    v10 = v7;
    dispatch_async(v9, block);

  }
  -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");

}

- (void)disconnectFromPeripherals
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

  if (v3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[NRBluetoothPairingManager disconnectPeripheral:](self, "disconnectPeripheral:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[NRBluetoothPairingManager setPeripherals:](self, "setPeripherals:", 0);
  }
}

- (void)disconnectPeripheral:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    v4 = v8;
    if (v5)
    {
      if (objc_msgSend(v8, "state") == (id)1 || (v6 = objc_msgSend(v8, "state") == (id)2, v4 = v8, v6))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
        objc_msgSend(v7, "cancelPeripheralConnection:", v8);

        v4 = v8;
      }
    }
  }

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v7 == v4
      && (-[NRBluetoothPairingManager isPairing](self, "isPairing")
       || -[NRBluetoothPairingManager isUnpairing](self, "isUnpairing")))
    {
      v8 = (uint64_t)objc_msgSend(v4, "state");
      if (v8 == 5)
      {
        if (-[NRBluetoothPairingManager isUnpairing](self, "isUnpairing"))
        {
          -[NRBluetoothPairingManager resumeUnpairing](self, "resumeUnpairing");
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("fd74")));
          if (!-[NRBluetoothPairingManager isPeripheralRole](self, "isPeripheralRole"))
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
            v12 = v9;
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
            objc_msgSend(v10, "scanForPeripheralsWithServices:options:", v11, 0);

            if (qword_1001E4548 != -1)
              dispatch_once(&qword_1001E4548, &stru_1001B62D0);
            if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
            {
              if (qword_1001E4548 != -1)
                dispatch_once(&qword_1001E4548, &stru_1001B62D0);
              _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d started scanning", ", "-[NRBluetoothPairingManager centralManagerDidUpdateState:]", 362);
            }
          }

        }
      }
      else if (v8 <= 3)
      {
        -[NRBluetoothPairingManager disconnectFromPeripherals](self, "disconnectFromPeripherals");
      }
    }
  }

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (qword_1001E4548 != -1)
    dispatch_once(&qword_1001E4548, &stru_1001B62D0);
  if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d discovered peripheral %@", ", "-[NRBluetoothPairingManager centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 377, v10);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bluetoothUUID"));

  if (!v15)
    goto LABEL_9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parameters"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bluetoothUUID"));
  v20 = objc_msgSend(v16, "isEqual:", v19);

  if (v20)
  {
LABEL_9:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals"));
    objc_msgSend(v21, "addObject:", v10);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    objc_msgSend(v22, "connectPeripheral:options:", v10, 0);

  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v10 == v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals"));
      objc_msgSend(v11, "addObject:", v7);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
      objc_msgSend(v12, "stopScan");

      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d connected peripheral %@", ", "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]", 397, v7);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sharedPairingAgent"));

      objc_msgSend(v14, "setDelegate:", self);
      if ((objc_msgSend(v14, "isPeerPaired:", v7) & 1) != 0)
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d already paired with peripheral %@", ", "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]", 412, v7);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v15);

        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
        v17 = objc_msgSend(v16, "pairingType");

        if (v17)
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
          {
            if (qword_1001E4548 != -1)
              dispatch_once(&qword_1001E4548, &stru_1001B62D0);
            _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d ignoring pairing with peripheral %@", ", "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]", 409, v7);
          }
        }
        else
        {
          objc_msgSend(v14, "setOOBPairingEnabled:forPeer:", 0, v7);
          v19[0] = CBPairingOptionsUseMITMAuthentication;
          v19[1] = CBPairingOptionsDistributeIRK;
          v20[0] = &__kCFBooleanFalse;
          v20[1] = &__kCFBooleanTrue;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
          objc_msgSend(v14, "pairPeer:options:", v7, v18);

          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
          {
            if (qword_1001E4548 != -1)
              dispatch_once(&qword_1001E4548, &stru_1001B62D0);
            _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d initiated pairing with peripheral %@", ", "-[NRBluetoothPairingManager centralManager:didConnectPeripheral:]", 407, v7);
          }
        }
      }

    }
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v12 == v14)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d failed to connect peripheral %@ error %@", ", "-[NRBluetoothPairingManager centralManager:didFailToConnectPeripheral:error:]", 426, v8, v9);
      }
      if (-[NRBluetoothPairingManager peripheralReconnectCounter](self, "peripheralReconnectCounter") > 4)
      {
        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 0);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
        objc_msgSend(v13, "connectPeripheral:options:", v8, 0);

        -[NRBluetoothPairingManager setPeripheralReconnectCounter:](self, "setPeripheralReconnectCounter:", -[NRBluetoothPairingManager peripheralReconnectCounter](self, "peripheralReconnectCounter") + 1);
      }
    }
  }

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

    if (v10 == v15)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d disconnected peripheral %@", ", "-[NRBluetoothPairingManager centralManager:didDisconnectPeripheral:error:]", 444, v7);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripherals](self, "peripherals"));
      objc_msgSend(v11, "removeObject:", v7);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedPairingAgent"));

      if ((objc_msgSend(v13, "isPeerPaired:", v7) & 1) == 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
        objc_msgSend(v14, "connectPeripheral:options:", v7, 0);

      }
    }
  }

}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));

    if (v7 == v4)
    {
      if (-[NRBluetoothPairingManager isPairing](self, "isPairing"))
      {
        if (objc_msgSend(v4, "state") == (id)5)
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
          {
            if (qword_1001E4548 != -1)
              dispatch_once(&qword_1001E4548, &stru_1001B62D0);
            _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d starting advertisement", ", "-[NRBluetoothPairingManager peripheralManagerDidUpdateState:]", 465);
          }
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
          v13 = CBAdvertisementDataServiceUUIDsKey;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("fd74")));
          v12 = v9;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
          v14 = v10;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
          objc_msgSend(v8, "startAdvertising:", v11);

        }
        else
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
          {
            if (qword_1001E4548 != -1)
              dispatch_once(&qword_1001E4548, &stru_1001B62D0);
            _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d stopping advertisement", ", "-[NRBluetoothPairingManager peripheralManagerDidUpdateState:]", 468);
          }
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager peripheralManager](self, "peripheralManager"));
          objc_msgSend(v8, "stopAdvertising");
        }

      }
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager centralManager](self, "centralManager"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sharedPairingAgent"));

    if (v12 == v15)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 0))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 0, "%s%.30s:%-4d requested peer pairing with type: %zd", ", "-[NRBluetoothPairingManager pairingAgent:peerDidRequestPairing:type:passkey:]", 485, a5);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
      v14 = objc_msgSend(v13, "pairingType");

      if (!v14)
        objc_msgSend(v15, "respondToPairingRequest:type:accept:data:", v9, a5, 1, 0);
    }

  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activePairer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));

    if (v8 == v9)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 0))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 0, "%s%.30s:%-4d peripheral %@ completed pairing successfully\n", ", "-[NRBluetoothPairingManager pairingAgent:peerDidCompletePairing:]", 501, v11);
      }
      if (-[NRBluetoothPairingManager isPairing](self, "isPairing"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        -[NRBluetoothPairingManager setPairedPeerBluetoothUUID:](self, "setPairedPeerBluetoothUUID:", v10);

        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1);
      }
      else
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        if (_NRLogIsLevelEnabled(qword_1001E4540, 17))
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          _NRLogWithArgs(qword_1001E4540, 17, "unexpected pairing result for peer %@", v11);
        }
      }
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activePairer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));

    if (v11 == v12)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 0))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 0, "%s%.30s:%-4d peripheral %@ failed to complete pairing with error %@\n", ", "-[NRBluetoothPairingManager pairingAgent:peerDidFailToCompletePairing:error:]", 516, v15, v8);
      }
      v13 = objc_opt_self(self);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v14, "setPairedPeerBluetoothUUID:", 0);

      -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 0);
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activePairer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));

    if (v8 == v9)
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      if (_NRLogIsLevelEnabled(qword_1001E4540, 0))
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        _NRLogWithArgs(qword_1001E4540, 0, "%s%.30s:%-4d peripheral %@ unpaired\n", ", "-[NRBluetoothPairingManager pairingAgent:peerDidUnpair:]", 527, v12);
      }
      if (-[NRBluetoothPairingManager isUnpairing](self, "isUnpairing"))
      {
        -[NRBluetoothPairingManager handlePairingCompletionWithSuccess:](self, "handlePairingCompletionWithSuccess:", 1);
        v10 = objc_opt_self(self);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        objc_msgSend(v11, "setPairedPeerBluetoothUUID:", 0);

      }
      else
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        if (_NRLogIsLevelEnabled(qword_1001E4540, 17))
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          _NRLogWithArgs(qword_1001E4540, 17, "unexpected pairing result for peer %@", v12);
        }
      }
    }
  }

}

- (void)startNextPairer
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NRBluetoothPairingManager reset](self, "reset");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      v5 = (id)qword_1001E4540;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
      _NRLogWithArgs(v5, 1, "%s%.30s:%-4d starting: %@", ", "-[NRBluetoothPairingManager startNextPairer]", 545, v6);

    }
    -[NRBluetoothPairingManager setBusy:](self, "setBusy:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    -[NRBluetoothPairingManager setActivePairer:](self, "setActivePairer:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager activePairer](self, "activePairer"));
    LODWORD(v8) = objc_msgSend(v10, "isUnpairRequest");

    if ((_DWORD)v8)
    {
      if (!-[NRBluetoothPairingManager unpair](self, "unpair"))
        goto LABEL_19;
    }
    else if (!-[NRBluetoothPairingManager pair](self, "pair"))
    {
LABEL_19:
      -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");
    }
  }
  else
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d no more pairer requests", ", "-[NRBluetoothPairingManager startNextPairer]", 541);
    }
  }
}

- (void)enqueuePairer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairingManager enqueuedPairers](self, "enqueuedPairers"));
  objc_msgSend(v4, "addObject:", v5);

  if (-[NRBluetoothPairingManager busy](self, "busy"))
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d enqueued: %@", ", "-[NRBluetoothPairingManager enqueuePairer:]", 567, v5);
    }
  }
  else
  {
    -[NRBluetoothPairingManager startNextPairer](self, "startNextPairer");
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
  objc_storeStrong((id *)&self->_peripheralManager, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)isPeripheralRole
{
  return self->_isPeripheralRole;
}

- (void)setIsPeripheralRole:(BOOL)a3
{
  self->_isPeripheralRole = a3;
}

- (BOOL)isUnpairing
{
  return self->_isUnpairing;
}

- (void)setIsUnpairing:(BOOL)a3
{
  self->_isUnpairing = a3;
}

- (BOOL)isPairing
{
  return self->_isPairing;
}

- (void)setIsPairing:(BOOL)a3
{
  self->_isPairing = a3;
}

- (NSMutableSet)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_peripherals, a3);
}

- (NSUUID)pairedPeerBluetoothUUID
{
  return self->_pairedPeerBluetoothUUID;
}

- (void)setPairedPeerBluetoothUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pairedPeerBluetoothUUID, a3);
}

- (unsigned)peripheralReconnectCounter
{
  return self->_peripheralReconnectCounter;
}

- (void)setPeripheralReconnectCounter:(unsigned int)a3
{
  self->_peripheralReconnectCounter = a3;
}

- (NSMutableArray)enqueuedPairers
{
  return self->_enqueuedPairers;
}

- (void)setEnqueuedPairers:(id)a3
{
  objc_storeStrong((id *)&self->_enqueuedPairers, a3);
}

- (NRBluetoothPairer)activePairer
{
  return self->_activePairer;
}

- (void)setActivePairer:(id)a3
{
  objc_storeStrong((id *)&self->_activePairer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairer, 0);
  objc_storeStrong((id *)&self->_enqueuedPairers, 0);
  objc_storeStrong((id *)&self->_pairedPeerBluetoothUUID, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)copySharedManager
{
  if (qword_1001E4538 != -1)
    dispatch_once(&qword_1001E4538, &stru_1001B6288);
  return (id)qword_1001E4530;
}

@end
