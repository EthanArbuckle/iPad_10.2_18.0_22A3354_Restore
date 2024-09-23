@implementation SFAudioAccessoryLicenseVersionNumber

void __SFAudioAccessoryLicenseVersionNumber_block_invoke()
{
  uint64_t v0;
  void *v1;

  _SFLicenseVersionNumberForBundleWithName(CFSTR("AudioAccessory"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFAudioAccessoryLicenseVersionNumber___licenseVersion;
  SFAudioAccessoryLicenseVersionNumber___licenseVersion = v0;

}

@end
