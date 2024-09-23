@implementation OSBatteryPredictor

void __27___OSBatteryPredictor_init__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __27___OSBatteryPredictor_init__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void __27___OSBatteryPredictor_init__block_invoke_49(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __27___OSBatteryPredictor_init__block_invoke_49_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend(v2, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

}

void __27___OSBatteryPredictor_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Connection to battery predictor invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __27___OSBatteryPredictor_init__block_invoke_49_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Connection to battery predictor interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
