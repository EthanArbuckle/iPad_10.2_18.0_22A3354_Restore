@implementation SLSendPortraitFeedbackTypeDisplayedHighlight

void __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SLFrameworkLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_INFO, "SLSendPortraitFeedbackTypeDisplayedForHighlight: sent feedback successfully for highlight: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke_cold_1(a1);
  }

}

void __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_0(&dword_199EFF000, v2, v3, "SLSendPortraitFeedbackTypeDisplayedForHighlight: error sending feedback for highlight: [%@] error: [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

@end
