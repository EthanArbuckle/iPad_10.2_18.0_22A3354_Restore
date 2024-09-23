@implementation SBApplication(DefaultImage_ManifestIngestion)

- (void)_resetLaunchImageIngestionStatus
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[.png ingestor] [%{public}@] Resetting ingestion status.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)_ingestDefaultPNGsInManifest:()DefaultImage_ManifestIngestion withLaunchImageBaseName:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[legacy ingest] [%{public}@] Found no candidate PNGs...", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)_ingestInfoPlistImagesInManifest:()DefaultImage_ManifestIngestion .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[.plist ingest] [%{public}@] Found no candidate plist entries...", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

@end
