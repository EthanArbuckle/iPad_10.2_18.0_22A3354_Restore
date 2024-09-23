@implementation PencilSettings

+ (id)sharedPencilSettings
{
  if (sharedPencilSettings_onceToken != -1)
    dispatch_once(&sharedPencilSettings_onceToken, &__block_literal_global_2);
  return (id)sharedPencilSettings___sharedPencilSettings;
}

void __38__PencilSettings_sharedPencilSettings__block_invoke()
{
  PencilSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PencilSettings);
  v1 = (void *)sharedPencilSettings___sharedPencilSettings;
  sharedPencilSettings___sharedPencilSettings = (uint64_t)v0;

}

+ (id)pencilUserDefaults
{
  if (pencilUserDefaults_onceToken != -1)
    dispatch_once(&pencilUserDefaults_onceToken, &__block_literal_global_8);
  return (id)pencilUserDefaults___pencilUserDefaults;
}

void __36__PencilSettings_pencilUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v1 = (void *)pencilUserDefaults___pencilUserDefaults;
  pencilUserDefaults___pencilUserDefaults = v0;

}

- (PencilSettings)init
{
  PencilSettings *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PencilSettings;
  v2 = -[PencilSettings init](&v4, sel_init);
  -[PencilSettings loadSettings](v2, "loadSettings");
  return v2;
}

- (void)syncSettingsToBackboard
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "Syncing settings to backboard", v8, 2u);
  }

  +[BundleControllerHelper sharedInstance](BundleControllerHelper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_preferredTapAction == 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaqueTouchProperty:value:", CFSTR("DoubleTapGestureDisabled"), v5);

  +[BundleControllerHelper sharedInstance](BundleControllerHelper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_preferredSqueezeAction == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOpaqueTouchProperty:value:", CFSTR("SqueezeGestureDisabled"), v7);

}

- (void)migrateObsoletedAXOpaqueTouchSetting
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if (!_AXSAllowOpaqueTouchGestures())
  {
    v2 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22ACC1000, v2, OS_LOG_TYPE_DEFAULT, "Migrating _AXSAllowOpaqueTouchGestures setting.", buf, 2u);
    }

    _AXSSetAllowOpaqueTouchGestures();
    if (_AXSAllowOpaqueTouchGestures())
    {
      +[PencilSettings pencilUserDefaults](PencilSettings, "pencilUserDefaults");
      v3 = objc_claimAutoreleasedReturnValue();
      -[NSObject setInteger:forKey:](v3, "setInteger:forKey:", 0, *MEMORY[0x24BDF7C18]);
    }
    else
    {
      v3 = os_log_create("com.apple.pencilpairingui", ");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "Unable to migrate _AXSAllowOpaqueTouchGestures setting.", v4, 2u);
      }
    }

  }
}

- (void)loadSettings
{
  int64_t v3;

  self->_preferredTapAction = objc_msgSend(MEMORY[0x24BDF6C48], "preferredTapAction");
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(MEMORY[0x24BDF6C48], "preferredSqueezeAction");
  else
    v3 = 0;
  self->_preferredSqueezeAction = v3;
}

- (void)setPreferredTapAction:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_preferredTapAction != a3)
  {
    self->_preferredTapAction = a3;
    +[PencilSettings pencilUserDefaults](PencilSettings, "pencilUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInteger:forKey:", self->_preferredTapAction, *MEMORY[0x24BDF7C18]);

    +[PencilSettings pencilUserDefaults](PencilSettings, "pencilUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronize");

    +[PencilSettingsStatisticsManager sharedInstance](PencilSettingsStatisticsManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordSetPencilPerferredAction:", self->_preferredTapAction);

    -[PencilSettings syncSettingsToBackboard](self, "syncSettingsToBackboard");
  }
}

- (void)setPreferredSqueezeAction:(int64_t)a3
{
  void *v4;
  void *v5;

  if (self->_preferredSqueezeAction != a3)
  {
    self->_preferredSqueezeAction = a3;
    +[PencilSettings pencilUserDefaults](PencilSettings, "pencilUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInteger:forKey:", self->_preferredSqueezeAction, *MEMORY[0x24BDF7C10]);

    +[PencilSettings pencilUserDefaults](PencilSettings, "pencilUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronize");

    -[PencilSettings _postPencilSettingsDidChangeRemoteNotification](self, "_postPencilSettingsDidChangeRemoteNotification");
    -[PencilSettings syncSettingsToBackboard](self, "syncSettingsToBackboard");
  }
}

- (void)_postPencilSettingsDidChangeRemoteNotification
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BDE33C8], "_postPencilSettingsDidChangeRemoteNotification");
}

- (void)setAutoRefineEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__PencilSettings_setAutoRefineEnabled___block_invoke_29;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  v4 = a3;
  -[PencilSettings _dispatchWithErrorHandler:successHandler:](self, "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_28, v3);
}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __39__PencilSettings_setAutoRefineEnabled___block_invoke_cold_1((uint64_t)v2, v3);

}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 32))
      v5 = CFSTR("NO");
    v6 = 138412546;
    v7 = CFSTR("UIAutoRefineEnabledKey");
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_22ACC1000, v4, OS_LOG_TYPE_INFO, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setGlobalAutoRefineEnabled:withCompletion:", *(unsigned __int8 *)(a1 + 32), &__block_literal_global_37);

}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke_36()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PKRemoteAutoRefineSettingsDidChange"), 0, 0, 1u);
}

- (void)_dispatchWithErrorHandler:(id)a3 successHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PencilSettings daemonQueue](self, "daemonQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke;
  v11[3] = &unk_24F4E5418;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.handwritingd.pksettings"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B7EEF0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke_2;
  v9 = &unk_24F4E53F0;
  v10 = *(id *)(a1 + 32);
  v11 = &v12;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)v13 + 24))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
  objc_msgSend(v2, "invalidate", v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

uint64_t __59__PencilSettings__dispatchWithErrorHandler_successHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (id)daemonQueue
{
  if (daemonQueue_onceToken != -1)
    dispatch_once(&daemonQueue_onceToken, &__block_literal_global_102);
  return (id)daemonQueue_sQueue;
}

void __29__PencilSettings_daemonQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PencilKit.settingsDaemon", 0);
  v1 = (void *)daemonQueue_sQueue;
  daemonQueue_sQueue = (uint64_t)v0;

}

- (int64_t)preferredTapAction
{
  return self->_preferredTapAction;
}

- (int64_t)preferredSqueezeAction
{
  return self->_preferredSqueezeAction;
}

void __39__PencilSettings_setAutoRefineEnabled___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("UIAutoRefineEnabledKey");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22ACC1000, a2, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v2, 0x16u);
}

@end
