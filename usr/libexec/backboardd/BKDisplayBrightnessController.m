@implementation BKDisplayBrightnessController

+ (BKDisplayBrightnessController)sharedInstance
{
  if (qword_1001175A8 != -1)
    dispatch_once(&qword_1001175A8, &stru_1000EC8B8);
  return (BKDisplayBrightnessController *)(id)qword_1001175A0;
}

- (void)setMinimumBrightnessLevel:(float)a3 fadeDuration:(float)a4
{
  float v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  __CFString *v13;
  int v14;
  double v15;
  __int16 v16;
  double v17;

  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = 0.0;
  v7 = BKLogBacklight(self, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218240;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting minimum brightness level: %f with fade duration %f", (uint8_t *)&v14, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (a4 <= 0.0)
  {
    *(float *)&v9 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    v13 = CFSTR("BrightnessMinPhysical");
  }
  else
  {
    *(float *)&v9 = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    sub_10000A674((uint64_t)self, v10, CFSTR("DisplayBrightnessFadePeriod"));

    *(float *)&v11 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v13 = CFSTR("BrightnessMinPhysicalWithFade");
  }
  sub_10000A674((uint64_t)self, v12, v13);

  os_unfair_lock_unlock(&self->_lock);
}

- (float)unentitledBrightnessLevel
{
  float v2;
  float v3;
  float v4;
  BOOL v5;
  float v6;

  -[BKDisplayBrightnessController brightnessLevel](self, "brightnessLevel");
  v3 = fmaxf(v2, 0.0);
  v4 = (float)(v3 * 100.0) / 5.0;
  v5 = v3 < 1.0;
  v6 = 20.0;
  if (v5)
    v6 = v4;
  return (float)(roundf(v6) * 5.0) / 100.0;
}

- (float)brightnessLevel
{
  os_unfair_lock_s *p_lock;
  float brightnessLevel;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  brightnessLevel = self->_brightnessLevel;
  os_unfair_lock_unlock(p_lock);
  return brightnessLevel;
}

- (id)_initWithBrightnessSystem:(id)a3 systemShellSentinel:(id)a4 orientationManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKDisplayBrightnessController *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  id location;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BKDisplayBrightnessController;
  v12 = -[BKDisplayBrightnessController init](&v31, "init");
  v13 = (uint64_t)v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_notificationToken = -1;
    objc_storeStrong((id *)&v12->_brightnessSystem, a3);
    v14 = objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("BKDisplayBrightnessController suppress-darwin-notifications")));
    v15 = *(void **)(v13 + 104);
    *(_QWORD *)(v13 + 104) = v14;

    *(_DWORD *)(v13 + 16) = 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    v17 = objc_msgSend(v16, "brightnessCurve");

    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 8));
    sub_100089A64(v13, (uint64_t)v17, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 8));
    objc_initWeak(&location, (id)v13);
    v18 = *(void **)(v13 + 96);
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_100089B24;
    v28 = &unk_1000EC8E0;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v18, "registerNotificationBlock:", &v25);
    objc_msgSend((id)v13, "setBacklightLocked:forReason:", 1, CFSTR("BKSystemApplicationBacklightLockReason"), v25, v26, v27, v28);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSystemShellObserver:reason:", v13, CFSTR("display brightness startup lock")));
    v20 = *(void **)(v13 + 56);
    *(_QWORD *)(v13 + 56) = v19;

    objc_storeWeak((id *)(v13 + 64), v11);
    v21 = sub_10008BB88((id *)v11, (void *)v13);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = *(void **)(v13 + 72);
    *(_QWORD *)(v13 + 72) = v22;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return (id)v13;
}

- (void)dealloc
{
  int notificationToken;
  objc_super v4;

  -[BSCompoundAssertion invalidate](self->_suppressClientNotificationsAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_orientationManagerObserving, "invalidate");
  notificationToken = self->_notificationToken;
  if (notificationToken != -1)
    notify_cancel(notificationToken);
  v4.receiver = self;
  v4.super_class = (Class)BKDisplayBrightnessController;
  -[BKDisplayBrightnessController dealloc](&v4, "dealloc");
}

- (id)suppressBrightnessNotificationsForReason:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion acquireForReason:](self->_suppressClientNotificationsAssertion, "acquireForReason:", v5));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unsigned)backlightArchitectureVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBrightnessController propertyForKey:](self, "propertyForKey:", CFSTR("DisplayBackLightArchitecture")));
  v4 = objc_opt_class(NSNumber, v3);
  v5 = v2;
  v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "unsignedCharValue");
  return v9;
}

- (void)setBrightnessLevel:(float)a3 reason:(id)a4 options:(unint64_t)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  __CFString *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSString *previousBrightnessLevelKey;
  int notificationToken;
  float v25;
  float v26;
  BOOL v27;
  float v28;
  unint64_t v29;
  _QWORD v30[2];
  _BYTE buf[22];
  __int16 v32;
  __CFString *v33;

  p_lock = &self->_lock;
  v9 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v10 = v9;
  v12 = v10;
  if (self && (self->_brightnessLevel != a3 || self->_previousBrightnessLevelOptions != a5))
  {
    v13 = BKLogBacklight(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    if (!a5)
    {
      v17 = CFSTR("none");
      goto LABEL_13;
    }
    v15 = objc_alloc_init((Class)NSMutableArray);
    v16 = v15;
    if ((a5 & 1) != 0)
    {
      objc_msgSend(v15, "addObject:", CFSTR("commit"));
      if ((a5 & 4) == 0)
      {
LABEL_8:
        if ((a5 & 2) == 0)
          goto LABEL_9;
        goto LABEL_34;
      }
    }
    else if ((a5 & 4) == 0)
    {
      goto LABEL_8;
    }
    objc_msgSend(v16, "addObject:", CFSTR("notifyClients"));
    if ((a5 & 2) == 0)
    {
LABEL_9:
      if ((a5 & 8) == 0)
      {
LABEL_11:
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", ")));

LABEL_13:
        *(_DWORD *)buf = 134218498;
        *(double *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v12;
        v32 = 2112;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "brightness change:%g reason:%{public}@ options:%@", buf, 0x20u);

LABEL_14:
        if ((a5 & 2) != 0)
        {
          *(float *)&v18 = a3;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18, CFSTR("Brightness")));
          v30[1] = CFSTR("Commit");
          *(_QWORD *)buf = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a5 & 1));
          *(_QWORD *)&buf[8] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v30, 2));

          if ((a5 & 8) != 0)
            v22 = CFSTR("DisplayInitialBrightness");
          else
            v22 = CFSTR("DisplayBrightness");
          if (!BSEqualObjects(v22, self->_previousBrightnessLevelKey)
            || (BSEqualObjects(v21, self->_previousBrightnessLevelValue) & 1) == 0)
          {
            previousBrightnessLevelKey = self->_previousBrightnessLevelKey;
            self->_previousBrightnessLevelKey = &v22->isa;

            objc_storeStrong((id *)&self->_previousBrightnessLevelValue, v21);
            sub_10000A674((uint64_t)self, v21, v22);
          }

        }
        notificationToken = self->_notificationToken;
        if (notificationToken == -1)
        {
          if (notify_register_check("UIBacklightLevelChangedNotification", &self->_notificationToken))
          {
LABEL_30:
            self->_brightnessLevel = a3;
            self->_previousBrightnessLevelOptions = a5;
            goto LABEL_31;
          }
          notificationToken = self->_notificationToken;
        }
        v25 = fmaxf(a3, 0.0);
        v26 = (float)(v25 * 100.0) / 5.0;
        v27 = v25 < 1.0;
        v28 = 20.0;
        if (v27)
          v28 = v26;
        notify_set_state(notificationToken, (unint64_t)(float)((float)((float)(roundf(v28) * 5.0) / 100.0) * 1000000.0));
        if ((a5 & 4) != 0)
        {
          v29 = (unint64_t)(float)(a3 * 1000000.0);
          if (self->_previousDarwinNotificationBrightnessLevel != v29
            && (-[BSCompoundAssertion isActive](self->_suppressClientNotificationsAssertion, "isActive") & 1) == 0)
          {
            notify_post("UIBacklightLevelChangedNotification");
            self->_previousDarwinNotificationBrightnessLevel = v29;
          }
        }
        goto LABEL_30;
      }
LABEL_10:
      objc_msgSend(v16, "addObject:", CFSTR("setInitialLevel"));
      goto LABEL_11;
    }
LABEL_34:
    objc_msgSend(v16, "addObject:", CFSTR("notifyBrightnessSystem"));
    if ((a5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_31:

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAutoBrightnessAvailable
{
  os_unfair_lock_s *p_lock;
  id v4;
  unsigned __int8 v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BrightnessSystem copyPropertyForKey:](self->_brightnessSystem, "copyPropertyForKey:", CFSTR("CBAutoBrightnessAvailable"));
  v5 = objc_msgSend(v4, "BOOLValue");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isBrightnessLevelControlAvailable
{
  os_unfair_lock_s *p_lock;
  id v4;
  unsigned __int8 v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BrightnessSystem copyPropertyForKey:](self->_brightnessSystem, "copyPropertyForKey:", CFSTR("CBBrightnessControlAvailable"));
  v5 = objc_msgSend(v4, "BOOLValue");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isALSSupported
{
  BKDisplayBrightnessController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = -[BrightnessSystem isAlsSupported](v2->_brightnessSystem, "isAlsSupported");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAutoBrightnessEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  objc_msgSend(v4, "setALSEnabled:", v3);

  sub_10007A154(BKDefaultKeyALSEnabled);
}

- (void)setDisplayBrightnessCurve:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100089A64((uint64_t)self, v3, 1);
  os_unfair_lock_unlock(p_lock);
}

- (int)displayBrightnessCurve
{
  BKDisplayBrightnessController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LODWORD(v2) = v2->_brightnessLevelCurve;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (id)propertyForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = -[BrightnessSystem copyPropertyForKey:](self->_brightnessSystem, "copyPropertyForKey:", v5);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  sub_10000A674((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)setBacklightLocked:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v4 = a3;
  v6 = a4;
  v20[0] = CFSTR("FreezeBrightnessEnable");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v21[0] = v7;
  v20[1] = CFSTR("FreezeBrightnessRequestors");
  v19 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v20[2] = CFSTR("FreezeBrightnessPeriod");
  v21[1] = v8;
  v21[2] = &off_1000F75B8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));

  v12 = BKLogBacklight(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    if (v4)
      v14 = CFSTR("YES");
    v15 = 138412546;
    v16 = v14;
    v17 = 2114;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Locking backlight to current value: %@ for reason: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  -[BKDisplayBrightnessController setProperty:forKey:](self, "setProperty:forKey:", v9, CFSTR("FreezeBrightness"));
}

- (void)setBacklightFeatures:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  BSMutableIntegerMap *backlightClientPerPID;
  BSMutableIntegerMap *v8;
  BSMutableIntegerMap *v9;
  BKBacklightClient *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  backlightClientPerPID = self->_backlightClientPerPID;
  if (!backlightClientPerPID)
  {
    v8 = objc_opt_new(BSMutableIntegerMap);
    v9 = self->_backlightClientPerPID;
    self->_backlightClientPerPID = v8;

    backlightClientPerPID = self->_backlightClientPerPID;
  }
  v10 = (BKBacklightClient *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](backlightClientPerPID, "objectForKey:", (int)v4));
  if (v10
    || (v10 = -[BKBacklightClient initWithPid:sendRight:queue:]([BKBacklightClient alloc], "initWithPid:sendRight:queue:", v4, 0, &_dispatch_main_q), -[BKBacklightClient setDelegate:](v10, "setDelegate:", self), -[BSMutableIntegerMap setObject:forKey:](self->_backlightClientPerPID, "setObject:forKey:", v10, (int)v4), v10))
  {
    objc_storeStrong((id *)&v10->_backlightFeatures, a3);
  }
  sub_10008969C((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)clientDied:(id)a3
{
  id v4;
  signed int v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "pid");
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[BSMutableIntegerMap removeObjectForKey:](self->_backlightClientPerPID, "removeObjectForKey:", v5);
  objc_msgSend(v4, "invalidate");

  sub_10008969C((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  -[BKDisplayBrightnessController setBacklightLocked:forReason:](self, "setBacklightLocked:forReason:", 0, CFSTR("BKSystemApplicationBacklightLockReason"));
}

- (void)orientationManager:(id)a3 userInterfaceOrientationMayHaveChanged:(int64_t)a4 isDeviceOrientationLocked:(BOOL)a5
{
  NSNumber *v6;
  id v7;

  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_10008AEC0((uint64_t)a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[BKDisplayBrightnessController setProperty:forKey:](self, "setProperty:forKey:", v7, CFSTR("CBUIOrientation"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressClientNotificationsAssertion, 0);
  objc_storeStrong((id *)&self->_brightnessSystem, 0);
  objc_storeStrong((id *)&self->_backlightClientPerPID, 0);
  objc_storeStrong((id *)&self->_orientationManagerObserving, 0);
  objc_destroyWeak((id *)&self->_orientationManager);
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_previousBrightnessLevelValue, 0);
  objc_storeStrong((id *)&self->_previousBrightnessLevelKey, 0);
}

@end
