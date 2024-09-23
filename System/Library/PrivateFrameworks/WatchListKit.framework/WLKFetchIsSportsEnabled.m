@implementation WLKFetchIsSportsEnabled

void __WLKFetchIsSportsEnabled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void (*v15)(void);
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
    goto LABEL_8;
  if (v6)
    goto LABEL_8;
  objc_msgSend(v5, "features");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  v9 = (void *)v8;
  objc_msgSend(v5, "features");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v5, "features");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", CFSTR("sports"), 0);

    WLKSystemLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = v13;
      _os_log_impl(&dword_1B515A000, v14, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports enabled from config %d", (uint8_t *)v23, 8u);
    }

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
LABEL_8:
    WLKSystemLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __WLKFetchIsSportsEnabled_block_invoke_cold_1((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v15();

}

void __WLKFetchIsSportsEnabled_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B515A000, a2, a3, "WLKFeatureEnablerHelpers - An error occured getting the config %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
