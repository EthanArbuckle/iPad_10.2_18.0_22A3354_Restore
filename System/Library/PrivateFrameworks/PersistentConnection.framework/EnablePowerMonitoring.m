@implementation EnablePowerMonitoring

void ___EnablePowerMonitoring_block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!sPowerMonitoringTimers)
  {
    +[PCLog timer](PCLog, "timer");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1CBC1B000, v2, OS_LOG_TYPE_DEFAULT, "PCSimpleTimer - enabling power monitoring", (uint8_t *)&v9, 2u);
    }

    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)sPowerMonitoringTimers;
    sPowerMonitoringTimers = (uint64_t)v3;

    if (!sPMConnection)
    {
      sPMConnection = IORegisterForSystemPower(0, (IONotificationPortRef *)&sPMPort, (IOServiceInterestCallback)_powerChangedHandler, sPMNotifier);
      if (sPMConnection)
      {
        v5 = dispatch_queue_create("PCSimpleTimer-IOPowerManagement", 0);
        IONotificationPortSetDispatchQueue((IONotificationPortRef)sPMPort, v5);

      }
    }
  }
  objc_msgSend((id)sPowerMonitoringTimers, "addObject:", *(_QWORD *)(a1 + 32));
  +[PCLog timer](PCLog, "timer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend((id)sPowerMonitoringTimers, "count");
    v9 = 138543618;
    v10 = v7;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_1CBC1B000, v6, OS_LOG_TYPE_DEFAULT, "Enabling power monitoring for %{public}@ - %lu timers", (uint8_t *)&v9, 0x16u);
  }

}

@end
