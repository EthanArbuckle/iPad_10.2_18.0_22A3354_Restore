@implementation SCDAAdvertisementContextManager

- (SCDAAdvertisementContextManager)initWithQueue:(id)a3
{
  id v5;
  SCDAAdvertisementContextManager *v6;
  SCDAAdvertisementContextManager *v7;
  SCDAAdvertisementContextManager *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SCDAAdvertisementContextManager;
    v6 = -[SCDAAdvertisementContextManager init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_queue, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_settingsConnection
{
  AFSettingsConnection *settingsConnection;
  AFSettingsConnection *v4;
  AFSettingsConnection *v5;

  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    v4 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    -[AFSettingsConnection setXPCConnectionManagementQueue:](self->_settingsConnection, "setXPCConnectionManagementQueue:", self->_queue);
    settingsConnection = self->_settingsConnection;
  }
  return settingsConnection;
}

- (void)_resetSettingsConnection
{
  AFSettingsConnection *settingsConnection;

  settingsConnection = self->_settingsConnection;
  if (settingsConnection)
  {
    self->_settingsConnection = 0;

  }
}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SCDAAdvertisementContextManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__SCDAAdvertisementContextManager_pushSCDAAdvertisementContext_completionHandler___block_invoke;
  block[3] = &unk_25174ACF0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__SCDAAdvertisementContextManager_triggerABCForType_subType_context___block_invoke;
  v15[3] = &unk_25174A2D8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)reset
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SCDAAdvertisementContextManager reset]";
    _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SCDAAdvertisementContextManager_reset__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

uint64_t __40__SCDAAdvertisementContextManager_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSettingsConnection");
}

void __69__SCDAAdvertisementContextManager_triggerABCForType_subType_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_settingsConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerABCForType:subType:context:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &__block_literal_global_1200);

}

void __69__SCDAAdvertisementContextManager_triggerABCForType_subType_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[SCDAAdvertisementContextManager triggerABCForType:subType:context:]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_246211000, v3, OS_LOG_TYPE_ERROR, "%s #scda triggerABCForSubType failed: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void __82__SCDAAdvertisementContextManager_pushSCDAAdvertisementContext_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v9 = "-[SCDAAdvertisementContextManager pushSCDAAdvertisementContext:completionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #myriad Pushing Myriad advertisement context %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_settingsConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__SCDAAdvertisementContextManager_pushSCDAAdvertisementContext_completionHandler___block_invoke_1;
  v6[3] = &unk_25174A270;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "pushSCDAAdvertisementContext:completionHandler:", v5, v6);

}

void __82__SCDAAdvertisementContextManager_pushSCDAAdvertisementContext_completionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __82__SCDAAdvertisementContextManager_pushSCDAAdvertisementContext_completionHandler___block_invoke_2;
    v10[3] = &unk_25174A248;
    v6 = v7;
    v11 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v5);

}

void __82__SCDAAdvertisementContextManager_pushSCDAAdvertisementContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SCDAAdvertisementContextRecord *v6;
  SCDAAdvertisementContextRecord *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  SCDAAdvertisementContextRecord *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "performSelector:", sel_scdaAdvertisementContext);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[SCDAAdvertisementContextRecord initWithMyriadAdvertisementContextRecordData:]([SCDAAdvertisementContextRecord alloc], "initWithMyriadAdvertisementContextRecordData:", v5);
      v7 = v6;
      if (v6)
      {
        -[SCDAAdvertisementContextRecord deviceID](v6, "deviceID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);
        }
        else
        {
          v9 = (id)SCDALogContextCore;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v3, "info");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (!v10)
            {
              objc_msgSend(v4, "deviceInfo");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v12 = 136315650;
            v13 = "-[SCDAAdvertisementContextManager pushSCDAAdvertisementContext:completionHandler:]_block_invoke_2";
            v14 = 2112;
            v15 = v7;
            v16 = 2112;
            v17 = v11;
            _os_log_error_impl(&dword_246211000, v9, OS_LOG_TYPE_ERROR, "%s #scda Dropped %@ from %@ because there's no device ID.", (uint8_t *)&v12, 0x20u);
            if (!v10)

          }
        }

      }
    }

  }
}

@end
