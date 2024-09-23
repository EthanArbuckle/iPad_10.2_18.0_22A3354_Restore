@implementation HVProactiveHarvestingSystem

+ (void)startWithConfigurationAsset:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  v3 = a3;
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVProactiveHarvestingSystem: start", v6, 2u);
  }

  if (v3)
    +[HVContentAdmission registerConfigurationAsset:](HVContentAdmission, "registerConfigurationAsset:", v3);
  +[HVScheduledTasks registerScheduledTasks](HVScheduledTasks, "registerScheduledTasks");
  +[HVXPCInternalServerDelegate start](HVXPCInternalServerDelegate, "start");
  +[HVXPCSysdiagnoseServerDelegate start](HVXPCSysdiagnoseServerDelegate, "start");
  v5 = +[HVDonationReceiver defaultReceiver](HVDonationReceiver, "defaultReceiver");

}

@end
