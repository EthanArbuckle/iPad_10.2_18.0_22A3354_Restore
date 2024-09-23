@implementation WLKFetchIsBubbleTipEnabled

void __WLKFetchIsBubbleTipEnabled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    WLKSystemLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __WLKFetchIsSportsEnabled_block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = objc_msgSend(a2, "naturalLanguageSearchProperty");
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v7;
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - NLS Bubble Tip enabled from config %d", (uint8_t *)v17, 8u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

@end
