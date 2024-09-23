@implementation STDeviceUnlockStateListener

- (STDeviceUnlockStateListener)init
{
  STDeviceUnlockStateListener *v2;
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STDeviceUnlockStateListener;
  v2 = -[STDeviceUnlockStateListener init](&v10, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    if (MKBDeviceFormattedForContentProtection())
    {
      v3 = (const char *)*MEMORY[0x24BE67240];
      v4 = MEMORY[0x24BDAC9B8];
      v5 = MEMORY[0x24BDAC9B8];
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __35__STDeviceUnlockStateListener_init__block_invoke;
      v7[3] = &unk_24DB87200;
      objc_copyWeak(&v8, &location);
      notify_register_dispatch(v3, &v2->_notifyToken, v4, v7);

      objc_destroyWeak(&v8);
    }
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__STDeviceUnlockStateListener_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void (**v3)(_QWORD, _QWORD);
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE845E0], "deviceState");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, v2, OS_LOG_TYPE_DEFAULT, "Device lock stated changed", v4, 2u);
  }

  objc_msgSend(WeakRetained, "lockStateChangeHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[2](v3, objc_msgSend(WeakRetained, "deviceIsLocked"));

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)STDeviceUnlockStateListener;
  -[STDeviceUnlockStateListener dealloc](&v3, sel_dealloc);
}

- (BOOL)deviceIsLocked
{
  int v2;
  NSObject *v3;
  BOOL v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = MKBGetDeviceLockState();
  objc_msgSend(MEMORY[0x24BE845E0], "deviceState");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_219AB4000, v3, OS_LOG_TYPE_DEFAULT, "Device lock state %d", (uint8_t *)v6, 8u);
  }

  if (v2)
    v4 = v2 == 3;
  else
    v4 = 1;
  return !v4;
}

- (id)lockStateChangeHandler
{
  return self->_lockStateChangeHandler;
}

- (void)setLockStateChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lockStateChangeHandler, 0);
}

@end
