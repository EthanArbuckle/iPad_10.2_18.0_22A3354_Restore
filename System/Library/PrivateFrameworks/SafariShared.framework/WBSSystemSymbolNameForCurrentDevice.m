@implementation WBSSystemSymbolNameForCurrentDevice

void __WBSSystemSymbolNameForCurrentDevice_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v1, 0, 1, &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __WBSSystemSymbolNameForCurrentDevice_block_invoke_cold_1((uint64_t)v1, v4, v3);
  }
  objc_msgSend(v2, "name");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v5, "length");
  v7 = v5;
  if (!v6)
  {
    v8 = objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall");
    v7 = CFSTR("display");
    if (v8)
      v7 = CFSTR("pc");
  }
  v9 = v7;

  v10 = (void *)WBSSystemSymbolNameForCurrentDevice_result;
  WBSSystemSymbolNameForCurrentDevice_result = (uint64_t)v9;

}

void __WBSSystemSymbolNameForCurrentDevice_block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Failed to determine device symbol for %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
