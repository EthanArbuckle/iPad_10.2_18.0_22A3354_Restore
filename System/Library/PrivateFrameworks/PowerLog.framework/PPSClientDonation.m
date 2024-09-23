@implementation PPSClientDonation

+ (PPSTelemetryIdentifier)createIdentifierForSubsystem:(const char *)a3 category:(const char *)a4
{
  PPSTelemetryIdentifier *v4;
  PPSTelemetryIdentifier *v5;
  NSObject *v6;

  if (!+[PPSClientDonation isRegisteredSubsystem:category:](PPSClientDonation, "isRegisteredSubsystem:category:"))return 0;
  v4 = (PPSTelemetryIdentifier *)malloc_type_malloc(0x400uLL, 0x1000040D7EB2065uLL);
  if (!v4)
  {
    logHandle_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PPSClientDonation createIdentifierForSubsystem:category:].cold.1(v6);

    return 0;
  }
  v5 = v4;
  __strlcpy_chk();
  __strlcpy_chk();
  return v5;
}

+ (BOOL)isRegisteredSubsystem:(const char *)a3 category:(const char *)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;

  if (a3 && a4 && *a3 && *a4)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "permissionsForSubsystem:category:", v7, v8);

    if ((v9 & 1) == 0)
    {
      logHandle_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[PPSClientDonation isRegisteredSubsystem:category:].cold.2();

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PPSClientDonation isRegisteredSubsystem:category:].cold.1();
    return 0;
  }
  return v9;
}

+ (void)sendEventWithIdentifier:(const PPSTelemetryIdentifier *)a3 payload:(__CFDictionary *)a4
{
  NSObject *v5;
  id v6;

  if (a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s::%s"), a3, a3->var1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    PLLogRegisteredEvent(110, v6, a4);

  }
  else
  {
    logHandle_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSClientDonation sendEventWithIdentifier:payload:].cold.1((uint64_t)a4, v5);

  }
}

+ (void)createIdentifierForSubsystem:(os_log_t)log category:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[PPSClientDonation createIdentifierForSubsystem:category:]";
  _os_log_error_impl(&dword_19EA99000, log, OS_LOG_TYPE_ERROR, "(%s) Failed to malloc identifier", (uint8_t *)&v1, 0xCu);
}

+ (void)sendEventWithIdentifier:(uint64_t)a1 payload:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "+[PPSClientDonation sendEventWithIdentifier:payload:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_19EA99000, a2, OS_LOG_TYPE_ERROR, "(%s) Invalid inputs: payload=%@", (uint8_t *)&v2, 0x16u);
}

+ (void)isRegisteredSubsystem:category:.cold.1()
{
  uint64_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_19EA99000, MEMORY[0x1E0C81028], v0, "(%s) Invalid inputs: %s / %s", (uint8_t *)v1);
}

+ (void)isRegisteredSubsystem:category:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_19EA99000, v0, (uint64_t)v0, "(%s) Permission denied: %s / %s", (uint8_t *)v1);
}

@end
