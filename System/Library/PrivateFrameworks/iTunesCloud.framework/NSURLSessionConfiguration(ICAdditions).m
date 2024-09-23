@implementation NSURLSessionConfiguration(ICAdditions)

+ (id)ic_defaultSessionConfiguration
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v0, "set_tlsTrustPinningPolicyName:", *MEMORY[0x1E0CD6F90]);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isInternalBuild") & 1) != 0)
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "set_alwaysPerformDefaultTrustEvaluation:", objc_msgSend(v2, "ignoreExtendedCertificateValidation") ^ 1);

  }
  else
  {
    objc_msgSend(v0, "set_alwaysPerformDefaultTrustEvaluation:", 1);
  }

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWatch");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp")))
    {
      ICBundleIdentifierForSystemApplicationType(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "set_sourceApplicationBundleIdentifier:", v7);

    }
  }
  return v0;
}

@end
