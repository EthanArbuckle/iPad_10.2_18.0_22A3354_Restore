@implementation PowerUIChargeAwarenessNotifier

- (void)postNotificationsIfNecessary
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_215A71000, a2, OS_LOG_TYPE_ERROR, "Unable to get battery properties: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6_0();
}

- (void)displayNotificationForMCL:(BOOL)a3 forWireless:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v4 = a4;
  v5 = a3;
  v47 = *MEMORY[0x24BDAC8D0];
  if ((!_os_feature_enabled_impl() || (MGGetBoolAnswer() & 1) == 0) && !self->_allowNotificationsOverride)
  {
    log = self->_log;
    v4 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Feature not enabled or not supported.", buf, 2u);
      v4 = 0;
    }
  }
  if ((!_os_feature_enabled_impl() || !MGGetBoolAnswer() || (MGGetBoolAnswer() & 1) == 0)
    && !self->_allowNotificationsOverride)
  {
    v8 = self->_log;
    v5 = 0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Feature not enabled or not supported.", buf, 2u);
      v5 = 0;
    }
  }
  if (self->_haveShownWireless)
  {
    v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:].cold.3(v9, v10, v11, v12, v13, v14, v15, v16);
    v4 = 0;
  }
  if (self->_haveShownMCL)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    v5 = 0;
  }
  if (v4 || v5)
  {
    v25 = MEMORY[0x24BDAC760];
    if (v4)
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke;
      v44[3] = &unk_24D3FBB48;
      v44[4] = self;
      -[PowerUIChargeAwarenessNotifier forceDisplayWirelessChargingNotification:](self, "forceDisplayWirelessChargingNotification:", v44);
    }
    if (v5)
    {
      v43[0] = v25;
      v43[1] = 3221225472;
      v43[2] = __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_89;
      v43[3] = &unk_24D3FBB48;
      v43[4] = self;
      -[PowerUIChargeAwarenessNotifier forceDisplayMCLNotification:](self, "forceDisplayMCLNotification:", v43);
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    objc_msgSend(v27, "numberWithInt:", (int)((v29 - self->_firstInitDate) / 86400.0));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("daysSinceInit"));

    v31 = CFSTR("Wireless");
    if (v4 && v5)
      v31 = CFSTR("Both");
    if (v4)
      v32 = v31;
    else
      v32 = CFSTR("ManualChargeLimit");
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, CFSTR("notificationType"));
    v33 = v26;
    AnalyticsSendEventLazy();
    v34 = self->_log;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v33;
      _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "Sending charge awareness CA event: %@", buf, 0xCu);
    }

  }
  else
  {
    v35 = self->_log;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (PowerUIChargeAwarenessNotifier)init
{
  PowerUIChargeAwarenessNotifier *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  os_log_t v5;
  OS_os_log *log;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  UNUserNotificationCenter *unCenter;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  PowerUIChargeAwarenessNotifier *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  _CDLocalContext *context;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PowerUIChargeAwarenessNotifier *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  PowerUIChargeAwarenessNotifier *v44;
  NSObject *v45;
  _QWORD v47[4];
  PowerUIChargeAwarenessNotifier *v48;
  int out_token;
  _QWORD handler[4];
  PowerUIChargeAwarenessNotifier *v51;
  _QWORD v52[4];
  PowerUIChargeAwarenessNotifier *v53;
  _QWORD v54[4];
  PowerUIChargeAwarenessNotifier *v55;
  _QWORD v56[4];
  PowerUIChargeAwarenessNotifier *v57;
  objc_super v58;
  uint8_t buf[4];
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)PowerUIChargeAwarenessNotifier;
  v2 = -[PowerUIChargeAwarenessNotifier init](&v58, sel_init);
  if (!v2)
  {
LABEL_43:
    v27 = v2;
    goto LABEL_44;
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.smartcharging.topoffprotection"));
  defaults = v2->_defaults;
  v2->_defaults = (NSUserDefaults *)v3;

  v5 = os_log_create("com.apple.powerui", "chargingAwarenessNotifications");
  log = v2->_log;
  v2->_log = (OS_os_log *)v5;

  -[PowerUIChargeAwarenessNotifier log](v2, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "ChargingAwarenessNotifier initiating...", buf, 2u);
  }

  -[PowerUIChargeAwarenessNotifier readFirstInitDate](v2, "readFirstInitDate");
  v2->_allowNotificationsOverride = 0;
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("allowMCLOverride"), CFSTR("com.apple.smartcharging.topoffprotection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v2->_allowNotificationsOverride = objc_msgSend(v8, "BOOLValue");
    -[PowerUIChargeAwarenessNotifier log](v2, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "... initialization allowed via override...", buf, 2u);
    }

  }
  v11 = -[PowerUIChargeAwarenessNotifier readHaveShownMCL](v2, "readHaveShownMCL");
  v12 = -[PowerUIChargeAwarenessNotifier readHaveShownWireless](v2, "readHaveShownWireless");
  if (v11 && v12 && !v2->_allowNotificationsOverride)
  {
    -[PowerUIChargeAwarenessNotifier log](v2, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "... notifications were already shown, do not init.";
LABEL_28:
      _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    }
  }
  else
  {
    if ((MGGetBoolAnswer() & 1) != 0 || (MGGetBoolAnswer() & 1) != 0 || v2->_allowNotificationsOverride)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = dispatch_queue_create("com.apple.powerui.chargingawarenessqueue", v13);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v14;

      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.powerui.chargeawareness"));
      unCenter = v2->_unCenter;
      v2->_unCenter = (UNUserNotificationCenter *)v16;

      -[UNUserNotificationCenter setDelegate:](v2->_unCenter, "setDelegate:", v2);
      -[UNUserNotificationCenter setPrivateDelegate:](v2->_unCenter, "setPrivateDelegate:", v2);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_unCenter, "setWantsNotificationResponsesDelivered");
      v18 = MEMORY[0x24BDAC760];
      if (!v2->_haveShownMCL
        && -[PowerUIChargeAwarenessNotifier readNotificationPendingMCL](v2, "readNotificationPendingMCL"))
      {
        objc_msgSend(MEMORY[0x24BE858B0], "sharedNotifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "currentState");

        -[PowerUIChargeAwarenessNotifier log](v2, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v60 = v20;
          _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "setup state: %lu", buf, 0xCu);
        }

        -[PowerUIChargeAwarenessNotifier log](v2, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v20 > 1)
        {
          if (v23)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "MCL notification was pending, buddy complete, display now", buf, 2u);
          }

          -[PowerUIChargeAwarenessNotifier displayPendingMCLNotification](v2, "displayPendingMCLNotification");
        }
        else
        {
          if (v23)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "MCL notification pending, set up callback", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BE858B0], "sharedNotifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = v18;
          v56[1] = 3221225472;
          v56[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke;
          v56[3] = &unk_24D3FB7B0;
          v57 = v2;
          objc_msgSend(v24, "addStateCompletionObserver:forState:", v56, 2);

        }
      }
      if (!v2->_haveShownWireless
        && -[PowerUIChargeAwarenessNotifier readNotificationPendingWireless](v2, "readNotificationPendingWireless"))
      {
        objc_msgSend(MEMORY[0x24BE858B0], "sharedNotifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "currentState");

        -[PowerUIChargeAwarenessNotifier log](v2, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v29 > 1)
        {
          if (v31)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "wireless notification was pending, buddy complete, display now", buf, 2u);
          }

          -[PowerUIChargeAwarenessNotifier displayPendingWirelessNotification](v2, "displayPendingWirelessNotification");
        }
        else
        {
          if (v31)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "wireless notification pending, set up callback", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BE858B0], "sharedNotifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = v18;
          v54[1] = 3221225472;
          v54[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_18;
          v54[3] = &unk_24D3FB7B0;
          v55 = v2;
          objc_msgSend(v32, "addStateCompletionObserver:forState:", v54, 2);

        }
      }
      objc_msgSend(MEMORY[0x24BE1B170], "userContext");
      v33 = objc_claimAutoreleasedReturnValue();
      context = v2->_context;
      v2->_context = (_CDLocalContext *)v33;

      v35 = (void *)MEMORY[0x24BE1B1A0];
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForForegroundApp");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "predicateForKeyPath:withFormat:", v36, CFSTR("(SELF.%@.value.rawExternalConnected = %@) AND NOT (SELF.%@.value = %@)"), v37, MEMORY[0x24BDBD1C8], v38, CFSTR("com.apple.camera"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v52[0] = v18;
      v52[1] = 3221225472;
      v52[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_27;
      v52[3] = &unk_24D3FBB00;
      v40 = v2;
      v53 = v40;
      v41 = (void *)MEMORY[0x2199EC2D0](v52);
      objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.powerui.chargingAwarenessNotifications"), v39, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDLocalContext registerCallback:](v2->_context, "registerCallback:", v42);
      *(_DWORD *)buf = 0;
      v43 = v2->_queue;
      handler[0] = v18;
      handler[1] = 3221225472;
      handler[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_3;
      handler[3] = &unk_24D3FB748;
      v44 = v40;
      v51 = v44;
      notify_register_dispatch("com.apple.powerui.testdisplaywireless", (int *)buf, v43, handler);
      out_token = 0;
      v45 = v2->_queue;
      v47[0] = v18;
      v47[1] = 3221225472;
      v47[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_36;
      v47[3] = &unk_24D3FB748;
      v48 = v44;
      notify_register_dispatch("com.apple.powerui.testdisplaynotifications", &out_token, v45, v47);

      goto LABEL_43;
    }
    -[PowerUIChargeAwarenessNotifier log](v2, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "... features not supported, do not init.";
      goto LABEL_28;
    }
  }

  v27 = 0;
LABEL_44:

  return v27;
}

void __38__PowerUIChargeAwarenessNotifier_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2;
  block[3] = &unk_24D3FB7B0;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayPendingMCLNotification");
}

void __38__PowerUIChargeAwarenessNotifier_init__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_19;
  block[3] = &unk_24D3FB7B0;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayPendingWirelessNotification");
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_28;
  block[3] = &unk_24D3FB7B0;
  v5 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);

  return 1;
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationsIfNecessary");
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to display wireless charging notification", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "displayNotificationForMCL:forWireless:", 0, 1);
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_36(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to display feature availability notifications", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "postNotificationsIfNecessary");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_notifier_0;
}

void __48__PowerUIChargeAwarenessNotifier_sharedInstance__block_invoke()
{
  PowerUIChargeAwarenessNotifier *v0;
  void *v1;

  v0 = objc_alloc_init(PowerUIChargeAwarenessNotifier);
  v1 = (void *)sharedInstance_notifier_0;
  sharedInstance_notifier_0 = (uint64_t)v0;

}

- (BOOL)readHaveShownWireless
{
  BOOL result;

  result = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("haveShownWirelessNotification"));
  self->_haveShownWireless = result;
  return result;
}

- (BOOL)readHaveShownMCL
{
  BOOL result;

  result = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("haveShownMCLNotification"));
  self->_haveShownMCL = result;
  return result;
}

- (void)recordHaveShownWireless
{
  self->_haveShownWireless = 1;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("haveShownWirelessNotification"));
}

- (void)recordHaveShownMCL
{
  self->_haveShownMCL = 1;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("haveShownMCLNotification"));
}

- (BOOL)readNotificationPendingMCL
{
  BOOL result;

  result = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("notificationPendingMCL"));
  self->_notificationPendingMCL = result;
  return result;
}

- (BOOL)readNotificationPendingWireless
{
  BOOL result;

  result = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("notificationPendingWireless"));
  self->_notificationPendingWireless = result;
  return result;
}

- (void)recordNotificationPendingMCL
{
  self->_notificationPendingMCL = 1;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("notificationPendingMCL"));
}

- (void)recordNotificationPendingWireless
{
  self->_notificationPendingWireless = 1;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("notificationPendingWireless"));
}

- (void)displayPendingMCLNotification
{
  -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:](self, "displayNotificationForMCL:forWireless:", 1, 0);
  self->_notificationPendingMCL = 0;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 0, CFSTR("notificationPendingMCL"));
}

- (void)displayPendingWirelessNotification
{
  -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:](self, "displayNotificationForMCL:forWireless:", 0, 1);
  self->_notificationPendingWireless = 0;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 0, CFSTR("notificationPendingWireless"));
}

- (void)readFirstInitDate
{
  double v3;
  void *v4;
  double v5;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("firstInitDate"));
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    self->_firstInitDate = v5;

    -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("firstInitDate"), self->_firstInitDate);
  }
  else
  {
    self->_firstInitDate = v3;
  }
}

+ (id)contentForType:(int)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (a3 != 1)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v8 = CFSTR("wirelesscharging");
    v9 = CFSTR("lotxWirelessCategory");
    v10 = CFSTR("AWARENESS_CHARGING_NOTIFICATION_WIRELESS_CONTENT");
    v11 = CFSTR("AWARENESS_CHARGING_NOTIFICATION_WIRELESS_TITLE");
  }
  else
  {
    v8 = CFSTR("bolt.fill");
    v9 = CFSTR("lotxMCLCategory");
    v10 = CFSTR("AWARENESS_CHARGING_NOTIFICATION_LIMIT_CONTENT");
    v11 = CFSTR("AWARENESS_CHARGING_NOTIFICATION_LIMIT_TITLE");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v11, &stru_24D3FD658, CFSTR("Localizable-LotX"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v12);

  objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_24D3FD658, CFSTR("Localizable-LotX"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v13);

  objc_msgSend(v4, "setCategoryIdentifier:", v9);
  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:", v14);

  objc_msgSend(v4, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v4, "setShouldHideDate:", 1);
  objc_msgSend(v4, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpirationDate:", v15);

  objc_msgSend(v4, "setShouldDisplayActionsInline:", 1);
  objc_msgSend(v4, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v16);

  v17 = v4;
LABEL_7:

  return v17;
}

+ (id)requestForContent:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "contentForType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("chargingAwareness-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDestinations:", 15);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)forceDisplayMCLNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  uint8_t v7[16];

  v4 = a3;
  -[PowerUIChargeAwarenessNotifier cancelNotificationRequestWithIdentifier:](self, "cancelNotificationRequestWithIdentifier:", CFSTR("chargingAwareness-0"));
  objc_msgSend((id)objc_opt_class(), "requestForContent:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Displaying MCL Notification", v7, 2u);
    }
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v5, v4);
  }

}

- (void)forceDisplayWirelessChargingNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  uint8_t v7[16];

  v4 = a3;
  -[PowerUIChargeAwarenessNotifier cancelNotificationRequestWithIdentifier:](self, "cancelNotificationRequestWithIdentifier:", CFSTR("chargingAwareness-1"));
  objc_msgSend((id)objc_opt_class(), "requestForContent:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Displaying Wireless Notification", v7, 2u);
    }
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v5, v4);
  }

}

- (void)cancelNotificationRequestWithIdentifier:(id)a3
{
  UNUserNotificationCenter *unCenter;
  void *v5;
  id v6;
  void *v7;
  UNUserNotificationCenter *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  unCenter = self->_unCenter;
  v11[0] = a3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](unCenter, "removeDeliveredNotificationsWithIdentifiers:", v7);

  v8 = self->_unCenter;
  v10 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](v8, "removePendingNotificationRequestsWithIdentifiers:", v9);

}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    v5 = v4[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    objc_msgSend(v4, "recordHaveShownWireless");
  }

}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    v5 = v4[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_89_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    objc_msgSend(v4, "recordHaveShownMCL");
  }

}

id __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_103(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __62__PowerUIChargeAwarenessNotifier_postNotificationsIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayPendingMCLNotification");
}

uint64_t __62__PowerUIChargeAwarenessNotifier_postNotificationsIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayPendingWirelessNotification");
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *log;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  void *v33;
  int v34;
  NSObject *v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v9;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_INFO, "notification request response coming in %@ for center %@", buf, 0x16u);
  }
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v9, "actionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v14;
    _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_INFO, "notification request coming in: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("notificationType"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("error"), CFSTR("action"));
  objc_msgSend(v9, "notification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "content");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "categoryIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("lotxWirelessCategory"));

  if ((v20 & 1) != 0)
  {
    v21 = CFSTR("wireless");
  }
  else
  {
    objc_msgSend(v9, "notification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "content");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "categoryIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("lotxMCLCategory"));

    if (!v26)
      goto LABEL_10;
    v21 = CFSTR("mcl");
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("notificationType"));
LABEL_10:
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("notificationType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    goto LABEL_22;
  objc_msgSend(v9, "actionIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("poweruiNoOp"));

  if (v29)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("selectedOK"), CFSTR("action"));
    -[PowerUIChargeAwarenessNotifier log](self, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("notificationType"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      v32 = "User selected 'OK' on %@ notification";
LABEL_17:
      _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  objc_msgSend(v9, "actionIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x24BDF8A70]);

  if (v34)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("dismissed"), CFSTR("action"));
    -[PowerUIChargeAwarenessNotifier log](self, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("notificationType"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      v32 = "User dismissed %@ notification";
      goto LABEL_17;
    }
LABEL_18:

  }
  -[PowerUIChargeAwarenessNotifier log](self, "log");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v15;
    _os_log_impl(&dword_215A71000, v35, OS_LOG_TYPE_DEFAULT, "Logging to CA: %@", buf, 0xCu);
  }

  v36 = v15;
  AnalyticsSendEventLazy();

LABEL_22:
  v10[2](v10);

}

id __110__PowerUIChargeAwarenessNotifier_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_INFO, "notification request response coming in %@ for center %@", buf, 0x16u);
  }
  v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v7, "actionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_INFO, "notification request coming in: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("notificationType"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("selectedLearnMore"), CFSTR("action"));
  objc_msgSend(v7, "actionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("poweruiLearnMoreWireless"));

  if ((v14 & 1) != 0)
  {
    v15 = CFSTR("wireless");
  }
  else
  {
    objc_msgSend(v7, "actionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("poweruiLearnMoreMCL"));

    if (!v17)
      goto LABEL_10;
    v15 = CFSTR("mcl");
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("notificationType"));
LABEL_10:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("notificationType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PowerUIChargeAwarenessNotifier log](self, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("notificationType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "User selected 'learn more' on %@ notification", buf, 0xCu);

    }
    -[PowerUIChargeAwarenessNotifier log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "Logging to CA: %@", buf, 0xCu);
    }

    v22 = v12;
    AnalyticsSendEventLazy();

  }
}

id __87__PowerUIChargeAwarenessNotifier_userNotificationCenter_didOpenApplicationForResponse___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
  objc_storeStrong((id *)&self->_unCenter, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (BOOL)haveShownWireless
{
  return self->_haveShownWireless;
}

- (void)setHaveShownWireless:(BOOL)a3
{
  self->_haveShownWireless = a3;
}

- (BOOL)notificationPendingWireless
{
  return self->_notificationPendingWireless;
}

- (void)setNotificationPendingWireless:(BOOL)a3
{
  self->_notificationPendingWireless = a3;
}

- (BOOL)haveShownMCL
{
  return self->_haveShownMCL;
}

- (void)setHaveShownMCL:(BOOL)a3
{
  self->_haveShownMCL = a3;
}

- (BOOL)notificationPendingMCL
{
  return self->_notificationPendingMCL;
}

- (void)setNotificationPendingMCL:(BOOL)a3
{
  self->_notificationPendingMCL = a3;
}

- (double)firstInitDate
{
  return self->_firstInitDate;
}

- (void)setFirstInitDate:(double)a3
{
  self->_firstInitDate = a3;
}

- (BOOL)allowNotificationsOverride
{
  return self->_allowNotificationsOverride;
}

- (void)setAllowNotificationsOverride:(BOOL)a3
{
  self->_allowNotificationsOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)displayNotificationForMCL:(uint64_t)a3 forWireless:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215A71000, a1, a3, "No notification to show, abort", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

- (void)displayNotificationForMCL:(uint64_t)a3 forWireless:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215A71000, a1, a3, "MCL notification has already been shown", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

- (void)displayNotificationForMCL:(uint64_t)a3 forWireless:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215A71000, a1, a3, "Wireless notification has already been shown", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_215A71000, a2, a3, "Error showing wireless charging notification: %@", a5, a6, a7, a8, 2u);
}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_89_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_215A71000, a2, a3, "Error showing mcl charging notification: %@", a5, a6, a7, a8, 2u);
}

@end
