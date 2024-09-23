@implementation OSInactivityPredictionClient

void __47___OSInactivityPredictionClient_initConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = gInactivityPredictionClientLog;
    if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
      __47___OSInactivityPredictionClient_initConnection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

}

void __47___OSInactivityPredictionClient_initConnection__block_invoke_85(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleInterruption");
    WeakRetained = v2;
  }

}

void __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_cold_1();

}

uint64_t __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_89(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __49___OSInactivityPredictionClient_modelDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __49___OSInactivityPredictionClient_modelDescription__block_invoke_cold_1();

}

void __49___OSInactivityPredictionClient_modelDescription__block_invoke_92(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46___OSInactivityPredictionClient_modelMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __46___OSInactivityPredictionClient_modelMetadata__block_invoke_cold_1();

}

void __46___OSInactivityPredictionClient_modelMetadata__block_invoke_95(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_cold_1();

}

uint64_t __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_98(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_cold_1();

}

void __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_101(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_cold_1();

}

void __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_103(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_cold_1();

}

void __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_cold_1();

}

void __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __48___OSInactivityPredictionClient_fixModelOutput___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __39___OSChargingPredictor_fixModelOutput___block_invoke_cold_1();

}

void __48___OSInactivityPredictionClient_fixModelOutput___block_invoke_109(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49___OSInactivityPredictionClient_unfixModelOutput__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __40___OSChargingPredictor_unfixModelOutput__block_invoke_cold_1();

}

void __49___OSInactivityPredictionClient_unfixModelOutput__block_invoke_111(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_cold_1();

}

uint64_t __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_113(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_cold_1();

}

uint64_t __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_115(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_cold_1();

}

uint64_t __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_117(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __45___OSInactivityPredictionClient_backedUpData__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __45___OSInactivityPredictionClient_backedUpData__block_invoke_cold_1();

}

void __45___OSInactivityPredictionClient_backedUpData__block_invoke_119(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64___OSInactivityPredictionClient_recommendedWaitTimeWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __64___OSInactivityPredictionClient_recommendedWaitTimeWithHandler___block_invoke_cold_1();

}

void __61___OSInactivityPredictionClient_modelDescriptionWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __61___OSInactivityPredictionClient_modelDescriptionWithHandler___block_invoke_cold_1();

}

void __58___OSInactivityPredictionClient_modelMetadataWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __58___OSInactivityPredictionClient_modelMetadataWithHandler___block_invoke_cold_1();

}

void __71___OSInactivityPredictionClient_inactivityHistoryDiagnosisWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __71___OSInactivityPredictionClient_inactivityHistoryDiagnosisWithHandler___block_invoke_cold_1();

}

void __71___OSInactivityPredictionClient_hasEnoughInactivityHistoryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __71___OSInactivityPredictionClient_hasEnoughInactivityHistoryWithHandler___block_invoke_cold_1();

}

void __65___OSInactivityPredictionClient_deviceUsageDiagnosisWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __65___OSInactivityPredictionClient_deviceUsageDiagnosisWithHandler___block_invoke_cold_1();

}

void __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke_cold_1();

}

void __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke_cold_1();

}

void __60___OSInactivityPredictionClient_fixModelOutput_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke_cold_1();

}

void __61___OSInactivityPredictionClient_unfixModelOutputWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke_cold_1();

}

void __75___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __75___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo_withHandler___block_invoke_cold_1();

}

void __71___OSInactivityPredictionClient_restoreRecommendedWaitTimeWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __71___OSInactivityPredictionClient_restoreRecommendedWaitTimeWithHandler___block_invoke_cold_1();

}

void __67___OSInactivityPredictionClient_restoreInactivityModelWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __67___OSInactivityPredictionClient_restoreInactivityModelWithHandler___block_invoke_cold_1();

}

void __57___OSInactivityPredictionClient_backedUpDataWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR))
    __57___OSInactivityPredictionClient_backedUpDataWithHandler___block_invoke_cold_1();

}

void __47___OSInactivityPredictionClient_initConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Connection to inactivity predictor invalidated", a5, a6, a7, a8, 0);
}

void __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in getting the recommended wait time since initial inactivity synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49___OSInactivityPredictionClient_modelDescription__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in getting inactivity predictor description synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46___OSInactivityPredictionClient_modelMetadata__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in getting inactivity predictor metadata synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in checking user history sufficiency synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in diagnozing user inactivity history synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in diagnozing the device usage frequency synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1C34CE000, v0, v1, "(%ld) Error in getting long inactivity prediction synchronously: %@");
  OUTLINED_FUNCTION_3();
}

void __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1C34CE000, v0, v1, "(%ld) Error in getting long inactivity prediction at date %@ with time since inactive %.2f synchronously: %@");
}

void __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in overriding the recommended wait time synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in restoring the recommended wait time synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in restoring the appropriate inactivity predictor variant synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45___OSInactivityPredictionClient_backedUpData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in obtaining backup data synchronously: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64___OSInactivityPredictionClient_recommendedWaitTimeWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in getting the recommended wait time since initial inactivity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61___OSInactivityPredictionClient_modelDescriptionWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in getting inactivity predictor description: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58___OSInactivityPredictionClient_modelMetadataWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in getting inactivity predictor metadata: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71___OSInactivityPredictionClient_inactivityHistoryDiagnosisWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in diagnozing user inactivity history: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71___OSInactivityPredictionClient_hasEnoughInactivityHistoryWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in checking user history sufficiency: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65___OSInactivityPredictionClient_deviceUsageDiagnosisWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in diagnozing the device usage frequency: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1C34CE000, v0, v1, "(%ld) Error in getting long inactivity prediction: %@");
  OUTLINED_FUNCTION_3();
}

void __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1C34CE000, v0, v1, "(%ld) Error in getting long inactivity prediction at date %@ with time since inactive %.2f: %@");
}

void __75___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in overriding the recommended wait time: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71___OSInactivityPredictionClient_restoreRecommendedWaitTimeWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in restoring the recommended wait time: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __67___OSInactivityPredictionClient_restoreInactivityModelWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in restoring the appropriate inactivity predictor variant: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57___OSInactivityPredictionClient_backedUpDataWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C34CE000, v0, v1, "Error in obtaining backup data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
