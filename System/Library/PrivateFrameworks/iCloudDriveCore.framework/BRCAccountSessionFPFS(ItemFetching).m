@implementation BRCAccountSessionFPFS(ItemFetching)

- (void)itemByFileObjectID:()ItemFetching db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't compute a BRCLocalItem for a nil BRFileObjectID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: fileobjectID has an invalid type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: There is no local item for BRFileObjectIDTypeRootContainer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: appLibrary.includesDataScope%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serverAliasItemForSharedItem:()ItemFetching inZone:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: item.serverZone.isSharedZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)enumerateContainersWithDB:()ItemFetching handler:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx enumerating containers%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
