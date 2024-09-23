@implementation HVXPCInternalService

- (HVXPCInternalService)init
{
  HVXPCInternalService *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _PASXPCClientHelper *helper;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HVXPCInternalService;
  v2 = -[HVXPCInternalService init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255118268);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x22074FDF0]();
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_statsWithCompletion_, 0, 1);

    v12 = objc_alloc(MEMORY[0x24BE7A650]);
    hv_default_log_handle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithServiceName:whitelistedServerInterface:whitelistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.proactive.ProactiveHarvesting.Internal"), v3, 0, 0, &__block_literal_global_1622, &__block_literal_global_30, v13);
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v14;

  }
  return v2;
}

- (id)synchronousProxy
{
  return (id)-[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_32);
}

- (BOOL)enableConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = *(_QWORD *)&a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: enableConsumptionOfDataSources", buf, 2u);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1590;
  v17 = __Block_byref_object_dispose__1591;
  v18 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__HVXPCInternalService_enableConsumptionOfDataSources_error___block_invoke;
  v12[3] = &unk_24DD7F388;
  v12[4] = &v19;
  v12[5] = buf;
  objc_msgSend(v8, "enableConsumptionOfDataSources:completion:", v5, v12);

  v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v14 + 5));
    v9 = *((unsigned __int8 *)v20 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)disableConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = *(_QWORD *)&a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: disableConsumptionOfDataSources", buf, 2u);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1590;
  v17 = __Block_byref_object_dispose__1591;
  v18 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__HVXPCInternalService_disableConsumptionOfDataSources_error___block_invoke;
  v12[3] = &unk_24DD7F388;
  v12[4] = &v19;
  v12[5] = buf;
  objc_msgSend(v8, "disableConsumptionOfDataSources:completion:", v5, v12);

  v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v14 + 5));
    v9 = *((unsigned __int8 *)v20 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)restoreConsumptionOfDataSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = *(_QWORD *)&a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: restoreConsumptionOfDataSources", buf, 2u);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1590;
  v17 = __Block_byref_object_dispose__1591;
  v18 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__HVXPCInternalService_restoreConsumptionOfDataSources_error___block_invoke;
  v12[3] = &unk_24DD7F388;
  v12[4] = &v19;
  v12[5] = buf;
  objc_msgSend(v8, "restoreConsumptionOfDataSources:completion:", v5, v12);

  v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v14 + 5));
    v9 = *((unsigned __int8 *)v20 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)contentAvailableFromSources:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = *(_QWORD *)&a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: contentAvailableFromSources", buf, 2u);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1590;
  v17 = __Block_byref_object_dispose__1591;
  v18 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HVXPCInternalService_contentAvailableFromSources_error___block_invoke;
  v12[3] = &unk_24DD7F388;
  v12[4] = &v19;
  v12[5] = buf;
  objc_msgSend(v8, "contentAvailableFromSources:completion:", v5, v12);

  v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v14 + 5));
    v9 = *((unsigned __int8 *)v20 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)overrideIsConnectedToPower:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: overrideIsConnectedToPower", buf, 2u);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1590;
  v17 = __Block_byref_object_dispose__1591;
  v18 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__HVXPCInternalService_overrideIsConnectedToPower_error___block_invoke;
  v12[3] = &unk_24DD7F388;
  v12[4] = &v19;
  v12[5] = buf;
  objc_msgSend(v8, "overrideIsConnectedToPower:completion:", v6, v12);

  v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v14 + 5));
    v9 = *((unsigned __int8 *)v20 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)refillHarvestBudgetWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  BOOL v8;
  _QWORD v10[6];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: refillHarvestBudgetWithError", buf, 2u);
  }

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1590;
  v15 = __Block_byref_object_dispose__1591;
  v16 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__HVXPCInternalService_refillHarvestBudgetWithError___block_invoke;
  v10[3] = &unk_24DD7F388;
  v10[4] = &v17;
  v10[5] = buf;
  objc_msgSend(v6, "refillHarvestBudgetWithCompletion:", v10);

  v7 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = objc_retainAutorelease(*((id *)v12 + 5));
    v7 = *((unsigned __int8 *)v18 + 24);
  }
  v8 = v7 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)donateSearchableItem:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  hv_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: donateSearchableItem called.", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVXPCInternalService.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1590;
  v19 = __Block_byref_object_dispose__1591;
  v20 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__HVXPCInternalService_donateSearchableItem_error___block_invoke;
  v14[3] = &unk_24DD7F388;
  v14[4] = &v21;
  v14[5] = buf;
  objc_msgSend(v9, "donateSearchableItem:completion:", v7, v14);

  v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v16 + 5));
    v10 = *((unsigned __int8 *)v22 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  hv_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: deleteContentWithRequest called.", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVXPCInternalService.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1590;
  v19 = __Block_byref_object_dispose__1591;
  v20 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__HVXPCInternalService_deleteContentWithRequest_error___block_invoke;
  v14[3] = &unk_24DD7F388;
  v14[4] = &v21;
  v14[5] = buf;
  objc_msgSend(v9, "deleteContentWithRequest:completion:", v7, v14);

  v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
  {
    *a4 = objc_retainAutorelease(*((id *)v16 + 5));
    v10 = *((unsigned __int8 *)v22 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (id)statsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: statsWithError called.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1590;
  v21 = __Block_byref_object_dispose__1591;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1590;
  v15 = __Block_byref_object_dispose__1591;
  v16 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__HVXPCInternalService_statsWithError___block_invoke;
  v10[3] = &unk_24DD7F3B0;
  v10[4] = buf;
  v10[5] = &v11;
  objc_msgSend(v6, "statsWithCompletion:", v10);

  v7 = (void *)*((_QWORD *)v18 + 5);
  if (a3 && !v7)
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v7 = (void *)*((_QWORD *)v18 + 5);
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (BOOL)harvestWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  BOOL v8;
  _QWORD v10[6];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: harvestWithError called.", buf, 2u);
  }

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1590;
  v15 = __Block_byref_object_dispose__1591;
  v16 = 0;
  -[HVXPCInternalService synchronousProxy](self, "synchronousProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__HVXPCInternalService_harvestWithError___block_invoke;
  v10[3] = &unk_24DD7F388;
  v10[4] = &v17;
  v10[5] = buf;
  objc_msgSend(v6, "harvestWithCompletion:", v10);

  v7 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = objc_retainAutorelease(*((id *)v12 + 5));
    v7 = *((unsigned __int8 *)v18 + 24);
  }
  v8 = v7 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
}

void __41__HVXPCInternalService_harvestWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __39__HVXPCInternalService_statsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __55__HVXPCInternalService_deleteContentWithRequest_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __51__HVXPCInternalService_donateSearchableItem_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __53__HVXPCInternalService_refillHarvestBudgetWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __57__HVXPCInternalService_overrideIsConnectedToPower_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __58__HVXPCInternalService_contentAvailableFromSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __62__HVXPCInternalService_restoreConsumptionOfDataSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __62__HVXPCInternalService_disableConsumptionOfDataSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __61__HVXPCInternalService_enableConsumptionOfDataSources_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __40__HVXPCInternalService_synchronousProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  hv_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_21AA1D000, v3, OS_LOG_TYPE_ERROR, "HVXPCInternalService: error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __28__HVXPCInternalService_init__block_invoke_29()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.ProactiveHarvesting.Internal");
    _os_log_impl(&dword_21AA1D000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated", (uint8_t *)&v1, 0xCu);
  }

}

void __28__HVXPCInternalService_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.ProactiveHarvesting.Internal");
    _os_log_impl(&dword_21AA1D000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ interrupted", (uint8_t *)&v1, 0xCu);
  }

}

@end
