@implementation TVLNetworkMonitor

- (TVLNetworkMonitor)init
{
  TVLNetworkMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *monitorQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVLNetworkMonitor;
  v2 = -[TVLNetworkMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create((const char *)TVLNetworkMonitorQueueLabel, MEMORY[0x24BDAC9C0]);
    monitorQueue = v2->_monitorQueue;
    v2->_monitorQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TVLNetworkMonitor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)TVLNetworkMonitor;
  -[TVLNetworkMonitor dealloc](&v3, sel_dealloc);
}

- (void)startMonitoringForInterfaceTypes:(unint64_t)a3 updateHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id updateHandler;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  OS_nw_path_monitor *v13;
  OS_nw_path_monitor *wifi_monitor;
  NSObject *v15;
  NSNetServiceBrowser *v16;
  NSNetServiceBrowser *awdlServiceBrowser;
  NSObject *v18;
  OS_nw_path_monitor *evaluator_for_endpoint;
  OS_nw_path_monitor *awdl_monitor;
  NSObject *v21;
  NSObject *v22;
  OS_nw_path_monitor *v23;
  OS_nw_path_monitor *ethernet_monitor;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD update_handler[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  id buf[2];

  v6 = a4;
  if (_TVLLogDefault_onceToken_5 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
  v7 = _TVLLogDefault_log_5;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21F2AB000, v7, OS_LOG_TYPE_DEFAULT, "TVLNetworkMonitor:startMonitoringForInterfaceTypes", (uint8_t *)buf, 2u);
  }
  if (!-[TVLNetworkMonitor isMonitoring](self, "isMonitoring"))
  {
    self->_monitoringOptions = a3;
    v8 = (void *)MEMORY[0x2207C5BC0](v6);
    updateHandler = self->_updateHandler;
    self->_updateHandler = v8;

    objc_initWeak(buf, self);
    v10 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke;
    v36[3] = &unk_24E3E9C90;
    objc_copyWeak(&v37, buf);
    v11 = (void *)MEMORY[0x2207C5BC0](v36);
    if ((a3 & 4) != 0 && !self->_awdl_monitor)
    {
      v16 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x24BDD16C0]);
      awdlServiceBrowser = self->_awdlServiceBrowser;
      self->_awdlServiceBrowser = v16;

      -[NSNetServiceBrowser setIncludesPeerToPeer:](self->_awdlServiceBrowser, "setIncludesPeerToPeer:", 1);
      -[NSNetServiceBrowser setDelegate:](self->_awdlServiceBrowser, "setDelegate:", self);
      -[NSNetServiceBrowser searchForServicesOfType:inDomain:](self->_awdlServiceBrowser, "searchForServicesOfType:inDomain:", CFSTR("_tvlatency._udp"), CFSTR("local."));
      v18 = nw_parameters_create();
      nw_parameters_set_required_interface_subtype();
      nw_parameters_set_include_peer_to_peer(v18, 1);
      evaluator_for_endpoint = (OS_nw_path_monitor *)nw_path_create_evaluator_for_endpoint();
      awdl_monitor = self->_awdl_monitor;
      self->_awdl_monitor = evaluator_for_endpoint;

      nw_path_monitor_set_queue((nw_path_monitor_t)self->_awdl_monitor, (dispatch_queue_t)self->_monitorQueue);
      nw_path_monitor_set_update_handler((nw_path_monitor_t)self->_awdl_monitor, v11);
      objc_initWeak(&location, self);
      v21 = self->_awdl_monitor;
      v32[0] = v10;
      v32[1] = 3221225472;
      v32[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2_13;
      v32[3] = &unk_24E3E9CB8;
      objc_copyWeak(&v34, &location);
      v33 = v11;
      nw_path_monitor_set_update_handler(v21, v32);
      nw_path_monitor_start((nw_path_monitor_t)self->_awdl_monitor);
      self->_monitoring = 1;

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);

      if ((a3 & 2) != 0)
      {
LABEL_9:
        if (!self->_wifi_monitor)
        {
          v12 = nw_parameters_create();
          nw_parameters_set_required_interface_type(v12, nw_interface_type_wifi);
          nw_parameters_set_required_interface_subtype();
          v13 = (OS_nw_path_monitor *)nw_path_create_evaluator_for_endpoint();
          wifi_monitor = self->_wifi_monitor;
          self->_wifi_monitor = v13;

          nw_path_monitor_set_queue((nw_path_monitor_t)self->_wifi_monitor, (dispatch_queue_t)self->_monitorQueue);
          objc_initWeak(&location, self);
          v15 = self->_wifi_monitor;
          update_handler[0] = v10;
          update_handler[1] = 3221225472;
          update_handler[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_3;
          update_handler[3] = &unk_24E3E9CB8;
          objc_copyWeak(&v31, &location);
          v30 = v11;
          nw_path_monitor_set_update_handler(v15, update_handler);
          nw_path_monitor_start((nw_path_monitor_t)self->_wifi_monitor);
          self->_monitoring = 1;

          objc_destroyWeak(&v31);
          objc_destroyWeak(&location);

        }
      }
    }
    else if ((a3 & 2) != 0)
    {
      goto LABEL_9;
    }
    if ((a3 & 1) != 0 && !self->_ethernet_monitor)
    {
      v22 = nw_parameters_create();
      nw_parameters_set_required_interface_type(v22, nw_interface_type_wired);
      v23 = (OS_nw_path_monitor *)nw_path_create_evaluator_for_endpoint();
      ethernet_monitor = self->_ethernet_monitor;
      self->_ethernet_monitor = v23;

      nw_path_monitor_set_queue((nw_path_monitor_t)self->_ethernet_monitor, (dispatch_queue_t)self->_monitorQueue);
      objc_initWeak(&location, self);
      v25 = self->_ethernet_monitor;
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_4;
      v26[3] = &unk_24E3E9CB8;
      objc_copyWeak(&v28, &location);
      v27 = v11;
      nw_path_monitor_set_update_handler(v25, v26);
      nw_path_monitor_start((nw_path_monitor_t)self->_ethernet_monitor);
      self->_monitoring = 1;

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

    }
    objc_destroyWeak(&v37);
    objc_destroyWeak(buf);
  }

}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD enumerate_block[4];
  NSObject *v21;
  id v22;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = MEMORY[0x24BDAC760];
    enumerate_block[0] = MEMORY[0x24BDAC760];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2;
    enumerate_block[3] = &unk_24E3E9C68;
    objc_copyWeak(&v22, v4);
    v21 = v3;
    nw_path_enumerate_interfaces(v21, enumerate_block);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(WeakRetained, "awdl_monitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(WeakRetained, "awdl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(WeakRetained, "awdl");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

      }
    }
    objc_msgSend(WeakRetained, "wifi_monitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(WeakRetained, "wifi");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(WeakRetained, "wifi");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
    }
    objc_msgSend(WeakRetained, "ethernet_monitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(WeakRetained, "ethernet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(WeakRetained, "ethernet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

      }
    }
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_9;
    v18[3] = &unk_24E3E9B90;
    v18[4] = WeakRetained;
    v19 = v7;
    v17 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

    objc_destroyWeak(&v22);
  }

}

BOOL __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  TVLNetworkInterface *v7;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_interface_get_name(v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (nw_interface_get_subtype() == 1002)
      {
        if (_TVLLogDefault_onceToken_5 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
        v6 = _TVLLogDefault_log_5;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_INFO))
        {
          v11 = 138543362;
          v12 = v5;
          _os_log_impl(&dword_21F2AB000, v6, OS_LOG_TYPE_INFO, "TVLNetworkMonitor found AWDL %{public}@", (uint8_t *)&v11, 0xCu);
        }
        v7 = -[TVLNetworkInterface initWithInterfaceType:interfaceName:]([TVLNetworkInterface alloc], "initWithInterfaceType:interfaceName:", 3, v5);
        objc_msgSend(WeakRetained, "setAwdl:", v7);
      }
      else if (nw_interface_get_type(v3) == nw_interface_type_wifi)
      {
        if (nw_path_get_status(*(nw_path_t *)(a1 + 32)) != nw_path_status_satisfied)
          goto LABEL_10;
        if (_TVLLogDefault_onceToken_5 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
        v9 = _TVLLogDefault_log_5;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_INFO))
        {
          v11 = 138543362;
          v12 = v5;
          _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_INFO, "TVLNetworkMonitor found WIFI %{public}@", (uint8_t *)&v11, 0xCu);
        }
        v7 = -[TVLNetworkInterface initWithInterfaceType:interfaceName:]([TVLNetworkInterface alloc], "initWithInterfaceType:interfaceName:", 2, v5);
        objc_msgSend(WeakRetained, "setWifi:", v7);
      }
      else
      {
        if (nw_interface_get_type(v3) != nw_interface_type_wired
          || nw_path_get_status(*(nw_path_t *)(a1 + 32)) != nw_path_status_satisfied)
        {
          goto LABEL_10;
        }
        if (_TVLLogDefault_onceToken_5 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
        v10 = _TVLLogDefault_log_5;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_INFO))
        {
          v11 = 138543362;
          v12 = v5;
          _os_log_impl(&dword_21F2AB000, v10, OS_LOG_TYPE_INFO, "TVLNetworkMonitor found ETHERNET %{public}@", (uint8_t *)&v11, 0xCu);
        }
        v7 = -[TVLNetworkInterface initWithInterfaceType:interfaceName:]([TVLNetworkInterface alloc], "initWithInterfaceType:interfaceName:", 1, v5);
        objc_msgSend(WeakRetained, "setEthernet:", v7);
      }

    }
LABEL_10:

  }
  return WeakRetained != 0;
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_9(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v3[2](v3, v2);

}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2_13(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setAwdl:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setWifi:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setEthernet:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopMonitoring
{
  NSObject *v3;
  NSObject *awdl_monitor;
  OS_nw_path_monitor *v5;
  NSNetServiceBrowser *awdlServiceBrowser;
  TVLNetworkInterface *awdl;
  NSObject *wifi_monitor;
  OS_nw_path_monitor *v9;
  TVLNetworkInterface *wifi;
  NSObject *ethernet_monitor;
  OS_nw_path_monitor *v12;
  TVLNetworkInterface *ethernet;
  uint8_t v14[16];

  if (_TVLLogDefault_onceToken_5 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
  v3 = _TVLLogDefault_log_5;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21F2AB000, v3, OS_LOG_TYPE_DEFAULT, "TVLNetworkMonitor:stopMonitoring", v14, 2u);
  }
  awdl_monitor = self->_awdl_monitor;
  if (awdl_monitor)
  {
    nw_path_monitor_cancel(awdl_monitor);
    v5 = self->_awdl_monitor;
    self->_awdl_monitor = 0;

    -[NSNetServiceBrowser stop](self->_awdlServiceBrowser, "stop");
    awdlServiceBrowser = self->_awdlServiceBrowser;
    self->_awdlServiceBrowser = 0;

    awdl = self->_awdl;
    self->_awdl = 0;

  }
  wifi_monitor = self->_wifi_monitor;
  if (wifi_monitor)
  {
    nw_path_monitor_cancel(wifi_monitor);
    v9 = self->_wifi_monitor;
    self->_wifi_monitor = 0;

    wifi = self->_wifi;
    self->_wifi = 0;

  }
  ethernet_monitor = self->_ethernet_monitor;
  if (ethernet_monitor)
  {
    nw_path_monitor_cancel(ethernet_monitor);
    v12 = self->_ethernet_monitor;
    self->_ethernet_monitor = 0;

    ethernet = self->_ethernet;
    self->_ethernet = 0;

  }
  self->_monitoringOptions = 0;
  self->_monitoring = 0;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  objc_msgSend(a4, "resolveWithTimeout:", a3, 10.0);
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (unint64_t)monitoringOptions
{
  return self->_monitoringOptions;
}

- (void)setMonitoringOptions:(unint64_t)a3
{
  self->_monitoringOptions = a3;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_monitorQueue, a3);
}

- (NSNetServiceBrowser)awdlServiceBrowser
{
  return self->_awdlServiceBrowser;
}

- (void)setAwdlServiceBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_awdlServiceBrowser, a3);
}

- (OS_nw_path_monitor)awdl_monitor
{
  return self->_awdl_monitor;
}

- (void)setAwdl_monitor:(id)a3
{
  objc_storeStrong((id *)&self->_awdl_monitor, a3);
}

- (OS_nw_path_monitor)wifi_monitor
{
  return self->_wifi_monitor;
}

- (void)setWifi_monitor:(id)a3
{
  objc_storeStrong((id *)&self->_wifi_monitor, a3);
}

- (OS_nw_path_monitor)ethernet_monitor
{
  return self->_ethernet_monitor;
}

- (void)setEthernet_monitor:(id)a3
{
  objc_storeStrong((id *)&self->_ethernet_monitor, a3);
}

- (TVLNetworkInterface)awdl
{
  return self->_awdl;
}

- (void)setAwdl:(id)a3
{
  objc_storeStrong((id *)&self->_awdl, a3);
}

- (TVLNetworkInterface)wifi
{
  return self->_wifi;
}

- (void)setWifi:(id)a3
{
  objc_storeStrong((id *)&self->_wifi, a3);
}

- (TVLNetworkInterface)ethernet
{
  return self->_ethernet;
}

- (void)setEthernet:(id)a3
{
  objc_storeStrong((id *)&self->_ethernet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ethernet, 0);
  objc_storeStrong((id *)&self->_wifi, 0);
  objc_storeStrong((id *)&self->_awdl, 0);
  objc_storeStrong((id *)&self->_ethernet_monitor, 0);
  objc_storeStrong((id *)&self->_wifi_monitor, 0);
  objc_storeStrong((id *)&self->_awdl_monitor, 0);
  objc_storeStrong((id *)&self->_awdlServiceBrowser, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
