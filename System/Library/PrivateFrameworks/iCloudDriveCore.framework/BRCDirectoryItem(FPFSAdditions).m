@implementation BRCDirectoryItem(FPFSAdditions)

- (void)_signalPropagationToChildrenForce:()FPFSAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "diffAgainstOriginalItem");
  BRCItemFieldsPrettyPrint();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, a3, v5, "[CRIT] UNREACHABLE: We seem to be in a lost scan loop.  Breaking the chain (diffs %@)%@", v6);

}

- (void)documentsDirectoryUpdatedDocumentsScopePublic
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't update document scope public when we aren't the documents folder %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)markRemovedFromFilesystemRecursively:()FPFSAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 16), "changeState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionWithContext:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting deletion change token to %@ because item contains a dir faults%@", v7, 0x16u);

}

- (void)markDirectoryMergeOrCrossZonePropagationComplete
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: zombieItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)handlePathMatchConflictForDirectoryCreationIfNecessary
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Attempting to handle path match conflicts for directory creation of %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)updateFromServerItem:()FPFSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Server item is a directory fault so now our local item is a directory fault for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)mergeContentsIntoDirectory:()FPFSAdditions .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: Can't merge into a folder which is already accepting a merge %@%@", v1);
  OUTLINED_FUNCTION_0();
}

@end
