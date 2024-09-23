@implementation PFProcessIsLaunchedToExecuteTests

void __PFProcessIsLaunchedToExecuteTests_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[2];
  __int16 v13;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PHOTOS_EXECUTING_TEST_PLAN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3)
  {
    PFBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v5 = "PFProcessIsLaunchedToExecuteTests: YES (PHOTOS_EXECUTING_TEST_PLAN)";
      v6 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1B70DA000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(v0, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isRunningPBAT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9)
  {
    PFBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "PFProcessIsLaunchedToExecuteTests: YES (isRunningPBAT)";
      v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    PFProcessIsLaunchedToExecuteTests_isLaunchedToExecuteTests = 1;
    goto LABEL_9;
  }
  if (PFOSVariantHasInternalDiagnostics_onceToken != -1)
    dispatch_once(&PFOSVariantHasInternalDiagnostics_onceToken, &__block_literal_global_2_208);
  if (PFOSVariantHasInternalDiagnostics_hasInternalDiagnostics)
  {
    PFBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B70DA000, v10, OS_LOG_TYPE_DEFAULT, "PFProcessIsLaunchedToExecuteTests: NO", v11, 2u);
    }

  }
LABEL_9:

}

@end
