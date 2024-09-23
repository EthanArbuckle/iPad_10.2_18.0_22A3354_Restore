@implementation CarrierSettingsStatusIndicator

- (CarrierSettingsStatusIndicator)init
{
  CarrierSettingsStatusIndicator *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarrierSettingsStatusIndicator;
  v2 = -[CarrierSettingsStatusIndicator init](&v7, sel_init);
  if (v2)
  {
    mysyslog_get_logger();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219EF1000, v3, v4, "CarrierSettingsStatusIndicator initialized.", v6, 2u);
    }

  }
  return v2;
}

- (void)createConnection
{
  dispatch_queue_t v3;
  void *v4;
  id v5;

  v3 = dispatch_queue_create("Carrier Settings status indicator queue", 0);
  -[CarrierSettingsStatusIndicator setQueue:](self, "setQueue:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2818]), "initWithQueue:", self->_queue);
  -[CarrierSettingsStatusIndicator setCoreTelephonyClient:](self, "setCoreTelephonyClient:", v4);

  -[CarrierSettingsStatusIndicator coreTelephonyClient](self, "coreTelephonyClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)carrierBundleChange:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  __CFRunLoop *v6;
  __CFString *v7;
  _QWORD block[5];
  uint8_t buf[16];

  mysyslog_get_logger();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v4, v5, "carrier bundle settings changed", buf, 2u);
  }

  v6 = -[CarrierSettingsStatusIndicator runloop](self, "runloop");
  v7 = -[CarrierSettingsStatusIndicator runloopMode](self, "runloopMode");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CarrierSettingsStatusIndicator_carrierBundleChange___block_invoke;
  block[3] = &unk_24DC165F8;
  block[4] = self;
  CFRunLoopPerformBlock(v6, v7, block);
  CFRunLoopWakeUp(-[CarrierSettingsStatusIndicator runloop](self, "runloop"));
}

uint64_t __54__CarrierSettingsStatusIndicator_carrierBundleChange___block_invoke(uint64_t a1)
{
  return ((uint64_t (*)(void))objc_msgSend(*(id *)(a1 + 32), "callback"))();
}

- (void)preferredDataSimChanged:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  __CFRunLoop *v6;
  __CFString *v7;
  _QWORD block[5];
  uint8_t buf[16];

  mysyslog_get_logger();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v4, v5, "user's data subscription preference changed", buf, 2u);
  }

  v6 = -[CarrierSettingsStatusIndicator runloop](self, "runloop");
  v7 = -[CarrierSettingsStatusIndicator runloopMode](self, "runloopMode");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CarrierSettingsStatusIndicator_preferredDataSimChanged___block_invoke;
  block[3] = &unk_24DC165F8;
  block[4] = self;
  CFRunLoopPerformBlock(v6, v7, block);
  CFRunLoopWakeUp(-[CarrierSettingsStatusIndicator runloop](self, "runloop"));
}

uint64_t __58__CarrierSettingsStatusIndicator_preferredDataSimChanged___block_invoke(uint64_t a1)
{
  return ((uint64_t (*)(void))objc_msgSend(*(id *)(a1 + 32), "callback"))();
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (__CFRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(__CFRunLoop *)a3
{
  self->_runloop = a3;
}

- (__CFString)runloopMode
{
  return self->_runloopMode;
}

- (void)setRunloopMode:(__CFString *)a3
{
  self->_runloopMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
