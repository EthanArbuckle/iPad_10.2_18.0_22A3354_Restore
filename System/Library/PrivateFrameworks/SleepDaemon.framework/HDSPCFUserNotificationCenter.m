@implementation HDSPCFUserNotificationCenter

- (HDSPCFUserNotificationCenter)initWithEnvironment:(id)a3
{
  id v4;
  HDSPCFUserNotificationCenter *v5;
  HDSPCFUserNotificationCenter *v6;
  void (**v7)(void);
  uint64_t v8;
  HKSPMutexProvider *mutexProvider;
  NSMutableDictionary *v10;
  NSMutableDictionary *notifications;
  HDSPCFUserNotificationCenter *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSPCFUserNotificationCenter;
  v5 = -[HDSPCFUserNotificationCenter init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    objc_msgSend(v4, "mutexGenerator");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v6->_mutexProvider;
    v6->_mutexProvider = (HKSPMutexProvider *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    notifications = v6->_notifications;
    v6->_notifications = v10;

    v12 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)publishNotificationForEvent:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEA95C0]))
    goto LABEL_4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppleWatch");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v8, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPCFUserNotificationCenter _publishWakeDetectionNotificationForUserInfo:](self, "_publishWakeDetectionNotificationForUserInfo:", v4);
LABEL_4:

  }
}

- (void)_publishWakeDetectionNotificationForUserInfo:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  char v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = (id)objc_opt_class();
    v5 = v28;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] publishWakeDetectionNotification", buf, 0xCu);

  }
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BEA9778]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BEA9780]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((_DWORD)v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      v12 = v11;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode is on", buf, 0xCu);

    }
  }
  if ((_DWORD)v7)
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      v15 = v14;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] alarm is enabled", buf, 0xCu);

    }
  }
  -[HDSPCFUserNotificationCenter _wakeDetectionAlertTitleForAlarmEnabled:sleepModeOn:](self, "_wakeDetectionAlertTitleForAlarmEnabled:sleepModeOn:", v7, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPCFUserNotificationCenter _wakeDetectionAlertBodyForAlarmEnabled:sleepModeOn:](self, "_wakeDetectionAlertBodyForAlarmEnabled:sleepModeOn:", v7, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPCFUserNotificationCenter _confirmTextForForAlarmEnabled:sleepModeOn:](self, "_confirmTextForForAlarmEnabled:sleepModeOn:", v7, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPCFUserNotificationCenter _ignoreTextForForAlarmEnabled:sleepModeOn:](self, "_ignoreTextForForAlarmEnabled:sleepModeOn:", v7, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAppleWatch");
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke;
  v25[3] = &unk_24D4E48F0;
  objc_copyWeak(&v26, (id *)buf);
  LOBYTE(v23) = v22 ^ 1;
  -[HDSPCFUserNotificationCenter _publishNotificationWithIdentifier:title:message:defaultButtonTitle:otherButtonTitle:bypassDND:aboveLockScreen:actionHandler:](self, "_publishNotificationWithIdentifier:title:message:defaultButtonTitle:otherButtonTitle:bypassDND:aboveLockScreen:actionHandler:", *MEMORY[0x24BEA95C0], v16, v17, v18, v19, 1, v23, v25);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

void __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained(WeakRetained + 1);
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v12 = (id)objc_opt_class();
      v7 = v12;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] confirming the awake notification", buf, 0xCu);

    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke_185;
    v9[3] = &unk_24D4E3498;
    v10 = v4;
    -[NSObject perform:withSource:](v10, "perform:withSource:", v9, WeakRetained);
    v5 = v10;
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v8 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] dismissing the awake notification", buf, 0xCu);

  }
}

void __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke_185(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "actionManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "confirmWakeUp:", 1);

}

- (id)_wakeDetectionAlertTitleForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = CFSTR("EARLY_WAKEUP_TITLE_NONE");
  if (a3)
    v4 = CFSTR("EARLY_WAKEUP_TITLE_ALARM");
  v5 = CFSTR("EARLY_WAKEUP_TITLE_ALARM_AND_SLEEP_FOCUS");
  if (!a3)
    v5 = CFSTR("EARLY_WAKEUP_TITLE_SLEEP_FOCUS");
  if (a4)
    v6 = (__CFString *)v5;
  else
    v6 = (__CFString *)v4;
  HDSPLocalizedString(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_wakeDetectionAlertBodyForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = CFSTR("EARLY_WAKEUP_BODY_NONE");
  if (a3)
    v4 = CFSTR("EARLY_WAKEUP_BODY_ALARM");
  v5 = CFSTR("EARLY_WAKEUP_BODY_ALARM_AND_SLEEP_FOCUS");
  if (!a3)
    v5 = CFSTR("EARLY_WAKEUP_BODY_SLEEP_FOCUS");
  if (a4)
    v6 = (__CFString *)v5;
  else
    v6 = (__CFString *)v4;
  HDSPLocalizedString(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_confirmTextForForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  __CFString *v4;

  if (a3 || a4)
    v4 = CFSTR("EARLY_DISMISS_TURN_OFF");
  else
    v4 = CFSTR("EARLY_DISMISS_YES");
  HDSPLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_ignoreTextForForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  __CFString *v4;

  if (a3 || a4)
    v4 = CFSTR("EARLY_DISMISS_LEAVE_ON");
  else
    v4 = CFSTR("EARLY_DISMISS_NO");
  HDSPLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_publishNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 bypassDND:(BOOL)a8 aboveLockScreen:(BOOL)a9 actionHandler:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFDictionary *v29;
  NSObject *v30;
  id v31;
  CFUserNotificationRef v32;
  CFUserNotificationRef v33;
  SInt32 v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id WeakRetained;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  SInt32 error;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  const __CFDictionary *v59;
  _QWORD v60[10];
  _QWORD v61[12];

  v10 = a8;
  v61[10] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v51 = a10;
  v21 = *MEMORY[0x24BDBD6E0];
  v60[0] = *MEMORY[0x24BDBD6D8];
  v60[1] = v21;
  v61[0] = v17;
  v61[1] = v18;
  v22 = *MEMORY[0x24BDBD6F0];
  v60[2] = *MEMORY[0x24BDBD6F8];
  v60[3] = v22;
  v61[2] = v19;
  v61[3] = v20;
  v60[4] = *MEMORY[0x24BDBD6E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v23;
  v60[5] = *MEMORY[0x24BEB0E88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BEB0EA0];
  v61[5] = v24;
  v61[6] = &unk_24D4FEF80;
  v26 = *MEMORY[0x24BEB0E98];
  v60[6] = v25;
  v60[7] = v26;
  v27 = *MEMORY[0x24BEB0E70];
  v61[7] = *MEMORY[0x24BEB8D28];
  v61[8] = MEMORY[0x24BDBD1C8];
  v28 = *MEMORY[0x24BEB0E48];
  v60[8] = v27;
  v60[9] = v28;
  v61[9] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 10);
  v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v57 = (id)objc_opt_class();
    v58 = 2114;
    v59 = v29;
    v31 = v57;
    _os_log_impl(&dword_21610C000, v30, OS_LOG_TYPE_INFO, "[%{public}@] publishing notification with properties %{public}@", buf, 0x16u);

  }
  error = 0;
  v32 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v29);
  if (v32)
  {
    v33 = v32;
    v34 = error;
    HKSPLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v57 = v37;
        v58 = 1024;
        LODWORD(v59) = error;
        v38 = v37;
        _os_log_error_impl(&dword_21610C000, v36, OS_LOG_TYPE_ERROR, "[%{public}@] failed to post CFUserNotification (%d)", buf, 0x12u);

      }
    }
    else
    {
      v49 = v17;
      v50 = v16;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v57 = v40;
        v58 = 2114;
        v59 = (const __CFDictionary *)v16;
        v41 = v40;
        _os_log_impl(&dword_21610C000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting CFUserNotification for %{public}@", buf, 0x16u);

        v16 = v50;
      }

      CFRetain(v33);
      +[HDSPCFUserNotification userNotificationWithIdentifier:notification:actionHandler:](HDSPCFUserNotification, "userNotificationWithIdentifier:notification:actionHandler:", v16, v33, v51);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __157__HDSPCFUserNotificationCenter__publishNotificationWithIdentifier_title_message_defaultButtonTitle_otherButtonTitle_bypassDND_aboveLockScreen_actionHandler___block_invoke;
      v52[3] = &unk_24D4E4918;
      v52[4] = self;
      v43 = v50;
      v53 = v43;
      v54 = v42;
      v36 = v42;
      -[HDSPCFUserNotificationCenter _withLock:](self, "_withLock:", v52);
      WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
      objc_msgSend(WeakRetained, "assertionManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "takeAssertionWithIdentifier:type:timeout:", v43, 1, 1800.0);

      v16 = v50;
      +[HDSPCFUserNotificationCenterManager sharedManager](HDSPCFUserNotificationCenterManager, "sharedManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "postNotification:fromCenter:", v36, self);

      v17 = v49;
    }

    CFRelease(v33);
  }
  else
  {
    HKSPLogForCategory();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v47 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v57 = v47;
      v58 = 1024;
      LODWORD(v59) = error;
      v48 = v47;
      _os_log_error_impl(&dword_21610C000, v39, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create CFUserNotification (%d)", buf, 0x12u);

    }
  }

}

uint64_t __157__HDSPCFUserNotificationCenter__publishNotificationWithIdentifier_title_message_defaultButtonTitle_otherButtonTitle_bypassDND_aboveLockScreen_actionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)handleResponse:(unint64_t)a3 forUserNotification:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HDSPCFUserNotificationCenter *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] calling handler for %{public}@", buf, 0x16u);

  }
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __67__HDSPCFUserNotificationCenter_handleResponse_forUserNotification___block_invoke;
  v16 = &unk_24D4E3680;
  v17 = self;
  v18 = v6;
  v11 = v6;
  -[HDSPCFUserNotificationCenter _withLock:](self, "_withLock:", &v13);
  objc_msgSend(v11, "actionHandler", v13, v14, v15, v16, v17);
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, BOOL))v12)[2](v12, a3 == 0);

}

void __67__HDSPCFUserNotificationCenter_handleResponse_forUserNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__HDSPCFUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke;
  v12[3] = &unk_24D4E4940;
  v14 = &v15;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  -[HDSPCFUserNotificationCenter _withLock:](self, "_withLock:", v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "assertionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "releaseAssertionWithIdentifier:", v5);

  if (v16[5])
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2114;
      v24 = v5;
      v10 = v9;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] cancelling CFUserNotification for %{public}@", buf, 0x16u);

    }
    +[HDSPCFUserNotificationCenterManager sharedManager](HDSPCFUserNotificationCenterManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelNotification:fromCenter:", v16[5], self);

  }
  _Block_object_dispose(&v15, 8);

}

uint64_t __71__HDSPCFUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
}

- (void)tearDownNotifications
{
  -[HDSPCFUserNotificationCenter tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95C0]);
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (NSMutableDictionary)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
