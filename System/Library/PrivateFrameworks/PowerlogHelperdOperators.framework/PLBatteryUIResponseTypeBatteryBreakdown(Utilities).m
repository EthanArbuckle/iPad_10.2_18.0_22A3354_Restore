@implementation PLBatteryUIResponseTypeBatteryBreakdown(Utilities)

- (void)getDataRange:()Utilities .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "No first RNE entry!", a5, a6, a7, a8, 0);
}

- (void)getDataRange:()Utilities .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_2(&dword_1DA9D6000, v0, v1, "First RNE entry at %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)getDataRange:()Utilities .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "No first usage time entry!", a5, a6, a7, a8, 0);
}

- (void)getDataRange:()Utilities .cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_2(&dword_1DA9D6000, v0, v1, "First usage time entry at %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)getNodeEntriesForEntryKey:()Utilities withRange:andTimeInterval:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Querying for nodes with %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getBundleIDToDisplayNameMap
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "installedAppEntries=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
