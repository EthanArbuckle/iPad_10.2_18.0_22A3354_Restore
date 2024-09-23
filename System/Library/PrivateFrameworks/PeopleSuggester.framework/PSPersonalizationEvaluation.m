@implementation PSPersonalizationEvaluation

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_cold_1(v6, v3);
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + 16))() & 1) == 0)
  {
    objc_msgSend(v3, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_255(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }
  objc_msgSend(v3, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v6, "writeToURL:error:", v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) || (v9 & 1) == 0)
  {
    v10 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_255_cold_1((uint64_t)(a1 + 5), v10, v11, v12, v13, v14, v15, v16);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_ERROR, "context.task.error: %@", v6, 0xCu);

  OUTLINED_FUNCTION_7();
}

void __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_255_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Saving the adapted model failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
