@implementation SIPixelBufferCopy

void __SIPixelBufferCopy_block_invoke(uint64_t a1)
{
  CVReturn v1;
  CVReturn v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  CVReturn v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  if (v1)
  {
    v2 = v1;
    __SceneIntelligenceLogSharedInstance();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136381187;
      v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v6 = 1025;
      v7 = 492;
      v8 = 1024;
      v9 = v2;
      _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error unlocking source buffer: %d ***", (uint8_t *)&v4, 0x18u);
    }

  }
}

void __SIPixelBufferCopy_block_invoke_26(uint64_t a1)
{
  CVReturn v1;
  CVReturn v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  CVReturn v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  if (v1)
  {
    v2 = v1;
    __SceneIntelligenceLogSharedInstance();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136381187;
      v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v6 = 1025;
      v7 = 505;
      v8 = 1024;
      v9 = v2;
      _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error unlocking destination buffer: %d ***", (uint8_t *)&v4, 0x18u);
    }

  }
}

@end
