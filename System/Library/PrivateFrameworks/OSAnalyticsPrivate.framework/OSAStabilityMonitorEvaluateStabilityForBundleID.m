@implementation OSAStabilityMonitorEvaluateStabilityForBundleID

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  if (MEMORY[0x1D8250F70]() == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_BOOL(v3, "result"))
    {
      v6 = xpc_dictionary_get_BOOL(v3, "stability_result");
      goto LABEL_12;
    }
    xpc_dictionary_get_string(v3, "error_desc");
    OSAStabilityMonitorLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_2();

  }
  else
  {
    v4 = (void *)MEMORY[0x1D8250EE0](v3);
    OSAStabilityMonitorLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_3();

    if (v4)
      free(v4);
  }
  v6 = 0;
LABEL_12:
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, _BOOL8))(v8 + 16))(v8, v6);
  }
  else
  {
    OSAStabilityMonitorLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_1();

  }
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, v0, v1, "Missing expected completion handler.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, v0, v1, "Error triggering targeted stability monitor: %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, v0, v1, "Received error from XPC request to run stability monitor: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
