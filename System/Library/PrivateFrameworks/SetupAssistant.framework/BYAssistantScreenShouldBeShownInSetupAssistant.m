@implementation BYAssistantScreenShouldBeShownInSetupAssistant

void __BYAssistantScreenShouldBeShownInSetupAssistant_block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a2;
  if (v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __BYAssistantScreenShouldBeShownInSetupAssistant_block_invoke_cold_1(v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Showing disclosure for compact trigger in home", v7, 2u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __BYAssistantScreenShouldBeShownInSetupAssistant_block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = _BYIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v1, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 138543362;
  v8 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1A4E92000, v3, v4, "Failed to determine if compact trigger is enabled in the home: %{public}@", (uint8_t *)&v7);
  if (!v5)
  {

  }
}

@end
