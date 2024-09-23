@implementation LTLoggingRequestHandler

void __50___LTLoggingRequestHandler_startSpeechLIDRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50___LTLoggingRequestHandler_startSpeechLIDRequest___block_invoke_2_cold_1();
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LTSendErrorEvent(v3, v6);

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Speech LID logging request finished", v7, 2u);
  }

}

void __60___LTLoggingRequestHandler_startSpeechSensesLoggingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60___LTLoggingRequestHandler_startSpeechSensesLoggingRequest___block_invoke_2_cold_1();
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LTSendErrorEvent(v3, v6);

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Speech senses logging request finished", v7, 2u);
  }

}

uint64_t __61___LTLoggingRequestHandler_startSafariLatencyLoggingRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dict");
}

void __55___LTLoggingRequestHandler_startSafariFeedbackRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55___LTLoggingRequestHandler_startSafariFeedbackRequest___block_invoke_2_cold_1();
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LTSendErrorEvent(v3, v6);

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Safari feedback request finished", v7, 2u);
  }

}

void __50___LTLoggingRequestHandler_startSpeechLIDRequest___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Speech LID logging request finished with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __60___LTLoggingRequestHandler_startSpeechSensesLoggingRequest___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Speech senses logging request finished with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __55___LTLoggingRequestHandler_startSafariFeedbackRequest___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Safari feedback request finished with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
