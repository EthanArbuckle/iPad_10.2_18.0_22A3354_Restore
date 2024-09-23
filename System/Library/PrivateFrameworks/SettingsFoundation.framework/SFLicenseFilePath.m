@implementation SFLicenseFilePath

void __SFLicenseFilePath_block_invoke()
{
  uint64_t v0;
  void *v1;

  _SFLicenseFilePathForBundleWithName(CFSTR("iOS"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFLicenseFilePath___path;
  SFLicenseFilePath___path = v0;

}

@end
