@implementation _QLCacheThread(CacheDelete)

- (void)purgeableSpaceOnMountPoint:()CacheDelete withUrgency:beforeDate:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D54AE000, a1, a3, "#CacheDelete Could not read in disk cache to determine purgeable space.", a5, a6, a7, a8, 0);
}

- (void)purgeOnMountPoint:()CacheDelete withUrgency:beforeDate:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D54AE000, a1, a3, "#CacheDelete Could not write into disk cache to delete thumbnails.", a5, a6, a7, a8, 0);
}

@end
