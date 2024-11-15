@implementation BRCXPCRegularIPCsClient(FPFSAdditions)

- (void)accessItemIdentifier:()FPFSAdditions dbAccessKind:synchronouslyIfPossible:LocalItemHandler:ServerItemHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: (localItemHandler || serverItemHandler) && !(localItemHandler && serverItemHandler)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)removeFPFSDomain:()FPFSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Didn't find any FPFS domain to remove for persona = %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)removeFPFSDomain:()FPFSAdditions .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Got an error while looking for the domain: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)createItemBasedOnTemplate:()FPFSAdditions fields:contents:options:additionalItemAttributes:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: urlWrapper == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createItemBasedOnTemplate:()FPFSAdditions fields:contents:options:additionalItemAttributes:completionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to parse bookmark data on %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_createFileProvidingRequestOperationOfFileObject:()FPFSAdditions localItem:etagIfLoser:etagToDownload:progress:options:reply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Got a nil etag for %@ - returning an error to FP%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createFileProvidingRequestOperationOfFileObject:()FPFSAdditions localItem:etagIfLoser:etagToDownload:progress:options:reply:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Item %@ is waiting for re-apply from the server truth%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createFileProvidingRequestOperationOfFileObject:()FPFSAdditions localItem:etagIfLoser:etagToDownload:progress:options:reply:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We asked FP to reingest item %@, but we still don't have the fileID to upload%@");
  OUTLINED_FUNCTION_0();
}

- (void)reimportItemIdentifier:()FPFSAdditions reply:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Starting BRCXPCClient(FPFS)::reimport%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)validateConnectionDomainWithDomainIdentifier:()FPFSAdditions databaseID:backChannel:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Extension is using a valid domain ID and database ID, we are open for business...%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
