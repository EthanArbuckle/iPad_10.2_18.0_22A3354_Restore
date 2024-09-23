@implementation SVXSynthesisManager

- (SVXSynthesisManager)initWithPerformer:(id)a3 remoteDelegateSupplier:(id)a4
{
  id v7;
  id v8;
  SVXSynthesisManager *v9;
  SVXSynthesisManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSynthesisManager;
  v9 = -[SVXSynthesisManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_performer, a3);
    objc_storeStrong((id *)&v10->_remoteDelegateSupplier, a4);
  }

  return v10;
}

- (SVXSynthesisManager)initWithModule:(id)a3
{
  void *v4;
  SVXClientServiceRemoteDelegateSupplier *v5;
  SVXSynthesisManager *v6;

  objc_msgSend(a3, "performer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(SVXClientServiceRemoteDelegateSupplier);
  v6 = -[SVXSynthesisManager initWithPerformer:remoteDelegateSupplier:](self, "initWithPerformer:remoteDelegateSupplier:", v4, v5);

  return v6;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  SVXSpeechSynthesizer *v5;
  SVXSpeechSynthesizer *speechSynthesizer;

  objc_msgSend(a3, "speechSynthesizer");
  v5 = (SVXSpeechSynthesizer *)objc_claimAutoreleasedReturnValue();
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = v5;

}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  SVXSpeechSynthesizer *speechSynthesizer;

  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = 0;

}

- (void)synthesizeRequest:(id)a3 xpcConnection:(id)a4 handlerUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  SVXSpeechSynthesizer *speechSynthesizer;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SVXSynthesisManager *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SVXSynthesisManager *v28;
  id v29;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[SVXSynthesisManager _createGroup](self, "_createGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  speechSynthesizer = self->_speechSynthesizer;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke;
  v25[3] = &unk_24D24D840;
  v26 = v11;
  v27 = v14;
  v28 = self;
  v29 = v10;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_8;
  v21[3] = &unk_24D24D868;
  v22 = v27;
  v23 = self;
  v24 = v12;
  v17 = v12;
  v18 = v27;
  v19 = v10;
  v20 = v11;
  -[SVXSpeechSynthesizer synthesizeRequest:audioChunkHandler:taskTracker:analyticsContext:completion:](speechSynthesizer, "synthesizeRequest:audioChunkHandler:taskTracker:analyticsContext:completion:", v13, v25, 0, 0, v21);

}

- (id)_createGroup
{
  return dispatch_group_create();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_remoteDelegateSupplier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "audioChunkIndex");
  objc_msgSend(v3, "audioChunkData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
      v26 = 2112;
      v27 = v6;
      v28 = 2048;
      v29 = v4;
      v30 = 2112;
      v31 = v5;
      _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@, audioChunkIndex = %tu, audioChunkData = %@", buf, 0x2Au);
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v8 = objc_alloc(MEMORY[0x24BE09290]);
    v9 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_2;
    v22[3] = &unk_24D24D7F0;
    v23 = *(id *)(a1 + 40);
    v10 = (void *)objc_msgSend(v8, "initWithBlock:", v22);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v13 = *(void **)(v11 + 8);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_2;
    v16[3] = &unk_24D24D818;
    v16[4] = v11;
    v17 = v12;
    v18 = v10;
    v19 = *(id *)(a1 + 32);
    v20 = v5;
    v21 = v4;
    v14 = v10;
    objc_msgSend(v13, "performBlock:", v16);

  }
  else if (!v4)
  {
    v15 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
      _os_log_debug_impl(&dword_214934000, v15, OS_LOG_TYPE_DEBUG, "%s Not sending audio chunks to client because the handler UUID is nil.", buf, 0xCu);
    }
  }

}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_8(_QWORD *a1, void *a2)
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x24BE08FB0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s result = %@", buf, 0x16u);
  }
  if (a1[4])
  {
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
      _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s Waiting for pending audio chunks to be sent to the client and acknowledged by the client...", buf, 0xCu);
    }
    v7 = (void *)a1[6];
    v8 = *(void **)(a1[5] + 8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_9;
    v10[3] = &unk_24D24EF28;
    v12 = v7;
    v11 = v3;
    objc_msgSend(v8, "performBlock:afterGroup:", v10, a1[4]);

  }
  else
  {
    v9 = a1[6];
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }

}

uint64_t __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
    _os_log_debug_impl(&dword_214934000, v2, OS_LOG_TYPE_DEBUG, "%s Finished waiting for pending audio chunks to be sent to the client and acknowledged by the client.", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_3;
  v11[3] = &unk_24D24DCC8;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v4, "remoteServiceDelegateWithConnection:errorHandler:", v2, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_4;
  v9[3] = &unk_24D24EAA8;
  v8 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "handleSpeechSynthesisSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:reply:", v8, v6, v7, v9);

}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", -4);

}

uint64_t __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
    v8 = 1024;
    v9 = a2;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s handled = %d", (uint8_t *)&v6, 0x12u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", 0);
}

@end
