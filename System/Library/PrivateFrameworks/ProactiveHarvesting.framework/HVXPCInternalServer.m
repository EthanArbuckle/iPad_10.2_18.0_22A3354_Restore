@implementation HVXPCInternalServer

- (void)enableConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = *(_QWORD *)&a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  hv_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: enableConsumptionOfDataSources called.", v8, 2u);
  }

  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableConsumptionOfDataSources:", v4);

  v5[2](v5, 1, 0);
}

- (void)disableConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = *(_QWORD *)&a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  hv_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: disableConsumptionOfDataSources called.", v8, 2u);
  }

  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disableConsumptionOfDataSources:", v4);

  v5[2](v5, 1, 0);
}

- (void)restoreConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = *(_QWORD *)&a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  hv_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: restoreConsumptionOfDataSources called.", v8, 2u);
  }

  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "restoreConsumptionOfDataSources:", v4);

  v5[2](v5, 1, 0);
}

- (void)contentAvailableFromSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = *(_QWORD *)&a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  hv_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: contentAvailableFromSources called.", v8, 2u);
  }

  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentAvailableFromSources:", v4);

  v5[2](v5, 1, 0);
}

- (void)overrideIsConnectedToPower:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_storeStrong((id *)&isConnectedToPowerOverrideForTesting, a3);
  v5[2](v5, 1, 0);

}

- (void)refillHarvestBudgetWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  +[HVPowerBudget defaultBudget](HVPowerBudget, "defaultBudget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refillThrottleBudget");

  v4[2](v4, 1, 0);
}

- (void)donateSearchableItem:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, uint64_t, id))a4;
  v6 = a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: donateSearchableItem called.", buf, 2u);
  }

  +[HVDonationReceiver defaultReceiver](HVDonationReceiver, "defaultReceiver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = objc_msgSend(v8, "donateSearchableItems:bundleIdentifier:error:", v9, v10, &v13);
  v12 = v13;

  v5[2](v5, v11, v12);
}

- (void)deleteContentWithRequest:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v5 = (void (**)(id, uint64_t, id))a4;
  v6 = a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: deleteContentWithRequest called.", buf, 2u);
  }

  +[HVDonationReceiver defaultReceiver](HVDonationReceiver, "defaultReceiver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "deleteContentWithRequest:error:", v6, &v11);

  v10 = v11;
  v5[2](v5, v9, v10);

}

- (void)statsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: statsWithCompletion called.", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "statsWithError:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v7)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("Consumer Coordinator"));
  }
  else if (v8)
  {
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("Consumer Coordinator Error"));

  }
  +[HVQueues defaultQueues](HVQueues, "defaultQueues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v10, "statsWithError:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;

  if (v11)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("Queues"));
  }
  else if (v12)
  {
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Queues Error"));

  }
  v3[2](v3, v5, 0);

}

- (void)harvestWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, id);
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = (void (**)(id, uint64_t, id))a3;
  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v4, "harvestContentWithMinimumLevelOfService:ignoringDiscretionaryPowerBudget:error:shouldContinueBlock:", 1, 1, &v7, &__block_literal_global_2322);
  v6 = v7;

  v3[2](v3, v5, v6);
}

uint64_t __45__HVXPCInternalServer_harvestWithCompletion___block_invoke()
{
  return 1;
}

@end
