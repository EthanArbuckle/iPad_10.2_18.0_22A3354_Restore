@implementation TUNeighborhoodActivityConduitXPCClient

- (TUNeighborhoodActivityConduitXPCClient)init
{
  TUNeighborhoodActivityConduitXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUNeighborhoodActivityConduitXPCClient;
  v2 = -[TUNeighborhoodActivityConduitXPCClient init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.telephonyservices.neighborhoodactivityconduitxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = v2->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke;
    v7[3] = &unk_1E38A1698;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("NeighborhoodActivityConduitClientsShouldConnectNotification", &v2->_token, v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  TUConduitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConduitXPCClient: NeighborhoodActivityConduit restarted and requested re-connection", v14, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TUConduitLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (WeakRetained[4])
    {
      objc_msgSend(v12, "connectionEstablishedForClient:", WeakRetained);
    }
    else
    {
      objc_msgSend(WeakRetained, "xpcConnection");

    }
  }

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating TUNeighborhoodActivityConduitXPCClient", buf, 2u);
  }

  notify_cancel(self->_token);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)TUNeighborhoodActivityConduitXPCClient;
  -[TUNeighborhoodActivityConduitXPCClient dealloc](&v4, sel_dealloc);
}

- (void)ensureConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
  {
    TUConduitLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u))
      __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke_cold_1(v2);

  }
}

- (void)nearbyTVDevicesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nearbyTVDevicesWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activeSplitSessionTVDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSplitSessionTVDeviceWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestedTVDeviceName:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)suggestionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)inviteTVDevice:(id)a3 toConversationWithUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke;
  v15[3] = &unk_1E38A3108;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E38A2128;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inviteTVDevice:toConversation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)disconnectTVDevice:(id)a3 completion:(id)a4
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke;
  block[3] = &unk_1E38A3068;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2;
  v7 = &unk_1E38A30E0;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disconnectTVDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, v5, v6, v7);

}

void __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke;
  block[3] = &unk_1E38A3068;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2;
  v7 = &unk_1E38A30E0;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "respondToSuggestionWithResult:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, v5, v6, v7);

}

void __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)registerApprovalClientEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  TUConduitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)buf = 136315138;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Sending approval registration: %s", buf, 0xCu);
  }

  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke;
  v8[3] = &unk_1E38A19E0;
  v8[4] = self;
  v9 = v3;
  dispatch_async(v7, v8);

}

void __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serverWithErrorHandler:", &__block_literal_global_37);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerSplitSessionApprovalEnabled:", *(unsigned __int8 *)(a1 + 40));

}

void __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUConduitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke_2_cold_1();

}

- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke;
  v15[3] = &unk_1E38A3108;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2;
  v4[3] = &unk_1E38A2128;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handoffConversation:toTVDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke;
  v15[3] = &unk_1E38A3108;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2;
  v4[3] = &unk_1E38A2128;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pullConversation:fromTVDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke;
  v15[3] = &unk_1E38A2100;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2;
  v7 = &unk_1E38A30E0;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serverWithErrorHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startConversationWith:on:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v4, v5, v6, v7);

}

void __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)tvDeviceAppeared:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__TUNeighborhoodActivityConduitXPCClient_tvDeviceAppeared___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__TUNeighborhoodActivityConduitXPCClient_tvDeviceAppeared___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvDeviceAppeared:", *(_QWORD *)(a1 + 40));

}

- (void)tvDeviceDisappeared:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__TUNeighborhoodActivityConduitXPCClient_tvDeviceDisappeared___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__TUNeighborhoodActivityConduitXPCClient_tvDeviceDisappeared___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvDeviceDisappeared:", *(_QWORD *)(a1 + 40));

}

- (void)splitSessionStarted:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__TUNeighborhoodActivityConduitXPCClient_splitSessionStarted___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__TUNeighborhoodActivityConduitXPCClient_splitSessionStarted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "splitSessionStarted:", *(_QWORD *)(a1 + 40));

}

- (void)splitSessionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TUNeighborhoodActivityConduitXPCClient_splitSessionEnded___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__TUNeighborhoodActivityConduitXPCClient_splitSessionEnded___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "splitSessionEnded:", *(_QWORD *)(a1 + 40));

}

- (void)suggestionUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TUNeighborhoodActivityConduitXPCClient_suggestionUpdated___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__TUNeighborhoodActivityConduitXPCClient_suggestionUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionUpdated:", *(_QWORD *)(a1 + 40));

}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceChanged___block_invoke;
  v6[3] = &unk_1E38A19E0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __91__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isRingingFaceTimeCallsOnConnectedTVDeviceChanged:", *(unsigned __int8 *)(a1 + 40));

}

- (void)approveSplitSessionForConversation:(id)a3 requestedFromDevice:(id)a4 pullContext:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__TUNeighborhoodActivityConduitXPCClient_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion___block_invoke;
  block[3] = &unk_1E38A3500;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __120__TUNeighborhoodActivityConduitXPCClient_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "approveSplitSessionForConversation:device:pullContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)cancelSplitSessionApproval
{
  NSObject *v3;
  _QWORD block[5];

  -[TUNeighborhoodActivityConduitXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__TUNeighborhoodActivityConduitXPCClient_cancelSplitSessionApproval__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __68__TUNeighborhoodActivityConduitXPCClient_cancelSplitSessionApproval__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelSplitSessionApproval");

}

- (NSXPCConnection)xpcConnection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSXPCConnection *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  if (+[TUNeighborhoodActivityConduit isConduitAvailable](TUNeighborhoodActivityConduit, "isConduitAvailable"))
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:options:", CFSTR("com.apple.NeighborhoodActivityConduitService"), 0);
      v5 = self->_xpcConnection;
      self->_xpcConnection = v4;

      objc_msgSend((id)objc_opt_class(), "neighborhoodActivityServerXPCInterface");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

      objc_msgSend((id)objc_opt_class(), "neighborhoodActivityClientXPCInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v7);

      -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
      objc_initWeak(&location, self);
      v8 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke;
      v22[3] = &unk_1E38A13D0;
      objc_copyWeak(&v23, &location);
      -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v22);
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_11;
      v20[3] = &unk_1E38A13D0;
      objc_copyWeak(&v21, &location);
      -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v20);
      -[NSXPCConnection resume](self->_xpcConnection, "resume");
      -[TUNeighborhoodActivityConduitXPCClient delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "connectionEstablishedForClient:", self);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      xpcConnection = self->_xpcConnection;
    }
    v10 = xpcConnection;
  }
  else
  {
    TUConduitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[TUNeighborhoodActivityConduitXPCClient xpcConnection].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }
  return v10;
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke(uint64_t a1)
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
    block[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TUConduitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v6 = 136446210;
    Name = class_getName(v3);
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: XPC connection invalidated", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_11(uint64_t a1)
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
    block[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2_12;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2_12(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const char *Name;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TUConduitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v7 = 136446210;
    Name = class_getName(v3);
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: XPC connection interrupted", (uint8_t *)&v7, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionLostForClient:", *(_QWORD *)(a1 + 32));

}

- (id)server
{
  void *v2;
  void *v3;

  -[TUNeighborhoodActivityConduitXPCClient xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)serverWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[TUNeighborhoodActivityConduitXPCClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TUMakeNeighborhoodConduitError(4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

    v7 = 0;
  }

  return v7;
}

+ (id)allowedXPCClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v15, "setWithObjects:", v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

+ (NSXPCInterface)neighborhoodActivityClientXPCInterface
{
  if (neighborhoodActivityClientXPCInterface_onceToken != -1)
    dispatch_once(&neighborhoodActivityClientXPCInterface_onceToken, &__block_literal_global_26);
  return (NSXPCInterface *)(id)neighborhoodActivityClientXPCInterface_interface;
}

void __80__TUNeighborhoodActivityConduitXPCClient_neighborhoodActivityClientXPCInterface__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3C5CE8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)neighborhoodActivityClientXPCInterface_interface;
  neighborhoodActivityClientXPCInterface_interface = v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_tvDeviceAppeared_, 0, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_tvDeviceDisappeared_, 0, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_splitSessionStarted_, 0, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_splitSessionEnded_, 0, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_suggestionUpdated_, 0, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion_, 1, 0);
  objc_msgSend((id)neighborhoodActivityClientXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion_, 1, 1);

}

+ (NSXPCInterface)neighborhoodActivityServerXPCInterface
{
  if (neighborhoodActivityServerXPCInterface_onceToken != -1)
    dispatch_once(&neighborhoodActivityServerXPCInterface_onceToken, &__block_literal_global_94);
  return (NSXPCInterface *)(id)neighborhoodActivityServerXPCInterface_interface;
}

void __80__TUNeighborhoodActivityConduitXPCClient_neighborhoodActivityServerXPCInterface__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E7100);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)neighborhoodActivityServerXPCInterface_interface;
  neighborhoodActivityServerXPCInterface_interface = v19;

  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_nearbyTVDevicesWithCompletion_, 0, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_nearbyTVDevicesWithCompletion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_activeSplitSessionTVDeviceWithCompletion_, 0, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_activeSplitSessionTVDeviceWithCompletion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_suggestionWithCompletion_, 0, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_suggestionWithCompletion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setSuggestedTVDeviceName_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setSuggestedTVDeviceName_completion_, 0, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_setSuggestedTVDeviceName_completion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_inviteTVDevice_toConversation_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_inviteTVDevice_toConversation_completion_, 1, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_inviteTVDevice_toConversation_completion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_disconnectTVDevice_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_disconnectTVDevice_completion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_respondToSuggestionWithResult_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_respondToSuggestionWithResult_completion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_handoffConversation_toTVDevice_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_handoffConversation_toTVDevice_completion_, 1, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_handoffConversation_toTVDevice_completion_, 1, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_pullConversation_fromTVDevice_completion_, 0, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_pullConversation_fromTVDevice_completion_, 1, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_pullConversation_fromTVDevice_completion_, 1, 1);
  v21 = (void *)neighborhoodActivityServerXPCInterface_interface;
  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_startConversationWith_on_completion_, 0, 0);

  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_pullConversation_fromTVDevice_completion_, 1, 0);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_pullConversation_fromTVDevice_completion_, 0, 1);
  objc_msgSend((id)neighborhoodActivityServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_pullConversation_fromTVDevice_completion_, 1, 1);

}

- (TUNeighborhoodActivityConduitXPCClientDelegate)delegate
{
  return (TUNeighborhoodActivityConduitXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, a1, a3, "TUConduitXPCClient: informing delegate of connection restart", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A50D000, log, (os_log_type_t)0x90u, "TUConduit XPC connection is nil after prompting!", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_19A50D000, v0, v1, "Error fetching nearby TVs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_19A50D000, v0, v1, "Error fetching active split session TV: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_19A50D000, v0, v1, "Error setting suggested TV name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_6(&dword_19A50D000, v0, v1, "Error fetching suggested TV: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_1(&dword_19A50D000, v0, v1, "Error inviting TV %@ to conversation %@: %@");
  OUTLINED_FUNCTION_9();
}

void __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_2(&dword_19A50D000, v0, v1, "Error disconnecting TV %@: %@");
  OUTLINED_FUNCTION_1();
}

void __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_2(&dword_19A50D000, v0, v1, "Error responding to suggestion with result %@: %@");
  OUTLINED_FUNCTION_1();
}

void __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_19A50D000, v0, OS_LOG_TYPE_ERROR, "Error registering as approval handler: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_1(&dword_19A50D000, v0, v1, "Error handing off conversation %@ to TV %@: %@");
  OUTLINED_FUNCTION_9();
}

void __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_1(&dword_19A50D000, v0, v1, "Error pulling conversation %@ from TV %@: %@");
  OUTLINED_FUNCTION_9();
}

void __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_2(&dword_19A50D000, v0, v1, "Error starting conversation on %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)xpcConnection
{
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, a1, a3, "TUNeighborhoodActivityConduitXPCClient connection requested while conduit is disabled (runtime).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
