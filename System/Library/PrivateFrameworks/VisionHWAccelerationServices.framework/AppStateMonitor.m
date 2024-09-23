@implementation AppStateMonitor

- (AppStateMonitor)initWithPID:(int)a3
{
  AppStateMonitor *v4;
  AppStateMonitor *v5;
  NSString *processNameInternal;
  void *v7;
  uint64_t v8;
  id v9;
  RBSProcessHandle *processHandle;
  uint64_t v11;
  NSString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  RBSProcessMonitor *processMonitor;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)AppStateMonitor;
  v4 = -[AppStateMonitor init](&v31, sel_init);
  v5 = v4;
  if (v4)
  {
    processNameInternal = v4->_processNameInternal;
    v4->_processNameInternal = 0;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_monitoredPID = a3;
    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v5->_monitoredPID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v7, &v29);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v29;
    processHandle = v5->_processHandle;
    v5->_processHandle = (RBSProcessHandle *)v8;

    if (v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21AB98298((uint64_t)v9);
    -[RBSProcessHandle name](v5->_processHandle, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v5->_processNameInternal;
    v5->_processNameInternal = (NSString *)v11;

    -[RBSProcessHandle monitorForDeath:](v5->_processHandle, "monitorForDeath:", &unk_24DDB77B8);
    v13 = (void *)MEMORY[0x24BE80CC8];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_21AB8F568;
    v26[3] = &unk_24DDB7808;
    v14 = v7;
    v27 = v14;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v13, "monitorWithConfiguration:", v26);
    v15 = objc_claimAutoreleasedReturnValue();
    processMonitor = v5->_processMonitor;
    v5->_processMonitor = (RBSProcessMonitor *)v15;

    if (!v5->_processMonitor)
    {
      v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v17)
        sub_21AB98260(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AppStateMonitor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AppStateMonitor;
  -[AppStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
}

- (int)currentAppState
{
  os_unfair_lock_s *p_lock;
  int appState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_latestState.__engaged_)
  {
    appState = self->_latestState.var0.__val_.appState;
    os_unfair_lock_unlock(p_lock);
    return appState;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
}

- (void)_process:(id)a3 didUpdateState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  NSString *v18;
  NSString *processNameInternal;
  _BOOL4 engaged;
  RBSProcessState *v21;
  RBSProcessState *v22;
  RBSProcessState *processState;
  id v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = sub_21AB8FB0C(v8);
  v11 = v10;

  objc_msgSend(v7, "previousState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = sub_21AB8FB0C(v12);
  v15 = v14;

  v16 = objc_msgSend(v6, "pid");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 67109891;
    HIDWORD(v25) = v15;
    v26 = 1024;
    v27 = v11;
    v28 = 2113;
    v29 = v17;
    v30 = 1024;
    v31 = v16;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: previousState: %d, state: %d, name: %{private}@, pid: %d", (uint8_t *)&v25, 0x1Eu);

  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_processNameInternal)
  {
    objc_msgSend(v6, "name");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    processNameInternal = self->_processNameInternal;
    self->_processNameInternal = v18;

  }
  engaged = self->_latestState.__engaged_;
  v21 = v9;
  v22 = v21;
  if (engaged)
  {
    processState = self->_latestState.var0.__val_.processState;
    self->_latestState.var0.__val_.processState = v21;

    self->_latestState.var0.__val_.appState = v11;
    os_unfair_lock_unlock(&self->_lock);
    if (v11 == v15)
      goto LABEL_13;
  }
  else
  {
    self->_latestState.var0.__val_.processState = v21;
    self->_latestState.__engaged_ = 1;
    self->_latestState.var0.__val_.appState = v11;
    os_unfair_lock_unlock(&self->_lock);
    if (v11 == v15)
      goto LABEL_13;
  }
  objc_initWeak(&v25, self);
  if ((v11 - 5) <= 0xFFFFFFFD && (v15 - 3) <= 1)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    v24 = objc_loadWeakRetained(&v25);
    CMNotificationCenterPostNotification();

  }
  objc_destroyWeak(&v25);
LABEL_13:

}

- (int)monitoredPID
{
  return self->_monitoredPID;
}

- (NSString)monitoredProcessName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredProcessName, 0);
  if (self->_latestState.__engaged_)

  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processNameInternal, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 40) = 0;
  *((_BYTE *)self + 56) = 0;
  return self;
}

@end
