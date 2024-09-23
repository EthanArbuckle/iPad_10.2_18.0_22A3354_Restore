@implementation SBSALogDictionaryDescribableDebug

void __SBSALogDictionaryDescribableDebug_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __SBSALogDictionaryDescribableDebug_block_invoke_cold_1(a1, v4, (uint64_t)v3);

}

void __SBSALogDictionaryDescribableDebug_block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = 134349314;
  v7 = objc_msgSend(v4, "queryIteration");
  v8 = 2112;
  v9 = a3;
  _os_log_debug_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEBUG, "[%{public}lu] %@", (uint8_t *)&v6, 0x16u);

}

@end
