@implementation WFTrafficEngManager

- (WFTrafficEngManager)initWithTrafficEngDelegate:(id)a3
{
  id v4;
  WFTrafficEngManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *traffic_engr_queue;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFTrafficEngManager;
  v5 = -[WFTrafficEngManager init](&v19, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v21 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s self alloc failed"), "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = dispatch_queue_create("com.apple.wifi.trafficEngineering", 0);
  traffic_engr_queue = v5->_traffic_engr_queue;
  v5->_traffic_engr_queue = (OS_dispatch_queue *)v9;

  if (!v5->_traffic_engr_queue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dispatch Queue Creation Failed"), "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFTrafficEngManager setTrafficEngDelegate:](v5, "setTrafficEngDelegate:", v4);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Invalid trafficEngDelegate"), "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
LABEL_11:
    v12 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v11, "UTF8String"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v21 = v14;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
LABEL_12:

  v5 = 0;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v21 = v17;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  id v4;
  OS_dispatch_queue *traffic_engr_queue;
  void *v6;
  id v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager dealloc]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  traffic_engr_queue = self->_traffic_engr_queue;
  if (traffic_engr_queue)
  {
    self->_traffic_engr_queue = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager dealloc]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v11 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  v9.receiver = self;
  v9.super_class = (Class)WFTrafficEngManager;
  -[WFTrafficEngManager dealloc](&v9, sel_dealloc);
}

- (BOOL)__configureRapportDiscoveryClient
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  RPCompanionLinkClient *v13;
  RPCompanionLinkClient *discoveryClient;
  RPCompanionLinkClient *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  BOOL configured;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  self->_configured = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C81028];
  v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v37 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Rapport discovery session Started"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C81028];
  v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v37 = v12;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  if (objc_opt_class())
  {
    v13 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x1E0D838F8]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v13;

  }
  v15 = self->_discoveryClient;
  if (v15)
  {
    -[RPCompanionLinkClient setDispatchQueue:](v15, "setDispatchQueue:", self->_traffic_engr_queue);
    v16 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke;
    v33[3] = &unk_1E881CBD0;
    objc_copyWeak(&v34, &location);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_discoveryClient, "setInvalidationHandler:", v33);
    -[RPCompanionLinkClient setControlFlags:](self->_discoveryClient, "setControlFlags:", -[RPCompanionLinkClient controlFlags](self->_discoveryClient, "controlFlags") | 0x801006);
    -[RPCompanionLinkClient setTargetUserSession:](self->_discoveryClient, "setTargetUserSession:", 1);
    v31[0] = v16;
    v31[1] = 3221225472;
    v31[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_32;
    v31[3] = &unk_1E881DB80;
    objc_copyWeak(&v32, &location);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", v31);
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_36;
    v29[3] = &unk_1E881DB80;
    objc_copyWeak(&v30, &location);
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", v29);
    -[WFTrafficEngManager __activateDiscovery](self, "__activateDiscovery");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Rapport discovery session Ended"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v20, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v37 = v21;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    self->_configured = 1;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C81028];
  v24 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v37 = v26;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  configured = self->_configured;
  objc_destroyWeak(&location);
  return configured;
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Rapport discovery session invalidated"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v6 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__invalidateDiscovery");

}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s Rapport discovery session found device:%@"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__configureRapportSessionClient:", v4);

}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_36(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Rapport discovery session lost device:%@"), "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v7 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__tearDownRapportDataSession");

}

- (void)__activateDiscovery
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __activateDiscovery]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  -[WFTrafficEngManager __registerCallbacksAndActivate](self, "__registerCallbacksAndActivate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __activateDiscovery]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v9 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

- (void)__registerCallbacksAndActivate
{
  void *v3;
  id v4;
  NSObject *traffic_engr_queue;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __registerCallbacksAndActivate]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  traffic_engr_queue = self->_traffic_engr_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(traffic_engr_queue, block);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __registerCallbacksAndActivate]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v11 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

uint64_t __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "__registerRequestHandler");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_2;
  v5[3] = &unk_1E881D728;
  v5[4] = v2;
  return objc_msgSend(v3, "activateWithCompletion:", v5);
}

void __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Activation of rapport disovery client failed, error: %@"), "-[WFTrafficEngManager __registerCallbacksAndActivate]_block_invoke_2", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v8 = objc_msgSend(v3, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_43;
    v6[3] = &unk_1E881DBA8;
    v6[4] = v4;
    objc_msgSend(v5, "registerEventID:options:handler:", CFSTR("com.apple.wifi.trafficeng.event"), 0, v6);
  }
}

void __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "trafficEngDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "trafficEngDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleCriticalAppEvent:", v6);

  }
}

- (void)__registerRequestHandler
{
  void *v3;
  id v4;
  RPCompanionLinkClient *discoveryClient;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __registerRequestHandler]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  discoveryClient = self->_discoveryClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__WFTrafficEngManager___registerRequestHandler__block_invoke;
  v9[3] = &unk_1E881DBD0;
  v9[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](discoveryClient, "registerRequestID:options:handler:", CFSTR("com.apple.wifi.trafficEngineering"), 0, v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __registerRequestHandler]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v11 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

void __47__WFTrafficEngManager___registerRequestHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "trafficEngDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "trafficEngDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "retrieveCurrentLinkHealth");

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, v8, 0, 0);
  }

}

- (void)__invalidateDiscovery
{
  void *v3;
  id v4;
  RPCompanionLinkClient *discoveryClient;
  void *v6;
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __invalidateDiscovery]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  -[WFTrafficEngManager __tearDownRapportDataSession](self, "__tearDownRapportDataSession");
  -[RPCompanionLinkClient invalidate](self->_discoveryClient, "invalidate");
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0;

  self->_configured = 0;
  -[WFTrafficEngManager cleanup](self, "cleanup");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __invalidateDiscovery]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v10 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

- (void)cleanup
{
  void *v3;
  id v4;
  RPCompanionLinkClient *discoveryClient;
  void *v6;
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager cleanup]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager cleanup]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v10 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

- (void)__configureRapportSessionClient:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __configureRapportSessionClient:]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __configureRapportSessionClient:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v9 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

- (void)__invalidateSession
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __invalidateSession]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v8 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __invalidateSession]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v8 = v6;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

- (void)__sendEventToPeers
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFTrafficEngManager trafficEngDelegate](self, "trafficEngDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFTrafficEngManager trafficEngDelegate](self, "trafficEngDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "retrieveEventDetails");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("[TrafficEngineering]: EventData %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136446210;
        v12 = objc_msgSend(v10, "UTF8String");
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

      }
      -[WFTrafficEngManager __sendPeriodicEvent:](self, "__sendPeriodicEvent:", v8);

    }
  }
}

- (void)__sendPeriodicEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *traffic_engr_queue;
  void *v15;
  id v16;
  _QWORD block[6];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          traffic_engr_queue = self->_traffic_engr_queue;
          block[0] = v11;
          block[1] = 3221225472;
          block[2] = __43__WFTrafficEngManager___sendPeriodicEvent___block_invoke;
          block[3] = &unk_1E881CF98;
          block[4] = self;
          block[5] = v13;
          v18 = v4;
          dispatch_async(traffic_engr_queue, block);

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No active clients, Returning"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v7 = objc_retainAutorelease(v7);
      objc_msgSend(v15, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v7, "UTF8String"));
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v25 = objc_msgSend(v16, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

}

uint64_t __43__WFTrafficEngManager___sendPeriodicEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__sendKeepAliveEvent:dictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)__sendKeepAliveEvent:(id)a3 dictionary:(id)a4
{
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](self->_discoveryClient, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.wifi.trafficeng.event"), a4, *MEMORY[0x1E0D83980], 0, &__block_literal_global_4);
}

void __55__WFTrafficEngManager___sendKeepAliveEvent_dictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[TrafficEngineering]: Failed to send event %@"), a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v5 = objc_msgSend(v3, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }
}

- (void)__requestCriticalAppInfo:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v24 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  if (objc_opt_class())
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D838F8]);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setControlFlags:", objc_msgSend(v9, "controlFlags") | 0x1004);
      objc_msgSend(v10, "setDestinationDevice:", v5);
      v11 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke;
      v21[3] = &unk_1E881C8E8;
      v22 = v5;
      objc_msgSend(v10, "setInvalidationHandler:", v21);
      v15 = v11;
      v16 = 3221225472;
      v17 = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_55;
      v18 = &unk_1E881DC40;
      v20 = v6;
      v10 = v10;
      v19 = v10;
      objc_msgSend(v10, "activateWithCompletion:", &v15);

    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v24 = v14;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
}

void __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint8_t buf[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Session client with device %@ invalidated"), "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]_block_invoke", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v4 = objc_msgSend(v2, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
}

void __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_55(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Session client falied to activate, error: %@"), "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]_block_invoke", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v12 = objc_msgSend(v4, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = *MEMORY[0x1E0D83998];
    v10 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_59;
    v7[3] = &unk_1E881DC18;
    v6 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.wifi.trafficEngineering"), MEMORY[0x1E0C9AA70], v5, v7);

  }
}

uint64_t __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)__collectCriticalAppInfo
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *traffic_engr_queue;
  dispatch_time_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  WFTrafficEngManager *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *group;
  id v47;
  _QWORD block[6];
  id v50;
  NSObject *v51;
  uint64_t *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enter %s"), "-[WFTrafficEngManager __collectCriticalAppInfo]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v62 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  group = dispatch_group_create();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Number of Peers %lu"), objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C81028];
  v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v62 = v10;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No active clients, Returning"));
    v25 = objc_claimAutoreleasedReturnValue();
    v41 = MEMORY[0x1E0C81028];
    v42 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), -[NSObject UTF8String](objc_retainAutorelease(v25), "UTF8String"));
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v62 = v44;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
    if (v14)
    {
      v45 = 0;
      v15 = *(_QWORD *)v54;
      do
      {
        v16 = 0;
        v45 += v14;
        do
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v16);
          dispatch_group_enter(group);
          traffic_engr_queue = self->_traffic_engr_queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke;
          block[3] = &unk_1E881DC90;
          block[4] = self;
          block[5] = v17;
          v52 = &v57;
          v50 = v47;
          v51 = group;
          dispatch_async(traffic_engr_queue, block);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
      }
      while (v14);
    }
    else
    {
      v45 = 0;
    }

    v19 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(group, v19))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d Sec timeout waiting for Critical App Info from peers"), 60);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = objc_msgSend(v23, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v62 = v24;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

      }
    }
    v25 = MEMORY[0x1E0C81028];
    v26 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/TrafficEngineering/WFTrafficEngManager.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "UTF8String");
      -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      v32 = v58[3];
      *(_DWORD *)buf = 141559810;
      v62 = 1752392040;
      v63 = 2080;
      v64 = v29;
      v65 = 2160;
      v66 = 1752392040;
      v67 = 1024;
      v68 = 384;
      v69 = 2048;
      v70 = v31;
      v71 = 2048;
      v72 = v45;
      v73 = 2048;
      v74 = v32;
      v75 = 2112;
      v76 = v47;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[TrafficEngineering] (%{mask.hash}s:%{mask.hash}d) active peers %lu, requested peers %lu,  responses %lu, diagnostics log %@", buf, 0x4Eu);

      v25 = MEMORY[0x1E0C81028];
    }
  }

  v33 = self;
  objc_sync_enter(v33);
  v34 = (void *)objc_msgSend(v47, "copy");
  objc_sync_exit(v33);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leave %s"), "-[WFTrafficEngManager __collectCriticalAppInfo]");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x1E0C81028];
  v37 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v35), "UTF8String"));
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v39 = objc_msgSend(v38, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v62 = v39;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

  }
  _Block_object_dispose(&v57, 8);

  return v34;
}

void __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke_2;
  v7[3] = &unk_1E881DC68;
  v4 = *(_QWORD *)(a1 + 64);
  v7[4] = v2;
  v11 = v4;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "__requestCriticalAppInfo:completionBlock:", v3, v7);

}

void __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_sync_exit(v4);

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 48), "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%s Response from peer %@: %@, total responses %lu"), "-[WFTrafficEngManager __collectCriticalAppInfo]_block_invoke_2", v7, v3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v11 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

- (WFTrafficEngDelegate)trafficEngDelegate
{
  return self->_trafficEngDelegate;
}

- (void)setTrafficEngDelegate:(id)a3
{
  self->_trafficEngDelegate = (WFTrafficEngDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_traffic_engr_queue, 0);
}

@end
