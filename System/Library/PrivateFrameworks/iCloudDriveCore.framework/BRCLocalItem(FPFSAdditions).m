@implementation BRCLocalItem(FPFSAdditions)

- (void)logicalNameNeedsRename
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Needs rename because the original name has been vacated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markFromInitialScan
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] Marking %@ from initial scan%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)updateWithLogicalName:()FPFSAdditions newParent:forceTopLevelShareMove:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Ignoring name and parent change on immutable documents folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateFromServerItem:()FPFSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't update from server item when not idle for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)updateToBeInTrashWithParent:()FPFSAdditions trashPutBackPath:trashPutBackParentID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [_parentZoneRowID br_isEqualToNumber:newParentID.zoneRowID] || [_session serverZoneByRowID:_parentZoneRowID].isSharedZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateToBeUntrashedWithParent:()FPFSAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [_parentZoneRowID br_isEqualToNumber:newParentID.zoneRowID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markImportedItemAsSharedWithImportBookmark:()FPFSAdditions parent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _clientZone != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)computeItemScopeFromParentIsRoot:()FPFSAdditions parentIsDocuments:parentScope:logicalName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentScope == BRC_ITEM_SCOPE_DOCUMENTS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
