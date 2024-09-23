@implementation PowerUIInCarSignalMonitor

- (PowerUIInCarSignalMonitor)initWithDelegate:(id)a3
{
  id v5;
  PowerUIInCarSignalMonitor *v6;
  PowerUIInCarSignalMonitor *v7;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PowerUIInCarSignalMonitor;
  v6 = -[PowerUIInCarSignalMonitor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = os_log_create("com.apple.powerui.signals", "inCar");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

  }
  return v7;
}

- (void)sessionDidConnect:(id)a3
{
  _BOOL4 v4;
  void *v5;
  PowerUISignalMonitorDelegate *delegate;
  id v7;

  v4 = -[PowerUIInCarSignalMonitor inCar](self, "inCar", a3);
  -[CARSessionStatus currentSession](self->_sessionStatus, "currentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_carplayConnected = v5 != 0;

  if (v4 != -[PowerUIInCarSignalMonitor inCar](self, "inCar"))
  {
    delegate = self->_delegate;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PowerUISignalMonitorDelegate monitor:maySuggestNewFullChargeDeadline:](delegate, "monitor:maySuggestNewFullChargeDeadline:", self, v7);

  }
}

- (void)sessionDidDisconnect:(id)a3
{
  _BOOL4 v4;
  void *v5;
  PowerUISignalMonitorDelegate *delegate;
  id v7;

  v4 = -[PowerUIInCarSignalMonitor inCar](self, "inCar", a3);
  -[CARSessionStatus currentSession](self->_sessionStatus, "currentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_carplayConnected = v5 != 0;

  if (v4 != -[PowerUIInCarSignalMonitor inCar](self, "inCar"))
  {
    delegate = self->_delegate;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PowerUISignalMonitorDelegate monitor:maySuggestNewFullChargeDeadline:](delegate, "monitor:maySuggestNewFullChargeDeadline:", self, v7);

  }
}

+ (id)monitorWithDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:", v4);

  return v5;
}

- (unint64_t)signalID
{
  return 15;
}

- (id)requiredFullChargeDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
}

- (void)startMonitoring
{
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  CARSessionStatus *v6;
  CARSessionStatus *sessionStatus;
  void *v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  int v12;
  _QWORD v13[5];
  int v14;
  uint64_t state64;
  _QWORD handler[5];
  int out_token;

  out_token = 0;
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.locationd.vehicle.connected"), "UTF8String");
  dispatch_get_global_queue(-2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke;
  handler[3] = &unk_24D3FB748;
  handler[4] = self;
  notify_register_dispatch(v3, &out_token, v4, handler);

  state64 = 0;
  notify_get_state(out_token, &state64);
  self->_vehicleConnected = state64 != 0;
  v14 = 0;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_22;
  v13[3] = &unk_24D3FB748;
  v13[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.GeoServices.navigation.started"), "UTF8String"), &v14, v4, v13);

  notify_get_state(v14, &state64);
  self->_navigationStarted = state64 != 0;
  v12 = 0;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_25;
  v11[3] = &unk_24D3FB748;
  v11[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.locationd.vehicle.disconnected"), "UTF8String"), &v12, v4, v11);

  v10 = 0;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_26;
  v9[3] = &unk_24D3FB748;
  v9[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.GeoServices.navigation.stopped"), "UTF8String"), &v10, v4, v9);

  v6 = (CARSessionStatus *)objc_msgSend(objc_alloc(MEMORY[0x24BE15240]), "initAndWaitUntilSessionUpdated");
  sessionStatus = self->_sessionStatus;
  self->_sessionStatus = v6;

  -[CARSessionStatus addSessionObserver:](self->_sessionStatus, "addSessionObserver:", self);
  -[CARSessionStatus currentSession](self->_sessionStatus, "currentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_carplayConnected = v8 != 0;

}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "inCar");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "inCar"))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      v10 = 1024;
      v11 = objc_msgSend(v4, "inCar");
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monitor:maySuggestNewFullChargeDeadline:", v6, v8);

  }
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_22(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "inCar");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "inCar"))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      v10 = 1024;
      v11 = objc_msgSend(v4, "inCar");
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monitor:maySuggestNewFullChargeDeadline:", v6, v8);

  }
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_25(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "inCar");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "inCar"))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      v10 = 1024;
      v11 = objc_msgSend(v4, "inCar");
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monitor:maySuggestNewFullChargeDeadline:", v6, v8);

  }
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_26(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "inCar");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "inCar"))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      v10 = 1024;
      v11 = objc_msgSend(v4, "inCar");
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monitor:maySuggestNewFullChargeDeadline:", v6, v8);

  }
}

- (void)stopMonitoring
{
  -[CARSessionStatus removeSessionObserver:](self->_sessionStatus, "removeSessionObserver:", self);
}

- (BOOL)inCar
{
  return self->_vehicleConnected || self->_navigationStarted || self->_carplayConnected;
}

- (void)setInCar:(BOOL)a3
{
  self->_inCar = a3;
}

- (BOOL)vehicleConnected
{
  return self->_vehicleConnected;
}

- (void)setVehicleConnected:(BOOL)a3
{
  self->_vehicleConnected = a3;
}

- (BOOL)navigationStarted
{
  return self->_navigationStarted;
}

- (void)setNavigationStarted:(BOOL)a3
{
  self->_navigationStarted = a3;
}

- (BOOL)carplayConnected
{
  return self->_carplayConnected;
}

- (void)setCarplayConnected:(BOOL)a3
{
  self->_carplayConnected = a3;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end
