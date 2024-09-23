@implementation UIUserInterfaceStyleArbiter

+ (id)sharedInstance
{
  id v3;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!UIApp)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIUserInterfaceStyleArbiter_sharedInstance__block_invoke;
  block[3] = &unk_1E16B14C0;
  block[4] = &v5;
  if (qword_1ECD804A8 != -1)
    dispatch_once(&qword_1ECD804A8, block);
  if (*((_BYTE *)v6 + 24))
  {
    if (pthread_main_np() == 1)
      objc_msgSend((id)qword_1ECD804A0, "_updateCurrentStyleAndNotify:forReason:", 1, 0);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], &__block_literal_global_34_3);
  }
  v3 = (id)qword_1ECD804A0;
  _Block_object_dispose(&v5, 8);
  return v3;
}

- (int64_t)currentStyle
{
  return self->_currentStyle;
}

void __45__UIUserInterfaceStyleArbiter_sharedInstance__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  if (objc_msgSend((id)UIApp, "isFrontBoard"))
  {
    if (objc_msgSend(MEMORY[0x1E0D23170], "currentProcessServicesDefaultShellEndpoint"))
    {
      v2 = -[UIUserInterfaceStyleArbiter _init]([UIUserInterfaceStyleArbiter alloc], "_init");
      v3 = (void *)qword_1ECD804A0;
      qword_1ECD804A0 = (uint64_t)v2;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

uint64_t __45__UIUserInterfaceStyleArbiter_sharedInstance__block_invoke_2()
{
  return objc_msgSend((id)qword_1ECD804A0, "_updateCurrentStyleAndNotify:forReason:", 1, 0);
}

- (id)_init
{
  UIUserInterfaceStyleArbiter *v2;
  uint64_t v3;
  UISUserInterfaceStyleMode *styleMode;
  uint64_t v5;
  NSBackgroundActivityScheduler *backgroundActivityScheduler;
  NSBackgroundActivityScheduler *v7;
  _QWORD v9[4];
  UIUserInterfaceStyleArbiter *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIUserInterfaceStyleArbiter;
  v2 = -[UIUserInterfaceStyleArbiter init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC5C68]), "initWithDelegate:", v2);
    styleMode = v2->_styleMode;
    v2->_styleMode = (UISUserInterfaceStyleMode *)v3;

    v2->_notificationToken = -1;
    notify_register_check("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification", &v2->_notificationToken);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.UIKit.UserInterfaceStyleAnalyticsActivity"));
    backgroundActivityScheduler = v2->_backgroundActivityScheduler;
    v2->_backgroundActivityScheduler = (NSBackgroundActivityScheduler *)v5;

    -[NSBackgroundActivityScheduler setRepeats:](v2->_backgroundActivityScheduler, "setRepeats:", 1);
    -[NSBackgroundActivityScheduler setInterval:](v2->_backgroundActivityScheduler, "setInterval:", 3600.0);
    v7 = v2->_backgroundActivityScheduler;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__UIUserInterfaceStyleArbiter__init__block_invoke;
    v9[3] = &unk_1E16E2BE8;
    v10 = v2;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v7, "scheduleWithBlock:", v9);

  }
  return v2;
}

void __36__UIUserInterfaceStyleArbiter__init__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  _QWORD v4[4];
  id v5;
  void (**v6)(id, uint64_t);

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "shouldDefer"))
  {
    v3[2](v3, 2);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36__UIUserInterfaceStyleArbiter__init__block_invoke_2;
    v4[3] = &unk_1E16B1D18;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __36__UIUserInterfaceStyleArbiter__init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_logPeriodicEvent");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)toggleCurrentStyle
{
  -[UIUserInterfaceStyleArbiter toggleCurrentStyleWithOverrideTiming:](self, "toggleCurrentStyleWithOverrideTiming:", 1);
}

- (void)toggleCurrentStyleWithOverrideTiming:(int64_t)a3
{
  NSObject *v5;
  int64_t currentModeValue;
  UISUserInterfaceStyleMode *v7;
  uint64_t v8;
  int64_t style;
  uint64_t v10;
  UISUserInterfaceStyleMode *styleMode;
  int64_t v12;
  int v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Arbiter toggleCurrentStyleWithOverrideTiming: %ld", (uint8_t *)&v13, 0xCu);
  }

  currentModeValue = self->_currentModeValue;
  if (currentModeValue > 99)
  {
    if (currentModeValue == 100 || currentModeValue == 102)
    {
      style = self->_lastOverride.style;
      if (style && style != self->_lastProposedAutomaticStyle)
      {
        v10 = *MEMORY[0x1E0DC5D48];
        v12 = *(_QWORD *)(MEMORY[0x1E0DC5D48] + 8);
        styleMode = self->_styleMode;
      }
      else
      {
        if (self->_currentStyle == 1)
          v10 = 2;
        else
          v10 = 1;
        styleMode = self->_styleMode;
        v12 = a3;
      }
      -[UISUserInterfaceStyleMode setOverride:](styleMode, "setOverride:", v10, v12);
    }
  }
  else
  {
    if (currentModeValue == 1)
    {
      v7 = self->_styleMode;
      v8 = 2;
    }
    else
    {
      if (currentModeValue != 2)
        return;
      v7 = self->_styleMode;
      v8 = 1;
    }
    -[UISUserInterfaceStyleMode setModeValue:](v7, "setModeValue:", v8);
  }
}

- (id)nextTransition
{
  void *v3;
  void *v4;
  int64_t style;
  void *v6;
  NSObject *v7;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (UISUserInterfaceStyleModeValueIsAutomatic())
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__UIUserInterfaceStyleArbiter_nextTransition__block_invoke;
    aBlock[3] = &unk_1E16E2C10;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    v4 = v3;
    style = self->_lastOverride.style;
    if (style && style != self->_lastProposedAutomaticStyle && (unint64_t)(self->_lastOverride.timing - 1) > 1)
    {
      v6 = 0;
    }
    else
    {
      (*((void (**)(void *))v3 + 2))(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }
  _UIUserInterfaceStyleArbiterLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter returning nextTransition: %@", buf, 0xCu);
  }

  return v6;
}

id __45__UIUserInterfaceStyleArbiter_nextTransition__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2 == 100)
  {
    v3 = 64;
  }
  else
  {
    if (v2 != 102)
    {
      v4 = 0;
      return v4;
    }
    v3 = 72;
  }
  objc_msgSend(*(id *)(v1 + v3), "nextTransition:", *(_QWORD *)(v1 + 24) == 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)userInterfaceStyleModeDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__UIUserInterfaceStyleArbiter_userInterfaceStyleModeDidChange___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__UIUserInterfaceStyleArbiter_userInterfaceStyleModeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStyleForReason:", 1);
}

- (void)_updateCurrentStyleForReason:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[UIUserInterfaceStyleArbiter _updateCurrentStyleAndNotify:forReason:](self, "_updateCurrentStyleAndNotify:forReason:", 1, a3);
}

- (void)_updateCurrentStyleAndNotify:(BOOL)a3 forReason:(int64_t)a4
{
  _BOOL4 v5;
  NSObject *v7;
  int64_t v8;
  int64_t currentModeValue;
  BOOL v10;
  uint64_t v11;
  int64_t v12;
  NSObject *v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  NSObject *v17;
  int64_t lastProposedAutomaticStyle;
  BOOL v19;
  int v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  int64_t currentStyle;
  int v26;
  char v28;
  NSObject *v29;
  _BOOL4 isDim;
  int v31;
  int i;
  NSObject *v33;
  int64_t v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  int64_t v38;
  _BOOL4 v39;
  uint8_t buf[4];
  _BYTE v41[20];
  _DWORD v42[4];
  uint64_t v43;

  v5 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _UIUserInterfaceStyleArbiterLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v41 = v5;
    *(_WORD *)&v41[4] = 2048;
    *(_QWORD *)&v41[6] = a4;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter _updateCurrentStyleAndNotify:%d forReason:%ld", buf, 0x12u);
  }

  v8 = -[UISUserInterfaceStyleMode modeValue](self->_styleMode, "modeValue");
  currentModeValue = self->_currentModeValue;
  v10 = -[UIUserInterfaceStyleArbiter _updateControllersWithOldModeValue:newModeValue:](self, "_updateControllersWithOldModeValue:newModeValue:", currentModeValue, v8);
  self->_currentModeValue = v8;
  if (a4 != 2)
  {
    if (v8 == 100)
    {
      v11 = 64;
    }
    else
    {
      if (v8 != 102)
        goto LABEL_9;
      v11 = 72;
    }
    objc_msgSend(*(id *)((char *)&self->super.isa + v11), "forceUpdate");
  }
LABEL_9:
  v12 = -[UIUserInterfaceStyleArbiter _proposedStyleForCurrentMode](self, "_proposedStyleForCurrentMode");
  _UIUserInterfaceStyleArbiterLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v41 = v12;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Arbiter proposed style: %ld", buf, 0xCu);
  }

  if ((UISUserInterfaceStyleModeValueIsAutomatic() & 1) == 0)
  {
    -[UIUserInterfaceStyleArbiter _setWatchesScreenDim:](self, "_setWatchesScreenDim:", 0);
    v24 = 0;
    self->_lastProposedAutomaticStyle = 0;
    self->_lastOverride = ($B891F94A0926B9C3D48CD771059595CF)*MEMORY[0x1E0DC5D48];
    goto LABEL_58;
  }
  v39 = v5;
  -[UIUserInterfaceStyleArbiter _setWatchesScreenDim:](self, "_setWatchesScreenDim:", 1);
  v14 = -[UISUserInterfaceStyleMode override](self->_styleMode, "override");
  v16 = v15;
  v38 = currentModeValue;
  if (v14)
  {
    _UIUserInterfaceStyleArbiterLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v41 = v14;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Arbiter considering override style: %ld", buf, 0xCu);
    }

    if ((unint64_t)(v16 - 1) > 1)
      goto LABEL_28;
    lastProposedAutomaticStyle = self->_lastProposedAutomaticStyle;
    if (lastProposedAutomaticStyle)
      v19 = v12 == lastProposedAutomaticStyle;
    else
      v19 = 1;
    v21 = v19 || v12 == v14;
    _UIUserInterfaceStyleArbiterLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v41 = v14;
      *(_WORD *)&v41[8] = 2048;
      *(_QWORD *)&v41[10] = v21 ^ 1u;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "Last proposed: %ld, so clear override: %ld", buf, 0x16u);
    }

    if (v21)
    {
LABEL_28:
      _UIUserInterfaceStyleArbiterLogger();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v41 = v14;
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "Not clearing override, so using override style %ld", buf, 0xCu);
      }

      v24 = 0;
      currentStyle = v14;
      goto LABEL_35;
    }
    v24 = 1;
  }
  else
  {
    v24 = 0;
  }
  currentStyle = v12;
LABEL_35:
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v26 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    for (i = _UIInternalPreference_SettingsUserInterfaceStyleSuppressChange;
          v26 != i;
          i = _UIInternalPreference_SettingsUserInterfaceStyleSuppressChange)
    {
      if (v26 < i)
      {
        if (byte_1EDDA831C)
          break;
        goto LABEL_54;
      }
      _UIInternalPreferenceSync(v26, &_UIInternalPreference_SettingsUserInterfaceStyleSuppressChange, (uint64_t)CFSTR("SettingsUserInterfaceStyleSuppressChange"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    }
  }
  v28 = a4 == 6 || self->_isDim || v10;
  if ((v28 & 1) != 0 || !UISUserInterfaceStyleModeOverridesEqual())
  {
LABEL_54:
    _UIUserInterfaceStyleArbiterLogger();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v41 = currentStyle;
      _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_DEFAULT, "Arbiter taking proposed style: %ld", buf, 0xCu);
    }

  }
  else
  {
    _UIUserInterfaceStyleArbiterLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      isDim = self->_isDim;
      v31 = UISUserInterfaceStyleModeOverridesEqual();
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v41 = isDim;
      *(_WORD *)&v41[4] = 2048;
      *(_QWORD *)&v41[6] = a4;
      *(_WORD *)&v41[14] = 1024;
      *(_DWORD *)&v41[16] = 0;
      LOWORD(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 2) = v31;
      _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_DEFAULT, "Arbiter ignoring proposed style: isDim: %d, reason: %ld, significantModeChange: %d, overrides equal: %d", buf, 0x1Eu);
    }

    currentStyle = self->_currentStyle;
  }
  currentModeValue = v38;
  self->_lastProposedAutomaticStyle = v12;
  self->_lastOverride.style = v14;
  v12 = currentStyle;
  self->_lastOverride.timing = v16;
  v5 = v39;
LABEL_58:
  v34 = self->_currentStyle;
  if (v12 == v34)
  {
    -[UIUserInterfaceStyleArbiter _logArbiterDecisionToBiomeWithNewStyle:reason:](self, "_logArbiterDecisionToBiomeWithNewStyle:reason:", v12, a4);
    if (v8 == currentModeValue)
    {
      if (!v24)
        return;
      goto LABEL_68;
    }
  }
  else
  {
    self->_currentStyle = v12;
    _UIUserInterfaceStyleArbiterLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v41 = v34;
      *(_WORD *)&v41[8] = 2048;
      *(_QWORD *)&v41[10] = v12;
      *(_WORD *)&v41[18] = 1024;
      v42[0] = v5;
      _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_DEFAULT, "Arbiter changing style from %ld to %ld, notifying: %d", buf, 0x1Cu);
    }

    notify_set_state(self->_notificationToken, self->_currentStyle);
    if (v5)
    {
      notify_post("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "postNotificationName:object:", CFSTR("UIUserInterfaceStyleArbiterStyleChangedNotification"), self);

    }
    -[UIUserInterfaceStyleArbiter _logArbiterDecisionToBiomeWithNewStyle:reason:](self, "_logArbiterDecisionToBiomeWithNewStyle:reason:", v12, a4, v38);
  }
  -[UIUserInterfaceStyleArbiter _logChangeEventWithNewMode:oldMode:newStyle:oldStyle:reason:](self, "_logChangeEventWithNewMode:oldMode:newStyle:oldStyle:reason:", v8, currentModeValue, v12, v34, a4, v38);
  if (!v24)
    return;
LABEL_68:
  _UIUserInterfaceStyleArbiterLogger();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_DEFAULT, "Arbiter clearing override", buf, 2u);
  }

  -[UISUserInterfaceStyleMode setOverride:](self->_styleMode, "setOverride:", *MEMORY[0x1E0DC5D48], *(_QWORD *)(MEMORY[0x1E0DC5D48] + 8));
}

- (BOOL)_updateControllersWithOldModeValue:(int64_t)a3 newModeValue:(int64_t)a4
{
  NSObject *v7;
  _UISunScheduleController *v8;
  _UISunScheduleController *sunScheduleController;
  NSObject *v10;
  _UISunScheduleController *v11;
  NSObject *v12;
  _UICustomScheduleController *v13;
  _UICustomScheduleController *customScheduleController;
  UISUserInterfaceStyleMode *styleMode;
  _UICustomScheduleController *v16;
  NSObject *v17;
  int v18;
  int v19;
  NSObject *v20;
  _UICustomScheduleController *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  _OWORD v27[6];
  _QWORD v28[4];
  id v29;
  __int128 buf;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3 == a4)
  {
    if (a3 != 102)
    {
LABEL_34:
      v19 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (a4 == 100)
    {
      if (!self->_sunScheduleController)
      {
        _UIUserInterfaceStyleArbiterLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter creating SunScheduleController", (uint8_t *)&buf, 2u);
        }

        v8 = objc_alloc_init(_UISunScheduleController);
        sunScheduleController = self->_sunScheduleController;
        self->_sunScheduleController = v8;

      }
      _UIUserInterfaceStyleArbiterLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Arbiter starting observing SunScheduleController", (uint8_t *)&buf, 2u);
      }

      objc_initWeak((id *)&buf, self);
      v11 = self->_sunScheduleController;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke;
      v28[3] = &unk_1E16E2C38;
      objc_copyWeak(&v29, (id *)&buf);
      -[_UISunScheduleController addObserver:changeHandler:](v11, "addObserver:changeHandler:", self, v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)&buf);
      goto LABEL_30;
    }
    if (a3 == 100)
    {
      _UIUserInterfaceStyleArbiterLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Arbiter ending observing SunScheduleController", (uint8_t *)&buf, 2u);
      }

      -[_UISunScheduleController removeObserver:](self->_sunScheduleController, "removeObserver:", self);
      if (a4 != 102)
        goto LABEL_34;
    }
    else if (a4 != 102)
    {
LABEL_30:
      if (a3 == 102)
      {
        _UIUserInterfaceStyleArbiterLogger();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "Arbiter ending observing CustomScheduleController", (uint8_t *)&buf, 2u);
        }

        -[_UICustomScheduleController removeObserver:](self->_customScheduleController, "removeObserver:", self);
      }
      goto LABEL_34;
    }
  }
  if (!self->_customScheduleController)
  {
    _UIUserInterfaceStyleArbiterLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Arbiter creating CustomScheduleController", (uint8_t *)&buf, 2u);
    }

    v13 = objc_alloc_init(_UICustomScheduleController);
    customScheduleController = self->_customScheduleController;
    self->_customScheduleController = v13;

  }
  buf = 0u;
  v31 = 0u;
  styleMode = self->_styleMode;
  if (styleMode)
    -[UISUserInterfaceStyleMode customSchedule](styleMode, "customSchedule");
  v16 = self->_customScheduleController;
  if (v16)
    -[_UICustomScheduleController schedule](v16, "schedule");
  else
    memset(&v27[4], 0, 32);
  v27[2] = buf;
  v27[3] = v31;
  v18 = UISUserInterfaceStyleModeSchedulesEqual();
  v27[0] = buf;
  v27[1] = v31;
  -[_UICustomScheduleController setSchedule:](self->_customScheduleController, "setSchedule:", v27);
  v19 = v18 ^ 1;
  if (a3 != a4)
  {
    _UIUserInterfaceStyleArbiterLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Arbiter starting observing CustomScheduleController", (uint8_t *)&buf, 2u);
    }

    objc_initWeak((id *)&buf, self);
    v21 = self->_customScheduleController;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_44;
    v25[3] = &unk_1E16E2C60;
    objc_copyWeak(&v26, (id *)&buf);
    -[_UICustomScheduleController addObserver:changeHandler:](v21, "addObserver:changeHandler:", self, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)&buf);
  }
LABEL_35:
  _UIUserInterfaceStyleArbiterLogger();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    DWORD1(buf) = a3 != a4;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = v19;
    _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "Arbiter _updateControllers got modeChanged:%d customScheduleChanged:%d", (uint8_t *)&buf, 0xEu);
  }

  return (a3 != a4) | v19;
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  _UIUserInterfaceStyleArbiterLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Arbiter SunScheduleController changed", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_41;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_41(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCurrentStyleForReason:", 2);

}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  _UIUserInterfaceStyleArbiterLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Arbiter CustomScheduleController changed", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_45;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_45(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCurrentStyleForReason:", 2);

}

- (int64_t)_proposedStyleForCurrentMode
{
  int64_t currentModeValue;
  void *customScheduleController;

  currentModeValue = self->_currentModeValue;
  switch(currentModeValue)
  {
    case 102:
      customScheduleController = self->_customScheduleController;
      break;
    case 100:
      customScheduleController = self->_sunScheduleController;
      break;
    case 2:
      return 2;
    default:
      return 1;
  }
  if (objc_msgSend(customScheduleController, "isInScheduleTime"))
    return 2;
  else
    return 1;
}

- (void)_logArbiterDecisionToBiomeWithNewStyle:(int64_t)a3 reason:(int64_t)a4
{
  int v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  int v9;
  int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    v4 = 1;
  else
    v4 = 2 * (a3 == 2);
  if (a4 == 2)
    v5 = 3;
  else
    v5 = a4 == 1;
  _UIUserInterfaceStyleArbiterLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v12 = v4;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Arbiter asked to write decision to Biome with appearance state: %d, change reason: %d", buf, 0xEu);
  }

  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__UIUserInterfaceStyleArbiter__logArbiterDecisionToBiomeWithNewStyle_reason___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  v9 = v4;
  v10 = v5;
  dispatch_async(v7, block);

}

void __77__UIUserInterfaceStyleArbiter__logArbiterDecisionToBiomeWithNewStyle_reason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[16];
  uint64_t v24;
  void *v25;
  void **v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 36);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v3;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v4;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Arbiter writing decision to Biome with appearance state: %d, change reason: %d", buf, 0xEu);
  }

  v19 = 0;
  if (!qword_1ECD804B0)
  {
    *(_OWORD *)buf = xmmword_1E16E2CA8;
    v24 = 0;
    qword_1ECD804B0 = _sl_dlopen();
  }
  if (!qword_1ECD804B0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("UIUserInterfaceStyleArbiter.m"), 31, CFSTR("%s"), v19);

    goto LABEL_14;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)qword_1ECD804B8;
  v22 = qword_1ECD804B8;
  if (!qword_1ECD804B8)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    v24 = (uint64_t)__getBMDisplayAppearanceClass_block_invoke;
    v25 = &unk_1E16B14C0;
    v26 = &v19;
    __getBMDisplayAppearanceClass_block_invoke((uint64_t)buf);
    v5 = v20[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithState:reason:", *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 36));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  v24 = 0x2020000000;
  v8 = off_1ECD804C0;
  v25 = off_1ECD804C0;
  if (!off_1ECD804C0)
  {
    v9 = BiomeLibraryLibrary();
    v8 = dlsym(v9, "BiomeLibrary");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
    off_1ECD804C0 = v8;
  }
  _Block_object_dispose(buf, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BMRootLibrary> _UIBiomeLibrary(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("UIUserInterfaceStyleArbiter.m"), 34, CFSTR("%s"), dlerror());

LABEL_14:
    __break(1u);
  }
  ((void (*)(void))v8)();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Display");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "Appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendEvent:", v7);

}

- (void)_logChangeEventWithNewMode:(int64_t)a3 oldMode:(int64_t)a4 newStyle:(int64_t)a5 oldStyle:(int64_t)a6 reason:(int64_t)a7
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *lastUpdateDate;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  AnalyticsSendEventLazy();
  v16[0] = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v16[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  v16[2] = CFSTR("Timestamp");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateDate = self->_lastUpdateDate;
  self->_lastUpdateDate = v14;

}

id __91__UIUserInterfaceStyleArbiter__logChangeEventWithNewMode_oldMode_newStyle_oldStyle_reason___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("currentMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("previousMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("currentValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("previousValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[9]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("reason"));

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "component:fromDate:", 32, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("currentHour"));

  v12 = *(void **)(a1[4] + 80);
  if (v12)
  {
    objc_msgSend(v12, "timeIntervalSinceNow");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", vcvtmd_s64_f64(v13 / -60.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("length"));

  }
  return v2;
}

- (void)_logPeriodicEvent
{
  AnalyticsSendEventLazy();
}

id __48__UIUserInterfaceStyleArbiter__logPeriodicEvent__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("currentMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("currentValue"));

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "component:fromDate:", 32, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("currentHour"));

  return v2;
}

- (void)_setWatchesScreenDim:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Arbiter setWatchesScreenDim: %d", (uint8_t *)v8, 8u);
  }

  if (v3)
  {
    if (!self->_isObservingBacklightState && !self->_isAddingBacklightStateObserver)
    {
      objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isAddingBacklightStateObserver = 1;
      objc_msgSend(v6, "addObserver:", self);
      *(_WORD *)&self->_isAddingBacklightStateObserver = 256;
      -[UIUserInterfaceStyleArbiter _backlightStateUpdated:updateStyle:](self, "_backlightStateUpdated:updateStyle:", objc_msgSend(v6, "backlightState"), 0);

    }
  }
  else
  {
    if (self->_isObservingBacklightState)
    {
      objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:", self);

      self->_isObservingBacklightState = 0;
    }
    self->_isDim = 0;
  }
}

- (void)_backlightStateUpdated:(int64_t)a3 updateStyle:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 isDim;
  uint64_t v11;
  int v12;
  int64_t v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter backlight state updated: %ld", (uint8_t *)&v12, 0xCu);
  }

  v8 = a3 != 2;
  if (self->_isDim != v8)
  {
    self->_isDim = v8;
    _UIUserInterfaceStyleArbiterLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      isDim = self->_isDim;
      v12 = 67109120;
      LODWORD(v13) = isDim;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Arbiter backlight state is now dim: %d", (uint8_t *)&v12, 8u);
    }

    if (v4)
    {
      if (a3 == 2)
        v11 = 6;
      else
        v11 = 5;
      -[UIUserInterfaceStyleArbiter _updateCurrentStyleForReason:](self, "_updateCurrentStyleForReason:", v11);
    }
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  -[UIUserInterfaceStyleArbiter _backlightStateUpdated:updateStyle:](self, "_backlightStateUpdated:updateStyle:", a4, !self->_isAddingBacklightStateObserver, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityScheduler, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_customScheduleController, 0);
  objc_storeStrong((id *)&self->_sunScheduleController, 0);
  objc_storeStrong((id *)&self->_styleMode, 0);
}

@end
