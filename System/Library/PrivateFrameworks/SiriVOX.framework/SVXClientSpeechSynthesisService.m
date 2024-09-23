@implementation SVXClientSpeechSynthesisService

- (void)handleSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  SVXPerforming *performer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  performer = self->_performer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __110__SVXClientSpeechSynthesisService_handleSynthesizedBufferForHandlerUUID_audioChunkData_audioChunkIndex_reply___block_invoke;
  v17[3] = &unk_24D24DB00;
  v17[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v17);

}

- (SVXClientSpeechSynthesisService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8;
  id v9;
  SVXClientSpeechSynthesisService *v10;
  SVXClientSpeechSynthesisService *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientSpeechSynthesisService;
  v10 = -[SVXClientSpeechSynthesisService init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)prewarmRequest:(id)a3
{
  id v4;
  SVXClientServiceProviding *clientServiceProvider;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SVXClientSpeechSynthesisService_prewarmRequest___block_invoke;
  v7[3] = &unk_24D24D360;
  v8 = v4;
  v6 = v4;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v7, &__block_literal_global_4607);

}

- (void)synthesizeRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SVXClientServiceProviding *clientServiceProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SVXClientSpeechSynthesisService *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke;
  v14[3] = &unk_24D24CEC0;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_4;
  v12[3] = &unk_24D24DCA0;
  v13 = v17;
  v10 = v17;
  v11 = v6;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v14, v12);

}

- (void)synthesizeRequest:(id)a3 audioChunkHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  SVXPerforming *performer;
  uint64_t v13;
  id v14;
  id v15;
  SVXClientServiceProviding *clientServiceProvider;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  SVXClientSpeechSynthesisService *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDD1880]);
  performer = self->_performer;
  v13 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke;
  v28[3] = &unk_24D24EED8;
  v28[4] = self;
  v30 = v9;
  v14 = v11;
  v29 = v14;
  v15 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v28);
  clientServiceProvider = self->_clientServiceProvider;
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_2;
  v23[3] = &unk_24D24CC48;
  v24 = v8;
  v25 = v14;
  v26 = self;
  v27 = v10;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_6;
  v20[3] = &unk_24D24DF48;
  v20[4] = self;
  v21 = v25;
  v22 = v27;
  v17 = v27;
  v18 = v25;
  v19 = v8;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v23, v20);

}

- (void)enqueueRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SVXClientServiceProviding *clientServiceProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SVXClientSpeechSynthesisService *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke;
  v14[3] = &unk_24D24CEC0;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_4;
  v12[3] = &unk_24D24DCA0;
  v13 = v17;
  v10 = v17;
  v11 = v6;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v14, v12);

}

- (void)cancelPendingRequest:(id)a3
{
  id v4;
  SVXClientServiceProviding *clientServiceProvider;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SVXClientSpeechSynthesisService_cancelPendingRequest___block_invoke;
  v7[3] = &unk_24D24D360;
  v8 = v4;
  v6 = v4;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v7, &__block_literal_global_6);

}

- (void)stopRequest:(id)a3
{
  id v4;
  SVXClientServiceProviding *clientServiceProvider;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SVXClientSpeechSynthesisService_stopRequest___block_invoke;
  v7[3] = &unk_24D24D360;
  v8 = v4;
  v6 = v4;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v7, &__block_literal_global_7);

}

- (void)_addAudioChunkHandler:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *audioChunkHandlersByUUID;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (!self->_audioChunkHandlersByUUID)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      audioChunkHandlersByUUID = self->_audioChunkHandlersByUUID;
      self->_audioChunkHandlersByUUID = v9;

    }
    v11 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "-[SVXClientSpeechSynthesisService _addAudioChunkHandler:forUUID:]";
      v16 = 2112;
      v17 = v8;
      _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@", (uint8_t *)&v14, 0x16u);
    }
    v12 = self->_audioChunkHandlersByUUID;
    v13 = (void *)MEMORY[0x2199D950C](v6);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v8);

  }
}

- (void)_removeAudioChunkHandlerForUUID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[SVXClientSpeechSynthesisService _removeAudioChunkHandlerForUUID:]";
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@", (uint8_t *)&v6, 0x16u);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_audioChunkHandlersByUUID, "removeObjectForKey:", v4);

}

- (BOOL)_handleSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5
{
  id v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315906;
    v19 = "-[SVXClientSpeechSynthesisService _handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:]";
    v20 = 2112;
    v21 = v8;
    v22 = 2048;
    v23 = a5;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@, audioChunkIndex = %tu, audioChunkData = %@", (uint8_t *)&v18, 0x2Au);
    if (v8)
      goto LABEL_3;
  }
  else if (v8)
  {
LABEL_3:
    -[NSMutableDictionary objectForKey:](self->_audioChunkHandlersByUUID, "objectForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = v12 != 0;
    if (v12)
    {
      (*(void (**)(uint64_t, id, unint64_t))(v12 + 16))(v12, v9, a5);
    }
    else
    {
      v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v18 = 136315138;
        v19 = "-[SVXClientSpeechSynthesisService _handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:]";
        _os_log_error_impl(&dword_214934000, v15, OS_LOG_TYPE_ERROR, "%s Audio chunk handler is nil.", (uint8_t *)&v18, 0xCu);
      }
    }

    goto LABEL_12;
  }
  v16 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    v18 = 136315138;
    v19 = "-[SVXClientSpeechSynthesisService _handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:]";
    _os_log_error_impl(&dword_214934000, v16, OS_LOG_TYPE_ERROR, "%s Audio chunk handler UUID is nil.", (uint8_t *)&v18, 0xCu);
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioChunkHandlersByUUID, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

uint64_t __47__SVXClientSpeechSynthesisService_stopRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopSpeechSynthesisRequest:", *(_QWORD *)(a1 + 32));
}

void __47__SVXClientSpeechSynthesisService_stopRequest___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientSpeechSynthesisService stopRequest:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __56__SVXClientSpeechSynthesisService_cancelPendingRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelPendingSpeechSynthesisRequest:", *(_QWORD *)(a1 + 32));
}

void __56__SVXClientSpeechSynthesisService_cancelPendingRequest___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientSpeechSynthesisService cancelPendingRequest:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_2;
  v6[3] = &unk_24D24CC20;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "enqueueSpeechSynthesisRequest:completion:", v4, v6);

}

void __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  SVXSpeechSynthesisResult *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[SVXClientSpeechSynthesisService enqueueRequest:completion:]_block_invoke_4";
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", 4, 0, v3);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);

  }
}

void __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_3;
    v6[3] = &unk_24D24EF28;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAudioChunkHandler:forUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_3;
  v7[3] = &unk_24D24D868;
  v6 = *(int8x16_t *)(a1 + 40);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(a2, "synthesizeRequest:handlerUUID:completion:", v4, v5, v7);

}

void __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SVXSpeechSynthesisResult *v9;
  SVXSpeechSynthesisResult *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXClientSpeechSynthesisService synthesizeRequest:audioChunkHandler:completion:]_block_invoke_6";
    v19 = 2112;
    v20 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = *(void **)(v5 + 8);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_5;
  v14 = &unk_24D24F018;
  v15 = v5;
  v16 = v6;
  objc_msgSend(v7, "performBlock:", &v11);
  v8 = a1[6];
  if (v8)
  {
    v9 = [SVXSpeechSynthesisResult alloc];
    v10 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:](v9, "initWithType:utteranceInfo:error:", 4, 0, v3, v11, v12, v13, v14, v15);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v8 + 16))(v8, v10);

  }
}

uint64_t __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAudioChunkHandlerForUUID:", *(_QWORD *)(a1 + 40));
}

{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = *(void **)(v5 + 8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_4;
  v13[3] = &unk_24D24F018;
  v13[4] = v5;
  v14 = v6;
  objc_msgSend(v7, "performBlock:", v13);
  v8 = (void *)a1[6];
  if (v8)
  {
    v9 = *(void **)(a1[4] + 8);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_5;
    v10[3] = &unk_24D24EF28;
    v12 = v8;
    v11 = v3;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

uint64_t __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAudioChunkHandlerForUUID:", *(_QWORD *)(a1 + 40));
}

void __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_2;
  v6[3] = &unk_24D24CC20;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "synthesizeRequest:handlerUUID:completion:", v4, 0, v6);

}

void __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  SVXSpeechSynthesisResult *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[SVXClientSpeechSynthesisService synthesizeRequest:completion:]_block_invoke_4";
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", 4, 0, v3);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);

  }
}

void __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_3;
    v6[3] = &unk_24D24EF28;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __50__SVXClientSpeechSynthesisService_prewarmRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prewarmRequest:", *(_QWORD *)(a1 + 32));
}

void __50__SVXClientSpeechSynthesisService_prewarmRequest___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientSpeechSynthesisService prewarmRequest:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __110__SVXClientSpeechSynthesisService_handleSynthesizedBufferForHandlerUUID_audioChunkData_audioChunkIndex_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

@end
