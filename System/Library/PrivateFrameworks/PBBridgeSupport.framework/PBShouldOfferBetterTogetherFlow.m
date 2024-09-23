@implementation PBShouldOfferBetterTogetherFlow

void __PBShouldOfferBetterTogetherFlow_block_invoke()
{
  void *v0;
  int v1;
  id MSDKManagedDeviceClass;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (PBIsInternalInstall___onceToken != -1)
    dispatch_once(&PBIsInternalInstall___onceToken, &__block_literal_global_190);
  if (PBIsInternalInstall___internalInstall)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("FakeBetterTogetherState"));

  }
  else
  {
    v1 = 0;
  }
  if ((_os_feature_enabled_impl() & 1) != 0 || v1)
  {
    MSDKManagedDeviceClass = getMSDKManagedDeviceClass();
    if (MSDKManagedDeviceClass)
    {
      objc_msgSend(MSDKManagedDeviceClass, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isBetterTogetherDemoDevice") | v1;

      if (v4 == 1)
        PBShouldOfferBetterTogetherFlow_shouldOfferBetterTogetherFlow = 1;
    }
  }
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = PBShouldOfferBetterTogetherFlow_shouldOfferBetterTogetherFlow;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "PBShouldOfferBetterTogetherFlow %d", (uint8_t *)v6, 8u);
  }

}

@end
