@implementation SVXClientDeviceService

- (SVXClientDeviceService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8;
  id v9;
  SVXClientDeviceService *v10;
  SVXClientDeviceService *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientDeviceService;
  v10 = -[SVXClientDeviceService init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)clientServiceDidChange:(BOOL)a3
{
  SVXPerforming *performer;
  _QWORD v4[5];
  BOOL v5;

  performer = self->_performer;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SVXClientDeviceService_clientServiceDidChange___block_invoke;
  v4[3] = &unk_24D24DDE0;
  v5 = a3;
  v4[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v4);
}

- (void)prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientDeviceService prepareForSetupWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)beginSetupWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientDeviceService beginSetupWithContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SVXClientDeviceService_beginSetupWithContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)endSetup
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientDeviceService endSetup]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SVXClientDeviceService_endSetup__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)_prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SVXClientServiceProviding *clientServiceProvider;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v9 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke;
  v15[3] = &unk_24D24DAD8;
  v16 = v6;
  v17 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_4;
  v13[3] = &unk_24D24DCA0;
  v14 = v17;
  v11 = v17;
  v12 = v6;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v15, v13);

}

- (void)_beginSetupWithContext:(id)a3
{
  SVXDeviceSetupContext *v4;
  SVXDeviceSetupContext *currentSetupContext;

  v4 = (SVXDeviceSetupContext *)objc_msgSend(a3, "copy");
  currentSetupContext = self->_currentSetupContext;
  self->_currentSetupContext = v4;

  -[SVXClientDeviceService _updateSetupContext](self, "_updateSetupContext");
}

- (void)_endSetup
{
  SVXDeviceSetupContext *currentSetupContext;

  currentSetupContext = self->_currentSetupContext;
  self->_currentSetupContext = 0;

  -[SVXClientDeviceService _updateSetupContext](self, "_updateSetupContext");
}

- (void)_updateSetupContext
{
  NSObject *v3;
  SVXDeviceSetupContext *currentSetupContext;
  SVXDeviceSetupContext *v5;
  SVXClientServiceProviding *clientServiceProvider;
  SVXDeviceSetupContext *v7;
  _QWORD v8[4];
  SVXDeviceSetupContext *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SVXDeviceSetupContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    currentSetupContext = self->_currentSetupContext;
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientDeviceService _updateSetupContext]";
    v12 = 2112;
    v13 = currentSetupContext;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s _currentSetupContext = %@", buf, 0x16u);
  }
  v5 = self->_currentSetupContext;
  clientServiceProvider = self->_clientServiceProvider;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SVXClientDeviceService__updateSetupContext__block_invoke;
  v8[3] = &unk_24D24D360;
  v9 = v5;
  v7 = v5;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v8, &__block_literal_global_5267);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSetupContext, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

uint64_t __45__SVXClientDeviceService__updateSetupContext__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceSetupContext:", *(_QWORD *)(a1 + 32));
}

void __45__SVXClientDeviceService__updateSetupContext__block_invoke_2(uint64_t a1, void *a2)
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
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientDeviceService _updateSetupContext]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_2;
  v4[3] = &unk_24D24EBE0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "prepareForDeviceSetupWithContext:completion:", v3, v4);

}

void __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]_block_invoke_2";
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s flow = %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

uint64_t __34__SVXClientDeviceService_endSetup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSetup");
}

uint64_t __48__SVXClientDeviceService_beginSetupWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginSetupWithContext:", *(_QWORD *)(a1 + 40));
}

void __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_2;
  v5[3] = &unk_24D24CE08;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_prepareForSetupWithContext:completion:", v3, v5);

}

void __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_3;
    v9[3] = &unk_24D24EED8;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "performBlock:", v9);

  }
}

uint64_t __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __49__SVXClientDeviceService_clientServiceDidChange___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_updateSetupContext");
  return result;
}

@end
