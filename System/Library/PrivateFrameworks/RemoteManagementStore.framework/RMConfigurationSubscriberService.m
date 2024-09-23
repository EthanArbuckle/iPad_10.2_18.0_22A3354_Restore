@implementation RMConfigurationSubscriberService

+ (id)newConfigurationSubscriberServiceWithXPCConnection:(id)a3
{
  id v3;
  RMConfigurationSubscriberService *v4;

  v3 = a3;
  v4 = -[RMConfigurationSubscriberService initWithXPCConnection:]([RMConfigurationSubscriberService alloc], "initWithXPCConnection:", v3);

  return v4;
}

- (RMConfigurationSubscriberService)initWithXPCConnection:(id)a3
{
  id v4;
  RMConfigurationSubscriberService *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *configurationTypes;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *statusKeys;
  void *v18;
  char v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RMConfigurationSubscriberService;
  v5 = -[RMConfigurationSubscriberService init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMConfigurationSubscriberDescription descriptionWithServiceDictionary:](RMConfigurationSubscriberDescription, "descriptionWithServiceDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "types");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    configurationTypes = v5->_configurationTypes;
    v5->_configurationTypes = (NSArray *)v10;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "infoDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMStatusPublisherDescription descriptionWithServiceDictionary:](RMStatusPublisherDescription, "descriptionWithServiceDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "statusKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = objc_claimAutoreleasedReturnValue();
    statusKeys = v5->_statusKeys;
    v5->_statusKeys = (NSArray *)v16;

    objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.remotemanagement.configuration-subscriber-service"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = 0;
    v5->_hasServiceEntitlement = v19;

  }
  return v5;
}

- (void)fetchThenApplyConfigurationsWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  int64_t v23;

  v6 = a4;
  v7 = -[RMConfigurationSubscriberService hasServiceEntitlement](self, "hasServiceEntitlement");
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberService");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:].cold.1(a3, self);

    v10 = (void *)MEMORY[0x24BDBCF20];
    -[RMConfigurationSubscriberService configurationTypes](self, "configurationTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke;
    v21[3] = &unk_25162F718;
    v23 = a3;
    v21[4] = self;
    v22 = v6;
    -[RMConfigurationSubscriberClient fetchConfigurationsWithTypes:scope:completionHandler:](self, "fetchConfigurationsWithTypes:scope:completionHandler:", v12, a3, v21);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:].cold.2(v9, v13, v14, v15, v16, v17, v18, v19);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v20);

  }
}

void __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke_cold_1(a1);

  if (v3)
  {
    v5 = (void *)MEMORY[0x24BE7EB08];
    objc_msgSend(v3, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createInternalErrorWithDescription:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchThenUpdateConfigurationUIsWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  int64_t v23;

  v6 = a4;
  v7 = -[RMConfigurationSubscriberService hasServiceEntitlement](self, "hasServiceEntitlement");
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberService");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[RMConfigurationSubscriberService fetchThenUpdateConfigurationUIsWithScope:completionHandler:].cold.1(a3, v9);

    v10 = (void *)MEMORY[0x24BDBCF20];
    -[RMConfigurationSubscriberService configurationTypes](self, "configurationTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke;
    v21[3] = &unk_25162F740;
    v23 = a3;
    v22 = v6;
    -[RMConfigurationSubscriberClient fetchConfigurationUIsWithTypes:scope:completionHandler:](self, "fetchConfigurationUIsWithTypes:scope:completionHandler:", v12, a3, v21);

    v13 = v22;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:].cold.2(v9, v14, v15, v16, v17, v18, v19, v20);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v13);
  }

}

void __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke_cold_1(a1, v4);

  if (v3)
  {
    v5 = (void *)MEMORY[0x24BE7EB08];
    objc_msgSend(v3, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createInternalErrorWithDescription:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[RMConfigurationSubscriberService hasServiceEntitlement](self, "hasServiceEntitlement");
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberService");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[RMConfigurationSubscriberService publishStatusKeys:storeIdentifier:scope:completionHandler:].cold.1((uint64_t)v10, v15, v16);

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke;
    v25[3] = &unk_25162F3C0;
    v26 = v10;
    v27 = v12;
    -[RMConfigurationSubscriberClient sendStatusKeys:storeIdentifier:scope:completionHandler:](self, "sendStatusKeys:storeIdentifier:scope:completionHandler:", v26, v11, a5, v25);

    v17 = v26;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[RMConfigurationSubscriberService fetchThenApplyConfigurationsWithScope:completionHandler:].cold.2(v15, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v17);
  }

}

void __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(a1, v4, v5);

  if (v3)
  {
    v6 = (void *)MEMORY[0x24BE7EB08];
    objc_msgSend(v3, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createInternalErrorWithDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSArray)configurationTypes
{
  return self->_configurationTypes;
}

- (NSArray)statusKeys
{
  return self->_statusKeys;
}

- (BOOL)hasServiceEntitlement
{
  return self->_hasServiceEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKeys, 0);
  objc_storeStrong((id *)&self->_configurationTypes, 0);
}

- (void)fetchThenApplyConfigurationsWithScope:(uint64_t)a1 completionHandler:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "configurationTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_2(&dword_245188000, v5, v6, "Fetch configurations for %{public}@ scope with types: %{public}@...", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3_2();
}

- (void)fetchThenApplyConfigurationsWithScope:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_245188000, a1, a3, "Connection not entitled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __92__RMConfigurationSubscriberService_fetchThenApplyConfigurationsWithScope_completionHandler___block_invoke_cold_1(uint64_t a1)
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

  objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configurationTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_2(&dword_245188000, v4, v5, "Processed configurations for %{public}@ scope with types: %{public}@...", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3_2();
}

- (void)fetchThenUpdateConfigurationUIsWithScope:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a2, v4, "Fetching configuration UIs for %{public}@ scope...", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3_1();
}

void __95__RMConfigurationSubscriberService_fetchThenUpdateConfigurationUIsWithScope_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a2, v4, "Fetching missing configuration UIs for %{public}@ scope...", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3_1();
}

- (void)publishStatusKeys:(uint64_t)a3 storeIdentifier:scope:completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a2, a3, "Fetch status keys: %{public}@", (uint8_t *)&v3);
}

void __94__RMConfigurationSubscriberService_publishStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_2_1(&dword_245188000, a2, a3, "Processed status keys: %{public}@...", (uint8_t *)&v4);
}

@end
