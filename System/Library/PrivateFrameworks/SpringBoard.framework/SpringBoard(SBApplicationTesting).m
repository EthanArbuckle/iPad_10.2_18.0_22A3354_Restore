@implementation SpringBoard(SBApplicationTesting)

- (void)runTest:()SBApplicationTesting options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "Unrecognized test: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)startLaunchTestNamed:()SBApplicationTesting options:withCompletionBlock:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Killing %{public}@ so that the launch test may begin", v5);

}

- (void)_locationInScreenReferenceSpaceForLocation:()SBApplicationTesting inOrientation:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Unsupported orientation: %ld", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleApplicationExit:()SBApplicationTesting .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
