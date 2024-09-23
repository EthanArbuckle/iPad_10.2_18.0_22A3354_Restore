@implementation TUNeighborhoodActivityConduit

- (TUNeighborhoodActivityConduit)initWithConversationManager:(id)a3
{
  id v5;
  TUNeighborhoodActivityConduit *v6;
  uint64_t v7;
  NSMutableSet *nearbyTVs;
  TUNeighborhoodActivityConduitXPCClient *v9;
  TUNeighborhoodActivityConduitXPCClient *xpcClient;
  uint64_t v11;
  NSMapTable *delegates;
  void *v13;
  TUNeighborhoodActivityConduit *v14;
  TUNeighborhoodActivityConduit *v16;
  id v17;
  id location;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUNeighborhoodActivityConduit;
  v6 = -[TUNeighborhoodActivityConduit init](&v19, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    nearbyTVs = v6->_nearbyTVs;
    v6->_nearbyTVs = (NSMutableSet *)v7;

    v9 = objc_alloc_init(TUNeighborhoodActivityConduitXPCClient);
    xpcClient = v6->_xpcClient;
    v6->_xpcClient = v9;

    -[TUNeighborhoodActivityConduitXPCClient setDelegate:](v6->_xpcClient, "setDelegate:", v6);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    delegates = v6->_delegates;
    v6->_delegates = (NSMapTable *)v11;

    objc_storeStrong((id *)&v6->_conversationManager, a3);
    -[TUNeighborhoodActivityConduitXPCClient ensureConnection](v6->_xpcClient, "ensureConnection");
    objc_initWeak(&location, v6);
    dispatch_get_global_queue(0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v17, &location);
    v16 = v6;
    v16->_stateHandle = os_state_add_handler();

    v14 = v16;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

char *__61__TUNeighborhoodActivityConduit_initWithConversationManager___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v2 = (void *)MEMORY[0x19AEC924C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(*(id *)(a1 + 32), "_osStateDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    if (!v6)
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __61__TUNeighborhoodActivityConduit_initWithConversationManager___block_invoke_2;
      v14 = &unk_1E38A1360;
      v15 = v7;
      dispatch_async(v8, &v11);

    }
  }
  else
  {
    v6 = 0;
  }
  v9 = (char *)malloc_type_malloc(objc_msgSend(v6, "length", v11, v12, v13, v14) + 200, 0x7AEE0EF5uLL);
  *(_DWORD *)v9 = 1;
  strcpy(v9 + 136, "TUNeighborhoodActivityConduit");
  *((_DWORD *)v9 + 1) = objc_msgSend(v6, "length");
  objc_msgSend(v6, "getBytes:length:", v9 + 200, objc_msgSend(v6, "length"));

  objc_autoreleasePoolPop(v2);
  return v9;
}

void __61__TUNeighborhoodActivityConduit_initWithConversationManager___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  TUConduitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__TUNeighborhoodActivityConduit_initWithConversationManager___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Deallocating TUNeighborhoodActivityConduit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (BOOL)isConduitAvailable
{
  if (isConduitAvailable_onceToken != -1)
    dispatch_once(&isConduitAvailable_onceToken, &__block_literal_global_19);
  return isConduitAvailable_sIsConduitAvailable;
}

void __51__TUNeighborhoodActivityConduit_isConduitAvailable__block_invoke()
{
  const void *v0;
  BOOL v1;

  v0 = (const void *)MGGetStringAnswer();
  v1 = CFEqual(v0, CFSTR("AudioAccessory")) == 0;
  CFRelease(v0);
  isConduitAvailable_sIsConduitAvailable = v1;
}

- (id)_osStateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TUNearbyDeviceHandle *activeSplitSessionTV;
  void *v8;
  TUNearbySuggestion *suggestion;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (_osStateDictionary_onceToken != -1)
    dispatch_once(&_osStateDictionary_onceToken, &__block_literal_global_125);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", _osStateDictionary___keyset);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableSet copy](self->_nearbyTVs, "copy");
  objc_msgSend(v4, "valueForKey:", CFSTR("plistRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("nearbyTVs"));

  activeSplitSessionTV = self->_activeSplitSessionTV;
  if (activeSplitSessionTV)
  {
    -[TUNearbyDeviceHandle plistRepresentation](activeSplitSessionTV, "plistRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("currentSplitSessionTV"));

  }
  suggestion = self->_suggestion;
  if (suggestion)
  {
    -[TUNearbySuggestion description](suggestion, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("suggestion"));

  }
  -[TUNeighborhoodActivityConduit approvalDelegate](self, "approvalDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("approvalDelegate"));

  }
  return v3;
}

void __51__TUNeighborhoodActivityConduit__osStateDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "sharedKeySetForKeys:", &unk_1E38E97C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_osStateDictionary___keyset;
  _osStateDictionary___keyset = v0;

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  TUNeighborhoodActivityConduit *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  TUConduitLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUNeighborhoodActivityConduit addDelegate:queue:].cold.1(v11, (uint64_t)v12, v9);
  }

  -[NSMapTable setObject:forKey:](v8->_delegates, "setObject:forKey:", v7, v6);
  objc_sync_exit(v8);

}

- (void)addDelegate:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v4 = addDelegate__onceToken;
  v5 = a3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&addDelegate__onceToken, &__block_literal_global_137);
    v6 = v7;
  }
  -[TUNeighborhoodActivityConduit addDelegate:queue:](self, "addDelegate:queue:", v6, addDelegate__defaultQueue);

}

void __45__TUNeighborhoodActivityConduit_addDelegate___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.faceTime.neighborhoodActivityConduit.defaultQueue", 0);
  v1 = (void *)addDelegate__defaultQueue;
  addDelegate__defaultQueue = (uint64_t)v0;

}

- (void)removeDelegate:(id)a3
{
  id v4;
  TUNeighborhoodActivityConduit *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  TUConduitLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUNeighborhoodActivityConduit removeDelegate:].cold.1(v8, (uint64_t)v9, v6);
  }

  -[NSMapTable removeObjectForKey:](v5->_delegates, "removeObjectForKey:", v4);
  objc_sync_exit(v5);

}

- (void)setApprovalDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUConduitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Setting approval delegate: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  objc_storeWeak((id *)&self->_approvalDelegate, v4);
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerApprovalClientEnabled:", v4 != 0);

}

- (void)setActiveSplitSessionTV:(id)a3
{
  id v5;
  NSObject *v6;
  TUNearbyDeviceHandle *activeSplitSessionTV;
  int v8;
  TUNearbyDeviceHandle *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TUConduitLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    activeSplitSessionTV = self->_activeSplitSessionTV;
    v8 = 138412546;
    v9 = activeSplitSessionTV;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Setting activeSplitSessionTV: oldValue: %@, newValue: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!-[TUNearbyDeviceHandle isEqual:](self->_activeSplitSessionTV, "isEqual:", v5))
  {
    -[TUNeighborhoodActivityConduit willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeSplitSessionTV"));
    objc_storeStrong((id *)&self->_activeSplitSessionTV, a3);
    -[TUNeighborhoodActivityConduit didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeSplitSessionTV"));
  }

}

- (void)setSuggestion:(id)a3
{
  id v5;
  NSObject *v6;
  TUNearbySuggestion *suggestion;
  int v8;
  TUNearbySuggestion *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TUConduitLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    suggestion = self->_suggestion;
    v8 = 138412546;
    v9 = suggestion;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Setting suggestion: oldValue: %@, newValue: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!-[TUNearbySuggestion isEqual:](self->_suggestion, "isEqual:", v5))
  {
    -[TUNeighborhoodActivityConduit willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("suggestion"));
    objc_storeStrong((id *)&self->_suggestion, a3);
    -[TUNeighborhoodActivityConduit didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("suggestion"));
  }

}

- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUConduitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Called to force suggested tv device name banner: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__TUNeighborhoodActivityConduit_setSuggestedTVDeviceName_completion___block_invoke;
  v11[3] = &unk_1E38A24F0;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "setSuggestedTVDeviceName:completion:", v6, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __69__TUNeighborhoodActivityConduit_setSuggestedTVDeviceName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
      objc_msgSend(WeakRetained, "setSuggestion:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_requestInitialState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke;
  v13[3] = &unk_1E38A2540;
  v13[4] = self;
  objc_msgSend(v3, "nearbyTVDevicesWithCompletion:", v13);

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2;
  v12[3] = &unk_1E38A2590;
  v12[4] = self;
  objc_msgSend(v5, "activeSplitSessionTVDeviceWithCompletion:", v12);

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_147;
  v11[3] = &unk_1E38A25B8;
  v11[4] = self;
  objc_msgSend(v6, "suggestionWithCompletion:", v11);

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_151;
  v10[3] = &unk_1E38A25E0;
  v10[4] = self;
  objc_msgSend(v7, "isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:", v10);

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUNeighborhoodActivityConduit approvalDelegate](self, "approvalDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerApprovalClientEnabled:", v9 != 0);

}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TUConduitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "nearbyTVs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v9, "minusSet:", v5);
    objc_msgSend(*(id *)(a1 + 32), "nearbyTVs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v11);

    objc_msgSend(*(id *)(a1 + 32), "nearbyTVs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unionSet:", v5);

    v13 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_142;
    v15[3] = &unk_1E38A2518;
    v16 = v9;
    v17 = v13;
    v18 = v10;
    v14 = v10;
    v7 = v9;
    objc_msgSend(v13, "_forEachDelegate:", v15);

  }
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "neighborhoodActivityConduit:tvDeviceDisappeared:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(a1 + 48);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "neighborhoodActivityConduit:tvDeviceAppeared:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TUConduitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setActiveSplitSessionTV:", v5);
    if (v5)
    {
      v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_145;
      v9[3] = &unk_1E38A2568;
      v9[4] = v8;
      v10 = v5;
      objc_msgSend(v8, "_forEachDelegate:", v9);

    }
  }

}

uint64_t __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_145(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "neighborhoodActivityConduit:splitSessionStarted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TUConduitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_147_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSuggestion:", v5);
    if (v5)
    {
      v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_148;
      v9[3] = &unk_1E38A2568;
      v9[4] = v8;
      v10 = v5;
      objc_msgSend(v8, "_forEachDelegate:", v9);

    }
  }

}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_148(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "neighborhoodActivityConduit:suggestionUpdated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_151(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    TUConduitLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_151_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  }

}

- (void)_forEachDelegate:(id)a3
{
  id v4;
  TUNeighborhoodActivityConduit *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TUNeighborhoodActivityConduit delegates](v5, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[TUNeighborhoodActivityConduit delegates](v5, "delegates");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __50__TUNeighborhoodActivityConduit__forEachDelegate___block_invoke;
          v15[3] = &unk_1E38A1FC0;
          v14 = v4;
          v15[4] = v11;
          v16 = v14;
          dispatch_async(v13, v15);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

uint64_t __50__TUNeighborhoodActivityConduit__forEachDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_findConversationForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[TUNeighborhoodActivityConduit conversationManager](self, "conversationManager", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeConversations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if ((v12 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldReconnect
{
  void *v3;
  void *v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[TUNeighborhoodActivityConduit conduitLifecycleController](self, "conduitLifecycleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUNeighborhoodActivityConduit conduitLifecycleController](self, "conduitLifecycleController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v4, "shouldKeepConduitAlive");

    TUConduitLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = (_DWORD)v3;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Process does initialize conduitLifeCycleController, are we keeping NAC alive? %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    TUConduitLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Process does not initialize conduitLifecycleController, deferring to processes that do", (uint8_t *)v7, 2u);
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

- (NSSet)nearbyTVDeviceHandles
{
  void *v3;
  void *v4;
  void *v5;

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureConnection");

  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSSet *)v5;
}

- (NSDictionary)nearbyTVDevices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "knownIdentifiersByHandleType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", &unk_1E38E8FB0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return (NSDictionary *)v14;
}

- (BOOL)isRingingFaceTimeCallsOnConnectedTVDevice
{
  void *v3;

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureConnection");

  return self->_isRingingFaceTimeCallsOnConnectedTVDevice;
}

- (BOOL)canPullBackConversation:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v11;

  v3 = a3;
  objc_msgSend(v3, "mergedRemoteMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(v3, "mergedActiveRemoteParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v3 && objc_msgSend(v3, "isContinuitySession"))
  {
    v8 = objc_msgSend(v3, "state");
    v11 = (v5 > 1 || v7 != 0) && v8 == 3;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)inviteTVDevice:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inviteTVDevice:toConversationWithUUID:completion:", v10, v9, v8);

}

- (void)disconnectTVDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disconnectTVDevice:completion:", v7, v6);

}

- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "respondToSuggestionWithResult:completion:", v7, v6);

}

- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handoffConversation:toTVDevice:completion:", v10, v9, v8);

}

- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[TUNeighborhoodActivityConduit _findConversationForUUID:](self, "_findConversationForUUID:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && -[TUNeighborhoodActivityConduit canPullBackConversation:](self, "canPullBackConversation:", v10))
  {
    -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pullConversation:fromTVDevice:completion:", v12, v8, v9);
  }
  else
  {
    TUMakeNeighborhoodConduitError(11, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);
  }

}

- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startConversationWith:on:completion:", v10, v9, v8);

}

- (void)connectionEstablishedForClient:(id)a3
{
  NSObject *v4;

  TUConduitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[TUNeighborhoodActivityConduit connectionEstablishedForClient:].cold.1();

  -[TUNeighborhoodActivityConduit _requestInitialState](self, "_requestInitialState");
}

- (void)connectionLostForClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;

  v4 = a3;
  TUConduitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TUNeighborhoodActivityConduit connectionLostForClient:].cold.1();

  self->_isRingingFaceTimeCallsOnConnectedTVDevice = 0;
  objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.NeighborhoodActivityConduitService"));

  if (v7 && -[TUNeighborhoodActivityConduit _shouldReconnect](self, "_shouldReconnect"))
    objc_msgSend(v4, "ensureConnection");

}

- (void)tvDeviceAppeared:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke;
  v14[3] = &unk_1E38A2608;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v5, "bs_filter:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v8);

  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v7);

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke_2;
  v12[3] = &unk_1E38A2568;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[TUNeighborhoodActivityConduit _forEachDelegate:](self, "_forEachDelegate:", v12);

}

uint64_t __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEquivalentToDeviceHandle:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "neighborhoodActivityConduit:tvDeviceAppeared:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)tvDeviceDisappeared:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke;
  v13[3] = &unk_1E38A2608;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "bs_filter:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUNeighborhoodActivityConduit nearbyTVs](self, "nearbyTVs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v8);

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke_2;
  v11[3] = &unk_1E38A2568;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[TUNeighborhoodActivityConduit _forEachDelegate:](self, "_forEachDelegate:", v11);

}

uint64_t __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEquivalentToDeviceHandle:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "neighborhoodActivityConduit:tvDeviceDisappeared:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)splitSessionStarted:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[TUNeighborhoodActivityConduit setActiveSplitSessionTV:](self, "setActiveSplitSessionTV:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__TUNeighborhoodActivityConduit_splitSessionStarted___block_invoke;
  v6[3] = &unk_1E38A2568;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TUNeighborhoodActivityConduit _forEachDelegate:](self, "_forEachDelegate:", v6);

}

uint64_t __53__TUNeighborhoodActivityConduit_splitSessionStarted___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "neighborhoodActivityConduit:splitSessionStarted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)splitSessionEnded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[TUNeighborhoodActivityConduit setActiveSplitSessionTV:](self, "setActiveSplitSessionTV:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__TUNeighborhoodActivityConduit_splitSessionEnded___block_invoke;
  v6[3] = &unk_1E38A2568;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TUNeighborhoodActivityConduit _forEachDelegate:](self, "_forEachDelegate:", v6);

}

uint64_t __51__TUNeighborhoodActivityConduit_splitSessionEnded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "neighborhoodActivityConduit:splitSessionEnded:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)suggestionUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[TUNeighborhoodActivityConduit setSuggestion:](self, "setSuggestion:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__TUNeighborhoodActivityConduit_suggestionUpdated___block_invoke;
  v6[3] = &unk_1E38A2568;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TUNeighborhoodActivityConduit _forEachDelegate:](self, "_forEachDelegate:", v6);

}

void __51__TUNeighborhoodActivityConduit_suggestionUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "neighborhoodActivityConduit:suggestionUpdated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceChanged:(BOOL)a3
{
  self->_isRingingFaceTimeCallsOnConnectedTVDevice = a3;
}

- (void)approveSplitSessionForConversation:(id)a3 device:(id)a4 pullContext:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  int64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, id))a6;
  -[TUNeighborhoodActivityConduit approvalDelegate](self, "approvalDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    TUConduitLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[TUNeighborhoodActivityConduit approveSplitSessionForConversation:device:pullContext:completion:].cold.1();

    v25 = 8;
LABEL_19:
    TUMakeNeighborhoodConduitError(v25, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v23);
    goto LABEL_20;
  }
  v27 = a5;
  v28 = v11;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[TUNeighborhoodActivityConduit conversationManager](self, "conversationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeConversations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v16)
  {
LABEL_10:

LABEL_13:
    TUConduitLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v11 = v28;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[TUNeighborhoodActivityConduit approveSplitSessionForConversation:device:pullContext:completion:].cold.2();

    v25 = 2;
    goto LABEL_19;
  }
  v17 = v16;
  v18 = *(_QWORD *)v30;
LABEL_4:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v18)
      objc_enumerationMutation(v15);
    v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
    objc_msgSend(v20, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", v10);

    if ((v22 & 1) != 0)
      break;
    if (v17 == ++v19)
    {
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v23 = v20;

  if (!v23)
    goto LABEL_13;
  v11 = v28;
  objc_msgSend(v13, "approveSplitSessionForConversation:requestedFromDevice:pullContext:completion:", v23, v28, v27, v12);
LABEL_20:

}

- (void)cancelSplitSessionApproval
{
  id v2;

  -[TUNeighborhoodActivityConduit approvalDelegate](self, "approvalDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelSplitSessionApproval");

}

- (void)continuityCameraDidConnect
{
  id v2;

  -[TUNeighborhoodActivityConduit xpcClient](self, "xpcClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ensureConnection");

}

- (TUNeighborhoodActivityConduitApprovalDelegate)approvalDelegate
{
  return (TUNeighborhoodActivityConduitApprovalDelegate *)objc_loadWeakRetained((id *)&self->_approvalDelegate);
}

- (void)setIsRingingFaceTimeCallsOnConnectedTVDevice:(BOOL)a3
{
  self->_isRingingFaceTimeCallsOnConnectedTVDevice = a3;
}

- (TUNearbyDeviceHandle)activeSplitSessionTV
{
  return self->_activeSplitSessionTV;
}

- (TUNearbySuggestion)suggestion
{
  return self->_suggestion;
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (NSMutableSet)nearbyTVs
{
  return self->_nearbyTVs;
}

- (TUNeighborhoodActivityConduitXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (TUConduitLifecycleController)conduitLifecycleController
{
  return self->_conduitLifecycleController;
}

- (void)setConduitLifecycleController:(id)a3
{
  objc_storeStrong((id *)&self->_conduitLifecycleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conduitLifecycleController, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_nearbyTVs, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_activeSplitSessionTV, 0);
  objc_destroyWeak((id *)&self->_approvalDelegate);
}

void __61__TUNeighborhoodActivityConduit_initWithConversationManager___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "TUNeighborhoodActivityConduit failed to encode state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addDelegate:(NSObject *)a3 queue:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_19A50D000, a2, a3, "Conduit delegate added: %{public}@", (uint8_t *)a2);

}

- (void)removeDelegate:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_19A50D000, a2, a3, "Conduit delegate removed: %{public}@", (uint8_t *)a2);

}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to get initial state for nearby TVs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to get initial state for active split session TV: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_147_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to get initial state for suggested TV: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_151_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to get initial state for ringing status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connectionEstablishedForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "TUConduit XPC connection established", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)connectionLostForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "TUConduit XPC connection lost", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)approveSplitSessionForConversation:device:pullContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "No split session approval delegate installed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)approveSplitSessionForConversation:device:pullContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "Cannot find conversation for approving split session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
