@implementation WebBookmark(ReadingListArchives)

- (void)_sizeForFileOrDirectory:()ReadingListArchives withAttributes:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_211022000, a2, OS_LOG_TYPE_ERROR, "Error calculating directory size getting directory subpaths for offline reading list item at path: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_removeDirectoryAtPath:()ReadingListArchives .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@: %{public}@", buf, 0x16u);

}

@end
