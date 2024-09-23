@implementation TRNearbyDeviceScanner

+ (void)initialize
{
  _TRLogEnabled = 1;
  _TRLogVerboseEnabled = 1;
}

- (TRNearbyDeviceScanner)init
{
  TRNearbyDeviceScanner *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *scannerQ;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRNearbyDeviceScanner;
  v2 = -[TRNearbyDeviceScanner init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TRNearbyDeviceScanner.scannerQ", 0);
    scannerQ = v2->_scannerQ;
    v2->_scannerQ = (OS_dispatch_queue *)v3;

    v2->_state = 1;
  }
  return v2;
}

- (void)startScanningForDevicesWithService:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  NSObject *scannerQ;
  id v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TRNearbyDeviceScanner delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("TRNearbyDeviceScanner requires a delegate."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[TRNearbyDeviceScanner startScanningForDevicesWithService:]";
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "%s Start scanning for devices with service: %lu.", buf, 0x16u);
    }

  }
  scannerQ = self->_scannerQ;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke;
  v9[3] = &unk_24C2E4E90;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(scannerQ, v9);
}

void __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;
  dispatch_queue_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2] == 1)
  {
    v2[2] = 2;
    objc_msgSend(*(id *)(a1 + 32), "setRequestedService:", *(_QWORD *)(a1 + 40));
    v3 = objc_alloc_init(MEMORY[0x24BE90128]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v6 = dispatch_queue_create("com.apple.TRNearbyDeviceScanner.deviceDiscoveryQ", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDispatchQueue:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setChangeFlags:", 2);
    if (objc_msgSend(*(id *)(a1 + 32), "requestedService") == 1)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDiscoveryFlags:", 16);
    v7 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_12;
    v22[3] = &unk_24C2E5800;
    v22[4] = *(_QWORD *)(a1 + 32);
    v8 = (void *)MEMORY[0x20BD22DF8](v22);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDeviceFoundHandler:", v8);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_2;
    v21[3] = &unk_24C2E5828;
    v21[4] = *(_QWORD *)(a1 + 32);
    v9 = (void *)MEMORY[0x20BD22DF8](v21);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDeviceChangedHandler:", v9);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_3;
    v20[3] = &unk_24C2E4F08;
    v20[4] = *(_QWORD *)(a1 + 32);
    v10 = (void *)MEMORY[0x20BD22DF8](v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setInvalidationHandler:", v10);
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_4;
    v19[3] = &unk_24C2E4F08;
    v19[4] = *(_QWORD *)(a1 + 32);
    v11 = (void *)MEMORY[0x20BD22DF8](v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setInterruptionHandler:", v11);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_5;
    v18[3] = &unk_24C2E5558;
    v18[4] = v12;
    objc_msgSend(v13, "activateWithCompletion:", v18);

    goto LABEL_11;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[TRNearbyDeviceScanner startScanningForDevicesWithService:]_block_invoke";
      _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to start scanning. Scanner is not stopped.", buf, 0xCu);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = *MEMORY[0x24BDD0FD8];
    v23[0] = *MEMORY[0x24BDD0FC8];
    v23[1] = v17;
    v24[0] = CFSTR("Failed to start scanning.");
    v24[1] = CFSTR("Scanner is not stopped.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9400, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nearbyDeviceScanner:didFailToStartScanningWithError:", *(_QWORD *)(a1 + 32), v9);
LABEL_11:

  }
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceFound:", a2);
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceChanged:", a2);
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInvalidation");
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInterruption");
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActivationWithError:", a2);
}

- (void)stopScanning
{
  NSObject *scannerQ;
  _QWORD block[5];

  scannerQ = self->_scannerQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TRNearbyDeviceScanner_stopScanning__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(scannerQ, block);
}

void __37__TRNearbyDeviceScanner_stopScanning__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3 == 3)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[TRNearbyDeviceScanner stopScanning]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s Stopping scanner.", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    v2[2] = 4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  }
  else if (v3 == 1)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[TRNearbyDeviceScanner stopScanning]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "%s Scanner stopped.", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nearbyDeviceScannerDidStopScanning:", *(_QWORD *)(a1 + 32));
LABEL_20:

    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[TRNearbyDeviceScanner stopScanning]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to stop scanner. Advertiser is not started.", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = *MEMORY[0x24BDD0FD8];
      v15[0] = *MEMORY[0x24BDD0FC8];
      v15[1] = v12;
      v16[0] = CFSTR("Failed to stop scanning.");
      v16[1] = CFSTR("Scanner is not started.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9301, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nearbyDeviceScanner:didFailToStopScanningWithError:", *(_QWORD *)(a1 + 32), v13);

      goto LABEL_20;
    }
  }
}

- (void)_handleActivationWithError:(id)a3
{
  id v4;
  NSObject *scannerQ;
  id v6;
  _QWORD block[4];
  id v8;
  TRNearbyDeviceScanner *v9;

  v4 = a3;
  scannerQ = self->_scannerQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__TRNearbyDeviceScanner__handleActivationWithError___block_invoke;
  block[3] = &unk_24C2E4F30;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(scannerQ, block);

}

void __52__TRNearbyDeviceScanner__handleActivationWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
        v14 = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "<%@> activation error %@", (uint8_t *)&v14, 0x16u);
      }

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 1;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = 0;

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearbyDeviceScanner:didFailToStartScanningWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
LABEL_14:

    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "SFDeviceDiscovery activation completed <%@>", (uint8_t *)&v14, 0xCu);
      }

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 3;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearbyDeviceScannerDidStartScanning:", *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
  }
}

- (void)_handleInvalidation
{
  NSObject *scannerQ;
  _QWORD block[5];

  scannerQ = self->_scannerQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TRNearbyDeviceScanner__handleInvalidation__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(scannerQ, block);
}

void __44__TRNearbyDeviceScanner__handleInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nearbyDeviceScannerDidStopScanning:", *(_QWORD *)(a1 + 32));

  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[TRNearbyDeviceScanner _handleInvalidation]_block_invoke";
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "%s Device discovery invalidated", buf, 0xCu);
    }

  }
}

- (void)_handleInterruption
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[TRNearbyDeviceScanner _handleInterruption]";
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Device discovery interrupted", (uint8_t *)&v4, 0xCu);
    }

  }
  -[TRNearbyDeviceScanner _handleInvalidation](self, "_handleInvalidation");
}

- (void)_deviceFound:(id)a3
{
  id v4;
  TRNearbyDevice *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "distance") == 10)
  {
    if (-[TRNearbyDeviceScanner requestedService](self, "requestedService") != 1
      || (objc_msgSend(v4, "needsSetup") & 1) != 0)
    {
      v5 = -[TRNearbyDevice initWithRepresentedDevice:supportedService:]([TRNearbyDevice alloc], "initWithRepresentedDevice:supportedService:", v4, -[TRNearbyDeviceScanner requestedService](self, "requestedService"));
      -[TRNearbyDeviceScanner delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nearbyDeviceScanner:didDiscoverDevice:", self, v5);

      goto LABEL_14;
    }
    if (_TRLogEnabled != 1)
      goto LABEL_14;
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[TRNearbyDeviceScanner _deviceFound:]";
      v12 = 2112;
      v13 = v8;
      v9 = "%s Device (%@) rejected. Does not support setup.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "distance") == 20 && _TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[TRNearbyDeviceScanner _deviceFound:]";
      v12 = 2112;
      v13 = v8;
      v9 = "%s Device (%@) rejected. Not at tap distance.";
LABEL_12:
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);

    }
LABEL_13:

  }
LABEL_14:

}

- (void)openSession:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  TRClientConnection *v7;
  void *v8;
  TRClientConnection *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  TRClientConnection *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(TRClientConnection);
  objc_msgSend(v5, "nearbyDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke;
  v12[3] = &unk_24C2E5850;
  v14 = v7;
  v15 = v6;
  v13 = v5;
  v9 = v7;
  v10 = v5;
  v11 = v6;
  -[TRClientConnection connectToNearbyDevice:withCompletion:](v9, "connectToNearbyDevice:withCompletion:", v8, v12);

}

void __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnection:", *(_QWORD *)(a1 + 40));
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke_2;
    v4[3] = &unk_24C2E5698;
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v5, "sendHeartbeatWithResponseHandler:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "startHeartbeat");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (TRNearbyDeviceScannerDelegate)delegate
{
  return (TRNearbyDeviceScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (SFDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (void)setDeviceDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDiscovery, a3);
}

- (OS_dispatch_queue)scannerQ
{
  return self->_scannerQ;
}

- (void)setScannerQ:(id)a3
{
  objc_storeStrong((id *)&self->_scannerQ, a3);
}

- (unint64_t)requestedService
{
  return self->_requestedService;
}

- (void)setRequestedService:(unint64_t)a3
{
  self->_requestedService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerQ, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
