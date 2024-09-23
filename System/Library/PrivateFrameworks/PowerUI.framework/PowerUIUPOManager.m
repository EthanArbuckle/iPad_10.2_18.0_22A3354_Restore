@implementation PowerUIUPOManager

- (PowerUIUPOManager)init
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  char *v22;
  int v23;
  int out_token;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PowerUIUPOManager;
  v2 = -[PowerUIUPOManager init](&v25, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v4;

    v6 = os_log_create("com.apple.thermalmonitor.ui", "mitigationsEnabled");
    v7 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.thermalmonitor.postUPONotificationResponseQueue", v8);
    v10 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, (dispatch_qos_class_t)2u, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.thermalmonitor.lockNotificationQueue", v12);
    v14 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v13;

    *(_QWORD *)(v2 + 12) = -1;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.powerui.thermalmonitor"));
    v16 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.thermalmonitor.mitigationsUI"));
    v18 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v17;

    objc_msgSend(v2, "clearMitigationsEnabledNotificationRequestIfNecessary");
    out_token = 0;
    notify_register_dispatch("com.apple.language.changed", &out_token, MEMORY[0x24BDAC9B8], &__block_literal_global_5);
    v23 = 0;
    v19 = *((_QWORD *)v2 + 11);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __25__PowerUIUPOManager_init__block_invoke_2;
    v21[3] = &unk_24D3FB748;
    v22 = v2;
    notify_register_dispatch("com.apple.thermalmonitor.testdisplayuponotification", &v23, v19, v21);

  }
  return (PowerUIUPOManager *)v2;
}

void __25__PowerUIUPOManager_init__block_invoke()
{
  exit(0);
}

uint64_t __25__PowerUIUPOManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayMitigationsEnabledNotification");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__PowerUIUPOManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_manager;
}

void __35__PowerUIUPOManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

}

- (void)dataProviderDidLoad
{
  NSObject *log;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  self->_dataProviderLoaded = 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x24BDBCE60];
    v4 = log;
    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Data provider loaded: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)displayMitigationsEnabledNotification
{
  void *v3;
  NSUserDefaults *defaults;
  void *v5;
  id v6;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("bulletinPosted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_userNotificationCenter, "removeAllDeliveredNotifications");
  -[PowerUIUPOManager mitigationsEnabledNotificationRequest](self, "mitigationsEnabledNotificationRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v6, 0);
  ADClientAddValueForScalarKey();
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("bulletinPosted"));
  defaults = self->_defaults;
  -[PowerUIUPOManager upoTime](self, "upoTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v5, CFSTR("upoTime"));

}

- (void)removeMitigationsEnabledNotification
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("bulletinPosted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_userNotificationCenter, "removeAllDeliveredNotifications");
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("upoTime"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("bulletinPosted"));
}

- (void)clearMitigationsEnabledNotificationRequestIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("bulletinPosted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("upoTime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PowerUIUPOManager setUpoTime:](self, "setUpoTime:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -180.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIUPOManager setUpoTime:](self, "setUpoTime:", v5);

    }
  }
  -[PowerUIUPOManager registerForWithdrawalNotifications](self, "registerForWithdrawalNotifications");
}

- (void)registerForWithdrawalNotifications
{
  NSObject *lockNotificationQueue;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD handler[6];
  _QWORD v8[3];
  int v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  lockNotificationQueue = self->_lockNotificationQueue;
  v4 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke;
  handler[3] = &unk_24D3FBBD8;
  handler[4] = self;
  handler[5] = v8;
  notify_register_dispatch("com.apple.springboard.lockstate", &self->_unlockToken, lockNotificationQueue, handler);
  v5 = self->_lockNotificationQueue;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke_27;
  v6[3] = &unk_24D3FB748;
  v6[4] = self;
  notify_register_dispatch("com.apple.thermalmonitor.ageAwareMitigationsDisabled", &self->_mitigationsDisabledToken, v5, v6);
  _Block_object_dispose(v8, 8);
}

void __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke(uint64_t a1, int token)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  double v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(token, &state64);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 134218240;
    v24 = state64;
    v25 = 1024;
    v26 = v4;
    _os_log_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEFAULT, "Lock state changed: %llu (Loaded = %u)", buf, 0x12u);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v5 = state64;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD **)(a1 + 32);
    if (v5)
    {
      v8 = (void *)v7[7];
      v7[7] = v6;

      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Locked at %@", buf, 0xCu);
      }
      return;
    }
    objc_msgSend(v7, "upoTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = *(_QWORD *)(a1 + 32);
    if (v13 >= 180.0)
    {
      if (*(_QWORD *)(v14 + 56))
      {
        objc_msgSend(v6, "timeIntervalSinceDate:");
        if (v17 >= 15.0)
        {
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v24) = v19;
            _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Unlock Count: %d", buf, 8u);
          }
          if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "removeMitigationsEnabledNotification");
            v20 = *(_QWORD *)(a1 + 32);
            v21 = *(_DWORD *)(v20 + 16);
            if (v21 != -1)
            {
              notify_cancel(v21);
              v20 = *(_QWORD *)(a1 + 32);
            }
            notify_cancel(*(_DWORD *)(v20 + 12));
          }
          goto LABEL_21;
        }
        v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = 15;
          v16 = "Device was locked for less than %ds. Not counting this unlock";
          goto LABEL_14;
        }
      }
    }
    else
    {
      v15 = *(NSObject **)(v14 + 72);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = 180;
        v16 = "Notification posted less than %ds ago. Not counting this unlock.";
LABEL_14:
        _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 8u);
      }
    }
LABEL_21:

  }
}

uint64_t __55__PowerUIUPOManager_registerForWithdrawalNotifications__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint8_t v6[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Mitigations disabled.", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeMitigationsEnabledNotification");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 12);
  if (v4 != -1)
  {
    notify_cancel(v4);
    v3 = *(_QWORD *)(a1 + 32);
  }
  return notify_cancel(*(_DWORD *)(v3 + 16));
}

- (void)requestBulletin
{
  NSObject *log;
  void *v4;
  uint64_t v5;
  char v6;
  uint8_t buf[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Bulletin requested", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIUPOManager setUpoTime:](self, "setUpoTime:", v4);

  v6 = 0;
  v5 = SBSSpringBoardBlockableServerPort();
  MEMORY[0x2199EBF1C](v5, &v6, 900);
  -[PowerUIUPOManager displayMitigationsEnabledNotification](self, "displayMitigationsEnabledNotification");
  -[PowerUIUPOManager registerForWithdrawalNotifications](self, "registerForWithdrawalNotifications");
}

- (id)sortDescriptors
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)mitigationsEnabledNotificationRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("MITIGATIONS_UPO_ENABLED_TITLE"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("MITIGATIONS_UPO_ENABLED_BODY"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBody:", v5);

  objc_msgSend(v3, "setCategoryIdentifier:", CFSTR("mitigations-enabled"));
  -[PowerUIUPOManager upoTime](self, "upoTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:", v6);

  objc_msgSend(v3, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultActionURL:", v7);

  objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", CFSTR("com.apple.Preferences"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:", v8);

  v9 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithIdentifier:content:trigger:", v11, v3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (BOOL)dataProviderLoaded
{
  return self->_dataProviderLoaded;
}

- (void)setDataProviderLoaded:(BOOL)a3
{
  self->_dataProviderLoaded = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (_CDContext)contextStore
{
  return self->_contextStore;
}

- (void)setContextStore:(id)a3
{
  objc_storeStrong((id *)&self->_contextStore, a3);
}

- (int)unlockToken
{
  return self->_unlockToken;
}

- (void)setUnlockToken:(int)a3
{
  self->_unlockToken = a3;
}

- (int)mitigationsDisabledToken
{
  return self->_mitigationsDisabledToken;
}

- (void)setMitigationsDisabledToken:(int)a3
{
  self->_mitigationsDisabledToken = a3;
}

- (NSDate)lastTimeLocked
{
  return self->_lastTimeLocked;
}

- (void)setLastTimeLocked:(id)a3
{
  objc_storeStrong((id *)&self->_lastTimeLocked, a3);
}

- (NSDate)upoTime
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpoTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)lockNotificationQueue
{
  return self->_lockNotificationQueue;
}

- (void)setLockNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockNotificationQueue, a3);
}

- (OS_dispatch_queue)notificationResponseQueue
{
  return self->_notificationResponseQueue;
}

- (void)setNotificationResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationResponseQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationResponseQueue, 0);
  objc_storeStrong((id *)&self->_lockNotificationQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_upoTime, 0);
  objc_storeStrong((id *)&self->_lastTimeLocked, 0);
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
