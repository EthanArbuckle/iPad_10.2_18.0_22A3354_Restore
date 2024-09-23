@implementation TUMomentsController

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_13);
  return (id)sharedInstance_sharedInstance_0;
}

void __37__TUMomentsController_sharedInstance__block_invoke()
{
  TUMomentsController *v0;
  void *v1;

  v0 = objc_alloc_init(TUMomentsController);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (TUMomentsController)init
{
  TUMomentsControllerXPCClient *v3;
  TUMomentsController *v4;

  v3 = objc_alloc_init(TUMomentsControllerXPCClient);
  v4 = -[TUMomentsController initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (TUMomentsController)initWithDataSource:(id)a3
{
  return -[TUMomentsController initWithDataSource:queue:](self, "initWithDataSource:queue:", a3, MEMORY[0x1E0C80D38]);
}

- (TUMomentsController)initWithQueue:(id)a3
{
  id v4;
  TUMomentsControllerXPCClient *v5;
  TUMomentsController *v6;

  v4 = a3;
  v5 = objc_alloc_init(TUMomentsControllerXPCClient);
  v6 = -[TUMomentsController initWithDataSource:queue:](self, "initWithDataSource:queue:", v5, v4);

  return v6;
}

- (TUMomentsController)initWithDataSource:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  TUMomentsController *v9;
  TUMomentsController *v10;
  uint64_t v11;
  NSHashTable *delegates;
  uint64_t v13;
  NSMutableDictionary *capabilitiesByVideoStreamToken;
  uint64_t v15;
  NSMutableDictionary *providerByVideoStreamToken;
  id lockdownModeEnabled;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TUMomentsController;
  v9 = -[TUMomentsController init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_dataSource, a3);
    -[TUMomentsControllerDataSource setDelegate:](v10->_dataSource, "setDelegate:", v10);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    capabilitiesByVideoStreamToken = v10->_capabilitiesByVideoStreamToken;
    v10->_capabilitiesByVideoStreamToken = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    providerByVideoStreamToken = v10->_providerByVideoStreamToken;
    v10->_providerByVideoStreamToken = (NSMutableDictionary *)v15;

    lockdownModeEnabled = v10->_lockdownModeEnabled;
    v10->_lockdownModeEnabled = &__block_literal_global_12;

  }
  return v10;
}

uint64_t __48__TUMomentsController_initWithDataSource_queue___block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  const __CFString *v2;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = TULockdownModeEnabled();
  TUDefaultLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = CFSTR("NO");
    if ((_DWORD)v0)
      v2 = CFSTR("YES");
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v1, OS_LOG_TYPE_DEFAULT, "Determined lockdownModeEnabled: %@", (uint8_t *)&v4, 0xCu);
  }

  return v0;
}

- (void)dealloc
{
  objc_super v3;

  -[TUMomentsControllerDataSource invalidate](self->_dataSource, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUMomentsController;
  -[TUMomentsController dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__TUMomentsController_addDelegate___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__TUMomentsController_addDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUMomentsController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__TUMomentsController_removeDelegate___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__TUMomentsController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  id *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  -[TUMomentsController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Prewarming audio client for video message", buf, 2u);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[TUMomentsController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke;
    v14[3] = &unk_1E38A1FE8;
    v10 = &v15;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v9, "prewarmAudioClientWithCompletion:", v14);

LABEL_7:
    goto LABEL_8;
  }
  if (v4)
  {
    -[TUMomentsController queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_3;
    block[3] = &unk_1E38A2010;
    v10 = &v13;
    v13 = v4;
    dispatch_async(v11, block);

    goto LABEL_7;
  }
LABEL_8:

}

void __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  id *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUMomentsController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v4;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Starting video message with mediaType: %d", buf, 8u);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[TUMomentsController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke;
    v16[3] = &unk_1E38A2060;
    v12 = &v17;
    v16[4] = self;
    v17 = v6;
    objc_msgSend(v11, "startRecordingMessageWithMediaType:completion:", v4, v16);

LABEL_7:
    goto LABEL_8;
  }
  if (v6)
  {
    -[TUMomentsController queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_3;
    block[3] = &unk_1E38A2010;
    v12 = &v15;
    v15 = v6;
    dispatch_async(v13, block);

    goto LABEL_7;
  }
LABEL_8:

}

void __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_2;
    block[3] = &unk_1E38A2038;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  id *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Ending video message for UUID: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TUMomentsController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke;
    v17[3] = &unk_1E38A1FE8;
    v13 = &v18;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v12, "endRecordingMessageWithUUID:completion:", v6, v17);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[TUMomentsController queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_3;
    block[3] = &unk_1E38A2010;
    v13 = &v16;
    v16 = v7;
    dispatch_async(v14, block);

    goto LABEL_7;
  }
LABEL_8:

}

void __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  id *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Discarding video message for UUID: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TUMomentsController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke;
    v17[3] = &unk_1E38A1FE8;
    v13 = &v18;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v12, "discardVideoMessageWithUUID:completion:", v6, v17);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[TUMomentsController queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_3;
    block[3] = &unk_1E38A2010;
    v13 = &v16;
    v16 = v7;
    dispatch_async(v14, block);

    goto LABEL_7;
  }
LABEL_8:

}

void __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Sending video message with request: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke;
  v12[3] = &unk_1E38A1FE8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "sendVideoMessageWithRequest:completion:", v6, v12);

}

void __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Saving video message with UUID: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke;
  v12[3] = &unk_1E38A1FE8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "saveVideoMessageWithUUID:completion:", v6, v12);

}

void __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Resetting video messaging", buf, 2u);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke;
  v12[3] = &unk_1E38A1FE8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "resetVideoMessagingWithSessionUUID:completion:", v7, v12);

}

void __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)startMediaRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Starting media request %@", (uint8_t *)&v11, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startMediaRequest:completion:", v6, v7);

}

- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Ending media request with UUID %@", (uint8_t *)&v11, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endMediaRequestWithUUID:completion:", v6, v7);

}

- (void)startRequestWithMediaType:(int)a3 forProvider:(id)a4 requesteeID:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v8 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUMomentsController.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider != nil"));

  }
  -[TUMomentsController queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  TUDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v27 = v8;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "mediaType: %d, provider: %@ participant: %@", buf, 0x1Cu);
  }

  objc_msgSend(v11, "remoteIDSDestinations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[TUMomentsController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v11, "streamToken");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke;
  v24[3] = &unk_1E38A2088;
  v24[4] = self;
  v25 = v13;
  v22 = v13;
  objc_msgSend(v20, "startRequestWithMediaType:forStreamToken:requesteeID:destinationID:completion:", v8, v21, v12, v18, v24);

}

void __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke_2;
    block[3] = &unk_1E38A2038;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)endRequestWithTransactionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUMomentsController.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionID != nil"));

  }
  -[TUMomentsController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "transactionID: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke;
  v14[3] = &unk_1E38A1FE8;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "endRequestWithTransactionID:completion:", v7, v14);

}

void __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)registerProvider:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUMomentsController.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider != nil"));

  }
  -[TUMomentsController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "streamToken");
  objc_msgSend(v7, "requesterID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteIDSDestinations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isRemoteMomentsAvailable");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__TUMomentsController_registerProvider_completion___block_invoke;
  v19[3] = &unk_1E38A20D8;
  v19[4] = self;
  v20 = v7;
  v21 = v8;
  v16 = v8;
  v17 = v7;
  objc_msgSend(v11, "registerStreamToken:requesterID:remoteIDSDestinations:remoteMomentsAvailable:completion:", v12, v13, v14, v15, v19);

}

void __51__TUMomentsController_registerProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "registered, capabilities: %@, error: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TUMomentsController_registerProvider_completion___block_invoke_40;
  block[3] = &unk_1E38A20B0;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v15 = v5;
  v16 = v9;
  v17 = v10;
  v11 = *(id *)(a1 + 48);
  v18 = v6;
  v19 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __51__TUMomentsController_registerProvider_completion___block_invoke_40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "capabilitiesByVideoStreamToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "streamToken"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "providerByVideoStreamToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "streamToken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 56));
  return result;
}

- (void)unregisterProvider:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUMomentsController.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider != nil"));

  }
  -[TUMomentsController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  -[TUMomentsController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "streamToken");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__TUMomentsController_unregisterProvider_completion___block_invoke;
  v16[3] = &unk_1E38A2128;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v11, "unregisterStreamToken:completion:", v12, v16);

}

void __53__TUMomentsController_unregisterProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__TUMomentsController_unregisterProvider_completion___block_invoke_2;
  v8[3] = &unk_1E38A2100;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, v8);

}

uint64_t __53__TUMomentsController_unregisterProvider_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "capabilitiesByVideoStreamToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);

  objc_msgSend(*(id *)(a1 + 32), "providerByVideoStreamToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (id)capabilitiesForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TUMomentsCapabilities *v10;
  uint64_t (**v11)(void);
  char v12;
  uint64_t v13;
  TUMomentsCapabilities *v14;
  void *v15;

  v4 = a3;
  -[TUMomentsController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUMomentsController capabilitiesByVideoStreamToken](self, "capabilitiesByVideoStreamToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "streamToken");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (TUMomentsCapabilities *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isFaceTimePhotosRestricted") & 1) != 0
      || (-[TUMomentsController lockdownModeEnabled](self, "lockdownModeEnabled"),
          v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          v12 = v11[2](),
          v11,
          (v12 & 1) != 0))
    {
      v13 = 2;
    }
    else
    {
      v13 = objc_msgSend((id)objc_opt_class(), "isFaceTimePhotosEnabled") ^ 1;
    }
    v14 = [TUMomentsCapabilities alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TUMomentsCapabilities initWithAvailability:supportedMediaTypes:](v14, "initWithAvailability:supportedMediaTypes:", v13, v15);

  }
  return v10;
}

+ (BOOL)isFaceTimePhotosEnabledByDefault
{
  return MGGetBoolAnswer() ^ 1;
}

+ (id)faceTimePhotosEnabledDeterminer
{
  if (faceTimePhotosEnabledDeterminer_onceToken != -1)
    dispatch_once(&faceTimePhotosEnabledDeterminer_onceToken, &__block_literal_global_47_0);
  return _Block_copy((const void *)sharedFaceTimePhotosEnabledDeterminer);
}

void __54__TUMomentsController_faceTimePhotosEnabledDeterminer__block_invoke()
{
  if (!sharedFaceTimePhotosEnabledDeterminer)
  {
    sharedFaceTimePhotosEnabledDeterminer = (uint64_t)&__block_literal_global_48_0;

  }
}

uint64_t __54__TUMomentsController_faceTimePhotosEnabledDeterminer__block_invoke_2()
{
  void *v1;
  uint64_t v2;

  if (+[TUMomentsController isFaceTimePhotosRestricted](TUMomentsController, "isFaceTimePhotosRestricted"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("FaceTimePhotosEnabled"));

  return v2;
}

+ (void)setFaceTimePhotosEnabledDeterminer:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = (void *)sharedFaceTimePhotosEnabledDeterminer;
  sharedFaceTimePhotosEnabledDeterminer = (uint64_t)v3;

}

+ (BOOL)isFaceTimePhotosEnabled
{
  uint64_t (**v3)(void);
  char v4;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TUMomentsController_isFaceTimePhotosEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isFaceTimePhotosEnabled_hasRegisteredDefaults != -1)
    dispatch_once(&isFaceTimePhotosEnabled_hasRegisteredDefaults, block);
  objc_msgSend(a1, "faceTimePhotosEnabledDeterminer");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v4 = v3[2]();

  return v4;
}

void __46__TUMomentsController_isFaceTimePhotosEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("FaceTimePhotosEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFaceTimePhotosEnabledByDefault"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v4);

}

+ (BOOL)isInternalInstall
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__TUMomentsController_isInternalInstall__block_invoke;
  block[3] = &unk_1E38A1710;
  block[4] = &v5;
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__TUMomentsController_isInternalInstall__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isInternalInstall");
    v2 = v3;
  }

}

+ (BOOL)isFaceTimePhotosXPCServiceEnabled
{
  TUFeatureFlags *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = objc_alloc_init(TUFeatureFlags);
  v3 = -[TUFeatureFlags livePhotoXPCServiceEnabled](v2, "livePhotoXPCServiceEnabled");
  if (v3)
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Determined that Live Photo moments XPC Service should be enabled", v6, 2u);
    }

  }
  return v3;
}

+ (void)setFaceTimePhotosEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("FaceTimePhotosEnabled"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

}

+ (BOOL)isFaceTimePhotosRestricted
{
  return 0;
}

- (void)dataSource:(id)a3 didUpdateCapabilities:(id)a4 forVideoStreamToken:(int64_t)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  TUMomentsController *v12;
  int64_t v13;

  v7 = a4;
  -[TUMomentsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TUMomentsController_dataSource_didUpdateCapabilities_forVideoStreamToken___block_invoke;
  block[3] = &unk_1E38A2150;
  v12 = self;
  v13 = a5;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

void __76__TUMomentsController_dataSource_didUpdateCapabilities_forVideoStreamToken___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v28 = v3;
    v29 = 2048;
    v30 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "capabilities: %@ token: %ld", buf, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "capabilitiesByVideoStreamToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "delegates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v13 = *(void **)(a1 + 40);
          v21 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v13, "providerByVideoStreamToken");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
          v15 = v9;
          v16 = v10;
          v17 = a1;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "momentsController:didUpdateCapabilities:forProvider:", v13, v21, v19);

          a1 = v17;
          v10 = v16;
          v9 = v15;

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

- (void)dataSource:(id)a3 willCaptureRemoteRequestFromRequesterID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUMomentsController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__TUMomentsController_dataSource_willCaptureRemoteRequestFromRequesterID___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __74__TUMomentsController_dataSource_willCaptureRemoteRequestFromRequesterID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "momentsController:willCaptureRemoteRequestFromIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (void)dataSource:(id)a3 didReceiveLocallyRequestedMomentDescriptor:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUMomentsController *v10;

  v5 = a4;
  -[TUMomentsController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__TUMomentsController_dataSource_didReceiveLocallyRequestedMomentDescriptor___block_invoke;
  v8[3] = &unk_1E38A1388;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __77__TUMomentsController_dataSource_didReceiveLocallyRequestedMomentDescriptor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "momentDescriptor: %@", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "delegates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "momentsController:didReceiveLocallyRequestedMomentDescriptor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)dataSource:(id)a3 requestSandboxExtensionForURL:(id)a4 reply:(id)a5
{
  void (**v8)(id, TUSandboxExtendedURL *, _QWORD);
  void *v9;
  int v10;
  TUSandboxExtendedURL *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v8 = (void (**)(id, TUSandboxExtendedURL *, _QWORD))a5;
  objc_msgSend(a3, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.FTLivePhotoService"));

  if (v10)
  {
    v11 = -[TUSandboxExtendedURL initWithURL:]([TUSandboxExtendedURL alloc], "initWithURL:", v14);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80008]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUSandboxExtendedURL setSandboxExtensionClass:](v11, "setSandboxExtensionClass:", v12);

    -[TUMomentsController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUSandboxExtendedURL setPid:](v11, "setPid:", objc_msgSend(v13, "processIdentifier"));

    v8[2](v8, v11, 0);
  }
  else
  {
    v8[2](v8, 0, 0);
  }

}

- (void)serverDiedForDataSource:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[TUMomentsController queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TUMomentsController_serverDiedForDataSource___block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v4, block);

}

void __47__TUMomentsController_serverDiedForDataSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  TUMomentsCapabilities *v23;
  void *v24;
  TUMomentsCapabilities *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[TUMomentsController serverDiedForDataSource:]_block_invoke";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "%s: ", buf, 0xCu);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "momentsControllerServerDied:", *(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v5);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "providerByVideoStreamToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v28 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v29 = v11;
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "providerByVideoStreamToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "providerByVideoStreamToken");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v12);

        objc_msgSend(*(id *)(a1 + 32), "capabilitiesByVideoStreamToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v12);

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "delegates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v21);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v23 = [TUMomentsCapabilities alloc];
                objc_msgSend(MEMORY[0x1E0C99E60], "set");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = -[TUMomentsCapabilities initWithAvailability:supportedMediaTypes:](v23, "initWithAvailability:supportedMediaTypes:", 0, v24);

                objc_msgSend(v22, "momentsController:didUpdateCapabilities:forProvider:", *(_QWORD *)(a1 + 32), v25, v14);
              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v19);
        }

        v11 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v28);
  }

}

- (void)dataSource:(id)a3 didFinishProcessingRawVideoMessage:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUMomentsController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__TUMomentsController_dataSource_didFinishProcessingRawVideoMessage___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __69__TUMomentsController_dataSource_didFinishProcessingRawVideoMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "momentsController:didFinishProcessingRawVideoMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)dataSource:(id)a3 didFinishRecordingMedia:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Finished recording media", buf, 2u);
  }

  -[TUMomentsController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__TUMomentsController_dataSource_didFinishRecordingMedia___block_invoke;
  v9[3] = &unk_1E38A1388;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

void __58__TUMomentsController_dataSource_didFinishRecordingMedia___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "momentsController:didFinishRecordingMedia:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)dataSource:(id)a3 didReceiveMessageRecordingError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUMomentsController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__TUMomentsController_dataSource_didReceiveMessageRecordingError___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __66__TUMomentsController_dataSource_didReceiveMessageRecordingError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "momentsController:didReceiveMessageRecordingError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)dataSource:(id)a3 didReceiveMediaRecordingError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUMomentsController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__TUMomentsController_dataSource_didReceiveMediaRecordingError___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __64__TUMomentsController_dataSource_didReceiveMediaRecordingError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "momentsController:didReceiveMediaRecordingError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUMomentsControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableDictionary)capabilitiesByVideoStreamToken
{
  return self->_capabilitiesByVideoStreamToken;
}

- (NSMutableDictionary)providerByVideoStreamToken
{
  return self->_providerByVideoStreamToken;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (id)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lockdownModeEnabled, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_providerByVideoStreamToken, 0);
  objc_storeStrong((id *)&self->_capabilitiesByVideoStreamToken, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
