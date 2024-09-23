@implementation HKSPSleepWidgetManager

- (HKSPSleepWidgetManager)init
{
  void *v3;
  void *v4;
  HKSPSleepWidgetManager *v5;

  objc_msgSend((id)objc_opt_class(), "defaultTimelineControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultRelevanceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKSPSleepWidgetManager initWithTimelineControllers:relevanceController:](self, "initWithTimelineControllers:relevanceController:", v3, v4);

  return v5;
}

- (HKSPSleepWidgetManager)initWithTimelineControllers:(id)a3 relevanceController:(id)a4
{
  id v7;
  id v8;
  HKSPSleepWidgetManager *v9;
  HKSPSleepWidgetManager *v10;
  uint64_t v11;
  NAScheduler *chsScheduler;
  HKSPSleepWidgetManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepWidgetManager;
  v9 = -[HKSPSleepWidgetManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timelineControllers, a3);
    objc_storeStrong((id *)&v10->_relevanceController, a4);
    objc_msgSend(MEMORY[0x1E0D519E8], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.HKSPSleepWidgetManager.serial"));
    v11 = objc_claimAutoreleasedReturnValue();
    chsScheduler = v10->_chsScheduler;
    v10->_chsScheduler = (NAScheduler *)v11;

    v13 = v10;
  }

  return v10;
}

+ (id)defaultTimelineControllers
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "widgetKinds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKSPSleepWidgetManager_defaultTimelineControllers__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__HKSPSleepWidgetManager_defaultTimelineControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getCHSTimelineControllerClass_softClass;
  v14 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getCHSTimelineControllerClass_block_invoke;
    v10[3] = &unk_1E4E3C680;
    v10[4] = &v11;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v6 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "widgetBundleIdentifierForCurrentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithExtensionBundleIdentifier:kind:", v7, v3);

  return v8;
}

+ (id)defaultRelevanceController
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCHSWidgetServiceClass_softClass;
  v9 = getCHSWidgetServiceClass_softClass;
  if (!getCHSWidgetServiceClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCHSWidgetServiceClass_block_invoke;
    v5[3] = &unk_1E4E3C680;
    v5[4] = &v6;
    __getCHSWidgetServiceClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedWidgetService");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)widgetKinds
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.health.SleepStageWidget");
  v3[1] = CFSTR("com.apple.health.SleepWidget");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reloadWidgetsWithReason:(unint64_t)a3
{
  void *v5;
  char v6;
  NSArray *timelineControllers;
  id v8;
  _QWORD v9[5];
  id v10;
  char v11;

  objc_msgSend((id)objc_opt_class(), "_widgetReloadDescription:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "_shouldForceWidgetReload:", a3);
  timelineControllers = self->_timelineControllers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke;
  v9[3] = &unk_1E4E3C630;
  v9[4] = self;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  -[NSArray na_each:](timelineControllers, "na_each:", v9);

}

void __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

  if (WeakRetained
    && (v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8)),
        v7 = objc_msgSend(v6, "shouldReloadWidgetOfKind:", v4),
        v6,
        !v7))
  {
    HKSPLogForCategory(0x12uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = (id)objc_opt_class();
      v26 = 2114;
      v27 = v4;
      v17 = v25;
      _os_log_impl(&dword_1A4F0E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] not reloading %{public}@ timeline", buf, 0x16u);

    }
  }
  else
  {
    HKSPLogForCategory(0x12uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v25 = v9;
      v26 = 2114;
      v27 = v4;
      v28 = 2114;
      v29 = v10;
      v30 = 1024;
      v31 = v11;
      v12 = v9;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] reloading %{public}@ timeline (reason: %{public}@, forceReload: %d)", buf, 0x26u);

    }
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke_199;
    v18[3] = &unk_1E4E3C608;
    v23 = *(_BYTE *)(a1 + 48);
    v19 = v3;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v20 = v14;
    v21 = v15;
    v22 = v4;
    objc_msgSend(v13, "performBlock:", v18);

    v16 = v19;
  }

}

void __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke_199(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "reloadTimelineWithReason:", v4);
  else
    objc_msgSend(v3, "reloadTimelineBudgetedWithReason:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(0x12uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 56);
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v5;
      v10 = v8;
      _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to reload %{public}@ timeline (error: %{public}@)", (uint8_t *)&v13, 0x20u);
LABEL_9:

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_opt_class();
    v12 = *(_QWORD *)(a1 + 56);
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v10 = v11;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_INFO, "[%{public}@] successfully reloaded %{public}@ timeline", (uint8_t *)&v13, 0x16u);
    goto LABEL_9;
  }

}

- (void)invalidateRelevances
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend((id)objc_opt_class(), "widgetKinds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke;
  v4[3] = &unk_1E4E3C658;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);

}

void __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  int v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

  if (WeakRetained
    && (v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8)),
        v6 = objc_msgSend(v5, "shouldInvalidateRelevanceForWidgetOfKind:", v3),
        v5,
        !v6))
  {
    HKSPLogForCategory(0x12uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v3;
      v12 = v16;
      _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] not invalidating %{public}@ relevances", buf, 0x16u);

    }
  }
  else
  {
    HKSPLogForCategory(0x12uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v3;
      v8 = v16;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating %{public}@ relevances", buf, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_202;
    v13[3] = &unk_1E4E3A760;
    v13[4] = v9;
    v14 = v3;
    objc_msgSend(v10, "performBlock:", v13);

  }
}

void __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_202(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend((id)objc_opt_class(), "widgetContainerBundleIdentifierForCurrentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_2;
  v6[3] = &unk_1E4E3BD70;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v3, "invalidateRelevancesOfKind:inBundle:completion:", v2, v4, v6);

}

void __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(0x12uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 138543874;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      v15 = 2114;
      v16 = v3;
      v8 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to invalidate %{public}@ relevances (error: %{public}@)", (uint8_t *)&v11, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    v8 = v9;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_INFO, "[%{public}@] successfully invalidated %{public}@ relevances", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }

}

+ (id)widgetBundleIdentifierForCurrentDevice
{
  void *v2;
  unint64_t v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_device");

  v4 = v3 > 6 || ((1 << v3) & 0x7A) == 0;
  if (!v4 || v3 == 1000)
    return CFSTR("com.apple.Health.Sleep.SleepWidgetExtension");
  else
    return CFSTR("com.apple.NanoSleep.watchkitapp.NanoSleepWidgetExtension");
}

+ (id)widgetContainerBundleIdentifierForCurrentDevice
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_device");

  if (v3 == 2)
    v4 = CFSTR("com.apple.NanoSleep.watchkitapp");
  else
    v4 = CFSTR("com.apple.Health.Sleep");
  return v4;
}

+ (BOOL)_shouldForceWidgetReload:(unint64_t)a3
{
  return (a3 < 5) & (0x1Du >> a3);
}

+ (id)_widgetReloadDescription:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Unknown");
  else
    return off_1E4E3C6B8[a3];
}

- (HKSPSleepWidgetManagerDelegate)delegate
{
  return (HKSPSleepWidgetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)timelineControllers
{
  return self->_timelineControllers;
}

- (HKSPWidgetRelevanceController)relevanceController
{
  return self->_relevanceController;
}

- (NAScheduler)chsScheduler
{
  return self->_chsScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chsScheduler, 0);
  objc_storeStrong((id *)&self->_relevanceController, 0);
  objc_storeStrong((id *)&self->_timelineControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
