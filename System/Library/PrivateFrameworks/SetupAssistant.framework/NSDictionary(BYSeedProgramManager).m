@implementation NSDictionary(BYSeedProgramManager)

- (id)bySeedProgramManager_valueForProgramKey
{
  void *v2;
  NSObject *v3;

  if (objc_opt_class())
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C980]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BYSeedProgramManager currentSeedProgram].cold.1();

    v2 = 0;
  }
  return v2;
}

- (id)bySeedProgramManager_valueForAssetAudienceKey
{
  void *v2;
  NSObject *v3;

  if (objc_opt_class())
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C978]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BYSeedProgramManager currentSeedProgram].cold.1();

    v2 = 0;
  }
  return v2;
}

- (id)bySeedProgramManager_valueForProgramIDKey
{
  void *v2;
  NSObject *v3;

  if (objc_opt_class())
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C988]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BYSeedProgramManager currentSeedProgram].cold.1();

    v2 = 0;
  }
  return v2;
}

@end
