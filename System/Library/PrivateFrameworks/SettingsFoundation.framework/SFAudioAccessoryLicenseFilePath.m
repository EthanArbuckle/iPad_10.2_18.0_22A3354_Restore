@implementation SFAudioAccessoryLicenseFilePath

void __SFAudioAccessoryLicenseFilePath_block_invoke()
{
  uint64_t v0;
  void *v1;

  _SFLicenseFilePathForBundleWithName(CFSTR("AudioAccessory"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFAudioAccessoryLicenseFilePath___path;
  SFAudioAccessoryLicenseFilePath___path = v0;

}

@end
