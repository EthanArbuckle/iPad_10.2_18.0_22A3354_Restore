@implementation PLFirstUnlockProtection

+ (void)waitUntilFirstUnlock
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint32_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  _QWORD handler[4];
  NSObject *v11;
  int out_token;

  if (MKBDeviceUnlockedSinceBoot() != 1)
  {
    v2 = dispatch_semaphore_create(0);
    out_token = -1;
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedUtilityQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__PLFirstUnlockProtection_waitUntilFirstUnlock__block_invoke;
    handler[3] = &unk_1E36683C0;
    v5 = v2;
    v11 = v5;
    v6 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v4, handler);

    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Failed to register for first unlock notification.", v9, 2u);
      }

    }
    else
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Will wait for first unlock...", v9, 2u);
      }

      while (MKBDeviceUnlockedSinceBoot() != 1)
        dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      notify_cancel(out_token);
    }

  }
}

intptr_t __47__PLFirstUnlockProtection_waitUntilFirstUnlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Received first unlock notification.", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
