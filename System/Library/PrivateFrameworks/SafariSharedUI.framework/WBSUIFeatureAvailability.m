@implementation WBSUIFeatureAvailability

+ (BOOL)isLockdownModeEnabledForSafari
{
  void *v2;
  char v3;

  if (isLockdownModeEnabledForSafari_onceToken != -1)
    dispatch_once(&isLockdownModeEnabledForSafari_onceToken, &__block_literal_global_59);
  objc_msgSend((id)isLockdownModeEnabledForSafari_configuration, "defaultWebpagePreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_captivePortalModeEnabled");

  return v3;
}

void __58__WBSUIFeatureAvailability_isLockdownModeEnabledForSafari__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  v1 = (void *)isLockdownModeEnabledForSafari_configuration;
  isLockdownModeEnabledForSafari_configuration = (uint64_t)v0;

}

@end
