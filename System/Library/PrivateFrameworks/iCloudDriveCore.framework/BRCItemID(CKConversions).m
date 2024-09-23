@implementation BRCItemID(CKConversions)

+ (void)structureRecordPrefixForItemType:()CKConversions targetZoneShared:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_230455000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown item type %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)structureRecordIDForItemType:()CKConversions zone:aliasTargetZoneIsShared:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: invalid type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)structureRecordIDForItemType:()CKConversions zone:aliasTargetZoneIsShared:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: appLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
