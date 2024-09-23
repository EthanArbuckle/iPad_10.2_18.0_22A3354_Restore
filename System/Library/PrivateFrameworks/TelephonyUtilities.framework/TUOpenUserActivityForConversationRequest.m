@implementation TUOpenUserActivityForConversationRequest

void __TUOpenUserActivityForConversationRequest_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __TUOpenUserActivityForConversationRequest_block_invoke_cold_1();

  }
}

void __TUOpenUserActivityForConversationRequest_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to launch InCallService via NSUserActivity with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
