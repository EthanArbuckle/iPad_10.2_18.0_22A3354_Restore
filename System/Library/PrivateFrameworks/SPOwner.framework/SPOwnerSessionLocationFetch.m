@implementation SPOwnerSessionLocationFetch

- (SPOwnerSessionLocationFetch)init
{
  SPOwnerSessionLocationFetch *v2;
  SPRetryCount *v3;
  SPRetryCount *retryCount;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPOwnerSessionLocationFetch;
  v2 = -[SPOwnerSessionLocationFetch init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SPRetryCount);
    retryCount = v2->_retryCount;
    v2->_retryCount = v3;

  }
  return v2;
}

- (void)setLocationUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

void __55__SPOwnerSessionLocationFetch_receivedUpdatedLocation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_LocationFetch();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "locationsByBeaconIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch receivedUpdatedLocation %lu", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "locationUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "locationUpdates");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32));
  }
  else
  {
    LogCategory_LocationFetch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1AEA79000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch - received updated locations but no registered block", (uint8_t *)&v6, 2u);
    }
  }

}

- (id)locationUpdates
{
  return self->_locationUpdates;
}

- (void)subscribeAndFetchLocationForContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD activity_block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIdentifier:", v10);

  -[SPOwnerSessionLocationFetch locationUpdates](self, "locationUpdates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "setSubscribe:", 1);
  -[SPOwnerSessionLocationFetch deviceEventUpdates](self, "deviceEventUpdates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v7, "setReportDeviceEvents:", 1);
  objc_storeStrong((id *)&self->_lastContext, a3);
  LogCategory_LocationFetch();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "searchIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_1AEA79000, v13, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch.subscribeAndFetchLocationForContext %lu", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke;
  activity_block[3] = &unk_1E5E16748;
  objc_copyWeak(&v20, (id *)buf);
  v18 = v7;
  v19 = v8;
  v15 = v8;
  v16 = v7;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSessionLocationFetch.subscribeAndFetchLocationForContext:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContext, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong(&self->_locationFetchSessionInvalidationBlock, 0);
  objc_storeStrong(&self->_deviceEventUpdates, 0);
  objc_storeStrong(&self->_locationUpdates, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __48__SPOwnerSessionLocationFetch_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE21948);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_6;
  exportedInterface_interface_6 = v0;

}

void __46__SPOwnerSessionLocationFetch_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27BB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_6;
  remoteInterface_interface_6 = v0;

}

void __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
  {
    LogCategory_LocationFetch();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2_cold_1((uint64_t)v6, WeakRetained, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject receivedUpdatedLocation:](WeakRetained, "receivedUpdatedLocation:", v5);
  }

}

- (void)receivedUpdatedLocation:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[4];
  id v7;
  SPOwnerSessionLocationFetch *v8;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __55__SPOwnerSessionLocationFetch_receivedUpdatedLocation___block_invoke;
  activity_block[3] = &unk_1E5E16818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSessionLocationFetch.receivedUpdatedLocation", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2;
  v6[3] = &unk_1E5E17DF8;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, v2);
  objc_msgSend(v4, "locationForContext:completion:", v5, v6);

  objc_destroyWeak(&v8);
}

- (SPOwnerSessionXPCProtocol)proxy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  id location;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SPOwnerSessionLocationFetch session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__SPOwnerSessionLocationFetch_proxy__block_invoke;
    aBlock[3] = &unk_1E5E16690;
    objc_copyWeak(&v24, &location);
    v5 = _Block_copy(aBlock);
    v18 = v4;
    v19 = 3221225472;
    v20 = __36__SPOwnerSessionLocationFetch_proxy__block_invoke_2;
    v21 = &unk_1E5E16690;
    objc_copyWeak(&v22, &location);
    v6 = _Block_copy(&v18);
    v7 = objc_alloc(MEMORY[0x1E0D20238]);
    +[SPOwnerSessionLocationFetch exportedInterface](SPOwnerSessionLocationFetch, "exportedInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPOwnerSessionLocationFetch remoteInterface](SPOwnerSessionLocationFetch, "remoteInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchparty.locationfetch.items"), 0, self, v8, v9, v5, v6, v18, v19, v20, v21);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20240]), "initWithServiceDescription:", v10);
    -[SPOwnerSessionLocationFetch setSession:](self, "setSession:", v11);

    LogCategory_SecureLocations();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "machService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1AEA79000, v12, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch: Establishing XPC connection to %@", buf, 0xCu);

    }
    -[SPOwnerSessionLocationFetch session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  -[SPOwnerSessionLocationFetch session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "proxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPOwnerSessionXPCProtocol *)v16;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_7 != -1)
    dispatch_once(&remoteInterface_onceToken_7, &__block_literal_global_55_0);
  return (id)remoteInterface_interface_6;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_6 != -1)
    dispatch_once(&exportedInterface_onceToken_6, &__block_literal_global_13);
  return (id)exportedInterface_interface_6;
}

- (void)interruptionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  SPLocationFetchContext *v6;
  double v7;
  dispatch_time_t v8;
  SPLocationFetchContext *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SPLocationFetchContext *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_LocationFetch();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch interruptionHandler %@", buf, 0xCu);
  }

  v6 = self->_lastContext;
  objc_initWeak((id *)buf, self);
  -[SPRetryCount decayWaitInterval](self->_retryCount, "decayWaitInterval");
  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke;
  v13 = &unk_1E5E16C70;
  objc_copyWeak(&v15, (id *)buf);
  v9 = v6;
  v14 = v9;
  dispatch_after(v8, MEMORY[0x1E0C80D38], &v10);
  -[SPRetryCount increment](self->_retryCount, "increment", v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "proxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2;
    v6[3] = &unk_1E5E17DD0;
    v6[4] = v3;
    objc_msgSend(v4, "locationForContext:completion:", v5, v6);

  }
}

void __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_LocationFetch();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "retryCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reset");

    objc_msgSend(*(id *)(a1 + 32), "receivedUpdatedLocation:", v5);
  }

}

- (void)invalidationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_LocationFetch();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch invalidationHandler %@", (uint8_t *)&v9, 0xCu);
  }

  -[SPOwnerSessionLocationFetch locationFetchSessionInvalidationBlock](self, "locationFetchSessionInvalidationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPOwnerSessionLocationFetch locationFetchSessionInvalidationBlock](self, "locationFetchSessionInvalidationBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 19, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  }
}

void __36__SPOwnerSessionLocationFetch_proxy__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __36__SPOwnerSessionLocationFetch_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "invalidationHandler:", v3);

}

- (void)receivedUpdatedDeviceEvents:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[4];
  id v7;
  SPOwnerSessionLocationFetch *v8;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __59__SPOwnerSessionLocationFetch_receivedUpdatedDeviceEvents___block_invoke;
  activity_block[3] = &unk_1E5E16818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSessionLocationFetch.receivedUpdatedLocation", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __59__SPOwnerSessionLocationFetch_receivedUpdatedDeviceEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_LocationFetch();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "beaconEventByBeaconIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch receivedUpdatedDeviceEvents %lu.", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "deviceEventUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceEventUpdates");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32));
  }
  else
  {
    LogCategory_LocationFetch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1AEA79000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch - received updated device events but no registered block.", (uint8_t *)&v6, 2u);
    }
  }

}

- (void)unsubscribeLocationUpdatesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, _QWORD))a3;
  LogCategory_LocationFetch();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch.unsubscribeLocationUpdatesWithCompletion", v7, 2u);
  }

  -[SPOwnerSessionLocationFetch setLocationFetchSessionInvalidationBlock:](self, "setLocationFetchSessionInvalidationBlock:", 0);
  -[SPOwnerSessionLocationFetch setLocationUpdates:](self, "setLocationUpdates:", 0);
  -[SPOwnerSessionLocationFetch session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SPOwnerSessionLocationFetch setSession:](self, "setSession:", 0);
  v4[2](v4, 0);

}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD activity_block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_LocationFetch();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "searchIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSessionLocationFetch.locationForContext:completion: %lu", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPOwnerSessionLocationFetch_locationForContext_completion___block_invoke;
  activity_block[3] = &unk_1E5E175D8;
  v13 = v6;
  v10 = v6;
  objc_copyWeak(&v15, (id *)buf);
  v14 = v7;
  v11 = v7;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSessionLocationFetch.locationForContext:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __61__SPOwnerSessionLocationFetch_locationForContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBundleIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setSubscribe:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationForContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (id)deviceEventUpdates
{
  return self->_deviceEventUpdates;
}

- (void)setDeviceEventUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)locationFetchSessionInvalidationBlock
{
  return self->_locationFetchSessionInvalidationBlock;
}

- (void)setLocationFetchSessionInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SPRetryCount)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(id)a3
{
  objc_storeStrong((id *)&self->_retryCount, a3);
}

- (SPLocationFetchContext)lastContext
{
  return self->_lastContext;
}

- (void)setLastContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

void __51__SPOwnerSessionLocationFetch_interruptionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "SPOwnerSessionLocationFetch Error re-subscribing location update %@", a5, a6, a7, a8, 2u);
}

void __78__SPOwnerSessionLocationFetch_subscribeAndFetchLocationForContext_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "SPOwnerSessionLocationFetch Error receiving subscribed location update %@", a5, a6, a7, a8, 2u);
}

@end
