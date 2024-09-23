@implementation SignpostReporterShouldUseAllowlist

void __SignpostReporterShouldUseAllowlist_block_invoke(uint64_t a1)
{
  int has_internal_diagnostics;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  SRStringFilter_debugLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (has_internal_diagnostics)
  {
    if (v4)
      __SignpostReporterShouldUseAllowlist_block_invoke_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
    v12 = 0;
  }
  else
  {
    if (v4)
      __SignpostReporterShouldUseAllowlist_block_invoke_cold_2(v3, v5, v6, v7, v8, v9, v10, v11);
    v12 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
}

void __SignpostReporterShouldUseAllowlist_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Not using string allowlist due to os_variant", a5, a6, a7, a8, 0);
}

void __SignpostReporterShouldUseAllowlist_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Defaulting to using string allowlist", a5, a6, a7, a8, 0);
}

@end
