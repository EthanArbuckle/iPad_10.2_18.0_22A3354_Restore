@implementation SBWidgetDebuggingTestRecipe

- (id)title
{
  return CFSTR("Trigger NC for debugging");
}

+ (id)__systemService
{
  if (__systemService_onceToken != -1)
    dispatch_once(&__systemService_onceToken, &__block_literal_global_72);
  return (id)__systemService___systemService;
}

void __46__SBWidgetDebuggingTestRecipe___systemService__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D23288]);
  v1 = (void *)__systemService___systemService;
  __systemService___systemService = (uint64_t)v0;

}

- (void)_openNotificationCenter
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[2];
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "__systemService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D22D18];
  v1 = *MEMORY[0x1E0D22C48];
  v4[0] = *MEMORY[0x1E0D22C40];
  v4[1] = v1;
  v5[0] = CFSTR("com.apple.TodayViewWidget");
  v5[1] = CFSTR("com.apple.widget-extension");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openApplication:options:withResult:", CFSTR("com.apple.springboard"), v3, &__block_literal_global_10);

}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;

  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
      __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_2((uint64_t)v2, v3);
  }
  else if (v4)
  {
    __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_1(v3);
  }

}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Succeeded in launching Notification Center for testing", v1, 2u);
}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to launch Notification Center for testing: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
