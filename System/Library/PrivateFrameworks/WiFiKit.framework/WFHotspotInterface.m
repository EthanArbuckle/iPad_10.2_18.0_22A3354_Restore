@implementation WFHotspotInterface

- (WFHotspotInterface)init
{
  WFHotspotInterface *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSSet *networks;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFHotspotInterface;
  v2 = -[WFHotspotInterface init](&v13, sel_init);
  if (!v2)
  {
LABEL_12:
    v4 = 0;
LABEL_5:

    v2 = 0;
    goto LABEL_6;
  }
  v3 = objc_alloc_init(MEMORY[0x24BE90190]);
  if (!v3)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_219FC8000, v10, v11, "failed to create SFRemoteHotspotSession", v12, 2u);
    }

    goto LABEL_12;
  }
  v4 = v3;
  objc_msgSend(v3, "setDelegate:", v2);
  objc_storeStrong((id *)&v2->_hotspotSession, v4);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = objc_claimAutoreleasedReturnValue();
  networks = v2->_networks;
  v2->_networks = (NSSet *)v5;

  if (!v2->_networks)
    goto LABEL_5;
  v7 = dispatch_queue_create(0, 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v7;

  if (!v2->_internalQueue)
    goto LABEL_5;
LABEL_6:

  return v2;
}

- (void)updateNetworksWithHotspots:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WFHotspotDevice *v11;
  void *v12;
  char v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _QWORD v18[4];
  NSObject *v19;
  WFHotspotInterface *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = -[WFHotspotDevice initWithHotspotDevice:]([WFHotspotDevice alloc], "initWithHotspotDevice:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

  -[WFHotspotInterface networks](self, "networks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "isEqualToSet:", v12);

  if ((v13 & 1) != 0)
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v14, v15, "Instant HS scan finished-> No new networks found.", buf, 2u);
    }
  }
  else
  {
    -[WFHotspotInterface setNetworks:](self, "setNetworks:", v5);
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFHotspotInterface updateNetworksWithHotspots:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_219FC8000, v16, v17, "%s: new hotspots %@", buf, 0x16u);
    }

    -[WFHotspotInterface delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __49__WFHotspotInterface_updateNetworksWithHotspots___block_invoke;
      v18[3] = &unk_24DC34BE8;
      v14 = v14;
      v19 = v14;
      v20 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v18);

    }
  }

}

uint64_t __49__WFHotspotInterface_updateNetworksWithHotspots___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hotspotInterfaceDidUpdateNetworks:", *(_QWORD *)(a1 + 40));
}

- (id)enableHotspot:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  objc_msgSend(v6, "hotspotDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)buf = 0;
    v28 = buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__7;
    v31 = __Block_byref_object_dispose__7;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__7;
    v25 = __Block_byref_object_dispose__7;
    v26 = 0;
    v8 = dispatch_semaphore_create(0);
    -[WFHotspotInterface hotspotSession](self, "hotspotSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hotspotDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __42__WFHotspotInterface_enableHotspot_error___block_invoke;
    v17[3] = &unk_24DC35E80;
    v19 = &v21;
    v20 = buf;
    v11 = v8;
    v18 = v11;
    objc_msgSend(v9, "enableRemoteHotspotForDevice:withCompletionHandler:", v10, v17);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v12 = (void *)v22[5];
      if (v12)
        *a4 = objc_retainAutorelease(v12);
    }
    v13 = *((id *)v28 + 5);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v14, v15, "Cannot enable hotspot, WFHotspotDevice missing SFRemoteHotspotDevice", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

void __42__WFHotspotInterface_enableHotspot_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_219FC8000, v8, v9, "error enabling hotspot: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = a3;
  }
  else
  {
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = a2;
  }
  objc_storeStrong(v10, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)isScanning
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__WFHotspotInterface_isScanning__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__WFHotspotInterface_isScanning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)startBrowsing
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[16];

  if (!-[WFHotspotInterface isScanning](self, "isScanning"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "Starting hotspot browsing", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__WFHotspotInterface_startBrowsing__block_invoke;
    block[3] = &unk_24DC348F8;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }
}

uint64_t __35__WFHotspotInterface_startBrowsing__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "hotspotSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startBrowsing");

  return objc_msgSend(*(id *)(a1 + 32), "setScanning:", 1);
}

- (void)stopBrowsing
{
  -[WFHotspotInterface _stopBrowsingRemoveCache:](self, "_stopBrowsingRemoveCache:", 1);
}

- (void)_stopBrowsingRemoveCache:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__WFHotspotInterface__stopBrowsingRemoveCache___block_invoke;
  v4[3] = &unk_24DC35940;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(internalQueue, v4);
}

uint64_t __47__WFHotspotInterface__stopBrowsingRemoveCache___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  int v5;
  void *v6;
  uint64_t result;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(unsigned __int8 *)(a1 + 40);
    v8[0] = 67109376;
    v8[1] = v4;
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_219FC8000, v2, v3, "Stopping hotspot browsing (isBrowsing %d removeCache %d)", (uint8_t *)v8, 0xEu);
  }

  objc_msgSend(*(id *)(a1 + 32), "hotspotSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopBrowsing");

  result = objc_msgSend(*(id *)(a1 + 32), "setScanning:", 0);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "updateNetworksWithHotspots:", 0);
  return result;
}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "Found hotspots %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v5);
  -[WFHotspotInterface updateNetworksWithHotspots:](self, "updateNetworksWithHotspots:", v8);

}

- (NSSet)networks
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (WFHotspotInterfaceDelegate)delegate
{
  return (WFHotspotInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (SFRemoteHotspotSession)hotspotSession
{
  return (SFRemoteHotspotSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHotspotSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotSession, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networks, 0);
}

@end
