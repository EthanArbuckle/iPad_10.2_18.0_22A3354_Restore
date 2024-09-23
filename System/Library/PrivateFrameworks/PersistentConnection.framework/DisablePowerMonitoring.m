@implementation DisablePowerMonitoring

void ___DisablePowerMonitoring_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PCLog timer](PCLog, "timer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v3;
    v8 = 2048;
    v9 = objc_msgSend((id)sPowerMonitoringTimers, "count") - 1;
    _os_log_impl(&dword_1CBC1B000, v2, OS_LOG_TYPE_DEFAULT, "Disabling power monitoring for %{public}@ - %lu timers", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend((id)sPowerMonitoringTimers, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend((id)sPowerMonitoringTimers, "count"))
  {
    +[PCLog timer](PCLog, "timer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1CBC1B000, v4, OS_LOG_TYPE_DEFAULT, "PCSimpleTimer - no timers left, disabling power monitoring", (uint8_t *)&v6, 2u);
    }

    v5 = (void *)sPowerMonitoringTimers;
    sPowerMonitoringTimers = 0;

    if (sPMConnection)
    {
      IODeregisterForSystemPower(sPMNotifier);
      IONotificationPortDestroy((IONotificationPortRef)sPMPort);
      IOServiceClose(sPMConnection);
      sPMConnection = 0;
    }
  }
}

@end
