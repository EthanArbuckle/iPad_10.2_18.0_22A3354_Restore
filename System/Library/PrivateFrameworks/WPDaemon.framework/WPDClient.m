@implementation WPDClient

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)discoveredDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WPDClient *v9;

  v4 = a3;
  -[WPDClient serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__WPDClient_discoveredDevice___block_invoke;
  v7[3] = &unk_24D7C2600;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)serverQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_serverQueue);
}

- (void)startScanning_async:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  dispatch_time_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  void *v59;
  NSObject *v60;
  id v61;
  WPDClient *v62;
  id v63[2];
  char v64;
  _BYTE buf[28];
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "clientType");
  if (!-[WPDClient registered](self, "registered"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_480);
    v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient startScanning_async:].cold.6(v10, self);
    v11 = (void *)MEMORY[0x24BDD1540];
    v74 = *MEMORY[0x24BDD0FC8];
    v75[0] = CFSTR("The client is currently not registered with the daemon");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 2, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[WPDClient scansOff](self, "scansOff"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_484);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient startScanning_async:].cold.1(v6, self);
    v7 = (void *)MEMORY[0x24BDD1540];
    v72 = *MEMORY[0x24BDD0FC8];
    v73 = CFSTR("The client is currently denylisted");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 2, v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v12 = (void *)v9;

LABEL_14:
    -[WPDClient conn](self, "conn");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scanningFailedToStart:ofType:", v12, v5);

    goto LABEL_15;
  }
  if ((_DWORD)v5 == 18)
  {
    if (!-[WPDClient entitledForObjectDiscovery](self, "entitledForObjectDiscovery"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_488);
      v51 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient startScanning_async:].cold.5(v51, self);
      v52 = (void *)MEMORY[0x24BDD1540];
      v70 = *MEMORY[0x24BDD0FC8];
      v71 = CFSTR("The client is not entitled to scan for ObjectDiscovery");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (!-[WPDClient supportsObjectDiscovery](self, "supportsObjectDiscovery"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_492);
      v54 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient startScanning_async:].cold.4(v54, self);
      v55 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      v69 = CFSTR("ObjectDiscovery not supported on this platform");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  -[WPDClient scanManager](self, "scanManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_496);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient startScanning_async:].cold.2();
    v53 = (void *)MEMORY[0x24BDD1540];
    v66 = *MEMORY[0x24BDD0FC8];
    v67 = CFSTR("WPDScanManager is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_500);
  v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    -[WPDClient processName](self, "processName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = -[WPDClient processID](self, "processID");
    *(_WORD *)&buf[18] = 2114;
    *(_QWORD *)&buf[20] = v4;
    _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "Start scanning for process %{public}@ (%d) with %{public}@", buf, 0x1Cu);

  }
  -[WPDClient scanManager](self, "scanManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addScanRequest:forClient:", v4, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clientType");
  kdebug_trace();
  if (v12)
    goto LABEL_14;
  if ((_DWORD)v5 == 18)
  {
    -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (!v22)
    {
      -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientUUID](self, "clientUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addScanRequest:forClient:", v4, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_502);
        v26 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDClient startScanning_async:].cold.3(v26, v25);
      }

    }
  }
  objc_msgSend(v4, "updateTime");
  v28 = v27;
  if (-[WPDClient isTestModeClient](self, "isTestModeClient"))
  {
    -[WPDClient scanTimeout](self, "scanTimeout");
    if (v29 != 0.0)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_504);
      v30 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        -[WPDClient scanTimeout](self, "scanTimeout");
        v33 = v32;
        -[WPDClient clientTypeString](self, "clientTypeString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        _os_log_impl(&dword_2175D1000, v31, OS_LOG_TYPE_DEFAULT, "Setting scan update time to %f for %@", buf, 0x16u);

      }
      -[WPDClient scanTimeout](self, "scanTimeout");
      v28 = v35;
    }
  }
  -[WPDClient scanTimers](self, "scanTimers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[WPDClient scanTimers](self, "scanTimers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v41);

    -[WPDClient scanTimers](self, "scanTimers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", 0, v43);

  }
  if (*(double *)&v28 > 0.0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_506);
    v44 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v5;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v28;
      _os_log_impl(&dword_2175D1000, v44, OS_LOG_TYPE_DEFAULT, "Setting scan timer for type %d with time %.2f ", buf, 0x12u);
    }
    -[WPDClient serverQueue](self, "serverQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v45);

    v47 = dispatch_time(0, (uint64_t)(*(double *)&v28 * 1000000000.0));
    dispatch_source_set_timer(v46, v47, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v56 = MEMORY[0x24BDAC760];
    v57 = 3221225472;
    v58 = __33__WPDClient_startScanning_async___block_invoke_507;
    v59 = &unk_24D7C3138;
    v64 = v5;
    v63[1] = v28;
    v48 = v46;
    v60 = v48;
    objc_copyWeak(v63, (id *)buf);
    v61 = v4;
    v62 = self;
    dispatch_source_set_event_handler(v48, &v56);
    -[WPDClient scanTimers](self, "scanTimers", v56, v57, v58, v59);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, v50);

    dispatch_resume(v48);
    objc_destroyWeak(v63);

    objc_destroyWeak((id *)buf);
  }
  -[WPDClient conn](self, "conn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scanningStartedOfType:", v5);
LABEL_15:

}

void __30__WPDClient_discoveredDevice___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _BYTE buf[12];
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "objectForKeyedSubscript:", CFSTR("kDeviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(*v2, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_470);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    objc_msgSend(v8, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    v21 = 1024;
    v22 = v5;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_INFO, "Telling process %@ (%@) about discovered device (%@) of type %d with data %@", buf, 0x30u);

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v12 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __30__WPDClient_discoveredDevice___block_invoke_471;
  v13[3] = &unk_24D7C25B8;
  objc_copyWeak(&v15, (id *)buf);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v12, "queueBlock:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)queueBlock:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void (**block)(void);

  block = (void (**)(void))a3;
  -[WPDClient conn](self, "conn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[WPDClient machName](self, "machName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WPDClient tickleMachPort](self, "tickleMachPort");
      -[WPDClient messageQueue](self, "messageQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v6, block);

      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("No NSXPConnection"), CFSTR("We have no active NSXPCConnection or a mach port set"));
  }
  block[2]();
LABEL_5:

}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (WPDScanManager)scanManager
{
  return (WPDScanManager *)objc_loadWeakRetained((id *)&self->_scanManager);
}

- (BOOL)scansOff
{
  return self->_scansOff;
}

- (NSMutableDictionary)scanTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (BOOL)registered
{
  return self->_registered;
}

- (int)processID
{
  return self->_processID;
}

- (BOOL)isTestModeClient
{
  return self->_isTestModeClient;
}

- (void)startScanning:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (_enableScanAdvertVouchers && (-[WPDClient holdVouchers](self, "holdVouchers") & 4) != 0)
  {
    v5 = (void *)voucher_copy();
    -[WPDClient setScanVoucher:](self, "setScanVoucher:", v5);

    objc_msgSend(v4, "setHoldVoucher:", 1);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_478);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDClient startScanning:].cold.1(v6, self);
  }
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__WPDClient_startScanning___block_invoke_479;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (int64_t)holdVouchers
{
  return self->_holdVouchers;
}

- (void)stopScanning_async:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "clientType");
  if (-[WPDClient registered](self, "registered"))
  {
    if ((_DWORD)v5 != 18)
    {
LABEL_5:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_529);
      v6 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[WPDClient processName](self, "processName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v8;
        v31 = 1024;
        v32 = -[WPDClient processID](self, "processID");
        v33 = 2114;
        v34 = v4;
        _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Stop scanning for process %{public}@ (%d) with %{public}@", (uint8_t *)&v29, 0x1Cu);

      }
      -[WPDClient scanTimers](self, "scanTimers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[WPDClient scanTimers](self, "scanTimers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v14);

        -[WPDClient scanTimers](self, "scanTimers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v16);

      }
      kdebug_trace();
      if ((_DWORD)v5 == 18)
      {
        -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPDClient clientUUID](self, "clientUUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeScanRequestsForClient:", v19);

        }
      }
      -[WPDClient scanManager](self, "scanManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientUUID](self, "clientUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeScanRequest:forClient:", v4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_531);
        v23 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 67109120;
          LODWORD(v30) = v5;
          _os_log_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEFAULT, "Trying to stop scanning for a type %d we don't scan for", (uint8_t *)&v29, 8u);
        }
      }
      else
      {
        -[WPDClient conn](self, "conn");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "remoteObjectProxy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "scanningStoppedOfType:", v5);

      }
      goto LABEL_29;
    }
    if (-[WPDClient entitledForObjectDiscovery](self, "entitledForObjectDiscovery"))
    {
      if (-[WPDClient supportsObjectDiscovery](self, "supportsObjectDiscovery"))
        goto LABEL_5;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_527);
      v28 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient stopScanning_async:].cold.1(v28);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_525);
      v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient stopScanning_async:].cold.2(v25);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_523);
    v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient stopScanning_async:].cold.3(v5, v24);
  }
LABEL_29:

}

- (void)stopScanning:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (_enableScanAdvertVouchers && (-[WPDClient holdVouchers](self, "holdVouchers") & 4) != 0)
  {
    -[WPDClient setScanVoucher:](self, "setScanVoucher:", 0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_521);
    v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDClient stopScanning:].cold.1(v5, self);
  }
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__WPDClient_stopScanning___block_invoke_522;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

+ (NSMutableSet)unknownUseCases
{
  if (unknownUseCases_onceToken != -1)
    dispatch_once(&unknownUseCases_onceToken, &__block_literal_global_5);
  return (NSMutableSet *)(id)unknownUseCases__unknownUseCases;
}

void __28__WPDClient_unknownUseCases__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unknownUseCases__unknownUseCases;
  unknownUseCases__unknownUseCases = v0;

}

+ (NSSet)approvedBundleIDs
{
  if (approvedBundleIDs_onceToken != -1)
    dispatch_once(&approvedBundleIDs_onceToken, &__block_literal_global_124_0);
  return (NSSet *)(id)approvedBundleIDs__approvedBundleIDs;
}

void __30__WPDClient_approvedBundleIDs__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D7D81D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)approvedBundleIDs__approvedBundleIDs;
  approvedBundleIDs__approvedBundleIDs = v0;

}

+ (NSSet)approvedProcesses
{
  if (approvedProcesses_onceToken != -1)
    dispatch_once(&approvedProcesses_onceToken, &__block_literal_global_126);
  return (NSSet *)(id)approvedProcesses__approvedProcesses;
}

void __30__WPDClient_approvedProcesses__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D7D81F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)approvedProcesses__approvedProcesses;
  approvedProcesses__approvedProcesses = v0;

}

- (void)verifyApprovedUseCase
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_2175D1000, v0, OS_LOG_TYPE_FAULT, "WPDClient not approved use case: (%@)", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)generateStateDump
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_308);
  v2 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    +[WPDClient unknownUseCases](WPDClient, "unknownUseCases");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: unknown use cases (%ld):", buf, 0xCu);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[WPDClient unknownUseCases](WPDClient, "unknownUseCases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_310);
        v11 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (BOOL)enableScanAdvertVouchers
{
  return _enableScanAdvertVouchers;
}

+ (void)initialize
{
  OUTLINED_FUNCTION_26(&dword_2175D1000, a1, a3, "WPDClient using custom enable scan advert vouchers: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (WPDClient)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v7;
  id v8;
  WPDClient *v9;
  WPDClient *v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  NSUUID *clientUUID;
  uint64_t v21;
  NSMutableDictionary *connections;
  uint64_t v23;
  NSMutableDictionary *advertTimers;
  uint64_t v25;
  NSMutableDictionary *advertTimerState;
  uint64_t v27;
  NSMutableDictionary *scanTimers;
  uint64_t v29;
  NSMutableDictionary *connectionTimer;
  uint64_t v31;
  NSMutableSet *lePipePeersSet;
  uint64_t v33;
  NSMutableSet *endpointsSet;
  OS_voucher *scanVoucher;
  OS_voucher *advertVoucher;
  objc_super v38;

  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)WPDClient;
  v9 = -[WPDClient init](&v38, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conn, a3);
    bundleID = v10->_bundleID;
    v10->_bundleID = 0;

    if (v7)
    {
      v10->_processID = objc_msgSend(v7, "processIdentifier");
      objc_msgSend(v7, "valueForEntitlement:", CFSTR("application-identifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v10->_bundleID;
      v10->_bundleID = (NSString *)v12;

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_317);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDClient initWithXPCConnection:server:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_processID = objc_msgSend(v14, "processIdentifier");

      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v10->_bundleID;
      v10->_bundleID = (NSString *)v16;

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_321);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDClient initWithXPCConnection:server:].cold.1();
    }
    objc_storeWeak((id *)&v10->_server, v8);
    objc_msgSend(v8, "serverQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_serverQueue, v18);

    v10->_registered = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    clientUUID = v10->_clientUUID;
    v10->_clientUUID = (NSUUID *)v19;

    *(_WORD *)&v10->_entitledForZones = 0;
    v10->_entitledForRanging = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    connections = v10->_connections;
    v10->_connections = (NSMutableDictionary *)v21;

    v10->_pendingSent = 0;
    v10->_portTickled = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    advertTimers = v10->_advertTimers;
    v10->_advertTimers = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    advertTimerState = v10->_advertTimerState;
    v10->_advertTimerState = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    scanTimers = v10->_scanTimers;
    v10->_scanTimers = (NSMutableDictionary *)v27;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    connectionTimer = v10->_connectionTimer;
    v10->_connectionTimer = (NSMutableDictionary *)v29;

    v10->_holdVouchers = 0;
    *(_WORD *)&v10->_isTestModeClient = 0;
    *(_WORD *)&v10->_scanDenylisted = 0;
    v10->_scanTimeout = 0.0;
    v10->_advTimeout = 0.0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v31 = objc_claimAutoreleasedReturnValue();
    lePipePeersSet = v10->_lePipePeersSet;
    v10->_lePipePeersSet = (NSMutableSet *)v31;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v33 = objc_claimAutoreleasedReturnValue();
    endpointsSet = v10->_endpointsSet;
    v10->_endpointsSet = (NSMutableSet *)v33;

    *(_WORD *)&v10->_isObjectDiscovery = 256;
    v10->_supportsRanging = +[WPDaemonServer supportsRanging](WPDaemonServer, "supportsRanging");
    if (initWithXPCConnection_server__onceToken != -1)
      dispatch_once(&initWithXPCConnection_server__onceToken, &__block_literal_global_326);
    scanVoucher = v10->_scanVoucher;
    v10->_scanVoucher = 0;

    advertVoucher = v10->_advertVoucher;
    v10->_advertVoucher = 0;

    -[WPDClient setupConnection](v10, "setupConnection");
    -[WPDClient checkEntitlements](v10, "checkEntitlements");
    v10->_wpDClientSignPostID = os_signpost_id_make_with_pointer((os_log_t)WiProxLog, v10);
  }

  return v10;
}

void __42__WPDClient_initWithXPCConnection_server___block_invoke_325()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v1 = (void *)AllZeroUUID;
  AllZeroUUID = v0;

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_329);
  v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __42__WPDClient_initWithXPCConnection_server___block_invoke_325_cold_1(v2, v3, v4);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D7D8208);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)DenylistedProcesses;
  DenylistedProcesses = v5;

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_332);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    -[WPDClient clientUUID](self, "clientUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "Deallocing WPDClient %@", buf, 0xCu);

  }
  -[WPDClient conn](self, "conn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WPDClient clientTypeString](self, "clientTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("WPATVSetup"));

    if ((v8 & 1) == 0)
    {
      -[WPDClient conn](self, "conn");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

    }
    -[WPDClient setConn:](self, "setConn:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)WPDClient;
  -[WPDClient dealloc](&v10, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WPDClient clientUUID](self, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WPDClient processID](self, "processID");
  -[WPDClient bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientTypeString](self, "clientTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@: %@ (%d) (%@) (%@) (%ld)"), v4, v5, v6, v7, v8, -[WPDClient holdVouchers](self, "holdVouchers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)registerWithDaemon:(id)a3 forProcess:(id)a4 machName:(id)a5 holdVouchers:(int64_t)a6
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
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _BYTE buf[12];
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_339);
  v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v24 = v13;
    -[WPDClient clientUUID](self, "clientUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v25;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    _os_log_debug_impl(&dword_2175D1000, v24, OS_LOG_TYPE_DEBUG, "Registering with daemon client %@ type %@ for process %@", buf, 0x20u);

  }
  -[WPDClient setProcessName:](self, "setProcessName:", v11);
  -[WPDClient setHoldVouchers:](self, "setHoldVouchers:", a6);
  -[WPDClient setClientTypeString:](self, "setClientTypeString:", v10);
  -[WPDClient setScanDenylisted:](self, "setScanDenylisted:", objc_msgSend((id)DenylistedProcesses, "containsObject:", v11));
  -[WPDClient clientTypeString](self, "clientTypeString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient setIsObjectDiscovery:](self, "setIsObjectDiscovery:", objc_msgSend(v14, "isEqualToString:", CFSTR("WPObjectDiscovery")));

  if ((-[WPDClient isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    -[WPDClient server](self, "server");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12)
    {
      objc_msgSend(v15, "clientForMachName:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_345);
        v18 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          v19 = v18;
          -[WPDClient clientUUID](self, "clientUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_INFO, "WPDClient removing new client %@", buf, 0xCu);

        }
        -[WPDClient conn](self, "conn");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resumeCommunicationWithConnection:andProcessID:", v21, -[WPDClient processID](self, "processID"));

        objc_msgSend(v16, "removeClient:", self);
        goto LABEL_19;
      }
      -[WPDClient setMachName:](self, "setMachName:", v12);
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __65__WPDClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke_346;
    v26[3] = &unk_24D7C2DC0;
    objc_copyWeak(&v27, (id *)buf);
    v23 = (void *)MEMORY[0x219A0F018](v26);
    objc_msgSend(v16, "registerClient:withMachName:withCompletion:", self, v12, v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
LABEL_19:

    goto LABEL_20;
  }
  -[WPDClient setMachName:](self, "setMachName:", v12);
  -[WPDClient setEntitledForObjectDiscovery:](self, "setEntitledForObjectDiscovery:", 1);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_343);
  v22 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDClient registerWithDaemon:forProcess:machName:holdVouchers:].cold.1(v22, self);
LABEL_20:

}

void __65__WPDClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke_346(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  id v17;

  v17 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setRegistered:", 1);
    objc_msgSend(v16, "setScanManager:", v17);
    objc_msgSend(v16, "setAdvertisingManager:", v11);
    objc_msgSend(v16, "setZoneManager:", v12);
    objc_msgSend(v16, "setPipeManager:", v13);
    objc_msgSend(v16, "setObjectDiscoveryManager:", v14);
    objc_msgSend(v16, "sendRegisteredWithDaemonAndContinuingSession:", 0);
  }

}

- (void)sendRegisteredWithDaemonAndContinuingSession:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  -[WPDClient conn](self, "conn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WPDClient conn](self, "conn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registeredWithDaemonAndContinuingSession:", v3);

  }
  -[WPDClient server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wpdState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");
  -[WPDClient scanManager](self, "scanManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient notifyClientStateChange:Restricted:](self, "notifyClientStateChange:Restricted:", v10, objc_msgSend(v11, "restricted"));

  if (+[WPDaemonServer isInternalBuild](WPDaemonServer, "isInternalBuild"))
    -[WPDClient verifyApprovedUseCase](self, "verifyApprovedUseCase");
}

- (void)tickleMachPort
{
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "clientUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  v8 = 2112;
  v9 = a3;
  _os_log_error_impl(&dword_2175D1000, v5, OS_LOG_TYPE_ERROR, "WPDClient %{public}@ was not found for mach name %@", v7, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)resumeCommunicationWithConnection:(id)a3 andProcessID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WPDClient conn](self, "conn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", 0);

  -[WPDClient conn](self, "conn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInvalidationHandler:", 0);

  -[WPDClient conn](self, "conn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[WPDClient setConn:](self, "setConn:", 0);
  -[WPDClient setProcessID:](self, "setProcessID:", v4);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_396);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[WPDClient clientUUID](self, "clientUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v12;
    v17 = 1024;
    v18 = -[WPDClient processID](self, "processID");
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "WPDClient resuming new connection on old client %@ from new pid %d", (uint8_t *)&v15, 0x12u);

  }
  -[WPDClient setConn:](self, "setConn:", v6);

  -[WPDClient setupConnection](self, "setupConnection");
  -[WPDClient sendRegisteredWithDaemonAndContinuingSession:](self, "sendRegisteredWithDaemonAndContinuingSession:", 1);
  -[WPDClient setPortTickled:](self, "setPortTickled:", 0);
  -[WPDClient messageQueue](self, "messageQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WPDClient messageQueue](self, "messageQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v14);

  }
}

- (void)checkEntitlements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WPDClient conn](self, "conn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDClient conn](self, "conn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.wirelessproxd-location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient setEntitledForZones:](self, "setEntitledForZones:", objc_msgSend(v5, "BOOLValue"));

    -[WPDClient conn](self, "conn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.wirelessproxd-object-discovery"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient setEntitledForObjectDiscovery:](self, "setEntitledForObjectDiscovery:", objc_msgSend(v7, "BOOLValue"));

    -[WPDClient conn](self, "conn");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForEntitlement:", CFSTR("com.apple.wirelessproxd-enable-ranging"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient setEntitledForRanging:](self, "setEntitledForRanging:", objc_msgSend(v8, "BOOLValue"));

  }
}

- (void)endTestMode
{
  -[WPDClient setIsTestModeClient:](self, "setIsTestModeClient:", 0);
}

- (void)setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  +[WPDXPCInterfaces serverInterface](WPDXPCInterfaces, "serverInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient conn](self, "conn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v3);

  -[WPDClient conn](self, "conn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", self);

  +[WPDXPCInterfaces clientInterface](WPDXPCInterfaces, "clientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient conn](self, "conn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v6);

  -[WPDClient conn](self, "conn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient serverQueue](self, "serverQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setQueue:", v9);

  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient conn](self, "conn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __28__WPDClient_setupConnection__block_invoke;
  v15[3] = &unk_24D7C1C00;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v10, "setInvalidationHandler:", v15);

  -[WPDClient conn](self, "conn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __28__WPDClient_setupConnection__block_invoke_399;
  v13[3] = &unk_24D7C1C00;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v12, "setInterruptionHandler:", v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __28__WPDClient_setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_398);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      objc_msgSend(WeakRetained, "clientUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "processName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543874;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      v10 = 1024;
      v11 = objc_msgSend(WeakRetained, "processID");
      _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "WPDClient %{public}@ XPC connection for process %{public}@ (%d) is becoming invalidated", (uint8_t *)&v6, 0x1Cu);

    }
    objc_msgSend(WeakRetained, "destroy");
  }

}

void __28__WPDClient_setupConnection__block_invoke_399(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_401);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      objc_msgSend(WeakRetained, "clientUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "processName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543874;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      v10 = 1024;
      v11 = objc_msgSend(WeakRetained, "processID");
      _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "WPDClient %{public}@ XPC connection for client %{public}@ (%d) is becoming interrupted", (uint8_t *)&v6, 0x1Cu);

    }
    objc_msgSend(WeakRetained, "destroy");
  }

}

- (void)destroy
{
  void *v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  WPDClient *v27;
  id v28;
  _BYTE buf[12];
  __int16 v30;
  WPDClient *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[WPDClient machName](self, "machName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDClient messageQueue](self, "messageQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (const char *)objc_msgSend(CFSTR("com.apple.wirelessproxd.framework-message-queue"), "UTF8String");
      dispatch_queue_attr_make_initially_inactive(0);
      v6 = objc_claimAutoreleasedReturnValue();
      -[WPDClient serverQueue](self, "serverQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create_with_target_V2(v5, v6, v7);
      -[WPDClient setMessageQueue:](self, "setMessageQueue:", v8);

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_402);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[WPDClient clientUUID](self, "clientUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient processName](self, "processName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WPDClient processID](self, "processID");
      -[WPDClient machName](self, "machName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v11;
      v30 = 2050;
      v31 = self;
      v32 = 2114;
      v33 = v12;
      v34 = 1024;
      v35 = v13;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating WPDClient %{public}@ (%{public}p) of process %{public}@ (%d) with mach port %@", buf, 0x30u);

    }
    -[WPDClient conn](self, "conn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

    -[WPDClient setConn:](self, "setConn:", 0);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_404);
    v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      -[WPDClient clientUUID](self, "clientUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient processName](self, "processName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v18;
      v30 = 2050;
      v31 = self;
      v32 = 2114;
      v33 = v19;
      v34 = 1024;
      v35 = -[WPDClient processID](self, "processID");
      _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "Removing WPDClient %{public}@ (%{public}p) of process %{public}@ (%d)", buf, 0x26u);

    }
    if (-[WPDClient registered](self, "registered"))
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      -[WPDClient serverQueue](self, "serverQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __20__WPDClient_destroy__block_invoke_405;
      v26 = &unk_24D7C25B8;
      objc_copyWeak(&v28, (id *)buf);
      v27 = self;
      dispatch_async(v20, &v23);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    -[WPDClient conn](self, "conn", v23, v24, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidate");

    -[WPDClient server](self, "server");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeClient:", self);

  }
}

void __20__WPDClient_destroy__block_invoke_405(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "destroy_async");
    WeakRetained = v3;
  }

}

- (void)destroy_async
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "processName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  v4 = 138543618;
  v5 = v2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v1, v3, "Scan voucher release for process %{public}@ (%d)", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1_1();
}

void __26__WPDClient_destroy_async__block_invoke_409(int a1, int a2, dispatch_source_t source)
{
  dispatch_source_cancel(source);
}

void __26__WPDClient_destroy_async__block_invoke_2(int a1, int a2, dispatch_source_t source)
{
  dispatch_source_cancel(source);
}

void __26__WPDClient_destroy_async__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pipeManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterEndpoint:forClient:", v4, v5);

}

- (void)addCharacteristic:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_419);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ for service %{public}@", (uint8_t *)&v11, 0x16u);
  }
  -[WPDClient advertisingManager](self, "advertisingManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addCharacteristic:forService:forClient:", v6, v7, v10);

}

- (void)startAdvertising:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[WPDClient startAdvertising:](self, "startAdvertising:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)startAdvertising:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (_enableScanAdvertVouchers && (-[WPDClient holdVouchers](self, "holdVouchers") & 8) != 0)
  {
    v5 = (void *)voucher_copy();
    -[WPDClient setAdvertVoucher:](self, "setAdvertVoucher:", v5);

    objc_msgSend(v4, "setHoldVoucher:", 1);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_420);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDClient startAdvertising:].cold.1(v6, self);
  }
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__WPDClient_startAdvertising___block_invoke_421;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __30__WPDClient_startAdvertising___block_invoke_421(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startAdvertising_async:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)startAdvertising_async:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  dispatch_time_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  NSObject *v57;
  id v58;
  WPDClient *v59;
  id v60[2];
  char v61;
  uint64_t v62;
  const __CFString *v63;
  _BYTE buf[28];
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  double v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[WPDClient registered](self, "registered"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_451);
    v49 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient startAdvertising_async:].cold.3(v49, self);
    v48 = 0;
    goto LABEL_39;
  }
  v5 = objc_msgSend(v4, "clientType");
  objc_msgSend(v4, "updateTime");
  v7 = v6;
  if (-[WPDClient isTestModeClient](self, "isTestModeClient"))
  {
    -[WPDClient advTimeout](self, "advTimeout");
    if (v8 != 0.0)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_422);
      v9 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        -[WPDClient advTimeout](self, "advTimeout");
        v12 = v11;
        -[WPDClient clientTypeString](self, "clientTypeString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "Setting advert update time to %f for %@", buf, 0x16u);

      }
      -[WPDClient advTimeout](self, "advTimeout");
      v7 = v14;
    }
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_424);
  v15 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[WPDClient processName](self, "processName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WPDClient processID](self, "processID");
    v19 = objc_msgSend(v4, "advertisingRate");
    v20 = objc_msgSend(v4, "advertisingRate");
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v18;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v5;
    v65 = 2048;
    v66 = v19;
    v67 = 2048;
    v68 = (double)v20 * 0.625;
    _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "Start advertising for process %{public}@ (%d) of type %ld with advertising interval %ld (%.2f ms)", buf, 0x30u);

  }
  if (*(double *)&v7 > 0.0)
  {
    -[WPDClient advertTimers](self, "advertTimers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[WPDClient advertTimers](self, "advertTimers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v26);

      -[WPDClient advertTimers](self, "advertTimers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v28);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_427);
      v29 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDClient startAdvertising_async:].cold.2(v5, v29, v30, v31, v32, v33, v34, v35);
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_429);
    v36 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v5;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v7;
      _os_log_impl(&dword_2175D1000, v36, OS_LOG_TYPE_DEFAULT, "Setting advert timer for client %d with time %.2f ", buf, 0x12u);
    }
    -[WPDClient serverQueue](self, "serverQueue");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v37);

    v39 = dispatch_time(0, (uint64_t)(*(double *)&v7 * 1000000000.0));
    dispatch_source_set_timer(v38, v39, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v53 = MEMORY[0x24BDAC760];
    v54 = 3221225472;
    v55 = __36__WPDClient_startAdvertising_async___block_invoke_430;
    v56 = &unk_24D7C3138;
    v61 = v5;
    v60[1] = v7;
    v40 = v38;
    v57 = v40;
    objc_copyWeak(v60, (id *)buf);
    v58 = v4;
    v59 = self;
    dispatch_source_set_event_handler(v40, &v53);
    -[WPDClient advertTimerState](self, "advertTimerState", v53, v54, v55, v56);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v42);

    -[WPDClient advertTimers](self, "advertTimers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, v44);

    objc_destroyWeak(v60);
    objc_destroyWeak((id *)buf);

  }
  if ((_DWORD)v5 == 18)
  {
    -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientUUID](self, "clientUUID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addAdvertisingRequest:forClient:", v4, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_445);
      v51 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient startAdvertising_async:].cold.1(v51, self);
      v52 = (void *)MEMORY[0x24BDD1540];
      v62 = *MEMORY[0x24BDD0FC8];
      v63 = CFSTR("ObjectDiscovery advertising is not supported on this platform.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 27, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[WPDClient advertisingManager](self, "advertisingManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addAdvertisingRequest:forClient:", v4, v50);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v48)
  {
LABEL_39:
    -[WPDClient advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v48, objc_msgSend(v4, "clientType"));
    -[WPDClient setPendingSent:](self, "setPendingSent:", 0);

  }
}

void __36__WPDClient_startAdvertising_async___block_invoke_430(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19[2];
  char v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_431);
  v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 72);
    v4 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    v22 = v3;
    v23 = 2048;
    v24 = v4;
    _os_log_impl(&dword_2175D1000, v2, OS_LOG_TYPE_DEFAULT, "Advert timer expired for client %d after %.2f seconds", buf, 0x12u);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "clientType") == 8)
    {
      objc_msgSend(*(id *)(a1 + 40), "setUpdateTime:", 0.0);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_433);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "HeySiri force stoping advertising", buf, 2u);
      }
      objc_msgSend(WeakRetained, "stopAdvertising:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_435);
      v7 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 48);
        v9 = *(unsigned __int8 *)(a1 + 72);
        v10 = v7;
        objc_msgSend(v8, "processName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(*(id *)(a1 + 48), "processID");
        v13 = objc_msgSend(*(id *)(a1 + 40), "advertisingRate");
        v14 = objc_msgSend(*(id *)(a1 + 40), "advertisingRate");
        *(_DWORD *)buf = 67110146;
        v22 = v9;
        v23 = 2114;
        v24 = v11;
        v25 = 1024;
        v26 = v12;
        v27 = 2048;
        v28 = v13;
        v29 = 2048;
        v30 = (double)v14 * 0.625;
        _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Client has exceeded adv limit! Client: %d , Process: %{public}@ (%d) , Advertising interval: %ld (%.2f ms) ", buf, 0x2Cu);

      }
    }
    objc_msgSend(WeakRetained, "conn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __36__WPDClient_startAdvertising_async___block_invoke_436;
    v18[3] = &unk_24D7C3110;
    objc_copyWeak(v19, (id *)(a1 + 56));
    v18[4] = WeakRetained;
    v20 = *(_BYTE *)(a1 + 72);
    v19[1] = *(id *)(a1 + 64);
    objc_msgSend(v16, "updateAdvertisingRequest:withUpdate:", v17, v18);

    objc_destroyWeak(v19);
  }

}

void __36__WPDClient_startAdvertising_async___block_invoke_436(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  _BYTE v21[14];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_18;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "advertTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_440);
      v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(unsigned __int8 *)(a1 + 56);
        v10 = *(_QWORD *)(a1 + 48);
        v20 = 67109376;
        *(_DWORD *)v21 = v9;
        *(_WORD *)&v21[4] = 2048;
        *(_QWORD *)&v21[6] = v10;
        _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Updating advert request for client %d after %.2f seconds", (uint8_t *)&v20, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "startAdvertising:", v3);
      goto LABEL_18;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_442);
    v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      v13 = v17;
      objc_msgSend(v18, "processName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(*(id *)(a1 + 32), "processID");
      v20 = 138412546;
      *(_QWORD *)v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v19;
      v16 = "Tried to update the advertising request interval for process %@ (%d), but a client has asked us to stop in the meantime";
      goto LABEL_17;
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_438);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "processName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 32), "processID");
      v20 = 138412546;
      *(_QWORD *)v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v15;
      v16 = "Tried to update the advertising request for process %@ (%d) - NOOP";
LABEL_17:
      _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x12u);

    }
  }
LABEL_18:

}

- (void)stopAdvertising:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (_enableScanAdvertVouchers && (-[WPDClient holdVouchers](self, "holdVouchers") & 8) != 0)
  {
    -[WPDClient setAdvertVoucher:](self, "setAdvertVoucher:", 0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_452);
    v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDClient stopAdvertising:].cold.1(v5, self);
  }
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__WPDClient_stopAdvertising___block_invoke_453;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __29__WPDClient_stopAdvertising___block_invoke_453(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopAdvertising_async:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)stopAdvertising_async:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WPDClient registered](self, "registered"))
  {
    v5 = objc_msgSend(v4, "clientType");
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_454);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[WPDClient processName](self, "processName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v8;
      v32 = 1024;
      v33 = -[WPDClient processID](self, "processID");
      v34 = 2048;
      v35 = v5;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Stop advertising for process %{public}@ (%d) of type %ld", buf, 0x1Cu);

    }
    -[WPDClient advertTimers](self, "advertTimers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WPDClient advertTimers](self, "advertTimers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v14);

      -[WPDClient advertTimers](self, "advertTimers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v16);

    }
    if ((_DWORD)v5 == 18)
    {
      -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_456);
        v26 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDClient stopAdvertising_async:].cold.2(v26);
        v27 = (void *)MEMORY[0x24BDD1540];
        v28 = *MEMORY[0x24BDD0FC8];
        v29 = CFSTR("ObjectDiscovery advertising is not supported on this platform.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 27, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      -[WPDClient objectDiscoveryManager](self, "objectDiscoveryManager");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WPDClient advertisingManager](self, "advertisingManager");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v18;
    -[WPDClient clientUUID](self, "clientUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAdvertisingRequest:forClient:", v4, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    if (v22)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_458);
      v23 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient stopAdvertising_async:].cold.1(v23);
    }
    else
    {
      -[WPDClient conn](self, "conn");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "remoteObjectProxy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "advertisingStoppedOfType:withError:", objc_msgSend(v4, "clientType"), 0);

      -[WPDClient setPendingSent:](self, "setPendingSent:", 0);
    }

    goto LABEL_24;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_460);
  v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDClient stopAdvertising_async:].cold.3(v19);
LABEL_24:

}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_461);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDClient processName](self, "processName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v7;
    v23 = 1024;
    v24 = -[WPDClient processID](self, "processID");
    v25 = 2048;
    v26 = v3;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Advertising started for client %@ (%d) of type %ld", (uint8_t *)&v21, 0x1Cu);

  }
  -[WPDClient advertTimers](self, "advertTimers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  -[WPDClient advertTimerState](self, "advertTimerState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if ((v15 & 1) == 0)
  {
    -[WPDClient advertTimers](self, "advertTimers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v18);

    -[WPDClient advertTimerState](self, "advertTimerState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v9);
LABEL_8:

  }
  -[WPDClient setPendingSent:](self, "setPendingSent:", 0);
  -[WPDClient conn](self, "conn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "remoteObjectProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "advertisingStartedOfType:", v3);

}

- (void)advertisingStartedOfTypeAt:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a3;
  -[WPDClient conn](self, "conn");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "advertisingStartedOfTypeAt:", v3);

}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_462);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
  {
    v10 = v7;
    -[WPDClient processName](self, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 1024;
    v16 = v4;
    v17 = 2112;
    v18 = v12;
    _os_log_error_impl(&dword_2175D1000, v10, OS_LOG_TYPE_ERROR, "Advertising failed to start for client %@ type %d with error: %@", (uint8_t *)&v13, 0x1Cu);

  }
  -[WPDClient conn](self, "conn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "advertisingFailedToStart:ofType:", v6, v4);

  -[WPDClient setPendingSent:](self, "setPendingSent:", 0);
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[WPDClient pendingSent](self, "pendingSent"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_463);
    v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[WPDClient processName](self, "processName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2048;
      v13 = v3;
      _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Advertising pending for client %{public}@ type %ld", (uint8_t *)&v10, 0x16u);

    }
    -[WPDClient conn](self, "conn");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "advertisingPendingOfType:", v3);

    -[WPDClient setPendingSent:](self, "setPendingSent:", 1);
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_464);
    v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      -[WPDClient processName](self, "processName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v9;
      v16 = 1024;
      v17 = v4;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_2175D1000, v8, OS_LOG_TYPE_ERROR, "Advertising stopped for client %@ type %d with error: %@", (uint8_t *)&v14, 0x1Cu);

LABEL_10:
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_466);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v11;
      -[WPDClient processName](self, "processName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Advertising stopped for client %@ type %d", (uint8_t *)&v14, 0x12u);
      goto LABEL_10;
    }
  }
  -[WPDClient conn](self, "conn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "advertisingStoppedOfType:withError:", v4, v6);

  -[WPDClient setPendingSent:](self, "setPendingSent:", 0);
}

- (void)notifyClientStateChange:(int64_t)a3 Restricted:(BOOL)a4
{
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (a3 == 3 && a4)
  {
    if (-[WPDClient scanDenylisted](self, "scanDenylisted"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_467);
      v6 = (void *)WiProxLog;
      v4 = 2;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        -[WPDClient notifyClientStateChange:Restricted:].cold.2(v6);
        v4 = 2;
      }
    }
    else
    {
      v4 = 3;
    }
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_469);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDClient notifyClientStateChange:Restricted:].cold.1(v7, self, v4);
  -[WPDClient conn](self, "conn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stateDidChange:", v4);

  if (v4 >= 3)
  {
    if (v4 == 3)
      -[WPDClient setScansOff:](self, "setScansOff:", 0);
  }
  else
  {
    -[WPDClient stopScans](self, "stopScans");
    -[WPDClient setScansOff:](self, "setScansOff:", 1);
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

  }
}

void __30__WPDClient_discoveredDevice___block_invoke_471(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "conn");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceDiscovered:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (void)discoveredDevices:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WPDClient *v9;

  v4 = a3;
  -[WPDClient serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__WPDClient_discoveredDevices___block_invoke;
  v7[3] = &unk_24D7C2600;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __31__WPDClient_discoveredDevices___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;
  _QWORD v10[6];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "count");
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__WPDClient_discoveredDevices___block_invoke_2;
  v10[3] = &unk_24D7C3360;
  v10[4] = *(_QWORD *)(a1 + 40);
  v10[5] = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v10);
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 40));
  v5 = *(void **)(a1 + 40);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __31__WPDClient_discoveredDevices___block_invoke_474;
  v6[3] = &unk_24D7C25B8;
  objc_copyWeak(&v8, &location);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "queueBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __31__WPDClient_discoveredDevices___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDeviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  kdebug_trace();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_472);
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "processName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138413570;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2048;
    v20 = a3 + 1;
    v21 = 2048;
    v22 = v14;
    v23 = 1024;
    v24 = v8;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_INFO, "Telling process %@ (%@) about ADV Buffer (%ld/%ld) discovered device of type %d with data %@", (uint8_t *)&v15, 0x3Au);

  }
}

void __31__WPDClient_discoveredDevices___block_invoke_474(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "conn");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "devicesDiscovered:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (void)anyDiscoveredDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WPDClient *v9;

  v4 = a3;
  -[WPDClient serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__WPDClient_anyDiscoveredDevice___block_invoke;
  v7[3] = &unk_24D7C2600;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __33__WPDClient_anyDiscoveredDevice___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _BYTE buf[12];
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "objectForKeyedSubscript:", CFSTR("kDeviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  kdebug_trace();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_475);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    objc_msgSend(v7, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 1024;
    v19 = v5;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_INFO, "Telling process %@ (%@) about ANY discovered device of type %d with data %@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v11 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__WPDClient_anyDiscoveredDevice___block_invoke_476;
  v12[3] = &unk_24D7C25B8;
  objc_copyWeak(&v14, (id *)buf);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v11, "queueBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __33__WPDClient_anyDiscoveredDevice___block_invoke_476(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "conn");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyDiscoveredDevice:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (void)resetConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[WPDClient serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__WPDClient_resetConnection__block_invoke;
  block[3] = &unk_24D7C2530;
  block[4] = self;
  dispatch_async(v3, block);

}

void __28__WPDClient_resetConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__WPDClient_resetConnection__block_invoke_2;
  v4[3] = &unk_24D7C33A8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

uint64_t __28__WPDClient_resetConnection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelConnectionTimer:", a2);
}

- (void)registerForAnyScanResults:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[WPDClient scanManager](self, "scanManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v6, "addSpyScanClient:", v5);
  else
    objc_msgSend(v6, "removeSpyScanClient:", v5);

}

void __27__WPDClient_startScanning___block_invoke_479(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startScanning_async:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __33__WPDClient_startScanning_async___block_invoke_507(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18[2];
  char v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_508);
  v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 72);
    v4 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    v21 = v3;
    v22 = 2048;
    v23 = v4;
    _os_log_impl(&dword_2175D1000, v2, OS_LOG_TYPE_DEFAULT, "Scan timer expired for client %d after %.2f seconds", buf, 0x12u);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "clientType") == 8)
    {
      objc_msgSend(*(id *)(a1 + 40), "setUpdateTime:", 0.0);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_510);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "HeySiri force stoping scan", buf, 2u);
      }
      objc_msgSend(WeakRetained, "stopScanning:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_512);
      v7 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 48);
        v9 = *(unsigned __int8 *)(a1 + 72);
        v10 = v7;
        objc_msgSend(v8, "processName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(*(id *)(a1 + 48), "processID");
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109890;
        v21 = v9;
        v22 = 2114;
        v23 = v11;
        v24 = 1024;
        v25 = v12;
        v26 = 2114;
        v27 = v13;
        _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Client has exceeded scan limit! Client: %d , Process: %{public}@ (%d) , Scan interval: %{public}@ ", buf, 0x22u);

      }
    }
    objc_msgSend(WeakRetained, "conn");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __33__WPDClient_startScanning_async___block_invoke_513;
    v17[3] = &unk_24D7C35D0;
    objc_copyWeak(v18, (id *)(a1 + 56));
    v17[4] = WeakRetained;
    v19 = *(_BYTE *)(a1 + 72);
    v18[1] = *(id *)(a1 + 64);
    objc_msgSend(v15, "updateScanningRequest:withUpdate:", v16, v17);

    objc_destroyWeak(v18);
  }

}

void __33__WPDClient_startScanning_async___block_invoke_513(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  _BYTE v21[14];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_18;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_517);
      v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(unsigned __int8 *)(a1 + 56);
        v10 = *(_QWORD *)(a1 + 48);
        v20 = 67109376;
        *(_DWORD *)v21 = v9;
        *(_WORD *)&v21[4] = 2048;
        *(_QWORD *)&v21[6] = v10;
        _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Updating scan request for client %d after %.2f seconds", (uint8_t *)&v20, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "startScanning:", v3);
      goto LABEL_18;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_519);
    v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      v13 = v17;
      objc_msgSend(v18, "processName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(*(id *)(a1 + 32), "processID");
      v20 = 138412546;
      *(_QWORD *)v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v19;
      v16 = "Tried to update the scan request interval for process %@ (%d), but a client has asked us to stop in the meantime";
      goto LABEL_17;
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_515);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "processName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 32), "processID");
      v20 = 138412546;
      *(_QWORD *)v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v15;
      v16 = "Tried to update the scan request for process %@ (%d) - NOOP";
LABEL_17:
      _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x12u);

    }
  }
LABEL_18:

}

void __26__WPDClient_stopScanning___block_invoke_522(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopScanning_async:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WPDClient_clearDuplicateFilterCache___block_invoke;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__WPDClient_clearDuplicateFilterCache___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "clearDuplicateFilterCache_async:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)clearDuplicateFilterCache_async:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "clientType");
  if (-[WPDClient registered](self, "registered"))
  {
    if ((_DWORD)v5 != 18)
    {
LABEL_5:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_538);
      v6 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[WPDClient processName](self, "processName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v8;
        v18 = 1024;
        v19 = -[WPDClient processID](self, "processID");
        v20 = 2114;
        v21 = v4;
        _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "clear dup filter cache for process %{public}@ (%d) with %{public}@", (uint8_t *)&v16, 0x1Cu);

      }
      -[WPDClient scanManager](self, "scanManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientUUID](self, "clientUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clearDuplicateFilterCache:forClient:", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_540);
        v12 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 67109120;
          LODWORD(v17) = v5;
          _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "Trying to clear dup filter cache for a type %d we don't scan for", (uint8_t *)&v16, 8u);
        }
      }

      goto LABEL_19;
    }
    if (-[WPDClient entitledForObjectDiscovery](self, "entitledForObjectDiscovery"))
    {
      if (-[WPDClient supportsObjectDiscovery](self, "supportsObjectDiscovery"))
        goto LABEL_5;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_536);
      v15 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient clearDuplicateFilterCache_async:].cold.1(v15);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_534);
      v14 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient clearDuplicateFilterCache_async:].cold.2(v14);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_532);
    v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient clearDuplicateFilterCache_async:].cold.3(v5, v13);
  }
LABEL_19:

}

- (void)startTrackingPeerWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[WPDClient scanManager](self, "scanManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPeerTrackingRequest:forClient:", v11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDClient conn](self, "conn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "failedToStartTrackingPeer:error:", v11, v6);
  }
  else
  {
    objc_msgSend(v11, "peerUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startedTrackingPeer:ofType:", v10, objc_msgSend(v11, "clientType"));

  }
}

- (void)stopTrackingPeerWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[WPDClient scanManager](self, "scanManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePeerTrackingRequest:checkZonesAvailable:forClient:", v11, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDClient conn](self, "conn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "failedToStartTrackingPeer:error:", v11, v6);
  }
  else
  {
    objc_msgSend(v11, "peerUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stoppedTrackingPeer:ofType:", v10, objc_msgSend(v11, "clientType"));

  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[WPDClient conn](self, "conn");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stoppedTrackingPeer:ofType:", v6, v4);

}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_541);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[WPDClient processName](self, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Telling client %@ that peer %@ has been found", (uint8_t *)&v12, 0x16u);

  }
  -[WPDClient conn](self, "conn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "foundPeer:ofType:", v6, v4);

}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_542);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[WPDClient processName](self, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Telling client %@ that peer %@ has been lost", (uint8_t *)&v12, 0x16u);

  }
  -[WPDClient conn](self, "conn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lostPeer:ofType:", v6, v4);

}

- (void)peerTrackingAvailable
{
  void *v2;
  id v3;

  -[WPDClient conn](self, "conn");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerTrackingAvailable");

}

- (void)peerTrackingFull
{
  void *v2;
  id v3;

  -[WPDClient conn](self, "conn");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerTrackingFull");

}

- (void)startTrackingZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[WPDClient entitledForZones](self, "entitledForZones"))
  {
    -[WPDClient zoneManager](self, "zoneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addZoneTrackingRequest:forClient:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WPDClient conn](self, "conn");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "zones");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "failedToRegisterZones:withError:", v10, v7);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_543);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient startTrackingZone:].cold.1();
    -[WPDClient conn](self, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

  }
}

- (void)stopTrackingZones:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[WPDClient entitledForZones](self, "entitledForZones"))
  {
    -[WPDClient zoneManager](self, "zoneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterZones:forClient:", v4, v6);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_544);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient stopTrackingZones:].cold.1();
    -[WPDClient conn](self, "conn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
}

- (void)stopTrackingAllZones
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Client %@ is not entitled to stop track all zones, invalidating connection", v2);
  OUTLINED_FUNCTION_0();
}

- (void)getAllTrackedZones
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Client %@ is not entitled to get all tracked zones, invalidating connection", v2);
  OUTLINED_FUNCTION_0();
}

- (void)enteredZone:(id)a3 manufacturerData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[WPDClient entitledForZones](self, "entitledForZones"))
  {
    -[WPDClient conn](self, "conn");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enteredZone:manufacturerData:", v6, v7);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_547);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient enteredZone:manufacturerData:].cold.1();
    -[WPDClient conn](self, "conn");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");
  }

}

- (void)exitedZone:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WPDClient conn](self, "conn");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exitedZone:", v4);

}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  id WeakRetained;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  dispatch_time_t v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  _QWORD handler[4];
  id v47;
  id v48;
  _BYTE buf[12];
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqual:", AllZeroUUID))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_548);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient connectToPeer:withOptions:].cold.1();
    goto LABEL_43;
  }
  if (-[WPDClient registered](self, "registered"))
  {
    v8 = (void *)MEMORY[0x219A0EE8C]();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient bundleID](self, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WPDClient bundleID](self, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDBB110]);

      v12 = (void *)MEMORY[0x24BDBCE30];
      -[WPDClient bundleID](self, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDBB190]);

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[WPDClient processID](self, "processID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDBB118]);

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
    -[WPDClient connections](self, "connections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "getPeripheral");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (objc_msgSend(v18, "didConnectSent"))
        {

LABEL_19:
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_553);
          v22 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            v44 = v22;
            -[WPDClient clientUUID](self, "clientUUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v6;
            v50 = 2114;
            v51 = (uint64_t)v45;
            v52 = 2112;
            v53 = v16;
            _os_log_debug_impl(&dword_2175D1000, v44, OS_LOG_TYPE_DEBUG, "TODO: rdar_57238900 amend existing connection, Connect to %{public}@ called by client %{public}@ - options %@", buf, 0x20u);

          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_555);
          v23 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v6;
            _os_log_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEFAULT, "We're already connected to this device %{public}@. Sending back didConnect again...", buf, 0xCu);
          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
          -[WPDClient clientUUID](self, "clientUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setPipeClientConnectionStatus:forPeer:forClient:", 1, v6, v25);

          -[WPDClient connectedDevice:withError:shouldDiscover:](self, "connectedDevice:withError:shouldDiscover:", v6, 0, 0);
LABEL_42:

          v7 = (id)v16;
          goto LABEL_43;
        }
      }
    }
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", v6);

    if (v18)
    {

      if ((v21 & 1) != 0)
        goto LABEL_19;
    }
    else if (v21)
    {
      goto LABEL_19;
    }
    v26 = objc_loadWeakRetained((id *)&self->_pipeManager);
    -[WPDClient clientUUID](self, "clientUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConnectionInitiator:forPeer:forClient:", 1, v6, v27);

    kdebug_trace();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_557);
    v28 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      -[WPDClient clientUUID](self, "clientUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientTypeString](self, "clientTypeString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient processName](self, "processName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v6;
      v50 = 2114;
      v51 = (uint64_t)v30;
      v52 = 2112;
      v53 = (uint64_t)v31;
      v54 = 2114;
      v55 = v32;
      v56 = 1024;
      v57 = -[WPDClient processID](self, "processID");
      v58 = 2112;
      v59 = v16;
      _os_log_impl(&dword_2175D1000, v29, OS_LOG_TYPE_DEFAULT, "Connect to %{public}@ called by client %{public}@ (%@) - process %{public}@ (%d) - options %@", buf, 0x3Au);

    }
    -[WPDClient scanManager](self, "scanManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "connectToPeripheral:fromClient:withOptions:", v6, v34, v16);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[WPDClient connectedDevice:withError:shouldDiscover:](self, "connectedDevice:withError:shouldDiscover:", v6, v35, 0);
    }
    else
    {
      -[WPDClient lePipePeersSet](self, "lePipePeersSet");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "containsObject:", v6);

      if ((v37 & 1) == 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_559);
        v38 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v6;
          v50 = 2048;
          v51 = 0x4024000000000000;
          _os_log_impl(&dword_2175D1000, v38, OS_LOG_TYPE_INFO, "Setting connection timer for peer %@ with time %.2f ", buf, 0x16u);
        }
        -[WPDClient serverQueue](self, "serverQueue");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v39);

        v41 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v40, v41, 0xFFFFFFFFFFFFFFFFLL, 0);
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __39__WPDClient_connectToPeer_withOptions___block_invoke_560;
        handler[3] = &unk_24D7C25B8;
        objc_copyWeak(&v48, (id *)buf);
        v42 = v6;
        v47 = v42;
        dispatch_source_set_event_handler(v40, handler);
        -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v42);
        -[WPDClient connectionTimer](self, "connectionTimer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, v42);

        dispatch_resume(v40);
        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);

      }
    }

    goto LABEL_42;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_563);
  v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDClient connectToPeer:withOptions:].cold.2(v19, v6);
LABEL_43:

}

void __39__WPDClient_connectToPeer_withOptions___block_invoke_560(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The connection to peer %@ didn't complete in %.2f seconds"), *(_QWORD *)(a1 + 32), 0x4024000000000000);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "connectedDevice:withError:shouldDiscover:", *(_QWORD *)(a1 + 32), v6, 0);
  }

}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_564);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v12;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "Sending connected device with error %{public}@", (uint8_t *)&v29, 0xCu);

  }
  -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v8);
  -[WPDClient connections](self, "connections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_566);
    v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient connectedDevice:withError:shouldDiscover:].cold.1(v15);
    -[WPDClient scanManager](self, "scanManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removePeripheralConnection:forClient:", v8, v17);

    if (v14)
    {
      -[WPDClient connections](self, "connections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v8);

    }
  }
  if (!v5)
  {
    -[WPDClient conn](self, "conn");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectProxy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v8;
    v26 = v9;
    v27 = 0;
LABEL_25:
    objc_msgSend(v23, "connectedDevice:withError:shouldDiscover:", v25, v26, v27);

    goto LABEL_26;
  }
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", v8);

  if ((v20 & 1) == 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_568);
    v28 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_2175D1000, v28, OS_LOG_TYPE_DEFAULT, "connectedDevice over GATT", (uint8_t *)&v29, 2u);
    }
    -[WPDClient conn](self, "conn");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectProxy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v8;
    v26 = v9;
    v27 = 1;
    goto LABEL_25;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_570);
  v21 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_DEFAULT, "connectedDevice over Pipe, set didConnectSent flag", (uint8_t *)&v29, 2u);
  }
  objc_msgSend(v14, "setDidConnectSent:", 1);
LABEL_26:

}

- (void)connectedDeviceOverLEPipe:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_571);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDClient clientUUID](self, "clientUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient processName](self, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v4;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Sending connected device over LE pipe to peer %@ for client %@ (%@)", (uint8_t *)&v20, 0x20u);

  }
  -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v4);
  -[WPDClient connections](self, "connections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_573);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "Setting didConnectSent flag", (uint8_t *)&v20, 2u);
    }
    objc_msgSend(v10, "setDidConnectSent:", 1);
  }
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v4);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_575);
  v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[WPDClient clientTypeString](self, "clientTypeString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient processName](self, "processName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "%@ (%@) connected over LE Pipe %@, current pipes %@", (uint8_t *)&v20, 0x2Au);

  }
  -[WPDClient conn](self, "conn");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "remoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "connectedDeviceOverLEPipe:", v4);

}

- (void)disconnectFromPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  _WORD v42[15];

  *(_QWORD *)&v42[11] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", AllZeroUUID))
  {
    -[WPDClient connections](self, "connections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_578);
    v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[WPDClient clientUUID](self, "clientUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient processName](self, "processName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[WPDClient processID](self, "processID");
      objc_msgSend(v6, "subscribedCharacteristics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138544386;
      v36 = v4;
      v37 = 2114;
      v38 = v9;
      v39 = 2114;
      v40 = v10;
      v41 = 1024;
      *(_DWORD *)v42 = v11;
      v42[2] = 2114;
      *(_QWORD *)&v42[3] = v12;
      _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Disconnect from %{public}@ called by client %{public}@ - process %{public}@ (%d) - subscribed characteristics: %{public}@", (uint8_t *)&v35, 0x30u);

    }
    if (!-[WPDClient registered](self, "registered"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_584);
      v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient disconnectFromPeer:].cold.2(v20);
      goto LABEL_34;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
    -[WPDClient clientUUID](self, "clientUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setConnectionInitiator:forPeer:forClient:", 0, v4, v14);

    if (!v6)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_580);
      v21 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v35 = 138412290;
        v36 = v4;
        _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_INFO, "WPDConnection doesn't exist for %@", (uint8_t *)&v35, 0xCu);
      }
      -[WPDClient lePipePeersSet](self, "lePipePeersSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", v4);

      if (v23)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_582);
        v24 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v24;
          -[WPDClient clientTypeString](self, "clientTypeString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPDClient processName](self, "processName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPDClient lePipePeersSet](self, "lePipePeersSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138413058;
          v36 = v26;
          v37 = 2112;
          v38 = v27;
          v39 = 2112;
          v40 = v4;
          v41 = 2112;
          *(_QWORD *)v42 = v28;
          _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, "%@ (%@) Disconnect over LE Pipe %@, current pipes %@", (uint8_t *)&v35, 0x2Au);

        }
        v29 = objc_loadWeakRetained((id *)&self->_pipeManager);
        -[WPDClient clientUUID](self, "clientUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setPipeClientConnectionStatus:forPeer:forClient:", 0, v4, v30);

        -[WPDClient disconnectedDeviceOverLEPipe:withError:](self, "disconnectedDeviceOverLEPipe:withError:", v4, 0);
      }
      else
      {
        -[WPDClient scanManager](self, "scanManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDClient clientUUID](self, "clientUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removePeripheralConnection:forClient:", v4, v32);

        -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v4);
        -[WPDClient conn](self, "conn");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "remoteObjectProxy");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "disconnectedDevice:withError:", v4, 0);

      }
      goto LABEL_34;
    }
    v15 = objc_msgSend(v6, "fetchConnectionType");
    if ((unint64_t)(v15 - 1) > 1)
    {
      if (v15)
      {
        v19 = 0;
LABEL_33:
        -[WPDClient disconnectedPeer:error:](self, "disconnectedPeer:error:", v4, v19);

LABEL_34:
        goto LABEL_35;
      }
      -[WPDClient scanManager](self, "scanManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientUUID](self, "clientUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "disconnectFromCentral:forClient:", v4, v17);
      v19 = 0;
    }
    else
    {
      -[WPDClient scanManager](self, "scanManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subscribedCharacteristics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient clientUUID](self, "clientUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "disconnectFromPeripheral:withSubscribedCharacteristics:forClient:", v4, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_33;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_576);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDClient disconnectFromPeer:].cold.1();
LABEL_35:

}

- (void)disconnectedPeer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPDClient connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v9, "didConnectSent"))
    {
      -[WPDClient lePipePeersSet](self, "lePipePeersSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v6);

      if ((v11 & 1) != 0)
      {
LABEL_23:
        -[WPDClient connections](self, "connections");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectForKey:", v6);
        goto LABEL_24;
      }
      -[WPDClient conn](self, "conn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "remoteObjectProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "disconnectedDevice:withError:", v6, v7);
    }
    else
    {
      if (v7)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_587);
        v20 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDClient stopAdvertising_async:].cold.1(v20);
        -[WPDClient connectedDevice:withError:shouldDiscover:](self, "connectedDevice:withError:shouldDiscover:", v6, v7, 0);
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("locally initiated disconnection"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_591);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient disconnectedPeer:error:].cold.1();
      v21 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      v24 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPDClient connectedDevice:withError:shouldDiscover:](self, "connectedDevice:withError:shouldDiscover:", v6, v13, 0);
    }

    goto LABEL_23;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_585);
  v14 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "Disconnected peer %@ but no connection object is set - check to see if we have pending connection", buf, 0xCu);
  }
  -[WPDClient scanManager](self, "scanManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removePeripheralConnection:forClient:", v6, v16);

  -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v6);
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v17, "containsObject:", v6);

  if ((v16 & 1) == 0)
  {
    -[WPDClient conn](self, "conn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteObjectProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "disconnectedDevice:withError:", v6, 0);

LABEL_24:
  }

}

- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_592);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient processName](self, "processName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413314;
    v23 = v6;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "Disconnected peer %@ over LE pipe with err %@ for client %@ (%@), pipe peers %@", (uint8_t *)&v22, 0x34u);

  }
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v6);

  if (v15)
  {
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v6);

    -[WPDClient scanManager](self, "scanManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removePeripheralConnection:forClient:", v6, v18);

    -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v6);
    -[WPDClient conn](self, "conn");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "remoteObjectProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "disconnectedDeviceOverLEPipe:withError:", v6, v7);

    -[WPDClient connections](self, "connections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectForKey:", v6);

  }
}

- (void)createdConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  v5 = objc_msgSend(v4, "fetchConnectionType");
  objc_msgSend(v4, "getPeripheralUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_597);
    v11 = (void *)WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v8 = v11;
    -[WPDClient clientUUID](self, "clientUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2114;
    *(_QWORD *)&v20[14] = v9;
    v10 = "Created a connection to central %{public}@ for client %{public}@";
LABEL_12:
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, v10, v20, 0x16u);

LABEL_13:
    -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v6, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
    goto LABEL_18;
  }
  if (v5 != 1)
  {
    if (v5 != 2)
      goto LABEL_18;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_593);
    v7 = (void *)WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v8 = v7;
    -[WPDClient clientUUID](self, "clientUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2114;
    *(_QWORD *)&v20[14] = v9;
    v10 = "Created a dual connection to peer %{public}@ for client %{public}@";
    goto LABEL_12;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_595);
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[WPDClient clientUUID](self, "clientUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2114;
    *(_QWORD *)&v20[14] = v14;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "Created a connection to peripheral %{public}@ for client %{public}@", v20, 0x16u);

  }
LABEL_18:
  -[WPDClient connections](self, "connections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_599);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v6;
      _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "Being given a new connection to %{public}@ when we already have a connection to it", v20, 0xCu);
    }
  }
  if ((-[WPDClient holdVouchers](self, "holdVouchers") & 2) != 0)
    objc_msgSend(v4, "holdVoucher");
  -[WPDClient connections](self, "connections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v4, v6);

  objc_msgSend(v4, "getPeripheralUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient connectedDevice:withError:shouldDiscover:](self, "connectedDevice:withError:shouldDiscover:", v19, 0, 1);

}

- (void)cancelConnectionTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPDClient connectionTimer](self, "connectionTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_600);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Cancel connnection timer for peer %@", (uint8_t *)&v11, 0xCu);
    }
    -[WPDClient connectionTimer](self, "connectionTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v9);

    -[WPDClient connectionTimer](self, "connectionTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v4);

  }
}

- (void)shouldSubscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "isEqual:", AllZeroUUID))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_601);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient shouldSubscribe:toPeer:withCharacteristic:inService:].cold.1();
  }
  else
  {
    -[WPDClient connections](self, "connections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WPDClient registered](self, "registered") && v14)
    {
      v15 = (id)objc_msgSend(v14, "subscribe:toPeer:withCharacteristic:inService:", v8, v10, v11, v12);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_603);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient shouldSubscribe:toPeer:withCharacteristic:inService:].cold.2();
    }

  }
}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[16];

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v12);

  if (v14)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_604);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient updatedNotificationState:forCharacteristic:inService:withPeripheral:].cold.1();
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v12);

  }
  -[WPDClient connections](self, "connections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "didConnectSent") && objc_msgSend(v17, "fetchConnectionType") != 2)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_606);
    v20 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "We've already sent a didConnect event as the central might have subscribed in the meantime. Not sending didConnect again because it's not dual connection", v21, 2u);
    }
  }
  else
  {
    objc_msgSend(v17, "setDidConnectSent:", 1);
    -[WPDClient conn](self, "conn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteObjectProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updatedNotificationState:forCharacteristic:inService:withPeripheral:", v8, v10, v11, v12);

  }
}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v10);

  if (v14)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_607);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient central:subscribed:toCharacteristic:inService:].cold.2();
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v10);

  }
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v10);

  if ((v17 & 1) == 0)
  {
    -[WPDClient conn](self, "conn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteObjectProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "central:subscribed:toCharacteristic:inService:", v10, v8, v11, v12);

  }
  -[WPDClient connections](self, "connections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v21, "setDidConnectSent:", 1);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_609);
    v22 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      objc_msgSend(v10, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEFAULT, "Central %{public}@ has unsubscribed from characteristics %{public}@", buf, 0x16u);

    }
    if (v21)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_611);
      v25 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, "A connection already existed...disconnecting", buf, 2u);
      }
      -[WPDClient disconnectFromPeer:](self, "disconnectFromPeer:", v10);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_613);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient central:subscribed:toCharacteristic:inService:].cold.1();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A central unsubscribed while a connection didn't exist"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD0FC8];
      v31 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPDClient connectedDevice:withError:shouldDiscover:](self, "connectedDevice:withError:shouldDiscover:", v10, v29, 0);
    }
  }

}

- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPDClient connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WPDClient registered](self, "registered") && v9)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_616);
    v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_INFO, "Trying to discover characteristics and services %@ on device %@", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(v9, "discoverCharacteristicsAndServices:forPeripheral:", v6, v7);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_618);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient discoverCharacteristicsAndServices:forPeripheral:].cold.1();
  }

}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_619);
    v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      -[WPDClient clientTypeString](self, "clientTypeString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient processName](self, "processName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient lePipePeersSet](self, "lePipePeersSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138413058;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "%@ (%@) connected to LE pipe during service discovery %{public}@, current pipes %@", (uint8_t *)&v17, 0x2Au);

    }
  }
  else
  {
    -[WPDClient conn](self, "conn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "discoveredCharacteristicsAndServices:forPeripheral:", v6, v7);

  }
}

- (void)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v10, "isEqual:", AllZeroUUID))
  {
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v10);

    if (v12)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_622);
      v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "Send data over LE pipe", buf, 2u);
      }
      objc_msgSend(v8, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient sendDatatoLePipe:forPeer:](self, "sendDatatoLePipe:forPeer:", v14, v10);
      goto LABEL_27;
    }
    -[WPDClient connections](self, "connections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WPDClient registered](self, "registered") && v14)
    {
      objc_msgSend(v8, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "length");
      kdebug_trace();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_624);
      v17 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        objc_msgSend(v10, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "data");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v19;
        v33 = 2048;
        v34 = objc_msgSend(v20, "length");
        _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_INFO, "Begin sending data to peer %@ of length %ld", buf, 0x16u);

      }
      objc_msgSend(v14, "sendDataToCharacteristic:inService:forPeer:", v8, v9, v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_26;
      objc_msgSend(v8, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient sentData:forCharacteristic:inService:forPeripheral:withError:](self, "sentData:forCharacteristic:inService:forPeripheral:withError:", v22, v24, v9, v10, v21);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_626);
      v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        -[WPDClient sendDataToCharacteristic:inService:forPeer:].cold.2(v25, self, (uint64_t)v14);
        if (v14)
          goto LABEL_27;
      }
      else if (v14)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Device is already disconnected"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      v30 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDClient sentData:forCharacteristic:inService:forPeripheral:withError:](self, "sentData:forCharacteristic:inService:forPeripheral:withError:", v23, v28, v9, v10, v22);

    }
LABEL_26:

    goto LABEL_27;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_620);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDClient sendDataToCharacteristic:inService:forPeer:].cold.1();
LABEL_28:

}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v12, "length");
  kdebug_trace();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_629);
  v17 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    objc_msgSend(v13, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "length");
    objc_msgSend(v14, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v19;
    v26 = 2048;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_INFO, "End sending data to peer %@ of length %ld with error: %@", (uint8_t *)&v24, 0x20u);

  }
  -[WPDClient conn](self, "conn");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "remoteObjectProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sentData:forCharacteristic:inService:forPeripheral:withError:", v12, v16, v15, v13, v14);

}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_630);
  v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    objc_msgSend(v12, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "length");
    objc_msgSend(v13, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413058;
    v22 = v16;
    v23 = 2048;
    v24 = v17;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_INFO, "End sending data to peer %@ of length %ld to enpoint %@ with error: %@", (uint8_t *)&v21, 0x2Au);

  }
  -[WPDClient conn](self, "conn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "remoteObjectProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sentData:toEndpoint:forPeripheral:withError:", v10, v11, v12, v13);

}

- (void)receivedData:(id)a3 fromCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_631);
  v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v17 = v14;
    objc_msgSend(v13, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEBUG, "Client received value update for characteristic %@ in service %@ for peripheral %@. Notifying client implementation.", (uint8_t *)&v19, 0x20u);

  }
  -[WPDClient conn](self, "conn");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "receivedData:forCharacteristic:inService:forPeripheral:", v10, v11, v12, v13);

}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[WPDClient lePipePeersSet](self, "lePipePeersSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v9);

  if ((v12 & 1) == 0)
  {
    -[WPDClient lePipePeersSet](self, "lePipePeersSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v9);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_632);
  v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDClient receivedData:fromEndpoint:forPeripheral:].cold.1((uint64_t)v8, v14, v9);
  -[WPDClient conn](self, "conn");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "receivedData:fromEndpoint:forPeripheral:", v10, v8, v9);

}

- (void)enableRanging:(BOOL)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__WPDClient_enableRanging_reply___block_invoke;
  block[3] = &unk_24D7C3E38;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __33__WPDClient_enableRanging_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_20;
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsRanging") & 1) == 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_633);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __33__WPDClient_enableRanging_reply___block_invoke_cold_2(a1, (id *)(a1 + 32), v9);
    v10 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("Ranging is not supported.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = 27;
    goto LABEL_15;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "entitledForRanging") & 1) == 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_639);
    v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __33__WPDClient_enableRanging_reply___block_invoke_cold_1(a1, (id *)(a1 + 32), v14);
    v15 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18 = CFSTR("The client is not entitled to manipulate ranging.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v13 = 29;
LABEL_15:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), v13, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  objc_msgSend(WeakRetained, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableRanging:", *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(WeakRetained, "scanManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableRanging:", *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(WeakRetained, "advertisingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(WeakRetained, "clientUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableRanging:forClient:", v6, v7);

  v8 = 0;
LABEL_16:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v8);
  else
    objc_msgSend(WeakRetained, "rangingEnabled:withError:", *(unsigned __int8 *)(a1 + 56), v8);

LABEL_20:
}

- (void)isRangingEnabledReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPDClient serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WPDClient_isRangingEnabledReply___block_invoke;
  block[3] = &unk_24D7C1F08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__WPDClient_isRangingEnabledReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "entitledForRanging"))
    {
      objc_msgSend(v3, "server");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isRangingEnabled");

      v6 = 0;
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_642);
      v7 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        __35__WPDClient_isRangingEnabledReply___block_invoke_cold_1(v7);
      v8 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12[0] = CFSTR("The client is not entitled to manipulate ranging");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 29, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v6, v5);
    else
      objc_msgSend(v3, "rangingEnabled:withError:", v5, v6);

  }
}

- (void)rangingEnabled:(BOOL)a3 withError:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_645);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    if (v4)
      v10 = "enabled";
    else
      v10 = "disabled";
    v11 = v7;
    -[WPDClient processName](self, "processName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 1024;
    v18 = -[WPDClient processID](self, "processID");
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEBUG, "Ranging %s for client %@ (%d) with error: %@", (uint8_t *)&v13, 0x26u);

  }
  -[WPDClient conn](self, "conn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangingEnabled:withError:", v4, v6);

}

- (void)checkAllowDuplicates:(id)a3
{
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (-[WPDClient registered](self, "registered"))
  {
    v4[2](v4, 1);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_648);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient checkAllowDuplicates:].cold.1();
  }

}

- (id)getManager
{
  void *v2;
  void *v3;

  -[WPDClient advertisingManager](self, "advertisingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)connectionForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WPDClient connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)readyForDataTransfer
{
  id v3;

  if (-[WPDClient registered](self, "registered"))
  {
    -[WPDClient connections](self, "connections");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_649);

  }
}

uint64_t __33__WPDClient_readyForDataTransfer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "readyForDataTransfer");
}

- (void)enableTestMode
{
  void *v3;
  id v4;

  if (-[WPDClient isTestModeClient](self, "isTestModeClient"))
  {
    -[WPDClient server](self, "server");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableTestMode");
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBCE88];
    -[WPDClient processName](self, "processName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", CFSTR("Illegal Operation"), CFSTR("Enabling test mode for process %@ is not supported"), v4);
  }

}

- (void)overrideScanTimeout:(double)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  double v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_654);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDClient clientTypeString](self, "clientTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = a3;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Overriding scan timeout to %f for %@", (uint8_t *)&v8, 0x16u);

  }
  -[WPDClient setScanTimeout:](self, "setScanTimeout:", a3);
}

- (void)overrideAdvTimeout:(double)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  double v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_655);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDClient clientTypeString](self, "clientTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = a3;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Overriding advertising timeout to %f for %@", (uint8_t *)&v8, 0x16u);

  }
  -[WPDClient setAdvTimeout:](self, "setAdvTimeout:", a3);
}

- (void)getPowerLogStats:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, id))a3;
  -[WPDClient server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getStatsDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v7);
}

- (void)disableScanning
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[WPDClient canDisableScans](self, "canDisableScans"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_658);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[WPDClient processName](self, "processName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v5;
      v12 = 1024;
      v13 = -[WPDClient processID](self, "processID");
      _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "Disabling all scanning called by process %{public}@ (%d)", buf, 0x12u);

    }
    -[WPDClient server](self, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableScanningForClient:", v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    -[WPDClient processName](self, "processName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", CFSTR("Illegal Operation"), CFSTR("Disabling scans for process %@ is not supported"), v9);

  }
}

- (void)dumpDaemonState
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_659);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "Manually triggered statedump", v5, 2u);
  }
  -[WPDClient server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dumpDaemonState");

}

- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSMutableSet *endpointsSet;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = a5;
    v6 = a4;
    endpointsSet = self->_endpointsSet;
    v9 = a3;
    -[NSMutableSet addObject:](endpointsSet, "addObject:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
    -[WPDClient clientUUID](self, "clientUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "registerEndpoint:requireAck:requireEncryption:forClient:", v9, v6, v5, v11);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_660);
    v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[WPDClient endpointsSet](self, "endpointsSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "registerEndpoint: %@", (uint8_t *)&v15, 0xCu);

    }
  }
}

- (void)unregisterEndpoint:(id)a3
{
  NSMutableSet *endpointsSet;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    endpointsSet = self->_endpointsSet;
    v5 = a3;
    -[NSMutableSet removeObject:](endpointsSet, "removeObject:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
    -[WPDClient clientUUID](self, "clientUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "unregisterEndpoint:forClient:", v5, v7);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_661);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[WPDClient endpointsSet](self, "endpointsSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "unregisterEndpoint: %@", (uint8_t *)&v11, 0xCu);

    }
  }
}

- (void)sendDatatoLePipe:(id)a3 forPeer:(id)a4
{
  WPDPipeManager **p_pipeManager;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;

  p_pipeManager = &self->_pipeManager;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pipeManager);
  -[WPDClient clientUUID](self, "clientUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendData:forPeer:forClient:", v8, v7, v9);

}

- (void)stopScans
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to stop scanning when process %d (client %@) is not registered with daemon - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)sendTestRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_663);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDClient sendTestRequest:].cold.3((uint64_t)v4, v5, self);
  if (-[WPDClient isTestModeClient](self, "isTestModeClient"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestRequestKeyID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "integerValue");
      if ((unint64_t)(v8 - 1) <= 7)
      {
        location = 0;
        objc_initWeak(&location, self);
        -[WPDClient serverQueue](self, "serverQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __29__WPDClient_sendTestRequest___block_invoke_664;
        block[3] = &unk_24D7C25B8;
        objc_copyWeak(&v14, &location);
        v13 = v4;
        dispatch_async(v9, block);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v8 = 0;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_665);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDClient sendTestRequest:].cold.1(v8, v11, self);
    goto LABEL_18;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_667);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDClient sendTestRequest:].cold.2(v10, self);
LABEL_19:

}

void __29__WPDClient_sendTestRequest___block_invoke_664(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isObjectDiscovery");
    v3 = v9;
    if (v4)
    {
      objc_msgSend(v9, "server");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "spObjectDiscoveryClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v9;
      if (v6)
      {
        objc_msgSend(v9, "server");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "spObjectDiscoveryClient");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sendTestRequest:", *(_QWORD *)(a1 + 32));

        v3 = v9;
      }
    }
  }

}

- (void)receivedTestResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_668);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDClient receivedTestResponse:].cold.1((uint64_t)v4, v5, self);
  -[WPDClient conn](self, "conn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receivedTestResponse:", v4);

}

- (void)_signpostBegin
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t wpDClientSignPostID;
  uint8_t v6[16];

  v3 = (id)WiProxLog;
  v4 = v3;
  wpDClientSignPostID = self->_wpDClientSignPostID;
  if (wpDClientSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_2175D1000, v4, OS_SIGNPOST_INTERVAL_BEGIN, wpDClientSignPostID, "receivedPayload", (const char *)&unk_217632882, v6, 2u);
  }

}

- (void)_signpostEnd
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t wpDClientSignPostID;
  uint8_t v6[16];

  v3 = (id)WiProxLog;
  v4 = v3;
  wpDClientSignPostID = self->_wpDClientSignPostID;
  if (wpDClientSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_2175D1000, v4, OS_SIGNPOST_INTERVAL_END, wpDClientSignPostID, "receivedPayload", (const char *)&unk_217632882, v6, 2u);
  }

}

- (WPDClientDelegate)delegate
{
  return (WPDClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setClientUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)clientTypeString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientTypeString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setIsTestModeClient:(BOOL)a3
{
  self->_isTestModeClient = a3;
}

- (BOOL)canDisableScans
{
  return self->_canDisableScans;
}

- (void)setCanDisableScans:(BOOL)a3
{
  self->_canDisableScans = a3;
}

- (NSMutableSet)endpointsSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpointsSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMessageQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (WPDaemonServer)server
{
  return (WPDaemonServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (NSString)machName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMachName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)portTickled
{
  return self->_portTickled;
}

- (void)setPortTickled:(BOOL)a3
{
  self->_portTickled = a3;
}

- (void)setHoldVouchers:(int64_t)a3
{
  self->_holdVouchers = a3;
}

- (void)setScanManager:(id)a3
{
  objc_storeWeak((id *)&self->_scanManager, a3);
}

- (WPDAdvertisingManager)advertisingManager
{
  return (WPDAdvertisingManager *)objc_loadWeakRetained((id *)&self->_advertisingManager);
}

- (void)setAdvertisingManager:(id)a3
{
  objc_storeWeak((id *)&self->_advertisingManager, a3);
}

- (WPDZoneManager)zoneManager
{
  return (WPDZoneManager *)objc_loadWeakRetained((id *)&self->_zoneManager);
}

- (void)setZoneManager:(id)a3
{
  objc_storeWeak((id *)&self->_zoneManager, a3);
}

- (WPDPipeManager)pipeManager
{
  return (WPDPipeManager *)objc_loadWeakRetained((id *)&self->_pipeManager);
}

- (void)setPipeManager:(id)a3
{
  objc_storeWeak((id *)&self->_pipeManager, a3);
}

- (WPDObjectDiscoveryManager)objectDiscoveryManager
{
  return (WPDObjectDiscoveryManager *)objc_loadWeakRetained((id *)&self->_objectDiscoveryManager);
}

- (void)setObjectDiscoveryManager:(id)a3
{
  objc_storeWeak((id *)&self->_objectDiscoveryManager, a3);
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (BOOL)entitledForZones
{
  return self->_entitledForZones;
}

- (void)setEntitledForZones:(BOOL)a3
{
  self->_entitledForZones = a3;
}

- (BOOL)entitledForObjectDiscovery
{
  return self->_entitledForObjectDiscovery;
}

- (void)setEntitledForObjectDiscovery:(BOOL)a3
{
  self->_entitledForObjectDiscovery = a3;
}

- (BOOL)entitledForRanging
{
  return self->_entitledForRanging;
}

- (void)setEntitledForRanging:(BOOL)a3
{
  self->_entitledForRanging = a3;
}

- (BOOL)pendingSent
{
  return self->_pendingSent;
}

- (void)setPendingSent:(BOOL)a3
{
  self->_pendingSent = a3;
}

- (NSMutableDictionary)advertTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAdvertTimers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableDictionary)advertTimerState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAdvertTimerState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void)setScanTimers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableDictionary)connectionTimer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setConnectionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (BOOL)scanDenylisted
{
  return self->_scanDenylisted;
}

- (void)setScanDenylisted:(BOOL)a3
{
  self->_scanDenylisted = a3;
}

- (void)setScansOff:(BOOL)a3
{
  self->_scansOff = a3;
}

- (double)scanTimeout
{
  return self->_scanTimeout;
}

- (void)setScanTimeout:(double)a3
{
  self->_scanTimeout = a3;
}

- (double)advTimeout
{
  return self->_advTimeout;
}

- (void)setAdvTimeout:(double)a3
{
  self->_advTimeout = a3;
}

- (NSMutableSet)lePipePeersSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLePipePeersSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)isObjectDiscovery
{
  return self->_isObjectDiscovery;
}

- (void)setIsObjectDiscovery:(BOOL)a3
{
  self->_isObjectDiscovery = a3;
}

- (BOOL)supportsObjectDiscovery
{
  return self->_supportsObjectDiscovery;
}

- (BOOL)supportsRanging
{
  return self->_supportsRanging;
}

- (OS_voucher)scanVoucher
{
  return self->_scanVoucher;
}

- (void)setScanVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_scanVoucher, a3);
}

- (OS_voucher)advertVoucher
{
  return self->_advertVoucher;
}

- (void)setAdvertVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_advertVoucher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertVoucher, 0);
  objc_storeStrong((id *)&self->_scanVoucher, 0);
  objc_storeStrong((id *)&self->_lePipePeersSet, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_scanTimers, 0);
  objc_storeStrong((id *)&self->_advertTimerState, 0);
  objc_storeStrong((id *)&self->_advertTimers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_destroyWeak((id *)&self->_objectDiscoveryManager);
  objc_destroyWeak((id *)&self->_pipeManager);
  objc_destroyWeak((id *)&self->_zoneManager);
  objc_destroyWeak((id *)&self->_advertisingManager);
  objc_destroyWeak((id *)&self->_scanManager);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_destroyWeak((id *)&self->_serverQueue);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_endpointsSet, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_clientTypeString, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithXPCConnection:server:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v0, (uint64_t)v0, "PID %d bundleID %@ from local process", v1);
  OUTLINED_FUNCTION_0();
}

- (void)initWithXPCConnection:server:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v0, (uint64_t)v0, "PID %d bundleID %@", v1);
  OUTLINED_FUNCTION_0();
}

void __42__WPDClient_initWithXPCConnection_server___block_invoke_325_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = AllZeroUUID;
  OUTLINED_FUNCTION_2(&dword_2175D1000, a1, a3, "Initialised AllZeroUUID to %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)registerWithDaemon:(void *)a1 forProcess:(void *)a2 machName:holdVouchers:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v3, v5, "WPDClient subclass instance created %@", v6);

  OUTLINED_FUNCTION_8();
}

- (void)startAdvertising:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "processName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  v6 = 138543618;
  v7 = v2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v4, v5, "Advert voucher copy for process %{public}@ (%d)", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)startAdvertising_async:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_15();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v3, v5, "Trying to start advertising ObjectDiscovery for process %d (client %@) when not supported - ignoring", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)startAdvertising_async:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_26(&dword_2175D1000, a2, a3, "Canceled previous advert timer for client %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)startAdvertising_async:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_15();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v3, v5, "Trying to start advertising when process %d (client %@) is not registered with daemon - ignoring", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopAdvertising:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "processName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  v6 = 138543618;
  v7 = v2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v4, v5, "Advert voucher release for process %{public}@ (%d)", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopAdvertising_async:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "%@", v4);

  OUTLINED_FUNCTION_8();
}

- (void)stopAdvertising_async:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to stop advertising ObjectDiscovery for process %d (client %@) when not supported - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopAdvertising_async:(void *)a1 .cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to stop advertising when process %d (client %@) is not registered with daemon - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)notifyClientStateChange:(uint64_t)a3 Restricted:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  v8 = 138412802;
  v9 = v6;
  OUTLINED_FUNCTION_13();
  v10 = 2048;
  v11 = a3;
  OUTLINED_FUNCTION_31(&dword_2175D1000, v5, v7, "Notifying client %@ (%d) about state change %ld", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11_0();
}

- (void)notifyClientStateChange:(void *)a1 Restricted:.cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109890;
  v4[1] = 3;
  v5 = 1024;
  v6 = 2;
  v7 = 2112;
  v8 = v3;
  v9 = 1024;
  v10 = OUTLINED_FUNCTION_12();
  _os_log_debug_impl(&dword_2175D1000, v1, OS_LOG_TYPE_DEBUG, "Modified state %d -> %d for client %@ (%d) per <rdar://problem/33456853>", (uint8_t *)v4, 0x1Eu);

  OUTLINED_FUNCTION_11_0();
}

- (void)startScanning:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "processName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  v6 = 138543618;
  v7 = v2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v4, v5, "Scan voucher copy for process %{public}@ (%d)", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)startScanning_async:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_15();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v3, v5, "Trying to start scanning for denylisted process %d (client %@) while in restricted state - ignoring", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)startScanning_async:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPDScanManager is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startScanning_async:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v3, v5, "Failed to enable ADV Buffer with error %@", v6);

  OUTLINED_FUNCTION_8();
}

- (void)startScanning_async:(void *)a1 .cold.4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_15();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v3, v5, "Trying to start scanning ObjectDiscovery (18) for process %d (client %@) when not supported - ignoring", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)startScanning_async:(void *)a1 .cold.5(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_15();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v3, v5, "Trying to start scanning ObjectDiscovery (18) for process %d (client %@) when not entitled - ignoring", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)startScanning_async:(void *)a1 .cold.6(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_15();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v3, v5, "Trying to start scanning when process %d (client %@) is not registered with daemon - ignoring", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopScanning:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "processName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  v6 = 138543618;
  v7 = v2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_1(&dword_2175D1000, v4, v5, "Scan voucher release for process %{public}@ (%d)", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopScanning_async:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to stop scanning ObjectDiscovery (18) for process %d (client %@) when not supported - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopScanning_async:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to stop scanning ObjectDiscovery (18) for process %d (client %@) when not entitled - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopScanning_async:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_29(a1, a2);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_24(&dword_2175D1000, v4, v5, "Trying to stop scanning for type %d when process %d (client %@) is not registered with daemon - ignoring", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)clearDuplicateFilterCache_async:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to clear dup filter cache ObjectDiscovery (18) for process %d (client %@) when not supported - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)clearDuplicateFilterCache_async:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to clear dup filter cache ObjectDiscovery (18) for process %d (client %@) when not entitled - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)clearDuplicateFilterCache_async:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_29(a1, a2);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_24(&dword_2175D1000, v4, v5, "Trying to clear dup filter cache for type %d when process %d (client %@) is not registered with daemon - ignoring", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)startTrackingZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Client %@ is not entitled to track zones, invalidating connection", v2);
  OUTLINED_FUNCTION_0();
}

- (void)stopTrackingZones:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Client %@ is not entitled to stop tracking zones, invalidating connection", v2);
  OUTLINED_FUNCTION_0();
}

- (void)enteredZone:manufacturerData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Client %@ is not entitled to receive entered zone event, invalidating connection", v2);
  OUTLINED_FUNCTION_0();
}

- (void)connectToPeer:withOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Trying to connect to peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectToPeer:(void *)a1 withOptions:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v3, v5, "Trying to connect to peripheral %@ while device isn't registered with daemon - ignoring", v6);

  OUTLINED_FUNCTION_8();
}

- (void)connectedDevice:(void *)a1 withError:shouldDiscover:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "Sending connected device with error %{public}@", v4);

  OUTLINED_FUNCTION_8();
}

- (void)disconnectFromPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Trying to disconnect from peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)disconnectFromPeer:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "Trying to disconnect to peripheral %@ while device isn't registered with daemon - ignoring", v4);

  OUTLINED_FUNCTION_8();
}

- (void)disconnectedPeer:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)shouldSubscribe:toPeer:withCharacteristic:inService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Trying to subscribe to characteristic on peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)shouldSubscribe:toPeer:withCharacteristic:inService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Trying to subscribe while device isn't registered with daemon or there's no connection %@ - ignoring", v2);
  OUTLINED_FUNCTION_0();
}

- (void)updatedNotificationState:forCharacteristic:inService:withPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "subscription shouldn't happened over LE pipe - peripheral %@ LE pipe failed!! go back to GATT :((", v2);
  OUTLINED_FUNCTION_0();
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "A connection didn't exist...sending didConnect with error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)central:subscribed:toCharacteristic:inService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "subscribed shouldn't be received over LE pipe - Central %@ LE pipe failed!! go back to GATT :((", v2);
  OUTLINED_FUNCTION_0();
}

- (void)discoverCharacteristicsAndServices:forPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Trying to discover characteristics while device isn't registered with daemon - ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendDataToCharacteristic:inService:forPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Trying to send data to service on peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendDataToCharacteristic:(void *)a1 inService:(void *)a2 forPeer:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  v7[0] = 67109378;
  v7[1] = objc_msgSend(a2, "registered");
  v8 = 2112;
  v9 = a3;
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v5, v6, "Trying to send data while device isn't registered %d with daemon OR connection %@ is not valid - ignoring", (uint8_t *)v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivedData:(uint64_t)a1 fromEndpoint:(void *)a2 forPeripheral:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_30(a1, a2);
  objc_msgSend(a3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_23(&dword_2175D1000, v6, v7, "Client received data from endpoint %@ for peripheral %@. Notifying client implementation.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

void __33__WPDClient_enableRanging_reply___block_invoke_cold_1(uint64_t a1, id *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_25(a1, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_15();
  objc_msgSend(*a2, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_22(&dword_2175D1000, v6, v7, "Trying to %s ranging for process %d (client %@) when not entitled - ignoring", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_11_0();
}

void __33__WPDClient_enableRanging_reply___block_invoke_cold_2(uint64_t a1, id *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_25(a1, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_15();
  objc_msgSend(*a2, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_22(&dword_2175D1000, v6, v7, "Trying to %s ranging for process %d (client %@) when ranging is not supported - ignoring", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_11_0();
}

void __35__WPDClient_isRangingEnabledReply___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v1, v3, "Trying to read ranging state for process %d (client %@) when not entitled - ignoring", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)checkAllowDuplicates:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Being asked to check for duplicates when client isn't registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendTestRequest:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;

  v4 = a1;
  v5 = OUTLINED_FUNCTION_30(a1, a2);
  objc_msgSend(a3, "clientUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109378;
  v8[1] = v4;
  v9 = 2112;
  v10 = v6;
  OUTLINED_FUNCTION_3_1(&dword_2175D1000, v5, v7, "NOOP send test request %u for client %@, dropping on the floor", (uint8_t *)v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)sendTestRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v3, v5, "Send test request for non-test client %@, dropping on the floor", v6);

  OUTLINED_FUNCTION_8();
}

- (void)sendTestRequest:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "clientUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 1024;
  v13 = objc_msgSend(a3, "isTestModeClient");
  OUTLINED_FUNCTION_31(&dword_2175D1000, v5, v7, "Send test request %@ for client %@ (test: %d)", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11_0();
}

- (void)receivedTestResponse:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_30(a1, a2);
  objc_msgSend(a3, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_23(&dword_2175D1000, v6, v7, "Received test response %@ for client %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

@end
