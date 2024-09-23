@implementation SVXClientKeepAliveService

- (void)connectWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXClientKeepAliveService connectWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Connecting...", buf, 0xCu);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (SVXClientKeepAliveService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8;
  id v9;
  SVXClientKeepAliveService *v10;
  SVXClientKeepAliveService *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientKeepAliveService;
  v10 = -[SVXClientKeepAliveService init](&v13, sel_init);
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
  v4[2] = __52__SVXClientKeepAliveService_clientServiceDidChange___block_invoke;
  v4[3] = &unk_24D24DDE0;
  v5 = a3;
  v4[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v4);
}

- (void)_connectWithRetryCount:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  SVXClientServiceProviding *clientServiceProvider;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SVXClientKeepAliveService _connectWithRetryCount:completion:]";
    v20 = 2048;
    v21 = a3;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s retryCount = %tu", buf, 0x16u);
  }
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke;
  v15[3] = &unk_24D24CFC8;
  v16 = v6;
  v17 = a3;
  v15[4] = self;
  v9 = v6;
  v10 = (void *)MEMORY[0x2199D950C](v15);
  clientServiceProvider = self->_clientServiceProvider;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_2;
  v13[3] = &unk_24D24D908;
  v14 = v10;
  v12 = v10;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v13, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SVXClientKeepAliveService _connectWithRetryCount:completion:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s error = %@", buf, 0x16u);
  }
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = *(void **)(v5 + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_3;
  v9[3] = &unk_24D24DD40;
  v9[1] = 3221225472;
  v13 = a1[6];
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v8 = v3;
  objc_msgSend(v7, "performBlock:", v9);

}

uint64_t __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pingWithReply:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    v1 = *(_QWORD *)(a1 + 56);
    if (v1)
      return objc_msgSend(*(id *)(a1 + 40), "_connectWithRetryCount:completion:", v1 - 1, *(_QWORD *)(a1 + 48));
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__SVXClientKeepAliveService_clientServiceDidChange___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "connectWithCompletion:", 0);
  return result;
}

void __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke_2;
  v2[3] = &unk_24D24DCA0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_connectWithRetryCount:completion:", 5, v2);

}

void __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SVXClientKeepAliveService connectWithCompletion:]_block_invoke_2";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s Failed to connect due to error %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SVXClientKeepAliveService connectWithCompletion:]_block_invoke";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Connected.", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

@end
