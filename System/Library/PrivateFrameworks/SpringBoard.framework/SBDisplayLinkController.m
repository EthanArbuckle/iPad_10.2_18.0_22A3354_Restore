@implementation SBDisplayLinkController

- (SBDisplayLinkController)initWithCADisplay:(id)a3 backlight:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  SBDisplayLinkController *v11;
  SBDisplayLinkController *v12;
  id *p_display;
  NSObject *v14;
  int v15;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDisplayLinkController initWithCADisplay:backlight:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08ACD80);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v22)
      v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDisplayLinkController initWithCADisplay:backlight:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08ACE28);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("backlight"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDisplayLinkController initWithCADisplay:backlight:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08ACE8CLL);
  }
  v28.receiver = self;
  v28.super_class = (Class)SBDisplayLinkController;
  v11 = -[SBDisplayLinkController init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    p_display = (id *)&v11->_display;
    objc_storeStrong((id *)&v11->_display, a3);
    objc_storeStrong((id *)&v12->_backlight, a4);
    if (-[CADisplay isForceFixedRateLinksEnabled](v12->_display, "isForceFixedRateLinksEnabled"))
    {
      SBLogBacklight();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(*p_display, "displayId");
        *(_DWORD *)buf = 67109120;
        v30 = v15;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: resetting forceFixedRateLinksEnabled at bootstrap", buf, 8u);
      }

      objc_msgSend(*p_display, "setForceFixedRateLinksEnabled:", 0);
    }
  }

  return v12;
}

- (id)maintainDisplayLinkWhenBacklightIsOffForReason:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  _BOOL4 displayLinkWouldBeOff;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  _WORD v25[11];

  *(_QWORD *)&v25[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayLinkController-%i: cannot adjust _maintainDisplayLinkWhenBacklightIsOffCount after invalidation"), -[CADisplay displayId](self->_display, "displayId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDisplayLinkController maintainDisplayLinkWhenBacklightIsOffForReason:].cold.2();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08AD158);
  }
  if (self->_maintainDisplayLinkWhenBacklightIsOffCount == 255)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayLinkController-%i: preventing _maintainDisplayLinkWhenBacklightIsOffCount overflow"), -[CADisplay displayId](self->_display, "displayId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDisplayLinkController maintainDisplayLinkWhenBacklightIsOffForReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08AD1C0);
  }
  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[CADisplay displayId](self->_display, "displayId");
    *(_DWORD *)buf = 67109378;
    v23 = v7;
    v24 = 2112;
    *(_QWORD *)v25 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: taking maintainDisplayLinkWhenBacklightIsOff assertion for %@", buf, 0x12u);
  }

  ++self->_maintainDisplayLinkWhenBacklightIsOffCount;
  if (!self->_observerRegistered)
  {
    self->_observerRegistered = 1;
    -[BLSHBacklightHostObservable addObserver:](self->_backlight, "addObserver:", self);
    -[BLSHBacklightHostObservable backlightDisplayMode](self->_backlight, "backlightDisplayMode");
    self->_displayLinkWouldBeOff = IsBlankedForBLSBacklightDisplayMode();
    SBLogBacklight();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[CADisplay displayId](self->_display, "displayId");
      displayLinkWouldBeOff = self->_displayLinkWouldBeOff;
      NSStringFromBLSBacklightDisplayMode();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v23 = v9;
      v24 = 1024;
      *(_DWORD *)v25 = displayLinkWouldBeOff;
      v25[2] = 2112;
      *(_QWORD *)&v25[3] = v11;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: _displayLinkWouldBeOff initialized to %{BOOL}i for %@", buf, 0x18u);

    }
  }
  -[SBDisplayLinkController _reevaluateForcingFixedRateLinks](self, "_reevaluateForcingFixedRateLinks");
  v12 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayLinkController-%i:maintainDisplayLinkWhenBacklightIsOff"), -[CADisplay displayId](self->_display, "displayId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke;
  v19[3] = &unk_1E8EAB640;
  v20 = v5;
  v21 = a2;
  v19[4] = self;
  v14 = v5;
  v15 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:invalidationBlock:", v13, v14, v19);

  return v15;
}

void __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSDispatchQueueAssertMain();
  v5 = a1 + 32;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayLinkController-%i: preventing _maintainDisplayLinkWhenBacklightIsOffCount underflow"), objc_msgSend(*(id *)(v4 + 8), "displayId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08AD348);
  }
  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "displayId");
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: releasing maintainDisplayLinkWhenBacklightIsOff assertion for %@", buf, 0x12u);
  }

  --*(_BYTE *)(*(_QWORD *)v5 + 24);
  v9 = *(_BYTE **)v5;
  if (*(_BYTE *)(*(_QWORD *)v5 + 25) && !v9[24])
  {
    v9[25] = 0;
    objc_msgSend(*(id *)(*(_QWORD *)v5 + 16), "removeObserver:");
    v9 = *(_BYTE **)v5;
  }
  objc_msgSend(v9, "_reevaluateForcingFixedRateLinks");

}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_observerRegistered)
    {
      self->_observerRegistered = 0;
      -[BLSHBacklightHostObservable removeObserver:](self->_backlight, "removeObserver:", self);
    }
    if (self->_displayLinkForcedToFixedRate)
    {
      SBLogBacklight();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = -[CADisplay displayId](self->_display, "displayId");
        v5[0] = 67109120;
        v5[1] = v4;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: resetting forceFixedRateLinksEnabled", (uint8_t *)v5, 8u);
      }

      -[CADisplay setForceFixedRateLinksEnabled:](self->_display, "setForceFixedRateLinksEnabled:", 0);
    }
  }
}

- (void)_reevaluateForcingFixedRateLinks
{
  _BOOL8 v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    v3 = self->_displayLinkWouldBeOff && (unint64_t)(self->_maintainDisplayLinkWhenBacklightIsOffCount != 0);
    if (self->_displayLinkForcedToFixedRate != v3)
    {
      SBLogBacklight();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = -[CADisplay displayId](self->_display, "displayId");
        v6[0] = 67109376;
        v6[1] = v5;
        v7 = 1024;
        v8 = v3;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: setting forceFixedRateLinksEnabled to %{BOOL}i", (uint8_t *)v6, 0xEu);
      }

      self->_displayLinkForcedToFixedRate = v3;
      -[CADisplay setForceFixedRateLinksEnabled:](self->_display, "setForceFixedRateLinksEnabled:", v3);
    }
  }
}

- (void)backlight:(id)a3 willUnblankToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 forEvents:(id)a6 abortedEvents:(id)a7
{
  NSObject *v8;
  int v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[CADisplay displayId](self->_display, "displayId");
    v10[0] = 67109120;
    v10[1] = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: display is unblanking - updating _displayLinkWouldBeOff to false", (uint8_t *)v10, 8u);
  }

  self->_displayLinkWouldBeOff = 0;
  -[SBDisplayLinkController _reevaluateForcingFixedRateLinks](self, "_reevaluateForcingFixedRateLinks");
}

- (void)backlight:(id)a3 didBlankToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7
{
  NSObject *v8;
  int v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[CADisplay displayId](self->_display, "displayId");
    v10[0] = 67109120;
    v10[1] = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: display is blanking - updating _displayLinkWouldBeOff to true", (uint8_t *)v10, 8u);
  }

  self->_displayLinkWouldBeOff = 1;
  -[SBDisplayLinkController _reevaluateForcingFixedRateLinks](self, "_reevaluateForcingFixedRateLinks");
}

- (BOOL)observesBlankingChanges
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (void)initWithCADisplay:backlight:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCADisplay:backlight:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)maintainDisplayLinkWhenBacklightIsOffForReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)maintainDisplayLinkWhenBacklightIsOffForReason:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(*(SEL *)(v0 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
