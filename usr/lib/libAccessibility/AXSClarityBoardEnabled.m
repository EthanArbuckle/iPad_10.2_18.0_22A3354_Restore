@implementation AXSClarityBoardEnabled

void ___AXSClarityBoardEnabled_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  int v4;
  NSObject *v5;

  _AXSClarityBoardEnabledDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("ClarityBoardEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    CLFLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      ___AXSClarityBoardEnabled_block_invoke_cold_1();
    goto LABEL_9;
  }
  v3 = objc_retainAutorelease(v2);
  v4 = access((const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4), 0);
  _AXSClarityBoardEnabled_isEnabled = v4 == 0;
  if (v4 && (v4 != -1 || *__error() != 2))
  {
    CLFLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      ___AXSClarityBoardEnabled_block_invoke_cold_2((uint64_t)v3, v5);
LABEL_9:

  }
}

void ___AXSClarityBoardEnabled_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_18F1A7000, v0, v1, "Unable to get _AXSClarityBoardEnabledDirectory()", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ___AXSClarityBoardEnabled_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int *v4;
  char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = v5;
  _os_log_fault_impl(&dword_18F1A7000, a2, OS_LOG_TYPE_FAULT, "Unable to check whether file existed at %@. Error: %s", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_11();
}

@end
