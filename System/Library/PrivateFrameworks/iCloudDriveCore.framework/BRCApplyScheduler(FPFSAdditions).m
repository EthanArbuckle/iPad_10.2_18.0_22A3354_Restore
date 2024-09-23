@implementation BRCApplyScheduler(FPFSAdditions)

- (void)monitorFaultingForZone:()FPFSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Monitoring faulting for %@%@");
}

- (void)stopMonitoringFaultingForZone:()FPFSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Stop monitoring faulting for %@%@");
}

@end
