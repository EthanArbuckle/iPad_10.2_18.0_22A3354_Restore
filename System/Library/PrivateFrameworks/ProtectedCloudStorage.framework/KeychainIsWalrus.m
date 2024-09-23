@implementation KeychainIsWalrus

void __KeychainIsWalrus_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint32_t v3;
  uint32_t v4;
  uint32_t v5;
  uint32_t v6;
  int v7;
  uint32_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.ProtectedCloudStorage.OTAccountSettings", v0);
  v2 = (void *)KeychainIsWalrus_queue;
  KeychainIsWalrus_queue = (uint64_t)v1;

  v3 = notify_register_dispatch("_CDPWalrusStateChangeDarwinNotification", &KeychainIsWalrus_cdpStateToken, (dispatch_queue_t)KeychainIsWalrus_queue, &__block_literal_global_136);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 67109120;
      v8 = v4;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "notify_register_dispatch failed: %u", (uint8_t *)&v7, 8u);
    }
  }
  v5 = notify_register_dispatch("com.apple.security.octagon.peer-changed", &KeychainIsWalrus_peerChangeToken, (dispatch_queue_t)KeychainIsWalrus_queue, &__block_literal_global_136);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 67109120;
      v8 = v6;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "notify_register_dispatch failed: %u", (uint8_t *)&v7, 8u);
    }
  }
}

void __KeychainIsWalrus_block_invoke_2()
{
  void *v0;

  v0 = (void *)KeychainIsWalrus_cachedSettings;
  KeychainIsWalrus_cachedSettings = 0;

}

void __KeychainIsWalrus_block_invoke_144(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)KeychainIsWalrus_cachedSettings, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __KeychainIsWalrus_block_invoke_2_145(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)KeychainIsWalrus_cachedSettings;
  if (!KeychainIsWalrus_cachedSettings)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)KeychainIsWalrus_cachedSettings;
    KeychainIsWalrus_cachedSettings = (uint64_t)v3;

    v2 = (void *)KeychainIsWalrus_cachedSettings;
  }
  return objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

@end
