@implementation TPBecomeiProdOverride

void __TPBecomeiProdOverride_block_invoke()
{
  NSObject *v0;
  const char *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  TPBecomeiProdOverride_ffTPBecomeiProdOverrideStatus = _os_feature_enabled_impl();
  TPModelLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (TPBecomeiProdOverride_ffTPBecomeiProdOverrideStatus)
      v1 = "enabled";
    else
      v1 = "disabled";
    v2 = 136315138;
    v3 = v1;
    _os_log_impl(&dword_1DE1BE000, v0, OS_LOG_TYPE_DEFAULT, "BecomeiProd Status set via feature flag to %s", (uint8_t *)&v2, 0xCu);
  }

}

@end
