@implementation LoadCoreImage

void __LoadCoreImage_block_invoke()
{
  LoadCoreImage_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 1);
  if (!LoadCoreImage_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadCoreImage_block_invoke_cold_1();
}

void __LoadCoreImage_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1D3C07000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/Frameworks/CoreImage.framework/CoreImage (%d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_2();
}

@end
