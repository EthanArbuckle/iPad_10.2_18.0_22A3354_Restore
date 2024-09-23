@implementation DABluetoothTask

- (DABluetoothTask)init
{
  DABluetoothTask *v2;
  DABluetoothTask *v3;
  DABluetoothTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DABluetoothTask;
  v2 = -[DABluetoothTask init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)description
{
  return -[DABluetoothTask descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (void)setTimerTimeout:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  dispatch_source_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD handler[5];
  id v15;

  v8 = a5;
  v9 = a4;
  -[DABluetoothTask cancelTimer](self, "cancelTimer");
  v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);

  objc_storeStrong((id *)&self->taskTimer, v10);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100021078;
  handler[3] = &unk_100039578;
  handler[4] = self;
  v15 = v8;
  v11 = v8;
  dispatch_source_set_event_handler(v10, handler);
  if (dword_10003F7C0 <= 30 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 30)))
  {
    v12 = CUPrintDurationDouble(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    LogPrintF(&dword_10003F7C0, "-[DABluetoothTask setTimerTimeout:queue:handler:]", 30, "BT task timeout timer start: %@", v13);

  }
  CUDispatchTimerSet(v10, a3, -1.0, 1.0);
  dispatch_activate(v10);

}

- (void)cancelTimer
{
  OS_dispatch_source *taskTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  taskTimer = self->taskTimer;
  if (taskTimer)
  {
    v5 = taskTimer;
    dispatch_source_cancel(v5);
    v4 = self->taskTimer;
    self->taskTimer = 0;

  }
}

- (id)descriptionWithLevel:(int)a3
{
  int v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  int64_t btOperation;
  const __CFString *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  NSNumber *taskTimeout;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;

  if ((a3 & 0x8000000) != 0)
    v4 = 8;
  else
    v4 = 12;
  v28 = v4;
  if ((a3 & 0x8000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v27 = 0;
    v5 = objc_opt_class(self, a2);
    CUAppendF(&v27, &v28, "%@", v5);
    v6 = v27;
  }
  v26 = v6;
  CUAppendF(&v26, &v28, "appConfirmsAuth %d", self->_appConfirmsAuth);
  v7 = v26;

  v25 = v7;
  CUAppendF(&v25, &v28, "btuuid %@", self->_bluetoothUUID);
  v8 = v25;

  v24 = v8;
  btOperation = self->_btOperation;
  if (btOperation > 19)
  {
    if (btOperation != 20)
    {
      if (btOperation == 30)
      {
        v10 = CFSTR("DABluetoothOperationForget");
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    v10 = CFSTR("DABluetoothOperationPersist");
  }
  else
  {
    if (btOperation)
    {
      if (btOperation == 10)
      {
        v10 = CFSTR("DABluetoothOperationPair");
        goto LABEL_17;
      }
LABEL_14:
      v10 = CFSTR("?");
      goto LABEL_17;
    }
    v10 = CFSTR("DABluetoothOperationUnknown");
  }
LABEL_17:
  CUAppendF(&v24, &v28, "operation %@", v10);
  v11 = v24;

  v23 = v11;
  CUAppendF(&v23, &v28, "CTKD %d", self->_pairCTKD);
  v12 = v23;

  v22 = v12;
  CUAppendF(&v22, &v28, "pairedWithCTKD %d", self->_pairedCTKD);
  v13 = v22;

  v21 = v13;
  CUAppendF(&v21, &v28, "displayName %@", self->_displayName);
  v14 = v21;

  taskTimeout = self->_taskTimeout;
  v20 = v14;
  CUAppendF(&v20, &v28, "taskTimeout %@ seconds", taskTimeout);
  v15 = (__CFString *)v20;

  v16 = &stru_100039F08;
  if (v15)
    v16 = v15;
  v17 = v16;

  return v17;
}

- (BOOL)appConfirmsAuth
{
  return self->_appConfirmsAuth;
}

- (void)setAppConfirmsAuth:(BOOL)a3
{
  self->_appConfirmsAuth = a3;
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothUUID, a3);
}

- (int64_t)btOperation
{
  return self->_btOperation;
}

- (void)setBtOperation:(int64_t)a3
{
  self->_btOperation = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)pairCTKD
{
  return self->_pairCTKD;
}

- (void)setPairCTKD:(BOOL)a3
{
  self->_pairCTKD = a3;
}

- (BOOL)pairedCTKD
{
  return self->_pairedCTKD;
}

- (void)setPairedCTKD:(BOOL)a3
{
  self->_pairedCTKD = a3;
}

- (NSNumber)taskTimeout
{
  return self->_taskTimeout;
}

- (void)setTaskTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_taskTimeout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTimeout, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->taskTimer, 0);
}

@end
