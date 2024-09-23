@implementation BuddyFeatureFlags

+ (id)currentFlags
{
  if (currentFlags_onceToken != -1)
    dispatch_once(&currentFlags_onceToken, &__block_literal_global_12);
  return (id)currentFlags_featureFlags;
}

void __33__BuddyFeatureFlags_currentFlags__block_invoke()
{
  BuddyFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(BuddyFeatureFlags);
  v1 = (void *)currentFlags_featureFlags;
  currentFlags_featureFlags = (uint64_t)v0;

}

- (BOOL)isLanguageAgnosticQuickStartEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isUseCDPContextSecretInsteadOfSBDSecretEnabled
{
  char v2;
  NSObject *v3;

  v2 = _os_feature_enabled_impl();
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[BuddyFeatureFlags isUseCDPContextSecretInsteadOfSBDSecretEnabled].cold.1(v2, v3);

  return v2;
}

- (BOOL)isStolenDeviceProtectionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isIntelligenceEnabled
{
  return _os_feature_enabled_impl();
}

- (void)isUseCDPContextSecretInsteadOfSBDSecretEnabled
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_DEBUG, "UseCDPContextSecretInsteadOfSBDSecret = %{BOOL}d", (uint8_t *)v2, 8u);
}

@end
