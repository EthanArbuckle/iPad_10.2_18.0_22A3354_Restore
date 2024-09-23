@implementation OSChargingPredictor

void __38___OSChargingPredictor_initConnection__block_invoke(uint64_t a1)
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
    v3 = WeakRetained[2];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38___OSChargingPredictor_initConnection__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void __38___OSChargingPredictor_initConnection__block_invoke_55(uint64_t a1)
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
    v3 = WeakRetained[2];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38___OSChargingPredictor_initConnection__block_invoke_55_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend(v2, "handleInterruption");
  }

}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_cold_1(a1);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59_cold_1(a1);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __39___OSChargingPredictor_fixModelOutput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39___OSChargingPredictor_fixModelOutput___block_invoke_cold_1();

}

void __39___OSChargingPredictor_fixModelOutput___block_invoke_61(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke_cold_1();

}

void __40___OSChargingPredictor_unfixModelOutput__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40___OSChargingPredictor_unfixModelOutput__block_invoke_cold_1();

}

void __40___OSChargingPredictor_unfixModelOutput__block_invoke_63(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke_cold_1();

}

void __38___OSChargingPredictor_initConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Connection to charging predictor invalidated", a5, a6, a7, a8, 0);
}

void __38___OSChargingPredictor_initConnection__block_invoke_55_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Connection to charging predictor interrupted", a5, a6, a7, a8, 0);
}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1C34CE000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1C34CE000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __39___OSChargingPredictor_fixModelOutput___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in fixing model output: %@ synchronously", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in fixing model output: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40___OSChargingPredictor_unfixModelOutput__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in unfixing model output synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in unfixing model output: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
