@implementation SFLicenseVersionNumber

void __SFLicenseVersionNumber_block_invoke()
{
  uint64_t v0;
  void *v1;

  _SFLicenseVersionNumberForBundleWithName(CFSTR("iOS"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFLicenseVersionNumber___licenseVersion;
  SFLicenseVersionNumber___licenseVersion = v0;

}

@end
