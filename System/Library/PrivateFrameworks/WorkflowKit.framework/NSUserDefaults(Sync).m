@implementation NSUserDefaults(Sync)

+ (id)syncShortcutsUserDefaults
{
  if (syncShortcutsUserDefaults_onceToken[0] != -1)
    dispatch_once(syncShortcutsUserDefaults_onceToken, &__block_literal_global_50051);
  return (id)syncShortcutsUserDefaults_syncShortcutsUserDefaults;
}

+ (uint64_t)databaseCoherenceEnabled
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "simulatedFeatureFlagState:", CFSTR("toprak_coherence"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "BOOLValue");
  else
    v2 = _os_feature_enabled_impl();
  v3 = v2;

  return v3;
}

+ (uint64_t)shouldSyncCoherence
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "databaseCoherenceEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "syncShortcutsUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("WFShortcutsShouldSyncCoherence"));

    return v4;
  }
  return result;
}

+ (void)setShouldSyncCoherence:()Sync
{
  id v4;

  objc_msgSend(a1, "syncShortcutsUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", a3, CFSTR("WFShortcutsShouldSyncCoherence"));

}

+ (uint64_t)syncEventLoggingEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "syncShortcutsUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("WFSyncEventLoggingEnabled"));

  return v2;
}

+ (void)setSyncEventLoggingEnabled:()Sync
{
  id v4;

  objc_msgSend(a1, "syncShortcutsUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", a3, CFSTR("WFSyncEventLoggingEnabled"));

}

@end
