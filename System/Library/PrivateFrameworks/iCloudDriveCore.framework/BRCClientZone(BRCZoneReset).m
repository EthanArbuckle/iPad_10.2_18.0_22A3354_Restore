@implementation BRCClientZone(BRCZoneReset)

- (void)_reset:()BRCZoneReset completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[NOTIF] Can't reset %@ because its deactivated%@", v5, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)_reset:()BRCZoneReset completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: not implemented%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_deleteRelevantPackageItemsWithDB:()BRCZoneReset error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_230455000, a3, v5, "[ERROR] failed pruning client_pkg_upload_items: %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_performHardResetOnClientItemsAndWantsUnlink:()BRCZoneReset db:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_230455000, a3, v5, "[ERROR] failed pruning client_items: %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:()BRCZoneReset .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isSharedZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_cancelAllOperationsForReset
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] cancelling sync up operation %@%@");
  OUTLINED_FUNCTION_0();
}

@end
