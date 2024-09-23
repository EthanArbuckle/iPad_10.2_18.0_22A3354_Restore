@implementation PSBlockedHandlesCache

uint64_t __51___PSBlockedHandlesCache_sharedBlockedHandlesCache__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint8_t v4[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache beginning shared instance bringup", v4, 2u);
  }

  v1 = objc_opt_new();
  v2 = (void *)sharedBlockedHandlesCache_cache;
  sharedBlockedHandlesCache_cache = v1;

  return objc_msgSend((id)sharedBlockedHandlesCache_cache, "beginSyncingWithTU");
}

void __65___PSBlockedHandlesCache_handlePrivacyManagerChangeNotification___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "handlePrivacyManagerChangeNotification:", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)handlePrivacyManagerChangeNotification___pasExprOnceResult;
  handlePrivacyManagerChangeNotification___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __65___PSBlockedHandlesCache_handlePrivacyManagerChangeNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rebuildCacheFromPrivacyManager");
}

id __56___PSBlockedHandlesCache_rebuildCacheFromPrivacyManager__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "type");
  if (v3)
  {
    if (v3 == 1)
    {
      objc_msgSend(v2, "email");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    objc_msgSend(v2, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "digits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke()
{
  return 0;
}

uint64_t __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "computeHashesForString:reuse:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "getWithHashes:", v3);

  return v4;
}

@end
