@implementation PSMediaAnalysisProcessingTask

void __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_cold_1((uint64_t)v2, v3, v4);

}

void __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_241(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v5;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "%{BOOL}d, updated interaction %@ for media analysis", (uint8_t *)v6, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, a3, "XPC Error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
