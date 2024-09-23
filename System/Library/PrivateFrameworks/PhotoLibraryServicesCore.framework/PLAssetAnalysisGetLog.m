@implementation PLAssetAnalysisGetLog

void __PLAssetAnalysisGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "AssetAnalysis");
  v1 = (void *)PLAssetAnalysisGetLog_log;
  PLAssetAnalysisGetLog_log = (uint64_t)v0;

}

@end
