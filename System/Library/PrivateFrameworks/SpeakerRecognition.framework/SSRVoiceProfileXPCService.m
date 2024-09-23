@implementation SSRVoiceProfileXPCService

- (SSRVoiceProfileXPCService)init
{
  SSRVoiceProfileXPCService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSRVoiceProfileXPCService;
  v2 = -[SSRVoiceProfileXPCService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SSRVoiceProfileXPCService Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4 completion:(id)a5
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
  v15[2] = __94__SSRVoiceProfileXPCService_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke;
  v15[3] = &unk_24CC86358;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (id)_createXPCClientConnectionIfNeeded:(id)a3
{
  id v4;
  SSRVoiceProfileXPCClient *v5;
  SSRVoiceProfileXPCClient *xpcClient;
  SSRVoiceProfileXPCClient *v7;
  SSRVoiceProfileXPCClient *v8;
  SSRVoiceProfileXPCClient *v9;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (SSRVoiceProfileXPCClient *)v4;
LABEL_6:
    v9 = v5;
    goto LABEL_7;
  }
  xpcClient = self->_xpcClient;
  if (xpcClient
    || (v7 = objc_alloc_init(SSRVoiceProfileXPCClient),
        v8 = self->_xpcClient,
        self->_xpcClient = v7,
        v8,
        -[SSRVoiceProfileXPCClient setDelegate:](self->_xpcClient, "setDelegate:", self),
        -[SSRVoiceProfileXPCClient connect](self->_xpcClient, "connect"),
        (xpcClient = self->_xpcClient) != 0))
  {
    v5 = xpcClient;
    goto LABEL_6;
  }
  v11 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "-[SSRVoiceProfileXPCService _createXPCClientConnectionIfNeeded:]";
    _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s voiceProfileXPC client doesn't exist", (uint8_t *)&v12, 0xCu);
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (void)ssrVoiceProfileXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SSRVoiceProfileXPCService_ssrVoiceProfileXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_teardownXPCClientIfNeeded
{
  SSRVoiceProfileXPCClient *xpcClient;
  NSObject *v4;
  SSRVoiceProfileXPCClient *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SSRVoiceProfileXPCService _teardownXPCClientIfNeeded]";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
      xpcClient = self->_xpcClient;
    }
    -[SSRVoiceProfileXPCClient setDelegate:](xpcClient, "setDelegate:", 0);
    v5 = self->_xpcClient;
    self->_xpcClient = 0;

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SSRVoiceProfileXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __68__SSRVoiceProfileXPCService_ssrVoiceProfileXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SSRVoiceProfileXPCService ssrVoiceProfileXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s reset xpcClient since it disconnected", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_teardownXPCClientIfNeeded");
}

void __94__SSRVoiceProfileXPCService_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SSRVoiceProfileXPCService fetchEnrollmentStatusForSiriProfileId:forLanguageCode:completion:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createXPCClientConnectionIfNeeded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchEnrollmentStatusForSiriProfileId:forLanguageCode:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_5293);
  return (id)sharedService_sharedInstance;
}

void __42__SSRVoiceProfileXPCService_sharedService__block_invoke()
{
  SSRVoiceProfileXPCService *v0;
  void *v1;

  v0 = objc_alloc_init(SSRVoiceProfileXPCService);
  v1 = (void *)sharedService_sharedInstance;
  sharedService_sharedInstance = (uint64_t)v0;

}

@end
