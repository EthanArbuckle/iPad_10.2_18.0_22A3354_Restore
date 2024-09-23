@implementation LTDConfigurationService

void __33___LTDConfigurationService_cache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)cache_cache;
  cache_cache = v0;

}

void __34___LTDConfigurationService__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translationd.ConfigurationService", 0);
  v1 = (void *)_queue__queue;
  _queue__queue = (uint64_t)v0;

}

void __60___LTDConfigurationService_configurationForType_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[5];
  v3 = a1[6];
  v6 = 0;
  objc_msgSend(v2, "configurationForType:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[4] + 16))();

}

void __55___LTDConfigurationService_configurationForType_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __55___LTDConfigurationService_configurationForType_error___block_invoke_cold_1();
      if (!a2)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (a2)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

  }
LABEL_5:

}

void __59___LTDConfigurationService_asrConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "asrConfigurationWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __63___LTDConfigurationService_offlineConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "offlineConfigurationWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __60___LTDConfigurationService_siriConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "siriConfigurationWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __69___LTDConfigurationService_textStreamingConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "textStreamingConfigurationWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __61___LTDConfigurationService_assetConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "assetConfigurationWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __59___LTDConfigurationService_aneConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "aneConfigurationWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

uint64_t __62___LTDConfigurationService_supportedLocalePairsForTask_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF6410], "pairWithIdentifiers:", a2);
}

void __67___LTDConfigurationService_supportedLocalePairsForTask_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[5];
  v3 = a1[6];
  v7 = 0;
  objc_msgSend(v2, "supportedLocalePairsForTask:error:", v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = a1[4];
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v4, v5);

}

void __55___LTDConfigurationService_configurationForType_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to refresh asset catalog %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
