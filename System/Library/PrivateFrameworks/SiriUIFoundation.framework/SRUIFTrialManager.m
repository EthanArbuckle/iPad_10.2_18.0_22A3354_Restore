@implementation SRUIFTrialManager

- (SRUIFTrialManager)initWithNamespace:(id)a3
{
  return -[SRUIFTrialManager initWithNamespace:projectId:](self, "initWithNamespace:projectId:", a3, 135);
}

- (SRUIFTrialManager)initWithNamespace:(id)a3 projectId:(int)a4
{
  id v7;
  SRUIFTrialManager *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRUIFTrialManager;
  v8 = -[SRUIFTrialManager init](&v12, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("SRUIFTrialManager", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_trialNamespaceName, a3);
    v8->_trialProjectId = a4;
    -[SRUIFTrialManager _initializeTrialClient](v8, "_initializeTrialClient");
  }

  return v8;
}

- (void)_initializeTrialClient
{
  NSObject *queue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SRUIFTrialManager__initializeTrialClient__block_invoke;
  block[3] = &unk_24DC1A838;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__SRUIFTrialManager__initializeTrialClient__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WeakRetained[2];
    WeakRetained[2] = v3;

    if (!WeakRetained[2])
    {
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[SRUIFTrialManager _initializeTrialClient]_block_invoke";
        _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #trial client initializations returned nil.", (uint8_t *)&v6, 0xCu);
      }
    }
  }

}

- (id)_levelForFactor:(id)a3
{
  id v4;
  TRIClient *trialClient;
  void *v6;

  v4 = a3;
  -[SRUIFTrialManager _refreshTreatments](self, "_refreshTreatments");
  trialClient = self->_trialClient;
  if (trialClient)
  {
    -[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v4, self->_trialNamespaceName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)BOOLValueForFactor:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke;
  v11[3] = &unk_24DC1A860;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_levelForFactor:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BE08FB0];
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = v3[3];
        v8 = v5;
        v9 = objc_msgSend(v4, "BOOLeanValue");
        v10 = "FALSE";
        *(_DWORD *)v12 = 136315906;
        *(_QWORD *)&v12[4] = "-[SRUIFTrialManager BOOLValueForFactor:withCompletionHandler:]_block_invoke";
        *(_QWORD *)&v12[14] = v6;
        *(_WORD *)&v12[12] = 2112;
        if (v9)
          v10 = "TRUE";
        *(_WORD *)&v12[22] = 2112;
        v13 = v7;
        v14 = 2080;
        v15 = v10;
        _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s #trial Trial factor %@ found with namespace %@, value: %s", v12, 0x2Au);

      }
      (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(v4, "BOOLeanValue", *(_OWORD *)v12, *(_QWORD *)&v12[16]));
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v3, v5);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.Trial"), 0, &unk_24DC26598);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (void)BOOLValueForFactor:(id)a3 defaultValueIfNoFactorsFilePresent:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__SRUIFTrialManager_BOOLValueForFactor_defaultValueIfNoFactorsFilePresent_withCompletionHandler___block_invoke;
  block[3] = &unk_24DC1B820;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __97__SRUIFTrialManager_BOOLValueForFactor_defaultValueIfNoFactorsFilePresent_withCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_levelForFactor:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BE08FB0];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = v3[3];
        v9 = v5;
        v10 = objc_msgSend(v4, "BOOLeanValue");
        v11 = "FALSE";
        *(_DWORD *)v14 = 136315906;
        *(_QWORD *)&v14[4] = "-[SRUIFTrialManager BOOLValueForFactor:defaultValueIfNoFactorsFilePresent:withCompletionHan"
                             "dler:]_block_invoke";
        *(_QWORD *)&v14[14] = v7;
        *(_WORD *)&v14[12] = 2112;
        if (v10)
          v11 = "TRUE";
        *(_WORD *)&v14[22] = 2112;
        v15 = v8;
        v16 = 2080;
        v17 = v11;
        _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #trial Trial factor %@ found with namespace %@, value: %s", v14, 0x2Au);

      }
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v4, "BOOLeanValue", *(_OWORD *)v14, *(_QWORD *)&v14[16]));
    }
    else
    {
      if (v6)
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = v3[3];
        *(_DWORD *)v14 = 136315650;
        *(_QWORD *)&v14[4] = "-[SRUIFTrialManager BOOLValueForFactor:defaultValueIfNoFactorsFilePresent:withCompletionHan"
                             "dler:]_block_invoke";
        *(_WORD *)&v14[12] = 2112;
        *(_QWORD *)&v14[14] = v12;
        *(_WORD *)&v14[22] = 2112;
        v15 = v13;
        _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #trial Failed to read Trial factor %@ with namespace %@ and default_factors.pb file doesn't exist.", v14, 0x20u);
      }
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    }

  }
}

- (void)_refreshTreatments
{
  TRIClient *trialClient;

  trialClient = self->_trialClient;
  if (trialClient)
    -[TRIClient refresh](trialClient, "refresh");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

void __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 24);
  v5 = 136315650;
  v6 = "-[SRUIFTrialManager BOOLValueForFactor:withCompletionHandler:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s #trial Failed to read Trial factor %@ with namespace %@ and default_factors.pb file doesn't exist.", (uint8_t *)&v5, 0x20u);
}

@end
