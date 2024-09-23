@implementation PBStoreDemoContentIsFrozen

void __PBStoreDemoContentIsFrozen_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  char v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (PBIsInternalInstall___onceToken != -1)
    dispatch_once(&PBIsInternalInstall___onceToken, &__block_literal_global_190);
  if (PBIsInternalInstall___internalInstall)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("FakeFrozenContent"));

  }
  else
  {
    v1 = 0;
  }
  objc_msgSend(getMSDKManagedDeviceClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFrozen_xpc");

  if ((v3 & 1) != 0 || v1)
    PBStoreDemoContentIsFrozen_storeDemoContentIsFrozen = 1;
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = PBStoreDemoContentIsFrozen_storeDemoContentIsFrozen;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "PBStoreDemoContentIsFrozen %d", (uint8_t *)v5, 8u);
  }

}

@end
