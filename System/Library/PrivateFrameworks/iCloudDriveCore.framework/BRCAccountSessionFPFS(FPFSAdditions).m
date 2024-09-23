@implementation BRCAccountSessionFPFS(FPFSAdditions)

- (BRCFSImporter)fsImporter
{
  return self->_fsImporter;
}

- (void)_updateFPFSMigrationBouncedItemType:()FPFSAdditions withExistingItemType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Unknown migration item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setFPFSMigrationState:()FPFSAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Signalling fsimporter to clean un-migrated items%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setFPFSMigrationState:()FPFSAdditions .cold.2(uint64_t a1, int a2, os_log_t log)
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
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting FPFS Migration State: %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)sendNonMigratedItemTelemetryWithfileIDs:()FPFSAdditions .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Sending FPFS non migrated fileIDs telemetry event: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)markMigrationToFPFSComplete
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Received notification that reimport domain was finished%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_sendFPFSImportStartTelemetryEvent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Sending FPFS Import start telemetry event%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_sendFPFSImportStatusTelemetryEvent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Sending FPFS Import status telemetry event%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)triggerFPFSImportFinishedTelemetryEventIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] FPFS Migration is not running, no need to trigger FPFS import finished telemetry%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] This is a test device, not sending ABC report or TTR%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Sending TTR is disabled by user default%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "investigation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fpfsMigrationInvestigation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished FPFS migration investigation info: %@%@", (uint8_t *)&v7, 0x16u);

}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Sending Success FPFS Import finished telemetry event (%@)%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
