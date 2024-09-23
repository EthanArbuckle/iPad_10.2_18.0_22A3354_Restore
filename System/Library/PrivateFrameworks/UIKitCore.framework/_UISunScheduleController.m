@implementation _UISunScheduleController

- (_UISunScheduleController)init
{
  _UISunScheduleController *v2;
  _UISunScheduleController *v3;
  void *v4;
  objc_class *v5;
  GEOAlmanac *v6;
  GEOAlmanac *almanac;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)_UISunScheduleController;
  v2 = -[_UISunScheduleController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_inScheduleTime = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1292;
    v16 = _MergedGlobals_1292;
    if (!_MergedGlobals_1292)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getGEOAlmanacClass_block_invoke;
      v12[3] = &unk_1E16B14C0;
      v12[4] = &v13;
      __getGEOAlmanacClass_block_invoke((uint64_t)v12);
      v4 = (void *)v14[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v13, 8);
    v6 = (GEOAlmanac *)objc_alloc_init(v5);
    almanac = v3->_almanac;
    v3->_almanac = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__significantTimeChange, 0x1E1761B60, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__timeZoneChange, *MEMORY[0x1E0C998A0], 0);

    -[_UISunScheduleController _updateGeoCity](v3, "_updateGeoCity");
    -[_UISunScheduleController _updateStatus](v3, "_updateStatus");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UISunScheduleController _invalidateNextEventTimer](self, "_invalidateNextEventTimer");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1761B60, 0);

  v4.receiver = self;
  v4.super_class = (Class)_UISunScheduleController;
  -[_UISunScheduleController dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = (void *)objc_msgSend(v11, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v6);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", v4);

}

- (BOOL)isInScheduleTime
{
  return self->_inScheduleTime;
}

- (void)forceUpdate
{
  NSObject *v3;
  uint8_t v4[16];

  _UIUserInterfaceStyleArbiterLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "SunScheduleController forcing update", v4, 2u);
  }

  -[_UISunScheduleController _updateStatus](self, "_updateStatus");
}

- (id)nextTransition:(BOOL)a3
{
  _BOOL4 v3;
  UIUserInterfaceStyleArbiterTransition *v4;
  UIUserInterfaceStyleArbiterTransition *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_alloc_init(UIUserInterfaceStyleArbiterTransition);
  v5 = v4;
  if (v3)
    v6 = 2;
  else
    v6 = 1;
  -[UIUserInterfaceStyleArbiterTransition setType:](v4, "setType:", v6);
  return v5;
}

- (void)_notifyChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable keyEnumerator](self->_observers, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _UISunScheduleController *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_updateInScheduleTime:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 inScheduleTime;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    inScheduleTime = self->_inScheduleTime;
    v7[0] = 67109376;
    v7[1] = v3;
    v8 = 1024;
    v9 = inScheduleTime;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "SunScheduleController is in dark: %d from: %d", (uint8_t *)v7, 0xEu);
  }

  if (self->_inScheduleTime != v3)
  {
    self->_inScheduleTime = v3;
    -[_UISunScheduleController _notifyChange](self, "_notifyChange");
  }
}

- (void)_updateStatus
{
  -[_UISunScheduleController _updateStatusWithAbsoluteTime:](self, "_updateStatusWithAbsoluteTime:", CFAbsoluteTimeGetCurrent());
}

- (void)_updateStatusWithAbsoluteTime:(double)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  double sunsetAbsolute;
  double sunriseAbsolute;
  NSObject *v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    formatAbsoluteTime(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "SunScheduleController updating status for time: %@", (uint8_t *)&v18, 0xCu);

  }
  -[_UISunScheduleController _updateSunriseSunsetTimesRelativeTo:](self, "_updateSunriseSunsetTimesRelativeTo:", a3);
  _UIUserInterfaceStyleArbiterLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    formatAbsoluteTime(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    formatAbsoluteTime(self->_sunriseAbsolute);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    formatAbsoluteTime(self->_sunsetAbsolute);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "SunScheduleController comparing time %@ to sunrise %@, sunset %@", (uint8_t *)&v18, 0x20u);

  }
  sunsetAbsolute = self->_sunsetAbsolute;
  sunriseAbsolute = self->_sunriseAbsolute;
  if (sunriseAbsolute > a3)
  {
    if (sunsetAbsolute <= a3)
    {
      -[_UISunScheduleController _updateInScheduleTime:](self, "_updateInScheduleTime:", 1);
      _UIUserInterfaceStyleArbiterLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Only sunrise is in the future, so it's dark", (uint8_t *)&v18, 2u);
      }

      v14 = self->_sunriseAbsolute;
    }
    else
    {
      -[_UISunScheduleController _updateInScheduleTime:](self, "_updateInScheduleTime:", sunriseAbsolute < sunsetAbsolute);
      _UIUserInterfaceStyleArbiterLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109120;
        LODWORD(v19) = sunriseAbsolute < sunsetAbsolute;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Both in the future, in schedule = %d", (uint8_t *)&v18, 8u);
      }

      v14 = self->_sunriseAbsolute;
      if (v14 >= self->_sunsetAbsolute)
        v14 = self->_sunsetAbsolute;
    }
LABEL_19:
    -[_UISunScheduleController _setNextEventTimerToAbsoluteTime:](self, "_setNextEventTimerToAbsoluteTime:", v14);
    return;
  }
  if (sunsetAbsolute > a3)
  {
    -[_UISunScheduleController _updateInScheduleTime:](self, "_updateInScheduleTime:", 0);
    _UIUserInterfaceStyleArbiterLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Only sunset is in the future, so it's light", (uint8_t *)&v18, 2u);
    }

    v14 = self->_sunsetAbsolute;
    goto LABEL_19;
  }
  _UIUserInterfaceStyleArbiterLogger();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "SunScheduleController: ERROR: Both in the past. Doing nothing.", (uint8_t *)&v18, 2u);
  }

}

- (void)_invalidateNextEventTimer
{
  NSTimer *nextEventTimer;
  NSTimer *v4;

  nextEventTimer = self->_nextEventTimer;
  if (nextEventTimer)
  {
    -[NSTimer invalidate](nextEventTimer, "invalidate");
    v4 = self->_nextEventTimer;
    self->_nextEventTimer = 0;

  }
}

- (void)_setNextEventTimerToAbsoluteTime:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSTimer *v9;
  NSTimer *nextEventTimer;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[_UISunScheduleController _invalidateNextEventTimer](self, "_invalidateNextEventTimer");
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    formatAbsoluteTime(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Setting timer for next event: %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99E88]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __61___UISunScheduleController__setNextEventTimerToAbsoluteTime___block_invoke;
  v15 = &unk_1E16E8600;
  v16[1] = *(id *)&a3;
  objc_copyWeak(v16, (id *)buf);
  v9 = (NSTimer *)objc_msgSend(v8, "initWithFireDate:interval:repeats:block:", v7, 0, &v12, 0.0);
  nextEventTimer = self->_nextEventTimer;
  self->_nextEventTimer = v9;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTimer:forMode:", self->_nextEventTimer, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);
}

- (void)_significantTimeChange
{
  NSObject *v3;
  uint8_t v4[16];

  _UIUserInterfaceStyleArbiterLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Significant time change", v4, 2u);
  }

  -[_UISunScheduleController _updateStatus](self, "_updateStatus");
}

- (void)_timeZoneChange
{
  NSObject *v3;
  uint8_t v4[16];

  _UIUserInterfaceStyleArbiterLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Time zone change", v4, 2u);
  }

  -[_UISunScheduleController _updateGeoCity](self, "_updateGeoCity");
  -[_UISunScheduleController _updateStatus](self, "_updateStatus");
}

- (void)_updateGeoCity
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  float v10;
  double v11;
  float v12;
  double v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _UIUserInterfaceStyleArbiterLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = 0.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Failed to get system time zone", (uint8_t *)&v26, 2u);
    }
    v14 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultCityForTimeZone:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  _UIUserInterfaceStyleArbiterLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      objc_msgSend(v3, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "SunScheduleController: System time zone %{public}@ has no default city", (uint8_t *)&v26, 0xCu);

    }
    v16 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v3, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_ui_canonicalTimeZoneNameForTimeZoneName:", v17);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6
      && (objc_msgSend(v3, "name"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = -[NSObject isEqual:](v6, "isEqual:", v18),
          v18,
          (v19 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "defaultCityForTimeZone:", v8);
        v5 = objc_claimAutoreleasedReturnValue();

        _UIUserInterfaceStyleArbiterLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (v22)
          {
            -[NSObject name](v8, "name");
            v23 = objc_claimAutoreleasedReturnValue();
            -[NSObject name](v5, "name");
            v24 = objc_claimAutoreleasedReturnValue();
            v26 = 138543618;
            v27 = v23;
            v28 = 2114;
            v29 = v24;
            _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Canonicalized time zone %{public}@ has a default city %{public}@", (uint8_t *)&v26, 0x16u);

          }
          goto LABEL_5;
        }
        if (v22)
        {
          -[NSObject name](v8, "name");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 138543362;
          v27 = v25;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Canonicalized time zone %{public}@ has no default city", (uint8_t *)&v26, 0xCu);

        }
      }
      else
      {
        _UIUserInterfaceStyleArbiterLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138543362;
          v27 = v6;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Canonicalized time zone has name %{public}@ but no NSTimeZone", (uint8_t *)&v26, 0xCu);
        }
      }

    }
    else
    {
      _UIUserInterfaceStyleArbiterLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "name");
        v20 = objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v20;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "SunScheduleController: No distinct canonicalized time zone name for %{public}@", (uint8_t *)&v26, 0xCu);

      }
    }

    v14 = 0;
    v13 = 0.0;
LABEL_26:
    v11 = 0.0;
    goto LABEL_27;
  }
  if (v7)
  {
    objc_msgSend(v3, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject name](v5, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v8;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "SunScheduleController: System time zone %{public}@ has a default city %{public}@", (uint8_t *)&v26, 0x16u);
LABEL_5:

  }
  -[NSObject latitude](v5, "latitude");
  v11 = v10;
  -[NSObject longitude](v5, "longitude");
  v13 = v12;
  v14 = 1;
  v6 = v5;
LABEL_27:

  self->_hasTimeZoneLocation = v14;
  self->_timeZoneLocation.latitude = v11;
  self->_timeZoneLocation.longitude = v13;

}

- (void)_updateSunriseSunsetTimesRelativeTo:(double)a3
{
  GEOAlmanac *almanac;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  NSObject *v16;
  __CFCalendar *v17;
  __CFCalendar *v18;
  double *p_sunsetAbsolute;
  double v20;
  NSObject *v21;
  NSObject *v22;
  double *p_sunriseAbsolute;
  NSObject *v24;
  uint8_t v25[16];
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];

  almanac = self->_almanac;
  if (almanac && self->_hasTimeZoneLocation)
  {
    -[GEOAlmanac calculateAstronomicalTimeForLocation:](almanac, "calculateAstronomicalTimeForLocation:", self->_timeZoneLocation.latitude, self->_timeZoneLocation.longitude);
    -[GEOAlmanac sunrise](self->_almanac, "sunrise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;

    if (v8 < a3)
    {
      -[GEOAlmanac nextSunrise](self->_almanac, "nextSunrise");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v8 = v10;

    }
    -[GEOAlmanac sunset](self->_almanac, "sunset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

    if (v13 < a3)
    {
      -[GEOAlmanac nextSunset](self->_almanac, "nextSunset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v13 = v15;

    }
    self->_sunsetAbsolute = v13;
    self->_sunriseAbsolute = v8;
  }
  else
  {
    _UIUserInterfaceStyleArbiterLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "SunScheduleController: No time zone location heuristic available, using hard-coded defaults", buf, 2u);
    }

    v17 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
    if (v17)
    {
      v18 = v17;
      CFCalendarSetTimeZone(v17, (CFTimeZoneRef)objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone"));
      *(_DWORD *)buf = 0;
      v26 = 0;
      v27 = 0;
      if (CFCalendarDecomposeAbsoluteTime(v18, a3, "yMdHm", buf, (char *)&v27 + 4, &v27, (char *)&v26 + 4, &v26))
      {
        v26 = 0x1300000000;
        p_sunsetAbsolute = &self->_sunsetAbsolute;
        if (CFCalendarComposeAbsoluteTime(v18, &self->_sunsetAbsolute, "yMdHm", *(unsigned int *)buf, HIDWORD(v27), v27, 19, 0))
        {
          v20 = *p_sunsetAbsolute;
          if (*p_sunsetAbsolute < a3)
            CFCalendarAddComponents(v18, &self->_sunsetAbsolute, 0, "d", v20, 1);
        }
        else
        {
          _UIUserInterfaceStyleArbiterLogger();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Unable to compute fallback sunset time", v25, 2u);
          }

        }
        v26 = 0x700000000;
        p_sunriseAbsolute = &self->_sunriseAbsolute;
        if (CFCalendarComposeAbsoluteTime(v18, p_sunriseAbsolute, "yMdHm", v20, *(unsigned int *)buf, HIDWORD(v27), v27, 7, 0))
        {
          if (*p_sunriseAbsolute < a3)
            CFCalendarAddComponents(v18, p_sunriseAbsolute, 0, "d", *p_sunriseAbsolute, 1);
        }
        else
        {
          _UIUserInterfaceStyleArbiterLogger();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Unable to compute fallback sunrise time", v25, 2u);
          }

        }
      }
      CFRelease(v18);
    }
    else
    {
      _UIUserInterfaceStyleArbiterLogger();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Unable to create calendar", buf, 2u);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEventTimer, 0);
  objc_storeStrong((id *)&self->_almanac, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
