@implementation PCLog

+ (OS_os_log)timer
{
  if (timer_onceToken != -1)
    dispatch_once(&timer_onceToken, &__block_literal_global_4_0);
  return (OS_os_log *)(id)timer___log;
}

+ (OS_os_log)wakeManager
{
  if (wakeManager_onceToken != -1)
    dispatch_once(&wakeManager_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)wakeManager___log;
}

+ (id)logWithCategory:(const char *)a3
{
  return os_log_create("com.apple.PersistentConnection", a3);
}

+ (OS_os_log)usabilityMonitor
{
  if (usabilityMonitor_onceToken != -1)
    dispatch_once(&usabilityMonitor_onceToken, &__block_literal_global_8);
  return (OS_os_log *)(id)usabilityMonitor___log;
}

void __25__PCLog_usabilityMonitor__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PersistentConnection", "usabilityMonitor");
  v1 = (void *)usabilityMonitor___log;
  usabilityMonitor___log = (uint64_t)v0;

}

void __20__PCLog_wakeManager__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PersistentConnection", "wakeManager");
  v1 = (void *)wakeManager___log;
  wakeManager___log = (uint64_t)v0;

}

void __14__PCLog_timer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PersistentConnection", "timer");
  v1 = (void *)timer___log;
  timer___log = (uint64_t)v0;

}

+ (OS_os_log)interfaceManager
{
  if (interfaceManager_onceToken != -1)
    dispatch_once(&interfaceManager_onceToken, &__block_literal_global_6_0);
  return (OS_os_log *)(id)interfaceManager___log;
}

void __25__PCLog_interfaceManager__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PersistentConnection", "interfaceManager");
  v1 = (void *)interfaceManager___log;
  interfaceManager___log = (uint64_t)v0;

}

@end
