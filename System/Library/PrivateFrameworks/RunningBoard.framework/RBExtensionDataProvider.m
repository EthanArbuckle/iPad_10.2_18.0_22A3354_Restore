@implementation RBExtensionDataProvider

- (BOOL)configureLaunchContext:(id)a3 error:(id *)a4
{
  NSObject *v4;
  uint8_t v6[16];

  if (MEMORY[0x24BDC7A20])
    return _EXConfigureLaunchContext();
  rbs_process_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_INFO, "Extension launch request made on platform that doesn't support ExtensionKit. Skipping extension launch by host check.", v6, 2u);
  }

  return 0;
}

@end
