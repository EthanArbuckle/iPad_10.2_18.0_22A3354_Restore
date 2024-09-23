@implementation UNCLocationMonitor

- (UNCLocationMonitor)init
{
  NSObject *v3;
  dispatch_queue_t v4;
  UNCLocationMonitor *v5;
  NSObject *v6;
  UNCLocationMonitor *v7;
  _QWORD block[4];
  UNCLocationMonitor *v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.usernotificationsserver.LocationMonitor", v3);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__UNCLocationMonitor_init__block_invoke;
  block[3] = &unk_251AE0278;
  v12 = &v13;
  v5 = self;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  dispatch_sync(v6, block);
  v7 = -[UNCLocationMonitor initWithQueue:locationManager:](v5, "initWithQueue:locationManager:", v6, v14[5]);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __26__UNCLocationMonitor_init__block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.bulletinboard"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BDBFA88]);
  objc_msgSend(v7, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v3, a1[4], a1[5]);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (UNCLocationMonitor)initWithQueue:(id)a3 locationManager:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  dispatch_queue_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  UNCKeyedObservable *v13;
  UNCLocationMonitor *v14;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a4;
  v9 = a3;
  v10 = dispatch_queue_create("com.apple.usernotificationsserver.LocationMonitor.observable", v7);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.usernotificationsserver.LocationMonitor.call-out", v11);

  v13 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v10, v12);
  v14 = -[UNCLocationMonitor initWithQueue:locationManager:observable:](self, "initWithQueue:locationManager:observable:", v9, v8, v13);

  return v14;
}

- (UNCLocationMonitor)initWithQueue:(id)a3 locationManager:(id)a4 observable:(id)a5
{
  id v9;
  id v10;
  id v11;
  UNCLocationMonitor *v12;
  UNCLocationMonitor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UNCLocationMonitor;
  v12 = -[UNCLocationMonitor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationManager, a4);
    objc_storeStrong((id *)&v13->_observable, a5);
    objc_storeStrong((id *)&v13->_queue, a3);
  }

  return v13;
}

- (BOOL)isBundleIdentifierAuthorizedForRegionMonitoring:(id)a3
{
  return objc_msgSend(MEMORY[0x24BDBFA88], "authorizationStatusForBundleIdentifier:", a3) - 3 < 2;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UNCLocationMonitor_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __54__UNCLocationMonitor_addObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "addObserver:forKey:", a1[5], a1[6]);
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__UNCLocationMonitor_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __57__UNCLocationMonitor_removeObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "removeObserver:forKey:", a1[5], a1[6]);
}

- (void)markAsHavingReceivedLocation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__UNCLocationMonitor_markAsHavingReceivedLocation__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__UNCLocationMonitor_markAsHavingReceivedLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "markAsHavingReceivedLocation");
}

- (void)setMonitoredRegions:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  UNCLocationMonitor *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_251AE0BE8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v56[3] = &unk_251AE1030;
  v3 = *(void **)(a1 + 32);
  v57 = *(id *)(a1 + 40);
  objc_msgSend(v3, "bs_map:", v56);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "monitoredRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v2;
  v54[1] = 3221225472;
  v54[2] = __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_3;
  v54[3] = &unk_251AE1058;
  v55 = *(id *)(a1 + 40);
  objc_msgSend(v5, "objectsPassingTest:", v54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v13) & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
    }
    while (v10);
  }

  v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        if ((objc_msgSend(v8, "containsObject:", v20) & 1) == 0)
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
    }
    while (v17);
  }

  v21 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 40);
    v23 = v21;
    v24 = objc_msgSend(v8, "count");
    v25 = objc_msgSend(v14, "count");
    v26 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138544130;
    v61 = v22;
    v62 = 2048;
    v63 = v24;
    v64 = 2048;
    v65 = v25;
    v66 = 2048;
    v67 = v26;
    _os_log_impl(&dword_2499A5000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld monitored regions [ stop: %ld start: %ld ]", buf, 0x2Au);

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = v14;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "stopMonitoringForRegion:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v29);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = v7;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "startMonitoringForRegion:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * m), (_QWORD)v38);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
    }
    while (v34);
  }

  v37 = *(_QWORD *)(a1 + 56);
  if (v37)
    (*(void (**)(void))(v37 + 16))();

}

id __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v3, "setOnBehalfOfBundleId:", *(_QWORD *)(a1 + 32));
  return v3;
}

uint64_t __84__UNCLocationMonitor_setMonitoredRegions_forBundleIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "onBehalfOfBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  -[UNCLocationMonitor _queue_triggerDidFireForRegion:](self, "_queue_triggerDidFireForRegion:", a4);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  -[UNCLocationMonitor _queue_triggerDidFireForRegion:](self, "_queue_triggerDidFireForRegion:", a4);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  v5 = *MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_ERROR))
    -[UNCLocationMonitor locationManager:didFailWithError:].cold.1((uint64_t)v4, v5);

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(a4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "Did start monitoring region %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)_queue_triggerDidFireForRegion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  UNCKeyedObservable *observable;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "onBehalfOfBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UNCLocationMonitor isBundleIdentifierAuthorizedForRegionMonitoring:](self, "isBundleIdentifierAuthorizedForRegionMonitoring:", v5);
  v7 = (void *)*MEMORY[0x24BDF89C8];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "Location trigger fired for region %{public}@", buf, 0xCu);

    }
    observable = self->_observable;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__UNCLocationMonitor__queue_triggerDidFireForRegion___block_invoke;
    v16[3] = &unk_251AE1080;
    v16[4] = self;
    v17 = v4;
    -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v5, v16);

  }
  else if (v8)
  {
    v13 = v7;
    objc_msgSend(v4, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v15;
    _os_log_impl(&dword_2499A5000, v13, OS_LOG_TYPE_DEFAULT, "Location trigger fired but ignored for region %{public}@", buf, 0xCu);

  }
}

void __53__UNCLocationMonitor__queue_triggerDidFireForRegion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "onBehalfOfBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationMonitor:triggerDidFireForRegion:forBundleIdentifier:", v4, v3, v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2499A5000, a2, OS_LOG_TYPE_ERROR, "CLLocationManager failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
