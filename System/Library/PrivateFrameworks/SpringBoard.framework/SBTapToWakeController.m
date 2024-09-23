@implementation SBTapToWakeController

- (SBTapToWakeController)init
{
  SBTapToWakeController *v2;
  SBFTapToWakeGestureRecognizer *v3;
  SBFTapToWakeGestureRecognizer *tapToWakeGestureRecognizer;
  SBFTapToWakeGestureRecognizer *v5;
  SBFTapToWakeGestureRecognizer *pencilToWakeGestureRecognizer;
  void *v7;
  uint64_t v8;
  SBIdleTimerDefaults *idleTimerDefaults;
  SBIdleTimerDefaults *v10;
  void *v11;
  SBTapToWakeController *v12;
  id v13;
  _QWORD v15[4];
  SBTapToWakeController *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBTapToWakeController;
  v2 = -[SBTapToWakeController init](&v17, sel_init);
  if (v2)
  {
    v3 = (SBFTapToWakeGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DA9F08]);
    tapToWakeGestureRecognizer = v2->_tapToWakeGestureRecognizer;
    v2->_tapToWakeGestureRecognizer = v3;

    -[SBFTapToWakeGestureRecognizer setName:](v2->_tapToWakeGestureRecognizer, "setName:", CFSTR("tapToWake"));
    -[SBFTapToWakeGestureRecognizer setAllowedTouchTypes:](v2->_tapToWakeGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE2F0);
    -[SBFTapToWakeGestureRecognizer setDelegate:](v2->_tapToWakeGestureRecognizer, "setDelegate:", v2);
    -[SBFTapToWakeGestureRecognizer addTarget:action:](v2->_tapToWakeGestureRecognizer, "addTarget:action:", v2, sel_tapToWakeDidRecognize_);
    v5 = (SBFTapToWakeGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DA9F08]);
    pencilToWakeGestureRecognizer = v2->_pencilToWakeGestureRecognizer;
    v2->_pencilToWakeGestureRecognizer = v5;

    -[SBFTapToWakeGestureRecognizer setName:](v2->_pencilToWakeGestureRecognizer, "setName:", CFSTR("pencilToWake"));
    -[SBFTapToWakeGestureRecognizer setAllowedTouchTypes:](v2->_pencilToWakeGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE308);
    -[SBFTapToWakeGestureRecognizer setDelegate:](v2->_pencilToWakeGestureRecognizer, "setDelegate:", v2);
    -[SBFTapToWakeGestureRecognizer addTarget:action:](v2->_pencilToWakeGestureRecognizer, "addTarget:action:", v2, sel_pencilToWakeDidRecognize_);
    v2->_digitizerInTapToWakeMode = 0;
    *(_WORD *)&v2->_gesturesEnabled = 0;
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idleTimerDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    idleTimerDefaults = v2->_idleTimerDefaults;
    v2->_idleTimerDefaults = (SBIdleTimerDefaults *)v8;

    v10 = v2->_idleTimerDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supportTapToWake");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __29__SBTapToWakeController_init__block_invoke;
    v15[3] = &unk_1E8E9DED8;
    v12 = v2;
    v16 = v12;
    v13 = (id)-[SBIdleTimerDefaults observeDefault:onQueue:withBlock:](v10, "observeDefault:onQueue:withBlock:", v11, MEMORY[0x1E0C80D38], v15);

    -[SBTapToWakeController _evaluateEnablement](v12, "_evaluateEnablement");
  }
  return v2;
}

uint64_t __29__SBTapToWakeController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateEnablement");
}

+ (BOOL)isTapToWakeSupported
{
  if (isTapToWakeSupported_onceToken != -1)
    dispatch_once(&isTapToWakeSupported_onceToken, &__block_literal_global_35);
  return isTapToWakeSupported_supportsTTW;
}

void __45__SBTapToWakeController_isTapToWakeSupported__block_invoke()
{
  NSObject *v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  isTapToWakeSupported_supportsTTW = MGGetBoolAnswer();
  SBLogBacklight();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = isTapToWakeSupported_supportsTTW;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_INFO, "TTW supported:%{BOOL}u", (uint8_t *)v1, 8u);
  }

}

- (BOOL)shouldTapToWake
{
  return -[SBIdleTimerDefaults supportTapToWake](self->_idleTimerDefaults, "supportTapToWake");
}

- (void)setDigitizerInTapToWakeMode:(BOOL)a3
{
  if (self->_digitizerInTapToWakeMode != a3)
  {
    self->_digitizerInTapToWakeMode = a3;
    -[SBTapToWakeController _evaluateEnablement](self, "_evaluateEnablement");
  }
}

- (void)setDigitizerModeRequiresHitTestSuppression:(BOOL)a3
{
  if (self->_digitizerModeRequiresHitTestSuppression != a3)
  {
    self->_digitizerModeRequiresHitTestSuppression = a3;
    -[SBTapToWakeController _evaluateEnablement](self, "_evaluateEnablement");
  }
}

- (void)_setGesturesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  SBFTapToWakeGestureRecognizer *tapToWakeGestureRecognizer;
  void *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_gesturesEnabled != a3)
  {
    v3 = a3;
    self->_gesturesEnabled = a3;
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
    if (v3)
    {
      objc_msgSend(v5, "addGestureRecognizer:withType:", tapToWakeGestureRecognizer, 66);

      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addGestureRecognizer:withType:", self->_pencilToWakeGestureRecognizer, 67);
    }
    else
    {
      objc_msgSend(v5, "removeGestureRecognizer:", tapToWakeGestureRecognizer);

      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeGestureRecognizer:", self->_pencilToWakeGestureRecognizer);
    }

    SBLogBacklight();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_gesturesEnabled)
        v10 = "enabled";
      else
        v10 = "disabled";
      v11 = 136446210;
      v12 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "TTW: gestures now %{public}s", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)_evaluateEnablement
{
  _BOOL4 digitizerInTapToWakeMode;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL8 v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "isTapToWakeSupported") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTapToWakeController.m"), 119, CFSTR("don't instantiate this class if it's not supported"));

  }
  digitizerInTapToWakeMode = self->_digitizerInTapToWakeMode;
  v5 = -[SBTapToWakeController shouldTapToWake](self, "shouldTapToWake");
  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = digitizerInTapToWakeMode;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "TTW: enable state change digitizerTTW:%{BOOL}u default:%{BOOL}u", (uint8_t *)v9, 0xEu);
  }

  v7 = digitizerInTapToWakeMode && v5;
  -[SBTapToWakeController _setGesturesEnabled:](self, "_setGesturesEnabled:", v7);
  -[SBTapToWakeController _setHitTestSuppressionEnabled:](self, "_setHitTestSuppressionEnabled:", self->_digitizerModeRequiresHitTestSuppression);
}

- (void)tapToWakeDidRecognize:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "tapToWakeDidRecognize:", buf, 2u);
  }

  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v4);

  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "tapToWakeDidRecognize", (const char *)&unk_1D0E9B6CB, v14, 2u);
  }

  -[SBTapToWakeController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tapToWakeControllerDidRecognizeWakeGesture:", self);

  SBLogBacklight();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v12, OS_SIGNPOST_INTERVAL_END, v7, "tapToWakeDidRecognize", (const char *)&unk_1D0E9B6CB, v13, 2u);
  }

}

- (void)pencilToWakeDidRecognize:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "pencilToWakeDidRecognize:", buf, 2u);
  }

  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v4);

  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "pencilToWakeDidRecognize", (const char *)&unk_1D0E9B6CB, v14, 2u);
  }

  -[SBTapToWakeController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tapToWakeControllerDidRecognizePencilWakeGesture:", self);

  SBLogBacklight();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v12, OS_SIGNPOST_INTERVAL_END, v7, "pencilToWakeDidRecognize", (const char *)&unk_1D0E9B6CB, v13, 2u);
  }

}

- (SBInactiveTouchShieldWindow)_inactiveTouchShieldWindow
{
  SBInactiveTouchShieldWindow *inactiveTouchShieldWindow;
  uint64_t v4;
  SBInactiveTouchShieldWindow *v5;
  SBInactiveTouchShieldWindow *v6;
  void *v7;
  SBInactiveTouchShieldWindow *v8;

  inactiveTouchShieldWindow = self->_inactiveTouchShieldWindow;
  if (!inactiveTouchShieldWindow)
  {
    -[NSHashTable anyObject](self->_recycledInactiveTouchShieldWindows, "anyObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (SBInactiveTouchShieldWindow *)v4;
      -[NSHashTable removeObject:](self->_recycledInactiveTouchShieldWindows, "removeObject:", v4);
    }
    else
    {
      v6 = [SBInactiveTouchShieldWindow alloc];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[_UIRootWindow initWithScreen:](v6, "initWithScreen:", v7);

    }
    -[_UIRootWindow setHidden:](v5, "setHidden:", 1);
    -[SBInactiveTouchShieldWindow setWindowLevel:](v5, "setWindowLevel:", 3.40282347e38);
    v8 = self->_inactiveTouchShieldWindow;
    self->_inactiveTouchShieldWindow = v5;

    inactiveTouchShieldWindow = self->_inactiveTouchShieldWindow;
  }
  return inactiveTouchShieldWindow;
}

- (void)_setHitTestSuppressionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  SBInactiveTouchShieldWindow *v6;
  SBInactiveTouchShieldWindow *v7;
  NSHashTable *recycledInactiveTouchShieldWindows;
  NSHashTable *v9;
  NSHashTable *v10;
  SBInactiveTouchShieldWindow *inactiveTouchShieldWindow;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_hitTestSuppressionEnabled != a3)
  {
    v3 = a3;
    SBLogBacklight();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "TTW: hit-testing suppression enabled:%{BOOL}u", (uint8_t *)v12, 8u);
    }

    self->_hitTestSuppressionEnabled = v3;
    if (v3)
    {
      -[SBTapToWakeController _inactiveTouchShieldWindow](self, "_inactiveTouchShieldWindow");
      v6 = (SBInactiveTouchShieldWindow *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = self->_inactiveTouchShieldWindow;
    }
    v7 = v6;
    -[_UIRootWindow setHidden:](v6, "setHidden:", !v3);
    if (v7 && !v3)
    {
      recycledInactiveTouchShieldWindows = self->_recycledInactiveTouchShieldWindows;
      if (!recycledInactiveTouchShieldWindows)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v10 = self->_recycledInactiveTouchShieldWindows;
        self->_recycledInactiveTouchShieldWindows = v9;

        recycledInactiveTouchShieldWindows = self->_recycledInactiveTouchShieldWindows;
      }
      -[NSHashTable addObject:](recycledInactiveTouchShieldWindows, "addObject:", v7);
      inactiveTouchShieldWindow = self->_inactiveTouchShieldWindow;
      self->_inactiveTouchShieldWindow = 0;

    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SBTapToWakeDelegate)delegate
{
  return (SBTapToWakeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDigitizerInTapToWakeMode
{
  return self->_digitizerInTapToWakeMode;
}

- (BOOL)digitizerModeRequiresHitTestSuppression
{
  return self->_digitizerModeRequiresHitTestSuppression;
}

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, a3);
}

- (SBFTapToWakeGestureRecognizer)pencilToWakeGestureRecognizer
{
  return self->_pencilToWakeGestureRecognizer;
}

- (void)setPencilToWakeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pencilToWakeGestureRecognizer, a3);
}

- (SBIdleTimerDefaults)idleTimerDefaults
{
  return self->_idleTimerDefaults;
}

- (void)setIdleTimerDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDefaults, a3);
}

- (BOOL)_gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (BOOL)_isHitTestSuppressionEnabled
{
  return self->_hitTestSuppressionEnabled;
}

- (NSHashTable)_recycledInactiveTouchShieldWindows
{
  return self->_recycledInactiveTouchShieldWindows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recycledInactiveTouchShieldWindows, 0);
  objc_storeStrong((id *)&self->_idleTimerDefaults, 0);
  objc_storeStrong((id *)&self->_pencilToWakeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inactiveTouchShieldWindow, 0);
}

@end
