@implementation WFMobileWiFiStateMonitor

- (WFMobileWiFiStateMonitor)initWithHandler:(id)a3
{
  id v4;
  WFMobileWiFiStateMonitor *v5;
  void *v6;
  id handler;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v19;
  os_log_type_t v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFMobileWiFiStateMonitor;
  v5 = -[WFMobileWiFiStateMonitor init](&v21, sel_init);
  if (!v5)
  {
LABEL_24:

    v10 = 0;
    v5 = 0;
    goto LABEL_18;
  }
  v6 = _Block_copy(v4);
  handler = v5->_handler;
  v5->_handler = v6;

  v5->_state = 0;
  v8 = WiFiManagerClientCreate();
  v5->_manager = (__WiFiManagerClient *)v8;
  if (!v8)
  {
    WFLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v19, v20, "failed to create WiFiManagerClientRef", buf, 2u);
    }

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getCFRunLoop");
  WiFiManagerClientScheduleWithRunLoop();

  WiFiManagerClientRegisterServerRestartCallback();
  WiFiManagerClientRegisterDeviceAttachmentCallback();
  v10 = (void *)WiFiManagerClientCopyDevices();
  WFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[WFMobileWiFiStateMonitor initWithHandler:]";
    v24 = 2112;
    v25 = (uint64_t)v10;
    _os_log_impl(&dword_219FC8000, v11, v12, "%s: devices %@", buf, 0x16u);
  }

  if (v10)
  {
    v13 = objc_msgSend(v10, "objectAtIndex:", 0);
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFMobileWiFiStateMonitor initWithHandler:]";
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_219FC8000, v14, v15, "%s: device %@", buf, 0x16u);
    }

    -[WFMobileWiFiStateMonitor _updateWithDeviceAttachment:](v5, "_updateWithDeviceAttachment:", v13);
    -[WFMobileWiFiStateMonitor _updateState](v5, "_updateState");
  }
  else
  {
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFMobileWiFiStateMonitor initWithHandler:]";
      _os_log_impl(&dword_219FC8000, v16, v17, "%s: failed to acquire WiFiDeviceClientRef", buf, 0xCu);
    }

    v10 = 0;
  }
LABEL_18:

  return v5;
}

- (void)dealloc
{
  __WiFiManagerClient *manager;
  __WiFiDeviceClient *device;
  objc_super v5;

  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  device = self->_device;
  if (device)
  {
    CFRelease(device);
    self->_device = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WFMobileWiFiStateMonitor;
  -[WFMobileWiFiStateMonitor dealloc](&v5, sel_dealloc);
}

- (void)_updateState
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WFMobileWiFiStateMonitor__updateState__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __40__WFMobileWiFiStateMonitor__updateState__block_invoke(uint64_t a1)
{
  const void *v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (WiFiManagerClientGetPower())
  {
    v2 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v5 = v3 == 0;
    else
      v5 = 1;
    v6 = !v5;
    if (v2)
    {
      if (v6 && os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
        _os_log_impl(&dword_219FC8000, v3, v4, "%s: associated", buf, 0xCu);
      }

      CFRelease(v2);
      v7 = 4;
    }
    else
    {
      if (v6 && os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
        _os_log_impl(&dword_219FC8000, v3, v4, "%s: powered on", buf, 0xCu);
      }

      v7 = 3;
    }
  }
  else
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
      _os_log_impl(&dword_219FC8000, v8, v9, "%s: powered off", buf, 0xCu);
    }

    v7 = 1;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__WFMobileWiFiStateMonitor__updateState__block_invoke_3;
  v10[3] = &unk_24DC348D0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);
}

void __40__WFMobileWiFiStateMonitor__updateState__block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 40));
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      WFWiFiStateMonitorStringForState(v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WFWiFiStateMonitorStringForState(*(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_219FC8000, v5, v4, "%s: state changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v2, *(_QWORD *)(a1 + 40));

  }
}

- (void)_updateWithDeviceAttachment:(__WiFiDeviceClient *)a3
{
  __WiFiDeviceClient *device;

  device = self->_device;
  if (device)
    CFRelease(device);
  self->_device = a3;
  if (a3)
    CFRetain(a3);
  WiFiDeviceClientRegisterPowerCallback();
  WiFiDeviceClientRegisterExtendedLinkCallback();
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (__WiFiManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManagerClient *)a3
{
  self->_manager = a3;
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  self->_device = a3;
}

- (WFLinkQuality)linkQuality
{
  return self->_linkQuality;
}

- (void)setLinkQuality:(id)a3
{
  objc_storeStrong((id *)&self->_linkQuality, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQuality, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
