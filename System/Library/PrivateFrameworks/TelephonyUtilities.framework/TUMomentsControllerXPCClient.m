@implementation TUMomentsControllerXPCClient

+ (TUMomentsControllerXPCServer)asynchronousServer
{
  return (TUMomentsControllerXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_7);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_7, a3);
}

+ (TUMomentsControllerXPCServer)synchronousServer
{
  return (TUMomentsControllerXPCServer *)objc_loadWeakRetained(&sSynchronousServer_7);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_7, a3);
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[TUMomentsControllerXPCClient xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)processBundleIdentifier
{
  void *v2;
  void *v3;

  -[TUMomentsControllerXPCClient xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)processName
{
  void *v2;
  void *v3;

  -[TUMomentsControllerXPCClient xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TUMomentsControllerXPCClient)init
{
  TUMomentsControllerXPCClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  NSObject *v9;
  _QWORD block[4];
  TUMomentsControllerXPCClient *v12;
  _QWORD handler[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUMomentsControllerXPCClient;
  v2 = -[TUMomentsControllerXPCClient init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.telephonyutilities.momentscontrollerxpcclient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    v6 = v2->_queue;
    v7 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __36__TUMomentsControllerXPCClient_init__block_invoke;
    handler[3] = &unk_1E38A1698;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", &v2->_token, v6, handler);
    WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);
    objc_msgSend(WeakRetained, "registerClient:", v2);

    v9 = v2->_queue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __36__TUMomentsControllerXPCClient_init__block_invoke_3;
    block[3] = &unk_1E38A1360;
    v12 = v2;
    dispatch_async(v9, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __36__TUMomentsControllerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "_registerConnection");
  }

}

uint64_t __36__TUMomentsControllerXPCClient_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerConnection");
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUMomentsControllerXPCClient;
  -[TUMomentsControllerXPCClient dealloc](&v3, sel_dealloc);
}

- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke;
  v19[3] = &unk_1E38A42B8;
  v22 = v14;
  v23 = a3;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v24 = a6;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  dispatch_async(v15, v19);

}

void __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerStreamToken:requesterID:remoteIDSDestinations:remoteMomentsAvailable:reply:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));

}

void __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterStreamToken:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke;
  block[3] = &unk_1E38A34D8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterStreamToken:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  int v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke;
  v19[3] = &unk_1E38A42E0;
  v24 = a3;
  v22 = v14;
  v23 = a4;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  dispatch_async(v15, v19);

}

void __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRequestWithMediaType:forStreamToken:requesteeID:destinationID:reply:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endRequestWithTransactionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endRequestWithTransactionID:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[TUMomentsControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TUMomentsControllerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __42__TUMomentsControllerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);
  objc_msgSend(WeakRetained, "unregisterClient:", *(_QWORD *)(a1 + 32));

}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prewarmAudioClientWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke;
  block[3] = &unk_1E38A17E8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRecordingMessageWithMediaType:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endRecordingMessageWithUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discardVideoMessageWithUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendVideoMessageWithRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveVideoMessageWithUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetVideoMessagingWithSessionUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startMediaRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startMediaRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endMediaRequestWithUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerConnection
{
  NSObject *v3;
  id v4;

  -[TUMomentsControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUMomentsControllerXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", &__block_literal_global_56);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerXPCClientWithReply:", &__block_literal_global_9_2);

}

void __51__TUMomentsControllerXPCClient__registerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __51__TUMomentsControllerXPCClient__registerConnection__block_invoke_cold_1();

}

void __51__TUMomentsControllerXPCClient__registerConnection__block_invoke_8()
{
  NSObject *v0;
  uint8_t v1[16];

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "Registered moments connection", v1, 2u);
  }

}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[TUMomentsControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.FTLivePhotoService"));
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    +[TUMomentsControllerXPCClient momentsControllerServerXPCInterface](TUMomentsControllerXPCClient, "momentsControllerServerXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v7);

    +[TUMomentsControllerXPCClient momentsControllerClientXPCInterface](TUMomentsControllerXPCClient, "momentsControllerClientXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke;
    v13[3] = &unk_1E38A13D0;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v13);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_11;
    v11[3] = &unk_1E38A13D0;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v11);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Moments XPC connection invalidated (client side)", v6, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverDiedForDataSource:", *(_QWORD *)(a1 + 32));

}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2_12;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2_12(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Moments XPC connection interrupted (client side)", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverDiedForDataSource:", *(_QWORD *)(a1 + 32));

}

- (id)serverWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUMomentsControllerXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_7);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUMomentsControllerXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)didUpdateCapabilities:(id)a3 forVideoStreamToken:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TUMomentsControllerXPCClient_didUpdateCapabilities_forVideoStreamToken___block_invoke;
  block[3] = &unk_1E38A2150;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __74__TUMomentsControllerXPCClient_didUpdateCapabilities_forVideoStreamToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didUpdateCapabilities:forVideoStreamToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)willCaptureRemoteRequestFromRequesterID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TUMomentsControllerXPCClient_willCaptureRemoteRequestFromRequesterID___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__TUMomentsControllerXPCClient_willCaptureRemoteRequestFromRequesterID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:willCaptureRemoteRequestFromRequesterID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didReceiveLocallyRequestedMomentDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__TUMomentsControllerXPCClient_didReceiveLocallyRequestedMomentDescriptor___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __75__TUMomentsControllerXPCClient_didReceiveLocallyRequestedMomentDescriptor___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didReceiveLocallyRequestedMomentDescriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestSandboxExtensionForURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__TUMomentsControllerXPCClient_requestSandboxExtensionForURL_reply___block_invoke;
  block[3] = &unk_1E38A3068;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__TUMomentsControllerXPCClient_requestSandboxExtensionForURL_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:requestSandboxExtensionForURL:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didFinishProcessingRawVideoMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__TUMomentsControllerXPCClient_didFinishProcessingRawVideoMessage___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__TUMomentsControllerXPCClient_didFinishProcessingRawVideoMessage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didFinishProcessingRawVideoMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didFinishRecordingMedia:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__TUMomentsControllerXPCClient_didFinishRecordingMedia___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__TUMomentsControllerXPCClient_didFinishRecordingMedia___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didFinishRecordingMedia:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didReceiveMessageRecordingError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__TUMomentsControllerXPCClient_didReceiveMessageRecordingError___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__TUMomentsControllerXPCClient_didReceiveMessageRecordingError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didReceiveMessageRecordingError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didReceiveMediaRecordingError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__TUMomentsControllerXPCClient_didReceiveMediaRecordingError___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__TUMomentsControllerXPCClient_didReceiveMediaRecordingError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didReceiveMediaRecordingError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (NSXPCInterface)momentsControllerClientXPCInterface
{
  if (momentsControllerClientXPCInterface_onceToken != -1)
    dispatch_once(&momentsControllerClientXPCInterface_onceToken, &__block_literal_global_13_1);
  return (NSXPCInterface *)(id)momentsControllerClientXPCInterface_momentsControllerClientXPCInterface;
}

void __67__TUMomentsControllerXPCClient_momentsControllerClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3D30D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)momentsControllerClientXPCInterface_momentsControllerClientXPCInterface;
  momentsControllerClientXPCInterface_momentsControllerClientXPCInterface = v0;

}

+ (NSXPCInterface)momentsControllerServerXPCInterface
{
  if (momentsControllerServerXPCInterface_onceToken != -1)
    dispatch_once(&momentsControllerServerXPCInterface_onceToken, &__block_literal_global_74_1);
  return (NSXPCInterface *)(id)momentsControllerServerXPCInterface_momentsControllerServerXPCInterface;
}

void __67__TUMomentsControllerXPCClient_momentsControllerServerXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E7280);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)momentsControllerServerXPCInterface_momentsControllerServerXPCInterface;
  momentsControllerServerXPCInterface_momentsControllerServerXPCInterface = v0;

  v2 = (void *)momentsControllerServerXPCInterface_momentsControllerServerXPCInterface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4, v6, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sendVideoMessageWithRequest_completion_, 0, 0);

}

- (TUMomentsControllerDataSourceDelegate)delegate
{
  return (TUMomentsControllerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error registering stream token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error unregistering stream token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error starting request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error ending request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error prewarming audio client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error starting recording video message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error ending recording video message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error discarding video message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error sending video message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error saving video message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error resetting video messaging: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error Starting media request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TUMomentsControllerXPCClient__registerConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error registering moments connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
