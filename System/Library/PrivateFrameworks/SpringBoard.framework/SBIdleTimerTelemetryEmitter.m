@implementation SBIdleTimerTelemetryEmitter

- (void)logTelemetryForUpdatedIdleTimerState:(BOOL)a3 disablingClientBundleIdentifier:(id)a4 autoLockTimeoutDuration:(id)a5
{
  _BOOL8 v6;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v6 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  v9 = a5;
  if (logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__onceToken != -1)
    dispatch_once(&logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__onceToken, &__block_literal_global_142);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("idleTimerDisabled"));

  if (v8)
    v12 = v8;
  else
    v12 = &stru_1E8EC7EC0;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("bundleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("autoLockTimeoutDuration"));

  SBLogIdleTimer();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v16;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updated idle timer state telemetry: %{public}@", (uint8_t *)&v17, 0x16u);

  }
  -[SBIdleTimerTelemetryEmitter _emitPowerLogEventWithPPSTelemetryIdentifier:dictionary:](self, "_emitPowerLogEventWithPPSTelemetryIdentifier:dictionary:", logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__identifier, v10);

}

uint64_t __124__SBIdleTimerTelemetryEmitter_logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration___block_invoke()
{
  uint64_t result;

  result = PPSCreateTelemetryIdentifier();
  logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__identifier = result;
  return result;
}

- (void)_emitPowerLogEventWithPPSTelemetryIdentifier:(PPSTelemetryIdentifier *)a3 dictionary:(id)a4
{
  PPSSendTelemetry();
}

@end
