@implementation SLDAssetCatalog

void __SLDAssetCatalog_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;

  v0 = objc_alloc(MEMORY[0x1E0D1A6A8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v2 = objc_msgSend(v0, "initWithName:fromBundle:error:", CFSTR("Assets"), v1, &v7);
  v3 = v7;
  v4 = (void *)SLDAssetCatalog_catalog;
  SLDAssetCatalog_catalog = v2;

  if (!SLDAssetCatalog_catalog)
  {
    SLDaemonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __SLDAssetCatalog_block_invoke_cold_1((uint64_t)v3, v5, v6);

  }
}

void __SLDAssetCatalog_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, a3, "Couldn't get sociallayerd's asset catalog. Error: %@", (uint8_t *)&v3);
}

@end
