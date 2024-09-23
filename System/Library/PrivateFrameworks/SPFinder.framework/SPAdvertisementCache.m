@implementation SPAdvertisementCache

- (SPAdvertisementCache)init
{
  SPAdvertisementCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  void *v7;
  uint64_t v8;
  FMXPCServiceDescription *serviceDescription;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SPAdvertisementCache;
  v2 = -[SPAdvertisementCache init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.advertisementcache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x24BE2FE70]);
    -[SPAdvertisementCache remoteInterface](v2, "remoteInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.advertisementcache"), 0, v7, 0, 0);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SPAdvertisementCache session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPAdvertisementCache setSession:](self, "setSession:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SPAdvertisementCache;
  -[SPAdvertisementCache dealloc](&v4, sel_dealloc);
}

- (SPAdvertisementCacheXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SPAdvertisementCache queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPAdvertisementCache session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE2FE78]);
    -[SPAdvertisementCache serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPAdvertisementCache setSession:](self, "setSession:", v7);

    LogCategory_AdvertisementCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPAdvertisementCache serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "SPAdvertisementCache: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPAdvertisementCache session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPAdvertisementCache session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPAdvertisementCacheXPCProtocol *)v13;
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DEEC58);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_advertisementsForSearchCriteria_completion_, 0, 1);

  return v2;
}

- (void)mockingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD activity_block[5];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  LogCategory_AdvertisementCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_215909000, v5, OS_LOG_TYPE_DEFAULT, "mockingEnabled: %i", buf, 8u);
  }

  v6 = objc_alloc(MEMORY[0x24BE2FE68]);
  v7 = (void *)objc_msgSend(v6, "initWithDescription:andTimeout:", CFSTR("SPAdvertisementCacheMocking"), *MEMORY[0x24BE2FE80]);
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__SPAdvertisementCache_mockingEnabled___block_invoke;
  activity_block[3] = &unk_24D3B7050;
  v11 = v3;
  activity_block[4] = self;
  v10 = v7;
  v8 = v7;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache advertisementCacheSimulation:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_msgSend(v8, "wait");
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__SPAdvertisementCache_mockingEnabled___block_invoke_2;
  v3[3] = &unk_24D3B7028;
  objc_copyWeak(&v5, &location);
  v6 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__SPAdvertisementCache_mockingEnabled___block_invoke_3;
  v5[3] = &unk_24D3B7000;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "advertisementCacheSimulation:completion:", v4, v5);

}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    LogCategory_AdvertisementCache();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__SPAdvertisementCache_mockingEnabled___block_invoke_3_cold_1((uint64_t)v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (void)markRecordsProcessed:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache markAdvertisementsProcessed:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAdvertisementsProcessed:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)saveAdvertisements:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_AdvertisementCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "saveAdvertisements: %lu", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache saveAdvertisements:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveAdvertisements:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_AdvertisementCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "advertisementsForSearchCriteria: %@", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache advertisementsForSearchCriteria:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "advertisementsForSearchCriteria:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_AdvertisementCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "markAdvertisementsProcessed: %lu", buf, 0xCu);
  }

  objc_msgSend(v6, "fm_map:", &__block_literal_global_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPAdvertisementCache_markAdvertisementsProcessed_completion___block_invoke_2;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v13 = v9;
  v14 = v7;
  v10 = v7;
  v11 = v9;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache markRecordsProcessed:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __63__SPAdvertisementCache_markAdvertisementsProcessed_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordIdentifier");
}

uint64_t __63__SPAdvertisementCache_markAdvertisementsProcessed_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markRecordsProcessed:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)saveBeaconPayloads:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_AdvertisementCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "saveBeaconPayload: %lu", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache saveBeaconPayloads:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveBeaconPayloads:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_AdvertisementCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "beaconPayloadsForSearchCriteria: %@", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache beaconPayloadsForSearchCriteria:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconPayloadsForSearchCriteria:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)markBeaconPayloadsProcessed:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogCategory_AdvertisementCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "markBeaconPayloadsProcessed: %lu", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_215909000, "SPAdvertisementCache markFilesProcessed:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markFilesProcessed:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[SPAdvertisementCache queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __90__SPAdvertisementCache_beaconAdvertisementAtFileURL_beaconIdentifier_scanDate_completion___block_invoke;
  v19[3] = &unk_24D3B70B8;
  objc_copyWeak(&v24, &location);
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __90__SPAdvertisementCache_beaconAdvertisementAtFileURL_beaconIdentifier_scanDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconAdvertisementAtFileURL:beaconIdentifier:scanDate:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)clearCacheWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPAdvertisementCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SPAdvertisementCache_clearCacheWithCompletion___block_invoke;
  block[3] = &unk_24D3B6E78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__SPAdvertisementCache_clearCacheWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearCacheWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215909000, a2, OS_LOG_TYPE_ERROR, "Failed to change mocking state: %@", (uint8_t *)&v2, 0xCu);
}

@end
