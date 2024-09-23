@implementation SHSRingerControl

- (BOOL)canChangeRingtoneWithButtons
{
  NSObject *v3;
  int AppBooleanValue;
  BOOL v5;
  _BOOL8 v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[SHSRingerControl canChangeRingtoneWithButtons]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v8, 0xCu);
  }

  LOBYTE(v8) = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("buttons-can-change-ringer-volume"), CFSTR("com.apple.preferences.sounds"), (Boolean *)&v8);
  if ((_BYTE)v8)
    v5 = AppBooleanValue == 0;
  else
    v5 = 1;
  v6 = !v5;
  -[SHSRingerControl setAppWantsVolumeChangeEvents:](self, "setAppWantsVolumeChangeEvents:", v6);
  __48__SHSRingerControl_canChangeRingtoneWithButtons__block_invoke();
  return v6;
}

- (void)setAppWantsVolumeChangeEvents:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SHSRingerControl _systemController](self, "_systemController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v4, *MEMORY[0x24BE647F0], 0);

}

- (AVSystemController)_systemController
{
  return self->__systemController;
}

- (SHSRingerControl)init
{
  SHSRingerControl *v2;
  SHSRingerControl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSRingerControl;
  v2 = -[SHSRingerControl init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SHSRingerControl _setup](v2, "_setup");
    -[SHSRingerControl reload](v3, "reload");
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SHSRingerControl dealloc]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  -[SHSRingerControl _tearDown](self, "_tearDown");
  __27__SHSRingerControl_dealloc__block_invoke();
  v4.receiver = self;
  v4.super_class = (Class)SHSRingerControl;
  -[SHSRingerControl dealloc](&v4, sel_dealloc);
}

void __27__SHSRingerControl_dealloc__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl dealloc]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_setup
{
  NSObject *v3;
  void *v4;
  AVSystemController *v5;
  AVSystemController *systemController;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[SHSRingerControl _setup]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v5 = (AVSystemController *)objc_claimAutoreleasedReturnValue();
  systemController = self->__systemController;
  self->__systemController = v5;

  v7 = (uint64_t *)MEMORY[0x24BE64830];
  v11 = *MEMORY[0x24BE64830];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSystemController setAttribute:forKey:error:](self->__systemController, "setAttribute:forKey:error:", v8, *MEMORY[0x24BE64930], 0);
  v9 = *v7;
  -[SHSRingerControl _systemController](self, "_systemController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleEffectiveVolumeDidChangeNotification_, v9, v10);

  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleServerConnectionDiedNotification_, *MEMORY[0x24BE64908], 0);
  __26__SHSRingerControl__setup__block_invoke();
}

void __26__SHSRingerControl__setup__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl _setup]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_tearDown
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SHSRingerControl _tearDown]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSRingerControl set_volumeInitialized:](self, "set_volumeInitialized:", 0);
  v5 = *MEMORY[0x24BE64938];
  -[SHSRingerControl _systemController](self, "_systemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE64908], 0);
  __29__SHSRingerControl__tearDown__block_invoke();
}

void __29__SHSRingerControl__tearDown__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl _tearDown]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

void __48__SHSRingerControl_canChangeRingtoneWithButtons__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl canChangeRingtoneWithButtons]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)setCanChangeRingtoneWithButtons:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SHSRingerControl setCanChangeRingtoneWithButtons:]";
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v10, 0xCu);
  }

  v6 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (const __CFString *)*MEMORY[0x24BDBD590];
  v8 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("buttons-can-change-ringer-volume"), v6, CFSTR("com.apple.preferences.sounds"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(CFSTR("com.apple.preferences.sounds"), v7, v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.preferences.sounds.buttons-can-change-ringer-volume.changed"), 0, 0, 1u);
  -[SHSRingerControl setAppWantsVolumeChangeEvents:](self, "setAppWantsVolumeChangeEvents:", v3);
  __52__SHSRingerControl_setCanChangeRingtoneWithButtons___block_invoke();
}

void __52__SHSRingerControl_setCanChangeRingtoneWithButtons___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl setCanChangeRingtoneWithButtons:]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)reload
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  double v6;
  float v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SHSRingerControl reload]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  -[SHSRingerControl set_volumeInitialized:](self, "set_volumeInitialized:", 0);
  v7 = 0.0;
  -[SHSRingerControl _systemController](self, "_systemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getVolume:forCategory:", &v7, CFSTR("RingtonePreview"));

  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SHSRingerControl reload]";
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: Retrieved AVSystemController volume: %f.", buf, 0x16u);
  }

  if (!-[SHSRingerControl _volumeInitialized](self, "_volumeInitialized"))
  {
    *(float *)&v6 = v7;
    -[SHSRingerControl _updateVolume:](self, "_updateVolume:", v6);
  }
  __26__SHSRingerControl_reload__block_invoke();
}

void __26__SHSRingerControl_reload__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl reload]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)setVolume:(float)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  float v9;
  int64_t v10;
  const char *v11;
  float volume;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  float v16;
  int64_t v17;
  float v18;
  int64_t v19;
  float v20;
  int64_t v21;
  _QWORD v22[5];
  float v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SHSRingerControl setVolume:]";
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "applicationState");

  switch(v7)
  {
    case 0:
      SHSLogForCategory(1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        volume = self->_volume;
        v13 = -[SHSRingerControl _volumeChangeCoalescingCount](self, "_volumeChangeCoalescingCount");
        *(_DWORD *)buf = 136315906;
        v25 = "-[SHSRingerControl setVolume:]";
        v26 = 2048;
        v27 = volume;
        v28 = 2048;
        v29 = a3;
        v30 = 2048;
        v31 = v13;
        _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "%s: (current: %f, newVolume: %f, coalescingCount: %ld).", buf, 0x2Au);
      }
      goto LABEL_13;
    case 1:
      if (-[SHSRingerControl _logFaultCalledForInactive](self, "_logFaultCalledForInactive"))
      {
        SHSLogForCategory(1uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v16 = self->_volume;
          v17 = -[SHSRingerControl _volumeChangeCoalescingCount](self, "_volumeChangeCoalescingCount");
          *(_DWORD *)buf = 136315906;
          v25 = "-[SHSRingerControl setVolume:]";
          v26 = 2048;
          v27 = v16;
          v28 = 2048;
          v29 = a3;
          v30 = 2048;
          v31 = v17;
          v11 = "%s: Called while application state is 'Inactive' (current: %f, newVolume: %f, coalescingCount: %ld).";
          goto LABEL_22;
        }
LABEL_13:

        break;
      }
      SHSLogForCategory(1uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v18 = self->_volume;
        v19 = -[SHSRingerControl _volumeChangeCoalescingCount](self, "_volumeChangeCoalescingCount");
        *(_DWORD *)buf = 136315906;
        v25 = "-[SHSRingerControl setVolume:]";
        v26 = 2048;
        v27 = v18;
        v28 = 2048;
        v29 = a3;
        v30 = 2048;
        v31 = v19;
        _os_log_fault_impl(&dword_228D17000, v15, OS_LOG_TYPE_FAULT, "%s: Called while application state is 'Inactive' (current: %f, newVolume: %f, coalescingCount: %ld).", buf, 0x2Au);
      }

      -[SHSRingerControl set_logFaultCalledForInactive:](self, "set_logFaultCalledForInactive:", 1);
      break;
    case 2:
      if (-[SHSRingerControl _logFaultCalledForBackground](self, "_logFaultCalledForBackground"))
      {
        SHSLogForCategory(1uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = self->_volume;
          v10 = -[SHSRingerControl _volumeChangeCoalescingCount](self, "_volumeChangeCoalescingCount");
          *(_DWORD *)buf = 136315906;
          v25 = "-[SHSRingerControl setVolume:]";
          v26 = 2048;
          v27 = v9;
          v28 = 2048;
          v29 = a3;
          v30 = 2048;
          v31 = v10;
          v11 = "%s: Called while application state is 'Background' (current: %f, newVolume: %f, coalescingCount: %ld).";
LABEL_22:
          _os_log_error_impl(&dword_228D17000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x2Au);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      SHSLogForCategory(1uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v20 = self->_volume;
        v21 = -[SHSRingerControl _volumeChangeCoalescingCount](self, "_volumeChangeCoalescingCount");
        *(_DWORD *)buf = 136315906;
        v25 = "-[SHSRingerControl setVolume:]";
        v26 = 2048;
        v27 = v20;
        v28 = 2048;
        v29 = a3;
        v30 = 2048;
        v31 = v21;
        _os_log_fault_impl(&dword_228D17000, v14, OS_LOG_TYPE_FAULT, "%s: Called while application state is 'Background' (current: %f, newVolume: %f, coalescingCount: %ld).", buf, 0x2Au);
      }

      -[SHSRingerControl set_logFaultCalledForBackground:](self, "set_logFaultCalledForBackground:", 1);
      break;
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __30__SHSRingerControl_setVolume___block_invoke_20;
  v22[3] = &unk_24F197A78;
  v22[4] = self;
  v23 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v22);
  __30__SHSRingerControl_setVolume___block_invoke();
}

void __30__SHSRingerControl_setVolume___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl setVolume:]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

float __30__SHSRingerControl_setVolume___block_invoke_20(uint64_t a1)
{
  float *v1;
  float result;
  dispatch_time_t v4;
  _QWORD v5[5];
  int v6;

  v1 = *(float **)(a1 + 32);
  result = v1[3];
  if (result != *(float *)(a1 + 40))
  {
    objc_msgSend(v1, "set_volumeChangeCoalescingCount:", objc_msgSend(*(id *)(a1 + 32), "_volumeChangeCoalescingCount") + 1);
    v4 = dispatch_time(0, 70000000);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __30__SHSRingerControl_setVolume___block_invoke_2;
    v5[3] = &unk_24F197A78;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
    result = *(float *)(a1 + 40);
    *(float *)(*(_QWORD *)(a1 + 32) + 12) = result;
  }
  return result;
}

void __30__SHSRingerControl_setVolume___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "set_volumeChangeCoalescingCount:", objc_msgSend(*(id *)(a1 + 32), "_volumeChangeCoalescingCount") - 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "_volumeChangeCoalescingCount"))
  {
    SHSLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(float *)(a1 + 40);
      v13 = 136315394;
      v14 = "-[SHSRingerControl setVolume:]_block_invoke_2";
      v15 = 2048;
      v16 = v3;
      _os_log_impl(&dword_228D17000, v2, OS_LOG_TYPE_DEFAULT, "%s: Setting AVSystemController volume to: %f.", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_systemController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
    objc_msgSend(v4, "setVolumeTo:forCategory:", CFSTR("RingtonePreview"), v5);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      SHSLogForCategory(1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(float *)(a1 + 40);
        v13 = 136315650;
        v14 = "-[SHSRingerControl setVolume:]_block_invoke";
        v15 = 2114;
        v16 = *(double *)&v9;
        v17 = 2048;
        v18 = v10;
        _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "%s: Calling delegate %{public}@ with new volume value: %f.", (uint8_t *)&v13, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
      objc_msgSend(v11, "ringerControl:volumeValueDidChange:", v12);

    }
  }
}

- (void)_updateVolume:(float)a3
{
  NSObject *v5;
  float v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[SHSRingerControl _updateVolume:]";
    v15 = 2048;
    v16 = a3;
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start (volume %f).", (uint8_t *)&v13, 0x16u);
  }

  v6 = self->_volume - a3;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 0.00000011921)
  {
    -[SHSRingerControl set_volumeInitialized:](self, "set_volumeInitialized:", 1);
    self->_volume = a3;
    -[SHSRingerControl delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      SHSLogForCategory(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[SHSRingerControl delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315650;
        v14 = "-[SHSRingerControl _updateVolume:]";
        v15 = 2114;
        v16 = *(double *)&v10;
        v17 = 2048;
        v18 = a3;
        _os_log_impl(&dword_228D17000, v9, OS_LOG_TYPE_DEFAULT, "%s: Calling delegate %{public}@ with new volume value: %f.", (uint8_t *)&v13, 0x20u);

      }
      -[SHSRingerControl delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v12 = a3;
      objc_msgSend(v11, "ringerControl:volumeValueDidChange:", self, v12);

    }
  }
  __34__SHSRingerControl__updateVolume___block_invoke();
}

void __34__SHSRingerControl__updateVolume___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl _updateVolume:]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_handleEffectiveVolumeDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  double v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315138;
    v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s Start.", (uint8_t *)&v27, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "applicationState") == 1;

  if (v7)
  {
    SHSLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315138;
      v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
      v9 = "%s: App is not active, ignoring.";
LABEL_11:
      _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v27, 0xCu);
    }
  }
  else if (-[SHSRingerControl canChangeRingtoneWithButtons](self, "canChangeRingtoneWithButtons"))
  {
    objc_msgSend(v4, "userInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x24BE64848]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ExplicitVolumeChange"));
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x24BE64838]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RingtonePreview")) & 1) != 0)
      v13 = 1;
    else
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Ringtone"));
    SHSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 136315906;
      v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
      v29 = 2114;
      v30 = v15;
      v31 = 2114;
      v32 = v16;
      v33 = 2114;
      v34 = v12;
      _os_log_impl(&dword_228D17000, v14, OS_LOG_TYPE_DEFAULT, "%s: Is volume change '%{public}@', is ringtone related category '%{public}@', category '%{public}@'.", (uint8_t *)&v27, 0x2Au);

    }
    if ((_DWORD)v11)
    {
      -[SHSRingerControl delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        SHSLogForCategory(1uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(sel_ringerControlDidObserveEffectiveSystemVolumeChange_);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[SHSRingerControl delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 136315650;
          v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
          v29 = 2114;
          v30 = v20;
          v31 = 2114;
          v32 = v21;
          _os_log_impl(&dword_228D17000, v19, OS_LOG_TYPE_DEFAULT, "%s: Calling '%{public}@' delegate %{public}@.", (uint8_t *)&v27, 0x20u);

        }
        -[SHSRingerControl delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ringerControlDidObserveEffectiveSystemVolumeChange:", self);

      }
      if ((_DWORD)v13)
      {
        -[NSObject objectForKey:](v8, "objectForKey:", *MEMORY[0x24BE64840]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        v25 = v24;

        LODWORD(v26) = v25;
        -[SHSRingerControl _updateVolume:](self, "_updateVolume:", v26);
      }
    }

  }
  else
  {
    SHSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315138;
      v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
      v9 = "%s: 'Change with Buttons' is not active, ignoring.";
      goto LABEL_11;
    }
  }

  __64__SHSRingerControl__handleEffectiveVolumeDidChangeNotification___block_invoke();
}

void __64__SHSRingerControl__handleEffectiveVolumeDidChangeNotification___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_handleServerConnectionDiedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SHSRingerControl _handleServerConnectionDiedNotification:]";
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v6, 0xCu);
  }

  -[SHSRingerControl _tearDown](self, "_tearDown");
  -[SHSRingerControl _setup](self, "_setup");
  -[SHSRingerControl reload](self, "reload");
  __60__SHSRingerControl__handleServerConnectionDiedNotification___block_invoke();

}

void __60__SHSRingerControl__handleServerConnectionDiedNotification___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SHSRingerControl _handleServerConnectionDiedNotification:]_block_invoke";
    _os_log_impl(&dword_228D17000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }

}

- (SHSRingerControlDelegate)delegate
{
  return (SHSRingerControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)appWantsVolumeChangeEvents
{
  return self->_appWantsVolumeChangeEvents;
}

- (void)set_systemController:(id)a3
{
  objc_storeStrong((id *)&self->__systemController, a3);
}

- (int64_t)_volumeChangeCoalescingCount
{
  return self->__volumeChangeCoalescingCount;
}

- (void)set_volumeChangeCoalescingCount:(int64_t)a3
{
  self->__volumeChangeCoalescingCount = a3;
}

- (BOOL)_volumeInitialized
{
  return self->__volumeInitialized;
}

- (void)set_volumeInitialized:(BOOL)a3
{
  self->__volumeInitialized = a3;
}

- (BOOL)_logFaultCalledForInactive
{
  return self->__logFaultCalledForInactive;
}

- (void)set_logFaultCalledForInactive:(BOOL)a3
{
  self->__logFaultCalledForInactive = a3;
}

- (BOOL)_logFaultCalledForBackground
{
  return self->__logFaultCalledForBackground;
}

- (void)set_logFaultCalledForBackground:(BOOL)a3
{
  self->__logFaultCalledForBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__systemController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
