@implementation MODarwinNotifier

- (void)handleBatteryNotification:(unsigned int)a3
{
  void *CFProperty;
  void *v5;
  BOOL v6;
  id os_log;
  NSObject *v8;
  float v9;
  unsigned int v10;
  int v11;
  int v12;
  float v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  BOOL *p_isIHAEnabled;
  int v29;
  BOOL v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[6];
  _QWORD v44[6];

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("CurrentCapacity"), kCFAllocatorDefault, 0);
  v5 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("MaxCapacity"), kCFAllocatorDefault, 0);
  if (CFProperty)
    v6 = v5 == 0;
  else
    v6 = 1;
  v40 = CFProperty;
  v41 = v5;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MODarwinNotifier handleBatteryNotification:].cold.3();

    v9 = -1.0;
  }
  else
  {
    v10 = objc_msgSend(v5, "intValue", CFProperty, v5);
    v11 = objc_msgSend(CFProperty, "intValue");
    if (v10)
      v12 = v10;
    else
      v12 = 100;
    v13 = (float)v11 * 100.0 / (float)v12;
    v9 = fmaxf(fminf(v13, 100.0), 0.0);
  }
  v14 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("ExternalConnected"), kCFAllocatorDefault, 0);
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "BOOLValue");
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MODarwinNotifier handleBatteryNotification:].cold.2();

    v16 = 0;
  }
  v19 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("AdapterDetails"), kCFAllocatorDefault, 0);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Description")));
  v21 = v20;
  v22 = CFSTR("Unknown");
  if (v20)
  {
    if ((-[__CFString hasPrefix:](v20, "hasPrefix:", CFSTR("batt")) & 1) != 0)
    {
      v22 = CFSTR("None");
    }
    else if ((-[__CFString hasPrefix:](v21, "hasPrefix:", CFSTR("usb")) & 1) != 0)
    {
      v22 = CFSTR("USB");
    }
    else if ((-[__CFString hasPrefix:](v21, "hasPrefix:", CFSTR("external")) & 1) != 0)
    {
      v22 = CFSTR("External");
    }
    else if (-[__CFString hasSuffix:](v21, "hasSuffix:", CFSTR("arcas")))
    {
      v22 = CFSTR("Arcas");
    }
  }
  else
  {
    v21 = CFSTR("Unknown");
  }
  v23 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("FullyCharged"), kCFAllocatorDefault, 0);
  v24 = v23;
  if (v23)
  {
    v25 = objc_msgSend(v23, "BOOLValue");
  }
  else
  {
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MODarwinNotifier handleBatteryNotification:].cold.1();

    v25 = 0;
  }
  p_isIHAEnabled = &self->managedConfigurationState.isIHAEnabled;
  v29 = *((unsigned __int8 *)&self->lockedState + 4);
  v30 = v9 == *(float *)&self->managedConfigurationState.isIHAEnabled && v16 == v29;
  if (!v30
    || (LOBYTE(v29) = v16, v25 != *((unsigned __int8 *)&self->lockedState + 5))
    || (LOBYTE(v29) = v16, v22 != *(const __CFString **)((char *)&self->batteryState.batteryLevel + 1))
    || (LOBYTE(v29) = v16, v21 != *(__CFString **)((char *)&self->batteryState.chargerType + 1)))
  {
    *(float *)p_isIHAEnabled = v9;
    *((_BYTE *)&self->lockedState + 3) = v29;
    *((_BYTE *)&self->lockedState + 4) = v16;
    *((_BYTE *)&self->lockedState + 5) = v25;
    v31 = *(void **)((char *)&self->batteryState.batteryLevel + 1);
    *(_QWORD *)((char *)&self->batteryState.batteryLevel + 1) = v22;

    objc_storeStrong((id *)((char *)&self->batteryState.chargerType + 1), v21);
    v43[0] = CFSTR("batteryLevel");
    LODWORD(v32) = *(_DWORD *)p_isIHAEnabled;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32));
    v44[0] = v33;
    v43[1] = CFSTR("batteryWasConnected");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)&self->lockedState + 3)));
    v44[1] = v34;
    v43[2] = CFSTR("stateOnCharger");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)&self->lockedState + 4)));
    v44[2] = v35;
    v43[3] = CFSTR("batteryCharged");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)&self->lockedState + 5)));
    v37 = *(_QWORD *)((char *)&self->batteryState.batteryLevel + 1);
    v38 = *(uint64_t *)((char *)&self->batteryState.chargerType + 1);
    v44[3] = v36;
    v44[4] = v37;
    v43[4] = CFSTR("chargerType");
    v43[5] = CFSTR("adapterDescription");
    v44[5] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 6));

    -[MONotifier notifyAndPersist:withPayload:](self, "notifyAndPersist:withPayload:", 4, v39);
  }

}

- (void)onBatteryStatusChanged:(unsigned int)a3 andMessageType:(unsigned int)a4 andMessageArgument:(void *)a5
{
  if (a4 == -536723200)
    -[MODarwinNotifier handleBatteryNotification:](self, "handleBatteryNotification:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

- (MODarwinNotifier)initWithUniverse:(id)a3
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  MODarwinNotifier *v7;

  v4 = (objc_class *)objc_opt_class(MODarwinNotifier, a2);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[MODarwinNotifier initWithName:](self, "initWithName:", v6);

  return v7;
}

- (MODarwinNotifier)initWithName:(id)a3
{
  char *v3;
  char *v4;
  void *v5;
  void *v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MODarwinNotifier;
  v3 = -[MONotifier initWithName:](&v9, "initWithName:", a3);
  v4 = v3;
  if (v3)
  {
    *(_WORD *)(v3 + 33) = 0;
    *(_WORD *)(v3 + 35) = 0;
    *(_DWORD *)(v3 + 41) = -1082130432;
    *(_WORD *)(v3 + 45) = 0;
    v3[47] = 0;
    v5 = *(void **)(v3 + 49);
    *(_QWORD *)(v3 + 49) = &stru_1002B68D0;

    v6 = *(void **)(v4 + 57);
    *(_QWORD *)(v4 + 57) = &stru_1002B68D0;

    *(_DWORD *)(v4 + 65) = -1;
    *(_DWORD *)(v4 + 69) = -1;
    *(_DWORD *)(v4 + 73) = -1;
    *(_DWORD *)(v4 + 77) = 0;
    *(_QWORD *)(v4 + 81) = 0;
    v7 = v4;
  }

  return (MODarwinNotifier *)v4;
}

- (void)onEnable
{
  -[MODarwinNotifier toggle:](self, "toggle:", 1);
}

- (void)onDisable
{
  -[MODarwinNotifier toggle:](self, "toggle:", 0);
}

- (void)toggle:(BOOL)a3
{
  int *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v10;
  IONotificationPortRef v11;
  IONotificationPort *v12;
  NSObject *v13;
  IONotificationPort *v14;
  const __CFDictionary *v15;
  id os_log;
  NSObject *v17;
  NSObject *v18;
  int v19;
  __CFNotificationCenter *v20;
  __CFNotificationCenter *v21;
  io_object_t v22;
  IONotificationPort *v23;
  id v24;
  NSObject *v25;
  uint8_t v26[12];
  io_iterator_t notification;
  _QWORD v28[5];
  _QWORD handler[5];

  v4 = (int *)((char *)&self->batteryState.adapterDescription + 5);
  v5 = *(_DWORD *)((char *)&self->batteryState.adapterDescription + 5);
  if (a3)
  {
    if (v5 < 0 && &MCEffectiveSettingsChangedNotification)
    {
      v6 = (const char *)objc_msgSend(MCEffectiveSettingsChangedNotification, "UTF8String");
      v7 = objc_claimAutoreleasedReturnValue(-[MONotifier queue](self, "queue"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = __27__MODarwinNotifier_toggle___block_invoke;
      handler[3] = &unk_1002AF818;
      handler[4] = self;
      notify_register_dispatch(v6, v4, v7, handler);

    }
    if (*(int *)((_BYTE *)&self->_registerForLockedState + 1) < 0)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[MONotifier queue](self, "queue"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = __27__MODarwinNotifier_toggle___block_invoke_2;
      v28[3] = &unk_1002AF818;
      v28[4] = self;
      notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", (int *)((char *)&self->_registerForLockedState + 1), v8, v28);

    }
    if ((*(_DWORD *)((_BYTE *)&self->batteryState.adapterDescription + 1) & 0x80000000) != 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)checkLockedState_bounce, kMobileKeyBagLockStatusNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v10 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)checkLockedState_bounce, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      *(_DWORD *)((char *)&self->batteryState.adapterDescription + 1) = 1;
    }
    if (!*(int *)((char *)&self->_managedConfigurationToken + 1))
    {
      notification = 0;
      v11 = IONotificationPortCreate(kIOMainPortDefault);
      *(_QWORD *)((char *)&self->_sysDiagnoseToken + 1) = v11;
      if (v11)
      {
        v12 = v11;
        v13 = objc_claimAutoreleasedReturnValue(-[MONotifier queue](self, "queue"));
        IONotificationPortSetDispatchQueue(v12, v13);

        v14 = *(IONotificationPort **)((char *)&self->_sysDiagnoseToken + 1);
        v15 = IOServiceMatching("IOPMPowerSource");
        LODWORD(v13) = IOServiceAddMatchingNotification(v14, "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)onMatchedBatteries_bounce, self, &notification);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
        v17 = objc_claimAutoreleasedReturnValue(os_log);
        v18 = v17;
        if ((_DWORD)v13)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[MODarwinNotifier toggle:].cold.2();

        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Registered for battery status changes: added matching notification", v26, 2u);
          }

          -[MODarwinNotifier onMatchedBatteries:](self, "onMatchedBatteries:", notification);
        }
        IOObjectRelease(notification);
      }
      else
      {
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[MODarwinNotifier toggle:].cold.1();

      }
    }
    -[MODarwinNotifier checkManagedConfiguration](self, "checkManagedConfiguration");
    -[MODarwinNotifier checkLockedState](self, "checkLockedState");
  }
  else
  {
    if ((v5 & 0x80000000) == 0)
    {
      notify_cancel(v5);
      *v4 = -1;
    }
    v19 = *(int *)((char *)&self->_registerForLockedState + 1);
    if ((v19 & 0x80000000) == 0)
    {
      notify_cancel(v19);
      *(int *)((char *)&self->_registerForLockedState + 1) = -1;
    }
    if ((*(_DWORD *)((_BYTE *)&self->batteryState.adapterDescription + 1) & 0x80000000) == 0)
    {
      v20 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v20, self, kMobileKeyBagLockStatusNotification, 0);
      v21 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v21, self, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0);
      *(_DWORD *)((char *)&self->batteryState.adapterDescription + 1) = -1;
    }
    v22 = *(int *)((char *)&self->_managedConfigurationToken + 1);
    if (v22)
    {
      IOObjectRelease(v22);
      *(int *)((char *)&self->_managedConfigurationToken + 1) = 0;
    }
    v23 = *(IONotificationPort **)((char *)&self->_sysDiagnoseToken + 1);
    if (v23)
    {
      IONotificationPortDestroy(v23);
      *(_QWORD *)((char *)&self->_sysDiagnoseToken + 1) = 0;
    }
  }
}

id __27__MODarwinNotifier_toggle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkManagedConfiguration");
}

id __27__MODarwinNotifier_toggle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notify:withPayload:", 0, 0);
}

- (void)onMatchedBatteries:(unsigned int)a3
{
  uint64_t v5;
  uint64_t v6;
  kern_return_t v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13;
  _BYTE v14[15];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;

  v5 = IOIteratorNext(a3);
  if ((_DWORD)v5)
  {
    v6 = v5;
    do
    {
      v7 = IOServiceAddInterestNotification(*(IONotificationPortRef *)((char *)&self->_sysDiagnoseToken + 1), v6, "IOGeneralInterest", (IOServiceInterestCallback)onBatteryStatusChanged_bounce, self, (io_object_t *)((char *)&self->_managedConfigurationToken + 1));
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[MODarwinNotifier onMatchedBatteries:].cold.1(&v13, v14, v10);

      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)&self->_managedConfigurationToken + 1)));
          v12 = *(_QWORD *)((char *)&self->_sysDiagnoseToken + 1);
          *(_DWORD *)buf = 138412546;
          v16 = v11;
          v17 = 2048;
          v18 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Added interest notification for battery %@ with port %p", buf, 0x16u);

        }
        -[MODarwinNotifier handleBatteryNotification:](self, "handleBatteryNotification:", v6);
      }
      IOObjectRelease(v6);
      v6 = IOIteratorNext(a3);
    }
    while ((_DWORD)v6);
  }
}

- (void)checkManagedConfiguration
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_msgSend(v3, "isDiagnosticSubmissionAllowed");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = objc_msgSend(v5, "isHealthDataSubmissionAllowed");

  if (__PAIR64__(*((unsigned __int8 *)&self->super._enabled + 2), *((unsigned __int8 *)&self->super._enabled + 1)) != __PAIR64__(v6, v4))
  {
    *(&self->super._enabled + 1) = (char)v4;
    *(&self->super._enabled + 2) = (char)v6;
    v10[0] = CFSTR("optInDNU");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v11[0] = v7;
    v10[1] = CFSTR("optInIHA");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    -[MONotifier notifyAndPersist:withPayload:](self, "notifyAndPersist:withPayload:", 1, v9);

  }
}

- (void)checkLockedState
{
  BOOL *v3;
  unsigned int v4;
  _BOOL8 v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v3 = &self->super._enabled + 3;
  v4 = *((unsigned __int8 *)&self->super._enabled + 4);
  if (MKBDeviceFormattedForContentProtection())
  {
    v5 = MKBDeviceUnlockedSinceBoot() == 1;
    v6 = MKBGetDeviceLockState(0);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = 0;
    }
    else
    {
      v7 = 1u >> (8 * v6);
      if (v6 > 2)
        v7 = v4;
    }
    v8 = v7 != 0;
  }
  else
  {
    v5 = 1;
    v8 = 1;
  }
  if (*v3 != v5)
  {
    *v3 = v5;
    v15 = CFSTR("wasUnlocked");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v16 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    -[MONotifier notifyAndPersist:withPayload:](self, "notifyAndPersist:withPayload:", 3, v10);

  }
  if (v3[1] != v8)
  {
    v3[1] = v8;
    v13 = CFSTR("stateUnlocked");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
    v14 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    -[MONotifier notifyAndPersist:withPayload:](self, "notifyAndPersist:withPayload:", 2, v12);

  }
}

- (void).cxx_destruct
{
  BOOL *p_isIHAEnabled;

  p_isIHAEnabled = &self->managedConfigurationState.isIHAEnabled;

}

- (void)toggle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't create notification port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)toggle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't add matching notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)onMatchedBatteries:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to add interest notification for battery", buf, 2u);
}

- (void)handleBatteryNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Cannot find charged status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)handleBatteryNotification:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Cannot find connected status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)handleBatteryNotification:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Cannot find current or maximum capacity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
