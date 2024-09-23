@implementation LTActivityLogger

void __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  id v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((objc_msgSend(v3, "hasAllData") & 1) == 0)
    {
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_2(v5);
    }
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_1((uint64_t)v3, v6);
    v7 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v7, "activityLogger:logAssetSnapshot:forDate:", WeakRetained, v3, *(_QWORD *)(a1 + 32));

  }
}

void __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Finished collecting an asset snapshot to report in analytics: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Failed to collect entire snapshot of asset state, we will log what we have available", v1, 2u);
  OUTLINED_FUNCTION_0();
}

@end
