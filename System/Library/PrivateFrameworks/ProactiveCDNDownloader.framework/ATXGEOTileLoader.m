@implementation ATXGEOTileLoader

- (ATXGEOTileLoader)init
{
  ATXGEOTileLoader *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXGEOTileLoader;
  v2 = -[ATXGEOTileLoader init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)requestGEOTileDataForLocation:(id)a3 tileDataHandler:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = requestGEOTileDataForLocation_tileDataHandler__onceToken;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&requestGEOTileDataForLocation_tileDataHandler__onceToken, &__block_literal_global_0);
  objc_msgSend(MEMORY[0x24BE3D090], "modernLoader");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXGEOTileLoader requestGEOTileDataForLocation:tileLoader:tileDataHandler:](self, "requestGEOTileDataForLocation:tileLoader:tileDataHandler:", v8, v9, v7);

}

uint64_t __66__ATXGEOTileLoader_requestGEOTileDataForLocation_tileDataHandler___block_invoke()
{
  objc_msgSend(MEMORY[0x24BE3D090], "setMemoryCacheCountLimit:", 0);
  return objc_msgSend(MEMORY[0x24BE3D090], "setMemoryCacheTotalCostLimit:", 0);
}

- (void)requestGEOTileDataForLocation:(id)a3 tileLoader:(id)a4 tileDataHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  OS_dispatch_queue *callbackQueue;
  id obj;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[ATXGEOTileLoader tileKeyListForLocation:](self, "tileKeyListForLocation:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
        dispatch_group_enter(v11);
        GEOTileLoaderClientIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        callbackQueue = self->_callbackQueue;
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke;
        v20[3] = &unk_24D223D78;
        v22 = v9;
        v21 = v11;
        objc_msgSend(v8, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", v16, 2147483646, v17, 3, 4, callbackQueue, 0, v20);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BE7A5D8], "waitForGroup:timeoutSeconds:onGroupComplete:onTimeout:", v11, &__block_literal_global_11, &__block_literal_global_13, 1.0);
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (v10)
  {
    __atxlog_handle_hero();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_2((uint64_t)v10, v12);

  }
  __atxlog_handle_hero();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_1(v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_10()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_hero();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2147E2000, v0, OS_LOG_TYPE_DEFAULT, "GEO: tile download finished", v1, 2u);
  }

}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_12()
{
  NSObject *v0;

  __atxlog_handle_hero();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_12_cold_1(v0);

}

- (id)tileKeyListForLocation:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "coordinate");
  objc_msgSend(v3, "coordinate");

  return (id)GEOProactiveAppClipTileKeysNearLocation();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2147E2000, log, OS_LOG_TYPE_DEBUG, "GEO: Processing tile...", v1, 2u);
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2147E2000, a2, OS_LOG_TYPE_ERROR, "GEO: Encountered error %@", (uint8_t *)&v2, 0xCu);
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_12_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2147E2000, log, OS_LOG_TYPE_ERROR, "GEO: tile download timed out", v1, 2u);
}

@end
