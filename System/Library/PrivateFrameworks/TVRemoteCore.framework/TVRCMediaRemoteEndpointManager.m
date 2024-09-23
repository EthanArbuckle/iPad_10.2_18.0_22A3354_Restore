@implementation TVRCMediaRemoteEndpointManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  return (id)sharedInstance_sharedInstance_1;
}

void __48__TVRCMediaRemoteEndpointManager_sharedInstance__block_invoke()
{
  TVRCMediaRemoteEndpointManager *v0;
  void *v1;

  v0 = objc_alloc_init(TVRCMediaRemoteEndpointManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (TVRCMediaRemoteEndpointManager)init
{
  TVRCMediaRemoteEndpointManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mediaRemoteQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRCMediaRemoteEndpointManager;
  v2 = -[TVRCMediaRemoteEndpointManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TVRemoteCore.mediaremote", 0);
    mediaRemoteQueue = v2->_mediaRemoteQueue;
    v2->_mediaRemoteQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)updateActiveEndpoint:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[TVRCMediaRemoteEndpointManager mediaRemoteQueue](self, "mediaRemoteQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v9 = v6;
  v10 = v7;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke(id *a1, int a2)
{
  void *v3;
  const __CFString **v4;
  uint64_t *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
  {
    if (!a1[7])
      return;
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("Skipping MediaRemote endpoint update because MRPlaybackState is MRPlaybackStatePlaying");
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = (const __CFString **)v20;
    v5 = &v19;
    goto LABEL_12;
  }
  _TVRCMediaRemoteLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Requesting MediaRemote to update active endpoint to %@", buf, 0xCu);
  }

  if (objc_msgSend(a1[4], "length"))
  {
    objc_msgSend(a1[6], "mediaRemoteQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[4];
    v13 = a1[5];
    v14 = a1[7];
    MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason();

    v9 = v12;
LABEL_13:

    return;
  }
  _TVRCMediaRemoteLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_cold_1(v10);

  if (a1[7])
  {
    v15 = *MEMORY[0x24BDD0FC8];
    v16 = CFSTR("Requested MediaRemote to update endpoint with an invalid UID");
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = &v16;
    v5 = &v15;
LABEL_12:
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TVRCMakeError(200, (uint64_t)v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_13;
  }
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCMediaRemoteLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_6_cold_1((uint64_t)a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v9 = 138412546;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason completion with reason=MRMediaRemoteActiveEndpointOperationActivate, endpointUID=%@, reason=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = a1[6];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)fetchActiveEndpointWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t buf[16];

  v4 = a3;
  _TVRCMediaRemoteLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Fetching active endpoint from MediaRemote", buf, 2u);
  }

  -[TVRCMediaRemoteEndpointManager mediaRemoteQueue](self, "mediaRemoteQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v7 = v4;
  MRAVEndpointGetActiveSystemEndpointUID();

}

void __68__TVRCMediaRemoteEndpointManager_fetchActiveEndpointWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCMediaRemoteLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "MRAVEndpointGetActiveSystemEndpointUID returned %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (OS_dispatch_queue)mediaRemoteQueue
{
  return self->_mediaRemoteQueue;
}

- (void)setMediaRemoteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteQueue, 0);
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = CFSTR("Requested MediaRemote to update endpoint with an invalid UID");
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason completion with reason=MRMediaRemoteActiveEndpointOperationActivate, endpointUID=%@, reason=%{public}@, error=%{public}@", (uint8_t *)&v5, 0x20u);
}

@end
