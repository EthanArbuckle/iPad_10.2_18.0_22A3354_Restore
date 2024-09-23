@implementation REProcessIsRelevanced

void __REProcessIsRelevanced_block_invoke()
{
  void *v0;
  __SecTask *v1;
  __SecTask *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  CFErrorRef error;

  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v0)
  {
    v1 = SecTaskCreateFromSelf(0);
    if (v1)
    {
      v2 = v1;
      error = 0;
      v3 = (void *)SecTaskCopyValueForEntitlement(v1, CFSTR("application-identifier"), &error);
      v4 = v3;
      if (v3)
      {
        REProcessIsRelevanced_IsRelevanced = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.relevanceengine.relevanced"));
      }
      else
      {
        RELogForDomain(0);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __REProcessIsRelevanced_block_invoke_cold_2((uint64_t *)&error, v6, v7);

      }
      CFRelease(v2);

    }
    else
    {
      RELogForDomain(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __REProcessIsRelevanced_block_invoke_cold_1(v5);

    }
  }
}

void __REProcessIsRelevanced_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "Unable to get SecTaskCreateFromSelf()", v1, 2u);
}

void __REProcessIsRelevanced_block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_3(&dword_2132F7000, a2, a3, "Unable to get process identifier: %@", (uint8_t *)&v4);
}

@end
