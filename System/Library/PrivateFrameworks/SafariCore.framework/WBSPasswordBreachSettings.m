@implementation WBSPasswordBreachSettings

+ (BOOL)isPasswordBreachDetectionEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", CFSTR("PasswordBreachDetectionOn"), 1);

  return v3;
}

+ (void)setPasswordBreachDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  WBSPasswordBreachHelperProxy *v5;
  WBSPasswordBreachHelperProxy *v6;
  _QWORD v7[4];
  WBSPasswordBreachHelperProxy *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PasswordBreachDetectionOn"));

  if (!v3)
  {
    v5 = objc_alloc_init(WBSPasswordBreachHelperProxy);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke;
    v7[3] = &unk_1E649DD70;
    v8 = v5;
    v6 = v5;
    -[WBSPasswordBreachHelperProxy clearAllRecordsWithCompletionHandler:](v6, "clearAllRecordsWithCompletionHandler:", v7);

  }
}

uint64_t __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_INFO, "Password Monitoring turned off. Cleared all Password Monitoring records.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke_cold_1(v5);
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __63__WBSPasswordBreachSettings_setPasswordBreachDetectionEnabled___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed to clear all Password Monitoring records.", v1, 2u);
}

@end
