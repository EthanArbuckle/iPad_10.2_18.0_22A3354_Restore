@implementation BRCDocumentItem(BRCFPFSAdditions)

- (void)_initFromPQLResultSet:()BRCFPFSAdditions session:db:error:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: %@ isn't a dictionary!%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: Server item missing a version %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isIdleOrRejected%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateFromServerItem:()BRCFPFSAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cancelDownloadWithEtag:()BRCFPFSAdditions downloadKind:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: downloadKind == BRCDownloadKindLoser%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
