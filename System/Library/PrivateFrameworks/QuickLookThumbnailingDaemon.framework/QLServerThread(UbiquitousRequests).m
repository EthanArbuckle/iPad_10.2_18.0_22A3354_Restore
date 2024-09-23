@implementation QLServerThread(UbiquitousRequests)

- (void)_downloadThumbnailForRequest:()UbiquitousRequests completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "Will add thumbnail-download for request:%@ to queue: %@");
  OUTLINED_FUNCTION_5();
}

- (void)downloadThumbnails:()UbiquitousRequests forProvider:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = atomic_load((unsigned int *)(a2 + 28));
  v7 = 134218240;
  v8 = v5;
  v9 = 1024;
  v10 = v6;
  _os_log_debug_impl(&dword_1D54AE000, a3, OS_LOG_TYPE_DEBUG, "Dequeueing batch of %lu thumbnail downloads (%d downloads are in flight)", (uint8_t *)&v7, 0x12u);
}

- (void)processedPNGAppIconDataForData:()UbiquitousRequests ofType:size:scale:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_ERROR, "Failed to get rounded icon from app container icon", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)processedPNGAppIconDataForData:()UbiquitousRequests ofType:size:scale:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Computing app icon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
