@implementation WLSourceDevicesController

- (WLSourceDevicesController)initWithDelegate:(id)a3
{
  id v4;
  WLSourceDevicesController *v5;
  WLSourceDevicesController *v6;

  v4 = a3;
  v5 = -[WLSourceDevicesController init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (WLSourceDevicesController)init
{
  WLSourceDevicesController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLSourceDevicesController;
  v2 = -[WLDaemonConnection init](&v7, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_didDiscoverCandidate, CFSTR("com.apple.welcomekit.device.discovered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)_sourceDevicesDidChange, CFSTR("com.apple.welcomekit.sourceDevicesChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_wifiAndDeviceDiscoveryDidGetInterrupted, CFSTR("com.apple.welcomekit.wifiAndDeviceDiscoveryDidBecomeInvalid"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.welcomekit.device.discovered"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.welcomekit.sourceDevicesChanged"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("com.apple.welcomekit.wifiAndDeviceDiscoveryDidBecomeInvalid"), 0);
  v6.receiver = self;
  v6.super_class = (Class)WLSourceDevicesController;
  -[WLSourceDevicesController dealloc](&v6, sel_dealloc);
}

- (void)startWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__WLSourceDevicesController_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v10[3] = &unk_24EFCA8D0;
  v10[4] = self;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __71__WLSourceDevicesController_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2;
  v8[3] = &unk_24EFCAB48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "startWiFiAndDeviceDiscovery:", v8);

}

void __71__WLSourceDevicesController_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error starting wifi and device discovery - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __71__WLSourceDevicesController_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  uint64_t v7;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v21 = a7;
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, uint64_t, id, id, id, uint64_t, id))(v22 + 16))(v22, a2, v23, v14, v15, a6, v21);
  if (v21)
    _WLLog(v7, 0, CFSTR("%@: Error from daemon starting wifi and device discovery - %@"), v16, v17, v18, v19, v20, *(_QWORD *)(a1 + 32));

}

- (void)stopDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__WLSourceDevicesController_stopDeviceDiscoveryWithCompletion___block_invoke;
  v10[3] = &unk_24EFCA8D0;
  v10[4] = self;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __63__WLSourceDevicesController_stopDeviceDiscoveryWithCompletion___block_invoke_2;
  v8[3] = &unk_24EFCAB70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "stopDeviceDiscovery:", v8);

}

void __63__WLSourceDevicesController_stopDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error stopping device discovery - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __63__WLSourceDevicesController_stopDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  if (v12)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v6);
    v6 = v13;
  }
  if (v6)
  {
    _WLLog(v3, 0, CFSTR("%@: Error from daemon stopping device discovery - %@"), v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 32));
    v6 = v13;
  }

}

- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__WLSourceDevicesController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v10[3] = &unk_24EFCA8D0;
  v10[4] = self;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __70__WLSourceDevicesController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2;
  v8[3] = &unk_24EFCAB70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "stopWiFiAndDeviceDiscovery:", v8);

}

void __70__WLSourceDevicesController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error stopping wifi and device discovery - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __70__WLSourceDevicesController_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  if (v12)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v6);
    v6 = v13;
  }
  if (v6)
  {
    _WLLog(v3, 0, CFSTR("%@: Error from daemon stopping wifi and device discovery - %@"), v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 32));
    v6 = v13;
  }

}

- (void)attemptDirectConnectionToAddress:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__WLSourceDevicesController_attemptDirectConnectionToAddress___block_invoke;
  v6[3] = &unk_24EFCA8D0;
  v6[4] = self;
  v4 = a3;
  -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attemptDirectConnectionToAddress:", v4);

}

void __62__WLSourceDevicesController_attemptDirectConnectionToAddress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error attempting direct connection - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

- (WLSourceDevicesDelegate)delegate
{
  return (WLSourceDevicesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
