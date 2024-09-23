@implementation BRCAppLibrary(FPFSAdditions)

- (void)documentsFolderFileObjectID
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: App library %@ doesn't have a documents folder%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)recreateDocumentsFolderIfNeededInDB
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] Failed to create documents folder for app library %@%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_recursivelyDeleteItemsUnderItemID:()FPFSAdditions filterPredicate:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save to db without an error%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)deleteAppLibrary
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleting app library %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
