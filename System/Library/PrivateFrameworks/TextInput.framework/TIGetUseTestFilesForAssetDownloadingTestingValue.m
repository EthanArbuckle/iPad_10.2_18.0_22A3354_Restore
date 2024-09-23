@implementation TIGetUseTestFilesForAssetDownloadingTestingValue

void __TIGetUseTestFilesForAssetDownloadingTestingValue_block_invoke()
{
  id v0;

  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("UseTestFilesForAssetDownloadingTesting"), CFSTR("com.apple.keyboard"), MEMORY[0x1E0C9AAA0]);

}

@end
