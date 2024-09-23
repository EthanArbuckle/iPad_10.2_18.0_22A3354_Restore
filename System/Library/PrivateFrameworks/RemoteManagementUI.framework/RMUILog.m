@implementation RMUILog

+ (OS_os_log)configurationInterface
{
  if (configurationInterface_onceToken != -1)
    dispatch_once(&configurationInterface_onceToken, &__block_literal_global);
  return (OS_os_log *)(id)configurationInterface_result;
}

void __57__RMUILog_configurationInterface__configurationInterface__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.remotemanagementd", "configurationInterface");
  v1 = (void *)configurationInterface_result;
  configurationInterface_result = (uint64_t)v0;

}

+ (OS_os_log)profilesViewModelProvider
{
  if (profilesViewModelProvider_onceToken != -1)
    dispatch_once(&profilesViewModelProvider_onceToken, &__block_literal_global_0);
  return (OS_os_log *)(id)profilesViewModelProvider_result;
}

void __63__RMUILog_profilesViewModelProvider__profilesViewModelProvider__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.remotemanagementd", "profilesViewModelProvider");
  v1 = (void *)profilesViewModelProvider_result;
  profilesViewModelProvider_result = (uint64_t)v0;

}

+ (OS_os_log)pluginViewModelProvider
{
  if (pluginViewModelProvider_onceToken != -1)
    dispatch_once(&pluginViewModelProvider_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)pluginViewModelProvider_result;
}

void __59__RMUILog_pluginViewModelProvider__pluginViewModelProvider__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.remotemanagementd", "pluginViewModelProvider");
  v1 = (void *)pluginViewModelProvider_result;
  pluginViewModelProvider_result = (uint64_t)v0;

}

@end
