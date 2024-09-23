@implementation SBIdleTimerGlobalNumericSettingMonitor

void __59___SBIdleTimerGlobalNumericSettingMonitor__settingChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_updateCache"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogIdleTimer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "formattedValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v8;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%@ _settingChanged:] - reason: %{public}@, setting: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "idleTimerGlobalSettingMonitor:changedForReason:", *(_QWORD *)(a1 + 32), v5);

  }
}

@end
