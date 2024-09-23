@implementation UIApplicationExtensionActivity(UIActivity_PerformanceTest)

+ (void)_applicationExtensionActivitiesForItems:()UIActivity_PerformanceTest .cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_19E419000, v0, OS_LOG_TYPE_ERROR, "Cannot find application extensions: %{public}@", v1, 0xCu);
}

@end
