@implementation CACLogAssetDownload

void __CACLogAssetDownload_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "AssetDownload");
  v1 = (void *)CACLogAssetDownload_sLogAssetDownload;
  CACLogAssetDownload_sLogAssetDownload = (uint64_t)v0;

}

@end
