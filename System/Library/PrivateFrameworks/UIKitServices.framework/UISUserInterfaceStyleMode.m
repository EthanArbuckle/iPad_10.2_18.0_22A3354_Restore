@implementation UISUserInterfaceStyleMode

- (UISUserInterfaceStyleMode)initWithDelegate:(id)a3
{
  id v4;
  UISUserInterfaceStyleMode *v5;
  UISUserInterfaceStyleMode *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UISUserInterfaceStyleMode;
  v5 = -[UISUserInterfaceStyleMode init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_delegate, v4);

    if (v4)
    {
      _UISUserInterfaceStyleModeUserDefaults();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v6, CFSTR("UserInterfaceStyleMode"), 1, 0);

      _UISUserInterfaceStyleModeUserDefaults();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v6, CFSTR("Override"), 1, 0);

      _UISUserInterfaceStyleModeUserDefaults();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v6, CFSTR("CustomSchedule"), 1, 0);

      v6->_observingDefaults = 1;
    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_observingDefaults)
  {
    _UISUserInterfaceStyleModeUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("UserInterfaceStyleMode"));

    _UISUserInterfaceStyleModeUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("Override"));

    _UISUserInterfaceStyleModeUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("CustomSchedule"));

  }
  v6.receiver = self;
  v6.super_class = (Class)UISUserInterfaceStyleMode;
  -[UISUserInterfaceStyleMode dealloc](&v6, sel_dealloc);
}

- (int64_t)modeValue
{
  void *v2;
  int64_t v3;

  _UISUserInterfaceStyleModeUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("UserInterfaceStyleMode"));

  if ((unint64_t)(v3 - 1) >= 2 && v3 != 102 && v3 != 100)
    return 1;
  return v3;
}

- (void)setModeValue:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _UISUserInterfaceStyleModeServiceLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D23008], "processHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2050;
    v14 = a3;
    _os_log_impl(&dword_190875000, v5, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" is requesting to change the mode to %{public}ld", buf, 0x16u);

  }
  if ((unint64_t)(a3 - 1) < 2 || a3 == 100 || a3 == 102)
  {
    if (-[UISUserInterfaceStyleMode modeValue](self, "modeValue") != a3)
    {
      _UISUserInterfaceStyleModeUserDefaults();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInteger:forKey:", a3, CFSTR("UserInterfaceStyleMode"));

      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0x64)
      {
        _UISUserInterfaceStyleModeUserDefaults();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setInteger:forKey:", a3, CFSTR("MostRecentAutomaticMode"));

      }
      -[UISUserInterfaceStyleMode _setOverride:force:](self, "_setOverride:force:", 0, 0, 1);
      AnalyticsSendEventLazy();
    }
  }
  else
  {
    _UISUserInterfaceStyleModeServiceLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D23008], "processHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v10;
      v13 = 2050;
      v14 = a3;
      _os_log_error_impl(&dword_190875000, v9, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" provided an invalid mode %{public}ld, ignoring", buf, 0x16u);

    }
  }
}

id __42__UISUserInterfaceStyleMode_setModeValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_commonAnalyticsEventDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("currentMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("previousMode"));

  return v2;
}

- (int64_t)suggestedAutomaticModeValue
{
  void *v2;
  int64_t v3;

  _UISUserInterfaceStyleModeUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MostRecentAutomaticMode"));

  if ((unint64_t)(v3 - 1) >= 2 && v3 != 102 && v3 != 100)
    return 100;
  return v3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)override
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  _UISUserInterfaceStyleModeUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("Override"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Style"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(v5, "integerValue");
    else
      v6 = -1;
    objc_msgSend(v4, "objectForKey:", CFSTR("Timing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v8, "integerValue");
    else
      v7 = -1;

  }
  else
  {
    v7 = -1;
    v6 = -1;
  }
  if ((-[UISUserInterfaceStyleMode modeValue](self, "modeValue") & 0xFFFFFFFFFFFFFFFDLL) != 0x64
    || v6 > 2
    || v7 > 2
    || (v7 == 0) == (v6 != 0))
  {
    v6 = 0;
    v7 = 0;
  }

  v9 = v6;
  v10 = v7;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)setOverride:(id)a3
{
  int64_t var1;
  int64_t var0;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  var1 = a3.var1;
  var0 = a3.var0;
  v14 = *MEMORY[0x1E0C80C00];
  _UISUserInterfaceStyleModeServiceLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D23008], "processHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v7;
    v10 = 2050;
    v11 = var0;
    v12 = 2050;
    v13 = var1;
    _os_log_impl(&dword_190875000, v6, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" set override: %{public}ld %{public}ld", (uint8_t *)&v8, 0x20u);

  }
  -[UISUserInterfaceStyleMode _setOverride:force:](self, "_setOverride:force:", var0, var1, 0);
}

- (void)_setOverride:(id)a3 force:(BOOL)a4
{
  int64_t var1;
  int64_t var0;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v16[2] = *MEMORY[0x1E0C80C00];
  if (a3.var0 <= 2uLL && a3.var1 <= 2uLL && (a3.var0 != 0) != (a3.var1 == 0))
  {
    if (a4)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISUserInterfaceStyleMode.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("overrideIsValid(newOverride)"));

    if (a4)
      goto LABEL_6;
  }
  if ((-[UISUserInterfaceStyleMode modeValue](self, "modeValue") & 0xFFFFFFFFFFFFFFFDLL) != 0x64)
    return;
LABEL_6:
  if (var0 | var1)
  {
    v15[0] = CFSTR("Style");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("Timing");
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _UISUserInterfaceStyleModeUserDefaults();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("Override"));

    if (a4)
      return;
  }
  else
  {
    _UISUserInterfaceStyleModeUserDefaults();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("Override"));

    if (a4)
      return;
  }
  AnalyticsSendEventLazy();
}

id __48__UISUserInterfaceStyleMode__setOverride_force___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_commonAnalyticsEventDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("overrideStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("overrideTiming"));

  return v2;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)customSchedule
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  int64_t v15;
  void *v16;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  id v18;

  _UISUserInterfaceStyleModeUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("CustomSchedule"));
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_27;
  objc_msgSend(v18, "objectForKey:", CFSTR("Begin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "objectForKey:", CFSTR("Hour"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v7, "integerValue") : -1;
    objc_msgSend(v6, "objectForKey:", CFSTR("Minute"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v9 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v10, "integerValue") : -1;

  }
  else
  {
    v8 = -1;
    v9 = -1;
  }
  objc_msgSend(v18, "objectForKey:", CFSTR("End"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    objc_msgSend(v12, "objectForKey:", CFSTR("Hour"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v13, "integerValue") : -1;
    objc_msgSend(v12, "objectForKey:", CFSTR("Minute"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v15 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v16, "integerValue") : -1;

  }
  else
  {
    v14 = -1;
    v15 = -1;
  }

  if (v8 > 0x17 || v9 < 0 || v9 > 59 || v14 > 0x17 || v15 < 0 || v15 > 59)
  {
LABEL_27:
    retstr->var0 = 0u;
    retstr->var1 = 0u;
  }
  else
  {
    retstr->var0.var0 = v8;
    retstr->var0.var1 = v9;
    retstr->var1.var0 = v14;
    retstr->var1.var1 = v15;
  }

  return result;
}

- (void)setCustomSchedule:(id *)a3
{
  int64_t var1;
  int64_t v7;
  NSObject *v8;
  void *v9;
  int64_t var0;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3->var0.var0 > 0x17uLL
    || (var1 = a3->var0.var1, var1 < 0)
    || var1 > 59
    || a3->var1.var0 > 0x17uLL
    || (v7 = a3->var1.var1, v7 < 0)
    || v7 >= 60)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISUserInterfaceStyleMode.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduleIsValid(newSchedule)"));

  }
  _UISUserInterfaceStyleModeServiceLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D23008], "processHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = a3->var0.var0;
    v11 = a3->var0.var1;
    v12 = a3->var1.var0;
    v13 = a3->var1.var1;
    *(_DWORD *)buf = 138544386;
    v30 = v9;
    v31 = 2050;
    v32 = var0;
    v33 = 2050;
    v34 = v11;
    v35 = 2050;
    v36 = v12;
    v37 = 2050;
    v38 = v13;
    _os_log_impl(&dword_190875000, v8, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" set custom schedule: %{public}ld %{public}ld %{public}ld %{public}ld", buf, 0x34u);

  }
  v27[0] = CFSTR("Begin");
  v25[0] = CFSTR("Hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var0.var0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = CFSTR("Minute");
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var0.var1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("End");
  v28[0] = v16;
  v23[0] = CFSTR("Hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var1.var0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("Minute");
  v24[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var1.var1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _UISUserInterfaceStyleModeUserDefaults();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("CustomSchedule"));

  AnalyticsSendEventLazy();
}

id __47__UISUserInterfaceStyleMode_setCustomSchedule___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_commonAnalyticsEventDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("beginHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("beginMinute"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("endHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("endMinute"));

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userInterfaceStyleModeDidChange:", self);

}

- (id)_commonAnalyticsEventDictionary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("bundleID"));
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
