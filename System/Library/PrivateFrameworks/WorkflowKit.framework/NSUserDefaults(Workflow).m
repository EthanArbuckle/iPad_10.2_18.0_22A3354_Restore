@implementation NSUserDefaults(Workflow)

+ (id)simulatedFeatureFlagState:()Workflow
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
  WFGetFeatureFlagTestingTable();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
  return v5;
}

+ (id)workflowUserDefaults
{
  if (workflowUserDefaults_onceToken != -1)
    dispatch_once(&workflowUserDefaults_onceToken, &__block_literal_global_804);
  return (id)workflowUserDefaults_workflowUserDefaults;
}

+ (id)systemShortcutsUserDefaults
{
  if (systemShortcutsUserDefaults_onceToken != -1)
    dispatch_once(&systemShortcutsUserDefaults_onceToken, &__block_literal_global_215);
  return (id)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
}

+ (id)siriAssistantUserDefaults
{
  if (siriAssistantUserDefaults_onceToken != -1)
    dispatch_once(&siriAssistantUserDefaults_onceToken, &__block_literal_global_227_793);
  return (id)siriAssistantUserDefaults_siriAssistantUserDefaults;
}

+ (void)setSimulatedStateForTesting:()Workflow forFeatureFlag:
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFGetFeatureFlagTestingTable();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
}

+ (uint64_t)bannersEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFBannersEnabled"));

  return v2;
}

+ (uint64_t)bannerWorkaroundsDisabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFDisableBannerWorkarounds"));

  return v2;
}

+ (uint64_t)universalPreviewsEnabled
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "simulatedFeatureFlagState:", CFSTR("universal_previews"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "BOOLValue");
  else
    v2 = _os_feature_enabled_impl();
  v3 = v2;

  return v3;
}

+ (uint64_t)allowActionsFromAllBundles
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFAllowActionsFromAllBundles"));

  return v2;
}

+ (uint64_t)watchAutomationEnabled
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "simulatedFeatureFlagState:", CFSTR("watch_automation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "BOOLValue");
  else
    v2 = _os_feature_enabled_impl();
  v3 = v2;

  return v3;
}

+ (uint64_t)remoteWidgetConfigurationEnabled
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "simulatedFeatureFlagState:", CFSTR("remote_widget_configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "BOOLValue");
  else
    v2 = _os_feature_enabled_impl();
  v3 = v2;

  return v3;
}

+ (uint64_t)initialBiomeStreamWrites
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFInitialBiomeStreamWritesKey"));

  return v2;
}

+ (uint64_t)toolKitIndexingEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFToolKitIndexingEnabled"));

  return v2;
}

+ (uint64_t)showAllAppIntents
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFIgnoreLinkVisibilityMetadata"));

  return v2;
}

+ (id)lastAppShortcutUpdateDate
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "systemShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("WFLastAppShortcutUpdateDateKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

@end
