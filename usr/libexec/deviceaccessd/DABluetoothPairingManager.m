@implementation DABluetoothPairingManager

- (DABluetoothPairingManager)init
{
  DABluetoothPairingManager *v2;
  DABluetoothPairingManager *v3;
  OS_dispatch_queue *dispatchQueue;
  CBCentralManager *cbCentralManager;
  CBPairingAgent *cbPairingAgent;
  NSMutableArray *v7;
  NSMutableArray *taskList;
  DABluetoothPairingManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DABluetoothPairingManager;
  v2 = -[DABluetoothPairingManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = 0;

    cbCentralManager = v3->_cbCentralManager;
    v3->_cbCentralManager = 0;

    cbPairingAgent = v3->_cbPairingAgent;
    v3->_cbPairingAgent = 0;

    v3->_currentTaskEndEvent = 0;
    v7 = objc_opt_new(NSMutableArray);
    taskList = v3->_taskList;
    v3->_taskList = v7;

    *(_WORD *)&v3->_cbPowerOn = 0;
    v3->_busy = 0;
    v3->_taskTimeoutSeconds = 30.0;
    v9 = v3;
  }

  return v3;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021520;
  block[3] = &unk_100038950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)persistBluetoothDevice:(id)a3 pairingRequired:(BOOL)a4 pairWithCTKD:(BOOL)a5 displayName:(id)a6 taskTimeout:(id)a7 appConfirmsAuth:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSUUID *v20;
  id v21;
  id v22;
  NSUUID *bluetoothUUID;
  NSObject *dispatchQueue;
  _QWORD block[9];
  BOOL v26;
  BOOL v27;
  BOOL v28;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager persistBluetoothDevice:pairingRequired:pairWithCTKD:displayName:taskTimeout:appConfirmsAuth:completion:]", 50, "### persistBluetoothDevice %@", v15);
  v19 = objc_retainBlock(v18);
  v20 = (NSUUID *)v15;
  v21 = v16;
  v22 = v17;
  bluetoothUUID = self->_bluetoothUUID;
  self->_bluetoothUUID = v20;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021750;
    block[3] = &unk_1000395A0;
    block[4] = self;
    block[5] = v20;
    block[7] = v22;
    block[8] = v19;
    v26 = a4;
    v27 = a5;
    block[6] = v21;
    v28 = a8;
    dispatch_async(dispatchQueue, block);
  }
  else if (dword_10003F7C0 <= 30
         && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 30)))
  {
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager persistBluetoothDevice:pairingRequired:pairWithCTKD:displayName:taskTimeout:appConfirmsAuth:completion:]", 30, "### persistBluetoothDevice no queue");
  }

}

- (void)forgetBluetoothDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *dispatchQueue;
  _QWORD block[7];

  v6 = a3;
  v7 = a4;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager forgetBluetoothDevice:completion:]", 50, "### forgetBluetoothDevice %@ cbManager %@", v6, self->_cbCentralManager);
  v8 = objc_retainBlock(v7);
  v9 = v6;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021900;
    block[3] = &unk_1000395C8;
    block[4] = self;
    block[5] = v9;
    block[6] = v8;
    dispatch_async(dispatchQueue, block);
  }
  else if (dword_10003F7C0 <= 30
         && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 30)))
  {
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager forgetBluetoothDevice:completion:]", 30, "### forgetBluetoothDevice no queue");
  }

}

- (void)cancelCurrentTask
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager cancelCurrentTask]", 50, "### cancelCurrentTask cbManager %@ tasks %@", self->_cbCentralManager, self->_taskList);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021A0C;
  block[3] = &unk_100038950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)cancelAll
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager cancelAll]", 50, "### cancelAll cbManager %@ tasks %@", self->_cbCentralManager, self->_taskList);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021CA4;
  block[3] = &unk_100038950;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)getCurrentTaskBluetoothIdentifier
{
  DABluetoothTask *currentTask;

  currentTask = self->_currentTask;
  if (currentTask)
    currentTask = (DABluetoothTask *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](currentTask, "bluetoothUUID"));
  return currentTask;
}

- (void)_runNextTask
{
  DABluetoothTask *currentTask;
  DABluetoothTask *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CBCentralManager *v8;
  CBCentralManager *v9;
  CBPairingAgent *v10;
  CBPairingAgent *cbPairingAgent;
  DABluetoothTask *v12;
  DABluetoothTask *v13;
  DABluetoothTask *v14;
  void *v15;
  id v16;
  OS_dispatch_queue *dispatchQueue;
  CBCentralManager *cbCentralManager;
  void *v19;
  void *v20;
  void *v21;
  CBPeripheral *v22;
  CBPeripheral *cbPeripheral;
  int64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  void *v33;

  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask _currentTask:%@", self->_currentTask);
  currentTask = self->_currentTask;
  if (currentTask)
  {
    if (dword_10003F7C0 > 30)
      return;
    if (dword_10003F7C0 == -1)
    {
      if (!_LogCategory_Initialize(&dword_10003F7C0, 30))
        return;
      currentTask = self->_currentTask;
    }
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 30, "### _runNextTask waiting for current operation to be completed %@", currentTask);
    return;
  }
  if (self->_cbCentralManager)
  {
    if (!self->_cbPowerOn)
      return;
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask Power On");
    }
    if (-[NSMutableArray count](self->_taskList, "count"))
    {
      if (dword_10003F7C0 <= 50
        && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
      {
        LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask tasks %@", self->_taskList);
      }
      v12 = (DABluetoothTask *)objc_claimAutoreleasedReturnValue(-[DABluetoothPairingManager _getNextTask](self, "_getNextTask"));
      v13 = self->_currentTask;
      self->_currentTask = v12;

      self->_currentTaskEndEvent = 0;
      v14 = self->_currentTask;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask taskTimeout](v14, "taskTimeout"));
      v16 = objc_msgSend(v15, "integerValue");
      dispatchQueue = self->_dispatchQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100022578;
      v32[3] = &unk_100038950;
      v32[4] = self;
      -[DABluetoothTask setTimerTimeout:queue:handler:](v14, "setTimerTimeout:queue:handler:", dispatchQueue, v32, (double)(uint64_t)v16);

      cbCentralManager = self->_cbCentralManager;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
      v33 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralsWithIdentifiers:](cbCentralManager, "retrievePeripheralsWithIdentifiers:", v20));

      if (!v21 || objc_msgSend(v21, "count") != (id)1)
      {
        if (dword_10003F7C0 <= 50
          && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
          LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask cannot connect use %@, aborting", v25);

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
        v27 = DAErrorF(350009, "persistBluetoothDevice btuuid %@ Invalid device task %@", v26, self->_currentTask);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v28);

        goto LABEL_40;
      }
      v22 = (CBPeripheral *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
      cbPeripheral = self->_cbPeripheral;
      self->_cbPeripheral = v22;

      v24 = -[DABluetoothTask btOperation](self->_currentTask, "btOperation");
      switch(v24)
      {
        case 10:
          goto LABEL_69;
        case 30:
          if (dword_10003F7C0 <= 50
            && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
          {
            LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask forgetting %@", self->_cbPeripheral);
          }
          -[CBPairingAgent unpairPeer:](self->_cbPairingAgent, "unpairPeer:", self->_cbPeripheral);
          break;
        case 20:
LABEL_69:
          if (dword_10003F7C0 <= 50
            && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
          {
            LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask connecting to %@", self->_cbPeripheral);
          }
          if (-[CBPairingAgent isPeerPaired:](self->_cbPairingAgent, "isPeerPaired:", self->_cbPeripheral))
          {
            if (dword_10003F7C0 <= 50
              && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
            {
              LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask %@ already paired", self->_cbPeripheral);
            }
            -[DABluetoothPairingManager pairingAgent:peerDidCompletePairing:](self, "pairingAgent:peerDidCompletePairing:", self->_cbPairingAgent, self->_cbPeripheral);
          }
          else
          {
            -[CBCentralManager connectPeripheral:options:](self->_cbCentralManager, "connectPeripheral:options:", self->_cbPeripheral, 0);
          }
          break;
        default:
          if (dword_10003F7C0 <= 50
            && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
          {
            LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask unhandled operation %ld", -[DABluetoothTask btOperation](self->_currentTask, "btOperation"));
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
          v30 = DAErrorF(350011, "persistBluetoothDevice btuuid %@ invalid task %@", v29, self->_currentTask);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

          -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v31);
          break;
      }
LABEL_40:

      return;
    }
    v4 = self->_currentTask;
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](v4, "bluetoothUUID"));
      v6 = DAErrorF(350008, "bluetooth is no longer turned on btuuid %@ task %@", v5, self->_currentTask);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v7);

    }
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask we're done");
    }
    -[DABluetoothPairingManager cancelAll](self, "cancelAll");
  }
  else
  {
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]", 50, "### _runNextTask creating CBManager");
    }
    v8 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)CBCentralManager), "initWithDelegate:queue:options:", self, self->_dispatchQueue, 0);
    v9 = self->_cbCentralManager;
    self->_cbCentralManager = v8;

    v10 = (CBPairingAgent *)objc_claimAutoreleasedReturnValue(-[CBCentralManager sharedPairingAgent](self->_cbCentralManager, "sharedPairingAgent"));
    cbPairingAgent = self->_cbPairingAgent;
    self->_cbPairingAgent = v10;

    -[CBPairingAgent setDelegate:](self->_cbPairingAgent, "setDelegate:", self);
  }
}

- (void)_reportEvent:(int64_t)a3 error:(id)a4 endCurrentTask:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const __CFString *v9;
  int64_t currentTaskEndEvent;
  const __CFString *v11;
  const char *v12;
  DABluetoothTask *currentTask;
  _BOOL8 v14;
  void *v15;
  id v16;
  CBPeripheral *cbPeripheral;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  CBPeripheral *v20;
  DABluetoothTask *v21;
  id v22;

  v5 = a5;
  v22 = a4;
  if (dword_10003F7C0 > 50 || dword_10003F7C0 == -1 && !_LogCategory_Initialize(&dword_10003F7C0, 50))
    goto LABEL_33;
  if (a3 <= 19)
  {
    if (a3)
    {
      v8 = v22;
      if (a3 == 10)
      {
        v9 = CFSTR("DABluetoothEventAccessoryConnected");
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v9 = CFSTR("DABluetoothEventUnknown");
LABEL_16:
    v8 = v22;
    goto LABEL_18;
  }
  if (a3 == 20)
  {
    v9 = CFSTR("DABluetoothEventCompleted");
    goto LABEL_16;
  }
  if (a3 == 30)
  {
    v9 = CFSTR("DABluetoothEventFailed");
    goto LABEL_16;
  }
  v8 = v22;
  if (a3 == 40)
  {
    v9 = CFSTR("DABluetoothEventPairingRequested");
    goto LABEL_18;
  }
LABEL_17:
  v9 = CFSTR("?");
LABEL_18:
  currentTaskEndEvent = self->_currentTaskEndEvent;
  if (currentTaskEndEvent <= 19)
  {
    if (!currentTaskEndEvent)
    {
      v11 = CFSTR("DABluetoothEventUnknown");
      goto LABEL_30;
    }
    if (currentTaskEndEvent == 10)
    {
      v11 = CFSTR("DABluetoothEventAccessoryConnected");
      goto LABEL_30;
    }
LABEL_29:
    v11 = CFSTR("?");
    goto LABEL_30;
  }
  if (currentTaskEndEvent == 20)
  {
    v11 = CFSTR("DABluetoothEventCompleted");
    goto LABEL_30;
  }
  if (currentTaskEndEvent == 30)
  {
    v11 = CFSTR("DABluetoothEventFailed");
    goto LABEL_30;
  }
  if (currentTaskEndEvent != 40)
    goto LABEL_29;
  v11 = CFSTR("DABluetoothEventPairingRequested");
LABEL_30:
  v12 = "no";
  if (v5)
    v12 = "yes";
  LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _reportEvent:error:endCurrentTask:]", 50, "### _reportEvent event %@ _currentTaskEndEvent %@ errorcode %@ endTask %s %@", v9, v11, v8, v12, self->_currentTask);
LABEL_33:
  if (!self->_currentTaskEndEvent)
  {
    currentTask = self->_currentTask;
    if (currentTask)
    {
      v14 = -[DABluetoothTask pairedCTKD](currentTask, "pairedCTKD");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](self->_cbPeripheral, "identifier"));
      v16 = objc_msgSend(objc_alloc((Class)DABluetoothPairingInfo), "initWithBluetoothIdentifier:pairedCTKD:appConfirmsAuth:pairingRequired:", v15, v14, -[DABluetoothTask appConfirmsAuth](self->_currentTask, "appConfirmsAuth"), (id)-[DABluetoothTask btOperation](self->_currentTask, "btOperation") == (id)10);
      if (!v22)
      {
        cbPeripheral = self->_cbPeripheral;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask displayName](self->_currentTask, "displayName"));
        -[CBPeripheral setCustomProperty:value:](cbPeripheral, "setCustomProperty:value:", CFSTR("ASK_DISPLAY_NAME"), v18);

      }
      v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DABluetoothTask eventHandler](self->_currentTask, "eventHandler"));
      ((void (**)(_QWORD, int64_t, id, id))v19)[2](v19, a3, v16, v22);

    }
  }
  if (v5)
  {
    self->_busy = -[NSMutableArray count](self->_taskList, "count") != 0;
    -[DABluetoothTask cancelTimer](self->_currentTask, "cancelTimer");
    v20 = self->_cbPeripheral;
    self->_cbPeripheral = 0;
    self->_currentTaskEndEvent = a3;

    v21 = self->_currentTask;
    self->_currentTask = 0;

    -[DABluetoothPairingManager _runNextTask](self, "_runNextTask");
  }

}

- (void)_reportFailure:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_10003F7C0 <= 50)
  {
    if (dword_10003F7C0 != -1 || (v5 = _LogCategory_Initialize(&dword_10003F7C0, 50), v4 = v6, v5))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _reportFailure:]", 50, "### _reportFailure %@ error %@", self->_currentTask, v4);
      v4 = v6;
    }
  }
  -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 30, v4, 1);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;

  v4 = -[CBCentralManager state](self->_cbCentralManager, "state", a3);
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager centralManagerDidUpdateState:]", 50, "### centralManagerDidUpdateState powerState: %d", v4 == (id)5);
  self->_cbPowerOn = v4 == (id)5;
  -[DABluetoothPairingManager _runNextTask](self, "_runNextTask");
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  _BOOL8 mitmPairing;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v6 = a3;
  v7 = a4;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager peripheral:didDiscoverServices:]", 50, "### peripheral didDiscoverServices %@ %@ %@", v6, v7, self->_currentTask);
  if (!v7
    && self->_currentTask
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID")),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        v10))
  {
    mitmPairing = self->_mitmPairing;
    v12 = -[DABluetoothTask pairCTKD](self->_currentTask, "pairCTKD") ^ 1;
    v18[0] = CBPairingOptionsUseMITMAuthentication;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", mitmPairing));
    v18[1] = CFSTR("kCBMsgArgPairingOptionsDisableCTKD");
    v19[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
    v19[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager peripheral:didDiscoverServices:]", 50, "### peripheral didDiscoverServices starting pairing to %@ options %@", v6, v15);
    }
    -[CBPairingAgent pairPeer:options:](self->_cbPairingAgent, "pairPeer:options:", v6, v15);
  }
  else
  {
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager peripheral:didDiscoverServices:]", 50, "### peripheral didDiscoverServices error discovering services %@ %@, failing", v7, v6);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v16 = DAErrorF(350013, "peripheral didDiscoverServices btuuid %@ Failed to discover services task %@", v15, self->_currentTask);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v17);

  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int64_t v10;
  DABluetoothTask *currentTask;
  uint64_t v12;
  DABluetoothPairingManager *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager centralManager:didConnectPeripheral:]", 50, "### centralManager didConnectPeripheral %@ %@", v6, self->_currentTask);
  if (!self->_currentTask
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID")),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        !v9))
  {
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager centralManager:didConnectPeripheral:]", 50, "### centralManager didConnectPeripheral did not ask to connect to %@, failing", v6);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v16 = DAErrorF(350013, "centralManager didConnectPeripheral btuuid %@ Failed to connect task %@", v15, self->_currentTask);
LABEL_19:
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v17);

    goto LABEL_20;
  }
  v10 = -[DABluetoothTask btOperation](self->_currentTask, "btOperation");
  currentTask = self->_currentTask;
  if (v10 != 10)
  {
    if ((id)-[DABluetoothTask btOperation](currentTask, "btOperation") == (id)20)
    {
      -[CBPeripheral tag:](self->_cbPeripheral, "tag:", CFSTR("DA_ASK_RETAIN_DEVICE"));
      v12 = -[DABluetoothTask appConfirmsAuth](self->_currentTask, "appConfirmsAuth") ^ 1;
      v13 = self;
      v14 = 20;
LABEL_27:
      -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](v13, "_reportEvent:error:endCurrentTask:", v14, 0, v12);
      goto LABEL_20;
    }
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager centralManager:didConnectPeripheral:]", 50, "### Connected to %@ but not trying to persist/pair, failing", v6);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v16 = DAErrorF(350013, "centralManager didConnectPeripheral btuuid %@ invalid btOperation task %@", v15, self->_currentTask);
    goto LABEL_19;
  }
  if (-[DABluetoothTask appConfirmsAuth](currentTask, "appConfirmsAuth"))
  {
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager centralManager:didConnectPeripheral:]", 50, "### Connected to %@ letting app take it from here", v6);
    }
    v13 = self;
    v14 = 10;
    v12 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "discoverServices:", 0);
LABEL_20:

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager centralManager:didDisconnectPeripheral:error:]", 50, "### centralManager didDisconnectPeripheral %@ error %@ %@", v8, v9, self->_currentTask, v13);
  -[CBPeripheral untag:](self->_cbPeripheral, "untag:", CFSTR("DA_ASK_RETAIN_DEVICE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v11 = DAErrorF(350012, "centralManager didDisconnectPeripheral btuuid %@ Disconnected task %@", v10, self->_currentTask);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v12);

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager pairingAgent:peerDidCompletePairing:]", 50, "### peerDidCompletePairing %@ %@", v6, self->_currentTask);
  if (self->_currentTask)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      -[CBPeripheral tag:](self->_cbPeripheral, "tag:", CFSTR("DA_ASK_RETAIN_DEVICE"));
      if (-[DABluetoothTask pairCTKD](self->_currentTask, "pairCTKD")
        && -[CBPeripheral hasTag:](self->_cbPeripheral, "hasTag:", CFSTR("_CTKD_")))
      {
        -[CBPeripheral tag:](self->_cbPeripheral, "tag:", CFSTR("_DENY_INCOMING_CLASSIC_CONNECTION_"));
        -[DABluetoothTask setPairedCTKD:](self->_currentTask, "setPairedCTKD:", 1);
      }
      -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 20, 0, -[DABluetoothTask appConfirmsAuth](self->_currentTask, "appConfirmsAuth") ^ 1);
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
  {
    v10 = CUPrintNSError(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager pairingAgent:peerDidFailToCompletePairing:error:]", 50, "### peerDidFailToCompletePairing %@ %@ %@", v8, v11, self->_currentTask, v18);

  }
  if (self->_currentTask)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
    {
      objc_msgSend(v8, "untag:", CFSTR("DA_ASK_RETAIN_DEVICE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v16 = DAErrorF(350010, "peerDidFailToCompletePairing btuuid %@ task %@ error %@", v15, self->_currentTask, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[DABluetoothPairingManager _reportFailure:](self, "_reportFailure:", v17);

    }
  }

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager pairingAgent:peerDidUnpair:]", 50, "### peerDidUnpair %@ %@", v6, self->_currentTask);
  if (self->_currentTask)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
      -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 20, 0, 1);
  }

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v10 = a4;
  v11 = a6;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager pairingAgent:peerDidRequestPairing:type:passkey:]", 50, "### peerDidRequestPairing %@ pairingtype: %d passkey: %@ %@", v10, a5, v11, self->_currentTask);
  if (self->_currentTask)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
    {
      v15 = 0;
      v16 = 10;
      switch(a5)
      {
        case 0:
          break;
        case 1:
          v15 = 0;
          v16 = 20;
          break;
        case 2:
          v15 = 0;
          v16 = 30;
          break;
        case 4:
          v15 = 0;
          v16 = 40;
          break;
        default:
          v16 = 0;
          v15 = 1;
          break;
      }
      v17 = v11;
      if (dword_10003F7C0 <= 50
        && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
      {
        LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager pairingAgent:peerDidRequestPairing:type:passkey:]", 50, "### peerDidRequestPairing %@", v10);
      }
      if (v15)
      {
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v19 = DAErrorF(350010, "peerDidRequestPairing btuuid %@ pairingType %ld task %@", v18, a5, self->_currentTask);
        v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v19);
        -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 30, v20, 1);
      }
      else
      {
        v21 = objc_alloc((Class)DABluetoothPairingInfo);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v18 = objc_msgSend(v21, "initWithBluetoothIdentifier:pairingType:", v22, v16);

        if (v18)
        {
          objc_msgSend(v18, "setPasskey:", v17);
          v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DABluetoothTask eventHandler](self->_currentTask, "eventHandler"));
          ((void (**)(_QWORD, uint64_t, id, _QWORD))v20)[2](v20, 40, v18, 0);
        }
        else
        {
          v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DABluetoothTask eventHandler](self->_currentTask, "eventHandler"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
          v24 = DAErrorF(350010, "Unable to create DABluetoothPairingInfo btuuid %@ pairingType %ld task %@ missing passkey", v23, a5, self->_currentTask);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          ((void (**)(_QWORD, uint64_t, _QWORD, void *))v20)[2](v20, 30, 0, v25);

        }
      }

    }
  }

}

- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 passkey:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  CBPeripheral *v12;
  CBPeripheral *cbPeripheral;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager respondToPairingRequest:type:accept:passkey:]", 50, "### respondToPairingRequest btUUID %@ type %d accept %d passkey %@ _cbPeripheral %@ %@ ", v10, (unsigned __int16)a4, v7, v11, self->_cbPeripheral, self->_currentTask);
  v12 = (CBPeripheral *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](self->_currentTask, "bluetoothUUID"));
  if (!objc_msgSend(v10, "isEqual:", v12))
    goto LABEL_25;
  cbPeripheral = self->_cbPeripheral;

  if (cbPeripheral)
  {
    v12 = self->_cbPeripheral;
    if (a4 <= 19)
    {
      if (!a4)
      {
        v17 = DAErrorF(350010, "respondToPairingRequest btuuid %@ pairingType %ld task %@", v10, 3, self->_currentTask);
LABEL_24:
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        -[DABluetoothPairingManager _reportEvent:error:endCurrentTask:](self, "_reportEvent:error:endCurrentTask:", 30, v18, 1);

        goto LABEL_25;
      }
      if (a4 == 10)
      {
        v14 = 0;
        v15 = 0;
LABEL_20:
        -[CBPairingAgent respondToPairingRequest:type:accept:data:](self->_cbPairingAgent, "respondToPairingRequest:type:accept:data:", v12, v14, v7, v15);

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      switch(a4)
      {
        case 20:
          v14 = 1;
          if (!v11)
            goto LABEL_23;
          goto LABEL_19;
        case 30:
          v14 = 2;
          if (!v11)
          {
LABEL_23:
            v17 = DAErrorF(350010, "respondToPairingRequest btuuid %@ pairingType %ld task %@ missing passkey", v10, v14, self->_currentTask);
            goto LABEL_24;
          }
LABEL_19:
          v19 = CBPairingAgentPairingDataPasskeyKey;
          v20 = v11;
          v16 = v11;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

          goto LABEL_20;
        case 40:
          v14 = 4;
          if (!v11)
            goto LABEL_23;
          goto LABEL_19;
      }
    }
    v14 = 3;
    if (!v11)
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_26:

}

- (void)_addNewTask:(id)a3 completion:(id)a4 bluetoothOp:(int64_t)a5 pairCTKD:(BOOL)a6 displayName:(id)a7 taskTimeout:(id)a8 appConfirmsAuth:(BOOL)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  DABluetoothTask *v18;
  NSMutableArray *v19;
  NSMutableArray *taskList;
  DABluetoothTask *currentTask;
  void *v22;
  void *v23;
  int64_t v24;
  id v25;
  id v26;

  v11 = a6;
  v26 = a3;
  v15 = a8;
  v16 = a7;
  v17 = a4;
  v18 = objc_alloc_init(DABluetoothTask);
  -[DABluetoothTask setBluetoothUUID:](v18, "setBluetoothUUID:", v26);
  -[DABluetoothTask setEventHandler:](v18, "setEventHandler:", v17);

  -[DABluetoothTask setBtOperation:](v18, "setBtOperation:", a5);
  -[DABluetoothTask setPairCTKD:](v18, "setPairCTKD:", v11);
  -[DABluetoothTask setDisplayName:](v18, "setDisplayName:", v16);

  -[DABluetoothTask setTaskTimeout:](v18, "setTaskTimeout:", v15);
  -[DABluetoothTask setAppConfirmsAuth:](v18, "setAppConfirmsAuth:", a9);
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _addNewTask:completion:bluetoothOp:pairCTKD:displayName:taskTimeout:appConfirmsAuth:]", 50, "### _addNewTask %@", v18);
  if (!self->_taskList)
  {
    v19 = objc_opt_new(NSMutableArray);
    taskList = self->_taskList;
    self->_taskList = v19;

  }
  currentTask = self->_currentTask;
  if (currentTask)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](currentTask, "bluetoothUUID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DABluetoothTask bluetoothUUID](v18, "bluetoothUUID"));
    if (objc_msgSend(v22, "isEqual:", v23))
    {
      v24 = -[DABluetoothTask btOperation](self->_currentTask, "btOperation");
      v25 = -[DABluetoothTask btOperation](v18, "btOperation");

      if ((id)v24 == v25)
      {
        if (dword_10003F7C0 <= 50
          && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
        {
          LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _addNewTask:completion:bluetoothOp:pairCTKD:displayName:taskTimeout:appConfirmsAuth:]", 50, "### _addNewTask bt operation already in progress not adding new task %@", v26);
        }
        goto LABEL_19;
      }
    }
    else
    {

    }
  }
  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _addNewTask:completion:bluetoothOp:pairCTKD:displayName:taskTimeout:appConfirmsAuth:]", 50, "### _addNewTask %@", v18);
  -[NSMutableArray addObject:](self->_taskList, "addObject:", v18);
LABEL_19:
  self->_busy = 1;

}

- (id)_getNextTask
{
  void *v3;

  if (-[NSMutableArray count](self->_taskList, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_taskList, "objectAtIndexedSubscript:", 0));
    -[NSMutableArray removeObjectAtIndex:](self->_taskList, "removeObjectAtIndex:", 0);
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _getNextTask]", 50, "### _getNextTask %@, remaining %@", v3, self->_taskList);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)mitmPairing
{
  return self->_mitmPairing;
}

- (void)setMitmPairing:(BOOL)a3
{
  self->_mitmPairing = a3;
}

- (BOOL)busy
{
  return self->_busy;
}

- (double)taskTimeoutSeconds
{
  return self->_taskTimeoutSeconds;
}

- (void)setTaskTimeoutSeconds:(double)a3
{
  self->_taskTimeoutSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_taskList, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_cbPeripheral, 0);
  objc_storeStrong((id *)&self->_cbPairingAgent, 0);
  objc_storeStrong((id *)&self->_cbCentralManager, 0);
}

@end
