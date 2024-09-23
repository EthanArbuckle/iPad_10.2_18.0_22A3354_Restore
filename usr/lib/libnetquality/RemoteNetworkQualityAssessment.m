@implementation RemoteNetworkQualityAssessment

- (RemoteNetworkQualityAssessment)initWithConfiguration:(id)a3
{
  RemoteNetworkQualityAssessment *v5;
  RemoteNetworkQualityAssessment *v6;
  NetworkQualityConfiguration *v7;
  NetworkQualityConfiguration *config;
  RemoteNetworkQualityAssessment *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  objc_super v13;

  if (objc_opt_class())
  {
    v13.receiver = self;
    v13.super_class = (Class)RemoteNetworkQualityAssessment;
    v5 = -[RemoteNetworkQualityAssessment init](&v13, sel_init);
    v6 = v5;
    if (v5)
    {
      if (a3)
      {
        v7 = objc_alloc_init(NetworkQualityConfiguration);
        config = v6->config;
        v6->config = v7;
      }
      else
      {
        config = v5->config;
        v5->config = 0;
      }

      v10 = dispatch_queue_create("com.apple.networkquality.rapport", 0);
      dispatchQueue = v6->dispatchQueue;
      v6->dispatchQueue = (OS_dispatch_queue *)v10;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)rapportDiscoveryCompletionWithClient:(id)a3 deviceName:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void (**completionHandler)(id, _QWORD, void *);
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a3, "activeDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          netqual_log_init();
          v19 = (void *)os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            objc_msgSend(v12, "identifier");
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = objc_msgSend(v27, "UTF8String");
            objc_msgSend(v12, "name");
            v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = objc_msgSend(v22, "UTF8String");
            objc_msgSend(v12, "model");
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v25 = objc_msgSend(v24, "UTF8String");
            *(_DWORD *)buf = 136316162;
            v38 = "-[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:]";
            v39 = 1024;
            v40 = 51;
            v41 = 2080;
            v42 = v21;
            v43 = 2080;
            v44 = v23;
            v45 = 2080;
            v46 = v25;
            _os_log_impl(&dword_20E622000, v20, OS_LOG_TYPE_DEFAULT, "%s:%u - Found ID=%s name=%s model=%s\n", buf, 0x30u);

          }
          v26 = objc_alloc_init(MEMORY[0x24BE7CBE8]);
          objc_msgSend(v26, "setDispatchQueue:", self->dispatchQueue);
          objc_msgSend(v26, "setDestinationDevice:", v12);
          objc_msgSend(v26, "setServiceType:", CFSTR("com.apple.networkquality.invoke"));
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __82__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName___block_invoke;
          v28[3] = &unk_24C9769E0;
          v28[4] = self;
          v29 = v26;
          v30 = v12;
          v17 = v26;
          objc_msgSend(v17, "activateWithCompletion:", v28);

          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to find the device %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:].cold.1();
  completionHandler = (void (**)(id, _QWORD, void *))self->completionHandler;
  v16 = (void *)MEMORY[0x24BDD1540];
  v35 = *MEMORY[0x24BDD0FC8];
  v36 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1009, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  completionHandler[2](completionHandler, 0, v18);

LABEL_15:
}

void __82__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    (*(void (**)(void))(v2[3] + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "rapportInvokeCompletionWithClient:deviceIdentifier:", v3, v4);

  }
}

- (void)rapportInvokeCompletionWithClient:(id)a3 deviceIdentifier:(id)a4
{
  id v6;
  id v7;
  NetworkQualityConfiguration *config;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  config = self->config;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", config, 1, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v10)
  {
    (*((void (**)(void))self->completionHandler + 2))();
  }
  else
  {
    v14 = CFSTR("config");
    v15[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke;
    v12[3] = &unk_24C976A08;
    v12[4] = self;
    objc_msgSend(v6, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.networkquality.invoke"), v11, v7, 0, v12);

  }
}

void __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[RemoteNetworkQualityAssessment rapportInvokeCompletionWithClient:deviceIdentifier:]_block_invoke";
    v24 = 1024;
    v25 = 93;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - inResponse: %@", buf, 0x1Cu);
  }
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("results"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v17[0] = objc_opt_class();
      v17[1] = objc_opt_class();
      v17[2] = objc_opt_class();
      v17[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;

      netqual_log_init();
      v11 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[RemoteNetworkQualityAssessment rapportInvokeCompletionWithClient:deviceIdentifier:]_block_invoke";
        v24 = 1024;
        v25 = 118;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_20E622000, v11, OS_LOG_TYPE_DEFAULT, "%s:%u - results: %@", buf, 0x1Cu);
      }
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();

    }
    else
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
        __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_2();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v15 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FC8];
      v19 = CFSTR("No response data available");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1010, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v6);
    }

  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_1();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v13 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("No response data available");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1010, v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v10);
  }

}

- (void)runAgainst:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id completionHandler;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x212BC1F98](a4);
  completionHandler = self->completionHandler;
  self->completionHandler = v7;

  v9 = objc_alloc_init(MEMORY[0x24BE7CBE8]);
  objc_msgSend(v9, "setDispatchQueue:", self->dispatchQueue);
  objc_msgSend(v9, "setServiceType:", CFSTR("com.apple.networkquality.query"));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__RemoteNetworkQualityAssessment_runAgainst_withCompletionHandler___block_invoke;
  v12[3] = &unk_24C9769E0;
  v12[4] = self;
  v13 = v9;
  v14 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v11, "activateWithCompletion:", v12);

}

uint64_t __67__RemoteNetworkQualityAssessment_runAgainst_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)a1[4];
  if (a2)
    return (*(uint64_t (**)(void))(v3[3] + 16))();
  else
    return objc_msgSend(v3, "rapportDiscoveryCompletionWithClient:deviceName:", a1[5], a1[6]);
}

- (void)rapportQueryCompletionWithClient:(id)a3 deviceIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_24C976A30;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.networkquality.query"), MEMORY[0x24BDBD1B8], a4, 0, v9);

}

void __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[3];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("results"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v3, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke_cold_1();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("No response data available");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1010, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v4);
  }

}

- (void)rapportDiscoveryCompletionWithClient:(id)a3 deviceName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  RemoteNetworkQualityAssessment *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(a3, "activeDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v8);

        if (v17)
        {
          netqual_log_init();
          v21 = (void *)os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v21;
            objc_msgSend(v15, "identifier");
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = objc_msgSend(v31, "UTF8String");
            objc_msgSend(v15, "name");
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v25 = v9;
            v26 = self;
            v27 = objc_msgSend(v24, "UTF8String");
            objc_msgSend(v15, "model");
            v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v29 = objc_msgSend(v28, "UTF8String");
            *(_DWORD *)buf = 136316162;
            v43 = "-[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:completionHandler:]";
            v44 = 1024;
            v45 = 198;
            v46 = 2080;
            v47 = v23;
            v48 = 2080;
            v49 = v27;
            self = v26;
            v9 = v25;
            v50 = 2080;
            v51 = v29;
            _os_log_impl(&dword_20E622000, v22, OS_LOG_TYPE_DEFAULT, "%s:%u - Found ID=%s name=%s model=%s\n", buf, 0x30u);

          }
          v30 = objc_alloc_init(MEMORY[0x24BE7CBE8]);
          objc_msgSend(v30, "setDispatchQueue:", self->dispatchQueue);
          objc_msgSend(v30, "setDestinationDevice:", v15);
          objc_msgSend(v30, "setServiceType:", CFSTR("com.apple.networkquality.query"));
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __100__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName_completionHandler___block_invoke;
          v32[3] = &unk_24C976A58;
          v32[4] = self;
          v33 = v30;
          v34 = v15;
          v35 = v9;
          v19 = v30;
          objc_msgSend(v19, "activateWithCompletion:", v32);

          v20 = v35;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to find the device %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:completionHandler:].cold.1();
  v18 = (void *)MEMORY[0x24BDD1540];
  v40 = *MEMORY[0x24BDD0FC8];
  v41 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1009, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v20);
LABEL_15:

}

void __100__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rapportQueryCompletionWithClient:deviceIdentifier:completionHandler:", v4, v5, *(_QWORD *)(a1 + 56));

  }
}

- (void)getAvailableServersForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE7CBE8]);
  objc_msgSend(v8, "setDispatchQueue:", self->dispatchQueue);
  objc_msgSend(v8, "setServiceType:", CFSTR("com.apple.networkquality.query"));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__RemoteNetworkQualityAssessment_getAvailableServersForDevice_withCompletionHandler___block_invoke;
  v12[3] = &unk_24C976A58;
  v12[4] = self;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v10, "activateWithCompletion:", v12);

}

uint64_t __85__RemoteNetworkQualityAssessment_getAvailableServersForDevice_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "rapportDiscoveryCompletionWithClient:deviceName:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->completionHandler, 0);
  objc_storeStrong((id *)&self->dispatchQueue, 0);
  objc_storeStrong((id *)&self->config, 0);
}

- (void)rapportDiscoveryCompletionWithClient:deviceName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - %@", v2, v3, v4, v5, 2u);
}

void __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - No 'results' object returned", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - No 'results' object found in response", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - No 'results' object returned", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)rapportDiscoveryCompletionWithClient:deviceName:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - %@", v2, v3, v4, v5, 2u);
}

@end
