@implementation QLServerThread(ExternalCache)

- (void)findUncachedThumbnailInExternalThumbnailCacheForRequest:()ExternalCache item:URL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Trying external cache for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)receivedExternalCacheConnection:()ExternalCache error:forProviderDomainID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Could not get connection to external thumbnail cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
