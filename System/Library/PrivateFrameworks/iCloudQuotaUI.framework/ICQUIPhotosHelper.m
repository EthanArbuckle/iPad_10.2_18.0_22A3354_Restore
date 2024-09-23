@implementation ICQUIPhotosHelper

+ (void)enableCloudPhotosLibraryWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLCanEnableCloudPhotoLibrary();

}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  uint8_t buf[16];

  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to enable iCPL.", buf, 2u);
    }

    v8 = (void *)MEMORY[0x24BE71F70];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1;
    v19[3] = &unk_24E3F3568;
    v18 = *(_OWORD *)(a1 + 32);
    v9 = (id)v18;
    v20 = v18;
    objc_msgSend(v8, "enableCPL:", v19);
    v10 = (void *)v20;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_cold_1((uint64_t)v5, v7, v11, v12, v13, v14, v15, v16);

    v17 = *(_QWORD *)(a1 + 32);
    ICQCreateErrorWithMessage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v10);
  }

}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];

  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "iCPL enabled successfully.", v16, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "enableCloudPhotosOptimizationWithCompletion:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    v14 = *(_QWORD *)(a1 + 32);
    ICQCreateErrorWithMessage();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

  }
}

+ (void)enableCloudPhotosOptimizationWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  char IsEnabled;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint8_t *v23;
  __int16 v24;
  __int16 v25;

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  if ((PLIsCPLDataclassEnabled() & 1) == 0)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ICQUIPhotosHelper enableCloudPhotosOptimizationWithCompletion:].cold.2(v6, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_9;
  }
  if ((PLCloudPhotoLibraryKeepOriginalsIsEnabled() & 1) == 0)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 0;
      v22 = "Optimize photos already enabled.";
      v23 = (uint8_t *)&v25;
LABEL_14:
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, v22, v23, 2u);
    }
LABEL_15:

    v3[2](v3, 1, 0);
    goto LABEL_16;
  }
  PLCPLSetKeepOriginalsEnabled();
  IsEnabled = PLCloudPhotoLibraryKeepOriginalsIsEnabled();
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((IsEnabled & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 0;
      v22 = "Optimize photos enabled successfully.";
      v23 = (uint8_t *)&v24;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[ICQUIPhotosHelper enableCloudPhotosOptimizationWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_9:

  ICQCreateErrorWithMessage();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v21);

LABEL_16:
}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Cannot enable iCPL with error: %@", a5, a6, a7, a8, 2u);
}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Failed to enable iCPL with error: %@", a5, a6, a7, a8, 2u);
}

+ (void)enableCloudPhotosOptimizationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Failed to enable optimize photos.", a5, a6, a7, a8, 0);
}

+ (void)enableCloudPhotosOptimizationWithCompletion:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Attempt to optimize photos when iCloud Photo Library is not enabled.", a5, a6, a7, a8, 0);
}

@end
