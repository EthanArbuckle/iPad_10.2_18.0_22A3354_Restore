@implementation BRCLocalItem(CKConversions)

- (void)baseStructureRecord
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't get the structure record of a shared-top-level document without the zone of the alias record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)structureRecordBeingDeadInServerTruth:()CKConversions stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] Error creating record %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)sideCarRecordID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Asked for side car recordID on an item that doesn't have side cars%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)structureRecordID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't get the structure record without a zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
