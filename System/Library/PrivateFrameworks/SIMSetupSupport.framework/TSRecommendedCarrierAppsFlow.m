@implementation TSRecommendedCarrierAppsFlow

- (TSRecommendedCarrierAppsFlow)init
{
  TSRecommendedCarrierAppsFlow *v2;
  NSMutableArray *v3;
  NSMutableArray *carrierApps;
  id v5;
  uint64_t v6;
  CoreTelephonyClient *client;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSRecommendedCarrierAppsFlow;
  v2 = -[TSSIMSetupFlow init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    carrierApps = v2->_carrierApps;
    v2->_carrierApps = v3;

    v5 = objc_alloc(MEMORY[0x24BDC2810]);
    v6 = objc_msgSend(v5, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v6;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
  }
  return v2;
}

- (id)firstViewController
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[TSRecommendedCarrierAppsFlow firstViewController].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)firstViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke;
    v11[3] = &unk_24DEF2F68;
    v12 = v4;
    v6 = (void *)MEMORY[0x220765A70](v11);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2;
    v8[3] = &unk_24DEF2F90;
    objc_copyWeak(&v10, &location);
    v7 = v6;
    v9 = v7;
    -[TSRecommendedCarrierAppsFlow _requestCarrierAppsWithCompletion:](self, "_requestCarrierAppsWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

uint64_t __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_createFirstViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_requestCarrierAppsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    if (_requestCarrierAppsWithCompletion__onceToken != -1)
      dispatch_once(&_requestCarrierAppsWithCompletion__onceToken, &__block_literal_global_2);
    v6 = objc_alloc(MEMORY[0x24BE04460]);
    -[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:](self, "_getValueFromCountryBunbleByKey:", CFSTR("AppStoreCollectionCountryID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithID:kind:context:limit:", v7, *MEMORY[0x24BE04430], *MEMORY[0x24BE04420], 0x7FFFFFFFFFFFFFFFLL);

    v9 = (void *)_requestCarrierAppsWithCompletion__sLockupViewGroup;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2;
    v19[3] = &unk_24DEF2FD8;
    objc_copyWeak(&v21, &location);
    v10 = v5;
    v20 = v10;
    objc_msgSend(v9, "_cacheLockupsWithCollectionRequest:withCompletionBlock:", v8, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSRecommendedCarrierAppsFlow _requestCarrierAppsWithCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE04488]);
  v1 = (void *)_requestCarrierAppsWithCompletion__sLockupViewGroup;
  _requestCarrierAppsWithCompletion__sLockupViewGroup = (uint64_t)v0;

}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_7;
  }
  if (v6)
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_2();
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(WeakRetained[11], "removeAllObjects");
    v16 = objc_msgSend(v5, "mutableCopy");
    v17 = WeakRetained[11];
    WeakRetained[11] = (id)v16;

  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_createFirstViewController
{
  SSCellularPlanCarrierAppsViewController *v3;
  NSMutableArray *carrierApps;
  void *v5;
  SSCellularPlanCarrierAppsViewController *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_carrierApps, "count"))
  {
    v3 = [SSCellularPlanCarrierAppsViewController alloc];
    carrierApps = self->_carrierApps;
    -[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:](self, "_getValueFromCountryBunbleByKey:", CFSTR("CountryName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SSCellularPlanCarrierAppsViewController initWithCarrierApps:country:](v3, "initWithCarrierApps:country:", carrierApps, v5);

  }
  else
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[TSRecommendedCarrierAppsFlow _createFirstViewController]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Empty carrier apps list @%s", (uint8_t *)&v11, 0xCu);
    }

    v6 = 0;
  }
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v6);
  -[SSCellularPlanCarrierAppsViewController setDelegate:](v6, "setDelegate:", self);
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    v11 = 138412546;
    v12 = (const char *)v9;
    v13 = 2080;
    v14 = "-[TSRecommendedCarrierAppsFlow _createFirstViewController]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v11, 0x16u);
  }

  return v6;
}

- (id)_getValueFromCountryBunbleByKey:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  CoreTelephonyClient *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  _OWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  client = self->_client;
  v25 = 0;
  -[CoreTelephonyClient getSubscriptionInfoWithError:](client, "getSubscriptionInfoWithError:", &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  if (!v7)
  {
    objc_msgSend(v6, "subscriptions");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 6);
      memset(v24, 0, sizeof(v24));
      if (-[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", v24, v26, 16))
      {
        v12 = **((_QWORD **)&v24[0] + 1);
        v13 = self->_client;
        v23 = 0;
        v14 = (void *)-[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v13, "copyCarrierBundleValue:key:bundleType:error:", v12, v4, v11, &v23);
        v8 = v23;
        v10 = v14;

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      _TSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:].cold.1(v11, v15, v16, v17, v18, v19, v20, v21);
    }
    v8 = 0;
    v10 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  _TSLogDomain();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:].cold.2(v8, v9);
  v10 = 0;
LABEL_12:

  return v10;
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_carrierApps, 0);
}

- (void)firstViewController
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E](UIViewController *)firstViewController is deprecated, please use (void)firstViewController:(void (^)(UIViewController *))completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __52__TSRecommendedCarrierAppsFlow_firstViewController___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestCarrierAppsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __66__TSRecommendedCarrierAppsFlow__requestCarrierAppsWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSRecommendedCarrierAppsFlow _requestCarrierAppsWithCompletion:]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]_cacheLockupsWithCollectionRequest returned error: %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getValueFromCountryBunbleByKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Failed to get the local subscription @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getValueFromCountryBunbleByKey:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v6 = "-[TSRecommendedCarrierAppsFlow _getValueFromCountryBunbleByKey:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, v4, "[E]Failed to get subcription info,  %@ @%s", v5);

}

@end
