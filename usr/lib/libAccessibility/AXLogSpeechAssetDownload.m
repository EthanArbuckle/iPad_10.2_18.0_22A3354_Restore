@implementation AXLogSpeechAssetDownload

void __AXLogSpeechAssetDownload_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpeechAssetDownload");
  v1 = (void *)AXLogSpeechAssetDownload___logObj;
  AXLogSpeechAssetDownload___logObj = (uint64_t)v0;

}

@end
