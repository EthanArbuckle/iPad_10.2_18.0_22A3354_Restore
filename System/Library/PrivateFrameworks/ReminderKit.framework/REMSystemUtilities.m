@implementation REMSystemUtilities

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_30);
  return isInternalInstall_isInternalBuild;
}

uint64_t __39__REMSystemUtilities_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalInstall_isInternalBuild = result;
  return result;
}

+ (id)systemVersionDictionary
{
  void *v2;

  v2 = (void *)_CFCopyServerVersionDictionary();
  if (!v2)
    v2 = (void *)_CFCopySystemVersionDictionary();
  return v2;
}

+ (id)systemBuildVersion
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "systemVersionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
