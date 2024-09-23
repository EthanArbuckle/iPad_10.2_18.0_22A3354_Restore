@implementation TSCoreTelephonyClientCache

+ (id)sharedInstance
{
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, &__block_literal_global_18);
  return (id)sharedInstance_instance_1;
}

void __44__TSCoreTelephonyClientCache_sharedInstance__block_invoke()
{
  TSCoreTelephonyClientCache *v0;
  void *v1;

  v0 = objc_alloc_init(TSCoreTelephonyClientCache);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (TSCoreTelephonyClientCache)init
{
  TSCoreTelephonyClientCache *v2;
  id v3;
  uint64_t v4;
  CoreTelephonyClient *client;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSCoreTelephonyClientCache;
  v2 = -[TSCoreTelephonyClientCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    v4 = objc_msgSend(v3, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

  }
  return v2;
}

- (id)getCoreTelephonyClient
{
  return self->_client;
}

- (void)transferPlanListWithCompletion:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke;
  v7[3] = &unk_24DEF3CC0;
  v8 = v4;
  v6 = v4;
  -[CoreTelephonyClient getTransferPlansWithCompletion:](client, "getTransferPlansWithCompletion:", v7);

}

void __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  id v28;
  id obj;
  char v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  uint8_t v47[4];
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v26 = a4;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v28 = v5;
  objc_msgSend(v5, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (!v32)
  {
    v30 = 0;
    goto LABEL_26;
  }
  v30 = 0;
  v31 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v32; ++i)
    {
      if (*(_QWORD *)v38 != v31)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v7, "remoteDisplayPlans");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v34 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            objc_msgSend(v13, "plan");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              _TSLogDomain();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_2(v47, &v48, v20);
              goto LABEL_19;
            }
            objc_msgSend(v13, "plan");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              _TSLogDomain();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "plan");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v42 = v21;
                v43 = 2080;
                v44 = "-[TSCoreTelephonyClientCache transferPlanListWithCompletion:]_block_invoke";
                _os_log_error_impl(&dword_21B647000, v20, OS_LOG_TYPE_ERROR, "[E]%@ is not a CTRemotePlan @%s", buf, 0x16u);

              }
LABEL_19:

              continue;
            }
            objc_msgSend(v13, "plan");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "transferAttributes");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "transferCapability");

            if (v19 == 11)
            {
              v30 = 1;
              goto LABEL_22;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
        }
        while (v10);
      }
LABEL_22:

    }
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  }
  while (v32);
LABEL_26:

  _TSLogDomain();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v26)
  {
    v24 = v28;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_1();
  }
  else
  {
    v24 = v28;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = CFSTR("NO");
      if ((v30 & 1) != 0)
        v25 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v42 = v28;
      v43 = 2112;
      v44 = (const char *)v25;
      v45 = 2080;
      v46 = "-[TSCoreTelephonyClientCache transferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v23, OS_LOG_TYPE_INFO, "[I] Tranfer plan list: %@ isActivationPolicyMismatch: %@ @%s", buf, 0x20u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transferPlanWithIdentifier:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  CoreTelephonyClient *client;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke;
  v11[3] = &unk_24DEF3CE8;
  v12 = v8;
  v10 = v8;
  -[CoreTelephonyClient transferPlan:fromDevice:completionHandler:](client, "transferPlan:fromDevice:completionHandler:", a3, a4, v11);

}

void __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)transferPlansWithIdentifier:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  CoreTelephonyClient *client;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke;
  v11[3] = &unk_24DEF3CE8;
  v12 = v8;
  v10 = v8;
  -[CoreTelephonyClient transferPlans:fromDevice:completionHandler:](client, "transferPlans:fromDevice:completionHandler:", a3, a4, v11);

}

void __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)cancelTransferPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  CoreTelephonyClient *client;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke;
  v11[3] = &unk_24DEF3000;
  v12 = v8;
  v10 = v8;
  -[CoreTelephonyClient cancelCellularPlanTransfer:fromDevice:completionHandler:](client, "cancelCellularPlanTransfer:fromDevice:completionHandler:", a3, a4, v11);

}

void __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getPlanTransferCredentials:(id)a3 completion:(id)a4
{
  id v6;
  CoreTelephonyClient *client;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke;
  v9[3] = &unk_24DEF3D10;
  v10 = v6;
  v8 = v6;
  -[CoreTelephonyClient getPlanTransferCredentials:completion:](client, "getPlanTransferCredentials:completion:", a3, v9);

}

void __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)bootstrapPlanTransferUsingMessageSession:(id)a3 completion:(id)a4
{
  -[CoreTelephonyClient bootstrapPlanTransferForEndpoint:usingMessageSession:completion:](self->_client, "bootstrapPlanTransferForEndpoint:usingMessageSession:completion:", 2, a3, a4);
}

- (void)isAnyPlanOfTransferCapability:(unint64_t)a3 withCompletion:(id)a4
{
  -[CoreTelephonyClient isAnyPlanOfTransferCapability:availableForThisDeviceWithCompletion:](self->_client, "isAnyPlanOfTransferCapability:availableForThisDeviceWithCompletion:", a3, a4);
}

- (BOOL)getTransferCapability:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  dispatch_time_t v6;
  CoreTelephonyClient *client;
  NSObject *v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = dispatch_semaphore_create(0);
  v6 = dispatch_time(0, 20000000000);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  client = self->_client;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke;
  v10[3] = &unk_24DEF3D38;
  v12 = &v13;
  v8 = v5;
  v11 = v8;
  -[CoreTelephonyClient isAnyPlanOfTransferCapability:availableForThisDeviceWithCompletion:](client, "isAnyPlanOfTransferCapability:availableForThisDeviceWithCompletion:", a3, v10);
  dispatch_semaphore_wait(v8, v6);
  LOBYTE(v6) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setDataFallbackEnabled:(BOOL)a3 forIccid:(id)a4
{
  _BOOL8 v4;
  id v6;
  CoreTelephonyClient *client;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v4 = a3;
  v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke;
  v9[3] = &unk_24DEF3D60;
  v11 = v4;
  v10 = v6;
  v8 = v6;
  -[CoreTelephonyClient setSupportDynamicDataSimSwitch:forIccid:completion:](client, "setSupportDynamicDataSimSwitch:forIccid:completion:", v4, v8, v9);

}

void __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)pendingInstallItemsWithCompletion:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke;
  v7[3] = &unk_24DEF3D88;
  v8 = v4;
  v6 = v4;
  -[CoreTelephonyClient plansPendingInstallWithCompletion:](client, "plansPendingInstallWithCompletion:", v7);

}

void __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke_cold_1();

  }
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2080;
    v12 = "-[TSCoreTelephonyClientCache pendingInstallItemsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_INFO, "[I] Pending install items: %@ @%s", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)installPendingPlan:(id)a3 completion:(id)a4
{
  -[CoreTelephonyClient installPendingPlan:completion:](self->_client, "installPendingPlan:completion:", a3, a4);
}

- (void)installPendingPlanList:(id)a3 completion:(id)a4
{
  -[CoreTelephonyClient installPendingPlanList:completion:](self->_client, "installPendingPlanList:completion:", a3, a4);
}

- (void)hideTransferPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  -[CoreTelephonyClient hideTransferPlan:fromDevice:completion:](self->_client, "hideTransferPlan:fromDevice:completion:", a3, a4, a5);
}

- (void)convertPhysicalSIMToeSIMWithCompletion:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__TSCoreTelephonyClientCache_convertPhysicalSIMToeSIMWithCompletion___block_invoke;
  v7[3] = &unk_24DEF3000;
  v8 = v4;
  v6 = v4;
  -[CoreTelephonyClient convertPhysicalToeSIMWithCompletionHandler:](client, "convertPhysicalToeSIMWithCompletionHandler:", v7);

}

void __69__TSCoreTelephonyClientCache_convertPhysicalSIMToeSIMWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v3;
    v8 = 2080;
    v9 = "-[TSCoreTelephonyClientCache convertPhysicalSIMToeSIMWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "convert psim -> esim. error:%@ @%s", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)getSubscriptionInfo:(id)a3
{
  -[CoreTelephonyClient getSubscriptionInfo:](self->_client, "getSubscriptionInfo:", a3);
}

- (BOOL)deviceSupportsHydra
{
  CoreTelephonyClient *client;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  char v9;
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  client = self->_client;
  v11 = 0;
  -[CoreTelephonyClient supportsHydraWithError:](client, "supportsHydraWithError:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v3, "BOOLValue");
      v8 = CFSTR("Not Supported");
      if (v7)
        v8 = CFSTR("Supported");
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2080;
      v15 = "-[TSCoreTelephonyClientCache deviceSupportsHydra]";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Checking hydra result: %@ @%s", buf, 0x16u);
    }

    v9 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TSCoreTelephonyClientCache deviceSupportsHydra].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BOOL)isEmbeddedSIMOnlyConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  if (isEmbeddedSIMOnlyConfig_onceToken != -1)
    dispatch_once(&isEmbeddedSIMOnlyConfig_onceToken, block);
  return self->_isEOnly;
}

void __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = 0;
  objc_msgSend(v2, "isEmbeddedSIMOnlyConfig:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(v3, "BOOLValue");
  }

}

- (void)submitSimSetupUsage:(id)a3
{
  -[CoreTelephonyClient submitSimSetupUsage:completion:](self->_client, "submitSimSetupUsage:completion:", a3, &__block_literal_global_28);
}

void __50__TSCoreTelephonyClientCache_submitSimSetupUsage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __50__TSCoreTelephonyClientCache_submitSimSetupUsage___block_invoke_cold_1();

  }
}

- (void)getCarrierSetupWithCompletion:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke;
  v7[3] = &unk_24DEF3D88;
  v8 = v4;
  v6 = v4;
  -[CoreTelephonyClient getCarrierSetupWithCompletion:](client, "getCarrierSetupWithCompletion:", v7);

}

void __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke_cold_1();

  }
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2080;
    v12 = "-[TSCoreTelephonyClientCache getCarrierSetupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_INFO, "[I] Carrier setup items: %@ @%s", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getWebsheetInfoForPlan:(id)a3 inBuddy:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  CoreTelephonyClient *client;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke;
  v11[3] = &unk_24DEF3DD0;
  v12 = v8;
  v10 = v8;
  -[CoreTelephonyClient websheetInfoForPlan:inBuddy:completion:](client, "websheetInfoForPlan:inBuddy:completion:", a3, v5, v11);

}

void __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke_cold_1();

  }
  _TSLogDomain();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2080;
    v17 = "-[TSCoreTelephonyClientCache getWebsheetInfoForPlan:inBuddy:completion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_INFO, "[I] Websheet: %@ Postdata: %@ @%s", (uint8_t *)&v12, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)updateSecureIntentData:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CoreTelephonyClient updateSecureIntentData:](self->_client, "updateSecureIntentData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2080;
      v9 = "-[TSCoreTelephonyClientCache updateSecureIntentData:]";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "updateSecureIntentData failed:%@ @%s", (uint8_t *)&v6, 0x16u);
    }

  }
  return v3;
}

- (BOOL)usingBootstrapDataService
{
  CoreTelephonyClient *client;
  void *v3;
  id v4;
  NSObject *v5;
  char v6;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  client = self->_client;
  v8 = 0;
  -[CoreTelephonyClient usingBootstrapDataService:](client, "usingBootstrapDataService:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v4;
      v11 = 2080;
      v12 = "-[TSCoreTelephonyClientCache usingBootstrapDataService]";
      _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "usingBootstrapDataService failed:%@ @%s", buf, 0x16u);
    }

  }
  v6 = objc_msgSend(v3, "BOOLValue");

  return v6;
}

- (void)submitPlanSetupDetails:(id)a3
{
  -[CoreTelephonyClient submitPlanSetupDetails:completion:](self->_client, "submitPlanSetupDetails:completion:", a3, &__block_literal_global_30_0);
}

void __53__TSCoreTelephonyClientCache_submitPlanSetupDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__TSCoreTelephonyClientCache_submitPlanSetupDetails___block_invoke_cold_1();

  }
}

- (BOOL)isEOnly
{
  return self->_isEOnly;
}

- (void)setIsEOnly:(BOOL)a3
{
  self->_isEOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

void __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Tranfer plan list retrieval failed: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSCoreTelephonyClientCache transferPlanListWithCompletion:]_block_invoke";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]invalid CTRemotePlan @%s", buf, 0xCu);
}

void __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = 138413058;
  if (v3)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v7 = v5;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = a2;
  v12 = 2080;
  v13 = "-[TSCoreTelephonyClientCache setDataFallbackEnabled:forIccid:]_block_invoke";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]enabled:%@, iccid: %@, %@ @%s", (uint8_t *)&v6, 0x2Au);
}

void __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deviceSupportsHydra
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]Error checking hydra: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]query eONLY failed : %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__TSCoreTelephonyClientCache_submitSimSetupUsage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]submit sim setup usage failure. error:%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__TSCoreTelephonyClientCache_submitPlanSetupDetails___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]submit plan setup details failure. error:%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
