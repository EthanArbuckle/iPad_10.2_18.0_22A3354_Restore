@implementation PLSubmissions(XPCScheduling)

- (void)enqueueFileForUpload:()XPCScheduling .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Not queueing submission record due to missing info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)submitRecord:()XPCScheduling withActivity:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Failed to create CloudKit asset for %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)finishXPCActivity:()XPCScheduling .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Failed to set background state to done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)finishXPCActivity:()XPCScheduling .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Background state not in continue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeFileAtURL:()XPCScheduling .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to remove file at %@, error: %@");
  OUTLINED_FUNCTION_1_0();
}

@end
