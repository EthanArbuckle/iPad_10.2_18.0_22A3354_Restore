@implementation WebBookmarkCollection(Sync)

- (void)_markSpecialBookmarks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to mark special bookmarks. Sqlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to rebuild ancestor table during bookmark merge", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to restore missing special bookmarks during bookmark merge", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to calculate cached children count during bookmark merge. Sqlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to build the database with new set of bookmarks during bookmark merge", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to delete existing bokmarks as part of merging with new set of bookmarks. SQlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_syncSetString:()Sync forKey:updatedExistingKey:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_2(&dword_211022000, v0, v1, "Failed to set sync properties value for key %{private}@. Sqlite error: %d", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)setSyncData:()Sync forKey:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_2(&dword_211022000, v0, v1, "Failed to set sync data for key %{public}@. Sqlite error: %d", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)beginSyncTransaction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Bookmarks failed to begin sync transaction with result code: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_lockSync
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_211022000, a2, a3, "Failed to open bookmarks sync lock file at: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4_0();
}

@end
